#建構初始人員資料陣列
players = [
{name: "櫻木花道", pts:  0, reb: 14, ast: 0, stl: 0, blk: 2},
{name: "流川楓　", pts: 30, reb:  6, ast: 3, stl: 3, blk: 0},
{name: "赤木剛憲", pts: 16, reb: 10, ast: 0, stl: 0, blk: 5},
{name: "宮城良田", pts:  6, reb:  0, ast: 7, stl: 6, blk: 0},
{name: "三井壽　", pts: 21, reb:  4, ast: 3, stl: 0, blk: 0}
]

stats = ["pts","reb","ast","stl","blk"]
stats_with_colon = [:pts,:reb,:ast,:stl,:blk]


#比賽開始
puts "比賽開始\n"


#不斷重複詢問記錄
game_continue=true
while game_continue

  #印出球員名稱
  puts "請選擇球員"
  player_num=0
  players.each do |player|
    print "[#{player_num}] "+player[:name]+" "
    player_num+=1
  end

  #補上比賽結束選項
  print "[99] 比賽結束 :"  

  #選擇球員或結束比賽
  player_select_num=gets.to_i
  #判斷是否為99
  if player_select_num==99
    game_continue=false

  elsif player_select_num >= 0 && player_select_num < player_num
    puts "你選擇的球員是 #{players[player_select_num][:name]}"

    #選擇紀錄項目
    print "選擇紀錄項目 "
    stat_num=0
    stats.each do |stat|
      print "[#{stat_num}] "+stat+" "
      stat_num+=1
    end
    stat_select_num=gets.to_i

    #判斷是紀錄分數還是其他項目
    if stat_select_num==0
      print "請輸入得分數 [1] 1分 [2] 2分 [3] 3分　："
      points=gets.to_i
      players[player_select_num][:pts]+=points

      puts "=> #{players[player_select_num][:name]} 得 #{points} 分，目前總得分 #{players[player_select_num][:pts]} 分"

    elsif stat_select_num > 0 && stat_select_num < stat_num
      players[player_select_num][stats_with_colon[stat_select_num]]+=1
      puts "=> #{players[player_select_num][:name]} #{stats[stat_select_num]} 加 1 次，目前共 #{players[player_select_num][stats_with_colon[stat_select_num]]} 次"
    else
      puts "無此紀錄選項！請重新再來！"
    end
  else
      puts "無此名球員！請重新輸入正確選項！"
  end
end

#比賽結束列出記分板
puts "\n\n比賽結束"
print "　　　　｜"
stats.each do |stat|
  print stat +"｜"
end
puts ""
puts "---------------------------------"

players.each do |player|
  print player[:name]+"｜"
  stats_with_colon.each do |stat|
    print printf("%3d",player[stat]).to_s+"｜"
  end
  puts ""
end

