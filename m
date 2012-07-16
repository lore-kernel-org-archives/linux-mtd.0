Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqpxE-0007xB-K7
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 18:24:39 +0000
Received: by wgbez12 with SMTP id ez12so3494016wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 11:22:21 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 16 Jul 2012 13:22:20 -0500
Message-ID: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
Subject: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty LEB'
From: Brent Taylor <motobud@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=f46d044401deb4a7bd04c4f6824e
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--f46d044401deb4a7bd04c4f6824e
Content-Type: multipart/alternative; boundary=f46d044401deb4a7b804c4f6824c

--f46d044401deb4a7b804c4f6824c
Content-Type: text/plain; charset=ISO-8859-1

I'm developing on custom hardware using an at91sam9g45 processor with 64 MB
of RAM and 64 MB of NOR flash running Linux 3.0.13.

I'm doing some power-cycle testing and after several hours, UBIFS failed to
mount the root partition and printed the message "grab_empty_leb: could not
find an empty LEB".  The system boots and starts a script that will power
cycle the board anytime between 10 and 20 seconds after the script has
started.  Just before a power cycle occurs, syslog and our main process are
the only processes that could be writing to disk.

I then checked http://git.infradead.org/users/dedekind/ubifs-v3.0.git to
see if there was a patch and couldn't find anything describing my exact
problem.  I generated a patch from commit
02f8c6aee8df3cdc935e9bdd4f2d020306035dbe to
a0c2d5050bd191e53a761381027c8e5ab8e25336 (see attached ubifs.3.0.diff) and
rebuilt the kernel.  If there was a patch for my issue, I was expecting the
root partition to be recovered but it wasn't.  I'm currently running the
same test with the patched kernel.  Below is the information from the
patched kernel.

If there is any more information I need to provide, please let me know.

Any help would be appreciated,
Bud


[linux-16][~> uname -a
Linux linux 3.0.13 #20 Mon Jul 16 11:16:58 CDT 2012 armv5tejl GNU/Linux

[linux-16][~> mtdinfo -a
Count of MTD devices:           5
Present MTD devices:            mtd0, mtd1, mtd2, mtd3, mtd4
Sysfs interface supported:      yes

mtd0
Name:                           boot
Type:                           nor
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             false

mtd1
Name:                           uboot
Type:                           nor
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:2
Bad blocks are allowed:         false
Device is writable:             false

mtd2
Name:                           env
Type:                           nor
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:4
Bad blocks are allowed:         false
Device is writable:             true

mtd3
Name:                           kernel
Type:                           nor
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          16 (2097152 bytes, 2.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:6
Bad blocks are allowed:         false
Device is writable:             false

mtd4
Name:                           root-fs
Type:                           nor
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          493 (64618496 bytes, 61.6 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:8
Bad blocks are allowed:         false
Device is writable:             true



[linux-16][~> ubinfo -a /dev/ubi0
ubi0
Volumes count:                           1
Logical eraseblock size:                 130944 bytes, 127.9 KiB
Total amount of logical eraseblocks:     493 (64555392 bytes, 61.6 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  0
Current maximum erase counter value:     154
Minimum input/output unit size:          1 byte
Character device major/minor:            253:0
Present volumes:                         0

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        489 LEBs (64031616 bytes, 61.1 MiB)
State:       OK
Name:        ubirootfs
Character device major/minor: 253:1



[linux-16][~> mount -t ubifs ubi0:ubirootfs /opt/root/
UBIFS: recovery needed
UBIFS error (pid 958): grab_empty_leb: could not find an empty LEB
(pid 958) start dumping LEB properties
(pid 958) Lprops statistics: empty_lebs 2, idx_lebs  28
        taken_empty_lebs 2, total_free 1193080, total_dirty 19318832
        total_used 41441632, total_dark 1291912, total_dead 56
LEB 10      free 24       dirty 4064     used 126856   free + dirty
4088     dark 4088 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 11      free 8        dirty 640      used 130296   free + dirty
648      dark 648  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 12      free 40       dirty 960      used 129944   free + dirty
1000     dark 1000 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 13      free 0        dirty 1600     used 129344   free + dirty
1600     dark 1600 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 14      free 104      dirty 1272     used 129568   free + dirty
1376     dark 1376 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 15      free 104      dirty 1920     used 128920   free + dirty
2024     dark 2024 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 16      free 152      dirty 1120     used 129672   free + dirty
1272     dark 1272 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 17      free 112      dirty 1120     used 129712   free + dirty
1232     dark 1232 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 18      free 48       dirty 1120     used 129776   free + dirty
1168     dark 1168 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 19      free 104      dirty 1120     used 129720   free + dirty
1224     dark 1224 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 20      free 56       dirty 1280     used 129608   free + dirty
1336     dark 1336 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 21      free 56       dirty 1120     used 129768   free + dirty
1176     dark 1176 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 22      free 128      dirty 640      used 130176   free + dirty
768      dark 768  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 23      free 120      dirty 480      used 130344   free + dirty
600      dark 600  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 24      free 64       dirty 1600     used 129280   free + dirty
1664     dark 1664 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 25      free 24       dirty 1440     used 129480   free + dirty
1464     dark 1464 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 26      free 8        dirty 640      used 130296   free + dirty
648      dark 648  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 27      free 40       dirty 1760     used 129144   free + dirty
1800     dark 1800 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 28      free 64       dirty 1120     used 129760   free + dirty
1184     dark 1184 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 29      free 32       dirty 160      used 130752   free + dirty
192      dark 192  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 30      free 72       dirty 1328     used 129544   free + dirty
1400     dark 1400 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 31      free 48       dirty 2272     used 128624   free + dirty
2320     dark 2320 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 32      free 56       dirty 1280     used 129608   free + dirty
1336     dark 1336 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 33      free 48       dirty 800      used 130096   free + dirty
848      dark 848  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 34      free 128      dirty 1440     used 129376   free + dirty
1568     dark 1568 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 35      free 64       dirty 960      used 129920   free + dirty
1024     dark 1024 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 36      free 104      dirty 160      used 130680   free + dirty
264      dark 264  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 37      free 40       dirty 640      used 130264   free + dirty
680      dark 680  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 38      free 72       dirty 2112     used 128760   free + dirty
2184     dark 2184 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 39      free 104      dirty 25328    used 105512   free + dirty
25432    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)
LEB 40      free 72       dirty 96464    used 34408    free + dirty
96536    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 41      free 104      dirty 104832   used 26008    free + dirty
104936   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)
LEB 42      free 72       dirty 111616   used 19256    free + dirty
111688   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 43      free 88       dirty 83008    used 47848    free + dirty
83096    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 44      free 48       dirty 53944    used 76952    free + dirty
53992    dark 4256 dead 0    nodes fit 12  flags 0x1  (dirty)
LEB 45      free 128      dirty 88752    used 42064    free + dirty
88880    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 46      free 136      dirty 111976   used 18832    free + dirty
112112   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 47      free 16       dirty 89176    used 41752    free + dirty
89192    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 48      free 24       dirty 96616    used 34304    free + dirty
96640    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 49      free 48       dirty 88320    used 42576    free + dirty
88368    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 50      free 88       dirty 1120     used 129736   free + dirty
1208     dark 1208 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 51      free 152      dirty 84456    used 46336    free + dirty
84608    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 52      free 24       dirty 1736     used 129184   free + dirty
1760     dark 1760 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 53      free 32       dirty 107272   used 23640    free + dirty
107304   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 54      free 72       dirty 8696     used 122176   free + dirty
8768     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 55      free 144      dirty 92152    used 38648    free + dirty
92296    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 56      free 120      dirty 86160    used 44664    free + dirty
86280    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 57      free 56       dirty 97728    used 33160    free + dirty
97784    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 58      free 16       dirty 50696    used 80232    free + dirty
50712    dark 4256 dead 0    nodes fit 11  flags 0x1  (dirty)
LEB 59      free 0        dirty 97448    used 33496    free + dirty
97448    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 60      free 80       dirty 83216    used 47648    free + dirty
83296    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 61      free 64       dirty 43384    used 87496    free + dirty
43448    dark 4256 dead 0    nodes fit 10  flags 0x1  (dirty)
LEB 62      free 40       dirty 2568     used 128336   free + dirty
2608     dark 2608 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 63      free 64       dirty 3632     used 127248   free + dirty
3696     dark 3696 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 64      free 0        dirty 9528     used 121416   free + dirty
9528     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 65      free 152      dirty 696      used 130096   free + dirty
848      dark 848  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 66      free 48       dirty 57392    used 73504    free + dirty
57440    dark 4256 dead 0    nodes fit 13  flags 0x1  (dirty)
LEB 67      free 64       dirty 90192    used 40688    free + dirty
90256    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 68      free 72       dirty 111312   used 19560    free + dirty
111384   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 69      free 0        dirty 85128    used 45816    free + dirty
85128    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 70      free 96       dirty 97600    used 33248    free + dirty
97696    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 71      free 16       dirty 91408    used 39520    free + dirty
91424    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 72      free 48       dirty 103064   used 27832    free + dirty
103112   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)
LEB 73      free 112      dirty 98704    used 32128    free + dirty
98816    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 74      free 8        dirty 1712     used 129224   free + dirty
1720     dark 1720 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 75      free 144      dirty 1656     used 129144   free + dirty
1800     dark 1800 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 76      free 80       dirty 76656    used 54208    free + dirty
76736    dark 4256 dead 0    nodes fit 18  flags 0x1  (dirty)
LEB 77      free 128      dirty 61016    used 69800    free + dirty
61144    dark 4256 dead 0    nodes fit 14  flags 0x1  (dirty)
LEB 78      free 40       dirty 48576    used 82328    free + dirty
48616    dark 4256 dead 0    nodes fit 11  flags 0x1  (dirty)
LEB 79      free 88       dirty 9592     used 121264   free + dirty
9680     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 80      free 40       dirty 54184    used 76720    free + dirty
54224    dark 4256 dead 0    nodes fit 12  flags 0x1  (dirty)
LEB 81      free 32       dirty 8592     used 122320   free + dirty
8624     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 82      free 8        dirty 1112     used 129824   free + dirty
1120     dark 1120 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 83      free 24       dirty 104352   used 26568    free + dirty
104376   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)
LEB 84      free 56       dirty 9680     used 121208   free + dirty
9736     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 85      free 32       dirty 1112     used 129800   free + dirty
1144     dark 1144 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 86      free 72       dirty 88976    used 41896    free + dirty
89048    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 87      free 0        dirty 90504    used 40440    free + dirty
90504    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 88      free 128      dirty 82728    used 48088    free + dirty
82856    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 89      free 64       dirty 104640   used 26240    free + dirty
104704   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)
LEB 90      free 88       dirty 68744    used 62112    free + dirty
68832    dark 4256 dead 0    nodes fit 16  flags 0x1  (dirty)
LEB 91      free 152      dirty 1528     used 129264   free + dirty
1680     dark 1680 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 92      free 448      dirty 124120   used 6376     free + dirty
124568   dark 4256 dead 0    nodes fit 29  flags 0x10 (taken, bud of jhead
2 (data))
LEB 93      free 72       dirty 480      used 130392   free + dirty
552      dark 552  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 94      free 64       dirty 108216   used 22664    free + dirty
108280   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 95      free 72       dirty 105400   used 25472    free + dirty
105472   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)
LEB 96      free 72       dirty 112456   used 18416    free + dirty
112528   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 97      free 16       dirty 99960    used 30968    free + dirty
99976    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 98      free 24       dirty 58792    used 72128    free + dirty
58816    dark 4256 dead 0    nodes fit 13  flags 0x1  (dirty)
LEB 99      free 0        dirty 92688    used 38256    free + dirty
92688    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 100     free 88728    dirty 20312    used 21904    free + dirty
109040   flags 0x22 (dirty index)
LEB 101     free 7152     dirty 107016   used 16776    free + dirty
114168   flags 0x22 (dirty index)
LEB 102     free 40       dirty 100824   used 30080    free + dirty
100864   dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 103     free 128      dirty 98464    used 32352    free + dirty
98592    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 104     free 72       dirty 112808   used 18064    free + dirty
112880   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 105     free 0        dirty 85704    used 45240    free + dirty
85704    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 106     free 48       dirty 1488     used 129408   free + dirty
1536     dark 1536 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 107     free 88       dirty 320      used 130536   free + dirty
408      dark 408  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 108     free 48       dirty 960      used 129936   free + dirty
1008     dark 1008 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 109     free 8880     dirty 106784   used 15280    free + dirty
115664   flags 0x22 (dirty index)
LEB 110     free 128      dirty 94504    used 36312    free + dirty
94632    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 111     free 64       dirty 9728     used 121152   free + dirty
9792     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 112     free 40       dirty 1672     used 129232   free + dirty
1712     dark 1712 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 113     free 88       dirty 2400     used 128456   free + dirty
2488     dark 2488 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 114     free 152      dirty 15152    used 115640   free + dirty
15304    dark 4256 dead 0    nodes fit 3   flags 0x1  (dirty)
LEB 115     free 40       dirty 64424    used 66480    free + dirty
64464    dark 4256 dead 0    nodes fit 15  flags 0x1  (dirty)
LEB 116     free 32       dirty 1904     used 129008   free + dirty
1936     dark 1936 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 117     free 80       dirty 2184     used 128680   free + dirty
2264     dark 2264 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 118     free 144      dirty 82784    used 48016    free + dirty
82928    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 119     free 80       dirty 101648   used 29216    free + dirty
101728   dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 120     free 136      dirty 99720    used 31088    free + dirty
99856    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 121     free 72       dirty 94688    used 36184    free + dirty
94760    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 122     free 104      dirty 1920     used 128920   free + dirty
2024     dark 2024 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 123     free 144      dirty 1440     used 129360   free + dirty
1584     dark 1584 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 124     free 96       dirty 81088    used 49760    free + dirty
81184    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 125     free 16       dirty 78320    used 52608    free + dirty
78336    flags 0x22 (dirty index)
LEB 126     free 120      dirty 89976    used 40848    free + dirty
90096    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 127     free 8        dirty 72       used 130864   free + dirty
80       dark 80   dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 128     free 8        dirty 1120     used 129816   free + dirty
1128     dark 1128 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 129     free 88       dirty 2560     used 128296   free + dirty
2648     dark 2648 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 130     free 144      dirty 1120     used 129680   free + dirty
1264     dark 1264 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 131     free 104      dirty 1600     used 129240   free + dirty
1704     dark 1704 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 132     free 40       dirty 1120     used 129784   free + dirty
1160     dark 1160 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 133     free 32       dirty 1192     used 129720   free + dirty
1224     dark 1224 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 134     free 88       dirty 2216     used 128640   free + dirty
2304     dark 2304 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 135     free 120      dirty 1760     used 129064   free + dirty
1880     dark 1880 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 136     free 88       dirty 160      used 130696   free + dirty
248      dark 248  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 137     free 8        dirty 160      used 130776   free + dirty
168      dark 168  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 138     free 144      dirty 800      used 130000   free + dirty
944      dark 944  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 139     free 56       dirty 2080     used 128808   free + dirty
2136     dark 2136 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 140     free 40       dirty 2392     used 128512   free + dirty
2432     dark 2432 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 141     free 40       dirty 800      used 130104   free + dirty
840      dark 840  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 142     free 24       dirty 320      used 130600   free + dirty
344      dark 344  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 143     free 48       dirty 1600     used 129296   free + dirty
1648     dark 1648 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 144     free 32       dirty 2400     used 128512   free + dirty
2432     dark 2432 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 145     free 104      dirty 1440     used 129400   free + dirty
1544     dark 1544 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 146     free 96       dirty 640      used 130208   free + dirty
736      dark 736  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 147     free 104      dirty 1120     used 129720   free + dirty
1224     dark 1224 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 148     free 48       dirty 0        used 130896   free + dirty
48       dark 0    dead 48   nodes fit 0   flags 0x3  (free)
LEB 149     free 24       dirty 320      used 130600   free + dirty
344      dark 344  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 150     free 128      dirty 2360     used 128456   free + dirty
2488     dark 2488 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 151     free 72       dirty 1896     used 128976   free + dirty
1968     dark 1968 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 152     free 40       dirty 320      used 130584   free + dirty
360      dark 360  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 153     free 48       dirty 480      used 130416   free + dirty
528      dark 528  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 154     free 112      dirty 160      used 130672   free + dirty
272      dark 272  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 155     free 8        dirty 2584     used 128352   free + dirty
2592     dark 2592 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 156     free 88       dirty 1280     used 129576   free + dirty
1368     dark 1368 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 157     free 0        dirty 1344     used 129600   free + dirty
1344     dark 1344 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 158     free 72       dirty 2624     used 128248   free + dirty
2696     dark 2696 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 159     free 104      dirty 1600     used 129240   free + dirty
1704     dark 1704 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 160     free 24       dirty 1120     used 129800   free + dirty
1144     dark 1144 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 161     free 96       dirty 1760     used 129088   free + dirty
1856     dark 1856 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 162     free 48       dirty 480      used 130416   free + dirty
528      dark 528  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 163     free 88       dirty 464      used 130392   free + dirty
552      dark 552  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 164     free 48       dirty 3696     used 127200   free + dirty
3744     dark 3744 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 165     free 48       dirty 13688    used 117208   free + dirty
13736    dark 4256 dead 0    nodes fit 3   flags 0x1  (dirty)
LEB 166     free 72       dirty 21328    used 109544   free + dirty
21400    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)
LEB 167     free 128      dirty 28752    used 102064   free + dirty
28880    dark 4256 dead 0    nodes fit 6   flags 0x1  (dirty)
LEB 168     free 144      dirty 97760    used 33040    free + dirty
97904    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 169     free 192      dirty 71616    used 59136    free + dirty
71808    flags 0x22 (dirty index)
LEB 170     free 1352     dirty 60440    used 69152    free + dirty
61792    flags 0x22 (dirty index)
LEB 171     free 144      dirty 1656     used 129144   free + dirty
1800     dark 1800 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 172     free 104      dirty 23568    used 107272   free + dirty
23672    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)
LEB 173     free 112      dirty 20336    used 110496   free + dirty
20448    dark 4256 dead 0    nodes fit 4   flags 0x1  (dirty)
LEB 174     free 72       dirty 27808    used 103064   free + dirty
27880    dark 4256 dead 0    nodes fit 6   flags 0x1  (dirty)
LEB 175     free 120      dirty 30488    used 100336   free + dirty
30608    dark 4256 dead 0    nodes fit 7   flags 0x1  (dirty)
LEB 176     free 64       dirty 160      used 130720   free + dirty
224      dark 224  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 177     free 120      dirty 23416    used 107408   free + dirty
23536    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)
LEB 178     free 48       dirty 55992    used 74904    free + dirty
56040    dark 4256 dead 0    nodes fit 13  flags 0x1  (dirty)
LEB 179     free 88       dirty 1904     used 128952   free + dirty
1992     dark 1992 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 180     free 96       dirty 9712     used 121136   free + dirty
9808     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 181     free 72       dirty 320      used 130552   free + dirty
392      dark 392  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 182     free 128      dirty 23920    used 106896   free + dirty
24048    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)
LEB 183     free 80       dirty 800      used 130064   free + dirty
880      dark 880  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 184     free 32       dirty 320      used 130592   free + dirty
352      dark 352  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 185     free 8        dirty 2400     used 128536   free + dirty
2408     dark 2408 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 186     free 8        dirty 64       used 130872   free + dirty
72       dark 72   dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 187     free 0        dirty 960      used 129984   free + dirty
960      dark 960  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 188     free 152      dirty 480      used 130312   free + dirty
632      dark 632  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 189     free 48       dirty 640      used 130256   free + dirty
688      dark 688  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 190     free 56       dirty 93312    used 37576    free + dirty
93368    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 191     free 104      dirty 1920     used 128920   free + dirty
2024     dark 2024 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 192     free 0        dirty 160      used 130784   free + dirty
160      dark 160  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 193     free 0        dirty 800      used 130144   free + dirty
800      dark 800  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 194     free 24       dirty 128      used 130792   free + dirty
152      dark 152  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 195     free 40       dirty 15816    used 115088   free + dirty
15856    dark 4256 dead 0    nodes fit 3   flags 0x1  (dirty)
LEB 196     free 32       dirty 39160    used 91752    free + dirty
39192    dark 4256 dead 0    nodes fit 9   flags 0x1  (dirty)
LEB 197     free 40       dirty 36632    used 94272    free + dirty
36672    dark 4256 dead 0    nodes fit 8   flags 0x1  (dirty)
LEB 198     free 16       dirty 62008    used 68920    free + dirty
62024    dark 4256 dead 0    nodes fit 14  flags 0x1  (dirty)
LEB 199     free 40       dirty 1600     used 129304   free + dirty
1640     dark 1640 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 200     free 56       dirty 160      used 130728   free + dirty
216      dark 216  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 201     free 8        dirty 108008   used 22928    free + dirty
108016   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 202     free 16       dirty 64       used 130864   free + dirty
80       dark 80   dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 203     free 71648    dirty 31168    used 28128    free + dirty
102816   flags 0x22 (dirty index)
LEB 204     free 24       dirty 66320    used 64600    free + dirty
66344    dark 4256 dead 0    nodes fit 15  flags 0x1  (dirty)
LEB 205     free 8        dirty 1760     used 129176   free + dirty
1768     dark 1768 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 206     free 1048     dirty 125856   used 4040     free + dirty
126904   dark 4256 dead 0    nodes fit 29  flags 0x10 (taken, bud of jhead
2 (data))
LEB 207     free 80       dirty 1480     used 129384   free + dirty
1560     dark 1560 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 208     free 104      dirty 9272     used 121568   free + dirty
9376     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 209     free 56       dirty 76344    used 54544    free + dirty
76400    dark 4256 dead 0    nodes fit 17  flags 0x1  (dirty)
LEB 210     free 40       dirty 85824    used 45080    free + dirty
85864    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 211     free 80       dirty 984      used 129880   free + dirty
1064     dark 1064 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 212     free 16       dirty 49080    used 81848    free + dirty
49096    dark 4256 dead 0    nodes fit 11  flags 0x1  (dirty)
LEB 213     free 48       dirty 93840    used 37056    free + dirty
93888    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 214     free 24       dirty 104256   used 26664    free + dirty
104280   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)
LEB 215     free 112      dirty 111328   used 19504    free + dirty
111440   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 216     free 32       dirty 108456   used 22456    free + dirty
108488   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 217     free 144      dirty 100152   used 30648    free + dirty
100296   dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 218     free 32       dirty 108136   used 22776    free + dirty
108168   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 219     free 264      dirty 56600    used 74080    free + dirty
56864    flags 0x22 (dirty index)
LEB 220     free 40       dirty 89960    used 40944    free + dirty
90000    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 221     free 56       dirty 23272    used 107616   free + dirty
23328    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)
LEB 222     free 144      dirty 480      used 130320   free + dirty
624      dark 624  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 223     free 96       dirty 1120     used 129728   free + dirty
1216     dark 1216 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 224     free 80       dirty 640      used 130224   free + dirty
720      dark 720  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 225     free 96       dirty 2560     used 128288   free + dirty
2656     dark 2656 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 226     free 64       dirty 1120     used 129760   free + dirty
1184     dark 1184 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 227     free 24       dirty 92784    used 38136    free + dirty
92808    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 228     free 0        dirty 18472    used 112472   free + dirty
18472    dark 4256 dead 0    nodes fit 4   flags 0x1  (dirty)
LEB 229     free 0        dirty 1760     used 129184   free + dirty
1760     dark 1760 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 230     free 40       dirty 640      used 130264   free + dirty
680      dark 680  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 231     free 24       dirty 1280     used 129640   free + dirty
1304     dark 1304 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 232     free 40       dirty 640      used 130264   free + dirty
680      dark 680  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 233     free 0        dirty 1280     used 129664   free + dirty
1280     dark 1280 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 234     free 0        dirty 80       used 130864   free + dirty
80       dark 80   dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 235     free 64       dirty 320      used 130560   free + dirty
384      dark 384  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 236     free 56       dirty 320      used 130568   free + dirty
376      dark 376  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 237     free 0        dirty 0        used 130944   free + dirty
0        dark 0    dead 0    nodes fit 0   flags 0x10 (taken, jhead 0(GC))
LEB 238     free 16       dirty 960      used 129968   free + dirty
976      dark 976  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 239     free 48       dirty 100736   used 30160    free + dirty
100784   dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 240     free 88       dirty 110216   used 20640    free + dirty
110304   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 241     free 8        dirty 960      used 129976   free + dirty
968      dark 968  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 242     free 24       dirty 20632    used 110288   free + dirty
20656    dark 4256 dead 0    nodes fit 4   flags 0x1  (dirty)
LEB 243     free 0        dirty 2720     used 128224   free + dirty
2720     dark 2720 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 244     free 144      dirty 640      used 130160   free + dirty
784      dark 784  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 245     free 1400     dirty 110912   used 18632    free + dirty
112312   flags 0x22 (dirty index)
LEB 246     free 0        dirty 640      used 130304   free + dirty
640      dark 640  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 247     free 32       dirty 640      used 130272   free + dirty
672      dark 672  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 248     free 112      dirty 1760     used 129072   free + dirty
1872     dark 1872 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 249     free 96       dirty 3360     used 127488   free + dirty
3456     dark 3456 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 250     free 0        dirty 1280     used 129664   free + dirty
1280     dark 1280 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 251     free 48       dirty 54736    used 76160    free + dirty
54784    dark 4256 dead 0    nodes fit 12  flags 0x1  (dirty)
LEB 252     free 88       dirty 47472    used 83384    free + dirty
47560    dark 4256 dead 0    nodes fit 11  flags 0x1  (dirty)
LEB 253     free 0        dirty 78304    used 52640    free + dirty
78304    dark 4256 dead 0    nodes fit 18  flags 0x1  (dirty)
LEB 254     free 48       dirty 109800   used 21096    free + dirty
109848   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 255     free 120      dirty 19704    used 111120   free + dirty
19824    dark 4256 dead 0    nodes fit 4   flags 0x1  (dirty)
LEB 256     free 136      dirty 98760    used 32048    free + dirty
98896    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 257     free 136      dirty 80736    used 50072    free + dirty
80872    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 258     free 40       dirty 480      used 130424   free + dirty
520      dark 520  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 259     free 48       dirty 109424   used 21472    free + dirty
109472   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 260     free 88       dirty 2080     used 128776   free + dirty
2168     dark 2168 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 261     free 104      dirty 480      used 130360   free + dirty
584      dark 584  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 262     free 240      dirty 125416   used 5288     free + dirty
125656   dark 4256 dead 0    nodes fit 29  flags 0x1  (dirty)
LEB 263     free 16       dirty 640      used 130288   free + dirty
656      dark 656  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 264     free 64       dirty 2240     used 128640   free + dirty
2304     dark 2304 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 265     free 0        dirty 24520    used 106424   free + dirty
24520    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)
LEB 266     free 128      dirty 160      used 130656   free + dirty
288      dark 288  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 267     free 104      dirty 124248   used 6592     free + dirty
124352   dark 4256 dead 0    nodes fit 29  flags 0x1  (dirty)
LEB 268     free 88       dirty 160      used 130696   free + dirty
248      dark 248  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 269     free 72       dirty 160      used 130712   free + dirty
232      dark 232  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 270     free 120      dirty 960      used 129864   free + dirty
1080     dark 1080 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 271     free 88       dirty 103400   used 27456    free + dirty
103488   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)
LEB 272     free 96       dirty 112344   used 18504    free + dirty
112440   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 273     free 88       dirty 2080     used 128776   free + dirty
2168     dark 2168 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 274     free 112      dirty 75144    used 55688    free + dirty
75256    dark 4256 dead 0    nodes fit 17  flags 0x1  (dirty)
LEB 275     free 88       dirty 93264    used 37592    free + dirty
93352    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 276     free 56       dirty 99160    used 31728    free + dirty
99216    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 277     free 64       dirty 57136    used 73744    free + dirty
57200    dark 4256 dead 0    nodes fit 13  flags 0x1  (dirty)
LEB 278     free 80       dirty 8472     used 122392   free + dirty
8552     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 279     free 80       dirty 2080     used 128784   free + dirty
2160     dark 2160 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 280     free 0        dirty 8576     used 122368   free + dirty
8576     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 281     free 128      dirty 81352    used 49464    free + dirty
81480    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 282     free 56       dirty 1920     used 128968   free + dirty
1976     dark 1976 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 283     free 0        dirty 1920     used 129024   free + dirty
1920     dark 1920 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 284     free 16       dirty 2080     used 128848   free + dirty
2096     dark 2096 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 285     free 64       dirty 320      used 130560   free + dirty
384      dark 384  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 286     free 72       dirty 109792   used 21080    free + dirty
109864   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 287     free 0        dirty 98144    used 32800    free + dirty
98144    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 288     free 16576    dirty 89760    used 24608    free + dirty
106336   flags 0x22 (dirty index)
LEB 289     free 144      dirty 11304    used 119496   free + dirty
11448    dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 290     free 104      dirty 58744    used 72096    free + dirty
58848    dark 4256 dead 0    nodes fit 13  flags 0x1  (dirty)
LEB 291     free 144      dirty 64856    used 65944    free + dirty
65000    dark 4256 dead 0    nodes fit 15  flags 0x1  (dirty)
LEB 292     free 88       dirty 320      used 130536   free + dirty
408      dark 408  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 293     free 4952     dirty 124872   used 1120     free + dirty
129824   dark 4256 dead 0    nodes fit 30  flags 0x10 (taken, jhead 1
(base))
LEB 294     free 32       dirty 1440     used 129472   free + dirty
1472     dark 1472 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 295     free 128      dirty 960      used 129856   free + dirty
1088     dark 1088 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 296     free 8        dirty 1920     used 129016   free + dirty
1928     dark 1928 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 297     free 128      dirty 800      used 130016   free + dirty
928      dark 928  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 298     free 136      dirty 1120     used 129688   free + dirty
1256     dark 1256 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 299     free 16       dirty 1440     used 129488   free + dirty
1456     dark 1456 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 300     free 32       dirty 103952   used 26960    free + dirty
103984   flags 0x22 (dirty index)
LEB 301     free 40       dirty 96       used 130808   free + dirty
136      dark 136  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 302     free 80       dirty 800      used 130064   free + dirty
880      dark 880  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 303     free 152      dirty 1120     used 129672   free + dirty
1272     dark 1272 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 304     free 0        dirty 480      used 130464   free + dirty
480      dark 480  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 305     free 96       dirty 2080     used 128768   free + dirty
2176     dark 2176 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 306     free 64       dirty 1440     used 129440   free + dirty
1504     dark 1504 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 307     free 16       dirty 1920     used 129008   free + dirty
1936     dark 1936 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 308     free 16       dirty 1920     used 129008   free + dirty
1936     dark 1936 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 309     free 8        dirty 1440     used 129496   free + dirty
1448     dark 1448 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 310     free 136      dirty 1760     used 129048   free + dirty
1896     dark 1896 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 311     free 24       dirty 7496     used 123424   free + dirty
7520     dark 4256 dead 0    nodes fit 1   flags 0x1  (dirty)
LEB 312     free 680      dirty 125816   used 4448     free + dirty
126496   dark 4256 dead 0    nodes fit 29  flags 0x10 (taken, bud of jhead
2 (data))
LEB 313     free 0        dirty 15928    used 115016   free + dirty
15928    dark 4256 dead 0    nodes fit 3   flags 0x1  (dirty)
LEB 314     free 24       dirty 42344    used 88576    free + dirty
42368    dark 4256 dead 0    nodes fit 9   flags 0x1  (dirty)
LEB 315     free 96       dirty 99848    used 31000    free + dirty
99944    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 316     free 48       dirty 95152    used 35744    free + dirty
95200    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 317     free 8        dirty 0        used 130936   free + dirty
8        dark 0    dead 8    nodes fit 0   flags 0x3  (free)
LEB 318     free 72       dirty 8088     used 122784   free + dirty
8160     dark 4256 dead 0    nodes fit 1   flags 0x1  (dirty)
LEB 319     free 40       dirty 1440     used 129464   free + dirty
1480     dark 1480 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 320     free 120      dirty 960      used 129864   free + dirty
1080     dark 1080 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 321     free 32       dirty 480      used 130432   free + dirty
512      dark 512  dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 322     free 40       dirty 1600     used 129304   free + dirty
1640     dark 1640 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 323     free 56       dirty 108416   used 22472    free + dirty
108472   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 324     free 96       dirty 960      used 129888   free + dirty
1056     dark 1056 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 325     free 0        dirty 2720     used 128224   free + dirty
2720     dark 2720 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 326     free 56       dirty 9344     used 121544   free + dirty
9400     dark 4256 dead 0    nodes fit 2   flags 0x0  (not categorized)
LEB 327     free 8        dirty 1904     used 129032   free + dirty
1912     dark 1912 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 328     free 96       dirty 8376     used 122472   free + dirty
8472     dark 4256 dead 0    nodes fit 1   flags 0x1  (dirty)
LEB 329     free 66160    dirty 41304    used 23480    free + dirty
107464   flags 0x22 (dirty index)
LEB 330     free 0        dirty 109496   used 21448    free + dirty
109496   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 331     free 0        dirty 89744    used 41200    free + dirty
89744    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 332     free 128      dirty 111744   used 19072    free + dirty
111872   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 333     free 56       dirty 105848   used 25040    free + dirty
105904   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)
LEB 334     free 80       dirty 110080   used 20784    free + dirty
110160   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 335     free 112      dirty 52312    used 78520    free + dirty
52424    dark 4256 dead 0    nodes fit 12  flags 0x1  (dirty)
LEB 336     free 40       dirty 99824    used 31080    free + dirty
99864    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 337     free 128      dirty 111152   used 19664    free + dirty
111280   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 338     free 24       dirty 74768    used 56152    free + dirty
74792    dark 4256 dead 0    nodes fit 17  flags 0x1  (dirty)
LEB 339     free 128      dirty 87632    used 43184    free + dirty
87760    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 340     free 32       dirty 93392    used 37520    free + dirty
93424    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 341     free 56       dirty 93800    used 37088    free + dirty
93856    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 342     free 0        dirty 86024    used 44920    free + dirty
86024    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 343     free 31880    dirty 81056    used 18008    free + dirty
112936   flags 0x22 (dirty index)
LEB 344     free 0        dirty 130944   used 0        free + dirty
130944   dark 4256 dead 0    nodes fit 30  flags 0x5  (freeable)
LEB 345     free 40176    dirty 62576    used 28192    free + dirty
102752   flags 0x22 (dirty index)
LEB 346     free 96       dirty 108880   used 21968    free + dirty
108976   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 347     free 144      dirty 48248    used 82552    free + dirty
48392    dark 4256 dead 0    nodes fit 11  flags 0x1  (dirty)
LEB 348     free 40       dirty 99680    used 31224    free + dirty
99720    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 349     free 120      dirty 104912   used 25912    free + dirty
105032   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)
LEB 350     free 136      dirty 2400     used 128408   free + dirty
2536     dark 2536 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 351     free 96       dirty 8152     used 122696   free + dirty
8248     dark 4256 dead 0    nodes fit 1   flags 0x1  (dirty)
LEB 352     free 96       dirty 31248    used 99600    free + dirty
31344    dark 4256 dead 0    nodes fit 7   flags 0x1  (dirty)
LEB 353     free 8        dirty 1440     used 129496   free + dirty
1448     dark 1448 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 354     free 120      dirty 1112     used 129712   free + dirty
1232     dark 1232 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 355     free 56       dirty 25824    used 105064   free + dirty
25880    dark 4256 dead 0    nodes fit 6   flags 0x1  (dirty)
LEB 356     free 112      dirty 1840     used 128992   free + dirty
1952     dark 1952 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 357     free 48       dirty 97264    used 33632    free + dirty
97312    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 358     free 8        dirty 6736     used 124200   free + dirty
6744     dark 4256 dead 0    nodes fit 1   flags 0x1  (dirty)
LEB 359     free 72       dirty 104552   used 26320    free + dirty
104624   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)
LEB 360     free 136      dirty 3008     used 127800   free + dirty
3144     dark 3144 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 361     free 48       dirty 106704   used 24192    free + dirty
106752   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 362     free 40       dirty 95136    used 35768    free + dirty
95176    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 363     free 128      dirty 9264     used 121552   free + dirty
9392     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 364     free 96       dirty 320      used 130528   free + dirty
416      dark 416  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 365     free 48       dirty 94408    used 36488    free + dirty
94456    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 366     free 72       dirty 1288     used 129584   free + dirty
1360     dark 1360 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 367     free 8        dirty 8808     used 122128   free + dirty
8816     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 368     free 56       dirty 2368     used 128520   free + dirty
2424     dark 2424 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 369     free 32       dirty 41872    used 89040    free + dirty
41904    dark 4256 dead 0    nodes fit 9   flags 0x1  (dirty)
LEB 370     free 136      dirty 26984    used 103824   free + dirty
27120    dark 4256 dead 0    nodes fit 6   flags 0x0  (not categorized)
LEB 371     free 152      dirty 1864     used 128928   free + dirty
2016     dark 2016 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 372     free 24       dirty 1576     used 129344   free + dirty
1600     dark 1600 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 373     free 16       dirty 2368     used 128560   free + dirty
2384     dark 2384 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 374     free 128      dirty 98464    used 32352    free + dirty
98592    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 375     free 24       dirty 1480     used 129440   free + dirty
1504     dark 1504 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 376     free 16       dirty 1328     used 129600   free + dirty
1344     dark 1344 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 377     free 96       dirty 2376     used 128472   free + dirty
2472     dark 2472 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 378     free 8        dirty 1760     used 129176   free + dirty
1768     dark 1768 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 379     free 80       dirty 112208   used 18656    free + dirty
112288   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 380     free 144      dirty 99024    used 31776    free + dirty
99168    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 381     free 40       dirty 81256    used 49648    free + dirty
81296    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 382     free 96       dirty 1072     used 129776   free + dirty
1168     dark 1168 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 383     free 96       dirty 2344     used 128504   free + dirty
2440     dark 2440 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 384     free 16       dirty 760      used 130168   free + dirty
776      dark 776  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 385     free 56       dirty 2672     used 128216   free + dirty
2728     dark 2728 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 386     free 40       dirty 95928    used 34976    free + dirty
95968    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 387     free 8        dirty 99496    used 31440    free + dirty
99504    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 388     free 72       dirty 110648   used 20224    free + dirty
110720   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 389     free 152      dirty 99536    used 31256    free + dirty
99688    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 390     free 5888     dirty 104784   used 20272    free + dirty
110672   flags 0x22 (dirty index)
LEB 391     free 152      dirty 71184    used 59608    free + dirty
71336    dark 4256 dead 0    nodes fit 16  flags 0x1  (dirty)
LEB 392     free 16       dirty 2240     used 128688   free + dirty
2256     dark 2256 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 393     free 112      dirty 2232     used 128600   free + dirty
2344     dark 2344 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 394     free 40       dirty 1088     used 129816   free + dirty
1128     dark 1128 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 395     free 8        dirty 84400    used 46536    free + dirty
84408    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 396     free 136      dirty 93696    used 37112    free + dirty
93832    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 397     free 48       dirty 110888   used 20008    free + dirty
110936   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 398     free 58064    dirty 54072    used 18808    free + dirty
112136   flags 0x22 (dirty index)
LEB 399     free 120      dirty 84936    used 45888    free + dirty
85056    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)
LEB 400     free 77168    dirty 37248    used 16528    free + dirty
114416   flags 0x22 (dirty index)
LEB 401     free 96       dirty 92512    used 38336    free + dirty
92608    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 402     free 136      dirty 9360     used 121448   free + dirty
9496     dark 4256 dead 0    nodes fit 2   flags 0x0  (not categorized)
LEB 403     free 144      dirty 480      used 130320   free + dirty
624      dark 624  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 404     free 27096    dirty 74360    used 29488    free + dirty
101456   flags 0x22 (dirty index)
LEB 405     free 0        dirty 63200    used 67744    free + dirty
63200    dark 4256 dead 0    nodes fit 14  flags 0x1  (dirty)
LEB 406     free 64       dirty 2672     used 128208   free + dirty
2736     dark 2736 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 407     free 88       dirty 109440   used 21416    free + dirty
109528   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 408     free 96       dirty 110248   used 20600    free + dirty
110344   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 409     free 88       dirty 3912     used 126944   free + dirty
4000     dark 4000 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 410     free 16       dirty 1768     used 129160   free + dirty
1784     dark 1784 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 411     free 88       dirty 5312     used 125544   free + dirty
5400     dark 4256 dead 0    nodes fit 1   flags 0x1  (dirty)
LEB 412     free 130944   dirty 0        used 0        free + dirty
130944   dark 4256 dead 0    nodes fit 30  flags 0x10 (taken, bud of jhead
2 (data))
LEB 413     free 112      dirty 9480     used 121352   free + dirty
9592     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 414     free 0        dirty 101064   used 29880    free + dirty
101064   dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 415     free 48       dirty 98656    used 32240    free + dirty
98704    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty
LEB 416     free 48       dirty 86224    used 44672    free + dirty
86272    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)
LEB 417     free 48       dirty 16552    used 114344   free + dirty
16600    dark 4256 dead 0    nodes fit 3   flags 0x1  (dirty)
LEB 418     free 128      dirty 76176    used 54640    free + dirty
76304    dark 4256 dead 0    nodes fit 17  flags 0x1  (dirty)
LEB 419     free 82224    dirty 30024    used 18696    free + dirty
112248   flags 0x22 (dirty index)
LEB 420     free 38112    dirty 70008    used 22824    free + dirty
108120   flags 0x22 (dirty index)
LEB 421     free 42104    dirty 66416    used 22424    free + dirty
108520   flags 0x22 (dirty index)
LEB 422     free 15768    dirty 98416    used 16760    free + dirty
114184   flags 0x22 (dirty index)
LEB 423     free 112      dirty 2504     used 128328   free + dirty
2616     dark 2616 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 424     free 56       dirty 3184     used 127704   free + dirty
3240     dark 3240 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 425     free 8        dirty 61376    used 69560    free + dirty
61384    dark 4256 dead 0    nodes fit 14  flags 0x1  (dirty)
LEB 426     free 8        dirty 880      used 130056   free + dirty
888      dark 888  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 427     free 24       dirty 1848     used 129072   free + dirty
1872     dark 1872 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 428     free 0        dirty 888      used 130056   free + dirty
888      dark 888  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 429     free 48       dirty 640      used 130256   free + dirty
688      dark 688  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 430     free 16       dirty 1432     used 129496   free + dirty
1448     dark 1448 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 431     free 8        dirty 64       used 130872   free + dirty
72       dark 72   dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 432     free 56       dirty 1984     used 128904   free + dirty
2040     dark 2040 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 433     free 32       dirty 2992     used 127920   free + dirty
3024     dark 3024 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 434     free 96       dirty 107624   used 23224    free + dirty
107720   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 435     free 80       dirty 18656    used 112208   free + dirty
18736    dark 4256 dead 0    nodes fit 4   flags 0x1  (dirty)
LEB 436     free 48       dirty 96312    used 34584    free + dirty
96360    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 437     free 88       dirty 111288   used 19568    free + dirty
111376   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 438     free 104      dirty 1824     used 129016   free + dirty
1928     dark 1928 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 439     free 0        dirty 1376     used 129568   free + dirty
1376     dark 1376 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 440     free 40       dirty 94600    used 36304    free + dirty
94640    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 441     free 144      dirty 112056   used 18744    free + dirty
112200   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 442     free 72       dirty 107008   used 23864    free + dirty
107080   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 443     free 120      dirty 98544    used 32280    free + dirty
98664    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 444     free 8        dirty 91832    used 39104    free + dirty
91840    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 445     free 104      dirty 96344    used 34496    free + dirty
96448    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 446     free 152      dirty 91600    used 39192    free + dirty
91752    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)
LEB 447     free 8        dirty 9008     used 121928   free + dirty
9016     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 448     free 120      dirty 1440     used 129384   free + dirty
1560     dark 1560 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 449     free 144      dirty 7480     used 123320   free + dirty
7624     dark 4256 dead 0    nodes fit 1   flags 0x1  (dirty)
LEB 450     free 88       dirty 7352     used 123504   free + dirty
7440     dark 4256 dead 0    nodes fit 1   flags 0x0  (not categorized)
LEB 451     free 80       dirty 58008    used 72856    free + dirty
58088    dark 4256 dead 0    nodes fit 13  flags 0x1  (dirty)
LEB 452     free 9040     dirty 95656    used 26248    free + dirty
104696   flags 0x22 (dirty index)
LEB 453     free 8152     dirty 113096   used 9696     free + dirty
121248   flags 0x30 (index, taken)
LEB 454     free 40       dirty 99984    used 30920    free + dirty
100024   dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 455     free 56       dirty 7832     used 123056   free + dirty
7888     dark 4256 dead 0    nodes fit 1   flags 0x1  (dirty)
LEB 456     free 64       dirty 111448   used 19432    free + dirty
111512   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 457     free 40       dirty 95480    used 35424    free + dirty
95520    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)
LEB 458     free 60056    dirty 53472    used 17416    free + dirty
113528   flags 0x22 (dirty index)
LEB 459     free 16       dirty 100136   used 30792    free + dirty
100152   dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 460     free 0        dirty 320      used 130624   free + dirty
320      dark 320  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 461     free 104      dirty 109608   used 21232    free + dirty
109712   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 462     free 64       dirty 114528   used 16352    free + dirty
114592   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)
LEB 463     free 152      dirty 109624   used 21168    free + dirty
109776   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 464     free 112      dirty 99080    used 31752    free + dirty
99192    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 465     free 72       dirty 99264    used 31608    free + dirty
99336    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)
LEB 466     free 48       dirty 480      used 130416   free + dirty
528      dark 528  dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 467     free 152      dirty 2560     used 128232   free + dirty
2712     dark 2712 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 468     free 55128    dirty 47592    used 28224    free + dirty
102720   flags 0x22 (dirty index)
LEB 469     free 130944   dirty 0        used 0        free + dirty
130944   dark 4256 dead 0    nodes fit 30  flags 0x10 (taken, jhead 2(data))
LEB 470     free 40       dirty 1968     used 128936   free + dirty
2008     dark 2008 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 471     free 144      dirty 960      used 129840   free + dirty
1104     dark 1104 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 472     free 32       dirty 9000     used 121912   free + dirty
9032     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 473     free 144      dirty 9048     used 121752   free + dirty
9192     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 474     free 0        dirty 126600   used 4344     free + dirty
126600   dark 4256 dead 0    nodes fit 29  flags 0x1  (dirty)
LEB 475     free 152      dirty 63856    used 66936    free + dirty
64008    dark 4256 dead 0    nodes fit 15  flags 0x1  (dirty)
LEB 476     free 144      dirty 1760     used 129040   free + dirty
1904     dark 1904 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 477     free 88       dirty 2008     used 128848   free + dirty
2096     dark 2096 dead 0    nodes fit 0   flags 0x0  (not categorized)
LEB 478     free 13448    dirty 99712    used 17784    free + dirty
113160   flags 0x22 (dirty index)
LEB 479     free 104      dirty 9152     used 121688   free + dirty
9256     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)
LEB 480     free 0        dirty 1152     used 129792   free + dirty
1152     dark 1152 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 481     free 0        dirty 2664     used 128280   free + dirty
2664     dark 2664 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 482     free 112      dirty 125704   used 5128     free + dirty
125816   dark 4256 dead 0    nodes fit 29  flags 0x1  (dirty)
LEB 483     free 80       dirty 8288     used 122576   free + dirty
8368     dark 4256 dead 0    nodes fit 1   flags 0x0  (not categorized)
LEB 484     free 168      dirty 125736   used 5040     free + dirty
125904   dark 4256 dead 0    nodes fit 29  flags 0x1  (dirty)
LEB 485     free 48       dirty 2696     used 128200   free + dirty
2744     dark 2744 dead 0    nodes fit 0   flags 0x1  (dirty)
LEB 486     free 96       dirty 107016   used 23832    free + dirty
107112   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 487     free 56       dirty 110128   used 20760    free + dirty
110184   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)
LEB 488     free 67464    dirty 36960    used 26520    free + dirty
104424   flags 0x22 (dirty index)
(pid 958) finish dumping LEB properties
(pid 958) Budgeting info: data budget sum 0, total budget sum 0
        budg_data_growth 0, budg_dd_growth 0, budg_idx_growth 0
        min_idx_lebs 19, old_idx_sz 774952, uncommitted_idx 9024
        page_budget 4144, inode_budget 160, dent_budget 312
        nospace 0, nospace_rp 0
        dark_wm 4256, dead_wm 56, max_idx_node_sz 192
        freeable_cnt 1, calc_idx_sz 768632, idx_gc_cnt 0
        dirty_pg_cnt 0, dirty_zn_cnt 47, clean_zn_cnt 0
        gc_lnum -1, ihead_lnum 453
        jhead 0 (GC)     LEB 237
        jhead 1 (base)   LEB 293
        jhead 2 (data)   LEB 469
        bud LEB 92
        bud LEB 206
        bud LEB 237
        bud LEB 293
        bud LEB 312
        bud LEB 412
        bud LEB 469
        commit state 0
Budgeting predictions:
        available: 16938560, outstanding 0, free 16002679
mount: No space left on device

--f46d044401deb4a7b804c4f6824c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span style=3D"font-family:courier new,monospace">I&#39;m developing on cus=
tom hardware using an at91sam9g45 processor with 64 MB of RAM and 64 MB of =
NOR flash running Linux 3.0.13.<br><br>I&#39;m doing some power-cycle testi=
ng and after several hours, UBIFS failed to mount the root partition and pr=
inted the message &quot;grab_empty_leb: could not find an empty LEB&quot;.=
=A0 The system boots and starts a script that will </span><span style=3D"fo=
nt-family:courier new,monospace">power cycle </span><span style=3D"font-fam=
ily:courier new,monospace">the board anytime between 10 and 20 seconds afte=
r the script has started.=A0 Just before a power cycle occurs, syslog and o=
ur main process are the only processes that could be writing to disk.=A0 <b=
r>
<br>I then checked </span><span style=3D"font-family:courier new,monospace"=
><a href=3D"http://git.infradead.org/users/dedekind/ubifs-v3.0.git">http://=
git.infradead.org/users/dedekind/ubifs-v3.0.git</a> to see if there was a p=
atch and couldn&#39;t find anything describing my exact problem.=A0 I gener=
ated a patch from </span><span style=3D"font-family:courier new,monospace">=
commit 02f8c6aee8df3cdc935e9bdd4f2d020306035dbe to a0c2d5050bd191e53a761381=
027c8e5ab8e25336 (see attached ubifs.3.0.diff) and rebuilt the kernel.=A0 I=
f there was a patch for my issue, I was expecting the root partition to be =
recovered but it wasn&#39;t.=A0 I&#39;m currently running the same test wit=
h the patched kernel.=A0 </span><span style=3D"font-family:courier new,mono=
space">Below is the information from the patched kernel.<br>
<br>If there is any more information I need to provide, please let me know.=
<br></span>
<span style=3D"font-family:courier new,monospace"></span><br style=3D"font-=
family:courier new,monospace"><span style=3D"font-family:courier new,monosp=
ace"></span><span style=3D"font-family:courier new,monospace">Any help woul=
d be appreciated,<br>
Bud<br><br><br></span><span style=3D"font-family:courier new,monospace">[li=
nux-16][~&gt; uname -a</span><br style=3D"font-family:courier new,monospace=
"><span style=3D"font-family:courier new,monospace">Linux linux 3.0.13 #20 =
Mon Jul 16 11:16:58 CDT 2012 armv5tejl GNU/Linux</span><br style=3D"font-fa=
mily:courier new,monospace">
<br style=3D"font-family:courier new,monospace"><span style=3D"font-family:=
courier new,monospace">[linux-16][~&gt; mtdinfo -a</span><br style=3D"font-=
family:courier new,monospace"><span style=3D"font-family:courier new,monosp=
ace">Count of MTD devices:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5</span><br style=
=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Present MTD devices:=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mtd0, mtd1, mtd2, mtd3, mtd4</span><br style=
=3D"font-family:courier new,monospace"><span style=3D"font-family:courier n=
ew,monospace">Sysfs interface supported:=A0=A0=A0=A0=A0 yes</span><br style=
=3D"font-family:courier new,monospace">
<br style=3D"font-family:courier new,monospace"><span style=3D"font-family:=
courier new,monospace">mtd0</span><br style=3D"font-family:courier new,mono=
space"><span style=3D"font-family:courier new,monospace">Name:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 boot</sp=
an><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Type:=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor</span><br =
style=3D"font-family:courier new,monospace"><span style=3D"font-family:cour=
ier new,monospace">Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 131072 bytes, 128.0 KiB</span><br style=3D"font-family:courier new,m=
onospace">
<span style=3D"font-family:courier new,monospace">Amount of eraseblocks:=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 1 (131072 bytes, 128.0 KiB)</span><br style=3D"fon=
t-family:courier new,monospace"><span style=3D"font-family:courier new,mono=
space">Minimum input/output unit size: 1 byte</span><br style=3D"font-famil=
y:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Sub-page size:=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 byte</span><br style=3D"font-f=
amily:courier new,monospace"><span style=3D"font-family:courier new,monospa=
ce">Character device major/minor:=A0=A0 90:0</span><br style=3D"font-family=
:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Bad blocks are allowed:=
=A0=A0=A0=A0=A0=A0=A0=A0 false</span><br style=3D"font-family:courier new,m=
onospace"><span style=3D"font-family:courier new,monospace">Device is writa=
ble:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 false</span><br style=3D"font-fami=
ly:courier new,monospace">
<br style=3D"font-family:courier new,monospace"><span style=3D"font-family:=
courier new,monospace">mtd1</span><br style=3D"font-family:courier new,mono=
space"><span style=3D"font-family:courier new,monospace">Name:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uboot</s=
pan><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Type:=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor</span><br =
style=3D"font-family:courier new,monospace"><span style=3D"font-family:cour=
ier new,monospace">Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 131072 bytes, 128.0 KiB</span><br style=3D"font-family:courier new,m=
onospace">
<span style=3D"font-family:courier new,monospace">Amount of eraseblocks:=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 1 (131072 bytes, 128.0 KiB)</span><br style=3D"fon=
t-family:courier new,monospace"><span style=3D"font-family:courier new,mono=
space">Minimum input/output unit size: 1 byte</span><br style=3D"font-famil=
y:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Sub-page size:=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 byte</span><br style=3D"font-f=
amily:courier new,monospace"><span style=3D"font-family:courier new,monospa=
ce">Character device major/minor:=A0=A0 90:2</span><br style=3D"font-family=
:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Bad blocks are allowed:=
=A0=A0=A0=A0=A0=A0=A0=A0 false</span><br style=3D"font-family:courier new,m=
onospace"><span style=3D"font-family:courier new,monospace">Device is writa=
ble:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 false</span><br style=3D"font-fami=
ly:courier new,monospace">
<br style=3D"font-family:courier new,monospace"><span style=3D"font-family:=
courier new,monospace">mtd2</span><br style=3D"font-family:courier new,mono=
space"><span style=3D"font-family:courier new,monospace">Name:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 env</spa=
n><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Type:=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor</span><br =
style=3D"font-family:courier new,monospace"><span style=3D"font-family:cour=
ier new,monospace">Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 131072 bytes, 128.0 KiB</span><br style=3D"font-family:courier new,m=
onospace">
<span style=3D"font-family:courier new,monospace">Amount of eraseblocks:=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 1 (131072 bytes, 128.0 KiB)</span><br style=3D"fon=
t-family:courier new,monospace"><span style=3D"font-family:courier new,mono=
space">Minimum input/output unit size: 1 byte</span><br style=3D"font-famil=
y:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Sub-page size:=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 byte</span><br style=3D"font-f=
amily:courier new,monospace"><span style=3D"font-family:courier new,monospa=
ce">Character device major/minor:=A0=A0 90:4</span><br style=3D"font-family=
:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Bad blocks are allowed:=
=A0=A0=A0=A0=A0=A0=A0=A0 false</span><br style=3D"font-family:courier new,m=
onospace"><span style=3D"font-family:courier new,monospace">Device is writa=
ble:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true</span><br style=3D"font-famil=
y:courier new,monospace">
<br style=3D"font-family:courier new,monospace"><span style=3D"font-family:=
courier new,monospace">mtd3</span><br style=3D"font-family:courier new,mono=
space"><span style=3D"font-family:courier new,monospace">Name:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kernel</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Type:=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor</span><br =
style=3D"font-family:courier new,monospace"><span style=3D"font-family:cour=
ier new,monospace">Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 131072 bytes, 128.0 KiB</span><br style=3D"font-family:courier new,m=
onospace">
<span style=3D"font-family:courier new,monospace">Amount of eraseblocks:=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 16 (2097152 bytes, 2.0 MiB)</span><br style=3D"fon=
t-family:courier new,monospace"><span style=3D"font-family:courier new,mono=
space">Minimum input/output unit size: 1 byte</span><br style=3D"font-famil=
y:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Sub-page size:=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 byte</span><br style=3D"font-f=
amily:courier new,monospace"><span style=3D"font-family:courier new,monospa=
ce">Character device major/minor:=A0=A0 90:6</span><br style=3D"font-family=
:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Bad blocks are allowed:=
=A0=A0=A0=A0=A0=A0=A0=A0 false</span><br style=3D"font-family:courier new,m=
onospace"><span style=3D"font-family:courier new,monospace">Device is writa=
ble:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 false</span><br style=3D"font-fami=
ly:courier new,monospace">
<br style=3D"font-family:courier new,monospace"><span style=3D"font-family:=
courier new,monospace">mtd4</span><br style=3D"font-family:courier new,mono=
space"><span style=3D"font-family:courier new,monospace">Name:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 root-fs<=
/span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Type:=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor</span><br =
style=3D"font-family:courier new,monospace"><span style=3D"font-family:cour=
ier new,monospace">Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 131072 bytes, 128.0 KiB</span><br style=3D"font-family:courier new,m=
onospace">
<span style=3D"font-family:courier new,monospace">Amount of eraseblocks:=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 493 (64618496 bytes, 61.6 MiB)</span><br style=3D"=
font-family:courier new,monospace"><span style=3D"font-family:courier new,m=
onospace">Minimum input/output unit size: 1 byte</span><br style=3D"font-fa=
mily:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Sub-page size:=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 byte</span><br style=3D"font-f=
amily:courier new,monospace"><span style=3D"font-family:courier new,monospa=
ce">Character device major/minor:=A0=A0 90:8</span><br style=3D"font-family=
:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Bad blocks are allowed:=
=A0=A0=A0=A0=A0=A0=A0=A0 false</span><br style=3D"font-family:courier new,m=
onospace"><span style=3D"font-family:courier new,monospace">Device is writa=
ble:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true</span><br style=3D"font-famil=
y:courier new,monospace">
<br style=3D"font-family:courier new,monospace"><br style=3D"font-family:co=
urier new,monospace"><br style=3D"font-family:courier new,monospace"><span =
style=3D"font-family:courier new,monospace">[linux-16][~&gt; ubinfo -a /dev=
/ubi0</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">ubi0</span><br style=3D"f=
ont-family:courier new,monospace"><span style=3D"font-family:courier new,mo=
nospace">Volumes count:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 1</span><br style=3D"font-family:courier new,mo=
nospace">
<span style=3D"font-family:courier new,monospace">Logical eraseblock size:=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 130944 bytes, 127.9 KiB</s=
pan><br style=3D"font-family:courier new,monospace"><span style=3D"font-fam=
ily:courier new,monospace">Total amount of logical eraseblocks:=A0=A0=A0=A0=
 493 (64555392 bytes, 61.6 MiB)</span><br style=3D"font-family:courier new,=
monospace">
<span style=3D"font-family:courier new,monospace">Amount of available logic=
al eraseblocks: 0 (0 bytes)</span><br style=3D"font-family:courier new,mono=
space"><span style=3D"font-family:courier new,monospace">Maximum count of v=
olumes=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 128</span><br style=
=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Count of bad physical era=
seblocks:=A0=A0=A0=A0=A0=A0 0</span><br style=3D"font-family:courier new,mo=
nospace"><span style=3D"font-family:courier new,monospace">Count of reserve=
d physical eraseblocks:=A0 0</span><br style=3D"font-family:courier new,mon=
ospace">
<span style=3D"font-family:courier new,monospace">Current maximum erase cou=
nter value:=A0=A0=A0=A0 154</span><br style=3D"font-family:courier new,mono=
space"><span style=3D"font-family:courier new,monospace">Minimum input/outp=
ut unit size:=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 byte</span><br style=3D"font-fam=
ily:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Character device major/mi=
nor:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 253:0</span><br style=3D"font-family:=
courier new,monospace"><span style=3D"font-family:courier new,monospace">Pr=
esent volumes:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0</span><br style=3D"font-family:courier new,monospace">
<br style=3D"font-family:courier new,monospace"><span style=3D"font-family:=
courier new,monospace">Volume ID:=A0=A0 0 (on ubi0)</span><br style=3D"font=
-family:courier new,monospace"><span style=3D"font-family:courier new,monos=
pace">Type:=A0=A0=A0=A0=A0=A0=A0 dynamic</span><br style=3D"font-family:cou=
rier new,monospace">
<span style=3D"font-family:courier new,monospace">Alignment:=A0=A0 1</span>=
<br style=3D"font-family:courier new,monospace"><span style=3D"font-family:=
courier new,monospace">Size:=A0=A0=A0=A0=A0=A0=A0 489 LEBs (64031616 bytes,=
 61.1 MiB)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">State:=A0=A0=A0=A0=A0=A0 =
OK</span><br style=3D"font-family:courier new,monospace"><span style=3D"fon=
t-family:courier new,monospace">Name:=A0=A0=A0=A0=A0=A0=A0 ubirootfs</span>=
<br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Character device major/mi=
nor: 253:1</span><br style=3D"font-family:courier new,monospace"><br style=
=3D"font-family:courier new,monospace"><br style=3D"font-family:courier new=
,monospace">
<br style=3D"font-family:courier new,monospace"><span style=3D"font-family:=
courier new,monospace">[linux-16][~&gt; mount -t ubifs ubi0:ubirootfs /opt/=
root/</span><br style=3D"font-family:courier new,monospace"><span style=3D"=
font-family:courier new,monospace">UBIFS: recovery needed</span><br style=
=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">UBIFS error (pid 958): gr=
ab_empty_leb: could not find an empty LEB</span><br style=3D"font-family:co=
urier new,monospace"><span style=3D"font-family:courier new,monospace">(pid=
 958) start dumping LEB properties</span><br style=3D"font-family:courier n=
ew,monospace">
<span style=3D"font-family:courier new,monospace">(pid 958) Lprops statisti=
cs: empty_lebs 2, idx_lebs=A0 28</span><br style=3D"font-family:courier new=
,monospace"><span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=
=A0=A0=A0 taken_empty_lebs 2, total_free 1193080, total_dirty 19318832</spa=
n><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 tot=
al_used 41441632, total_dark 1291912, total_dead 56</span><br style=3D"font=
-family:courier new,monospace"><span style=3D"font-family:courier new,monos=
pace">LEB 10=A0=A0=A0=A0=A0 free 24=A0=A0=A0=A0=A0=A0 dirty 4064=A0=A0=A0=
=A0 used 126856=A0=A0 free + dirty 4088=A0=A0=A0=A0 dark 4088 dead 0=A0=A0=
=A0 nodes fit 0=A0=A0 flags 0x1=A0 (dirty)</span><br style=3D"font-family:c=
ourier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 11=A0=A0=A0=A0=A0 fre=
e 8=A0=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130296=A0=A0 free + =
dirty 648=A0=A0=A0=A0=A0 dark 648=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flag=
s 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 12=A0=A0=A0=A0=A0 fre=
e 40=A0=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129944=A0=A0 free + di=
rty 1000=A0=A0=A0=A0 dark 1000 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 13=A0=A0=A0=A0=A0 fre=
e 0=A0=A0=A0=A0=A0=A0=A0 dirty 1600=A0=A0=A0=A0 used 129344=A0=A0 free + di=
rty 1600=A0=A0=A0=A0 dark 1600 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 14=A0=A0=A0=A0=A0 fre=
e 104=A0=A0=A0=A0=A0 dirty 1272=A0=A0=A0=A0 used 129568=A0=A0 free + dirty =
1376=A0=A0=A0=A0 dark 1376 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 15=A0=A0=A0=A0=A0 fre=
e 104=A0=A0=A0=A0=A0 dirty 1920=A0=A0=A0=A0 used 128920=A0=A0 free + dirty =
2024=A0=A0=A0=A0 dark 2024 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 16=A0=A0=A0=A0=A0 fre=
e 152=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129672=A0=A0 free + dirty =
1272=A0=A0=A0=A0 dark 1272 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 17=A0=A0=A0=A0=A0 fre=
e 112=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129712=A0=A0 free + dirty =
1232=A0=A0=A0=A0 dark 1232 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 18=A0=A0=A0=A0=A0 fre=
e 48=A0=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129776=A0=A0 free + dirt=
y 1168=A0=A0=A0=A0 dark 1168 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 19=A0=A0=A0=A0=A0 fre=
e 104=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129720=A0=A0 free + dirty =
1224=A0=A0=A0=A0 dark 1224 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 20=A0=A0=A0=A0=A0 fre=
e 56=A0=A0=A0=A0=A0=A0 dirty 1280=A0=A0=A0=A0 used 129608=A0=A0 free + dirt=
y 1336=A0=A0=A0=A0 dark 1336 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 21=A0=A0=A0=A0=A0 fre=
e 56=A0=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129768=A0=A0 free + dirt=
y 1176=A0=A0=A0=A0 dark 1176 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 22=A0=A0=A0=A0=A0 fre=
e 128=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130176=A0=A0 free + dirt=
y 768=A0=A0=A0=A0=A0 dark 768=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 23=A0=A0=A0=A0=A0 fre=
e 120=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130344=A0=A0 free + dirt=
y 600=A0=A0=A0=A0=A0 dark 600=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 24=A0=A0=A0=A0=A0 fre=
e 64=A0=A0=A0=A0=A0=A0 dirty 1600=A0=A0=A0=A0 used 129280=A0=A0 free + dirt=
y 1664=A0=A0=A0=A0 dark 1664 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 25=A0=A0=A0=A0=A0 fre=
e 24=A0=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129480=A0=A0 free + dirt=
y 1464=A0=A0=A0=A0 dark 1464 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 26=A0=A0=A0=A0=A0 fre=
e 8=A0=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130296=A0=A0 free + =
dirty 648=A0=A0=A0=A0=A0 dark 648=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flag=
s 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 27=A0=A0=A0=A0=A0 fre=
e 40=A0=A0=A0=A0=A0=A0 dirty 1760=A0=A0=A0=A0 used 129144=A0=A0 free + dirt=
y 1800=A0=A0=A0=A0 dark 1800 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 28=A0=A0=A0=A0=A0 fre=
e 64=A0=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129760=A0=A0 free + dirt=
y 1184=A0=A0=A0=A0 dark 1184 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 29=A0=A0=A0=A0=A0 fre=
e 32=A0=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130752=A0=A0 free + di=
rty 192=A0=A0=A0=A0=A0 dark 192=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 30=A0=A0=A0=A0=A0 fre=
e 72=A0=A0=A0=A0=A0=A0 dirty 1328=A0=A0=A0=A0 used 129544=A0=A0 free + dirt=
y 1400=A0=A0=A0=A0 dark 1400 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 31=A0=A0=A0=A0=A0 fre=
e 48=A0=A0=A0=A0=A0=A0 dirty 2272=A0=A0=A0=A0 used 128624=A0=A0 free + dirt=
y 2320=A0=A0=A0=A0 dark 2320 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 32=A0=A0=A0=A0=A0 fre=
e 56=A0=A0=A0=A0=A0=A0 dirty 1280=A0=A0=A0=A0 used 129608=A0=A0 free + dirt=
y 1336=A0=A0=A0=A0 dark 1336 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 33=A0=A0=A0=A0=A0 fre=
e 48=A0=A0=A0=A0=A0=A0 dirty 800=A0=A0=A0=A0=A0 used 130096=A0=A0 free + di=
rty 848=A0=A0=A0=A0=A0 dark 848=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 34=A0=A0=A0=A0=A0 fre=
e 128=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129376=A0=A0 free + dirty =
1568=A0=A0=A0=A0 dark 1568 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 35=A0=A0=A0=A0=A0 fre=
e 64=A0=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129920=A0=A0 free + di=
rty 1024=A0=A0=A0=A0 dark 1024 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 36=A0=A0=A0=A0=A0 fre=
e 104=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130680=A0=A0 free + dirt=
y 264=A0=A0=A0=A0=A0 dark 264=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 37=A0=A0=A0=A0=A0 fre=
e 40=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130264=A0=A0 free + di=
rty 680=A0=A0=A0=A0=A0 dark 680=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 38=A0=A0=A0=A0=A0 fre=
e 72=A0=A0=A0=A0=A0=A0 dirty 2112=A0=A0=A0=A0 used 128760=A0=A0 free + dirt=
y 2184=A0=A0=A0=A0 dark 2184 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 39=A0=A0=A0=A0=A0 fre=
e 104=A0=A0=A0=A0=A0 dirty 25328=A0=A0=A0 used 105512=A0=A0 free + dirty 25=
432=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 5=A0=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 40=A0=A0=A0=A0=A0 fre=
e 72=A0=A0=A0=A0=A0=A0 dirty 96464=A0=A0=A0 used 34408=A0=A0=A0 free + dirt=
y 96536=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 41=A0=A0=A0=A0=A0 fre=
e 104=A0=A0=A0=A0=A0 dirty 104832=A0=A0 used 26008=A0=A0=A0 free + dirty 10=
4936=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 24=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 42=A0=A0=A0=A0=A0 fre=
e 72=A0=A0=A0=A0=A0=A0 dirty 111616=A0=A0 used 19256=A0=A0=A0 free + dirty =
111688=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 43=A0=A0=A0=A0=A0 fre=
e 88=A0=A0=A0=A0=A0=A0 dirty 83008=A0=A0=A0 used 47848=A0=A0=A0 free + dirt=
y 83096=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 44=A0=A0=A0=A0=A0 fre=
e 48=A0=A0=A0=A0=A0=A0 dirty 53944=A0=A0=A0 used 76952=A0=A0=A0 free + dirt=
y 53992=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 12=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 45=A0=A0=A0=A0=A0 fre=
e 128=A0=A0=A0=A0=A0 dirty 88752=A0=A0=A0 used 42064=A0=A0=A0 free + dirty =
88880=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 46=A0=A0=A0=A0=A0 fre=
e 136=A0=A0=A0=A0=A0 dirty 111976=A0=A0 used 18832=A0=A0=A0 free + dirty 11=
2112=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 47=A0=A0=A0=A0=A0 fre=
e 16=A0=A0=A0=A0=A0=A0 dirty 89176=A0=A0=A0 used 41752=A0=A0=A0 free + dirt=
y 89192=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 48=A0=A0=A0=A0=A0 fre=
e 24=A0=A0=A0=A0=A0=A0 dirty 96616=A0=A0=A0 used 34304=A0=A0=A0 free + dirt=
y 96640=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 49=A0=A0=A0=A0=A0 fre=
e 48=A0=A0=A0=A0=A0=A0 dirty 88320=A0=A0=A0 used 42576=A0=A0=A0 free + dirt=
y 88368=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 50=A0=A0=A0=A0=A0 fre=
e 88=A0=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129736=A0=A0 free + dirt=
y 1208=A0=A0=A0=A0 dark 1208 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 51=A0=A0=A0=A0=A0 fre=
e 152=A0=A0=A0=A0=A0 dirty 84456=A0=A0=A0 used 46336=A0=A0=A0 free + dirty =
84608=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 52=A0=A0=A0=A0=A0 fre=
e 24=A0=A0=A0=A0=A0=A0 dirty 1736=A0=A0=A0=A0 used 129184=A0=A0 free + dirt=
y 1760=A0=A0=A0=A0 dark 1760 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 53=A0=A0=A0=A0=A0 fre=
e 32=A0=A0=A0=A0=A0=A0 dirty 107272=A0=A0 used 23640=A0=A0=A0 free + dirty =
107304=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 54=A0=A0=A0=A0=A0 fre=
e 72=A0=A0=A0=A0=A0=A0 dirty 8696=A0=A0=A0=A0 used 122176=A0=A0 free + dirt=
y 8768=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 55=A0=A0=A0=A0=A0 fre=
e 144=A0=A0=A0=A0=A0 dirty 92152=A0=A0=A0 used 38648=A0=A0=A0 free + dirty =
92296=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 56=A0=A0=A0=A0=A0 fre=
e 120=A0=A0=A0=A0=A0 dirty 86160=A0=A0=A0 used 44664=A0=A0=A0 free + dirty =
86280=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 57=A0=A0=A0=A0=A0 fre=
e 56=A0=A0=A0=A0=A0=A0 dirty 97728=A0=A0=A0 used 33160=A0=A0=A0 free + dirt=
y 97784=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 58=A0=A0=A0=A0=A0 fre=
e 16=A0=A0=A0=A0=A0=A0 dirty 50696=A0=A0=A0 used 80232=A0=A0=A0 free + dirt=
y 50712=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 11=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 59=A0=A0=A0=A0=A0 fre=
e 0=A0=A0=A0=A0=A0=A0=A0 dirty 97448=A0=A0=A0 used 33496=A0=A0=A0 free + di=
rty 97448=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 60=A0=A0=A0=A0=A0 fre=
e 80=A0=A0=A0=A0=A0=A0 dirty 83216=A0=A0=A0 used 47648=A0=A0=A0 free + dirt=
y 83296=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 61=A0=A0=A0=A0=A0 fre=
e 64=A0=A0=A0=A0=A0=A0 dirty 43384=A0=A0=A0 used 87496=A0=A0=A0 free + dirt=
y 43448=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 10=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 62=A0=A0=A0=A0=A0 fre=
e 40=A0=A0=A0=A0=A0=A0 dirty 2568=A0=A0=A0=A0 used 128336=A0=A0 free + dirt=
y 2608=A0=A0=A0=A0 dark 2608 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 63=A0=A0=A0=A0=A0 fre=
e 64=A0=A0=A0=A0=A0=A0 dirty 3632=A0=A0=A0=A0 used 127248=A0=A0 free + dirt=
y 3696=A0=A0=A0=A0 dark 3696 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 64=A0=A0=A0=A0=A0 fre=
e 0=A0=A0=A0=A0=A0=A0=A0 dirty 9528=A0=A0=A0=A0 used 121416=A0=A0 free + di=
rty 9528=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 65=A0=A0=A0=A0=A0 fre=
e 152=A0=A0=A0=A0=A0 dirty 696=A0=A0=A0=A0=A0 used 130096=A0=A0 free + dirt=
y 848=A0=A0=A0=A0=A0 dark 848=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 66=A0=A0=A0=A0=A0 fre=
e 48=A0=A0=A0=A0=A0=A0 dirty 57392=A0=A0=A0 used 73504=A0=A0=A0 free + dirt=
y 57440=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 13=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 67=A0=A0=A0=A0=A0 fre=
e 64=A0=A0=A0=A0=A0=A0 dirty 90192=A0=A0=A0 used 40688=A0=A0=A0 free + dirt=
y 90256=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 68=A0=A0=A0=A0=A0 fre=
e 72=A0=A0=A0=A0=A0=A0 dirty 111312=A0=A0 used 19560=A0=A0=A0 free + dirty =
111384=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 69=A0=A0=A0=A0=A0 fre=
e 0=A0=A0=A0=A0=A0=A0=A0 dirty 85128=A0=A0=A0 used 45816=A0=A0=A0 free + di=
rty 85128=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 70=A0=A0=A0=A0=A0 fre=
e 96=A0=A0=A0=A0=A0=A0 dirty 97600=A0=A0=A0 used 33248=A0=A0=A0 free + dirt=
y 97696=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 71=A0=A0=A0=A0=A0 fre=
e 16=A0=A0=A0=A0=A0=A0 dirty 91408=A0=A0=A0 used 39520=A0=A0=A0 free + dirt=
y 91424=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 72=A0=A0=A0=A0=A0 fre=
e 48=A0=A0=A0=A0=A0=A0 dirty 103064=A0=A0 used 27832=A0=A0=A0 free + dirty =
103112=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 24=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 73=A0=A0=A0=A0=A0 fre=
e 112=A0=A0=A0=A0=A0 dirty 98704=A0=A0=A0 used 32128=A0=A0=A0 free + dirty =
98816=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 74=A0=A0=A0=A0=A0 fre=
e 8=A0=A0=A0=A0=A0=A0=A0 dirty 1712=A0=A0=A0=A0 used 129224=A0=A0 free + di=
rty 1720=A0=A0=A0=A0 dark 1720 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 75=A0=A0=A0=A0=A0 fre=
e 144=A0=A0=A0=A0=A0 dirty 1656=A0=A0=A0=A0 used 129144=A0=A0 free + dirty =
1800=A0=A0=A0=A0 dark 1800 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 76=A0=A0=A0=A0=A0 fre=
e 80=A0=A0=A0=A0=A0=A0 dirty 76656=A0=A0=A0 used 54208=A0=A0=A0 free + dirt=
y 76736=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 18=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 77=A0=A0=A0=A0=A0 fre=
e 128=A0=A0=A0=A0=A0 dirty 61016=A0=A0=A0 used 69800=A0=A0=A0 free + dirty =
61144=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 14=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 78=A0=A0=A0=A0=A0 fre=
e 40=A0=A0=A0=A0=A0=A0 dirty 48576=A0=A0=A0 used 82328=A0=A0=A0 free + dirt=
y 48616=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 11=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 79=A0=A0=A0=A0=A0 fre=
e 88=A0=A0=A0=A0=A0=A0 dirty 9592=A0=A0=A0=A0 used 121264=A0=A0 free + dirt=
y 9680=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 80=A0=A0=A0=A0=A0 fre=
e 40=A0=A0=A0=A0=A0=A0 dirty 54184=A0=A0=A0 used 76720=A0=A0=A0 free + dirt=
y 54224=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 12=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 81=A0=A0=A0=A0=A0 fre=
e 32=A0=A0=A0=A0=A0=A0 dirty 8592=A0=A0=A0=A0 used 122320=A0=A0 free + dirt=
y 8624=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 82=A0=A0=A0=A0=A0 fre=
e 8=A0=A0=A0=A0=A0=A0=A0 dirty 1112=A0=A0=A0=A0 used 129824=A0=A0 free + di=
rty 1120=A0=A0=A0=A0 dark 1120 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 83=A0=A0=A0=A0=A0 fre=
e 24=A0=A0=A0=A0=A0=A0 dirty 104352=A0=A0 used 26568=A0=A0=A0 free + dirty =
104376=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 24=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 84=A0=A0=A0=A0=A0 fre=
e 56=A0=A0=A0=A0=A0=A0 dirty 9680=A0=A0=A0=A0 used 121208=A0=A0 free + dirt=
y 9736=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 85=A0=A0=A0=A0=A0 fre=
e 32=A0=A0=A0=A0=A0=A0 dirty 1112=A0=A0=A0=A0 used 129800=A0=A0 free + dirt=
y 1144=A0=A0=A0=A0 dark 1144 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 86=A0=A0=A0=A0=A0 fre=
e 72=A0=A0=A0=A0=A0=A0 dirty 88976=A0=A0=A0 used 41896=A0=A0=A0 free + dirt=
y 89048=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 87=A0=A0=A0=A0=A0 fre=
e 0=A0=A0=A0=A0=A0=A0=A0 dirty 90504=A0=A0=A0 used 40440=A0=A0=A0 free + di=
rty 90504=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 88=A0=A0=A0=A0=A0 fre=
e 128=A0=A0=A0=A0=A0 dirty 82728=A0=A0=A0 used 48088=A0=A0=A0 free + dirty =
82856=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 89=A0=A0=A0=A0=A0 fre=
e 64=A0=A0=A0=A0=A0=A0 dirty 104640=A0=A0 used 26240=A0=A0=A0 free + dirty =
104704=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 24=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 90=A0=A0=A0=A0=A0 fre=
e 88=A0=A0=A0=A0=A0=A0 dirty 68744=A0=A0=A0 used 62112=A0=A0=A0 free + dirt=
y 68832=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 16=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 91=A0=A0=A0=A0=A0 fre=
e 152=A0=A0=A0=A0=A0 dirty 1528=A0=A0=A0=A0 used 129264=A0=A0 free + dirty =
1680=A0=A0=A0=A0 dark 1680 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 92=A0=A0=A0=A0=A0 fre=
e 448=A0=A0=A0=A0=A0 dirty 124120=A0=A0 used 6376=A0=A0=A0=A0 free + dirty =
124568=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 29=A0 flags 0x10 (taken, b=
ud of jhead 2 (data))</span><br style=3D"font-family:courier new,monospace"=
>
<span style=3D"font-family:courier new,monospace">LEB 93=A0=A0=A0=A0=A0 fre=
e 72=A0=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130392=A0=A0 free + di=
rty 552=A0=A0=A0=A0=A0 dark 552=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 94=A0=A0=A0=A0=A0 fre=
e 64=A0=A0=A0=A0=A0=A0 dirty 108216=A0=A0 used 22664=A0=A0=A0 free + dirty =
108280=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 95=A0=A0=A0=A0=A0 fre=
e 72=A0=A0=A0=A0=A0=A0 dirty 105400=A0=A0 used 25472=A0=A0=A0 free + dirty =
105472=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 24=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 96=A0=A0=A0=A0=A0 fre=
e 72=A0=A0=A0=A0=A0=A0 dirty 112456=A0=A0 used 18416=A0=A0=A0 free + dirty =
112528=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 97=A0=A0=A0=A0=A0 fre=
e 16=A0=A0=A0=A0=A0=A0 dirty 99960=A0=A0=A0 used 30968=A0=A0=A0 free + dirt=
y 99976=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 98=A0=A0=A0=A0=A0 fre=
e 24=A0=A0=A0=A0=A0=A0 dirty 58792=A0=A0=A0 used 72128=A0=A0=A0 free + dirt=
y 58816=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 13=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 99=A0=A0=A0=A0=A0 fre=
e 0=A0=A0=A0=A0=A0=A0=A0 dirty 92688=A0=A0=A0 used 38256=A0=A0=A0 free + di=
rty 92688=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 100=A0=A0=A0=A0 free =
88728=A0=A0=A0 dirty 20312=A0=A0=A0 used 21904=A0=A0=A0 free + dirty 109040=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 101=A0=A0=
=A0=A0 free 7152=A0=A0=A0=A0 dirty 107016=A0=A0 used 16776=A0=A0=A0 free + =
dirty 114168=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:=
courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 102=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 100824=A0=A0 used 30080=A0=A0=A0 free + dirty 10=
0864=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 103=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 98464=A0=A0=A0 used 32352=A0=A0=A0 free + dirty 98=
592=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 104=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 112808=A0=A0 used 18064=A0=A0=A0 free + dirty 11=
2880=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 105=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 85704=A0=A0=A0 used 45240=A0=A0=A0 free + dirt=
y 85704=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 106=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 1488=A0=A0=A0=A0 used 129408=A0=A0 free + dirty =
1536=A0=A0=A0=A0 dark 1536 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 107=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130536=A0=A0 free + dirt=
y 408=A0=A0=A0=A0=A0 dark 408=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 108=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129936=A0=A0 free + dirt=
y 1008=A0=A0=A0=A0 dark 1008 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 109=A0=A0=A0=A0 free =
8880=A0=A0=A0=A0 dirty 106784=A0=A0 used 15280=A0=A0=A0 free + dirty 115664=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 110=A0=A0=
=A0=A0 free 128=A0=A0=A0=A0=A0 dirty 94504=A0=A0=A0 used 36312=A0=A0=A0 fre=
e + dirty 94632=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 111=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 9728=A0=A0=A0=A0 used 121152=A0=A0 free + dirty =
9792=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 112=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 1672=A0=A0=A0=A0 used 129232=A0=A0 free + dirty =
1712=A0=A0=A0=A0 dark 1712 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 113=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 2400=A0=A0=A0=A0 used 128456=A0=A0 free + dirty =
2488=A0=A0=A0=A0 dark 2488 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 114=A0=A0=A0=A0 free =
152=A0=A0=A0=A0=A0 dirty 15152=A0=A0=A0 used 115640=A0=A0 free + dirty 1530=
4=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 3=A0=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 115=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 64424=A0=A0=A0 used 66480=A0=A0=A0 free + dirty =
64464=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 15=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 116=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 1904=A0=A0=A0=A0 used 129008=A0=A0 free + dirty =
1936=A0=A0=A0=A0 dark 1936 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 117=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 2184=A0=A0=A0=A0 used 128680=A0=A0 free + dirty =
2264=A0=A0=A0=A0 dark 2264 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 118=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 82784=A0=A0=A0 used 48016=A0=A0=A0 free + dirty 82=
928=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 119=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 101648=A0=A0 used 29216=A0=A0=A0 free + dirty 10=
1728=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 120=A0=A0=A0=A0 free =
136=A0=A0=A0=A0=A0 dirty 99720=A0=A0=A0 used 31088=A0=A0=A0 free + dirty 99=
856=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 121=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 94688=A0=A0=A0 used 36184=A0=A0=A0 free + dirty =
94760=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 122=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 1920=A0=A0=A0=A0 used 128920=A0=A0 free + dirty 20=
24=A0=A0=A0=A0 dark 2024 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 123=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129360=A0=A0 free + dirty 15=
84=A0=A0=A0=A0 dark 1584 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 124=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 81088=A0=A0=A0 used 49760=A0=A0=A0 free + dirty =
81184=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 125=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 78320=A0=A0=A0 used 52608=A0=A0=A0 free + dirty =
78336=A0=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:cour=
ier new,monospace"><span style=3D"font-family:courier new,monospace">LEB 12=
6=A0=A0=A0=A0 free 120=A0=A0=A0=A0=A0 dirty 89976=A0=A0=A0 used 40848=A0=A0=
=A0 free + dirty 90096=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 f=
lags 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 127=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 72=A0=A0=A0=A0=A0=A0 used 130864=A0=A0 free + =
dirty 80=A0=A0=A0=A0=A0=A0 dark 80=A0=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 =
flags 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 128=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129816=A0=A0 free + dirt=
y 1128=A0=A0=A0=A0 dark 1128 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 129=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 2560=A0=A0=A0=A0 used 128296=A0=A0 free + dirty =
2648=A0=A0=A0=A0 dark 2648 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 130=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129680=A0=A0 free + dirty 12=
64=A0=A0=A0=A0 dark 1264 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 131=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 1600=A0=A0=A0=A0 used 129240=A0=A0 free + dirty 17=
04=A0=A0=A0=A0 dark 1704 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 132=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129784=A0=A0 free + dirty =
1160=A0=A0=A0=A0 dark 1160 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 133=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 1192=A0=A0=A0=A0 used 129720=A0=A0 free + dirty =
1224=A0=A0=A0=A0 dark 1224 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 134=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 2216=A0=A0=A0=A0 used 128640=A0=A0 free + dirty =
2304=A0=A0=A0=A0 dark 2304 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 135=A0=A0=A0=A0 free =
120=A0=A0=A0=A0=A0 dirty 1760=A0=A0=A0=A0 used 129064=A0=A0 free + dirty 18=
80=A0=A0=A0=A0 dark 1880 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 136=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130696=A0=A0 free + dirt=
y 248=A0=A0=A0=A0=A0 dark 248=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 137=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130776=A0=A0 free + di=
rty 168=A0=A0=A0=A0=A0 dark 168=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 138=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 800=A0=A0=A0=A0=A0 used 130000=A0=A0 free + dirty =
944=A0=A0=A0=A0=A0 dark 944=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 139=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 2080=A0=A0=A0=A0 used 128808=A0=A0 free + dirty =
2136=A0=A0=A0=A0 dark 2136 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 140=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 2392=A0=A0=A0=A0 used 128512=A0=A0 free + dirty =
2432=A0=A0=A0=A0 dark 2432 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 141=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 800=A0=A0=A0=A0=A0 used 130104=A0=A0 free + dirt=
y 840=A0=A0=A0=A0=A0 dark 840=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 142=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130600=A0=A0 free + dirt=
y 344=A0=A0=A0=A0=A0 dark 344=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 143=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 1600=A0=A0=A0=A0 used 129296=A0=A0 free + dirty =
1648=A0=A0=A0=A0 dark 1648 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 144=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 2400=A0=A0=A0=A0 used 128512=A0=A0 free + dirty =
2432=A0=A0=A0=A0 dark 2432 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 145=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129400=A0=A0 free + dirty 15=
44=A0=A0=A0=A0 dark 1544 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 146=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130208=A0=A0 free + dirt=
y 736=A0=A0=A0=A0=A0 dark 736=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 147=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129720=A0=A0 free + dirty 12=
24=A0=A0=A0=A0 dark 1224 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 148=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 0=A0=A0=A0=A0=A0=A0=A0 used 130896=A0=A0 free + =
dirty 48=A0=A0=A0=A0=A0=A0 dark 0=A0=A0=A0 dead 48=A0=A0 nodes fit 0=A0=A0 =
flags 0x3=A0 (free)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 149=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130600=A0=A0 free + dirt=
y 344=A0=A0=A0=A0=A0 dark 344=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 150=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 2360=A0=A0=A0=A0 used 128456=A0=A0 free + dirty 24=
88=A0=A0=A0=A0 dark 2488 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 151=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 1896=A0=A0=A0=A0 used 128976=A0=A0 free + dirty =
1968=A0=A0=A0=A0 dark 1968 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 152=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130584=A0=A0 free + dirt=
y 360=A0=A0=A0=A0=A0 dark 360=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 153=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130416=A0=A0 free + dirt=
y 528=A0=A0=A0=A0=A0 dark 528=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 154=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130672=A0=A0 free + dirty =
272=A0=A0=A0=A0=A0 dark 272=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 155=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 2584=A0=A0=A0=A0 used 128352=A0=A0 free + dirt=
y 2592=A0=A0=A0=A0 dark 2592 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 156=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 1280=A0=A0=A0=A0 used 129576=A0=A0 free + dirty =
1368=A0=A0=A0=A0 dark 1368 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 157=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 1344=A0=A0=A0=A0 used 129600=A0=A0 free + dirt=
y 1344=A0=A0=A0=A0 dark 1344 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 158=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 2624=A0=A0=A0=A0 used 128248=A0=A0 free + dirty =
2696=A0=A0=A0=A0 dark 2696 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 159=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 1600=A0=A0=A0=A0 used 129240=A0=A0 free + dirty 17=
04=A0=A0=A0=A0 dark 1704 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 160=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129800=A0=A0 free + dirty =
1144=A0=A0=A0=A0 dark 1144 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 161=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 1760=A0=A0=A0=A0 used 129088=A0=A0 free + dirty =
1856=A0=A0=A0=A0 dark 1856 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 162=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130416=A0=A0 free + dirt=
y 528=A0=A0=A0=A0=A0 dark 528=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 163=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 464=A0=A0=A0=A0=A0 used 130392=A0=A0 free + dirt=
y 552=A0=A0=A0=A0=A0 dark 552=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 164=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 3696=A0=A0=A0=A0 used 127200=A0=A0 free + dirty =
3744=A0=A0=A0=A0 dark 3744 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 165=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 13688=A0=A0=A0 used 117208=A0=A0 free + dirty 13=
736=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 3=A0=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 166=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 21328=A0=A0=A0 used 109544=A0=A0 free + dirty 21=
400=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 5=A0=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 167=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 28752=A0=A0=A0 used 102064=A0=A0 free + dirty 2888=
0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 6=A0=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 168=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 97760=A0=A0=A0 used 33040=A0=A0=A0 free + dirty 97=
904=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 169=A0=A0=A0=A0 free =
192=A0=A0=A0=A0=A0 dirty 71616=A0=A0=A0 used 59136=A0=A0=A0 free + dirty 71=
808=A0=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courie=
r new,monospace"><span style=3D"font-family:courier new,monospace">LEB 170=
=A0=A0=A0=A0 free 1352=A0=A0=A0=A0 dirty 60440=A0=A0=A0 used 69152=A0=A0=A0=
 free + dirty 61792=A0=A0=A0 flags 0x22 (dirty index)</span><br style=3D"fo=
nt-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 171=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 1656=A0=A0=A0=A0 used 129144=A0=A0 free + dirty 18=
00=A0=A0=A0=A0 dark 1800 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 172=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 23568=A0=A0=A0 used 107272=A0=A0 free + dirty 2367=
2=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 5=A0=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 173=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 20336=A0=A0=A0 used 110496=A0=A0 free + dirty 2044=
8=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 4=A0=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 174=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 27808=A0=A0=A0 used 103064=A0=A0 free + dirty 27=
880=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 6=A0=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 175=A0=A0=A0=A0 free =
120=A0=A0=A0=A0=A0 dirty 30488=A0=A0=A0 used 100336=A0=A0 free + dirty 3060=
8=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 7=A0=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 176=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130720=A0=A0 free + dirt=
y 224=A0=A0=A0=A0=A0 dark 224=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 177=A0=A0=A0=A0 free =
120=A0=A0=A0=A0=A0 dirty 23416=A0=A0=A0 used 107408=A0=A0 free + dirty 2353=
6=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 5=A0=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 178=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 55992=A0=A0=A0 used 74904=A0=A0=A0 free + dirty =
56040=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 13=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 179=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 1904=A0=A0=A0=A0 used 128952=A0=A0 free + dirty =
1992=A0=A0=A0=A0 dark 1992 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 180=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 9712=A0=A0=A0=A0 used 121136=A0=A0 free + dirty =
9808=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 181=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130552=A0=A0 free + dirt=
y 392=A0=A0=A0=A0=A0 dark 392=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 182=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 23920=A0=A0=A0 used 106896=A0=A0 free + dirty 2404=
8=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 5=A0=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 183=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 800=A0=A0=A0=A0=A0 used 130064=A0=A0 free + dirt=
y 880=A0=A0=A0=A0=A0 dark 880=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 184=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130592=A0=A0 free + dirt=
y 352=A0=A0=A0=A0=A0 dark 352=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 185=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 2400=A0=A0=A0=A0 used 128536=A0=A0 free + dirt=
y 2408=A0=A0=A0=A0 dark 2408 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 186=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 64=A0=A0=A0=A0=A0=A0 used 130872=A0=A0 free + =
dirty 72=A0=A0=A0=A0=A0=A0 dark 72=A0=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 =
flags 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 187=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129984=A0=A0 free + di=
rty 960=A0=A0=A0=A0=A0 dark 960=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 188=A0=A0=A0=A0 free =
152=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130312=A0=A0 free + dirty =
632=A0=A0=A0=A0=A0 dark 632=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 189=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130256=A0=A0 free + dirt=
y 688=A0=A0=A0=A0=A0 dark 688=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 190=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 93312=A0=A0=A0 used 37576=A0=A0=A0 free + dirty =
93368=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 191=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 1920=A0=A0=A0=A0 used 128920=A0=A0 free + dirty 20=
24=A0=A0=A0=A0 dark 2024 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 192=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130784=A0=A0 free + di=
rty 160=A0=A0=A0=A0=A0 dark 160=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 193=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 800=A0=A0=A0=A0=A0 used 130144=A0=A0 free + di=
rty 800=A0=A0=A0=A0=A0 dark 800=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 194=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 128=A0=A0=A0=A0=A0 used 130792=A0=A0 free + dirt=
y 152=A0=A0=A0=A0=A0 dark 152=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 195=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 15816=A0=A0=A0 used 115088=A0=A0 free + dirty 15=
856=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 3=A0=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 196=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 39160=A0=A0=A0 used 91752=A0=A0=A0 free + dirty =
39192=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 9=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 197=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 36632=A0=A0=A0 used 94272=A0=A0=A0 free + dirty =
36672=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 8=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 198=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 62008=A0=A0=A0 used 68920=A0=A0=A0 free + dirty =
62024=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 14=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 199=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 1600=A0=A0=A0=A0 used 129304=A0=A0 free + dirty =
1640=A0=A0=A0=A0 dark 1640 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 200=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130728=A0=A0 free + dirt=
y 216=A0=A0=A0=A0=A0 dark 216=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 201=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 108008=A0=A0 used 22928=A0=A0=A0 free + dirty =
108016=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 202=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 64=A0=A0=A0=A0=A0=A0 used 130864=A0=A0 free + di=
rty 80=A0=A0=A0=A0=A0=A0 dark 80=A0=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 fl=
ags 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 203=A0=A0=A0=A0 free =
71648=A0=A0=A0 dirty 31168=A0=A0=A0 used 28128=A0=A0=A0 free + dirty 102816=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 204=A0=A0=
=A0=A0 free 24=A0=A0=A0=A0=A0=A0 dirty 66320=A0=A0=A0 used 64600=A0=A0=A0 f=
ree + dirty 66344=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 15=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 205=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 1760=A0=A0=A0=A0 used 129176=A0=A0 free + dirt=
y 1768=A0=A0=A0=A0 dark 1768 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 206=A0=A0=A0=A0 free =
1048=A0=A0=A0=A0 dirty 125856=A0=A0 used 4040=A0=A0=A0=A0 free + dirty 1269=
04=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 29=A0 flags 0x10 (taken, bud o=
f jhead 2 (data))</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 207=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 1480=A0=A0=A0=A0 used 129384=A0=A0 free + dirty =
1560=A0=A0=A0=A0 dark 1560 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 208=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 9272=A0=A0=A0=A0 used 121568=A0=A0 free + dirty 93=
76=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 209=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 76344=A0=A0=A0 used 54544=A0=A0=A0 free + dirty =
76400=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 17=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 210=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 85824=A0=A0=A0 used 45080=A0=A0=A0 free + dirty =
85864=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 211=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 984=A0=A0=A0=A0=A0 used 129880=A0=A0 free + dirt=
y 1064=A0=A0=A0=A0 dark 1064 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 212=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 49080=A0=A0=A0 used 81848=A0=A0=A0 free + dirty =
49096=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 11=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 213=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 93840=A0=A0=A0 used 37056=A0=A0=A0 free + dirty =
93888=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 214=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 104256=A0=A0 used 26664=A0=A0=A0 free + dirty 10=
4280=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 24=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 215=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 111328=A0=A0 used 19504=A0=A0=A0 free + dirty 1114=
40=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</sp=
an><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 216=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 108456=A0=A0 used 22456=A0=A0=A0 free + dirty 10=
8488=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 217=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 100152=A0=A0 used 30648=A0=A0=A0 free + dirty 1002=
96=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)</sp=
an><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 218=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 108136=A0=A0 used 22776=A0=A0=A0 free + dirty 10=
8168=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 219=A0=A0=A0=A0 free =
264=A0=A0=A0=A0=A0 dirty 56600=A0=A0=A0 used 74080=A0=A0=A0 free + dirty 56=
864=A0=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courie=
r new,monospace"><span style=3D"font-family:courier new,monospace">LEB 220=
=A0=A0=A0=A0 free 40=A0=A0=A0=A0=A0=A0 dirty 89960=A0=A0=A0 used 40944=A0=
=A0=A0 free + dirty 90000=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=
=A0 flags 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospa=
ce">
<span style=3D"font-family:courier new,monospace">LEB 221=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 23272=A0=A0=A0 used 107616=A0=A0 free + dirty 23=
328=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 5=A0=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 222=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130320=A0=A0 free + dirty =
624=A0=A0=A0=A0=A0 dark 624=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 223=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129728=A0=A0 free + dirty =
1216=A0=A0=A0=A0 dark 1216 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 224=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130224=A0=A0 free + dirt=
y 720=A0=A0=A0=A0=A0 dark 720=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 225=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 2560=A0=A0=A0=A0 used 128288=A0=A0 free + dirty =
2656=A0=A0=A0=A0 dark 2656 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 226=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129760=A0=A0 free + dirty =
1184=A0=A0=A0=A0 dark 1184 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 227=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 92784=A0=A0=A0 used 38136=A0=A0=A0 free + dirty =
92808=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 228=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 18472=A0=A0=A0 used 112472=A0=A0 free + dirty =
18472=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 4=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 229=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 1760=A0=A0=A0=A0 used 129184=A0=A0 free + dirt=
y 1760=A0=A0=A0=A0 dark 1760 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 230=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130264=A0=A0 free + dirt=
y 680=A0=A0=A0=A0=A0 dark 680=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 231=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 1280=A0=A0=A0=A0 used 129640=A0=A0 free + dirty =
1304=A0=A0=A0=A0 dark 1304 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 232=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130264=A0=A0 free + dirt=
y 680=A0=A0=A0=A0=A0 dark 680=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 233=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 1280=A0=A0=A0=A0 used 129664=A0=A0 free + dirt=
y 1280=A0=A0=A0=A0 dark 1280 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 234=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 80=A0=A0=A0=A0=A0=A0 used 130864=A0=A0 free + =
dirty 80=A0=A0=A0=A0=A0=A0 dark 80=A0=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 =
flags 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 235=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130560=A0=A0 free + dirt=
y 384=A0=A0=A0=A0=A0 dark 384=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 236=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130568=A0=A0 free + dirt=
y 376=A0=A0=A0=A0=A0 dark 376=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 237=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 0=A0=A0=A0=A0=A0=A0=A0 used 130944=A0=A0 free =
+ dirty 0=A0=A0=A0=A0=A0=A0=A0 dark 0=A0=A0=A0 dead 0=A0=A0=A0 nodes fit 0=
=A0=A0 flags 0x10 (taken, jhead 0(GC))</span><br style=3D"font-family:couri=
er new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 238=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129968=A0=A0 free + dirt=
y 976=A0=A0=A0=A0=A0 dark 976=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 239=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 100736=A0=A0 used 30160=A0=A0=A0 free + dirty 10=
0784=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 240=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 110216=A0=A0 used 20640=A0=A0=A0 free + dirty 11=
0304=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 241=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129976=A0=A0 free + di=
rty 968=A0=A0=A0=A0=A0 dark 968=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 242=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 20632=A0=A0=A0 used 110288=A0=A0 free + dirty 20=
656=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 4=A0=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 243=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 2720=A0=A0=A0=A0 used 128224=A0=A0 free + dirt=
y 2720=A0=A0=A0=A0 dark 2720 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 244=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130160=A0=A0 free + dirty =
784=A0=A0=A0=A0=A0 dark 784=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 245=A0=A0=A0=A0 free =
1400=A0=A0=A0=A0 dirty 110912=A0=A0 used 18632=A0=A0=A0 free + dirty 112312=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 246=A0=A0=
=A0=A0 free 0=A0=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130304=A0=
=A0 free + dirty 640=A0=A0=A0=A0=A0 dark 640=A0 dead 0=A0=A0=A0 nodes fit 0=
=A0=A0 flags 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,mono=
space">
<span style=3D"font-family:courier new,monospace">LEB 247=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130272=A0=A0 free + dirt=
y 672=A0=A0=A0=A0=A0 dark 672=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 248=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 1760=A0=A0=A0=A0 used 129072=A0=A0 free + dirty 18=
72=A0=A0=A0=A0 dark 1872 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 249=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 3360=A0=A0=A0=A0 used 127488=A0=A0 free + dirty =
3456=A0=A0=A0=A0 dark 3456 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 250=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 1280=A0=A0=A0=A0 used 129664=A0=A0 free + dirt=
y 1280=A0=A0=A0=A0 dark 1280 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 251=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 54736=A0=A0=A0 used 76160=A0=A0=A0 free + dirty =
54784=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 12=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 252=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 47472=A0=A0=A0 used 83384=A0=A0=A0 free + dirty =
47560=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 11=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 253=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 78304=A0=A0=A0 used 52640=A0=A0=A0 free + dirt=
y 78304=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 18=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 254=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 109800=A0=A0 used 21096=A0=A0=A0 free + dirty 10=
9848=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 255=A0=A0=A0=A0 free =
120=A0=A0=A0=A0=A0 dirty 19704=A0=A0=A0 used 111120=A0=A0 free + dirty 1982=
4=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 4=A0=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 256=A0=A0=A0=A0 free =
136=A0=A0=A0=A0=A0 dirty 98760=A0=A0=A0 used 32048=A0=A0=A0 free + dirty 98=
896=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 257=A0=A0=A0=A0 free =
136=A0=A0=A0=A0=A0 dirty 80736=A0=A0=A0 used 50072=A0=A0=A0 free + dirty 80=
872=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 258=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130424=A0=A0 free + dirt=
y 520=A0=A0=A0=A0=A0 dark 520=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 259=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 109424=A0=A0 used 21472=A0=A0=A0 free + dirty 10=
9472=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 260=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 2080=A0=A0=A0=A0 used 128776=A0=A0 free + dirty =
2168=A0=A0=A0=A0 dark 2168 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 261=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130360=A0=A0 free + dirty =
584=A0=A0=A0=A0=A0 dark 584=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 262=A0=A0=A0=A0 free =
240=A0=A0=A0=A0=A0 dirty 125416=A0=A0 used 5288=A0=A0=A0=A0 free + dirty 12=
5656=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 29=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 263=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130288=A0=A0 free + dirt=
y 656=A0=A0=A0=A0=A0 dark 656=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 264=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 2240=A0=A0=A0=A0 used 128640=A0=A0 free + dirty =
2304=A0=A0=A0=A0 dark 2304 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 265=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 24520=A0=A0=A0 used 106424=A0=A0 free + dirty =
24520=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 5=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 266=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130656=A0=A0 free + dirty =
288=A0=A0=A0=A0=A0 dark 288=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=
=A0 (not categorized)</span><br style=3D"font-family:courier new,monospace"=
>
<span style=3D"font-family:courier new,monospace">LEB 267=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 124248=A0=A0 used 6592=A0=A0=A0=A0 free + dirty 12=
4352=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 29=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 268=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130696=A0=A0 free + dirt=
y 248=A0=A0=A0=A0=A0 dark 248=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospace=
">
<span style=3D"font-family:courier new,monospace">LEB 269=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 160=A0=A0=A0=A0=A0 used 130712=A0=A0 free + dirt=
y 232=A0=A0=A0=A0=A0 dark 232=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospace=
">
<span style=3D"font-family:courier new,monospace">LEB 270=A0=A0=A0=A0 free =
120=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129864=A0=A0 free + dirty =
1080=A0=A0=A0=A0 dark 1080 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 271=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 103400=A0=A0 used 27456=A0=A0=A0 free + dirty 10=
3488=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 24=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 272=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 112344=A0=A0 used 18504=A0=A0=A0 free + dirty 11=
2440=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 273=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 2080=A0=A0=A0=A0 used 128776=A0=A0 free + dirty =
2168=A0=A0=A0=A0 dark 2168 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 274=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 75144=A0=A0=A0 used 55688=A0=A0=A0 free + dirty 75=
256=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 17=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 275=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 93264=A0=A0=A0 used 37592=A0=A0=A0 free + dirty =
93352=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 276=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 99160=A0=A0=A0 used 31728=A0=A0=A0 free + dirty =
99216=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 277=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 57136=A0=A0=A0 used 73744=A0=A0=A0 free + dirty =
57200=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 13=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 278=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 8472=A0=A0=A0=A0 used 122392=A0=A0 free + dirty =
8552=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 279=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 2080=A0=A0=A0=A0 used 128784=A0=A0 free + dirty =
2160=A0=A0=A0=A0 dark 2160 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 280=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 8576=A0=A0=A0=A0 used 122368=A0=A0 free + dirt=
y 8576=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 281=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 81352=A0=A0=A0 used 49464=A0=A0=A0 free + dirty 81=
480=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 282=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 1920=A0=A0=A0=A0 used 128968=A0=A0 free + dirty =
1976=A0=A0=A0=A0 dark 1976 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 283=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 1920=A0=A0=A0=A0 used 129024=A0=A0 free + dirt=
y 1920=A0=A0=A0=A0 dark 1920 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 284=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 2080=A0=A0=A0=A0 used 128848=A0=A0 free + dirty =
2096=A0=A0=A0=A0 dark 2096 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 285=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130560=A0=A0 free + dirt=
y 384=A0=A0=A0=A0=A0 dark 384=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospace=
">
<span style=3D"font-family:courier new,monospace">LEB 286=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 109792=A0=A0 used 21080=A0=A0=A0 free + dirty 10=
9864=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 287=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 98144=A0=A0=A0 used 32800=A0=A0=A0 free + dirt=
y 98144=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 288=A0=A0=A0=A0 free =
16576=A0=A0=A0 dirty 89760=A0=A0=A0 used 24608=A0=A0=A0 free + dirty 106336=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 289=A0=A0=
=A0=A0 free 144=A0=A0=A0=A0=A0 dirty 11304=A0=A0=A0 used 119496=A0=A0 free =
+ dirty 11448=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 290=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 58744=A0=A0=A0 used 72096=A0=A0=A0 free + dirty 58=
848=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 13=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 291=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 64856=A0=A0=A0 used 65944=A0=A0=A0 free + dirty 65=
000=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 15=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 292=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130536=A0=A0 free + dirt=
y 408=A0=A0=A0=A0=A0 dark 408=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 293=A0=A0=A0=A0 free =
4952=A0=A0=A0=A0 dirty 124872=A0=A0 used 1120=A0=A0=A0=A0 free + dirty 1298=
24=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 30=A0 flags 0x10 (taken, jhead=
 1 (base))</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 294=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129472=A0=A0 free + dirty =
1472=A0=A0=A0=A0 dark 1472 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 295=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129856=A0=A0 free + dirty =
1088=A0=A0=A0=A0 dark 1088 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 296=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 1920=A0=A0=A0=A0 used 129016=A0=A0 free + dirt=
y 1928=A0=A0=A0=A0 dark 1928 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0=
 (not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 297=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 800=A0=A0=A0=A0=A0 used 130016=A0=A0 free + dirty =
928=A0=A0=A0=A0=A0 dark 928=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 298=A0=A0=A0=A0 free =
136=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129688=A0=A0 free + dirty 12=
56=A0=A0=A0=A0 dark 1256 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (no=
t categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 299=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129488=A0=A0 free + dirty =
1456=A0=A0=A0=A0 dark 1456 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 300=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 103952=A0=A0 used 26960=A0=A0=A0 free + dirty 10=
3984=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier =
new,monospace"><span style=3D"font-family:courier new,monospace">LEB 301=A0=
=A0=A0=A0 free 40=A0=A0=A0=A0=A0=A0 dirty 96=A0=A0=A0=A0=A0=A0 used 130808=
=A0=A0 free + dirty 136=A0=A0=A0=A0=A0 dark 136=A0 dead 0=A0=A0=A0 nodes fi=
t 0=A0=A0 flags 0x0=A0 (not categorized)</span><br style=3D"font-family:cou=
rier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 302=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 800=A0=A0=A0=A0=A0 used 130064=A0=A0 free + dirt=
y 880=A0=A0=A0=A0=A0 dark 880=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospace=
">
<span style=3D"font-family:courier new,monospace">LEB 303=A0=A0=A0=A0 free =
152=A0=A0=A0=A0=A0 dirty 1120=A0=A0=A0=A0 used 129672=A0=A0 free + dirty 12=
72=A0=A0=A0=A0 dark 1272 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (no=
t categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 304=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130464=A0=A0 free + di=
rty 480=A0=A0=A0=A0=A0 dark 480=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospa=
ce">
<span style=3D"font-family:courier new,monospace">LEB 305=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 2080=A0=A0=A0=A0 used 128768=A0=A0 free + dirty =
2176=A0=A0=A0=A0 dark 2176 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 306=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129440=A0=A0 free + dirty =
1504=A0=A0=A0=A0 dark 1504 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 307=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 1920=A0=A0=A0=A0 used 129008=A0=A0 free + dirty =
1936=A0=A0=A0=A0 dark 1936 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 308=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 1920=A0=A0=A0=A0 used 129008=A0=A0 free + dirty =
1936=A0=A0=A0=A0 dark 1936 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 309=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129496=A0=A0 free + dirt=
y 1448=A0=A0=A0=A0 dark 1448 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 310=A0=A0=A0=A0 free =
136=A0=A0=A0=A0=A0 dirty 1760=A0=A0=A0=A0 used 129048=A0=A0 free + dirty 18=
96=A0=A0=A0=A0 dark 1896 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 311=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 7496=A0=A0=A0=A0 used 123424=A0=A0 free + dirty =
7520=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 1=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 312=A0=A0=A0=A0 free =
680=A0=A0=A0=A0=A0 dirty 125816=A0=A0 used 4448=A0=A0=A0=A0 free + dirty 12=
6496=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 29=A0 flags 0x10 (taken, bud=
 of jhead 2 (data))</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 313=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 15928=A0=A0=A0 used 115016=A0=A0 free + dirty =
15928=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 3=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 314=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 42344=A0=A0=A0 used 88576=A0=A0=A0 free + dirty =
42368=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 9=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 315=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 99848=A0=A0=A0 used 31000=A0=A0=A0 free + dirty =
99944=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 316=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 95152=A0=A0=A0 used 35744=A0=A0=A0 free + dirty =
95200=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 317=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 0=A0=A0=A0=A0=A0=A0=A0 used 130936=A0=A0 free =
+ dirty 8=A0=A0=A0=A0=A0=A0=A0 dark 0=A0=A0=A0 dead 8=A0=A0=A0 nodes fit 0=
=A0=A0 flags 0x3=A0 (free)</span><br style=3D"font-family:courier new,monos=
pace">
<span style=3D"font-family:courier new,monospace">LEB 318=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 8088=A0=A0=A0=A0 used 122784=A0=A0 free + dirty =
8160=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 1=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 319=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129464=A0=A0 free + dirty =
1480=A0=A0=A0=A0 dark 1480 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 320=A0=A0=A0=A0 free =
120=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129864=A0=A0 free + dirty =
1080=A0=A0=A0=A0 dark 1080 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 321=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130432=A0=A0 free + dirt=
y 512=A0=A0=A0=A0=A0 dark 512=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 322=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 1600=A0=A0=A0=A0 used 129304=A0=A0 free + dirty =
1640=A0=A0=A0=A0 dark 1640 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 323=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 108416=A0=A0 used 22472=A0=A0=A0 free + dirty 10=
8472=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 324=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129888=A0=A0 free + dirt=
y 1056=A0=A0=A0=A0 dark 1056 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 325=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 2720=A0=A0=A0=A0 used 128224=A0=A0 free + dirt=
y 2720=A0=A0=A0=A0 dark 2720 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 326=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 9344=A0=A0=A0=A0 used 121544=A0=A0 free + dirty =
9400=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 327=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 1904=A0=A0=A0=A0 used 129032=A0=A0 free + dirt=
y 1912=A0=A0=A0=A0 dark 1912 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0=
 (not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 328=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 8376=A0=A0=A0=A0 used 122472=A0=A0 free + dirty =
8472=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 1=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 329=A0=A0=A0=A0 free =
66160=A0=A0=A0 dirty 41304=A0=A0=A0 used 23480=A0=A0=A0 free + dirty 107464=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 330=A0=A0=
=A0=A0 free 0=A0=A0=A0=A0=A0=A0=A0 dirty 109496=A0=A0 used 21448=A0=A0=A0 f=
ree + dirty 109496=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 331=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 89744=A0=A0=A0 used 41200=A0=A0=A0 free + dirt=
y 89744=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 332=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 111744=A0=A0 used 19072=A0=A0=A0 free + dirty 1118=
72=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</sp=
an><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 333=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 105848=A0=A0 used 25040=A0=A0=A0 free + dirty 10=
5904=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 24=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 334=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 110080=A0=A0 used 20784=A0=A0=A0 free + dirty 11=
0160=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 335=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 52312=A0=A0=A0 used 78520=A0=A0=A0 free + dirty 52=
424=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 12=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 336=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 99824=A0=A0=A0 used 31080=A0=A0=A0 free + dirty =
99864=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 337=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 111152=A0=A0 used 19664=A0=A0=A0 free + dirty 1112=
80=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</sp=
an><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 338=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 74768=A0=A0=A0 used 56152=A0=A0=A0 free + dirty =
74792=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 17=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 339=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 87632=A0=A0=A0 used 43184=A0=A0=A0 free + dirty 87=
760=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 340=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 93392=A0=A0=A0 used 37520=A0=A0=A0 free + dirty =
93424=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 341=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 93800=A0=A0=A0 used 37088=A0=A0=A0 free + dirty =
93856=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 342=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 86024=A0=A0=A0 used 44920=A0=A0=A0 free + dirt=
y 86024=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 343=A0=A0=A0=A0 free =
31880=A0=A0=A0 dirty 81056=A0=A0=A0 used 18008=A0=A0=A0 free + dirty 112936=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 344=A0=A0=
=A0=A0 free 0=A0=A0=A0=A0=A0=A0=A0 dirty 130944=A0=A0 used 0=A0=A0=A0=A0=A0=
=A0=A0 free + dirty 130944=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 30=A0 =
flags 0x5=A0 (freeable)</span><br style=3D"font-family:courier new,monospac=
e">
<span style=3D"font-family:courier new,monospace">LEB 345=A0=A0=A0=A0 free =
40176=A0=A0=A0 dirty 62576=A0=A0=A0 used 28192=A0=A0=A0 free + dirty 102752=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 346=A0=A0=
=A0=A0 free 96=A0=A0=A0=A0=A0=A0 dirty 108880=A0=A0 used 21968=A0=A0=A0 fre=
e + dirty 108976=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 347=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 48248=A0=A0=A0 used 82552=A0=A0=A0 free + dirty 48=
392=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 11=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 348=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 99680=A0=A0=A0 used 31224=A0=A0=A0 free + dirty =
99720=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 349=A0=A0=A0=A0 free =
120=A0=A0=A0=A0=A0 dirty 104912=A0=A0 used 25912=A0=A0=A0 free + dirty 1050=
32=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 24=A0 flags 0x1=A0 (dirty)</sp=
an><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 350=A0=A0=A0=A0 free =
136=A0=A0=A0=A0=A0 dirty 2400=A0=A0=A0=A0 used 128408=A0=A0 free + dirty 25=
36=A0=A0=A0=A0 dark 2536 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 351=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 8152=A0=A0=A0=A0 used 122696=A0=A0 free + dirty =
8248=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 1=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 352=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 31248=A0=A0=A0 used 99600=A0=A0=A0 free + dirty =
31344=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 7=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 353=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129496=A0=A0 free + dirt=
y 1448=A0=A0=A0=A0 dark 1448 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 354=A0=A0=A0=A0 free =
120=A0=A0=A0=A0=A0 dirty 1112=A0=A0=A0=A0 used 129712=A0=A0 free + dirty 12=
32=A0=A0=A0=A0 dark 1232 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (no=
t categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 355=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 25824=A0=A0=A0 used 105064=A0=A0 free + dirty 25=
880=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 6=A0=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 356=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 1840=A0=A0=A0=A0 used 128992=A0=A0 free + dirty 19=
52=A0=A0=A0=A0 dark 1952 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (no=
t categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 357=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 97264=A0=A0=A0 used 33632=A0=A0=A0 free + dirty =
97312=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 358=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 6736=A0=A0=A0=A0 used 124200=A0=A0 free + dirt=
y 6744=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 1=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 359=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 104552=A0=A0 used 26320=A0=A0=A0 free + dirty 10=
4624=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 24=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 360=A0=A0=A0=A0 free =
136=A0=A0=A0=A0=A0 dirty 3008=A0=A0=A0=A0 used 127800=A0=A0 free + dirty 31=
44=A0=A0=A0=A0 dark 3144 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (no=
t categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 361=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 106704=A0=A0 used 24192=A0=A0=A0 free + dirty 10=
6752=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 362=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 95136=A0=A0=A0 used 35768=A0=A0=A0 free + dirty =
95176=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 363=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 9264=A0=A0=A0=A0 used 121552=A0=A0 free + dirty 93=
92=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 364=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130528=A0=A0 free + dirt=
y 416=A0=A0=A0=A0=A0 dark 416=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospace=
">
<span style=3D"font-family:courier new,monospace">LEB 365=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 94408=A0=A0=A0 used 36488=A0=A0=A0 free + dirty =
94456=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 366=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 1288=A0=A0=A0=A0 used 129584=A0=A0 free + dirty =
1360=A0=A0=A0=A0 dark 1360 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 367=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 8808=A0=A0=A0=A0 used 122128=A0=A0 free + dirt=
y 8816=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 368=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 2368=A0=A0=A0=A0 used 128520=A0=A0 free + dirty =
2424=A0=A0=A0=A0 dark 2424 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 369=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 41872=A0=A0=A0 used 89040=A0=A0=A0 free + dirty =
41904=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 9=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 370=A0=A0=A0=A0 free =
136=A0=A0=A0=A0=A0 dirty 26984=A0=A0=A0 used 103824=A0=A0 free + dirty 2712=
0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 6=A0=A0 flags 0x0=A0 (not ca=
tegorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 371=A0=A0=A0=A0 free =
152=A0=A0=A0=A0=A0 dirty 1864=A0=A0=A0=A0 used 128928=A0=A0 free + dirty 20=
16=A0=A0=A0=A0 dark 2016 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (no=
t categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 372=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 1576=A0=A0=A0=A0 used 129344=A0=A0 free + dirty =
1600=A0=A0=A0=A0 dark 1600 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 373=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 2368=A0=A0=A0=A0 used 128560=A0=A0 free + dirty =
2384=A0=A0=A0=A0 dark 2384 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 374=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 98464=A0=A0=A0 used 32352=A0=A0=A0 free + dirty 98=
592=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 375=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 1480=A0=A0=A0=A0 used 129440=A0=A0 free + dirty =
1504=A0=A0=A0=A0 dark 1504 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 376=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 1328=A0=A0=A0=A0 used 129600=A0=A0 free + dirty =
1344=A0=A0=A0=A0 dark 1344 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 377=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 2376=A0=A0=A0=A0 used 128472=A0=A0 free + dirty =
2472=A0=A0=A0=A0 dark 2472 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 378=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 1760=A0=A0=A0=A0 used 129176=A0=A0 free + dirt=
y 1768=A0=A0=A0=A0 dark 1768 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0=
 (not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 379=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 112208=A0=A0 used 18656=A0=A0=A0 free + dirty 11=
2288=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 380=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 99024=A0=A0=A0 used 31776=A0=A0=A0 free + dirty 99=
168=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 381=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 81256=A0=A0=A0 used 49648=A0=A0=A0 free + dirty =
81296=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 382=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 1072=A0=A0=A0=A0 used 129776=A0=A0 free + dirty =
1168=A0=A0=A0=A0 dark 1168 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 383=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 2344=A0=A0=A0=A0 used 128504=A0=A0 free + dirty =
2440=A0=A0=A0=A0 dark 2440 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 384=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 760=A0=A0=A0=A0=A0 used 130168=A0=A0 free + dirt=
y 776=A0=A0=A0=A0=A0 dark 776=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospace=
">
<span style=3D"font-family:courier new,monospace">LEB 385=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 2672=A0=A0=A0=A0 used 128216=A0=A0 free + dirty =
2728=A0=A0=A0=A0 dark 2728 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 386=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 95928=A0=A0=A0 used 34976=A0=A0=A0 free + dirty =
95968=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 387=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 99496=A0=A0=A0 used 31440=A0=A0=A0 free + dirt=
y 99504=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 388=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 110648=A0=A0 used 20224=A0=A0=A0 free + dirty 11=
0720=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 389=A0=A0=A0=A0 free =
152=A0=A0=A0=A0=A0 dirty 99536=A0=A0=A0 used 31256=A0=A0=A0 free + dirty 99=
688=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 390=A0=A0=A0=A0 free =
5888=A0=A0=A0=A0 dirty 104784=A0=A0 used 20272=A0=A0=A0 free + dirty 110672=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 391=A0=A0=
=A0=A0 free 152=A0=A0=A0=A0=A0 dirty 71184=A0=A0=A0 used 59608=A0=A0=A0 fre=
e + dirty 71336=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 16=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 392=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 2240=A0=A0=A0=A0 used 128688=A0=A0 free + dirty =
2256=A0=A0=A0=A0 dark 2256 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 393=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 2232=A0=A0=A0=A0 used 128600=A0=A0 free + dirty 23=
44=A0=A0=A0=A0 dark 2344 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 394=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 1088=A0=A0=A0=A0 used 129816=A0=A0 free + dirty =
1128=A0=A0=A0=A0 dark 1128 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 395=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 84400=A0=A0=A0 used 46536=A0=A0=A0 free + dirt=
y 84408=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 396=A0=A0=A0=A0 free =
136=A0=A0=A0=A0=A0 dirty 93696=A0=A0=A0 used 37112=A0=A0=A0 free + dirty 93=
832=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 397=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 110888=A0=A0 used 20008=A0=A0=A0 free + dirty 11=
0936=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 398=A0=A0=A0=A0 free =
58064=A0=A0=A0 dirty 54072=A0=A0=A0 used 18808=A0=A0=A0 free + dirty 112136=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 399=A0=A0=
=A0=A0 free 120=A0=A0=A0=A0=A0 dirty 84936=A0=A0=A0 used 45888=A0=A0=A0 fre=
e + dirty 85056=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 19=A0 flags 0x=
1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 400=A0=A0=A0=A0 free =
77168=A0=A0=A0 dirty 37248=A0=A0=A0 used 16528=A0=A0=A0 free + dirty 114416=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 401=A0=A0=
=A0=A0 free 96=A0=A0=A0=A0=A0=A0 dirty 92512=A0=A0=A0 used 38336=A0=A0=A0 f=
ree + dirty 92608=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags =
0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 402=A0=A0=A0=A0 free =
136=A0=A0=A0=A0=A0 dirty 9360=A0=A0=A0=A0 used 121448=A0=A0 free + dirty 94=
96=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x0=A0 (no=
t categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 403=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130320=A0=A0 free + dirty =
624=A0=A0=A0=A0=A0 dark 624=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=
=A0 (not categorized)</span><br style=3D"font-family:courier new,monospace"=
>
<span style=3D"font-family:courier new,monospace">LEB 404=A0=A0=A0=A0 free =
27096=A0=A0=A0 dirty 74360=A0=A0=A0 used 29488=A0=A0=A0 free + dirty 101456=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 405=A0=A0=
=A0=A0 free 0=A0=A0=A0=A0=A0=A0=A0 dirty 63200=A0=A0=A0 used 67744=A0=A0=A0=
 free + dirty 63200=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 14=A0 flag=
s 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 406=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 2672=A0=A0=A0=A0 used 128208=A0=A0 free + dirty =
2736=A0=A0=A0=A0 dark 2736 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 407=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 109440=A0=A0 used 21416=A0=A0=A0 free + dirty 10=
9528=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 408=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 110248=A0=A0 used 20600=A0=A0=A0 free + dirty 11=
0344=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 409=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 3912=A0=A0=A0=A0 used 126944=A0=A0 free + dirty =
4000=A0=A0=A0=A0 dark 4000 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 410=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 1768=A0=A0=A0=A0 used 129160=A0=A0 free + dirty =
1784=A0=A0=A0=A0 dark 1784 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 411=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 5312=A0=A0=A0=A0 used 125544=A0=A0 free + dirty =
5400=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 1=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 412=A0=A0=A0=A0 free =
130944=A0=A0 dirty 0=A0=A0=A0=A0=A0=A0=A0 used 0=A0=A0=A0=A0=A0=A0=A0 free =
+ dirty 130944=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 30=A0 flags 0x10 (=
taken, bud of jhead 2 (data))</span><br style=3D"font-family:courier new,mo=
nospace">
<span style=3D"font-family:courier new,monospace">LEB 413=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 9480=A0=A0=A0=A0 used 121352=A0=A0 free + dirty 95=
92=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 414=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 101064=A0=A0 used 29880=A0=A0=A0 free + dirty =
101064=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 415=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 98656=A0=A0=A0 used 32240=A0=A0=A0 free + dirty =
98704=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirt=
y</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 416=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 86224=A0=A0=A0 used 44672=A0=A0=A0 free + dirty =
86272=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 20=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 417=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 16552=A0=A0=A0 used 114344=A0=A0 free + dirty 16=
600=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 3=A0=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 418=A0=A0=A0=A0 free =
128=A0=A0=A0=A0=A0 dirty 76176=A0=A0=A0 used 54640=A0=A0=A0 free + dirty 76=
304=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 17=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 419=A0=A0=A0=A0 free =
82224=A0=A0=A0 dirty 30024=A0=A0=A0 used 18696=A0=A0=A0 free + dirty 112248=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 420=A0=A0=
=A0=A0 free 38112=A0=A0=A0 dirty 70008=A0=A0=A0 used 22824=A0=A0=A0 free + =
dirty 108120=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:=
courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 421=A0=A0=A0=A0 free =
42104=A0=A0=A0 dirty 66416=A0=A0=A0 used 22424=A0=A0=A0 free + dirty 108520=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 422=A0=A0=
=A0=A0 free 15768=A0=A0=A0 dirty 98416=A0=A0=A0 used 16760=A0=A0=A0 free + =
dirty 114184=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:=
courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 423=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 2504=A0=A0=A0=A0 used 128328=A0=A0 free + dirty 26=
16=A0=A0=A0=A0 dark 2616 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 424=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 3184=A0=A0=A0=A0 used 127704=A0=A0 free + dirty =
3240=A0=A0=A0=A0 dark 3240 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 425=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 61376=A0=A0=A0 used 69560=A0=A0=A0 free + dirt=
y 61384=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 14=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 426=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 880=A0=A0=A0=A0=A0 used 130056=A0=A0 free + di=
rty 888=A0=A0=A0=A0=A0 dark 888=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospa=
ce">
<span style=3D"font-family:courier new,monospace">LEB 427=A0=A0=A0=A0 free =
24=A0=A0=A0=A0=A0=A0 dirty 1848=A0=A0=A0=A0 used 129072=A0=A0 free + dirty =
1872=A0=A0=A0=A0 dark 1872 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 428=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 888=A0=A0=A0=A0=A0 used 130056=A0=A0 free + di=
rty 888=A0=A0=A0=A0=A0 dark 888=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospa=
ce">
<span style=3D"font-family:courier new,monospace">LEB 429=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 640=A0=A0=A0=A0=A0 used 130256=A0=A0 free + dirt=
y 688=A0=A0=A0=A0=A0 dark 688=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospace=
">
<span style=3D"font-family:courier new,monospace">LEB 430=A0=A0=A0=A0 free =
16=A0=A0=A0=A0=A0=A0 dirty 1432=A0=A0=A0=A0 used 129496=A0=A0 free + dirty =
1448=A0=A0=A0=A0 dark 1448 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 431=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 64=A0=A0=A0=A0=A0=A0 used 130872=A0=A0 free + =
dirty 72=A0=A0=A0=A0=A0=A0 dark 72=A0=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 =
flags 0x0=A0 (not categorized)</span><br style=3D"font-family:courier new,m=
onospace">
<span style=3D"font-family:courier new,monospace">LEB 432=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 1984=A0=A0=A0=A0 used 128904=A0=A0 free + dirty =
2040=A0=A0=A0=A0 dark 2040 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 433=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 2992=A0=A0=A0=A0 used 127920=A0=A0 free + dirty =
3024=A0=A0=A0=A0 dark 3024 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 434=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 107624=A0=A0 used 23224=A0=A0=A0 free + dirty 10=
7720=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 435=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 18656=A0=A0=A0 used 112208=A0=A0 free + dirty 18=
736=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 4=A0=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 436=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 96312=A0=A0=A0 used 34584=A0=A0=A0 free + dirty =
96360=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 437=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 111288=A0=A0 used 19568=A0=A0=A0 free + dirty 11=
1376=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 438=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 1824=A0=A0=A0=A0 used 129016=A0=A0 free + dirty 19=
28=A0=A0=A0=A0 dark 1928 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 439=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 1376=A0=A0=A0=A0 used 129568=A0=A0 free + dirt=
y 1376=A0=A0=A0=A0 dark 1376 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 440=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 94600=A0=A0=A0 used 36304=A0=A0=A0 free + dirty =
94640=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 441=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 112056=A0=A0 used 18744=A0=A0=A0 free + dirty 1122=
00=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</sp=
an><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 442=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 107008=A0=A0 used 23864=A0=A0=A0 free + dirty 10=
7080=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 443=A0=A0=A0=A0 free =
120=A0=A0=A0=A0=A0 dirty 98544=A0=A0=A0 used 32280=A0=A0=A0 free + dirty 98=
664=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 444=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 91832=A0=A0=A0 used 39104=A0=A0=A0 free + dirt=
y 91840=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 445=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 96344=A0=A0=A0 used 34496=A0=A0=A0 free + dirty 96=
448=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 446=A0=A0=A0=A0 free =
152=A0=A0=A0=A0=A0 dirty 91600=A0=A0=A0 used 39192=A0=A0=A0 free + dirty 91=
752=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 21=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 447=A0=A0=A0=A0 free =
8=A0=A0=A0=A0=A0=A0=A0 dirty 9008=A0=A0=A0=A0 used 121928=A0=A0 free + dirt=
y 9016=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 448=A0=A0=A0=A0 free =
120=A0=A0=A0=A0=A0 dirty 1440=A0=A0=A0=A0 used 129384=A0=A0 free + dirty 15=
60=A0=A0=A0=A0 dark 1560 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (no=
t categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 449=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 7480=A0=A0=A0=A0 used 123320=A0=A0 free + dirty 76=
24=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 1=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 450=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 7352=A0=A0=A0=A0 used 123504=A0=A0 free + dirty =
7440=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 1=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 451=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 58008=A0=A0=A0 used 72856=A0=A0=A0 free + dirty =
58088=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 13=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 452=A0=A0=A0=A0 free =
9040=A0=A0=A0=A0 dirty 95656=A0=A0=A0 used 26248=A0=A0=A0 free + dirty 1046=
96=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier ne=
w,monospace"><span style=3D"font-family:courier new,monospace">LEB 453=A0=
=A0=A0=A0 free 8152=A0=A0=A0=A0 dirty 113096=A0=A0 used 9696=A0=A0=A0=A0 fr=
ee + dirty 121248=A0=A0 flags 0x30 (index, taken)</span><br style=3D"font-f=
amily:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 454=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 99984=A0=A0=A0 used 30920=A0=A0=A0 free + dirty =
100024=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 455=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 7832=A0=A0=A0=A0 used 123056=A0=A0 free + dirty =
7888=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 1=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 456=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 111448=A0=A0 used 19432=A0=A0=A0 free + dirty 11=
1512=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 457=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 95480=A0=A0=A0 used 35424=A0=A0=A0 free + dirty =
95520=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 22=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 458=A0=A0=A0=A0 free =
60056=A0=A0=A0 dirty 53472=A0=A0=A0 used 17416=A0=A0=A0 free + dirty 113528=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 459=A0=A0=
=A0=A0 free 16=A0=A0=A0=A0=A0=A0 dirty 100136=A0=A0 used 30792=A0=A0=A0 fre=
e + dirty 100152=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=
=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 460=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 320=A0=A0=A0=A0=A0 used 130624=A0=A0 free + di=
rty 320=A0=A0=A0=A0=A0 dark 320=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags =
0x0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospa=
ce">
<span style=3D"font-family:courier new,monospace">LEB 461=A0=A0=A0=A0 free =
104=A0=A0=A0=A0=A0 dirty 109608=A0=A0 used 21232=A0=A0=A0 free + dirty 1097=
12=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</sp=
an><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 462=A0=A0=A0=A0 free =
64=A0=A0=A0=A0=A0=A0 dirty 114528=A0=A0 used 16352=A0=A0=A0 free + dirty 11=
4592=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 26=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 463=A0=A0=A0=A0 free =
152=A0=A0=A0=A0=A0 dirty 109624=A0=A0 used 21168=A0=A0=A0 free + dirty 1097=
76=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</sp=
an><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 464=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 99080=A0=A0=A0 used 31752=A0=A0=A0 free + dirty 99=
192=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 465=A0=A0=A0=A0 free =
72=A0=A0=A0=A0=A0=A0 dirty 99264=A0=A0=A0 used 31608=A0=A0=A0 free + dirty =
99336=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 23=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 466=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 480=A0=A0=A0=A0=A0 used 130416=A0=A0 free + dirt=
y 528=A0=A0=A0=A0=A0 dark 528=A0 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x=
0=A0 (not categorized)</span><br style=3D"font-family:courier new,monospace=
">
<span style=3D"font-family:courier new,monospace">LEB 467=A0=A0=A0=A0 free =
152=A0=A0=A0=A0=A0 dirty 2560=A0=A0=A0=A0 used 128232=A0=A0 free + dirty 27=
12=A0=A0=A0=A0 dark 2712 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 468=A0=A0=A0=A0 free =
55128=A0=A0=A0 dirty 47592=A0=A0=A0 used 28224=A0=A0=A0 free + dirty 102720=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 469=A0=A0=
=A0=A0 free 130944=A0=A0 dirty 0=A0=A0=A0=A0=A0=A0=A0 used 0=A0=A0=A0=A0=A0=
=A0=A0 free + dirty 130944=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 30=A0 =
flags 0x10 (taken, jhead 2(data))</span><br style=3D"font-family:courier ne=
w,monospace">
<span style=3D"font-family:courier new,monospace">LEB 470=A0=A0=A0=A0 free =
40=A0=A0=A0=A0=A0=A0 dirty 1968=A0=A0=A0=A0 used 128936=A0=A0 free + dirty =
2008=A0=A0=A0=A0 dark 2008 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 471=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 960=A0=A0=A0=A0=A0 used 129840=A0=A0 free + dirty =
1104=A0=A0=A0=A0 dark 1104 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 472=A0=A0=A0=A0 free =
32=A0=A0=A0=A0=A0=A0 dirty 9000=A0=A0=A0=A0 used 121912=A0=A0 free + dirty =
9032=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 473=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 9048=A0=A0=A0=A0 used 121752=A0=A0 free + dirty 91=
92=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 474=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 126600=A0=A0 used 4344=A0=A0=A0=A0 free + dirt=
y 126600=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 29=A0 flags 0x1=A0 (dirt=
y)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 475=A0=A0=A0=A0 free =
152=A0=A0=A0=A0=A0 dirty 63856=A0=A0=A0 used 66936=A0=A0=A0 free + dirty 64=
008=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 15=A0 flags 0x1=A0 (dirty)=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 476=A0=A0=A0=A0 free =
144=A0=A0=A0=A0=A0 dirty 1760=A0=A0=A0=A0 used 129040=A0=A0 free + dirty 19=
04=A0=A0=A0=A0 dark 1904 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (di=
rty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 477=A0=A0=A0=A0 free =
88=A0=A0=A0=A0=A0=A0 dirty 2008=A0=A0=A0=A0 used 128848=A0=A0 free + dirty =
2096=A0=A0=A0=A0 dark 2096 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 478=A0=A0=A0=A0 free =
13448=A0=A0=A0 dirty 99712=A0=A0=A0 used 17784=A0=A0=A0 free + dirty 113160=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">LEB 479=A0=A0=
=A0=A0 free 104=A0=A0=A0=A0=A0 dirty 9152=A0=A0=A0=A0 used 121688=A0=A0 fre=
e + dirty 9256=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 2=A0=A0 flag=
s 0x1=A0 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 480=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 1152=A0=A0=A0=A0 used 129792=A0=A0 free + dirt=
y 1152=A0=A0=A0=A0 dark 1152 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 481=A0=A0=A0=A0 free =
0=A0=A0=A0=A0=A0=A0=A0 dirty 2664=A0=A0=A0=A0 used 128280=A0=A0 free + dirt=
y 2664=A0=A0=A0=A0 dark 2664 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0=
 (dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 482=A0=A0=A0=A0 free =
112=A0=A0=A0=A0=A0 dirty 125704=A0=A0 used 5128=A0=A0=A0=A0 free + dirty 12=
5816=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 29=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 483=A0=A0=A0=A0 free =
80=A0=A0=A0=A0=A0=A0 dirty 8288=A0=A0=A0=A0 used 122576=A0=A0 free + dirty =
8368=A0=A0=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 1=A0=A0 flags 0x0=A0 (=
not categorized)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 484=A0=A0=A0=A0 free =
168=A0=A0=A0=A0=A0 dirty 125736=A0=A0 used 5040=A0=A0=A0=A0 free + dirty 12=
5904=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 29=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 485=A0=A0=A0=A0 free =
48=A0=A0=A0=A0=A0=A0 dirty 2696=A0=A0=A0=A0 used 128200=A0=A0 free + dirty =
2744=A0=A0=A0=A0 dark 2744 dead 0=A0=A0=A0 nodes fit 0=A0=A0 flags 0x1=A0 (=
dirty)</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 486=A0=A0=A0=A0 free =
96=A0=A0=A0=A0=A0=A0 dirty 107016=A0=A0 used 23832=A0=A0=A0 free + dirty 10=
7112=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 487=A0=A0=A0=A0 free =
56=A0=A0=A0=A0=A0=A0 dirty 110128=A0=A0 used 20760=A0=A0=A0 free + dirty 11=
0184=A0=A0 dark 4256 dead 0=A0=A0=A0 nodes fit 25=A0 flags 0x1=A0 (dirty)</=
span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">LEB 488=A0=A0=A0=A0 free =
67464=A0=A0=A0 dirty 36960=A0=A0=A0 used 26520=A0=A0=A0 free + dirty 104424=
=A0=A0 flags 0x22 (dirty index)</span><br style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">(pid 958) fini=
sh dumping LEB properties</span><br style=3D"font-family:courier new,monosp=
ace">
<span style=3D"font-family:courier new,monospace">(pid 958) Budgeting info:=
 data budget sum 0, total budget sum 0</span><br style=3D"font-family:couri=
er new,monospace"><span style=3D"font-family:courier new,monospace">=A0=A0=
=A0=A0=A0=A0=A0 budg_data_growth 0, budg_dd_growth 0, budg_idx_growth 0</sp=
an><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 min=
_idx_lebs 19, old_idx_sz 774952, uncommitted_idx 9024</span><br style=3D"fo=
nt-family:courier new,monospace"><span style=3D"font-family:courier new,mon=
ospace">=A0=A0=A0=A0=A0=A0=A0 page_budget 4144, inode_budget 160, dent_budg=
et 312</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 nos=
pace 0, nospace_rp 0</span><br style=3D"font-family:courier new,monospace">=
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 dar=
k_wm 4256, dead_wm 56, max_idx_node_sz 192</span><br style=3D"font-family:c=
ourier new,monospace">
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 fre=
eable_cnt 1, calc_idx_sz 768632, idx_gc_cnt 0</span><br style=3D"font-famil=
y:courier new,monospace"><span style=3D"font-family:courier new,monospace">=
=A0=A0=A0=A0=A0=A0=A0 dirty_pg_cnt 0, dirty_zn_cnt 47, clean_zn_cnt 0</span=
><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 gc_=
lnum -1, ihead_lnum 453</span><br style=3D"font-family:courier new,monospac=
e"><span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 =
jhead 0 (GC)=A0=A0=A0=A0 LEB 237</span><br style=3D"font-family:courier new=
,monospace">
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 jhe=
ad 1 (base)=A0=A0 LEB 293</span><br style=3D"font-family:courier new,monosp=
ace"><span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=
=A0 jhead 2 (data)=A0=A0 LEB 469</span><br style=3D"font-family:courier new=
,monospace">
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 bud=
 LEB 92</span><br style=3D"font-family:courier new,monospace"><span style=
=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 bud LEB 206</s=
pan><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 bud=
 LEB 237</span><br style=3D"font-family:courier new,monospace"><span style=
=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 bud LEB 293</s=
pan><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 bud=
 LEB 312</span><br style=3D"font-family:courier new,monospace"><span style=
=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 bud LEB 412</s=
pan><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 bud=
 LEB 469</span><br style=3D"font-family:courier new,monospace"><span style=
=3D"font-family:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 commit state 0=
</span><br style=3D"font-family:courier new,monospace">
<span style=3D"font-family:courier new,monospace">Budgeting predictions:</s=
pan><br style=3D"font-family:courier new,monospace"><span style=3D"font-fam=
ily:courier new,monospace">=A0=A0=A0=A0=A0=A0=A0 available: 16938560, outst=
anding 0, free 16002679</span><br style=3D"font-family:courier new,monospac=
e">
<span style=3D"font-family:courier new,monospace">mount: No space left on d=
evice</span><br style=3D"font-family:courier new,monospace"><br style=3D"fo=
nt-family:courier new,monospace"><br style=3D"font-family:courier new,monos=
pace">
<br style=3D"font-family:courier new,monospace"><br style=3D"font-family:co=
urier new,monospace">

--f46d044401deb4a7b804c4f6824c--

--f46d044401deb4a7bd04c4f6824e
Content-Type: application/octet-stream; name="ubifs.3.0.diff"
Content-Disposition: attachment; filename="ubifs.3.0.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h4puouvz0

ZGlmZiAtdU4gLXVOciBsaW51eC0zLjAvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy91Ymlmcy50
eHQgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvdWJp
ZnMudHh0Ci0tLSBsaW51eC0zLjAvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy91Ymlmcy50eHQJ
MjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZz
LmxhdGVzdC9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3ViaWZzLnR4dAkyMDEyLTA2LTI4IDEx
OjI2OjE1LjAwMDAwMDAwMCAtMDUwMApAQCAtMTExLDM0ICsxMTEsNiBAQAogdG8gVUJJIGFuZCBt
b3VudCB2b2x1bWUgInJvb3RmcyI6CiB1YmkubXRkPTAgcm9vdD11YmkwOnJvb3RmcyByb290ZnN0
eXBlPXViaWZzCiAKLQotTW9kdWxlIFBhcmFtZXRlcnMgZm9yIERlYnVnZ2luZwotPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQotCi1XaGVuIFVCSUZTIGhhcyBiZWVuIGNvbXBpbGVkIHdp
dGggZGVidWdnaW5nIGVuYWJsZWQsIHRoZXJlIGFyZSAyIG1vZHVsZQotcGFyYW1ldGVycyB0aGF0
IGFyZSBhdmFpbGFibGUgdG8gY29udHJvbCBhc3BlY3RzIG9mIHRlc3RpbmcgYW5kIGRlYnVnZ2lu
Zy4KLQotZGVidWdfY2hrcwlTZWxlY3RzIGV4dHJhIGNoZWNrcyB0aGF0IFVCSUZTIGNhbiBkbyB3
aGlsZSBydW5uaW5nOgotCi0JCUNoZWNrCQkJCQlGbGFnIHZhbHVlCi0KLQkJR2VuZXJhbCBjaGVj
a3MJCQkJMQotCQlDaGVjayBUcmVlIE5vZGUgQ2FjaGUgKFROQykJCTIKLQkJQ2hlY2sgaW5kZXhp
bmcgdHJlZSBzaXplCQk0Ci0JCUNoZWNrIG9ycGhhbiBhcmVhCQkJOAotCQlDaGVjayBvbGQgaW5k
ZXhpbmcgdHJlZQkJCTE2Ci0JCUNoZWNrIExFQiBwcm9wZXJ0aWVzIChscHJvcHMpCQkzMgotCQlD
aGVjayBsZWFmIG5vZGVzIGFuZCBpbm9kZXMJCTY0Ci0KLWRlYnVnX3RzdHMJU2VsZWN0cyBhIG1v
ZGUgb2YgdGVzdGluZywgYXMgZm9sbG93czoKLQotCQlUZXN0IG1vZGUJCQkJRmxhZyB2YWx1ZQot
Ci0JCUZhaWx1cmUgbW9kZSBmb3IgcmVjb3ZlcnkgdGVzdGluZwk0Ci0KLUZvciBleGFtcGxlLCBz
ZXQgZGVidWdfY2hrcyB0byAzIHRvIGVuYWJsZSBnZW5lcmFsIGFuZCBUTkMgY2hlY2tzLgotCi0K
IFJlZmVyZW5jZXMKID09PT09PT09PT0KIApkaWZmIC11TiAtdU5yIGxpbnV4LTMuMC9kcml2ZXJz
L210ZC91YmkvS2NvbmZpZyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJp
L0tjb25maWcKLS0tIGxpbnV4LTMuMC9kcml2ZXJzL210ZC91YmkvS2NvbmZpZwkyMDExLTA3LTIx
IDIxOjE3OjIzLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2Ry
aXZlcnMvbXRkL3ViaS9LY29uZmlnCTIwMTItMDYtMjggMTE6MjY6MTUuMDAwMDAwMDAwIC0wNTAw
CkBAIC01MiwxMiArNTIsNCBAQAogCSAgIHdvcmsgb24gdG9wIG9mIFVCSS4gRG8gbm90IGVuYWJs
ZSB0aGlzIHVubGVzcyB5b3UgdXNlIGxlZ2FjeQogCSAgIHNvZnR3YXJlLgogCi1jb25maWcgTVRE
X1VCSV9ERUJVRwotCWJvb2wgIlVCSSBkZWJ1Z2dpbmciCi0JZGVwZW5kcyBvbiBTWVNGUwotCXNl
bGVjdCBERUJVR19GUwotCXNlbGVjdCBLQUxMU1lNUwotCWhlbHAKLQkgIFRoaXMgb3B0aW9uIGVu
YWJsZXMgVUJJIGRlYnVnZ2luZy4KLQogZW5kaWYgIyBNVERfVUJJCmRpZmYgLXVOIC11TnIgbGlu
dXgtMy4wL2RyaXZlcnMvbXRkL3ViaS9NYWtlZmlsZSBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3Qv
ZHJpdmVycy9tdGQvdWJpL01ha2VmaWxlCi0tLSBsaW51eC0zLjAvZHJpdmVycy9tdGQvdWJpL01h
a2VmaWxlCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAu
eC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL01ha2VmaWxlCTIwMTItMDYtMjggMTE6MjY6
MTUuMDAwMDAwMDAwIC0wNTAwCkBAIC0xLDcgKzEsNiBAQAogb2JqLSQoQ09ORklHX01URF9VQkkp
ICs9IHViaS5vCiAKLXViaS15ICs9IHZ0YmwubyB2bXQubyB1cGQubyBidWlsZC5vIGNkZXYubyBr
YXBpLm8gZWJhLm8gaW8ubyB3bC5vIHNjYW4ubwotdWJpLXkgKz0gbWlzYy5vCit1YmkteSArPSB2
dGJsLm8gdm10Lm8gdXBkLm8gYnVpbGQubyBjZGV2Lm8ga2FwaS5vIGViYS5vIGlvLm8gd2wubyBh
dHRhY2gubwordWJpLXkgKz0gbWlzYy5vIGRlYnVnLm8KIAotdWJpLSQoQ09ORklHX01URF9VQklf
REVCVUcpICs9IGRlYnVnLm8KIG9iai0kKENPTkZJR19NVERfVUJJX0dMVUVCSSkgKz0gZ2x1ZWJp
Lm8KZGlmZiAtdU4gLXVOciBsaW51eC0zLjAvZHJpdmVycy9tdGQvdWJpL2F0dGFjaC5jIGxpbnV4
LTMuMC54LnViaWZzLmxhdGVzdC9kcml2ZXJzL210ZC91YmkvYXR0YWNoLmMKLS0tIGxpbnV4LTMu
MC9kcml2ZXJzL210ZC91YmkvYXR0YWNoLmMJMTk2OS0xMi0zMSAxODowMDowMC4wMDAwMDAwMDAg
LTA2MDAKKysrIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9kcml2ZXJzL210ZC91YmkvYXR0YWNo
LmMJMjAxMi0wNi0yOCAxMToyNjoxNS4wMDAwMDAwMDAgLTA1MDAKQEAgLTAsMCArMSwxNjMxIEBA
CisvKgorICogQ29weXJpZ2h0IChjKSBJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzIENv
cnAuLCAyMDA2CisgKgorICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisgKiB0aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBv
cgorICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqCisgKiBUaGlzIHBy
b2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwK
KyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mCisgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFS
IFBVUlBPU0UuIFNlZQorICogdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3Jl
IGRldGFpbHMuCisgKgorICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBp
ZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCisgKiBGb3VuZGF0aW9uLCBJbmMuLCA1
OSBUZW1wbGUgUGxhY2UsIFN1aXRlIDMzMCwgQm9zdG9uLCBNQSAwMjExMS0xMzA3IFVTQQorICoK
KyAqIEF1dGhvcjogQXJ0ZW0gQml0eXV0c2tpeSAo0JHQuNGC0Y7RhtC60LjQuSDQkNGA0YLRkdC8
KQorICovCisKKy8qCisgKiBVQkkgYXR0YWNoaW5nIHN1Yi1zeXN0ZW0uCisgKgorICogVGhpcyBz
dWItc3lzdGVtIGlzIHJlc3BvbnNpYmxlIGZvciBhdHRhY2hpbmcgTVREIGRldmljZXMgYW5kIGl0
IGFsc28KKyAqIGltcGxlbWVudHMgZmxhc2ggbWVkaWEgc2Nhbm5pbmcuCisgKgorICogVGhlIGF0
dGFjaGluZyBpbmZvcm1hdGlvbiBpcyByZXByZXNlbnRlZCBieSBhICZzdHJ1Y3QgdWJpX2F0dGFj
aF9pbmZvJworICogb2JqZWN0LiBJbmZvcm1hdGlvbiBhYm91dCB2b2x1bWVzIGlzIHJlcHJlc2Vu
dGVkIGJ5ICZzdHJ1Y3QgdWJpX2FpbmZfdm9sdW1lCisgKiBvYmplY3RzIHdoaWNoIGFyZSBrZXB0
IGluIHZvbHVtZSBSQi10cmVlIHdpdGggcm9vdCBhdCB0aGUgQHZvbHVtZXMgZmllbGQuCisgKiBU
aGUgUkItdHJlZSBpcyBpbmRleGVkIGJ5IHRoZSB2b2x1bWUgSUQuCisgKgorICogTG9naWNhbCBl
cmFzZWJsb2NrcyBhcmUgcmVwcmVzZW50ZWQgYnkgJnN0cnVjdCB1YmlfYWluZl9wZWIgb2JqZWN0
cy4gVGhlc2UKKyAqIG9iamVjdHMgYXJlIGtlcHQgaW4gcGVyLXZvbHVtZSBSQi10cmVlcyB3aXRo
IHRoZSByb290IGF0IHRoZSBjb3JyZXNwb25kaW5nCisgKiAmc3RydWN0IHViaV9haW5mX3ZvbHVt
ZSBvYmplY3QuIFRvIHB1dCBpdCBkaWZmZXJlbnRseSwgd2Uga2VlcCBhbiBSQi10cmVlIG9mCisg
KiBwZXItdm9sdW1lIG9iamVjdHMgYW5kIGVhY2ggb2YgdGhlc2Ugb2JqZWN0cyBpcyB0aGUgcm9v
dCBvZiBSQi10cmVlIG9mCisgKiBwZXItTEVCIG9iamVjdHMuCisgKgorICogQ29ycnVwdGVkIHBo
eXNpY2FsIGVyYXNlYmxvY2tzIGFyZSBwdXQgdG8gdGhlIEBjb3JyIGxpc3QsIGZyZWUgcGh5c2lj
YWwKKyAqIGVyYXNlYmxvY2tzIGFyZSBwdXQgdG8gdGhlIEBmcmVlIGxpc3QgYW5kIHRoZSBwaHlz
aWNhbCBlcmFzZWJsb2NrIHRvIGJlCisgKiBlcmFzZWQgYXJlIHB1dCB0byB0aGUgQGVyYXNlIGxp
c3QuCisgKgorICogQWJvdXQgY29ycnVwdGlvbnMKKyAqIH5+fn5+fn5+fn5+fn5+fn5+CisgKgor
ICogVUJJIHByb3RlY3RzIEVDIGFuZCBWSUQgaGVhZGVycyB3aXRoIENSQy0zMiBjaGVja3N1bXMs
IHNvIGl0IGNhbiBkZXRlY3QKKyAqIHdoZXRoZXIgdGhlIGhlYWRlcnMgYXJlIGNvcnJ1cHRlZCBv
ciBub3QuIFNvbWV0aW1lcyBVQkkgYWxzbyBwcm90ZWN0cyB0aGUKKyAqIGRhdGEgd2l0aCBDUkMt
MzIsIGUuZy4sIHdoZW4gaXQgZXhlY3V0ZXMgdGhlIGF0b21pYyBMRUIgY2hhbmdlIG9wZXJhdGlv
biwgb3IKKyAqIHdoZW4gaXQgbW92ZXMgdGhlIGNvbnRlbnRzIG9mIGEgUEVCIGZvciB3ZWFyLWxl
dmVsaW5nIHB1cnBvc2VzLgorICoKKyAqIFVCSSB0cmllcyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVu
IDIgdHlwZXMgb2YgY29ycnVwdGlvbnMuCisgKgorICogMS4gQ29ycnVwdGlvbnMgY2F1c2VkIGJ5
IHBvd2VyIGN1dHMuIFRoZXNlIGFyZSBleHBlY3RlZCBjb3JydXB0aW9ucyBhbmQgVUJJCisgKiB0
cmllcyB0byBoYW5kbGUgdGhlbSBncmFjZWZ1bGx5LCB3aXRob3V0IHByaW50aW5nIHRvbyBtYW55
IHdhcm5pbmdzIGFuZAorICogZXJyb3IgbWVzc2FnZXMuIFRoZSBpZGVhIGlzIHRoYXQgd2UgZG8g
bm90IGxvc2UgaW1wb3J0YW50IGRhdGEgaW4gdGhlc2UKKyAqIGNhc2VzIC0gd2UgbWF5IGxvc2Ug
b25seSB0aGUgZGF0YSB3aGljaCB3ZXJlIGJlaW5nIHdyaXR0ZW4gdG8gdGhlIG1lZGlhIGp1c3QK
KyAqIGJlZm9yZSB0aGUgcG93ZXIgY3V0IGhhcHBlbmVkLCBhbmQgdGhlIHVwcGVyIGxheWVycyAo
ZS5nLiwgVUJJRlMpIGFyZQorICogc3VwcG9zZWQgdG8gaGFuZGxlIHN1Y2ggZGF0YSBsb3NzZXMg
KGUuZy4sIGJ5IHVzaW5nIHRoZSBGUyBqb3VybmFsKS4KKyAqCisgKiBXaGVuIFVCSSBkZXRlY3Rz
IGEgY29ycnVwdGlvbiAoQ1JDLTMyIG1pc21hdGNoKSBpbiBhIFBFQiwgYW5kIGl0IGxvb2tzIGxp
a2UKKyAqIHRoZSByZWFzb24gaXMgYSBwb3dlciBjdXQsIFVCSSBwdXRzIHRoaXMgUEVCIHRvIHRo
ZSBAZXJhc2UgbGlzdCwgYW5kIGFsbAorICogUEVCcyBpbiB0aGUgQGVyYXNlIGxpc3QgYXJlIHNj
aGVkdWxlZCBmb3IgZXJhc3VyZSBsYXRlci4KKyAqCisgKiAyLiBVbmV4cGVjdGVkIGNvcnJ1cHRp
b25zIHdoaWNoIGFyZSBub3QgY2F1c2VkIGJ5IHBvd2VyIGN1dHMuIER1cmluZworICogYXR0YWNo
aW5nLCBzdWNoIFBFQnMgYXJlIHB1dCB0byB0aGUgQGNvcnIgbGlzdCBhbmQgVUJJIHByZXNlcnZl
cyB0aGVtLgorICogT2J2aW91c2x5LCB0aGlzIGxlc3NlbnMgdGhlIGFtb3VudCBvZiBhdmFpbGFi
bGUgUEVCcywgYW5kIGlmIGF0IHNvbWUgIHBvaW50CisgKiBVQkkgcnVucyBvdXQgb2YgZnJlZSBQ
RUJzLCBpdCBzd2l0Y2hlcyB0byBSL08gbW9kZS4gVUJJIGFsc28gbG91ZGx5IGluZm9ybXMKKyAq
IGFib3V0IHN1Y2ggUEVCcyBldmVyeSB0aW1lIHRoZSBNVEQgZGV2aWNlIGlzIGF0dGFjaGVkLgor
ICoKKyAqIEhvd2V2ZXIsIGl0IGlzIGRpZmZpY3VsdCB0byByZWxpYWJseSBkaXN0aW5ndWlzaCBi
ZXR3ZWVuIHRoZXNlIHR5cGVzIG9mCisgKiBjb3JydXB0aW9ucyBhbmQgVUJJJ3Mgc3RyYXRlZ3kg
aXMgYXMgZm9sbG93cyAoaW4gY2FzZSBvZiBhdHRhY2hpbmcgYnkKKyAqIHNjYW5uaW5nKS4gVUJJ
IGFzc3VtZXMgY29ycnVwdGlvbiB0eXBlIDIgaWYgdGhlIFZJRCBoZWFkZXIgaXMgY29ycnVwdGVk
IGFuZAorICogdGhlIGRhdGEgYXJlYSBkb2VzIG5vdCBjb250YWluIGFsbCAweEZGcywgYW5kIHRo
ZXJlIHdlcmUgbm8gYml0LWZsaXBzIG9yCisgKiBpbnRlZ3JpdHkgZXJyb3JzIChlLmcuLCBFQ0Mg
ZXJyb3JzIGluIGNhc2Ugb2YgTkFORCkgd2hpbGUgcmVhZGluZyB0aGUgZGF0YQorICogYXJlYS4g
IE90aGVyd2lzZSBVQkkgYXNzdW1lcyBjb3JydXB0aW9uIHR5cGUgMS4gU28gdGhlIGRlY2lzaW9u
IGNyaXRlcmlhCisgKiBhcmUgYXMgZm9sbG93cy4KKyAqICAgbyBJZiB0aGUgZGF0YSBhcmVhIGNv
bnRhaW5zIG9ubHkgMHhGRnMsIHRoZXJlIGFyZSBubyBkYXRhLCBhbmQgaXQgaXMgc2FmZQorICog
ICAgIHRvIGp1c3QgZXJhc2UgdGhpcyBQRUIgLSB0aGlzIGlzIGNvcnJ1cHRpb24gdHlwZSAxLgor
ICogICBvIElmIHRoZSBkYXRhIGFyZWEgaGFzIGJpdC1mbGlwcyBvciBkYXRhIGludGVncml0eSBl
cnJvcnMgKEVDQyBlcnJvcnMgb24KKyAqICAgICBOQU5EKSwgaXQgaXMgcHJvYmFibHkgYSBQRUIg
d2hpY2ggd2FzIGJlaW5nIGVyYXNlZCB3aGVuIHBvd2VyIGN1dAorICogICAgIGhhcHBlbmVkLCBz
byB0aGlzIGlzIGNvcnJ1cHRpb24gdHlwZSAxLiBIb3dldmVyLCB0aGlzIGlzIGp1c3QgYSBndWVz
cywKKyAqICAgICB3aGljaCBtaWdodCBiZSB3cm9uZy4KKyAqICAgbyBPdGhlcndpc2UgdGhpcyBp
dCBjb3JydXB0aW9uIHR5cGUgMi4KKyAqLworCisjaW5jbHVkZSA8bGludXgvZXJyLmg+CisjaW5j
bHVkZSA8bGludXgvc2xhYi5oPgorI2luY2x1ZGUgPGxpbnV4L2NyYzMyLmg+CisjaW5jbHVkZSA8
bGludXgvbWF0aDY0Lmg+CisjaW5jbHVkZSA8bGludXgvcmFuZG9tLmg+CisjaW5jbHVkZSAidWJp
LmgiCisKK3N0YXRpYyBpbnQgc2VsZl9jaGVja19haShzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBz
dHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSk7CisKKy8qIFRlbXBvcmFyeSB2YXJpYWJsZXMgdXNl
ZCBkdXJpbmcgc2Nhbm5pbmcgKi8KK3N0YXRpYyBzdHJ1Y3QgdWJpX2VjX2hkciAqZWNoOworc3Rh
dGljIHN0cnVjdCB1YmlfdmlkX2hkciAqdmlkaDsKKworLyoqCisgKiBhZGRfdG9fbGlzdCAtIGFk
ZCBwaHlzaWNhbCBlcmFzZWJsb2NrIHRvIGEgbGlzdC4KKyAqIEBhaTogYXR0YWNoaW5nIGluZm9y
bWF0aW9uCisgKiBAcG51bTogcGh5c2ljYWwgZXJhc2VibG9jayBudW1iZXIgdG8gYWRkCisgKiBA
dm9sX2lkOiB0aGUgbGFzdCB1c2VkIHZvbHVtZSBpZCBmb3IgdGhlIFBFQgorICogQGxudW06IHRo
ZSBsYXN0IHVzZWQgTEVCIG51bWJlciBmb3IgdGhlIFBFQgorICogQGVjOiBlcmFzZSBjb3VudGVy
IG9mIHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrCisgKiBAdG9faGVhZDogaWYgbm90IHplcm8sIGFk
ZCB0byB0aGUgaGVhZCBvZiB0aGUgbGlzdAorICogQGxpc3Q6IHRoZSBsaXN0IHRvIGFkZCB0bwor
ICoKKyAqIFRoaXMgZnVuY3Rpb24gYWxsb2NhdGVzIGEgJ3N0cnVjdCB1YmlfYWluZl9wZWInIG9i
amVjdCBmb3IgcGh5c2ljYWwKKyAqIGVyYXNlYmxvY2sgQHBudW0gYW5kIGFkZHMgaXQgdG8gdGhl
ICJmcmVlIiwgImVyYXNlIiwgb3IgImFsaWVuIiBsaXN0cy4KKyAqIEl0IHN0b3JlcyB0aGUgQGxu
dW0gYW5kIEB2b2xfaWQgYWxvbmdzaWRlLCB3aGljaCBjYW4gYm90aCBiZQorICogJVVCSV9VTktO
T1dOIGlmIHRoZXkgYXJlIG5vdCBhdmFpbGFibGUsIG5vdCByZWFkYWJsZSwgb3Igbm90IGFzc2ln
bmVkLgorICogSWYgQHRvX2hlYWQgaXMgbm90IHplcm8sIFBFQiB3aWxsIGJlIGFkZGVkIHRvIHRo
ZSBoZWFkIG9mIHRoZSBsaXN0LCB3aGljaAorICogYmFzaWNhbGx5IG1lYW5zIGl0IHdpbGwgYmUg
cHJvY2Vzc2VkIGZpcnN0IGxhdGVyLiBFLmcuLCB3ZSBhZGQgY29ycnVwdGVkCisgKiBQRUJzIChj
b3JydXB0ZWQgZHVlIHRvIHBvd2VyIGN1dHMpIHRvIHRoZSBoZWFkIG9mIHRoZSBlcmFzZSBsaXN0
IHRvIG1ha2UKKyAqIHN1cmUgd2UgZXJhc2UgdGhlbSBmaXJzdCBhbmQgZ2V0IHJpZCBvZiBjb3Jy
dXB0aW9ucyBBU0FQLiBUaGlzIGZ1bmN0aW9uCisgKiByZXR1cm5zIHplcm8gaW4gY2FzZSBvZiBz
dWNjZXNzIGFuZCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgaW4gY2FzZSBvZgorICogZmFpbHVyZS4K
KyAqLworc3RhdGljIGludCBhZGRfdG9fbGlzdChzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSwg
aW50IHBudW0sIGludCB2b2xfaWQsCisJCSAgICAgICBpbnQgbG51bSwgaW50IGVjLCBpbnQgdG9f
aGVhZCwgc3RydWN0IGxpc3RfaGVhZCAqbGlzdCkKK3sKKwlzdHJ1Y3QgdWJpX2FpbmZfcGViICph
ZWI7CisKKwlpZiAobGlzdCA9PSAmYWktPmZyZWUpIHsKKwkJZGJnX2JsZCgiYWRkIHRvIGZyZWU6
IFBFQiAlZCwgRUMgJWQiLCBwbnVtLCBlYyk7CisJfSBlbHNlIGlmIChsaXN0ID09ICZhaS0+ZXJh
c2UpIHsKKwkJZGJnX2JsZCgiYWRkIHRvIGVyYXNlOiBQRUIgJWQsIEVDICVkIiwgcG51bSwgZWMp
OworCX0gZWxzZSBpZiAobGlzdCA9PSAmYWktPmFsaWVuKSB7CisJCWRiZ19ibGQoImFkZCB0byBh
bGllbjogUEVCICVkLCBFQyAlZCIsIHBudW0sIGVjKTsKKwkJYWktPmFsaWVuX3BlYl9jb3VudCAr
PSAxOworCX0gZWxzZQorCQlCVUcoKTsKKworCWFlYiA9IGttZW1fY2FjaGVfYWxsb2MoYWktPmFl
Yl9zbGFiX2NhY2hlLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWFlYikKKwkJcmV0dXJuIC1FTk9NRU07
CisKKwlhZWItPnBudW0gPSBwbnVtOworCWFlYi0+dm9sX2lkID0gdm9sX2lkOworCWFlYi0+bG51
bSA9IGxudW07CisJYWViLT5lYyA9IGVjOworCWlmICh0b19oZWFkKQorCQlsaXN0X2FkZCgmYWVi
LT51Lmxpc3QsIGxpc3QpOworCWVsc2UKKwkJbGlzdF9hZGRfdGFpbCgmYWViLT51Lmxpc3QsIGxp
c3QpOworCXJldHVybiAwOworfQorCisvKioKKyAqIGFkZF9jb3JydXB0ZWQgLSBhZGQgYSBjb3Jy
dXB0ZWQgcGh5c2ljYWwgZXJhc2VibG9jay4KKyAqIEBhaTogYXR0YWNoaW5nIGluZm9ybWF0aW9u
CisgKiBAcG51bTogcGh5c2ljYWwgZXJhc2VibG9jayBudW1iZXIgdG8gYWRkCisgKiBAZWM6IGVy
YXNlIGNvdW50ZXIgb2YgdGhlIHBoeXNpY2FsIGVyYXNlYmxvY2sKKyAqCisgKiBUaGlzIGZ1bmN0
aW9uIGFsbG9jYXRlcyBhICdzdHJ1Y3QgdWJpX2FpbmZfcGViJyBvYmplY3QgZm9yIGEgY29ycnVw
dGVkCisgKiBwaHlzaWNhbCBlcmFzZWJsb2NrIEBwbnVtIGFuZCBhZGRzIGl0IHRvIHRoZSAnY29y
cicgbGlzdC4gIFRoZSBjb3JydXB0aW9uCisgKiB3YXMgcHJlc3VtYWJseSBub3QgY2F1c2VkIGJ5
IGEgcG93ZXIgY3V0LiBSZXR1cm5zIHplcm8gaW4gY2FzZSBvZiBzdWNjZXNzCisgKiBhbmQgYSBu
ZWdhdGl2ZSBlcnJvciBjb2RlIGluIGNhc2Ugb2YgZmFpbHVyZS4KKyAqLworc3RhdGljIGludCBh
ZGRfY29ycnVwdGVkKHN0cnVjdCB1YmlfYXR0YWNoX2luZm8gKmFpLCBpbnQgcG51bSwgaW50IGVj
KQoreworCXN0cnVjdCB1YmlfYWluZl9wZWIgKmFlYjsKKworCWRiZ19ibGQoImFkZCB0byBjb3Jy
dXB0ZWQ6IFBFQiAlZCwgRUMgJWQiLCBwbnVtLCBlYyk7CisKKwlhZWIgPSBrbWVtX2NhY2hlX2Fs
bG9jKGFpLT5hZWJfc2xhYl9jYWNoZSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFhZWIpCisJCXJldHVy
biAtRU5PTUVNOworCisJYWktPmNvcnJfcGViX2NvdW50ICs9IDE7CisJYWViLT5wbnVtID0gcG51
bTsKKwlhZWItPmVjID0gZWM7CisJbGlzdF9hZGQoJmFlYi0+dS5saXN0LCAmYWktPmNvcnIpOwor
CXJldHVybiAwOworfQorCisvKioKKyAqIHZhbGlkYXRlX3ZpZF9oZHIgLSBjaGVjayB2b2x1bWUg
aWRlbnRpZmllciBoZWFkZXIuCisgKiBAdmlkX2hkcjogdGhlIHZvbHVtZSBpZGVudGlmaWVyIGhl
YWRlciB0byBjaGVjaworICogQGF2OiBpbmZvcm1hdGlvbiBhYm91dCB0aGUgdm9sdW1lIHRoaXMg
bG9naWNhbCBlcmFzZWJsb2NrIGJlbG9uZ3MgdG8KKyAqIEBwbnVtOiBwaHlzaWNhbCBlcmFzZWJs
b2NrIG51bWJlciB0aGUgVklEIGhlYWRlciBjYW1lIGZyb20KKyAqCisgKiBUaGlzIGZ1bmN0aW9u
IGNoZWNrcyB0aGF0IGRhdGEgc3RvcmVkIGluIEB2aWRfaGRyIGlzIGNvbnNpc3RlbnQuIFJldHVy
bnMKKyAqIG5vbi16ZXJvIGlmIGFuIGluY29uc2lzdGVuY3kgd2FzIGZvdW5kIGFuZCB6ZXJvIGlm
IG5vdC4KKyAqCisgKiBOb3RlLCBVQkkgZG9lcyBzYW5pdHkgY2hlY2sgb2YgZXZlcnl0aGluZyBp
dCByZWFkcyBmcm9tIHRoZSBmbGFzaCBtZWRpYS4KKyAqIE1vc3Qgb2YgdGhlIGNoZWNrcyBhcmUg
ZG9uZSBpbiB0aGUgSS9PIHN1Yi1zeXN0ZW0uIEhlcmUgd2UgY2hlY2sgdGhhdCB0aGUKKyAqIGlu
Zm9ybWF0aW9uIGluIHRoZSBWSUQgaGVhZGVyIGlzIGNvbnNpc3RlbnQgdG8gdGhlIGluZm9ybWF0
aW9uIGluIG90aGVyIFZJRAorICogaGVhZGVycyBvZiB0aGUgc2FtZSB2b2x1bWUuCisgKi8KK3N0
YXRpYyBpbnQgdmFsaWRhdGVfdmlkX2hkcihjb25zdCBzdHJ1Y3QgdWJpX3ZpZF9oZHIgKnZpZF9o
ZHIsCisJCQkgICAgY29uc3Qgc3RydWN0IHViaV9haW5mX3ZvbHVtZSAqYXYsIGludCBwbnVtKQor
eworCWludCB2b2xfdHlwZSA9IHZpZF9oZHItPnZvbF90eXBlOworCWludCB2b2xfaWQgPSBiZTMy
X3RvX2NwdSh2aWRfaGRyLT52b2xfaWQpOworCWludCB1c2VkX2VicyA9IGJlMzJfdG9fY3B1KHZp
ZF9oZHItPnVzZWRfZWJzKTsKKwlpbnQgZGF0YV9wYWQgPSBiZTMyX3RvX2NwdSh2aWRfaGRyLT5k
YXRhX3BhZCk7CisKKwlpZiAoYXYtPmxlYl9jb3VudCAhPSAwKSB7CisJCWludCBhdl92b2xfdHlw
ZTsKKworCQkvKgorCQkgKiBUaGlzIGlzIG5vdCB0aGUgZmlyc3QgbG9naWNhbCBlcmFzZWJsb2Nr
IGJlbG9uZ2luZyB0byB0aGlzCisJCSAqIHZvbHVtZS4gRW5zdXJlIHRoYXQgdGhlIGRhdGEgaW4g
aXRzIFZJRCBoZWFkZXIgaXMgY29uc2lzdGVudAorCQkgKiB0byB0aGUgZGF0YSBpbiBwcmV2aW91
cyBsb2dpY2FsIGVyYXNlYmxvY2sgaGVhZGVycy4KKwkJICovCisKKwkJaWYgKHZvbF9pZCAhPSBh
di0+dm9sX2lkKSB7CisJCQl1YmlfZXJyKCJpbmNvbnNpc3RlbnQgdm9sX2lkIik7CisJCQlnb3Rv
IGJhZDsKKwkJfQorCisJCWlmIChhdi0+dm9sX3R5cGUgPT0gVUJJX1NUQVRJQ19WT0xVTUUpCisJ
CQlhdl92b2xfdHlwZSA9IFVCSV9WSURfU1RBVElDOworCQllbHNlCisJCQlhdl92b2xfdHlwZSA9
IFVCSV9WSURfRFlOQU1JQzsKKworCQlpZiAodm9sX3R5cGUgIT0gYXZfdm9sX3R5cGUpIHsKKwkJ
CXViaV9lcnIoImluY29uc2lzdGVudCB2b2xfdHlwZSIpOworCQkJZ290byBiYWQ7CisJCX0KKwor
CQlpZiAodXNlZF9lYnMgIT0gYXYtPnVzZWRfZWJzKSB7CisJCQl1YmlfZXJyKCJpbmNvbnNpc3Rl
bnQgdXNlZF9lYnMiKTsKKwkJCWdvdG8gYmFkOworCQl9CisKKwkJaWYgKGRhdGFfcGFkICE9IGF2
LT5kYXRhX3BhZCkgeworCQkJdWJpX2VycigiaW5jb25zaXN0ZW50IGRhdGFfcGFkIik7CisJCQln
b3RvIGJhZDsKKwkJfQorCX0KKworCXJldHVybiAwOworCitiYWQ6CisJdWJpX2VycigiaW5jb25z
aXN0ZW50IFZJRCBoZWFkZXIgYXQgUEVCICVkIiwgcG51bSk7CisJdWJpX2R1bXBfdmlkX2hkcih2
aWRfaGRyKTsKKwl1YmlfZHVtcF9hdihhdik7CisJcmV0dXJuIC1FSU5WQUw7Cit9CisKKy8qKgor
ICogYWRkX3ZvbHVtZSAtIGFkZCB2b2x1bWUgdG8gdGhlIGF0dGFjaGluZyBpbmZvcm1hdGlvbi4K
KyAqIEBhaTogYXR0YWNoaW5nIGluZm9ybWF0aW9uCisgKiBAdm9sX2lkOiBJRCBvZiB0aGUgdm9s
dW1lIHRvIGFkZAorICogQHBudW06IHBoeXNpY2FsIGVyYXNlYmxvY2sgbnVtYmVyCisgKiBAdmlk
X2hkcjogdm9sdW1lIGlkZW50aWZpZXIgaGVhZGVyCisgKgorICogSWYgdGhlIHZvbHVtZSBjb3Jy
ZXNwb25kaW5nIHRvIHRoZSBAdmlkX2hkciBsb2dpY2FsIGVyYXNlYmxvY2sgaXMgYWxyZWFkeQor
ICogcHJlc2VudCBpbiB0aGUgYXR0YWNoaW5nIGluZm9ybWF0aW9uLCB0aGlzIGZ1bmN0aW9uIGRv
ZXMgbm90aGluZy4gT3RoZXJ3aXNlCisgKiBpdCBhZGRzIGNvcnJlc3BvbmRpbmcgdm9sdW1lIHRv
IHRoZSBhdHRhY2hpbmcgaW5mb3JtYXRpb24uIFJldHVybnMgYSBwb2ludGVyCisgKiB0byB0aGUg
YWxsb2NhdGVkICJhdiIgb2JqZWN0IGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBl
cnJvciBjb2RlIGluCisgKiBjYXNlIG9mIGZhaWx1cmUuCisgKi8KK3N0YXRpYyBzdHJ1Y3QgdWJp
X2FpbmZfdm9sdW1lICphZGRfdm9sdW1lKHN0cnVjdCB1YmlfYXR0YWNoX2luZm8gKmFpLAorCQkJ
CQkgIGludCB2b2xfaWQsIGludCBwbnVtLAorCQkJCQkgIGNvbnN0IHN0cnVjdCB1YmlfdmlkX2hk
ciAqdmlkX2hkcikKK3sKKwlzdHJ1Y3QgdWJpX2FpbmZfdm9sdW1lICphdjsKKwlzdHJ1Y3QgcmJf
bm9kZSAqKnAgPSAmYWktPnZvbHVtZXMucmJfbm9kZSwgKnBhcmVudCA9IE5VTEw7CisKKwl1Ymlf
YXNzZXJ0KHZvbF9pZCA9PSBiZTMyX3RvX2NwdSh2aWRfaGRyLT52b2xfaWQpKTsKKworCS8qIFdh
bGsgdGhlIHZvbHVtZSBSQi10cmVlIHRvIGxvb2sgaWYgdGhpcyB2b2x1bWUgaXMgYWxyZWFkeSBw
cmVzZW50ICovCisJd2hpbGUgKCpwKSB7CisJCXBhcmVudCA9ICpwOworCQlhdiA9IHJiX2VudHJ5
KHBhcmVudCwgc3RydWN0IHViaV9haW5mX3ZvbHVtZSwgcmIpOworCisJCWlmICh2b2xfaWQgPT0g
YXYtPnZvbF9pZCkKKwkJCXJldHVybiBhdjsKKworCQlpZiAodm9sX2lkID4gYXYtPnZvbF9pZCkK
KwkJCXAgPSAmKCpwKS0+cmJfbGVmdDsKKwkJZWxzZQorCQkJcCA9ICYoKnApLT5yYl9yaWdodDsK
Kwl9CisKKwkvKiBUaGUgdm9sdW1lIGlzIGFic2VudCAtIGFkZCBpdCAqLworCWF2ID0ga21hbGxv
YyhzaXplb2Yoc3RydWN0IHViaV9haW5mX3ZvbHVtZSksIEdGUF9LRVJORUwpOworCWlmICghYXYp
CisJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOworCisJYXYtPmhpZ2hlc3RfbG51bSA9IGF2LT5s
ZWJfY291bnQgPSAwOworCWF2LT52b2xfaWQgPSB2b2xfaWQ7CisJYXYtPnJvb3QgPSBSQl9ST09U
OworCWF2LT51c2VkX2VicyA9IGJlMzJfdG9fY3B1KHZpZF9oZHItPnVzZWRfZWJzKTsKKwlhdi0+
ZGF0YV9wYWQgPSBiZTMyX3RvX2NwdSh2aWRfaGRyLT5kYXRhX3BhZCk7CisJYXYtPmNvbXBhdCA9
IHZpZF9oZHItPmNvbXBhdDsKKwlhdi0+dm9sX3R5cGUgPSB2aWRfaGRyLT52b2xfdHlwZSA9PSBV
QklfVklEX0RZTkFNSUMgPyBVQklfRFlOQU1JQ19WT0xVTUUKKwkJCQkJCQkgICAgOiBVQklfU1RB
VElDX1ZPTFVNRTsKKwlpZiAodm9sX2lkID4gYWktPmhpZ2hlc3Rfdm9sX2lkKQorCQlhaS0+aGln
aGVzdF92b2xfaWQgPSB2b2xfaWQ7CisKKwlyYl9saW5rX25vZGUoJmF2LT5yYiwgcGFyZW50LCBw
KTsKKwlyYl9pbnNlcnRfY29sb3IoJmF2LT5yYiwgJmFpLT52b2x1bWVzKTsKKwlhaS0+dm9sc19m
b3VuZCArPSAxOworCWRiZ19ibGQoImFkZGVkIHZvbHVtZSAlZCIsIHZvbF9pZCk7CisJcmV0dXJu
IGF2OworfQorCisvKioKKyAqIGNvbXBhcmVfbGVicyAtIGZpbmQgb3V0IHdoaWNoIGxvZ2ljYWwg
ZXJhc2VibG9jayBpcyBuZXdlci4KKyAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2Jq
ZWN0CisgKiBAYWViOiBmaXJzdCBsb2dpY2FsIGVyYXNlYmxvY2sgdG8gY29tcGFyZQorICogQHBu
dW06IHBoeXNpY2FsIGVyYXNlYmxvY2sgbnVtYmVyIG9mIHRoZSBzZWNvbmQgbG9naWNhbCBlcmFz
ZWJsb2NrIHRvCisgKiBjb21wYXJlCisgKiBAdmlkX2hkcjogdm9sdW1lIGlkZW50aWZpZXIgaGVh
ZGVyIG9mIHRoZSBzZWNvbmQgbG9naWNhbCBlcmFzZWJsb2NrCisgKgorICogVGhpcyBmdW5jdGlv
biBjb21wYXJlcyAyIGNvcGllcyBvZiBhIExFQiBhbmQgaW5mb3JtcyB3aGljaCBvbmUgaXMgbmV3
ZXIuIEluCisgKiBjYXNlIG9mIHN1Y2Nlc3MgdGhpcyBmdW5jdGlvbiByZXR1cm5zIGEgcG9zaXRp
dmUgdmFsdWUsIGluIGNhc2Ugb2YgZmFpbHVyZSwgYQorICogbmVnYXRpdmUgZXJyb3IgY29kZSBp
cyByZXR1cm5lZC4gVGhlIHN1Y2Nlc3MgcmV0dXJuIGNvZGVzIHVzZSB0aGUgZm9sbG93aW5nCisg
KiBiaXRzOgorICogICAgIG8gYml0IDAgaXMgY2xlYXJlZDogdGhlIGZpcnN0IFBFQiAoZGVzY3Jp
YmVkIGJ5IEBhZWIpIGlzIG5ld2VyIHRoYW4gdGhlCisgKiAgICAgICBzZWNvbmQgUEVCIChkZXNj
cmliZWQgYnkgQHBudW0gYW5kIEB2aWRfaGRyKTsKKyAqICAgICBvIGJpdCAwIGlzIHNldDogdGhl
IHNlY29uZCBQRUIgaXMgbmV3ZXI7CisgKiAgICAgbyBiaXQgMSBpcyBjbGVhcmVkOiBubyBiaXQt
ZmxpcHMgd2VyZSBkZXRlY3RlZCBpbiB0aGUgbmV3ZXIgTEVCOworICogICAgIG8gYml0IDEgaXMg
c2V0OiBiaXQtZmxpcHMgd2VyZSBkZXRlY3RlZCBpbiB0aGUgbmV3ZXIgTEVCOworICogICAgIG8g
Yml0IDIgaXMgY2xlYXJlZDogdGhlIG9sZGVyIExFQiBpcyBub3QgY29ycnVwdGVkOworICogICAg
IG8gYml0IDIgaXMgc2V0OiB0aGUgb2xkZXIgTEVCIGlzIGNvcnJ1cHRlZC4KKyAqLworc3RhdGlj
IGludCBjb21wYXJlX2xlYnMoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgY29uc3Qgc3RydWN0IHVi
aV9haW5mX3BlYiAqYWViLAorCQkJaW50IHBudW0sIGNvbnN0IHN0cnVjdCB1YmlfdmlkX2hkciAq
dmlkX2hkcikKK3sKKwl2b2lkICpidWY7CisJaW50IGxlbiwgZXJyLCBzZWNvbmRfaXNfbmV3ZXIs
IGJpdGZsaXBzID0gMCwgY29ycnVwdGVkID0gMDsKKwl1aW50MzJfdCBkYXRhX2NyYywgY3JjOwor
CXN0cnVjdCB1YmlfdmlkX2hkciAqdmggPSBOVUxMOworCXVuc2lnbmVkIGxvbmcgbG9uZyBzcW51
bTIgPSBiZTY0X3RvX2NwdSh2aWRfaGRyLT5zcW51bSk7CisKKwlpZiAoc3FudW0yID09IGFlYi0+
c3FudW0pIHsKKwkJLyoKKwkJICogVGhpcyBtdXN0IGJlIGEgcmVhbGx5IGFuY2llbnQgVUJJIGlt
YWdlIHdoaWNoIGhhcyBiZWVuCisJCSAqIGNyZWF0ZWQgYmVmb3JlIHNlcXVlbmNlIG51bWJlcnMg
c3VwcG9ydCBoYXMgYmVlbiBhZGRlZC4gQXQKKwkJICogdGhhdCB0aW1lcyB3ZSB1c2VkIDMyLWJp
dCBMRUIgdmVyc2lvbnMgc3RvcmVkIGluIGxvZ2ljYWwKKwkJICogZXJhc2VibG9ja3MuIFRoYXQg
d2FzIGJlZm9yZSBVQkkgZ290IGludG8gbWFpbmxpbmUuIFdlIGRvIG5vdAorCQkgKiBzdXBwb3J0
IHRoZXNlIGltYWdlcyBhbnltb3JlLiBXZWxsLCB0aG9zZSBpbWFnZXMgc3RpbGwgd29yaywKKwkJ
ICogYnV0IG9ubHkgaWYgbm8gdW5jbGVhbiByZWJvb3RzIGhhcHBlbmVkLgorCQkgKi8KKwkJdWJp
X2VycigidW5zdXBwb3J0ZWQgb24tZmxhc2ggVUJJIGZvcm1hdFxuIik7CisJCXJldHVybiAtRUlO
VkFMOworCX0KKworCS8qIE9idmlvdXNseSB0aGUgTEVCIHdpdGggbG93ZXIgc2VxdWVuY2UgY291
bnRlciBpcyBvbGRlciAqLworCXNlY29uZF9pc19uZXdlciA9IChzcW51bTIgPiBhZWItPnNxbnVt
KTsKKworCS8qCisJICogTm93IHdlIGtub3cgd2hpY2ggY29weSBpcyBuZXdlci4gSWYgdGhlIGNv
cHkgZmxhZyBvZiB0aGUgUEVCIHdpdGgKKwkgKiBuZXdlciB2ZXJzaW9uIGlzIG5vdCBzZXQsIHRo
ZW4gd2UganVzdCByZXR1cm4sIG90aGVyd2lzZSB3ZSBoYXZlIHRvCisJICogY2hlY2sgZGF0YSBD
UkMuIEZvciB0aGUgc2Vjb25kIFBFQiB3ZSBhbHJlYWR5IGhhdmUgdGhlIFZJRCBoZWFkZXIsCisJ
ICogZm9yIHRoZSBmaXJzdCBvbmUgLSB3ZSdsbCBuZWVkIHRvIHJlLXJlYWQgaXQgZnJvbSBmbGFz
aC4KKwkgKgorCSAqIE5vdGU6IHRoaXMgbWF5IGJlIG9wdGltaXplZCBzbyB0aGF0IHdlIHdvdWxk
bid0IHJlYWQgdHdpY2UuCisJICovCisKKwlpZiAoc2Vjb25kX2lzX25ld2VyKSB7CisJCWlmICgh
dmlkX2hkci0+Y29weV9mbGFnKSB7CisJCQkvKiBJdCBpcyBub3QgYSBjb3B5LCBzbyBpdCBpcyBu
ZXdlciAqLworCQkJZGJnX2JsZCgic2Vjb25kIFBFQiAlZCBpcyBuZXdlciwgY29weV9mbGFnIGlz
IHVuc2V0IiwKKwkJCQlwbnVtKTsKKwkJCXJldHVybiAxOworCQl9CisJfSBlbHNlIHsKKwkJaWYg
KCFhZWItPmNvcHlfZmxhZykgeworCQkJLyogSXQgaXMgbm90IGEgY29weSwgc28gaXQgaXMgbmV3
ZXIgKi8KKwkJCWRiZ19ibGQoImZpcnN0IFBFQiAlZCBpcyBuZXdlciwgY29weV9mbGFnIGlzIHVu
c2V0IiwKKwkJCQlwbnVtKTsKKwkJCXJldHVybiBiaXRmbGlwcyA8PCAxOworCQl9CisKKwkJdmgg
PSB1YmlfemFsbG9jX3ZpZF9oZHIodWJpLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCF2aCkKKwkJCXJl
dHVybiAtRU5PTUVNOworCisJCXBudW0gPSBhZWItPnBudW07CisJCWVyciA9IHViaV9pb19yZWFk
X3ZpZF9oZHIodWJpLCBwbnVtLCB2aCwgMCk7CisJCWlmIChlcnIpIHsKKwkJCWlmIChlcnIgPT0g
VUJJX0lPX0JJVEZMSVBTKQorCQkJCWJpdGZsaXBzID0gMTsKKwkJCWVsc2UgeworCQkJCXViaV9l
cnIoIlZJRCBvZiBQRUIgJWQgaGVhZGVyIGlzIGJhZCwgYnV0IGl0ICIKKwkJCQkJIndhcyBPSyBl
YXJsaWVyLCBlcnIgJWQiLCBwbnVtLCBlcnIpOworCQkJCWlmIChlcnIgPiAwKQorCQkJCQllcnIg
PSAtRUlPOworCisJCQkJZ290byBvdXRfZnJlZV92aWRoOworCQkJfQorCQl9CisKKwkJdmlkX2hk
ciA9IHZoOworCX0KKworCS8qIFJlYWQgdGhlIGRhdGEgb2YgdGhlIGNvcHkgYW5kIGNoZWNrIHRo
ZSBDUkMgKi8KKworCWxlbiA9IGJlMzJfdG9fY3B1KHZpZF9oZHItPmRhdGFfc2l6ZSk7CisJYnVm
ID0gdm1hbGxvYyhsZW4pOworCWlmICghYnVmKSB7CisJCWVyciA9IC1FTk9NRU07CisJCWdvdG8g
b3V0X2ZyZWVfdmlkaDsKKwl9CisKKwllcnIgPSB1YmlfaW9fcmVhZF9kYXRhKHViaSwgYnVmLCBw
bnVtLCAwLCBsZW4pOworCWlmIChlcnIgJiYgZXJyICE9IFVCSV9JT19CSVRGTElQUyAmJiBlcnIg
IT0gLUVCQURNU0cpCisJCWdvdG8gb3V0X2ZyZWVfYnVmOworCisJZGF0YV9jcmMgPSBiZTMyX3Rv
X2NwdSh2aWRfaGRyLT5kYXRhX2NyYyk7CisJY3JjID0gY3JjMzIoVUJJX0NSQzMyX0lOSVQsIGJ1
ZiwgbGVuKTsKKwlpZiAoY3JjICE9IGRhdGFfY3JjKSB7CisJCWRiZ19ibGQoIlBFQiAlZCBDUkMg
ZXJyb3I6IGNhbGN1bGF0ZWQgJSMwOHgsIG11c3QgYmUgJSMwOHgiLAorCQkJcG51bSwgY3JjLCBk
YXRhX2NyYyk7CisJCWNvcnJ1cHRlZCA9IDE7CisJCWJpdGZsaXBzID0gMDsKKwkJc2Vjb25kX2lz
X25ld2VyID0gIXNlY29uZF9pc19uZXdlcjsKKwl9IGVsc2UgeworCQlkYmdfYmxkKCJQRUIgJWQg
Q1JDIGlzIE9LIiwgcG51bSk7CisJCWJpdGZsaXBzID0gISFlcnI7CisJfQorCisJdmZyZWUoYnVm
KTsKKwl1YmlfZnJlZV92aWRfaGRyKHViaSwgdmgpOworCisJaWYgKHNlY29uZF9pc19uZXdlcikK
KwkJZGJnX2JsZCgic2Vjb25kIFBFQiAlZCBpcyBuZXdlciwgY29weV9mbGFnIGlzIHNldCIsIHBu
dW0pOworCWVsc2UKKwkJZGJnX2JsZCgiZmlyc3QgUEVCICVkIGlzIG5ld2VyLCBjb3B5X2ZsYWcg
aXMgc2V0IiwgcG51bSk7CisKKwlyZXR1cm4gc2Vjb25kX2lzX25ld2VyIHwgKGJpdGZsaXBzIDw8
IDEpIHwgKGNvcnJ1cHRlZCA8PCAyKTsKKworb3V0X2ZyZWVfYnVmOgorCXZmcmVlKGJ1Zik7Citv
dXRfZnJlZV92aWRoOgorCXViaV9mcmVlX3ZpZF9oZHIodWJpLCB2aCk7CisJcmV0dXJuIGVycjsK
K30KKworLyoqCisgKiB1YmlfYWRkX3RvX2F2IC0gYWRkIHVzZWQgcGh5c2ljYWwgZXJhc2VibG9j
ayB0byB0aGUgYXR0YWNoaW5nIGluZm9ybWF0aW9uLgorICogQHViaTogVUJJIGRldmljZSBkZXNj
cmlwdGlvbiBvYmplY3QKKyAqIEBhaTogYXR0YWNoaW5nIGluZm9ybWF0aW9uCisgKiBAcG51bTog
dGhlIHBoeXNpY2FsIGVyYXNlYmxvY2sgbnVtYmVyCisgKiBAZWM6IGVyYXNlIGNvdW50ZXIKKyAq
IEB2aWRfaGRyOiB0aGUgdm9sdW1lIGlkZW50aWZpZXIgaGVhZGVyCisgKiBAYml0ZmxpcHM6IGlm
IGJpdC1mbGlwcyB3ZXJlIGRldGVjdGVkIHdoZW4gdGhpcyBwaHlzaWNhbCBlcmFzZWJsb2NrIHdh
cyByZWFkCisgKgorICogVGhpcyBmdW5jdGlvbiBhZGRzIGluZm9ybWF0aW9uIGFib3V0IGEgdXNl
ZCBwaHlzaWNhbCBlcmFzZWJsb2NrIHRvIHRoZQorICogJ3VzZWQnIHRyZWUgb2YgdGhlIGNvcnJl
c3BvbmRpbmcgdm9sdW1lLiBUaGUgZnVuY3Rpb24gaXMgcmF0aGVyIGNvbXBsZXgKKyAqIGJlY2F1
c2UgaXQgaGFzIHRvIGhhbmRsZSBjYXNlcyB3aGVuIHRoaXMgaXMgbm90IHRoZSBmaXJzdCBwaHlz
aWNhbAorICogZXJhc2VibG9jayBiZWxvbmdpbmcgdG8gdGhlIHNhbWUgbG9naWNhbCBlcmFzZWJs
b2NrLCBhbmQgdGhlIG5ld2VyIG9uZSBoYXMKKyAqIHRvIGJlIHBpY2tlZCwgd2hpbGUgdGhlIG9s
ZGVyIG9uZSBoYXMgdG8gYmUgZHJvcHBlZC4gVGhpcyBmdW5jdGlvbiByZXR1cm5zCisgKiB6ZXJv
IGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGluIGNhc2Ugb2Yg
ZmFpbHVyZS4KKyAqLworaW50IHViaV9hZGRfdG9fYXYoc3RydWN0IHViaV9kZXZpY2UgKnViaSwg
c3RydWN0IHViaV9hdHRhY2hfaW5mbyAqYWksIGludCBwbnVtLAorCQkgIGludCBlYywgY29uc3Qg
c3RydWN0IHViaV92aWRfaGRyICp2aWRfaGRyLCBpbnQgYml0ZmxpcHMpCit7CisJaW50IGVyciwg
dm9sX2lkLCBsbnVtOworCXVuc2lnbmVkIGxvbmcgbG9uZyBzcW51bTsKKwlzdHJ1Y3QgdWJpX2Fp
bmZfdm9sdW1lICphdjsKKwlzdHJ1Y3QgdWJpX2FpbmZfcGViICphZWI7CisJc3RydWN0IHJiX25v
ZGUgKipwLCAqcGFyZW50ID0gTlVMTDsKKworCXZvbF9pZCA9IGJlMzJfdG9fY3B1KHZpZF9oZHIt
PnZvbF9pZCk7CisJbG51bSA9IGJlMzJfdG9fY3B1KHZpZF9oZHItPmxudW0pOworCXNxbnVtID0g
YmU2NF90b19jcHUodmlkX2hkci0+c3FudW0pOworCisJZGJnX2JsZCgiUEVCICVkLCBMRUIgJWQ6
JWQsIEVDICVkLCBzcW51bSAlbGx1LCBiaXRmbGlwcyAlZCIsCisJCXBudW0sIHZvbF9pZCwgbG51
bSwgZWMsIHNxbnVtLCBiaXRmbGlwcyk7CisKKwlhdiA9IGFkZF92b2x1bWUoYWksIHZvbF9pZCwg
cG51bSwgdmlkX2hkcik7CisJaWYgKElTX0VSUihhdikpCisJCXJldHVybiBQVFJfRVJSKGF2KTsK
KworCWlmIChhaS0+bWF4X3NxbnVtIDwgc3FudW0pCisJCWFpLT5tYXhfc3FudW0gPSBzcW51bTsK
KworCS8qCisJICogV2FsayB0aGUgUkItdHJlZSBvZiBsb2dpY2FsIGVyYXNlYmxvY2tzIG9mIHZv
bHVtZSBAdm9sX2lkIHRvIGxvb2sKKwkgKiBpZiB0aGlzIGlzIHRoZSBmaXJzdCBpbnN0YW5jZSBv
ZiB0aGlzIGxvZ2ljYWwgZXJhc2VibG9jayBvciBub3QuCisJICovCisJcCA9ICZhdi0+cm9vdC5y
Yl9ub2RlOworCXdoaWxlICgqcCkgeworCQlpbnQgY21wX3JlczsKKworCQlwYXJlbnQgPSAqcDsK
KwkJYWViID0gcmJfZW50cnkocGFyZW50LCBzdHJ1Y3QgdWJpX2FpbmZfcGViLCB1LnJiKTsKKwkJ
aWYgKGxudW0gIT0gYWViLT5sbnVtKSB7CisJCQlpZiAobG51bSA8IGFlYi0+bG51bSkKKwkJCQlw
ID0gJigqcCktPnJiX2xlZnQ7CisJCQllbHNlCisJCQkJcCA9ICYoKnApLT5yYl9yaWdodDsKKwkJ
CWNvbnRpbnVlOworCQl9CisKKwkJLyoKKwkJICogVGhlcmUgaXMgYWxyZWFkeSBhIHBoeXNpY2Fs
IGVyYXNlYmxvY2sgZGVzY3JpYmluZyB0aGUgc2FtZQorCQkgKiBsb2dpY2FsIGVyYXNlYmxvY2sg
cHJlc2VudC4KKwkJICovCisKKwkJZGJnX2JsZCgidGhpcyBMRUIgYWxyZWFkeSBleGlzdHM6IFBF
QiAlZCwgc3FudW0gJWxsdSwgRUMgJWQiLAorCQkJYWViLT5wbnVtLCBhZWItPnNxbnVtLCBhZWIt
PmVjKTsKKworCQkvKgorCQkgKiBNYWtlIHN1cmUgdGhhdCB0aGUgbG9naWNhbCBlcmFzZWJsb2Nr
cyBoYXZlIGRpZmZlcmVudAorCQkgKiBzZXF1ZW5jZSBudW1iZXJzLiBPdGhlcndpc2UgdGhlIGlt
YWdlIGlzIGJhZC4KKwkJICoKKwkJICogSG93ZXZlciwgaWYgdGhlIHNlcXVlbmNlIG51bWJlciBp
cyB6ZXJvLCB3ZSBhc3N1bWUgaXQgbXVzdAorCQkgKiBiZSBhbiBhbmNpZW50IFVCSSBpbWFnZSBm
cm9tIHRoZSBlcmEgd2hlbiBVQkkgZGlkIG5vdCBoYXZlCisJCSAqIHNlcXVlbmNlIG51bWJlcnMu
IFdlIHN0aWxsIGNhbiBhdHRhY2ggdGhlc2UgaW1hZ2VzLCB1bmxlc3MKKwkJICogdGhlcmUgaXMg
YSBuZWVkIHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gb2xkIGFuZCBuZXcKKwkJICogZXJhc2VibG9j
a3MsIGluIHdoaWNoIGNhc2Ugd2UnbGwgcmVmdXNlIHRoZSBpbWFnZSBpbgorCQkgKiAnY29tcGFy
ZV9sZWJzKCknLiBJbiBvdGhlciB3b3Jkcywgd2UgYXR0YWNoIG9sZCBjbGVhbgorCQkgKiBpbWFn
ZXMsIGJ1dCByZWZ1c2UgYXR0YWNoaW5nIG9sZCBpbWFnZXMgd2l0aCBkdXBsaWNhdGVkCisJCSAq
IGxvZ2ljYWwgZXJhc2VibG9ja3MgYmVjYXVzZSB0aGVyZSB3YXMgYW4gdW5jbGVhbiByZWJvb3Qu
CisJCSAqLworCQlpZiAoYWViLT5zcW51bSA9PSBzcW51bSAmJiBzcW51bSAhPSAwKSB7CisJCQl1
YmlfZXJyKCJ0d28gTEVCcyB3aXRoIHNhbWUgc2VxdWVuY2UgbnVtYmVyICVsbHUiLAorCQkJCXNx
bnVtKTsKKwkJCXViaV9kdW1wX2FlYihhZWIsIDApOworCQkJdWJpX2R1bXBfdmlkX2hkcih2aWRf
aGRyKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CisKKwkJLyoKKwkJICogTm93IHdlIGhhdmUg
dG8gZHJvcCB0aGUgb2xkZXIgb25lIGFuZCBwcmVzZXJ2ZSB0aGUgbmV3ZXIKKwkJICogb25lLgor
CQkgKi8KKwkJY21wX3JlcyA9IGNvbXBhcmVfbGVicyh1YmksIGFlYiwgcG51bSwgdmlkX2hkcik7
CisJCWlmIChjbXBfcmVzIDwgMCkKKwkJCXJldHVybiBjbXBfcmVzOworCisJCWlmIChjbXBfcmVz
ICYgMSkgeworCQkJLyoKKwkJCSAqIFRoaXMgbG9naWNhbCBlcmFzZWJsb2NrIGlzIG5ld2VyIHRo
YW4gdGhlIG9uZQorCQkJICogZm91bmQgZWFybGllci4KKwkJCSAqLworCQkJZXJyID0gdmFsaWRh
dGVfdmlkX2hkcih2aWRfaGRyLCBhdiwgcG51bSk7CisJCQlpZiAoZXJyKQorCQkJCXJldHVybiBl
cnI7CisKKwkJCWVyciA9IGFkZF90b19saXN0KGFpLCBhZWItPnBudW0sIGFlYi0+dm9sX2lkLAor
CQkJCQkgIGFlYi0+bG51bSwgYWViLT5lYywgY21wX3JlcyAmIDQsCisJCQkJCSAgJmFpLT5lcmFz
ZSk7CisJCQlpZiAoZXJyKQorCQkJCXJldHVybiBlcnI7CisKKwkJCWFlYi0+ZWMgPSBlYzsKKwkJ
CWFlYi0+cG51bSA9IHBudW07CisJCQlhZWItPnZvbF9pZCA9IHZvbF9pZDsKKwkJCWFlYi0+bG51
bSA9IGxudW07CisJCQlhZWItPnNjcnViID0gKChjbXBfcmVzICYgMikgfHwgYml0ZmxpcHMpOwor
CQkJYWViLT5jb3B5X2ZsYWcgPSB2aWRfaGRyLT5jb3B5X2ZsYWc7CisJCQlhZWItPnNxbnVtID0g
c3FudW07CisKKwkJCWlmIChhdi0+aGlnaGVzdF9sbnVtID09IGxudW0pCisJCQkJYXYtPmxhc3Rf
ZGF0YV9zaXplID0KKwkJCQkJYmUzMl90b19jcHUodmlkX2hkci0+ZGF0YV9zaXplKTsKKworCQkJ
cmV0dXJuIDA7CisJCX0gZWxzZSB7CisJCQkvKgorCQkJICogVGhpcyBsb2dpY2FsIGVyYXNlYmxv
Y2sgaXMgb2xkZXIgdGhhbiB0aGUgb25lIGZvdW5kCisJCQkgKiBwcmV2aW91c2x5LgorCQkJICov
CisJCQlyZXR1cm4gYWRkX3RvX2xpc3QoYWksIHBudW0sIHZvbF9pZCwgbG51bSwgZWMsCisJCQkJ
CSAgIGNtcF9yZXMgJiA0LCAmYWktPmVyYXNlKTsKKwkJfQorCX0KKworCS8qCisJICogV2UndmUg
bWV0IHRoaXMgbG9naWNhbCBlcmFzZWJsb2NrIGZvciB0aGUgZmlyc3QgdGltZSwgYWRkIGl0IHRv
IHRoZQorCSAqIGF0dGFjaGluZyBpbmZvcm1hdGlvbi4KKwkgKi8KKworCWVyciA9IHZhbGlkYXRl
X3ZpZF9oZHIodmlkX2hkciwgYXYsIHBudW0pOworCWlmIChlcnIpCisJCXJldHVybiBlcnI7CisK
KwlhZWIgPSBrbWVtX2NhY2hlX2FsbG9jKGFpLT5hZWJfc2xhYl9jYWNoZSwgR0ZQX0tFUk5FTCk7
CisJaWYgKCFhZWIpCisJCXJldHVybiAtRU5PTUVNOworCisJYWViLT5lYyA9IGVjOworCWFlYi0+
cG51bSA9IHBudW07CisJYWViLT52b2xfaWQgPSB2b2xfaWQ7CisJYWViLT5sbnVtID0gbG51bTsK
KwlhZWItPnNjcnViID0gYml0ZmxpcHM7CisJYWViLT5jb3B5X2ZsYWcgPSB2aWRfaGRyLT5jb3B5
X2ZsYWc7CisJYWViLT5zcW51bSA9IHNxbnVtOworCisJaWYgKGF2LT5oaWdoZXN0X2xudW0gPD0g
bG51bSkgeworCQlhdi0+aGlnaGVzdF9sbnVtID0gbG51bTsKKwkJYXYtPmxhc3RfZGF0YV9zaXpl
ID0gYmUzMl90b19jcHUodmlkX2hkci0+ZGF0YV9zaXplKTsKKwl9CisKKwlhdi0+bGViX2NvdW50
ICs9IDE7CisJcmJfbGlua19ub2RlKCZhZWItPnUucmIsIHBhcmVudCwgcCk7CisJcmJfaW5zZXJ0
X2NvbG9yKCZhZWItPnUucmIsICZhdi0+cm9vdCk7CisJcmV0dXJuIDA7Cit9CisKKy8qKgorICog
dWJpX2ZpbmRfYXYgLSBmaW5kIHZvbHVtZSBpbiB0aGUgYXR0YWNoaW5nIGluZm9ybWF0aW9uLgor
ICogQGFpOiBhdHRhY2hpbmcgaW5mb3JtYXRpb24KKyAqIEB2b2xfaWQ6IHRoZSByZXF1ZXN0ZWQg
dm9sdW1lIElECisgKgorICogVGhpcyBmdW5jdGlvbiByZXR1cm5zIGEgcG9pbnRlciB0byB0aGUg
dm9sdW1lIGRlc2NyaXB0aW9uIG9yICVOVUxMIGlmIHRoZXJlCisgKiBhcmUgbm8gZGF0YSBhYm91
dCB0aGlzIHZvbHVtZSBpbiB0aGUgYXR0YWNoaW5nIGluZm9ybWF0aW9uLgorICovCitzdHJ1Y3Qg
dWJpX2FpbmZfdm9sdW1lICp1YmlfZmluZF9hdihjb25zdCBzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZv
ICphaSwKKwkJCQkgICAgaW50IHZvbF9pZCkKK3sKKwlzdHJ1Y3QgdWJpX2FpbmZfdm9sdW1lICph
djsKKwlzdHJ1Y3QgcmJfbm9kZSAqcCA9IGFpLT52b2x1bWVzLnJiX25vZGU7CisKKwl3aGlsZSAo
cCkgeworCQlhdiA9IHJiX2VudHJ5KHAsIHN0cnVjdCB1YmlfYWluZl92b2x1bWUsIHJiKTsKKwor
CQlpZiAodm9sX2lkID09IGF2LT52b2xfaWQpCisJCQlyZXR1cm4gYXY7CisKKwkJaWYgKHZvbF9p
ZCA+IGF2LT52b2xfaWQpCisJCQlwID0gcC0+cmJfbGVmdDsKKwkJZWxzZQorCQkJcCA9IHAtPnJi
X3JpZ2h0OworCX0KKworCXJldHVybiBOVUxMOworfQorCisvKioKKyAqIHViaV9yZW1vdmVfYXYg
LSBkZWxldGUgYXR0YWNoaW5nIGluZm9ybWF0aW9uIGFib3V0IGEgdm9sdW1lLgorICogQGFpOiBh
dHRhY2hpbmcgaW5mb3JtYXRpb24KKyAqIEBhdjogdGhlIHZvbHVtZSBhdHRhY2hpbmcgaW5mb3Jt
YXRpb24gdG8gZGVsZXRlCisgKi8KK3ZvaWQgdWJpX3JlbW92ZV9hdihzdHJ1Y3QgdWJpX2F0dGFj
aF9pbmZvICphaSwgc3RydWN0IHViaV9haW5mX3ZvbHVtZSAqYXYpCit7CisJc3RydWN0IHJiX25v
ZGUgKnJiOworCXN0cnVjdCB1YmlfYWluZl9wZWIgKmFlYjsKKworCWRiZ19ibGQoInJlbW92ZSBh
dHRhY2hpbmcgaW5mb3JtYXRpb24gYWJvdXQgdm9sdW1lICVkIiwgYXYtPnZvbF9pZCk7CisKKwl3
aGlsZSAoKHJiID0gcmJfZmlyc3QoJmF2LT5yb290KSkpIHsKKwkJYWViID0gcmJfZW50cnkocmIs
IHN0cnVjdCB1YmlfYWluZl9wZWIsIHUucmIpOworCQlyYl9lcmFzZSgmYWViLT51LnJiLCAmYXYt
PnJvb3QpOworCQlsaXN0X2FkZF90YWlsKCZhZWItPnUubGlzdCwgJmFpLT5lcmFzZSk7CisJfQor
CisJcmJfZXJhc2UoJmF2LT5yYiwgJmFpLT52b2x1bWVzKTsKKwlrZnJlZShhdik7CisJYWktPnZv
bHNfZm91bmQgLT0gMTsKK30KKworLyoqCisgKiBlYXJseV9lcmFzZV9wZWIgLSBlcmFzZSBhIHBo
eXNpY2FsIGVyYXNlYmxvY2suCisgKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVj
dAorICogQGFpOiBhdHRhY2hpbmcgaW5mb3JtYXRpb24KKyAqIEBwbnVtOiBwaHlzaWNhbCBlcmFz
ZWJsb2NrIG51bWJlciB0byBlcmFzZTsKKyAqIEBlYzogZXJhc2UgY291bnRlciB2YWx1ZSB0byB3
cml0ZSAoJVVCSV9VTktOT1dOIGlmIGl0IGlzIHVua25vd24pCisgKgorICogVGhpcyBmdW5jdGlv
biBlcmFzZXMgcGh5c2ljYWwgZXJhc2VibG9jayAncG51bScsIGFuZCB3cml0ZXMgdGhlIGVyYXNl
CisgKiBjb3VudGVyIGhlYWRlciB0byBpdC4gVGhpcyBmdW5jdGlvbiBzaG91bGQgb25seSBiZSB1
c2VkIG9uIFVCSSBkZXZpY2UKKyAqIGluaXRpYWxpemF0aW9uIHN0YWdlcywgd2hlbiB0aGUgRUJB
IHN1Yi1zeXN0ZW0gaGFkIG5vdCBiZWVuIHlldCBpbml0aWFsaXplZC4KKyAqIFRoaXMgZnVuY3Rp
b24gcmV0dXJucyB6ZXJvIGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBj
b2RlIGluCisgKiBjYXNlIG9mIGZhaWx1cmUuCisgKi8KK3N0YXRpYyBpbnQgZWFybHlfZXJhc2Vf
cGViKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksCisJCQkgICBjb25zdCBzdHJ1Y3QgdWJpX2F0dGFj
aF9pbmZvICphaSwgaW50IHBudW0sIGludCBlYykKK3sKKwlpbnQgZXJyOworCXN0cnVjdCB1Ymlf
ZWNfaGRyICplY19oZHI7CisKKwlpZiAoKGxvbmcgbG9uZyllYyA+PSBVQklfTUFYX0VSQVNFQ09V
TlRFUikgeworCQkvKgorCQkgKiBFcmFzZSBjb3VudGVyIG92ZXJmbG93LiBVcGdyYWRlIFVCSSBh
bmQgdXNlIDY0LWJpdAorCQkgKiBlcmFzZSBjb3VudGVycyBpbnRlcm5hbGx5LgorCQkgKi8KKwkJ
dWJpX2VycigiZXJhc2UgY291bnRlciBvdmVyZmxvdyBhdCBQRUIgJWQsIEVDICVkIiwgcG51bSwg
ZWMpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwllY19oZHIgPSBremFsbG9jKHViaS0+ZWNf
aGRyX2Fsc2l6ZSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFlY19oZHIpCisJCXJldHVybiAtRU5PTUVN
OworCisJZWNfaGRyLT5lYyA9IGNwdV90b19iZTY0KGVjKTsKKworCWVyciA9IHViaV9pb19zeW5j
X2VyYXNlKHViaSwgcG51bSwgMCk7CisJaWYgKGVyciA8IDApCisJCWdvdG8gb3V0X2ZyZWU7CisK
KwllcnIgPSB1YmlfaW9fd3JpdGVfZWNfaGRyKHViaSwgcG51bSwgZWNfaGRyKTsKKworb3V0X2Zy
ZWU6CisJa2ZyZWUoZWNfaGRyKTsKKwlyZXR1cm4gZXJyOworfQorCisvKioKKyAqIHViaV9lYXJs
eV9nZXRfcGViIC0gZ2V0IGEgZnJlZSBwaHlzaWNhbCBlcmFzZWJsb2NrLgorICogQHViaTogVUJJ
IGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKKyAqIEBhaTogYXR0YWNoaW5nIGluZm9ybWF0aW9u
CisgKgorICogVGhpcyBmdW5jdGlvbiByZXR1cm5zIGEgZnJlZSBwaHlzaWNhbCBlcmFzZWJsb2Nr
LiBJdCBpcyBzdXBwb3NlZCB0byBiZQorICogY2FsbGVkIG9uIHRoZSBVQkkgaW5pdGlhbGl6YXRp
b24gc3RhZ2VzIHdoZW4gdGhlIHdlYXItbGV2ZWxpbmcgc3ViLXN5c3RlbSBpcworICogbm90IGlu
aXRpYWxpemVkIHlldC4gVGhpcyBmdW5jdGlvbiBwaWNrcyBhIHBoeXNpY2FsIGVyYXNlYmxvY2tz
IGZyb20gb25lIG9mCisgKiB0aGUgbGlzdHMsIHdyaXRlcyB0aGUgRUMgaGVhZGVyIGlmIGl0IGlz
IG5lZWRlZCwgYW5kIHJlbW92ZXMgaXQgZnJvbSB0aGUKKyAqIGxpc3QuCisgKgorICogVGhpcyBm
dW5jdGlvbiByZXR1cm5zIGEgcG9pbnRlciB0byB0aGUgImFlYiIgb2YgdGhlIGZvdW5kIGZyZWUg
UEVCIGluIGNhc2UKKyAqIG9mIHN1Y2Nlc3MgYW5kIGFuIGVycm9yIGNvZGUgaW4gY2FzZSBvZiBm
YWlsdXJlLgorICovCitzdHJ1Y3QgdWJpX2FpbmZfcGViICp1YmlfZWFybHlfZ2V0X3BlYihzdHJ1
Y3QgdWJpX2RldmljZSAqdWJpLAorCQkJCSAgICAgICBzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICph
aSkKK3sKKwlpbnQgZXJyID0gMDsKKwlzdHJ1Y3QgdWJpX2FpbmZfcGViICphZWIsICp0bXBfYWVi
OworCisJaWYgKCFsaXN0X2VtcHR5KCZhaS0+ZnJlZSkpIHsKKwkJYWViID0gbGlzdF9lbnRyeShh
aS0+ZnJlZS5uZXh0LCBzdHJ1Y3QgdWJpX2FpbmZfcGViLCB1Lmxpc3QpOworCQlsaXN0X2RlbCgm
YWViLT51Lmxpc3QpOworCQlkYmdfYmxkKCJyZXR1cm4gZnJlZSBQRUIgJWQsIEVDICVkIiwgYWVi
LT5wbnVtLCBhZWItPmVjKTsKKwkJcmV0dXJuIGFlYjsKKwl9CisKKwkvKgorCSAqIFdlIHRyeSB0
byBlcmFzZSB0aGUgZmlyc3QgcGh5c2ljYWwgZXJhc2VibG9jayBmcm9tIHRoZSBlcmFzZSBsaXN0
CisJICogYW5kIHBpY2sgaXQgaWYgd2Ugc3VjY2VlZCwgb3IgdHJ5IHRvIGVyYXNlIHRoZSBuZXh0
IG9uZSBpZiBub3QuIEFuZAorCSAqIHNvIGZvcnRoLiBXZSBkb24ndCB3YW50IHRvIHRha2UgY2Fy
ZSBhYm91dCBiYWQgZXJhc2VibG9ja3MgaGVyZSAtCisJICogdGhleSdsbCBiZSBoYW5kbGVkIGxh
dGVyLgorCSAqLworCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShhZWIsIHRtcF9hZWIsICZhaS0+
ZXJhc2UsIHUubGlzdCkgeworCQlpZiAoYWViLT5lYyA9PSBVQklfVU5LTk9XTikKKwkJCWFlYi0+
ZWMgPSBhaS0+bWVhbl9lYzsKKworCQllcnIgPSBlYXJseV9lcmFzZV9wZWIodWJpLCBhaSwgYWVi
LT5wbnVtLCBhZWItPmVjKzEpOworCQlpZiAoZXJyKQorCQkJY29udGludWU7CisKKwkJYWViLT5l
YyArPSAxOworCQlsaXN0X2RlbCgmYWViLT51Lmxpc3QpOworCQlkYmdfYmxkKCJyZXR1cm4gUEVC
ICVkLCBFQyAlZCIsIGFlYi0+cG51bSwgYWViLT5lYyk7CisJCXJldHVybiBhZWI7CisJfQorCisJ
dWJpX2Vycigibm8gZnJlZSBlcmFzZWJsb2NrcyIpOworCXJldHVybiBFUlJfUFRSKC1FTk9TUEMp
OworfQorCisvKioKKyAqIGNoZWNrX2NvcnJ1cHRpb24gLSBjaGVjayB0aGUgZGF0YSBhcmVhIG9m
IFBFQi4KKyAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0CisgKiBAdmlkX2hy
ZDogdGhlIChjb3JydXB0ZWQpIFZJRCBoZWFkZXIgb2YgdGhpcyBQRUIKKyAqIEBwbnVtOiB0aGUg
cGh5c2ljYWwgZXJhc2VibG9jayBudW1iZXIgdG8gY2hlY2sKKyAqCisgKiBUaGlzIGlzIGEgaGVs
cGVyIGZ1bmN0aW9uIHdoaWNoIGlzIHVzZWQgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBWSUQgaGVh
ZGVyCisgKiBjb3JydXB0aW9ucyBjYXVzZWQgYnkgcG93ZXIgY3V0cyBhbmQgb3RoZXIgcmVhc29u
cy4gSWYgdGhlIFBFQiBjb250YWlucyBvbmx5CisgKiAweEZGIGJ5dGVzIGluIHRoZSBkYXRhIGFy
ZWEsIHRoZSBWSUQgaGVhZGVyIGlzIG1vc3QgcHJvYmFibHkgY29ycnVwdGVkCisgKiBiZWNhdXNl
IG9mIGEgcG93ZXIgY3V0ICglMCBpcyByZXR1cm5lZCBpbiB0aGlzIGNhc2UpLiBPdGhlcndpc2Us
IGl0IHdhcworICogcHJvYmFibHkgY29ycnVwdGVkIGZvciBzb21lIG90aGVyIHJlYXNvbnMgKCUx
IGlzIHJldHVybmVkIGluIHRoaXMgY2FzZSkuIEEKKyAqIG5lZ2F0aXZlIGVycm9yIGNvZGUgaXMg
cmV0dXJuZWQgaWYgYSByZWFkIGVycm9yIG9jY3VycmVkLgorICoKKyAqIElmIHRoZSBjb3JydXB0
aW9uIHJlYXNvbiB3YXMgYSBwb3dlciBjdXQsIFVCSSBjYW4gc2FmZWx5IGVyYXNlIHRoaXMgUEVC
LgorICogT3RoZXJ3aXNlLCBpdCBzaG91bGQgcHJlc2VydmUgaXQgdG8gYXZvaWQgcG9zc2libHkg
ZGVzdHJveWluZyBpbXBvcnRhbnQKKyAqIGluZm9ybWF0aW9uLgorICovCitzdGF0aWMgaW50IGNo
ZWNrX2NvcnJ1cHRpb24oc3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV92aWRfaGRy
ICp2aWRfaGRyLAorCQkJICAgIGludCBwbnVtKQoreworCWludCBlcnI7CisKKwltdXRleF9sb2Nr
KCZ1YmktPmJ1Zl9tdXRleCk7CisJbWVtc2V0KHViaS0+cGViX2J1ZiwgMHgwMCwgdWJpLT5sZWJf
c2l6ZSk7CisKKwllcnIgPSB1YmlfaW9fcmVhZCh1YmksIHViaS0+cGViX2J1ZiwgcG51bSwgdWJp
LT5sZWJfc3RhcnQsCisJCQkgIHViaS0+bGViX3NpemUpOworCWlmIChlcnIgPT0gVUJJX0lPX0JJ
VEZMSVBTIHx8IGVyciA9PSAtRUJBRE1TRykgeworCQkvKgorCQkgKiBCaXQtZmxpcHMgb3IgaW50
ZWdyaXR5IGVycm9ycyB3aGlsZSByZWFkaW5nIHRoZSBkYXRhIGFyZWEuCisJCSAqIEl0IGlzIGRp
ZmZpY3VsdCB0byBzYXkgZm9yIHN1cmUgd2hhdCB0eXBlIG9mIGNvcnJ1cHRpb24gaXMKKwkJICog
dGhpcywgYnV0IHByZXN1bWFibHkgYSBwb3dlciBjdXQgaGFwcGVuZWQgd2hpbGUgdGhpcyBQRUIg
d2FzCisJCSAqIGVyYXNlZCwgc28gaXQgYmVjYW1lIHVuc3RhYmxlIGFuZCBjb3JydXB0ZWQsIGFu
ZCBzaG91bGQgYmUKKwkJICogZXJhc2VkLgorCQkgKi8KKwkJZXJyID0gMDsKKwkJZ290byBvdXRf
dW5sb2NrOworCX0KKworCWlmIChlcnIpCisJCWdvdG8gb3V0X3VubG9jazsKKworCWlmICh1Ymlf
Y2hlY2tfcGF0dGVybih1YmktPnBlYl9idWYsIDB4RkYsIHViaS0+bGViX3NpemUpKQorCQlnb3Rv
IG91dF91bmxvY2s7CisKKwl1YmlfZXJyKCJQRUIgJWQgY29udGFpbnMgY29ycnVwdGVkIFZJRCBo
ZWFkZXIsIGFuZCB0aGUgZGF0YSBkb2VzIG5vdCAiCisJCSJjb250YWluIGFsbCAweEZGLCB0aGlz
IG1heSBiZSBhIG5vbi1VQkkgUEVCIG9yIGEgc2V2ZXJlIFZJRCAiCisJCSJoZWFkZXIgY29ycnVw
dGlvbiB3aGljaCByZXF1aXJlcyBtYW51YWwgaW5zcGVjdGlvbiIsIHBudW0pOworCXViaV9kdW1w
X3ZpZF9oZHIodmlkX2hkcik7CisJZGJnX21zZygiaGV4ZHVtcCBvZiBQRUIgJWQgb2Zmc2V0ICVk
LCBsZW5ndGggJWQiLAorCQlwbnVtLCB1YmktPmxlYl9zdGFydCwgdWJpLT5sZWJfc2l6ZSk7CisJ
dWJpX2RiZ19wcmludF9oZXhfZHVtcChLRVJOX0RFQlVHLCAiIiwgRFVNUF9QUkVGSVhfT0ZGU0VU
LCAzMiwgMSwKKwkJCSAgICAgICB1YmktPnBlYl9idWYsIHViaS0+bGViX3NpemUsIDEpOworCWVy
ciA9IDE7CisKK291dF91bmxvY2s6CisJbXV0ZXhfdW5sb2NrKCZ1YmktPmJ1Zl9tdXRleCk7CisJ
cmV0dXJuIGVycjsKK30KKworLyoqCisgKiBzY2FuX3BlYiAtIHNjYW4gYW5kIHByb2Nlc3MgVUJJ
IGhlYWRlcnMgb2YgYSBQRUIuCisgKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVj
dAorICogQGFpOiBhdHRhY2hpbmcgaW5mb3JtYXRpb24KKyAqIEBwbnVtOiB0aGUgcGh5c2ljYWwg
ZXJhc2VibG9jayBudW1iZXIKKyAqCisgKiBUaGlzIGZ1bmN0aW9uIHJlYWRzIFVCSSBoZWFkZXJz
IG9mIFBFQiBAcG51bSwgY2hlY2tzIHRoZW0sIGFuZCBhZGRzCisgKiBpbmZvcm1hdGlvbiBhYm91
dCB0aGlzIFBFQiB0byB0aGUgY29ycmVzcG9uZGluZyBsaXN0IG9yIFJCLXRyZWUgaW4gdGhlCisg
KiAiYXR0YWNoaW5nIGluZm8iIHN0cnVjdHVyZS4gUmV0dXJucyB6ZXJvIGlmIHRoZSBwaHlzaWNh
bCBlcmFzZWJsb2NrIHdhcworICogc3VjY2Vzc2Z1bGx5IGhhbmRsZWQgYW5kIGEgbmVnYXRpdmUg
ZXJyb3IgY29kZSBpbiBjYXNlIG9mIGZhaWx1cmUuCisgKi8KK3N0YXRpYyBpbnQgc2Nhbl9wZWIo
c3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV9hdHRhY2hfaW5mbyAqYWksCisJCSAg
ICBpbnQgcG51bSkKK3sKKwlsb25nIGxvbmcgdW5pbml0aWFsaXplZF92YXIoZWMpOworCWludCBl
cnIsIGJpdGZsaXBzID0gMCwgdm9sX2lkLCBlY19lcnIgPSAwOworCisJZGJnX2JsZCgic2NhbiBQ
RUIgJWQiLCBwbnVtKTsKKworCS8qIFNraXAgYmFkIHBoeXNpY2FsIGVyYXNlYmxvY2tzICovCisJ
ZXJyID0gdWJpX2lvX2lzX2JhZCh1YmksIHBudW0pOworCWlmIChlcnIgPCAwKQorCQlyZXR1cm4g
ZXJyOworCWVsc2UgaWYgKGVycikgeworCQlhaS0+YmFkX3BlYl9jb3VudCArPSAxOworCQlyZXR1
cm4gMDsKKwl9CisKKwllcnIgPSB1YmlfaW9fcmVhZF9lY19oZHIodWJpLCBwbnVtLCBlY2gsIDAp
OworCWlmIChlcnIgPCAwKQorCQlyZXR1cm4gZXJyOworCXN3aXRjaCAoZXJyKSB7CisJY2FzZSAw
OgorCQlicmVhazsKKwljYXNlIFVCSV9JT19CSVRGTElQUzoKKwkJYml0ZmxpcHMgPSAxOworCQli
cmVhazsKKwljYXNlIFVCSV9JT19GRjoKKwkJYWktPmVtcHR5X3BlYl9jb3VudCArPSAxOworCQly
ZXR1cm4gYWRkX3RvX2xpc3QoYWksIHBudW0sIFVCSV9VTktOT1dOLCBVQklfVU5LTk9XTiwKKwkJ
CQkgICBVQklfVU5LTk9XTiwgMCwgJmFpLT5lcmFzZSk7CisJY2FzZSBVQklfSU9fRkZfQklURkxJ
UFM6CisJCWFpLT5lbXB0eV9wZWJfY291bnQgKz0gMTsKKwkJcmV0dXJuIGFkZF90b19saXN0KGFp
LCBwbnVtLCBVQklfVU5LTk9XTiwgVUJJX1VOS05PV04sCisJCQkJICAgVUJJX1VOS05PV04sIDEs
ICZhaS0+ZXJhc2UpOworCWNhc2UgVUJJX0lPX0JBRF9IRFJfRUJBRE1TRzoKKwljYXNlIFVCSV9J
T19CQURfSERSOgorCQkvKgorCQkgKiBXZSBoYXZlIHRvIGFsc28gbG9vayBhdCB0aGUgVklEIGhl
YWRlciwgcG9zc2libHkgaXQgaXMgbm90CisJCSAqIGNvcnJ1cHRlZC4gU2V0ICViaXRmbGlwcyBm
bGFnIGluIG9yZGVyIHRvIG1ha2UgdGhpcyBQRUIgYmUKKwkJICogbW92ZWQgYW5kIEVDIGJlIHJl
LWNyZWF0ZWQuCisJCSAqLworCQllY19lcnIgPSBlcnI7CisJCWVjID0gVUJJX1VOS05PV047CisJ
CWJpdGZsaXBzID0gMTsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJdWJpX2VycigiJ3ViaV9pb19y
ZWFkX2VjX2hkcigpJyByZXR1cm5lZCB1bmtub3duIGNvZGUgJWQiLCBlcnIpOworCQlyZXR1cm4g
LUVJTlZBTDsKKwl9CisKKwlpZiAoIWVjX2VycikgeworCQlpbnQgaW1hZ2Vfc2VxOworCisJCS8q
IE1ha2Ugc3VyZSBVQkkgdmVyc2lvbiBpcyBPSyAqLworCQlpZiAoZWNoLT52ZXJzaW9uICE9IFVC
SV9WRVJTSU9OKSB7CisJCQl1YmlfZXJyKCJ0aGlzIFVCSSB2ZXJzaW9uIGlzICVkLCBpbWFnZSB2
ZXJzaW9uIGlzICVkIiwKKwkJCQlVQklfVkVSU0lPTiwgKGludCllY2gtPnZlcnNpb24pOworCQkJ
cmV0dXJuIC1FSU5WQUw7CisJCX0KKworCQllYyA9IGJlNjRfdG9fY3B1KGVjaC0+ZWMpOworCQlp
ZiAoZWMgPiBVQklfTUFYX0VSQVNFQ09VTlRFUikgeworCQkJLyoKKwkJCSAqIEVyYXNlIGNvdW50
ZXIgb3ZlcmZsb3cuIFRoZSBFQyBoZWFkZXJzIGhhdmUgNjQgYml0cworCQkJICogcmVzZXJ2ZWQs
IGJ1dCB3ZSBhbnl3YXkgbWFrZSB1c2Ugb2Ygb25seSAzMSBiaXQKKwkJCSAqIHZhbHVlcywgYXMg
dGhpcyBzZWVtcyB0byBiZSBlbm91Z2ggZm9yIGFueSBleGlzdGluZworCQkJICogZmxhc2guIFVw
Z3JhZGUgVUJJIGFuZCB1c2UgNjQtYml0IGVyYXNlIGNvdW50ZXJzCisJCQkgKiBpbnRlcm5hbGx5
LgorCQkJICovCisJCQl1YmlfZXJyKCJlcmFzZSBjb3VudGVyIG92ZXJmbG93LCBtYXggaXMgJWQi
LAorCQkJCVVCSV9NQVhfRVJBU0VDT1VOVEVSKTsKKwkJCXViaV9kdW1wX2VjX2hkcihlY2gpOwor
CQkJcmV0dXJuIC1FSU5WQUw7CisJCX0KKworCQkvKgorCQkgKiBNYWtlIHN1cmUgdGhhdCBhbGwg
UEVCcyBoYXZlIHRoZSBzYW1lIGltYWdlIHNlcXVlbmNlIG51bWJlci4KKwkJICogVGhpcyBhbGxv
d3MgdXMgdG8gZGV0ZWN0IHNpdHVhdGlvbnMgd2hlbiB1c2VycyBmbGFzaCBVQkkKKwkJICogaW1h
Z2VzIGluY29ycmVjdGx5LCBzbyB0aGF0IHRoZSBmbGFzaCBoYXMgdGhlIG5ldyBVQkkgaW1hZ2UK
KwkJICogYW5kIGxlZnRvdmVycyBmcm9tIHRoZSBvbGQgb25lLiBUaGlzIGZlYXR1cmUgd2FzIGFk
ZGVkCisJCSAqIHJlbGF0aXZlbHkgcmVjZW50bHksIGFuZCB0aGUgc2VxdWVuY2UgbnVtYmVyIHdh
cyBhbHdheXMKKwkJICogemVybywgYmVjYXVzZSBvbGQgVUJJIGltcGxlbWVudGF0aW9ucyBhbHdh
eXMgc2V0IGl0IHRvIHplcm8uCisJCSAqIEZvciB0aGlzIHJlYXNvbnMsIHdlIGRvIG5vdCBwYW5p
YyBpZiBzb21lIFBFQnMgaGF2ZSB6ZXJvCisJCSAqIHNlcXVlbmNlIG51bWJlciwgd2hpbGUgb3Ro
ZXIgUEVCcyBoYXZlIG5vbi16ZXJvIHNlcXVlbmNlCisJCSAqIG51bWJlci4KKwkJICovCisJCWlt
YWdlX3NlcSA9IGJlMzJfdG9fY3B1KGVjaC0+aW1hZ2Vfc2VxKTsKKwkJaWYgKCF1YmktPmltYWdl
X3NlcSAmJiBpbWFnZV9zZXEpCisJCQl1YmktPmltYWdlX3NlcSA9IGltYWdlX3NlcTsKKwkJaWYg
KHViaS0+aW1hZ2Vfc2VxICYmIGltYWdlX3NlcSAmJgorCQkgICAgdWJpLT5pbWFnZV9zZXEgIT0g
aW1hZ2Vfc2VxKSB7CisJCQl1YmlfZXJyKCJiYWQgaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyICVkIGlu
IFBFQiAlZCwgIgorCQkJCSJleHBlY3RlZCAlZCIsIGltYWdlX3NlcSwgcG51bSwgdWJpLT5pbWFn
ZV9zZXEpOworCQkJdWJpX2R1bXBfZWNfaGRyKGVjaCk7CisJCQlyZXR1cm4gLUVJTlZBTDsKKwkJ
fQorCX0KKworCS8qIE9LLCB3ZSd2ZSBkb25lIHdpdGggdGhlIEVDIGhlYWRlciwgbGV0J3MgbG9v
ayBhdCB0aGUgVklEIGhlYWRlciAqLworCisJZXJyID0gdWJpX2lvX3JlYWRfdmlkX2hkcih1Ymks
IHBudW0sIHZpZGgsIDApOworCWlmIChlcnIgPCAwKQorCQlyZXR1cm4gZXJyOworCXN3aXRjaCAo
ZXJyKSB7CisJY2FzZSAwOgorCQlicmVhazsKKwljYXNlIFVCSV9JT19CSVRGTElQUzoKKwkJYml0
ZmxpcHMgPSAxOworCQlicmVhazsKKwljYXNlIFVCSV9JT19CQURfSERSX0VCQURNU0c6CisJCWlm
IChlY19lcnIgPT0gVUJJX0lPX0JBRF9IRFJfRUJBRE1TRykKKwkJCS8qCisJCQkgKiBCb3RoIEVD
IGFuZCBWSUQgaGVhZGVycyBhcmUgY29ycnVwdGVkIGFuZCB3ZXJlIHJlYWQKKwkJCSAqIHdpdGgg
ZGF0YSBpbnRlZ3JpdHkgZXJyb3IsIHByb2JhYmx5IHRoaXMgaXMgYSBiYWQKKwkJCSAqIFBFQiwg
Yml0IGl0IGlzIG5vdCBtYXJrZWQgYXMgYmFkIHlldC4gVGhpcyBtYXkgYWxzbworCQkJICogYmUg
YSByZXN1bHQgb2YgcG93ZXIgY3V0IGR1cmluZyBlcmFzdXJlLgorCQkJICovCisJCQlhaS0+bWF5
YmVfYmFkX3BlYl9jb3VudCArPSAxOworCWNhc2UgVUJJX0lPX0JBRF9IRFI6CisJCWlmIChlY19l
cnIpCisJCQkvKgorCQkJICogQm90aCBoZWFkZXJzIGFyZSBjb3JydXB0ZWQuIFRoZXJlIGlzIGEg
cG9zc2liaWxpdHkKKwkJCSAqIHRoYXQgdGhpcyBhIHZhbGlkIFVCSSBQRUIgd2hpY2ggaGFzIGNv
cnJlc3BvbmRpbmcKKwkJCSAqIExFQiwgYnV0IHRoZSBoZWFkZXJzIGFyZSBjb3JydXB0ZWQuIEhv
d2V2ZXIsIGl0IGlzCisJCQkgKiBpbXBvc3NpYmxlIHRvIGRpc3Rpbmd1aXNoIGl0IGZyb20gYSBQ
RUIgd2hpY2gganVzdAorCQkJICogY29udGFpbnMgZ2FyYmFnZSBiZWNhdXNlIG9mIGEgcG93ZXIg
Y3V0IGR1cmluZyBlcmFzZQorCQkJICogb3BlcmF0aW9uLiBTbyB3ZSBqdXN0IHNjaGVkdWxlIHRo
aXMgUEVCIGZvciBlcmFzdXJlLgorCQkJICoKKwkJCSAqIEJlc2lkZXMsIGluIGNhc2Ugb2YgTk9S
IGZsYXNoLCB3ZSBkZWxpYmVyYXRlbHkKKwkJCSAqIGNvcnJ1cHQgYm90aCBoZWFkZXJzIGJlY2F1
c2UgTk9SIGZsYXNoIGVyYXN1cmUgaXMKKwkJCSAqIHNsb3cgYW5kIGNhbiBzdGFydCBmcm9tIHRo
ZSBlbmQuCisJCQkgKi8KKwkJCWVyciA9IDA7CisJCWVsc2UKKwkJCS8qCisJCQkgKiBUaGUgRUMg
d2FzIE9LLCBidXQgdGhlIFZJRCBoZWFkZXIgaXMgY29ycnVwdGVkLiBXZQorCQkJICogaGF2ZSB0
byBjaGVjayB3aGF0IGlzIGluIHRoZSBkYXRhIGFyZWEuCisJCQkgKi8KKwkJCWVyciA9IGNoZWNr
X2NvcnJ1cHRpb24odWJpLCB2aWRoLCBwbnVtKTsKKworCQlpZiAoZXJyIDwgMCkKKwkJCXJldHVy
biBlcnI7CisJCWVsc2UgaWYgKCFlcnIpCisJCQkvKiBUaGlzIGNvcnJ1cHRpb24gaXMgY2F1c2Vk
IGJ5IGEgcG93ZXIgY3V0ICovCisJCQllcnIgPSBhZGRfdG9fbGlzdChhaSwgcG51bSwgVUJJX1VO
S05PV04sCisJCQkJCSAgVUJJX1VOS05PV04sIGVjLCAxLCAmYWktPmVyYXNlKTsKKwkJZWxzZQor
CQkJLyogVGhpcyBpcyBhbiB1bmV4cGVjdGVkIGNvcnJ1cHRpb24gKi8KKwkJCWVyciA9IGFkZF9j
b3JydXB0ZWQoYWksIHBudW0sIGVjKTsKKwkJaWYgKGVycikKKwkJCXJldHVybiBlcnI7CisJCWdv
dG8gYWRqdXN0X21lYW5fZWM7CisJY2FzZSBVQklfSU9fRkZfQklURkxJUFM6CisJCWVyciA9IGFk
ZF90b19saXN0KGFpLCBwbnVtLCBVQklfVU5LTk9XTiwgVUJJX1VOS05PV04sCisJCQkJICBlYywg
MSwgJmFpLT5lcmFzZSk7CisJCWlmIChlcnIpCisJCQlyZXR1cm4gZXJyOworCQlnb3RvIGFkanVz
dF9tZWFuX2VjOworCWNhc2UgVUJJX0lPX0ZGOgorCQlpZiAoZWNfZXJyKQorCQkJZXJyID0gYWRk
X3RvX2xpc3QoYWksIHBudW0sIFVCSV9VTktOT1dOLAorCQkJCQkgIFVCSV9VTktOT1dOLCBlYywg
MSwgJmFpLT5lcmFzZSk7CisJCWVsc2UKKwkJCWVyciA9IGFkZF90b19saXN0KGFpLCBwbnVtLCBV
QklfVU5LTk9XTiwKKwkJCQkJICBVQklfVU5LTk9XTiwgZWMsIDAsICZhaS0+ZnJlZSk7CisJCWlm
IChlcnIpCisJCQlyZXR1cm4gZXJyOworCQlnb3RvIGFkanVzdF9tZWFuX2VjOworCWRlZmF1bHQ6
CisJCXViaV9lcnIoIid1YmlfaW9fcmVhZF92aWRfaGRyKCknIHJldHVybmVkIHVua25vd24gY29k
ZSAlZCIsCisJCQllcnIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwl2b2xfaWQgPSBiZTMy
X3RvX2NwdSh2aWRoLT52b2xfaWQpOworCWlmICh2b2xfaWQgPiBVQklfTUFYX1ZPTFVNRVMgJiYg
dm9sX2lkICE9IFVCSV9MQVlPVVRfVk9MVU1FX0lEKSB7CisJCWludCBsbnVtID0gYmUzMl90b19j
cHUodmlkaC0+bG51bSk7CisKKwkJLyogVW5zdXBwb3J0ZWQgaW50ZXJuYWwgdm9sdW1lICovCisJ
CXN3aXRjaCAodmlkaC0+Y29tcGF0KSB7CisJCWNhc2UgVUJJX0NPTVBBVF9ERUxFVEU6CisJCQl1
YmlfbXNnKCJcImRlbGV0ZVwiIGNvbXBhdGlibGUgaW50ZXJuYWwgdm9sdW1lICVkOiVkIgorCQkJ
CSIgZm91bmQsIHdpbGwgcmVtb3ZlIGl0Iiwgdm9sX2lkLCBsbnVtKTsKKwkJCWVyciA9IGFkZF90
b19saXN0KGFpLCBwbnVtLCB2b2xfaWQsIGxudW0sCisJCQkJCSAgZWMsIDEsICZhaS0+ZXJhc2Up
OworCQkJaWYgKGVycikKKwkJCQlyZXR1cm4gZXJyOworCQkJcmV0dXJuIDA7CisKKwkJY2FzZSBV
QklfQ09NUEFUX1JPOgorCQkJdWJpX21zZygicmVhZC1vbmx5IGNvbXBhdGlibGUgaW50ZXJuYWwg
dm9sdW1lICVkOiVkIgorCQkJCSIgZm91bmQsIHN3aXRjaCB0byByZWFkLW9ubHkgbW9kZSIsCisJ
CQkJdm9sX2lkLCBsbnVtKTsKKwkJCXViaS0+cm9fbW9kZSA9IDE7CisJCQlicmVhazsKKworCQlj
YXNlIFVCSV9DT01QQVRfUFJFU0VSVkU6CisJCQl1YmlfbXNnKCJcInByZXNlcnZlXCIgY29tcGF0
aWJsZSBpbnRlcm5hbCB2b2x1bWUgJWQ6JWQiCisJCQkJIiBmb3VuZCIsIHZvbF9pZCwgbG51bSk7
CisJCQllcnIgPSBhZGRfdG9fbGlzdChhaSwgcG51bSwgdm9sX2lkLCBsbnVtLAorCQkJCQkgIGVj
LCAwLCAmYWktPmFsaWVuKTsKKwkJCWlmIChlcnIpCisJCQkJcmV0dXJuIGVycjsKKwkJCXJldHVy
biAwOworCisJCWNhc2UgVUJJX0NPTVBBVF9SRUpFQ1Q6CisJCQl1YmlfZXJyKCJpbmNvbXBhdGli
bGUgaW50ZXJuYWwgdm9sdW1lICVkOiVkIGZvdW5kIiwKKwkJCQl2b2xfaWQsIGxudW0pOworCQkJ
cmV0dXJuIC1FSU5WQUw7CisJCX0KKwl9CisKKwlpZiAoZWNfZXJyKQorCQl1Ymlfd2FybigidmFs
aWQgVklEIGhlYWRlciBidXQgY29ycnVwdGVkIEVDIGhlYWRlciBhdCBQRUIgJWQiLAorCQkJIHBu
dW0pOworCWVyciA9IHViaV9hZGRfdG9fYXYodWJpLCBhaSwgcG51bSwgZWMsIHZpZGgsIGJpdGZs
aXBzKTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gZXJyOworCithZGp1c3RfbWVhbl9lYzoKKwlpZiAo
IWVjX2VycikgeworCQlhaS0+ZWNfc3VtICs9IGVjOworCQlhaS0+ZWNfY291bnQgKz0gMTsKKwkJ
aWYgKGVjID4gYWktPm1heF9lYykKKwkJCWFpLT5tYXhfZWMgPSBlYzsKKwkJaWYgKGVjIDwgYWkt
Pm1pbl9lYykKKwkJCWFpLT5taW5fZWMgPSBlYzsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworLyoq
CisgKiBsYXRlX2FuYWx5c2lzIC0gYW5hbHl6ZSB0aGUgb3ZlcmFsbCBzaXR1YXRpb24gd2l0aCBQ
RUIuCisgKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVjdAorICogQGFpOiBhdHRh
Y2hpbmcgaW5mb3JtYXRpb24KKyAqCisgKiBUaGlzIGlzIGEgaGVscGVyIGZ1bmN0aW9uIHdoaWNo
IHRha2VzIGEgbG9vayB3aGF0IFBFQnMgd2UgaGF2ZSBhZnRlciB3ZQorICogZ2F0aGVyIGluZm9y
bWF0aW9uIGFib3V0IGFsbCBvZiB0aGVtICgiYWkiIGlzIGNvbXBldGUpLiBJdCBkZWNpZGVzIHdo
ZXRoZXIKKyAqIHRoZSBmbGFzaCBpcyBlbXB0eSBhbmQgc2hvdWxkIGJlIGZvcm1hdHRlZCBvZiB3
aGV0aGVyIHRoZXJlIGFyZSB0b28gbWFueQorICogY29ycnVwdGVkIFBFQnMgYW5kIHdlIHNob3Vs
ZCBub3QgYXR0YWNoIHRoaXMgTVREIGRldmljZS4gUmV0dXJucyB6ZXJvIGlmIHdlCisgKiBzaG91
bGQgcHJvY2VlZCB3aXRoIGF0dGFjaGluZyB0aGUgTVREIGRldmljZSwgYW5kICUtRUlOVkFMIGlm
IHdlIHNob3VsZCBub3QuCisgKi8KK3N0YXRpYyBpbnQgbGF0ZV9hbmFseXNpcyhzdHJ1Y3QgdWJp
X2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSkKK3sKKwlzdHJ1Y3QgdWJp
X2FpbmZfcGViICphZWI7CisJaW50IG1heF9jb3JyLCBwZWJfY291bnQ7CisKKwlwZWJfY291bnQg
PSB1YmktPnBlYl9jb3VudCAtIGFpLT5iYWRfcGViX2NvdW50IC0gYWktPmFsaWVuX3BlYl9jb3Vu
dDsKKwltYXhfY29yciA9IHBlYl9jb3VudCAvIDIwID86IDg7CisKKwkvKgorCSAqIEZldyBjb3Jy
dXB0ZWQgUEVCcyBpcyBub3QgYSBwcm9ibGVtIGFuZCBtYXkgYmUganVzdCBhIHJlc3VsdCBvZgor
CSAqIHVuY2xlYW4gcmVib290cy4gSG93ZXZlciwgbWFueSBvZiB0aGVtIG1heSBpbmRpY2F0ZSBz
b21lIHByb2JsZW1zCisJICogd2l0aCB0aGUgZmxhc2ggSFcgb3IgZHJpdmVyLgorCSAqLworCWlm
IChhaS0+Y29ycl9wZWJfY291bnQpIHsKKwkJdWJpX2VycigiJWQgUEVCcyBhcmUgY29ycnVwdGVk
IGFuZCBwcmVzZXJ2ZWQiLAorCQkJYWktPmNvcnJfcGViX2NvdW50KTsKKwkJcHJpbnRrKEtFUk5f
RVJSICJDb3JydXB0ZWQgUEVCcyBhcmU6Iik7CisJCWxpc3RfZm9yX2VhY2hfZW50cnkoYWViLCAm
YWktPmNvcnIsIHUubGlzdCkKKwkJCXByaW50ayhLRVJOX0NPTlQgIiAlZCIsIGFlYi0+cG51bSk7
CisJCXByaW50ayhLRVJOX0NPTlQgIlxuIik7CisKKwkJLyoKKwkJICogSWYgdG9vIG1hbnkgUEVC
cyBhcmUgY29ycnVwdGVkLCB3ZSByZWZ1c2UgYXR0YWNoaW5nLAorCQkgKiBvdGhlcndpc2UsIG9u
bHkgcHJpbnQgYSB3YXJuaW5nLgorCQkgKi8KKwkJaWYgKGFpLT5jb3JyX3BlYl9jb3VudCA+PSBt
YXhfY29ycikgeworCQkJdWJpX2VycigidG9vIG1hbnkgY29ycnVwdGVkIFBFQnMsIHJlZnVzaW5n
Iik7CisJCQlyZXR1cm4gLUVJTlZBTDsKKwkJfQorCX0KKworCWlmIChhaS0+ZW1wdHlfcGViX2Nv
dW50ICsgYWktPm1heWJlX2JhZF9wZWJfY291bnQgPT0gcGViX2NvdW50KSB7CisJCS8qCisJCSAq
IEFsbCBQRUJzIGFyZSBlbXB0eSwgb3IgYWxtb3N0IGFsbCAtIGEgY291cGxlIFBFQnMgbG9vayBs
aWtlCisJCSAqIHRoZXkgbWF5IGJlIGJhZCBQRUJzIHdoaWNoIHdlcmUgbm90IG1hcmtlZCBhcyBi
YWQgeWV0LgorCQkgKgorCQkgKiBUaGlzIHBpZWNlIG9mIGNvZGUgYmFzaWNhbGx5IHRyaWVzIHRv
IGRpc3Rpbmd1aXNoIGJldHdlZW4KKwkJICogdGhlIGZvbGxvd2luZyBzaXR1YXRpb25zOgorCQkg
KgorCQkgKiAxLiBGbGFzaCBpcyBlbXB0eSwgYnV0IHRoZXJlIGFyZSBmZXcgYmFkIFBFQnMsIHdo
aWNoIGFyZSBub3QKKwkJICogICAgbWFya2VkIGFzIGJhZCBzbyBmYXIsIGFuZCB3aGljaCB3ZXJl
IHJlYWQgd2l0aCBlcnJvci4gV2UKKwkJICogICAgd2FudCB0byBnbyBhaGVhZCBhbmQgZm9ybWF0
IHRoaXMgZmxhc2guIFdoaWxlIGZvcm1hdHRpbmcsCisJCSAqICAgIHRoZSBmYXVsdHkgUEVCcyB3
aWxsIHByb2JhYmx5IGJlIG1hcmtlZCBhcyBiYWQuCisJCSAqCisJCSAqIDIuIEZsYXNoIGNvbnRh
aW5zIG5vbi1VQkkgZGF0YSBhbmQgd2UgZG8gbm90IHdhbnQgdG8gZm9ybWF0CisJCSAqICAgIGl0
IGFuZCBkZXN0cm95IHBvc3NpYmx5IGltcG9ydGFudCBpbmZvcm1hdGlvbi4KKwkJICovCisJCWlm
IChhaS0+bWF5YmVfYmFkX3BlYl9jb3VudCA8PSAyKSB7CisJCQlhaS0+aXNfZW1wdHkgPSAxOwor
CQkJdWJpX21zZygiZW1wdHkgTVREIGRldmljZSBkZXRlY3RlZCIpOworCQkJZ2V0X3JhbmRvbV9i
eXRlcygmdWJpLT5pbWFnZV9zZXEsCisJCQkJCSBzaXplb2YodWJpLT5pbWFnZV9zZXEpKTsKKwkJ
fSBlbHNlIHsKKwkJCXViaV9lcnIoIk1URCBkZXZpY2UgaXMgbm90IFVCSS1mb3JtYXR0ZWQgYW5k
IHBvc3NpYmx5ICIKKwkJCQkiY29udGFpbnMgbm9uLVVCSSBkYXRhIC0gcmVmdXNpbmcgaXQiKTsK
KwkJCXJldHVybiAtRUlOVkFMOworCQl9CisKKwl9CisKKwlyZXR1cm4gMDsKK30KKworLyoqCisg
KiBzY2FuX2FsbCAtIHNjYW4gZW50aXJlIE1URCBkZXZpY2UuCisgKiBAdWJpOiBVQkkgZGV2aWNl
IGRlc2NyaXB0aW9uIG9iamVjdAorICoKKyAqIFRoaXMgZnVuY3Rpb24gZG9lcyBmdWxsIHNjYW5u
aW5nIG9mIGFuIE1URCBkZXZpY2UgYW5kIHJldHVybnMgY29tcGxldGUKKyAqIGluZm9ybWF0aW9u
IGFib3V0IGl0IGluIGZvcm0gb2YgYSAic3RydWN0IHViaV9hdHRhY2hfaW5mbyIgb2JqZWN0LiBJ
biBjYXNlCisgKiBvZiBmYWlsdXJlLCBhbiBlcnJvciBjb2RlIGlzIHJldHVybmVkLgorICovCitz
dGF0aWMgc3RydWN0IHViaV9hdHRhY2hfaW5mbyAqc2Nhbl9hbGwoc3RydWN0IHViaV9kZXZpY2Ug
KnViaSkKK3sKKwlpbnQgZXJyLCBwbnVtOworCXN0cnVjdCByYl9ub2RlICpyYjEsICpyYjI7CisJ
c3RydWN0IHViaV9haW5mX3ZvbHVtZSAqYXY7CisJc3RydWN0IHViaV9haW5mX3BlYiAqYWViOwor
CXN0cnVjdCB1YmlfYXR0YWNoX2luZm8gKmFpOworCisJYWkgPSBremFsbG9jKHNpemVvZihzdHJ1
Y3QgdWJpX2F0dGFjaF9pbmZvKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFhaSkKKwkJcmV0dXJuIEVS
Ul9QVFIoLUVOT01FTSk7CisKKwlJTklUX0xJU1RfSEVBRCgmYWktPmNvcnIpOworCUlOSVRfTElT
VF9IRUFEKCZhaS0+ZnJlZSk7CisJSU5JVF9MSVNUX0hFQUQoJmFpLT5lcmFzZSk7CisJSU5JVF9M
SVNUX0hFQUQoJmFpLT5hbGllbik7CisJYWktPnZvbHVtZXMgPSBSQl9ST09UOworCisJZXJyID0g
LUVOT01FTTsKKwlhaS0+YWViX3NsYWJfY2FjaGUgPSBrbWVtX2NhY2hlX2NyZWF0ZSgidWJpX2Fl
Yl9zbGFiX2NhY2hlIiwKKwkJCQkJICAgICAgIHNpemVvZihzdHJ1Y3QgdWJpX2FpbmZfcGViKSwK
KwkJCQkJICAgICAgIDAsIDAsIE5VTEwpOworCWlmICghYWktPmFlYl9zbGFiX2NhY2hlKQorCQln
b3RvIG91dF9haTsKKworCWVjaCA9IGt6YWxsb2ModWJpLT5lY19oZHJfYWxzaXplLCBHRlBfS0VS
TkVMKTsKKwlpZiAoIWVjaCkKKwkJZ290byBvdXRfYWk7CisKKwl2aWRoID0gdWJpX3phbGxvY192
aWRfaGRyKHViaSwgR0ZQX0tFUk5FTCk7CisJaWYgKCF2aWRoKQorCQlnb3RvIG91dF9lY2g7CisK
Kwlmb3IgKHBudW0gPSAwOyBwbnVtIDwgdWJpLT5wZWJfY291bnQ7IHBudW0rKykgeworCQljb25k
X3Jlc2NoZWQoKTsKKworCQlkYmdfZ2VuKCJwcm9jZXNzIFBFQiAlZCIsIHBudW0pOworCQllcnIg
PSBzY2FuX3BlYih1YmksIGFpLCBwbnVtKTsKKwkJaWYgKGVyciA8IDApCisJCQlnb3RvIG91dF92
aWRoOworCX0KKworCWRiZ19tc2coInNjYW5uaW5nIGlzIGZpbmlzaGVkIik7CisKKwkvKiBDYWxj
dWxhdGUgbWVhbiBlcmFzZSBjb3VudGVyICovCisJaWYgKGFpLT5lY19jb3VudCkKKwkJYWktPm1l
YW5fZWMgPSBkaXZfdTY0KGFpLT5lY19zdW0sIGFpLT5lY19jb3VudCk7CisKKwllcnIgPSBsYXRl
X2FuYWx5c2lzKHViaSwgYWkpOworCWlmIChlcnIpCisJCWdvdG8gb3V0X3ZpZGg7CisKKwkvKgor
CSAqIEluIGNhc2Ugb2YgdW5rbm93biBlcmFzZSBjb3VudGVyIHdlIHVzZSB0aGUgbWVhbiBlcmFz
ZSBjb3VudGVyCisJICogdmFsdWUuCisJICovCisJdWJpX3JiX2Zvcl9lYWNoX2VudHJ5KHJiMSwg
YXYsICZhaS0+dm9sdW1lcywgcmIpIHsKKwkJdWJpX3JiX2Zvcl9lYWNoX2VudHJ5KHJiMiwgYWVi
LCAmYXYtPnJvb3QsIHUucmIpCisJCQlpZiAoYWViLT5lYyA9PSBVQklfVU5LTk9XTikKKwkJCQlh
ZWItPmVjID0gYWktPm1lYW5fZWM7CisJfQorCisJbGlzdF9mb3JfZWFjaF9lbnRyeShhZWIsICZh
aS0+ZnJlZSwgdS5saXN0KSB7CisJCWlmIChhZWItPmVjID09IFVCSV9VTktOT1dOKQorCQkJYWVi
LT5lYyA9IGFpLT5tZWFuX2VjOworCX0KKworCWxpc3RfZm9yX2VhY2hfZW50cnkoYWViLCAmYWkt
PmNvcnIsIHUubGlzdCkKKwkJaWYgKGFlYi0+ZWMgPT0gVUJJX1VOS05PV04pCisJCQlhZWItPmVj
ID0gYWktPm1lYW5fZWM7CisKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGFlYiwgJmFpLT5lcmFzZSwg
dS5saXN0KQorCQlpZiAoYWViLT5lYyA9PSBVQklfVU5LTk9XTikKKwkJCWFlYi0+ZWMgPSBhaS0+
bWVhbl9lYzsKKworCWVyciA9IHNlbGZfY2hlY2tfYWkodWJpLCBhaSk7CisJaWYgKGVycikKKwkJ
Z290byBvdXRfdmlkaDsKKworCXViaV9mcmVlX3ZpZF9oZHIodWJpLCB2aWRoKTsKKwlrZnJlZShl
Y2gpOworCisJcmV0dXJuIGFpOworCitvdXRfdmlkaDoKKwl1YmlfZnJlZV92aWRfaGRyKHViaSwg
dmlkaCk7CitvdXRfZWNoOgorCWtmcmVlKGVjaCk7CitvdXRfYWk6CisJdWJpX2Rlc3Ryb3lfYWko
YWkpOworCXJldHVybiBFUlJfUFRSKGVycik7Cit9CisKKy8qKgorICogdWJpX2F0dGFjaCAtIGF0
dGFjaCBhbiBNVEQgZGV2aWNlLgorICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdG9yCisgKgor
ICogVGhpcyBmdW5jdGlvbiByZXR1cm5zIHplcm8gaW4gY2FzZSBvZiBzdWNjZXNzIGFuZCBhIG5l
Z2F0aXZlIGVycm9yIGNvZGUgaW4KKyAqIGNhc2Ugb2YgZmFpbHVyZS4KKyAqLworaW50IHViaV9h
dHRhY2goc3RydWN0IHViaV9kZXZpY2UgKnViaSkKK3sKKwlpbnQgZXJyOworCXN0cnVjdCB1Ymlf
YXR0YWNoX2luZm8gKmFpOworCisJYWkgPSBzY2FuX2FsbCh1YmkpOworCWlmIChJU19FUlIoYWkp
KQorCQlyZXR1cm4gUFRSX0VSUihhaSk7CisKKwl1YmktPmJhZF9wZWJfY291bnQgPSBhaS0+YmFk
X3BlYl9jb3VudDsKKwl1YmktPmdvb2RfcGViX2NvdW50ID0gdWJpLT5wZWJfY291bnQgLSB1Ymkt
PmJhZF9wZWJfY291bnQ7CisJdWJpLT5jb3JyX3BlYl9jb3VudCA9IGFpLT5jb3JyX3BlYl9jb3Vu
dDsKKwl1YmktPm1heF9lYyA9IGFpLT5tYXhfZWM7CisJdWJpLT5tZWFuX2VjID0gYWktPm1lYW5f
ZWM7CisJdWJpX21zZygibWF4LiBzZXF1ZW5jZSBudW1iZXI6ICAgICAgICVsbHUiLCBhaS0+bWF4
X3NxbnVtKTsKKworCWVyciA9IHViaV9yZWFkX3ZvbHVtZV90YWJsZSh1YmksIGFpKTsKKwlpZiAo
ZXJyKQorCQlnb3RvIG91dF9haTsKKworCWVyciA9IHViaV93bF9pbml0KHViaSwgYWkpOworCWlm
IChlcnIpCisJCWdvdG8gb3V0X3Z0Ymw7CisKKwllcnIgPSB1YmlfZWJhX2luaXQodWJpLCBhaSk7
CisJaWYgKGVycikKKwkJZ290byBvdXRfd2w7CisKKwl1YmlfZGVzdHJveV9haShhaSk7CisJcmV0
dXJuIDA7CisKK291dF93bDoKKwl1Ymlfd2xfY2xvc2UodWJpKTsKK291dF92dGJsOgorCXViaV9m
cmVlX2ludGVybmFsX3ZvbHVtZXModWJpKTsKKwl2ZnJlZSh1YmktPnZ0YmwpOworb3V0X2FpOgor
CXViaV9kZXN0cm95X2FpKGFpKTsKKwlyZXR1cm4gZXJyOworfQorCisvKioKKyAqIGRlc3Ryb3lf
YXYgLSBmcmVlIHZvbHVtZSBhdHRhY2hpbmcgaW5mb3JtYXRpb24uCisgKiBAYXY6IHZvbHVtZSBh
dHRhY2hpbmcgaW5mb3JtYXRpb24KKyAqIEBhaTogYXR0YWNoaW5nIGluZm9ybWF0aW9uCisgKgor
ICogVGhpcyBmdW5jdGlvbiBkZXN0cm95cyB0aGUgdm9sdW1lIGF0dGFjaGluZyBpbmZvcm1hdGlv
bi4KKyAqLworc3RhdGljIHZvaWQgZGVzdHJveV9hdihzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICph
aSwgc3RydWN0IHViaV9haW5mX3ZvbHVtZSAqYXYpCit7CisJc3RydWN0IHViaV9haW5mX3BlYiAq
YWViOworCXN0cnVjdCByYl9ub2RlICp0aGlzID0gYXYtPnJvb3QucmJfbm9kZTsKKworCXdoaWxl
ICh0aGlzKSB7CisJCWlmICh0aGlzLT5yYl9sZWZ0KQorCQkJdGhpcyA9IHRoaXMtPnJiX2xlZnQ7
CisJCWVsc2UgaWYgKHRoaXMtPnJiX3JpZ2h0KQorCQkJdGhpcyA9IHRoaXMtPnJiX3JpZ2h0Owor
CQllbHNlIHsKKwkJCWFlYiA9IHJiX2VudHJ5KHRoaXMsIHN0cnVjdCB1YmlfYWluZl9wZWIsIHUu
cmIpOworCQkJdGhpcyA9IHJiX3BhcmVudCh0aGlzKTsKKwkJCWlmICh0aGlzKSB7CisJCQkJaWYg
KHRoaXMtPnJiX2xlZnQgPT0gJmFlYi0+dS5yYikKKwkJCQkJdGhpcy0+cmJfbGVmdCA9IE5VTEw7
CisJCQkJZWxzZQorCQkJCQl0aGlzLT5yYl9yaWdodCA9IE5VTEw7CisJCQl9CisKKwkJCWttZW1f
Y2FjaGVfZnJlZShhaS0+YWViX3NsYWJfY2FjaGUsIGFlYik7CisJCX0KKwl9CisJa2ZyZWUoYXYp
OworfQorCisvKioKKyAqIHViaV9kZXN0cm95X2FpIC0gZGVzdHJveSBhdHRhY2hpbmcgaW5mb3Jt
YXRpb24uCisgKiBAYWk6IGF0dGFjaGluZyBpbmZvcm1hdGlvbgorICovCit2b2lkIHViaV9kZXN0
cm95X2FpKHN0cnVjdCB1YmlfYXR0YWNoX2luZm8gKmFpKQoreworCXN0cnVjdCB1YmlfYWluZl9w
ZWIgKmFlYiwgKmFlYl90bXA7CisJc3RydWN0IHViaV9haW5mX3ZvbHVtZSAqYXY7CisJc3RydWN0
IHJiX25vZGUgKnJiOworCisJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGFlYiwgYWViX3RtcCwg
JmFpLT5hbGllbiwgdS5saXN0KSB7CisJCWxpc3RfZGVsKCZhZWItPnUubGlzdCk7CisJCWttZW1f
Y2FjaGVfZnJlZShhaS0+YWViX3NsYWJfY2FjaGUsIGFlYik7CisJfQorCWxpc3RfZm9yX2VhY2hf
ZW50cnlfc2FmZShhZWIsIGFlYl90bXAsICZhaS0+ZXJhc2UsIHUubGlzdCkgeworCQlsaXN0X2Rl
bCgmYWViLT51Lmxpc3QpOworCQlrbWVtX2NhY2hlX2ZyZWUoYWktPmFlYl9zbGFiX2NhY2hlLCBh
ZWIpOworCX0KKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoYWViLCBhZWJfdG1wLCAmYWktPmNv
cnIsIHUubGlzdCkgeworCQlsaXN0X2RlbCgmYWViLT51Lmxpc3QpOworCQlrbWVtX2NhY2hlX2Zy
ZWUoYWktPmFlYl9zbGFiX2NhY2hlLCBhZWIpOworCX0KKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUoYWViLCBhZWJfdG1wLCAmYWktPmZyZWUsIHUubGlzdCkgeworCQlsaXN0X2RlbCgmYWViLT51
Lmxpc3QpOworCQlrbWVtX2NhY2hlX2ZyZWUoYWktPmFlYl9zbGFiX2NhY2hlLCBhZWIpOworCX0K
KworCS8qIERlc3Ryb3kgdGhlIHZvbHVtZSBSQi10cmVlICovCisJcmIgPSBhaS0+dm9sdW1lcy5y
Yl9ub2RlOworCXdoaWxlIChyYikgeworCQlpZiAocmItPnJiX2xlZnQpCisJCQlyYiA9IHJiLT5y
Yl9sZWZ0OworCQllbHNlIGlmIChyYi0+cmJfcmlnaHQpCisJCQlyYiA9IHJiLT5yYl9yaWdodDsK
KwkJZWxzZSB7CisJCQlhdiA9IHJiX2VudHJ5KHJiLCBzdHJ1Y3QgdWJpX2FpbmZfdm9sdW1lLCBy
Yik7CisKKwkJCXJiID0gcmJfcGFyZW50KHJiKTsKKwkJCWlmIChyYikgeworCQkJCWlmIChyYi0+
cmJfbGVmdCA9PSAmYXYtPnJiKQorCQkJCQlyYi0+cmJfbGVmdCA9IE5VTEw7CisJCQkJZWxzZQor
CQkJCQlyYi0+cmJfcmlnaHQgPSBOVUxMOworCQkJfQorCisJCQlkZXN0cm95X2F2KGFpLCBhdik7
CisJCX0KKwl9CisKKwlpZiAoYWktPmFlYl9zbGFiX2NhY2hlKQorCQlrbWVtX2NhY2hlX2Rlc3Ry
b3koYWktPmFlYl9zbGFiX2NhY2hlKTsKKworCWtmcmVlKGFpKTsKK30KKworLyoqCisgKiBzZWxm
X2NoZWNrX2FpIC0gY2hlY2sgdGhlIGF0dGFjaGluZyBpbmZvcm1hdGlvbi4KKyAqIEB1Ymk6IFVC
SSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0CisgKiBAYWk6IGF0dGFjaGluZyBpbmZvcm1hdGlv
bgorICoKKyAqIFRoaXMgZnVuY3Rpb24gcmV0dXJucyB6ZXJvIGlmIHRoZSBhdHRhY2hpbmcgaW5m
b3JtYXRpb24gaXMgYWxsIHJpZ2h0LCBhbmQgYQorICogbmVnYXRpdmUgZXJyb3IgY29kZSBpZiBu
b3Qgb3IgaWYgYW4gZXJyb3Igb2NjdXJyZWQuCisgKi8KK3N0YXRpYyBpbnQgc2VsZl9jaGVja19h
aShzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSkKK3sK
KwlpbnQgcG51bSwgZXJyLCB2b2xzX2ZvdW5kID0gMDsKKwlzdHJ1Y3QgcmJfbm9kZSAqcmIxLCAq
cmIyOworCXN0cnVjdCB1YmlfYWluZl92b2x1bWUgKmF2OworCXN0cnVjdCB1YmlfYWluZl9wZWIg
KmFlYiwgKmxhc3RfYWViOworCXVpbnQ4X3QgKmJ1ZjsKKworCWlmICghdWJpLT5kYmctPmNoa19n
ZW4pCisJCXJldHVybiAwOworCisJLyoKKwkgKiBBdCBmaXJzdCwgY2hlY2sgdGhhdCBhdHRhY2hp
bmcgaW5mb3JtYXRpb24gaXMgT0suCisJICovCisJdWJpX3JiX2Zvcl9lYWNoX2VudHJ5KHJiMSwg
YXYsICZhaS0+dm9sdW1lcywgcmIpIHsKKwkJaW50IGxlYl9jb3VudCA9IDA7CisKKwkJY29uZF9y
ZXNjaGVkKCk7CisKKwkJdm9sc19mb3VuZCArPSAxOworCisJCWlmIChhaS0+aXNfZW1wdHkpIHsK
KwkJCXViaV9lcnIoImJhZCBpc19lbXB0eSBmbGFnIik7CisJCQlnb3RvIGJhZF9hdjsKKwkJfQor
CisJCWlmIChhdi0+dm9sX2lkIDwgMCB8fCBhdi0+aGlnaGVzdF9sbnVtIDwgMCB8fAorCQkgICAg
YXYtPmxlYl9jb3VudCA8IDAgfHwgYXYtPnZvbF90eXBlIDwgMCB8fCBhdi0+dXNlZF9lYnMgPCAw
IHx8CisJCSAgICBhdi0+ZGF0YV9wYWQgPCAwIHx8IGF2LT5sYXN0X2RhdGFfc2l6ZSA8IDApIHsK
KwkJCXViaV9lcnIoIm5lZ2F0aXZlIHZhbHVlcyIpOworCQkJZ290byBiYWRfYXY7CisJCX0KKwor
CQlpZiAoYXYtPnZvbF9pZCA+PSBVQklfTUFYX1ZPTFVNRVMgJiYKKwkJICAgIGF2LT52b2xfaWQg
PCBVQklfSU5URVJOQUxfVk9MX1NUQVJUKSB7CisJCQl1YmlfZXJyKCJiYWQgdm9sX2lkIik7CisJ
CQlnb3RvIGJhZF9hdjsKKwkJfQorCisJCWlmIChhdi0+dm9sX2lkID4gYWktPmhpZ2hlc3Rfdm9s
X2lkKSB7CisJCQl1YmlfZXJyKCJoaWdoZXN0X3ZvbF9pZCBpcyAlZCwgYnV0IHZvbF9pZCAlZCBp
cyB0aGVyZSIsCisJCQkJYWktPmhpZ2hlc3Rfdm9sX2lkLCBhdi0+dm9sX2lkKTsKKwkJCWdvdG8g
b3V0OworCQl9CisKKwkJaWYgKGF2LT52b2xfdHlwZSAhPSBVQklfRFlOQU1JQ19WT0xVTUUgJiYK
KwkJICAgIGF2LT52b2xfdHlwZSAhPSBVQklfU1RBVElDX1ZPTFVNRSkgeworCQkJdWJpX2Vycigi
YmFkIHZvbF90eXBlIik7CisJCQlnb3RvIGJhZF9hdjsKKwkJfQorCisJCWlmIChhdi0+ZGF0YV9w
YWQgPiB1YmktPmxlYl9zaXplIC8gMikgeworCQkJdWJpX2VycigiYmFkIGRhdGFfcGFkIik7CisJ
CQlnb3RvIGJhZF9hdjsKKwkJfQorCisJCWxhc3RfYWViID0gTlVMTDsKKwkJdWJpX3JiX2Zvcl9l
YWNoX2VudHJ5KHJiMiwgYWViLCAmYXYtPnJvb3QsIHUucmIpIHsKKwkJCWNvbmRfcmVzY2hlZCgp
OworCisJCQlsYXN0X2FlYiA9IGFlYjsKKwkJCWxlYl9jb3VudCArPSAxOworCisJCQlpZiAoYWVi
LT5wbnVtIDwgMCB8fCBhZWItPmVjIDwgMCkgeworCQkJCXViaV9lcnIoIm5lZ2F0aXZlIHZhbHVl
cyIpOworCQkJCWdvdG8gYmFkX2FlYjsKKwkJCX0KKworCQkJaWYgKGFlYi0+ZWMgPCBhaS0+bWlu
X2VjKSB7CisJCQkJdWJpX2VycigiYmFkIGFpLT5taW5fZWMgKCVkKSwgJWQgZm91bmQiLAorCQkJ
CQlhaS0+bWluX2VjLCBhZWItPmVjKTsKKwkJCQlnb3RvIGJhZF9hZWI7CisJCQl9CisKKwkJCWlm
IChhZWItPmVjID4gYWktPm1heF9lYykgeworCQkJCXViaV9lcnIoImJhZCBhaS0+bWF4X2VjICgl
ZCksICVkIGZvdW5kIiwKKwkJCQkJYWktPm1heF9lYywgYWViLT5lYyk7CisJCQkJZ290byBiYWRf
YWViOworCQkJfQorCisJCQlpZiAoYWViLT5wbnVtID49IHViaS0+cGViX2NvdW50KSB7CisJCQkJ
dWJpX2VycigidG9vIGhpZ2ggUEVCIG51bWJlciAlZCwgdG90YWwgUEVCcyAlZCIsCisJCQkJCWFl
Yi0+cG51bSwgdWJpLT5wZWJfY291bnQpOworCQkJCWdvdG8gYmFkX2FlYjsKKwkJCX0KKworCQkJ
aWYgKGF2LT52b2xfdHlwZSA9PSBVQklfU1RBVElDX1ZPTFVNRSkgeworCQkJCWlmIChhZWItPmxu
dW0gPj0gYXYtPnVzZWRfZWJzKSB7CisJCQkJCXViaV9lcnIoImJhZCBsbnVtIG9yIHVzZWRfZWJz
Iik7CisJCQkJCWdvdG8gYmFkX2FlYjsKKwkJCQl9CisJCQl9IGVsc2UgeworCQkJCWlmIChhdi0+
dXNlZF9lYnMgIT0gMCkgeworCQkJCQl1YmlfZXJyKCJub24temVybyB1c2VkX2VicyIpOworCQkJ
CQlnb3RvIGJhZF9hZWI7CisJCQkJfQorCQkJfQorCisJCQlpZiAoYWViLT5sbnVtID4gYXYtPmhp
Z2hlc3RfbG51bSkgeworCQkJCXViaV9lcnIoImluY29ycmVjdCBoaWdoZXN0X2xudW0gb3IgbG51
bSIpOworCQkJCWdvdG8gYmFkX2FlYjsKKwkJCX0KKwkJfQorCisJCWlmIChhdi0+bGViX2NvdW50
ICE9IGxlYl9jb3VudCkgeworCQkJdWJpX2VycigiYmFkIGxlYl9jb3VudCwgJWQgb2JqZWN0cyBp
biB0aGUgdHJlZSIsCisJCQkJbGViX2NvdW50KTsKKwkJCWdvdG8gYmFkX2F2OworCQl9CisKKwkJ
aWYgKCFsYXN0X2FlYikKKwkJCWNvbnRpbnVlOworCisJCWFlYiA9IGxhc3RfYWViOworCisJCWlm
IChhZWItPmxudW0gIT0gYXYtPmhpZ2hlc3RfbG51bSkgeworCQkJdWJpX2VycigiYmFkIGhpZ2hl
c3RfbG51bSIpOworCQkJZ290byBiYWRfYWViOworCQl9CisJfQorCisJaWYgKHZvbHNfZm91bmQg
IT0gYWktPnZvbHNfZm91bmQpIHsKKwkJdWJpX2VycigiYmFkIGFpLT52b2xzX2ZvdW5kICVkLCBz
aG91bGQgYmUgJWQiLAorCQkJYWktPnZvbHNfZm91bmQsIHZvbHNfZm91bmQpOworCQlnb3RvIG91
dDsKKwl9CisKKwkvKiBDaGVjayB0aGF0IGF0dGFjaGluZyBpbmZvcm1hdGlvbiBpcyBjb3JyZWN0
ICovCisJdWJpX3JiX2Zvcl9lYWNoX2VudHJ5KHJiMSwgYXYsICZhaS0+dm9sdW1lcywgcmIpIHsK
KwkJbGFzdF9hZWIgPSBOVUxMOworCQl1YmlfcmJfZm9yX2VhY2hfZW50cnkocmIyLCBhZWIsICZh
di0+cm9vdCwgdS5yYikgeworCQkJaW50IHZvbF90eXBlOworCisJCQljb25kX3Jlc2NoZWQoKTsK
KworCQkJbGFzdF9hZWIgPSBhZWI7CisKKwkJCWVyciA9IHViaV9pb19yZWFkX3ZpZF9oZHIodWJp
LCBhZWItPnBudW0sIHZpZGgsIDEpOworCQkJaWYgKGVyciAmJiBlcnIgIT0gVUJJX0lPX0JJVEZM
SVBTKSB7CisJCQkJdWJpX2VycigiVklEIGhlYWRlciBpcyBub3QgT0sgKCVkKSIsIGVycik7CisJ
CQkJaWYgKGVyciA+IDApCisJCQkJCWVyciA9IC1FSU87CisJCQkJcmV0dXJuIGVycjsKKwkJCX0K
KworCQkJdm9sX3R5cGUgPSB2aWRoLT52b2xfdHlwZSA9PSBVQklfVklEX0RZTkFNSUMgPworCQkJ
CSAgIFVCSV9EWU5BTUlDX1ZPTFVNRSA6IFVCSV9TVEFUSUNfVk9MVU1FOworCQkJaWYgKGF2LT52
b2xfdHlwZSAhPSB2b2xfdHlwZSkgeworCQkJCXViaV9lcnIoImJhZCB2b2xfdHlwZSIpOworCQkJ
CWdvdG8gYmFkX3ZpZF9oZHI7CisJCQl9CisKKwkJCWlmIChhZWItPnNxbnVtICE9IGJlNjRfdG9f
Y3B1KHZpZGgtPnNxbnVtKSkgeworCQkJCXViaV9lcnIoImJhZCBzcW51bSAlbGx1IiwgYWViLT5z
cW51bSk7CisJCQkJZ290byBiYWRfdmlkX2hkcjsKKwkJCX0KKworCQkJaWYgKGF2LT52b2xfaWQg
IT0gYmUzMl90b19jcHUodmlkaC0+dm9sX2lkKSkgeworCQkJCXViaV9lcnIoImJhZCB2b2xfaWQg
JWQiLCBhdi0+dm9sX2lkKTsKKwkJCQlnb3RvIGJhZF92aWRfaGRyOworCQkJfQorCisJCQlpZiAo
YXYtPmNvbXBhdCAhPSB2aWRoLT5jb21wYXQpIHsKKwkJCQl1YmlfZXJyKCJiYWQgY29tcGF0ICVk
IiwgdmlkaC0+Y29tcGF0KTsKKwkJCQlnb3RvIGJhZF92aWRfaGRyOworCQkJfQorCisJCQlpZiAo
YWViLT5sbnVtICE9IGJlMzJfdG9fY3B1KHZpZGgtPmxudW0pKSB7CisJCQkJdWJpX2VycigiYmFk
IGxudW0gJWQiLCBhZWItPmxudW0pOworCQkJCWdvdG8gYmFkX3ZpZF9oZHI7CisJCQl9CisKKwkJ
CWlmIChhdi0+dXNlZF9lYnMgIT0gYmUzMl90b19jcHUodmlkaC0+dXNlZF9lYnMpKSB7CisJCQkJ
dWJpX2VycigiYmFkIHVzZWRfZWJzICVkIiwgYXYtPnVzZWRfZWJzKTsKKwkJCQlnb3RvIGJhZF92
aWRfaGRyOworCQkJfQorCisJCQlpZiAoYXYtPmRhdGFfcGFkICE9IGJlMzJfdG9fY3B1KHZpZGgt
PmRhdGFfcGFkKSkgeworCQkJCXViaV9lcnIoImJhZCBkYXRhX3BhZCAlZCIsIGF2LT5kYXRhX3Bh
ZCk7CisJCQkJZ290byBiYWRfdmlkX2hkcjsKKwkJCX0KKwkJfQorCisJCWlmICghbGFzdF9hZWIp
CisJCQljb250aW51ZTsKKworCQlpZiAoYXYtPmhpZ2hlc3RfbG51bSAhPSBiZTMyX3RvX2NwdSh2
aWRoLT5sbnVtKSkgeworCQkJdWJpX2VycigiYmFkIGhpZ2hlc3RfbG51bSAlZCIsIGF2LT5oaWdo
ZXN0X2xudW0pOworCQkJZ290byBiYWRfdmlkX2hkcjsKKwkJfQorCisJCWlmIChhdi0+bGFzdF9k
YXRhX3NpemUgIT0gYmUzMl90b19jcHUodmlkaC0+ZGF0YV9zaXplKSkgeworCQkJdWJpX2Vycigi
YmFkIGxhc3RfZGF0YV9zaXplICVkIiwgYXYtPmxhc3RfZGF0YV9zaXplKTsKKwkJCWdvdG8gYmFk
X3ZpZF9oZHI7CisJCX0KKwl9CisKKwkvKgorCSAqIE1ha2Ugc3VyZSB0aGF0IGFsbCB0aGUgcGh5
c2ljYWwgZXJhc2VibG9ja3MgYXJlIGluIG9uZSBvZiB0aGUgbGlzdHMKKwkgKiBvciB0cmVlcy4K
KwkgKi8KKwlidWYgPSBremFsbG9jKHViaS0+cGViX2NvdW50LCBHRlBfS0VSTkVMKTsKKwlpZiAo
IWJ1ZikKKwkJcmV0dXJuIC1FTk9NRU07CisKKwlmb3IgKHBudW0gPSAwOyBwbnVtIDwgdWJpLT5w
ZWJfY291bnQ7IHBudW0rKykgeworCQllcnIgPSB1YmlfaW9faXNfYmFkKHViaSwgcG51bSk7CisJ
CWlmIChlcnIgPCAwKSB7CisJCQlrZnJlZShidWYpOworCQkJcmV0dXJuIGVycjsKKwkJfSBlbHNl
IGlmIChlcnIpCisJCQlidWZbcG51bV0gPSAxOworCX0KKworCXViaV9yYl9mb3JfZWFjaF9lbnRy
eShyYjEsIGF2LCAmYWktPnZvbHVtZXMsIHJiKQorCQl1YmlfcmJfZm9yX2VhY2hfZW50cnkocmIy
LCBhZWIsICZhdi0+cm9vdCwgdS5yYikKKwkJCWJ1ZlthZWItPnBudW1dID0gMTsKKworCWxpc3Rf
Zm9yX2VhY2hfZW50cnkoYWViLCAmYWktPmZyZWUsIHUubGlzdCkKKwkJYnVmW2FlYi0+cG51bV0g
PSAxOworCisJbGlzdF9mb3JfZWFjaF9lbnRyeShhZWIsICZhaS0+Y29yciwgdS5saXN0KQorCQli
dWZbYWViLT5wbnVtXSA9IDE7CisKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGFlYiwgJmFpLT5lcmFz
ZSwgdS5saXN0KQorCQlidWZbYWViLT5wbnVtXSA9IDE7CisKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5
KGFlYiwgJmFpLT5hbGllbiwgdS5saXN0KQorCQlidWZbYWViLT5wbnVtXSA9IDE7CisKKwllcnIg
PSAwOworCWZvciAocG51bSA9IDA7IHBudW0gPCB1YmktPnBlYl9jb3VudDsgcG51bSsrKQorCQlp
ZiAoIWJ1ZltwbnVtXSkgeworCQkJdWJpX2VycigiUEVCICVkIGlzIG5vdCByZWZlcnJlZCIsIHBu
dW0pOworCQkJZXJyID0gMTsKKwkJfQorCisJa2ZyZWUoYnVmKTsKKwlpZiAoZXJyKQorCQlnb3Rv
IG91dDsKKwlyZXR1cm4gMDsKKworYmFkX2FlYjoKKwl1YmlfZXJyKCJiYWQgYXR0YWNoaW5nIGlu
Zm9ybWF0aW9uIGFib3V0IExFQiAlZCIsIGFlYi0+bG51bSk7CisJdWJpX2R1bXBfYWViKGFlYiwg
MCk7CisJdWJpX2R1bXBfYXYoYXYpOworCWdvdG8gb3V0OworCitiYWRfYXY6CisJdWJpX2Vycigi
YmFkIGF0dGFjaGluZyBpbmZvcm1hdGlvbiBhYm91dCB2b2x1bWUgJWQiLCBhdi0+dm9sX2lkKTsK
Kwl1YmlfZHVtcF9hdihhdik7CisJZ290byBvdXQ7CisKK2JhZF92aWRfaGRyOgorCXViaV9lcnIo
ImJhZCBhdHRhY2hpbmcgaW5mb3JtYXRpb24gYWJvdXQgdm9sdW1lICVkIiwgYXYtPnZvbF9pZCk7
CisJdWJpX2R1bXBfYXYoYXYpOworCXViaV9kdW1wX3ZpZF9oZHIodmlkaCk7CisKK291dDoKKwlk
dW1wX3N0YWNrKCk7CisJcmV0dXJuIC1FSU5WQUw7Cit9CmRpZmYgLXVOIC11TnIgbGludXgtMy4w
L2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9kcml2ZXJz
L210ZC91YmkvYnVpbGQuYwotLS0gbGludXgtMy4wL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCTIw
MTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51Ymlmcy5s
YXRlc3QvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMJMjAxMi0wNi0yOCAxMToyNjoxNS4wMDAwMDAw
MDAgLTA1MDAKQEAgLTI3LDEwICsyNyw2IEBACiAgKiBtb2R1bGUgbG9hZCBwYXJhbWV0ZXJzIG9y
IHRoZSBrZXJuZWwgYm9vdCBwYXJhbWV0ZXJzLiBJZiBNVEQgZGV2aWNlcyB3ZXJlCiAgKiBzcGVj
aWZpZWQsIFVCSSBkb2VzIG5vdCBhdHRhY2ggYW55IE1URCBkZXZpY2UsIGJ1dCBpdCBpcyBwb3Nz
aWJsZSB0byBkbwogICogbGF0ZXIgdXNpbmcgdGhlICJVQkkgY29udHJvbCBkZXZpY2UiLgotICoK
LSAqIEF0IHRoZSBtb21lbnQgd2Ugb25seSBhdHRhY2ggVUJJIGRldmljZXMgYnkgc2Nhbm5pbmcs
IHdoaWNoIHdpbGwgYmVjb21lIGEKLSAqIGJvdHRsZW5lY2sgd2hlbiBmbGFzaGVzIHJlYWNoIGNl
cnRhaW4gbGFyZ2Ugc2l6ZS4gVGhlbiBvbmUgbWF5IGltcHJvdmUgVUJJCi0gKiBhbmQgYWRkIG90
aGVyIG1ldGhvZHMsIGFsdGhvdWdoIGl0IGRvZXMgbm90IHNlZW0gdG8gYmUgZWFzeSB0byBkby4K
ICAqLwogCiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CkBAIC01NTQsMTAgKzU1MCwxMCBAQAogfQog
CiAvKioKLSAqIGZyZWVfaW50ZXJuYWxfdm9sdW1lcyAtIGZyZWUgaW50ZXJuYWwgdm9sdW1lcy4K
KyAqIHViaV9mcmVlX2ludGVybmFsX3ZvbHVtZXMgLSBmcmVlIGludGVybmFsIHZvbHVtZXMuCiAg
KiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVjdAogICovCi1zdGF0aWMgdm9pZCBm
cmVlX2ludGVybmFsX3ZvbHVtZXMoc3RydWN0IHViaV9kZXZpY2UgKnViaSkKK3ZvaWQgdWJpX2Zy
ZWVfaW50ZXJuYWxfdm9sdW1lcyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKQogewogCWludCBpOwog
CkBAIC01NjksNTkgKzU2NSw2IEBACiB9CiAKIC8qKgotICogYXR0YWNoX2J5X3NjYW5uaW5nIC0g
YXR0YWNoIGFuIE1URCBkZXZpY2UgdXNpbmcgc2Nhbm5pbmcgbWV0aG9kLgotICogQHViaTogVUJJ
IGRldmljZSBkZXNjcmlwdG9yCi0gKgotICogVGhpcyBmdW5jdGlvbiByZXR1cm5zIHplcm8gaW4g
Y2FzZSBvZiBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgaW4KLSAqIGNhc2Ugb2Yg
ZmFpbHVyZS4KLSAqCi0gKiBOb3RlLCBjdXJyZW50bHkgdGhpcyBpcyB0aGUgb25seSBtZXRob2Qg
dG8gYXR0YWNoIFVCSSBkZXZpY2VzLiBIb3BlZnVsbHkgaW4KLSAqIHRoZSBmdXR1cmUgd2UnbGwg
aGF2ZSBtb3JlIHNjYWxhYmxlIGF0dGFjaGluZyBtZXRob2RzIGFuZCBhdm9pZCBmdWxsIG1lZGlh
Ci0gKiBzY2FubmluZy4gQnV0IGV2ZW4gaW4gdGhpcyBjYXNlIHNjYW5uaW5nIHdpbGwgYmUgbmVl
ZGVkIGFzIGEgZmFsbC1iYWNrCi0gKiBhdHRhY2hpbmcgbWV0aG9kIGlmIHRoZXJlIGFyZSBzb21l
IG9uLWZsYXNoIHRhYmxlIGNvcnJ1cHRpb25zLgotICovCi1zdGF0aWMgaW50IGF0dGFjaF9ieV9z
Y2FubmluZyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKQotewotCWludCBlcnI7Ci0Jc3RydWN0IHVi
aV9zY2FuX2luZm8gKnNpOwotCi0Jc2kgPSB1Ymlfc2Nhbih1YmkpOwotCWlmIChJU19FUlIoc2kp
KQotCQlyZXR1cm4gUFRSX0VSUihzaSk7Ci0KLQl1YmktPmJhZF9wZWJfY291bnQgPSBzaS0+YmFk
X3BlYl9jb3VudDsKLQl1YmktPmdvb2RfcGViX2NvdW50ID0gdWJpLT5wZWJfY291bnQgLSB1Ymkt
PmJhZF9wZWJfY291bnQ7Ci0JdWJpLT5jb3JyX3BlYl9jb3VudCA9IHNpLT5jb3JyX3BlYl9jb3Vu
dDsKLQl1YmktPm1heF9lYyA9IHNpLT5tYXhfZWM7Ci0JdWJpLT5tZWFuX2VjID0gc2ktPm1lYW5f
ZWM7Ci0JdWJpX21zZygibWF4LiBzZXF1ZW5jZSBudW1iZXI6ICAgICAgICVsbHUiLCBzaS0+bWF4
X3NxbnVtKTsKLQotCWVyciA9IHViaV9yZWFkX3ZvbHVtZV90YWJsZSh1YmksIHNpKTsKLQlpZiAo
ZXJyKQotCQlnb3RvIG91dF9zaTsKLQotCWVyciA9IHViaV93bF9pbml0X3NjYW4odWJpLCBzaSk7
Ci0JaWYgKGVycikKLQkJZ290byBvdXRfdnRibDsKLQotCWVyciA9IHViaV9lYmFfaW5pdF9zY2Fu
KHViaSwgc2kpOwotCWlmIChlcnIpCi0JCWdvdG8gb3V0X3dsOwotCi0JdWJpX3NjYW5fZGVzdHJv
eV9zaShzaSk7Ci0JcmV0dXJuIDA7Ci0KLW91dF93bDoKLQl1Ymlfd2xfY2xvc2UodWJpKTsKLW91
dF92dGJsOgotCWZyZWVfaW50ZXJuYWxfdm9sdW1lcyh1YmkpOwotCXZmcmVlKHViaS0+dnRibCk7
Ci1vdXRfc2k6Ci0JdWJpX3NjYW5fZGVzdHJveV9zaShzaSk7Ci0JcmV0dXJuIGVycjsKLX0KLQot
LyoqCiAgKiBpb19pbml0IC0gaW5pdGlhbGl6ZSBJL08gc3ViLXN5c3RlbSBmb3IgYSBnaXZlbiBV
QkkgZGV2aWNlLgogICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKICAqCkBA
IC03OTAsMTEgKzczMywxMSBAQAogCXViaV9tc2coImRhdGEgb2Zmc2V0OiAgICAgICAgICAgICAg
ICAlZCIsIHViaS0+bGViX3N0YXJ0KTsKIAogCS8qCi0JICogTm90ZSwgaWRlYWxseSwgd2UgaGF2
ZSB0byBpbml0aWFsaXplIHViaS0+YmFkX3BlYl9jb3VudCBoZXJlLiBCdXQKKwkgKiBOb3RlLCBp
ZGVhbGx5LCB3ZSBoYXZlIHRvIGluaXRpYWxpemUgQHViaS0+YmFkX3BlYl9jb3VudCBoZXJlLiBC
dXQKIAkgKiB1bmZvcnR1bmF0ZWx5LCBNVEQgZG9lcyBub3QgcHJvdmlkZSB0aGlzIGluZm9ybWF0
aW9uLiBXZSBzaG91bGQgbG9vcAogCSAqIG92ZXIgYWxsIHBoeXNpY2FsIGVyYXNlYmxvY2tzIGFu
ZCBpbnZva2UgbXRkLT5ibG9ja19pc19iYWQoKSBmb3IKLQkgKiBlYWNoIHBoeXNpY2FsIGVyYXNl
YmxvY2suIFNvLCB3ZSBza2lwIHViaS0+YmFkX3BlYl9jb3VudAotCSAqIHVuaW5pdGlhbGl6ZWQg
YW5kIGluaXRpYWxpemUgaXQgYWZ0ZXIgc2Nhbm5pbmcuCisJICogZWFjaCBwaHlzaWNhbCBlcmFz
ZWJsb2NrLiBTbywgd2UgbGVhdmUgQHViaS0+YmFkX3BlYl9jb3VudAorCSAqIHVuaW5pdGlhbGl6
ZWQgc28gZmFyLgogCSAqLwogCiAJcmV0dXJuIDA7CkBAIC04MDUsNyArNzQ4LDcgQEAKICAqIEB1
Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0CiAgKiBAdm9sX2lkOiBJRCBvZiB0aGUg
dm9sdW1lIHRvIHJlLXNpemUKICAqCi0gKiBUaGlzIGZ1bmN0aW9uIHJlLXNpemVzIHRoZSB2b2x1
bWUgbWFya2VkIGJ5IHRoZSBAVUJJX1ZUQkxfQVVUT1JFU0laRV9GTEcgaW4KKyAqIFRoaXMgZnVu
Y3Rpb24gcmUtc2l6ZXMgdGhlIHZvbHVtZSBtYXJrZWQgYnkgdGhlICVVQklfVlRCTF9BVVRPUkVT
SVpFX0ZMRyBpbgogICogdGhlIHZvbHVtZSB0YWJsZSB0byB0aGUgbGFyZ2VzdCBwb3NzaWJsZSBz
aXplLiBTZWUgY29tbWVudHMgaW4gdWJpLWhlYWRlci5oCiAgKiBmb3IgbW9yZSBkZXNjcmlwdGlv
biBvZiB0aGUgZmxhZy4gUmV0dXJucyB6ZXJvIGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYQogICog
bmVnYXRpdmUgZXJyb3IgY29kZSBpbiBjYXNlIG9mIGZhaWx1cmUuCkBAIC04ODEsNyArODI0LDcg
QEAKIAlmb3IgKGkgPSAwOyBpIDwgVUJJX01BWF9ERVZJQ0VTOyBpKyspIHsKIAkJdWJpID0gdWJp
X2RldmljZXNbaV07CiAJCWlmICh1YmkgJiYgbXRkLT5pbmRleCA9PSB1YmktPm10ZC0+aW5kZXgp
IHsKLQkJCWRiZ19lcnIoIm10ZCVkIGlzIGFscmVhZHkgYXR0YWNoZWQgdG8gdWJpJWQiLAorCQkJ
dWJpX2VycigibXRkJWQgaXMgYWxyZWFkeSBhdHRhY2hlZCB0byB1YmklZCIsCiAJCQkJbXRkLT5p
bmRleCwgaSk7CiAJCQlyZXR1cm4gLUVFWElTVDsKIAkJfQpAQCAtOTA3LDcgKzg1MCw3IEBACiAJ
CQlpZiAoIXViaV9kZXZpY2VzW3ViaV9udW1dKQogCQkJCWJyZWFrOwogCQlpZiAodWJpX251bSA9
PSBVQklfTUFYX0RFVklDRVMpIHsKLQkJCWRiZ19lcnIoIm9ubHkgJWQgVUJJIGRldmljZXMgbWF5
IGJlIGNyZWF0ZWQiLAorCQkJdWJpX2Vycigib25seSAlZCBVQkkgZGV2aWNlcyBtYXkgYmUgY3Jl
YXRlZCIsCiAJCQkJVUJJX01BWF9ERVZJQ0VTKTsKIAkJCXJldHVybiAtRU5GSUxFOwogCQl9CkBA
IC05MTcsNyArODYwLDcgQEAKIAogCQkvKiBNYWtlIHN1cmUgdWJpX251bSBpcyBub3QgYnVzeSAq
LwogCQlpZiAodWJpX2RldmljZXNbdWJpX251bV0pIHsKLQkJCWRiZ19lcnIoInViaSVkIGFscmVh
ZHkgZXhpc3RzIiwgdWJpX251bSk7CisJCQl1YmlfZXJyKCJ1YmklZCBhbHJlYWR5IGV4aXN0cyIs
IHViaV9udW0pOwogCQkJcmV0dXJuIC1FRVhJU1Q7CiAJCX0KIAl9CkBAIC05MzcsNyArODgwLDcg
QEAKIAlzcGluX2xvY2tfaW5pdCgmdWJpLT52b2x1bWVzX2xvY2spOwogCiAJdWJpX21zZygiYXR0
YWNoaW5nIG10ZCVkIHRvIHViaSVkIiwgbXRkLT5pbmRleCwgdWJpX251bSk7Ci0JZGJnX21zZygi
c2l6ZW9mKHN0cnVjdCB1Ymlfc2Nhbl9sZWIpICV6dSIsIHNpemVvZihzdHJ1Y3QgdWJpX3NjYW5f
bGViKSk7CisJZGJnX21zZygic2l6ZW9mKHN0cnVjdCB1YmlfYWluZl9wZWIpICV6dSIsIHNpemVv
ZihzdHJ1Y3QgdWJpX2FpbmZfcGViKSk7CiAJZGJnX21zZygic2l6ZW9mKHN0cnVjdCB1Ymlfd2xf
ZW50cnkpICV6dSIsIHNpemVvZihzdHJ1Y3QgdWJpX3dsX2VudHJ5KSk7CiAKIAllcnIgPSBpb19p
bml0KHViaSk7CkBAIC05NDUsMTggKzg4OCwxOCBAQAogCQlnb3RvIG91dF9mcmVlOwogCiAJZXJy
ID0gLUVOT01FTTsKLQl1YmktPnBlYl9idWYxID0gdm1hbGxvYyh1YmktPnBlYl9zaXplKTsKLQlp
ZiAoIXViaS0+cGViX2J1ZjEpCisJdWJpLT5wZWJfYnVmID0gdm1hbGxvYyh1YmktPnBlYl9zaXpl
KTsKKwlpZiAoIXViaS0+cGViX2J1ZikKIAkJZ290byBvdXRfZnJlZTsKIAotCXViaS0+cGViX2J1
ZjIgPSB2bWFsbG9jKHViaS0+cGViX3NpemUpOwotCWlmICghdWJpLT5wZWJfYnVmMikKKwllcnIg
PSB1YmlfZGVidWdnaW5nX2luaXRfZGV2KHViaSk7CisJaWYgKGVycikKIAkJZ290byBvdXRfZnJl
ZTsKIAotCWVyciA9IGF0dGFjaF9ieV9zY2FubmluZyh1YmkpOworCWVyciA9IHViaV9hdHRhY2go
dWJpKTsKIAlpZiAoZXJyKSB7Ci0JCWRiZ19lcnIoImZhaWxlZCB0byBhdHRhY2ggYnkgc2Nhbm5p
bmcsIGVycm9yICVkIiwgZXJyKTsKLQkJZ290byBvdXRfZnJlZTsKKwkJdWJpX2VycigiZmFpbGVk
IHRvIGF0dGFjaCBtdGQlZCwgZXJyb3IgJWQiLCBtdGQtPmluZGV4LCBlcnIpOworCQlnb3RvIG91
dF9kZWJ1Z2dpbmc7CiAJfQogCiAJaWYgKHViaS0+YXV0b3Jlc2l6ZV92b2xfaWQgIT0gLTEpIHsK
QEAgLTk2OSwxMiArOTEyLDE2IEBACiAJaWYgKGVycikKIAkJZ290byBvdXRfZGV0YWNoOwogCisJ
ZXJyID0gdWJpX2RlYnVnZnNfaW5pdF9kZXYodWJpKTsKKwlpZiAoZXJyKQorCQlnb3RvIG91dF91
aWY7CisKIAl1YmktPmJndF90aHJlYWQgPSBrdGhyZWFkX2NyZWF0ZSh1YmlfdGhyZWFkLCB1Ymks
IHViaS0+Ymd0X25hbWUpOwogCWlmIChJU19FUlIodWJpLT5iZ3RfdGhyZWFkKSkgewogCQllcnIg
PSBQVFJfRVJSKHViaS0+Ymd0X3RocmVhZCk7CiAJCXViaV9lcnIoImNhbm5vdCBzcGF3biBcIiVz
XCIsIGVycm9yICVkIiwgdWJpLT5iZ3RfbmFtZSwKIAkJCWVycik7Ci0JCWdvdG8gb3V0X3VpZjsK
KwkJZ290byBvdXRfZGVidWdmczsKIAl9CiAKIAl1YmlfbXNnKCJhdHRhY2hlZCBtdGQlZCB0byB1
YmklZCIsIG10ZC0+aW5kZXgsIHViaV9udW0pOwpAQCAtMTAwOCwxNSArOTU1LDIwIEBACiAJdWJp
X25vdGlmeV9hbGwodWJpLCBVQklfVk9MVU1FX0FEREVELCBOVUxMKTsKIAlyZXR1cm4gdWJpX251
bTsKIAorb3V0X2RlYnVnZnM6CisJdWJpX2RlYnVnZnNfZXhpdF9kZXYodWJpKTsKIG91dF91aWY6
CisJZ2V0X2RldmljZSgmdWJpLT5kZXYpOworCXViaV9hc3NlcnQocmVmKTsKIAl1aWZfY2xvc2Uo
dWJpKTsKIG91dF9kZXRhY2g6CiAJdWJpX3dsX2Nsb3NlKHViaSk7Ci0JZnJlZV9pbnRlcm5hbF92
b2x1bWVzKHViaSk7CisJdWJpX2ZyZWVfaW50ZXJuYWxfdm9sdW1lcyh1YmkpOwogCXZmcmVlKHVi
aS0+dnRibCk7CitvdXRfZGVidWdnaW5nOgorCXViaV9kZWJ1Z2dpbmdfZXhpdF9kZXYodWJpKTsK
IG91dF9mcmVlOgotCXZmcmVlKHViaS0+cGViX2J1ZjEpOwotCXZmcmVlKHViaS0+cGViX2J1ZjIp
OworCXZmcmVlKHViaS0+cGViX2J1Zik7CiAJaWYgKHJlZikKIAkJcHV0X2RldmljZSgmdWJpLT5k
ZXYpOwogCWVsc2UKQEAgLTEwODAsMTMgKzEwMzIsMTQgQEAKIAkgKi8KIAlnZXRfZGV2aWNlKCZ1
YmktPmRldik7CiAKKwl1YmlfZGVidWdmc19leGl0X2Rldih1YmkpOwogCXVpZl9jbG9zZSh1Ymkp
OwogCXViaV93bF9jbG9zZSh1YmkpOwotCWZyZWVfaW50ZXJuYWxfdm9sdW1lcyh1YmkpOworCXVi
aV9mcmVlX2ludGVybmFsX3ZvbHVtZXModWJpKTsKIAl2ZnJlZSh1YmktPnZ0YmwpOwogCXB1dF9t
dGRfZGV2aWNlKHViaS0+bXRkKTsKLQl2ZnJlZSh1YmktPnBlYl9idWYxKTsKLQl2ZnJlZSh1Ymkt
PnBlYl9idWYyKTsKKwl1YmlfZGVidWdnaW5nX2V4aXRfZGV2KHViaSk7CisJdmZyZWUodWJpLT5w
ZWJfYnVmKTsKIAl1YmlfbXNnKCJtdGQlZCBpcyBkZXRhY2hlZCBmcm9tIHViaSVkIiwgdWJpLT5t
dGQtPmluZGV4LCB1YmktPnViaV9udW0pOwogCXB1dF9kZXZpY2UoJnViaS0+ZGV2KTsKIAlyZXR1
cm4gMDsKQEAgLTExOTksNiArMTE1MiwxMSBAQAogCWlmICghdWJpX3dsX2VudHJ5X3NsYWIpCiAJ
CWdvdG8gb3V0X2Rldl91bnJlZzsKIAorCWVyciA9IHViaV9kZWJ1Z2ZzX2luaXQoKTsKKwlpZiAo
ZXJyKQorCQlnb3RvIG91dF9zbGFiOworCisKIAkvKiBBdHRhY2ggTVREIGRldmljZXMgKi8KIAlm
b3IgKGkgPSAwOyBpIDwgbXRkX2RldnM7IGkrKykgewogCQlzdHJ1Y3QgbXRkX2Rldl9wYXJhbSAq
cCA9ICZtdGRfZGV2X3BhcmFtW2ldOwpAQCAtMTI0Nyw2ICsxMjA1LDggQEAKIAkJCXViaV9kZXRh
Y2hfbXRkX2Rldih1YmlfZGV2aWNlc1trXS0+dWJpX251bSwgMSk7CiAJCQltdXRleF91bmxvY2so
JnViaV9kZXZpY2VzX211dGV4KTsKIAkJfQorCXViaV9kZWJ1Z2ZzX2V4aXQoKTsKK291dF9zbGFi
OgogCWttZW1fY2FjaGVfZGVzdHJveSh1Ymlfd2xfZW50cnlfc2xhYik7CiBvdXRfZGV2X3VucmVn
OgogCW1pc2NfZGVyZWdpc3RlcigmdWJpX2N0cmxfY2Rldik7CkBAIC0xMjcwLDYgKzEyMzAsNyBA
QAogCQkJdWJpX2RldGFjaF9tdGRfZGV2KHViaV9kZXZpY2VzW2ldLT51YmlfbnVtLCAxKTsKIAkJ
CW11dGV4X3VubG9jaygmdWJpX2RldmljZXNfbXV0ZXgpOwogCQl9CisJdWJpX2RlYnVnZnNfZXhp
dCgpOwogCWttZW1fY2FjaGVfZGVzdHJveSh1Ymlfd2xfZW50cnlfc2xhYik7CiAJbWlzY19kZXJl
Z2lzdGVyKCZ1YmlfY3RybF9jZGV2KTsKIAljbGFzc19yZW1vdmVfZmlsZSh1YmlfY2xhc3MsICZ1
YmlfdmVyc2lvbik7CmRpZmYgLXVOIC11TnIgbGludXgtMy4wL2RyaXZlcnMvbXRkL3ViaS9jZGV2
LmMgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2RyaXZlcnMvbXRkL3ViaS9jZGV2LmMKLS0tIGxp
bnV4LTMuMC9kcml2ZXJzL210ZC91YmkvY2Rldi5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAw
MDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL2Nk
ZXYuYwkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAwMDAwMCAtMDUwMApAQCAtNjMsNyArNjMsNyBA
QAogCXVzZXJzID0gdm9sLT5yZWFkZXJzICsgdm9sLT53cml0ZXJzICsgdm9sLT5leGNsdXNpdmU7
CiAJdWJpX2Fzc2VydCh1c2VycyA+IDApOwogCWlmICh1c2VycyA+IDEpIHsKLQkJZGJnX2Vycigi
JWQgdXNlcnMgZm9yIHZvbHVtZSAlZCIsIHVzZXJzLCB2b2wtPnZvbF9pZCk7CisJCXViaV9lcnIo
IiVkIHVzZXJzIGZvciB2b2x1bWUgJWQiLCB1c2Vycywgdm9sLT52b2xfaWQpOwogCQllcnIgPSAt
RUJVU1k7CiAJfSBlbHNlIHsKIAkJdm9sLT5yZWFkZXJzID0gdm9sLT53cml0ZXJzID0gMDsKQEAg
LTE1OSw3ICsxNTksNyBAQAogCiAJaWYgKHZvbC0+dXBkYXRpbmcpIHsKIAkJLyogVXBkYXRlIGlz
IGluIHByb2dyZXNzLCBzZWVraW5nIGlzIHByb2hpYml0ZWQgKi8KLQkJZGJnX2VycigidXBkYXRp
bmciKTsKKwkJdWJpX2VycigidXBkYXRpbmciKTsKIAkJcmV0dXJuIC1FQlVTWTsKIAl9CiAKQEAg
LTE3OCw3ICsxNzgsNyBAQAogCX0KIAogCWlmIChuZXdfb2Zmc2V0IDwgMCB8fCBuZXdfb2Zmc2V0
ID4gdm9sLT51c2VkX2J5dGVzKSB7Ci0JCWRiZ19lcnIoImJhZCBzZWVrICVsbGQiLCBuZXdfb2Zm
c2V0KTsKKwkJdWJpX2VycigiYmFkIHNlZWsgJWxsZCIsIG5ld19vZmZzZXQpOwogCQlyZXR1cm4g
LUVJTlZBTDsKIAl9CiAKQEAgLTIxMiwxMSArMjEyLDExIEBACiAJCWNvdW50LCAqb2ZmcCwgdm9s
LT52b2xfaWQpOwogCiAJaWYgKHZvbC0+dXBkYXRpbmcpIHsKLQkJZGJnX2VycigidXBkYXRpbmci
KTsKKwkJdWJpX2VycigidXBkYXRpbmciKTsKIAkJcmV0dXJuIC1FQlVTWTsKIAl9CiAJaWYgKHZv
bC0+dXBkX21hcmtlcikgewotCQlkYmdfZXJyKCJkYW1hZ2VkIHZvbHVtZSwgdXBkYXRlIG1hcmtl
ciBpcyBzZXQiKTsKKwkJdWJpX2VycigiZGFtYWdlZCB2b2x1bWUsIHVwZGF0ZSBtYXJrZXIgaXMg
c2V0Iik7CiAJCXJldHVybiAtRUJBREY7CiAJfQogCWlmICgqb2ZmcCA9PSB2b2wtPnVzZWRfYnl0
ZXMgfHwgY291bnQgPT0gMCkKQEAgLTI5Niw3ICsyOTYsNyBAQAogCiAJbG51bSA9IGRpdl91NjRf
cmVtKCpvZmZwLCB2b2wtPnVzYWJsZV9sZWJfc2l6ZSwgJm9mZik7CiAJaWYgKG9mZiAmICh1Ymkt
Pm1pbl9pb19zaXplIC0gMSkpIHsKLQkJZGJnX2VycigidW5hbGlnbmVkIHBvc2l0aW9uIik7CisJ
CXViaV9lcnIoInVuYWxpZ25lZCBwb3NpdGlvbiIpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAK
QEAgLTMwNSw3ICszMDUsNyBAQAogCiAJLyogV2UgY2FuIHdyaXRlIG9ubHkgaW4gZnJhY3Rpb25z
IG9mIHRoZSBtaW5pbXVtIEkvTyB1bml0ICovCiAJaWYgKGNvdW50ICYgKHViaS0+bWluX2lvX3Np
emUgLSAxKSkgewotCQlkYmdfZXJyKCJ1bmFsaWduZWQgd3JpdGUgbGVuZ3RoIik7CisJCXViaV9l
cnIoInVuYWxpZ25lZCB3cml0ZSBsZW5ndGgiKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCkBA
IC0zMzAsOCArMzMwLDcgQEAKIAkJCWJyZWFrOwogCQl9CiAKLQkJZXJyID0gdWJpX2ViYV93cml0
ZV9sZWIodWJpLCB2b2wsIGxudW0sIHRidWYsIG9mZiwgbGVuLAotCQkJCQlVQklfVU5LTk9XTik7
CisJCWVyciA9IHViaV9lYmFfd3JpdGVfbGViKHViaSwgdm9sLCBsbnVtLCB0YnVmLCBvZmYsIGxl
bik7CiAJCWlmIChlcnIpCiAJCQlicmVhazsKIApAQCAtNDczLDkgKzQ3Miw2IEBACiAJCWlmIChy
ZXEubG51bSA8IDAgfHwgcmVxLmxudW0gPj0gdm9sLT5yZXNlcnZlZF9wZWJzIHx8CiAJCSAgICBy
ZXEuYnl0ZXMgPCAwIHx8IHJlcS5sbnVtID49IHZvbC0+dXNhYmxlX2xlYl9zaXplKQogCQkJYnJl
YWs7Ci0JCWlmIChyZXEuZHR5cGUgIT0gVUJJX0xPTkdURVJNICYmIHJlcS5kdHlwZSAhPSBVQklf
U0hPUlRURVJNICYmCi0JCSAgICByZXEuZHR5cGUgIT0gVUJJX1VOS05PV04pCi0JCQlicmVhazsK
IAogCQllcnIgPSBnZXRfZXhjbHVzaXZlKGRlc2MpOwogCQlpZiAoZXJyIDwgMCkKQEAgLTUxNCw3
ICs1MTAsNyBAQAogCQlpZiAoZXJyKQogCQkJYnJlYWs7CiAKLQkJZXJyID0gdWJpX3dsX2ZsdXNo
KHViaSk7CisJCWVyciA9IHViaV93bF9mbHVzaCh1YmksIFVCSV9BTEwsIFVCSV9BTEwpOwogCQli
cmVhazsKIAl9CiAKQEAgLTUyOCw3ICs1MjQsNyBAQAogCQkJZXJyID0gLUVGQVVMVDsKIAkJCWJy
ZWFrOwogCQl9Ci0JCWVyciA9IHViaV9sZWJfbWFwKGRlc2MsIHJlcS5sbnVtLCByZXEuZHR5cGUp
OworCQllcnIgPSB1YmlfbGViX21hcChkZXNjLCByZXEubG51bSk7CiAJCWJyZWFrOwogCX0KIApA
QCAtNjI4LDYgKzYyNCw5IEBACiAJaWYgKHJlcS0+YWxpZ25tZW50ICE9IDEgJiYgbikKIAkJZ290
byBiYWQ7CiAKKwlpZiAoIXJlcS0+bmFtZVswXSB8fCAhcmVxLT5uYW1lX2xlbikKKwkJZ290byBi
YWQ7CisKIAlpZiAocmVxLT5uYW1lX2xlbiA+IFVCSV9WT0xfTkFNRV9NQVgpIHsKIAkJZXJyID0g
LUVOQU1FVE9PTE9ORzsKIAkJZ290byBiYWQ7CkBAIC02NDAsOCArNjM5LDggQEAKIAlyZXR1cm4g
MDsKIAogYmFkOgotCWRiZ19lcnIoImJhZCB2b2x1bWUgY3JlYXRpb24gcmVxdWVzdCIpOwotCXVi
aV9kYmdfZHVtcF9ta3ZvbF9yZXEocmVxKTsKKwl1YmlfZXJyKCJiYWQgdm9sdW1lIGNyZWF0aW9u
IHJlcXVlc3QiKTsKKwl1YmlfZHVtcF9ta3ZvbF9yZXEocmVxKTsKIAlyZXR1cm4gZXJyOwogfQog
CkBAIC03MDYsMTIgKzcwNSwxMiBAQAogCWZvciAoaSA9IDA7IGkgPCByZXEtPmNvdW50IC0gMTsg
aSsrKSB7CiAJCWZvciAobiA9IGkgKyAxOyBuIDwgcmVxLT5jb3VudDsgbisrKSB7CiAJCQlpZiAo
cmVxLT5lbnRzW2ldLnZvbF9pZCA9PSByZXEtPmVudHNbbl0udm9sX2lkKSB7Ci0JCQkJZGJnX2Vy
cigiZHVwbGljYXRlZCB2b2x1bWUgaWQgJWQiLAorCQkJCXViaV9lcnIoImR1cGxpY2F0ZWQgdm9s
dW1lIGlkICVkIiwKIAkJCQkJcmVxLT5lbnRzW2ldLnZvbF9pZCk7CiAJCQkJcmV0dXJuIC1FSU5W
QUw7CiAJCQl9CiAJCQlpZiAoIXN0cmNtcChyZXEtPmVudHNbaV0ubmFtZSwgcmVxLT5lbnRzW25d
Lm5hbWUpKSB7Ci0JCQkJZGJnX2VycigiZHVwbGljYXRlZCB2b2x1bWUgbmFtZSBcIiVzXCIiLAor
CQkJCXViaV9lcnIoImR1cGxpY2F0ZWQgdm9sdW1lIG5hbWUgXCIlc1wiIiwKIAkJCQkJcmVxLT5l
bnRzW2ldLm5hbWUpOwogCQkJCXJldHVybiAtRUlOVkFMOwogCQkJfQpAQCAtNzM0LDcgKzczMyw3
IEBACiAJCXJlLT5kZXNjID0gdWJpX29wZW5fdm9sdW1lKHViaS0+dWJpX251bSwgdm9sX2lkLCBV
QklfRVhDTFVTSVZFKTsKIAkJaWYgKElTX0VSUihyZS0+ZGVzYykpIHsKIAkJCWVyciA9IFBUUl9F
UlIocmUtPmRlc2MpOwotCQkJZGJnX2VycigiY2Fubm90IG9wZW4gdm9sdW1lICVkLCBlcnJvciAl
ZCIsIHZvbF9pZCwgZXJyKTsKKwkJCXViaV9lcnIoImNhbm5vdCBvcGVuIHZvbHVtZSAlZCwgZXJy
b3IgJWQiLCB2b2xfaWQsIGVycik7CiAJCQlrZnJlZShyZSk7CiAJCQlnb3RvIG91dF9mcmVlOwog
CQl9CkBAIC03OTMsNyArNzkyLDcgQEAKIAkJCQljb250aW51ZTsKIAogCQkJLyogVGhlIHZvbHVt
ZSBleGlzdHMgYnV0IGJ1c3ksIG9yIGFuIGVycm9yIG9jY3VycmVkICovCi0JCQlkYmdfZXJyKCJj
YW5ub3Qgb3BlbiB2b2x1bWUgXCIlc1wiLCBlcnJvciAlZCIsCisJCQl1YmlfZXJyKCJjYW5ub3Qg
b3BlbiB2b2x1bWUgXCIlc1wiLCBlcnJvciAlZCIsCiAJCQkJcmUtPm5ld19uYW1lLCBlcnIpOwog
CQkJZ290byBvdXRfZnJlZTsKIAkJfQpkaWZmIC11TiAtdU5yIGxpbnV4LTMuMC9kcml2ZXJzL210
ZC91YmkvZGVidWcuYyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL2Rl
YnVnLmMKLS0tIGxpbnV4LTMuMC9kcml2ZXJzL210ZC91YmkvZGVidWcuYwkyMDExLTA3LTIxIDIx
OjE3OjIzLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2RyaXZl
cnMvbXRkL3ViaS9kZWJ1Zy5jCTIwMTItMDYtMjggMTE6MjY6MTUuMDAwMDAwMDAwIC0wNTAwCkBA
IC0xOCwzMiArMTgsNDkgQEAKICAqIEF1dGhvcjogQXJ0ZW0gQml0eXV0c2tpeSAo0JHQuNGC0Y7R
htC60LjQuSDQkNGA0YLRkdC8KQogICovCiAKLS8qCi0gKiBIZXJlIHdlIGtlZXAgYWxsIHRoZSBV
QkkgZGVidWdnaW5nIHN0dWZmIHdoaWNoIHNob3VsZCBub3JtYWxseSBiZSBkaXNhYmxlZAotICog
YW5kIGNvbXBpbGVkLW91dCwgYnV0IGl0IGlzIGV4dHJlbWVseSBoZWxwZnVsIHdoZW4gaHVudGlu
ZyBidWdzIG9yIGRvaW5nIGJpZwotICogY2hhbmdlcy4KLSAqLwotCi0jaWZkZWYgQ09ORklHX01U
RF9VQklfREVCVUcKLQogI2luY2x1ZGUgInViaS5oIgorI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMu
aD4KKyNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
Ci0jaW5jbHVkZSA8bGludXgvbW9kdWxlcGFyYW0uaD4KIAotdW5zaWduZWQgaW50IHViaV9jaGtf
ZmxhZ3M7Ci11bnNpZ25lZCBpbnQgdWJpX3RzdF9mbGFnczsKIAotbW9kdWxlX3BhcmFtX25hbWVk
KGRlYnVnX2Noa3MsIHViaV9jaGtfZmxhZ3MsIHVpbnQsIFNfSVJVR08gfCBTX0lXVVNSKTsKLW1v
ZHVsZV9wYXJhbV9uYW1lZChkZWJ1Z190c3RzLCB1YmlfY2hrX2ZsYWdzLCB1aW50LCBTX0lSVUdP
IHwgU19JV1VTUik7CisvKioKKyAqIHViaV9kdW1wX2ZsYXNoIC0gZHVtcCBhIHJlZ2lvbiBvZiBm
bGFzaC4KKyAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0CisgKiBAcG51bTog
dGhlIHBoeXNpY2FsIGVyYXNlYmxvY2sgbnVtYmVyIHRvIGR1bXAKKyAqIEBvZmZzZXQ6IHRoZSBz
dGFydGluZyBvZmZzZXQgd2l0aGluIHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIHRvIGR1bXAKKyAq
IEBsZW46IHRoZSBsZW5ndGggb2YgdGhlIHJlZ2lvbiB0byBkdW1wCisgKi8KK3ZvaWQgdWJpX2R1
bXBfZmxhc2goc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IHBudW0sIGludCBvZmZzZXQsIGlu
dCBsZW4pCit7CisJaW50IGVycjsKKwlzaXplX3QgcmVhZDsKKwl2b2lkICpidWY7CisJbG9mZl90
IGFkZHIgPSAobG9mZl90KXBudW0gKiB1YmktPnBlYl9zaXplICsgb2Zmc2V0OwogCi1NT0RVTEVf
UEFSTV9ERVNDKGRlYnVnX2Noa3MsICJEZWJ1ZyBjaGVjayBmbGFncyIpOwotTU9EVUxFX1BBUk1f
REVTQyhkZWJ1Z190c3RzLCAiRGVidWcgc3BlY2lhbCB0ZXN0IGZsYWdzIik7CisJYnVmID0gdm1h
bGxvYyhsZW4pOworCWlmICghYnVmKQorCQlyZXR1cm47CisJZXJyID0gdWJpLT5tdGQtPnJlYWQo
dWJpLT5tdGQsIGFkZHIsIGxlbiwgJnJlYWQsIGJ1Zik7CisJaWYgKGVyciAmJiBlcnIgIT0gLUVV
Q0xFQU4pIHsKKwkJdWJpX2VycigiZXJyb3IgJWQgd2hpbGUgcmVhZGluZyAlZCBieXRlcyBmcm9t
IFBFQiAlZDolZCwgIgorCQkJInJlYWQgJXpkIGJ5dGVzIiwgZXJyLCBsZW4sIHBudW0sIG9mZnNl
dCwgcmVhZCk7CisJCWdvdG8gb3V0OworCX0KKworCXViaV9tc2coImR1bXBpbmcgJWQgYnl0ZXMg
b2YgZGF0YSBmcm9tIFBFQiAlZCwgb2Zmc2V0ICVkIiwKKwkJbGVuLCBwbnVtLCBvZmZzZXQpOwor
CXByaW50X2hleF9kdW1wKEtFUk5fREVCVUcsICIiLCBEVU1QX1BSRUZJWF9PRkZTRVQsIDMyLCAx
LCBidWYsIGxlbiwgMSk7CitvdXQ6CisJdmZyZWUoYnVmKTsKKwlyZXR1cm47Cit9CiAKIC8qKgot
ICogdWJpX2RiZ19kdW1wX2VjX2hkciAtIGR1bXAgYW4gZXJhc2UgY291bnRlciBoZWFkZXIuCisg
KiB1YmlfZHVtcF9lY19oZHIgLSBkdW1wIGFuIGVyYXNlIGNvdW50ZXIgaGVhZGVyLgogICogQGVj
X2hkcjogdGhlIGVyYXNlIGNvdW50ZXIgaGVhZGVyIHRvIGR1bXAKICAqLwotdm9pZCB1YmlfZGJn
X2R1bXBfZWNfaGRyKGNvbnN0IHN0cnVjdCB1YmlfZWNfaGRyICplY19oZHIpCit2b2lkIHViaV9k
dW1wX2VjX2hkcihjb25zdCBzdHJ1Y3QgdWJpX2VjX2hkciAqZWNfaGRyKQogewogCXByaW50ayhL
RVJOX0RFQlVHICJFcmFzZSBjb3VudGVyIGhlYWRlciBkdW1wOlxuIik7CiAJcHJpbnRrKEtFUk5f
REVCVUcgIlx0bWFnaWMgICAgICAgICAgJSMwOHhcbiIsCkBAIC02NSwxMCArODIsMTAgQEAKIH0K
IAogLyoqCi0gKiB1YmlfZGJnX2R1bXBfdmlkX2hkciAtIGR1bXAgYSB2b2x1bWUgaWRlbnRpZmll
ciBoZWFkZXIuCisgKiB1YmlfZHVtcF92aWRfaGRyIC0gZHVtcCBhIHZvbHVtZSBpZGVudGlmaWVy
IGhlYWRlci4KICAqIEB2aWRfaGRyOiB0aGUgdm9sdW1lIGlkZW50aWZpZXIgaGVhZGVyIHRvIGR1
bXAKICAqLwotdm9pZCB1YmlfZGJnX2R1bXBfdmlkX2hkcihjb25zdCBzdHJ1Y3QgdWJpX3ZpZF9o
ZHIgKnZpZF9oZHIpCit2b2lkIHViaV9kdW1wX3ZpZF9oZHIoY29uc3Qgc3RydWN0IHViaV92aWRf
aGRyICp2aWRfaGRyKQogewogCXByaW50ayhLRVJOX0RFQlVHICJWb2x1bWUgaWRlbnRpZmllciBo
ZWFkZXIgZHVtcDpcbiIpOwogCXByaW50ayhLRVJOX0RFQlVHICJcdG1hZ2ljICAgICAlMDh4XG4i
LCBiZTMyX3RvX2NwdSh2aWRfaGRyLT5tYWdpYykpOwpAQCAtOTAsMTAgKzEwNywxMCBAQAogfQog
CiAvKioKLSAqIHViaV9kYmdfZHVtcF92b2xfaW5mby0gZHVtcCB2b2x1bWUgaW5mb3JtYXRpb24u
CisgKiB1YmlfZHVtcF92b2xfaW5mbyAtIGR1bXAgdm9sdW1lIGluZm9ybWF0aW9uLgogICogQHZv
bDogVUJJIHZvbHVtZSBkZXNjcmlwdGlvbiBvYmplY3QKICAqLwotdm9pZCB1YmlfZGJnX2R1bXBf
dm9sX2luZm8oY29uc3Qgc3RydWN0IHViaV92b2x1bWUgKnZvbCkKK3ZvaWQgdWJpX2R1bXBfdm9s
X2luZm8oY29uc3Qgc3RydWN0IHViaV92b2x1bWUgKnZvbCkKIHsKIAlwcmludGsoS0VSTl9ERUJV
RyAiVm9sdW1lIGluZm9ybWF0aW9uIGR1bXA6XG4iKTsKIAlwcmludGsoS0VSTl9ERUJVRyAiXHR2
b2xfaWQgICAgICAgICAgJWRcbiIsIHZvbC0+dm9sX2lkKTsKQEAgLTEyMCwxMSArMTM3LDExIEBA
CiB9CiAKIC8qKgotICogdWJpX2RiZ19kdW1wX3Z0YmxfcmVjb3JkIC0gZHVtcCBhICZzdHJ1Y3Qg
dWJpX3Z0YmxfcmVjb3JkIG9iamVjdC4KKyAqIHViaV9kdW1wX3Z0YmxfcmVjb3JkIC0gZHVtcCBh
ICZzdHJ1Y3QgdWJpX3Z0YmxfcmVjb3JkIG9iamVjdC4KICAqIEByOiB0aGUgb2JqZWN0IHRvIGR1
bXAKICAqIEBpZHg6IHZvbHVtZSB0YWJsZSBpbmRleAogICovCi12b2lkIHViaV9kYmdfZHVtcF92
dGJsX3JlY29yZChjb25zdCBzdHJ1Y3QgdWJpX3Z0YmxfcmVjb3JkICpyLCBpbnQgaWR4KQordm9p
ZCB1YmlfZHVtcF92dGJsX3JlY29yZChjb25zdCBzdHJ1Y3QgdWJpX3Z0YmxfcmVjb3JkICpyLCBp
bnQgaWR4KQogewogCWludCBuYW1lX2xlbiA9IGJlMTZfdG9fY3B1KHItPm5hbWVfbGVuKTsKIApA
QCAtMTU0LDQ0ICsxNzEsNDQgQEAKIH0KIAogLyoqCi0gKiB1YmlfZGJnX2R1bXBfc3YgLSBkdW1w
IGEgJnN0cnVjdCB1Ymlfc2Nhbl92b2x1bWUgb2JqZWN0LgotICogQHN2OiB0aGUgb2JqZWN0IHRv
IGR1bXAKKyAqIHViaV9kdW1wX2F2IC0gZHVtcCBhICZzdHJ1Y3QgdWJpX2FpbmZfdm9sdW1lIG9i
amVjdC4KKyAqIEBhdjogdGhlIG9iamVjdCB0byBkdW1wCiAgKi8KLXZvaWQgdWJpX2RiZ19kdW1w
X3N2KGNvbnN0IHN0cnVjdCB1Ymlfc2Nhbl92b2x1bWUgKnN2KQordm9pZCB1YmlfZHVtcF9hdihj
b25zdCBzdHJ1Y3QgdWJpX2FpbmZfdm9sdW1lICphdikKIHsKLQlwcmludGsoS0VSTl9ERUJVRyAi
Vm9sdW1lIHNjYW5uaW5nIGluZm9ybWF0aW9uIGR1bXA6XG4iKTsKLQlwcmludGsoS0VSTl9ERUJV
RyAiXHR2b2xfaWQgICAgICAgICAlZFxuIiwgc3YtPnZvbF9pZCk7Ci0JcHJpbnRrKEtFUk5fREVC
VUcgIlx0aGlnaGVzdF9sbnVtICAgJWRcbiIsIHN2LT5oaWdoZXN0X2xudW0pOwotCXByaW50ayhL
RVJOX0RFQlVHICJcdGxlYl9jb3VudCAgICAgICVkXG4iLCBzdi0+bGViX2NvdW50KTsKLQlwcmlu
dGsoS0VSTl9ERUJVRyAiXHRjb21wYXQgICAgICAgICAlZFxuIiwgc3YtPmNvbXBhdCk7Ci0JcHJp
bnRrKEtFUk5fREVCVUcgIlx0dm9sX3R5cGUgICAgICAgJWRcbiIsIHN2LT52b2xfdHlwZSk7Ci0J
cHJpbnRrKEtFUk5fREVCVUcgIlx0dXNlZF9lYnMgICAgICAgJWRcbiIsIHN2LT51c2VkX2Vicyk7
Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0bGFzdF9kYXRhX3NpemUgJWRcbiIsIHN2LT5sYXN0X2Rh
dGFfc2l6ZSk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0ZGF0YV9wYWQgICAgICAgJWRcbiIsIHN2
LT5kYXRhX3BhZCk7CisJcHJpbnRrKEtFUk5fREVCVUcgIlZvbHVtZSBhdHRhY2hpbmcgaW5mb3Jt
YXRpb24gZHVtcDpcbiIpOworCXByaW50ayhLRVJOX0RFQlVHICJcdHZvbF9pZCAgICAgICAgICVk
XG4iLCBhdi0+dm9sX2lkKTsKKwlwcmludGsoS0VSTl9ERUJVRyAiXHRoaWdoZXN0X2xudW0gICAl
ZFxuIiwgYXYtPmhpZ2hlc3RfbG51bSk7CisJcHJpbnRrKEtFUk5fREVCVUcgIlx0bGViX2NvdW50
ICAgICAgJWRcbiIsIGF2LT5sZWJfY291bnQpOworCXByaW50ayhLRVJOX0RFQlVHICJcdGNvbXBh
dCAgICAgICAgICVkXG4iLCBhdi0+Y29tcGF0KTsKKwlwcmludGsoS0VSTl9ERUJVRyAiXHR2b2xf
dHlwZSAgICAgICAlZFxuIiwgYXYtPnZvbF90eXBlKTsKKwlwcmludGsoS0VSTl9ERUJVRyAiXHR1
c2VkX2VicyAgICAgICAlZFxuIiwgYXYtPnVzZWRfZWJzKTsKKwlwcmludGsoS0VSTl9ERUJVRyAi
XHRsYXN0X2RhdGFfc2l6ZSAlZFxuIiwgYXYtPmxhc3RfZGF0YV9zaXplKTsKKwlwcmludGsoS0VS
Tl9ERUJVRyAiXHRkYXRhX3BhZCAgICAgICAlZFxuIiwgYXYtPmRhdGFfcGFkKTsKIH0KIAogLyoq
Ci0gKiB1YmlfZGJnX2R1bXBfc2ViIC0gZHVtcCBhICZzdHJ1Y3QgdWJpX3NjYW5fbGViIG9iamVj
dC4KLSAqIEBzZWI6IHRoZSBvYmplY3QgdG8gZHVtcAorICogdWJpX2R1bXBfYWViIC0gZHVtcCBh
ICZzdHJ1Y3QgdWJpX2FpbmZfcGViIG9iamVjdC4KKyAqIEBhZWI6IHRoZSBvYmplY3QgdG8gZHVt
cAogICogQHR5cGU6IG9iamVjdCB0eXBlOiAwIC0gbm90IGNvcnJ1cHRlZCwgMSAtIGNvcnJ1cHRl
ZAogICovCi12b2lkIHViaV9kYmdfZHVtcF9zZWIoY29uc3Qgc3RydWN0IHViaV9zY2FuX2xlYiAq
c2ViLCBpbnQgdHlwZSkKK3ZvaWQgdWJpX2R1bXBfYWViKGNvbnN0IHN0cnVjdCB1YmlfYWluZl9w
ZWIgKmFlYiwgaW50IHR5cGUpCiB7Ci0JcHJpbnRrKEtFUk5fREVCVUcgImVyYXNlYmxvY2sgc2Nh
bm5pbmcgaW5mb3JtYXRpb24gZHVtcDpcbiIpOwotCXByaW50ayhLRVJOX0RFQlVHICJcdGVjICAg
ICAgICVkXG4iLCBzZWItPmVjKTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRwbnVtICAgICAlZFxu
Iiwgc2ViLT5wbnVtKTsKKwlwcmludGsoS0VSTl9ERUJVRyAiZXJhc2VibG9jayBhdHRhY2hpbmcg
aW5mb3JtYXRpb24gZHVtcDpcbiIpOworCXByaW50ayhLRVJOX0RFQlVHICJcdGVjICAgICAgICVk
XG4iLCBhZWItPmVjKTsKKwlwcmludGsoS0VSTl9ERUJVRyAiXHRwbnVtICAgICAlZFxuIiwgYWVi
LT5wbnVtKTsKIAlpZiAodHlwZSA9PSAwKSB7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGxudW0g
ICAgICVkXG4iLCBzZWItPmxudW0pOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRzY3J1YiAgICAl
ZFxuIiwgc2ViLT5zY3J1Yik7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdHNxbnVtICAgICVsbHVc
biIsIHNlYi0+c3FudW0pOworCQlwcmludGsoS0VSTl9ERUJVRyAiXHRsbnVtICAgICAlZFxuIiwg
YWViLT5sbnVtKTsKKwkJcHJpbnRrKEtFUk5fREVCVUcgIlx0c2NydWIgICAgJWRcbiIsIGFlYi0+
c2NydWIpOworCQlwcmludGsoS0VSTl9ERUJVRyAiXHRzcW51bSAgICAlbGx1XG4iLCBhZWItPnNx
bnVtKTsKIAl9CiB9CiAKIC8qKgotICogdWJpX2RiZ19kdW1wX21rdm9sX3JlcSAtIGR1bXAgYSAm
c3RydWN0IHViaV9ta3ZvbF9yZXEgb2JqZWN0LgorICogdWJpX2R1bXBfbWt2b2xfcmVxIC0gZHVt
cCBhICZzdHJ1Y3QgdWJpX21rdm9sX3JlcSBvYmplY3QuCiAgKiBAcmVxOiB0aGUgb2JqZWN0IHRv
IGR1bXAKICAqLwotdm9pZCB1YmlfZGJnX2R1bXBfbWt2b2xfcmVxKGNvbnN0IHN0cnVjdCB1Ymlf
bWt2b2xfcmVxICpyZXEpCit2b2lkIHViaV9kdW1wX21rdm9sX3JlcShjb25zdCBzdHJ1Y3QgdWJp
X21rdm9sX3JlcSAqcmVxKQogewogCWNoYXIgbm1bMTddOwogCkBAIC0yMDgsMzUgKzIyNSwyNjgg
QEAKIH0KIAogLyoqCi0gKiB1YmlfZGJnX2R1bXBfZmxhc2ggLSBkdW1wIGEgcmVnaW9uIG9mIGZs
YXNoLgorICogdWJpX2RlYnVnZ2luZ19pbml0X2RldiAtIGluaXRpYWxpemUgZGVidWdnaW5nIGZv
ciBhbiBVQkkgZGV2aWNlLgogICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QK
LSAqIEBwbnVtOiB0aGUgcGh5c2ljYWwgZXJhc2VibG9jayBudW1iZXIgdG8gZHVtcAotICogQG9m
ZnNldDogdGhlIHN0YXJ0aW5nIG9mZnNldCB3aXRoaW4gdGhlIHBoeXNpY2FsIGVyYXNlYmxvY2sg
dG8gZHVtcAotICogQGxlbjogdGhlIGxlbmd0aCBvZiB0aGUgcmVnaW9uIHRvIGR1bXAKKyAqCisg
KiBUaGlzIGZ1bmN0aW9uIGluaXRpYWxpemVzIGRlYnVnZ2luZy1yZWxhdGVkIGRhdGEgZm9yIFVC
SSBkZXZpY2UgQHViaS4KKyAqIFJldHVybnMgemVybyBpbiBjYXNlIG9mIHN1Y2Nlc3MgYW5kIGEg
bmVnYXRpdmUgZXJyb3IgY29kZSBpbiBjYXNlIG9mCisgKiBmYWlsdXJlLgogICovCi12b2lkIHVi
aV9kYmdfZHVtcF9mbGFzaChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwgaW50IG9m
ZnNldCwgaW50IGxlbikKK2ludCB1YmlfZGVidWdnaW5nX2luaXRfZGV2KHN0cnVjdCB1YmlfZGV2
aWNlICp1YmkpCiB7Ci0JaW50IGVycjsKLQlzaXplX3QgcmVhZDsKLQl2b2lkICpidWY7Ci0JbG9m
Zl90IGFkZHIgPSAobG9mZl90KXBudW0gKiB1YmktPnBlYl9zaXplICsgb2Zmc2V0OworCXViaS0+
ZGJnID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHViaV9kZWJ1Z19pbmZvKSwgR0ZQX0tFUk5FTCk7
CisJaWYgKCF1YmktPmRiZykKKwkJcmV0dXJuIC1FTk9NRU07CiAKLQlidWYgPSB2bWFsbG9jKGxl
bik7Ci0JaWYgKCFidWYpCi0JCXJldHVybjsKLQllcnIgPSB1YmktPm10ZC0+cmVhZCh1YmktPm10
ZCwgYWRkciwgbGVuLCAmcmVhZCwgYnVmKTsKLQlpZiAoZXJyICYmIGVyciAhPSAtRVVDTEVBTikg
ewotCQl1YmlfZXJyKCJlcnJvciAlZCB3aGlsZSByZWFkaW5nICVkIGJ5dGVzIGZyb20gUEVCICVk
OiVkLCAiCi0JCQkicmVhZCAlemQgYnl0ZXMiLCBlcnIsIGxlbiwgcG51bSwgb2Zmc2V0LCByZWFk
KTsKKwlyZXR1cm4gMDsKK30KKworLyoqCisgKiB1YmlfZGVidWdnaW5nX2V4aXRfZGV2IC0gZnJl
ZSBkZWJ1Z2dpbmcgZGF0YSBmb3IgYW4gVUJJIGRldmljZS4KKyAqIEB1Ymk6IFVCSSBkZXZpY2Ug
ZGVzY3JpcHRpb24gb2JqZWN0CisgKi8KK3ZvaWQgdWJpX2RlYnVnZ2luZ19leGl0X2RldihzdHJ1
Y3QgdWJpX2RldmljZSAqdWJpKQoreworCWtmcmVlKHViaS0+ZGJnKTsKK30KKworLyoKKyAqIFJv
b3QgZGlyZWN0b3J5IGZvciBVQkkgc3R1ZmYgaW4gZGVidWdmcy4gQ29udGFpbnMgc3ViLWRpcmVj
dG9yaWVzIHdoaWNoCisgKiBjb250YWluIHRoZSBzdHVmZiBzcGVjaWZpYyB0byBwYXJ0aWN1bGFy
IFVCSSBkZXZpY2VzLgorICovCitzdGF0aWMgc3RydWN0IGRlbnRyeSAqZGZzX3Jvb3RkaXI7CisK
Ky8qKgorICogdWJpX2RlYnVnZnNfaW5pdCAtIGNyZWF0ZSBVQkkgZGVidWdmcyBkaXJlY3Rvcnku
CisgKgorICogQ3JlYXRlIFVCSSBkZWJ1Z2ZzIGRpcmVjdG9yeS4gUmV0dXJucyB6ZXJvIGluIGNh
c2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZQorICogZXJyb3IgY29kZSBpbiBjYXNlIG9mIGZh
aWx1cmUuCisgKi8KK2ludCB1YmlfZGVidWdmc19pbml0KHZvaWQpCit7CisjaWYgZGVmaW5lZChD
T05GSUdfREVCVUdfRlMpIHx8IGRlZmluZWQoQ09ORklHX0RFQlVHX0ZTX01PRFVMRSkKKwlkZnNf
cm9vdGRpciA9IGRlYnVnZnNfY3JlYXRlX2RpcigidWJpIiwgTlVMTCk7CisJaWYgKElTX0VSUl9P
Ul9OVUxMKGRmc19yb290ZGlyKSkgeworCQlpbnQgZXJyID0gZGZzX3Jvb3RkaXIgPyAtRU5PREVW
IDogUFRSX0VSUihkZnNfcm9vdGRpcik7CisKKwkJdWJpX2VycigiY2Fubm90IGNyZWF0ZSBcInVi
aVwiIGRlYnVnZnMgZGlyZWN0b3J5LCBlcnJvciAlZFxuIiwKKwkJCWVycik7CisJCXJldHVybiBl
cnI7CisJfQorI2VuZGlmCisKKwlyZXR1cm4gMDsKK30KKworLyoqCisgKiB1YmlfZGVidWdmc19l
eGl0IC0gcmVtb3ZlIFVCSSBkZWJ1Z2ZzIGRpcmVjdG9yeS4KKyAqLwordm9pZCB1YmlfZGVidWdm
c19leGl0KHZvaWQpCit7CisjaWYgZGVmaW5lZChDT05GSUdfREVCVUdfRlMpIHx8IGRlZmluZWQo
Q09ORklHX0RFQlVHX0ZTX01PRFVMRSkKKwkJZGVidWdmc19yZW1vdmUoZGZzX3Jvb3RkaXIpOwor
I2VuZGlmCit9CisKKy8qIFJlYWQgYW4gVUJJIGRlYnVnZnMgZmlsZSAqLworc3RhdGljIHNzaXpl
X3QgZGZzX2ZpbGVfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZSwgY2hhciBfX3VzZXIgKnVzZXJfYnVm
LAorCQkJICAgICBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykKK3sKKwl1bnNpZ25lZCBsb25n
IHViaV9udW0gPSAodW5zaWduZWQgbG9uZylmaWxlLT5wcml2YXRlX2RhdGE7CisJc3RydWN0IGRl
bnRyeSAqZGVudCA9IGZpbGUtPmZfcGF0aC5kZW50cnk7CisJc3RydWN0IHViaV9kZXZpY2UgKnVi
aTsKKwlzdHJ1Y3QgdWJpX2RlYnVnX2luZm8gKmQ7CisJY2hhciBidWZbM107CisJaW50IHZhbDsK
KworCXViaSA9IHViaV9nZXRfZGV2aWNlKHViaV9udW0pOworCWlmICghdWJpKQorCQlyZXR1cm4g
LUVOT0RFVjsKKwlkID0gdWJpLT5kYmc7CisKKwlpZiAoZGVudCA9PSBkLT5kZnNfY2hrX2dlbikK
KwkJdmFsID0gZC0+Y2hrX2dlbjsKKwllbHNlIGlmIChkZW50ID09IGQtPmRmc19jaGtfaW8pCisJ
CXZhbCA9IGQtPmNoa19pbzsKKwllbHNlIGlmIChkZW50ID09IGQtPmRmc19kaXNhYmxlX2JndCkK
KwkJdmFsID0gZC0+ZGlzYWJsZV9iZ3Q7CisJZWxzZSBpZiAoZGVudCA9PSBkLT5kZnNfZW11bGF0
ZV9iaXRmbGlwcykKKwkJdmFsID0gZC0+ZW11bGF0ZV9iaXRmbGlwczsKKwllbHNlIGlmIChkZW50
ID09IGQtPmRmc19lbXVsYXRlX2lvX2ZhaWx1cmVzKQorCQl2YWwgPSBkLT5lbXVsYXRlX2lvX2Zh
aWx1cmVzOworCWVsc2UgeworCQljb3VudCA9IC1FSU5WQUw7CiAJCWdvdG8gb3V0OwogCX0KIAot
CWRiZ19tc2coImR1bXBpbmcgJWQgYnl0ZXMgb2YgZGF0YSBmcm9tIFBFQiAlZCwgb2Zmc2V0ICVk
IiwKLQkJbGVuLCBwbnVtLCBvZmZzZXQpOwotCXByaW50X2hleF9kdW1wKEtFUk5fREVCVUcsICIi
LCBEVU1QX1BSRUZJWF9PRkZTRVQsIDMyLCAxLCBidWYsIGxlbiwgMSk7CisJaWYgKHZhbCkKKwkJ
YnVmWzBdID0gJzEnOworCWVsc2UKKwkJYnVmWzBdID0gJzAnOworCWJ1ZlsxXSA9ICdcbic7CisJ
YnVmWzJdID0gMHgwMDsKKworCWNvdW50ID0gc2ltcGxlX3JlYWRfZnJvbV9idWZmZXIodXNlcl9i
dWYsIGNvdW50LCBwcG9zLCBidWYsIDIpOworCiBvdXQ6Ci0JdmZyZWUoYnVmKTsKLQlyZXR1cm47
CisJdWJpX3B1dF9kZXZpY2UodWJpKTsKKwlyZXR1cm4gY291bnQ7CiB9CiAKLSNlbmRpZiAvKiBD
T05GSUdfTVREX1VCSV9ERUJVRyAqLworLyogV3JpdGUgYW4gVUJJIGRlYnVnZnMgZmlsZSAqLwor
c3RhdGljIHNzaXplX3QgZGZzX2ZpbGVfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUsIGNvbnN0IGNo
YXIgX191c2VyICp1c2VyX2J1ZiwKKwkJCSAgICAgIHNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9z
KQoreworCXVuc2lnbmVkIGxvbmcgdWJpX251bSA9ICh1bnNpZ25lZCBsb25nKWZpbGUtPnByaXZh
dGVfZGF0YTsKKwlzdHJ1Y3QgZGVudHJ5ICpkZW50ID0gZmlsZS0+Zl9wYXRoLmRlbnRyeTsKKwlz
dHJ1Y3QgdWJpX2RldmljZSAqdWJpOworCXN0cnVjdCB1YmlfZGVidWdfaW5mbyAqZDsKKwlzaXpl
X3QgYnVmX3NpemU7CisJY2hhciBidWZbOF07CisJaW50IHZhbDsKKworCXViaSA9IHViaV9nZXRf
ZGV2aWNlKHViaV9udW0pOworCWlmICghdWJpKQorCQlyZXR1cm4gLUVOT0RFVjsKKwlkID0gdWJp
LT5kYmc7CisKKwlidWZfc2l6ZSA9IG1pbl90KHNpemVfdCwgY291bnQsIChzaXplb2YoYnVmKSAt
IDEpKTsKKwlpZiAoY29weV9mcm9tX3VzZXIoYnVmLCB1c2VyX2J1ZiwgYnVmX3NpemUpKSB7CisJ
CWNvdW50ID0gLUVGQVVMVDsKKwkJZ290byBvdXQ7CisJfQorCisJaWYgKGJ1ZlswXSA9PSAnMScp
CisJCXZhbCA9IDE7CisJZWxzZSBpZiAoYnVmWzBdID09ICcwJykKKwkJdmFsID0gMDsKKwllbHNl
IHsKKwkJY291bnQgPSAtRUlOVkFMOworCQlnb3RvIG91dDsKKwl9CisKKwlpZiAoZGVudCA9PSBk
LT5kZnNfY2hrX2dlbikKKwkJZC0+Y2hrX2dlbiA9IHZhbDsKKwllbHNlIGlmIChkZW50ID09IGQt
PmRmc19jaGtfaW8pCisJCWQtPmNoa19pbyA9IHZhbDsKKwllbHNlIGlmIChkZW50ID09IGQtPmRm
c19kaXNhYmxlX2JndCkKKwkJZC0+ZGlzYWJsZV9iZ3QgPSB2YWw7CisJZWxzZSBpZiAoZGVudCA9
PSBkLT5kZnNfZW11bGF0ZV9iaXRmbGlwcykKKwkJZC0+ZW11bGF0ZV9iaXRmbGlwcyA9IHZhbDsK
KwllbHNlIGlmIChkZW50ID09IGQtPmRmc19lbXVsYXRlX2lvX2ZhaWx1cmVzKQorCQlkLT5lbXVs
YXRlX2lvX2ZhaWx1cmVzID0gdmFsOworCWVsc2UKKwkJY291bnQgPSAtRUlOVkFMOworCitvdXQ6
CisJdWJpX3B1dF9kZXZpY2UodWJpKTsKKwlyZXR1cm4gY291bnQ7Cit9CisKK3N0YXRpYyBpbnQg
ZGVmYXVsdF9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlKQorewor
CWlmIChpbm9kZS0+aV9wcml2YXRlKQorCQlmaWxlLT5wcml2YXRlX2RhdGEgPSBpbm9kZS0+aV9w
cml2YXRlOworCisJcmV0dXJuIDA7Cit9CisKKy8qIEZpbGUgb3BlcmF0aW9ucyBmb3IgYWxsIFVC
SSBkZWJ1Z2ZzIGZpbGVzICovCitzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBk
ZnNfZm9wcyA9IHsKKwkucmVhZCAgID0gZGZzX2ZpbGVfcmVhZCwKKwkud3JpdGUgID0gZGZzX2Zp
bGVfd3JpdGUsCisJLm9wZW4gICA9IGRlZmF1bHRfb3BlbiwKKwkubGxzZWVrID0gbm9fbGxzZWVr
LAorCS5vd25lciAgPSBUSElTX01PRFVMRSwKK307CisKKy8qKgorICogdWJpX2RlYnVnZnNfaW5p
dF9kZXYgLSBpbml0aWFsaXplIGRlYnVnZnMgZm9yIGFuIFVCSSBkZXZpY2UuCisgKiBAdWJpOiBV
QkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVjdAorICoKKyAqIFRoaXMgZnVuY3Rpb24gY3JlYXRl
cyBhbGwgZGVidWdmcyBmaWxlcyBmb3IgVUJJIGRldmljZSBAdWJpLiBSZXR1cm5zIHplcm8gaW4K
KyAqIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGluIGNhc2Ugb2Yg
ZmFpbHVyZS4KKyAqLworaW50IHViaV9kZWJ1Z2ZzX2luaXRfZGV2KHN0cnVjdCB1YmlfZGV2aWNl
ICp1YmkpCit7CisJaW50IGVyciwgbjsKKwl1bnNpZ25lZCBsb25nIHViaV9udW0gPSB1YmktPnVi
aV9udW07CisJY29uc3QgY2hhciAqZm5hbWU7CisJc3RydWN0IGRlbnRyeSAqZGVudDsKKwlzdHJ1
Y3QgdWJpX2RlYnVnX2luZm8gKmQgPSB1YmktPmRiZzsKKworI2lmICFkZWZpbmVkKENPTkZJR19E
RUJVR19GUykgJiYgIWRlZmluZWQoQ09ORklHX0RFQlVHX0ZTX01PRFVMRSkKKwlyZXR1cm4gMDsK
KyNlbmRpZgorCisJbiA9IHNucHJpbnRmKGQtPmRmc19kaXJfbmFtZSwgVUJJX0RGU19ESVJfTEVO
ICsgMSwgVUJJX0RGU19ESVJfTkFNRSwKKwkJICAgICB1YmktPnViaV9udW0pOworCWlmIChuID09
IFVCSV9ERlNfRElSX0xFTikgeworCQkvKiBUaGUgYXJyYXkgc2l6ZSBpcyB0b28gc21hbGwgKi8K
KwkJZm5hbWUgPSBVQklfREZTX0RJUl9OQU1FOworCQlkZW50ID0gRVJSX1BUUigtRUlOVkFMKTsK
KwkJZ290byBvdXQ7CisJfQorCisJZm5hbWUgPSBkLT5kZnNfZGlyX25hbWU7CisJZGVudCA9IGRl
YnVnZnNfY3JlYXRlX2RpcihmbmFtZSwgZGZzX3Jvb3RkaXIpOworCWlmIChJU19FUlJfT1JfTlVM
TChkZW50KSkKKwkJZ290byBvdXQ7CisJZC0+ZGZzX2RpciA9IGRlbnQ7CisKKwlmbmFtZSA9ICJj
aGtfZ2VuIjsKKwlkZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZShmbmFtZSwgU19JV1VTUiwgZC0+
ZGZzX2RpciwgKHZvaWQgKil1YmlfbnVtLAorCQkJCSAgICZkZnNfZm9wcyk7CisJaWYgKElTX0VS
Ul9PUl9OVUxMKGRlbnQpKQorCQlnb3RvIG91dF9yZW1vdmU7CisJZC0+ZGZzX2Noa19nZW4gPSBk
ZW50OworCisJZm5hbWUgPSAiY2hrX2lvIjsKKwlkZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZShm
bmFtZSwgU19JV1VTUiwgZC0+ZGZzX2RpciwgKHZvaWQgKil1YmlfbnVtLAorCQkJCSAgICZkZnNf
Zm9wcyk7CisJaWYgKElTX0VSUl9PUl9OVUxMKGRlbnQpKQorCQlnb3RvIG91dF9yZW1vdmU7CisJ
ZC0+ZGZzX2Noa19pbyA9IGRlbnQ7CisKKwlmbmFtZSA9ICJ0c3RfZGlzYWJsZV9iZ3QiOworCWRl
bnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKGZuYW1lLCBTX0lXVVNSLCBkLT5kZnNfZGlyLCAodm9p
ZCAqKXViaV9udW0sCisJCQkJICAgJmRmc19mb3BzKTsKKwlpZiAoSVNfRVJSX09SX05VTEwoZGVu
dCkpCisJCWdvdG8gb3V0X3JlbW92ZTsKKwlkLT5kZnNfZGlzYWJsZV9iZ3QgPSBkZW50OworCisJ
Zm5hbWUgPSAidHN0X2VtdWxhdGVfYml0ZmxpcHMiOworCWRlbnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9m
aWxlKGZuYW1lLCBTX0lXVVNSLCBkLT5kZnNfZGlyLCAodm9pZCAqKXViaV9udW0sCisJCQkJICAg
JmRmc19mb3BzKTsKKwlpZiAoSVNfRVJSX09SX05VTEwoZGVudCkpCisJCWdvdG8gb3V0X3JlbW92
ZTsKKwlkLT5kZnNfZW11bGF0ZV9iaXRmbGlwcyA9IGRlbnQ7CisKKwlmbmFtZSA9ICJ0c3RfZW11
bGF0ZV9pb19mYWlsdXJlcyI7CisJZGVudCA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoZm5hbWUsIFNf
SVdVU1IsIGQtPmRmc19kaXIsICh2b2lkICopdWJpX251bSwKKwkJCQkgICAmZGZzX2ZvcHMpOwor
CWlmIChJU19FUlJfT1JfTlVMTChkZW50KSkKKwkJZ290byBvdXRfcmVtb3ZlOworCWQtPmRmc19l
bXVsYXRlX2lvX2ZhaWx1cmVzID0gZGVudDsKKworCXJldHVybiAwOworCitvdXRfcmVtb3ZlOgor
CWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZShkLT5kZnNfZGlyKTsKK291dDoKKwllcnIgPSBkZW50
ID8gUFRSX0VSUihkZW50KSA6IC1FTk9ERVY7CisJdWJpX2VycigiY2Fubm90IGNyZWF0ZSBcIiVz
XCIgZGVidWdmcyBmaWxlIG9yIGRpcmVjdG9yeSwgZXJyb3IgJWRcbiIsCisJCWZuYW1lLCBlcnIp
OworCXJldHVybiBlcnI7Cit9CisKKy8qKgorICogZGJnX2RlYnVnX2V4aXRfZGV2IC0gZnJlZSBh
bGwgZGVidWdmcyBmaWxlcyBjb3JyZXNwb25kaW5nIHRvIGRldmljZSBAdWJpCisgKiBAdWJpOiBV
QkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVjdAorICovCit2b2lkIHViaV9kZWJ1Z2ZzX2V4aXRf
ZGV2KHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCit7CisjaWYgZGVmaW5lZChDT05GSUdfREVCVUdf
RlMpIHx8IGRlZmluZWQoQ09ORklHX0RFQlVHX0ZTX01PRFVMRSkKKwlkZWJ1Z2ZzX3JlbW92ZV9y
ZWN1cnNpdmUodWJpLT5kYmctPmRmc19kaXIpOworI2VuZGlmCit9CmRpZmYgLXVOIC11TnIgbGlu
dXgtMy4wL2RyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5oIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9k
cml2ZXJzL210ZC91YmkvZGVidWcuaAotLS0gbGludXgtMy4wL2RyaXZlcnMvbXRkL3ViaS9kZWJ1
Zy5oCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51
Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL2RlYnVnLmgJMjAxMi0wNi0yOCAxMToyNjoxNS4w
MDAwMDAwMDAgLTA1MDAKQEAgLTIxLDI5ICsyMSwyMCBAQAogI2lmbmRlZiBfX1VCSV9ERUJVR19I
X18KICNkZWZpbmUgX19VQklfREVCVUdfSF9fCiAKLXN0cnVjdCB1YmlfZWNfaGRyOwotc3RydWN0
IHViaV92aWRfaGRyOwotc3RydWN0IHViaV92b2x1bWU7Ci1zdHJ1Y3QgdWJpX3Z0YmxfcmVjb3Jk
Owotc3RydWN0IHViaV9zY2FuX3ZvbHVtZTsKLXN0cnVjdCB1Ymlfc2Nhbl9sZWI7Ci1zdHJ1Y3Qg
dWJpX21rdm9sX3JlcTsKK3ZvaWQgdWJpX2R1bXBfZmxhc2goc3RydWN0IHViaV9kZXZpY2UgKnVi
aSwgaW50IHBudW0sIGludCBvZmZzZXQsIGludCBsZW4pOwordm9pZCB1YmlfZHVtcF9lY19oZHIo
Y29uc3Qgc3RydWN0IHViaV9lY19oZHIgKmVjX2hkcik7Cit2b2lkIHViaV9kdW1wX3ZpZF9oZHIo
Y29uc3Qgc3RydWN0IHViaV92aWRfaGRyICp2aWRfaGRyKTsKIAotI2lmZGVmIENPTkZJR19NVERf
VUJJX0RFQlVHCiAjaW5jbHVkZSA8bGludXgvcmFuZG9tLmg+CiAKICNkZWZpbmUgdWJpX2Fzc2Vy
dChleHByKSAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAogCWlmICh1bmxpa2VseSghKGV4cHIpKSkgeyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKIAkJcHJpbnRrKEtFUk5fQ1JJVCAiVUJJIGFzc2VydCBmYWls
ZWQgaW4gJXMgYXQgJXUgKHBpZCAlZClcbiIsIFwKIAkJICAgICAgIF9fZnVuY19fLCBfX0xJTkVf
XywgY3VycmVudC0+cGlkKTsgICAgICAgICAgICAgICAgICAgIFwKLQkJdWJpX2RiZ19kdW1wX3N0
YWNrKCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKwkJZHVtcF9z
dGFjaygpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
IAl9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCiB9IHdoaWxlICgwKQogCi0jZGVmaW5lIGRiZ19lcnIoZm10LCAuLi4p
IHViaV9lcnIoZm10LCAjI19fVkFfQVJHU19fKQotCi0jZGVmaW5lIHViaV9kYmdfZHVtcF9zdGFj
aygpIGR1bXBfc3RhY2soKQotCiAjZGVmaW5lIHViaV9kYmdfcHJpbnRfaGV4X2R1bXAobCwgcHMs
IHB0LCByLCBnLCBiLCBsZW4sIGEpICBcCiAJCXByaW50X2hleF9kdW1wKGwsIHBzLCBwdCwgciwg
ZywgYiwgbGVuLCBhKQogCkBAIC01MSw3ICs0MiwxMCBAQAogCXByX2RlYnVnKCJVQkkgREJHICIg
dHlwZSAiOiAiIGZtdCAiXG4iLCAjI19fVkFfQVJHU19fKQogCiAvKiBKdXN0IGEgZGVidWdnaW5n
IG1lc3NhZ2VzIG5vdCByZWxhdGVkIHRvIGFueSBzcGVjaWZpYyBVQkkgc3Vic3lzdGVtICovCi0j
ZGVmaW5lIGRiZ19tc2coZm10LCAuLi4pIHViaV9kYmdfbXNnKCJtc2ciLCBmbXQsICMjX19WQV9B
UkdTX18pCisjZGVmaW5lIGRiZ19tc2coZm10LCAuLi4pICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAorCXByaW50ayhLRVJOX0RFQlVHICJVQkkgREJHIChwaWQgJWQpOiAlczog
IiBmbXQgIlxuIiwgXAorCSAgICAgICBjdXJyZW50LT5waWQsIF9fZnVuY19fLCAjI19fVkFfQVJH
U19fKQorCiAvKiBHZW5lcmFsIGRlYnVnZ2luZyBtZXNzYWdlcyAqLwogI2RlZmluZSBkYmdfZ2Vu
KGZtdCwgLi4uKSB1YmlfZGJnX21zZygiZ2VuIiwgZm10LCAjI19fVkFfQVJHU19fKQogLyogTWVz
c2FnZXMgZnJvbSB0aGUgZXJhc2VibG9jayBhc3NvY2lhdGlvbiBzdWItc3lzdGVtICovCkBAIC02
MywxNTUgKzU3LDEwOSBAQAogLyogSW5pdGlhbGl6YXRpb24gYW5kIGJ1aWxkIG1lc3NhZ2VzICov
CiAjZGVmaW5lIGRiZ19ibGQoZm10LCAuLi4pIHViaV9kYmdfbXNnKCJibGQiLCBmbXQsICMjX19W
QV9BUkdTX18pCiAKLXZvaWQgdWJpX2RiZ19kdW1wX2VjX2hkcihjb25zdCBzdHJ1Y3QgdWJpX2Vj
X2hkciAqZWNfaGRyKTsKLXZvaWQgdWJpX2RiZ19kdW1wX3ZpZF9oZHIoY29uc3Qgc3RydWN0IHVi
aV92aWRfaGRyICp2aWRfaGRyKTsKLXZvaWQgdWJpX2RiZ19kdW1wX3ZvbF9pbmZvKGNvbnN0IHN0
cnVjdCB1Ymlfdm9sdW1lICp2b2wpOwotdm9pZCB1YmlfZGJnX2R1bXBfdnRibF9yZWNvcmQoY29u
c3Qgc3RydWN0IHViaV92dGJsX3JlY29yZCAqciwgaW50IGlkeCk7Ci12b2lkIHViaV9kYmdfZHVt
cF9zdihjb25zdCBzdHJ1Y3QgdWJpX3NjYW5fdm9sdW1lICpzdik7Ci12b2lkIHViaV9kYmdfZHVt
cF9zZWIoY29uc3Qgc3RydWN0IHViaV9zY2FuX2xlYiAqc2ViLCBpbnQgdHlwZSk7Ci12b2lkIHVi
aV9kYmdfZHVtcF9ta3ZvbF9yZXEoY29uc3Qgc3RydWN0IHViaV9ta3ZvbF9yZXEgKnJlcSk7Ci12
b2lkIHViaV9kYmdfZHVtcF9mbGFzaChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwg
aW50IG9mZnNldCwgaW50IGxlbik7Ci0KLWV4dGVybiB1bnNpZ25lZCBpbnQgdWJpX2Noa19mbGFn
czsKK3ZvaWQgdWJpX2R1bXBfdm9sX2luZm8oY29uc3Qgc3RydWN0IHViaV92b2x1bWUgKnZvbCk7
Cit2b2lkIHViaV9kdW1wX3Z0YmxfcmVjb3JkKGNvbnN0IHN0cnVjdCB1YmlfdnRibF9yZWNvcmQg
KnIsIGludCBpZHgpOwordm9pZCB1YmlfZHVtcF9hdihjb25zdCBzdHJ1Y3QgdWJpX2FpbmZfdm9s
dW1lICphdik7Cit2b2lkIHViaV9kdW1wX2FlYihjb25zdCBzdHJ1Y3QgdWJpX2FpbmZfcGViICph
ZWIsIGludCB0eXBlKTsKK3ZvaWQgdWJpX2R1bXBfbWt2b2xfcmVxKGNvbnN0IHN0cnVjdCB1Ymlf
bWt2b2xfcmVxICpyZXEpOworaW50IHViaV9zZWxmX2NoZWNrX2FsbF9mZihzdHJ1Y3QgdWJpX2Rl
dmljZSAqdWJpLCBpbnQgcG51bSwgaW50IG9mZnNldCwKKwkJCSAgaW50IGxlbik7CitpbnQgdWJp
X2RlYnVnZ2luZ19pbml0X2RldihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKTsKK3ZvaWQgdWJpX2Rl
YnVnZ2luZ19leGl0X2RldihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKTsKK2ludCB1YmlfZGVidWdm
c19pbml0KHZvaWQpOwordm9pZCB1YmlfZGVidWdmc19leGl0KHZvaWQpOworaW50IHViaV9kZWJ1
Z2ZzX2luaXRfZGV2KHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpOwordm9pZCB1YmlfZGVidWdmc19l
eGl0X2RldihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKTsKIAogLyoKLSAqIERlYnVnZ2luZyBjaGVj
ayBmbGFncy4KLSAqCi0gKiBVQklfQ0hLX0dFTjogZ2VuZXJhbCBjaGVja3MKLSAqIFVCSV9DSEtf
SU86IGNoZWNrIHdyaXRlcyBhbmQgZXJhc2VzCisgKiBUaGUgVUJJIGRlYnVnZnMgZGlyZWN0b3J5
IG5hbWUgcGF0dGVybiBhbmQgbWF4aW11bSBuYW1lIGxlbmd0aCAoMyBmb3IgInViaSIKKyAqICsg
MiBmb3IgdGhlIG51bWJlciBwbHVzIDEgZm9yIHRoZSB0cmFpbGluZyB6ZXJvIGJ5dGUuCiAgKi8K
LWVudW0gewotCVVCSV9DSEtfR0VOID0gMHgxLAotCVVCSV9DSEtfSU8gID0gMHgyLAotfTsKKyNk
ZWZpbmUgVUJJX0RGU19ESVJfTkFNRSAidWJpJWQiCisjZGVmaW5lIFVCSV9ERlNfRElSX0xFTiAg
KDMgKyAyICsgMSkKIAotaW50IHViaV9kYmdfY2hlY2tfYWxsX2ZmKHN0cnVjdCB1YmlfZGV2aWNl
ICp1YmksIGludCBwbnVtLCBpbnQgb2Zmc2V0LCBpbnQgbGVuKTsKLWludCB1YmlfZGJnX2NoZWNr
X3dyaXRlKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IHBudW0s
Ci0JCQlpbnQgb2Zmc2V0LCBpbnQgbGVuKTsKLQotZXh0ZXJuIHVuc2lnbmVkIGludCB1YmlfdHN0
X2ZsYWdzOwotCi0vKgotICogU3BlY2lhbCB0ZXN0aW5nIGZsYWdzLgorLyoqCisgKiBzdHJ1Y3Qg
dWJpX2RlYnVnX2luZm8gLSBkZWJ1Z2dpbmcgaW5mb3JtYXRpb24gZm9yIGFuIFVCSSBkZXZpY2Uu
CiAgKgotICogVUJJRlNfVFNUX0RJU0FCTEVfQkdUOiBkaXNhYmxlIHRoZSBiYWNrZ3JvdW5kIHRo
cmVhZAotICogVUJJX1RTVF9FTVVMQVRFX0JJVEZMSVBTOiBlbXVsYXRlIGJpdC1mbGlwcwotICog
VUJJX1RTVF9FTVVMQVRFX1dSSVRFX0ZBSUxVUkVTOiBlbXVsYXRlIHdyaXRlIGZhaWx1cmVzCi0g
KiBVQklfVFNUX0VNVUxBVEVfRVJBU0VfRkFJTFVSRVM6IGVtdWxhdGUgZXJhc2UgZmFpbHVyZXMK
LSAqLwotZW51bSB7Ci0JVUJJX1RTVF9ESVNBQkxFX0JHVCAgICAgICAgICAgID0gMHgxLAotCVVC
SV9UU1RfRU1VTEFURV9CSVRGTElQUyAgICAgICA9IDB4MiwKLQlVQklfVFNUX0VNVUxBVEVfV1JJ
VEVfRkFJTFVSRVMgPSAweDQsCi0JVUJJX1RTVF9FTVVMQVRFX0VSQVNFX0ZBSUxVUkVTID0gMHg4
LAorICogQGNoa19nZW46IGlmIFVCSSBnZW5lcmFsIGV4dHJhIGNoZWNrcyBhcmUgZW5hYmxlZAor
ICogQGNoa19pbzogaWYgVUJJIEkvTyBleHRyYSBjaGVja3MgYXJlIGVuYWJsZWQKKyAqIEBkaXNh
YmxlX2JndDogZGlzYWJsZSB0aGUgYmFja2dyb3VuZCB0YXNrIGZvciB0ZXN0aW5nIHB1cnBvc2Vz
CisgKiBAZW11bGF0ZV9iaXRmbGlwczogZW11bGF0ZSBiaXQtZmxpcHMgZm9yIHRlc3RpbmcgcHVy
cG9zZXMKKyAqIEBlbXVsYXRlX2lvX2ZhaWx1cmVzOiBlbXVsYXRlIHdyaXRlL2VyYXNlIGZhaWx1
cmVzIGZvciB0ZXN0aW5nIHB1cnBvc2VzCisgKiBAZGZzX2Rpcl9uYW1lOiBuYW1lIG9mIGRlYnVn
ZnMgZGlyZWN0b3J5IGNvbnRhaW5pbmcgZmlsZXMgb2YgdGhpcyBVQkkgZGV2aWNlCisgKiBAZGZz
X2RpcjogZGlyZW50cnkgb2JqZWN0IG9mIHRoZSBVQkkgZGV2aWNlIGRlYnVnZnMgZGlyZWN0b3J5
CisgKiBAZGZzX2Noa19nZW46IGRlYnVnZnMga25vYiB0byBlbmFibGUgVUJJIGdlbmVyYWwgZXh0
cmEgY2hlY2tzCisgKiBAZGZzX2Noa19pbzogZGVidWdmcyBrbm9iIHRvIGVuYWJsZSBVQkkgSS9P
IGV4dHJhIGNoZWNrcworICogQGRmc19kaXNhYmxlX2JndDogZGVidWdmcyBrbm9iIHRvIGRpc2Fi
bGUgdGhlIGJhY2tncm91bmQgdGFzaworICogQGRmc19lbXVsYXRlX2JpdGZsaXBzOiBkZWJ1Z2Zz
IGtub2IgdG8gZW11bGF0ZSBiaXQtZmxpcHMKKyAqIEBkZnNfZW11bGF0ZV9pb19mYWlsdXJlczog
ZGVidWdmcyBrbm9iIHRvIGVtdWxhdGUgd3JpdGUvZXJhc2UgZmFpbHVyZXMKKyAqLworc3RydWN0
IHViaV9kZWJ1Z19pbmZvIHsKKwl1bnNpZ25lZCBpbnQgY2hrX2dlbjoxOworCXVuc2lnbmVkIGlu
dCBjaGtfaW86MTsKKwl1bnNpZ25lZCBpbnQgZGlzYWJsZV9iZ3Q6MTsKKwl1bnNpZ25lZCBpbnQg
ZW11bGF0ZV9iaXRmbGlwczoxOworCXVuc2lnbmVkIGludCBlbXVsYXRlX2lvX2ZhaWx1cmVzOjE7
CisJY2hhciBkZnNfZGlyX25hbWVbVUJJX0RGU19ESVJfTEVOICsgMV07CisJc3RydWN0IGRlbnRy
eSAqZGZzX2RpcjsKKwlzdHJ1Y3QgZGVudHJ5ICpkZnNfY2hrX2dlbjsKKwlzdHJ1Y3QgZGVudHJ5
ICpkZnNfY2hrX2lvOworCXN0cnVjdCBkZW50cnkgKmRmc19kaXNhYmxlX2JndDsKKwlzdHJ1Y3Qg
ZGVudHJ5ICpkZnNfZW11bGF0ZV9iaXRmbGlwczsKKwlzdHJ1Y3QgZGVudHJ5ICpkZnNfZW11bGF0
ZV9pb19mYWlsdXJlczsKIH07CiAKIC8qKgogICogdWJpX2RiZ19pc19iZ3RfZGlzYWJsZWQgLSBp
ZiB0aGUgYmFja2dyb3VuZCB0aHJlYWQgaXMgZGlzYWJsZWQuCisgKiBAdWJpOiBVQkkgZGV2aWNl
IGRlc2NyaXB0aW9uIG9iamVjdAogICoKICAqIFJldHVybnMgbm9uLXplcm8gaWYgdGhlIFVCSSBi
YWNrZ3JvdW5kIHRocmVhZCBpcyBkaXNhYmxlZCBmb3IgdGVzdGluZwogICogcHVycG9zZXMuCiAg
Ki8KLXN0YXRpYyBpbmxpbmUgaW50IHViaV9kYmdfaXNfYmd0X2Rpc2FibGVkKHZvaWQpCitzdGF0
aWMgaW5saW5lIGludCB1YmlfZGJnX2lzX2JndF9kaXNhYmxlZChjb25zdCBzdHJ1Y3QgdWJpX2Rl
dmljZSAqdWJpKQogewotCXJldHVybiB1YmlfdHN0X2ZsYWdzICYgVUJJX1RTVF9ESVNBQkxFX0JH
VDsKKwlyZXR1cm4gdWJpLT5kYmctPmRpc2FibGVfYmd0OwogfQogCiAvKioKICAqIHViaV9kYmdf
aXNfYml0ZmxpcCAtIGlmIGl0IGlzIHRpbWUgdG8gZW11bGF0ZSBhIGJpdC1mbGlwLgorICogQHVi
aTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKICAqCiAgKiBSZXR1cm5zIG5vbi16ZXJv
IGlmIGEgYml0LWZsaXAgc2hvdWxkIGJlIGVtdWxhdGVkLCBvdGhlcndpc2UgcmV0dXJucyB6ZXJv
LgogICovCi1zdGF0aWMgaW5saW5lIGludCB1YmlfZGJnX2lzX2JpdGZsaXAodm9pZCkKK3N0YXRp
YyBpbmxpbmUgaW50IHViaV9kYmdfaXNfYml0ZmxpcChjb25zdCBzdHJ1Y3QgdWJpX2RldmljZSAq
dWJpKQogewotCWlmICh1YmlfdHN0X2ZsYWdzICYgVUJJX1RTVF9FTVVMQVRFX0JJVEZMSVBTKQor
CWlmICh1YmktPmRiZy0+ZW11bGF0ZV9iaXRmbGlwcykKIAkJcmV0dXJuICEocmFuZG9tMzIoKSAl
IDIwMCk7CiAJcmV0dXJuIDA7CiB9CiAKIC8qKgogICogdWJpX2RiZ19pc193cml0ZV9mYWlsdXJl
IC0gaWYgaXQgaXMgdGltZSB0byBlbXVsYXRlIGEgd3JpdGUgZmFpbHVyZS4KKyAqIEB1Ymk6IFVC
SSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0CiAgKgogICogUmV0dXJucyBub24temVybyBpZiBh
IHdyaXRlIGZhaWx1cmUgc2hvdWxkIGJlIGVtdWxhdGVkLCBvdGhlcndpc2UgcmV0dXJucwogICog
emVyby4KICAqLwotc3RhdGljIGlubGluZSBpbnQgdWJpX2RiZ19pc193cml0ZV9mYWlsdXJlKHZv
aWQpCitzdGF0aWMgaW5saW5lIGludCB1YmlfZGJnX2lzX3dyaXRlX2ZhaWx1cmUoY29uc3Qgc3Ry
dWN0IHViaV9kZXZpY2UgKnViaSkKIHsKLQlpZiAodWJpX3RzdF9mbGFncyAmIFVCSV9UU1RfRU1V
TEFURV9XUklURV9GQUlMVVJFUykKKwlpZiAodWJpLT5kYmctPmVtdWxhdGVfaW9fZmFpbHVyZXMp
CiAJCXJldHVybiAhKHJhbmRvbTMyKCkgJSA1MDApOwogCXJldHVybiAwOwogfQogCiAvKioKICAq
IHViaV9kYmdfaXNfZXJhc2VfZmFpbHVyZSAtIGlmIGl0cyB0aW1lIHRvIGVtdWxhdGUgYW4gZXJh
c2UgZmFpbHVyZS4KKyAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0CiAgKgog
ICogUmV0dXJucyBub24temVybyBpZiBhbiBlcmFzZSBmYWlsdXJlIHNob3VsZCBiZSBlbXVsYXRl
ZCwgb3RoZXJ3aXNlIHJldHVybnMKICAqIHplcm8uCiAgKi8KLXN0YXRpYyBpbmxpbmUgaW50IHVi
aV9kYmdfaXNfZXJhc2VfZmFpbHVyZSh2b2lkKQorc3RhdGljIGlubGluZSBpbnQgdWJpX2RiZ19p
c19lcmFzZV9mYWlsdXJlKGNvbnN0IHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCiB7Ci0JaWYgKHVi
aV90c3RfZmxhZ3MgJiBVQklfVFNUX0VNVUxBVEVfRVJBU0VfRkFJTFVSRVMpCisJaWYgKHViaS0+
ZGJnLT5lbXVsYXRlX2lvX2ZhaWx1cmVzKQogCQlyZXR1cm4gIShyYW5kb20zMigpICUgNDAwKTsK
IAlyZXR1cm4gMDsKIH0KIAotI2Vsc2UKLQotLyogVXNlICJpZiAoMCkiIHRvIG1ha2UgY29tcGls
ZXIgY2hlY2sgYXJndW1lbnRzIGV2ZW4gaWYgZGVidWdnaW5nIGlzIG9mZiAqLwotI2RlZmluZSB1
YmlfYXNzZXJ0KGV4cHIpICBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCi0JaWYgKDApIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCQlwcmludGsoS0VSTl9DUklUICJVQkkgYXNz
ZXJ0IGZhaWxlZCBpbiAlcyBhdCAldSAocGlkICVkKVxuIiwgXAotCQkgICAgICAgX19mdW5jX18s
IF9fTElORV9fLCBjdXJyZW50LT5waWQpOyAgICAgICAgICAgICAgICAgICAgXAotCX0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKLX0gd2hpbGUgKDApCi0KLSNkZWZpbmUgZGJnX2VycihmbXQsIC4uLikgZG8geyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCWlmICgwKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKLQkJdWJpX2VycihmbXQsICMjX19WQV9BUkdTX18pOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKLX0gd2hpbGUgKDApCi0KLSNkZWZpbmUgdWJpX2RiZ19tc2coZm10LCAuLi4p
IGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCWlmICgw
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKLQkJcHJfZGVidWcoZm10ICJcbiIsICMjX19WQV9BUkdTX18pOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKLX0gd2hpbGUgKDApCi0KLSNkZWZpbmUgZGJnX21zZyhmbXQsIC4u
LikgIHViaV9kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX2dlbihmbXQs
IC4uLikgIHViaV9kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX2ViYShm
bXQsIC4uLikgIHViaV9kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX3ds
KGZtdCwgLi4uKSAgIHViaV9kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJn
X2lvKGZtdCwgLi4uKSAgIHViaV9kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUg
ZGJnX2JsZChmbXQsIC4uLikgIHViaV9kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLQotc3Rh
dGljIGlubGluZSB2b2lkIHViaV9kYmdfZHVtcF9zdGFjayh2b2lkKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgeyByZXR1cm47IH0KLXN0YXRpYyBpbmxpbmUgdm9pZAotdWJpX2RiZ19kdW1wX2Vj
X2hkcihjb25zdCBzdHJ1Y3QgdWJpX2VjX2hkciAqZWNfaGRyKSAgICAgICAgICAgICAgICAgeyBy
ZXR1cm47IH0KLXN0YXRpYyBpbmxpbmUgdm9pZAotdWJpX2RiZ19kdW1wX3ZpZF9oZHIoY29uc3Qg
c3RydWN0IHViaV92aWRfaGRyICp2aWRfaGRyKSAgICAgICAgICAgICAgeyByZXR1cm47IH0KLXN0
YXRpYyBpbmxpbmUgdm9pZAotdWJpX2RiZ19kdW1wX3ZvbF9pbmZvKGNvbnN0IHN0cnVjdCB1Ymlf
dm9sdW1lICp2b2wpICAgICAgICAgICAgICAgICAgeyByZXR1cm47IH0KLXN0YXRpYyBpbmxpbmUg
dm9pZAotdWJpX2RiZ19kdW1wX3Z0YmxfcmVjb3JkKGNvbnN0IHN0cnVjdCB1YmlfdnRibF9yZWNv
cmQgKnIsIGludCBpZHgpICAgeyByZXR1cm47IH0KLXN0YXRpYyBpbmxpbmUgdm9pZCB1YmlfZGJn
X2R1bXBfc3YoY29uc3Qgc3RydWN0IHViaV9zY2FuX3ZvbHVtZSAqc3YpIHsgcmV0dXJuOyB9Ci1z
dGF0aWMgaW5saW5lIHZvaWQgdWJpX2RiZ19kdW1wX3NlYihjb25zdCBzdHJ1Y3QgdWJpX3NjYW5f
bGViICpzZWIsCi0JCQkJICAgIGludCB0eXBlKSAgICAgICAgICAgICAgICAgICAgICAgIHsgcmV0
dXJuOyB9Ci1zdGF0aWMgaW5saW5lIHZvaWQKLXViaV9kYmdfZHVtcF9ta3ZvbF9yZXEoY29uc3Qg
c3RydWN0IHViaV9ta3ZvbF9yZXEgKnJlcSkgICAgICAgICAgICAgIHsgcmV0dXJuOyB9Ci1zdGF0
aWMgaW5saW5lIHZvaWQgdWJpX2RiZ19kdW1wX2ZsYXNoKHN0cnVjdCB1YmlfZGV2aWNlICp1Ymks
Ci0JCQkJICAgICAgaW50IHBudW0sIGludCBvZmZzZXQsIGludCBsZW4pIHsgcmV0dXJuOyB9Ci1z
dGF0aWMgaW5saW5lIHZvaWQKLXViaV9kYmdfcHJpbnRfaGV4X2R1bXAoY29uc3QgY2hhciAqbCwg
Y29uc3QgY2hhciAqcHMsIGludCBwdCwgaW50IHIsCi0JCSAgICAgICBpbnQgZywgY29uc3Qgdm9p
ZCAqYiwgc2l6ZV90IGxlbiwgYm9vbCBhKSAgICAgeyByZXR1cm47IH0KLQotc3RhdGljIGlubGlu
ZSBpbnQgdWJpX2RiZ19pc19iZ3RfZGlzYWJsZWQodm9pZCkgICAgICAgICAgICAgICAgICAgIHsg
cmV0dXJuIDA7IH0KLXN0YXRpYyBpbmxpbmUgaW50IHViaV9kYmdfaXNfYml0ZmxpcCh2b2lkKSAg
ICAgICAgICAgICAgICAgICAgICAgICB7IHJldHVybiAwOyB9Ci1zdGF0aWMgaW5saW5lIGludCB1
YmlfZGJnX2lzX3dyaXRlX2ZhaWx1cmUodm9pZCkgICAgICAgICAgICAgICAgICAgeyByZXR1cm4g
MDsgfQotc3RhdGljIGlubGluZSBpbnQgdWJpX2RiZ19pc19lcmFzZV9mYWlsdXJlKHZvaWQpICAg
ICAgICAgICAgICAgICAgIHsgcmV0dXJuIDA7IH0KLXN0YXRpYyBpbmxpbmUgaW50IHViaV9kYmdf
Y2hlY2tfYWxsX2ZmKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksCi0JCQkJICAgICAgIGludCBwbnVt
LCBpbnQgb2Zmc2V0LAotCQkJCSAgICAgICBpbnQgbGVuKSAgICAgICAgICAgICAgICAgICAgeyBy
ZXR1cm4gMDsgfQotc3RhdGljIGlubGluZSBpbnQgdWJpX2RiZ19jaGVja193cml0ZShzdHJ1Y3Qg
dWJpX2RldmljZSAqdWJpLAotCQkJCSAgICAgIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IHBudW0sCi0J
CQkJICAgICAgaW50IG9mZnNldCwgaW50IGxlbikgICAgICAgICB7IHJldHVybiAwOyB9Ci0KLSNl
bmRpZiAvKiAhQ09ORklHX01URF9VQklfREVCVUcgKi8KICNlbmRpZiAvKiAhX19VQklfREVCVUdf
SF9fICovCmRpZmYgLXVOIC11TnIgbGludXgtMy4wL2RyaXZlcnMvbXRkL3ViaS9lYmEuYyBsaW51
eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL2ViYS5jCi0tLSBsaW51eC0zLjAv
ZHJpdmVycy9tdGQvdWJpL2ViYS5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAw
CisrKyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL2ViYS5jCTIwMTIt
MDYtMjggMTE6MjY6MTUuMDAwMDAwMDAwIC0wNTAwCkBAIC0zNDEsNyArMzQxLDcgQEAKIAlkYmdf
ZWJhKCJlcmFzZSBMRUIgJWQ6JWQsIFBFQiAlZCIsIHZvbF9pZCwgbG51bSwgcG51bSk7CiAKIAl2
b2wtPmViYV90YmxbbG51bV0gPSBVQklfTEVCX1VOTUFQUEVEOwotCWVyciA9IHViaV93bF9wdXRf
cGViKHViaSwgcG51bSwgMCk7CisJZXJyID0gdWJpX3dsX3B1dF9wZWIodWJpLCB2b2xfaWQsIGxu
dW0sIHBudW0sIDApOwogCiBvdXRfdW5sb2NrOgogCWxlYl93cml0ZV91bmxvY2sodWJpLCB2b2xf
aWQsIGxudW0pOwpAQCAtNTA3LDcgKzUwNyw3IEBACiAJCXJldHVybiAtRU5PTUVNOwogCiByZXRy
eToKLQluZXdfcG51bSA9IHViaV93bF9nZXRfcGViKHViaSwgVUJJX1VOS05PV04pOworCW5ld19w
bnVtID0gdWJpX3dsX2dldF9wZWIodWJpKTsKIAlpZiAobmV3X3BudW0gPCAwKSB7CiAJCXViaV9m
cmVlX3ZpZF9oZHIodWJpLCB2aWRfaGRyKTsKIAkJcmV0dXJuIG5ld19wbnVtOwpAQCAtNTI5LDE4
ICs1MjksMTggQEAKIAogCWRhdGFfc2l6ZSA9IG9mZnNldCArIGxlbjsKIAltdXRleF9sb2NrKCZ1
YmktPmJ1Zl9tdXRleCk7Ci0JbWVtc2V0KHViaS0+cGViX2J1ZjEgKyBvZmZzZXQsIDB4RkYsIGxl
bik7CisJbWVtc2V0KHViaS0+cGViX2J1ZiArIG9mZnNldCwgMHhGRiwgbGVuKTsKIAogCS8qIFJl
YWQgZXZlcnl0aGluZyBiZWZvcmUgdGhlIGFyZWEgd2hlcmUgdGhlIHdyaXRlIGZhaWx1cmUgaGFw
cGVuZWQgKi8KIAlpZiAob2Zmc2V0ID4gMCkgewotCQllcnIgPSB1YmlfaW9fcmVhZF9kYXRhKHVi
aSwgdWJpLT5wZWJfYnVmMSwgcG51bSwgMCwgb2Zmc2V0KTsKKwkJZXJyID0gdWJpX2lvX3JlYWRf
ZGF0YSh1YmksIHViaS0+cGViX2J1ZiwgcG51bSwgMCwgb2Zmc2V0KTsKIAkJaWYgKGVyciAmJiBl
cnIgIT0gVUJJX0lPX0JJVEZMSVBTKQogCQkJZ290byBvdXRfdW5sb2NrOwogCX0KIAotCW1lbWNw
eSh1YmktPnBlYl9idWYxICsgb2Zmc2V0LCBidWYsIGxlbik7CisJbWVtY3B5KHViaS0+cGViX2J1
ZiArIG9mZnNldCwgYnVmLCBsZW4pOwogCi0JZXJyID0gdWJpX2lvX3dyaXRlX2RhdGEodWJpLCB1
YmktPnBlYl9idWYxLCBuZXdfcG51bSwgMCwgZGF0YV9zaXplKTsKKwllcnIgPSB1YmlfaW9fd3Jp
dGVfZGF0YSh1YmksIHViaS0+cGViX2J1ZiwgbmV3X3BudW0sIDAsIGRhdGFfc2l6ZSk7CiAJaWYg
KGVycikgewogCQltdXRleF91bmxvY2soJnViaS0+YnVmX211dGV4KTsKIAkJZ290byB3cml0ZV9l
cnJvcjsKQEAgLTU1MCw3ICs1NTAsNyBAQAogCXViaV9mcmVlX3ZpZF9oZHIodWJpLCB2aWRfaGRy
KTsKIAogCXZvbC0+ZWJhX3RibFtsbnVtXSA9IG5ld19wbnVtOwotCXViaV93bF9wdXRfcGViKHVi
aSwgcG51bSwgMSk7CisJdWJpX3dsX3B1dF9wZWIodWJpLCB2b2xfaWQsIGxudW0sIHBudW0sIDEp
OwogCiAJdWJpX21zZygiZGF0YSB3YXMgc3VjY2Vzc2Z1bGx5IHJlY292ZXJlZCIpOwogCXJldHVy
biAwOwpAQCAtNTU4LDcgKzU1OCw3IEBACiBvdXRfdW5sb2NrOgogCW11dGV4X3VubG9jaygmdWJp
LT5idWZfbXV0ZXgpOwogb3V0X3B1dDoKLQl1Ymlfd2xfcHV0X3BlYih1YmksIG5ld19wbnVtLCAx
KTsKKwl1Ymlfd2xfcHV0X3BlYih1YmksIHZvbF9pZCwgbG51bSwgbmV3X3BudW0sIDEpOwogCXVi
aV9mcmVlX3ZpZF9oZHIodWJpLCB2aWRfaGRyKTsKIAlyZXR1cm4gZXJyOwogCkBAIC01NjgsNyAr
NTY4LDcgQEAKIAkgKiBnZXQgYW5vdGhlciBvbmUuCiAJICovCiAJdWJpX3dhcm4oImZhaWxlZCB0
byB3cml0ZSB0byBQRUIgJWQiLCBuZXdfcG51bSk7Ci0JdWJpX3dsX3B1dF9wZWIodWJpLCBuZXdf
cG51bSwgMSk7CisJdWJpX3dsX3B1dF9wZWIodWJpLCB2b2xfaWQsIGxudW0sIG5ld19wbnVtLCAx
KTsKIAlpZiAoKyt0cmllcyA+IFVCSV9JT19SRVRSSUVTKSB7CiAJCXViaV9mcmVlX3ZpZF9oZHIo
dWJpLCB2aWRfaGRyKTsKIAkJcmV0dXJuIGVycjsKQEAgLTU4NSw3ICs1ODUsNiBAQAogICogQGJ1
ZjogdGhlIGRhdGEgdG8gd3JpdGUKICAqIEBvZmZzZXQ6IG9mZnNldCB3aXRoaW4gdGhlIGxvZ2lj
YWwgZXJhc2VibG9jayB3aGVyZSB0byB3cml0ZQogICogQGxlbjogaG93IG1hbnkgYnl0ZXMgdG8g
d3JpdGUKLSAqIEBkdHlwZTogZGF0YSB0eXBlCiAgKgogICogVGhpcyBmdW5jdGlvbiB3cml0ZXMg
ZGF0YSB0byBsb2dpY2FsIGVyYXNlYmxvY2sgQGxudW0gb2YgYSBkeW5hbWljIHZvbHVtZQogICog
QHZvbC4gUmV0dXJucyB6ZXJvIGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJv
ciBjb2RlIGluIGNhc2UKQEAgLTU5Myw3ICs1OTIsNyBAQAogICogd3JpdHRlbiB0byB0aGUgZmxh
c2ggbWVkaWEsIGJ1dCBtYXkgYmUgc29tZSBnYXJiYWdlLgogICovCiBpbnQgdWJpX2ViYV93cml0
ZV9sZWIoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV92b2x1bWUgKnZvbCwgaW50
IGxudW0sCi0JCSAgICAgIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IG9mZnNldCwgaW50IGxlbiwgaW50
IGR0eXBlKQorCQkgICAgICBjb25zdCB2b2lkICpidWYsIGludCBvZmZzZXQsIGludCBsZW4pCiB7
CiAJaW50IGVyciwgcG51bSwgdHJpZXMgPSAwLCB2b2xfaWQgPSB2b2wtPnZvbF9pZDsKIAlzdHJ1
Y3QgdWJpX3ZpZF9oZHIgKnZpZF9oZHI7CkBAIC02NDEsNyArNjQwLDcgQEAKIAl2aWRfaGRyLT5k
YXRhX3BhZCA9IGNwdV90b19iZTMyKHZvbC0+ZGF0YV9wYWQpOwogCiByZXRyeToKLQlwbnVtID0g
dWJpX3dsX2dldF9wZWIodWJpLCBkdHlwZSk7CisJcG51bSA9IHViaV93bF9nZXRfcGViKHViaSk7
CiAJaWYgKHBudW0gPCAwKSB7CiAJCXViaV9mcmVlX3ZpZF9oZHIodWJpLCB2aWRfaGRyKTsKIAkJ
bGViX3dyaXRlX3VubG9jayh1YmksIHZvbF9pZCwgbG51bSk7CkBAIC02ODcsNyArNjg2LDcgQEAK
IAkgKiBlcmFzZWJsb2NrLCBzbyBqdXN0IHB1dCBpdCBhbmQgcmVxdWVzdCBhIG5ldyBvbmUuIFdl
IGFzc3VtZSB0aGF0IGlmCiAJICogdGhpcyBwaHlzaWNhbCBlcmFzZWJsb2NrIHdlbnQgYmFkLCB0
aGUgZXJhc2UgY29kZSB3aWxsIGhhbmRsZSB0aGF0LgogCSAqLwotCWVyciA9IHViaV93bF9wdXRf
cGViKHViaSwgcG51bSwgMSk7CisJZXJyID0gdWJpX3dsX3B1dF9wZWIodWJpLCB2b2xfaWQsIGxu
dW0sIHBudW0sIDEpOwogCWlmIChlcnIgfHwgKyt0cmllcyA+IFVCSV9JT19SRVRSSUVTKSB7CiAJ
CXViaV9yb19tb2RlKHViaSk7CiAJCWxlYl93cml0ZV91bmxvY2sodWJpLCB2b2xfaWQsIGxudW0p
OwpAQCAtNzA3LDcgKzcwNiw2IEBACiAgKiBAbG51bTogbG9naWNhbCBlcmFzZWJsb2NrIG51bWJl
cgogICogQGJ1ZjogZGF0YSB0byB3cml0ZQogICogQGxlbjogaG93IG1hbnkgYnl0ZXMgdG8gd3Jp
dGUKLSAqIEBkdHlwZTogZGF0YSB0eXBlCiAgKiBAdXNlZF9lYnM6IGhvdyBtYW55IGxvZ2ljYWwg
ZXJhc2VibG9ja3Mgd2lsbCB0aGlzIHZvbHVtZSBjb250YWluCiAgKgogICogVGhpcyBmdW5jdGlv
biB3cml0ZXMgZGF0YSB0byBsb2dpY2FsIGVyYXNlYmxvY2sgQGxudW0gb2Ygc3RhdGljIHZvbHVt
ZQpAQCAtNzI0LDggKzcyMiw3IEBACiAgKiBjb2RlIGluIGNhc2Ugb2YgZmFpbHVyZS4KICAqLwog
aW50IHViaV9lYmFfd3JpdGVfbGViX3N0KHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1
Ymlfdm9sdW1lICp2b2wsCi0JCQkgaW50IGxudW0sIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IGxlbiwg
aW50IGR0eXBlLAotCQkJIGludCB1c2VkX2VicykKKwkJCSBpbnQgbG51bSwgY29uc3Qgdm9pZCAq
YnVmLCBpbnQgbGVuLCBpbnQgdXNlZF9lYnMpCiB7CiAJaW50IGVyciwgcG51bSwgdHJpZXMgPSAw
LCBkYXRhX3NpemUgPSBsZW4sIHZvbF9pZCA9IHZvbC0+dm9sX2lkOwogCXN0cnVjdCB1Ymlfdmlk
X2hkciAqdmlkX2hkcjsKQEAgLTc2Myw3ICs3NjAsNyBAQAogCXZpZF9oZHItPmRhdGFfY3JjID0g
Y3B1X3RvX2JlMzIoY3JjKTsKIAogcmV0cnk6Ci0JcG51bSA9IHViaV93bF9nZXRfcGViKHViaSwg
ZHR5cGUpOworCXBudW0gPSB1Ymlfd2xfZ2V0X3BlYih1YmkpOwogCWlmIChwbnVtIDwgMCkgewog
CQl1YmlfZnJlZV92aWRfaGRyKHViaSwgdmlkX2hkcik7CiAJCWxlYl93cml0ZV91bmxvY2sodWJp
LCB2b2xfaWQsIGxudW0pOwpAQCAtODA3LDcgKzgwNCw3IEBACiAJCXJldHVybiBlcnI7CiAJfQog
Ci0JZXJyID0gdWJpX3dsX3B1dF9wZWIodWJpLCBwbnVtLCAxKTsKKwllcnIgPSB1Ymlfd2xfcHV0
X3BlYih1YmksIHZvbF9pZCwgbG51bSwgcG51bSwgMSk7CiAJaWYgKGVyciB8fCArK3RyaWVzID4g
VUJJX0lPX1JFVFJJRVMpIHsKIAkJdWJpX3JvX21vZGUodWJpKTsKIAkJbGViX3dyaXRlX3VubG9j
ayh1YmksIHZvbF9pZCwgbG51bSk7CkBAIC04MjcsNyArODI0LDYgQEAKICAqIEBsbnVtOiBsb2dp
Y2FsIGVyYXNlYmxvY2sgbnVtYmVyCiAgKiBAYnVmOiBkYXRhIHRvIHdyaXRlCiAgKiBAbGVuOiBo
b3cgbWFueSBieXRlcyB0byB3cml0ZQotICogQGR0eXBlOiBkYXRhIHR5cGUKICAqCiAgKiBUaGlz
IGZ1bmN0aW9uIGNoYW5nZXMgdGhlIGNvbnRlbnRzIG9mIGEgbG9naWNhbCBlcmFzZWJsb2NrIGF0
b21pY2FsbHkuIEBidWYKICAqIGhhcyB0byBjb250YWluIG5ldyBsb2dpY2FsIGVyYXNlYmxvY2sg
ZGF0YSwgYW5kIEBsZW4gLSB0aGUgbGVuZ3RoIG9mIHRoZQpAQCAtODM5LDcgKzgzNSw3IEBACiAg
KiBMRUIgY2hhbmdlIG1heSBiZSBkb25lIGF0IGEgdGltZS4gVGhpcyBpcyBlbnN1cmVkIGJ5IEB1
YmktPmFsY19tdXRleC4KICAqLwogaW50IHViaV9lYmFfYXRvbWljX2xlYl9jaGFuZ2Uoc3RydWN0
IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV92b2x1bWUgKnZvbCwKLQkJCSAgICAgIGludCBs
bnVtLCBjb25zdCB2b2lkICpidWYsIGludCBsZW4sIGludCBkdHlwZSkKKwkJCSAgICAgIGludCBs
bnVtLCBjb25zdCB2b2lkICpidWYsIGludCBsZW4pCiB7CiAJaW50IGVyciwgcG51bSwgdHJpZXMg
PSAwLCB2b2xfaWQgPSB2b2wtPnZvbF9pZDsKIAlzdHJ1Y3QgdWJpX3ZpZF9oZHIgKnZpZF9oZHI7
CkBAIC04NTYsNyArODUyLDcgQEAKIAkJZXJyID0gdWJpX2ViYV91bm1hcF9sZWIodWJpLCB2b2ws
IGxudW0pOwogCQlpZiAoZXJyKQogCQkJcmV0dXJuIGVycjsKLQkJcmV0dXJuIHViaV9lYmFfd3Jp
dGVfbGViKHViaSwgdm9sLCBsbnVtLCBOVUxMLCAwLCAwLCBkdHlwZSk7CisJCXJldHVybiB1Ymlf
ZWJhX3dyaXRlX2xlYih1YmksIHZvbCwgbG51bSwgTlVMTCwgMCwgMCk7CiAJfQogCiAJdmlkX2hk
ciA9IHViaV96YWxsb2NfdmlkX2hkcih1YmksIEdGUF9OT0ZTKTsKQEAgLTg4MSw3ICs4NzcsNyBA
QAogCXZpZF9oZHItPmRhdGFfY3JjID0gY3B1X3RvX2JlMzIoY3JjKTsKIAogcmV0cnk6Ci0JcG51
bSA9IHViaV93bF9nZXRfcGViKHViaSwgZHR5cGUpOworCXBudW0gPSB1Ymlfd2xfZ2V0X3BlYih1
YmkpOwogCWlmIChwbnVtIDwgMCkgewogCQllcnIgPSBwbnVtOwogCQlnb3RvIG91dF9sZWJfdW5s
b2NrOwpAQCAtOTA1LDcgKzkwMSw3IEBACiAJfQogCiAJaWYgKHZvbC0+ZWJhX3RibFtsbnVtXSA+
PSAwKSB7Ci0JCWVyciA9IHViaV93bF9wdXRfcGViKHViaSwgdm9sLT5lYmFfdGJsW2xudW1dLCAw
KTsKKwkJZXJyID0gdWJpX3dsX3B1dF9wZWIodWJpLCB2b2xfaWQsIGxudW0sIHZvbC0+ZWJhX3Ri
bFtsbnVtXSwgMCk7CiAJCWlmIChlcnIpCiAJCQlnb3RvIG91dF9sZWJfdW5sb2NrOwogCX0KQEAg
LTkzMCw3ICs5MjYsNyBAQAogCQlnb3RvIG91dF9sZWJfdW5sb2NrOwogCX0KIAotCWVyciA9IHVi
aV93bF9wdXRfcGViKHViaSwgcG51bSwgMSk7CisJZXJyID0gdWJpX3dsX3B1dF9wZWIodWJpLCB2
b2xfaWQsIGxudW0sIHBudW0sIDEpOwogCWlmIChlcnIgfHwgKyt0cmllcyA+IFVCSV9JT19SRVRS
SUVTKSB7CiAJCXViaV9yb19tb2RlKHViaSk7CiAJCWdvdG8gb3V0X2xlYl91bmxvY2s7CkBAIC05
NzksNyArOTc1LDcgQEAKICAqIHBoeXNpY2FsIGVyYXNlYmxvY2sgQHRvLiBUaGUgQHZpZF9oZHIg
YnVmZmVyIG1heSBiZSBjaGFuZ2VkIGJ5IHRoaXMKICAqIGZ1bmN0aW9uLiBSZXR1cm5zOgogICog
ICBvICUwIGluIGNhc2Ugb2Ygc3VjY2VzczsKLSAqICAgbyAlTU9WRV9DQU5DRUxfUkFDRSwgJU1P
VkVfVEFSR0VUX1dSX0VSUiwgJU1PVkVfQ0FOQ0VMX0JJVEZMSVBTLCBldGM7CisgKiAgIG8gJU1P
VkVfQ0FOQ0VMX1JBQ0UsICVNT1ZFX1RBUkdFVF9XUl9FUlIsICVNT1ZFX1RBUkdFVF9CSVRGTElQ
UywgZXRjOwogICogICBvIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBpbiBjYXNlIG9mIGZhaWx1cmUu
CiAgKi8KIGludCB1YmlfZWJhX2NvcHlfbGViKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGludCBm
cm9tLCBpbnQgdG8sCkBAIC0xMDI4LDEyICsxMDI0LDE0IEBACiAJICogJ3ViaV93bF9wdXRfcGVi
KCknIGZ1bmN0aW9uIG9uIHRoZSBAdWJpLT5tb3ZlX211dGV4LiBJbiB0dXJuLCB3ZSBhcmUKIAkg
KiBob2xkaW5nIEB1YmktPm1vdmVfbXV0ZXggYW5kIGdvIHNsZWVwIG9uIHRoZSBMRUIgbG9jay4g
U28sIGlmIHRoZQogCSAqIExFQiBpcyBhbHJlYWR5IGxvY2tlZCwgd2UganVzdCBkbyBub3QgbW92
ZSBpdCBhbmQgcmV0dXJuCi0JICogJU1PVkVfQ0FOQ0VMX1JBQ0UsIHdoaWNoIG1lYW5zIHRoYXQg
VUJJIHdpbGwgcmUtdHJ5LCBidXQgbGF0ZXIuCisJICogJU1PVkVfUkVUUlkuIE5vdGUsIHdlIGRv
IG5vdCByZXR1cm4gJU1PVkVfQ0FOQ0VMX1JBQ0UgaGVyZSBiZWNhdXNlCisJICogd2UgZG8gbm90
IGtub3cgdGhlIHJlYXNvbnMgb2YgdGhlIGNvbnRlbnRpb24gLSBpdCBtYXkgYmUganVzdCBhCisJ
ICogbm9ybWFsIEkvTyBvbiB0aGlzIExFQiwgc28gd2Ugd2FudCB0byByZS10cnkuCiAJICovCiAJ
ZXJyID0gbGViX3dyaXRlX3RyeWxvY2sodWJpLCB2b2xfaWQsIGxudW0pOwogCWlmIChlcnIpIHsK
IAkJZGJnX3dsKCJjb250ZW50aW9uIG9uIExFQiAlZDolZCwgY2FuY2VsIiwgdm9sX2lkLCBsbnVt
KTsKLQkJcmV0dXJuIE1PVkVfQ0FOQ0VMX1JBQ0U7CisJCXJldHVybiBNT1ZFX1JFVFJZOwogCX0K
IAogCS8qCkBAIC0xMDUxLDEzICsxMDQ5LDEzIEBACiAKIAkvKgogCSAqIE9LLCBub3cgdGhlIExF
QiBpcyBsb2NrZWQgYW5kIHdlIGNhbiBzYWZlbHkgc3RhcnQgbW92aW5nIGl0LiBTaW5jZQotCSAq
IHRoaXMgZnVuY3Rpb24gdXRpbGl6ZXMgdGhlIEB1YmktPnBlYl9idWYxIGJ1ZmZlciB3aGljaCBp
cyBzaGFyZWQKKwkgKiB0aGlzIGZ1bmN0aW9uIHV0aWxpemVzIHRoZSBAdWJpLT5wZWJfYnVmIGJ1
ZmZlciB3aGljaCBpcyBzaGFyZWQKIAkgKiB3aXRoIHNvbWUgb3RoZXIgZnVuY3Rpb25zIC0gd2Ug
bG9jayB0aGUgYnVmZmVyIGJ5IHRha2luZyB0aGUKIAkgKiBAdWJpLT5idWZfbXV0ZXguCiAJICov
CiAJbXV0ZXhfbG9jaygmdWJpLT5idWZfbXV0ZXgpOwogCWRiZ193bCgicmVhZCAlZCBieXRlcyBv
ZiBkYXRhIiwgYWxkYXRhX3NpemUpOwotCWVyciA9IHViaV9pb19yZWFkX2RhdGEodWJpLCB1Ymkt
PnBlYl9idWYxLCBmcm9tLCAwLCBhbGRhdGFfc2l6ZSk7CisJZXJyID0gdWJpX2lvX3JlYWRfZGF0
YSh1YmksIHViaS0+cGViX2J1ZiwgZnJvbSwgMCwgYWxkYXRhX3NpemUpOwogCWlmIChlcnIgJiYg
ZXJyICE9IFVCSV9JT19CSVRGTElQUykgewogCQl1Ymlfd2FybigiZXJyb3IgJWQgd2hpbGUgcmVh
ZGluZyBkYXRhIGZyb20gUEVCICVkIiwKIAkJCSBlcnIsIGZyb20pOwpAQCAtMTA3NywxMCArMTA3
NSwxMCBAQAogCSAqLwogCWlmICh2aWRfaGRyLT52b2xfdHlwZSA9PSBVQklfVklEX0RZTkFNSUMp
CiAJCWFsZGF0YV9zaXplID0gZGF0YV9zaXplID0KLQkJCXViaV9jYWxjX2RhdGFfbGVuKHViaSwg
dWJpLT5wZWJfYnVmMSwgZGF0YV9zaXplKTsKKwkJCXViaV9jYWxjX2RhdGFfbGVuKHViaSwgdWJp
LT5wZWJfYnVmLCBkYXRhX3NpemUpOwogCiAJY29uZF9yZXNjaGVkKCk7Ci0JY3JjID0gY3JjMzIo
VUJJX0NSQzMyX0lOSVQsIHViaS0+cGViX2J1ZjEsIGRhdGFfc2l6ZSk7CisJY3JjID0gY3JjMzIo
VUJJX0NSQzMyX0lOSVQsIHViaS0+cGViX2J1ZiwgZGF0YV9zaXplKTsKIAljb25kX3Jlc2NoZWQo
KTsKIAogCS8qCkBAIC0xMTE0LDEyICsxMTEyLDEyIEBACiAJCQlpZiAoaXNfZXJyb3Jfc2FuZShl
cnIpKQogCQkJCWVyciA9IE1PVkVfVEFSR0VUX1JEX0VSUjsKIAkJfSBlbHNlCi0JCQllcnIgPSBN
T1ZFX0NBTkNFTF9CSVRGTElQUzsKKwkJCWVyciA9IE1PVkVfVEFSR0VUX0JJVEZMSVBTOwogCQln
b3RvIG91dF91bmxvY2tfYnVmOwogCX0KIAogCWlmIChkYXRhX3NpemUgPiAwKSB7Ci0JCWVyciA9
IHViaV9pb193cml0ZV9kYXRhKHViaSwgdWJpLT5wZWJfYnVmMSwgdG8sIDAsIGFsZGF0YV9zaXpl
KTsKKwkJZXJyID0gdWJpX2lvX3dyaXRlX2RhdGEodWJpLCB1YmktPnBlYl9idWYsIHRvLCAwLCBh
bGRhdGFfc2l6ZSk7CiAJCWlmIChlcnIpIHsKIAkJCWlmIChlcnIgPT0gLUVJTykKIAkJCQllcnIg
PSBNT1ZFX1RBUkdFVF9XUl9FUlI7CkBAIC0xMTMyLDggKzExMzAsOCBAQAogCQkgKiBXZSd2ZSB3
cml0dGVuIHRoZSBkYXRhIGFuZCBhcmUgZ29pbmcgdG8gcmVhZCBpdCBiYWNrIHRvIG1ha2UKIAkJ
ICogc3VyZSBpdCB3YXMgd3JpdHRlbiBjb3JyZWN0bHkuCiAJCSAqLwotCi0JCWVyciA9IHViaV9p
b19yZWFkX2RhdGEodWJpLCB1YmktPnBlYl9idWYyLCB0bywgMCwgYWxkYXRhX3NpemUpOworCQlt
ZW1zZXQodWJpLT5wZWJfYnVmLCAweEZGLCBhbGRhdGFfc2l6ZSk7CisJCWVyciA9IHViaV9pb19y
ZWFkX2RhdGEodWJpLCB1YmktPnBlYl9idWYsIHRvLCAwLCBhbGRhdGFfc2l6ZSk7CiAJCWlmIChl
cnIpIHsKIAkJCWlmIChlcnIgIT0gVUJJX0lPX0JJVEZMSVBTKSB7CiAJCQkJdWJpX3dhcm4oImVy
cm9yICVkIHdoaWxlIHJlYWRpbmcgZGF0YSBiYWNrICIKQEAgLTExNDEsMTMgKzExMzksMTMgQEAK
IAkJCQlpZiAoaXNfZXJyb3Jfc2FuZShlcnIpKQogCQkJCQllcnIgPSBNT1ZFX1RBUkdFVF9SRF9F
UlI7CiAJCQl9IGVsc2UKLQkJCQllcnIgPSBNT1ZFX0NBTkNFTF9CSVRGTElQUzsKKwkJCQllcnIg
PSBNT1ZFX1RBUkdFVF9CSVRGTElQUzsKIAkJCWdvdG8gb3V0X3VubG9ja19idWY7CiAJCX0KIAog
CQljb25kX3Jlc2NoZWQoKTsKIAotCQlpZiAobWVtY21wKHViaS0+cGViX2J1ZjEsIHViaS0+cGVi
X2J1ZjIsIGFsZGF0YV9zaXplKSkgeworCQlpZiAoY3JjICE9IGNyYzMyKFVCSV9DUkMzMl9JTklU
LCB1YmktPnBlYl9idWYsIGRhdGFfc2l6ZSkpIHsKIAkJCXViaV93YXJuKCJyZWFkIGRhdGEgYmFj
ayBmcm9tIFBFQiAlZCBhbmQgaXQgaXMgIgogCQkJCSAiZGlmZmVyZW50IiwgdG8pOwogCQkJZXJy
ID0gLUVJTlZBTDsKQEAgLTExNjksNyArMTE2Nyw3IEBACiAgKiBwcmludF9yc3ZkX3dhcm5pbmcg
LSB3YXJuIGFib3V0IG5vdCBoYXZpbmcgZW5vdWdoIHJlc2VydmVkIFBFQnMuCiAgKiBAdWJpOiBV
QkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVjdAogICoKLSAqIFRoaXMgaXMgYSBoZWxwZXIgZnVu
Y3Rpb24gZm9yICd1YmlfZWJhX2luaXRfc2NhbigpJyB3aGljaCBpcyBjYWxsZWQgd2hlbiBVQkkK
KyAqIFRoaXMgaXMgYSBoZWxwZXIgZnVuY3Rpb24gZm9yICd1YmlfZWJhX2luaXQoKScgd2hpY2gg
aXMgY2FsbGVkIHdoZW4gVUJJCiAgKiBjYW5ub3QgcmVzZXJ2ZSBlbm91Z2ggUEVCcyBmb3IgYmFk
IGJsb2NrIGhhbmRsaW5nLiBUaGlzIGZ1bmN0aW9uIG1ha2VzIGEKICAqIGRlY2lzaW9uIHdoZXRo
ZXIgd2UgaGF2ZSB0byBwcmludCBhIHdhcm5pbmcgb3Igbm90LiBUaGUgYWxnb3JpdGhtIGlzIGFz
CiAgKiBmb2xsb3dzOgpAQCAtMTE4NCwxMyArMTE4MiwxMyBAQAogICogcmVwb3J0ZWQgYnkgcmVh
bCB1c2Vycy4KICAqLwogc3RhdGljIHZvaWQgcHJpbnRfcnN2ZF93YXJuaW5nKHN0cnVjdCB1Ymlf
ZGV2aWNlICp1YmksCi0JCQkgICAgICAgc3RydWN0IHViaV9zY2FuX2luZm8gKnNpKQorCQkJICAg
ICAgIHN0cnVjdCB1YmlfYXR0YWNoX2luZm8gKmFpKQogewogCS8qCiAJICogVGhlIDEgPDwgMTgg
KDI1NktpQikgbnVtYmVyIGlzIHBpY2tlZCByYW5kb21seSwganVzdCBhIHJlYXNvbmFibHkKIAkg
KiBsYXJnZSBudW1iZXIgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBuZXdseSBmbGFzaGVkIGFuZCB1
c2VkIGltYWdlcy4KIAkgKi8KLQlpZiAoc2ktPm1heF9zcW51bSA+ICgxIDw8IDE4KSkgeworCWlm
IChhaS0+bWF4X3NxbnVtID4gKDEgPDwgMTgpKSB7CiAJCWludCBtaW4gPSB1YmktPmJlYl9yc3Zk
X2xldmVsIC8gMTA7CiAKIAkJaWYgKCFtaW4pCkBAIC0xMjA3LDE5ICsxMjA1LDE5IEBACiB9CiAK
IC8qKgotICogdWJpX2ViYV9pbml0X3NjYW4gLSBpbml0aWFsaXplIHRoZSBFQkEgc3ViLXN5c3Rl
bSB1c2luZyBzY2FubmluZyBpbmZvcm1hdGlvbi4KKyAqIHViaV9lYmFfaW5pdCAtIGluaXRpYWxp
emUgdGhlIEVCQSBzdWItc3lzdGVtIHVzaW5nIGF0dGFjaGluZyBpbmZvcm1hdGlvbi4KICAqIEB1
Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0Ci0gKiBAc2k6IHNjYW5uaW5nIGluZm9y
bWF0aW9uCisgKiBAYWk6IGF0dGFjaGluZyBpbmZvcm1hdGlvbgogICoKICAqIFRoaXMgZnVuY3Rp
b24gcmV0dXJucyB6ZXJvIGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBj
b2RlIGluCiAgKiBjYXNlIG9mIGZhaWx1cmUuCiAgKi8KLWludCB1YmlfZWJhX2luaXRfc2Nhbihz
dHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX3NjYW5faW5mbyAqc2kpCitpbnQgdWJp
X2ViYV9pbml0KHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1YmlfYXR0YWNoX2luZm8g
KmFpKQogewogCWludCBpLCBqLCBlcnIsIG51bV92b2x1bWVzOwotCXN0cnVjdCB1Ymlfc2Nhbl92
b2x1bWUgKnN2OworCXN0cnVjdCB1YmlfYWluZl92b2x1bWUgKmF2OwogCXN0cnVjdCB1Ymlfdm9s
dW1lICp2b2w7Ci0Jc3RydWN0IHViaV9zY2FuX2xlYiAqc2ViOworCXN0cnVjdCB1YmlfYWluZl9w
ZWIgKmFlYjsKIAlzdHJ1Y3QgcmJfbm9kZSAqcmI7CiAKIAlkYmdfZWJhKCJpbml0aWFsaXplIEVC
QSBzdWItc3lzdGVtIik7CkBAIC0xMjI4LDcgKzEyMjYsNyBAQAogCW11dGV4X2luaXQoJnViaS0+
YWxjX211dGV4KTsKIAl1YmktPmx0cmVlID0gUkJfUk9PVDsKIAotCXViaS0+Z2xvYmFsX3NxbnVt
ID0gc2ktPm1heF9zcW51bSArIDE7CisJdWJpLT5nbG9iYWxfc3FudW0gPSBhaS0+bWF4X3NxbnVt
ICsgMTsKIAludW1fdm9sdW1lcyA9IHViaS0+dnRibF9zbG90cyArIFVCSV9JTlRfVk9MX0NPVU5U
OwogCiAJZm9yIChpID0gMDsgaSA8IG51bV92b2x1bWVzOyBpKyspIHsKQEAgLTEyNDgsMTggKzEy
NDYsMTggQEAKIAkJZm9yIChqID0gMDsgaiA8IHZvbC0+cmVzZXJ2ZWRfcGViczsgaisrKQogCQkJ
dm9sLT5lYmFfdGJsW2pdID0gVUJJX0xFQl9VTk1BUFBFRDsKIAotCQlzdiA9IHViaV9zY2FuX2Zp
bmRfc3Yoc2ksIGlkeDJ2b2xfaWQodWJpLCBpKSk7Ci0JCWlmICghc3YpCisJCWF2ID0gdWJpX2Zp
bmRfYXYoYWksIGlkeDJ2b2xfaWQodWJpLCBpKSk7CisJCWlmICghYXYpCiAJCQljb250aW51ZTsK
IAotCQl1YmlfcmJfZm9yX2VhY2hfZW50cnkocmIsIHNlYiwgJnN2LT5yb290LCB1LnJiKSB7Ci0J
CQlpZiAoc2ViLT5sbnVtID49IHZvbC0+cmVzZXJ2ZWRfcGVicykKKwkJdWJpX3JiX2Zvcl9lYWNo
X2VudHJ5KHJiLCBhZWIsICZhdi0+cm9vdCwgdS5yYikgeworCQkJaWYgKGFlYi0+bG51bSA+PSB2
b2wtPnJlc2VydmVkX3BlYnMpCiAJCQkJLyoKIAkJCQkgKiBUaGlzIG1heSBoYXBwZW4gaW4gY2Fz
ZSBvZiBhbiB1bmNsZWFuIHJlYm9vdAogCQkJCSAqIGR1cmluZyByZS1zaXplLgogCQkJCSAqLwot
CQkJCXViaV9zY2FuX21vdmVfdG9fbGlzdChzdiwgc2ViLCAmc2ktPmVyYXNlKTsKLQkJCXZvbC0+
ZWJhX3RibFtzZWItPmxudW1dID0gc2ViLT5wbnVtOworCQkJCXViaV9tb3ZlX2FlYl90b19saXN0
KGF2LCBhZWIsICZhaS0+ZXJhc2UpOworCQkJdm9sLT5lYmFfdGJsW2FlYi0+bG51bV0gPSBhZWIt
PnBudW07CiAJCX0KIAl9CiAKQEAgLTEyODEsNyArMTI3OSw3IEBACiAJCWlmICh1YmktPmF2YWls
X3BlYnMgPCB1YmktPmJlYl9yc3ZkX2xldmVsKSB7CiAJCQkvKiBObyBlbm91Z2ggZnJlZSBwaHlz
aWNhbCBlcmFzZWJsb2NrcyAqLwogCQkJdWJpLT5iZWJfcnN2ZF9wZWJzID0gdWJpLT5hdmFpbF9w
ZWJzOwotCQkJcHJpbnRfcnN2ZF93YXJuaW5nKHViaSwgc2kpOworCQkJcHJpbnRfcnN2ZF93YXJu
aW5nKHViaSwgYWkpOwogCQl9IGVsc2UKIAkJCXViaS0+YmViX3JzdmRfcGVicyA9IHViaS0+YmVi
X3JzdmRfbGV2ZWw7CiAKZGlmZiAtdU4gLXVOciBsaW51eC0zLjAvZHJpdmVycy9tdGQvdWJpL2ds
dWViaS5jIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9kcml2ZXJzL210ZC91YmkvZ2x1ZWJpLmMK
LS0tIGxpbnV4LTMuMC9kcml2ZXJzL210ZC91YmkvZ2x1ZWJpLmMJMjAxMS0wNy0yMSAyMToxNzoy
My4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9kcml2ZXJzL210
ZC91YmkvZ2x1ZWJpLmMJMjAxMi0wNi0yOCAxMToyNjoxNS4wMDAwMDAwMDAgLTA1MDAKQEAgLTIz
OCw3ICsyMzgsNyBAQAogCQlpZiAodG9fd3JpdGUgPiB0b3RhbF93cml0dGVuKQogCQkJdG9fd3Jp
dGUgPSB0b3RhbF93cml0dGVuOwogCi0JCWVyciA9IHViaV93cml0ZShnbHVlYmktPmRlc2MsIGxu
dW0sIGJ1Ziwgb2ZmcywgdG9fd3JpdGUpOworCQllcnIgPSB1YmlfbGViX3dyaXRlKGdsdWViaS0+
ZGVzYywgbG51bSwgYnVmLCBvZmZzLCB0b193cml0ZSk7CiAJCWlmIChlcnIpCiAJCQlicmVhazsK
IApkaWZmIC11TiAtdU5yIGxpbnV4LTMuMC9kcml2ZXJzL210ZC91YmkvaW8uYyBsaW51eC0zLjAu
eC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL2lvLmMKLS0tIGxpbnV4LTMuMC9kcml2ZXJz
L210ZC91YmkvaW8uYwkyMDExLTA3LTIxIDIxOjE3OjIzLjAwMDAwMDAwMCAtMDUwMAorKysgbGlu
dXgtMy4wLngudWJpZnMubGF0ZXN0L2RyaXZlcnMvbXRkL3ViaS9pby5jCTIwMTItMDYtMjggMTE6
MjY6MTUuMDAwMDAwMDAwIC0wNTAwCkBAIC05MSwyMSArOTEsMTUgQEAKICNpbmNsdWRlIDxsaW51
eC9zbGFiLmg+CiAjaW5jbHVkZSAidWJpLmgiCiAKLSNpZmRlZiBDT05GSUdfTVREX1VCSV9ERUJV
Rwotc3RhdGljIGludCBwYXJhbm9pZF9jaGVja19ub3RfYmFkKGNvbnN0IHN0cnVjdCB1YmlfZGV2
aWNlICp1YmksIGludCBwbnVtKTsKLXN0YXRpYyBpbnQgcGFyYW5vaWRfY2hlY2tfcGViX2VjX2hk
cihjb25zdCBzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSk7Ci1zdGF0aWMgaW50IHBh
cmFub2lkX2NoZWNrX2VjX2hkcihjb25zdCBzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51
bSwKLQkJCQkgY29uc3Qgc3RydWN0IHViaV9lY19oZHIgKmVjX2hkcik7Ci1zdGF0aWMgaW50IHBh
cmFub2lkX2NoZWNrX3BlYl92aWRfaGRyKGNvbnN0IHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGlu
dCBwbnVtKTsKLXN0YXRpYyBpbnQgcGFyYW5vaWRfY2hlY2tfdmlkX2hkcihjb25zdCBzdHJ1Y3Qg
dWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwKLQkJCQkgIGNvbnN0IHN0cnVjdCB1YmlfdmlkX2hk
ciAqdmlkX2hkcik7Ci0jZWxzZQotI2RlZmluZSBwYXJhbm9pZF9jaGVja19ub3RfYmFkKHViaSwg
cG51bSkgMAotI2RlZmluZSBwYXJhbm9pZF9jaGVja19wZWJfZWNfaGRyKHViaSwgcG51bSkgIDAK
LSNkZWZpbmUgcGFyYW5vaWRfY2hlY2tfZWNfaGRyKHViaSwgcG51bSwgZWNfaGRyKSAgMAotI2Rl
ZmluZSBwYXJhbm9pZF9jaGVja19wZWJfdmlkX2hkcih1YmksIHBudW0pIDAKLSNkZWZpbmUgcGFy
YW5vaWRfY2hlY2tfdmlkX2hkcih1YmksIHBudW0sIHZpZF9oZHIpIDAKLSNlbmRpZgorc3RhdGlj
IGludCBzZWxmX2NoZWNrX25vdF9iYWQoY29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50
IHBudW0pOworc3RhdGljIGludCBzZWxmX2NoZWNrX3BlYl9lY19oZHIoY29uc3Qgc3RydWN0IHVi
aV9kZXZpY2UgKnViaSwgaW50IHBudW0pOworc3RhdGljIGludCBzZWxmX2NoZWNrX2VjX2hkcihj
b25zdCBzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwKKwkJCSAgICAgY29uc3Qgc3Ry
dWN0IHViaV9lY19oZHIgKmVjX2hkcik7CitzdGF0aWMgaW50IHNlbGZfY2hlY2tfcGViX3ZpZF9o
ZHIoY29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IHBudW0pOworc3RhdGljIGludCBz
ZWxmX2NoZWNrX3ZpZF9oZHIoY29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IHBudW0s
CisJCQkgICAgICBjb25zdCBzdHJ1Y3QgdWJpX3ZpZF9oZHIgKnZpZF9oZHIpOworc3RhdGljIGlu
dCBzZWxmX2NoZWNrX3dyaXRlKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGNvbnN0IHZvaWQgKmJ1
ZiwgaW50IHBudW0sCisJCQkgICAgaW50IG9mZnNldCwgaW50IGxlbik7CiAKIC8qKgogICogdWJp
X2lvX3JlYWQgLSByZWFkIGRhdGEgZnJvbSBhIHBoeXNpY2FsIGVyYXNlYmxvY2suCkBAIC0xNDIs
NyArMTM2LDcgQEAKIAl1YmlfYXNzZXJ0KG9mZnNldCA+PSAwICYmIG9mZnNldCArIGxlbiA8PSB1
YmktPnBlYl9zaXplKTsKIAl1YmlfYXNzZXJ0KGxlbiA+IDApOwogCi0JZXJyID0gcGFyYW5vaWRf
Y2hlY2tfbm90X2JhZCh1YmksIHBudW0pOworCWVyciA9IHNlbGZfY2hlY2tfbm90X2JhZCh1Ymks
IHBudW0pOwogCWlmIChlcnIpCiAJCXJldHVybiBlcnI7CiAKQEAgLTE4OSwxNiArMTgzLDE2IEBA
CiAJCX0KIAogCQlpZiAocmV0cmllcysrIDwgVUJJX0lPX1JFVFJJRVMpIHsKLQkJCWRiZ19pbygi
ZXJyb3IgJWQlcyB3aGlsZSByZWFkaW5nICVkIGJ5dGVzIGZyb20gUEVCICIKLQkJCSAgICAgICAi
JWQ6JWQsIHJlYWQgb25seSAlemQgYnl0ZXMsIHJldHJ5IiwKLQkJCSAgICAgICBlcnIsIGVycnN0
ciwgbGVuLCBwbnVtLCBvZmZzZXQsIHJlYWQpOworCQkJdWJpX3dhcm4oImVycm9yICVkJXMgd2hp
bGUgcmVhZGluZyAlZCBieXRlcyBmcm9tIFBFQiAiCisJCQkJICIlZDolZCwgcmVhZCBvbmx5ICV6
ZCBieXRlcywgcmV0cnkiLAorCQkJCSBlcnIsIGVycnN0ciwgbGVuLCBwbnVtLCBvZmZzZXQsIHJl
YWQpOwogCQkJeWllbGQoKTsKIAkJCWdvdG8gcmV0cnk7CiAJCX0KIAogCQl1YmlfZXJyKCJlcnJv
ciAlZCVzIHdoaWxlIHJlYWRpbmcgJWQgYnl0ZXMgZnJvbSBQRUIgJWQ6JWQsICIKIAkJCSJyZWFk
ICV6ZCBieXRlcyIsIGVyciwgZXJyc3RyLCBsZW4sIHBudW0sIG9mZnNldCwgcmVhZCk7Ci0JCXVi
aV9kYmdfZHVtcF9zdGFjaygpOworCQlkdW1wX3N0YWNrKCk7CiAKIAkJLyoKIAkJICogVGhlIGRy
aXZlciBzaG91bGQgbmV2ZXIgcmV0dXJuIC1FQkFETVNHIGlmIGl0IGZhaWxlZCB0byByZWFkCkBA
IC0yMTIsNyArMjA2LDcgQEAKIAl9IGVsc2UgewogCQl1YmlfYXNzZXJ0KGxlbiA9PSByZWFkKTsK
IAotCQlpZiAodWJpX2RiZ19pc19iaXRmbGlwKCkpIHsKKwkJaWYgKHViaV9kYmdfaXNfYml0Zmxp
cCh1YmkpKSB7CiAJCQlkYmdfZ2VuKCJiaXQtZmxpcCAoZW11bGF0ZWQpIik7CiAJCQllcnIgPSBV
QklfSU9fQklURkxJUFM7CiAJCX0KQEAgLTI1NywxNCArMjUxLDEyIEBACiAJCXJldHVybiAtRVJP
RlM7CiAJfQogCi0JLyogVGhlIGJlbG93IGhhcyB0byBiZSBjb21waWxlZCBvdXQgaWYgcGFyYW5v
aWQgY2hlY2tzIGFyZSBkaXNhYmxlZCAqLwotCi0JZXJyID0gcGFyYW5vaWRfY2hlY2tfbm90X2Jh
ZCh1YmksIHBudW0pOworCWVyciA9IHNlbGZfY2hlY2tfbm90X2JhZCh1YmksIHBudW0pOwogCWlm
IChlcnIpCiAJCXJldHVybiBlcnI7CiAKIAkvKiBUaGUgYXJlYSB3ZSBhcmUgd3JpdGluZyB0byBo
YXMgdG8gY29udGFpbiBhbGwgMHhGRiBieXRlcyAqLwotCWVyciA9IHViaV9kYmdfY2hlY2tfYWxs
X2ZmKHViaSwgcG51bSwgb2Zmc2V0LCBsZW4pOworCWVyciA9IHViaV9zZWxmX2NoZWNrX2FsbF9m
Zih1YmksIHBudW0sIG9mZnNldCwgbGVuKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCkBA
IC0yNzMsMTggKzI2NSwxOCBAQAogCQkgKiBXZSB3cml0ZSB0byB0aGUgZGF0YSBhcmVhIG9mIHRo
ZSBwaHlzaWNhbCBlcmFzZWJsb2NrLiBNYWtlCiAJCSAqIHN1cmUgaXQgaGFzIHZhbGlkIEVDIGFu
ZCBWSUQgaGVhZGVycy4KIAkJICovCi0JCWVyciA9IHBhcmFub2lkX2NoZWNrX3BlYl9lY19oZHIo
dWJpLCBwbnVtKTsKKwkJZXJyID0gc2VsZl9jaGVja19wZWJfZWNfaGRyKHViaSwgcG51bSk7CiAJ
CWlmIChlcnIpCiAJCQlyZXR1cm4gZXJyOwotCQllcnIgPSBwYXJhbm9pZF9jaGVja19wZWJfdmlk
X2hkcih1YmksIHBudW0pOworCQllcnIgPSBzZWxmX2NoZWNrX3BlYl92aWRfaGRyKHViaSwgcG51
bSk7CiAJCWlmIChlcnIpCiAJCQlyZXR1cm4gZXJyOwogCX0KIAotCWlmICh1YmlfZGJnX2lzX3dy
aXRlX2ZhaWx1cmUoKSkgewotCQlkYmdfZXJyKCJjYW5ub3Qgd3JpdGUgJWQgYnl0ZXMgdG8gUEVC
ICVkOiVkICIKKwlpZiAodWJpX2RiZ19pc193cml0ZV9mYWlsdXJlKHViaSkpIHsKKwkJdWJpX2Vy
cigiY2Fubm90IHdyaXRlICVkIGJ5dGVzIHRvIFBFQiAlZDolZCAiCiAJCQkiKGVtdWxhdGVkKSIs
IGxlbiwgcG51bSwgb2Zmc2V0KTsKLQkJdWJpX2RiZ19kdW1wX3N0YWNrKCk7CisJCWR1bXBfc3Rh
Y2soKTsKIAkJcmV0dXJuIC1FSU87CiAJfQogCkBAIC0yOTMsMTMgKzI4NSwxMyBAQAogCWlmIChl
cnIpIHsKIAkJdWJpX2VycigiZXJyb3IgJWQgd2hpbGUgd3JpdGluZyAlZCBieXRlcyB0byBQRUIg
JWQ6JWQsIHdyaXR0ZW4gIgogCQkJIiV6ZCBieXRlcyIsIGVyciwgbGVuLCBwbnVtLCBvZmZzZXQs
IHdyaXR0ZW4pOwotCQl1YmlfZGJnX2R1bXBfc3RhY2soKTsKLQkJdWJpX2RiZ19kdW1wX2ZsYXNo
KHViaSwgcG51bSwgb2Zmc2V0LCBsZW4pOworCQlkdW1wX3N0YWNrKCk7CisJCXViaV9kdW1wX2Zs
YXNoKHViaSwgcG51bSwgb2Zmc2V0LCBsZW4pOwogCX0gZWxzZQogCQl1YmlfYXNzZXJ0KHdyaXR0
ZW4gPT0gbGVuKTsKIAogCWlmICghZXJyKSB7Ci0JCWVyciA9IHViaV9kYmdfY2hlY2tfd3JpdGUo
dWJpLCBidWYsIHBudW0sIG9mZnNldCwgbGVuKTsKKwkJZXJyID0gc2VsZl9jaGVja193cml0ZSh1
YmksIGJ1ZiwgcG51bSwgb2Zmc2V0LCBsZW4pOwogCQlpZiAoZXJyKQogCQkJcmV0dXJuIGVycjsK
IApAQCAtMzEwLDcgKzMwMiw3IEBACiAJCW9mZnNldCArPSBsZW47CiAJCWxlbiA9IHViaS0+cGVi
X3NpemUgLSBvZmZzZXQ7CiAJCWlmIChsZW4pCi0JCQllcnIgPSB1YmlfZGJnX2NoZWNrX2FsbF9m
Zih1YmksIHBudW0sIG9mZnNldCwgbGVuKTsKKwkJCWVyciA9IHViaV9zZWxmX2NoZWNrX2FsbF9m
Zih1YmksIHBudW0sIG9mZnNldCwgbGVuKTsKIAl9CiAKIAlyZXR1cm4gZXJyOwpAQCAtMzY0LDEz
ICszNTYsMTMgQEAKIAllcnIgPSB1YmktPm10ZC0+ZXJhc2UodWJpLT5tdGQsICZlaSk7CiAJaWYg
KGVycikgewogCQlpZiAocmV0cmllcysrIDwgVUJJX0lPX1JFVFJJRVMpIHsKLQkJCWRiZ19pbygi
ZXJyb3IgJWQgd2hpbGUgZXJhc2luZyBQRUIgJWQsIHJldHJ5IiwKLQkJCSAgICAgICBlcnIsIHBu
dW0pOworCQkJdWJpX3dhcm4oImVycm9yICVkIHdoaWxlIGVyYXNpbmcgUEVCICVkLCByZXRyeSIs
CisJCQkJIGVyciwgcG51bSk7CiAJCQl5aWVsZCgpOwogCQkJZ290byByZXRyeTsKIAkJfQogCQl1
YmlfZXJyKCJjYW5ub3QgZXJhc2UgUEVCICVkLCBlcnJvciAlZCIsIHBudW0sIGVycik7Ci0JCXVi
aV9kYmdfZHVtcF9zdGFjaygpOworCQlkdW1wX3N0YWNrKCk7CiAJCXJldHVybiBlcnI7CiAJfQog
CkBAIC0zODMsMjEgKzM3NSwyMSBAQAogCiAJaWYgKGVpLnN0YXRlID09IE1URF9FUkFTRV9GQUlM
RUQpIHsKIAkJaWYgKHJldHJpZXMrKyA8IFVCSV9JT19SRVRSSUVTKSB7Ci0JCQlkYmdfaW8oImVy
cm9yIHdoaWxlIGVyYXNpbmcgUEVCICVkLCByZXRyeSIsIHBudW0pOworCQkJdWJpX3dhcm4oImVy
cm9yIHdoaWxlIGVyYXNpbmcgUEVCICVkLCByZXRyeSIsIHBudW0pOwogCQkJeWllbGQoKTsKIAkJ
CWdvdG8gcmV0cnk7CiAJCX0KIAkJdWJpX2VycigiY2Fubm90IGVyYXNlIFBFQiAlZCIsIHBudW0p
OwotCQl1YmlfZGJnX2R1bXBfc3RhY2soKTsKKwkJZHVtcF9zdGFjaygpOwogCQlyZXR1cm4gLUVJ
TzsKIAl9CiAKLQllcnIgPSB1YmlfZGJnX2NoZWNrX2FsbF9mZih1YmksIHBudW0sIDAsIHViaS0+
cGViX3NpemUpOworCWVyciA9IHViaV9zZWxmX2NoZWNrX2FsbF9mZih1YmksIHBudW0sIDAsIHVi
aS0+cGViX3NpemUpOwogCWlmIChlcnIpCiAJCXJldHVybiBlcnI7CiAKLQlpZiAodWJpX2RiZ19p
c19lcmFzZV9mYWlsdXJlKCkpIHsKLQkJZGJnX2VycigiY2Fubm90IGVyYXNlIFBFQiAlZCAoZW11
bGF0ZWQpIiwgcG51bSk7CisJaWYgKHViaV9kYmdfaXNfZXJhc2VfZmFpbHVyZSh1YmkpKSB7CisJ
CXViaV9lcnIoImNhbm5vdCBlcmFzZSBQRUIgJWQgKGVtdWxhdGVkKSIsIHBudW0pOwogCQlyZXR1
cm4gLUVJTzsKIAl9CiAKQEAgLTQzMSwxMSArNDIzLDExIEBACiAJCQlnb3RvIG91dDsKIAogCQkv
KiBNYWtlIHN1cmUgdGhlIFBFQiBjb250YWlucyBvbmx5IDB4RkYgYnl0ZXMgKi8KLQkJZXJyID0g
dWJpX2lvX3JlYWQodWJpLCB1YmktPnBlYl9idWYxLCBwbnVtLCAwLCB1YmktPnBlYl9zaXplKTsK
KwkJZXJyID0gdWJpX2lvX3JlYWQodWJpLCB1YmktPnBlYl9idWYsIHBudW0sIDAsIHViaS0+cGVi
X3NpemUpOwogCQlpZiAoZXJyKQogCQkJZ290byBvdXQ7CiAKLQkJZXJyID0gdWJpX2NoZWNrX3Bh
dHRlcm4odWJpLT5wZWJfYnVmMSwgMHhGRiwgdWJpLT5wZWJfc2l6ZSk7CisJCWVyciA9IHViaV9j
aGVja19wYXR0ZXJuKHViaS0+cGViX2J1ZiwgMHhGRiwgdWJpLT5wZWJfc2l6ZSk7CiAJCWlmIChl
cnIgPT0gMCkgewogCQkJdWJpX2VycigiZXJhc2VkIFBFQiAlZCwgYnV0IGEgbm9uLTB4RkYgYnl0
ZSBmb3VuZCIsCiAJCQkJcG51bSk7CkBAIC00NDQsMTcgKzQzNiwxNyBAQAogCQl9CiAKIAkJLyog
V3JpdGUgYSBwYXR0ZXJuIGFuZCBjaGVjayBpdCAqLwotCQltZW1zZXQodWJpLT5wZWJfYnVmMSwg
cGF0dGVybnNbaV0sIHViaS0+cGViX3NpemUpOwotCQllcnIgPSB1YmlfaW9fd3JpdGUodWJpLCB1
YmktPnBlYl9idWYxLCBwbnVtLCAwLCB1YmktPnBlYl9zaXplKTsKKwkJbWVtc2V0KHViaS0+cGVi
X2J1ZiwgcGF0dGVybnNbaV0sIHViaS0+cGViX3NpemUpOworCQllcnIgPSB1YmlfaW9fd3JpdGUo
dWJpLCB1YmktPnBlYl9idWYsIHBudW0sIDAsIHViaS0+cGViX3NpemUpOwogCQlpZiAoZXJyKQog
CQkJZ290byBvdXQ7CiAKLQkJbWVtc2V0KHViaS0+cGViX2J1ZjEsIH5wYXR0ZXJuc1tpXSwgdWJp
LT5wZWJfc2l6ZSk7Ci0JCWVyciA9IHViaV9pb19yZWFkKHViaSwgdWJpLT5wZWJfYnVmMSwgcG51
bSwgMCwgdWJpLT5wZWJfc2l6ZSk7CisJCW1lbXNldCh1YmktPnBlYl9idWYsIH5wYXR0ZXJuc1tp
XSwgdWJpLT5wZWJfc2l6ZSk7CisJCWVyciA9IHViaV9pb19yZWFkKHViaSwgdWJpLT5wZWJfYnVm
LCBwbnVtLCAwLCB1YmktPnBlYl9zaXplKTsKIAkJaWYgKGVycikKIAkJCWdvdG8gb3V0OwogCi0J
CWVyciA9IHViaV9jaGVja19wYXR0ZXJuKHViaS0+cGViX2J1ZjEsIHBhdHRlcm5zW2ldLAorCQll
cnIgPSB1YmlfY2hlY2tfcGF0dGVybih1YmktPnBlYl9idWYsIHBhdHRlcm5zW2ldLAogCQkJCQl1
YmktPnBlYl9zaXplKTsKIAkJaWYgKGVyciA9PSAwKSB7CiAJCQl1YmlfZXJyKCJwYXR0ZXJuICV4
IGNoZWNraW5nIGZhaWxlZCBmb3IgUEVCICVkIiwKQEAgLTUyMSw4ICs1MTMsNyBAQAogCSAqIEl0
IGlzIGltcG9ydGFudCB0byBmaXJzdCBpbnZhbGlkYXRlIHRoZSBFQyBoZWFkZXIsIGFuZCB0aGVu
IHRoZSBWSUQKIAkgKiBoZWFkZXIuIE90aGVyd2lzZSBhIHBvd2VyIGN1dCBtYXkgbGVhZCB0byB2
YWxpZCBFQyBoZWFkZXIgYW5kCiAJICogaW52YWxpZCBWSUQgaGVhZGVyLCBpbiB3aGljaCBjYXNl
IFVCSSB3aWxsIHRyZWF0IHRoaXMgUEVCIGFzCi0JICogY29ycnVwdGVkIGFuZCB3aWxsIHRyeSB0
byBwcmVzZXJ2ZSBpdCwgYW5kIHByaW50IHNjYXJ5IHdhcm5pbmdzIChzZWUKLQkgKiB0aGUgaGVh
ZGVyIGNvbW1lbnQgaW4gc2Nhbi5jIGZvciBtb3JlIGluZm9ybWF0aW9uKS4KKwkgKiBjb3JydXB0
ZWQgYW5kIHdpbGwgdHJ5IHRvIHByZXNlcnZlIGl0LCBhbmQgcHJpbnQgc2Nhcnkgd2FybmluZ3Mu
CiAJICovCiAJYWRkciA9IChsb2ZmX3QpcG51bSAqIHViaS0+cGViX3NpemU7CiAJZXJyID0gdWJp
LT5tdGQtPndyaXRlKHViaS0+bXRkLCBhZGRyLCA0LCAmd3JpdHRlbiwgKHZvaWQgKikmZGF0YSk7
CkBAIC01NjQsNyArNTU1LDcgQEAKIAkgKi8KIAl1YmlfZXJyKCJjYW5ub3QgaW52YWxpZGF0ZSBQ
RUIgJWQsIHdyaXRlIHJldHVybmVkICVkIHJlYWQgcmV0dXJuZWQgJWQiLAogCQlwbnVtLCBlcnIs
IGVycjEpOwotCXViaV9kYmdfZHVtcF9mbGFzaCh1YmksIHBudW0sIDAsIHViaS0+cGViX3NpemUp
OworCXViaV9kdW1wX2ZsYXNoKHViaSwgcG51bSwgMCwgdWJpLT5wZWJfc2l6ZSk7CiAJcmV0dXJu
IC1FSU87CiB9CiAKQEAgLTU5MCw3ICs1ODEsNyBAQAogCiAJdWJpX2Fzc2VydChwbnVtID49IDAg
JiYgcG51bSA8IHViaS0+cGViX2NvdW50KTsKIAotCWVyciA9IHBhcmFub2lkX2NoZWNrX25vdF9i
YWQodWJpLCBwbnVtKTsKKwllcnIgPSBzZWxmX2NoZWNrX25vdF9iYWQodWJpLCBwbnVtKTsKIAlp
ZiAoZXJyICE9IDApCiAJCXJldHVybiBlcnI7CiAKQEAgLTcyMiw4ICs3MTMsOCBAQAogCiBiYWQ6
CiAJdWJpX2VycigiYmFkIEVDIGhlYWRlciIpOwotCXViaV9kYmdfZHVtcF9lY19oZHIoZWNfaGRy
KTsKLQl1YmlfZGJnX2R1bXBfc3RhY2soKTsKKwl1YmlfZHVtcF9lY19oZHIoZWNfaGRyKTsKKwlk
dW1wX3N0YWNrKCk7CiAJcmV0dXJuIDE7CiB9CiAKQEAgLTgwNCw3ICs3OTUsNyBAQAogCQlpZiAo
dmVyYm9zZSkgewogCQkJdWJpX3dhcm4oImJhZCBtYWdpYyBudW1iZXIgYXQgUEVCICVkOiAlMDh4
IGluc3RlYWQgb2YgIgogCQkJCSAiJTA4eCIsIHBudW0sIG1hZ2ljLCBVQklfRUNfSERSX01BR0lD
KTsKLQkJCXViaV9kYmdfZHVtcF9lY19oZHIoZWNfaGRyKTsKKwkJCXViaV9kdW1wX2VjX2hkcihl
Y19oZHIpOwogCQl9CiAJCWRiZ19ibGQoImJhZCBtYWdpYyBudW1iZXIgYXQgUEVCICVkOiAlMDh4
IGluc3RlYWQgb2YgIgogCQkJIiUwOHgiLCBwbnVtLCBtYWdpYywgVUJJX0VDX0hEUl9NQUdJQyk7
CkBAIC04MTgsNyArODA5LDcgQEAKIAkJaWYgKHZlcmJvc2UpIHsKIAkJCXViaV93YXJuKCJiYWQg
RUMgaGVhZGVyIENSQyBhdCBQRUIgJWQsIGNhbGN1bGF0ZWQgIgogCQkJCSAiJSMwOHgsIHJlYWQg
JSMwOHgiLCBwbnVtLCBjcmMsIGhkcl9jcmMpOwotCQkJdWJpX2RiZ19kdW1wX2VjX2hkcihlY19o
ZHIpOworCQkJdWJpX2R1bXBfZWNfaGRyKGVjX2hkcik7CiAJCX0KIAkJZGJnX2JsZCgiYmFkIEVD
IGhlYWRlciBDUkMgYXQgUEVCICVkLCBjYWxjdWxhdGVkICIKIAkJCSIlIzA4eCwgcmVhZCAlIzA4
eCIsIHBudW0sIGNyYywgaGRyX2NyYyk7CkBAIC04NzUsNyArODY2LDcgQEAKIAljcmMgPSBjcmMz
MihVQklfQ1JDMzJfSU5JVCwgZWNfaGRyLCBVQklfRUNfSERSX1NJWkVfQ1JDKTsKIAllY19oZHIt
Pmhkcl9jcmMgPSBjcHVfdG9fYmUzMihjcmMpOwogCi0JZXJyID0gcGFyYW5vaWRfY2hlY2tfZWNf
aGRyKHViaSwgcG51bSwgZWNfaGRyKTsKKwllcnIgPSBzZWxmX2NoZWNrX2VjX2hkcih1YmksIHBu
dW0sIGVjX2hkcik7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKIApAQCAtOTA2LDQwICs4OTcs
NDAgQEAKIAlpbnQgdXNhYmxlX2xlYl9zaXplID0gdWJpLT5sZWJfc2l6ZSAtIGRhdGFfcGFkOwog
CiAJaWYgKGNvcHlfZmxhZyAhPSAwICYmIGNvcHlfZmxhZyAhPSAxKSB7Ci0JCWRiZ19lcnIoImJh
ZCBjb3B5X2ZsYWciKTsKKwkJdWJpX2VycigiYmFkIGNvcHlfZmxhZyIpOwogCQlnb3RvIGJhZDsK
IAl9CiAKIAlpZiAodm9sX2lkIDwgMCB8fCBsbnVtIDwgMCB8fCBkYXRhX3NpemUgPCAwIHx8IHVz
ZWRfZWJzIDwgMCB8fAogCSAgICBkYXRhX3BhZCA8IDApIHsKLQkJZGJnX2VycigibmVnYXRpdmUg
dmFsdWVzIik7CisJCXViaV9lcnIoIm5lZ2F0aXZlIHZhbHVlcyIpOwogCQlnb3RvIGJhZDsKIAl9
CiAKIAlpZiAodm9sX2lkID49IFVCSV9NQVhfVk9MVU1FUyAmJiB2b2xfaWQgPCBVQklfSU5URVJO
QUxfVk9MX1NUQVJUKSB7Ci0JCWRiZ19lcnIoImJhZCB2b2xfaWQiKTsKKwkJdWJpX2VycigiYmFk
IHZvbF9pZCIpOwogCQlnb3RvIGJhZDsKIAl9CiAKIAlpZiAodm9sX2lkIDwgVUJJX0lOVEVSTkFM
X1ZPTF9TVEFSVCAmJiBjb21wYXQgIT0gMCkgewotCQlkYmdfZXJyKCJiYWQgY29tcGF0Iik7CisJ
CXViaV9lcnIoImJhZCBjb21wYXQiKTsKIAkJZ290byBiYWQ7CiAJfQogCiAJaWYgKHZvbF9pZCA+
PSBVQklfSU5URVJOQUxfVk9MX1NUQVJUICYmIGNvbXBhdCAhPSBVQklfQ09NUEFUX0RFTEVURSAm
JgogCSAgICBjb21wYXQgIT0gVUJJX0NPTVBBVF9STyAmJiBjb21wYXQgIT0gVUJJX0NPTVBBVF9Q
UkVTRVJWRSAmJgogCSAgICBjb21wYXQgIT0gVUJJX0NPTVBBVF9SRUpFQ1QpIHsKLQkJZGJnX2Vy
cigiYmFkIGNvbXBhdCIpOworCQl1YmlfZXJyKCJiYWQgY29tcGF0Iik7CiAJCWdvdG8gYmFkOwog
CX0KIAogCWlmICh2b2xfdHlwZSAhPSBVQklfVklEX0RZTkFNSUMgJiYgdm9sX3R5cGUgIT0gVUJJ
X1ZJRF9TVEFUSUMpIHsKLQkJZGJnX2VycigiYmFkIHZvbF90eXBlIik7CisJCXViaV9lcnIoImJh
ZCB2b2xfdHlwZSIpOwogCQlnb3RvIGJhZDsKIAl9CiAKIAlpZiAoZGF0YV9wYWQgPj0gdWJpLT5s
ZWJfc2l6ZSAvIDIpIHsKLQkJZGJnX2VycigiYmFkIGRhdGFfcGFkIik7CisJCXViaV9lcnIoImJh
ZCBkYXRhX3BhZCIpOwogCQlnb3RvIGJhZDsKIAl9CiAKQEAgLTk1MSw0NSArOTQyLDQ1IEBACiAJ
CSAqIG1hcHBlZCBsb2dpY2FsIGVyYXNlYmxvY2tzLgogCQkgKi8KIAkJaWYgKHVzZWRfZWJzID09
IDApIHsKLQkJCWRiZ19lcnIoInplcm8gdXNlZF9lYnMiKTsKKwkJCXViaV9lcnIoInplcm8gdXNl
ZF9lYnMiKTsKIAkJCWdvdG8gYmFkOwogCQl9CiAJCWlmIChkYXRhX3NpemUgPT0gMCkgewotCQkJ
ZGJnX2VycigiemVybyBkYXRhX3NpemUiKTsKKwkJCXViaV9lcnIoInplcm8gZGF0YV9zaXplIik7
CiAJCQlnb3RvIGJhZDsKIAkJfQogCQlpZiAobG51bSA8IHVzZWRfZWJzIC0gMSkgewogCQkJaWYg
KGRhdGFfc2l6ZSAhPSB1c2FibGVfbGViX3NpemUpIHsKLQkJCQlkYmdfZXJyKCJiYWQgZGF0YV9z
aXplIik7CisJCQkJdWJpX2VycigiYmFkIGRhdGFfc2l6ZSIpOwogCQkJCWdvdG8gYmFkOwogCQkJ
fQogCQl9IGVsc2UgaWYgKGxudW0gPT0gdXNlZF9lYnMgLSAxKSB7CiAJCQlpZiAoZGF0YV9zaXpl
ID09IDApIHsKLQkJCQlkYmdfZXJyKCJiYWQgZGF0YV9zaXplIGF0IGxhc3QgTEVCIik7CisJCQkJ
dWJpX2VycigiYmFkIGRhdGFfc2l6ZSBhdCBsYXN0IExFQiIpOwogCQkJCWdvdG8gYmFkOwogCQkJ
fQogCQl9IGVsc2UgewotCQkJZGJnX2VycigidG9vIGhpZ2ggbG51bSIpOworCQkJdWJpX2Vycigi
dG9vIGhpZ2ggbG51bSIpOwogCQkJZ290byBiYWQ7CiAJCX0KIAl9IGVsc2UgewogCQlpZiAoY29w
eV9mbGFnID09IDApIHsKIAkJCWlmIChkYXRhX2NyYyAhPSAwKSB7Ci0JCQkJZGJnX2Vycigibm9u
LXplcm8gZGF0YSBDUkMiKTsKKwkJCQl1YmlfZXJyKCJub24temVybyBkYXRhIENSQyIpOwogCQkJ
CWdvdG8gYmFkOwogCQkJfQogCQkJaWYgKGRhdGFfc2l6ZSAhPSAwKSB7Ci0JCQkJZGJnX2Vycigi
bm9uLXplcm8gZGF0YV9zaXplIik7CisJCQkJdWJpX2Vycigibm9uLXplcm8gZGF0YV9zaXplIik7
CiAJCQkJZ290byBiYWQ7CiAJCQl9CiAJCX0gZWxzZSB7CiAJCQlpZiAoZGF0YV9zaXplID09IDAp
IHsKLQkJCQlkYmdfZXJyKCJ6ZXJvIGRhdGFfc2l6ZSBvZiBjb3B5Iik7CisJCQkJdWJpX2Vycigi
emVybyBkYXRhX3NpemUgb2YgY29weSIpOwogCQkJCWdvdG8gYmFkOwogCQkJfQogCQl9CiAJCWlm
ICh1c2VkX2VicyAhPSAwKSB7Ci0JCQlkYmdfZXJyKCJiYWQgdXNlZF9lYnMiKTsKKwkJCXViaV9l
cnIoImJhZCB1c2VkX2VicyIpOwogCQkJZ290byBiYWQ7CiAJCX0KIAl9CkBAIC05OTgsOCArOTg5
LDggQEAKIAogYmFkOgogCXViaV9lcnIoImJhZCBWSUQgaGVhZGVyIik7Ci0JdWJpX2RiZ19kdW1w
X3ZpZF9oZHIodmlkX2hkcik7Ci0JdWJpX2RiZ19kdW1wX3N0YWNrKCk7CisJdWJpX2R1bXBfdmlk
X2hkcih2aWRfaGRyKTsKKwlkdW1wX3N0YWNrKCk7CiAJcmV0dXJuIDE7CiB9CiAKQEAgLTEwNTUs
NyArMTA0Niw3IEBACiAJCWlmICh2ZXJib3NlKSB7CiAJCQl1Ymlfd2FybigiYmFkIG1hZ2ljIG51
bWJlciBhdCBQRUIgJWQ6ICUwOHggaW5zdGVhZCBvZiAiCiAJCQkJICIlMDh4IiwgcG51bSwgbWFn
aWMsIFVCSV9WSURfSERSX01BR0lDKTsKLQkJCXViaV9kYmdfZHVtcF92aWRfaGRyKHZpZF9oZHIp
OworCQkJdWJpX2R1bXBfdmlkX2hkcih2aWRfaGRyKTsKIAkJfQogCQlkYmdfYmxkKCJiYWQgbWFn
aWMgbnVtYmVyIGF0IFBFQiAlZDogJTA4eCBpbnN0ZWFkIG9mICIKIAkJCSIlMDh4IiwgcG51bSwg
bWFnaWMsIFVCSV9WSURfSERSX01BR0lDKTsKQEAgLTEwNjksNyArMTA2MCw3IEBACiAJCWlmICh2
ZXJib3NlKSB7CiAJCQl1Ymlfd2FybigiYmFkIENSQyBhdCBQRUIgJWQsIGNhbGN1bGF0ZWQgJSMw
OHgsICIKIAkJCQkgInJlYWQgJSMwOHgiLCBwbnVtLCBjcmMsIGhkcl9jcmMpOwotCQkJdWJpX2Ri
Z19kdW1wX3ZpZF9oZHIodmlkX2hkcik7CisJCQl1YmlfZHVtcF92aWRfaGRyKHZpZF9oZHIpOwog
CQl9CiAJCWRiZ19ibGQoImJhZCBDUkMgYXQgUEVCICVkLCBjYWxjdWxhdGVkICUjMDh4LCAiCiAJ
CQkicmVhZCAlIzA4eCIsIHBudW0sIGNyYywgaGRyX2NyYyk7CkBAIC0xMTEzLDcgKzExMDQsNyBA
QAogCWRiZ19pbygid3JpdGUgVklEIGhlYWRlciB0byBQRUIgJWQiLCBwbnVtKTsKIAl1YmlfYXNz
ZXJ0KHBudW0gPj0gMCAmJiAgcG51bSA8IHViaS0+cGViX2NvdW50KTsKIAotCWVyciA9IHBhcmFu
b2lkX2NoZWNrX3BlYl9lY19oZHIodWJpLCBwbnVtKTsKKwllcnIgPSBzZWxmX2NoZWNrX3BlYl9l
Y19oZHIodWJpLCBwbnVtKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCkBAIC0xMTIyLDcg
KzExMTMsNyBAQAogCWNyYyA9IGNyYzMyKFVCSV9DUkMzMl9JTklULCB2aWRfaGRyLCBVQklfVklE
X0hEUl9TSVpFX0NSQyk7CiAJdmlkX2hkci0+aGRyX2NyYyA9IGNwdV90b19iZTMyKGNyYyk7CiAK
LQllcnIgPSBwYXJhbm9pZF9jaGVja192aWRfaGRyKHViaSwgcG51bSwgdmlkX2hkcik7CisJZXJy
ID0gc2VsZl9jaGVja192aWRfaGRyKHViaSwgcG51bSwgdmlkX2hkcik7CiAJaWYgKGVycikKIAkJ
cmV0dXJuIGVycjsKIApAQCAtMTEzMiwzNCArMTEyMywzMiBAQAogCXJldHVybiBlcnI7CiB9CiAK
LSNpZmRlZiBDT05GSUdfTVREX1VCSV9ERUJVRwotCiAvKioKLSAqIHBhcmFub2lkX2NoZWNrX25v
dF9iYWQgLSBlbnN1cmUgdGhhdCBhIHBoeXNpY2FsIGVyYXNlYmxvY2sgaXMgbm90IGJhZC4KKyAq
IHNlbGZfY2hlY2tfbm90X2JhZCAtIGVuc3VyZSB0aGF0IGEgcGh5c2ljYWwgZXJhc2VibG9jayBp
cyBub3QgYmFkLgogICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKICAqIEBw
bnVtOiBwaHlzaWNhbCBlcmFzZWJsb2NrIG51bWJlciB0byBjaGVjawogICoKICAqIFRoaXMgZnVu
Y3Rpb24gcmV0dXJucyB6ZXJvIGlmIHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIGlzIGdvb2QsICUt
RUlOVkFMIGlmCiAgKiBpdCBpcyBiYWQgYW5kIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBpZiBhbiBl
cnJvciBvY2N1cnJlZC4KICAqLwotc3RhdGljIGludCBwYXJhbm9pZF9jaGVja19ub3RfYmFkKGNv
bnN0IHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGludCBwbnVtKQorc3RhdGljIGludCBzZWxmX2No
ZWNrX25vdF9iYWQoY29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IHBudW0pCiB7CiAJ
aW50IGVycjsKIAotCWlmICghKHViaV9jaGtfZmxhZ3MgJiBVQklfQ0hLX0lPKSkKKwlpZiAoIXVi
aS0+ZGJnLT5jaGtfaW8pCiAJCXJldHVybiAwOwogCiAJZXJyID0gdWJpX2lvX2lzX2JhZCh1Ymks
IHBudW0pOwogCWlmICghZXJyKQogCQlyZXR1cm4gZXJyOwogCi0JdWJpX2VycigicGFyYW5vaWQg
Y2hlY2sgZmFpbGVkIGZvciBQRUIgJWQiLCBwbnVtKTsKLQl1YmlfZGJnX2R1bXBfc3RhY2soKTsK
Kwl1YmlfZXJyKCJzZWxmLWNoZWNrIGZhaWxlZCBmb3IgUEVCICVkIiwgcG51bSk7CisJZHVtcF9z
dGFjaygpOwogCXJldHVybiBlcnIgPiAwID8gLUVJTlZBTCA6IGVycjsKIH0KIAogLyoqCi0gKiBw
YXJhbm9pZF9jaGVja19lY19oZHIgLSBjaGVjayBpZiBhbiBlcmFzZSBjb3VudGVyIGhlYWRlciBp
cyBhbGwgcmlnaHQuCisgKiBzZWxmX2NoZWNrX2VjX2hkciAtIGNoZWNrIGlmIGFuIGVyYXNlIGNv
dW50ZXIgaGVhZGVyIGlzIGFsbCByaWdodC4KICAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRp
b24gb2JqZWN0CiAgKiBAcG51bTogcGh5c2ljYWwgZXJhc2VibG9jayBudW1iZXIgdGhlIGVyYXNl
IGNvdW50ZXIgaGVhZGVyIGJlbG9uZ3MgdG8KICAqIEBlY19oZHI6IHRoZSBlcmFzZSBjb3VudGVy
IGhlYWRlciB0byBjaGVjawpAQCAtMTE2NywxMyArMTE1NiwxMyBAQAogICogVGhpcyBmdW5jdGlv
biByZXR1cm5zIHplcm8gaWYgdGhlIGVyYXNlIGNvdW50ZXIgaGVhZGVyIGNvbnRhaW5zIHZhbGlk
CiAgKiB2YWx1ZXMsIGFuZCAlLUVJTlZBTCBpZiBub3QuCiAgKi8KLXN0YXRpYyBpbnQgcGFyYW5v
aWRfY2hlY2tfZWNfaGRyKGNvbnN0IHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGludCBwbnVtLAot
CQkJCSBjb25zdCBzdHJ1Y3QgdWJpX2VjX2hkciAqZWNfaGRyKQorc3RhdGljIGludCBzZWxmX2No
ZWNrX2VjX2hkcihjb25zdCBzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwKKwkJCSAg
ICAgY29uc3Qgc3RydWN0IHViaV9lY19oZHIgKmVjX2hkcikKIHsKIAlpbnQgZXJyOwogCXVpbnQz
Ml90IG1hZ2ljOwogCi0JaWYgKCEodWJpX2Noa19mbGFncyAmIFVCSV9DSEtfSU8pKQorCWlmICgh
dWJpLT5kYmctPmNoa19pbykKIAkJcmV0dXJuIDA7CiAKIAltYWdpYyA9IGJlMzJfdG9fY3B1KGVj
X2hkci0+bWFnaWMpOwpAQCAtMTE4NSwzMyArMTE3NCwzMyBAQAogCiAJZXJyID0gdmFsaWRhdGVf
ZWNfaGRyKHViaSwgZWNfaGRyKTsKIAlpZiAoZXJyKSB7Ci0JCXViaV9lcnIoInBhcmFub2lkIGNo
ZWNrIGZhaWxlZCBmb3IgUEVCICVkIiwgcG51bSk7CisJCXViaV9lcnIoInNlbGYtY2hlY2sgZmFp
bGVkIGZvciBQRUIgJWQiLCBwbnVtKTsKIAkJZ290byBmYWlsOwogCX0KIAogCXJldHVybiAwOwog
CiBmYWlsOgotCXViaV9kYmdfZHVtcF9lY19oZHIoZWNfaGRyKTsKLQl1YmlfZGJnX2R1bXBfc3Rh
Y2soKTsKKwl1YmlfZHVtcF9lY19oZHIoZWNfaGRyKTsKKwlkdW1wX3N0YWNrKCk7CiAJcmV0dXJu
IC1FSU5WQUw7CiB9CiAKIC8qKgotICogcGFyYW5vaWRfY2hlY2tfcGViX2VjX2hkciAtIGNoZWNr
IGVyYXNlIGNvdW50ZXIgaGVhZGVyLgorICogc2VsZl9jaGVja19wZWJfZWNfaGRyIC0gY2hlY2sg
ZXJhc2UgY291bnRlciBoZWFkZXIuCiAgKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9i
amVjdAogICogQHBudW06IHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIG51bWJlciB0byBjaGVjawog
ICoKICAqIFRoaXMgZnVuY3Rpb24gcmV0dXJucyB6ZXJvIGlmIHRoZSBlcmFzZSBjb3VudGVyIGhl
YWRlciBpcyBhbGwgcmlnaHQgYW5kIGFuZAogICogYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGlmIG5v
dCBvciBpZiBhbiBlcnJvciBvY2N1cnJlZC4KICAqLwotc3RhdGljIGludCBwYXJhbm9pZF9jaGVj
a19wZWJfZWNfaGRyKGNvbnN0IHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGludCBwbnVtKQorc3Rh
dGljIGludCBzZWxmX2NoZWNrX3BlYl9lY19oZHIoY29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnVi
aSwgaW50IHBudW0pCiB7CiAJaW50IGVycjsKIAl1aW50MzJfdCBjcmMsIGhkcl9jcmM7CiAJc3Ry
dWN0IHViaV9lY19oZHIgKmVjX2hkcjsKIAotCWlmICghKHViaV9jaGtfZmxhZ3MgJiBVQklfQ0hL
X0lPKSkKKwlpZiAoIXViaS0+ZGJnLT5jaGtfaW8pCiAJCXJldHVybiAwOwogCiAJZWNfaGRyID0g
a3phbGxvYyh1YmktPmVjX2hkcl9hbHNpemUsIEdGUF9OT0ZTKTsKQEAgLTEyMjYsMTQgKzEyMTUs
MTQgQEAKIAloZHJfY3JjID0gYmUzMl90b19jcHUoZWNfaGRyLT5oZHJfY3JjKTsKIAlpZiAoaGRy
X2NyYyAhPSBjcmMpIHsKIAkJdWJpX2VycigiYmFkIENSQywgY2FsY3VsYXRlZCAlIzA4eCwgcmVh
ZCAlIzA4eCIsIGNyYywgaGRyX2NyYyk7Ci0JCXViaV9lcnIoInBhcmFub2lkIGNoZWNrIGZhaWxl
ZCBmb3IgUEVCICVkIiwgcG51bSk7Ci0JCXViaV9kYmdfZHVtcF9lY19oZHIoZWNfaGRyKTsKLQkJ
dWJpX2RiZ19kdW1wX3N0YWNrKCk7CisJCXViaV9lcnIoInNlbGYtY2hlY2sgZmFpbGVkIGZvciBQ
RUIgJWQiLCBwbnVtKTsKKwkJdWJpX2R1bXBfZWNfaGRyKGVjX2hkcik7CisJCWR1bXBfc3RhY2so
KTsKIAkJZXJyID0gLUVJTlZBTDsKIAkJZ290byBleGl0OwogCX0KIAotCWVyciA9IHBhcmFub2lk
X2NoZWNrX2VjX2hkcih1YmksIHBudW0sIGVjX2hkcik7CisJZXJyID0gc2VsZl9jaGVja19lY19o
ZHIodWJpLCBwbnVtLCBlY19oZHIpOwogCiBleGl0OgogCWtmcmVlKGVjX2hkcik7CkBAIC0xMjQx
LDcgKzEyMzAsNyBAQAogfQogCiAvKioKLSAqIHBhcmFub2lkX2NoZWNrX3ZpZF9oZHIgLSBjaGVj
ayB0aGF0IGEgdm9sdW1lIGlkZW50aWZpZXIgaGVhZGVyIGlzIGFsbCByaWdodC4KKyAqIHNlbGZf
Y2hlY2tfdmlkX2hkciAtIGNoZWNrIHRoYXQgYSB2b2x1bWUgaWRlbnRpZmllciBoZWFkZXIgaXMg
YWxsIHJpZ2h0LgogICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKICAqIEBw
bnVtOiBwaHlzaWNhbCBlcmFzZWJsb2NrIG51bWJlciB0aGUgdm9sdW1lIGlkZW50aWZpZXIgaGVh
ZGVyIGJlbG9uZ3MgdG8KICAqIEB2aWRfaGRyOiB0aGUgdm9sdW1lIGlkZW50aWZpZXIgaGVhZGVy
IHRvIGNoZWNrCkBAIC0xMjQ5LDEzICsxMjM4LDEzIEBACiAgKiBUaGlzIGZ1bmN0aW9uIHJldHVy
bnMgemVybyBpZiB0aGUgdm9sdW1lIGlkZW50aWZpZXIgaGVhZGVyIGlzIGFsbCByaWdodCwgYW5k
CiAgKiAlLUVJTlZBTCBpZiBub3QuCiAgKi8KLXN0YXRpYyBpbnQgcGFyYW5vaWRfY2hlY2tfdmlk
X2hkcihjb25zdCBzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwKLQkJCQkgIGNvbnN0
IHN0cnVjdCB1YmlfdmlkX2hkciAqdmlkX2hkcikKK3N0YXRpYyBpbnQgc2VsZl9jaGVja192aWRf
aGRyKGNvbnN0IHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGludCBwbnVtLAorCQkJICAgICAgY29u
c3Qgc3RydWN0IHViaV92aWRfaGRyICp2aWRfaGRyKQogewogCWludCBlcnI7CiAJdWludDMyX3Qg
bWFnaWM7CiAKLQlpZiAoISh1YmlfY2hrX2ZsYWdzICYgVUJJX0NIS19JTykpCisJaWYgKCF1Ymkt
PmRiZy0+Y2hrX2lvKQogCQlyZXR1cm4gMDsKIAogCW1hZ2ljID0gYmUzMl90b19jcHUodmlkX2hk
ci0+bWFnaWMpOwpAQCAtMTI2NywzNiArMTI1NiwzNiBAQAogCiAJZXJyID0gdmFsaWRhdGVfdmlk
X2hkcih1YmksIHZpZF9oZHIpOwogCWlmIChlcnIpIHsKLQkJdWJpX2VycigicGFyYW5vaWQgY2hl
Y2sgZmFpbGVkIGZvciBQRUIgJWQiLCBwbnVtKTsKKwkJdWJpX2Vycigic2VsZi1jaGVjayBmYWls
ZWQgZm9yIFBFQiAlZCIsIHBudW0pOwogCQlnb3RvIGZhaWw7CiAJfQogCiAJcmV0dXJuIGVycjsK
IAogZmFpbDoKLQl1YmlfZXJyKCJwYXJhbm9pZCBjaGVjayBmYWlsZWQgZm9yIFBFQiAlZCIsIHBu
dW0pOwotCXViaV9kYmdfZHVtcF92aWRfaGRyKHZpZF9oZHIpOwotCXViaV9kYmdfZHVtcF9zdGFj
aygpOworCXViaV9lcnIoInNlbGYtY2hlY2sgZmFpbGVkIGZvciBQRUIgJWQiLCBwbnVtKTsKKwl1
YmlfZHVtcF92aWRfaGRyKHZpZF9oZHIpOworCWR1bXBfc3RhY2soKTsKIAlyZXR1cm4gLUVJTlZB
TDsKIAogfQogCiAvKioKLSAqIHBhcmFub2lkX2NoZWNrX3BlYl92aWRfaGRyIC0gY2hlY2sgdm9s
dW1lIGlkZW50aWZpZXIgaGVhZGVyLgorICogc2VsZl9jaGVja19wZWJfdmlkX2hkciAtIGNoZWNr
IHZvbHVtZSBpZGVudGlmaWVyIGhlYWRlci4KICAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRp
b24gb2JqZWN0CiAgKiBAcG51bTogdGhlIHBoeXNpY2FsIGVyYXNlYmxvY2sgbnVtYmVyIHRvIGNo
ZWNrCiAgKgogICogVGhpcyBmdW5jdGlvbiByZXR1cm5zIHplcm8gaWYgdGhlIHZvbHVtZSBpZGVu
dGlmaWVyIGhlYWRlciBpcyBhbGwgcmlnaHQsCiAgKiBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2Rl
IGlmIG5vdCBvciBpZiBhbiBlcnJvciBvY2N1cnJlZC4KICAqLwotc3RhdGljIGludCBwYXJhbm9p
ZF9jaGVja19wZWJfdmlkX2hkcihjb25zdCBzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51
bSkKK3N0YXRpYyBpbnQgc2VsZl9jaGVja19wZWJfdmlkX2hkcihjb25zdCBzdHJ1Y3QgdWJpX2Rl
dmljZSAqdWJpLCBpbnQgcG51bSkKIHsKIAlpbnQgZXJyOwogCXVpbnQzMl90IGNyYywgaGRyX2Ny
YzsKIAlzdHJ1Y3QgdWJpX3ZpZF9oZHIgKnZpZF9oZHI7CiAJdm9pZCAqcDsKIAotCWlmICghKHVi
aV9jaGtfZmxhZ3MgJiBVQklfQ0hLX0lPKSkKKwlpZiAoIXViaS0+ZGJnLT5jaGtfaW8pCiAJCXJl
dHVybiAwOwogCiAJdmlkX2hkciA9IHViaV96YWxsb2NfdmlkX2hkcih1YmksIEdGUF9OT0ZTKTsK
QEAgLTEzMTQsMTQgKzEzMDMsMTQgQEAKIAlpZiAoaGRyX2NyYyAhPSBjcmMpIHsKIAkJdWJpX2Vy
cigiYmFkIFZJRCBoZWFkZXIgQ1JDIGF0IFBFQiAlZCwgY2FsY3VsYXRlZCAlIzA4eCwgIgogCQkJ
InJlYWQgJSMwOHgiLCBwbnVtLCBjcmMsIGhkcl9jcmMpOwotCQl1YmlfZXJyKCJwYXJhbm9pZCBj
aGVjayBmYWlsZWQgZm9yIFBFQiAlZCIsIHBudW0pOwotCQl1YmlfZGJnX2R1bXBfdmlkX2hkcih2
aWRfaGRyKTsKLQkJdWJpX2RiZ19kdW1wX3N0YWNrKCk7CisJCXViaV9lcnIoInNlbGYtY2hlY2sg
ZmFpbGVkIGZvciBQRUIgJWQiLCBwbnVtKTsKKwkJdWJpX2R1bXBfdmlkX2hkcih2aWRfaGRyKTsK
KwkJZHVtcF9zdGFjaygpOwogCQllcnIgPSAtRUlOVkFMOwogCQlnb3RvIGV4aXQ7CiAJfQogCi0J
ZXJyID0gcGFyYW5vaWRfY2hlY2tfdmlkX2hkcih1YmksIHBudW0sIHZpZF9oZHIpOworCWVyciA9
IHNlbGZfY2hlY2tfdmlkX2hkcih1YmksIHBudW0sIHZpZF9oZHIpOwogCiBleGl0OgogCXViaV9m
cmVlX3ZpZF9oZHIodWJpLCB2aWRfaGRyKTsKQEAgLTEzMjksNyArMTMxOCw3IEBACiB9CiAKIC8q
KgotICogdWJpX2RiZ19jaGVja193cml0ZSAtIG1ha2Ugc3VyZSB3cml0ZSBzdWNjZWVkZWQuCisg
KiBzZWxmX2NoZWNrX3dyaXRlIC0gbWFrZSBzdXJlIHdyaXRlIHN1Y2NlZWRlZC4KICAqIEB1Ymk6
IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0CiAgKiBAYnVmOiBidWZmZXIgd2l0aCBkYXRh
IHdoaWNoIHdlcmUgd3JpdHRlbgogICogQHBudW06IHBoeXNpY2FsIGVyYXNlYmxvY2sgbnVtYmVy
IHRoZSBkYXRhIHdlcmUgd3JpdHRlbiB0bwpAQCAtMTM0MCwxNSArMTMyOSwxNSBAQAogICogdGhl
IG9yaWdpbmFsIGRhdGEgYnVmZmVyIC0gdGhlIGRhdGEgaGF2ZSB0byBtYXRjaC4gUmV0dXJucyB6
ZXJvIGlmIHRoZSBkYXRhCiAgKiBtYXRjaCBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGlmIG5v
dCBvciBpbiBjYXNlIG9mIGZhaWx1cmUuCiAgKi8KLWludCB1YmlfZGJnX2NoZWNrX3dyaXRlKHN0
cnVjdCB1YmlfZGV2aWNlICp1YmksIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IHBudW0sCi0JCQlpbnQg
b2Zmc2V0LCBpbnQgbGVuKQorc3RhdGljIGludCBzZWxmX2NoZWNrX3dyaXRlKHN0cnVjdCB1Ymlf
ZGV2aWNlICp1YmksIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IHBudW0sCisJCQkgICAgaW50IG9mZnNl
dCwgaW50IGxlbikKIHsKIAlpbnQgZXJyLCBpOwogCXNpemVfdCByZWFkOwogCXZvaWQgKmJ1ZjE7
CiAJbG9mZl90IGFkZHIgPSAobG9mZl90KXBudW0gKiB1YmktPnBlYl9zaXplICsgb2Zmc2V0Owog
Ci0JaWYgKCEodWJpX2Noa19mbGFncyAmIFVCSV9DSEtfSU8pKQorCWlmICghdWJpLT5kYmctPmNo
a19pbykKIAkJcmV0dXJuIDA7CiAKIAlidWYxID0gX192bWFsbG9jKGxlbiwgR0ZQX05PRlMsIFBB
R0VfS0VSTkVMKTsKQEAgLTEzNjksNyArMTM1OCw3IEBACiAJCWlmIChjID09IGMxKQogCQkJY29u
dGludWU7CiAKLQkJdWJpX2VycigicGFyYW5vaWQgY2hlY2sgZmFpbGVkIGZvciBQRUIgJWQ6JWQs
IGxlbiAlZCIsCisJCXViaV9lcnIoInNlbGYtY2hlY2sgZmFpbGVkIGZvciBQRUIgJWQ6JWQsIGxl
biAlZCIsCiAJCQlwbnVtLCBvZmZzZXQsIGxlbik7CiAJCXViaV9tc2coImRhdGEgZGlmZmVyIGF0
IHBvc2l0aW9uICVkIiwgaSk7CiAJCWR1bXBfbGVuID0gbWF4X3QoaW50LCAxMjgsIGxlbiAtIGkp
OwpAQCAtMTM4MSw3ICsxMzcwLDcgQEAKIAkJCWksIGkgKyBkdW1wX2xlbik7CiAJCXByaW50X2hl
eF9kdW1wKEtFUk5fREVCVUcsICIiLCBEVU1QX1BSRUZJWF9PRkZTRVQsIDMyLCAxLAogCQkJICAg
ICAgIGJ1ZjEgKyBpLCBkdW1wX2xlbiwgMSk7Ci0JCXViaV9kYmdfZHVtcF9zdGFjaygpOworCQlk
dW1wX3N0YWNrKCk7CiAJCWVyciA9IC1FSU5WQUw7CiAJCWdvdG8gb3V0X2ZyZWU7CiAJfQpAQCAt
MTM5NSw3ICsxMzg0LDcgQEAKIH0KIAogLyoqCi0gKiB1YmlfZGJnX2NoZWNrX2FsbF9mZiAtIGNo
ZWNrIHRoYXQgYSByZWdpb24gb2YgZmxhc2ggaXMgZW1wdHkuCisgKiB1Ymlfc2VsZl9jaGVja19h
bGxfZmYgLSBjaGVjayB0aGF0IGEgcmVnaW9uIG9mIGZsYXNoIGlzIGVtcHR5LgogICogQHViaTog
VUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKICAqIEBwbnVtOiB0aGUgcGh5c2ljYWwgZXJh
c2VibG9jayBudW1iZXIgdG8gY2hlY2sKICAqIEBvZmZzZXQ6IHRoZSBzdGFydGluZyBvZmZzZXQg
d2l0aGluIHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIHRvIGNoZWNrCkBAIC0xNDA1LDE0ICsxMzk0
LDE0IEBACiAgKiBAb2Zmc2V0IG9mIHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIEBwbnVtLCBhbmQg
YSBuZWdhdGl2ZSBlcnJvciBjb2RlIGlmIG5vdAogICogb3IgaWYgYW4gZXJyb3Igb2NjdXJyZWQu
CiAgKi8KLWludCB1YmlfZGJnX2NoZWNrX2FsbF9mZihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBp
bnQgcG51bSwgaW50IG9mZnNldCwgaW50IGxlbikKK2ludCB1Ymlfc2VsZl9jaGVja19hbGxfZmYo
c3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IHBudW0sIGludCBvZmZzZXQsIGludCBsZW4pCiB7
CiAJc2l6ZV90IHJlYWQ7CiAJaW50IGVycjsKIAl2b2lkICpidWY7CiAJbG9mZl90IGFkZHIgPSAo
bG9mZl90KXBudW0gKiB1YmktPnBlYl9zaXplICsgb2Zmc2V0OwogCi0JaWYgKCEodWJpX2Noa19m
bGFncyAmIFVCSV9DSEtfSU8pKQorCWlmICghdWJpLT5kYmctPmNoa19pbykKIAkJcmV0dXJuIDA7
CiAKIAlidWYgPSBfX3ZtYWxsb2MobGVuLCBHRlBfTk9GUywgUEFHRV9LRVJORUwpOwpAQCAtMTQz
OSwxNCArMTQyOCwxMiBAQAogCXJldHVybiAwOwogCiBmYWlsOgotCXViaV9lcnIoInBhcmFub2lk
IGNoZWNrIGZhaWxlZCBmb3IgUEVCICVkIiwgcG51bSk7CisJdWJpX2Vycigic2VsZi1jaGVjayBm
YWlsZWQgZm9yIFBFQiAlZCIsIHBudW0pOwogCXViaV9tc2coImhleCBkdW1wIG9mIHRoZSAlZC0l
ZCByZWdpb24iLCBvZmZzZXQsIG9mZnNldCArIGxlbik7CiAJcHJpbnRfaGV4X2R1bXAoS0VSTl9E
RUJVRywgIiIsIERVTVBfUFJFRklYX09GRlNFVCwgMzIsIDEsIGJ1ZiwgbGVuLCAxKTsKIAllcnIg
PSAtRUlOVkFMOwogZXJyb3I6Ci0JdWJpX2RiZ19kdW1wX3N0YWNrKCk7CisJZHVtcF9zdGFjaygp
OwogCXZmcmVlKGJ1Zik7CiAJcmV0dXJuIGVycjsKIH0KLQotI2VuZGlmIC8qIENPTkZJR19NVERf
VUJJX0RFQlVHICovCmRpZmYgLXVOIC11TnIgbGludXgtMy4wL2RyaXZlcnMvbXRkL3ViaS9rYXBp
LmMgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2RyaXZlcnMvbXRkL3ViaS9rYXBpLmMKLS0tIGxp
bnV4LTMuMC9kcml2ZXJzL210ZC91Ymkva2FwaS5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAw
MDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL2th
cGkuYwkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAwMDAwMCAtMDUwMApAQCAtMjIxLDcgKzIyMSw3
IEBACiAJa2ZyZWUoZGVzYyk7CiBvdXRfcHV0X3ViaToKIAl1YmlfcHV0X2RldmljZSh1YmkpOwot
CWRiZ19lcnIoImNhbm5vdCBvcGVuIGRldmljZSAlZCwgdm9sdW1lICVkLCBlcnJvciAlZCIsCisJ
dWJpX2VycigiY2Fubm90IG9wZW4gZGV2aWNlICVkLCB2b2x1bWUgJWQsIGVycm9yICVkIiwKIAkJ
dWJpX251bSwgdm9sX2lkLCBlcnIpOwogCXJldHVybiBFUlJfUFRSKGVycik7CiB9CkBAIC00MjYs
MTEgKzQyNiw5IEBACiAgKiBAYnVmOiBkYXRhIHRvIHdyaXRlCiAgKiBAb2Zmc2V0OiBvZmZzZXQg
d2l0aGluIHRoZSBsb2dpY2FsIGVyYXNlYmxvY2sgd2hlcmUgdG8gd3JpdGUKICAqIEBsZW46IGhv
dyBtYW55IGJ5dGVzIHRvIHdyaXRlCi0gKiBAZHR5cGU6IGV4cGVjdGVkIGRhdGEgdHlwZQogICoK
ICAqIFRoaXMgZnVuY3Rpb24gd3JpdGVzIEBsZW4gYnl0ZXMgb2YgZGF0YSBmcm9tIEBidWYgdG8g
b2Zmc2V0IEBvZmZzZXQgb2YKLSAqIGxvZ2ljYWwgZXJhc2VibG9jayBAbG51bS4gVGhlIEBkdHlw
ZSBhcmd1bWVudCBkZXNjcmliZXMgZXhwZWN0ZWQgbGlmZXRpbWUgb2YKLSAqIHRoZSBkYXRhLgor
ICogbG9naWNhbCBlcmFzZWJsb2NrIEBsbnVtLgogICoKICAqIFRoaXMgZnVuY3Rpb24gdGFrZXMg
Y2FyZSBvZiBwaHlzaWNhbCBlcmFzZWJsb2NrIHdyaXRlIGZhaWx1cmVzLiBJZiB3cml0ZSB0bwog
ICogdGhlIHBoeXNpY2FsIGVyYXNlYmxvY2sgd3JpdGUgb3BlcmF0aW9uIGZhaWxzLCB0aGUgbG9n
aWNhbCBlcmFzZWJsb2NrIGlzCkBAIC00NDcsNyArNDQ1LDcgQEAKICAqIHJldHVybnMgaW1tZWRp
YXRlbHkgd2l0aCAlLUVCQURGIGNvZGUuCiAgKi8KIGludCB1YmlfbGViX3dyaXRlKHN0cnVjdCB1
Ymlfdm9sdW1lX2Rlc2MgKmRlc2MsIGludCBsbnVtLCBjb25zdCB2b2lkICpidWYsCi0JCSAgaW50
IG9mZnNldCwgaW50IGxlbiwgaW50IGR0eXBlKQorCQkgIGludCBvZmZzZXQsIGludCBsZW4pCiB7
CiAJc3RydWN0IHViaV92b2x1bWUgKnZvbCA9IGRlc2MtPnZvbDsKIAlzdHJ1Y3QgdWJpX2Rldmlj
ZSAqdWJpID0gdm9sLT51Ymk7CkBAIC00NjYsMTcgKzQ2NCwxMyBAQAogCSAgICBvZmZzZXQgJiAo
dWJpLT5taW5faW9fc2l6ZSAtIDEpIHx8IGxlbiAmICh1YmktPm1pbl9pb19zaXplIC0gMSkpCiAJ
CXJldHVybiAtRUlOVkFMOwogCi0JaWYgKGR0eXBlICE9IFVCSV9MT05HVEVSTSAmJiBkdHlwZSAh
PSBVQklfU0hPUlRURVJNICYmCi0JICAgIGR0eXBlICE9IFVCSV9VTktOT1dOKQotCQlyZXR1cm4g
LUVJTlZBTDsKLQogCWlmICh2b2wtPnVwZF9tYXJrZXIpCiAJCXJldHVybiAtRUJBREY7CiAKIAlp
ZiAobGVuID09IDApCiAJCXJldHVybiAwOwogCi0JcmV0dXJuIHViaV9lYmFfd3JpdGVfbGViKHVi
aSwgdm9sLCBsbnVtLCBidWYsIG9mZnNldCwgbGVuLCBkdHlwZSk7CisJcmV0dXJuIHViaV9lYmFf
d3JpdGVfbGViKHViaSwgdm9sLCBsbnVtLCBidWYsIG9mZnNldCwgbGVuKTsKIH0KIEVYUE9SVF9T
WU1CT0xfR1BMKHViaV9sZWJfd3JpdGUpOwogCkBAIC00ODYsNyArNDgwLDYgQEAKICAqIEBsbnVt
OiBsb2dpY2FsIGVyYXNlYmxvY2sgbnVtYmVyIHRvIGNoYW5nZQogICogQGJ1ZjogZGF0YSB0byB3
cml0ZQogICogQGxlbjogaG93IG1hbnkgYnl0ZXMgdG8gd3JpdGUKLSAqIEBkdHlwZTogZXhwZWN0
ZWQgZGF0YSB0eXBlCiAgKgogICogVGhpcyBmdW5jdGlvbiBjaGFuZ2VzIHRoZSBjb250ZW50cyBv
ZiBhIGxvZ2ljYWwgZXJhc2VibG9jayBhdG9taWNhbGx5LiBAYnVmCiAgKiBoYXMgdG8gY29udGFp
biBuZXcgbG9naWNhbCBlcmFzZWJsb2NrIGRhdGEsIGFuZCBAbGVuIC0gdGhlIGxlbmd0aCBvZiB0
aGUKQEAgLTQ5Nyw3ICs0OTAsNyBAQAogICogY29kZSBpbiBjYXNlIG9mIGZhaWx1cmUuCiAgKi8K
IGludCB1YmlfbGViX2NoYW5nZShzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgbG51
bSwgY29uc3Qgdm9pZCAqYnVmLAotCQkgICBpbnQgbGVuLCBpbnQgZHR5cGUpCisJCSAgIGludCBs
ZW4pCiB7CiAJc3RydWN0IHViaV92b2x1bWUgKnZvbCA9IGRlc2MtPnZvbDsKIAlzdHJ1Y3QgdWJp
X2RldmljZSAqdWJpID0gdm9sLT51Ymk7CkBAIC01MTUsMTcgKzUwOCwxMyBAQAogCSAgICBsZW4g
PiB2b2wtPnVzYWJsZV9sZWJfc2l6ZSB8fCBsZW4gJiAodWJpLT5taW5faW9fc2l6ZSAtIDEpKQog
CQlyZXR1cm4gLUVJTlZBTDsKIAotCWlmIChkdHlwZSAhPSBVQklfTE9OR1RFUk0gJiYgZHR5cGUg
IT0gVUJJX1NIT1JUVEVSTSAmJgotCSAgICBkdHlwZSAhPSBVQklfVU5LTk9XTikKLQkJcmV0dXJu
IC1FSU5WQUw7Ci0KIAlpZiAodm9sLT51cGRfbWFya2VyKQogCQlyZXR1cm4gLUVCQURGOwogCiAJ
aWYgKGxlbiA9PSAwKQogCQlyZXR1cm4gMDsKIAotCXJldHVybiB1YmlfZWJhX2F0b21pY19sZWJf
Y2hhbmdlKHViaSwgdm9sLCBsbnVtLCBidWYsIGxlbiwgZHR5cGUpOworCXJldHVybiB1YmlfZWJh
X2F0b21pY19sZWJfY2hhbmdlKHViaSwgdm9sLCBsbnVtLCBidWYsIGxlbik7CiB9CiBFWFBPUlRf
U1lNQk9MX0dQTCh1YmlfbGViX2NoYW5nZSk7CiAKQEAgLTU2Miw3ICs1NTEsNyBAQAogCWlmIChl
cnIpCiAJCXJldHVybiBlcnI7CiAKLQlyZXR1cm4gdWJpX3dsX2ZsdXNoKHViaSk7CisJcmV0dXJu
IHViaV93bF9mbHVzaCh1YmksIHZvbC0+dm9sX2lkLCBsbnVtKTsKIH0KIEVYUE9SVF9TWU1CT0xf
R1BMKHViaV9sZWJfZXJhc2UpOwogCkBAIC02MjYsNyArNjE1LDYgQEAKICAqIHViaV9sZWJfbWFw
IC0gbWFwIGxvZ2ljYWwgZXJhc2VibG9jayB0byBhIHBoeXNpY2FsIGVyYXNlYmxvY2suCiAgKiBA
ZGVzYzogdm9sdW1lIGRlc2NyaXB0b3IKICAqIEBsbnVtOiBsb2dpY2FsIGVyYXNlYmxvY2sgbnVt
YmVyCi0gKiBAZHR5cGU6IGV4cGVjdGVkIGRhdGEgdHlwZQogICoKICAqIFRoaXMgZnVuY3Rpb24g
bWFwcyBhbiB1bi1tYXBwZWQgbG9naWNhbCBlcmFzZWJsb2NrIEBsbnVtIHRvIGEgcGh5c2ljYWwK
ICAqIGVyYXNlYmxvY2suIFRoaXMgbWVhbnMsIHRoYXQgYWZ0ZXIgYSBzdWNjZXNzZnVsIGludm9j
YXRpb24gb2YgdGhpcwpAQCAtNjM5LDcgKzYyNyw3IEBACiAgKiBlcmFzZWJsb2NrIGlzIGFscmVh
ZHkgbWFwcGVkLCBhbmQgb3RoZXIgbmVnYXRpdmUgZXJyb3IgY29kZXMgaW4gY2FzZSBvZgogICog
b3RoZXIgZmFpbHVyZXMuCiAgKi8KLWludCB1YmlfbGViX21hcChzdHJ1Y3QgdWJpX3ZvbHVtZV9k
ZXNjICpkZXNjLCBpbnQgbG51bSwgaW50IGR0eXBlKQoraW50IHViaV9sZWJfbWFwKHN0cnVjdCB1
Ymlfdm9sdW1lX2Rlc2MgKmRlc2MsIGludCBsbnVtKQogewogCXN0cnVjdCB1Ymlfdm9sdW1lICp2
b2wgPSBkZXNjLT52b2w7CiAJc3RydWN0IHViaV9kZXZpY2UgKnViaSA9IHZvbC0+dWJpOwpAQCAt
NjUyLDE3ICs2NDAsMTMgQEAKIAlpZiAobG51bSA8IDAgfHwgbG51bSA+PSB2b2wtPnJlc2VydmVk
X3BlYnMpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JaWYgKGR0eXBlICE9IFVCSV9MT05HVEVSTSAm
JiBkdHlwZSAhPSBVQklfU0hPUlRURVJNICYmCi0JICAgIGR0eXBlICE9IFVCSV9VTktOT1dOKQot
CQlyZXR1cm4gLUVJTlZBTDsKLQogCWlmICh2b2wtPnVwZF9tYXJrZXIpCiAJCXJldHVybiAtRUJB
REY7CiAKIAlpZiAodm9sLT5lYmFfdGJsW2xudW1dID49IDApCiAJCXJldHVybiAtRUJBRE1TRzsK
IAotCXJldHVybiB1YmlfZWJhX3dyaXRlX2xlYih1YmksIHZvbCwgbG51bSwgTlVMTCwgMCwgMCwg
ZHR5cGUpOworCXJldHVybiB1YmlfZWJhX3dyaXRlX2xlYih1YmksIHZvbCwgbG51bSwgTlVMTCwg
MCwgMCk7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTCh1YmlfbGViX21hcCk7CiAKQEAgLTcyMiw2ICs3
MDYsMzMgQEAKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKHViaV9zeW5jKTsKIAorLyoqCisgKiB1Ymlf
Zmx1c2ggLSBmbHVzaCBVQkkgd29yayBxdWV1ZS4KKyAqIEB1YmlfbnVtOiBVQkkgZGV2aWNlIHRv
IGZsdXNoIHdvcmsgcXVldWUKKyAqIEB2b2xfaWQ6IHZvbHVtZSBpZCB0byBmbHVzaCBmb3IKKyAq
IEBsbnVtOiBsb2dpY2FsIGVyYXNlYmxvY2sgbnVtYmVyIHRvIGZsdXNoIGZvcgorICoKKyAqIFRo
aXMgZnVuY3Rpb24gZXhlY3V0ZXMgYWxsIHBlbmRpbmcgd29ya3MgZm9yIGEgcGFydGljdWxhciB2
b2x1bWUgaWQgLyBsb2dpY2FsCisgKiBlcmFzZWJsb2NrIG51bWJlciBwYWlyLiBJZiBlaXRoZXIg
dmFsdWUgaXMgc2V0IHRvICVVQklfQUxMLCB0aGVuIGl0IGFjdHMgYXMKKyAqIGEgd2lsZGNhcmQg
Zm9yIGFsbCBvZiB0aGUgY29ycmVzcG9uZGluZyB2b2x1bWUgbnVtYmVycyBvciBsb2dpY2FsCisg
KiBlcmFzZWJsb2NrIG51bWJlcnMuIEl0IHJldHVybnMgemVybyBpbiBjYXNlIG9mIHN1Y2Nlc3Mg
YW5kIGEgbmVnYXRpdmUgZXJyb3IKKyAqIGNvZGUgaW4gY2FzZSBvZiBmYWlsdXJlLgorICovCitp
bnQgdWJpX2ZsdXNoKGludCB1YmlfbnVtLCBpbnQgdm9sX2lkLCBpbnQgbG51bSkKK3sKKwlzdHJ1
Y3QgdWJpX2RldmljZSAqdWJpOworCWludCBlcnIgPSAwOworCisJdWJpID0gdWJpX2dldF9kZXZp
Y2UodWJpX251bSk7CisJaWYgKCF1YmkpCisJCXJldHVybiAtRU5PREVWOworCisJZXJyID0gdWJp
X3dsX2ZsdXNoKHViaSwgdm9sX2lkLCBsbnVtKTsKKwl1YmlfcHV0X2RldmljZSh1YmkpOworCXJl
dHVybiBlcnI7Cit9CitFWFBPUlRfU1lNQk9MX0dQTCh1YmlfZmx1c2gpOworCiBCTE9DS0lOR19O
T1RJRklFUl9IRUFEKHViaV9ub3RpZmllcnMpOwogCiAvKioKZGlmZiAtdU4gLXVOciBsaW51eC0z
LjAvZHJpdmVycy9tdGQvdWJpL3NjYW4uYyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVy
cy9tdGQvdWJpL3NjYW4uYwotLS0gbGludXgtMy4wL2RyaXZlcnMvbXRkL3ViaS9zY2FuLmMJMjAx
MS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZzLmxh
dGVzdC9kcml2ZXJzL210ZC91Ymkvc2Nhbi5jCTE5NjktMTItMzEgMTg6MDA6MDAuMDAwMDAwMDAw
IC0wNjAwCkBAIC0xLDE2MDUgKzAsMCBAQAotLyoKLSAqIENvcHlyaWdodCAoYykgSW50ZXJuYXRp
b25hbCBCdXNpbmVzcyBNYWNoaW5lcyBDb3JwLiwgMjAwNgotICoKLSAqIFRoaXMgcHJvZ3JhbSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Ci0g
KiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
IHB1Ymxpc2hlZCBieQotICogdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZl
cnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKLSAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVy
IHZlcnNpb24uCi0gKgotICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3Bl
IHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCi0gKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdp
dGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotICogTUVSQ0hBTlRBQklMSVRZIG9y
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiBTZWUKLSAqIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgotICoKLSAqIFlvdSBzaG91bGQgaGF2
ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCi0gKiBh
bG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2Fy
ZQotICogRm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAzMzAsIEJvc3Rv
biwgTUEgMDIxMTEtMTMwNyBVU0EKLSAqCi0gKiBBdXRob3I6IEFydGVtIEJpdHl1dHNraXkgKNCR
0LjRgtGO0YbQutC40Lkg0JDRgNGC0ZHQvCkKLSAqLwotCi0vKgotICogVUJJIHNjYW5uaW5nIHN1
Yi1zeXN0ZW0uCi0gKgotICogVGhpcyBzdWItc3lzdGVtIGlzIHJlc3BvbnNpYmxlIGZvciBzY2Fu
bmluZyB0aGUgZmxhc2ggbWVkaWEsIGNoZWNraW5nIFVCSQotICogaGVhZGVycyBhbmQgcHJvdmlk
aW5nIGNvbXBsZXRlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBVQkkgZmxhc2ggaW1hZ2UuCi0gKgot
ICogVGhlIHNjYW5uaW5nIGluZm9ybWF0aW9uIGlzIHJlcHJlc2VudGVkIGJ5IGEgJnN0cnVjdCB1
Ymlfc2Nhbl9pbmZvJyBvYmplY3QuCi0gKiBJbmZvcm1hdGlvbiBhYm91dCBmb3VuZCB2b2x1bWVz
IGlzIHJlcHJlc2VudGVkIGJ5ICZzdHJ1Y3QgdWJpX3NjYW5fdm9sdW1lCi0gKiBvYmplY3RzIHdo
aWNoIGFyZSBrZXB0IGluIHZvbHVtZSBSQi10cmVlIHdpdGggcm9vdCBhdCB0aGUgQHZvbHVtZXMg
ZmllbGQuCi0gKiBUaGUgUkItdHJlZSBpcyBpbmRleGVkIGJ5IHRoZSB2b2x1bWUgSUQuCi0gKgot
ICogU2Nhbm5lZCBsb2dpY2FsIGVyYXNlYmxvY2tzIGFyZSByZXByZXNlbnRlZCBieSAmc3RydWN0
IHViaV9zY2FuX2xlYiBvYmplY3RzLgotICogVGhlc2Ugb2JqZWN0cyBhcmUga2VwdCBpbiBwZXIt
dm9sdW1lIFJCLXRyZWVzIHdpdGggdGhlIHJvb3QgYXQgdGhlCi0gKiBjb3JyZXNwb25kaW5nICZz
dHJ1Y3QgdWJpX3NjYW5fdm9sdW1lIG9iamVjdC4gVG8gcHV0IGl0IGRpZmZlcmVudGx5LCB3ZSBr
ZWVwCi0gKiBhbiBSQi10cmVlIG9mIHBlci12b2x1bWUgb2JqZWN0cyBhbmQgZWFjaCBvZiB0aGVz
ZSBvYmplY3RzIGlzIHRoZSByb290IG9mCi0gKiBSQi10cmVlIG9mIHBlci1lcmFzZWJsb2NrIG9i
amVjdHMuCi0gKgotICogQ29ycnVwdGVkIHBoeXNpY2FsIGVyYXNlYmxvY2tzIGFyZSBwdXQgdG8g
dGhlIEBjb3JyIGxpc3QsIGZyZWUgcGh5c2ljYWwKLSAqIGVyYXNlYmxvY2tzIGFyZSBwdXQgdG8g
dGhlIEBmcmVlIGxpc3QgYW5kIHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIHRvIGJlCi0gKiBlcmFz
ZWQgYXJlIHB1dCB0byB0aGUgQGVyYXNlIGxpc3QuCi0gKgotICogQWJvdXQgY29ycnVwdGlvbnMK
LSAqIH5+fn5+fn5+fn5+fn5+fn5+Ci0gKgotICogVUJJIHByb3RlY3RzIEVDIGFuZCBWSUQgaGVh
ZGVycyB3aXRoIENSQy0zMiBjaGVja3N1bXMsIHNvIGl0IGNhbiBkZXRlY3QKLSAqIHdoZXRoZXIg
dGhlIGhlYWRlcnMgYXJlIGNvcnJ1cHRlZCBvciBub3QuIFNvbWV0aW1lcyBVQkkgYWxzbyBwcm90
ZWN0cyB0aGUKLSAqIGRhdGEgd2l0aCBDUkMtMzIsIGUuZy4sIHdoZW4gaXQgZXhlY3V0ZXMgdGhl
IGF0b21pYyBMRUIgY2hhbmdlIG9wZXJhdGlvbiwgb3IKLSAqIHdoZW4gaXQgbW92ZXMgdGhlIGNv
bnRlbnRzIG9mIGEgUEVCIGZvciB3ZWFyLWxldmVsaW5nIHB1cnBvc2VzLgotICoKLSAqIFVCSSB0
cmllcyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIDIgdHlwZXMgb2YgY29ycnVwdGlvbnMuCi0gKgot
ICogMS4gQ29ycnVwdGlvbnMgY2F1c2VkIGJ5IHBvd2VyIGN1dHMuIFRoZXNlIGFyZSBleHBlY3Rl
ZCBjb3JydXB0aW9ucyBhbmQgVUJJCi0gKiB0cmllcyB0byBoYW5kbGUgdGhlbSBncmFjZWZ1bGx5
LCB3aXRob3V0IHByaW50aW5nIHRvbyBtYW55IHdhcm5pbmdzIGFuZAotICogZXJyb3IgbWVzc2Fn
ZXMuIFRoZSBpZGVhIGlzIHRoYXQgd2UgZG8gbm90IGxvc2UgaW1wb3J0YW50IGRhdGEgaW4gdGhl
c2UgY2FzZQotICogLSB3ZSBtYXkgbG9zZSBvbmx5IHRoZSBkYXRhIHdoaWNoIHdhcyBiZWluZyB3
cml0dGVuIHRvIHRoZSBtZWRpYSBqdXN0IGJlZm9yZQotICogdGhlIHBvd2VyIGN1dCBoYXBwZW5l
ZCwgYW5kIHRoZSB1cHBlciBsYXllcnMgKGUuZy4sIFVCSUZTKSBhcmUgc3VwcG9zZWQgdG8KLSAq
IGhhbmRsZSBzdWNoIGRhdGEgbG9zc2VzIChlLmcuLCBieSB1c2luZyB0aGUgRlMgam91cm5hbCku
Ci0gKgotICogV2hlbiBVQkkgZGV0ZWN0cyBhIGNvcnJ1cHRpb24gKENSQy0zMiBtaXNtYXRjaCkg
aW4gYSBQRUIsIGFuZCBpdCBsb29rcyBsaWtlCi0gKiB0aGUgcmVhc29uIGlzIGEgcG93ZXIgY3V0
LCBVQkkgcHV0cyB0aGlzIFBFQiB0byB0aGUgQGVyYXNlIGxpc3QsIGFuZCBhbGwKLSAqIFBFQnMg
aW4gdGhlIEBlcmFzZSBsaXN0IGFyZSBzY2hlZHVsZWQgZm9yIGVyYXN1cmUgbGF0ZXIuCi0gKgot
ICogMi4gVW5leHBlY3RlZCBjb3JydXB0aW9ucyB3aGljaCBhcmUgbm90IGNhdXNlZCBieSBwb3dl
ciBjdXRzLiBEdXJpbmcKLSAqIHNjYW5uaW5nLCBzdWNoIFBFQnMgYXJlIHB1dCB0byB0aGUgQGNv
cnIgbGlzdCBhbmQgVUJJIHByZXNlcnZlcyB0aGVtLgotICogT2J2aW91c2x5LCB0aGlzIGxlc3Nl
bnMgdGhlIGFtb3VudCBvZiBhdmFpbGFibGUgUEVCcywgYW5kIGlmIGF0IHNvbWUgIHBvaW50Ci0g
KiBVQkkgcnVucyBvdXQgb2YgZnJlZSBQRUJzLCBpdCBzd2l0Y2hlcyB0byBSL08gbW9kZS4gVUJJ
IGFsc28gbG91ZGx5IGluZm9ybXMKLSAqIGFib3V0IHN1Y2ggUEVCcyBldmVyeSB0aW1lIHRoZSBN
VEQgZGV2aWNlIGlzIGF0dGFjaGVkLgotICoKLSAqIEhvd2V2ZXIsIGl0IGlzIGRpZmZpY3VsdCB0
byByZWxpYWJseSBkaXN0aW5ndWlzaCBiZXR3ZWVuIHRoZXNlIHR5cGVzIG9mCi0gKiBjb3JydXB0
aW9ucyBhbmQgVUJJJ3Mgc3RyYXRlZ3kgaXMgYXMgZm9sbG93cy4gVUJJIGFzc3VtZXMgY29ycnVw
dGlvbiB0eXBlIDIKLSAqIGlmIHRoZSBWSUQgaGVhZGVyIGlzIGNvcnJ1cHRlZCBhbmQgdGhlIGRh
dGEgYXJlYSBkb2VzIG5vdCBjb250YWluIGFsbCAweEZGcywKLSAqIGFuZCB0aGVyZSB3ZXJlIG5v
IGJpdC1mbGlwcyBvciBpbnRlZ3JpdHkgZXJyb3JzIHdoaWxlIHJlYWRpbmcgdGhlIGRhdGEgYXJl
YS4KLSAqIE90aGVyd2lzZSBVQkkgYXNzdW1lcyBjb3JydXB0aW9uIHR5cGUgMS4gU28gdGhlIGRl
Y2lzaW9uIGNyaXRlcmlhIGFyZSBhcwotICogZm9sbG93cy4KLSAqICAgbyBJZiB0aGUgZGF0YSBh
cmVhIGNvbnRhaW5zIG9ubHkgMHhGRnMsIHRoZXJlIGlzIG5vIGRhdGEsIGFuZCBpdCBpcyBzYWZl
Ci0gKiAgICAgdG8ganVzdCBlcmFzZSB0aGlzIFBFQiAtIHRoaXMgaXMgY29ycnVwdGlvbiB0eXBl
IDEuCi0gKiAgIG8gSWYgdGhlIGRhdGEgYXJlYSBoYXMgYml0LWZsaXBzIG9yIGRhdGEgaW50ZWdy
aXR5IGVycm9ycyAoRUNDIGVycm9ycyBvbgotICogICAgIE5BTkQpLCBpdCBpcyBwcm9iYWJseSBh
IFBFQiB3aGljaCB3YXMgYmVpbmcgZXJhc2VkIHdoZW4gcG93ZXIgY3V0Ci0gKiAgICAgaGFwcGVu
ZWQsIHNvIHRoaXMgaXMgY29ycnVwdGlvbiB0eXBlIDEuIEhvd2V2ZXIsIHRoaXMgaXMganVzdCBh
IGd1ZXNzLAotICogICAgIHdoaWNoIG1pZ2h0IGJlIHdyb25nLgotICogICBvIE90aGVyd2lzZSB0
aGlzIGl0IGNvcnJ1cHRpb24gdHlwZSAyLgotICovCi0KLSNpbmNsdWRlIDxsaW51eC9lcnIuaD4K
LSNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Ci0jaW5jbHVkZSA8bGludXgvY3JjMzIuaD4KLSNpbmNs
dWRlIDxsaW51eC9tYXRoNjQuaD4KLSNpbmNsdWRlIDxsaW51eC9yYW5kb20uaD4KLSNpbmNsdWRl
ICJ1YmkuaCIKLQotI2lmZGVmIENPTkZJR19NVERfVUJJX0RFQlVHCi1zdGF0aWMgaW50IHBhcmFu
b2lkX2NoZWNrX3NpKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1Ymlfc2Nhbl9pbmZv
ICpzaSk7Ci0jZWxzZQotI2RlZmluZSBwYXJhbm9pZF9jaGVja19zaSh1YmksIHNpKSAwCi0jZW5k
aWYKLQotLyogVGVtcG9yYXJ5IHZhcmlhYmxlcyB1c2VkIGR1cmluZyBzY2FubmluZyAqLwotc3Rh
dGljIHN0cnVjdCB1YmlfZWNfaGRyICplY2g7Ci1zdGF0aWMgc3RydWN0IHViaV92aWRfaGRyICp2
aWRoOwotCi0vKioKLSAqIGFkZF90b19saXN0IC0gYWRkIHBoeXNpY2FsIGVyYXNlYmxvY2sgdG8g
YSBsaXN0LgotICogQHNpOiBzY2FubmluZyBpbmZvcm1hdGlvbgotICogQHBudW06IHBoeXNpY2Fs
IGVyYXNlYmxvY2sgbnVtYmVyIHRvIGFkZAotICogQGVjOiBlcmFzZSBjb3VudGVyIG9mIHRoZSBw
aHlzaWNhbCBlcmFzZWJsb2NrCi0gKiBAdG9faGVhZDogaWYgbm90IHplcm8sIGFkZCB0byB0aGUg
aGVhZCBvZiB0aGUgbGlzdAotICogQGxpc3Q6IHRoZSBsaXN0IHRvIGFkZCB0bwotICoKLSAqIFRo
aXMgZnVuY3Rpb24gYWRkcyBwaHlzaWNhbCBlcmFzZWJsb2NrIEBwbnVtIHRvIGZyZWUsIGVyYXNl
LCBvciBhbGllbiBsaXN0cy4KLSAqIElmIEB0b19oZWFkIGlzIG5vdCB6ZXJvLCBQRUIgd2lsbCBi
ZSBhZGRlZCB0byB0aGUgaGVhZCBvZiB0aGUgbGlzdCwgd2hpY2gKLSAqIGJhc2ljYWxseSBtZWFu
cyBpdCB3aWxsIGJlIHByb2Nlc3NlZCBmaXJzdCBsYXRlci4gRS5nLiwgd2UgYWRkIGNvcnJ1cHRl
ZAotICogUEVCcyAoY29ycnVwdGVkIGR1ZSB0byBwb3dlciBjdXRzKSB0byB0aGUgaGVhZCBvZiB0
aGUgZXJhc2UgbGlzdCB0byBtYWtlCi0gKiBzdXJlIHdlIGVyYXNlIHRoZW0gZmlyc3QgYW5kIGdl
dCByaWQgb2YgY29ycnVwdGlvbnMgQVNBUC4gVGhpcyBmdW5jdGlvbgotICogcmV0dXJucyB6ZXJv
IGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGluIGNhc2Ugb2YK
LSAqIGZhaWx1cmUuCi0gKi8KLXN0YXRpYyBpbnQgYWRkX3RvX2xpc3Qoc3RydWN0IHViaV9zY2Fu
X2luZm8gKnNpLCBpbnQgcG51bSwgaW50IGVjLCBpbnQgdG9faGVhZCwKLQkJICAgICAgIHN0cnVj
dCBsaXN0X2hlYWQgKmxpc3QpCi17Ci0Jc3RydWN0IHViaV9zY2FuX2xlYiAqc2ViOwotCi0JaWYg
KGxpc3QgPT0gJnNpLT5mcmVlKSB7Ci0JCWRiZ19ibGQoImFkZCB0byBmcmVlOiBQRUIgJWQsIEVD
ICVkIiwgcG51bSwgZWMpOwotCX0gZWxzZSBpZiAobGlzdCA9PSAmc2ktPmVyYXNlKSB7Ci0JCWRi
Z19ibGQoImFkZCB0byBlcmFzZTogUEVCICVkLCBFQyAlZCIsIHBudW0sIGVjKTsKLQl9IGVsc2Ug
aWYgKGxpc3QgPT0gJnNpLT5hbGllbikgewotCQlkYmdfYmxkKCJhZGQgdG8gYWxpZW46IFBFQiAl
ZCwgRUMgJWQiLCBwbnVtLCBlYyk7Ci0JCXNpLT5hbGllbl9wZWJfY291bnQgKz0gMTsKLQl9IGVs
c2UKLQkJQlVHKCk7Ci0KLQlzZWIgPSBrbWVtX2NhY2hlX2FsbG9jKHNpLT5zY2FuX2xlYl9zbGFi
LCBHRlBfS0VSTkVMKTsKLQlpZiAoIXNlYikKLQkJcmV0dXJuIC1FTk9NRU07Ci0KLQlzZWItPnBu
dW0gPSBwbnVtOwotCXNlYi0+ZWMgPSBlYzsKLQlpZiAodG9faGVhZCkKLQkJbGlzdF9hZGQoJnNl
Yi0+dS5saXN0LCBsaXN0KTsKLQllbHNlCi0JCWxpc3RfYWRkX3RhaWwoJnNlYi0+dS5saXN0LCBs
aXN0KTsKLQlyZXR1cm4gMDsKLX0KLQotLyoqCi0gKiBhZGRfY29ycnVwdGVkIC0gYWRkIGEgY29y
cnVwdGVkIHBoeXNpY2FsIGVyYXNlYmxvY2suCi0gKiBAc2k6IHNjYW5uaW5nIGluZm9ybWF0aW9u
Ci0gKiBAcG51bTogcGh5c2ljYWwgZXJhc2VibG9jayBudW1iZXIgdG8gYWRkCi0gKiBAZWM6IGVy
YXNlIGNvdW50ZXIgb2YgdGhlIHBoeXNpY2FsIGVyYXNlYmxvY2sKLSAqCi0gKiBUaGlzIGZ1bmN0
aW9uIGFkZHMgY29ycnVwdGVkIHBoeXNpY2FsIGVyYXNlYmxvY2sgQHBudW0gdG8gdGhlICdjb3Jy
JyBsaXN0LgotICogVGhlIGNvcnJ1cHRpb24gd2FzIHByZXN1bWFibHkgbm90IGNhdXNlZCBieSBh
IHBvd2VyIGN1dC4gUmV0dXJucyB6ZXJvIGluCi0gKiBjYXNlIG9mIHN1Y2Nlc3MgYW5kIGEgbmVn
YXRpdmUgZXJyb3IgY29kZSBpbiBjYXNlIG9mIGZhaWx1cmUuCi0gKi8KLXN0YXRpYyBpbnQgYWRk
X2NvcnJ1cHRlZChzdHJ1Y3QgdWJpX3NjYW5faW5mbyAqc2ksIGludCBwbnVtLCBpbnQgZWMpCi17
Ci0Jc3RydWN0IHViaV9zY2FuX2xlYiAqc2ViOwotCi0JZGJnX2JsZCgiYWRkIHRvIGNvcnJ1cHRl
ZDogUEVCICVkLCBFQyAlZCIsIHBudW0sIGVjKTsKLQotCXNlYiA9IGttZW1fY2FjaGVfYWxsb2Mo
c2ktPnNjYW5fbGViX3NsYWIsIEdGUF9LRVJORUwpOwotCWlmICghc2ViKQotCQlyZXR1cm4gLUVO
T01FTTsKLQotCXNpLT5jb3JyX3BlYl9jb3VudCArPSAxOwotCXNlYi0+cG51bSA9IHBudW07Ci0J
c2ViLT5lYyA9IGVjOwotCWxpc3RfYWRkKCZzZWItPnUubGlzdCwgJnNpLT5jb3JyKTsKLQlyZXR1
cm4gMDsKLX0KLQotLyoqCi0gKiB2YWxpZGF0ZV92aWRfaGRyIC0gY2hlY2sgdm9sdW1lIGlkZW50
aWZpZXIgaGVhZGVyLgotICogQHZpZF9oZHI6IHRoZSB2b2x1bWUgaWRlbnRpZmllciBoZWFkZXIg
dG8gY2hlY2sKLSAqIEBzdjogaW5mb3JtYXRpb24gYWJvdXQgdGhlIHZvbHVtZSB0aGlzIGxvZ2lj
YWwgZXJhc2VibG9jayBiZWxvbmdzIHRvCi0gKiBAcG51bTogcGh5c2ljYWwgZXJhc2VibG9jayBu
dW1iZXIgdGhlIFZJRCBoZWFkZXIgY2FtZSBmcm9tCi0gKgotICogVGhpcyBmdW5jdGlvbiBjaGVj
a3MgdGhhdCBkYXRhIHN0b3JlZCBpbiBAdmlkX2hkciBpcyBjb25zaXN0ZW50LiBSZXR1cm5zCi0g
KiBub24temVybyBpZiBhbiBpbmNvbnNpc3RlbmN5IHdhcyBmb3VuZCBhbmQgemVybyBpZiBub3Qu
Ci0gKgotICogTm90ZSwgVUJJIGRvZXMgc2FuaXR5IGNoZWNrIG9mIGV2ZXJ5dGhpbmcgaXQgcmVh
ZHMgZnJvbSB0aGUgZmxhc2ggbWVkaWEuCi0gKiBNb3N0IG9mIHRoZSBjaGVja3MgYXJlIGRvbmUg
aW4gdGhlIEkvTyBzdWItc3lzdGVtLiBIZXJlIHdlIGNoZWNrIHRoYXQgdGhlCi0gKiBpbmZvcm1h
dGlvbiBpbiB0aGUgVklEIGhlYWRlciBpcyBjb25zaXN0ZW50IHRvIHRoZSBpbmZvcm1hdGlvbiBp
biBvdGhlciBWSUQKLSAqIGhlYWRlcnMgb2YgdGhlIHNhbWUgdm9sdW1lLgotICovCi1zdGF0aWMg
aW50IHZhbGlkYXRlX3ZpZF9oZHIoY29uc3Qgc3RydWN0IHViaV92aWRfaGRyICp2aWRfaGRyLAot
CQkJICAgIGNvbnN0IHN0cnVjdCB1Ymlfc2Nhbl92b2x1bWUgKnN2LCBpbnQgcG51bSkKLXsKLQlp
bnQgdm9sX3R5cGUgPSB2aWRfaGRyLT52b2xfdHlwZTsKLQlpbnQgdm9sX2lkID0gYmUzMl90b19j
cHUodmlkX2hkci0+dm9sX2lkKTsKLQlpbnQgdXNlZF9lYnMgPSBiZTMyX3RvX2NwdSh2aWRfaGRy
LT51c2VkX2Vicyk7Ci0JaW50IGRhdGFfcGFkID0gYmUzMl90b19jcHUodmlkX2hkci0+ZGF0YV9w
YWQpOwotCi0JaWYgKHN2LT5sZWJfY291bnQgIT0gMCkgewotCQlpbnQgc3Zfdm9sX3R5cGU7Ci0K
LQkJLyoKLQkJICogVGhpcyBpcyBub3QgdGhlIGZpcnN0IGxvZ2ljYWwgZXJhc2VibG9jayBiZWxv
bmdpbmcgdG8gdGhpcwotCQkgKiB2b2x1bWUuIEVuc3VyZSB0aGF0IHRoZSBkYXRhIGluIGl0cyBW
SUQgaGVhZGVyIGlzIGNvbnNpc3RlbnQKLQkJICogdG8gdGhlIGRhdGEgaW4gcHJldmlvdXMgbG9n
aWNhbCBlcmFzZWJsb2NrIGhlYWRlcnMuCi0JCSAqLwotCi0JCWlmICh2b2xfaWQgIT0gc3YtPnZv
bF9pZCkgewotCQkJZGJnX2VycigiaW5jb25zaXN0ZW50IHZvbF9pZCIpOwotCQkJZ290byBiYWQ7
Ci0JCX0KLQotCQlpZiAoc3YtPnZvbF90eXBlID09IFVCSV9TVEFUSUNfVk9MVU1FKQotCQkJc3Zf
dm9sX3R5cGUgPSBVQklfVklEX1NUQVRJQzsKLQkJZWxzZQotCQkJc3Zfdm9sX3R5cGUgPSBVQklf
VklEX0RZTkFNSUM7Ci0KLQkJaWYgKHZvbF90eXBlICE9IHN2X3ZvbF90eXBlKSB7Ci0JCQlkYmdf
ZXJyKCJpbmNvbnNpc3RlbnQgdm9sX3R5cGUiKTsKLQkJCWdvdG8gYmFkOwotCQl9Ci0KLQkJaWYg
KHVzZWRfZWJzICE9IHN2LT51c2VkX2VicykgewotCQkJZGJnX2VycigiaW5jb25zaXN0ZW50IHVz
ZWRfZWJzIik7Ci0JCQlnb3RvIGJhZDsKLQkJfQotCi0JCWlmIChkYXRhX3BhZCAhPSBzdi0+ZGF0
YV9wYWQpIHsKLQkJCWRiZ19lcnIoImluY29uc2lzdGVudCBkYXRhX3BhZCIpOwotCQkJZ290byBi
YWQ7Ci0JCX0KLQl9Ci0KLQlyZXR1cm4gMDsKLQotYmFkOgotCXViaV9lcnIoImluY29uc2lzdGVu
dCBWSUQgaGVhZGVyIGF0IFBFQiAlZCIsIHBudW0pOwotCXViaV9kYmdfZHVtcF92aWRfaGRyKHZp
ZF9oZHIpOwotCXViaV9kYmdfZHVtcF9zdihzdik7Ci0JcmV0dXJuIC1FSU5WQUw7Ci19Ci0KLS8q
KgotICogYWRkX3ZvbHVtZSAtIGFkZCB2b2x1bWUgdG8gdGhlIHNjYW5uaW5nIGluZm9ybWF0aW9u
LgotICogQHNpOiBzY2FubmluZyBpbmZvcm1hdGlvbgotICogQHZvbF9pZDogSUQgb2YgdGhlIHZv
bHVtZSB0byBhZGQKLSAqIEBwbnVtOiBwaHlzaWNhbCBlcmFzZWJsb2NrIG51bWJlcgotICogQHZp
ZF9oZHI6IHZvbHVtZSBpZGVudGlmaWVyIGhlYWRlcgotICoKLSAqIElmIHRoZSB2b2x1bWUgY29y
cmVzcG9uZGluZyB0byB0aGUgQHZpZF9oZHIgbG9naWNhbCBlcmFzZWJsb2NrIGlzIGFscmVhZHkK
LSAqIHByZXNlbnQgaW4gdGhlIHNjYW5uaW5nIGluZm9ybWF0aW9uLCB0aGlzIGZ1bmN0aW9uIGRv
ZXMgbm90aGluZy4gT3RoZXJ3aXNlCi0gKiBpdCBhZGRzIGNvcnJlc3BvbmRpbmcgdm9sdW1lIHRv
IHRoZSBzY2FubmluZyBpbmZvcm1hdGlvbi4gUmV0dXJucyBhIHBvaW50ZXIKLSAqIHRvIHRoZSBz
Y2FubmluZyB2b2x1bWUgb2JqZWN0IGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBl
cnJvciBjb2RlCi0gKiBpbiBjYXNlIG9mIGZhaWx1cmUuCi0gKi8KLXN0YXRpYyBzdHJ1Y3QgdWJp
X3NjYW5fdm9sdW1lICphZGRfdm9sdW1lKHN0cnVjdCB1Ymlfc2Nhbl9pbmZvICpzaSwgaW50IHZv
bF9pZCwKLQkJCQkJICBpbnQgcG51bSwKLQkJCQkJICBjb25zdCBzdHJ1Y3QgdWJpX3ZpZF9oZHIg
KnZpZF9oZHIpCi17Ci0Jc3RydWN0IHViaV9zY2FuX3ZvbHVtZSAqc3Y7Ci0Jc3RydWN0IHJiX25v
ZGUgKipwID0gJnNpLT52b2x1bWVzLnJiX25vZGUsICpwYXJlbnQgPSBOVUxMOwotCi0JdWJpX2Fz
c2VydCh2b2xfaWQgPT0gYmUzMl90b19jcHUodmlkX2hkci0+dm9sX2lkKSk7Ci0KLQkvKiBXYWxr
IHRoZSB2b2x1bWUgUkItdHJlZSB0byBsb29rIGlmIHRoaXMgdm9sdW1lIGlzIGFscmVhZHkgcHJl
c2VudCAqLwotCXdoaWxlICgqcCkgewotCQlwYXJlbnQgPSAqcDsKLQkJc3YgPSByYl9lbnRyeShw
YXJlbnQsIHN0cnVjdCB1Ymlfc2Nhbl92b2x1bWUsIHJiKTsKLQotCQlpZiAodm9sX2lkID09IHN2
LT52b2xfaWQpCi0JCQlyZXR1cm4gc3Y7Ci0KLQkJaWYgKHZvbF9pZCA+IHN2LT52b2xfaWQpCi0J
CQlwID0gJigqcCktPnJiX2xlZnQ7Ci0JCWVsc2UKLQkJCXAgPSAmKCpwKS0+cmJfcmlnaHQ7Ci0J
fQotCi0JLyogVGhlIHZvbHVtZSBpcyBhYnNlbnQgLSBhZGQgaXQgKi8KLQlzdiA9IGttYWxsb2Mo
c2l6ZW9mKHN0cnVjdCB1Ymlfc2Nhbl92b2x1bWUpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXN2KQot
CQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKLQotCXN2LT5oaWdoZXN0X2xudW0gPSBzdi0+bGVi
X2NvdW50ID0gMDsKLQlzdi0+dm9sX2lkID0gdm9sX2lkOwotCXN2LT5yb290ID0gUkJfUk9PVDsK
LQlzdi0+dXNlZF9lYnMgPSBiZTMyX3RvX2NwdSh2aWRfaGRyLT51c2VkX2Vicyk7Ci0Jc3YtPmRh
dGFfcGFkID0gYmUzMl90b19jcHUodmlkX2hkci0+ZGF0YV9wYWQpOwotCXN2LT5jb21wYXQgPSB2
aWRfaGRyLT5jb21wYXQ7Ci0Jc3YtPnZvbF90eXBlID0gdmlkX2hkci0+dm9sX3R5cGUgPT0gVUJJ
X1ZJRF9EWU5BTUlDID8gVUJJX0RZTkFNSUNfVk9MVU1FCi0JCQkJCQkJICAgIDogVUJJX1NUQVRJ
Q19WT0xVTUU7Ci0JaWYgKHZvbF9pZCA+IHNpLT5oaWdoZXN0X3ZvbF9pZCkKLQkJc2ktPmhpZ2hl
c3Rfdm9sX2lkID0gdm9sX2lkOwotCi0JcmJfbGlua19ub2RlKCZzdi0+cmIsIHBhcmVudCwgcCk7
Ci0JcmJfaW5zZXJ0X2NvbG9yKCZzdi0+cmIsICZzaS0+dm9sdW1lcyk7Ci0Jc2ktPnZvbHNfZm91
bmQgKz0gMTsKLQlkYmdfYmxkKCJhZGRlZCB2b2x1bWUgJWQiLCB2b2xfaWQpOwotCXJldHVybiBz
djsKLX0KLQotLyoqCi0gKiBjb21wYXJlX2xlYnMgLSBmaW5kIG91dCB3aGljaCBsb2dpY2FsIGVy
YXNlYmxvY2sgaXMgbmV3ZXIuCi0gKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVj
dAotICogQHNlYjogZmlyc3QgbG9naWNhbCBlcmFzZWJsb2NrIHRvIGNvbXBhcmUKLSAqIEBwbnVt
OiBwaHlzaWNhbCBlcmFzZWJsb2NrIG51bWJlciBvZiB0aGUgc2Vjb25kIGxvZ2ljYWwgZXJhc2Vi
bG9jayB0bwotICogY29tcGFyZQotICogQHZpZF9oZHI6IHZvbHVtZSBpZGVudGlmaWVyIGhlYWRl
ciBvZiB0aGUgc2Vjb25kIGxvZ2ljYWwgZXJhc2VibG9jawotICoKLSAqIFRoaXMgZnVuY3Rpb24g
Y29tcGFyZXMgMiBjb3BpZXMgb2YgYSBMRUIgYW5kIGluZm9ybXMgd2hpY2ggb25lIGlzIG5ld2Vy
LiBJbgotICogY2FzZSBvZiBzdWNjZXNzIHRoaXMgZnVuY3Rpb24gcmV0dXJucyBhIHBvc2l0aXZl
IHZhbHVlLCBpbiBjYXNlIG9mIGZhaWx1cmUsIGEKLSAqIG5lZ2F0aXZlIGVycm9yIGNvZGUgaXMg
cmV0dXJuZWQuIFRoZSBzdWNjZXNzIHJldHVybiBjb2RlcyB1c2UgdGhlIGZvbGxvd2luZwotICog
Yml0czoKLSAqICAgICBvIGJpdCAwIGlzIGNsZWFyZWQ6IHRoZSBmaXJzdCBQRUIgKGRlc2NyaWJl
ZCBieSBAc2ViKSBpcyBuZXdlciB0aGFuIHRoZQotICogICAgICAgc2Vjb25kIFBFQiAoZGVzY3Jp
YmVkIGJ5IEBwbnVtIGFuZCBAdmlkX2hkcik7Ci0gKiAgICAgbyBiaXQgMCBpcyBzZXQ6IHRoZSBz
ZWNvbmQgUEVCIGlzIG5ld2VyOwotICogICAgIG8gYml0IDEgaXMgY2xlYXJlZDogbm8gYml0LWZs
aXBzIHdlcmUgZGV0ZWN0ZWQgaW4gdGhlIG5ld2VyIExFQjsKLSAqICAgICBvIGJpdCAxIGlzIHNl
dDogYml0LWZsaXBzIHdlcmUgZGV0ZWN0ZWQgaW4gdGhlIG5ld2VyIExFQjsKLSAqICAgICBvIGJp
dCAyIGlzIGNsZWFyZWQ6IHRoZSBvbGRlciBMRUIgaXMgbm90IGNvcnJ1cHRlZDsKLSAqICAgICBv
IGJpdCAyIGlzIHNldDogdGhlIG9sZGVyIExFQiBpcyBjb3JydXB0ZWQuCi0gKi8KLXN0YXRpYyBp
bnQgY29tcGFyZV9sZWJzKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGNvbnN0IHN0cnVjdCB1Ymlf
c2Nhbl9sZWIgKnNlYiwKLQkJCWludCBwbnVtLCBjb25zdCBzdHJ1Y3QgdWJpX3ZpZF9oZHIgKnZp
ZF9oZHIpCi17Ci0Jdm9pZCAqYnVmOwotCWludCBsZW4sIGVyciwgc2Vjb25kX2lzX25ld2VyLCBi
aXRmbGlwcyA9IDAsIGNvcnJ1cHRlZCA9IDA7Ci0JdWludDMyX3QgZGF0YV9jcmMsIGNyYzsKLQlz
dHJ1Y3QgdWJpX3ZpZF9oZHIgKnZoID0gTlVMTDsKLQl1bnNpZ25lZCBsb25nIGxvbmcgc3FudW0y
ID0gYmU2NF90b19jcHUodmlkX2hkci0+c3FudW0pOwotCi0JaWYgKHNxbnVtMiA9PSBzZWItPnNx
bnVtKSB7Ci0JCS8qCi0JCSAqIFRoaXMgbXVzdCBiZSBhIHJlYWxseSBhbmNpZW50IFVCSSBpbWFn
ZSB3aGljaCBoYXMgYmVlbgotCQkgKiBjcmVhdGVkIGJlZm9yZSBzZXF1ZW5jZSBudW1iZXJzIHN1
cHBvcnQgaGFzIGJlZW4gYWRkZWQuIEF0Ci0JCSAqIHRoYXQgdGltZXMgd2UgdXNlZCAzMi1iaXQg
TEVCIHZlcnNpb25zIHN0b3JlZCBpbiBsb2dpY2FsCi0JCSAqIGVyYXNlYmxvY2tzLiBUaGF0IHdh
cyBiZWZvcmUgVUJJIGdvdCBpbnRvIG1haW5saW5lLiBXZSBkbyBub3QKLQkJICogc3VwcG9ydCB0
aGVzZSBpbWFnZXMgYW55bW9yZS4gV2VsbCwgdGhvc2UgaW1hZ2VzIHN0aWxsIHdvcmssCi0JCSAq
IGJ1dCBvbmx5IGlmIG5vIHVuY2xlYW4gcmVib290cyBoYXBwZW5lZC4KLQkJICovCi0JCXViaV9l
cnIoInVuc3VwcG9ydGVkIG9uLWZsYXNoIFVCSSBmb3JtYXRcbiIpOwotCQlyZXR1cm4gLUVJTlZB
TDsKLQl9Ci0KLQkvKiBPYnZpb3VzbHkgdGhlIExFQiB3aXRoIGxvd2VyIHNlcXVlbmNlIGNvdW50
ZXIgaXMgb2xkZXIgKi8KLQlzZWNvbmRfaXNfbmV3ZXIgPSAhIShzcW51bTIgPiBzZWItPnNxbnVt
KTsKLQotCS8qCi0JICogTm93IHdlIGtub3cgd2hpY2ggY29weSBpcyBuZXdlci4gSWYgdGhlIGNv
cHkgZmxhZyBvZiB0aGUgUEVCIHdpdGgKLQkgKiBuZXdlciB2ZXJzaW9uIGlzIG5vdCBzZXQsIHRo
ZW4gd2UganVzdCByZXR1cm4sIG90aGVyd2lzZSB3ZSBoYXZlIHRvCi0JICogY2hlY2sgZGF0YSBD
UkMuIEZvciB0aGUgc2Vjb25kIFBFQiB3ZSBhbHJlYWR5IGhhdmUgdGhlIFZJRCBoZWFkZXIsCi0J
ICogZm9yIHRoZSBmaXJzdCBvbmUgLSB3ZSdsbCBuZWVkIHRvIHJlLXJlYWQgaXQgZnJvbSBmbGFz
aC4KLQkgKgotCSAqIE5vdGU6IHRoaXMgbWF5IGJlIG9wdGltaXplZCBzbyB0aGF0IHdlIHdvdWxk
bid0IHJlYWQgdHdpY2UuCi0JICovCi0KLQlpZiAoc2Vjb25kX2lzX25ld2VyKSB7Ci0JCWlmICgh
dmlkX2hkci0+Y29weV9mbGFnKSB7Ci0JCQkvKiBJdCBpcyBub3QgYSBjb3B5LCBzbyBpdCBpcyBu
ZXdlciAqLwotCQkJZGJnX2JsZCgic2Vjb25kIFBFQiAlZCBpcyBuZXdlciwgY29weV9mbGFnIGlz
IHVuc2V0IiwKLQkJCQlwbnVtKTsKLQkJCXJldHVybiAxOwotCQl9Ci0JfSBlbHNlIHsKLQkJaWYg
KCFzZWItPmNvcHlfZmxhZykgewotCQkJLyogSXQgaXMgbm90IGEgY29weSwgc28gaXQgaXMgbmV3
ZXIgKi8KLQkJCWRiZ19ibGQoImZpcnN0IFBFQiAlZCBpcyBuZXdlciwgY29weV9mbGFnIGlzIHVu
c2V0IiwKLQkJCQlwbnVtKTsKLQkJCXJldHVybiBiaXRmbGlwcyA8PCAxOwotCQl9Ci0KLQkJdmgg
PSB1YmlfemFsbG9jX3ZpZF9oZHIodWJpLCBHRlBfS0VSTkVMKTsKLQkJaWYgKCF2aCkKLQkJCXJl
dHVybiAtRU5PTUVNOwotCi0JCXBudW0gPSBzZWItPnBudW07Ci0JCWVyciA9IHViaV9pb19yZWFk
X3ZpZF9oZHIodWJpLCBwbnVtLCB2aCwgMCk7Ci0JCWlmIChlcnIpIHsKLQkJCWlmIChlcnIgPT0g
VUJJX0lPX0JJVEZMSVBTKQotCQkJCWJpdGZsaXBzID0gMTsKLQkJCWVsc2UgewotCQkJCWRiZ19l
cnIoIlZJRCBvZiBQRUIgJWQgaGVhZGVyIGlzIGJhZCwgYnV0IGl0ICIKLQkJCQkJIndhcyBPSyBl
YXJsaWVyLCBlcnIgJWQiLCBwbnVtLCBlcnIpOwotCQkJCWlmIChlcnIgPiAwKQotCQkJCQllcnIg
PSAtRUlPOwotCi0JCQkJZ290byBvdXRfZnJlZV92aWRoOwotCQkJfQotCQl9Ci0KLQkJdmlkX2hk
ciA9IHZoOwotCX0KLQotCS8qIFJlYWQgdGhlIGRhdGEgb2YgdGhlIGNvcHkgYW5kIGNoZWNrIHRo
ZSBDUkMgKi8KLQotCWxlbiA9IGJlMzJfdG9fY3B1KHZpZF9oZHItPmRhdGFfc2l6ZSk7Ci0JYnVm
ID0gdm1hbGxvYyhsZW4pOwotCWlmICghYnVmKSB7Ci0JCWVyciA9IC1FTk9NRU07Ci0JCWdvdG8g
b3V0X2ZyZWVfdmlkaDsKLQl9Ci0KLQllcnIgPSB1YmlfaW9fcmVhZF9kYXRhKHViaSwgYnVmLCBw
bnVtLCAwLCBsZW4pOwotCWlmIChlcnIgJiYgZXJyICE9IFVCSV9JT19CSVRGTElQUyAmJiBlcnIg
IT0gLUVCQURNU0cpCi0JCWdvdG8gb3V0X2ZyZWVfYnVmOwotCi0JZGF0YV9jcmMgPSBiZTMyX3Rv
X2NwdSh2aWRfaGRyLT5kYXRhX2NyYyk7Ci0JY3JjID0gY3JjMzIoVUJJX0NSQzMyX0lOSVQsIGJ1
ZiwgbGVuKTsKLQlpZiAoY3JjICE9IGRhdGFfY3JjKSB7Ci0JCWRiZ19ibGQoIlBFQiAlZCBDUkMg
ZXJyb3I6IGNhbGN1bGF0ZWQgJSMwOHgsIG11c3QgYmUgJSMwOHgiLAotCQkJcG51bSwgY3JjLCBk
YXRhX2NyYyk7Ci0JCWNvcnJ1cHRlZCA9IDE7Ci0JCWJpdGZsaXBzID0gMDsKLQkJc2Vjb25kX2lz
X25ld2VyID0gIXNlY29uZF9pc19uZXdlcjsKLQl9IGVsc2UgewotCQlkYmdfYmxkKCJQRUIgJWQg
Q1JDIGlzIE9LIiwgcG51bSk7Ci0JCWJpdGZsaXBzID0gISFlcnI7Ci0JfQotCi0JdmZyZWUoYnVm
KTsKLQl1YmlfZnJlZV92aWRfaGRyKHViaSwgdmgpOwotCi0JaWYgKHNlY29uZF9pc19uZXdlcikK
LQkJZGJnX2JsZCgic2Vjb25kIFBFQiAlZCBpcyBuZXdlciwgY29weV9mbGFnIGlzIHNldCIsIHBu
dW0pOwotCWVsc2UKLQkJZGJnX2JsZCgiZmlyc3QgUEVCICVkIGlzIG5ld2VyLCBjb3B5X2ZsYWcg
aXMgc2V0IiwgcG51bSk7Ci0KLQlyZXR1cm4gc2Vjb25kX2lzX25ld2VyIHwgKGJpdGZsaXBzIDw8
IDEpIHwgKGNvcnJ1cHRlZCA8PCAyKTsKLQotb3V0X2ZyZWVfYnVmOgotCXZmcmVlKGJ1Zik7Ci1v
dXRfZnJlZV92aWRoOgotCXViaV9mcmVlX3ZpZF9oZHIodWJpLCB2aCk7Ci0JcmV0dXJuIGVycjsK
LX0KLQotLyoqCi0gKiB1Ymlfc2Nhbl9hZGRfdXNlZCAtIGFkZCBwaHlzaWNhbCBlcmFzZWJsb2Nr
IHRvIHRoZSBzY2FubmluZyBpbmZvcm1hdGlvbi4KLSAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3Jp
cHRpb24gb2JqZWN0Ci0gKiBAc2k6IHNjYW5uaW5nIGluZm9ybWF0aW9uCi0gKiBAcG51bTogdGhl
IHBoeXNpY2FsIGVyYXNlYmxvY2sgbnVtYmVyCi0gKiBAZWM6IGVyYXNlIGNvdW50ZXIKLSAqIEB2
aWRfaGRyOiB0aGUgdm9sdW1lIGlkZW50aWZpZXIgaGVhZGVyCi0gKiBAYml0ZmxpcHM6IGlmIGJp
dC1mbGlwcyB3ZXJlIGRldGVjdGVkIHdoZW4gdGhpcyBwaHlzaWNhbCBlcmFzZWJsb2NrIHdhcyBy
ZWFkCi0gKgotICogVGhpcyBmdW5jdGlvbiBhZGRzIGluZm9ybWF0aW9uIGFib3V0IGEgdXNlZCBw
aHlzaWNhbCBlcmFzZWJsb2NrIHRvIHRoZQotICogJ3VzZWQnIHRyZWUgb2YgdGhlIGNvcnJlc3Bv
bmRpbmcgdm9sdW1lLiBUaGUgZnVuY3Rpb24gaXMgcmF0aGVyIGNvbXBsZXgKLSAqIGJlY2F1c2Ug
aXQgaGFzIHRvIGhhbmRsZSBjYXNlcyB3aGVuIHRoaXMgaXMgbm90IHRoZSBmaXJzdCBwaHlzaWNh
bAotICogZXJhc2VibG9jayBiZWxvbmdpbmcgdG8gdGhlIHNhbWUgbG9naWNhbCBlcmFzZWJsb2Nr
LCBhbmQgdGhlIG5ld2VyIG9uZSBoYXMKLSAqIHRvIGJlIHBpY2tlZCwgd2hpbGUgdGhlIG9sZGVy
IG9uZSBoYXMgdG8gYmUgZHJvcHBlZC4gVGhpcyBmdW5jdGlvbiByZXR1cm5zCi0gKiB6ZXJvIGlu
IGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGluIGNhc2Ugb2YgZmFp
bHVyZS4KLSAqLwotaW50IHViaV9zY2FuX2FkZF91c2VkKHN0cnVjdCB1YmlfZGV2aWNlICp1Ymks
IHN0cnVjdCB1Ymlfc2Nhbl9pbmZvICpzaSwKLQkJICAgICAgaW50IHBudW0sIGludCBlYywgY29u
c3Qgc3RydWN0IHViaV92aWRfaGRyICp2aWRfaGRyLAotCQkgICAgICBpbnQgYml0ZmxpcHMpCi17
Ci0JaW50IGVyciwgdm9sX2lkLCBsbnVtOwotCXVuc2lnbmVkIGxvbmcgbG9uZyBzcW51bTsKLQlz
dHJ1Y3QgdWJpX3NjYW5fdm9sdW1lICpzdjsKLQlzdHJ1Y3QgdWJpX3NjYW5fbGViICpzZWI7Ci0J
c3RydWN0IHJiX25vZGUgKipwLCAqcGFyZW50ID0gTlVMTDsKLQotCXZvbF9pZCA9IGJlMzJfdG9f
Y3B1KHZpZF9oZHItPnZvbF9pZCk7Ci0JbG51bSA9IGJlMzJfdG9fY3B1KHZpZF9oZHItPmxudW0p
OwotCXNxbnVtID0gYmU2NF90b19jcHUodmlkX2hkci0+c3FudW0pOwotCi0JZGJnX2JsZCgiUEVC
ICVkLCBMRUIgJWQ6JWQsIEVDICVkLCBzcW51bSAlbGx1LCBiaXRmbGlwcyAlZCIsCi0JCXBudW0s
IHZvbF9pZCwgbG51bSwgZWMsIHNxbnVtLCBiaXRmbGlwcyk7Ci0KLQlzdiA9IGFkZF92b2x1bWUo
c2ksIHZvbF9pZCwgcG51bSwgdmlkX2hkcik7Ci0JaWYgKElTX0VSUihzdikpCi0JCXJldHVybiBQ
VFJfRVJSKHN2KTsKLQotCWlmIChzaS0+bWF4X3NxbnVtIDwgc3FudW0pCi0JCXNpLT5tYXhfc3Fu
dW0gPSBzcW51bTsKLQotCS8qCi0JICogV2FsayB0aGUgUkItdHJlZSBvZiBsb2dpY2FsIGVyYXNl
YmxvY2tzIG9mIHZvbHVtZSBAdm9sX2lkIHRvIGxvb2sKLQkgKiBpZiB0aGlzIGlzIHRoZSBmaXJz
dCBpbnN0YW5jZSBvZiB0aGlzIGxvZ2ljYWwgZXJhc2VibG9jayBvciBub3QuCi0JICovCi0JcCA9
ICZzdi0+cm9vdC5yYl9ub2RlOwotCXdoaWxlICgqcCkgewotCQlpbnQgY21wX3JlczsKLQotCQlw
YXJlbnQgPSAqcDsKLQkJc2ViID0gcmJfZW50cnkocGFyZW50LCBzdHJ1Y3QgdWJpX3NjYW5fbGVi
LCB1LnJiKTsKLQkJaWYgKGxudW0gIT0gc2ViLT5sbnVtKSB7Ci0JCQlpZiAobG51bSA8IHNlYi0+
bG51bSkKLQkJCQlwID0gJigqcCktPnJiX2xlZnQ7Ci0JCQllbHNlCi0JCQkJcCA9ICYoKnApLT5y
Yl9yaWdodDsKLQkJCWNvbnRpbnVlOwotCQl9Ci0KLQkJLyoKLQkJICogVGhlcmUgaXMgYWxyZWFk
eSBhIHBoeXNpY2FsIGVyYXNlYmxvY2sgZGVzY3JpYmluZyB0aGUgc2FtZQotCQkgKiBsb2dpY2Fs
IGVyYXNlYmxvY2sgcHJlc2VudC4KLQkJICovCi0KLQkJZGJnX2JsZCgidGhpcyBMRUIgYWxyZWFk
eSBleGlzdHM6IFBFQiAlZCwgc3FudW0gJWxsdSwgIgotCQkJIkVDICVkIiwgc2ViLT5wbnVtLCBz
ZWItPnNxbnVtLCBzZWItPmVjKTsKLQotCQkvKgotCQkgKiBNYWtlIHN1cmUgdGhhdCB0aGUgbG9n
aWNhbCBlcmFzZWJsb2NrcyBoYXZlIGRpZmZlcmVudAotCQkgKiBzZXF1ZW5jZSBudW1iZXJzLiBP
dGhlcndpc2UgdGhlIGltYWdlIGlzIGJhZC4KLQkJICoKLQkJICogSG93ZXZlciwgaWYgdGhlIHNl
cXVlbmNlIG51bWJlciBpcyB6ZXJvLCB3ZSBhc3N1bWUgaXQgbXVzdAotCQkgKiBiZSBhbiBhbmNp
ZW50IFVCSSBpbWFnZSBmcm9tIHRoZSBlcmEgd2hlbiBVQkkgZGlkIG5vdCBoYXZlCi0JCSAqIHNl
cXVlbmNlIG51bWJlcnMuIFdlIHN0aWxsIGNhbiBhdHRhY2ggdGhlc2UgaW1hZ2VzLCB1bmxlc3MK
LQkJICogdGhlcmUgaXMgYSBuZWVkIHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gb2xkIGFuZCBuZXcK
LQkJICogZXJhc2VibG9ja3MsIGluIHdoaWNoIGNhc2Ugd2UnbGwgcmVmdXNlIHRoZSBpbWFnZSBp
bgotCQkgKiAnY29tcGFyZV9sZWJzKCknLiBJbiBvdGhlciB3b3Jkcywgd2UgYXR0YWNoIG9sZCBj
bGVhbgotCQkgKiBpbWFnZXMsIGJ1dCByZWZ1c2UgYXR0YWNoaW5nIG9sZCBpbWFnZXMgd2l0aCBk
dXBsaWNhdGVkCi0JCSAqIGxvZ2ljYWwgZXJhc2VibG9ja3MgYmVjYXVzZSB0aGVyZSB3YXMgYW4g
dW5jbGVhbiByZWJvb3QuCi0JCSAqLwotCQlpZiAoc2ViLT5zcW51bSA9PSBzcW51bSAmJiBzcW51
bSAhPSAwKSB7Ci0JCQl1YmlfZXJyKCJ0d28gTEVCcyB3aXRoIHNhbWUgc2VxdWVuY2UgbnVtYmVy
ICVsbHUiLAotCQkJCXNxbnVtKTsKLQkJCXViaV9kYmdfZHVtcF9zZWIoc2ViLCAwKTsKLQkJCXVi
aV9kYmdfZHVtcF92aWRfaGRyKHZpZF9oZHIpOwotCQkJcmV0dXJuIC1FSU5WQUw7Ci0JCX0KLQot
CQkvKgotCQkgKiBOb3cgd2UgaGF2ZSB0byBkcm9wIHRoZSBvbGRlciBvbmUgYW5kIHByZXNlcnZl
IHRoZSBuZXdlcgotCQkgKiBvbmUuCi0JCSAqLwotCQljbXBfcmVzID0gY29tcGFyZV9sZWJzKHVi
aSwgc2ViLCBwbnVtLCB2aWRfaGRyKTsKLQkJaWYgKGNtcF9yZXMgPCAwKQotCQkJcmV0dXJuIGNt
cF9yZXM7Ci0KLQkJaWYgKGNtcF9yZXMgJiAxKSB7Ci0JCQkvKgotCQkJICogVGhpcyBsb2dpY2Fs
IGVyYXNlYmxvY2sgaXMgbmV3ZXIgdGhhbiB0aGUgb25lCi0JCQkgKiBmb3VuZCBlYXJsaWVyLgot
CQkJICovCi0JCQllcnIgPSB2YWxpZGF0ZV92aWRfaGRyKHZpZF9oZHIsIHN2LCBwbnVtKTsKLQkJ
CWlmIChlcnIpCi0JCQkJcmV0dXJuIGVycjsKLQotCQkJZXJyID0gYWRkX3RvX2xpc3Qoc2ksIHNl
Yi0+cG51bSwgc2ViLT5lYywgY21wX3JlcyAmIDQsCi0JCQkJCSAgJnNpLT5lcmFzZSk7Ci0JCQlp
ZiAoZXJyKQotCQkJCXJldHVybiBlcnI7Ci0KLQkJCXNlYi0+ZWMgPSBlYzsKLQkJCXNlYi0+cG51
bSA9IHBudW07Ci0JCQlzZWItPnNjcnViID0gKChjbXBfcmVzICYgMikgfHwgYml0ZmxpcHMpOwot
CQkJc2ViLT5jb3B5X2ZsYWcgPSB2aWRfaGRyLT5jb3B5X2ZsYWc7Ci0JCQlzZWItPnNxbnVtID0g
c3FudW07Ci0KLQkJCWlmIChzdi0+aGlnaGVzdF9sbnVtID09IGxudW0pCi0JCQkJc3YtPmxhc3Rf
ZGF0YV9zaXplID0KLQkJCQkJYmUzMl90b19jcHUodmlkX2hkci0+ZGF0YV9zaXplKTsKLQotCQkJ
cmV0dXJuIDA7Ci0JCX0gZWxzZSB7Ci0JCQkvKgotCQkJICogVGhpcyBsb2dpY2FsIGVyYXNlYmxv
Y2sgaXMgb2xkZXIgdGhhbiB0aGUgb25lIGZvdW5kCi0JCQkgKiBwcmV2aW91c2x5LgotCQkJICov
Ci0JCQlyZXR1cm4gYWRkX3RvX2xpc3Qoc2ksIHBudW0sIGVjLCBjbXBfcmVzICYgNCwKLQkJCQkJ
ICAgJnNpLT5lcmFzZSk7Ci0JCX0KLQl9Ci0KLQkvKgotCSAqIFdlJ3ZlIG1ldCB0aGlzIGxvZ2lj
YWwgZXJhc2VibG9jayBmb3IgdGhlIGZpcnN0IHRpbWUsIGFkZCBpdCB0byB0aGUKLQkgKiBzY2Fu
bmluZyBpbmZvcm1hdGlvbi4KLQkgKi8KLQotCWVyciA9IHZhbGlkYXRlX3ZpZF9oZHIodmlkX2hk
ciwgc3YsIHBudW0pOwotCWlmIChlcnIpCi0JCXJldHVybiBlcnI7Ci0KLQlzZWIgPSBrbWVtX2Nh
Y2hlX2FsbG9jKHNpLT5zY2FuX2xlYl9zbGFiLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXNlYikKLQkJ
cmV0dXJuIC1FTk9NRU07Ci0KLQlzZWItPmVjID0gZWM7Ci0Jc2ViLT5wbnVtID0gcG51bTsKLQlz
ZWItPmxudW0gPSBsbnVtOwotCXNlYi0+c2NydWIgPSBiaXRmbGlwczsKLQlzZWItPmNvcHlfZmxh
ZyA9IHZpZF9oZHItPmNvcHlfZmxhZzsKLQlzZWItPnNxbnVtID0gc3FudW07Ci0KLQlpZiAoc3Yt
PmhpZ2hlc3RfbG51bSA8PSBsbnVtKSB7Ci0JCXN2LT5oaWdoZXN0X2xudW0gPSBsbnVtOwotCQlz
di0+bGFzdF9kYXRhX3NpemUgPSBiZTMyX3RvX2NwdSh2aWRfaGRyLT5kYXRhX3NpemUpOwotCX0K
LQotCXN2LT5sZWJfY291bnQgKz0gMTsKLQlyYl9saW5rX25vZGUoJnNlYi0+dS5yYiwgcGFyZW50
LCBwKTsKLQlyYl9pbnNlcnRfY29sb3IoJnNlYi0+dS5yYiwgJnN2LT5yb290KTsKLQlyZXR1cm4g
MDsKLX0KLQotLyoqCi0gKiB1Ymlfc2Nhbl9maW5kX3N2IC0gZmluZCB2b2x1bWUgaW4gdGhlIHNj
YW5uaW5nIGluZm9ybWF0aW9uLgotICogQHNpOiBzY2FubmluZyBpbmZvcm1hdGlvbgotICogQHZv
bF9pZDogdGhlIHJlcXVlc3RlZCB2b2x1bWUgSUQKLSAqCi0gKiBUaGlzIGZ1bmN0aW9uIHJldHVy
bnMgYSBwb2ludGVyIHRvIHRoZSB2b2x1bWUgZGVzY3JpcHRpb24gb3IgJU5VTEwgaWYgdGhlcmUK
LSAqIGFyZSBubyBkYXRhIGFib3V0IHRoaXMgdm9sdW1lIGluIHRoZSBzY2FubmluZyBpbmZvcm1h
dGlvbi4KLSAqLwotc3RydWN0IHViaV9zY2FuX3ZvbHVtZSAqdWJpX3NjYW5fZmluZF9zdihjb25z
dCBzdHJ1Y3QgdWJpX3NjYW5faW5mbyAqc2ksCi0JCQkJCSBpbnQgdm9sX2lkKQotewotCXN0cnVj
dCB1Ymlfc2Nhbl92b2x1bWUgKnN2OwotCXN0cnVjdCByYl9ub2RlICpwID0gc2ktPnZvbHVtZXMu
cmJfbm9kZTsKLQotCXdoaWxlIChwKSB7Ci0JCXN2ID0gcmJfZW50cnkocCwgc3RydWN0IHViaV9z
Y2FuX3ZvbHVtZSwgcmIpOwotCi0JCWlmICh2b2xfaWQgPT0gc3YtPnZvbF9pZCkKLQkJCXJldHVy
biBzdjsKLQotCQlpZiAodm9sX2lkID4gc3YtPnZvbF9pZCkKLQkJCXAgPSBwLT5yYl9sZWZ0Owot
CQllbHNlCi0JCQlwID0gcC0+cmJfcmlnaHQ7Ci0JfQotCi0JcmV0dXJuIE5VTEw7Ci19Ci0KLS8q
KgotICogdWJpX3NjYW5fZmluZF9zZWIgLSBmaW5kIExFQiBpbiB0aGUgdm9sdW1lIHNjYW5uaW5n
IGluZm9ybWF0aW9uLgotICogQHN2OiBhIHBvaW50ZXIgdG8gdGhlIHZvbHVtZSBzY2FubmluZyBp
bmZvcm1hdGlvbgotICogQGxudW06IHRoZSByZXF1ZXN0ZWQgbG9naWNhbCBlcmFzZWJsb2NrCi0g
KgotICogVGhpcyBmdW5jdGlvbiByZXR1cm5zIGEgcG9pbnRlciB0byB0aGUgc2Nhbm5pbmcgbG9n
aWNhbCBlcmFzZWJsb2NrIG9yICVOVUxMCi0gKiBpZiB0aGVyZSBhcmUgbm8gZGF0YSBhYm91dCBp
dCBpbiB0aGUgc2Nhbm5pbmcgdm9sdW1lIGluZm9ybWF0aW9uLgotICovCi1zdHJ1Y3QgdWJpX3Nj
YW5fbGViICp1Ymlfc2Nhbl9maW5kX3NlYihjb25zdCBzdHJ1Y3QgdWJpX3NjYW5fdm9sdW1lICpz
diwKLQkJCQkgICAgICAgaW50IGxudW0pCi17Ci0Jc3RydWN0IHViaV9zY2FuX2xlYiAqc2ViOwot
CXN0cnVjdCByYl9ub2RlICpwID0gc3YtPnJvb3QucmJfbm9kZTsKLQotCXdoaWxlIChwKSB7Ci0J
CXNlYiA9IHJiX2VudHJ5KHAsIHN0cnVjdCB1Ymlfc2Nhbl9sZWIsIHUucmIpOwotCi0JCWlmIChs
bnVtID09IHNlYi0+bG51bSkKLQkJCXJldHVybiBzZWI7Ci0KLQkJaWYgKGxudW0gPiBzZWItPmxu
dW0pCi0JCQlwID0gcC0+cmJfbGVmdDsKLQkJZWxzZQotCQkJcCA9IHAtPnJiX3JpZ2h0OwotCX0K
LQotCXJldHVybiBOVUxMOwotfQotCi0vKioKLSAqIHViaV9zY2FuX3JtX3ZvbHVtZSAtIGRlbGV0
ZSBzY2FubmluZyBpbmZvcm1hdGlvbiBhYm91dCBhIHZvbHVtZS4KLSAqIEBzaTogc2Nhbm5pbmcg
aW5mb3JtYXRpb24KLSAqIEBzdjogdGhlIHZvbHVtZSBzY2FubmluZyBpbmZvcm1hdGlvbiB0byBk
ZWxldGUKLSAqLwotdm9pZCB1Ymlfc2Nhbl9ybV92b2x1bWUoc3RydWN0IHViaV9zY2FuX2luZm8g
KnNpLCBzdHJ1Y3QgdWJpX3NjYW5fdm9sdW1lICpzdikKLXsKLQlzdHJ1Y3QgcmJfbm9kZSAqcmI7
Ci0Jc3RydWN0IHViaV9zY2FuX2xlYiAqc2ViOwotCi0JZGJnX2JsZCgicmVtb3ZlIHNjYW5uaW5n
IGluZm9ybWF0aW9uIGFib3V0IHZvbHVtZSAlZCIsIHN2LT52b2xfaWQpOwotCi0Jd2hpbGUgKChy
YiA9IHJiX2ZpcnN0KCZzdi0+cm9vdCkpKSB7Ci0JCXNlYiA9IHJiX2VudHJ5KHJiLCBzdHJ1Y3Qg
dWJpX3NjYW5fbGViLCB1LnJiKTsKLQkJcmJfZXJhc2UoJnNlYi0+dS5yYiwgJnN2LT5yb290KTsK
LQkJbGlzdF9hZGRfdGFpbCgmc2ViLT51Lmxpc3QsICZzaS0+ZXJhc2UpOwotCX0KLQotCXJiX2Vy
YXNlKCZzdi0+cmIsICZzaS0+dm9sdW1lcyk7Ci0Ja2ZyZWUoc3YpOwotCXNpLT52b2xzX2ZvdW5k
IC09IDE7Ci19Ci0KLS8qKgotICogdWJpX3NjYW5fZXJhc2VfcGViIC0gZXJhc2UgYSBwaHlzaWNh
bCBlcmFzZWJsb2NrLgotICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKLSAq
IEBzaTogc2Nhbm5pbmcgaW5mb3JtYXRpb24KLSAqIEBwbnVtOiBwaHlzaWNhbCBlcmFzZWJsb2Nr
IG51bWJlciB0byBlcmFzZTsKLSAqIEBlYzogZXJhc2UgY291bnRlciB2YWx1ZSB0byB3cml0ZSAo
JVVCSV9TQ0FOX1VOS05PV05fRUMgaWYgaXQgaXMgdW5rbm93bikKLSAqCi0gKiBUaGlzIGZ1bmN0
aW9uIGVyYXNlcyBwaHlzaWNhbCBlcmFzZWJsb2NrICdwbnVtJywgYW5kIHdyaXRlcyB0aGUgZXJh
c2UKLSAqIGNvdW50ZXIgaGVhZGVyIHRvIGl0LiBUaGlzIGZ1bmN0aW9uIHNob3VsZCBvbmx5IGJl
IHVzZWQgb24gVUJJIGRldmljZQotICogaW5pdGlhbGl6YXRpb24gc3RhZ2VzLCB3aGVuIHRoZSBF
QkEgc3ViLXN5c3RlbSBoYWQgbm90IGJlZW4geWV0IGluaXRpYWxpemVkLgotICogVGhpcyBmdW5j
dGlvbiByZXR1cm5zIHplcm8gaW4gY2FzZSBvZiBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlIGVycm9y
IGNvZGUgaW4KLSAqIGNhc2Ugb2YgZmFpbHVyZS4KLSAqLwotaW50IHViaV9zY2FuX2VyYXNlX3Bl
YihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBjb25zdCBzdHJ1Y3QgdWJpX3NjYW5faW5mbyAqc2ks
Ci0JCSAgICAgICBpbnQgcG51bSwgaW50IGVjKQotewotCWludCBlcnI7Ci0Jc3RydWN0IHViaV9l
Y19oZHIgKmVjX2hkcjsKLQotCWlmICgobG9uZyBsb25nKWVjID49IFVCSV9NQVhfRVJBU0VDT1VO
VEVSKSB7Ci0JCS8qCi0JCSAqIEVyYXNlIGNvdW50ZXIgb3ZlcmZsb3cuIFVwZ3JhZGUgVUJJIGFu
ZCB1c2UgNjQtYml0Ci0JCSAqIGVyYXNlIGNvdW50ZXJzIGludGVybmFsbHkuCi0JCSAqLwotCQl1
YmlfZXJyKCJlcmFzZSBjb3VudGVyIG92ZXJmbG93IGF0IFBFQiAlZCwgRUMgJWQiLCBwbnVtLCBl
Yyk7Ci0JCXJldHVybiAtRUlOVkFMOwotCX0KLQotCWVjX2hkciA9IGt6YWxsb2ModWJpLT5lY19o
ZHJfYWxzaXplLCBHRlBfS0VSTkVMKTsKLQlpZiAoIWVjX2hkcikKLQkJcmV0dXJuIC1FTk9NRU07
Ci0KLQllY19oZHItPmVjID0gY3B1X3RvX2JlNjQoZWMpOwotCi0JZXJyID0gdWJpX2lvX3N5bmNf
ZXJhc2UodWJpLCBwbnVtLCAwKTsKLQlpZiAoZXJyIDwgMCkKLQkJZ290byBvdXRfZnJlZTsKLQot
CWVyciA9IHViaV9pb193cml0ZV9lY19oZHIodWJpLCBwbnVtLCBlY19oZHIpOwotCi1vdXRfZnJl
ZToKLQlrZnJlZShlY19oZHIpOwotCXJldHVybiBlcnI7Ci19Ci0KLS8qKgotICogdWJpX3NjYW5f
Z2V0X2ZyZWVfcGViIC0gZ2V0IGEgZnJlZSBwaHlzaWNhbCBlcmFzZWJsb2NrLgotICogQHViaTog
VUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKLSAqIEBzaTogc2Nhbm5pbmcgaW5mb3JtYXRp
b24KLSAqCi0gKiBUaGlzIGZ1bmN0aW9uIHJldHVybnMgYSBmcmVlIHBoeXNpY2FsIGVyYXNlYmxv
Y2suIEl0IGlzIHN1cHBvc2VkIHRvIGJlCi0gKiBjYWxsZWQgb24gdGhlIFVCSSBpbml0aWFsaXph
dGlvbiBzdGFnZXMgd2hlbiB0aGUgd2Vhci1sZXZlbGluZyBzdWItc3lzdGVtIGlzCi0gKiBub3Qg
aW5pdGlhbGl6ZWQgeWV0LiBUaGlzIGZ1bmN0aW9uIHBpY2tzIGEgcGh5c2ljYWwgZXJhc2VibG9j
a3MgZnJvbSBvbmUgb2YKLSAqIHRoZSBsaXN0cywgd3JpdGVzIHRoZSBFQyBoZWFkZXIgaWYgaXQg
aXMgbmVlZGVkLCBhbmQgcmVtb3ZlcyBpdCBmcm9tIHRoZQotICogbGlzdC4KLSAqCi0gKiBUaGlz
IGZ1bmN0aW9uIHJldHVybnMgc2Nhbm5pbmcgcGh5c2ljYWwgZXJhc2VibG9jayBpbmZvcm1hdGlv
biBpbiBjYXNlIG9mCi0gKiBzdWNjZXNzIGFuZCBhbiBlcnJvciBjb2RlIGluIGNhc2Ugb2YgZmFp
bHVyZS4KLSAqLwotc3RydWN0IHViaV9zY2FuX2xlYiAqdWJpX3NjYW5fZ2V0X2ZyZWVfcGViKHN0
cnVjdCB1YmlfZGV2aWNlICp1YmksCi0JCQkJCSAgIHN0cnVjdCB1Ymlfc2Nhbl9pbmZvICpzaSkK
LXsKLQlpbnQgZXJyID0gMDsKLQlzdHJ1Y3QgdWJpX3NjYW5fbGViICpzZWIsICp0bXBfc2ViOwot
Ci0JaWYgKCFsaXN0X2VtcHR5KCZzaS0+ZnJlZSkpIHsKLQkJc2ViID0gbGlzdF9lbnRyeShzaS0+
ZnJlZS5uZXh0LCBzdHJ1Y3QgdWJpX3NjYW5fbGViLCB1Lmxpc3QpOwotCQlsaXN0X2RlbCgmc2Vi
LT51Lmxpc3QpOwotCQlkYmdfYmxkKCJyZXR1cm4gZnJlZSBQRUIgJWQsIEVDICVkIiwgc2ViLT5w
bnVtLCBzZWItPmVjKTsKLQkJcmV0dXJuIHNlYjsKLQl9Ci0KLQkvKgotCSAqIFdlIHRyeSB0byBl
cmFzZSB0aGUgZmlyc3QgcGh5c2ljYWwgZXJhc2VibG9jayBmcm9tIHRoZSBlcmFzZSBsaXN0Ci0J
ICogYW5kIHBpY2sgaXQgaWYgd2Ugc3VjY2VlZCwgb3IgdHJ5IHRvIGVyYXNlIHRoZSBuZXh0IG9u
ZSBpZiBub3QuIEFuZAotCSAqIHNvIGZvcnRoLiBXZSBkb24ndCB3YW50IHRvIHRha2UgY2FyZSBh
Ym91dCBiYWQgZXJhc2VibG9ja3MgaGVyZSAtCi0JICogdGhleSdsbCBiZSBoYW5kbGVkIGxhdGVy
LgotCSAqLwotCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShzZWIsIHRtcF9zZWIsICZzaS0+ZXJh
c2UsIHUubGlzdCkgewotCQlpZiAoc2ViLT5lYyA9PSBVQklfU0NBTl9VTktOT1dOX0VDKQotCQkJ
c2ViLT5lYyA9IHNpLT5tZWFuX2VjOwotCi0JCWVyciA9IHViaV9zY2FuX2VyYXNlX3BlYih1Ymks
IHNpLCBzZWItPnBudW0sIHNlYi0+ZWMrMSk7Ci0JCWlmIChlcnIpCi0JCQljb250aW51ZTsKLQot
CQlzZWItPmVjICs9IDE7Ci0JCWxpc3RfZGVsKCZzZWItPnUubGlzdCk7Ci0JCWRiZ19ibGQoInJl
dHVybiBQRUIgJWQsIEVDICVkIiwgc2ViLT5wbnVtLCBzZWItPmVjKTsKLQkJcmV0dXJuIHNlYjsK
LQl9Ci0KLQl1YmlfZXJyKCJubyBmcmVlIGVyYXNlYmxvY2tzIik7Ci0JcmV0dXJuIEVSUl9QVFIo
LUVOT1NQQyk7Ci19Ci0KLS8qKgotICogY2hlY2tfY29ycnVwdGlvbiAtIGNoZWNrIHRoZSBkYXRh
IGFyZWEgb2YgUEVCLgotICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKLSAq
IEB2aWRfaHJkOiB0aGUgKGNvcnJ1cHRlZCkgVklEIGhlYWRlciBvZiB0aGlzIFBFQgotICogQHBu
dW06IHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIG51bWJlciB0byBjaGVjawotICoKLSAqIFRoaXMg
aXMgYSBoZWxwZXIgZnVuY3Rpb24gd2hpY2ggaXMgdXNlZCB0byBkaXN0aW5ndWlzaCBiZXR3ZWVu
IFZJRCBoZWFkZXIKLSAqIGNvcnJ1cHRpb25zIGNhdXNlZCBieSBwb3dlciBjdXRzIGFuZCBvdGhl
ciByZWFzb25zLiBJZiB0aGUgUEVCIGNvbnRhaW5zIG9ubHkKLSAqIDB4RkYgYnl0ZXMgaW4gdGhl
IGRhdGEgYXJlYSwgdGhlIFZJRCBoZWFkZXIgaXMgbW9zdCBwcm9iYWJseSBjb3JydXB0ZWQKLSAq
IGJlY2F1c2Ugb2YgYSBwb3dlciBjdXQgKCUwIGlzIHJldHVybmVkIGluIHRoaXMgY2FzZSkuIE90
aGVyd2lzZSwgaXQgd2FzCi0gKiBwcm9iYWJseSBjb3JydXB0ZWQgZm9yIHNvbWUgb3RoZXIgcmVh
c29ucyAoJTEgaXMgcmV0dXJuZWQgaW4gdGhpcyBjYXNlKS4gQQotICogbmVnYXRpdmUgZXJyb3Ig
Y29kZSBpcyByZXR1cm5lZCBpZiBhIHJlYWQgZXJyb3Igb2NjdXJyZWQuCi0gKgotICogSWYgdGhl
IGNvcnJ1cHRpb24gcmVhc29uIHdhcyBhIHBvd2VyIGN1dCwgVUJJIGNhbiBzYWZlbHkgZXJhc2Ug
dGhpcyBQRUIuCi0gKiBPdGhlcndpc2UsIGl0IHNob3VsZCBwcmVzZXJ2ZSBpdCB0byBhdm9pZCBw
b3NzaWJseSBkZXN0cm95aW5nIGltcG9ydGFudAotICogaW5mb3JtYXRpb24uCi0gKi8KLXN0YXRp
YyBpbnQgY2hlY2tfY29ycnVwdGlvbihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJp
X3ZpZF9oZHIgKnZpZF9oZHIsCi0JCQkgICAgaW50IHBudW0pCi17Ci0JaW50IGVycjsKLQotCW11
dGV4X2xvY2soJnViaS0+YnVmX211dGV4KTsKLQltZW1zZXQodWJpLT5wZWJfYnVmMSwgMHgwMCwg
dWJpLT5sZWJfc2l6ZSk7Ci0KLQllcnIgPSB1YmlfaW9fcmVhZCh1YmksIHViaS0+cGViX2J1ZjEs
IHBudW0sIHViaS0+bGViX3N0YXJ0LAotCQkJICB1YmktPmxlYl9zaXplKTsKLQlpZiAoZXJyID09
IFVCSV9JT19CSVRGTElQUyB8fCBlcnIgPT0gLUVCQURNU0cpIHsKLQkJLyoKLQkJICogQml0LWZs
aXBzIG9yIGludGVncml0eSBlcnJvcnMgd2hpbGUgcmVhZGluZyB0aGUgZGF0YSBhcmVhLgotCQkg
KiBJdCBpcyBkaWZmaWN1bHQgdG8gc2F5IGZvciBzdXJlIHdoYXQgdHlwZSBvZiBjb3JydXB0aW9u
IGlzCi0JCSAqIHRoaXMsIGJ1dCBwcmVzdW1hYmx5IGEgcG93ZXIgY3V0IGhhcHBlbmVkIHdoaWxl
IHRoaXMgUEVCIHdhcwotCQkgKiBlcmFzZWQsIHNvIGl0IGJlY2FtZSB1bnN0YWJsZSBhbmQgY29y
cnVwdGVkLCBhbmQgc2hvdWxkIGJlCi0JCSAqIGVyYXNlZC4KLQkJICovCi0JCWVyciA9IDA7Ci0J
CWdvdG8gb3V0X3VubG9jazsKLQl9Ci0KLQlpZiAoZXJyKQotCQlnb3RvIG91dF91bmxvY2s7Ci0K
LQlpZiAodWJpX2NoZWNrX3BhdHRlcm4odWJpLT5wZWJfYnVmMSwgMHhGRiwgdWJpLT5sZWJfc2l6
ZSkpCi0JCWdvdG8gb3V0X3VubG9jazsKLQotCXViaV9lcnIoIlBFQiAlZCBjb250YWlucyBjb3Jy
dXB0ZWQgVklEIGhlYWRlciwgYW5kIHRoZSBkYXRhIGRvZXMgbm90ICIKLQkJImNvbnRhaW4gYWxs
IDB4RkYsIHRoaXMgbWF5IGJlIGEgbm9uLVVCSSBQRUIgb3IgYSBzZXZlcmUgVklEICIKLQkJImhl
YWRlciBjb3JydXB0aW9uIHdoaWNoIHJlcXVpcmVzIG1hbnVhbCBpbnNwZWN0aW9uIiwgcG51bSk7
Ci0JdWJpX2RiZ19kdW1wX3ZpZF9oZHIodmlkX2hkcik7Ci0JZGJnX21zZygiaGV4ZHVtcCBvZiBQ
RUIgJWQgb2Zmc2V0ICVkLCBsZW5ndGggJWQiLAotCQlwbnVtLCB1YmktPmxlYl9zdGFydCwgdWJp
LT5sZWJfc2l6ZSk7Ci0JdWJpX2RiZ19wcmludF9oZXhfZHVtcChLRVJOX0RFQlVHLCAiIiwgRFVN
UF9QUkVGSVhfT0ZGU0VULCAzMiwgMSwKLQkJCSAgICAgICB1YmktPnBlYl9idWYxLCB1YmktPmxl
Yl9zaXplLCAxKTsKLQllcnIgPSAxOwotCi1vdXRfdW5sb2NrOgotCW11dGV4X3VubG9jaygmdWJp
LT5idWZfbXV0ZXgpOwotCXJldHVybiBlcnI7Ci19Ci0KLS8qKgotICogcHJvY2Vzc19lYiAtIHJl
YWQsIGNoZWNrIFVCSSBoZWFkZXJzLCBhbmQgYWRkIHRoZW0gdG8gc2Nhbm5pbmcgaW5mb3JtYXRp
b24uCi0gKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVjdAotICogQHNpOiBzY2Fu
bmluZyBpbmZvcm1hdGlvbgotICogQHBudW06IHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIG51bWJl
cgotICoKLSAqIFRoaXMgZnVuY3Rpb24gcmV0dXJucyBhIHplcm8gaWYgdGhlIHBoeXNpY2FsIGVy
YXNlYmxvY2sgd2FzIHN1Y2Nlc3NmdWxseQotICogaGFuZGxlZCBhbmQgYSBuZWdhdGl2ZSBlcnJv
ciBjb2RlIGluIGNhc2Ugb2YgZmFpbHVyZS4KLSAqLwotc3RhdGljIGludCBwcm9jZXNzX2ViKHN0
cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1Ymlfc2Nhbl9pbmZvICpzaSwKLQkJICAgICAg
aW50IHBudW0pCi17Ci0JbG9uZyBsb25nIHVuaW5pdGlhbGl6ZWRfdmFyKGVjKTsKLQlpbnQgZXJy
LCBiaXRmbGlwcyA9IDAsIHZvbF9pZCwgZWNfZXJyID0gMDsKLQotCWRiZ19ibGQoInNjYW4gUEVC
ICVkIiwgcG51bSk7Ci0KLQkvKiBTa2lwIGJhZCBwaHlzaWNhbCBlcmFzZWJsb2NrcyAqLwotCWVy
ciA9IHViaV9pb19pc19iYWQodWJpLCBwbnVtKTsKLQlpZiAoZXJyIDwgMCkKLQkJcmV0dXJuIGVy
cjsKLQllbHNlIGlmIChlcnIpIHsKLQkJLyoKLQkJICogRklYTUU6IHRoaXMgaXMgYWN0dWFsbHkg
ZHV0eSBvZiB0aGUgSS9PIHN1Yi1zeXN0ZW0gdG8KLQkJICogaW5pdGlhbGl6ZSB0aGlzLCBidXQg
TVREIGRvZXMgbm90IHByb3ZpZGUgZW5vdWdoCi0JCSAqIGluZm9ybWF0aW9uLgotCQkgKi8KLQkJ
c2ktPmJhZF9wZWJfY291bnQgKz0gMTsKLQkJcmV0dXJuIDA7Ci0JfQotCi0JZXJyID0gdWJpX2lv
X3JlYWRfZWNfaGRyKHViaSwgcG51bSwgZWNoLCAwKTsKLQlpZiAoZXJyIDwgMCkKLQkJcmV0dXJu
IGVycjsKLQlzd2l0Y2ggKGVycikgewotCWNhc2UgMDoKLQkJYnJlYWs7Ci0JY2FzZSBVQklfSU9f
QklURkxJUFM6Ci0JCWJpdGZsaXBzID0gMTsKLQkJYnJlYWs7Ci0JY2FzZSBVQklfSU9fRkY6Ci0J
CXNpLT5lbXB0eV9wZWJfY291bnQgKz0gMTsKLQkJcmV0dXJuIGFkZF90b19saXN0KHNpLCBwbnVt
LCBVQklfU0NBTl9VTktOT1dOX0VDLCAwLAotCQkJCSAgICZzaS0+ZXJhc2UpOwotCWNhc2UgVUJJ
X0lPX0ZGX0JJVEZMSVBTOgotCQlzaS0+ZW1wdHlfcGViX2NvdW50ICs9IDE7Ci0JCXJldHVybiBh
ZGRfdG9fbGlzdChzaSwgcG51bSwgVUJJX1NDQU5fVU5LTk9XTl9FQywgMSwKLQkJCQkgICAmc2kt
PmVyYXNlKTsKLQljYXNlIFVCSV9JT19CQURfSERSX0VCQURNU0c6Ci0JY2FzZSBVQklfSU9fQkFE
X0hEUjoKLQkJLyoKLQkJICogV2UgaGF2ZSB0byBhbHNvIGxvb2sgYXQgdGhlIFZJRCBoZWFkZXIs
IHBvc3NpYmx5IGl0IGlzIG5vdAotCQkgKiBjb3JydXB0ZWQuIFNldCAlYml0ZmxpcHMgZmxhZyBp
biBvcmRlciB0byBtYWtlIHRoaXMgUEVCIGJlCi0JCSAqIG1vdmVkIGFuZCBFQyBiZSByZS1jcmVh
dGVkLgotCQkgKi8KLQkJZWNfZXJyID0gZXJyOwotCQllYyA9IFVCSV9TQ0FOX1VOS05PV05fRUM7
Ci0JCWJpdGZsaXBzID0gMTsKLQkJYnJlYWs7Ci0JZGVmYXVsdDoKLQkJdWJpX2VycigiJ3ViaV9p
b19yZWFkX2VjX2hkcigpJyByZXR1cm5lZCB1bmtub3duIGNvZGUgJWQiLCBlcnIpOwotCQlyZXR1
cm4gLUVJTlZBTDsKLQl9Ci0KLQlpZiAoIWVjX2VycikgewotCQlpbnQgaW1hZ2Vfc2VxOwotCi0J
CS8qIE1ha2Ugc3VyZSBVQkkgdmVyc2lvbiBpcyBPSyAqLwotCQlpZiAoZWNoLT52ZXJzaW9uICE9
IFVCSV9WRVJTSU9OKSB7Ci0JCQl1YmlfZXJyKCJ0aGlzIFVCSSB2ZXJzaW9uIGlzICVkLCBpbWFn
ZSB2ZXJzaW9uIGlzICVkIiwKLQkJCQlVQklfVkVSU0lPTiwgKGludCllY2gtPnZlcnNpb24pOwot
CQkJcmV0dXJuIC1FSU5WQUw7Ci0JCX0KLQotCQllYyA9IGJlNjRfdG9fY3B1KGVjaC0+ZWMpOwot
CQlpZiAoZWMgPiBVQklfTUFYX0VSQVNFQ09VTlRFUikgewotCQkJLyoKLQkJCSAqIEVyYXNlIGNv
dW50ZXIgb3ZlcmZsb3cuIFRoZSBFQyBoZWFkZXJzIGhhdmUgNjQgYml0cwotCQkJICogcmVzZXJ2
ZWQsIGJ1dCB3ZSBhbnl3YXkgbWFrZSB1c2Ugb2Ygb25seSAzMSBiaXQKLQkJCSAqIHZhbHVlcywg
YXMgdGhpcyBzZWVtcyB0byBiZSBlbm91Z2ggZm9yIGFueSBleGlzdGluZwotCQkJICogZmxhc2gu
IFVwZ3JhZGUgVUJJIGFuZCB1c2UgNjQtYml0IGVyYXNlIGNvdW50ZXJzCi0JCQkgKiBpbnRlcm5h
bGx5LgotCQkJICovCi0JCQl1YmlfZXJyKCJlcmFzZSBjb3VudGVyIG92ZXJmbG93LCBtYXggaXMg
JWQiLAotCQkJCVVCSV9NQVhfRVJBU0VDT1VOVEVSKTsKLQkJCXViaV9kYmdfZHVtcF9lY19oZHIo
ZWNoKTsKLQkJCXJldHVybiAtRUlOVkFMOwotCQl9Ci0KLQkJLyoKLQkJICogTWFrZSBzdXJlIHRo
YXQgYWxsIFBFQnMgaGF2ZSB0aGUgc2FtZSBpbWFnZSBzZXF1ZW5jZSBudW1iZXIuCi0JCSAqIFRo
aXMgYWxsb3dzIHVzIHRvIGRldGVjdCBzaXR1YXRpb25zIHdoZW4gdXNlcnMgZmxhc2ggVUJJCi0J
CSAqIGltYWdlcyBpbmNvcnJlY3RseSwgc28gdGhhdCB0aGUgZmxhc2ggaGFzIHRoZSBuZXcgVUJJ
IGltYWdlCi0JCSAqIGFuZCBsZWZ0b3ZlcnMgZnJvbSB0aGUgb2xkIG9uZS4gVGhpcyBmZWF0dXJl
IHdhcyBhZGRlZAotCQkgKiByZWxhdGl2ZWx5IHJlY2VudGx5LCBhbmQgdGhlIHNlcXVlbmNlIG51
bWJlciB3YXMgYWx3YXlzCi0JCSAqIHplcm8sIGJlY2F1c2Ugb2xkIFVCSSBpbXBsZW1lbnRhdGlv
bnMgYWx3YXlzIHNldCBpdCB0byB6ZXJvLgotCQkgKiBGb3IgdGhpcyByZWFzb25zLCB3ZSBkbyBu
b3QgcGFuaWMgaWYgc29tZSBQRUJzIGhhdmUgemVybwotCQkgKiBzZXF1ZW5jZSBudW1iZXIsIHdo
aWxlIG90aGVyIFBFQnMgaGF2ZSBub24temVybyBzZXF1ZW5jZQotCQkgKiBudW1iZXIuCi0JCSAq
LwotCQlpbWFnZV9zZXEgPSBiZTMyX3RvX2NwdShlY2gtPmltYWdlX3NlcSk7Ci0JCWlmICghdWJp
LT5pbWFnZV9zZXEgJiYgaW1hZ2Vfc2VxKQotCQkJdWJpLT5pbWFnZV9zZXEgPSBpbWFnZV9zZXE7
Ci0JCWlmICh1YmktPmltYWdlX3NlcSAmJiBpbWFnZV9zZXEgJiYKLQkJICAgIHViaS0+aW1hZ2Vf
c2VxICE9IGltYWdlX3NlcSkgewotCQkJdWJpX2VycigiYmFkIGltYWdlIHNlcXVlbmNlIG51bWJl
ciAlZCBpbiBQRUIgJWQsICIKLQkJCQkiZXhwZWN0ZWQgJWQiLCBpbWFnZV9zZXEsIHBudW0sIHVi
aS0+aW1hZ2Vfc2VxKTsKLQkJCXViaV9kYmdfZHVtcF9lY19oZHIoZWNoKTsKLQkJCXJldHVybiAt
RUlOVkFMOwotCQl9Ci0JfQotCi0JLyogT0ssIHdlJ3ZlIGRvbmUgd2l0aCB0aGUgRUMgaGVhZGVy
LCBsZXQncyBsb29rIGF0IHRoZSBWSUQgaGVhZGVyICovCi0KLQllcnIgPSB1YmlfaW9fcmVhZF92
aWRfaGRyKHViaSwgcG51bSwgdmlkaCwgMCk7Ci0JaWYgKGVyciA8IDApCi0JCXJldHVybiBlcnI7
Ci0Jc3dpdGNoIChlcnIpIHsKLQljYXNlIDA6Ci0JCWJyZWFrOwotCWNhc2UgVUJJX0lPX0JJVEZM
SVBTOgotCQliaXRmbGlwcyA9IDE7Ci0JCWJyZWFrOwotCWNhc2UgVUJJX0lPX0JBRF9IRFJfRUJB
RE1TRzoKLQkJaWYgKGVjX2VyciA9PSBVQklfSU9fQkFEX0hEUl9FQkFETVNHKQotCQkJLyoKLQkJ
CSAqIEJvdGggRUMgYW5kIFZJRCBoZWFkZXJzIGFyZSBjb3JydXB0ZWQgYW5kIHdlcmUgcmVhZAot
CQkJICogd2l0aCBkYXRhIGludGVncml0eSBlcnJvciwgcHJvYmFibHkgdGhpcyBpcyBhIGJhZAot
CQkJICogUEVCLCBiaXQgaXQgaXMgbm90IG1hcmtlZCBhcyBiYWQgeWV0LiBUaGlzIG1heSBhbHNv
Ci0JCQkgKiBiZSBhIHJlc3VsdCBvZiBwb3dlciBjdXQgZHVyaW5nIGVyYXN1cmUuCi0JCQkgKi8K
LQkJCXNpLT5tYXliZV9iYWRfcGViX2NvdW50ICs9IDE7Ci0JY2FzZSBVQklfSU9fQkFEX0hEUjoK
LQkJaWYgKGVjX2VycikKLQkJCS8qCi0JCQkgKiBCb3RoIGhlYWRlcnMgYXJlIGNvcnJ1cHRlZC4g
VGhlcmUgaXMgYSBwb3NzaWJpbGl0eQotCQkJICogdGhhdCB0aGlzIGEgdmFsaWQgVUJJIFBFQiB3
aGljaCBoYXMgY29ycmVzcG9uZGluZwotCQkJICogTEVCLCBidXQgdGhlIGhlYWRlcnMgYXJlIGNv
cnJ1cHRlZC4gSG93ZXZlciwgaXQgaXMKLQkJCSAqIGltcG9zc2libGUgdG8gZGlzdGluZ3Vpc2gg
aXQgZnJvbSBhIFBFQiB3aGljaCBqdXN0Ci0JCQkgKiBjb250YWlucyBnYXJiYWdlIGJlY2F1c2Ug
b2YgYSBwb3dlciBjdXQgZHVyaW5nIGVyYXNlCi0JCQkgKiBvcGVyYXRpb24uIFNvIHdlIGp1c3Qg
c2NoZWR1bGUgdGhpcyBQRUIgZm9yIGVyYXN1cmUuCi0JCQkgKgotCQkJICogQmVzaWRlcywgaW4g
Y2FzZSBvZiBOT1IgZmxhc2gsIHdlIGRlbGliZXJhdGVseQotCQkJICogY29ycnVwdCBib3RoIGhl
YWRlcnMgYmVjYXVzZSBOT1IgZmxhc2ggZXJhc3VyZSBpcwotCQkJICogc2xvdyBhbmQgY2FuIHN0
YXJ0IGZyb20gdGhlIGVuZC4KLQkJCSAqLwotCQkJZXJyID0gMDsKLQkJZWxzZQotCQkJLyoKLQkJ
CSAqIFRoZSBFQyB3YXMgT0ssIGJ1dCB0aGUgVklEIGhlYWRlciBpcyBjb3JydXB0ZWQuIFdlCi0J
CQkgKiBoYXZlIHRvIGNoZWNrIHdoYXQgaXMgaW4gdGhlIGRhdGEgYXJlYS4KLQkJCSAqLwotCQkJ
ZXJyID0gY2hlY2tfY29ycnVwdGlvbih1YmksIHZpZGgsIHBudW0pOwotCi0JCWlmIChlcnIgPCAw
KQotCQkJcmV0dXJuIGVycjsKLQkJZWxzZSBpZiAoIWVycikKLQkJCS8qIFRoaXMgY29ycnVwdGlv
biBpcyBjYXVzZWQgYnkgYSBwb3dlciBjdXQgKi8KLQkJCWVyciA9IGFkZF90b19saXN0KHNpLCBw
bnVtLCBlYywgMSwgJnNpLT5lcmFzZSk7Ci0JCWVsc2UKLQkJCS8qIFRoaXMgaXMgYW4gdW5leHBl
Y3RlZCBjb3JydXB0aW9uICovCi0JCQllcnIgPSBhZGRfY29ycnVwdGVkKHNpLCBwbnVtLCBlYyk7
Ci0JCWlmIChlcnIpCi0JCQlyZXR1cm4gZXJyOwotCQlnb3RvIGFkanVzdF9tZWFuX2VjOwotCWNh
c2UgVUJJX0lPX0ZGX0JJVEZMSVBTOgotCQllcnIgPSBhZGRfdG9fbGlzdChzaSwgcG51bSwgZWMs
IDEsICZzaS0+ZXJhc2UpOwotCQlpZiAoZXJyKQotCQkJcmV0dXJuIGVycjsKLQkJZ290byBhZGp1
c3RfbWVhbl9lYzsKLQljYXNlIFVCSV9JT19GRjoKLQkJaWYgKGVjX2VycikKLQkJCWVyciA9IGFk
ZF90b19saXN0KHNpLCBwbnVtLCBlYywgMSwgJnNpLT5lcmFzZSk7Ci0JCWVsc2UKLQkJCWVyciA9
IGFkZF90b19saXN0KHNpLCBwbnVtLCBlYywgMCwgJnNpLT5mcmVlKTsKLQkJaWYgKGVycikKLQkJ
CXJldHVybiBlcnI7Ci0JCWdvdG8gYWRqdXN0X21lYW5fZWM7Ci0JZGVmYXVsdDoKLQkJdWJpX2Vy
cigiJ3ViaV9pb19yZWFkX3ZpZF9oZHIoKScgcmV0dXJuZWQgdW5rbm93biBjb2RlICVkIiwKLQkJ
CWVycik7Ci0JCXJldHVybiAtRUlOVkFMOwotCX0KLQotCXZvbF9pZCA9IGJlMzJfdG9fY3B1KHZp
ZGgtPnZvbF9pZCk7Ci0JaWYgKHZvbF9pZCA+IFVCSV9NQVhfVk9MVU1FUyAmJiB2b2xfaWQgIT0g
VUJJX0xBWU9VVF9WT0xVTUVfSUQpIHsKLQkJaW50IGxudW0gPSBiZTMyX3RvX2NwdSh2aWRoLT5s
bnVtKTsKLQotCQkvKiBVbnN1cHBvcnRlZCBpbnRlcm5hbCB2b2x1bWUgKi8KLQkJc3dpdGNoICh2
aWRoLT5jb21wYXQpIHsKLQkJY2FzZSBVQklfQ09NUEFUX0RFTEVURToKLQkJCXViaV9tc2coIlwi
ZGVsZXRlXCIgY29tcGF0aWJsZSBpbnRlcm5hbCB2b2x1bWUgJWQ6JWQiCi0JCQkJIiBmb3VuZCwg
d2lsbCByZW1vdmUgaXQiLCB2b2xfaWQsIGxudW0pOwotCQkJZXJyID0gYWRkX3RvX2xpc3Qoc2ks
IHBudW0sIGVjLCAxLCAmc2ktPmVyYXNlKTsKLQkJCWlmIChlcnIpCi0JCQkJcmV0dXJuIGVycjsK
LQkJCXJldHVybiAwOwotCi0JCWNhc2UgVUJJX0NPTVBBVF9STzoKLQkJCXViaV9tc2coInJlYWQt
b25seSBjb21wYXRpYmxlIGludGVybmFsIHZvbHVtZSAlZDolZCIKLQkJCQkiIGZvdW5kLCBzd2l0
Y2ggdG8gcmVhZC1vbmx5IG1vZGUiLAotCQkJCXZvbF9pZCwgbG51bSk7Ci0JCQl1YmktPnJvX21v
ZGUgPSAxOwotCQkJYnJlYWs7Ci0KLQkJY2FzZSBVQklfQ09NUEFUX1BSRVNFUlZFOgotCQkJdWJp
X21zZygiXCJwcmVzZXJ2ZVwiIGNvbXBhdGlibGUgaW50ZXJuYWwgdm9sdW1lICVkOiVkIgotCQkJ
CSIgZm91bmQiLCB2b2xfaWQsIGxudW0pOwotCQkJZXJyID0gYWRkX3RvX2xpc3Qoc2ksIHBudW0s
IGVjLCAwLCAmc2ktPmFsaWVuKTsKLQkJCWlmIChlcnIpCi0JCQkJcmV0dXJuIGVycjsKLQkJCXJl
dHVybiAwOwotCi0JCWNhc2UgVUJJX0NPTVBBVF9SRUpFQ1Q6Ci0JCQl1YmlfZXJyKCJpbmNvbXBh
dGlibGUgaW50ZXJuYWwgdm9sdW1lICVkOiVkIGZvdW5kIiwKLQkJCQl2b2xfaWQsIGxudW0pOwot
CQkJcmV0dXJuIC1FSU5WQUw7Ci0JCX0KLQl9Ci0KLQlpZiAoZWNfZXJyKQotCQl1Ymlfd2Fybigi
dmFsaWQgVklEIGhlYWRlciBidXQgY29ycnVwdGVkIEVDIGhlYWRlciBhdCBQRUIgJWQiLAotCQkJ
IHBudW0pOwotCWVyciA9IHViaV9zY2FuX2FkZF91c2VkKHViaSwgc2ksIHBudW0sIGVjLCB2aWRo
LCBiaXRmbGlwcyk7Ci0JaWYgKGVycikKLQkJcmV0dXJuIGVycjsKLQotYWRqdXN0X21lYW5fZWM6
Ci0JaWYgKCFlY19lcnIpIHsKLQkJc2ktPmVjX3N1bSArPSBlYzsKLQkJc2ktPmVjX2NvdW50ICs9
IDE7Ci0JCWlmIChlYyA+IHNpLT5tYXhfZWMpCi0JCQlzaS0+bWF4X2VjID0gZWM7Ci0JCWlmIChl
YyA8IHNpLT5taW5fZWMpCi0JCQlzaS0+bWluX2VjID0gZWM7Ci0JfQotCi0JcmV0dXJuIDA7Ci19
Ci0KLS8qKgotICogY2hlY2tfd2hhdF93ZV9oYXZlIC0gY2hlY2sgd2hhdCBQRUIgd2VyZSBmb3Vu
ZCBieSBzY2FubmluZy4KLSAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0Ci0g
KiBAc2k6IHNjYW5uaW5nIGluZm9ybWF0aW9uCi0gKgotICogVGhpcyBpcyBhIGhlbHBlciBmdW5j
dGlvbiB3aGljaCB0YWtlcyBhIGxvb2sgd2hhdCBQRUJzIHdlcmUgZm91bmQgYnkKLSAqIHNjYW5u
aW5nLCBhbmQgZGVjaWRlcyB3aGV0aGVyIHRoZSBmbGFzaCBpcyBlbXB0eSBhbmQgc2hvdWxkIGJl
IGZvcm1hdHRlZCBhbmQKLSAqIHdoZXRoZXIgdGhlcmUgYXJlIHRvbyBtYW55IGNvcnJ1cHRlZCBQ
RUJzIGFuZCB3ZSBzaG91bGQgbm90IGF0dGFjaCB0aGlzCi0gKiBNVEQgZGV2aWNlLiBSZXR1cm5z
IHplcm8gaWYgd2Ugc2hvdWxkIHByb2NlZWQgd2l0aCBhdHRhY2hpbmcgdGhlIE1URCBkZXZpY2Us
Ci0gKiBhbmQgJS1FSU5WQUwgaWYgd2Ugc2hvdWxkIG5vdC4KLSAqLwotc3RhdGljIGludCBjaGVj
a193aGF0X3dlX2hhdmUoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV9zY2FuX2lu
Zm8gKnNpKQotewotCXN0cnVjdCB1Ymlfc2Nhbl9sZWIgKnNlYjsKLQlpbnQgbWF4X2NvcnIsIHBl
Yl9jb3VudDsKLQotCXBlYl9jb3VudCA9IHViaS0+cGViX2NvdW50IC0gc2ktPmJhZF9wZWJfY291
bnQgLSBzaS0+YWxpZW5fcGViX2NvdW50OwotCW1heF9jb3JyID0gcGViX2NvdW50IC8gMjAgPzog
ODsKLQotCS8qCi0JICogRmV3IGNvcnJ1cHRlZCBQRUJzIGlzIG5vdCBhIHByb2JsZW0gYW5kIG1h
eSBiZSBqdXN0IGEgcmVzdWx0IG9mCi0JICogdW5jbGVhbiByZWJvb3RzLiBIb3dldmVyLCBtYW55
IG9mIHRoZW0gbWF5IGluZGljYXRlIHNvbWUgcHJvYmxlbXMKLQkgKiB3aXRoIHRoZSBmbGFzaCBI
VyBvciBkcml2ZXIuCi0JICovCi0JaWYgKHNpLT5jb3JyX3BlYl9jb3VudCkgewotCQl1YmlfZXJy
KCIlZCBQRUJzIGFyZSBjb3JydXB0ZWQgYW5kIHByZXNlcnZlZCIsCi0JCQlzaS0+Y29ycl9wZWJf
Y291bnQpOwotCQlwcmludGsoS0VSTl9FUlIgIkNvcnJ1cHRlZCBQRUJzIGFyZToiKTsKLQkJbGlz
dF9mb3JfZWFjaF9lbnRyeShzZWIsICZzaS0+Y29yciwgdS5saXN0KQotCQkJcHJpbnRrKEtFUk5f
Q09OVCAiICVkIiwgc2ViLT5wbnVtKTsKLQkJcHJpbnRrKEtFUk5fQ09OVCAiXG4iKTsKLQotCQkv
KgotCQkgKiBJZiB0b28gbWFueSBQRUJzIGFyZSBjb3JydXB0ZWQsIHdlIHJlZnVzZSBhdHRhY2hp
bmcsCi0JCSAqIG90aGVyd2lzZSwgb25seSBwcmludCBhIHdhcm5pbmcuCi0JCSAqLwotCQlpZiAo
c2ktPmNvcnJfcGViX2NvdW50ID49IG1heF9jb3JyKSB7Ci0JCQl1YmlfZXJyKCJ0b28gbWFueSBj
b3JydXB0ZWQgUEVCcywgcmVmdXNpbmciKTsKLQkJCXJldHVybiAtRUlOVkFMOwotCQl9Ci0JfQot
Ci0JaWYgKHNpLT5lbXB0eV9wZWJfY291bnQgKyBzaS0+bWF5YmVfYmFkX3BlYl9jb3VudCA9PSBw
ZWJfY291bnQpIHsKLQkJLyoKLQkJICogQWxsIFBFQnMgYXJlIGVtcHR5LCBvciBhbG1vc3QgYWxs
IC0gYSBjb3VwbGUgUEVCcyBsb29rIGxpa2UKLQkJICogdGhleSBtYXkgYmUgYmFkIFBFQnMgd2hp
Y2ggd2VyZSBub3QgbWFya2VkIGFzIGJhZCB5ZXQuCi0JCSAqCi0JCSAqIFRoaXMgcGllY2Ugb2Yg
Y29kZSBiYXNpY2FsbHkgdHJpZXMgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbgotCQkgKiB0aGUgZm9s
bG93aW5nIHNpdHVhdGlvbnM6Ci0JCSAqCi0JCSAqIDEuIEZsYXNoIGlzIGVtcHR5LCBidXQgdGhl
cmUgYXJlIGZldyBiYWQgUEVCcywgd2hpY2ggYXJlIG5vdAotCQkgKiAgICBtYXJrZWQgYXMgYmFk
IHNvIGZhciwgYW5kIHdoaWNoIHdlcmUgcmVhZCB3aXRoIGVycm9yLiBXZQotCQkgKiAgICB3YW50
IHRvIGdvIGFoZWFkIGFuZCBmb3JtYXQgdGhpcyBmbGFzaC4gV2hpbGUgZm9ybWF0dGluZywKLQkJ
ICogICAgdGhlIGZhdWx0eSBQRUJzIHdpbGwgcHJvYmFibHkgYmUgbWFya2VkIGFzIGJhZC4KLQkJ
ICoKLQkJICogMi4gRmxhc2ggY29udGFpbnMgbm9uLVVCSSBkYXRhIGFuZCB3ZSBkbyBub3Qgd2Fu
dCB0byBmb3JtYXQKLQkJICogICAgaXQgYW5kIGRlc3Ryb3kgcG9zc2libHkgaW1wb3J0YW50IGlu
Zm9ybWF0aW9uLgotCQkgKi8KLQkJaWYgKHNpLT5tYXliZV9iYWRfcGViX2NvdW50IDw9IDIpIHsK
LQkJCXNpLT5pc19lbXB0eSA9IDE7Ci0JCQl1YmlfbXNnKCJlbXB0eSBNVEQgZGV2aWNlIGRldGVj
dGVkIik7Ci0JCQlnZXRfcmFuZG9tX2J5dGVzKCZ1YmktPmltYWdlX3NlcSwKLQkJCQkJIHNpemVv
Zih1YmktPmltYWdlX3NlcSkpOwotCQl9IGVsc2UgewotCQkJdWJpX2VycigiTVREIGRldmljZSBp
cyBub3QgVUJJLWZvcm1hdHRlZCBhbmQgcG9zc2libHkgIgotCQkJCSJjb250YWlucyBub24tVUJJ
IGRhdGEgLSByZWZ1c2luZyBpdCIpOwotCQkJcmV0dXJuIC1FSU5WQUw7Ci0JCX0KLQotCX0KLQot
CXJldHVybiAwOwotfQotCi0vKioKLSAqIHViaV9zY2FuIC0gc2NhbiBhbiBNVEQgZGV2aWNlLgot
ICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKLSAqCi0gKiBUaGlzIGZ1bmN0
aW9uIGRvZXMgZnVsbCBzY2FubmluZyBvZiBhbiBNVEQgZGV2aWNlIGFuZCByZXR1cm5zIGNvbXBs
ZXRlCi0gKiBpbmZvcm1hdGlvbiBhYm91dCBpdC4gSW4gY2FzZSBvZiBmYWlsdXJlLCBhbiBlcnJv
ciBjb2RlIGlzIHJldHVybmVkLgotICovCi1zdHJ1Y3QgdWJpX3NjYW5faW5mbyAqdWJpX3NjYW4o
c3RydWN0IHViaV9kZXZpY2UgKnViaSkKLXsKLQlpbnQgZXJyLCBwbnVtOwotCXN0cnVjdCByYl9u
b2RlICpyYjEsICpyYjI7Ci0Jc3RydWN0IHViaV9zY2FuX3ZvbHVtZSAqc3Y7Ci0Jc3RydWN0IHVi
aV9zY2FuX2xlYiAqc2ViOwotCXN0cnVjdCB1Ymlfc2Nhbl9pbmZvICpzaTsKLQotCXNpID0ga3ph
bGxvYyhzaXplb2Yoc3RydWN0IHViaV9zY2FuX2luZm8pLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXNp
KQotCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKLQotCUlOSVRfTElTVF9IRUFEKCZzaS0+Y29y
cik7Ci0JSU5JVF9MSVNUX0hFQUQoJnNpLT5mcmVlKTsKLQlJTklUX0xJU1RfSEVBRCgmc2ktPmVy
YXNlKTsKLQlJTklUX0xJU1RfSEVBRCgmc2ktPmFsaWVuKTsKLQlzaS0+dm9sdW1lcyA9IFJCX1JP
T1Q7Ci0KLQllcnIgPSAtRU5PTUVNOwotCXNpLT5zY2FuX2xlYl9zbGFiID0ga21lbV9jYWNoZV9j
cmVhdGUoInViaV9zY2FuX2xlYl9zbGFiIiwKLQkJCQkJICAgICAgc2l6ZW9mKHN0cnVjdCB1Ymlf
c2Nhbl9sZWIpLAotCQkJCQkgICAgICAwLCAwLCBOVUxMKTsKLQlpZiAoIXNpLT5zY2FuX2xlYl9z
bGFiKQotCQlnb3RvIG91dF9zaTsKLQotCWVjaCA9IGt6YWxsb2ModWJpLT5lY19oZHJfYWxzaXpl
LCBHRlBfS0VSTkVMKTsKLQlpZiAoIWVjaCkKLQkJZ290byBvdXRfc2xhYjsKLQotCXZpZGggPSB1
YmlfemFsbG9jX3ZpZF9oZHIodWJpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXZpZGgpCi0JCWdvdG8g
b3V0X2VjaDsKLQotCWZvciAocG51bSA9IDA7IHBudW0gPCB1YmktPnBlYl9jb3VudDsgcG51bSsr
KSB7Ci0JCWNvbmRfcmVzY2hlZCgpOwotCi0JCWRiZ19nZW4oInByb2Nlc3MgUEVCICVkIiwgcG51
bSk7Ci0JCWVyciA9IHByb2Nlc3NfZWIodWJpLCBzaSwgcG51bSk7Ci0JCWlmIChlcnIgPCAwKQot
CQkJZ290byBvdXRfdmlkaDsKLQl9Ci0KLQlkYmdfbXNnKCJzY2FubmluZyBpcyBmaW5pc2hlZCIp
OwotCi0JLyogQ2FsY3VsYXRlIG1lYW4gZXJhc2UgY291bnRlciAqLwotCWlmIChzaS0+ZWNfY291
bnQpCi0JCXNpLT5tZWFuX2VjID0gZGl2X3U2NChzaS0+ZWNfc3VtLCBzaS0+ZWNfY291bnQpOwot
Ci0JZXJyID0gY2hlY2tfd2hhdF93ZV9oYXZlKHViaSwgc2kpOwotCWlmIChlcnIpCi0JCWdvdG8g
b3V0X3ZpZGg7Ci0KLQkvKgotCSAqIEluIGNhc2Ugb2YgdW5rbm93biBlcmFzZSBjb3VudGVyIHdl
IHVzZSB0aGUgbWVhbiBlcmFzZSBjb3VudGVyCi0JICogdmFsdWUuCi0JICovCi0JdWJpX3JiX2Zv
cl9lYWNoX2VudHJ5KHJiMSwgc3YsICZzaS0+dm9sdW1lcywgcmIpIHsKLQkJdWJpX3JiX2Zvcl9l
YWNoX2VudHJ5KHJiMiwgc2ViLCAmc3YtPnJvb3QsIHUucmIpCi0JCQlpZiAoc2ViLT5lYyA9PSBV
QklfU0NBTl9VTktOT1dOX0VDKQotCQkJCXNlYi0+ZWMgPSBzaS0+bWVhbl9lYzsKLQl9Ci0KLQls
aXN0X2Zvcl9lYWNoX2VudHJ5KHNlYiwgJnNpLT5mcmVlLCB1Lmxpc3QpIHsKLQkJaWYgKHNlYi0+
ZWMgPT0gVUJJX1NDQU5fVU5LTk9XTl9FQykKLQkJCXNlYi0+ZWMgPSBzaS0+bWVhbl9lYzsKLQl9
Ci0KLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KHNlYiwgJnNpLT5jb3JyLCB1Lmxpc3QpCi0JCWlmIChz
ZWItPmVjID09IFVCSV9TQ0FOX1VOS05PV05fRUMpCi0JCQlzZWItPmVjID0gc2ktPm1lYW5fZWM7
Ci0KLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KHNlYiwgJnNpLT5lcmFzZSwgdS5saXN0KQotCQlpZiAo
c2ViLT5lYyA9PSBVQklfU0NBTl9VTktOT1dOX0VDKQotCQkJc2ViLT5lYyA9IHNpLT5tZWFuX2Vj
OwotCi0JZXJyID0gcGFyYW5vaWRfY2hlY2tfc2kodWJpLCBzaSk7Ci0JaWYgKGVycikKLQkJZ290
byBvdXRfdmlkaDsKLQotCXViaV9mcmVlX3ZpZF9oZHIodWJpLCB2aWRoKTsKLQlrZnJlZShlY2gp
OwotCi0JcmV0dXJuIHNpOwotCi1vdXRfdmlkaDoKLQl1YmlfZnJlZV92aWRfaGRyKHViaSwgdmlk
aCk7Ci1vdXRfZWNoOgotCWtmcmVlKGVjaCk7Ci1vdXRfc2xhYjoKLQlrbWVtX2NhY2hlX2Rlc3Ry
b3koc2ktPnNjYW5fbGViX3NsYWIpOwotb3V0X3NpOgotCXViaV9zY2FuX2Rlc3Ryb3lfc2koc2kp
OwotCXJldHVybiBFUlJfUFRSKGVycik7Ci19Ci0KLS8qKgotICogZGVzdHJveV9zdiAtIGZyZWUg
dGhlIHNjYW5uaW5nIHZvbHVtZSBpbmZvcm1hdGlvbgotICogQHN2OiBzY2FubmluZyB2b2x1bWUg
aW5mb3JtYXRpb24KLSAqIEBzaTogc2Nhbm5pbmcgaW5mb3JtYXRpb24KLSAqCi0gKiBUaGlzIGZ1
bmN0aW9uIGRlc3Ryb3lzIHRoZSB2b2x1bWUgUkItdHJlZSAoQHN2LT5yb290KSBhbmQgdGhlIHNj
YW5uaW5nCi0gKiB2b2x1bWUgaW5mb3JtYXRpb24uCi0gKi8KLXN0YXRpYyB2b2lkIGRlc3Ryb3lf
c3Yoc3RydWN0IHViaV9zY2FuX2luZm8gKnNpLCBzdHJ1Y3QgdWJpX3NjYW5fdm9sdW1lICpzdikK
LXsKLQlzdHJ1Y3QgdWJpX3NjYW5fbGViICpzZWI7Ci0Jc3RydWN0IHJiX25vZGUgKnRoaXMgPSBz
di0+cm9vdC5yYl9ub2RlOwotCi0Jd2hpbGUgKHRoaXMpIHsKLQkJaWYgKHRoaXMtPnJiX2xlZnQp
Ci0JCQl0aGlzID0gdGhpcy0+cmJfbGVmdDsKLQkJZWxzZSBpZiAodGhpcy0+cmJfcmlnaHQpCi0J
CQl0aGlzID0gdGhpcy0+cmJfcmlnaHQ7Ci0JCWVsc2UgewotCQkJc2ViID0gcmJfZW50cnkodGhp
cywgc3RydWN0IHViaV9zY2FuX2xlYiwgdS5yYik7Ci0JCQl0aGlzID0gcmJfcGFyZW50KHRoaXMp
OwotCQkJaWYgKHRoaXMpIHsKLQkJCQlpZiAodGhpcy0+cmJfbGVmdCA9PSAmc2ViLT51LnJiKQot
CQkJCQl0aGlzLT5yYl9sZWZ0ID0gTlVMTDsKLQkJCQllbHNlCi0JCQkJCXRoaXMtPnJiX3JpZ2h0
ID0gTlVMTDsKLQkJCX0KLQotCQkJa21lbV9jYWNoZV9mcmVlKHNpLT5zY2FuX2xlYl9zbGFiLCBz
ZWIpOwotCQl9Ci0JfQotCWtmcmVlKHN2KTsKLX0KLQotLyoqCi0gKiB1Ymlfc2Nhbl9kZXN0cm95
X3NpIC0gZGVzdHJveSBzY2FubmluZyBpbmZvcm1hdGlvbi4KLSAqIEBzaTogc2Nhbm5pbmcgaW5m
b3JtYXRpb24KLSAqLwotdm9pZCB1Ymlfc2Nhbl9kZXN0cm95X3NpKHN0cnVjdCB1Ymlfc2Nhbl9p
bmZvICpzaSkKLXsKLQlzdHJ1Y3QgdWJpX3NjYW5fbGViICpzZWIsICpzZWJfdG1wOwotCXN0cnVj
dCB1Ymlfc2Nhbl92b2x1bWUgKnN2OwotCXN0cnVjdCByYl9ub2RlICpyYjsKLQotCWxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZShzZWIsIHNlYl90bXAsICZzaS0+YWxpZW4sIHUubGlzdCkgewotCQls
aXN0X2RlbCgmc2ViLT51Lmxpc3QpOwotCQlrbWVtX2NhY2hlX2ZyZWUoc2ktPnNjYW5fbGViX3Ns
YWIsIHNlYik7Ci0JfQotCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShzZWIsIHNlYl90bXAsICZz
aS0+ZXJhc2UsIHUubGlzdCkgewotCQlsaXN0X2RlbCgmc2ViLT51Lmxpc3QpOwotCQlrbWVtX2Nh
Y2hlX2ZyZWUoc2ktPnNjYW5fbGViX3NsYWIsIHNlYik7Ci0JfQotCWxpc3RfZm9yX2VhY2hfZW50
cnlfc2FmZShzZWIsIHNlYl90bXAsICZzaS0+Y29yciwgdS5saXN0KSB7Ci0JCWxpc3RfZGVsKCZz
ZWItPnUubGlzdCk7Ci0JCWttZW1fY2FjaGVfZnJlZShzaS0+c2Nhbl9sZWJfc2xhYiwgc2ViKTsK
LQl9Ci0JbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHNlYiwgc2ViX3RtcCwgJnNpLT5mcmVlLCB1
Lmxpc3QpIHsKLQkJbGlzdF9kZWwoJnNlYi0+dS5saXN0KTsKLQkJa21lbV9jYWNoZV9mcmVlKHNp
LT5zY2FuX2xlYl9zbGFiLCBzZWIpOwotCX0KLQotCS8qIERlc3Ryb3kgdGhlIHZvbHVtZSBSQi10
cmVlICovCi0JcmIgPSBzaS0+dm9sdW1lcy5yYl9ub2RlOwotCXdoaWxlIChyYikgewotCQlpZiAo
cmItPnJiX2xlZnQpCi0JCQlyYiA9IHJiLT5yYl9sZWZ0OwotCQllbHNlIGlmIChyYi0+cmJfcmln
aHQpCi0JCQlyYiA9IHJiLT5yYl9yaWdodDsKLQkJZWxzZSB7Ci0JCQlzdiA9IHJiX2VudHJ5KHJi
LCBzdHJ1Y3QgdWJpX3NjYW5fdm9sdW1lLCByYik7Ci0KLQkJCXJiID0gcmJfcGFyZW50KHJiKTsK
LQkJCWlmIChyYikgewotCQkJCWlmIChyYi0+cmJfbGVmdCA9PSAmc3YtPnJiKQotCQkJCQlyYi0+
cmJfbGVmdCA9IE5VTEw7Ci0JCQkJZWxzZQotCQkJCQlyYi0+cmJfcmlnaHQgPSBOVUxMOwotCQkJ
fQotCi0JCQlkZXN0cm95X3N2KHNpLCBzdik7Ci0JCX0KLQl9Ci0KLQlrbWVtX2NhY2hlX2Rlc3Ry
b3koc2ktPnNjYW5fbGViX3NsYWIpOwotCWtmcmVlKHNpKTsKLX0KLQotI2lmZGVmIENPTkZJR19N
VERfVUJJX0RFQlVHCi0KLS8qKgotICogcGFyYW5vaWRfY2hlY2tfc2kgLSBjaGVjayB0aGUgc2Nh
bm5pbmcgaW5mb3JtYXRpb24uCi0gKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVj
dAotICogQHNpOiBzY2FubmluZyBpbmZvcm1hdGlvbgotICoKLSAqIFRoaXMgZnVuY3Rpb24gcmV0
dXJucyB6ZXJvIGlmIHRoZSBzY2FubmluZyBpbmZvcm1hdGlvbiBpcyBhbGwgcmlnaHQsIGFuZCBh
Ci0gKiBuZWdhdGl2ZSBlcnJvciBjb2RlIGlmIG5vdCBvciBpZiBhbiBlcnJvciBvY2N1cnJlZC4K
LSAqLwotc3RhdGljIGludCBwYXJhbm9pZF9jaGVja19zaShzdHJ1Y3QgdWJpX2RldmljZSAqdWJp
LCBzdHJ1Y3QgdWJpX3NjYW5faW5mbyAqc2kpCi17Ci0JaW50IHBudW0sIGVyciwgdm9sc19mb3Vu
ZCA9IDA7Ci0Jc3RydWN0IHJiX25vZGUgKnJiMSwgKnJiMjsKLQlzdHJ1Y3QgdWJpX3NjYW5fdm9s
dW1lICpzdjsKLQlzdHJ1Y3QgdWJpX3NjYW5fbGViICpzZWIsICpsYXN0X3NlYjsKLQl1aW50OF90
ICpidWY7Ci0KLQlpZiAoISh1YmlfY2hrX2ZsYWdzICYgVUJJX0NIS19HRU4pKQotCQlyZXR1cm4g
MDsKLQotCS8qCi0JICogQXQgZmlyc3QsIGNoZWNrIHRoYXQgc2Nhbm5pbmcgaW5mb3JtYXRpb24g
aXMgT0suCi0JICovCi0JdWJpX3JiX2Zvcl9lYWNoX2VudHJ5KHJiMSwgc3YsICZzaS0+dm9sdW1l
cywgcmIpIHsKLQkJaW50IGxlYl9jb3VudCA9IDA7Ci0KLQkJY29uZF9yZXNjaGVkKCk7Ci0KLQkJ
dm9sc19mb3VuZCArPSAxOwotCi0JCWlmIChzaS0+aXNfZW1wdHkpIHsKLQkJCXViaV9lcnIoImJh
ZCBpc19lbXB0eSBmbGFnIik7Ci0JCQlnb3RvIGJhZF9zdjsKLQkJfQotCi0JCWlmIChzdi0+dm9s
X2lkIDwgMCB8fCBzdi0+aGlnaGVzdF9sbnVtIDwgMCB8fAotCQkgICAgc3YtPmxlYl9jb3VudCA8
IDAgfHwgc3YtPnZvbF90eXBlIDwgMCB8fCBzdi0+dXNlZF9lYnMgPCAwIHx8Ci0JCSAgICBzdi0+
ZGF0YV9wYWQgPCAwIHx8IHN2LT5sYXN0X2RhdGFfc2l6ZSA8IDApIHsKLQkJCXViaV9lcnIoIm5l
Z2F0aXZlIHZhbHVlcyIpOwotCQkJZ290byBiYWRfc3Y7Ci0JCX0KLQotCQlpZiAoc3YtPnZvbF9p
ZCA+PSBVQklfTUFYX1ZPTFVNRVMgJiYKLQkJICAgIHN2LT52b2xfaWQgPCBVQklfSU5URVJOQUxf
Vk9MX1NUQVJUKSB7Ci0JCQl1YmlfZXJyKCJiYWQgdm9sX2lkIik7Ci0JCQlnb3RvIGJhZF9zdjsK
LQkJfQotCi0JCWlmIChzdi0+dm9sX2lkID4gc2ktPmhpZ2hlc3Rfdm9sX2lkKSB7Ci0JCQl1Ymlf
ZXJyKCJoaWdoZXN0X3ZvbF9pZCBpcyAlZCwgYnV0IHZvbF9pZCAlZCBpcyB0aGVyZSIsCi0JCQkJ
c2ktPmhpZ2hlc3Rfdm9sX2lkLCBzdi0+dm9sX2lkKTsKLQkJCWdvdG8gb3V0OwotCQl9Ci0KLQkJ
aWYgKHN2LT52b2xfdHlwZSAhPSBVQklfRFlOQU1JQ19WT0xVTUUgJiYKLQkJICAgIHN2LT52b2xf
dHlwZSAhPSBVQklfU1RBVElDX1ZPTFVNRSkgewotCQkJdWJpX2VycigiYmFkIHZvbF90eXBlIik7
Ci0JCQlnb3RvIGJhZF9zdjsKLQkJfQotCi0JCWlmIChzdi0+ZGF0YV9wYWQgPiB1YmktPmxlYl9z
aXplIC8gMikgewotCQkJdWJpX2VycigiYmFkIGRhdGFfcGFkIik7Ci0JCQlnb3RvIGJhZF9zdjsK
LQkJfQotCi0JCWxhc3Rfc2ViID0gTlVMTDsKLQkJdWJpX3JiX2Zvcl9lYWNoX2VudHJ5KHJiMiwg
c2ViLCAmc3YtPnJvb3QsIHUucmIpIHsKLQkJCWNvbmRfcmVzY2hlZCgpOwotCi0JCQlsYXN0X3Nl
YiA9IHNlYjsKLQkJCWxlYl9jb3VudCArPSAxOwotCi0JCQlpZiAoc2ViLT5wbnVtIDwgMCB8fCBz
ZWItPmVjIDwgMCkgewotCQkJCXViaV9lcnIoIm5lZ2F0aXZlIHZhbHVlcyIpOwotCQkJCWdvdG8g
YmFkX3NlYjsKLQkJCX0KLQotCQkJaWYgKHNlYi0+ZWMgPCBzaS0+bWluX2VjKSB7Ci0JCQkJdWJp
X2VycigiYmFkIHNpLT5taW5fZWMgKCVkKSwgJWQgZm91bmQiLAotCQkJCQlzaS0+bWluX2VjLCBz
ZWItPmVjKTsKLQkJCQlnb3RvIGJhZF9zZWI7Ci0JCQl9Ci0KLQkJCWlmIChzZWItPmVjID4gc2kt
Pm1heF9lYykgewotCQkJCXViaV9lcnIoImJhZCBzaS0+bWF4X2VjICglZCksICVkIGZvdW5kIiwK
LQkJCQkJc2ktPm1heF9lYywgc2ViLT5lYyk7Ci0JCQkJZ290byBiYWRfc2ViOwotCQkJfQotCi0J
CQlpZiAoc2ViLT5wbnVtID49IHViaS0+cGViX2NvdW50KSB7Ci0JCQkJdWJpX2VycigidG9vIGhp
Z2ggUEVCIG51bWJlciAlZCwgdG90YWwgUEVCcyAlZCIsCi0JCQkJCXNlYi0+cG51bSwgdWJpLT5w
ZWJfY291bnQpOwotCQkJCWdvdG8gYmFkX3NlYjsKLQkJCX0KLQotCQkJaWYgKHN2LT52b2xfdHlw
ZSA9PSBVQklfU1RBVElDX1ZPTFVNRSkgewotCQkJCWlmIChzZWItPmxudW0gPj0gc3YtPnVzZWRf
ZWJzKSB7Ci0JCQkJCXViaV9lcnIoImJhZCBsbnVtIG9yIHVzZWRfZWJzIik7Ci0JCQkJCWdvdG8g
YmFkX3NlYjsKLQkJCQl9Ci0JCQl9IGVsc2UgewotCQkJCWlmIChzdi0+dXNlZF9lYnMgIT0gMCkg
ewotCQkJCQl1YmlfZXJyKCJub24temVybyB1c2VkX2VicyIpOwotCQkJCQlnb3RvIGJhZF9zZWI7
Ci0JCQkJfQotCQkJfQotCi0JCQlpZiAoc2ViLT5sbnVtID4gc3YtPmhpZ2hlc3RfbG51bSkgewot
CQkJCXViaV9lcnIoImluY29ycmVjdCBoaWdoZXN0X2xudW0gb3IgbG51bSIpOwotCQkJCWdvdG8g
YmFkX3NlYjsKLQkJCX0KLQkJfQotCi0JCWlmIChzdi0+bGViX2NvdW50ICE9IGxlYl9jb3VudCkg
ewotCQkJdWJpX2VycigiYmFkIGxlYl9jb3VudCwgJWQgb2JqZWN0cyBpbiB0aGUgdHJlZSIsCi0J
CQkJbGViX2NvdW50KTsKLQkJCWdvdG8gYmFkX3N2OwotCQl9Ci0KLQkJaWYgKCFsYXN0X3NlYikK
LQkJCWNvbnRpbnVlOwotCi0JCXNlYiA9IGxhc3Rfc2ViOwotCi0JCWlmIChzZWItPmxudW0gIT0g
c3YtPmhpZ2hlc3RfbG51bSkgewotCQkJdWJpX2VycigiYmFkIGhpZ2hlc3RfbG51bSIpOwotCQkJ
Z290byBiYWRfc2ViOwotCQl9Ci0JfQotCi0JaWYgKHZvbHNfZm91bmQgIT0gc2ktPnZvbHNfZm91
bmQpIHsKLQkJdWJpX2VycigiYmFkIHNpLT52b2xzX2ZvdW5kICVkLCBzaG91bGQgYmUgJWQiLAot
CQkJc2ktPnZvbHNfZm91bmQsIHZvbHNfZm91bmQpOwotCQlnb3RvIG91dDsKLQl9Ci0KLQkvKiBD
aGVjayB0aGF0IHNjYW5uaW5nIGluZm9ybWF0aW9uIGlzIGNvcnJlY3QgKi8KLQl1YmlfcmJfZm9y
X2VhY2hfZW50cnkocmIxLCBzdiwgJnNpLT52b2x1bWVzLCByYikgewotCQlsYXN0X3NlYiA9IE5V
TEw7Ci0JCXViaV9yYl9mb3JfZWFjaF9lbnRyeShyYjIsIHNlYiwgJnN2LT5yb290LCB1LnJiKSB7
Ci0JCQlpbnQgdm9sX3R5cGU7Ci0KLQkJCWNvbmRfcmVzY2hlZCgpOwotCi0JCQlsYXN0X3NlYiA9
IHNlYjsKLQotCQkJZXJyID0gdWJpX2lvX3JlYWRfdmlkX2hkcih1YmksIHNlYi0+cG51bSwgdmlk
aCwgMSk7Ci0JCQlpZiAoZXJyICYmIGVyciAhPSBVQklfSU9fQklURkxJUFMpIHsKLQkJCQl1Ymlf
ZXJyKCJWSUQgaGVhZGVyIGlzIG5vdCBPSyAoJWQpIiwgZXJyKTsKLQkJCQlpZiAoZXJyID4gMCkK
LQkJCQkJZXJyID0gLUVJTzsKLQkJCQlyZXR1cm4gZXJyOwotCQkJfQotCi0JCQl2b2xfdHlwZSA9
IHZpZGgtPnZvbF90eXBlID09IFVCSV9WSURfRFlOQU1JQyA/Ci0JCQkJICAgVUJJX0RZTkFNSUNf
Vk9MVU1FIDogVUJJX1NUQVRJQ19WT0xVTUU7Ci0JCQlpZiAoc3YtPnZvbF90eXBlICE9IHZvbF90
eXBlKSB7Ci0JCQkJdWJpX2VycigiYmFkIHZvbF90eXBlIik7Ci0JCQkJZ290byBiYWRfdmlkX2hk
cjsKLQkJCX0KLQotCQkJaWYgKHNlYi0+c3FudW0gIT0gYmU2NF90b19jcHUodmlkaC0+c3FudW0p
KSB7Ci0JCQkJdWJpX2VycigiYmFkIHNxbnVtICVsbHUiLCBzZWItPnNxbnVtKTsKLQkJCQlnb3Rv
IGJhZF92aWRfaGRyOwotCQkJfQotCi0JCQlpZiAoc3YtPnZvbF9pZCAhPSBiZTMyX3RvX2NwdSh2
aWRoLT52b2xfaWQpKSB7Ci0JCQkJdWJpX2VycigiYmFkIHZvbF9pZCAlZCIsIHN2LT52b2xfaWQp
OwotCQkJCWdvdG8gYmFkX3ZpZF9oZHI7Ci0JCQl9Ci0KLQkJCWlmIChzdi0+Y29tcGF0ICE9IHZp
ZGgtPmNvbXBhdCkgewotCQkJCXViaV9lcnIoImJhZCBjb21wYXQgJWQiLCB2aWRoLT5jb21wYXQp
OwotCQkJCWdvdG8gYmFkX3ZpZF9oZHI7Ci0JCQl9Ci0KLQkJCWlmIChzZWItPmxudW0gIT0gYmUz
Ml90b19jcHUodmlkaC0+bG51bSkpIHsKLQkJCQl1YmlfZXJyKCJiYWQgbG51bSAlZCIsIHNlYi0+
bG51bSk7Ci0JCQkJZ290byBiYWRfdmlkX2hkcjsKLQkJCX0KLQotCQkJaWYgKHN2LT51c2VkX2Vi
cyAhPSBiZTMyX3RvX2NwdSh2aWRoLT51c2VkX2VicykpIHsKLQkJCQl1YmlfZXJyKCJiYWQgdXNl
ZF9lYnMgJWQiLCBzdi0+dXNlZF9lYnMpOwotCQkJCWdvdG8gYmFkX3ZpZF9oZHI7Ci0JCQl9Ci0K
LQkJCWlmIChzdi0+ZGF0YV9wYWQgIT0gYmUzMl90b19jcHUodmlkaC0+ZGF0YV9wYWQpKSB7Ci0J
CQkJdWJpX2VycigiYmFkIGRhdGFfcGFkICVkIiwgc3YtPmRhdGFfcGFkKTsKLQkJCQlnb3RvIGJh
ZF92aWRfaGRyOwotCQkJfQotCQl9Ci0KLQkJaWYgKCFsYXN0X3NlYikKLQkJCWNvbnRpbnVlOwot
Ci0JCWlmIChzdi0+aGlnaGVzdF9sbnVtICE9IGJlMzJfdG9fY3B1KHZpZGgtPmxudW0pKSB7Ci0J
CQl1YmlfZXJyKCJiYWQgaGlnaGVzdF9sbnVtICVkIiwgc3YtPmhpZ2hlc3RfbG51bSk7Ci0JCQln
b3RvIGJhZF92aWRfaGRyOwotCQl9Ci0KLQkJaWYgKHN2LT5sYXN0X2RhdGFfc2l6ZSAhPSBiZTMy
X3RvX2NwdSh2aWRoLT5kYXRhX3NpemUpKSB7Ci0JCQl1YmlfZXJyKCJiYWQgbGFzdF9kYXRhX3Np
emUgJWQiLCBzdi0+bGFzdF9kYXRhX3NpemUpOwotCQkJZ290byBiYWRfdmlkX2hkcjsKLQkJfQot
CX0KLQotCS8qCi0JICogTWFrZSBzdXJlIHRoYXQgYWxsIHRoZSBwaHlzaWNhbCBlcmFzZWJsb2Nr
cyBhcmUgaW4gb25lIG9mIHRoZSBsaXN0cwotCSAqIG9yIHRyZWVzLgotCSAqLwotCWJ1ZiA9IGt6
YWxsb2ModWJpLT5wZWJfY291bnQsIEdGUF9LRVJORUwpOwotCWlmICghYnVmKQotCQlyZXR1cm4g
LUVOT01FTTsKLQotCWZvciAocG51bSA9IDA7IHBudW0gPCB1YmktPnBlYl9jb3VudDsgcG51bSsr
KSB7Ci0JCWVyciA9IHViaV9pb19pc19iYWQodWJpLCBwbnVtKTsKLQkJaWYgKGVyciA8IDApIHsK
LQkJCWtmcmVlKGJ1Zik7Ci0JCQlyZXR1cm4gZXJyOwotCQl9IGVsc2UgaWYgKGVycikKLQkJCWJ1
ZltwbnVtXSA9IDE7Ci0JfQotCi0JdWJpX3JiX2Zvcl9lYWNoX2VudHJ5KHJiMSwgc3YsICZzaS0+
dm9sdW1lcywgcmIpCi0JCXViaV9yYl9mb3JfZWFjaF9lbnRyeShyYjIsIHNlYiwgJnN2LT5yb290
LCB1LnJiKQotCQkJYnVmW3NlYi0+cG51bV0gPSAxOwotCi0JbGlzdF9mb3JfZWFjaF9lbnRyeShz
ZWIsICZzaS0+ZnJlZSwgdS5saXN0KQotCQlidWZbc2ViLT5wbnVtXSA9IDE7Ci0KLQlsaXN0X2Zv
cl9lYWNoX2VudHJ5KHNlYiwgJnNpLT5jb3JyLCB1Lmxpc3QpCi0JCWJ1ZltzZWItPnBudW1dID0g
MTsKLQotCWxpc3RfZm9yX2VhY2hfZW50cnkoc2ViLCAmc2ktPmVyYXNlLCB1Lmxpc3QpCi0JCWJ1
ZltzZWItPnBudW1dID0gMTsKLQotCWxpc3RfZm9yX2VhY2hfZW50cnkoc2ViLCAmc2ktPmFsaWVu
LCB1Lmxpc3QpCi0JCWJ1ZltzZWItPnBudW1dID0gMTsKLQotCWVyciA9IDA7Ci0JZm9yIChwbnVt
ID0gMDsgcG51bSA8IHViaS0+cGViX2NvdW50OyBwbnVtKyspCi0JCWlmICghYnVmW3BudW1dKSB7
Ci0JCQl1YmlfZXJyKCJQRUIgJWQgaXMgbm90IHJlZmVycmVkIiwgcG51bSk7Ci0JCQllcnIgPSAx
OwotCQl9Ci0KLQlrZnJlZShidWYpOwotCWlmIChlcnIpCi0JCWdvdG8gb3V0OwotCXJldHVybiAw
OwotCi1iYWRfc2ViOgotCXViaV9lcnIoImJhZCBzY2FubmluZyBpbmZvcm1hdGlvbiBhYm91dCBM
RUIgJWQiLCBzZWItPmxudW0pOwotCXViaV9kYmdfZHVtcF9zZWIoc2ViLCAwKTsKLQl1YmlfZGJn
X2R1bXBfc3Yoc3YpOwotCWdvdG8gb3V0OwotCi1iYWRfc3Y6Ci0JdWJpX2VycigiYmFkIHNjYW5u
aW5nIGluZm9ybWF0aW9uIGFib3V0IHZvbHVtZSAlZCIsIHN2LT52b2xfaWQpOwotCXViaV9kYmdf
ZHVtcF9zdihzdik7Ci0JZ290byBvdXQ7Ci0KLWJhZF92aWRfaGRyOgotCXViaV9lcnIoImJhZCBz
Y2FubmluZyBpbmZvcm1hdGlvbiBhYm91dCB2b2x1bWUgJWQiLCBzdi0+dm9sX2lkKTsKLQl1Ymlf
ZGJnX2R1bXBfc3Yoc3YpOwotCXViaV9kYmdfZHVtcF92aWRfaGRyKHZpZGgpOwotCi1vdXQ6Ci0J
dWJpX2RiZ19kdW1wX3N0YWNrKCk7Ci0JcmV0dXJuIC1FSU5WQUw7Ci19Ci0KLSNlbmRpZiAvKiBD
T05GSUdfTVREX1VCSV9ERUJVRyAqLwpkaWZmIC11TiAtdU5yIGxpbnV4LTMuMC9kcml2ZXJzL210
ZC91Ymkvc2Nhbi5oIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9kcml2ZXJzL210ZC91Ymkvc2Nh
bi5oCi0tLSBsaW51eC0zLjAvZHJpdmVycy9tdGQvdWJpL3NjYW4uaAkyMDExLTA3LTIxIDIxOjE3
OjIzLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2RyaXZlcnMv
bXRkL3ViaS9zY2FuLmgJMTk2OS0xMi0zMSAxODowMDowMC4wMDAwMDAwMDAgLTA2MDAKQEAgLTEs
MTc0ICswLDAgQEAKLS8qCi0gKiBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVzaW5lc3Mg
TWFjaGluZXMgQ29ycC4sIDIwMDYKLSAqCi0gKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQotICogaXQgdW5kZXIgdGhl
IHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkK
LSAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhl
IExpY2Vuc2UsIG9yCi0gKiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgotICoK
LSAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwg
YmUgdXNlZnVsLAotICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhl
IGltcGxpZWQgd2FycmFudHkgb2YKLSAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRS4gU2VlCi0gKiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgZm9yIG1vcmUgZGV0YWlscy4KLSAqCi0gKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBj
b3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQotICogYWxvbmcgd2l0aCB0aGlz
IHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUKLSAqIEZvdW5kYXRp
b24sIEluYy4sIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1BIDAyMTExLTEz
MDcgVVNBCi0gKgotICogQXV0aG9yOiBBcnRlbSBCaXR5dXRza2l5ICjQkdC40YLRjtGG0LrQuNC5
INCQ0YDRgtGR0LwpCi0gKi8KLQotI2lmbmRlZiBfX1VCSV9TQ0FOX0hfXwotI2RlZmluZSBfX1VC
SV9TQ0FOX0hfXwotCi0vKiBUaGUgZXJhc2UgY291bnRlciB2YWx1ZSBmb3IgdGhpcyBwaHlzaWNh
bCBlcmFzZWJsb2NrIGlzIHVua25vd24gKi8KLSNkZWZpbmUgVUJJX1NDQU5fVU5LTk9XTl9FQyAo
LTEpCi0KLS8qKgotICogc3RydWN0IHViaV9zY2FuX2xlYiAtIHNjYW5uaW5nIGluZm9ybWF0aW9u
IGFib3V0IGEgcGh5c2ljYWwgZXJhc2VibG9jay4KLSAqIEBlYzogZXJhc2UgY291bnRlciAoJVVC
SV9TQ0FOX1VOS05PV05fRUMgaWYgaXQgaXMgdW5rbm93bikKLSAqIEBwbnVtOiBwaHlzaWNhbCBl
cmFzZWJsb2NrIG51bWJlcgotICogQGxudW06IGxvZ2ljYWwgZXJhc2VibG9jayBudW1iZXIKLSAq
IEBzY3J1YjogaWYgdGhpcyBwaHlzaWNhbCBlcmFzZWJsb2NrIG5lZWRzIHNjcnViYmluZwotICog
QGNvcHlfZmxhZzogdGhpcyBMRUIgaXMgYSBjb3B5IChAY29weV9mbGFnIGlzIHNldCBpbiBWSUQg
aGVhZGVyIG9mIHRoaXMgTEVCKQotICogQHNxbnVtOiBzZXF1ZW5jZSBudW1iZXIKLSAqIEB1OiB1
bmlvbnMgUkItdHJlZSBvciBAbGlzdCBsaW5rcwotICogQHUucmI6IGxpbmsgaW4gdGhlIHBlci12
b2x1bWUgUkItdHJlZSBvZiAmc3RydWN0IHViaV9zY2FuX2xlYiBvYmplY3RzCi0gKiBAdS5saXN0
OiBsaW5rIGluIG9uZSBvZiB0aGUgZXJhc2VibG9jayBsaXN0cwotICoKLSAqIE9uZSBvYmplY3Qg
b2YgdGhpcyB0eXBlIGlzIGFsbG9jYXRlZCBmb3IgZWFjaCBwaHlzaWNhbCBlcmFzZWJsb2NrIGR1
cmluZwotICogc2Nhbm5pbmcuCi0gKi8KLXN0cnVjdCB1Ymlfc2Nhbl9sZWIgewotCWludCBlYzsK
LQlpbnQgcG51bTsKLQlpbnQgbG51bTsKLQl1bnNpZ25lZCBpbnQgc2NydWI6MTsKLQl1bnNpZ25l
ZCBpbnQgY29weV9mbGFnOjE7Ci0JdW5zaWduZWQgbG9uZyBsb25nIHNxbnVtOwotCXVuaW9uIHsK
LQkJc3RydWN0IHJiX25vZGUgcmI7Ci0JCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKLQl9IHU7Ci19
OwotCi0vKioKLSAqIHN0cnVjdCB1Ymlfc2Nhbl92b2x1bWUgLSBzY2FubmluZyBpbmZvcm1hdGlv
biBhYm91dCBhIHZvbHVtZS4KLSAqIEB2b2xfaWQ6IHZvbHVtZSBJRAotICogQGhpZ2hlc3RfbG51
bTogaGlnaGVzdCBsb2dpY2FsIGVyYXNlYmxvY2sgbnVtYmVyIGluIHRoaXMgdm9sdW1lCi0gKiBA
bGViX2NvdW50OiBudW1iZXIgb2YgbG9naWNhbCBlcmFzZWJsb2NrcyBpbiB0aGlzIHZvbHVtZQot
ICogQHZvbF90eXBlOiB2b2x1bWUgdHlwZQotICogQHVzZWRfZWJzOiBudW1iZXIgb2YgdXNlZCBs
b2dpY2FsIGVyYXNlYmxvY2tzIGluIHRoaXMgdm9sdW1lIChvbmx5IGZvcgotICogICAgICAgICAg
ICBzdGF0aWMgdm9sdW1lcykKLSAqIEBsYXN0X2RhdGFfc2l6ZTogYW1vdW50IG9mIGRhdGEgaW4g
dGhlIGxhc3QgbG9naWNhbCBlcmFzZWJsb2NrIG9mIHRoaXMKLSAqICAgICAgICAgICAgICAgICAg
dm9sdW1lIChhbHdheXMgZXF1aXZhbGVudCB0byB0aGUgdXNhYmxlIGxvZ2ljYWwgZXJhc2VibG9j
awotICogICAgICAgICAgICAgICAgICBzaXplIGluIGNhc2Ugb2YgZHluYW1pYyB2b2x1bWVzKQot
ICogQGRhdGFfcGFkOiBob3cgbWFueSBieXRlcyBhdCB0aGUgZW5kIG9mIGxvZ2ljYWwgZXJhc2Vi
bG9ja3Mgb2YgdGhpcyB2b2x1bWUKLSAqICAgICAgICAgICAgYXJlIG5vdCB1c2VkIChkdWUgdG8g
dm9sdW1lIGFsaWdubWVudCkKLSAqIEBjb21wYXQ6IGNvbXBhdGliaWxpdHkgZmxhZ3Mgb2YgdGhp
cyB2b2x1bWUKLSAqIEByYjogbGluayBpbiB0aGUgdm9sdW1lIFJCLXRyZWUKLSAqIEByb290OiBy
b290IG9mIHRoZSBSQi10cmVlIGNvbnRhaW5pbmcgYWxsIHRoZSBlcmFzZWJsb2NrIGJlbG9uZ2lu
ZyB0byB0aGlzCi0gKiAgICAgICAgdm9sdW1lICgmc3RydWN0IHViaV9zY2FuX2xlYiBvYmplY3Rz
KQotICoKLSAqIE9uZSBvYmplY3Qgb2YgdGhpcyB0eXBlIGlzIGFsbG9jYXRlZCBmb3IgZWFjaCB2
b2x1bWUgZHVyaW5nIHNjYW5uaW5nLgotICovCi1zdHJ1Y3QgdWJpX3NjYW5fdm9sdW1lIHsKLQlp
bnQgdm9sX2lkOwotCWludCBoaWdoZXN0X2xudW07Ci0JaW50IGxlYl9jb3VudDsKLQlpbnQgdm9s
X3R5cGU7Ci0JaW50IHVzZWRfZWJzOwotCWludCBsYXN0X2RhdGFfc2l6ZTsKLQlpbnQgZGF0YV9w
YWQ7Ci0JaW50IGNvbXBhdDsKLQlzdHJ1Y3QgcmJfbm9kZSByYjsKLQlzdHJ1Y3QgcmJfcm9vdCBy
b290OwotfTsKLQotLyoqCi0gKiBzdHJ1Y3QgdWJpX3NjYW5faW5mbyAtIFVCSSBzY2FubmluZyBp
bmZvcm1hdGlvbi4KLSAqIEB2b2x1bWVzOiByb290IG9mIHRoZSB2b2x1bWUgUkItdHJlZQotICog
QGNvcnI6IGxpc3Qgb2YgY29ycnVwdGVkIHBoeXNpY2FsIGVyYXNlYmxvY2tzCi0gKiBAZnJlZTog
bGlzdCBvZiBmcmVlIHBoeXNpY2FsIGVyYXNlYmxvY2tzCi0gKiBAZXJhc2U6IGxpc3Qgb2YgcGh5
c2ljYWwgZXJhc2VibG9ja3Mgd2hpY2ggaGF2ZSB0byBiZSBlcmFzZWQKLSAqIEBhbGllbjogbGlz
dCBvZiBwaHlzaWNhbCBlcmFzZWJsb2NrcyB3aGljaCBzaG91bGQgbm90IGJlIHVzZWQgYnkgVUJJ
IChlLmcuLAotICogICAgICAgICB0aG9zZSBiZWxvbmdpbmcgdG8gInByZXNlcnZlIi1jb21wYXRp
YmxlIGludGVybmFsIHZvbHVtZXMpCi0gKiBAY29ycl9wZWJfY291bnQ6IGNvdW50IG9mIFBFQnMg
aW4gdGhlIEBjb3JyIGxpc3QKLSAqIEBlbXB0eV9wZWJfY291bnQ6IGNvdW50IG9mIFBFQnMgd2hp
Y2ggYXJlIHByZXN1bWFibHkgZW1wdHkgKGNvbnRhaW4gb25seQotICogICAgICAgICAgICAgICAg
ICAgMHhGRiBieXRlcykKLSAqIEBhbGllbl9wZWJfY291bnQ6IGNvdW50IG9mIFBFQnMgaW4gdGhl
IEBhbGllbiBsaXN0Ci0gKiBAYmFkX3BlYl9jb3VudDogY291bnQgb2YgYmFkIHBoeXNpY2FsIGVy
YXNlYmxvY2tzCi0gKiBAbWF5YmVfYmFkX3BlYl9jb3VudDogY291bnQgb2YgYmFkIHBoeXNpY2Fs
IGVyYXNlYmxvY2tzIHdoaWNoIGFyZSBub3QgbWFya2VkCi0gKiAgICAgICAgICAgICAgICAgICAg
ICAgYXMgYmFkIHlldCwgYnV0IHdoaWNoIGxvb2sgbGlrZSBiYWQKLSAqIEB2b2xzX2ZvdW5kOiBu
dW1iZXIgb2Ygdm9sdW1lcyBmb3VuZCBkdXJpbmcgc2Nhbm5pbmcKLSAqIEBoaWdoZXN0X3ZvbF9p
ZDogaGlnaGVzdCB2b2x1bWUgSUQKLSAqIEBpc19lbXB0eTogZmxhZyBpbmRpY2F0aW5nIHdoZXRo
ZXIgdGhlIE1URCBkZXZpY2UgaXMgZW1wdHkgb3Igbm90Ci0gKiBAbWluX2VjOiBsb3dlc3QgZXJh
c2UgY291bnRlciB2YWx1ZQotICogQG1heF9lYzogaGlnaGVzdCBlcmFzZSBjb3VudGVyIHZhbHVl
Ci0gKiBAbWF4X3NxbnVtOiBoaWdoZXN0IHNlcXVlbmNlIG51bWJlciB2YWx1ZQotICogQG1lYW5f
ZWM6IG1lYW4gZXJhc2UgY291bnRlciB2YWx1ZQotICogQGVjX3N1bTogYSB0ZW1wb3JhcnkgdmFy
aWFibGUgdXNlZCB3aGVuIGNhbGN1bGF0aW5nIEBtZWFuX2VjCi0gKiBAZWNfY291bnQ6IGEgdGVt
cG9yYXJ5IHZhcmlhYmxlIHVzZWQgd2hlbiBjYWxjdWxhdGluZyBAbWVhbl9lYwotICogQHNjYW5f
bGViX3NsYWI6IHNsYWIgY2FjaGUgZm9yICZzdHJ1Y3QgdWJpX3NjYW5fbGViIG9iamVjdHMKLSAq
Ci0gKiBUaGlzIGRhdGEgc3RydWN0dXJlIGNvbnRhaW5zIHRoZSByZXN1bHQgb2Ygc2Nhbm5pbmcg
YW5kIG1heSBiZSB1c2VkIGJ5IG90aGVyCi0gKiBVQkkgc3ViLXN5c3RlbXMgdG8gYnVpbGQgZmlu
YWwgVUJJIGRhdGEgc3RydWN0dXJlcywgZnVydGhlciBlcnJvci1yZWNvdmVyeQotICogYW5kIHNv
IG9uLgotICovCi1zdHJ1Y3QgdWJpX3NjYW5faW5mbyB7Ci0Jc3RydWN0IHJiX3Jvb3Qgdm9sdW1l
czsKLQlzdHJ1Y3QgbGlzdF9oZWFkIGNvcnI7Ci0Jc3RydWN0IGxpc3RfaGVhZCBmcmVlOwotCXN0
cnVjdCBsaXN0X2hlYWQgZXJhc2U7Ci0Jc3RydWN0IGxpc3RfaGVhZCBhbGllbjsKLQlpbnQgY29y
cl9wZWJfY291bnQ7Ci0JaW50IGVtcHR5X3BlYl9jb3VudDsKLQlpbnQgYWxpZW5fcGViX2NvdW50
OwotCWludCBiYWRfcGViX2NvdW50OwotCWludCBtYXliZV9iYWRfcGViX2NvdW50OwotCWludCB2
b2xzX2ZvdW5kOwotCWludCBoaWdoZXN0X3ZvbF9pZDsKLQlpbnQgaXNfZW1wdHk7Ci0JaW50IG1p
bl9lYzsKLQlpbnQgbWF4X2VjOwotCXVuc2lnbmVkIGxvbmcgbG9uZyBtYXhfc3FudW07Ci0JaW50
IG1lYW5fZWM7Ci0JdWludDY0X3QgZWNfc3VtOwotCWludCBlY19jb3VudDsKLQlzdHJ1Y3Qga21l
bV9jYWNoZSAqc2Nhbl9sZWJfc2xhYjsKLX07Ci0KLXN0cnVjdCB1YmlfZGV2aWNlOwotc3RydWN0
IHViaV92aWRfaGRyOwotCi0vKgotICogdWJpX3NjYW5fbW92ZV90b19saXN0IC0gbW92ZSBhIFBF
QiBmcm9tIHRoZSB2b2x1bWUgdHJlZSB0byBhIGxpc3QuCi0gKgotICogQHN2OiB2b2x1bWUgc2Nh
bm5pbmcgaW5mb3JtYXRpb24KLSAqIEBzZWI6IHNjYW5uaW5nIGVyYXNlYmxvY2sgaW5mb3JtYXRp
b24KLSAqIEBsaXN0OiB0aGUgbGlzdCB0byBtb3ZlIHRvCi0gKi8KLXN0YXRpYyBpbmxpbmUgdm9p
ZCB1Ymlfc2Nhbl9tb3ZlX3RvX2xpc3Qoc3RydWN0IHViaV9zY2FuX3ZvbHVtZSAqc3YsCi0JCQkJ
CSBzdHJ1Y3QgdWJpX3NjYW5fbGViICpzZWIsCi0JCQkJCSBzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0
KQotewotCQlyYl9lcmFzZSgmc2ViLT51LnJiLCAmc3YtPnJvb3QpOwotCQlsaXN0X2FkZF90YWls
KCZzZWItPnUubGlzdCwgbGlzdCk7Ci19Ci0KLWludCB1Ymlfc2Nhbl9hZGRfdXNlZChzdHJ1Y3Qg
dWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX3NjYW5faW5mbyAqc2ksCi0JCSAgICAgIGludCBw
bnVtLCBpbnQgZWMsIGNvbnN0IHN0cnVjdCB1YmlfdmlkX2hkciAqdmlkX2hkciwKLQkJICAgICAg
aW50IGJpdGZsaXBzKTsKLXN0cnVjdCB1Ymlfc2Nhbl92b2x1bWUgKnViaV9zY2FuX2ZpbmRfc3Yo
Y29uc3Qgc3RydWN0IHViaV9zY2FuX2luZm8gKnNpLAotCQkJCQkgaW50IHZvbF9pZCk7Ci1zdHJ1
Y3QgdWJpX3NjYW5fbGViICp1Ymlfc2Nhbl9maW5kX3NlYihjb25zdCBzdHJ1Y3QgdWJpX3NjYW5f
dm9sdW1lICpzdiwKLQkJCQkgICAgICAgaW50IGxudW0pOwotdm9pZCB1Ymlfc2Nhbl9ybV92b2x1
bWUoc3RydWN0IHViaV9zY2FuX2luZm8gKnNpLCBzdHJ1Y3QgdWJpX3NjYW5fdm9sdW1lICpzdik7
Ci1zdHJ1Y3QgdWJpX3NjYW5fbGViICp1Ymlfc2Nhbl9nZXRfZnJlZV9wZWIoc3RydWN0IHViaV9k
ZXZpY2UgKnViaSwKLQkJCQkJICAgc3RydWN0IHViaV9zY2FuX2luZm8gKnNpKTsKLWludCB1Ymlf
c2Nhbl9lcmFzZV9wZWIoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgY29uc3Qgc3RydWN0IHViaV9z
Y2FuX2luZm8gKnNpLAotCQkgICAgICAgaW50IHBudW0sIGludCBlYyk7Ci1zdHJ1Y3QgdWJpX3Nj
YW5faW5mbyAqdWJpX3NjYW4oc3RydWN0IHViaV9kZXZpY2UgKnViaSk7Ci12b2lkIHViaV9zY2Fu
X2Rlc3Ryb3lfc2koc3RydWN0IHViaV9zY2FuX2luZm8gKnNpKTsKLQotI2VuZGlmIC8qICFfX1VC
SV9TQ0FOX0hfXyAqLwpkaWZmIC11TiAtdU5yIGxpbnV4LTMuMC9kcml2ZXJzL210ZC91YmkvdWJp
LW1lZGlhLmggbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2RyaXZlcnMvbXRkL3ViaS91YmktbWVk
aWEuaAotLS0gbGludXgtMy4wL2RyaXZlcnMvbXRkL3ViaS91YmktbWVkaWEuaAkyMDExLTA3LTIx
IDIxOjE3OjIzLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2Ry
aXZlcnMvbXRkL3ViaS91YmktbWVkaWEuaAkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAwMDAwMCAt
MDUwMApAQCAtMTQ5LDEwICsxNDksMTAgQEAKICAqIFRoZSBAaW1hZ2Vfc2VxIGZpZWxkIGlzIHVz
ZWQgdG8gdmFsaWRhdGUgYSBVQkkgaW1hZ2UgdGhhdCBoYXMgYmVlbiBwcmVwYXJlZAogICogZm9y
IGEgVUJJIGRldmljZS4gVGhlIEBpbWFnZV9zZXEgdmFsdWUgY2FuIGJlIGFueSB2YWx1ZSwgYnV0
IGl0IG11c3QgYmUgdGhlCiAgKiBzYW1lIG9uIGFsbCBlcmFzZWJsb2Nrcy4gVUJJIHdpbGwgZW5z
dXJlIHRoYXQgYWxsIG5ldyBlcmFzZSBjb3VudGVyIGhlYWRlcnMKLSAqIGFsc28gY29udGFpbiB0
aGlzIHZhbHVlLCBhbmQgd2lsbCBjaGVjayB0aGUgdmFsdWUgd2hlbiBzY2FubmluZyBhdCBzdGFy
dC11cC4KKyAqIGFsc28gY29udGFpbiB0aGlzIHZhbHVlLCBhbmQgd2lsbCBjaGVjayB0aGUgdmFs
dWUgd2hlbiBhdHRhY2hpbmcgdGhlIGZsYXNoLgogICogT25lIHdheSB0byBtYWtlIHVzZSBvZiBA
aW1hZ2Vfc2VxIGlzIHRvIGluY3JlYXNlIGl0cyB2YWx1ZSBieSBvbmUgZXZlcnkgdGltZQogICog
YW4gaW1hZ2UgaXMgZmxhc2hlZCBvdmVyIGFuIGV4aXN0aW5nIGltYWdlLCB0aGVuLCBpZiB0aGUg
Zmxhc2hpbmcgZG9lcyBub3QKLSAqIGNvbXBsZXRlLCBVQkkgd2lsbCBkZXRlY3QgdGhlIGVycm9y
IHdoZW4gc2Nhbm5pbmcuCisgKiBjb21wbGV0ZSwgVUJJIHdpbGwgZGV0ZWN0IHRoZSBlcnJvciB3
aGVuIGF0dGFjaGluZyB0aGUgbWVkaWEuCiAgKi8KIHN0cnVjdCB1YmlfZWNfaGRyIHsKIAlfX2Jl
MzIgIG1hZ2ljOwpAQCAtMjk4LDggKzI5OCw4IEBACiAjZGVmaW5lIFVCSV9JTlRfVk9MX0NPVU5U
IDEKIAogLyoKLSAqIFN0YXJ0aW5nIElEIG9mIGludGVybmFsIHZvbHVtZXMuIFRoZXJlIGlzIHJl
c2VydmVkIHJvb20gZm9yIDQwOTYgaW50ZXJuYWwKLSAqIHZvbHVtZXMuCisgKiBTdGFydGluZyBJ
RCBvZiBpbnRlcm5hbCB2b2x1bWVzOiAweDdmZmZlZmZmLgorICogVGhlcmUgaXMgcmVzZXJ2ZWQg
cm9vbSBmb3IgNDA5NiBpbnRlcm5hbCB2b2x1bWVzLgogICovCiAjZGVmaW5lIFVCSV9JTlRFUk5B
TF9WT0xfU1RBUlQgKDB4N0ZGRkZGRkYgLSA0MDk2KQogCmRpZmYgLXVOIC11TnIgbGludXgtMy4w
L2RyaXZlcnMvbXRkL3ViaS91YmkuaCBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9t
dGQvdWJpL3ViaS5oCi0tLSBsaW51eC0zLjAvZHJpdmVycy9tdGQvdWJpL3ViaS5oCTIwMTEtMDct
MjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3Qv
ZHJpdmVycy9tdGQvdWJpL3ViaS5oCTIwMTItMDYtMjggMTE6MjY6MTUuMDAwMDAwMDAwIC0wNTAw
CkBAIC00Myw4ICs0Myw2IEBACiAjaW5jbHVkZSA8YXNtL3BndGFibGUuaD4KIAogI2luY2x1ZGUg
InViaS1tZWRpYS5oIgotI2luY2x1ZGUgInNjYW4uaCIKLSNpbmNsdWRlICJkZWJ1Zy5oIgogCiAv
KiBNYXhpbXVtIG51bWJlciBvZiBzdXBwb3J0ZWQgVUJJIGRldmljZXMgKi8KICNkZWZpbmUgVUJJ
X01BWF9ERVZJQ0VTIDMyCkBAIC02Nyw3ICs2NSwxMCBAQAogLyogQmFja2dyb3VuZCB0aHJlYWQg
bmFtZSBwYXR0ZXJuICovCiAjZGVmaW5lIFVCSV9CR1RfTkFNRV9QQVRURVJOICJ1YmlfYmd0JWRk
IgogCi0vKiBUaGlzIG1hcmtlciBpbiB0aGUgRUJBIHRhYmxlIG1lYW5zIHRoYXQgdGhlIExFQiBp
cyB1bS1tYXBwZWQgKi8KKy8qCisgKiBUaGlzIG1hcmtlciBpbiB0aGUgRUJBIHRhYmxlIG1lYW5z
IHRoYXQgdGhlIExFQiBpcyB1bS1tYXBwZWQuCisgKiBOT1RFISBJdCBoYXMgdG8gaGF2ZSB0aGUg
c2FtZSB2YWx1ZSBhcyAlVUJJX0FMTC4KKyAqLwogI2RlZmluZSBVQklfTEVCX1VOTUFQUEVEIC0x
CiAKIC8qCkBAIC04Myw2ICs4NCw5IEBACiAgKi8KICNkZWZpbmUgVUJJX1BST1RfUVVFVUVfTEVO
IDEwCiAKKy8qIFRoZSB2b2x1bWUgSUQvTEVCIG51bWJlci9lcmFzZSBjb3VudGVyIGlzIHVua25v
d24gKi8KKyNkZWZpbmUgVUJJX1VOS05PV04gLTEKKwogLyoKICAqIEVycm9yIGNvZGVzIHJldHVy
bmVkIGJ5IHRoZSBJL08gc3ViLXN5c3RlbS4KICAqCkBAIC0xMTksMTUgKzEyMywxNyBAQAogICog
ICAgICAgICAgICAgICAgICAgICBQRUIKICAqIE1PVkVfVEFSR0VUX1dSX0VSUjogY2FuY2VsZWQg
YmVjYXVzZSB0aGVyZSB3YXMgYSB3cml0ZSBlcnJvciB0byB0aGUgdGFyZ2V0CiAgKiAgICAgICAg
ICAgICAgICAgICAgIFBFQgotICogTU9WRV9DQU5DRUxfQklURkxJUFM6IGNhbmNlbGVkIGJlY2F1
c2UgYSBiaXQtZmxpcCB3YXMgZGV0ZWN0ZWQgaW4gdGhlCisgKiBNT1ZFX1RBUkdFVF9CSVRGTElQ
UzogY2FuY2VsZWQgYmVjYXVzZSBhIGJpdC1mbGlwIHdhcyBkZXRlY3RlZCBpbiB0aGUKICAqICAg
ICAgICAgICAgICAgICAgICAgICB0YXJnZXQgUEVCCisgKiBNT1ZFX1JFVFJZOiByZXRyeSBzY3J1
YmJpbmcgdGhlIFBFQgogICovCiBlbnVtIHsKIAlNT1ZFX0NBTkNFTF9SQUNFID0gMSwKIAlNT1ZF
X1NPVVJDRV9SRF9FUlIsCiAJTU9WRV9UQVJHRVRfUkRfRVJSLAogCU1PVkVfVEFSR0VUX1dSX0VS
UiwKLQlNT1ZFX0NBTkNFTF9CSVRGTElQUywKKwlNT1ZFX1RBUkdFVF9CSVRGTElQUywKKwlNT1ZF
X1JFVFJZLAogfTsKIAogLyoqCkBAIC0yMjEsOCArMjI3LDYgQEAKICAqIEB1cGRfZWJzOiBob3cg
bWFueSBlcmFzZWJsb2NrcyBhcmUgZXhwZWN0ZWQgdG8gYmUgdXBkYXRlZAogICogQGNoX2xudW06
IExFQiBudW1iZXIgd2hpY2ggaXMgYmVpbmcgY2hhbmdpbmcgYnkgdGhlIGF0b21pYyBMRUIgY2hh
bmdlCiAgKiAgICAgICAgICAgb3BlcmF0aW9uCi0gKiBAY2hfZHR5cGU6IGRhdGEgcGVyc2lzdGVu
Y3kgdHlwZSB3aGljaCBpcyBiZWluZyBjaGFuZ2luZyBieSB0aGUgYXRvbWljIExFQgotICogICAg
ICAgICAgICBjaGFuZ2Ugb3BlcmF0aW9uCiAgKiBAdXBkX2J5dGVzOiBob3cgbWFueSBieXRlcyBh
cmUgZXhwZWN0ZWQgdG8gYmUgcmVjZWl2ZWQgZm9yIHZvbHVtZSB1cGRhdGUgb3IKICAqICAgICAg
ICAgICAgIGF0b21pYyBMRUIgY2hhbmdlCiAgKiBAdXBkX3JlY2VpdmVkOiBob3cgbWFueSBieXRl
cyB3ZXJlIGFscmVhZHkgcmVjZWl2ZWQgZm9yIHZvbHVtZSB1cGRhdGUgb3IKQEAgLTI2OSw3ICsy
NzMsNiBAQAogCiAJaW50IHVwZF9lYnM7CiAJaW50IGNoX2xudW07Ci0JaW50IGNoX2R0eXBlOwog
CWxvbmcgbG9uZyB1cGRfYnl0ZXM7CiAJbG9uZyBsb25nIHVwZF9yZWNlaXZlZDsKIAl2b2lkICp1
cGRfYnVmOwpAQCAtMzg2LDEwICszODksMTEgQEAKICAqICAgICAgICAgICAgICAgICAgdGltZSAo
TVREIHdyaXRlIGJ1ZmZlciBzaXplKQogICogQG10ZDogTVREIGRldmljZSBkZXNjcmlwdG9yCiAg
KgotICogQHBlYl9idWYxOiBhIGJ1ZmZlciBvZiBQRUIgc2l6ZSB1c2VkIGZvciBkaWZmZXJlbnQg
cHVycG9zZXMKLSAqIEBwZWJfYnVmMjogYW5vdGhlciBidWZmZXIgb2YgUEVCIHNpemUgdXNlZCBm
b3IgZGlmZmVyZW50IHB1cnBvc2VzCi0gKiBAYnVmX211dGV4OiBwcm90ZWN0cyBAcGViX2J1ZjEg
YW5kIEBwZWJfYnVmMgorICogQHBlYl9idWY6IGEgYnVmZmVyIG9mIFBFQiBzaXplIHVzZWQgZm9y
IGRpZmZlcmVudCBwdXJwb3NlcworICogQGJ1Zl9tdXRleDogcHJvdGVjdHMgQHBlYl9idWYKICAq
IEBja3ZvbF9tdXRleDogc2VyaWFsaXplcyBzdGF0aWMgdm9sdW1lIGNoZWNraW5nIHdoZW4gb3Bl
bmluZworICoKKyAqIEBkYmc6IGRlYnVnZ2luZyBpbmZvcm1hdGlvbiBmb3IgdGhpcyBVQkkgZGV2
aWNlCiAgKi8KIHN0cnVjdCB1YmlfZGV2aWNlIHsKIAlzdHJ1Y3QgY2RldiBjZGV2OwpAQCAtNDY4
LDEyICs0NzIsMTMzIEBACiAJaW50IG1heF93cml0ZV9zaXplOwogCXN0cnVjdCBtdGRfaW5mbyAq
bXRkOwogCi0Jdm9pZCAqcGViX2J1ZjE7Ci0Jdm9pZCAqcGViX2J1ZjI7CisJdm9pZCAqcGViX2J1
ZjsKIAlzdHJ1Y3QgbXV0ZXggYnVmX211dGV4OwogCXN0cnVjdCBtdXRleCBja3ZvbF9tdXRleDsK
KworCXN0cnVjdCB1YmlfZGVidWdfaW5mbyAqZGJnOworfTsKKworLyoqCisgKiBzdHJ1Y3QgdWJp
X2FpbmZfcGViIC0gYXR0YWNoIGluZm9ybWF0aW9uIGFib3V0IGEgcGh5c2ljYWwgZXJhc2VibG9j
ay4KKyAqIEBlYzogZXJhc2UgY291bnRlciAoJVVCSV9VTktOT1dOIGlmIGl0IGlzIHVua25vd24p
CisgKiBAcG51bTogcGh5c2ljYWwgZXJhc2VibG9jayBudW1iZXIKKyAqIEB2b2xfaWQ6IElEIG9m
IHRoZSB2b2x1bWUgdGhpcyBMRUIgYmVsb25ncyB0bworICogQGxudW06IGxvZ2ljYWwgZXJhc2Vi
bG9jayBudW1iZXIKKyAqIEBzY3J1YjogaWYgdGhpcyBwaHlzaWNhbCBlcmFzZWJsb2NrIG5lZWRz
IHNjcnViYmluZworICogQGNvcHlfZmxhZzogdGhpcyBMRUIgaXMgYSBjb3B5IChAY29weV9mbGFn
IGlzIHNldCBpbiBWSUQgaGVhZGVyIG9mIHRoaXMgTEVCKQorICogQHNxbnVtOiBzZXF1ZW5jZSBu
dW1iZXIKKyAqIEB1OiB1bmlvbnMgUkItdHJlZSBvciBAbGlzdCBsaW5rcworICogQHUucmI6IGxp
bmsgaW4gdGhlIHBlci12b2x1bWUgUkItdHJlZSBvZiAmc3RydWN0IHViaV9haW5mX3BlYiBvYmpl
Y3RzCisgKiBAdS5saXN0OiBsaW5rIGluIG9uZSBvZiB0aGUgZXJhc2VibG9jayBsaXN0cworICoK
KyAqIE9uZSBvYmplY3Qgb2YgdGhpcyB0eXBlIGlzIGFsbG9jYXRlZCBmb3IgZWFjaCBwaHlzaWNh
bCBlcmFzZWJsb2NrIHdoZW4KKyAqIGF0dGFjaGluZyBhbiBNVEQgZGV2aWNlLiBOb3RlLCBpZiB0
aGlzIFBFQiBkb2VzIG5vdCBiZWxvbmcgdG8gYW55IExFQiAvCisgKiB2b2x1bWUsIHRoZSBAdm9s
X2lkIGFuZCBAbG51bSBmaWVsZHMgYXJlIGluaXRpYWxpemVkIHRvICVVQklfVU5LTk9XTi4KKyAq
Lworc3RydWN0IHViaV9haW5mX3BlYiB7CisJaW50IGVjOworCWludCBwbnVtOworCWludCB2b2xf
aWQ7CisJaW50IGxudW07CisJdW5zaWduZWQgaW50IHNjcnViOjE7CisJdW5zaWduZWQgaW50IGNv
cHlfZmxhZzoxOworCXVuc2lnbmVkIGxvbmcgbG9uZyBzcW51bTsKKwl1bmlvbiB7CisJCXN0cnVj
dCByYl9ub2RlIHJiOworCQlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7CisJfSB1OworfTsKKworLyoq
CisgKiBzdHJ1Y3QgdWJpX2FpbmZfdm9sdW1lIC0gYXR0YWNoaW5nIGluZm9ybWF0aW9uIGFib3V0
IGEgdm9sdW1lLgorICogQHZvbF9pZDogdm9sdW1lIElECisgKiBAaGlnaGVzdF9sbnVtOiBoaWdo
ZXN0IGxvZ2ljYWwgZXJhc2VibG9jayBudW1iZXIgaW4gdGhpcyB2b2x1bWUKKyAqIEBsZWJfY291
bnQ6IG51bWJlciBvZiBsb2dpY2FsIGVyYXNlYmxvY2tzIGluIHRoaXMgdm9sdW1lCisgKiBAdm9s
X3R5cGU6IHZvbHVtZSB0eXBlCisgKiBAdXNlZF9lYnM6IG51bWJlciBvZiB1c2VkIGxvZ2ljYWwg
ZXJhc2VibG9ja3MgaW4gdGhpcyB2b2x1bWUgKG9ubHkgZm9yCisgKiAgICAgICAgICAgIHN0YXRp
YyB2b2x1bWVzKQorICogQGxhc3RfZGF0YV9zaXplOiBhbW91bnQgb2YgZGF0YSBpbiB0aGUgbGFz
dCBsb2dpY2FsIGVyYXNlYmxvY2sgb2YgdGhpcworICogICAgICAgICAgICAgICAgICB2b2x1bWUg
KGFsd2F5cyBlcXVpdmFsZW50IHRvIHRoZSB1c2FibGUgbG9naWNhbCBlcmFzZWJsb2NrCisgKiAg
ICAgICAgICAgICAgICAgIHNpemUgaW4gY2FzZSBvZiBkeW5hbWljIHZvbHVtZXMpCisgKiBAZGF0
YV9wYWQ6IGhvdyBtYW55IGJ5dGVzIGF0IHRoZSBlbmQgb2YgbG9naWNhbCBlcmFzZWJsb2NrcyBv
ZiB0aGlzIHZvbHVtZQorICogICAgICAgICAgICBhcmUgbm90IHVzZWQgKGR1ZSB0byB2b2x1bWUg
YWxpZ25tZW50KQorICogQGNvbXBhdDogY29tcGF0aWJpbGl0eSBmbGFncyBvZiB0aGlzIHZvbHVt
ZQorICogQHJiOiBsaW5rIGluIHRoZSB2b2x1bWUgUkItdHJlZQorICogQHJvb3Q6IHJvb3Qgb2Yg
dGhlIFJCLXRyZWUgY29udGFpbmluZyBhbGwgdGhlIGVyYXNlYmxvY2sgYmVsb25naW5nIHRvIHRo
aXMKKyAqICAgICAgICB2b2x1bWUgKCZzdHJ1Y3QgdWJpX2FpbmZfcGViIG9iamVjdHMpCisgKgor
ICogT25lIG9iamVjdCBvZiB0aGlzIHR5cGUgaXMgYWxsb2NhdGVkIGZvciBlYWNoIHZvbHVtZSB3
aGVuIGF0dGFjaGluZyBhbiBNVEQKKyAqIGRldmljZS4KKyAqLworc3RydWN0IHViaV9haW5mX3Zv
bHVtZSB7CisJaW50IHZvbF9pZDsKKwlpbnQgaGlnaGVzdF9sbnVtOworCWludCBsZWJfY291bnQ7
CisJaW50IHZvbF90eXBlOworCWludCB1c2VkX2ViczsKKwlpbnQgbGFzdF9kYXRhX3NpemU7CisJ
aW50IGRhdGFfcGFkOworCWludCBjb21wYXQ7CisJc3RydWN0IHJiX25vZGUgcmI7CisJc3RydWN0
IHJiX3Jvb3Qgcm9vdDsKIH07CiAKKy8qKgorICogc3RydWN0IHViaV9hdHRhY2hfaW5mbyAtIE1U
RCBkZXZpY2UgYXR0YWNoaW5nIGluZm9ybWF0aW9uLgorICogQHZvbHVtZXM6IHJvb3Qgb2YgdGhl
IHZvbHVtZSBSQi10cmVlCisgKiBAY29ycjogbGlzdCBvZiBjb3JydXB0ZWQgcGh5c2ljYWwgZXJh
c2VibG9ja3MKKyAqIEBmcmVlOiBsaXN0IG9mIGZyZWUgcGh5c2ljYWwgZXJhc2VibG9ja3MKKyAq
IEBlcmFzZTogbGlzdCBvZiBwaHlzaWNhbCBlcmFzZWJsb2NrcyB3aGljaCBoYXZlIHRvIGJlIGVy
YXNlZAorICogQGFsaWVuOiBsaXN0IG9mIHBoeXNpY2FsIGVyYXNlYmxvY2tzIHdoaWNoIHNob3Vs
ZCBub3QgYmUgdXNlZCBieSBVQkkgKGUuZy4sCisgKiAgICAgICAgIHRob3NlIGJlbG9uZ2luZyB0
byAicHJlc2VydmUiLWNvbXBhdGlibGUgaW50ZXJuYWwgdm9sdW1lcykKKyAqIEBjb3JyX3BlYl9j
b3VudDogY291bnQgb2YgUEVCcyBpbiB0aGUgQGNvcnIgbGlzdAorICogQGVtcHR5X3BlYl9jb3Vu
dDogY291bnQgb2YgUEVCcyB3aGljaCBhcmUgcHJlc3VtYWJseSBlbXB0eSAoY29udGFpbiBvbmx5
CisgKiAgICAgICAgICAgICAgICAgICAweEZGIGJ5dGVzKQorICogQGFsaWVuX3BlYl9jb3VudDog
Y291bnQgb2YgUEVCcyBpbiB0aGUgQGFsaWVuIGxpc3QKKyAqIEBiYWRfcGViX2NvdW50OiBjb3Vu
dCBvZiBiYWQgcGh5c2ljYWwgZXJhc2VibG9ja3MKKyAqIEBtYXliZV9iYWRfcGViX2NvdW50OiBj
b3VudCBvZiBiYWQgcGh5c2ljYWwgZXJhc2VibG9ja3Mgd2hpY2ggYXJlIG5vdCBtYXJrZWQKKyAq
ICAgICAgICAgICAgICAgICAgICAgICBhcyBiYWQgeWV0LCBidXQgd2hpY2ggbG9vayBsaWtlIGJh
ZAorICogQHZvbHNfZm91bmQ6IG51bWJlciBvZiB2b2x1bWVzIGZvdW5kCisgKiBAaGlnaGVzdF92
b2xfaWQ6IGhpZ2hlc3Qgdm9sdW1lIElECisgKiBAaXNfZW1wdHk6IGZsYWcgaW5kaWNhdGluZyB3
aGV0aGVyIHRoZSBNVEQgZGV2aWNlIGlzIGVtcHR5IG9yIG5vdAorICogQG1pbl9lYzogbG93ZXN0
IGVyYXNlIGNvdW50ZXIgdmFsdWUKKyAqIEBtYXhfZWM6IGhpZ2hlc3QgZXJhc2UgY291bnRlciB2
YWx1ZQorICogQG1heF9zcW51bTogaGlnaGVzdCBzZXF1ZW5jZSBudW1iZXIgdmFsdWUKKyAqIEBt
ZWFuX2VjOiBtZWFuIGVyYXNlIGNvdW50ZXIgdmFsdWUKKyAqIEBlY19zdW06IGEgdGVtcG9yYXJ5
IHZhcmlhYmxlIHVzZWQgd2hlbiBjYWxjdWxhdGluZyBAbWVhbl9lYworICogQGVjX2NvdW50OiBh
IHRlbXBvcmFyeSB2YXJpYWJsZSB1c2VkIHdoZW4gY2FsY3VsYXRpbmcgQG1lYW5fZWMKKyAqIEBh
ZWJfc2xhYl9jYWNoZTogc2xhYiBjYWNoZSBmb3IgJnN0cnVjdCB1YmlfYWluZl9wZWIgb2JqZWN0
cworICoKKyAqIFRoaXMgZGF0YSBzdHJ1Y3R1cmUgY29udGFpbnMgdGhlIHJlc3VsdCBvZiBhdHRh
Y2hpbmcgYW4gTVREIGRldmljZSBhbmQgbWF5CisgKiBiZSB1c2VkIGJ5IG90aGVyIFVCSSBzdWIt
c3lzdGVtcyB0byBidWlsZCBmaW5hbCBVQkkgZGF0YSBzdHJ1Y3R1cmVzLCBmdXJ0aGVyCisgKiBl
cnJvci1yZWNvdmVyeSBhbmQgc28gb24uCisgKi8KK3N0cnVjdCB1YmlfYXR0YWNoX2luZm8gewor
CXN0cnVjdCByYl9yb290IHZvbHVtZXM7CisJc3RydWN0IGxpc3RfaGVhZCBjb3JyOworCXN0cnVj
dCBsaXN0X2hlYWQgZnJlZTsKKwlzdHJ1Y3QgbGlzdF9oZWFkIGVyYXNlOworCXN0cnVjdCBsaXN0
X2hlYWQgYWxpZW47CisJaW50IGNvcnJfcGViX2NvdW50OworCWludCBlbXB0eV9wZWJfY291bnQ7
CisJaW50IGFsaWVuX3BlYl9jb3VudDsKKwlpbnQgYmFkX3BlYl9jb3VudDsKKwlpbnQgbWF5YmVf
YmFkX3BlYl9jb3VudDsKKwlpbnQgdm9sc19mb3VuZDsKKwlpbnQgaGlnaGVzdF92b2xfaWQ7CisJ
aW50IGlzX2VtcHR5OworCWludCBtaW5fZWM7CisJaW50IG1heF9lYzsKKwl1bnNpZ25lZCBsb25n
IGxvbmcgbWF4X3NxbnVtOworCWludCBtZWFuX2VjOworCXVpbnQ2NF90IGVjX3N1bTsKKwlpbnQg
ZWNfY291bnQ7CisJc3RydWN0IGttZW1fY2FjaGUgKmFlYl9zbGFiX2NhY2hlOworfTsKKworI2lu
Y2x1ZGUgImRlYnVnLmgiCisKIGV4dGVybiBzdHJ1Y3Qga21lbV9jYWNoZSAqdWJpX3dsX2VudHJ5
X3NsYWI7CiBleHRlcm4gY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyB1YmlfY3RybF9jZGV2
X29wZXJhdGlvbnM7CiBleHRlcm4gY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyB1YmlfY2Rl
dl9vcGVyYXRpb25zOwpAQCAtNDgyLDEyICs2MDcsMjMgQEAKIGV4dGVybiBzdHJ1Y3QgbXV0ZXgg
dWJpX2RldmljZXNfbXV0ZXg7CiBleHRlcm4gc3RydWN0IGJsb2NraW5nX25vdGlmaWVyX2hlYWQg
dWJpX25vdGlmaWVyczsKIAorLyogc2Nhbi5jICovCitpbnQgdWJpX2FkZF90b19hdihzdHJ1Y3Qg
dWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSwgaW50IHBudW0sCisJ
CSAgaW50IGVjLCBjb25zdCBzdHJ1Y3QgdWJpX3ZpZF9oZHIgKnZpZF9oZHIsIGludCBiaXRmbGlw
cyk7CitzdHJ1Y3QgdWJpX2FpbmZfdm9sdW1lICp1YmlfZmluZF9hdihjb25zdCBzdHJ1Y3QgdWJp
X2F0dGFjaF9pbmZvICphaSwKKwkJCQkgICAgaW50IHZvbF9pZCk7Cit2b2lkIHViaV9yZW1vdmVf
YXYoc3RydWN0IHViaV9hdHRhY2hfaW5mbyAqYWksIHN0cnVjdCB1YmlfYWluZl92b2x1bWUgKmF2
KTsKK3N0cnVjdCB1YmlfYWluZl9wZWIgKnViaV9lYXJseV9nZXRfcGViKHN0cnVjdCB1YmlfZGV2
aWNlICp1YmksCisJCQkJICAgICAgIHN0cnVjdCB1YmlfYXR0YWNoX2luZm8gKmFpKTsKK2ludCB1
YmlfYXR0YWNoKHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpOwordm9pZCB1YmlfZGVzdHJveV9haShz
dHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSk7CisKIC8qIHZ0YmwuYyAqLwogaW50IHViaV9jaGFu
Z2VfdnRibF9yZWNvcmQoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IGlkeCwKIAkJCSAgIHN0
cnVjdCB1YmlfdnRibF9yZWNvcmQgKnZ0YmxfcmVjKTsKIGludCB1YmlfdnRibF9yZW5hbWVfdm9s
dW1lcyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLAogCQkJICAgIHN0cnVjdCBsaXN0X2hlYWQgKnJl
bmFtZV9saXN0KTsKLWludCB1YmlfcmVhZF92b2x1bWVfdGFibGUoc3RydWN0IHViaV9kZXZpY2Ug
KnViaSwgc3RydWN0IHViaV9zY2FuX2luZm8gKnNpKTsKK2ludCB1YmlfcmVhZF92b2x1bWVfdGFi
bGUoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV9hdHRhY2hfaW5mbyAqYWkpOwog
CiAvKiB2bXQuYyAqLwogaW50IHViaV9jcmVhdGVfdm9sdW1lKHN0cnVjdCB1YmlfZGV2aWNlICp1
YmksIHN0cnVjdCB1YmlfbWt2b2xfcmVxICpyZXEpOwpAQCAtNTIwLDIyICs2NTYsMjIgQEAKIGlu
dCB1YmlfZWJhX3JlYWRfbGViKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1Ymlfdm9s
dW1lICp2b2wsIGludCBsbnVtLAogCQkgICAgIHZvaWQgKmJ1ZiwgaW50IG9mZnNldCwgaW50IGxl
biwgaW50IGNoZWNrKTsKIGludCB1YmlfZWJhX3dyaXRlX2xlYihzdHJ1Y3QgdWJpX2RldmljZSAq
dWJpLCBzdHJ1Y3QgdWJpX3ZvbHVtZSAqdm9sLCBpbnQgbG51bSwKLQkJICAgICAgY29uc3Qgdm9p
ZCAqYnVmLCBpbnQgb2Zmc2V0LCBpbnQgbGVuLCBpbnQgZHR5cGUpOworCQkgICAgICBjb25zdCB2
b2lkICpidWYsIGludCBvZmZzZXQsIGludCBsZW4pOwogaW50IHViaV9lYmFfd3JpdGVfbGViX3N0
KHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1Ymlfdm9sdW1lICp2b2wsCi0JCQkgaW50
IGxudW0sIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IGxlbiwgaW50IGR0eXBlLAotCQkJIGludCB1c2Vk
X2Vicyk7CisJCQkgaW50IGxudW0sIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IGxlbiwgaW50IHVzZWRf
ZWJzKTsKIGludCB1YmlfZWJhX2F0b21pY19sZWJfY2hhbmdlKHN0cnVjdCB1YmlfZGV2aWNlICp1
YmksIHN0cnVjdCB1Ymlfdm9sdW1lICp2b2wsCi0JCQkgICAgICBpbnQgbG51bSwgY29uc3Qgdm9p
ZCAqYnVmLCBpbnQgbGVuLCBpbnQgZHR5cGUpOworCQkJICAgICAgaW50IGxudW0sIGNvbnN0IHZv
aWQgKmJ1ZiwgaW50IGxlbik7CiBpbnQgdWJpX2ViYV9jb3B5X2xlYihzdHJ1Y3QgdWJpX2Rldmlj
ZSAqdWJpLCBpbnQgZnJvbSwgaW50IHRvLAogCQkgICAgIHN0cnVjdCB1YmlfdmlkX2hkciAqdmlk
X2hkcik7Ci1pbnQgdWJpX2ViYV9pbml0X3NjYW4oc3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3Ry
dWN0IHViaV9zY2FuX2luZm8gKnNpKTsKK2ludCB1YmlfZWJhX2luaXQoc3RydWN0IHViaV9kZXZp
Y2UgKnViaSwgc3RydWN0IHViaV9hdHRhY2hfaW5mbyAqYWkpOwogCiAvKiB3bC5jICovCi1pbnQg
dWJpX3dsX2dldF9wZWIoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IGR0eXBlKTsKLWludCB1
Ymlfd2xfcHV0X3BlYihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwgaW50IHRvcnR1
cmUpOwotaW50IHViaV93bF9mbHVzaChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKTsKK2ludCB1Ymlf
d2xfZ2V0X3BlYihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKTsKK2ludCB1Ymlfd2xfcHV0X3BlYihz
dHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgdm9sX2lkLCBpbnQgbG51bSwKKwkJICAgaW50IHBu
dW0sIGludCB0b3J0dXJlKTsKK2ludCB1Ymlfd2xfZmx1c2goc3RydWN0IHViaV9kZXZpY2UgKnVi
aSwgaW50IHZvbF9pZCwgaW50IGxudW0pOwogaW50IHViaV93bF9zY3J1Yl9wZWIoc3RydWN0IHVi
aV9kZXZpY2UgKnViaSwgaW50IHBudW0pOwotaW50IHViaV93bF9pbml0X3NjYW4oc3RydWN0IHVi
aV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV9zY2FuX2luZm8gKnNpKTsKK2ludCB1Ymlfd2xfaW5p
dChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSk7CiB2
b2lkIHViaV93bF9jbG9zZShzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKTsKIGludCB1YmlfdGhyZWFk
KHZvaWQgKnUpOwogCkBAIC01NjgsNiArNzA0LDcgQEAKIGludCB1Ymlfbm90aWZ5X2FsbChzdHJ1
Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgbnR5cGUsCiAJCSAgIHN0cnVjdCBub3RpZmllcl9ibG9j
ayAqbmIpOwogaW50IHViaV9lbnVtZXJhdGVfdm9sdW1lcyhzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sg
Km5iKTsKK3ZvaWQgdWJpX2ZyZWVfaW50ZXJuYWxfdm9sdW1lcyhzdHJ1Y3QgdWJpX2RldmljZSAq
dWJpKTsKIAogLyoga2FwaS5jICovCiB2b2lkIHViaV9kb19nZXRfZGV2aWNlX2luZm8oc3RydWN0
IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV9kZXZpY2VfaW5mbyAqZGkpOwpAQCAtNTg4LDYg
KzcyNSwyMSBAQAogCSAgICAgcmIgPSByYl9uZXh0KHJiKSwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAkgICAgIHBvcyA9IChyYiA/IGNvbnRhaW5lcl9v
ZihyYiwgdHlwZW9mKCpwb3MpLCBtZW1iZXIpIDogTlVMTCkpCiAKKy8qCisgKiB1YmlfbW92ZV9h
ZWJfdG9fbGlzdCAtIG1vdmUgYSBQRUIgZnJvbSB0aGUgdm9sdW1lIHRyZWUgdG8gYSBsaXN0Lgor
ICoKKyAqIEBhdjogdm9sdW1lIGF0dGFjaGluZyBpbmZvcm1hdGlvbgorICogQGFlYjogYXR0YWNo
aW5nIGVyYXNlYmxvY2sgaW5mb3JtYXRpb24KKyAqIEBsaXN0OiB0aGUgbGlzdCB0byBtb3ZlIHRv
CisgKi8KK3N0YXRpYyBpbmxpbmUgdm9pZCB1YmlfbW92ZV9hZWJfdG9fbGlzdChzdHJ1Y3QgdWJp
X2FpbmZfdm9sdW1lICphdiwKKwkJCQkJIHN0cnVjdCB1YmlfYWluZl9wZWIgKmFlYiwKKwkJCQkJ
IHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QpCit7CisJCXJiX2VyYXNlKCZhZWItPnUucmIsICZhdi0+
cm9vdCk7CisJCWxpc3RfYWRkX3RhaWwoJmFlYi0+dS5saXN0LCBsaXN0KTsKK30KKwogLyoqCiAg
KiB1YmlfemFsbG9jX3ZpZF9oZHIgLSBhbGxvY2F0ZSBhIHZvbHVtZSBpZGVudGlmaWVyIGhlYWRl
ciBvYmplY3QuCiAgKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVjdApAQCAtNjYy
LDYgKzgxNCw3IEBACiAJaWYgKCF1YmktPnJvX21vZGUpIHsKIAkJdWJpLT5yb19tb2RlID0gMTsK
IAkJdWJpX3dhcm4oInN3aXRjaCB0byByZWFkLW9ubHkgbW9kZSIpOworCQlkdW1wX3N0YWNrKCk7
CiAJfQogfQogCmRpZmYgLXVOIC11TnIgbGludXgtMy4wL2RyaXZlcnMvbXRkL3ViaS91cGQuYyBs
aW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL3VwZC5jCi0tLSBsaW51eC0z
LjAvZHJpdmVycy9tdGQvdWJpL3VwZC5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0w
NTAwCisrKyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL3VwZC5jCTIw
MTItMDYtMjggMTE6MjY6MTUuMDAwMDAwMDAwIC0wNTAwCkBAIC0xNDcsNyArMTQ3LDcgQEAKIAl9
CiAKIAlpZiAoYnl0ZXMgPT0gMCkgewotCQllcnIgPSB1Ymlfd2xfZmx1c2godWJpKTsKKwkJZXJy
ID0gdWJpX3dsX2ZsdXNoKHViaSwgVUJJX0FMTCwgVUJJX0FMTCk7CiAJCWlmIChlcnIpCiAJCQly
ZXR1cm4gZXJyOwogCkBAIC0xODYsMTQgKzE4NiwxMiBAQAogCWRiZ19nZW4oInN0YXJ0IGNoYW5n
aW5nIExFQiAlZDolZCwgJXUgYnl0ZXMiLAogCQl2b2wtPnZvbF9pZCwgcmVxLT5sbnVtLCByZXEt
PmJ5dGVzKTsKIAlpZiAocmVxLT5ieXRlcyA9PSAwKQotCQlyZXR1cm4gdWJpX2ViYV9hdG9taWNf
bGViX2NoYW5nZSh1YmksIHZvbCwgcmVxLT5sbnVtLCBOVUxMLCAwLAotCQkJCQkJIHJlcS0+ZHR5
cGUpOworCQlyZXR1cm4gdWJpX2ViYV9hdG9taWNfbGViX2NoYW5nZSh1YmksIHZvbCwgcmVxLT5s
bnVtLCBOVUxMLCAwKTsKIAogCXZvbC0+dXBkX2J5dGVzID0gcmVxLT5ieXRlczsKIAl2b2wtPnVw
ZF9yZWNlaXZlZCA9IDA7CiAJdm9sLT5jaGFuZ2luZ19sZWIgPSAxOwogCXZvbC0+Y2hfbG51bSA9
IHJlcS0+bG51bTsKLQl2b2wtPmNoX2R0eXBlID0gcmVxLT5kdHlwZTsKIAogCXZvbC0+dXBkX2J1
ZiA9IHZtYWxsb2MocmVxLT5ieXRlcyk7CiAJaWYgKCF2b2wtPnVwZF9idWYpCkBAIC0yNDYsOCAr
MjQ0LDcgQEAKIAkJCXJldHVybiAwOwogCQl9CiAKLQkJZXJyID0gdWJpX2ViYV93cml0ZV9sZWIo
dWJpLCB2b2wsIGxudW0sIGJ1ZiwgMCwgbGVuLAotCQkJCQlVQklfVU5LTk9XTik7CisJCWVyciA9
IHViaV9lYmFfd3JpdGVfbGViKHViaSwgdm9sLCBsbnVtLCBidWYsIDAsIGxlbik7CiAJfSBlbHNl
IHsKIAkJLyoKIAkJICogV2hlbiB3cml0aW5nIHN0YXRpYyB2b2x1bWUsIGFuZCB0aGlzIGlzIHRo
ZSBsYXN0IGxvZ2ljYWwKQEAgLTI1OSw4ICsyNTYsNyBAQAogCQkgKiBjb250YWluIHplcm9zLCBu
b3QgcmFuZG9tIHRyYXNoLgogCQkgKi8KIAkJbWVtc2V0KGJ1ZiArIGxlbiwgMCwgdm9sLT51c2Fi
bGVfbGViX3NpemUgLSBsZW4pOwotCQllcnIgPSB1YmlfZWJhX3dyaXRlX2xlYl9zdCh1YmksIHZv
bCwgbG51bSwgYnVmLCBsZW4sCi0JCQkJCSAgIFVCSV9VTktOT1dOLCB1c2VkX2Vicyk7CisJCWVy
ciA9IHViaV9lYmFfd3JpdGVfbGViX3N0KHViaSwgdm9sLCBsbnVtLCBidWYsIGxlbiwgdXNlZF9l
YnMpOwogCX0KIAogCXJldHVybiBlcnI7CkBAIC0zNjUsNyArMzYxLDcgQEAKIAogCXViaV9hc3Nl
cnQodm9sLT51cGRfcmVjZWl2ZWQgPD0gdm9sLT51cGRfYnl0ZXMpOwogCWlmICh2b2wtPnVwZF9y
ZWNlaXZlZCA9PSB2b2wtPnVwZF9ieXRlcykgewotCQllcnIgPSB1Ymlfd2xfZmx1c2godWJpKTsK
KwkJZXJyID0gdWJpX3dsX2ZsdXNoKHViaSwgVUJJX0FMTCwgVUJJX0FMTCk7CiAJCWlmIChlcnIp
CiAJCQlyZXR1cm4gZXJyOwogCQkvKiBUaGUgdXBkYXRlIGlzIGZpbmlzaGVkLCBjbGVhciB0aGUg
dXBkYXRlIG1hcmtlciAqLwpAQCAtNDIxLDcgKzQxNyw3IEBACiAJCSAgICAgICBsZW4gLSB2b2wt
PnVwZF9ieXRlcyk7CiAJCWxlbiA9IHViaV9jYWxjX2RhdGFfbGVuKHViaSwgdm9sLT51cGRfYnVm
LCBsZW4pOwogCQllcnIgPSB1YmlfZWJhX2F0b21pY19sZWJfY2hhbmdlKHViaSwgdm9sLCB2b2wt
PmNoX2xudW0sCi0JCQkJCQl2b2wtPnVwZF9idWYsIGxlbiwgVUJJX1VOS05PV04pOworCQkJCQkJ
dm9sLT51cGRfYnVmLCBsZW4pOwogCQlpZiAoZXJyKQogCQkJcmV0dXJuIGVycjsKIAl9CmRpZmYg
LXVOIC11TnIgbGludXgtMy4wL2RyaXZlcnMvbXRkL3ViaS92bXQuYyBsaW51eC0zLjAueC51Ymlm
cy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL3ZtdC5jCi0tLSBsaW51eC0zLjAvZHJpdmVycy9tdGQv
dWJpL3ZtdC5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0z
LjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL3ZtdC5jCTIwMTItMDYtMjggMTE6MjY6
MTUuMDAwMDAwMDAwIC0wNTAwCkBAIC0yOCwxMSArMjgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3Ns
YWIuaD4KICNpbmNsdWRlICJ1YmkuaCIKIAotI2lmZGVmIENPTkZJR19NVERfVUJJX0RFQlVHCi1z
dGF0aWMgaW50IHBhcmFub2lkX2NoZWNrX3ZvbHVtZXMoc3RydWN0IHViaV9kZXZpY2UgKnViaSk7
Ci0jZWxzZQotI2RlZmluZSBwYXJhbm9pZF9jaGVja192b2x1bWVzKHViaSkgMAotI2VuZGlmCitz
dGF0aWMgaW50IHNlbGZfY2hlY2tfdm9sdW1lcyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKTsKIAog
c3RhdGljIHNzaXplX3Qgdm9sX2F0dHJpYnV0ZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJ
CQkgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpOwpAQCAtMjI2LDcg
KzIyMiw3IEBACiAJCQl9CiAKIAkJaWYgKHZvbF9pZCA9PSBVQklfVk9MX05VTV9BVVRPKSB7Ci0J
CQlkYmdfZXJyKCJvdXQgb2Ygdm9sdW1lIElEcyIpOworCQkJdWJpX2Vycigib3V0IG9mIHZvbHVt
ZSBJRHMiKTsKIAkJCWVyciA9IC1FTkZJTEU7CiAJCQlnb3RvIG91dF91bmxvY2s7CiAJCX0KQEAg
LTI0MCw3ICsyMzYsNyBAQAogCS8qIEVuc3VyZSB0aGF0IHRoaXMgdm9sdW1lIGRvZXMgbm90IGV4
aXN0ICovCiAJZXJyID0gLUVFWElTVDsKIAlpZiAodWJpLT52b2x1bWVzW3ZvbF9pZF0pIHsKLQkJ
ZGJnX2Vycigidm9sdW1lICVkIGFscmVhZHkgZXhpc3RzIiwgdm9sX2lkKTsKKwkJdWJpX2Vycigi
dm9sdW1lICVkIGFscmVhZHkgZXhpc3RzIiwgdm9sX2lkKTsKIAkJZ290byBvdXRfdW5sb2NrOwog
CX0KIApAQCAtMjQ5LDcgKzI0NSw3IEBACiAJCWlmICh1YmktPnZvbHVtZXNbaV0gJiYKIAkJICAg
IHViaS0+dm9sdW1lc1tpXS0+bmFtZV9sZW4gPT0gcmVxLT5uYW1lX2xlbiAmJgogCQkgICAgIXN0
cmNtcCh1YmktPnZvbHVtZXNbaV0tPm5hbWUsIHJlcS0+bmFtZSkpIHsKLQkJCWRiZ19lcnIoInZv
bHVtZSBcIiVzXCIgZXhpc3RzIChJRCAlZCkiLCByZXEtPm5hbWUsIGkpOworCQkJdWJpX2Vycigi
dm9sdW1lIFwiJXNcIiBleGlzdHMgKElEICVkKSIsIHJlcS0+bmFtZSwgaSk7CiAJCQlnb3RvIG91
dF91bmxvY2s7CiAJCX0KIApAQCAtMjYwLDkgKzI1Niw5IEBACiAKIAkvKiBSZXNlcnZlIHBoeXNp
Y2FsIGVyYXNlYmxvY2tzICovCiAJaWYgKHZvbC0+cmVzZXJ2ZWRfcGVicyA+IHViaS0+YXZhaWxf
cGVicykgewotCQlkYmdfZXJyKCJub3QgZW5vdWdoIFBFQnMsIG9ubHkgJWQgYXZhaWxhYmxlIiwg
dWJpLT5hdmFpbF9wZWJzKTsKKwkJdWJpX2Vycigibm90IGVub3VnaCBQRUJzLCBvbmx5ICVkIGF2
YWlsYWJsZSIsIHViaS0+YXZhaWxfcGVicyk7CiAJCWlmICh1YmktPmNvcnJfcGViX2NvdW50KQot
CQkJZGJnX2VycigiJWQgUEVCcyBhcmUgY29ycnVwdGVkIGFuZCBub3QgdXNlZCIsCisJCQl1Ymlf
ZXJyKCIlZCBQRUJzIGFyZSBjb3JydXB0ZWQgYW5kIG5vdCB1c2VkIiwKIAkJCQl1YmktPmNvcnJf
cGViX2NvdW50KTsKIAkJZXJyID0gLUVOT1NQQzsKIAkJZ290byBvdXRfdW5sb2NrOwpAQCAtMjgz
LDcgKzI3OSw3IEBACiAJICogRmluaXNoIGFsbCBwZW5kaW5nIGVyYXNlcyBiZWNhdXNlIHRoZXJl
IG1heSBiZSBzb21lIExFQnMgYmVsb25naW5nCiAJICogdG8gdGhlIHNhbWUgdm9sdW1lIElELgog
CSAqLwotCWVyciA9IHViaV93bF9mbHVzaCh1YmkpOworCWVyciA9IHViaV93bF9mbHVzaCh1Ymks
IHZvbF9pZCwgVUJJX0FMTCk7CiAJaWYgKGVycikKIAkJZ290byBvdXRfYWNjOwogCkBAIC0zNTks
OCArMzU1LDcgQEAKIAlzcGluX3VubG9jaygmdWJpLT52b2x1bWVzX2xvY2spOwogCiAJdWJpX3Zv
bHVtZV9ub3RpZnkodWJpLCB2b2wsIFVCSV9WT0xVTUVfQURERUQpOwotCWlmIChwYXJhbm9pZF9j
aGVja192b2x1bWVzKHViaSkpCi0JCWRiZ19lcnIoImNoZWNrIGZhaWxlZCB3aGlsZSBjcmVhdGlu
ZyB2b2x1bWUgJWQiLCB2b2xfaWQpOworCXNlbGZfY2hlY2tfdm9sdW1lcyh1YmkpOwogCXJldHVy
biBlcnI7CiAKIG91dF9zeXNmczoKQEAgLTQ2MCw4ICs0NTUsOCBAQAogCXNwaW5fdW5sb2NrKCZ1
YmktPnZvbHVtZXNfbG9jayk7CiAKIAl1Ymlfdm9sdW1lX25vdGlmeSh1YmksIHZvbCwgVUJJX1ZP
TFVNRV9SRU1PVkVEKTsKLQlpZiAoIW5vX3Z0YmwgJiYgcGFyYW5vaWRfY2hlY2tfdm9sdW1lcyh1
YmkpKQotCQlkYmdfZXJyKCJjaGVjayBmYWlsZWQgd2hpbGUgcmVtb3Zpbmcgdm9sdW1lICVkIiwg
dm9sX2lkKTsKKwlpZiAoIW5vX3Z0YmwpCisJCXNlbGZfY2hlY2tfdm9sdW1lcyh1YmkpOwogCiAJ
cmV0dXJuIGVycjsKIApAQCAtNDk5LDcgKzQ5NCw3IEBACiAKIAlpZiAodm9sLT52b2xfdHlwZSA9
PSBVQklfU1RBVElDX1ZPTFVNRSAmJgogCSAgICByZXNlcnZlZF9wZWJzIDwgdm9sLT51c2VkX2Vi
cykgewotCQlkYmdfZXJyKCJ0b28gc21hbGwgc2l6ZSAlZCwgJWQgTEVCcyBjb250YWluIGRhdGEi
LAorCQl1YmlfZXJyKCJ0b28gc21hbGwgc2l6ZSAlZCwgJWQgTEVCcyBjb250YWluIGRhdGEiLAog
CQkJcmVzZXJ2ZWRfcGVicywgdm9sLT51c2VkX2Vicyk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0K
QEAgLTUyOCwxMCArNTIzLDEwIEBACiAJaWYgKHBlYnMgPiAwKSB7CiAJCXNwaW5fbG9jaygmdWJp
LT52b2x1bWVzX2xvY2spOwogCQlpZiAocGVicyA+IHViaS0+YXZhaWxfcGVicykgewotCQkJZGJn
X2Vycigibm90IGVub3VnaCBQRUJzOiByZXF1ZXN0ZWQgJWQsIGF2YWlsYWJsZSAlZCIsCisJCQl1
YmlfZXJyKCJub3QgZW5vdWdoIFBFQnM6IHJlcXVlc3RlZCAlZCwgYXZhaWxhYmxlICVkIiwKIAkJ
CQlwZWJzLCB1YmktPmF2YWlsX3BlYnMpOwogCQkJaWYgKHViaS0+Y29ycl9wZWJfY291bnQpCi0J
CQkJZGJnX2VycigiJWQgUEVCcyBhcmUgY29ycnVwdGVkIGFuZCBub3QgdXNlZCIsCisJCQkJdWJp
X2VycigiJWQgUEVCcyBhcmUgY29ycnVwdGVkIGFuZCBub3QgdXNlZCIsCiAJCQkJCXViaS0+Y29y
cl9wZWJfY291bnQpOwogCQkJc3Bpbl91bmxvY2soJnViaS0+dm9sdW1lc19sb2NrKTsKIAkJCWVy
ciA9IC1FTk9TUEM7CkBAIC01ODcsOCArNTgyLDcgQEAKIAl9CiAKIAl1Ymlfdm9sdW1lX25vdGlm
eSh1YmksIHZvbCwgVUJJX1ZPTFVNRV9SRVNJWkVEKTsKLQlpZiAocGFyYW5vaWRfY2hlY2tfdm9s
dW1lcyh1YmkpKQotCQlkYmdfZXJyKCJjaGVjayBmYWlsZWQgd2hpbGUgcmUtc2l6aW5nIHZvbHVt
ZSAlZCIsIHZvbF9pZCk7CisJc2VsZl9jaGVja192b2x1bWVzKHViaSk7CiAJcmV0dXJuIGVycjsK
IAogb3V0X2FjYzoKQEAgLTYzNyw4ICs2MzEsOCBAQAogCQl9CiAJfQogCi0JaWYgKCFlcnIgJiYg
cGFyYW5vaWRfY2hlY2tfdm9sdW1lcyh1YmkpKQotCQk7CisJaWYgKCFlcnIpCisJCXNlbGZfY2hl
Y2tfdm9sdW1lcyh1YmkpOwogCXJldHVybiBlcnI7CiB9CiAKQEAgLTY4NSw4ICs2NzksNyBAQAog
CQlyZXR1cm4gZXJyOwogCX0KIAotCWlmIChwYXJhbm9pZF9jaGVja192b2x1bWVzKHViaSkpCi0J
CWRiZ19lcnIoImNoZWNrIGZhaWxlZCB3aGlsZSBhZGRpbmcgdm9sdW1lICVkIiwgdm9sX2lkKTsK
KwlzZWxmX2NoZWNrX3ZvbHVtZXModWJpKTsKIAlyZXR1cm4gZXJyOwogCiBvdXRfY2RldjoKQEAg
LTcxMSwxNiArNzA0LDE0IEBACiAJdm9sdW1lX3N5c2ZzX2Nsb3NlKHZvbCk7CiB9CiAKLSNpZmRl
ZiBDT05GSUdfTVREX1VCSV9ERUJVRwotCiAvKioKLSAqIHBhcmFub2lkX2NoZWNrX3ZvbHVtZSAt
IGNoZWNrIHZvbHVtZSBpbmZvcm1hdGlvbi4KKyAqIHNlbGZfY2hlY2tfdm9sdW1lIC0gY2hlY2sg
dm9sdW1lIGluZm9ybWF0aW9uLgogICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmpl
Y3QKICAqIEB2b2xfaWQ6IHZvbHVtZSBJRAogICoKICAqIFJldHVybnMgemVybyBpZiB2b2x1bWUg
aXMgYWxsIHJpZ2h0IGFuZCBhIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBpZiBub3QuCiAgKi8KLXN0
YXRpYyBpbnQgcGFyYW5vaWRfY2hlY2tfdm9sdW1lKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGlu
dCB2b2xfaWQpCitzdGF0aWMgaW50IHNlbGZfY2hlY2tfdm9sdW1lKHN0cnVjdCB1YmlfZGV2aWNl
ICp1YmksIGludCB2b2xfaWQpCiB7CiAJaW50IGlkeCA9IHZvbF9pZDJpZHgodWJpLCB2b2xfaWQp
OwogCWludCByZXNlcnZlZF9wZWJzLCBhbGlnbm1lbnQsIGRhdGFfcGFkLCB2b2xfdHlwZSwgbmFt
ZV9sZW4sIHVwZF9tYXJrZXI7CkBAIC03NzAsNyArNzYxLDcgQEAKIAl9CiAKIAlpZiAodm9sLT51
cGRfbWFya2VyICYmIHZvbC0+Y29ycnVwdGVkKSB7Ci0JCWRiZ19lcnIoInVwZGF0ZSBtYXJrZXIg
YW5kIGNvcnJ1cHRlZCBzaW11bHRhbmVvdXNseSIpOworCQl1YmlfZXJyKCJ1cGRhdGUgbWFya2Vy
IGFuZCBjb3JydXB0ZWQgc2ltdWx0YW5lb3VzbHkiKTsKIAkJZ290byBmYWlsOwogCX0KIApAQCAt
ODUyLDM0ICs4NDMsMzMgQEAKIAlyZXR1cm4gMDsKIAogZmFpbDoKLQl1YmlfZXJyKCJwYXJhbm9p
ZCBjaGVjayBmYWlsZWQgZm9yIHZvbHVtZSAlZCIsIHZvbF9pZCk7CisJdWJpX2Vycigic2VsZi1j
aGVjayBmYWlsZWQgZm9yIHZvbHVtZSAlZCIsIHZvbF9pZCk7CiAJaWYgKHZvbCkKLQkJdWJpX2Ri
Z19kdW1wX3ZvbF9pbmZvKHZvbCk7Ci0JdWJpX2RiZ19kdW1wX3Z0YmxfcmVjb3JkKCZ1YmktPnZ0
Ymxbdm9sX2lkXSwgdm9sX2lkKTsKKwkJdWJpX2R1bXBfdm9sX2luZm8odm9sKTsKKwl1YmlfZHVt
cF92dGJsX3JlY29yZCgmdWJpLT52dGJsW3ZvbF9pZF0sIHZvbF9pZCk7CiAJZHVtcF9zdGFjaygp
OwogCXNwaW5fdW5sb2NrKCZ1YmktPnZvbHVtZXNfbG9jayk7CiAJcmV0dXJuIC1FSU5WQUw7CiB9
CiAKIC8qKgotICogcGFyYW5vaWRfY2hlY2tfdm9sdW1lcyAtIGNoZWNrIGluZm9ybWF0aW9uIGFi
b3V0IGFsbCB2b2x1bWVzLgorICogc2VsZl9jaGVja192b2x1bWVzIC0gY2hlY2sgaW5mb3JtYXRp
b24gYWJvdXQgYWxsIHZvbHVtZXMuCiAgKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9i
amVjdAogICoKICAqIFJldHVybnMgemVybyBpZiB2b2x1bWVzIGFyZSBhbGwgcmlnaHQgYW5kIGEg
YSBuZWdhdGl2ZSBlcnJvciBjb2RlIGlmIG5vdC4KICAqLwotc3RhdGljIGludCBwYXJhbm9pZF9j
aGVja192b2x1bWVzKHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCitzdGF0aWMgaW50IHNlbGZfY2hl
Y2tfdm9sdW1lcyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKQogewogCWludCBpLCBlcnIgPSAwOwog
Ci0JaWYgKCEodWJpX2Noa19mbGFncyAmIFVCSV9DSEtfR0VOKSkKKwlpZiAoIXViaS0+ZGJnLT5j
aGtfZ2VuKQogCQlyZXR1cm4gMDsKIAogCWZvciAoaSA9IDA7IGkgPCB1YmktPnZ0Ymxfc2xvdHM7
IGkrKykgewotCQllcnIgPSBwYXJhbm9pZF9jaGVja192b2x1bWUodWJpLCBpKTsKKwkJZXJyID0g
c2VsZl9jaGVja192b2x1bWUodWJpLCBpKTsKIAkJaWYgKGVycikKIAkJCWJyZWFrOwogCX0KIAog
CXJldHVybiBlcnI7CiB9Ci0jZW5kaWYKZGlmZiAtdU4gLXVOciBsaW51eC0zLjAvZHJpdmVycy9t
dGQvdWJpL3Z0YmwuYyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZHJpdmVycy9tdGQvdWJpL3Z0
YmwuYwotLS0gbGludXgtMy4wL2RyaXZlcnMvbXRkL3ViaS92dGJsLmMJMjAxMS0wNy0yMSAyMTox
NzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9kcml2ZXJz
L210ZC91YmkvdnRibC5jCTIwMTItMDYtMjggMTE6MjY6MTUuMDAwMDAwMDAwIC0wNTAwCkBAIC0z
NywxNiArMzcsMTUgQEAKICAqIExFQiAxLiBUaGlzIHNjaGVtZSBndWFyYW50ZWVzIHJlY292ZXJh
YmlsaXR5IGZyb20gdW5jbGVhbiByZWJvb3RzLgogICoKICAqIEluIHRoaXMgVUJJIGltcGxlbWVu
dGF0aW9uIHRoZSBvbi1mbGFzaCB2b2x1bWUgdGFibGUgZG9lcyBub3QgY29udGFpbiBhbnkKLSAq
IGluZm9ybWF0aW9uIGFib3V0IGhvdyBtYW55IGRhdGEgc3RhdGljIHZvbHVtZXMgY29udGFpbi4g
VGhpcyBpbmZvcm1hdGlvbiBtYXkKLSAqIGJlIGZvdW5kIGZyb20gdGhlIHNjYW5uaW5nIGRhdGEu
CisgKiBpbmZvcm1hdGlvbiBhYm91dCBob3cgbXVjaCBkYXRhIHN0YXRpYyB2b2x1bWVzIGNvbnRh
aW4uCiAgKgogICogQnV0IGl0IHdvdWxkIHN0aWxsIGJlIGJlbmVmaWNpYWwgdG8gc3RvcmUgdGhp
cyBpbmZvcm1hdGlvbiBpbiB0aGUgdm9sdW1lCiAgKiB0YWJsZS4gRm9yIGV4YW1wbGUsIHN1cHBv
c2Ugd2UgaGF2ZSBhIHN0YXRpYyB2b2x1bWUgWCwgYW5kIGFsbCBpdHMgcGh5c2ljYWwKICAqIGVy
YXNlYmxvY2tzIGJlY2FtZSBiYWQgZm9yIHNvbWUgcmVhc29ucy4gU3VwcG9zZSB3ZSBhcmUgYXR0
YWNoaW5nIHRoZQotICogY29ycmVzcG9uZGluZyBNVEQgZGV2aWNlLCB0aGUgc2Nhbm5pbmcgaGFz
IGZvdW5kIG5vIGxvZ2ljYWwgZXJhc2VibG9ja3MKKyAqIGNvcnJlc3BvbmRpbmcgTVREIGRldmlj
ZSwgZm9yIHNvbWUgcmVhc29uIHdlIGZpbmQgbm8gbG9naWNhbCBlcmFzZWJsb2NrcwogICogY29y
cmVzcG9uZGluZyB0byB0aGUgdm9sdW1lIFguIEFjY29yZGluZyB0byB0aGUgdm9sdW1lIHRhYmxl
IHZvbHVtZSBYIGRvZXMKICAqIGV4aXN0LiBTbyB3ZSBkb24ndCBrbm93IHdoZXRoZXIgaXQgaXMg
anVzdCBlbXB0eSBvciBhbGwgaXRzIHBoeXNpY2FsCi0gKiBlcmFzZWJsb2NrcyB3ZW50IGJhZC4g
U28gd2UgY2Fubm90IGFsYXJtIHRoZSB1c2VyIGFib3V0IHRoaXMgY29ycnVwdGlvbi4KKyAqIGVy
YXNlYmxvY2tzIHdlbnQgYmFkLiBTbyB3ZSBjYW5ub3QgYWxhcm0gdGhlIHVzZXIgcHJvcGVybHku
CiAgKgogICogVGhlIHZvbHVtZSB0YWJsZSBhbHNvIHN0b3JlcyBzby1jYWxsZWQgInVwZGF0ZSBt
YXJrZXIiLCB3aGljaCBpcyB1c2VkIGZvcgogICogdm9sdW1lIHVwZGF0ZXMuIEJlZm9yZSB1cGRh
dGluZyB0aGUgdm9sdW1lLCB0aGUgdXBkYXRlIG1hcmtlciBpcyBzZXQsIGFuZApAQCAtNjIsMTEg
KzYxLDcgQEAKICNpbmNsdWRlIDxhc20vZGl2NjQuaD4KICNpbmNsdWRlICJ1YmkuaCIKIAotI2lm
ZGVmIENPTkZJR19NVERfVUJJX0RFQlVHCi1zdGF0aWMgdm9pZCBwYXJhbm9pZF92dGJsX2NoZWNr
KGNvbnN0IHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpOwotI2Vsc2UKLSNkZWZpbmUgcGFyYW5vaWRf
dnRibF9jaGVjayh1YmkpCi0jZW5kaWYKK3N0YXRpYyB2b2lkIHNlbGZfdnRibF9jaGVjayhjb25z
dCBzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKTsKIAogLyogRW1wdHkgdm9sdW1lIHRhYmxlIHJlY29y
ZCAqLwogc3RhdGljIHN0cnVjdCB1YmlfdnRibF9yZWNvcmQgZW1wdHlfdnRibF9yZWNvcmQ7CkBA
IC0xMDYsMTIgKzEwMSwxMiBAQAogCQkJcmV0dXJuIGVycjsKIAogCQllcnIgPSB1YmlfZWJhX3dy
aXRlX2xlYih1YmksIGxheW91dF92b2wsIGksIHViaS0+dnRibCwgMCwKLQkJCQkJdWJpLT52dGJs
X3NpemUsIFVCSV9MT05HVEVSTSk7CisJCQkJCXViaS0+dnRibF9zaXplKTsKIAkJaWYgKGVycikK
IAkJCXJldHVybiBlcnI7CiAJfQogCi0JcGFyYW5vaWRfdnRibF9jaGVjayh1YmkpOworCXNlbGZf
dnRibF9jaGVjayh1YmkpOwogCXJldHVybiAwOwogfQogCkBAIC0xNTgsNyArMTUzLDcgQEAKIAkJ
CXJldHVybiBlcnI7CiAKIAkJZXJyID0gdWJpX2ViYV93cml0ZV9sZWIodWJpLCBsYXlvdXRfdm9s
LCBpLCB1YmktPnZ0YmwsIDAsCi0JCQkJCXViaS0+dnRibF9zaXplLCBVQklfTE9OR1RFUk0pOwor
CQkJCQl1YmktPnZ0Ymxfc2l6ZSk7CiAJCWlmIChlcnIpCiAJCQlyZXR1cm4gZXJyOwogCX0KQEAg
LTE5Nyw3ICsxOTIsNyBAQAogCQlpZiAoYmUzMl90b19jcHUodnRibFtpXS5jcmMpICE9IGNyYykg
ewogCQkJdWJpX2VycigiYmFkIENSQyBhdCByZWNvcmQgJXU6ICUjMDh4LCBub3QgJSMwOHgiLAog
CQkJCSBpLCBjcmMsIGJlMzJfdG9fY3B1KHZ0YmxbaV0uY3JjKSk7Ci0JCQl1YmlfZGJnX2R1bXBf
dnRibF9yZWNvcmQoJnZ0YmxbaV0sIGkpOworCQkJdWJpX2R1bXBfdnRibF9yZWNvcmQoJnZ0Ymxb
aV0sIGkpOwogCQkJcmV0dXJuIDE7CiAJCX0KIApAQCAtMjI5LDcgKzIyNCw3IEBACiAKIAkJbiA9
IHViaS0+bGViX3NpemUgJSBhbGlnbm1lbnQ7CiAJCWlmIChkYXRhX3BhZCAhPSBuKSB7Ci0JCQlk
YmdfZXJyKCJiYWQgZGF0YV9wYWQsIGhhcyB0byBiZSAlZCIsIG4pOworCQkJdWJpX2VycigiYmFk
IGRhdGFfcGFkLCBoYXMgdG8gYmUgJWQiLCBuKTsKIAkJCWVyciA9IDY7CiAJCQlnb3RvIGJhZDsK
IAkJfQpAQCAtMjQ1LDcgKzI0MCw3IEBACiAJCX0KIAogCQlpZiAocmVzZXJ2ZWRfcGVicyA+IHVi
aS0+Z29vZF9wZWJfY291bnQpIHsKLQkJCWRiZ19lcnIoInRvbyBsYXJnZSByZXNlcnZlZF9wZWJz
ICVkLCBnb29kIFBFQnMgJWQiLAorCQkJdWJpX2VycigidG9vIGxhcmdlIHJlc2VydmVkX3BlYnMg
JWQsIGdvb2QgUEVCcyAlZCIsCiAJCQkJcmVzZXJ2ZWRfcGVicywgdWJpLT5nb29kX3BlYl9jb3Vu
dCk7CiAJCQllcnIgPSA5OwogCQkJZ290byBiYWQ7CkBAIC0yNzcsOCArMjcyLDggQEAKIAkJCSAg
ICAhc3RybmNtcCh2dGJsW2ldLm5hbWUsIHZ0Ymxbbl0ubmFtZSwgbGVuMSkpIHsKIAkJCQl1Ymlf
ZXJyKCJ2b2x1bWVzICVkIGFuZCAlZCBoYXZlIHRoZSBzYW1lIG5hbWUiCiAJCQkJCSIgXCIlc1wi
IiwgaSwgbiwgdnRibFtpXS5uYW1lKTsKLQkJCQl1YmlfZGJnX2R1bXBfdnRibF9yZWNvcmQoJnZ0
YmxbaV0sIGkpOwotCQkJCXViaV9kYmdfZHVtcF92dGJsX3JlY29yZCgmdnRibFtuXSwgbik7CisJ
CQkJdWJpX2R1bXBfdnRibF9yZWNvcmQoJnZ0YmxbaV0sIGkpOworCQkJCXViaV9kdW1wX3Z0Ymxf
cmVjb3JkKCZ2dGJsW25dLCBuKTsKIAkJCQlyZXR1cm4gLUVJTlZBTDsKIAkJCX0KIAkJfQpAQCAt
Mjg4LDI3ICsyODMsMjYgQEAKIAogYmFkOgogCXViaV9lcnIoInZvbHVtZSB0YWJsZSBjaGVjayBm
YWlsZWQ6IHJlY29yZCAlZCwgZXJyb3IgJWQiLCBpLCBlcnIpOwotCXViaV9kYmdfZHVtcF92dGJs
X3JlY29yZCgmdnRibFtpXSwgaSk7CisJdWJpX2R1bXBfdnRibF9yZWNvcmQoJnZ0YmxbaV0sIGkp
OwogCXJldHVybiAtRUlOVkFMOwogfQogCiAvKioKICAqIGNyZWF0ZV92dGJsIC0gY3JlYXRlIGEg
Y29weSBvZiB2b2x1bWUgdGFibGUuCiAgKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9i
amVjdAotICogQHNpOiBzY2FubmluZyBpbmZvcm1hdGlvbgorICogQGFpOiBhdHRhY2hpbmcgaW5m
b3JtYXRpb24KICAqIEBjb3B5OiBudW1iZXIgb2YgdGhlIHZvbHVtZSB0YWJsZSBjb3B5CiAgKiBA
dnRibDogY29udGVudHMgb2YgdGhlIHZvbHVtZSB0YWJsZQogICoKICAqIFRoaXMgZnVuY3Rpb24g
cmV0dXJucyB6ZXJvIGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2Rl
IGluCiAgKiBjYXNlIG9mIGZhaWx1cmUuCiAgKi8KLXN0YXRpYyBpbnQgY3JlYXRlX3Z0Ymwoc3Ry
dWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV9zY2FuX2luZm8gKnNpLAorc3RhdGljIGlu
dCBjcmVhdGVfdnRibChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX2F0dGFjaF9p
bmZvICphaSwKIAkJICAgICAgIGludCBjb3B5LCB2b2lkICp2dGJsKQogewogCWludCBlcnIsIHRy
aWVzID0gMDsKLQlzdGF0aWMgc3RydWN0IHViaV92aWRfaGRyICp2aWRfaGRyOwotCXN0cnVjdCB1
Ymlfc2Nhbl92b2x1bWUgKnN2OwotCXN0cnVjdCB1Ymlfc2Nhbl9sZWIgKm5ld19zZWIsICpvbGRf
c2ViID0gTlVMTDsKKwlzdHJ1Y3QgdWJpX3ZpZF9oZHIgKnZpZF9oZHI7CisJc3RydWN0IHViaV9h
aW5mX3BlYiAqbmV3X2FlYjsKIAogCXViaV9tc2coImNyZWF0ZSB2b2x1bWUgdGFibGUgKGNvcHkg
IyVkKSIsIGNvcHkgKyAxKTsKIApAQCAtMzE2LDQ3ICszMTAsMzcgQEAKIAlpZiAoIXZpZF9oZHIp
CiAJCXJldHVybiAtRU5PTUVNOwogCi0JLyoKLQkgKiBDaGVjayBpZiB0aGVyZSBpcyBhIGxvZ2lj
YWwgZXJhc2VibG9jayB3aGljaCB3b3VsZCBoYXZlIHRvIGNvbnRhaW4KLQkgKiB0aGlzIHZvbHVt
ZSB0YWJsZSBjb3B5IHdhcyBmb3VuZCBkdXJpbmcgc2Nhbm5pbmcuIEl0IGhhcyB0byBiZSB3aXBl
ZAotCSAqIG91dC4KLQkgKi8KLQlzdiA9IHViaV9zY2FuX2ZpbmRfc3Yoc2ksIFVCSV9MQVlPVVRf
Vk9MVU1FX0lEKTsKLQlpZiAoc3YpCi0JCW9sZF9zZWIgPSB1Ymlfc2Nhbl9maW5kX3NlYihzdiwg
Y29weSk7Ci0KIHJldHJ5OgotCW5ld19zZWIgPSB1Ymlfc2Nhbl9nZXRfZnJlZV9wZWIodWJpLCBz
aSk7Ci0JaWYgKElTX0VSUihuZXdfc2ViKSkgewotCQllcnIgPSBQVFJfRVJSKG5ld19zZWIpOwor
CW5ld19hZWIgPSB1YmlfZWFybHlfZ2V0X3BlYih1YmksIGFpKTsKKwlpZiAoSVNfRVJSKG5ld19h
ZWIpKSB7CisJCWVyciA9IFBUUl9FUlIobmV3X2FlYik7CiAJCWdvdG8gb3V0X2ZyZWU7CiAJfQog
Ci0JdmlkX2hkci0+dm9sX3R5cGUgPSBVQklfVklEX0RZTkFNSUM7CisJdmlkX2hkci0+dm9sX3R5
cGUgPSBVQklfTEFZT1VUX1ZPTFVNRV9UWVBFOwogCXZpZF9oZHItPnZvbF9pZCA9IGNwdV90b19i
ZTMyKFVCSV9MQVlPVVRfVk9MVU1FX0lEKTsKIAl2aWRfaGRyLT5jb21wYXQgPSBVQklfTEFZT1VU
X1ZPTFVNRV9DT01QQVQ7CiAJdmlkX2hkci0+ZGF0YV9zaXplID0gdmlkX2hkci0+dXNlZF9lYnMg
PQogCQkJICAgICB2aWRfaGRyLT5kYXRhX3BhZCA9IGNwdV90b19iZTMyKDApOwogCXZpZF9oZHIt
PmxudW0gPSBjcHVfdG9fYmUzMihjb3B5KTsKLQl2aWRfaGRyLT5zcW51bSA9IGNwdV90b19iZTY0
KCsrc2ktPm1heF9zcW51bSk7CisJdmlkX2hkci0+c3FudW0gPSBjcHVfdG9fYmU2NCgrK2FpLT5t
YXhfc3FudW0pOwogCiAJLyogVGhlIEVDIGhlYWRlciBpcyBhbHJlYWR5IHRoZXJlLCB3cml0ZSB0
aGUgVklEIGhlYWRlciAqLwotCWVyciA9IHViaV9pb193cml0ZV92aWRfaGRyKHViaSwgbmV3X3Nl
Yi0+cG51bSwgdmlkX2hkcik7CisJZXJyID0gdWJpX2lvX3dyaXRlX3ZpZF9oZHIodWJpLCBuZXdf
YWViLT5wbnVtLCB2aWRfaGRyKTsKIAlpZiAoZXJyKQogCQlnb3RvIHdyaXRlX2Vycm9yOwogCiAJ
LyogV3JpdGUgdGhlIGxheW91dCB2b2x1bWUgY29udGVudHMgKi8KLQllcnIgPSB1YmlfaW9fd3Jp
dGVfZGF0YSh1YmksIHZ0YmwsIG5ld19zZWItPnBudW0sIDAsIHViaS0+dnRibF9zaXplKTsKKwll
cnIgPSB1YmlfaW9fd3JpdGVfZGF0YSh1YmksIHZ0YmwsIG5ld19hZWItPnBudW0sIDAsIHViaS0+
dnRibF9zaXplKTsKIAlpZiAoZXJyKQogCQlnb3RvIHdyaXRlX2Vycm9yOwogCiAJLyoKLQkgKiBB
bmQgYWRkIGl0IHRvIHRoZSBzY2FubmluZyBpbmZvcm1hdGlvbi4gRG9uJ3QgZGVsZXRlIHRoZSBv
bGQKLQkgKiBAb2xkX3NlYiBhcyBpdCB3aWxsIGJlIGRlbGV0ZWQgYW5kIGZyZWVkIGluICd1Ymlf
c2Nhbl9hZGRfdXNlZCgpJy4KKwkgKiBBbmQgYWRkIGl0IHRvIHRoZSBhdHRhY2hpbmcgaW5mb3Jt
YXRpb24uIERvbid0IGRlbGV0ZSB0aGUgb2xkIHZlcnNpb24KKwkgKiBvZiB0aGlzIExFQiBhcyBp
dCB3aWxsIGJlIGRlbGV0ZWQgYW5kIGZyZWVkIGluICd1YmlfYWRkX3RvX2F2KCknLgogCSAqLwot
CWVyciA9IHViaV9zY2FuX2FkZF91c2VkKHViaSwgc2ksIG5ld19zZWItPnBudW0sIG5ld19zZWIt
PmVjLAotCQkJCXZpZF9oZHIsIDApOwotCWtmcmVlKG5ld19zZWIpOworCWVyciA9IHViaV9hZGRf
dG9fYXYodWJpLCBhaSwgbmV3X2FlYi0+cG51bSwgbmV3X2FlYi0+ZWMsIHZpZF9oZHIsIDApOwor
CWtmcmVlKG5ld19hZWIpOwogCXViaV9mcmVlX3ZpZF9oZHIodWJpLCB2aWRfaGRyKTsKIAlyZXR1
cm4gZXJyOwogCkBAIC0zNjYsMTAgKzM1MCwxMCBAQAogCQkgKiBQcm9iYWJseSB0aGlzIHBoeXNp
Y2FsIGVyYXNlYmxvY2sgd2VudCBiYWQsIHRyeSB0byBwaWNrCiAJCSAqIGFub3RoZXIgb25lLgog
CQkgKi8KLQkJbGlzdF9hZGQoJm5ld19zZWItPnUubGlzdCwgJnNpLT5lcmFzZSk7CisJCWxpc3Rf
YWRkKCZuZXdfYWViLT51Lmxpc3QsICZhaS0+ZXJhc2UpOwogCQlnb3RvIHJldHJ5OwogCX0KLQlr
ZnJlZShuZXdfc2ViKTsKKwlrZnJlZShuZXdfYWViKTsKIG91dF9mcmVlOgogCXViaV9mcmVlX3Zp
ZF9oZHIodWJpLCB2aWRfaGRyKTsKIAlyZXR1cm4gZXJyOwpAQCAtMzc5LDIwICszNjMsMjAgQEAK
IC8qKgogICogcHJvY2Vzc19sdm9sIC0gcHJvY2VzcyB0aGUgbGF5b3V0IHZvbHVtZS4KICAqIEB1
Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0Ci0gKiBAc2k6IHNjYW5uaW5nIGluZm9y
bWF0aW9uCi0gKiBAc3Y6IGxheW91dCB2b2x1bWUgc2Nhbm5pbmcgaW5mb3JtYXRpb24KKyAqIEBh
aTogYXR0YWNoaW5nIGluZm9ybWF0aW9uCisgKiBAYXY6IGxheW91dCB2b2x1bWUgYXR0YWNoaW5n
IGluZm9ybWF0aW9uCiAgKgogICogVGhpcyBmdW5jdGlvbiBpcyByZXNwb25zaWJsZSBmb3IgcmVh
ZGluZyB0aGUgbGF5b3V0IHZvbHVtZSwgZW5zdXJpbmcgaXQgaXMKICAqIG5vdCBjb3JydXB0ZWQs
IGFuZCByZWNvdmVyaW5nIGZyb20gY29ycnVwdGlvbnMgaWYgbmVlZGVkLiBSZXR1cm5zIHZvbHVt
ZQogICogdGFibGUgaW4gY2FzZSBvZiBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUg
aW4gY2FzZSBvZiBmYWlsdXJlLgogICovCiBzdGF0aWMgc3RydWN0IHViaV92dGJsX3JlY29yZCAq
cHJvY2Vzc19sdm9sKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksCi0JCQkJCSAgICBzdHJ1Y3QgdWJp
X3NjYW5faW5mbyAqc2ksCi0JCQkJCSAgICBzdHJ1Y3QgdWJpX3NjYW5fdm9sdW1lICpzdikKKwkJ
CQkJICAgIHN0cnVjdCB1YmlfYXR0YWNoX2luZm8gKmFpLAorCQkJCQkgICAgc3RydWN0IHViaV9h
aW5mX3ZvbHVtZSAqYXYpCiB7CiAJaW50IGVycjsKIAlzdHJ1Y3QgcmJfbm9kZSAqcmI7Ci0Jc3Ry
dWN0IHViaV9zY2FuX2xlYiAqc2ViOworCXN0cnVjdCB1YmlfYWluZl9wZWIgKmFlYjsKIAlzdHJ1
Y3QgdWJpX3Z0YmxfcmVjb3JkICpsZWJbVUJJX0xBWU9VVF9WT0xVTUVfRUJTXSA9IHsgTlVMTCwg
TlVMTCB9OwogCWludCBsZWJfY29ycnVwdGVkW1VCSV9MQVlPVVRfVk9MVU1FX0VCU10gPSB7MSwg
MX07CiAKQEAgLTQyNCwxNCArNDA4LDE0IEBACiAJZGJnX2dlbigiY2hlY2sgbGF5b3V0IHZvbHVt
ZSIpOwogCiAJLyogUmVhZCBib3RoIExFQiAwIGFuZCBMRUIgMSBpbnRvIG1lbW9yeSAqLwotCXVi
aV9yYl9mb3JfZWFjaF9lbnRyeShyYiwgc2ViLCAmc3YtPnJvb3QsIHUucmIpIHsKLQkJbGViW3Nl
Yi0+bG51bV0gPSB2emFsbG9jKHViaS0+dnRibF9zaXplKTsKLQkJaWYgKCFsZWJbc2ViLT5sbnVt
XSkgeworCXViaV9yYl9mb3JfZWFjaF9lbnRyeShyYiwgYWViLCAmYXYtPnJvb3QsIHUucmIpIHsK
KwkJbGViW2FlYi0+bG51bV0gPSB2emFsbG9jKHViaS0+dnRibF9zaXplKTsKKwkJaWYgKCFsZWJb
YWViLT5sbnVtXSkgewogCQkJZXJyID0gLUVOT01FTTsKIAkJCWdvdG8gb3V0X2ZyZWU7CiAJCX0K
IAotCQllcnIgPSB1YmlfaW9fcmVhZF9kYXRhKHViaSwgbGViW3NlYi0+bG51bV0sIHNlYi0+cG51
bSwgMCwKKwkJZXJyID0gdWJpX2lvX3JlYWRfZGF0YSh1YmksIGxlYlthZWItPmxudW1dLCBhZWIt
PnBudW0sIDAsCiAJCQkJICAgICAgIHViaS0+dnRibF9zaXplKTsKIAkJaWYgKGVyciA9PSBVQklf
SU9fQklURkxJUFMgfHwgZXJyID09IC1FQkFETVNHKQogCQkJLyoKQEAgLTQzOSwxMiArNDIzLDEy
IEBACiAJCQkgKiB1bmNvcnJlY3RhYmxlIEVDQyBlcnJvciwgYnV0IHdlIGhhdmUgb3VyIG93biBD
UkMgYW5kCiAJCQkgKiB0aGUgZGF0YSB3aWxsIGJlIGNoZWNrZWQgbGF0ZXIuIElmIHRoZSBkYXRh
IGlzIE9LLAogCQkJICogdGhlIFBFQiB3aWxsIGJlIHNjcnViYmVkIChiZWNhdXNlIHdlIHNldAot
CQkJICogc2ViLT5zY3J1YikuIElmIHRoZSBkYXRhIGlzIG5vdCBPSywgdGhlIGNvbnRlbnRzIG9m
CisJCQkgKiBhZWItPnNjcnViKS4gSWYgdGhlIGRhdGEgaXMgbm90IE9LLCB0aGUgY29udGVudHMg
b2YKIAkJCSAqIHRoZSBQRUIgd2lsbCBiZSByZWNvdmVyZWQgZnJvbSB0aGUgc2Vjb25kIGNvcHks
IGFuZAotCQkJICogc2ViLT5zY3J1YiB3aWxsIGJlIGNsZWFyZWQgaW4KLQkJCSAqICd1Ymlfc2Nh
bl9hZGRfdXNlZCgpJy4KKwkJCSAqIGFlYi0+c2NydWIgd2lsbCBiZSBjbGVhcmVkIGluCisJCQkg
KiAndWJpX2FkZF90b19hdigpJy4KIAkJCSAqLwotCQkJc2ViLT5zY3J1YiA9IDE7CisJCQlhZWIt
PnNjcnViID0gMTsKIAkJZWxzZSBpZiAoZXJyKQogCQkJZ290byBvdXRfZnJlZTsKIAl9CkBAIC00
NjMsNyArNDQ3LDcgQEAKIAkJCQkJCSAgdWJpLT52dGJsX3NpemUpOwogCQlpZiAobGViX2NvcnJ1
cHRlZFsxXSkgewogCQkJdWJpX3dhcm4oInZvbHVtZSB0YWJsZSBjb3B5ICMyIGlzIGNvcnJ1cHRl
ZCIpOwotCQkJZXJyID0gY3JlYXRlX3Z0YmwodWJpLCBzaSwgMSwgbGViWzBdKTsKKwkJCWVyciA9
IGNyZWF0ZV92dGJsKHViaSwgYWksIDEsIGxlYlswXSk7CiAJCQlpZiAoZXJyKQogCQkJCWdvdG8g
b3V0X2ZyZWU7CiAJCQl1YmlfbXNnKCJ2b2x1bWUgdGFibGUgd2FzIHJlc3RvcmVkIik7CkBAIC00
ODYsNyArNDcwLDcgQEAKIAkJfQogCiAJCXViaV93YXJuKCJ2b2x1bWUgdGFibGUgY29weSAjMSBp
cyBjb3JydXB0ZWQiKTsKLQkJZXJyID0gY3JlYXRlX3Z0YmwodWJpLCBzaSwgMCwgbGViWzFdKTsK
KwkJZXJyID0gY3JlYXRlX3Z0YmwodWJpLCBhaSwgMCwgbGViWzFdKTsKIAkJaWYgKGVycikKIAkJ
CWdvdG8gb3V0X2ZyZWU7CiAJCXViaV9tc2coInZvbHVtZSB0YWJsZSB3YXMgcmVzdG9yZWQiKTsK
QEAgLTUwNCwxMyArNDg4LDEzIEBACiAvKioKICAqIGNyZWF0ZV9lbXB0eV9sdm9sIC0gY3JlYXRl
IGVtcHR5IGxheW91dCB2b2x1bWUuCiAgKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9i
amVjdAotICogQHNpOiBzY2FubmluZyBpbmZvcm1hdGlvbgorICogQGFpOiBhdHRhY2hpbmcgaW5m
b3JtYXRpb24KICAqCiAgKiBUaGlzIGZ1bmN0aW9uIHJldHVybnMgdm9sdW1lIHRhYmxlIGNvbnRl
bnRzIGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYQogICogbmVnYXRpdmUgZXJyb3IgY29kZSBpbiBj
YXNlIG9mIGZhaWx1cmUuCiAgKi8KIHN0YXRpYyBzdHJ1Y3QgdWJpX3Z0YmxfcmVjb3JkICpjcmVh
dGVfZW1wdHlfbHZvbChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLAotCQkJCQkJIHN0cnVjdCB1Ymlf
c2Nhbl9pbmZvICpzaSkKKwkJCQkJCSBzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSkKIHsKIAlp
bnQgaTsKIAlzdHJ1Y3QgdWJpX3Z0YmxfcmVjb3JkICp2dGJsOwpAQCAtNTI1LDcgKzUwOSw3IEBA
CiAJZm9yIChpID0gMDsgaSA8IFVCSV9MQVlPVVRfVk9MVU1FX0VCUzsgaSsrKSB7CiAJCWludCBl
cnI7CiAKLQkJZXJyID0gY3JlYXRlX3Z0YmwodWJpLCBzaSwgaSwgdnRibCk7CisJCWVyciA9IGNy
ZWF0ZV92dGJsKHViaSwgYWksIGksIHZ0YmwpOwogCQlpZiAoZXJyKSB7CiAJCQl2ZnJlZSh2dGJs
KTsKIAkJCXJldHVybiBFUlJfUFRSKGVycik7CkBAIC01MzgsMTggKzUyMiwxOSBAQAogLyoqCiAg
KiBpbml0X3ZvbHVtZXMgLSBpbml0aWFsaXplIHZvbHVtZSBpbmZvcm1hdGlvbiBmb3IgZXhpc3Rp
bmcgdm9sdW1lcy4KICAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0Ci0gKiBA
c2k6IHNjYW5uaW5nIGluZm9ybWF0aW9uCisgKiBAYWk6IHNjYW5uaW5nIGluZm9ybWF0aW9uCiAg
KiBAdnRibDogdm9sdW1lIHRhYmxlCiAgKgogICogVGhpcyBmdW5jdGlvbiBhbGxvY2F0ZXMgdm9s
dW1lIGRlc2NyaXB0aW9uIG9iamVjdHMgZm9yIGV4aXN0aW5nIHZvbHVtZXMuCiAgKiBSZXR1cm5z
IHplcm8gaW4gY2FzZSBvZiBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgaW4gY2Fz
ZSBvZgogICogZmFpbHVyZS4KICAqLwotc3RhdGljIGludCBpbml0X3ZvbHVtZXMoc3RydWN0IHVi
aV9kZXZpY2UgKnViaSwgY29uc3Qgc3RydWN0IHViaV9zY2FuX2luZm8gKnNpLAorc3RhdGljIGlu
dCBpbml0X3ZvbHVtZXMoc3RydWN0IHViaV9kZXZpY2UgKnViaSwKKwkJCWNvbnN0IHN0cnVjdCB1
YmlfYXR0YWNoX2luZm8gKmFpLAogCQkJY29uc3Qgc3RydWN0IHViaV92dGJsX3JlY29yZCAqdnRi
bCkKIHsKIAlpbnQgaSwgcmVzZXJ2ZWRfcGVicyA9IDA7Ci0Jc3RydWN0IHViaV9zY2FuX3ZvbHVt
ZSAqc3Y7CisJc3RydWN0IHViaV9haW5mX3ZvbHVtZSAqYXY7CiAJc3RydWN0IHViaV92b2x1bWUg
KnZvbDsKIAogCWZvciAoaSA9IDA7IGkgPCB1YmktPnZ0Ymxfc2xvdHM7IGkrKykgewpAQCAtNjA1
LDggKzU5MCw4IEBACiAJCX0KIAogCQkvKiBTdGF0aWMgdm9sdW1lcyBvbmx5ICovCi0JCXN2ID0g
dWJpX3NjYW5fZmluZF9zdihzaSwgaSk7Ci0JCWlmICghc3YpIHsKKwkJYXYgPSB1YmlfZmluZF9h
dihhaSwgaSk7CisJCWlmICghYXYpIHsKIAkJCS8qCiAJCQkgKiBObyBlcmFzZWJsb2NrcyBiZWxv
bmdpbmcgdG8gdGhpcyB2b2x1bWUgZm91bmQuIFdlCiAJCQkgKiBkb24ndCBhY3R1YWxseSBrbm93
IHdoZXRoZXIgdGhpcyBzdGF0aWMgdm9sdW1lIGlzCkBAIC02MTgsMjIgKzYwMywyMiBAQAogCQkJ
Y29udGludWU7CiAJCX0KIAotCQlpZiAoc3YtPmxlYl9jb3VudCAhPSBzdi0+dXNlZF9lYnMpIHsK
KwkJaWYgKGF2LT5sZWJfY291bnQgIT0gYXYtPnVzZWRfZWJzKSB7CiAJCQkvKgogCQkJICogV2Ug
Zm91bmQgYSBzdGF0aWMgdm9sdW1lIHdoaWNoIG1pc3NlcyBzZXZlcmFsCiAJCQkgKiBlcmFzZWJs
b2Nrcy4gVHJlYXQgaXQgYXMgY29ycnVwdGVkLgogCQkJICovCiAJCQl1Ymlfd2Fybigic3RhdGlj
IHZvbHVtZSAlZCBtaXNzZXMgJWQgTEVCcyAtIGNvcnJ1cHRlZCIsCi0JCQkJIHN2LT52b2xfaWQs
IHN2LT51c2VkX2VicyAtIHN2LT5sZWJfY291bnQpOworCQkJCSBhdi0+dm9sX2lkLCBhdi0+dXNl
ZF9lYnMgLSBhdi0+bGViX2NvdW50KTsKIAkJCXZvbC0+Y29ycnVwdGVkID0gMTsKIAkJCWNvbnRp
bnVlOwogCQl9CiAKLQkJdm9sLT51c2VkX2VicyA9IHN2LT51c2VkX2ViczsKKwkJdm9sLT51c2Vk
X2VicyA9IGF2LT51c2VkX2ViczsKIAkJdm9sLT51c2VkX2J5dGVzID0KIAkJCShsb25nIGxvbmcp
KHZvbC0+dXNlZF9lYnMgLSAxKSAqIHZvbC0+dXNhYmxlX2xlYl9zaXplOwotCQl2b2wtPnVzZWRf
Ynl0ZXMgKz0gc3YtPmxhc3RfZGF0YV9zaXplOwotCQl2b2wtPmxhc3RfZWJfYnl0ZXMgPSBzdi0+
bGFzdF9kYXRhX3NpemU7CisJCXZvbC0+dXNlZF9ieXRlcyArPSBhdi0+bGFzdF9kYXRhX3NpemU7
CisJCXZvbC0+bGFzdF9lYl9ieXRlcyA9IGF2LT5sYXN0X2RhdGFfc2l6ZTsKIAl9CiAKIAkvKiBB
bmQgYWRkIHRoZSBsYXlvdXQgdm9sdW1lICovCkBAIC02NDIsNyArNjI3LDcgQEAKIAkJcmV0dXJu
IC1FTk9NRU07CiAKIAl2b2wtPnJlc2VydmVkX3BlYnMgPSBVQklfTEFZT1VUX1ZPTFVNRV9FQlM7
Ci0Jdm9sLT5hbGlnbm1lbnQgPSAxOworCXZvbC0+YWxpZ25tZW50ID0gVUJJX0xBWU9VVF9WT0xV
TUVfQUxJR047CiAJdm9sLT52b2xfdHlwZSA9IFVCSV9EWU5BTUlDX1ZPTFVNRTsKIAl2b2wtPm5h
bWVfbGVuID0gc2l6ZW9mKFVCSV9MQVlPVVRfVk9MVU1FX05BTUUpIC0gMTsKIAltZW1jcHkodm9s
LT5uYW1lLCBVQklfTEFZT1VUX1ZPTFVNRV9OQU1FLCB2b2wtPm5hbWVfbGVuICsgMSk7CkBAIC02
NzQsMTA1ICs2NTksMTA0IEBACiB9CiAKIC8qKgotICogY2hlY2tfc3YgLSBjaGVjayB2b2x1bWUg
c2Nhbm5pbmcgaW5mb3JtYXRpb24uCisgKiBjaGVja19hdiAtIGNoZWNrIHZvbHVtZSBhdHRhY2hp
bmcgaW5mb3JtYXRpb24uCiAgKiBAdm9sOiBVQkkgdm9sdW1lIGRlc2NyaXB0aW9uIG9iamVjdAot
ICogQHN2OiB2b2x1bWUgc2Nhbm5pbmcgaW5mb3JtYXRpb24KKyAqIEBhdjogdm9sdW1lIGF0dGFj
aGluZyBpbmZvcm1hdGlvbgogICoKLSAqIFRoaXMgZnVuY3Rpb24gcmV0dXJucyB6ZXJvIGlmIHRo
ZSB2b2x1bWUgc2Nhbm5pbmcgaW5mb3JtYXRpb24gaXMgY29uc2lzdGVudAorICogVGhpcyBmdW5j
dGlvbiByZXR1cm5zIHplcm8gaWYgdGhlIHZvbHVtZSBhdHRhY2hpbmcgaW5mb3JtYXRpb24gaXMg
Y29uc2lzdGVudAogICogdG8gdGhlIGRhdGEgcmVhZCBmcm9tIHRoZSB2b2x1bWUgdGFibGEsIGFu
ZCAlLUVJTlZBTCBpZiBub3QuCiAgKi8KLXN0YXRpYyBpbnQgY2hlY2tfc3YoY29uc3Qgc3RydWN0
IHViaV92b2x1bWUgKnZvbCwKLQkJICAgIGNvbnN0IHN0cnVjdCB1Ymlfc2Nhbl92b2x1bWUgKnN2
KQorc3RhdGljIGludCBjaGVja19hdihjb25zdCBzdHJ1Y3QgdWJpX3ZvbHVtZSAqdm9sLAorCQkg
ICAgY29uc3Qgc3RydWN0IHViaV9haW5mX3ZvbHVtZSAqYXYpCiB7CiAJaW50IGVycjsKIAotCWlm
IChzdi0+aGlnaGVzdF9sbnVtID49IHZvbC0+cmVzZXJ2ZWRfcGVicykgeworCWlmIChhdi0+aGln
aGVzdF9sbnVtID49IHZvbC0+cmVzZXJ2ZWRfcGVicykgewogCQllcnIgPSAxOwogCQlnb3RvIGJh
ZDsKIAl9Ci0JaWYgKHN2LT5sZWJfY291bnQgPiB2b2wtPnJlc2VydmVkX3BlYnMpIHsKKwlpZiAo
YXYtPmxlYl9jb3VudCA+IHZvbC0+cmVzZXJ2ZWRfcGVicykgewogCQllcnIgPSAyOwogCQlnb3Rv
IGJhZDsKIAl9Ci0JaWYgKHN2LT52b2xfdHlwZSAhPSB2b2wtPnZvbF90eXBlKSB7CisJaWYgKGF2
LT52b2xfdHlwZSAhPSB2b2wtPnZvbF90eXBlKSB7CiAJCWVyciA9IDM7CiAJCWdvdG8gYmFkOwog
CX0KLQlpZiAoc3YtPnVzZWRfZWJzID4gdm9sLT5yZXNlcnZlZF9wZWJzKSB7CisJaWYgKGF2LT51
c2VkX2VicyA+IHZvbC0+cmVzZXJ2ZWRfcGVicykgewogCQllcnIgPSA0OwogCQlnb3RvIGJhZDsK
IAl9Ci0JaWYgKHN2LT5kYXRhX3BhZCAhPSB2b2wtPmRhdGFfcGFkKSB7CisJaWYgKGF2LT5kYXRh
X3BhZCAhPSB2b2wtPmRhdGFfcGFkKSB7CiAJCWVyciA9IDU7CiAJCWdvdG8gYmFkOwogCX0KIAly
ZXR1cm4gMDsKIAogYmFkOgotCXViaV9lcnIoImJhZCBzY2FubmluZyBpbmZvcm1hdGlvbiwgZXJy
b3IgJWQiLCBlcnIpOwotCXViaV9kYmdfZHVtcF9zdihzdik7Ci0JdWJpX2RiZ19kdW1wX3ZvbF9p
bmZvKHZvbCk7CisJdWJpX2VycigiYmFkIGF0dGFjaGluZyBpbmZvcm1hdGlvbiwgZXJyb3IgJWQi
LCBlcnIpOworCXViaV9kdW1wX2F2KGF2KTsKKwl1YmlfZHVtcF92b2xfaW5mbyh2b2wpOwogCXJl
dHVybiAtRUlOVkFMOwogfQogCiAvKioKLSAqIGNoZWNrX3NjYW5uaW5nX2luZm8gLSBjaGVjayB0
aGF0IHNjYW5uaW5nIGluZm9ybWF0aW9uLgorICogY2hlY2tfYXR0YWNoaW5nX2luZm8gLSBjaGVj
ayB0aGF0IGF0dGFjaGluZyBpbmZvcm1hdGlvbi4KICAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3Jp
cHRpb24gb2JqZWN0Ci0gKiBAc2k6IHNjYW5uaW5nIGluZm9ybWF0aW9uCisgKiBAYWk6IGF0dGFj
aGluZyBpbmZvcm1hdGlvbgogICoKICAqIEV2ZW4gdGhvdWdoIHdlIHByb3RlY3Qgb24tZmxhc2gg
ZGF0YSBieSBDUkMgY2hlY2tzdW1zLCB3ZSBzdGlsbCBkb24ndCB0cnVzdAotICogdGhlIG1lZGlh
LiBUaGlzIGZ1bmN0aW9uIGVuc3VyZXMgdGhhdCBzY2FubmluZyBpbmZvcm1hdGlvbiBpcyBjb25z
aXN0ZW50IHRvCi0gKiB0aGUgaW5mb3JtYXRpb24gcmVhZCBmcm9tIHRoZSB2b2x1bWUgdGFibGUu
IFJldHVybnMgemVybyBpZiB0aGUgc2Nhbm5pbmcKKyAqIHRoZSBtZWRpYS4gVGhpcyBmdW5jdGlv
biBlbnN1cmVzIHRoYXQgYXR0YWNoaW5nIGluZm9ybWF0aW9uIGlzIGNvbnNpc3RlbnQgdG8KKyAq
IHRoZSBpbmZvcm1hdGlvbiByZWFkIGZyb20gdGhlIHZvbHVtZSB0YWJsZS4gUmV0dXJucyB6ZXJv
IGlmIHRoZSBhdHRhY2hpbmcKICAqIGluZm9ybWF0aW9uIGlzIE9LIGFuZCAlLUVJTlZBTCBpZiBp
dCBpcyBub3QuCiAgKi8KLXN0YXRpYyBpbnQgY2hlY2tfc2Nhbm5pbmdfaW5mbyhjb25zdCBzdHJ1
Y3QgdWJpX2RldmljZSAqdWJpLAotCQkJICAgICAgIHN0cnVjdCB1Ymlfc2Nhbl9pbmZvICpzaSkK
K3N0YXRpYyBpbnQgY2hlY2tfYXR0YWNoaW5nX2luZm8oY29uc3Qgc3RydWN0IHViaV9kZXZpY2Ug
KnViaSwKKwkJCSAgICAgICBzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSkKIHsKIAlpbnQgZXJy
LCBpOwotCXN0cnVjdCB1Ymlfc2Nhbl92b2x1bWUgKnN2OworCXN0cnVjdCB1YmlfYWluZl92b2x1
bWUgKmF2OwogCXN0cnVjdCB1Ymlfdm9sdW1lICp2b2w7CiAKLQlpZiAoc2ktPnZvbHNfZm91bmQg
PiBVQklfSU5UX1ZPTF9DT1VOVCArIHViaS0+dnRibF9zbG90cykgewotCQl1YmlfZXJyKCJzY2Fu
bmluZyBmb3VuZCAlZCB2b2x1bWVzLCBtYXhpbXVtIGlzICVkICsgJWQiLAotCQkJc2ktPnZvbHNf
Zm91bmQsIFVCSV9JTlRfVk9MX0NPVU5ULCB1YmktPnZ0Ymxfc2xvdHMpOworCWlmIChhaS0+dm9s
c19mb3VuZCA+IFVCSV9JTlRfVk9MX0NPVU5UICsgdWJpLT52dGJsX3Nsb3RzKSB7CisJCXViaV9l
cnIoImZvdW5kICVkIHZvbHVtZXMgd2hpbGUgYXR0YWNoaW5nLCBtYXhpbXVtIGlzICVkICsgJWQi
LAorCQkJYWktPnZvbHNfZm91bmQsIFVCSV9JTlRfVk9MX0NPVU5ULCB1YmktPnZ0Ymxfc2xvdHMp
OwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKLQlpZiAoc2ktPmhpZ2hlc3Rfdm9sX2lkID49IHVi
aS0+dnRibF9zbG90cyArIFVCSV9JTlRfVk9MX0NPVU5UICYmCi0JICAgIHNpLT5oaWdoZXN0X3Zv
bF9pZCA8IFVCSV9JTlRFUk5BTF9WT0xfU1RBUlQpIHsKLQkJdWJpX2VycigidG9vIGxhcmdlIHZv
bHVtZSBJRCAlZCBmb3VuZCBieSBzY2FubmluZyIsCi0JCQlzaS0+aGlnaGVzdF92b2xfaWQpOwor
CWlmIChhaS0+aGlnaGVzdF92b2xfaWQgPj0gdWJpLT52dGJsX3Nsb3RzICsgVUJJX0lOVF9WT0xf
Q09VTlQgJiYKKwkgICAgYWktPmhpZ2hlc3Rfdm9sX2lkIDwgVUJJX0lOVEVSTkFMX1ZPTF9TVEFS
VCkgeworCQl1YmlfZXJyKCJ0b28gbGFyZ2Ugdm9sdW1lIElEICVkIGZvdW5kIiwgYWktPmhpZ2hl
c3Rfdm9sX2lkKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCiAJZm9yIChpID0gMDsgaSA8IHVi
aS0+dnRibF9zbG90cyArIFVCSV9JTlRfVk9MX0NPVU5UOyBpKyspIHsKIAkJY29uZF9yZXNjaGVk
KCk7CiAKLQkJc3YgPSB1Ymlfc2Nhbl9maW5kX3N2KHNpLCBpKTsKKwkJYXYgPSB1YmlfZmluZF9h
dihhaSwgaSk7CiAJCXZvbCA9IHViaS0+dm9sdW1lc1tpXTsKIAkJaWYgKCF2b2wpIHsKLQkJCWlm
IChzdikKLQkJCQl1Ymlfc2Nhbl9ybV92b2x1bWUoc2ksIHN2KTsKKwkJCWlmIChhdikKKwkJCQl1
YmlfcmVtb3ZlX2F2KGFpLCBhdik7CiAJCQljb250aW51ZTsKIAkJfQogCiAJCWlmICh2b2wtPnJl
c2VydmVkX3BlYnMgPT0gMCkgewogCQkJdWJpX2Fzc2VydChpIDwgdWJpLT52dGJsX3Nsb3RzKTsK
IAotCQkJaWYgKCFzdikKKwkJCWlmICghYXYpCiAJCQkJY29udGludWU7CiAKIAkJCS8qCi0JCQkg
KiBEdXJpbmcgc2Nhbm5pbmcgd2UgZm91bmQgYSB2b2x1bWUgd2hpY2ggZG9lcyBub3QKKwkJCSAq
IER1cmluZyBhdHRhY2hpbmcgd2UgZm91bmQgYSB2b2x1bWUgd2hpY2ggZG9lcyBub3QKIAkJCSAq
IGV4aXN0IGFjY29yZGluZyB0byB0aGUgaW5mb3JtYXRpb24gaW4gdGhlIHZvbHVtZQogCQkJICog
dGFibGUuIFRoaXMgbXVzdCBoYXZlIGhhcHBlbmVkIGR1ZSB0byBhbiB1bmNsZWFuCiAJCQkgKiBy
ZWJvb3Qgd2hpbGUgdGhlIHZvbHVtZSB3YXMgYmVpbmcgcmVtb3ZlZC4gRGlzY2FyZAogCQkJICog
dGhlc2UgZXJhc2VibG9ja3MuCiAJCQkgKi8KLQkJCXViaV9tc2coImZpbmlzaCB2b2x1bWUgJWQg
cmVtb3ZhbCIsIHN2LT52b2xfaWQpOwotCQkJdWJpX3NjYW5fcm1fdm9sdW1lKHNpLCBzdik7Ci0J
CX0gZWxzZSBpZiAoc3YpIHsKLQkJCWVyciA9IGNoZWNrX3N2KHZvbCwgc3YpOworCQkJdWJpX21z
ZygiZmluaXNoIHZvbHVtZSAlZCByZW1vdmFsIiwgYXYtPnZvbF9pZCk7CisJCQl1YmlfcmVtb3Zl
X2F2KGFpLCBhdik7CisJCX0gZWxzZSBpZiAoYXYpIHsKKwkJCWVyciA9IGNoZWNrX2F2KHZvbCwg
YXYpOwogCQkJaWYgKGVycikKIAkJCQlyZXR1cm4gZXJyOwogCQl9CkBAIC03ODQsMTYgKzc2OCwx
NiBAQAogLyoqCiAgKiB1YmlfcmVhZF92b2x1bWVfdGFibGUgLSByZWFkIHRoZSB2b2x1bWUgdGFi
bGUuCiAgKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVjdAotICogQHNpOiBzY2Fu
bmluZyBpbmZvcm1hdGlvbgorICogQGFpOiBhdHRhY2hpbmcgaW5mb3JtYXRpb24KICAqCiAgKiBU
aGlzIGZ1bmN0aW9uIHJlYWRzIHZvbHVtZSB0YWJsZSwgY2hlY2tzIGl0LCByZWNvdmVyIGZyb20g
ZXJyb3JzIGlmIG5lZWRlZCwKICAqIG9yIGNyZWF0ZXMgaXQgaWYgbmVlZGVkLiBSZXR1cm5zIHpl
cm8gaW4gY2FzZSBvZiBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlCiAgKiBlcnJvciBjb2RlIGluIGNh
c2Ugb2YgZmFpbHVyZS4KICAqLwotaW50IHViaV9yZWFkX3ZvbHVtZV90YWJsZShzdHJ1Y3QgdWJp
X2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX3NjYW5faW5mbyAqc2kpCitpbnQgdWJpX3JlYWRfdm9s
dW1lX3RhYmxlKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1YmlfYXR0YWNoX2luZm8g
KmFpKQogewogCWludCBpLCBlcnI7Ci0Jc3RydWN0IHViaV9zY2FuX3ZvbHVtZSAqc3Y7CisJc3Ry
dWN0IHViaV9haW5mX3ZvbHVtZSAqYXY7CiAKIAllbXB0eV92dGJsX3JlY29yZC5jcmMgPSBjcHVf
dG9fYmUzMigweGYxMTZjMzZiKTsKIApAQCAtODA4LDggKzc5Miw4IEBACiAJdWJpLT52dGJsX3Np
emUgPSB1YmktPnZ0Ymxfc2xvdHMgKiBVQklfVlRCTF9SRUNPUkRfU0laRTsKIAl1YmktPnZ0Ymxf
c2l6ZSA9IEFMSUdOKHViaS0+dnRibF9zaXplLCB1YmktPm1pbl9pb19zaXplKTsKIAotCXN2ID0g
dWJpX3NjYW5fZmluZF9zdihzaSwgVUJJX0xBWU9VVF9WT0xVTUVfSUQpOwotCWlmICghc3YpIHsK
KwlhdiA9IHViaV9maW5kX2F2KGFpLCBVQklfTEFZT1VUX1ZPTFVNRV9JRCk7CisJaWYgKCFhdikg
ewogCQkvKgogCQkgKiBObyBsb2dpY2FsIGVyYXNlYmxvY2tzIGJlbG9uZ2luZyB0byB0aGUgbGF5
b3V0IHZvbHVtZSB3ZXJlCiAJCSAqIGZvdW5kLiBUaGlzIGNvdWxkIG1lYW4gdGhhdCB0aGUgZmxh
c2ggaXMganVzdCBlbXB0eS4gSW4KQEAgLTgxOCw4ICs4MDIsOCBAQAogCQkgKiBCdXQgaWYgZmxh
c2ggaXMgbm90IGVtcHR5IHRoaXMgbXVzdCBiZSBhIGNvcnJ1cHRpb24gb3IgdGhlCiAJCSAqIE1U
RCBkZXZpY2UganVzdCBjb250YWlucyBnYXJiYWdlLgogCQkgKi8KLQkJaWYgKHNpLT5pc19lbXB0
eSkgewotCQkJdWJpLT52dGJsID0gY3JlYXRlX2VtcHR5X2x2b2wodWJpLCBzaSk7CisJCWlmIChh
aS0+aXNfZW1wdHkpIHsKKwkJCXViaS0+dnRibCA9IGNyZWF0ZV9lbXB0eV9sdm9sKHViaSwgYWkp
OwogCQkJaWYgKElTX0VSUih1YmktPnZ0YmwpKQogCQkJCXJldHVybiBQVFJfRVJSKHViaS0+dnRi
bCk7CiAJCX0gZWxzZSB7CkBAIC04MjcsMTQgKzgxMSwxNCBAQAogCQkJcmV0dXJuIC1FSU5WQUw7
CiAJCX0KIAl9IGVsc2UgewotCQlpZiAoc3YtPmxlYl9jb3VudCA+IFVCSV9MQVlPVVRfVk9MVU1F
X0VCUykgeworCQlpZiAoYXYtPmxlYl9jb3VudCA+IFVCSV9MQVlPVVRfVk9MVU1FX0VCUykgewog
CQkJLyogVGhpcyBtdXN0IG5vdCBoYXBwZW4gd2l0aCBwcm9wZXIgVUJJIGltYWdlcyAqLwotCQkJ
ZGJnX2VycigidG9vIG1hbnkgTEVCcyAoJWQpIGluIGxheW91dCB2b2x1bWUiLAotCQkJCXN2LT5s
ZWJfY291bnQpOworCQkJdWJpX2VycigidG9vIG1hbnkgTEVCcyAoJWQpIGluIGxheW91dCB2b2x1
bWUiLAorCQkJCWF2LT5sZWJfY291bnQpOwogCQkJcmV0dXJuIC1FSU5WQUw7CiAJCX0KIAotCQl1
YmktPnZ0YmwgPSBwcm9jZXNzX2x2b2wodWJpLCBzaSwgc3YpOworCQl1YmktPnZ0YmwgPSBwcm9j
ZXNzX2x2b2wodWJpLCBhaSwgYXYpOwogCQlpZiAoSVNfRVJSKHViaS0+dnRibCkpCiAJCQlyZXR1
cm4gUFRSX0VSUih1YmktPnZ0YmwpOwogCX0KQEAgLTg0NSwxNSArODI5LDE1IEBACiAJICogVGhl
IGxheW91dCB2b2x1bWUgaXMgT0ssIGluaXRpYWxpemUgdGhlIGNvcnJlc3BvbmRpbmcgaW4tUkFN
IGRhdGEKIAkgKiBzdHJ1Y3R1cmVzLgogCSAqLwotCWVyciA9IGluaXRfdm9sdW1lcyh1YmksIHNp
LCB1YmktPnZ0YmwpOworCWVyciA9IGluaXRfdm9sdW1lcyh1YmksIGFpLCB1YmktPnZ0YmwpOwog
CWlmIChlcnIpCiAJCWdvdG8gb3V0X2ZyZWU7CiAKIAkvKgotCSAqIE1ha2Ugc3VyZSB0aGF0IHRo
ZSBzY2FubmluZyBpbmZvcm1hdGlvbiBpcyBjb25zaXN0ZW50IHRvIHRoZQorCSAqIE1ha2Ugc3Vy
ZSB0aGF0IHRoZSBhdHRhY2hpbmcgaW5mb3JtYXRpb24gaXMgY29uc2lzdGVudCB0byB0aGUKIAkg
KiBpbmZvcm1hdGlvbiBzdG9yZWQgaW4gdGhlIHZvbHVtZSB0YWJsZS4KIAkgKi8KLQllcnIgPSBj
aGVja19zY2FubmluZ19pbmZvKHViaSwgc2kpOworCWVyciA9IGNoZWNrX2F0dGFjaGluZ19pbmZv
KHViaSwgYWkpOwogCWlmIChlcnIpCiAJCWdvdG8gb3V0X2ZyZWU7CiAKQEAgLTg2OCwyMSArODUy
LDE3IEBACiAJcmV0dXJuIGVycjsKIH0KIAotI2lmZGVmIENPTkZJR19NVERfVUJJX0RFQlVHCi0K
IC8qKgotICogcGFyYW5vaWRfdnRibF9jaGVjayAtIGNoZWNrIHZvbHVtZSB0YWJsZS4KKyAqIHNl
bGZfdnRibF9jaGVjayAtIGNoZWNrIHZvbHVtZSB0YWJsZS4KICAqIEB1Ymk6IFVCSSBkZXZpY2Ug
ZGVzY3JpcHRpb24gb2JqZWN0CiAgKi8KLXN0YXRpYyB2b2lkIHBhcmFub2lkX3Z0YmxfY2hlY2so
Y29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnViaSkKK3N0YXRpYyB2b2lkIHNlbGZfdnRibF9jaGVj
ayhjb25zdCBzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKQogewotCWlmICghKHViaV9jaGtfZmxhZ3Mg
JiBVQklfQ0hLX0dFTikpCisJaWYgKCF1YmktPmRiZy0+Y2hrX2dlbikKIAkJcmV0dXJuOwogCiAJ
aWYgKHZ0YmxfY2hlY2sodWJpLCB1YmktPnZ0YmwpKSB7Ci0JCXViaV9lcnIoInBhcmFub2lkIGNo
ZWNrIGZhaWxlZCIpOworCQl1YmlfZXJyKCJzZWxmLWNoZWNrIGZhaWxlZCIpOwogCQlCVUcoKTsK
IAl9CiB9Ci0KLSNlbmRpZiAvKiBDT05GSUdfTVREX1VCSV9ERUJVRyAqLwpkaWZmIC11TiAtdU5y
IGxpbnV4LTMuMC9kcml2ZXJzL210ZC91Ymkvd2wuYyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3Qv
ZHJpdmVycy9tdGQvdWJpL3dsLmMKLS0tIGxpbnV4LTMuMC9kcml2ZXJzL210ZC91Ymkvd2wuYwky
MDExLTA3LTIxIDIxOjE3OjIzLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtMy4wLngudWJpZnMu
bGF0ZXN0L2RyaXZlcnMvbXRkL3ViaS93bC5jCTIwMTItMDYtMjggMTE6MjY6MTUuMDAwMDAwMDAw
IC0wNTAwCkBAIC0xLDQgKzEsNSBAQAogLyoKKyAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRp
b24gb2JqZWN0CiAgKiBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGlu
ZXMgQ29ycC4sIDIwMDYKICAqCiAgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91
IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQpAQCAtNDAsMTIgKzQxLDYgQEAKICAq
IHBoeXNpY2FsIGVyYXNlYmxvY2tzIHdpdGggbG93IGVyYXNlIGNvdW50ZXIgdG8gZnJlZSBwaHlz
aWNhbCBlcmFzZWJsb2NrcwogICogd2l0aCBoaWdoIGVyYXNlIGNvdW50ZXIuCiAgKgotICogVGhl
ICd1Ymlfd2xfZ2V0X3BlYigpJyBmdW5jdGlvbiBhY2NlcHRzIGRhdGEgdHlwZSBoaW50cyB3aGlj
aCBoZWxwIHRvIHBpY2sKLSAqIGFuICJvcHRpbWFsIiBwaHlzaWNhbCBlcmFzZWJsb2NrLiBGb3Ig
ZXhhbXBsZSwgd2hlbiBpdCBpcyBrbm93biB0aGF0IHRoZQotICogcGh5c2ljYWwgZXJhc2VibG9j
ayB3aWxsIGJlICJwdXQiIHNvb24gYmVjYXVzZSBpdCBjb250YWlucyBzaG9ydC10ZXJtIGRhdGEs
Ci0gKiB0aGUgV0wgc3ViLXN5c3RlbSBtYXkgcGljayBhIGZyZWUgcGh5c2ljYWwgZXJhc2VibG9j
ayB3aXRoIGxvdyBlcmFzZQotICogY291bnRlciwgYW5kIHNvIGZvcnRoLgotICoKICAqIElmIHRo
ZSBXTCBzdWItc3lzdGVtIGZhaWxzIHRvIGVyYXNlIGEgcGh5c2ljYWwgZXJhc2VibG9jaywgaXQg
bWFya3MgaXQgYXMKICAqIGJhZC4KICAqCkBAIC02OSw4ICs2NCw3IEBACiAgKiAgICB0byB0aGUg
dXNlcjsgaW5zdGVhZCwgd2UgZmlyc3Qgd2FudCB0byBsZXQgdXNlcnMgZmlsbCB0aGVtIHVwIHdp
dGggZGF0YTsKICAqCiAgKiAgbyB0aGVyZSBpcyBhIGNoYW5jZSB0aGF0IHRoZSB1c2VyIHdpbGwg
cHV0IHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIHZlcnkKLSAqICAgIHNvb24sIHNvIGl0IG1ha2Vz
IHNlbnNlIG5vdCB0byBtb3ZlIGl0IGZvciBzb21lIHRpbWUsIGJ1dCB3YWl0OyB0aGlzIGlzCi0g
KiAgICBlc3BlY2lhbGx5IGltcG9ydGFudCBpbiBjYXNlIG9mICJzaG9ydCB0ZXJtIiBwaHlzaWNh
bCBlcmFzZWJsb2Nrcy4KKyAqICAgIHNvb24sIHNvIGl0IG1ha2VzIHNlbnNlIG5vdCB0byBtb3Zl
IGl0IGZvciBzb21lIHRpbWUsIGJ1dCB3YWl0LgogICoKICAqIFBoeXNpY2FsIGVyYXNlYmxvY2tz
IHN0YXkgcHJvdGVjdGVkIG9ubHkgZm9yIGxpbWl0ZWQgdGltZS4gQnV0IHRoZSAidGltZSIgaXMK
ICAqIG1lYXN1cmVkIGluIGVyYXNlIGN5Y2xlcyBpbiB0aGlzIGNhc2UuIFRoaXMgaXMgaW1wbGVt
ZW50ZWQgd2l0aCBoZWxwIG9mIHRoZQpAQCAtMTQ2LDYgKzE0MCw4IEBACiAgKiBAbGlzdDogYSBs
aW5rIGluIHRoZSBsaXN0IG9mIHBlbmRpbmcgd29ya3MKICAqIEBmdW5jOiB3b3JrZXIgZnVuY3Rp
b24KICAqIEBlOiBwaHlzaWNhbCBlcmFzZWJsb2NrIHRvIGVyYXNlCisgKiBAdm9sX2lkOiB0aGUg
dm9sdW1lIElEIG9uIHdoaWNoIHRoaXMgZXJhc3VyZSBpcyBiZWluZyBwZXJmb3JtZWQKKyAqIEBs
bnVtOiB0aGUgbG9naWNhbCBlcmFzZWJsb2NrIG51bWJlcgogICogQHRvcnR1cmU6IGlmIHRoZSBw
aHlzaWNhbCBlcmFzZWJsb2NrIGhhcyB0byBiZSB0b3J0dXJlZAogICoKICAqIFRoZSBAZnVuYyBw
b2ludGVyIHBvaW50cyB0byB0aGUgd29ya2VyIGZ1bmN0aW9uLiBJZiB0aGUgQGNhbmNlbCBhcmd1
bWVudCBpcwpAQCAtMTU4LDE5ICsxNTQsMTYgQEAKIAlpbnQgKCpmdW5jKShzdHJ1Y3QgdWJpX2Rl
dmljZSAqdWJpLCBzdHJ1Y3QgdWJpX3dvcmsgKndyaywgaW50IGNhbmNlbCk7CiAJLyogVGhlIGJl
bG93IGZpZWxkcyBhcmUgb25seSByZWxldmFudCB0byBlcmFzdXJlIHdvcmtzICovCiAJc3RydWN0
IHViaV93bF9lbnRyeSAqZTsKKwlpbnQgdm9sX2lkOworCWludCBsbnVtOwogCWludCB0b3J0dXJl
OwogfTsKIAotI2lmZGVmIENPTkZJR19NVERfVUJJX0RFQlVHCi1zdGF0aWMgaW50IHBhcmFub2lk
X2NoZWNrX2VjKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGludCBwbnVtLCBpbnQgZWMpOwotc3Rh
dGljIGludCBwYXJhbm9pZF9jaGVja19pbl93bF90cmVlKHN0cnVjdCB1Ymlfd2xfZW50cnkgKmUs
Ci0JCQkJICAgICBzdHJ1Y3QgcmJfcm9vdCAqcm9vdCk7Ci1zdGF0aWMgaW50IHBhcmFub2lkX2No
ZWNrX2luX3BxKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1Ymlfd2xfZW50cnkgKmUp
OwotI2Vsc2UKLSNkZWZpbmUgcGFyYW5vaWRfY2hlY2tfZWModWJpLCBwbnVtLCBlYykgMAotI2Rl
ZmluZSBwYXJhbm9pZF9jaGVja19pbl93bF90cmVlKGUsIHJvb3QpCi0jZGVmaW5lIHBhcmFub2lk
X2NoZWNrX2luX3BxKHViaSwgZSkgMAotI2VuZGlmCitzdGF0aWMgaW50IHNlbGZfY2hlY2tfZWMo
c3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IHBudW0sIGludCBlYyk7CitzdGF0aWMgaW50IHNl
bGZfY2hlY2tfaW5fd2xfdHJlZShjb25zdCBzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLAorCQkJCSBz
dHJ1Y3QgdWJpX3dsX2VudHJ5ICplLCBzdHJ1Y3QgcmJfcm9vdCAqcm9vdCk7CitzdGF0aWMgaW50
IHNlbGZfY2hlY2tfaW5fcHEoY29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnViaSwKKwkJCSAgICBz
dHJ1Y3QgdWJpX3dsX2VudHJ5ICplKTsKIAogLyoqCiAgKiB3bF90cmVlX2FkZCAtIGFkZCBhIHdl
YXItbGV2ZWxpbmcgZW50cnkgdG8gYSBXTCBSQi10cmVlLgpAQCAtMzQ3LDE4ICszNDAsMTkgQEAK
IC8qKgogICogZmluZF93bF9lbnRyeSAtIGZpbmQgd2Vhci1sZXZlbGluZyBlbnRyeSBjbG9zZXN0
IHRvIGNlcnRhaW4gZXJhc2UgY291bnRlci4KICAqIEByb290OiB0aGUgUkItdHJlZSB3aGVyZSB0
byBsb29rIGZvcgotICogQG1heDogaGlnaGVzdCBwb3NzaWJsZSBlcmFzZSBjb3VudGVyCisgKiBA
ZGlmZjogbWF4aW11bSBwb3NzaWJsZSBkaWZmZXJlbmNlIGZyb20gdGhlIHNtYWxsZXN0IGVyYXNl
IGNvdW50ZXIKICAqCiAgKiBUaGlzIGZ1bmN0aW9uIGxvb2tzIGZvciBhIHdlYXIgbGV2ZWxpbmcg
ZW50cnkgd2l0aCBlcmFzZSBjb3VudGVyIGNsb3Nlc3QgdG8KLSAqIEBtYXggYW5kIGxlc3MgdGhh
biBAbWF4LgorICogbWluICsgQGRpZmYsIHdoZXJlIG1pbiBpcyB0aGUgc21hbGxlc3QgZXJhc2Ug
Y291bnRlci4KICAqLwotc3RhdGljIHN0cnVjdCB1Ymlfd2xfZW50cnkgKmZpbmRfd2xfZW50cnko
c3RydWN0IHJiX3Jvb3QgKnJvb3QsIGludCBtYXgpCitzdGF0aWMgc3RydWN0IHViaV93bF9lbnRy
eSAqZmluZF93bF9lbnRyeShzdHJ1Y3QgcmJfcm9vdCAqcm9vdCwgaW50IGRpZmYpCiB7CiAJc3Ry
dWN0IHJiX25vZGUgKnA7CiAJc3RydWN0IHViaV93bF9lbnRyeSAqZTsKKwlpbnQgbWF4OwogCiAJ
ZSA9IHJiX2VudHJ5KHJiX2ZpcnN0KHJvb3QpLCBzdHJ1Y3QgdWJpX3dsX2VudHJ5LCB1LnJiKTsK
LQltYXggKz0gZS0+ZWM7CisJbWF4ID0gZS0+ZWMgKyBkaWZmOwogCiAJcCA9IHJvb3QtPnJiX25v
ZGU7CiAJd2hpbGUgKHApIHsKQEAgLTM3OSwxOSArMzczLDE1IEBACiAvKioKICAqIHViaV93bF9n
ZXRfcGViIC0gZ2V0IGEgcGh5c2ljYWwgZXJhc2VibG9jay4KICAqIEB1Ymk6IFVCSSBkZXZpY2Ug
ZGVzY3JpcHRpb24gb2JqZWN0Ci0gKiBAZHR5cGU6IHR5cGUgb2YgZGF0YSB3aGljaCB3aWxsIGJl
IHN0b3JlZCBpbiB0aGlzIHBoeXNpY2FsIGVyYXNlYmxvY2sKICAqCiAgKiBUaGlzIGZ1bmN0aW9u
IHJldHVybnMgYSBwaHlzaWNhbCBlcmFzZWJsb2NrIGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYQog
ICogbmVnYXRpdmUgZXJyb3IgY29kZSBpbiBjYXNlIG9mIGZhaWx1cmUuIE1pZ2h0IHNsZWVwLgog
ICovCi1pbnQgdWJpX3dsX2dldF9wZWIoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IGR0eXBl
KQoraW50IHViaV93bF9nZXRfcGViKHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCiB7Ci0JaW50IGVy
ciwgbWVkaXVtX2VjOworCWludCBlcnI7CiAJc3RydWN0IHViaV93bF9lbnRyeSAqZSwgKmZpcnN0
LCAqbGFzdDsKIAotCXViaV9hc3NlcnQoZHR5cGUgPT0gVUJJX0xPTkdURVJNIHx8IGR0eXBlID09
IFVCSV9TSE9SVFRFUk0gfHwKLQkJICAgZHR5cGUgPT0gVUJJX1VOS05PV04pOwotCiByZXRyeToK
IAlzcGluX2xvY2soJnViaS0+d2xfbG9jayk7CiAJaWYgKCF1YmktPmZyZWUucmJfbm9kZSkgewpA
QCAtNDA5LDQ3ICszOTksMTUgQEAKIAkJZ290byByZXRyeTsKIAl9CiAKLQlzd2l0Y2ggKGR0eXBl
KSB7Ci0JY2FzZSBVQklfTE9OR1RFUk06Ci0JCS8qCi0JCSAqIEZvciBsb25nIHRlcm0gZGF0YSB3
ZSBwaWNrIGEgcGh5c2ljYWwgZXJhc2VibG9jayB3aXRoIGhpZ2gKLQkJICogZXJhc2UgY291bnRl
ci4gQnV0IHRoZSBoaWdoZXN0IGVyYXNlIGNvdW50ZXIgd2UgY2FuIHBpY2sgaXMKLQkJICogYm91
bmRlZCBieSB0aGUgdGhlIGxvd2VzdCBlcmFzZSBjb3VudGVyIHBsdXMKLQkJICogJVdMX0ZSRUVf
TUFYX0RJRkYuCi0JCSAqLwotCQllID0gZmluZF93bF9lbnRyeSgmdWJpLT5mcmVlLCBXTF9GUkVF
X01BWF9ESUZGKTsKLQkJYnJlYWs7Ci0JY2FzZSBVQklfVU5LTk9XTjoKLQkJLyoKLQkJICogRm9y
IHVua25vd24gZGF0YSB3ZSBwaWNrIGEgcGh5c2ljYWwgZXJhc2VibG9jayB3aXRoIG1lZGl1bQot
CQkgKiBlcmFzZSBjb3VudGVyLiBCdXQgd2UgYnkgbm8gbWVhbnMgY2FuIHBpY2sgYSBwaHlzaWNh
bAotCQkgKiBlcmFzZWJsb2NrIHdpdGggZXJhc2UgY291bnRlciBncmVhdGVyIG9yIGVxdWl2YWxl
bnQgdGhhbiB0aGUKLQkJICogbG93ZXN0IGVyYXNlIGNvdW50ZXIgcGx1cyAlV0xfRlJFRV9NQVhf
RElGRi4KLQkJICovCi0JCWZpcnN0ID0gcmJfZW50cnkocmJfZmlyc3QoJnViaS0+ZnJlZSksIHN0
cnVjdCB1Ymlfd2xfZW50cnksCi0JCQkJCXUucmIpOwotCQlsYXN0ID0gcmJfZW50cnkocmJfbGFz
dCgmdWJpLT5mcmVlKSwgc3RydWN0IHViaV93bF9lbnRyeSwgdS5yYik7Ci0KLQkJaWYgKGxhc3Qt
PmVjIC0gZmlyc3QtPmVjIDwgV0xfRlJFRV9NQVhfRElGRikKLQkJCWUgPSByYl9lbnRyeSh1Ymkt
PmZyZWUucmJfbm9kZSwKLQkJCQkJc3RydWN0IHViaV93bF9lbnRyeSwgdS5yYik7Ci0JCWVsc2Ug
ewotCQkJbWVkaXVtX2VjID0gKGZpcnN0LT5lYyArIFdMX0ZSRUVfTUFYX0RJRkYpLzI7Ci0JCQll
ID0gZmluZF93bF9lbnRyeSgmdWJpLT5mcmVlLCBtZWRpdW1fZWMpOwotCQl9Ci0JCWJyZWFrOwot
CWNhc2UgVUJJX1NIT1JUVEVSTToKLQkJLyoKLQkJICogRm9yIHNob3J0IHRlcm0gZGF0YSB3ZSBw
aWNrIGEgcGh5c2ljYWwgZXJhc2VibG9jayB3aXRoIHRoZQotCQkgKiBsb3dlc3QgZXJhc2UgY291
bnRlciBhcyB3ZSBleHBlY3QgaXQgd2lsbCBiZSBlcmFzZWQgc29vbi4KLQkJICovCi0JCWUgPSBy
Yl9lbnRyeShyYl9maXJzdCgmdWJpLT5mcmVlKSwgc3RydWN0IHViaV93bF9lbnRyeSwgdS5yYik7
Ci0JCWJyZWFrOwotCWRlZmF1bHQ6Ci0JCUJVRygpOwotCX0KKwlmaXJzdCA9IHJiX2VudHJ5KHJi
X2ZpcnN0KCZ1YmktPmZyZWUpLCBzdHJ1Y3QgdWJpX3dsX2VudHJ5LCB1LnJiKTsKKwlsYXN0ID0g
cmJfZW50cnkocmJfbGFzdCgmdWJpLT5mcmVlKSwgc3RydWN0IHViaV93bF9lbnRyeSwgdS5yYik7
CiAKLQlwYXJhbm9pZF9jaGVja19pbl93bF90cmVlKGUsICZ1YmktPmZyZWUpOworCWlmIChsYXN0
LT5lYyAtIGZpcnN0LT5lYyA8IFdMX0ZSRUVfTUFYX0RJRkYpCisJCWUgPSByYl9lbnRyeSh1Ymkt
PmZyZWUucmJfbm9kZSwgc3RydWN0IHViaV93bF9lbnRyeSwgdS5yYik7CisJZWxzZQorCQllID0g
ZmluZF93bF9lbnRyeSgmdWJpLT5mcmVlLCBXTF9GUkVFX01BWF9ESUZGLzIpOworCisJc2VsZl9j
aGVja19pbl93bF90cmVlKHViaSwgZSwgJnViaS0+ZnJlZSk7CiAKIAkvKgogCSAqIE1vdmUgdGhl
IHBoeXNpY2FsIGVyYXNlYmxvY2sgdG8gdGhlIHByb3RlY3Rpb24gcXVldWUgd2hlcmUgaXQgd2ls
bApAQCAtNDYwLDggKzQxOCw4IEBACiAJcHJvdF9xdWV1ZV9hZGQodWJpLCBlKTsKIAlzcGluX3Vu
bG9jaygmdWJpLT53bF9sb2NrKTsKIAotCWVyciA9IHViaV9kYmdfY2hlY2tfYWxsX2ZmKHViaSwg
ZS0+cG51bSwgdWJpLT52aWRfaGRyX2Fsb2Zmc2V0LAotCQkJCSAgIHViaS0+cGViX3NpemUgLSB1
YmktPnZpZF9oZHJfYWxvZmZzZXQpOworCWVyciA9IHViaV9zZWxmX2NoZWNrX2FsbF9mZih1Ymks
IGUtPnBudW0sIHViaS0+dmlkX2hkcl9hbG9mZnNldCwKKwkJCQkgICAgdWJpLT5wZWJfc2l6ZSAt
IHViaS0+dmlkX2hkcl9hbG9mZnNldCk7CiAJaWYgKGVycikgewogCQl1YmlfZXJyKCJuZXcgUEVC
ICVkIGRvZXMgbm90IGNvbnRhaW4gYWxsIDB4RkYgYnl0ZXMiLCBlLT5wbnVtKTsKIAkJcmV0dXJu
IGVycjsKQEAgLTQ4Niw3ICs0NDQsNyBAQAogCWlmICghZSkKIAkJcmV0dXJuIC1FTk9ERVY7CiAK
LQlpZiAocGFyYW5vaWRfY2hlY2tfaW5fcHEodWJpLCBlKSkKKwlpZiAoc2VsZl9jaGVja19pbl9w
cSh1YmksIGUpKQogCQlyZXR1cm4gLUVOT0RFVjsKIAogCWxpc3RfZGVsKCZlLT51Lmxpc3QpOwpA
QCAtNTEyLDcgKzQ3MCw3IEBACiAKIAlkYmdfd2woImVyYXNlIFBFQiAlZCwgb2xkIEVDICVsbHUi
LCBlLT5wbnVtLCBlYyk7CiAKLQllcnIgPSBwYXJhbm9pZF9jaGVja19lYyh1YmksIGUtPnBudW0s
IGUtPmVjKTsKKwllcnIgPSBzZWxmX2NoZWNrX2VjKHViaSwgZS0+cG51bSwgZS0+ZWMpOwogCWlm
IChlcnIpCiAJCXJldHVybiAtRUlOVkFMOwogCkBAIC02MTMsNyArNTcxLDcgQEAKIAlsaXN0X2Fk
ZF90YWlsKCZ3cmstPmxpc3QsICZ1YmktPndvcmtzKTsKIAl1YmlfYXNzZXJ0KHViaS0+d29ya3Nf
Y291bnQgPj0gMCk7CiAJdWJpLT53b3Jrc19jb3VudCArPSAxOwotCWlmICh1YmktPnRocmVhZF9l
bmFibGVkICYmICF1YmlfZGJnX2lzX2JndF9kaXNhYmxlZCgpKQorCWlmICh1YmktPnRocmVhZF9l
bmFibGVkICYmICF1YmlfZGJnX2lzX2JndF9kaXNhYmxlZCh1YmkpKQogCQl3YWtlX3VwX3Byb2Nl
c3ModWJpLT5iZ3RfdGhyZWFkKTsKIAlzcGluX3VubG9jaygmdWJpLT53bF9sb2NrKTsKIH0KQEAg
LTYyNSwxMyArNTgzLDE1IEBACiAgKiBzY2hlZHVsZV9lcmFzZSAtIHNjaGVkdWxlIGFuIGVyYXNl
IHdvcmsuCiAgKiBAdWJpOiBVQkkgZGV2aWNlIGRlc2NyaXB0aW9uIG9iamVjdAogICogQGU6IHRo
ZSBXTCBlbnRyeSBvZiB0aGUgcGh5c2ljYWwgZXJhc2VibG9jayB0byBlcmFzZQorICogQHZvbF9p
ZDogdGhlIHZvbHVtZSBJRCB0aGF0IGxhc3QgdXNlZCB0aGlzIFBFQgorICogQGxudW06IHRoZSBs
YXN0IHVzZWQgbG9naWNhbCBlcmFzZWJsb2NrIG51bWJlciBmb3IgdGhlIFBFQgogICogQHRvcnR1
cmU6IGlmIHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIGhhcyB0byBiZSB0b3J0dXJlZAogICoKICAq
IFRoaXMgZnVuY3Rpb24gcmV0dXJucyB6ZXJvIGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSAlLUVO
T01FTSBpbiBjYXNlIG9mCiAgKiBmYWlsdXJlLgogICovCiBzdGF0aWMgaW50IHNjaGVkdWxlX2Vy
YXNlKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1Ymlfd2xfZW50cnkgKmUsCi0JCQkg
IGludCB0b3J0dXJlKQorCQkJICBpbnQgdm9sX2lkLCBpbnQgbG51bSwgaW50IHRvcnR1cmUpCiB7
CiAJc3RydWN0IHViaV93b3JrICp3bF93cms7CiAKQEAgLTY0NCw2ICs2MDQsOCBAQAogCiAJd2xf
d3JrLT5mdW5jID0gJmVyYXNlX3dvcmtlcjsKIAl3bF93cmstPmUgPSBlOworCXdsX3dyay0+dm9s
X2lkID0gdm9sX2lkOworCXdsX3dyay0+bG51bSA9IGxudW07CiAJd2xfd3JrLT50b3J0dXJlID0g
dG9ydHVyZTsKIAogCXNjaGVkdWxlX3ViaV93b3JrKHViaSwgd2xfd3JrKTsKQEAgLTcxMiw3ICs2
NzQsNyBAQAogCQkJICAgICAgIGUxLT5lYywgZTItPmVjKTsKIAkJCWdvdG8gb3V0X2NhbmNlbDsK
IAkJfQotCQlwYXJhbm9pZF9jaGVja19pbl93bF90cmVlKGUxLCAmdWJpLT51c2VkKTsKKwkJc2Vs
Zl9jaGVja19pbl93bF90cmVlKHViaSwgZTEsICZ1YmktPnVzZWQpOwogCQlyYl9lcmFzZSgmZTEt
PnUucmIsICZ1YmktPnVzZWQpOwogCQlkYmdfd2woIm1vdmUgUEVCICVkIEVDICVkIHRvIFBFQiAl
ZCBFQyAlZCIsCiAJCSAgICAgICBlMS0+cG51bSwgZTEtPmVjLCBlMi0+cG51bSwgZTItPmVjKTsK
QEAgLTcyMSwxMiArNjgzLDEyIEBACiAJCXNjcnViYmluZyA9IDE7CiAJCWUxID0gcmJfZW50cnko
cmJfZmlyc3QoJnViaS0+c2NydWIpLCBzdHJ1Y3QgdWJpX3dsX2VudHJ5LCB1LnJiKTsKIAkJZTIg
PSBmaW5kX3dsX2VudHJ5KCZ1YmktPmZyZWUsIFdMX0ZSRUVfTUFYX0RJRkYpOwotCQlwYXJhbm9p
ZF9jaGVja19pbl93bF90cmVlKGUxLCAmdWJpLT5zY3J1Yik7CisJCXNlbGZfY2hlY2tfaW5fd2xf
dHJlZSh1YmksIGUxLCAmdWJpLT5zY3J1Yik7CiAJCXJiX2VyYXNlKCZlMS0+dS5yYiwgJnViaS0+
c2NydWIpOwogCQlkYmdfd2woInNjcnViIFBFQiAlZCB0byBQRUIgJWQiLCBlMS0+cG51bSwgZTIt
PnBudW0pOwogCX0KIAotCXBhcmFub2lkX2NoZWNrX2luX3dsX3RyZWUoZTIsICZ1YmktPmZyZWUp
OworCXNlbGZfY2hlY2tfaW5fd2xfdHJlZSh1YmksIGUyLCAmdWJpLT5mcmVlKTsKIAlyYl9lcmFz
ZSgmZTItPnUucmIsICZ1YmktPmZyZWUpOwogCXViaS0+bW92ZV9mcm9tID0gZTE7CiAJdWJpLT5t
b3ZlX3RvID0gZTI7CkBAIC03OTIsOCArNzU0LDExIEBACiAJCQlwcm90ZWN0ID0gMTsKIAkJCWdv
dG8gb3V0X25vdF9tb3ZlZDsKIAkJfQotCi0JCWlmIChlcnIgPT0gTU9WRV9DQU5DRUxfQklURkxJ
UFMgfHwgZXJyID09IE1PVkVfVEFSR0VUX1dSX0VSUiB8fAorCQlpZiAoZXJyID09IE1PVkVfUkVU
UlkpIHsKKwkJCXNjcnViYmluZyA9IDE7CisJCQlnb3RvIG91dF9ub3RfbW92ZWQ7CisJCX0KKwkJ
aWYgKGVyciA9PSBNT1ZFX1RBUkdFVF9CSVRGTElQUyB8fCBlcnIgPT0gTU9WRV9UQVJHRVRfV1Jf
RVJSIHx8CiAJCSAgICBlcnIgPT0gTU9WRV9UQVJHRVRfUkRfRVJSKSB7CiAJCQkvKgogCQkJICog
VGFyZ2V0IFBFQiBoYWQgYml0LWZsaXBzIG9yIHdyaXRlIGVycm9yIC0gdG9ydHVyZSBpdC4KQEAg
LTg0MSw3ICs4MDYsNyBAQAogCXViaS0+bW92ZV90b19wdXQgPSB1YmktPndsX3NjaGVkdWxlZCA9
IDA7CiAJc3Bpbl91bmxvY2soJnViaS0+d2xfbG9jayk7CiAKLQllcnIgPSBzY2hlZHVsZV9lcmFz
ZSh1YmksIGUxLCAwKTsKKwllcnIgPSBzY2hlZHVsZV9lcmFzZSh1YmksIGUxLCB2b2xfaWQsIGxu
dW0sIDApOwogCWlmIChlcnIpIHsKIAkJa21lbV9jYWNoZV9mcmVlKHViaV93bF9lbnRyeV9zbGFi
LCBlMSk7CiAJCWlmIChlMikKQEAgLTg1Niw3ICs4MjEsNyBAQAogCQkgKi8KIAkJZGJnX3dsKCJQ
RUIgJWQgKExFQiAlZDolZCkgd2FzIHB1dCBtZWFud2hpbGUsIGVyYXNlIiwKIAkJICAgICAgIGUy
LT5wbnVtLCB2b2xfaWQsIGxudW0pOwotCQllcnIgPSBzY2hlZHVsZV9lcmFzZSh1YmksIGUyLCAw
KTsKKwkJZXJyID0gc2NoZWR1bGVfZXJhc2UodWJpLCBlMiwgdm9sX2lkLCBsbnVtLCAwKTsKIAkJ
aWYgKGVycikgewogCQkJa21lbV9jYWNoZV9mcmVlKHViaV93bF9lbnRyeV9zbGFiLCBlMik7CiAJ
CQlnb3RvIG91dF9ybzsKQEAgLTg5NSw3ICs4NjAsNyBAQAogCXNwaW5fdW5sb2NrKCZ1YmktPnds
X2xvY2spOwogCiAJdWJpX2ZyZWVfdmlkX2hkcih1YmksIHZpZF9oZHIpOwotCWVyciA9IHNjaGVk
dWxlX2VyYXNlKHViaSwgZTIsIHRvcnR1cmUpOworCWVyciA9IHNjaGVkdWxlX2VyYXNlKHViaSwg
ZTIsIHZvbF9pZCwgbG51bSwgdG9ydHVyZSk7CiAJaWYgKGVycikgewogCQlrbWVtX2NhY2hlX2Zy
ZWUodWJpX3dsX2VudHJ5X3NsYWIsIGUyKTsKIAkJZ290byBvdXRfcm87CkBAIC0xMDE0LDYgKzk3
OSw4IEBACiB7CiAJc3RydWN0IHViaV93bF9lbnRyeSAqZSA9IHdsX3dyay0+ZTsKIAlpbnQgcG51
bSA9IGUtPnBudW0sIGVyciwgbmVlZDsKKwlpbnQgdm9sX2lkID0gd2xfd3JrLT52b2xfaWQ7CisJ
aW50IGxudW0gPSB3bF93cmstPmxudW07CiAKIAlpZiAoY2FuY2VsKSB7CiAJCWRiZ193bCgiY2Fu
Y2VsIGVyYXN1cmUgb2YgUEVCICVkIEVDICVkIiwgcG51bSwgZS0+ZWMpOwpAQCAtMTAyMiw3ICs5
ODksOCBAQAogCQlyZXR1cm4gMDsKIAl9CiAKLQlkYmdfd2woImVyYXNlIFBFQiAlZCBFQyAlZCIs
IHBudW0sIGUtPmVjKTsKKwlkYmdfd2woImVyYXNlIFBFQiAlZCBFQyAlZCBMRUIgJWQ6JWQiLAor
CSAgICAgICBwbnVtLCBlLT5lYywgd2xfd3JrLT52b2xfaWQsIHdsX3dyay0+bG51bSk7CiAKIAll
cnIgPSBzeW5jX2VyYXNlKHViaSwgZSwgd2xfd3JrLT50b3J0dXJlKTsKIAlpZiAoIWVycikgewpA
QCAtMTA0NiwyNyArMTAxNCwyOCBAQAogCiAJdWJpX2VycigiZmFpbGVkIHRvIGVyYXNlIFBFQiAl
ZCwgZXJyb3IgJWQiLCBwbnVtLCBlcnIpOwogCWtmcmVlKHdsX3dyayk7Ci0Ja21lbV9jYWNoZV9m
cmVlKHViaV93bF9lbnRyeV9zbGFiLCBlKTsKIAogCWlmIChlcnIgPT0gLUVJTlRSIHx8IGVyciA9
PSAtRU5PTUVNIHx8IGVyciA9PSAtRUFHQUlOIHx8CiAJICAgIGVyciA9PSAtRUJVU1kpIHsKIAkJ
aW50IGVycjE7CiAKIAkJLyogUmUtc2NoZWR1bGUgdGhlIExFQiBmb3IgZXJhc3VyZSAqLwotCQll
cnIxID0gc2NoZWR1bGVfZXJhc2UodWJpLCBlLCAwKTsKKwkJZXJyMSA9IHNjaGVkdWxlX2VyYXNl
KHViaSwgZSwgdm9sX2lkLCBsbnVtLCAwKTsKIAkJaWYgKGVycjEpIHsKIAkJCWVyciA9IGVycjE7
CiAJCQlnb3RvIG91dF9ybzsKIAkJfQogCQlyZXR1cm4gZXJyOwotCX0gZWxzZSBpZiAoZXJyICE9
IC1FSU8pIHsKKwl9CisKKwlrbWVtX2NhY2hlX2ZyZWUodWJpX3dsX2VudHJ5X3NsYWIsIGUpOwor
CWlmIChlcnIgIT0gLUVJTykKIAkJLyoKIAkJICogSWYgdGhpcyBpcyBub3QgJS1FSU8sIHdlIGhh
dmUgbm8gaWRlYSB3aGF0IHRvIGRvLiBTY2hlZHVsaW5nCiAJCSAqIHRoaXMgcGh5c2ljYWwgZXJh
c2VibG9jayBmb3IgZXJhc3VyZSBhZ2FpbiB3b3VsZCBjYXVzZQogCQkgKiBlcnJvcnMgYWdhaW4g
YW5kIGFnYWluLiBXZWxsLCBsZXRzIHN3aXRjaCB0byBSL08gbW9kZS4KIAkJICovCiAJCWdvdG8g
b3V0X3JvOwotCX0KIAogCS8qIEl0IGlzICUtRUlPLCB0aGUgUEVCIHdlbnQgYmFkICovCiAKQEAg
LTExMTksNiArMTA4OCw4IEBACiAvKioKICAqIHViaV93bF9wdXRfcGViIC0gcmV0dXJuIGEgUEVC
IHRvIHRoZSB3ZWFyLWxldmVsaW5nIHN1Yi1zeXN0ZW0uCiAgKiBAdWJpOiBVQkkgZGV2aWNlIGRl
c2NyaXB0aW9uIG9iamVjdAorICogQHZvbF9pZDogdGhlIHZvbHVtZSBJRCB0aGF0IGxhc3QgdXNl
ZCB0aGlzIFBFQgorICogQGxudW06IHRoZSBsYXN0IHVzZWQgbG9naWNhbCBlcmFzZWJsb2NrIG51
bWJlciBmb3IgdGhlIFBFQgogICogQHBudW06IHBoeXNpY2FsIGVyYXNlYmxvY2sgdG8gcmV0dXJu
CiAgKiBAdG9ydHVyZTogaWYgdGhpcyBwaHlzaWNhbCBlcmFzZWJsb2NrIGhhcyB0byBiZSB0b3J0
dXJlZAogICoKQEAgLTExMjcsNyArMTA5OCw4IEBACiAgKiBvY2N1cnJlZCB0byB0aGlzIEBwbnVt
IGFuZCBpdCBoYXMgdG8gYmUgdGVzdGVkLiBUaGlzIGZ1bmN0aW9uIHJldHVybnMgemVybwogICog
aW4gY2FzZSBvZiBzdWNjZXNzLCBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGluIGNhc2Ugb2Yg
ZmFpbHVyZS4KICAqLwotaW50IHViaV93bF9wdXRfcGViKHN0cnVjdCB1YmlfZGV2aWNlICp1Ymks
IGludCBwbnVtLCBpbnQgdG9ydHVyZSkKK2ludCB1Ymlfd2xfcHV0X3BlYihzdHJ1Y3QgdWJpX2Rl
dmljZSAqdWJpLCBpbnQgdm9sX2lkLCBpbnQgbG51bSwKKwkJICAgaW50IHBudW0sIGludCB0b3J0
dXJlKQogewogCWludCBlcnI7CiAJc3RydWN0IHViaV93bF9lbnRyeSAqZTsKQEAgLTExNjksMTMg
KzExNDEsMTMgQEAKIAkJcmV0dXJuIDA7CiAJfSBlbHNlIHsKIAkJaWYgKGluX3dsX3RyZWUoZSwg
JnViaS0+dXNlZCkpIHsKLQkJCXBhcmFub2lkX2NoZWNrX2luX3dsX3RyZWUoZSwgJnViaS0+dXNl
ZCk7CisJCQlzZWxmX2NoZWNrX2luX3dsX3RyZWUodWJpLCBlLCAmdWJpLT51c2VkKTsKIAkJCXJi
X2VyYXNlKCZlLT51LnJiLCAmdWJpLT51c2VkKTsKIAkJfSBlbHNlIGlmIChpbl93bF90cmVlKGUs
ICZ1YmktPnNjcnViKSkgewotCQkJcGFyYW5vaWRfY2hlY2tfaW5fd2xfdHJlZShlLCAmdWJpLT5z
Y3J1Yik7CisJCQlzZWxmX2NoZWNrX2luX3dsX3RyZWUodWJpLCBlLCAmdWJpLT5zY3J1Yik7CiAJ
CQlyYl9lcmFzZSgmZS0+dS5yYiwgJnViaS0+c2NydWIpOwogCQl9IGVsc2UgaWYgKGluX3dsX3Ry
ZWUoZSwgJnViaS0+ZXJyb25lb3VzKSkgewotCQkJcGFyYW5vaWRfY2hlY2tfaW5fd2xfdHJlZShl
LCAmdWJpLT5lcnJvbmVvdXMpOworCQkJc2VsZl9jaGVja19pbl93bF90cmVlKHViaSwgZSwgJnVi
aS0+ZXJyb25lb3VzKTsKIAkJCXJiX2VyYXNlKCZlLT51LnJiLCAmdWJpLT5lcnJvbmVvdXMpOwog
CQkJdWJpLT5lcnJvbmVvdXNfcGViX2NvdW50IC09IDE7CiAJCQl1YmlfYXNzZXJ0KHViaS0+ZXJy
b25lb3VzX3BlYl9jb3VudCA+PSAwKTsKQEAgLTExOTMsNyArMTE2NSw3IEBACiAJfQogCXNwaW5f
dW5sb2NrKCZ1YmktPndsX2xvY2spOwogCi0JZXJyID0gc2NoZWR1bGVfZXJhc2UodWJpLCBlLCB0
b3J0dXJlKTsKKwllcnIgPSBzY2hlZHVsZV9lcmFzZSh1YmksIGUsIHZvbF9pZCwgbG51bSwgdG9y
dHVyZSk7CiAJaWYgKGVycikgewogCQlzcGluX2xvY2soJnViaS0+d2xfbG9jayk7CiAJCXdsX3Ry
ZWVfYWRkKGUsICZ1YmktPnVzZWQpOwpAQCAtMTI0Miw3ICsxMjE0LDcgQEAKIAl9CiAKIAlpZiAo
aW5fd2xfdHJlZShlLCAmdWJpLT51c2VkKSkgewotCQlwYXJhbm9pZF9jaGVja19pbl93bF90cmVl
KGUsICZ1YmktPnVzZWQpOworCQlzZWxmX2NoZWNrX2luX3dsX3RyZWUodWJpLCBlLCAmdWJpLT51
c2VkKTsKIAkJcmJfZXJhc2UoJmUtPnUucmIsICZ1YmktPnVzZWQpOwogCX0gZWxzZSB7CiAJCWlu
dCBlcnI7CkBAIC0xMjY5LDIzICsxMjQxLDU0IEBACiAvKioKICAqIHViaV93bF9mbHVzaCAtIGZs
dXNoIGFsbCBwZW5kaW5nIHdvcmtzLgogICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBv
YmplY3QKKyAqIEB2b2xfaWQ6IHRoZSB2b2x1bWUgaWQgdG8gZmx1c2ggZm9yCisgKiBAbG51bTog
dGhlIGxvZ2ljYWwgZXJhc2VibG9jayBudW1iZXIgdG8gZmx1c2ggZm9yCiAgKgotICogVGhpcyBm
dW5jdGlvbiByZXR1cm5zIHplcm8gaW4gY2FzZSBvZiBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlIGVy
cm9yIGNvZGUgaW4KLSAqIGNhc2Ugb2YgZmFpbHVyZS4KKyAqIFRoaXMgZnVuY3Rpb24gZXhlY3V0
ZXMgYWxsIHBlbmRpbmcgd29ya3MgZm9yIGEgcGFydGljdWxhciB2b2x1bWUgaWQgLworICogbG9n
aWNhbCBlcmFzZWJsb2NrIG51bWJlciBwYWlyLiBJZiBlaXRoZXIgdmFsdWUgaXMgc2V0IHRvICVV
QklfQUxMLCB0aGVuIGl0CisgKiBhY3RzIGFzIGEgd2lsZGNhcmQgZm9yIGFsbCBvZiB0aGUgY29y
cmVzcG9uZGluZyB2b2x1bWUgbnVtYmVycyBvciBsb2dpY2FsCisgKiBlcmFzZWJsb2NrIG51bWJl
cnMuIEl0IHJldHVybnMgemVybyBpbiBjYXNlIG9mIHN1Y2Nlc3MgYW5kIGEgbmVnYXRpdmUgZXJy
b3IKKyAqIGNvZGUgaW4gY2FzZSBvZiBmYWlsdXJlLgogICovCi1pbnQgdWJpX3dsX2ZsdXNoKHN0
cnVjdCB1YmlfZGV2aWNlICp1YmkpCitpbnQgdWJpX3dsX2ZsdXNoKHN0cnVjdCB1YmlfZGV2aWNl
ICp1YmksIGludCB2b2xfaWQsIGludCBsbnVtKQogewotCWludCBlcnI7CisJaW50IGVyciA9IDA7
CisJaW50IGZvdW5kID0gMTsKIAogCS8qCiAJICogRXJhc2Ugd2hpbGUgdGhlIHBlbmRpbmcgd29y
a3MgcXVldWUgaXMgbm90IGVtcHR5LCBidXQgbm90IG1vcmUgdGhhbgogCSAqIHRoZSBudW1iZXIg
b2YgY3VycmVudGx5IHBlbmRpbmcgd29ya3MuCiAJICovCi0JZGJnX3dsKCJmbHVzaCAoJWQgcGVu
ZGluZyB3b3JrcykiLCB1YmktPndvcmtzX2NvdW50KTsKLQl3aGlsZSAodWJpLT53b3Jrc19jb3Vu
dCkgewotCQllcnIgPSBkb193b3JrKHViaSk7Ci0JCWlmIChlcnIpCi0JCQlyZXR1cm4gZXJyOwor
CWRiZ193bCgiZmx1c2ggcGVuZGluZyB3b3JrIGZvciBMRUIgJWQ6JWQgKCVkIHBlbmRpbmcgd29y
a3MpIiwKKwkgICAgICAgdm9sX2lkLCBsbnVtLCB1YmktPndvcmtzX2NvdW50KTsKKworCXdoaWxl
IChmb3VuZCkgeworCQlzdHJ1Y3QgdWJpX3dvcmsgKndyazsKKwkJZm91bmQgPSAwOworCisJCWRv
d25fcmVhZCgmdWJpLT53b3JrX3NlbSk7CisJCXNwaW5fbG9jaygmdWJpLT53bF9sb2NrKTsKKwkJ
bGlzdF9mb3JfZWFjaF9lbnRyeSh3cmssICZ1YmktPndvcmtzLCBsaXN0KSB7CisJCQlpZiAoKHZv
bF9pZCA9PSBVQklfQUxMIHx8IHdyay0+dm9sX2lkID09IHZvbF9pZCkgJiYKKwkJCSAgICAobG51
bSA9PSBVQklfQUxMIHx8IHdyay0+bG51bSA9PSBsbnVtKSkgeworCQkJCWxpc3RfZGVsKCZ3cmst
Pmxpc3QpOworCQkJCXViaS0+d29ya3NfY291bnQgLT0gMTsKKwkJCQl1YmlfYXNzZXJ0KHViaS0+
d29ya3NfY291bnQgPj0gMCk7CisJCQkJc3Bpbl91bmxvY2soJnViaS0+d2xfbG9jayk7CisKKwkJ
CQllcnIgPSB3cmstPmZ1bmModWJpLCB3cmssIDApOworCQkJCWlmIChlcnIpIHsKKwkJCQkJdXBf
cmVhZCgmdWJpLT53b3JrX3NlbSk7CisJCQkJCXJldHVybiBlcnI7CisJCQkJfQorCisJCQkJc3Bp
bl9sb2NrKCZ1YmktPndsX2xvY2spOworCQkJCWZvdW5kID0gMTsKKwkJCQlicmVhazsKKwkJCX0K
KwkJfQorCQlzcGluX3VubG9jaygmdWJpLT53bF9sb2NrKTsKKwkJdXBfcmVhZCgmdWJpLT53b3Jr
X3NlbSk7CiAJfQogCiAJLyoKQEAgLTEyOTUsMTggKzEyOTgsNyBAQAogCWRvd25fd3JpdGUoJnVi
aS0+d29ya19zZW0pOwogCXVwX3dyaXRlKCZ1YmktPndvcmtfc2VtKTsKIAotCS8qCi0JICogQW5k
IGluIGNhc2UgbGFzdCB3YXMgdGhlIFdMIHdvcmtlciBhbmQgaXQgY2FuY2VsZWQgdGhlIExFQgot
CSAqIG1vdmVtZW50LCBmbHVzaCBhZ2Fpbi4KLQkgKi8KLQl3aGlsZSAodWJpLT53b3Jrc19jb3Vu
dCkgewotCQlkYmdfd2woImZsdXNoIG1vcmUgKCVkIHBlbmRpbmcgd29ya3MpIiwgdWJpLT53b3Jr
c19jb3VudCk7Ci0JCWVyciA9IGRvX3dvcmsodWJpKTsKLQkJaWYgKGVycikKLQkJCXJldHVybiBl
cnI7Ci0JfQotCi0JcmV0dXJuIDA7CisJcmV0dXJuIGVycjsKIH0KIAogLyoqCkBAIC0xMzY0LDcg
KzEzNTYsNyBAQAogCiAJCXNwaW5fbG9jaygmdWJpLT53bF9sb2NrKTsKIAkJaWYgKGxpc3RfZW1w
dHkoJnViaS0+d29ya3MpIHx8IHViaS0+cm9fbW9kZSB8fAotCQkgICAgIXViaS0+dGhyZWFkX2Vu
YWJsZWQgfHwgdWJpX2RiZ19pc19iZ3RfZGlzYWJsZWQoKSkgeworCQkgICAgIXViaS0+dGhyZWFk
X2VuYWJsZWQgfHwgdWJpX2RiZ19pc19iZ3RfZGlzYWJsZWQodWJpKSkgewogCQkJc2V0X2N1cnJl
bnRfc3RhdGUoVEFTS19JTlRFUlJVUFRJQkxFKTsKIAkJCXNwaW5fdW5sb2NrKCZ1YmktPndsX2xv
Y2spOwogCQkJc2NoZWR1bGUoKTsKQEAgLTE0MTUsMjYgKzE0MDcsMjYgQEAKIH0KIAogLyoqCi0g
KiB1Ymlfd2xfaW5pdF9zY2FuIC0gaW5pdGlhbGl6ZSB0aGUgV0wgc3ViLXN5c3RlbSB1c2luZyBz
Y2FubmluZyBpbmZvcm1hdGlvbi4KKyAqIHViaV93bF9pbml0IC0gaW5pdGlhbGl6ZSB0aGUgV0wg
c3ViLXN5c3RlbSB1c2luZyBhdHRhY2hpbmcgaW5mb3JtYXRpb24uCiAgKiBAdWJpOiBVQkkgZGV2
aWNlIGRlc2NyaXB0aW9uIG9iamVjdAotICogQHNpOiBzY2FubmluZyBpbmZvcm1hdGlvbgorICog
QGFpOiBhdHRhY2hpbmcgaW5mb3JtYXRpb24KICAqCiAgKiBUaGlzIGZ1bmN0aW9uIHJldHVybnMg
emVybyBpbiBjYXNlIG9mIHN1Y2Nlc3MsIGFuZCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgaW4KICAq
IGNhc2Ugb2YgZmFpbHVyZS4KICAqLwotaW50IHViaV93bF9pbml0X3NjYW4oc3RydWN0IHViaV9k
ZXZpY2UgKnViaSwgc3RydWN0IHViaV9zY2FuX2luZm8gKnNpKQoraW50IHViaV93bF9pbml0KHN0
cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1YmlfYXR0YWNoX2luZm8gKmFpKQogewogCWlu
dCBlcnIsIGk7CiAJc3RydWN0IHJiX25vZGUgKnJiMSwgKnJiMjsKLQlzdHJ1Y3QgdWJpX3NjYW5f
dm9sdW1lICpzdjsKLQlzdHJ1Y3QgdWJpX3NjYW5fbGViICpzZWIsICp0bXA7CisJc3RydWN0IHVi
aV9haW5mX3ZvbHVtZSAqYXY7CisJc3RydWN0IHViaV9haW5mX3BlYiAqYWViLCAqdG1wOwogCXN0
cnVjdCB1Ymlfd2xfZW50cnkgKmU7CiAKIAl1YmktPnVzZWQgPSB1YmktPmVycm9uZW91cyA9IHVi
aS0+ZnJlZSA9IHViaS0+c2NydWIgPSBSQl9ST09UOwogCXNwaW5fbG9ja19pbml0KCZ1YmktPnds
X2xvY2spOwogCW11dGV4X2luaXQoJnViaS0+bW92ZV9tdXRleCk7CiAJaW5pdF9yd3NlbSgmdWJp
LT53b3JrX3NlbSk7Ci0JdWJpLT5tYXhfZWMgPSBzaS0+bWF4X2VjOworCXViaS0+bWF4X2VjID0g
YWktPm1heF9lYzsKIAlJTklUX0xJU1RfSEVBRCgmdWJpLT53b3Jrcyk7CiAKIAlzcHJpbnRmKHVi
aS0+Ymd0X25hbWUsIFVCSV9CR1RfTkFNRV9QQVRURVJOLCB1YmktPnViaV9udW0pOwpAQCAtMTQ0
OCw0OCArMTQ0MCw0OCBAQAogCQlJTklUX0xJU1RfSEVBRCgmdWJpLT5wcVtpXSk7CiAJdWJpLT5w
cV9oZWFkID0gMDsKIAotCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShzZWIsIHRtcCwgJnNpLT5l
cmFzZSwgdS5saXN0KSB7CisJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGFlYiwgdG1wLCAmYWkt
PmVyYXNlLCB1Lmxpc3QpIHsKIAkJY29uZF9yZXNjaGVkKCk7CiAKIAkJZSA9IGttZW1fY2FjaGVf
YWxsb2ModWJpX3dsX2VudHJ5X3NsYWIsIEdGUF9LRVJORUwpOwogCQlpZiAoIWUpCiAJCQlnb3Rv
IG91dF9mcmVlOwogCi0JCWUtPnBudW0gPSBzZWItPnBudW07Ci0JCWUtPmVjID0gc2ViLT5lYzsK
KwkJZS0+cG51bSA9IGFlYi0+cG51bTsKKwkJZS0+ZWMgPSBhZWItPmVjOwogCQl1YmktPmxvb2t1
cHRibFtlLT5wbnVtXSA9IGU7Ci0JCWlmIChzY2hlZHVsZV9lcmFzZSh1YmksIGUsIDApKSB7CisJ
CWlmIChzY2hlZHVsZV9lcmFzZSh1YmksIGUsIGFlYi0+dm9sX2lkLCBhZWItPmxudW0sIDApKSB7
CiAJCQlrbWVtX2NhY2hlX2ZyZWUodWJpX3dsX2VudHJ5X3NsYWIsIGUpOwogCQkJZ290byBvdXRf
ZnJlZTsKIAkJfQogCX0KIAotCWxpc3RfZm9yX2VhY2hfZW50cnkoc2ViLCAmc2ktPmZyZWUsIHUu
bGlzdCkgeworCWxpc3RfZm9yX2VhY2hfZW50cnkoYWViLCAmYWktPmZyZWUsIHUubGlzdCkgewog
CQljb25kX3Jlc2NoZWQoKTsKIAogCQllID0ga21lbV9jYWNoZV9hbGxvYyh1Ymlfd2xfZW50cnlf
c2xhYiwgR0ZQX0tFUk5FTCk7CiAJCWlmICghZSkKIAkJCWdvdG8gb3V0X2ZyZWU7CiAKLQkJZS0+
cG51bSA9IHNlYi0+cG51bTsKLQkJZS0+ZWMgPSBzZWItPmVjOworCQllLT5wbnVtID0gYWViLT5w
bnVtOworCQllLT5lYyA9IGFlYi0+ZWM7CiAJCXViaV9hc3NlcnQoZS0+ZWMgPj0gMCk7CiAJCXds
X3RyZWVfYWRkKGUsICZ1YmktPmZyZWUpOwogCQl1YmktPmxvb2t1cHRibFtlLT5wbnVtXSA9IGU7
CiAJfQogCi0JdWJpX3JiX2Zvcl9lYWNoX2VudHJ5KHJiMSwgc3YsICZzaS0+dm9sdW1lcywgcmIp
IHsKLQkJdWJpX3JiX2Zvcl9lYWNoX2VudHJ5KHJiMiwgc2ViLCAmc3YtPnJvb3QsIHUucmIpIHsK
Kwl1YmlfcmJfZm9yX2VhY2hfZW50cnkocmIxLCBhdiwgJmFpLT52b2x1bWVzLCByYikgeworCQl1
YmlfcmJfZm9yX2VhY2hfZW50cnkocmIyLCBhZWIsICZhdi0+cm9vdCwgdS5yYikgewogCQkJY29u
ZF9yZXNjaGVkKCk7CiAKIAkJCWUgPSBrbWVtX2NhY2hlX2FsbG9jKHViaV93bF9lbnRyeV9zbGFi
LCBHRlBfS0VSTkVMKTsKIAkJCWlmICghZSkKIAkJCQlnb3RvIG91dF9mcmVlOwogCi0JCQllLT5w
bnVtID0gc2ViLT5wbnVtOwotCQkJZS0+ZWMgPSBzZWItPmVjOworCQkJZS0+cG51bSA9IGFlYi0+
cG51bTsKKwkJCWUtPmVjID0gYWViLT5lYzsKIAkJCXViaS0+bG9va3VwdGJsW2UtPnBudW1dID0g
ZTsKLQkJCWlmICghc2ViLT5zY3J1YikgeworCQkJaWYgKCFhZWItPnNjcnViKSB7CiAJCQkJZGJn
X3dsKCJhZGQgUEVCICVkIEVDICVkIHRvIHRoZSB1c2VkIHRyZWUiLAogCQkJCSAgICAgICBlLT5w
bnVtLCBlLT5lYyk7CiAJCQkJd2xfdHJlZV9hZGQoZSwgJnViaS0+dXNlZCk7CkBAIC0xNTYxLDEw
ICsxNTUzLDggQEAKIAlrZnJlZSh1YmktPmxvb2t1cHRibCk7CiB9CiAKLSNpZmRlZiBDT05GSUdf
TVREX1VCSV9ERUJVRwotCiAvKioKLSAqIHBhcmFub2lkX2NoZWNrX2VjIC0gbWFrZSBzdXJlIHRo
YXQgdGhlIGVyYXNlIGNvdW50ZXIgb2YgYSBQRUIgaXMgY29ycmVjdC4KKyAqIHNlbGZfY2hlY2tf
ZWMgLSBtYWtlIHN1cmUgdGhhdCB0aGUgZXJhc2UgY291bnRlciBvZiBhIFBFQiBpcyBjb3JyZWN0
LgogICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKICAqIEBwbnVtOiB0aGUg
cGh5c2ljYWwgZXJhc2VibG9jayBudW1iZXIgdG8gY2hlY2sKICAqIEBlYzogdGhlIGVyYXNlIGNv
dW50ZXIgdG8gY2hlY2sKQEAgLTE1NzMsMTMgKzE1NjMsMTMgQEAKICAqIGlzIGVxdWl2YWxlbnQg
dG8gQGVjLCBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGlmIG5vdCBvciBpZiBhbiBlcnJvcgog
ICogb2NjdXJyZWQuCiAgKi8KLXN0YXRpYyBpbnQgcGFyYW5vaWRfY2hlY2tfZWMoc3RydWN0IHVi
aV9kZXZpY2UgKnViaSwgaW50IHBudW0sIGludCBlYykKK3N0YXRpYyBpbnQgc2VsZl9jaGVja19l
YyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwgaW50IGVjKQogewogCWludCBlcnI7
CiAJbG9uZyBsb25nIHJlYWRfZWM7CiAJc3RydWN0IHViaV9lY19oZHIgKmVjX2hkcjsKIAotCWlm
ICghKHViaV9jaGtfZmxhZ3MgJiBVQklfQ0hLX0dFTikpCisJaWYgKCF1YmktPmRiZy0+Y2hrX2dl
bikKIAkJcmV0dXJuIDA7CiAKIAllY19oZHIgPSBremFsbG9jKHViaS0+ZWNfaGRyX2Fsc2l6ZSwg
R0ZQX05PRlMpOwpAQCAtMTU5NSw5ICsxNTg1LDkgQEAKIAogCXJlYWRfZWMgPSBiZTY0X3RvX2Nw
dShlY19oZHItPmVjKTsKIAlpZiAoZWMgIT0gcmVhZF9lYykgewotCQl1YmlfZXJyKCJwYXJhbm9p
ZCBjaGVjayBmYWlsZWQgZm9yIFBFQiAlZCIsIHBudW0pOworCQl1YmlfZXJyKCJzZWxmLWNoZWNr
IGZhaWxlZCBmb3IgUEVCICVkIiwgcG51bSk7CiAJCXViaV9lcnIoInJlYWQgRUMgaXMgJWxsZCwg
c2hvdWxkIGJlICVkIiwgcmVhZF9lYywgZWMpOwotCQl1YmlfZGJnX2R1bXBfc3RhY2soKTsKKwkJ
ZHVtcF9zdGFjaygpOwogCQllcnIgPSAxOwogCX0gZWxzZQogCQllcnIgPSAwOwpAQCAtMTYwOCw0
MiArMTU5OCw0NCBAQAogfQogCiAvKioKLSAqIHBhcmFub2lkX2NoZWNrX2luX3dsX3RyZWUgLSBj
aGVjayB0aGF0IHdlYXItbGV2ZWxpbmcgZW50cnkgaXMgaW4gV0wgUkItdHJlZS4KKyAqIHNlbGZf
Y2hlY2tfaW5fd2xfdHJlZSAtIGNoZWNrIHRoYXQgd2Vhci1sZXZlbGluZyBlbnRyeSBpcyBpbiBX
TCBSQi10cmVlLgorICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKICAqIEBl
OiB0aGUgd2Vhci1sZXZlbGluZyBlbnRyeSB0byBjaGVjawogICogQHJvb3Q6IHRoZSByb290IG9m
IHRoZSB0cmVlCiAgKgogICogVGhpcyBmdW5jdGlvbiByZXR1cm5zIHplcm8gaWYgQGUgaXMgaW4g
dGhlIEByb290IFJCLXRyZWUgYW5kICUtRUlOVkFMIGlmIGl0CiAgKiBpcyBub3QuCiAgKi8KLXN0
YXRpYyBpbnQgcGFyYW5vaWRfY2hlY2tfaW5fd2xfdHJlZShzdHJ1Y3QgdWJpX3dsX2VudHJ5ICpl
LAotCQkJCSAgICAgc3RydWN0IHJiX3Jvb3QgKnJvb3QpCitzdGF0aWMgaW50IHNlbGZfY2hlY2tf
aW5fd2xfdHJlZShjb25zdCBzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLAorCQkJCSBzdHJ1Y3QgdWJp
X3dsX2VudHJ5ICplLCBzdHJ1Y3QgcmJfcm9vdCAqcm9vdCkKIHsKLQlpZiAoISh1YmlfY2hrX2Zs
YWdzICYgVUJJX0NIS19HRU4pKQorCWlmICghdWJpLT5kYmctPmNoa19nZW4pCiAJCXJldHVybiAw
OwogCiAJaWYgKGluX3dsX3RyZWUoZSwgcm9vdCkpCiAJCXJldHVybiAwOwogCi0JdWJpX2Vycigi
cGFyYW5vaWQgY2hlY2sgZmFpbGVkIGZvciBQRUIgJWQsIEVDICVkLCBSQi10cmVlICVwICIsCisJ
dWJpX2Vycigic2VsZi1jaGVjayBmYWlsZWQgZm9yIFBFQiAlZCwgRUMgJWQsIFJCLXRyZWUgJXAg
IiwKIAkJZS0+cG51bSwgZS0+ZWMsIHJvb3QpOwotCXViaV9kYmdfZHVtcF9zdGFjaygpOworCWR1
bXBfc3RhY2soKTsKIAlyZXR1cm4gLUVJTlZBTDsKIH0KIAogLyoqCi0gKiBwYXJhbm9pZF9jaGVj
a19pbl9wcSAtIGNoZWNrIGlmIHdlYXItbGV2ZWxpbmcgZW50cnkgaXMgaW4gdGhlIHByb3RlY3Rp
b24KKyAqIHNlbGZfY2hlY2tfaW5fcHEgLSBjaGVjayBpZiB3ZWFyLWxldmVsaW5nIGVudHJ5IGlz
IGluIHRoZSBwcm90ZWN0aW9uCiAgKiAgICAgICAgICAgICAgICAgICAgICAgIHF1ZXVlLgogICog
QHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKICAqIEBlOiB0aGUgd2Vhci1sZXZl
bGluZyBlbnRyeSB0byBjaGVjawogICoKICAqIFRoaXMgZnVuY3Rpb24gcmV0dXJucyB6ZXJvIGlm
IEBlIGlzIGluIEB1YmktPnBxIGFuZCAlLUVJTlZBTCBpZiBpdCBpcyBub3QuCiAgKi8KLXN0YXRp
YyBpbnQgcGFyYW5vaWRfY2hlY2tfaW5fcHEoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0
IHViaV93bF9lbnRyeSAqZSkKK3N0YXRpYyBpbnQgc2VsZl9jaGVja19pbl9wcShjb25zdCBzdHJ1
Y3QgdWJpX2RldmljZSAqdWJpLAorCQkJICAgIHN0cnVjdCB1Ymlfd2xfZW50cnkgKmUpCiB7CiAJ
c3RydWN0IHViaV93bF9lbnRyeSAqcDsKIAlpbnQgaTsKIAotCWlmICghKHViaV9jaGtfZmxhZ3Mg
JiBVQklfQ0hLX0dFTikpCisJaWYgKCF1YmktPmRiZy0+Y2hrX2dlbikKIAkJcmV0dXJuIDA7CiAK
IAlmb3IgKGkgPSAwOyBpIDwgVUJJX1BST1RfUVVFVUVfTEVOOyArK2kpCkBAIC0xNjUxLDEwICsx
NjQzLDggQEAKIAkJCWlmIChwID09IGUpCiAJCQkJcmV0dXJuIDA7CiAKLQl1YmlfZXJyKCJwYXJh
bm9pZCBjaGVjayBmYWlsZWQgZm9yIFBFQiAlZCwgRUMgJWQsIFByb3RlY3QgcXVldWUiLAorCXVi
aV9lcnIoInNlbGYtY2hlY2sgZmFpbGVkIGZvciBQRUIgJWQsIEVDICVkLCBQcm90ZWN0IHF1ZXVl
IiwKIAkJZS0+cG51bSwgZS0+ZWMpOwotCXViaV9kYmdfZHVtcF9zdGFjaygpOworCWR1bXBfc3Rh
Y2soKTsKIAlyZXR1cm4gLUVJTlZBTDsKIH0KLQotI2VuZGlmIC8qIENPTkZJR19NVERfVUJJX0RF
QlVHICovCmRpZmYgLXVOIC11TnIgbGludXgtMy4wL2ZzL3ViaWZzL0tjb25maWcgbGludXgtMy4w
LngudWJpZnMubGF0ZXN0L2ZzL3ViaWZzL0tjb25maWcKLS0tIGxpbnV4LTMuMC9mcy91Ymlmcy9L
Y29uZmlnCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAu
eC51Ymlmcy5sYXRlc3QvZnMvdWJpZnMvS2NvbmZpZwkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAw
MDAwMCAtMDUwMApAQCAtMTEsMTIgKzExLDYgQEAKIAloZWxwCiAJICBVQklGUyBpcyBhIGZpbGUg
c3lzdGVtIGZvciBmbGFzaCBkZXZpY2VzIHdoaWNoIHdvcmtzIG9uIHRvcCBvZiBVQkkuCiAKLWNv
bmZpZyBVQklGU19GU19YQVRUUgotCWJvb2wgIkV4dGVuZGVkIGF0dHJpYnV0ZXMgc3VwcG9ydCIK
LQlkZXBlbmRzIG9uIFVCSUZTX0ZTCi0JaGVscAotCSAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBw
b3J0IG9mIGV4dGVuZGVkIGF0dHJpYnV0ZXMuCi0KIGNvbmZpZyBVQklGU19GU19BRFZBTkNFRF9D
T01QUgogCWJvb2wgIkFkdmFuY2VkIGNvbXByZXNzaW9uIG9wdGlvbnMiCiAJZGVwZW5kcyBvbiBV
QklGU19GUwpAQCAtNDEsMjAgKzM1LDMgQEAKIAlkZWZhdWx0IHkKIAloZWxwCiAJICBabGliIGNv
bXByZXNzZXMgYmV0dGVyIHRoYW4gTFpPIGJ1dCBpdCBpcyBzbG93ZXIuIFNheSAnWScgaWYgdW5z
dXJlLgotCi0jIERlYnVnZ2luZy1yZWxhdGVkIHN0dWZmCi1jb25maWcgVUJJRlNfRlNfREVCVUcK
LQlib29sICJFbmFibGUgZGVidWdnaW5nIHN1cHBvcnQiCi0JZGVwZW5kcyBvbiBVQklGU19GUwot
CXNlbGVjdCBERUJVR19GUwotCXNlbGVjdCBLQUxMU1lNUwotCWhlbHAKLQkgIFRoaXMgb3B0aW9u
IGVuYWJsZXMgVUJJRlMgZGVidWdnaW5nIHN1cHBvcnQuIEl0IG1ha2VzIHN1cmUgdmFyaW91cwot
CSAgYXNzZXJ0aW9ucywgc2VsZi1jaGVja3MsIGRlYnVnZ2luZyBtZXNzYWdlcyBhbmQgdGVzdCBt
b2RlcyBhcmUgY29tcGlsZWQKLQkgIGluICh0aGlzIGFsbCBpcyBjb21waWxlZCBvdXQgb3RoZXJ3
aXNlKS4gQXNzZXJ0aW9ucyBhcmUgbGlnaHQtd2VpZ2h0Ci0JICBhbmQgdGhpcyBvcHRpb24gYWxz
byBlbmFibGVzIHRoZW0uIFNlbGYtY2hlY2tzLCBkZWJ1Z2dpbmcgbWVzc2FnZXMgYW5kCi0JICB0
ZXN0IG1vZGVzIGFyZSBzd2l0Y2hlZCBvZmYgYnkgZGVmYXVsdC4gVGh1cywgaXQgaXMgc2FmZSBh
bmQgYWN0dWFsbHkKLQkgIHJlY29tbWVuZGVkIHRvIGhhdmUgZGVidWdnaW5nIHN1cHBvcnQgZW5h
YmxlZCwgYW5kIGl0IHNob3VsZCBub3Qgc2xvdwotCSAgZG93biBVQklGUy4gWW91IGNhbiB0aGVu
IGZ1cnRoZXIgZW5hYmxlIC8gZGlzYWJsZSBpbmRpdmlkdWFsICBkZWJ1Z2dpbmcKLQkgIGZlYXR1
cmVzIHVzaW5nIFVCSUZTIG1vZHVsZSBwYXJhbWV0ZXJzIGFuZCB0aGUgY29ycmVzcG9uZGluZyBz
eXNmcwotCSAgaW50ZXJmYWNlcy4KZGlmZiAtdU4gLXVOciBsaW51eC0zLjAvZnMvdWJpZnMvTWFr
ZWZpbGUgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2ZzL3ViaWZzL01ha2VmaWxlCi0tLSBsaW51
eC0zLjAvZnMvdWJpZnMvTWFrZWZpbGUJMjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1
MDAKKysrIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9mcy91Ymlmcy9NYWtlZmlsZQkyMDEyLTA2
LTI4IDExOjI2OjE1LjAwMDAwMDAwMCAtMDUwMApAQCAtMyw3ICszLDQgQEAKIHViaWZzLXkgKz0g
c2hyaW5rZXIubyBqb3VybmFsLm8gZmlsZS5vIGRpci5vIHN1cGVyLm8gc2IubyBpby5vCiB1Ymlm
cy15ICs9IHRuYy5vIG1hc3Rlci5vIHNjYW4ubyByZXBsYXkubyBsb2cubyBjb21taXQubyBnYy5v
IG9ycGhhbi5vCiB1Ymlmcy15ICs9IGJ1ZGdldC5vIGZpbmQubyB0bmNfY29tbWl0Lm8gY29tcHJl
c3MubyBscHQubyBscHJvcHMubwotdWJpZnMteSArPSByZWNvdmVyeS5vIGlvY3RsLm8gbHB0X2Nv
bW1pdC5vIHRuY19taXNjLm8KLQotdWJpZnMtJChDT05GSUdfVUJJRlNfRlNfREVCVUcpICs9IGRl
YnVnLm8KLXViaWZzLSQoQ09ORklHX1VCSUZTX0ZTX1hBVFRSKSArPSB4YXR0ci5vCit1Ymlmcy15
ICs9IHJlY292ZXJ5Lm8gaW9jdGwubyBscHRfY29tbWl0Lm8gdG5jX21pc2MubyB4YXR0ci5vIGRl
YnVnLm8KZGlmZiAtdU4gLXVOciBsaW51eC0zLjAvZnMvdWJpZnMvY29tbWl0LmMgbGludXgtMy4w
LngudWJpZnMubGF0ZXN0L2ZzL3ViaWZzL2NvbW1pdC5jCi0tLSBsaW51eC0zLjAvZnMvdWJpZnMv
Y29tbWl0LmMJMjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMu
MC54LnViaWZzLmxhdGVzdC9mcy91Ymlmcy9jb21taXQuYwkyMDEyLTA2LTI4IDExOjI2OjE1LjAw
MDAwMDAwMCAtMDUwMApAQCAtNzgsNyArNzgsNyBAQAogCSAqIElmIHRoZSByb290IFROQyBub2Rl
IGlzIGRpcnR5LCB3ZSBkZWZpbml0ZWx5IGhhdmUgc29tZXRoaW5nIHRvCiAJICogY29tbWl0Lgog
CSAqLwotCWlmIChjLT56cm9vdC56bm9kZSAmJiB0ZXN0X2JpdChESVJUWV9aTk9ERSwgJmMtPnpy
b290Lnpub2RlLT5mbGFncykpCisJaWYgKGMtPnpyb290Lnpub2RlICYmIHViaWZzX3puX2RpcnR5
KGMtPnpyb290Lnpub2RlKSkKIAkJcmV0dXJuIDA7CiAKIAkvKgpAQCAtNDE4LDcgKzQxOCw3IEBA
CiAKIAlzcGluX2xvY2soJmMtPmNzX2xvY2spOwogCWlmIChjLT5jbXRfc3RhdGUgPT0gQ09NTUlU
X0JST0tFTikgewotCQllcnIgPSAtRUlOVkFMOworCQllcnIgPSAtRVJPRlM7CiAJCWdvdG8gb3V0
OwogCX0KIApAQCAtNDQ0LDcgKzQ0NCw3IEBACiAJICogcmUtY2hlY2sgaXQuCiAJICovCiAJaWYg
KGMtPmNtdF9zdGF0ZSA9PSBDT01NSVRfQlJPS0VOKSB7Ci0JCWVyciA9IC1FSU5WQUw7CisJCWVy
ciA9IC1FUk9GUzsKIAkJZ290byBvdXRfY210X3VubG9jazsKIAl9CiAKQEAgLTQ5Niw3ICs0OTYs
OSBAQAogCXJldHVybiByZXQ7CiB9CiAKLSNpZmRlZiBDT05GSUdfVUJJRlNfRlNfREVCVUcKKy8q
CisgKiBFdmVyeXRoaW5nIGJlbG93IGlzIHJlbGF0ZWQgdG8gZGVidWdnaW5nLgorICovCiAKIC8q
KgogICogc3RydWN0IGlkeF9ub2RlIC0gaG9sZCBpbmRleCBub2RlcyBkdXJpbmcgaW5kZXggdHJl
ZSB0cmF2ZXJzYWwuCkBAIC01NzYsNyArNTc4LDcgQEAKIAlzdHJ1Y3QgaWR4X25vZGUgKmk7CiAJ
c2l6ZV90IHN6OwogCi0JaWYgKCEodWJpZnNfY2hrX2ZsYWdzICYgVUJJRlNfQ0hLX09MRF9JRFgp
KQorCWlmICghZGJnX2lzX2Noa19pbmRleChjKSkKIAkJcmV0dXJuIDA7CiAKIAlJTklUX0xJU1Rf
SEVBRCgmbGlzdCk7CkBAIC03MTQsMTQgKzcxNiwxNCBAQAogCXJldHVybiAwOwogCiBvdXRfZHVt
cDoKLQlkYmdfZXJyKCJkdW1waW5nIGluZGV4IG5vZGUgKGlpcD0lZCkiLCBpLT5paXApOwotCWRi
Z19kdW1wX25vZGUoYywgaWR4KTsKKwl1Ymlmc19lcnIoImR1bXBpbmcgaW5kZXggbm9kZSAoaWlw
PSVkKSIsIGktPmlpcCk7CisJdWJpZnNfZHVtcF9ub2RlKGMsIGlkeCk7CiAJbGlzdF9kZWwoJmkt
Pmxpc3QpOwogCWtmcmVlKGkpOwogCWlmICghbGlzdF9lbXB0eSgmbGlzdCkpIHsKIAkJaSA9IGxp
c3RfZW50cnkobGlzdC5wcmV2LCBzdHJ1Y3QgaWR4X25vZGUsIGxpc3QpOwotCQlkYmdfZXJyKCJk
dW1waW5nIHBhcmVudCBpbmRleCBub2RlIik7Ci0JCWRiZ19kdW1wX25vZGUoYywgJmktPmlkeCk7
CisJCXViaWZzX2VycigiZHVtcGluZyBwYXJlbnQgaW5kZXggbm9kZSIpOworCQl1Ymlmc19kdW1w
X25vZGUoYywgJmktPmlkeCk7CiAJfQogb3V0X2ZyZWU6CiAJd2hpbGUgKCFsaXN0X2VtcHR5KCZs
aXN0KSkgewpAQCAtNzM0LDUgKzczNiwzIEBACiAJCWVyciA9IC1FSU5WQUw7CiAJcmV0dXJuIGVy
cjsKIH0KLQotI2VuZGlmIC8qIENPTkZJR19VQklGU19GU19ERUJVRyAqLwpkaWZmIC11TiAtdU5y
IGxpbnV4LTMuMC9mcy91Ymlmcy9kZWJ1Zy5jIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9mcy91
Ymlmcy9kZWJ1Zy5jCi0tLSBsaW51eC0zLjAvZnMvdWJpZnMvZGVidWcuYwkyMDExLTA3LTIxIDIx
OjE3OjIzLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2ZzL3Vi
aWZzL2RlYnVnLmMJMjAxMi0wNi0yOCAxMToyNjoxNS4wMDAwMDAwMDAgLTA1MDAKQEAgLTI3LDI5
ICsyNywxNCBAQAogICogdmFyaW91cyBsb2NhbCBmdW5jdGlvbnMgb2YgdGhvc2Ugc3Vic3lzdGVt
cy4KICAqLwogCi0jZGVmaW5lIFVCSUZTX0RCR19QUkVTRVJWRV9VQkkKLQotI2luY2x1ZGUgInVi
aWZzLmgiCiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Ci0jaW5jbHVkZSA8bGludXgvbW9kdWxl
cGFyYW0uaD4KICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+CiAjaW5jbHVkZSA8bGludXgvbWF0
aDY0Lmg+CisjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgorI2luY2x1ZGUgPGxpbnV4L3JhbmRv
bS5oPgorI2luY2x1ZGUgInViaWZzLmgiCiAKLSNpZmRlZiBDT05GSUdfVUJJRlNfRlNfREVCVUcK
LQotREVGSU5FX1NQSU5MT0NLKGRiZ19sb2NrKTsKLQotc3RhdGljIGNoYXIgZGJnX2tleV9idWYw
WzEyOF07Ci1zdGF0aWMgY2hhciBkYmdfa2V5X2J1ZjFbMTI4XTsKLQotdW5zaWduZWQgaW50IHVi
aWZzX2Noa19mbGFnczsKLXVuc2lnbmVkIGludCB1Ymlmc190c3RfZmxhZ3M7Ci0KLW1vZHVsZV9w
YXJhbV9uYW1lZChkZWJ1Z19jaGtzLCB1Ymlmc19jaGtfZmxhZ3MsIHVpbnQsIFNfSVJVR08gfCBT
X0lXVVNSKTsKLW1vZHVsZV9wYXJhbV9uYW1lZChkZWJ1Z190c3RzLCB1Ymlmc190c3RfZmxhZ3Ms
IHVpbnQsIFNfSVJVR08gfCBTX0lXVVNSKTsKLQotTU9EVUxFX1BBUk1fREVTQyhkZWJ1Z19jaGtz
LCAiRGVidWcgY2hlY2sgZmxhZ3MiKTsKLU1PRFVMRV9QQVJNX0RFU0MoZGVidWdfdHN0cywgIkRl
YnVnIHNwZWNpYWwgdGVzdCBmbGFncyIpOworc3RhdGljIERFRklORV9TUElOTE9DSyhkYmdfbG9j
ayk7CiAKIHN0YXRpYyBjb25zdCBjaGFyICpnZXRfa2V5X2ZtdChpbnQgZm10KQogewpAQCAtOTEs
OCArNzYsMzAgQEAKIAl9CiB9CiAKLXN0YXRpYyB2b2lkIHNwcmludGZfa2V5KGNvbnN0IHN0cnVj
dCB1Ymlmc19pbmZvICpjLCBjb25zdCB1bmlvbiB1Ymlmc19rZXkgKmtleSwKLQkJCWNoYXIgKmJ1
ZmZlcikKK3N0YXRpYyBjb25zdCBjaGFyICpnZXRfZGVudF90eXBlKGludCB0eXBlKQoreworCXN3
aXRjaCAodHlwZSkgeworCWNhc2UgVUJJRlNfSVRZUEVfUkVHOgorCQlyZXR1cm4gImZpbGUiOwor
CWNhc2UgVUJJRlNfSVRZUEVfRElSOgorCQlyZXR1cm4gImRpciI7CisJY2FzZSBVQklGU19JVFlQ
RV9MTks6CisJCXJldHVybiAic3ltbGluayI7CisJY2FzZSBVQklGU19JVFlQRV9CTEs6CisJCXJl
dHVybiAiYmxrZGV2IjsKKwljYXNlIFVCSUZTX0lUWVBFX0NIUjoKKwkJcmV0dXJuICJjaGFyIGRl
diI7CisJY2FzZSBVQklGU19JVFlQRV9GSUZPOgorCQlyZXR1cm4gImZpZm8iOworCWNhc2UgVUJJ
RlNfSVRZUEVfU09DSzoKKwkJcmV0dXJuICJzb2NrZXQiOworCWRlZmF1bHQ6CisJCXJldHVybiAi
dW5rbm93bi9pbnZhbGlkIHR5cGUiOworCX0KK30KKworY29uc3QgY2hhciAqZGJnX3NucHJpbnRm
X2tleShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKKwkJCSAgICAgY29uc3QgdW5pb24gdWJp
ZnNfa2V5ICprZXksIGNoYXIgKmJ1ZmZlciwgaW50IGxlbikKIHsKIAljaGFyICpwID0gYnVmZmVy
OwogCWludCB0eXBlID0ga2V5X3R5cGUoYywga2V5KTsKQEAgLTEwMCw0NSArMTA3LDM0IEBACiAJ
aWYgKGMtPmtleV9mbXQgPT0gVUJJRlNfU0lNUExFX0tFWV9GTVQpIHsKIAkJc3dpdGNoICh0eXBl
KSB7CiAJCWNhc2UgVUJJRlNfSU5PX0tFWToKLQkJCXNwcmludGYocCwgIiglbHUsICVzKSIsICh1
bnNpZ25lZCBsb25nKWtleV9pbnVtKGMsIGtleSksCi0JCQkgICAgICAgZ2V0X2tleV90eXBlKHR5
cGUpKTsKKwkJCWxlbiAtPSBzbnByaW50ZihwLCBsZW4sICIoJWx1LCAlcykiLAorCQkJCQkodW5z
aWduZWQgbG9uZylrZXlfaW51bShjLCBrZXkpLAorCQkJCQlnZXRfa2V5X3R5cGUodHlwZSkpOwog
CQkJYnJlYWs7CiAJCWNhc2UgVUJJRlNfREVOVF9LRVk6CiAJCWNhc2UgVUJJRlNfWEVOVF9LRVk6
Ci0JCQlzcHJpbnRmKHAsICIoJWx1LCAlcywgJSMwOHgpIiwKLQkJCQkodW5zaWduZWQgbG9uZylr
ZXlfaW51bShjLCBrZXkpLAotCQkJCWdldF9rZXlfdHlwZSh0eXBlKSwga2V5X2hhc2goYywga2V5
KSk7CisJCQlsZW4gLT0gc25wcmludGYocCwgbGVuLCAiKCVsdSwgJXMsICUjMDh4KSIsCisJCQkJ
CSh1bnNpZ25lZCBsb25nKWtleV9pbnVtKGMsIGtleSksCisJCQkJCWdldF9rZXlfdHlwZSh0eXBl
KSwga2V5X2hhc2goYywga2V5KSk7CiAJCQlicmVhazsKIAkJY2FzZSBVQklGU19EQVRBX0tFWToK
LQkJCXNwcmludGYocCwgIiglbHUsICVzLCAldSkiLAotCQkJCSh1bnNpZ25lZCBsb25nKWtleV9p
bnVtKGMsIGtleSksCi0JCQkJZ2V0X2tleV90eXBlKHR5cGUpLCBrZXlfYmxvY2soYywga2V5KSk7
CisJCQlsZW4gLT0gc25wcmludGYocCwgbGVuLCAiKCVsdSwgJXMsICV1KSIsCisJCQkJCSh1bnNp
Z25lZCBsb25nKWtleV9pbnVtKGMsIGtleSksCisJCQkJCWdldF9rZXlfdHlwZSh0eXBlKSwga2V5
X2Jsb2NrKGMsIGtleSkpOwogCQkJYnJlYWs7CiAJCWNhc2UgVUJJRlNfVFJVTl9LRVk6Ci0JCQlz
cHJpbnRmKHAsICIoJWx1LCAlcykiLAotCQkJCSh1bnNpZ25lZCBsb25nKWtleV9pbnVtKGMsIGtl
eSksCi0JCQkJZ2V0X2tleV90eXBlKHR5cGUpKTsKKwkJCWxlbiAtPSBzbnByaW50ZihwLCBsZW4s
ICIoJWx1LCAlcykiLAorCQkJCQkodW5zaWduZWQgbG9uZylrZXlfaW51bShjLCBrZXkpLAorCQkJ
CQlnZXRfa2V5X3R5cGUodHlwZSkpOwogCQkJYnJlYWs7CiAJCWRlZmF1bHQ6Ci0JCQlzcHJpbnRm
KHAsICIoYmFkIGtleSB0eXBlOiAlIzA4eCwgJSMwOHgpIiwKLQkJCQlrZXktPnUzMlswXSwga2V5
LT51MzJbMV0pOworCQkJbGVuIC09IHNucHJpbnRmKHAsIGxlbiwgIihiYWQga2V5IHR5cGU6ICUj
MDh4LCAlIzA4eCkiLAorCQkJCQlrZXktPnUzMlswXSwga2V5LT51MzJbMV0pOwogCQl9CiAJfSBl
bHNlCi0JCXNwcmludGYocCwgImJhZCBrZXkgZm9ybWF0ICVkIiwgYy0+a2V5X2ZtdCk7Ci19Ci0K
LWNvbnN0IGNoYXIgKmRiZ19rZXlfc3RyMChjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgY29u
c3QgdW5pb24gdWJpZnNfa2V5ICprZXkpCi17Ci0JLyogZGJnX2xvY2sgbXVzdCBiZSBoZWxkICov
Ci0Jc3ByaW50Zl9rZXkoYywga2V5LCBkYmdfa2V5X2J1ZjApOwotCXJldHVybiBkYmdfa2V5X2J1
ZjA7Ci19Ci0KLWNvbnN0IGNoYXIgKmRiZ19rZXlfc3RyMShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5m
byAqYywgY29uc3QgdW5pb24gdWJpZnNfa2V5ICprZXkpCi17Ci0JLyogZGJnX2xvY2sgbXVzdCBi
ZSBoZWxkICovCi0Jc3ByaW50Zl9rZXkoYywga2V5LCBkYmdfa2V5X2J1ZjEpOwotCXJldHVybiBk
Ymdfa2V5X2J1ZjE7CisJCWxlbiAtPSBzbnByaW50ZihwLCBsZW4sICJiYWQga2V5IGZvcm1hdCAl
ZCIsIGMtPmtleV9mbXQpOworCXViaWZzX2Fzc2VydChsZW4gPiAwKTsKKwlyZXR1cm4gcDsKIH0K
IAogY29uc3QgY2hhciAqZGJnX250eXBlKGludCB0eXBlKQpAQCAtMjIzLDY4ICsyMTksOTkgQEAK
IAogc3RhdGljIHZvaWQgZHVtcF9jaChjb25zdCBzdHJ1Y3QgdWJpZnNfY2ggKmNoKQogewotCXBy
aW50ayhLRVJOX0RFQlVHICJcdG1hZ2ljICAgICAgICAgICUjeFxuIiwgbGUzMl90b19jcHUoY2gt
Pm1hZ2ljKSk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0Y3JjICAgICAgICAgICAgJSN4XG4iLCBs
ZTMyX3RvX2NwdShjaC0+Y3JjKSk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0bm9kZV90eXBlICAg
ICAgJWQgKCVzKVxuIiwgY2gtPm5vZGVfdHlwZSwKKwlwcmludGsoS0VSTl9FUlIgIlx0bWFnaWMg
ICAgICAgICAgJSN4XG4iLCBsZTMyX3RvX2NwdShjaC0+bWFnaWMpKTsKKwlwcmludGsoS0VSTl9F
UlIgIlx0Y3JjICAgICAgICAgICAgJSN4XG4iLCBsZTMyX3RvX2NwdShjaC0+Y3JjKSk7CisJcHJp
bnRrKEtFUk5fRVJSICJcdG5vZGVfdHlwZSAgICAgICVkICglcylcbiIsIGNoLT5ub2RlX3R5cGUs
CiAJICAgICAgIGRiZ19udHlwZShjaC0+bm9kZV90eXBlKSk7Ci0JcHJpbnRrKEtFUk5fREVCVUcg
Ilx0Z3JvdXBfdHlwZSAgICAgJWQgKCVzKVxuIiwgY2gtPmdyb3VwX3R5cGUsCisJcHJpbnRrKEtF
Uk5fRVJSICJcdGdyb3VwX3R5cGUgICAgICVkICglcylcbiIsIGNoLT5ncm91cF90eXBlLAogCSAg
ICAgICBkYmdfZ3R5cGUoY2gtPmdyb3VwX3R5cGUpKTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRz
cW51bSAgICAgICAgICAlbGx1XG4iLAorCXByaW50ayhLRVJOX0VSUiAiXHRzcW51bSAgICAgICAg
ICAlbGx1XG4iLAogCSAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKWxlNjRfdG9fY3B1KGNoLT5z
cW51bSkpOwotCXByaW50ayhLRVJOX0RFQlVHICJcdGxlbiAgICAgICAgICAgICV1XG4iLCBsZTMy
X3RvX2NwdShjaC0+bGVuKSk7CisJcHJpbnRrKEtFUk5fRVJSICJcdGxlbiAgICAgICAgICAgICV1
XG4iLCBsZTMyX3RvX2NwdShjaC0+bGVuKSk7CiB9CiAKLXZvaWQgZGJnX2R1bXBfaW5vZGUoY29u
c3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCBpbm9kZSAqaW5vZGUpCit2b2lk
IHViaWZzX2R1bXBfaW5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCBpbm9k
ZSAqaW5vZGUpCiB7CiAJY29uc3Qgc3RydWN0IHViaWZzX2lub2RlICp1aSA9IHViaWZzX2lub2Rl
KGlub2RlKTsKKwlzdHJ1Y3QgcXN0ciBubSA9IHsgLm5hbWUgPSBOVUxMIH07CisJdW5pb24gdWJp
ZnNfa2V5IGtleTsKKwlzdHJ1Y3QgdWJpZnNfZGVudF9ub2RlICpkZW50LCAqcGRlbnQgPSBOVUxM
OworCWludCBjb3VudCA9IDI7CiAKLQlwcmludGsoS0VSTl9ERUJVRyAiRHVtcCBpbi1tZW1vcnkg
aW5vZGU6Iik7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0aW5vZGUgICAgICAgICAgJWx1XG4iLCBp
bm9kZS0+aV9pbm8pOwotCXByaW50ayhLRVJOX0RFQlVHICJcdHNpemUgICAgICAgICAgICVsbHVc
biIsCisJcHJpbnRrKEtFUk5fRVJSICJEdW1wIGluLW1lbW9yeSBpbm9kZToiKTsKKwlwcmludGso
S0VSTl9FUlIgIlx0aW5vZGUgICAgICAgICAgJWx1XG4iLCBpbm9kZS0+aV9pbm8pOworCXByaW50
ayhLRVJOX0VSUiAiXHRzaXplICAgICAgICAgICAlbGx1XG4iLAogCSAgICAgICAodW5zaWduZWQg
bG9uZyBsb25nKWlfc2l6ZV9yZWFkKGlub2RlKSk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0bmxp
bmsgICAgICAgICAgJXVcbiIsIGlub2RlLT5pX25saW5rKTsKLQlwcmludGsoS0VSTl9ERUJVRyAi
XHR1aWQgICAgICAgICAgICAldVxuIiwgKHVuc2lnbmVkIGludClpbm9kZS0+aV91aWQpOwotCXBy
aW50ayhLRVJOX0RFQlVHICJcdGdpZCAgICAgICAgICAgICV1XG4iLCAodW5zaWduZWQgaW50KWlu
b2RlLT5pX2dpZCk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0YXRpbWUgICAgICAgICAgJXUuJXVc
biIsCisJcHJpbnRrKEtFUk5fRVJSICJcdG5saW5rICAgICAgICAgICV1XG4iLCBpbm9kZS0+aV9u
bGluayk7CisJcHJpbnRrKEtFUk5fRVJSICJcdHVpZCAgICAgICAgICAgICV1XG4iLCAodW5zaWdu
ZWQgaW50KWlub2RlLT5pX3VpZCk7CisJcHJpbnRrKEtFUk5fRVJSICJcdGdpZCAgICAgICAgICAg
ICV1XG4iLCAodW5zaWduZWQgaW50KWlub2RlLT5pX2dpZCk7CisJcHJpbnRrKEtFUk5fRVJSICJc
dGF0aW1lICAgICAgICAgICV1LiV1XG4iLAogCSAgICAgICAodW5zaWduZWQgaW50KWlub2RlLT5p
X2F0aW1lLnR2X3NlYywKIAkgICAgICAgKHVuc2lnbmVkIGludClpbm9kZS0+aV9hdGltZS50dl9u
c2VjKTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRtdGltZSAgICAgICAgICAldS4ldVxuIiwKKwlw
cmludGsoS0VSTl9FUlIgIlx0bXRpbWUgICAgICAgICAgJXUuJXVcbiIsCiAJICAgICAgICh1bnNp
Z25lZCBpbnQpaW5vZGUtPmlfbXRpbWUudHZfc2VjLAogCSAgICAgICAodW5zaWduZWQgaW50KWlu
b2RlLT5pX210aW1lLnR2X25zZWMpOwotCXByaW50ayhLRVJOX0RFQlVHICJcdGN0aW1lICAgICAg
ICAgICV1LiV1XG4iLAorCXByaW50ayhLRVJOX0VSUiAiXHRjdGltZSAgICAgICAgICAldS4ldVxu
IiwKIAkgICAgICAgKHVuc2lnbmVkIGludClpbm9kZS0+aV9jdGltZS50dl9zZWMsCiAJICAgICAg
ICh1bnNpZ25lZCBpbnQpaW5vZGUtPmlfY3RpbWUudHZfbnNlYyk7Ci0JcHJpbnRrKEtFUk5fREVC
VUcgIlx0Y3JlYXRfc3FudW0gICAgJWxsdVxuIiwgdWktPmNyZWF0X3NxbnVtKTsKLQlwcmludGso
S0VSTl9ERUJVRyAiXHR4YXR0cl9zaXplICAgICAldVxuIiwgdWktPnhhdHRyX3NpemUpOwotCXBy
aW50ayhLRVJOX0RFQlVHICJcdHhhdHRyX2NudCAgICAgICV1XG4iLCB1aS0+eGF0dHJfY250KTsK
LQlwcmludGsoS0VSTl9ERUJVRyAiXHR4YXR0cl9uYW1lcyAgICAldVxuIiwgdWktPnhhdHRyX25h
bWVzKTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRkaXJ0eSAgICAgICAgICAldVxuIiwgdWktPmRp
cnR5KTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHR4YXR0ciAgICAgICAgICAldVxuIiwgdWktPnhh
dHRyKTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRidWxrX3JlYWQgICAgICAldVxuIiwgdWktPnhh
dHRyKTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRzeW5jZWRfaV9zaXplICAlbGx1XG4iLAorCXBy
aW50ayhLRVJOX0VSUiAiXHRjcmVhdF9zcW51bSAgICAlbGx1XG4iLCB1aS0+Y3JlYXRfc3FudW0p
OworCXByaW50ayhLRVJOX0VSUiAiXHR4YXR0cl9zaXplICAgICAldVxuIiwgdWktPnhhdHRyX3Np
emUpOworCXByaW50ayhLRVJOX0VSUiAiXHR4YXR0cl9jbnQgICAgICAldVxuIiwgdWktPnhhdHRy
X2NudCk7CisJcHJpbnRrKEtFUk5fRVJSICJcdHhhdHRyX25hbWVzICAgICV1XG4iLCB1aS0+eGF0
dHJfbmFtZXMpOworCXByaW50ayhLRVJOX0VSUiAiXHRkaXJ0eSAgICAgICAgICAldVxuIiwgdWkt
PmRpcnR5KTsKKwlwcmludGsoS0VSTl9FUlIgIlx0eGF0dHIgICAgICAgICAgJXVcbiIsIHVpLT54
YXR0cik7CisJcHJpbnRrKEtFUk5fRVJSICJcdGJ1bGtfcmVhZCAgICAgICV1XG4iLCB1aS0+eGF0
dHIpOworCXByaW50ayhLRVJOX0VSUiAiXHRzeW5jZWRfaV9zaXplICAlbGx1XG4iLAogCSAgICAg
ICAodW5zaWduZWQgbG9uZyBsb25nKXVpLT5zeW5jZWRfaV9zaXplKTsKLQlwcmludGsoS0VSTl9E
RUJVRyAiXHR1aV9zaXplICAgICAgICAlbGx1XG4iLAorCXByaW50ayhLRVJOX0VSUiAiXHR1aV9z
aXplICAgICAgICAlbGx1XG4iLAogCSAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKXVpLT51aV9z
aXplKTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRmbGFncyAgICAgICAgICAlZFxuIiwgdWktPmZs
YWdzKTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRjb21wcl90eXBlICAgICAlZFxuIiwgdWktPmNv
bXByX3R5cGUpOwotCXByaW50ayhLRVJOX0RFQlVHICJcdGxhc3RfcGFnZV9yZWFkICVsdVxuIiwg
dWktPmxhc3RfcGFnZV9yZWFkKTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRyZWFkX2luX2Ffcm93
ICAlbHVcbiIsIHVpLT5yZWFkX2luX2Ffcm93KTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRkYXRh
X2xlbiAgICAgICAlZFxuIiwgdWktPmRhdGFfbGVuKTsKKwlwcmludGsoS0VSTl9FUlIgIlx0Zmxh
Z3MgICAgICAgICAgJWRcbiIsIHVpLT5mbGFncyk7CisJcHJpbnRrKEtFUk5fRVJSICJcdGNvbXBy
X3R5cGUgICAgICVkXG4iLCB1aS0+Y29tcHJfdHlwZSk7CisJcHJpbnRrKEtFUk5fRVJSICJcdGxh
c3RfcGFnZV9yZWFkICVsdVxuIiwgdWktPmxhc3RfcGFnZV9yZWFkKTsKKwlwcmludGsoS0VSTl9F
UlIgIlx0cmVhZF9pbl9hX3JvdyAgJWx1XG4iLCB1aS0+cmVhZF9pbl9hX3Jvdyk7CisJcHJpbnRr
KEtFUk5fRVJSICJcdGRhdGFfbGVuICAgICAgICVkXG4iLCB1aS0+ZGF0YV9sZW4pOworCisJaWYg
KCFTX0lTRElSKGlub2RlLT5pX21vZGUpKQorCQlyZXR1cm47CisKKwlwcmludGsoS0VSTl9FUlIg
Ikxpc3Qgb2YgZGlyZWN0b3J5IGVudHJpZXM6XG4iKTsKKwl1Ymlmc19hc3NlcnQoIW11dGV4X2lz
X2xvY2tlZCgmYy0+dG5jX211dGV4KSk7CisKKwlsb3dlc3RfZGVudF9rZXkoYywgJmtleSwgaW5v
ZGUtPmlfaW5vKTsKKwl3aGlsZSAoMSkgeworCQlkZW50ID0gdWJpZnNfdG5jX25leHRfZW50KGMs
ICZrZXksICZubSk7CisJCWlmIChJU19FUlIoZGVudCkpIHsKKwkJCWlmIChQVFJfRVJSKGRlbnQp
ICE9IC1FTk9FTlQpCisJCQkJcHJpbnRrKEtFUk5fRVJSICJlcnJvciAlbGRcbiIsIFBUUl9FUlIo
ZGVudCkpOworCQkJYnJlYWs7CisJCX0KKworCQlwcmludGsoS0VSTl9FUlIgIlx0JWQ6ICVzICgl
cylcbiIsCisJCSAgICAgICBjb3VudCsrLCBkZW50LT5uYW1lLCBnZXRfZGVudF90eXBlKGRlbnQt
PnR5cGUpKTsKKworCQlubS5uYW1lID0gZGVudC0+bmFtZTsKKwkJbm0ubGVuID0gbGUxNl90b19j
cHUoZGVudC0+bmxlbik7CisJCWtmcmVlKHBkZW50KTsKKwkJcGRlbnQgPSBkZW50OworCQlrZXlf
cmVhZChjLCAmZGVudC0+a2V5LCAma2V5KTsKKwl9CisJa2ZyZWUocGRlbnQpOwogfQogCi12b2lk
IGRiZ19kdW1wX25vZGUoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHZvaWQgKm5v
ZGUpCit2b2lkIHViaWZzX2R1bXBfbm9kZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgY29u
c3Qgdm9pZCAqbm9kZSkKIHsKIAlpbnQgaSwgbjsKIAl1bmlvbiB1Ymlmc19rZXkga2V5OwogCWNv
bnN0IHN0cnVjdCB1Ymlmc19jaCAqY2ggPSBub2RlOworCWNoYXIga2V5X2J1ZltEQkdfS0VZX0JV
Rl9MRU5dOwogCi0JaWYgKGRiZ19mYWlsdXJlX21vZGUpCisJaWYgKGRiZ19pc190c3RfcmN2cnko
YykpCiAJCXJldHVybjsKIAogCS8qIElmIHRoZSBtYWdpYyBpcyBpbmNvcnJlY3QsIGp1c3QgaGV4
ZHVtcCB0aGUgZmlyc3QgYnl0ZXMgKi8KIAlpZiAobGUzMl90b19jcHUoY2gtPm1hZ2ljKSAhPSBV
QklGU19OT0RFX01BR0lDKSB7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJOb3QgYSBub2RlLCBmaXJz
dCAlenUgYnl0ZXM6IiwgVUJJRlNfQ0hfU1opOwotCQlwcmludF9oZXhfZHVtcChLRVJOX0RFQlVH
LCAiIiwgRFVNUF9QUkVGSVhfT0ZGU0VULCAzMiwgMSwKKwkJcHJpbnRrKEtFUk5fRVJSICJOb3Qg
YSBub2RlLCBmaXJzdCAlenUgYnl0ZXM6IiwgVUJJRlNfQ0hfU1opOworCQlwcmludF9oZXhfZHVt
cChLRVJOX0VSUiwgIiIsIERVTVBfUFJFRklYX09GRlNFVCwgMzIsIDEsCiAJCQkgICAgICAgKHZv
aWQgKilub2RlLCBVQklGU19DSF9TWiwgMSk7CiAJCXJldHVybjsKIAl9CkBAIC0yOTcsNyArMzI0
LDcgQEAKIAl7CiAJCWNvbnN0IHN0cnVjdCB1Ymlmc19wYWRfbm9kZSAqcGFkID0gbm9kZTsKIAot
CQlwcmludGsoS0VSTl9ERUJVRyAiXHRwYWRfbGVuICAgICAgICAldVxuIiwKKwkJcHJpbnRrKEtF
Uk5fRVJSICJcdHBhZF9sZW4gICAgICAgICV1XG4iLAogCQkgICAgICAgbGUzMl90b19jcHUocGFk
LT5wYWRfbGVuKSk7CiAJCWJyZWFrOwogCX0KQEAgLTMwNiw1MCArMzMzLDUwIEBACiAJCWNvbnN0
IHN0cnVjdCB1Ymlmc19zYl9ub2RlICpzdXAgPSBub2RlOwogCQl1bnNpZ25lZCBpbnQgc3VwX2Zs
YWdzID0gbGUzMl90b19jcHUoc3VwLT5mbGFncyk7CiAKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0
a2V5X2hhc2ggICAgICAgJWQgKCVzKVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdGtleV9oYXNo
ICAgICAgICVkICglcylcbiIsCiAJCSAgICAgICAoaW50KXN1cC0+a2V5X2hhc2gsIGdldF9rZXlf
aGFzaChzdXAtPmtleV9oYXNoKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGtleV9mbXQgICAg
ICAgICVkICglcylcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRrZXlfZm10ICAgICAgICAlZCAo
JXMpXG4iLAogCQkgICAgICAgKGludClzdXAtPmtleV9mbXQsIGdldF9rZXlfZm10KHN1cC0+a2V5
X2ZtdCkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRmbGFncyAgICAgICAgICAlI3hcbiIsIHN1
cF9mbGFncyk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdCAgYmlnX2xwdCAgICAgICV1XG4iLAor
CQlwcmludGsoS0VSTl9FUlIgIlx0ZmxhZ3MgICAgICAgICAgJSN4XG4iLCBzdXBfZmxhZ3MpOwor
CQlwcmludGsoS0VSTl9FUlIgIlx0ICBiaWdfbHB0ICAgICAgJXVcbiIsCiAJCSAgICAgICAhIShz
dXBfZmxhZ3MgJiBVQklGU19GTEdfQklHTFBUKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdCAg
c3BhY2VfZml4dXAgICV1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0ICBzcGFjZV9maXh1cCAg
JXVcbiIsCiAJCSAgICAgICAhIShzdXBfZmxhZ3MgJiBVQklGU19GTEdfU1BBQ0VfRklYVVApKTsK
LQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0bWluX2lvX3NpemUgICAgJXVcbiIsCisJCXByaW50ayhL
RVJOX0VSUiAiXHRtaW5faW9fc2l6ZSAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KHN1
cC0+bWluX2lvX3NpemUpKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0bGViX3NpemUgICAgICAg
JXVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRsZWJfc2l6ZSAgICAgICAldVxuIiwKIAkJICAg
ICAgIGxlMzJfdG9fY3B1KHN1cC0+bGViX3NpemUpKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0
bGViX2NudCAgICAgICAgJXVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRsZWJfY250ICAgICAg
ICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KHN1cC0+bGViX2NudCkpOwotCQlwcmludGso
S0VSTl9ERUJVRyAiXHRtYXhfbGViX2NudCAgICAldVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJc
dG1heF9sZWJfY250ICAgICV1XG4iLAogCQkgICAgICAgbGUzMl90b19jcHUoc3VwLT5tYXhfbGVi
X2NudCkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRtYXhfYnVkX2J5dGVzICAlbGx1XG4iLAor
CQlwcmludGsoS0VSTl9FUlIgIlx0bWF4X2J1ZF9ieXRlcyAgJWxsdVxuIiwKIAkJICAgICAgICh1
bnNpZ25lZCBsb25nIGxvbmcpbGU2NF90b19jcHUoc3VwLT5tYXhfYnVkX2J5dGVzKSk7Ci0JCXBy
aW50ayhLRVJOX0RFQlVHICJcdGxvZ19sZWJzICAgICAgICV1XG4iLAorCQlwcmludGsoS0VSTl9F
UlIgIlx0bG9nX2xlYnMgICAgICAgJXVcbiIsCiAJCSAgICAgICBsZTMyX3RvX2NwdShzdXAtPmxv
Z19sZWJzKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGxwdF9sZWJzICAgICAgICV1XG4iLAor
CQlwcmludGsoS0VSTl9FUlIgIlx0bHB0X2xlYnMgICAgICAgJXVcbiIsCiAJCSAgICAgICBsZTMy
X3RvX2NwdShzdXAtPmxwdF9sZWJzKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdG9ycGhfbGVi
cyAgICAgICV1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0b3JwaF9sZWJzICAgICAgJXVcbiIs
CiAJCSAgICAgICBsZTMyX3RvX2NwdShzdXAtPm9ycGhfbGVicykpOwotCQlwcmludGsoS0VSTl9E
RUJVRyAiXHRqaGVhZF9jbnQgICAgICAldVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdGpoZWFk
X2NudCAgICAgICV1XG4iLAogCQkgICAgICAgbGUzMl90b19jcHUoc3VwLT5qaGVhZF9jbnQpKTsK
LQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0ZmFub3V0ICAgICAgICAgJXVcbiIsCisJCXByaW50ayhL
RVJOX0VSUiAiXHRmYW5vdXQgICAgICAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KHN1
cC0+ZmFub3V0KSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGxzYXZlX2NudCAgICAgICV1XG4i
LAorCQlwcmludGsoS0VSTl9FUlIgIlx0bHNhdmVfY250ICAgICAgJXVcbiIsCiAJCSAgICAgICBs
ZTMyX3RvX2NwdShzdXAtPmxzYXZlX2NudCkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRkZWZh
dWx0X2NvbXByICAldVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdGRlZmF1bHRfY29tcHIgICV1
XG4iLAogCQkgICAgICAgKGludClsZTE2X3RvX2NwdShzdXAtPmRlZmF1bHRfY29tcHIpKTsKLQkJ
cHJpbnRrKEtFUk5fREVCVUcgIlx0cnBfc2l6ZSAgICAgICAgJWxsdVxuIiwKKwkJcHJpbnRrKEtF
Uk5fRVJSICJcdHJwX3NpemUgICAgICAgICVsbHVcbiIsCiAJCSAgICAgICAodW5zaWduZWQgbG9u
ZyBsb25nKWxlNjRfdG9fY3B1KHN1cC0+cnBfc2l6ZSkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAi
XHRycF91aWQgICAgICAgICAldVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdHJwX3VpZCAgICAg
ICAgICV1XG4iLAogCQkgICAgICAgbGUzMl90b19jcHUoc3VwLT5ycF91aWQpKTsKLQkJcHJpbnRr
KEtFUk5fREVCVUcgIlx0cnBfZ2lkICAgICAgICAgJXVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAi
XHRycF9naWQgICAgICAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KHN1cC0+cnBfZ2lk
KSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGZtdF92ZXJzaW9uICAgICV1XG4iLAorCQlwcmlu
dGsoS0VSTl9FUlIgIlx0Zm10X3ZlcnNpb24gICAgJXVcbiIsCiAJCSAgICAgICBsZTMyX3RvX2Nw
dShzdXAtPmZtdF92ZXJzaW9uKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdHRpbWVfZ3JhbiAg
ICAgICV1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0dGltZV9ncmFuICAgICAgJXVcbiIsCiAJ
CSAgICAgICBsZTMyX3RvX2NwdShzdXAtPnRpbWVfZ3JhbikpOwotCQlwcmludGsoS0VSTl9ERUJV
RyAiXHRVVUlEICAgICAgICAgICAlcFVCXG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0VVVJRCAg
ICAgICAgICAgJXBVQlxuIiwKIAkJICAgICAgIHN1cC0+dXVpZCk7CiAJCWJyZWFrOwogCX0KQEAg
LTM1Nyw2MSArMzg0LDYxIEBACiAJewogCQljb25zdCBzdHJ1Y3QgdWJpZnNfbXN0X25vZGUgKm1z
dCA9IG5vZGU7CiAKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0aGlnaGVzdF9pbnVtICAgJWxsdVxu
IiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdGhpZ2hlc3RfaW51bSAgICVsbHVcbiIsCiAJCSAgICAg
ICAodW5zaWduZWQgbG9uZyBsb25nKWxlNjRfdG9fY3B1KG1zdC0+aGlnaGVzdF9pbnVtKSk7Ci0J
CXByaW50ayhLRVJOX0RFQlVHICJcdGNvbW1pdCBudW1iZXIgICVsbHVcbiIsCisJCXByaW50ayhL
RVJOX0VSUiAiXHRjb21taXQgbnVtYmVyICAlbGx1XG4iLAogCQkgICAgICAgKHVuc2lnbmVkIGxv
bmcgbG9uZylsZTY0X3RvX2NwdShtc3QtPmNtdF9ubykpOwotCQlwcmludGsoS0VSTl9ERUJVRyAi
XHRmbGFncyAgICAgICAgICAlI3hcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRmbGFncyAgICAg
ICAgICAlI3hcbiIsCiAJCSAgICAgICBsZTMyX3RvX2NwdShtc3QtPmZsYWdzKSk7Ci0JCXByaW50
ayhLRVJOX0RFQlVHICJcdGxvZ19sbnVtICAgICAgICV1XG4iLAorCQlwcmludGsoS0VSTl9FUlIg
Ilx0bG9nX2xudW0gICAgICAgJXVcbiIsCiAJCSAgICAgICBsZTMyX3RvX2NwdShtc3QtPmxvZ19s
bnVtKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdHJvb3RfbG51bSAgICAgICV1XG4iLAorCQlw
cmludGsoS0VSTl9FUlIgIlx0cm9vdF9sbnVtICAgICAgJXVcbiIsCiAJCSAgICAgICBsZTMyX3Rv
X2NwdShtc3QtPnJvb3RfbG51bSkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRyb290X29mZnMg
ICAgICAldVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdHJvb3Rfb2ZmcyAgICAgICV1XG4iLAog
CQkgICAgICAgbGUzMl90b19jcHUobXN0LT5yb290X29mZnMpKTsKLQkJcHJpbnRrKEtFUk5fREVC
VUcgIlx0cm9vdF9sZW4gICAgICAgJXVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRyb290X2xl
biAgICAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KG1zdC0+cm9vdF9sZW4pKTsKLQkJ
cHJpbnRrKEtFUk5fREVCVUcgIlx0Z2NfbG51bSAgICAgICAgJXVcbiIsCisJCXByaW50ayhLRVJO
X0VSUiAiXHRnY19sbnVtICAgICAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KG1zdC0+
Z2NfbG51bSkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRpaGVhZF9sbnVtICAgICAldVxuIiwK
KwkJcHJpbnRrKEtFUk5fRVJSICJcdGloZWFkX2xudW0gICAgICV1XG4iLAogCQkgICAgICAgbGUz
Ml90b19jcHUobXN0LT5paGVhZF9sbnVtKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGloZWFk
X29mZnMgICAgICV1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0aWhlYWRfb2ZmcyAgICAgJXVc
biIsCiAJCSAgICAgICBsZTMyX3RvX2NwdShtc3QtPmloZWFkX29mZnMpKTsKLQkJcHJpbnRrKEtF
Uk5fREVCVUcgIlx0aW5kZXhfc2l6ZSAgICAgJWxsdVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJc
dGluZGV4X3NpemUgICAgICVsbHVcbiIsCiAJCSAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKWxl
NjRfdG9fY3B1KG1zdC0+aW5kZXhfc2l6ZSkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRscHRf
bG51bSAgICAgICAldVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdGxwdF9sbnVtICAgICAgICV1
XG4iLAogCQkgICAgICAgbGUzMl90b19jcHUobXN0LT5scHRfbG51bSkpOwotCQlwcmludGsoS0VS
Tl9ERUJVRyAiXHRscHRfb2ZmcyAgICAgICAldVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdGxw
dF9vZmZzICAgICAgICV1XG4iLAogCQkgICAgICAgbGUzMl90b19jcHUobXN0LT5scHRfb2Zmcykp
OwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRuaGVhZF9sbnVtICAgICAldVxuIiwKKwkJcHJpbnRr
KEtFUk5fRVJSICJcdG5oZWFkX2xudW0gICAgICV1XG4iLAogCQkgICAgICAgbGUzMl90b19jcHUo
bXN0LT5uaGVhZF9sbnVtKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdG5oZWFkX29mZnMgICAg
ICV1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0bmhlYWRfb2ZmcyAgICAgJXVcbiIsCiAJCSAg
ICAgICBsZTMyX3RvX2NwdShtc3QtPm5oZWFkX29mZnMpKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcg
Ilx0bHRhYl9sbnVtICAgICAgJXVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRsdGFiX2xudW0g
ICAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KG1zdC0+bHRhYl9sbnVtKSk7Ci0JCXBy
aW50ayhLRVJOX0RFQlVHICJcdGx0YWJfb2ZmcyAgICAgICV1XG4iLAorCQlwcmludGsoS0VSTl9F
UlIgIlx0bHRhYl9vZmZzICAgICAgJXVcbiIsCiAJCSAgICAgICBsZTMyX3RvX2NwdShtc3QtPmx0
YWJfb2ZmcykpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRsc2F2ZV9sbnVtICAgICAldVxuIiwK
KwkJcHJpbnRrKEtFUk5fRVJSICJcdGxzYXZlX2xudW0gICAgICV1XG4iLAogCQkgICAgICAgbGUz
Ml90b19jcHUobXN0LT5sc2F2ZV9sbnVtKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGxzYXZl
X29mZnMgICAgICV1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0bHNhdmVfb2ZmcyAgICAgJXVc
biIsCiAJCSAgICAgICBsZTMyX3RvX2NwdShtc3QtPmxzYXZlX29mZnMpKTsKLQkJcHJpbnRrKEtF
Uk5fREVCVUcgIlx0bHNjYW5fbG51bSAgICAgJXVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRs
c2Nhbl9sbnVtICAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KG1zdC0+bHNjYW5fbG51
bSkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRsZWJfY250ICAgICAgICAldVxuIiwKKwkJcHJp
bnRrKEtFUk5fRVJSICJcdGxlYl9jbnQgICAgICAgICV1XG4iLAogCQkgICAgICAgbGUzMl90b19j
cHUobXN0LT5sZWJfY250KSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGVtcHR5X2xlYnMgICAg
ICV1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0ZW1wdHlfbGVicyAgICAgJXVcbiIsCiAJCSAg
ICAgICBsZTMyX3RvX2NwdShtc3QtPmVtcHR5X2xlYnMpKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcg
Ilx0aWR4X2xlYnMgICAgICAgJXVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRpZHhfbGVicyAg
ICAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KG1zdC0+aWR4X2xlYnMpKTsKLQkJcHJp
bnRrKEtFUk5fREVCVUcgIlx0dG90YWxfZnJlZSAgICAgJWxsdVxuIiwKKwkJcHJpbnRrKEtFUk5f
RVJSICJcdHRvdGFsX2ZyZWUgICAgICVsbHVcbiIsCiAJCSAgICAgICAodW5zaWduZWQgbG9uZyBs
b25nKWxlNjRfdG9fY3B1KG1zdC0+dG90YWxfZnJlZSkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAi
XHR0b3RhbF9kaXJ0eSAgICAlbGx1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0dG90YWxfZGly
dHkgICAgJWxsdVxuIiwKIAkJICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpbGU2NF90b19jcHUo
bXN0LT50b3RhbF9kaXJ0eSkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHR0b3RhbF91c2VkICAg
ICAlbGx1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0dG90YWxfdXNlZCAgICAgJWxsdVxuIiwK
IAkJICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpbGU2NF90b19jcHUobXN0LT50b3RhbF91c2Vk
KSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdHRvdGFsX2RlYWQgICAgICVsbHVcbiIsCisJCXBy
aW50ayhLRVJOX0VSUiAiXHR0b3RhbF9kZWFkICAgICAlbGx1XG4iLAogCQkgICAgICAgKHVuc2ln
bmVkIGxvbmcgbG9uZylsZTY0X3RvX2NwdShtc3QtPnRvdGFsX2RlYWQpKTsKLQkJcHJpbnRrKEtF
Uk5fREVCVUcgIlx0dG90YWxfZGFyayAgICAgJWxsdVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJc
dHRvdGFsX2RhcmsgICAgICVsbHVcbiIsCiAJCSAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKWxl
NjRfdG9fY3B1KG1zdC0+dG90YWxfZGFyaykpOwogCQlicmVhazsKIAl9CkBAIC00MTksMTEgKzQ0
NiwxMSBAQAogCXsKIAkJY29uc3Qgc3RydWN0IHViaWZzX3JlZl9ub2RlICpyZWYgPSBub2RlOwog
Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGxudW0gICAgICAgICAgICV1XG4iLAorCQlwcmludGso
S0VSTl9FUlIgIlx0bG51bSAgICAgICAgICAgJXVcbiIsCiAJCSAgICAgICBsZTMyX3RvX2NwdShy
ZWYtPmxudW0pKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0b2ZmcyAgICAgICAgICAgJXVcbiIs
CisJCXByaW50ayhLRVJOX0VSUiAiXHRvZmZzICAgICAgICAgICAldVxuIiwKIAkJICAgICAgIGxl
MzJfdG9fY3B1KHJlZi0+b2ZmcykpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRqaGVhZCAgICAg
ICAgICAldVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdGpoZWFkICAgICAgICAgICV1XG4iLAog
CQkgICAgICAgbGUzMl90b19jcHUocmVmLT5qaGVhZCkpOwogCQlicmVhazsKIAl9CkBAIC00MzIs
MzkgKzQ1OSw0MCBAQAogCQljb25zdCBzdHJ1Y3QgdWJpZnNfaW5vX25vZGUgKmlubyA9IG5vZGU7
CiAKIAkJa2V5X3JlYWQoYywgJmluby0+a2V5LCAma2V5KTsKLQkJcHJpbnRrKEtFUk5fREVCVUcg
Ilx0a2V5ICAgICAgICAgICAgJXNcbiIsIERCR0tFWSgma2V5KSk7Ci0JCXByaW50ayhLRVJOX0RF
QlVHICJcdGNyZWF0X3NxbnVtICAgICVsbHVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRrZXkg
ICAgICAgICAgICAlc1xuIiwKKwkJICAgICAgIGRiZ19zbnByaW50Zl9rZXkoYywgJmtleSwga2V5
X2J1ZiwgREJHX0tFWV9CVUZfTEVOKSk7CisJCXByaW50ayhLRVJOX0VSUiAiXHRjcmVhdF9zcW51
bSAgICAlbGx1XG4iLAogCQkgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZylsZTY0X3RvX2NwdShp
bm8tPmNyZWF0X3NxbnVtKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdHNpemUgICAgICAgICAg
ICVsbHVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRzaXplICAgICAgICAgICAlbGx1XG4iLAog
CQkgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZylsZTY0X3RvX2NwdShpbm8tPnNpemUpKTsKLQkJ
cHJpbnRrKEtFUk5fREVCVUcgIlx0bmxpbmsgICAgICAgICAgJXVcbiIsCisJCXByaW50ayhLRVJO
X0VSUiAiXHRubGluayAgICAgICAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KGluby0+
bmxpbmspKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0YXRpbWUgICAgICAgICAgJWxsZC4ldVxu
IiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdGF0aW1lICAgICAgICAgICVsbGQuJXVcbiIsCiAJCSAg
ICAgICAobG9uZyBsb25nKWxlNjRfdG9fY3B1KGluby0+YXRpbWVfc2VjKSwKIAkJICAgICAgIGxl
MzJfdG9fY3B1KGluby0+YXRpbWVfbnNlYykpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRtdGlt
ZSAgICAgICAgICAlbGxkLiV1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0bXRpbWUgICAgICAg
ICAgJWxsZC4ldVxuIiwKIAkJICAgICAgIChsb25nIGxvbmcpbGU2NF90b19jcHUoaW5vLT5tdGlt
ZV9zZWMpLAogCQkgICAgICAgbGUzMl90b19jcHUoaW5vLT5tdGltZV9uc2VjKSk7Ci0JCXByaW50
ayhLRVJOX0RFQlVHICJcdGN0aW1lICAgICAgICAgICVsbGQuJXVcbiIsCisJCXByaW50ayhLRVJO
X0VSUiAiXHRjdGltZSAgICAgICAgICAlbGxkLiV1XG4iLAogCQkgICAgICAgKGxvbmcgbG9uZyls
ZTY0X3RvX2NwdShpbm8tPmN0aW1lX3NlYyksCiAJCSAgICAgICBsZTMyX3RvX2NwdShpbm8tPmN0
aW1lX25zZWMpKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0dWlkICAgICAgICAgICAgJXVcbiIs
CisJCXByaW50ayhLRVJOX0VSUiAiXHR1aWQgICAgICAgICAgICAldVxuIiwKIAkJICAgICAgIGxl
MzJfdG9fY3B1KGluby0+dWlkKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGdpZCAgICAgICAg
ICAgICV1XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0Z2lkICAgICAgICAgICAgJXVcbiIsCiAJ
CSAgICAgICBsZTMyX3RvX2NwdShpbm8tPmdpZCkpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRt
b2RlICAgICAgICAgICAldVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdG1vZGUgICAgICAgICAg
ICV1XG4iLAogCQkgICAgICAgbGUzMl90b19jcHUoaW5vLT5tb2RlKSk7Ci0JCXByaW50ayhLRVJO
X0RFQlVHICJcdGZsYWdzICAgICAgICAgICUjeFxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdGZs
YWdzICAgICAgICAgICUjeFxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KGluby0+ZmxhZ3MpKTsK
LQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0eGF0dHJfY250ICAgICAgJXVcbiIsCisJCXByaW50ayhL
RVJOX0VSUiAiXHR4YXR0cl9jbnQgICAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KGlu
by0+eGF0dHJfY250KSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdHhhdHRyX3NpemUgICAgICV1
XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0eGF0dHJfc2l6ZSAgICAgJXVcbiIsCiAJCSAgICAg
ICBsZTMyX3RvX2NwdShpbm8tPnhhdHRyX3NpemUpKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0
eGF0dHJfbmFtZXMgICAgJXVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHR4YXR0cl9uYW1lcyAg
ICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KGluby0+eGF0dHJfbmFtZXMpKTsKLQkJcHJp
bnRrKEtFUk5fREVCVUcgIlx0Y29tcHJfdHlwZSAgICAgJSN4XG4iLAorCQlwcmludGsoS0VSTl9F
UlIgIlx0Y29tcHJfdHlwZSAgICAgJSN4XG4iLAogCQkgICAgICAgKGludClsZTE2X3RvX2NwdShp
bm8tPmNvbXByX3R5cGUpKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0ZGF0YSBsZW4gICAgICAg
JXVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRkYXRhIGxlbiAgICAgICAldVxuIiwKIAkJICAg
ICAgIGxlMzJfdG9fY3B1KGluby0+ZGF0YV9sZW4pKTsKIAkJYnJlYWs7CiAJfQpAQCAtNDc1LDE1
ICs1MDMsMTYgQEAKIAkJaW50IG5sZW4gPSBsZTE2X3RvX2NwdShkZW50LT5ubGVuKTsKIAogCQlr
ZXlfcmVhZChjLCAmZGVudC0+a2V5LCAma2V5KTsKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0a2V5
ICAgICAgICAgICAgJXNcbiIsIERCR0tFWSgma2V5KSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJc
dGludW0gICAgICAgICAgICVsbHVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAiXHRrZXkgICAgICAg
ICAgICAlc1xuIiwKKwkJICAgICAgIGRiZ19zbnByaW50Zl9rZXkoYywgJmtleSwga2V5X2J1Ziwg
REJHX0tFWV9CVUZfTEVOKSk7CisJCXByaW50ayhLRVJOX0VSUiAiXHRpbnVtICAgICAgICAgICAl
bGx1XG4iLAogCQkgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZylsZTY0X3RvX2NwdShkZW50LT5p
bnVtKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdHR5cGUgICAgICAgICAgICVkXG4iLCAoaW50
KWRlbnQtPnR5cGUpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRubGVuICAgICAgICAgICAlZFxu
Iiwgbmxlbik7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdG5hbWUgICAgICAgICAgICIpOworCQlw
cmludGsoS0VSTl9FUlIgIlx0dHlwZSAgICAgICAgICAgJWRcbiIsIChpbnQpZGVudC0+dHlwZSk7
CisJCXByaW50ayhLRVJOX0VSUiAiXHRubGVuICAgICAgICAgICAlZFxuIiwgbmxlbik7CisJCXBy
aW50ayhLRVJOX0VSUiAiXHRuYW1lICAgICAgICAgICAiKTsKIAogCQlpZiAobmxlbiA+IFVCSUZT
X01BWF9OTEVOKQotCQkJcHJpbnRrKEtFUk5fREVCVUcgIihiYWQgbmFtZSBsZW5ndGgsIG5vdCBw
cmludGluZywgIgorCQkJcHJpbnRrKEtFUk5fRVJSICIoYmFkIG5hbWUgbGVuZ3RoLCBub3QgcHJp
bnRpbmcsICIKIAkJCQkJICAiYmFkIG9yIGNvcnJ1cHRlZCBub2RlKSIpOwogCQllbHNlIHsKIAkJ
CWZvciAoaSA9IDA7IGkgPCBubGVuICYmIGRlbnQtPm5hbWVbaV07IGkrKykKQEAgLTQ5OSwxNSAr
NTI4LDE2IEBACiAJCWludCBkbGVuID0gbGUzMl90b19jcHUoY2gtPmxlbikgLSBVQklGU19EQVRB
X05PREVfU1o7CiAKIAkJa2V5X3JlYWQoYywgJmRuLT5rZXksICZrZXkpOwotCQlwcmludGsoS0VS
Tl9ERUJVRyAiXHRrZXkgICAgICAgICAgICAlc1xuIiwgREJHS0VZKCZrZXkpKTsKLQkJcHJpbnRr
KEtFUk5fREVCVUcgIlx0c2l6ZSAgICAgICAgICAgJXVcbiIsCisJCXByaW50ayhLRVJOX0VSUiAi
XHRrZXkgICAgICAgICAgICAlc1xuIiwKKwkJICAgICAgIGRiZ19zbnByaW50Zl9rZXkoYywgJmtl
eSwga2V5X2J1ZiwgREJHX0tFWV9CVUZfTEVOKSk7CisJCXByaW50ayhLRVJOX0VSUiAiXHRzaXpl
ICAgICAgICAgICAldVxuIiwKIAkJICAgICAgIGxlMzJfdG9fY3B1KGRuLT5zaXplKSk7Ci0JCXBy
aW50ayhLRVJOX0RFQlVHICJcdGNvbXByX3R5cCAgICAgICVkXG4iLAorCQlwcmludGsoS0VSTl9F
UlIgIlx0Y29tcHJfdHlwICAgICAgJWRcbiIsCiAJCSAgICAgICAoaW50KWxlMTZfdG9fY3B1KGRu
LT5jb21wcl90eXBlKSk7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGRhdGEgc2l6ZSAgICAgICVk
XG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0ZGF0YSBzaXplICAgICAgJWRcbiIsCiAJCSAgICAg
ICBkbGVuKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0ZGF0YTpcbiIpOwotCQlwcmludF9oZXhf
ZHVtcChLRVJOX0RFQlVHLCAiXHQiLCBEVU1QX1BSRUZJWF9PRkZTRVQsIDMyLCAxLAorCQlwcmlu
dGsoS0VSTl9FUlIgIlx0ZGF0YTpcbiIpOworCQlwcmludF9oZXhfZHVtcChLRVJOX0VSUiwgIlx0
IiwgRFVNUF9QUkVGSVhfT0ZGU0VULCAzMiwgMSwKIAkJCSAgICAgICAodm9pZCAqKSZkbi0+ZGF0
YSwgZGxlbiwgMCk7CiAJCWJyZWFrOwogCX0KQEAgLTUxNSwxMSArNTQ1LDExIEBACiAJewogCQlj
b25zdCBzdHJ1Y3QgdWJpZnNfdHJ1bl9ub2RlICp0cnVuID0gbm9kZTsKIAotCQlwcmludGsoS0VS
Tl9ERUJVRyAiXHRpbnVtICAgICAgICAgICAldVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdGlu
dW0gICAgICAgICAgICV1XG4iLAogCQkgICAgICAgbGUzMl90b19jcHUodHJ1bi0+aW51bSkpOwot
CQlwcmludGsoS0VSTl9ERUJVRyAiXHRvbGRfc2l6ZSAgICAgICAlbGx1XG4iLAorCQlwcmludGso
S0VSTl9FUlIgIlx0b2xkX3NpemUgICAgICAgJWxsdVxuIiwKIAkJICAgICAgICh1bnNpZ25lZCBs
b25nIGxvbmcpbGU2NF90b19jcHUodHJ1bi0+b2xkX3NpemUpKTsKLQkJcHJpbnRrKEtFUk5fREVC
VUcgIlx0bmV3X3NpemUgICAgICAgJWxsdVxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJcdG5ld19z
aXplICAgICAgICVsbHVcbiIsCiAJCSAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKWxlNjRfdG9f
Y3B1KHRydW4tPm5ld19zaXplKSk7CiAJCWJyZWFrOwogCX0KQEAgLTUyOCwxOSArNTU4LDIxIEBA
CiAJCWNvbnN0IHN0cnVjdCB1Ymlmc19pZHhfbm9kZSAqaWR4ID0gbm9kZTsKIAogCQluID0gbGUx
Nl90b19jcHUoaWR4LT5jaGlsZF9jbnQpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRjaGlsZF9j
bnQgICAgICAlZFxuIiwgbik7Ci0JCXByaW50ayhLRVJOX0RFQlVHICJcdGxldmVsICAgICAgICAg
ICVkXG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0Y2hpbGRfY250ICAgICAgJWRcbiIsIG4pOwor
CQlwcmludGsoS0VSTl9FUlIgIlx0bGV2ZWwgICAgICAgICAgJWRcbiIsCiAJCSAgICAgICAoaW50
KWxlMTZfdG9fY3B1KGlkeC0+bGV2ZWwpKTsKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0QnJhbmNo
ZXM6XG4iKTsKKwkJcHJpbnRrKEtFUk5fRVJSICJcdEJyYW5jaGVzOlxuIik7CiAKIAkJZm9yIChp
ID0gMDsgaSA8IG4gJiYgaSA8IGMtPmZhbm91dCAtIDE7IGkrKykgewogCQkJY29uc3Qgc3RydWN0
IHViaWZzX2JyYW5jaCAqYnI7CiAKIAkJCWJyID0gdWJpZnNfaWR4X2JyYW5jaChjLCBpZHgsIGkp
OwogCQkJa2V5X3JlYWQoYywgJmJyLT5rZXksICZrZXkpOwotCQkJcHJpbnRrKEtFUk5fREVCVUcg
Ilx0JWQ6IExFQiAlZDolZCBsZW4gJWQga2V5ICVzXG4iLAorCQkJcHJpbnRrKEtFUk5fRVJSICJc
dCVkOiBMRUIgJWQ6JWQgbGVuICVkIGtleSAlc1xuIiwKIAkJCSAgICAgICBpLCBsZTMyX3RvX2Nw
dShici0+bG51bSksIGxlMzJfdG9fY3B1KGJyLT5vZmZzKSwKLQkJCSAgICAgICBsZTMyX3RvX2Nw
dShici0+bGVuKSwgREJHS0VZKCZrZXkpKTsKKwkJCSAgICAgICBsZTMyX3RvX2NwdShici0+bGVu
KSwKKwkJCSAgICAgICBkYmdfc25wcmludGZfa2V5KGMsICZrZXksIGtleV9idWYsCisJCQkJCQlE
QkdfS0VZX0JVRl9MRU4pKTsKIAkJfQogCQlicmVhazsKIAl9CkBAIC01NTAsNTcgKzU4Miw1NyBA
QAogCXsKIAkJY29uc3Qgc3RydWN0IHViaWZzX29ycGhfbm9kZSAqb3JwaCA9IG5vZGU7CiAKLQkJ
cHJpbnRrKEtFUk5fREVCVUcgIlx0Y29tbWl0IG51bWJlciAgJWxsdVxuIiwKKwkJcHJpbnRrKEtF
Uk5fRVJSICJcdGNvbW1pdCBudW1iZXIgICVsbHVcbiIsCiAJCSAgICAgICAodW5zaWduZWQgbG9u
ZyBsb25nKQogCQkJCWxlNjRfdG9fY3B1KG9ycGgtPmNtdF9ubykgJiBMTE9OR19NQVgpOwotCQlw
cmludGsoS0VSTl9ERUJVRyAiXHRsYXN0IG5vZGUgZmxhZyAlbGx1XG4iLAorCQlwcmludGsoS0VS
Tl9FUlIgIlx0bGFzdCBub2RlIGZsYWcgJWxsdVxuIiwKIAkJICAgICAgICh1bnNpZ25lZCBsb25n
IGxvbmcpKGxlNjRfdG9fY3B1KG9ycGgtPmNtdF9ubykpID4+IDYzKTsKIAkJbiA9IChsZTMyX3Rv
X2NwdShjaC0+bGVuKSAtIFVCSUZTX09SUEhfTk9ERV9TWikgPj4gMzsKLQkJcHJpbnRrKEtFUk5f
REVCVUcgIlx0JWQgb3JwaGFuIGlub2RlIG51bWJlcnM6XG4iLCBuKTsKKwkJcHJpbnRrKEtFUk5f
RVJSICJcdCVkIG9ycGhhbiBpbm9kZSBudW1iZXJzOlxuIiwgbik7CiAJCWZvciAoaSA9IDA7IGkg
PCBuOyBpKyspCi0JCQlwcmludGsoS0VSTl9ERUJVRyAiXHQgIGlubyAlbGx1XG4iLAorCQkJcHJp
bnRrKEtFUk5fRVJSICJcdCAgaW5vICVsbHVcbiIsCiAJCQkgICAgICAgKHVuc2lnbmVkIGxvbmcg
bG9uZylsZTY0X3RvX2NwdShvcnBoLT5pbm9zW2ldKSk7CiAJCWJyZWFrOwogCX0KIAlkZWZhdWx0
OgotCQlwcmludGsoS0VSTl9ERUJVRyAibm9kZSB0eXBlICVkIHdhcyBub3QgcmVjb2duaXplZFxu
IiwKKwkJcHJpbnRrKEtFUk5fRVJSICJub2RlIHR5cGUgJWQgd2FzIG5vdCByZWNvZ25pemVkXG4i
LAogCQkgICAgICAgKGludCljaC0+bm9kZV90eXBlKTsKIAl9CiAJc3Bpbl91bmxvY2soJmRiZ19s
b2NrKTsKIH0KIAotdm9pZCBkYmdfZHVtcF9idWRnZXRfcmVxKGNvbnN0IHN0cnVjdCB1Ymlmc19i
dWRnZXRfcmVxICpyZXEpCit2b2lkIHViaWZzX2R1bXBfYnVkZ2V0X3JlcShjb25zdCBzdHJ1Y3Qg
dWJpZnNfYnVkZ2V0X3JlcSAqcmVxKQogewogCXNwaW5fbG9jaygmZGJnX2xvY2spOwotCXByaW50
ayhLRVJOX0RFQlVHICJCdWRnZXRpbmcgcmVxdWVzdDogbmV3X2lubyAlZCwgZGlydGllZF9pbm8g
JWRcbiIsCisJcHJpbnRrKEtFUk5fRVJSICJCdWRnZXRpbmcgcmVxdWVzdDogbmV3X2lubyAlZCwg
ZGlydGllZF9pbm8gJWRcbiIsCiAJICAgICAgIHJlcS0+bmV3X2lubywgcmVxLT5kaXJ0aWVkX2lu
byk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0bmV3X2lub19kICAgJWQsIGRpcnRpZWRfaW5vX2Qg
JWRcbiIsCisJcHJpbnRrKEtFUk5fRVJSICJcdG5ld19pbm9fZCAgICVkLCBkaXJ0aWVkX2lub19k
ICVkXG4iLAogCSAgICAgICByZXEtPm5ld19pbm9fZCwgcmVxLT5kaXJ0aWVkX2lub19kKTsKLQlw
cmludGsoS0VSTl9ERUJVRyAiXHRuZXdfcGFnZSAgICAlZCwgZGlydGllZF9wYWdlICVkXG4iLAor
CXByaW50ayhLRVJOX0VSUiAiXHRuZXdfcGFnZSAgICAlZCwgZGlydGllZF9wYWdlICVkXG4iLAog
CSAgICAgICByZXEtPm5ld19wYWdlLCByZXEtPmRpcnRpZWRfcGFnZSk7Ci0JcHJpbnRrKEtFUk5f
REVCVUcgIlx0bmV3X2RlbnQgICAgJWQsIG1vZF9kZW50ICAgICAlZFxuIiwKKwlwcmludGsoS0VS
Tl9FUlIgIlx0bmV3X2RlbnQgICAgJWQsIG1vZF9kZW50ICAgICAlZFxuIiwKIAkgICAgICAgcmVx
LT5uZXdfZGVudCwgcmVxLT5tb2RfZGVudCk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0aWR4X2dy
b3d0aCAgJWRcbiIsIHJlcS0+aWR4X2dyb3d0aCk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0ZGF0
YV9ncm93dGggJWQgZGRfZ3Jvd3RoICAgICAlZFxuIiwKKwlwcmludGsoS0VSTl9FUlIgIlx0aWR4
X2dyb3d0aCAgJWRcbiIsIHJlcS0+aWR4X2dyb3d0aCk7CisJcHJpbnRrKEtFUk5fRVJSICJcdGRh
dGFfZ3Jvd3RoICVkIGRkX2dyb3d0aCAgICAgJWRcbiIsCiAJICAgICAgIHJlcS0+ZGF0YV9ncm93
dGgsIHJlcS0+ZGRfZ3Jvd3RoKTsKIAlzcGluX3VubG9jaygmZGJnX2xvY2spOwogfQogCi12b2lk
IGRiZ19kdW1wX2xzdGF0cyhjb25zdCBzdHJ1Y3QgdWJpZnNfbHBfc3RhdHMgKmxzdCkKK3ZvaWQg
dWJpZnNfZHVtcF9sc3RhdHMoY29uc3Qgc3RydWN0IHViaWZzX2xwX3N0YXRzICpsc3QpCiB7CiAJ
c3Bpbl9sb2NrKCZkYmdfbG9jayk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIihwaWQgJWQpIExwcm9w
cyBzdGF0aXN0aWNzOiBlbXB0eV9sZWJzICVkLCAiCisJcHJpbnRrKEtFUk5fRVJSICIocGlkICVk
KSBMcHJvcHMgc3RhdGlzdGljczogZW1wdHlfbGVicyAlZCwgIgogCSAgICAgICAiaWR4X2xlYnMg
ICVkXG4iLCBjdXJyZW50LT5waWQsIGxzdC0+ZW1wdHlfbGVicywgbHN0LT5pZHhfbGVicyk7Ci0J
cHJpbnRrKEtFUk5fREVCVUcgIlx0dGFrZW5fZW1wdHlfbGVicyAlZCwgdG90YWxfZnJlZSAlbGxk
LCAiCisJcHJpbnRrKEtFUk5fRVJSICJcdHRha2VuX2VtcHR5X2xlYnMgJWQsIHRvdGFsX2ZyZWUg
JWxsZCwgIgogCSAgICAgICAidG90YWxfZGlydHkgJWxsZFxuIiwgbHN0LT50YWtlbl9lbXB0eV9s
ZWJzLCBsc3QtPnRvdGFsX2ZyZWUsCiAJICAgICAgIGxzdC0+dG90YWxfZGlydHkpOwotCXByaW50
ayhLRVJOX0RFQlVHICJcdHRvdGFsX3VzZWQgJWxsZCwgdG90YWxfZGFyayAlbGxkLCAiCisJcHJp
bnRrKEtFUk5fRVJSICJcdHRvdGFsX3VzZWQgJWxsZCwgdG90YWxfZGFyayAlbGxkLCAiCiAJICAg
ICAgICJ0b3RhbF9kZWFkICVsbGRcbiIsIGxzdC0+dG90YWxfdXNlZCwgbHN0LT50b3RhbF9kYXJr
LAogCSAgICAgICBsc3QtPnRvdGFsX2RlYWQpOwogCXNwaW5fdW5sb2NrKCZkYmdfbG9jayk7CiB9
CiAKLXZvaWQgZGJnX2R1bXBfYnVkZyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgY29uc3Qgc3RydWN0
IHViaWZzX2J1ZGdfaW5mbyAqYmkpCit2b2lkIHViaWZzX2R1bXBfYnVkZyhzdHJ1Y3QgdWJpZnNf
aW5mbyAqYywgY29uc3Qgc3RydWN0IHViaWZzX2J1ZGdfaW5mbyAqYmkpCiB7CiAJaW50IGk7CiAJ
c3RydWN0IHJiX25vZGUgKnJiOwpAQCAtNjEwLDIxICs2NDIsMjEgQEAKIAogCXNwaW5fbG9jaygm
Yy0+c3BhY2VfbG9jayk7CiAJc3Bpbl9sb2NrKCZkYmdfbG9jayk7Ci0JcHJpbnRrKEtFUk5fREVC
VUcgIihwaWQgJWQpIEJ1ZGdldGluZyBpbmZvOiBkYXRhIGJ1ZGdldCBzdW0gJWxsZCwgIgorCXBy
aW50ayhLRVJOX0VSUiAiKHBpZCAlZCkgQnVkZ2V0aW5nIGluZm86IGRhdGEgYnVkZ2V0IHN1bSAl
bGxkLCAiCiAJICAgICAgICJ0b3RhbCBidWRnZXQgc3VtICVsbGRcbiIsIGN1cnJlbnQtPnBpZCwK
IAkgICAgICAgYmktPmRhdGFfZ3Jvd3RoICsgYmktPmRkX2dyb3d0aCwKIAkgICAgICAgYmktPmRh
dGFfZ3Jvd3RoICsgYmktPmRkX2dyb3d0aCArIGJpLT5pZHhfZ3Jvd3RoKTsKLQlwcmludGsoS0VS
Tl9ERUJVRyAiXHRidWRnX2RhdGFfZ3Jvd3RoICVsbGQsIGJ1ZGdfZGRfZ3Jvd3RoICVsbGQsICIK
KwlwcmludGsoS0VSTl9FUlIgIlx0YnVkZ19kYXRhX2dyb3d0aCAlbGxkLCBidWRnX2RkX2dyb3d0
aCAlbGxkLCAiCiAJICAgICAgICJidWRnX2lkeF9ncm93dGggJWxsZFxuIiwgYmktPmRhdGFfZ3Jv
d3RoLCBiaS0+ZGRfZ3Jvd3RoLAogCSAgICAgICBiaS0+aWR4X2dyb3d0aCk7Ci0JcHJpbnRrKEtF
Uk5fREVCVUcgIlx0bWluX2lkeF9sZWJzICVkLCBvbGRfaWR4X3N6ICVsbHUsICIKKwlwcmludGso
S0VSTl9FUlIgIlx0bWluX2lkeF9sZWJzICVkLCBvbGRfaWR4X3N6ICVsbHUsICIKIAkgICAgICAg
InVuY29tbWl0dGVkX2lkeCAlbGxkXG4iLCBiaS0+bWluX2lkeF9sZWJzLCBiaS0+b2xkX2lkeF9z
eiwKIAkgICAgICAgYmktPnVuY29tbWl0dGVkX2lkeCk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0
cGFnZV9idWRnZXQgJWQsIGlub2RlX2J1ZGdldCAlZCwgZGVudF9idWRnZXQgJWRcbiIsCisJcHJp
bnRrKEtFUk5fRVJSICJcdHBhZ2VfYnVkZ2V0ICVkLCBpbm9kZV9idWRnZXQgJWQsIGRlbnRfYnVk
Z2V0ICVkXG4iLAogCSAgICAgICBiaS0+cGFnZV9idWRnZXQsIGJpLT5pbm9kZV9idWRnZXQsIGJp
LT5kZW50X2J1ZGdldCk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0bm9zcGFjZSAldSwgbm9zcGFj
ZV9ycCAldVxuIiwKKwlwcmludGsoS0VSTl9FUlIgIlx0bm9zcGFjZSAldSwgbm9zcGFjZV9ycCAl
dVxuIiwKIAkgICAgICAgYmktPm5vc3BhY2UsIGJpLT5ub3NwYWNlX3JwKTsKLQlwcmludGsoS0VS
Tl9ERUJVRyAiXHRkYXJrX3dtICVkLCBkZWFkX3dtICVkLCBtYXhfaWR4X25vZGVfc3ogJWRcbiIs
CisJcHJpbnRrKEtFUk5fRVJSICJcdGRhcmtfd20gJWQsIGRlYWRfd20gJWQsIG1heF9pZHhfbm9k
ZV9zeiAlZFxuIiwKIAkgICAgICAgYy0+ZGFya193bSwgYy0+ZGVhZF93bSwgYy0+bWF4X2lkeF9u
b2RlX3N6KTsKIAogCWlmIChiaSAhPSAmYy0+YmkpCkBAIC02MzUsNDUgKzY2Nyw0NSBAQAogCQkg
Ki8KIAkJZ290byBvdXRfdW5sb2NrOwogCi0JcHJpbnRrKEtFUk5fREVCVUcgIlx0ZnJlZWFibGVf
Y250ICVkLCBjYWxjX2lkeF9zeiAlbGxkLCBpZHhfZ2NfY250ICVkXG4iLAorCXByaW50ayhLRVJO
X0VSUiAiXHRmcmVlYWJsZV9jbnQgJWQsIGNhbGNfaWR4X3N6ICVsbGQsIGlkeF9nY19jbnQgJWRc
biIsCiAJICAgICAgIGMtPmZyZWVhYmxlX2NudCwgYy0+Y2FsY19pZHhfc3osIGMtPmlkeF9nY19j
bnQpOwotCXByaW50ayhLRVJOX0RFQlVHICJcdGRpcnR5X3BnX2NudCAlbGQsIGRpcnR5X3puX2Nu
dCAlbGQsICIKKwlwcmludGsoS0VSTl9FUlIgIlx0ZGlydHlfcGdfY250ICVsZCwgZGlydHlfem5f
Y250ICVsZCwgIgogCSAgICAgICAiY2xlYW5fem5fY250ICVsZFxuIiwgYXRvbWljX2xvbmdfcmVh
ZCgmYy0+ZGlydHlfcGdfY250KSwKIAkgICAgICAgYXRvbWljX2xvbmdfcmVhZCgmYy0+ZGlydHlf
em5fY250KSwKIAkgICAgICAgYXRvbWljX2xvbmdfcmVhZCgmYy0+Y2xlYW5fem5fY250KSk7Ci0J
cHJpbnRrKEtFUk5fREVCVUcgIlx0Z2NfbG51bSAlZCwgaWhlYWRfbG51bSAlZFxuIiwKKwlwcmlu
dGsoS0VSTl9FUlIgIlx0Z2NfbG51bSAlZCwgaWhlYWRfbG51bSAlZFxuIiwKIAkgICAgICAgYy0+
Z2NfbG51bSwgYy0+aWhlYWRfbG51bSk7CiAKIAkvKiBJZiB3ZSBhcmUgaW4gUi9PIG1vZGUsIGpv
dXJuYWwgaGVhZHMgZG8gbm90IGV4aXN0ICovCiAJaWYgKGMtPmpoZWFkcykKIAkJZm9yIChpID0g
MDsgaSA8IGMtPmpoZWFkX2NudDsgaSsrKQotCQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0amhlYWQg
JXNcdCBMRUIgJWRcbiIsCisJCQlwcmludGsoS0VSTl9FUlIgIlx0amhlYWQgJXNcdCBMRUIgJWRc
biIsCiAJCQkgICAgICAgZGJnX2poZWFkKGMtPmpoZWFkc1tpXS53YnVmLmpoZWFkKSwKIAkJCSAg
ICAgICBjLT5qaGVhZHNbaV0ud2J1Zi5sbnVtKTsKIAlmb3IgKHJiID0gcmJfZmlyc3QoJmMtPmJ1
ZHMpOyByYjsgcmIgPSByYl9uZXh0KHJiKSkgewogCQlidWQgPSByYl9lbnRyeShyYiwgc3RydWN0
IHViaWZzX2J1ZCwgcmIpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiXHRidWQgTEVCICVkXG4iLCBi
dWQtPmxudW0pOworCQlwcmludGsoS0VSTl9FUlIgIlx0YnVkIExFQiAlZFxuIiwgYnVkLT5sbnVt
KTsKIAl9CiAJbGlzdF9mb3JfZWFjaF9lbnRyeShidWQsICZjLT5vbGRfYnVkcywgbGlzdCkKLQkJ
cHJpbnRrKEtFUk5fREVCVUcgIlx0b2xkIGJ1ZCBMRUIgJWRcbiIsIGJ1ZC0+bG51bSk7CisJCXBy
aW50ayhLRVJOX0VSUiAiXHRvbGQgYnVkIExFQiAlZFxuIiwgYnVkLT5sbnVtKTsKIAlsaXN0X2Zv
cl9lYWNoX2VudHJ5KGlkeF9nYywgJmMtPmlkeF9nYywgbGlzdCkKLQkJcHJpbnRrKEtFUk5fREVC
VUcgIlx0R0MnZWQgaWR4IExFQiAlZCB1bm1hcCAlZFxuIiwKKwkJcHJpbnRrKEtFUk5fRVJSICJc
dEdDJ2VkIGlkeCBMRUIgJWQgdW5tYXAgJWRcbiIsCiAJCSAgICAgICBpZHhfZ2MtPmxudW0sIGlk
eF9nYy0+dW5tYXApOwotCXByaW50ayhLRVJOX0RFQlVHICJcdGNvbW1pdCBzdGF0ZSAlZFxuIiwg
Yy0+Y210X3N0YXRlKTsKKwlwcmludGsoS0VSTl9FUlIgIlx0Y29tbWl0IHN0YXRlICVkXG4iLCBj
LT5jbXRfc3RhdGUpOwogCiAJLyogUHJpbnQgYnVkZ2V0aW5nIHByZWRpY3Rpb25zICovCiAJYXZh
aWxhYmxlID0gdWJpZnNfY2FsY19hdmFpbGFibGUoYywgYy0+YmkubWluX2lkeF9sZWJzKTsKIAlv
dXRzdGFuZGluZyA9IGMtPmJpLmRhdGFfZ3Jvd3RoICsgYy0+YmkuZGRfZ3Jvd3RoOwogCWZyZWUg
PSB1Ymlmc19nZXRfZnJlZV9zcGFjZV9ub2xvY2soYyk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIkJ1
ZGdldGluZyBwcmVkaWN0aW9uczpcbiIpOwotCXByaW50ayhLRVJOX0RFQlVHICJcdGF2YWlsYWJs
ZTogJWxsZCwgb3V0c3RhbmRpbmcgJWxsZCwgZnJlZSAlbGxkXG4iLAorCXByaW50ayhLRVJOX0VS
UiAiQnVkZ2V0aW5nIHByZWRpY3Rpb25zOlxuIik7CisJcHJpbnRrKEtFUk5fRVJSICJcdGF2YWls
YWJsZTogJWxsZCwgb3V0c3RhbmRpbmcgJWxsZCwgZnJlZSAlbGxkXG4iLAogCSAgICAgICBhdmFp
bGFibGUsIG91dHN0YW5kaW5nLCBmcmVlKTsKIG91dF91bmxvY2s6CiAJc3Bpbl91bmxvY2soJmRi
Z19sb2NrKTsKIAlzcGluX3VubG9jaygmYy0+c3BhY2VfbG9jayk7CiB9CiAKLXZvaWQgZGJnX2R1
bXBfbHByb3AoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCB1Ymlmc19s
cHJvcHMgKmxwKQordm9pZCB1Ymlmc19kdW1wX2xwcm9wKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZv
ICpjLCBjb25zdCBzdHJ1Y3QgdWJpZnNfbHByb3BzICpscCkKIHsKIAlpbnQgaSwgc3BjLCBkYXJr
ID0gMCwgZGVhZCA9IDA7CiAJc3RydWN0IHJiX25vZGUgKnJiOwpAQCAtNjg2LDExICs3MTgsMTEg
QEAKIAkJZGFyayA9IHViaWZzX2NhbGNfZGFyayhjLCBzcGMpOwogCiAJaWYgKGxwLT5mbGFncyAm
IExQUk9QU19JTkRFWCkKLQkJcHJpbnRrKEtFUk5fREVCVUcgIkxFQiAlLTdkIGZyZWUgJS04ZCBk
aXJ0eSAlLThkIHVzZWQgJS04ZCAiCisJCXByaW50ayhLRVJOX0VSUiAiTEVCICUtN2QgZnJlZSAl
LThkIGRpcnR5ICUtOGQgdXNlZCAlLThkICIKIAkJICAgICAgICJmcmVlICsgZGlydHkgJS04ZCBm
bGFncyAlI3ggKCIsIGxwLT5sbnVtLCBscC0+ZnJlZSwKIAkJICAgICAgIGxwLT5kaXJ0eSwgYy0+
bGViX3NpemUgLSBzcGMsIHNwYywgbHAtPmZsYWdzKTsKIAllbHNlCi0JCXByaW50ayhLRVJOX0RF
QlVHICJMRUIgJS03ZCBmcmVlICUtOGQgZGlydHkgJS04ZCB1c2VkICUtOGQgIgorCQlwcmludGso
S0VSTl9FUlIgIkxFQiAlLTdkIGZyZWUgJS04ZCBkaXJ0eSAlLThkIHVzZWQgJS04ZCAiCiAJCSAg
ICAgICAiZnJlZSArIGRpcnR5ICUtOGQgZGFyayAlLTRkIGRlYWQgJS00ZCBub2RlcyBmaXQgJS0z
ZCAiCiAJCSAgICAgICAiZmxhZ3MgJSMtNHggKCIsIGxwLT5sbnVtLCBscC0+ZnJlZSwgbHAtPmRp
cnR5LAogCQkgICAgICAgYy0+bGViX3NpemUgLSBzcGMsIHNwYywgZGFyaywgZGVhZCwKQEAgLTc2
Nyw3NyArNzk5LDkzIEBACiAJcHJpbnRrKEtFUk5fQ09OVCAiKVxuIik7CiB9CiAKLXZvaWQgZGJn
X2R1bXBfbHByb3BzKHN0cnVjdCB1Ymlmc19pbmZvICpjKQordm9pZCB1Ymlmc19kdW1wX2xwcm9w
cyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKIHsKIAlpbnQgbG51bSwgZXJyOwogCXN0cnVjdCB1Ymlm
c19scHJvcHMgbHA7CiAJc3RydWN0IHViaWZzX2xwX3N0YXRzIGxzdDsKIAotCXByaW50ayhLRVJO
X0RFQlVHICIocGlkICVkKSBzdGFydCBkdW1waW5nIExFQiBwcm9wZXJ0aWVzXG4iLAorCXByaW50
ayhLRVJOX0VSUiAiKHBpZCAlZCkgc3RhcnQgZHVtcGluZyBMRUIgcHJvcGVydGllc1xuIiwKIAkg
ICAgICAgY3VycmVudC0+cGlkKTsKIAl1Ymlmc19nZXRfbHBfc3RhdHMoYywgJmxzdCk7Ci0JZGJn
X2R1bXBfbHN0YXRzKCZsc3QpOworCXViaWZzX2R1bXBfbHN0YXRzKCZsc3QpOwogCiAJZm9yIChs
bnVtID0gYy0+bWFpbl9maXJzdDsgbG51bSA8IGMtPmxlYl9jbnQ7IGxudW0rKykgewogCQllcnIg
PSB1Ymlmc19yZWFkX29uZV9scChjLCBsbnVtLCAmbHApOwogCQlpZiAoZXJyKQogCQkJdWJpZnNf
ZXJyKCJjYW5ub3QgcmVhZCBscHJvcHMgZm9yIExFQiAlZCIsIGxudW0pOwogCi0JCWRiZ19kdW1w
X2xwcm9wKGMsICZscCk7CisJCXViaWZzX2R1bXBfbHByb3AoYywgJmxwKTsKIAl9Ci0JcHJpbnRr
KEtFUk5fREVCVUcgIihwaWQgJWQpIGZpbmlzaCBkdW1waW5nIExFQiBwcm9wZXJ0aWVzXG4iLAor
CXByaW50ayhLRVJOX0VSUiAiKHBpZCAlZCkgZmluaXNoIGR1bXBpbmcgTEVCIHByb3BlcnRpZXNc
biIsCiAJICAgICAgIGN1cnJlbnQtPnBpZCk7CiB9CiAKLXZvaWQgZGJnX2R1bXBfbHB0X2luZm8o
c3RydWN0IHViaWZzX2luZm8gKmMpCit2b2lkIHViaWZzX2R1bXBfbHB0X2luZm8oc3RydWN0IHVi
aWZzX2luZm8gKmMpCiB7CiAJaW50IGk7CiAKIAlzcGluX2xvY2soJmRiZ19sb2NrKTsKLQlwcmlu
dGsoS0VSTl9ERUJVRyAiKHBpZCAlZCkgZHVtcGluZyBMUFQgaW5mb3JtYXRpb25cbiIsIGN1cnJl
bnQtPnBpZCk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0bHB0X3N6OiAgICAgICAgJWxsZFxuIiwg
Yy0+bHB0X3N6KTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRwbm9kZV9zejogICAgICAlZFxuIiwg
Yy0+cG5vZGVfc3opOwotCXByaW50ayhLRVJOX0RFQlVHICJcdG5ub2RlX3N6OiAgICAgICVkXG4i
LCBjLT5ubm9kZV9zeik7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0bHRhYl9zejogICAgICAgJWRc
biIsIGMtPmx0YWJfc3opOwotCXByaW50ayhLRVJOX0RFQlVHICJcdGxzYXZlX3N6OiAgICAgICVk
XG4iLCBjLT5sc2F2ZV9zeik7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0YmlnX2xwdDogICAgICAg
JWRcbiIsIGMtPmJpZ19scHQpOwotCXByaW50ayhLRVJOX0RFQlVHICJcdGxwdF9oZ2h0OiAgICAg
ICVkXG4iLCBjLT5scHRfaGdodCk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0cG5vZGVfY250OiAg
ICAgJWRcbiIsIGMtPnBub2RlX2NudCk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0bm5vZGVfY250
OiAgICAgJWRcbiIsIGMtPm5ub2RlX2NudCk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0ZGlydHlf
cG5fY250OiAgJWRcbiIsIGMtPmRpcnR5X3BuX2NudCk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0
ZGlydHlfbm5fY250OiAgJWRcbiIsIGMtPmRpcnR5X25uX2NudCk7Ci0JcHJpbnRrKEtFUk5fREVC
VUcgIlx0bHNhdmVfY250OiAgICAgJWRcbiIsIGMtPmxzYXZlX2NudCk7Ci0JcHJpbnRrKEtFUk5f
REVCVUcgIlx0c3BhY2VfYml0czogICAgJWRcbiIsIGMtPnNwYWNlX2JpdHMpOwotCXByaW50ayhL
RVJOX0RFQlVHICJcdGxwdF9sbnVtX2JpdHM6ICVkXG4iLCBjLT5scHRfbG51bV9iaXRzKTsKLQlw
cmludGsoS0VSTl9ERUJVRyAiXHRscHRfb2Zmc19iaXRzOiAlZFxuIiwgYy0+bHB0X29mZnNfYml0
cyk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0bHB0X3NwY19iaXRzOiAgJWRcbiIsIGMtPmxwdF9z
cGNfYml0cyk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0cGNudF9iaXRzOiAgICAgJWRcbiIsIGMt
PnBjbnRfYml0cyk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0bG51bV9iaXRzOiAgICAgJWRcbiIs
IGMtPmxudW1fYml0cyk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0TFBUIHJvb3QgaXMgYXQgJWQ6
JWRcbiIsIGMtPmxwdF9sbnVtLCBjLT5scHRfb2Zmcyk7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIlx0
TFBUIGhlYWQgaXMgYXQgJWQ6JWRcbiIsCisJcHJpbnRrKEtFUk5fRVJSICIocGlkICVkKSBkdW1w
aW5nIExQVCBpbmZvcm1hdGlvblxuIiwgY3VycmVudC0+cGlkKTsKKwlwcmludGsoS0VSTl9FUlIg
Ilx0bHB0X3N6OiAgICAgICAgJWxsZFxuIiwgYy0+bHB0X3N6KTsKKwlwcmludGsoS0VSTl9FUlIg
Ilx0cG5vZGVfc3o6ICAgICAgJWRcbiIsIGMtPnBub2RlX3N6KTsKKwlwcmludGsoS0VSTl9FUlIg
Ilx0bm5vZGVfc3o6ICAgICAgJWRcbiIsIGMtPm5ub2RlX3N6KTsKKwlwcmludGsoS0VSTl9FUlIg
Ilx0bHRhYl9zejogICAgICAgJWRcbiIsIGMtPmx0YWJfc3opOworCXByaW50ayhLRVJOX0VSUiAi
XHRsc2F2ZV9zejogICAgICAlZFxuIiwgYy0+bHNhdmVfc3opOworCXByaW50ayhLRVJOX0VSUiAi
XHRiaWdfbHB0OiAgICAgICAlZFxuIiwgYy0+YmlnX2xwdCk7CisJcHJpbnRrKEtFUk5fRVJSICJc
dGxwdF9oZ2h0OiAgICAgICVkXG4iLCBjLT5scHRfaGdodCk7CisJcHJpbnRrKEtFUk5fRVJSICJc
dHBub2RlX2NudDogICAgICVkXG4iLCBjLT5wbm9kZV9jbnQpOworCXByaW50ayhLRVJOX0VSUiAi
XHRubm9kZV9jbnQ6ICAgICAlZFxuIiwgYy0+bm5vZGVfY250KTsKKwlwcmludGsoS0VSTl9FUlIg
Ilx0ZGlydHlfcG5fY250OiAgJWRcbiIsIGMtPmRpcnR5X3BuX2NudCk7CisJcHJpbnRrKEtFUk5f
RVJSICJcdGRpcnR5X25uX2NudDogICVkXG4iLCBjLT5kaXJ0eV9ubl9jbnQpOworCXByaW50ayhL
RVJOX0VSUiAiXHRsc2F2ZV9jbnQ6ICAgICAlZFxuIiwgYy0+bHNhdmVfY250KTsKKwlwcmludGso
S0VSTl9FUlIgIlx0c3BhY2VfYml0czogICAgJWRcbiIsIGMtPnNwYWNlX2JpdHMpOworCXByaW50
ayhLRVJOX0VSUiAiXHRscHRfbG51bV9iaXRzOiAlZFxuIiwgYy0+bHB0X2xudW1fYml0cyk7CisJ
cHJpbnRrKEtFUk5fRVJSICJcdGxwdF9vZmZzX2JpdHM6ICVkXG4iLCBjLT5scHRfb2Zmc19iaXRz
KTsKKwlwcmludGsoS0VSTl9FUlIgIlx0bHB0X3NwY19iaXRzOiAgJWRcbiIsIGMtPmxwdF9zcGNf
Yml0cyk7CisJcHJpbnRrKEtFUk5fRVJSICJcdHBjbnRfYml0czogICAgICVkXG4iLCBjLT5wY250
X2JpdHMpOworCXByaW50ayhLRVJOX0VSUiAiXHRsbnVtX2JpdHM6ICAgICAlZFxuIiwgYy0+bG51
bV9iaXRzKTsKKwlwcmludGsoS0VSTl9FUlIgIlx0TFBUIHJvb3QgaXMgYXQgJWQ6JWRcbiIsIGMt
PmxwdF9sbnVtLCBjLT5scHRfb2Zmcyk7CisJcHJpbnRrKEtFUk5fRVJSICJcdExQVCBoZWFkIGlz
IGF0ICVkOiVkXG4iLAogCSAgICAgICBjLT5uaGVhZF9sbnVtLCBjLT5uaGVhZF9vZmZzKTsKLQlw
cmludGsoS0VSTl9ERUJVRyAiXHRMUFQgbHRhYiBpcyBhdCAlZDolZFxuIiwKKwlwcmludGsoS0VS
Tl9FUlIgIlx0TFBUIGx0YWIgaXMgYXQgJWQ6JWRcbiIsCiAJICAgICAgIGMtPmx0YWJfbG51bSwg
Yy0+bHRhYl9vZmZzKTsKIAlpZiAoYy0+YmlnX2xwdCkKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0
TFBUIGxzYXZlIGlzIGF0ICVkOiVkXG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0TFBUIGxzYXZl
IGlzIGF0ICVkOiVkXG4iLAogCQkgICAgICAgYy0+bHNhdmVfbG51bSwgYy0+bHNhdmVfb2Zmcyk7
CiAJZm9yIChpID0gMDsgaSA8IGMtPmxwdF9sZWJzOyBpKyspCi0JCXByaW50ayhLRVJOX0RFQlVH
ICJcdExQVCBMRUIgJWQgZnJlZSAlZCBkaXJ0eSAlZCB0Z2MgJWQgIgorCQlwcmludGsoS0VSTl9F
UlIgIlx0TFBUIExFQiAlZCBmcmVlICVkIGRpcnR5ICVkIHRnYyAlZCAiCiAJCSAgICAgICAiY210
ICVkXG4iLCBpICsgYy0+bHB0X2ZpcnN0LCBjLT5sdGFiW2ldLmZyZWUsCiAJCSAgICAgICBjLT5s
dGFiW2ldLmRpcnR5LCBjLT5sdGFiW2ldLnRnYywgYy0+bHRhYltpXS5jbXQpOwogCXNwaW5fdW5s
b2NrKCZkYmdfbG9jayk7CiB9CiAKLXZvaWQgZGJnX2R1bXBfbGViKGNvbnN0IHN0cnVjdCB1Ymlm
c19pbmZvICpjLCBpbnQgbG51bSkKK3ZvaWQgdWJpZnNfZHVtcF9zbGViKGNvbnN0IHN0cnVjdCB1
Ymlmc19pbmZvICpjLAorCQkgICAgIGNvbnN0IHN0cnVjdCB1Ymlmc19zY2FuX2xlYiAqc2xlYiwg
aW50IG9mZnMpCit7CisJc3RydWN0IHViaWZzX3NjYW5fbm9kZSAqc25vZDsKKworCXByaW50ayhL
RVJOX0VSUiAiKHBpZCAlZCkgc3RhcnQgZHVtcGluZyBzY2FubmVkIGRhdGEgZnJvbSBMRUIgJWQ6
JWRcbiIsCisJICAgICAgIGN1cnJlbnQtPnBpZCwgc2xlYi0+bG51bSwgb2Zmcyk7CisKKwlsaXN0
X2Zvcl9lYWNoX2VudHJ5KHNub2QsICZzbGViLT5ub2RlcywgbGlzdCkgeworCQljb25kX3Jlc2No
ZWQoKTsKKwkJcHJpbnRrKEtFUk5fRVJSICJEdW1waW5nIG5vZGUgYXQgTEVCICVkOiVkIGxlbiAl
ZFxuIiwgc2xlYi0+bG51bSwKKwkJICAgICAgIHNub2QtPm9mZnMsIHNub2QtPmxlbik7CisJCXVi
aWZzX2R1bXBfbm9kZShjLCBzbm9kLT5ub2RlKTsKKwl9Cit9CisKK3ZvaWQgdWJpZnNfZHVtcF9s
ZWIoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBsbnVtKQogewogCXN0cnVjdCB1Ymlm
c19zY2FuX2xlYiAqc2xlYjsKIAlzdHJ1Y3QgdWJpZnNfc2Nhbl9ub2RlICpzbm9kOwogCXZvaWQg
KmJ1ZjsKIAotCWlmIChkYmdfZmFpbHVyZV9tb2RlKQorCWlmIChkYmdfaXNfdHN0X3JjdnJ5KGMp
KQogCQlyZXR1cm47CiAKLQlwcmludGsoS0VSTl9ERUJVRyAiKHBpZCAlZCkgc3RhcnQgZHVtcGlu
ZyBMRUIgJWRcbiIsCisJcHJpbnRrKEtFUk5fRVJSICIocGlkICVkKSBzdGFydCBkdW1waW5nIExF
QiAlZFxuIiwKIAkgICAgICAgY3VycmVudC0+cGlkLCBsbnVtKTsKIAogCWJ1ZiA9IF9fdm1hbGxv
YyhjLT5sZWJfc2l6ZSwgR0ZQX05PRlMsIFBBR0VfS0VSTkVMKTsKQEAgLTg1MiwxNyArOTAwLDE3
IEBACiAJCWdvdG8gb3V0OwogCX0KIAotCXByaW50ayhLRVJOX0RFQlVHICJMRUIgJWQgaGFzICVk
IG5vZGVzIGVuZGluZyBhdCAlZFxuIiwgbG51bSwKKwlwcmludGsoS0VSTl9FUlIgIkxFQiAlZCBo
YXMgJWQgbm9kZXMgZW5kaW5nIGF0ICVkXG4iLCBsbnVtLAogCSAgICAgICBzbGViLT5ub2Rlc19j
bnQsIHNsZWItPmVuZHB0KTsKIAogCWxpc3RfZm9yX2VhY2hfZW50cnkoc25vZCwgJnNsZWItPm5v
ZGVzLCBsaXN0KSB7CiAJCWNvbmRfcmVzY2hlZCgpOwotCQlwcmludGsoS0VSTl9ERUJVRyAiRHVt
cGluZyBub2RlIGF0IExFQiAlZDolZCBsZW4gJWRcbiIsIGxudW0sCisJCXByaW50ayhLRVJOX0VS
UiAiRHVtcGluZyBub2RlIGF0IExFQiAlZDolZCBsZW4gJWRcbiIsIGxudW0sCiAJCSAgICAgICBz
bm9kLT5vZmZzLCBzbm9kLT5sZW4pOwotCQlkYmdfZHVtcF9ub2RlKGMsIHNub2QtPm5vZGUpOwor
CQl1Ymlmc19kdW1wX25vZGUoYywgc25vZC0+bm9kZSk7CiAJfQogCi0JcHJpbnRrKEtFUk5fREVC
VUcgIihwaWQgJWQpIGZpbmlzaCBkdW1waW5nIExFQiAlZFxuIiwKKwlwcmludGsoS0VSTl9FUlIg
IihwaWQgJWQpIGZpbmlzaCBkdW1waW5nIExFQiAlZFxuIiwKIAkgICAgICAgY3VycmVudC0+cGlk
LCBsbnVtKTsKIAl1Ymlmc19zY2FuX2Rlc3Ryb3koc2xlYik7CiAKQEAgLTg3MSwxMSArOTE5LDEy
IEBACiAJcmV0dXJuOwogfQogCi12b2lkIGRiZ19kdW1wX3pub2RlKGNvbnN0IHN0cnVjdCB1Ymlm
c19pbmZvICpjLAotCQkgICAgY29uc3Qgc3RydWN0IHViaWZzX3pub2RlICp6bm9kZSkKK3ZvaWQg
dWJpZnNfZHVtcF96bm9kZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKKwkJICAgICAgY29u
c3Qgc3RydWN0IHViaWZzX3pub2RlICp6bm9kZSkKIHsKIAlpbnQgbjsKIAljb25zdCBzdHJ1Y3Qg
dWJpZnNfemJyYW5jaCAqemJyOworCWNoYXIga2V5X2J1ZltEQkdfS0VZX0JVRl9MRU5dOwogCiAJ
c3Bpbl9sb2NrKCZkYmdfbG9jayk7CiAJaWYgKHpub2RlLT5wYXJlbnQpCkBAIC04ODMsNyArOTMy
LDcgQEAKIAllbHNlCiAJCXpiciA9ICZjLT56cm9vdDsKIAotCXByaW50ayhLRVJOX0RFQlVHICJ6
bm9kZSAlcCwgTEVCICVkOiVkIGxlbiAlZCBwYXJlbnQgJXAgaWlwICVkIGxldmVsICVkIgorCXBy
aW50ayhLRVJOX0VSUiAiem5vZGUgJXAsIExFQiAlZDolZCBsZW4gJWQgcGFyZW50ICVwIGlpcCAl
ZCBsZXZlbCAlZCIKIAkgICAgICAgIiBjaGlsZF9jbnQgJWQgZmxhZ3MgJWx4XG4iLCB6bm9kZSwg
emJyLT5sbnVtLCB6YnItPm9mZnMsCiAJICAgICAgIHpici0+bGVuLCB6bm9kZS0+cGFyZW50LCB6
bm9kZS0+aWlwLCB6bm9kZS0+bGV2ZWwsCiAJICAgICAgIHpub2RlLT5jaGlsZF9jbnQsIHpub2Rl
LT5mbGFncyk7CkBAIC04OTMsOTMgKzk0Miw5NyBAQAogCQlyZXR1cm47CiAJfQogCi0JcHJpbnRr
KEtFUk5fREVCVUcgInpicmFuY2hlczpcbiIpOworCXByaW50ayhLRVJOX0VSUiAiemJyYW5jaGVz
OlxuIik7CiAJZm9yIChuID0gMDsgbiA8IHpub2RlLT5jaGlsZF9jbnQ7IG4rKykgewogCQl6YnIg
PSAmem5vZGUtPnpicmFuY2hbbl07CiAJCWlmICh6bm9kZS0+bGV2ZWwgPiAwKQotCQkJcHJpbnRr
KEtFUk5fREVCVUcgIlx0JWQ6IHpub2RlICVwIExFQiAlZDolZCBsZW4gJWQga2V5ICIKKwkJCXBy
aW50ayhLRVJOX0VSUiAiXHQlZDogem5vZGUgJXAgTEVCICVkOiVkIGxlbiAlZCBrZXkgIgogCQkJ
CQkgICIlc1xuIiwgbiwgemJyLT56bm9kZSwgemJyLT5sbnVtLAogCQkJCQkgIHpici0+b2Zmcywg
emJyLT5sZW4sCi0JCQkJCSAgREJHS0VZKCZ6YnItPmtleSkpOworCQkJCQkgIGRiZ19zbnByaW50
Zl9rZXkoYywgJnpici0+a2V5LAorCQkJCQkJCSAgIGtleV9idWYsCisJCQkJCQkJICAgREJHX0tF
WV9CVUZfTEVOKSk7CiAJCWVsc2UKLQkJCXByaW50ayhLRVJOX0RFQlVHICJcdCVkOiBMTkMgJXAg
TEVCICVkOiVkIGxlbiAlZCBrZXkgIgorCQkJcHJpbnRrKEtFUk5fRVJSICJcdCVkOiBMTkMgJXAg
TEVCICVkOiVkIGxlbiAlZCBrZXkgIgogCQkJCQkgICIlc1xuIiwgbiwgemJyLT56bm9kZSwgemJy
LT5sbnVtLAogCQkJCQkgIHpici0+b2ZmcywgemJyLT5sZW4sCi0JCQkJCSAgREJHS0VZKCZ6YnIt
PmtleSkpOworCQkJCQkgIGRiZ19zbnByaW50Zl9rZXkoYywgJnpici0+a2V5LAorCQkJCQkJCSAg
IGtleV9idWYsCisJCQkJCQkJICAgREJHX0tFWV9CVUZfTEVOKSk7CiAJfQogCXNwaW5fdW5sb2Nr
KCZkYmdfbG9jayk7CiB9CiAKLXZvaWQgZGJnX2R1bXBfaGVhcChzdHJ1Y3QgdWJpZnNfaW5mbyAq
Yywgc3RydWN0IHViaWZzX2xwdF9oZWFwICpoZWFwLCBpbnQgY2F0KQordm9pZCB1Ymlmc19kdW1w
X2hlYXAoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCB1Ymlmc19scHRfaGVhcCAqaGVhcCwg
aW50IGNhdCkKIHsKIAlpbnQgaTsKIAotCXByaW50ayhLRVJOX0RFQlVHICIocGlkICVkKSBzdGFy
dCBkdW1waW5nIGhlYXAgY2F0ICVkICglZCBlbGVtZW50cylcbiIsCisJcHJpbnRrKEtFUk5fRVJS
ICIocGlkICVkKSBzdGFydCBkdW1waW5nIGhlYXAgY2F0ICVkICglZCBlbGVtZW50cylcbiIsCiAJ
ICAgICAgIGN1cnJlbnQtPnBpZCwgY2F0LCBoZWFwLT5jbnQpOwogCWZvciAoaSA9IDA7IGkgPCBo
ZWFwLT5jbnQ7IGkrKykgewogCQlzdHJ1Y3QgdWJpZnNfbHByb3BzICpscHJvcHMgPSBoZWFwLT5h
cnJbaV07CiAKLQkJcHJpbnRrKEtFUk5fREVCVUcgIlx0JWQuIExFQiAlZCBocG9zICVkIGZyZWUg
JWQgZGlydHkgJWQgIgorCQlwcmludGsoS0VSTl9FUlIgIlx0JWQuIExFQiAlZCBocG9zICVkIGZy
ZWUgJWQgZGlydHkgJWQgIgogCQkgICAgICAgImZsYWdzICVkXG4iLCBpLCBscHJvcHMtPmxudW0s
IGxwcm9wcy0+aHBvcywKIAkJICAgICAgIGxwcm9wcy0+ZnJlZSwgbHByb3BzLT5kaXJ0eSwgbHBy
b3BzLT5mbGFncyk7CiAJfQotCXByaW50ayhLRVJOX0RFQlVHICIocGlkICVkKSBmaW5pc2ggZHVt
cGluZyBoZWFwXG4iLCBjdXJyZW50LT5waWQpOworCXByaW50ayhLRVJOX0VSUiAiKHBpZCAlZCkg
ZmluaXNoIGR1bXBpbmcgaGVhcFxuIiwgY3VycmVudC0+cGlkKTsKIH0KIAotdm9pZCBkYmdfZHVt
cF9wbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHViaWZzX3Bub2RlICpwbm9kZSwK
LQkJICAgIHN0cnVjdCB1Ymlmc19ubm9kZSAqcGFyZW50LCBpbnQgaWlwKQordm9pZCB1Ymlmc19k
dW1wX3Bub2RlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgdWJpZnNfcG5vZGUgKnBub2Rl
LAorCQkgICAgICBzdHJ1Y3QgdWJpZnNfbm5vZGUgKnBhcmVudCwgaW50IGlpcCkKIHsKIAlpbnQg
aTsKIAotCXByaW50ayhLRVJOX0RFQlVHICIocGlkICVkKSBkdW1waW5nIHBub2RlOlxuIiwgY3Vy
cmVudC0+cGlkKTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRhZGRyZXNzICV6eCBwYXJlbnQgJXp4
IGNuZXh0ICV6eFxuIiwKKwlwcmludGsoS0VSTl9FUlIgIihwaWQgJWQpIGR1bXBpbmcgcG5vZGU6
XG4iLCBjdXJyZW50LT5waWQpOworCXByaW50ayhLRVJOX0VSUiAiXHRhZGRyZXNzICV6eCBwYXJl
bnQgJXp4IGNuZXh0ICV6eFxuIiwKIAkgICAgICAgKHNpemVfdClwbm9kZSwgKHNpemVfdClwYXJl
bnQsIChzaXplX3QpcG5vZGUtPmNuZXh0KTsKLQlwcmludGsoS0VSTl9ERUJVRyAiXHRmbGFncyAl
bHUgaWlwICVkIGxldmVsICVkIG51bSAlZFxuIiwKKwlwcmludGsoS0VSTl9FUlIgIlx0ZmxhZ3Mg
JWx1IGlpcCAlZCBsZXZlbCAlZCBudW0gJWRcbiIsCiAJICAgICAgIHBub2RlLT5mbGFncywgaWlw
LCBwbm9kZS0+bGV2ZWwsIHBub2RlLT5udW0pOwogCWZvciAoaSA9IDA7IGkgPCBVQklGU19MUFRf
RkFOT1VUOyBpKyspIHsKIAkJc3RydWN0IHViaWZzX2xwcm9wcyAqbHAgPSAmcG5vZGUtPmxwcm9w
c1tpXTsKIAotCQlwcmludGsoS0VSTl9ERUJVRyAiXHQlZDogZnJlZSAlZCBkaXJ0eSAlZCBmbGFn
cyAlZCBsbnVtICVkXG4iLAorCQlwcmludGsoS0VSTl9FUlIgIlx0JWQ6IGZyZWUgJWQgZGlydHkg
JWQgZmxhZ3MgJWQgbG51bSAlZFxuIiwKIAkJICAgICAgIGksIGxwLT5mcmVlLCBscC0+ZGlydHks
IGxwLT5mbGFncywgbHAtPmxudW0pOwogCX0KIH0KIAotdm9pZCBkYmdfZHVtcF90bmMoc3RydWN0
IHViaWZzX2luZm8gKmMpCit2b2lkIHViaWZzX2R1bXBfdG5jKHN0cnVjdCB1Ymlmc19pbmZvICpj
KQogewogCXN0cnVjdCB1Ymlmc196bm9kZSAqem5vZGU7CiAJaW50IGxldmVsOwogCi0JcHJpbnRr
KEtFUk5fREVCVUcgIlxuIik7Ci0JcHJpbnRrKEtFUk5fREVCVUcgIihwaWQgJWQpIHN0YXJ0IGR1
bXBpbmcgVE5DIHRyZWVcbiIsIGN1cnJlbnQtPnBpZCk7CisJcHJpbnRrKEtFUk5fRVJSICJcbiIp
OworCXByaW50ayhLRVJOX0VSUiAiKHBpZCAlZCkgc3RhcnQgZHVtcGluZyBUTkMgdHJlZVxuIiwg
Y3VycmVudC0+cGlkKTsKIAl6bm9kZSA9IHViaWZzX3RuY19sZXZlbG9yZGVyX25leHQoYy0+enJv
b3Quem5vZGUsIE5VTEwpOwogCWxldmVsID0gem5vZGUtPmxldmVsOwotCXByaW50ayhLRVJOX0RF
QlVHICI9PSBMZXZlbCAlZCA9PVxuIiwgbGV2ZWwpOworCXByaW50ayhLRVJOX0VSUiAiPT0gTGV2
ZWwgJWQgPT1cbiIsIGxldmVsKTsKIAl3aGlsZSAoem5vZGUpIHsKIAkJaWYgKGxldmVsICE9IHpu
b2RlLT5sZXZlbCkgewogCQkJbGV2ZWwgPSB6bm9kZS0+bGV2ZWw7Ci0JCQlwcmludGsoS0VSTl9E
RUJVRyAiPT0gTGV2ZWwgJWQgPT1cbiIsIGxldmVsKTsKKwkJCXByaW50ayhLRVJOX0VSUiAiPT0g
TGV2ZWwgJWQgPT1cbiIsIGxldmVsKTsKIAkJfQotCQlkYmdfZHVtcF96bm9kZShjLCB6bm9kZSk7
CisJCXViaWZzX2R1bXBfem5vZGUoYywgem5vZGUpOwogCQl6bm9kZSA9IHViaWZzX3RuY19sZXZl
bG9yZGVyX25leHQoYy0+enJvb3Quem5vZGUsIHpub2RlKTsKIAl9Ci0JcHJpbnRrKEtFUk5fREVC
VUcgIihwaWQgJWQpIGZpbmlzaCBkdW1waW5nIFROQyB0cmVlXG4iLCBjdXJyZW50LT5waWQpOwor
CXByaW50ayhLRVJOX0VSUiAiKHBpZCAlZCkgZmluaXNoIGR1bXBpbmcgVE5DIHRyZWVcbiIsIGN1
cnJlbnQtPnBpZCk7CiB9CiAKIHN0YXRpYyBpbnQgZHVtcF96bm9kZShzdHJ1Y3QgdWJpZnNfaW5m
byAqYywgc3RydWN0IHViaWZzX3pub2RlICp6bm9kZSwKIAkJICAgICAgdm9pZCAqcHJpdikKIHsK
LQlkYmdfZHVtcF96bm9kZShjLCB6bm9kZSk7CisJdWJpZnNfZHVtcF96bm9kZShjLCB6bm9kZSk7
CiAJcmV0dXJuIDA7CiB9CiAKIC8qKgotICogZGJnX2R1bXBfaW5kZXggLSBkdW1wIHRoZSBvbi1m
bGFzaCBpbmRleC4KKyAqIHViaWZzX2R1bXBfaW5kZXggLSBkdW1wIHRoZSBvbi1mbGFzaCBpbmRl
eC4KICAqIEBjOiBVQklGUyBmaWxlLXN5c3RlbSBkZXNjcmlwdGlvbiBvYmplY3QKICAqCi0gKiBU
aGlzIGZ1bmN0aW9uIGR1bXBzIHdob2xlIFVCSUZTIGluZGV4aW5nIEItdHJlZSwgdW5saWtlICdk
YmdfZHVtcF90bmMoKScKKyAqIFRoaXMgZnVuY3Rpb24gZHVtcHMgd2hvbGUgVUJJRlMgaW5kZXhp
bmcgQi10cmVlLCB1bmxpa2UgJ3ViaWZzX2R1bXBfdG5jKCknCiAgKiB3aGljaCBkdW1wcyBvbmx5
IGluLW1lbW9yeSB6bm9kZXMgYW5kIGRvZXMgbm90IHJlYWQgem5vZGVzIHdoaWNoIGZyb20gZmxh
c2guCiAgKi8KLXZvaWQgZGJnX2R1bXBfaW5kZXgoc3RydWN0IHViaWZzX2luZm8gKmMpCit2b2lk
IHViaWZzX2R1bXBfaW5kZXgoc3RydWN0IHViaWZzX2luZm8gKmMpCiB7CiAJZGJnX3dhbGtfaW5k
ZXgoYywgTlVMTCwgZHVtcF96bm9kZSwgTlVMTCk7CiB9CkBAIC0xMDY1LDIxICsxMTE4LDIyIEBA
CiAKIG91dDoKIAl1Ymlmc19tc2coInNhdmVkIGxwcm9wcyBzdGF0aXN0aWNzIGR1bXAiKTsKLQlk
YmdfZHVtcF9sc3RhdHMoJmQtPnNhdmVkX2xzdCk7CisJdWJpZnNfZHVtcF9sc3RhdHMoJmQtPnNh
dmVkX2xzdCk7CiAJdWJpZnNfbXNnKCJzYXZlZCBidWRnZXRpbmcgaW5mbyBkdW1wIik7Ci0JZGJn
X2R1bXBfYnVkZyhjLCAmZC0+c2F2ZWRfYmkpOworCXViaWZzX2R1bXBfYnVkZyhjLCAmZC0+c2F2
ZWRfYmkpOwogCXViaWZzX21zZygic2F2ZWQgaWR4X2djX2NudCAlZCIsIGQtPnNhdmVkX2lkeF9n
Y19jbnQpOwogCXViaWZzX21zZygiY3VycmVudCBscHJvcHMgc3RhdGlzdGljcyBkdW1wIik7CiAJ
dWJpZnNfZ2V0X2xwX3N0YXRzKGMsICZsc3QpOwotCWRiZ19kdW1wX2xzdGF0cygmbHN0KTsKKwl1
Ymlmc19kdW1wX2xzdGF0cygmbHN0KTsKIAl1Ymlmc19tc2coImN1cnJlbnQgYnVkZ2V0aW5nIGlu
Zm8gZHVtcCIpOwotCWRiZ19kdW1wX2J1ZGcoYywgJmMtPmJpKTsKKwl1Ymlmc19kdW1wX2J1ZGco
YywgJmMtPmJpKTsKIAlkdW1wX3N0YWNrKCk7CiAJcmV0dXJuIC1FSU5WQUw7CiB9CiAKIC8qKgog
ICogZGJnX2NoZWNrX3N5bmNlZF9pX3NpemUgLSBjaGVjayBzeW5jaHJvbml6ZWQgaW5vZGUgc2l6
ZS4KKyAqIEBjOiBVQklGUyBmaWxlLXN5c3RlbSBkZXNjcmlwdGlvbiBvYmplY3QKICAqIEBpbm9k
ZTogaW5vZGUgdG8gY2hlY2sKICAqCiAgKiBJZiBpbm9kZSBpcyBjbGVhbiwgc3luY2hyb25pemVk
IGlub2RlIHNpemUgaGFzIHRvIGJlIGVxdWl2YWxlbnQgdG8gY3VycmVudApAQCAtMTA4NywxMiAr
MTE0MSwxMiBAQAogICogaGFzIHRvIGJlIGxvY2tlZCkuIFJldHVybnMgJTAgaWYgc3luY2hyb25p
emVkIGlub2RlIHNpemUgaWYgY29ycmVjdCwgYW5kCiAgKiAlLUVJTlZBTCBpZiBub3QuCiAgKi8K
LWludCBkYmdfY2hlY2tfc3luY2VkX2lfc2l6ZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQoraW50IGRi
Z19jaGVja19zeW5jZWRfaV9zaXplKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3Qg
aW5vZGUgKmlub2RlKQogewogCWludCBlcnIgPSAwOwogCXN0cnVjdCB1Ymlmc19pbm9kZSAqdWkg
PSB1Ymlmc19pbm9kZShpbm9kZSk7CiAKLQlpZiAoISh1Ymlmc19jaGtfZmxhZ3MgJiBVQklGU19D
SEtfR0VOKSkKKwlpZiAoIWRiZ19pc19jaGtfZ2VuKGMpKQogCQlyZXR1cm4gMDsKIAlpZiAoIVNf
SVNSRUcoaW5vZGUtPmlfbW9kZSkpCiAJCXJldHVybiAwOwpAQCAtMTEwNCw3ICsxMTU4LDcgQEAK
IAkJCSAgImlzIGNsZWFuIiwgdWktPnVpX3NpemUsIHVpLT5zeW5jZWRfaV9zaXplKTsKIAkJdWJp
ZnNfZXJyKCJpX2lubyAlbHUsIGlfbW9kZSAlI3gsIGlfc2l6ZSAlbGxkIiwgaW5vZGUtPmlfaW5v
LAogCQkJICBpbm9kZS0+aV9tb2RlLCBpX3NpemVfcmVhZChpbm9kZSkpOwotCQlkYmdfZHVtcF9z
dGFjaygpOworCQlkdW1wX3N0YWNrKCk7CiAJCWVyciA9IC1FSU5WQUw7CiAJfQogCXNwaW5fdW5s
b2NrKCZ1aS0+dWlfbG9jayk7CkBAIC0xMTI1LDcgKzExNzksNyBAQAogICogTm90ZSwgaXQgaXMg
Z29vZCBpZGVhIHRvIG1ha2Ugc3VyZSB0aGUgQGRpci0+aV9tdXRleCBpcyBsb2NrZWQgYmVmb3Jl
CiAgKiBjYWxsaW5nIHRoaXMgZnVuY3Rpb24uCiAgKi8KLWludCBkYmdfY2hlY2tfZGlyX3NpemUo
c3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCBpbm9kZSAqZGlyKQoraW50IGRiZ19j
aGVja19kaXIoc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCBpbm9kZSAqZGlyKQog
ewogCXVuc2lnbmVkIGludCBubGluayA9IDI7CiAJdW5pb24gdWJpZnNfa2V5IGtleTsKQEAgLTEx
MzMsNyArMTE4Nyw3IEBACiAJc3RydWN0IHFzdHIgbm0gPSB7IC5uYW1lID0gTlVMTCB9OwogCWxv
ZmZfdCBzaXplID0gVUJJRlNfSU5PX05PREVfU1o7CiAKLQlpZiAoISh1Ymlmc19jaGtfZmxhZ3Mg
JiBVQklGU19DSEtfR0VOKSkKKwlpZiAoIWRiZ19pc19jaGtfZ2VuKGMpKQogCQlyZXR1cm4gMDsK
IAogCWlmICghU19JU0RJUihkaXItPmlfbW9kZSkpCkBAIC0xMTY3LDEyICsxMjIxLDE0IEBACiAJ
CQkgICJidXQgY2FsY3VsYXRlZCBzaXplIGlzICVsbHUiLCBkaXItPmlfaW5vLAogCQkJICAodW5z
aWduZWQgbG9uZyBsb25nKWlfc2l6ZV9yZWFkKGRpciksCiAJCQkgICh1bnNpZ25lZCBsb25nIGxv
bmcpc2l6ZSk7CisJCXViaWZzX2R1bXBfaW5vZGUoYywgZGlyKTsKIAkJZHVtcF9zdGFjaygpOwog
CQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAJaWYgKGRpci0+aV9ubGluayAhPSBubGluaykgewogCQl1
Ymlmc19lcnIoImRpcmVjdG9yeSBpbm9kZSAlbHUgaGFzIG5saW5rICV1LCBidXQgY2FsY3VsYXRl
ZCAiCiAJCQkgICJubGluayBpcyAldSIsIGRpci0+aV9pbm8sIGRpci0+aV9ubGluaywgbmxpbmsp
OworCQl1Ymlmc19kdW1wX2lub2RlKGMsIGRpcik7CiAJCWR1bXBfc3RhY2soKTsKIAkJcmV0dXJu
IC1FSU5WQUw7CiAJfQpAQCAtMTE5OSw2ICsxMjU1LDcgQEAKIAlpbnQgZXJyLCBubGVuMSwgbmxl
bjIsIGNtcDsKIAlzdHJ1Y3QgdWJpZnNfZGVudF9ub2RlICpkZW50MSwgKmRlbnQyOwogCXVuaW9u
IHViaWZzX2tleSBrZXk7CisJY2hhciBrZXlfYnVmW0RCR19LRVlfQlVGX0xFTl07CiAKIAl1Ymlm
c19hc3NlcnQoIWtleXNfY21wKGMsICZ6YnIxLT5rZXksICZ6YnIyLT5rZXkpKTsKIAlkZW50MSA9
IGttYWxsb2MoVUJJRlNfTUFYX0RFTlRfTk9ERV9TWiwgR0ZQX05PRlMpOwpAQCAtMTIyOCwyMSAr
MTI4NSwyNSBAQAogCWVyciA9IDE7CiAJa2V5X3JlYWQoYywgJmRlbnQxLT5rZXksICZrZXkpOwog
CWlmIChrZXlzX2NtcChjLCAmemJyMS0+a2V5LCAma2V5KSkgewotCQlkYmdfZXJyKCIxc3QgZW50
cnkgYXQgJWQ6JWQgaGFzIGtleSAlcyIsIHpicjEtPmxudW0sCi0JCQl6YnIxLT5vZmZzLCBEQkdL
RVkoJmtleSkpOwotCQlkYmdfZXJyKCJidXQgaXQgc2hvdWxkIGhhdmUga2V5ICVzIGFjY29yZGlu
ZyB0byB0bmMiLAotCQkJREJHS0VZKCZ6YnIxLT5rZXkpKTsKLQkJZGJnX2R1bXBfbm9kZShjLCBk
ZW50MSk7CisJCXViaWZzX2VycigiMXN0IGVudHJ5IGF0ICVkOiVkIGhhcyBrZXkgJXMiLCB6YnIx
LT5sbnVtLAorCQkJICB6YnIxLT5vZmZzLCBkYmdfc25wcmludGZfa2V5KGMsICZrZXksIGtleV9i
dWYsCisJCQkJCQkgICAgICAgREJHX0tFWV9CVUZfTEVOKSk7CisJCXViaWZzX2VycigiYnV0IGl0
IHNob3VsZCBoYXZlIGtleSAlcyBhY2NvcmRpbmcgdG8gdG5jIiwKKwkJCSAgZGJnX3NucHJpbnRm
X2tleShjLCAmemJyMS0+a2V5LCBrZXlfYnVmLAorCQkJCQkgICBEQkdfS0VZX0JVRl9MRU4pKTsK
KwkJdWJpZnNfZHVtcF9ub2RlKGMsIGRlbnQxKTsKIAkJZ290byBvdXRfZnJlZTsKIAl9CiAKIAlr
ZXlfcmVhZChjLCAmZGVudDItPmtleSwgJmtleSk7CiAJaWYgKGtleXNfY21wKGMsICZ6YnIyLT5r
ZXksICZrZXkpKSB7Ci0JCWRiZ19lcnIoIjJuZCBlbnRyeSBhdCAlZDolZCBoYXMga2V5ICVzIiwg
emJyMS0+bG51bSwKLQkJCXpicjEtPm9mZnMsIERCR0tFWSgma2V5KSk7Ci0JCWRiZ19lcnIoImJ1
dCBpdCBzaG91bGQgaGF2ZSBrZXkgJXMgYWNjb3JkaW5nIHRvIHRuYyIsCi0JCQlEQkdLRVkoJnpi
cjItPmtleSkpOwotCQlkYmdfZHVtcF9ub2RlKGMsIGRlbnQyKTsKKwkJdWJpZnNfZXJyKCIybmQg
ZW50cnkgYXQgJWQ6JWQgaGFzIGtleSAlcyIsIHpicjEtPmxudW0sCisJCQkgIHpicjEtPm9mZnMs
IGRiZ19zbnByaW50Zl9rZXkoYywgJmtleSwga2V5X2J1ZiwKKwkJCQkJCSAgICAgICBEQkdfS0VZ
X0JVRl9MRU4pKTsKKwkJdWJpZnNfZXJyKCJidXQgaXQgc2hvdWxkIGhhdmUga2V5ICVzIGFjY29y
ZGluZyB0byB0bmMiLAorCQkJICBkYmdfc25wcmludGZfa2V5KGMsICZ6YnIyLT5rZXksIGtleV9i
dWYsCisJCQkJCSAgIERCR19LRVlfQlVGX0xFTikpOworCQl1Ymlmc19kdW1wX25vZGUoYywgZGVu
dDIpOwogCQlnb3RvIG91dF9mcmVlOwogCX0KIApAQCAtMTI1NSwxNSArMTMxNiwxNSBAQAogCQln
b3RvIG91dF9mcmVlOwogCX0KIAlpZiAoY21wID09IDAgJiYgbmxlbjEgPT0gbmxlbjIpCi0JCWRi
Z19lcnIoIjIgeGVudC9kZW50IG5vZGVzIHdpdGggdGhlIHNhbWUgbmFtZSIpOworCQl1Ymlmc19l
cnIoIjIgeGVudC9kZW50IG5vZGVzIHdpdGggdGhlIHNhbWUgbmFtZSIpOwogCWVsc2UKLQkJZGJn
X2VycigiYmFkIG9yZGVyIG9mIGNvbGxpZGluZyBrZXkgJXMiLAotCQkJREJHS0VZKCZrZXkpKTsK
KwkJdWJpZnNfZXJyKCJiYWQgb3JkZXIgb2YgY29sbGlkaW5nIGtleSAlcyIsCisJCQkgIGRiZ19z
bnByaW50Zl9rZXkoYywgJmtleSwga2V5X2J1ZiwgREJHX0tFWV9CVUZfTEVOKSk7CiAKIAl1Ymlm
c19tc2coImZpcnN0IG5vZGUgYXQgJWQ6JWRcbiIsIHpicjEtPmxudW0sIHpicjEtPm9mZnMpOwot
CWRiZ19kdW1wX25vZGUoYywgZGVudDEpOworCXViaWZzX2R1bXBfbm9kZShjLCBkZW50MSk7CiAJ
dWJpZnNfbXNnKCJzZWNvbmQgbm9kZSBhdCAlZDolZFxuIiwgemJyMi0+bG51bSwgemJyMi0+b2Zm
cyk7Ci0JZGJnX2R1bXBfbm9kZShjLCBkZW50Mik7CisJdWJpZnNfZHVtcF9ub2RlKGMsIGRlbnQy
KTsKIAogb3V0X2ZyZWU6CiAJa2ZyZWUoZGVudDIpOwpAQCAtMTQ2NiwxMCArMTUyNywxMCBAQAog
b3V0OgogCXViaWZzX2VycigiZmFpbGVkLCBlcnJvciAlZCIsIGVycik7CiAJdWJpZnNfbXNnKCJk
dW1wIG9mIHRoZSB6bm9kZSIpOwotCWRiZ19kdW1wX3pub2RlKGMsIHpub2RlKTsKKwl1Ymlmc19k
dW1wX3pub2RlKGMsIHpub2RlKTsKIAlpZiAoenApIHsKIAkJdWJpZnNfbXNnKCJkdW1wIG9mIHRo
ZSBwYXJlbnQgem5vZGUiKTsKLQkJZGJnX2R1bXBfem5vZGUoYywgenApOworCQl1Ymlmc19kdW1w
X3pub2RlKGMsIHpwKTsKIAl9CiAJZHVtcF9zdGFjaygpOwogCXJldHVybiAtRUlOVkFMOwpAQCAt
MTQ4OSw3ICsxNTUwLDcgQEAKIAlsb25nIGNsZWFuX2NudCA9IDAsIGRpcnR5X2NudCA9IDA7CiAJ
aW50IGVyciwgbGFzdDsKIAotCWlmICghKHViaWZzX2Noa19mbGFncyAmIFVCSUZTX0NIS19UTkMp
KQorCWlmICghZGJnX2lzX2Noa19pbmRleChjKSkKIAkJcmV0dXJuIDA7CiAKIAl1Ymlmc19hc3Nl
cnQobXV0ZXhfaXNfbG9ja2VkKCZjLT50bmNfbXV0ZXgpKTsKQEAgLTE1MzYsOSArMTU5Nyw5IEBA
CiAJCQkJcmV0dXJuIGVycjsKIAkJCWlmIChlcnIpIHsKIAkJCQl1Ymlmc19tc2coImZpcnN0IHpu
b2RlIik7Ci0JCQkJZGJnX2R1bXBfem5vZGUoYywgcHJldik7CisJCQkJdWJpZnNfZHVtcF96bm9k
ZShjLCBwcmV2KTsKIAkJCQl1Ymlmc19tc2coInNlY29uZCB6bm9kZSIpOwotCQkJCWRiZ19kdW1w
X3pub2RlKGMsIHpub2RlKTsKKwkJCQl1Ymlmc19kdW1wX3pub2RlKGMsIHpub2RlKTsKIAkJCQly
ZXR1cm4gLUVJTlZBTDsKIAkJCX0KIAkJfQpAQCAtMTYyNyw3ICsxNjg4LDcgQEAKIAkJCWlmIChl
cnIpIHsKIAkJCQl1Ymlmc19lcnIoInpub2RlIGNoZWNraW5nIGZ1bmN0aW9uIHJldHVybmVkICIK
IAkJCQkJICAiZXJyb3IgJWQiLCBlcnIpOwotCQkJCWRiZ19kdW1wX3pub2RlKGMsIHpub2RlKTsK
KwkJCQl1Ymlmc19kdW1wX3pub2RlKGMsIHpub2RlKTsKIAkJCQlnb3RvIG91dF9kdW1wOwogCQkJ
fQogCQl9CkBAIC0xNjk1LDcgKzE3NTYsNyBAQAogCWVsc2UKIAkJemJyID0gJmMtPnpyb290Owog
CXViaWZzX21zZygiZHVtcCBvZiB6bm9kZSBhdCBMRUIgJWQ6JWQiLCB6YnItPmxudW0sIHpici0+
b2Zmcyk7Ci0JZGJnX2R1bXBfem5vZGUoYywgem5vZGUpOworCXViaWZzX2R1bXBfem5vZGUoYywg
em5vZGUpOwogb3V0X3VubG9jazoKIAltdXRleF91bmxvY2soJmMtPnRuY19tdXRleCk7CiAJcmV0
dXJuIGVycjsKQEAgLTE3MzYsNyArMTc5Nyw3IEBACiAJaW50IGVycjsKIAlsb25nIGxvbmcgY2Fs
YyA9IDA7CiAKLQlpZiAoISh1Ymlmc19jaGtfZmxhZ3MgJiBVQklGU19DSEtfSURYX1NaKSkKKwlp
ZiAoIWRiZ19pc19jaGtfaW5kZXgoYykpCiAJCXJldHVybiAwOwogCiAJZXJyID0gZGJnX3dhbGtf
aW5kZXgoYywgTlVMTCwgYWRkX3NpemUsICZjYWxjKTsKQEAgLTIxMzEsNyArMjE5Miw3IEBACiAK
IG91dF9kdW1wOgogCXViaWZzX21zZygiZHVtcCBvZiBub2RlIGF0IExFQiAlZDolZCIsIHpici0+
bG51bSwgemJyLT5vZmZzKTsKLQlkYmdfZHVtcF9ub2RlKGMsIG5vZGUpOworCXViaWZzX2R1bXBf
bm9kZShjLCBub2RlKTsKIG91dF9mcmVlOgogCWtmcmVlKG5vZGUpOwogCXJldHVybiBlcnI7CkBA
IC0yMjg5LDcgKzIzNTAsNyBAQAogCiAJdWJpZnNfbXNnKCJkdW1wIG9mIHRoZSBpbm9kZSAlbHUg
c2l0dGluZyBpbiBMRUIgJWQ6JWQiLAogCQkgICh1bnNpZ25lZCBsb25nKWZzY2tpLT5pbnVtLCB6
YnItPmxudW0sIHpici0+b2Zmcyk7Ci0JZGJnX2R1bXBfbm9kZShjLCBpbm8pOworCXViaWZzX2R1
bXBfbm9kZShjLCBpbm8pOwogCWtmcmVlKGlubyk7CiAJcmV0dXJuIC1FSU5WQUw7CiB9CkBAIC0y
MzEyLDcgKzIzNzMsNyBAQAogCWludCBlcnI7CiAJc3RydWN0IGZzY2tfZGF0YSBmc2NrZDsKIAot
CWlmICghKHViaWZzX2Noa19mbGFncyAmIFVCSUZTX0NIS19GUykpCisJaWYgKCFkYmdfaXNfY2hr
X2ZzKGMpKQogCQlyZXR1cm4gMDsKIAogCWZzY2tkLmlub2RlcyA9IFJCX1JPT1Q7CkBAIC0yMzQ3
LDcgKzI0MDgsNyBAQAogCXN0cnVjdCBsaXN0X2hlYWQgKmN1cjsKIAlzdHJ1Y3QgdWJpZnNfc2Nh
bl9ub2RlICpzYSwgKnNiOwogCi0JaWYgKCEodWJpZnNfY2hrX2ZsYWdzICYgVUJJRlNfQ0hLX0dF
TikpCisJaWYgKCFkYmdfaXNfY2hrX2dlbihjKSkKIAkJcmV0dXJuIDA7CiAKIAlmb3IgKGN1ciA9
IGhlYWQtPm5leHQ7IGN1ci0+bmV4dCAhPSBoZWFkOyBjdXIgPSBjdXItPm5leHQpIHsKQEAgLTIz
NjAsMTIgKzI0MjEsMTIgQEAKIAogCQlpZiAoc2EtPnR5cGUgIT0gVUJJRlNfREFUQV9OT0RFKSB7
CiAJCQl1Ymlmc19lcnIoImJhZCBub2RlIHR5cGUgJWQiLCBzYS0+dHlwZSk7Ci0JCQlkYmdfZHVt
cF9ub2RlKGMsIHNhLT5ub2RlKTsKKwkJCXViaWZzX2R1bXBfbm9kZShjLCBzYS0+bm9kZSk7CiAJ
CQlyZXR1cm4gLUVJTlZBTDsKIAkJfQogCQlpZiAoc2ItPnR5cGUgIT0gVUJJRlNfREFUQV9OT0RF
KSB7CiAJCQl1Ymlmc19lcnIoImJhZCBub2RlIHR5cGUgJWQiLCBzYi0+dHlwZSk7Ci0JCQlkYmdf
ZHVtcF9ub2RlKGMsIHNiLT5ub2RlKTsKKwkJCXViaWZzX2R1bXBfbm9kZShjLCBzYi0+bm9kZSk7
CiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJfQogCkBAIC0yMzk2LDggKzI0NTcsOCBAQAogCXJldHVy
biAwOwogCiBlcnJvcl9kdW1wOgotCWRiZ19kdW1wX25vZGUoYywgc2EtPm5vZGUpOwotCWRiZ19k
dW1wX25vZGUoYywgc2ItPm5vZGUpOworCXViaWZzX2R1bXBfbm9kZShjLCBzYS0+bm9kZSk7CisJ
dWJpZnNfZHVtcF9ub2RlKGMsIHNiLT5ub2RlKTsKIAlyZXR1cm4gLUVJTlZBTDsKIH0KIApAQCAt
MjQxNCw3ICsyNDc1LDcgQEAKIAlzdHJ1Y3QgbGlzdF9oZWFkICpjdXI7CiAJc3RydWN0IHViaWZz
X3NjYW5fbm9kZSAqc2EsICpzYjsKIAotCWlmICghKHViaWZzX2Noa19mbGFncyAmIFVCSUZTX0NI
S19HRU4pKQorCWlmICghZGJnX2lzX2Noa19nZW4oYykpCiAJCXJldHVybiAwOwogCiAJZm9yIChj
dXIgPSBoZWFkLT5uZXh0OyBjdXItPm5leHQgIT0gaGVhZDsgY3VyID0gY3VyLT5uZXh0KSB7CkBA
IC0yNDI4LDEzICsyNDg5LDEzIEBACiAJCWlmIChzYS0+dHlwZSAhPSBVQklGU19JTk9fTk9ERSAm
JiBzYS0+dHlwZSAhPSBVQklGU19ERU5UX05PREUgJiYKIAkJICAgIHNhLT50eXBlICE9IFVCSUZT
X1hFTlRfTk9ERSkgewogCQkJdWJpZnNfZXJyKCJiYWQgbm9kZSB0eXBlICVkIiwgc2EtPnR5cGUp
OwotCQkJZGJnX2R1bXBfbm9kZShjLCBzYS0+bm9kZSk7CisJCQl1Ymlmc19kdW1wX25vZGUoYywg
c2EtPm5vZGUpOwogCQkJcmV0dXJuIC1FSU5WQUw7CiAJCX0KIAkJaWYgKHNhLT50eXBlICE9IFVC
SUZTX0lOT19OT0RFICYmIHNhLT50eXBlICE9IFVCSUZTX0RFTlRfTk9ERSAmJgogCQkgICAgc2Et
PnR5cGUgIT0gVUJJRlNfWEVOVF9OT0RFKSB7CiAJCQl1Ymlmc19lcnIoImJhZCBub2RlIHR5cGUg
JWQiLCBzYi0+dHlwZSk7Ci0JCQlkYmdfZHVtcF9ub2RlKGMsIHNiLT5ub2RlKTsKKwkJCXViaWZz
X2R1bXBfbm9kZShjLCBzYi0+bm9kZSk7CiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJfQogCkBAIC0y
NDg0LDIyMSArMjU0NSwxNDggQEAKIAogZXJyb3JfZHVtcDoKIAl1Ymlmc19tc2coImR1bXBpbmcg
Zmlyc3Qgbm9kZSIpOwotCWRiZ19kdW1wX25vZGUoYywgc2EtPm5vZGUpOworCXViaWZzX2R1bXBf
bm9kZShjLCBzYS0+bm9kZSk7CiAJdWJpZnNfbXNnKCJkdW1waW5nIHNlY29uZCBub2RlIik7Ci0J
ZGJnX2R1bXBfbm9kZShjLCBzYi0+bm9kZSk7CisJdWJpZnNfZHVtcF9ub2RlKGMsIHNiLT5ub2Rl
KTsKIAlyZXR1cm4gLUVJTlZBTDsKIAlyZXR1cm4gMDsKIH0KIAotaW50IGRiZ19mb3JjZV9pbl90
aGVfZ2Fwcyh2b2lkKQotewotCWlmICghKHViaWZzX2Noa19mbGFncyAmIFVCSUZTX0NIS19HRU4p
KQotCQlyZXR1cm4gMDsKLQotCXJldHVybiAhKHJhbmRvbTMyKCkgJiA3KTsKLX0KLQotLyogRmFp
bHVyZSBtb2RlIGZvciByZWNvdmVyeSB0ZXN0aW5nICovCi0KLSNkZWZpbmUgY2hhbmNlKG4sIGQp
IChzaW1wbGVfcmFuZCgpIDw9IChuKSAqIDMyNzY4TEwgLyAoZCkpCi0KLXN0cnVjdCBmYWlsdXJl
X21vZGVfaW5mbyB7Ci0Jc3RydWN0IGxpc3RfaGVhZCBsaXN0OwotCXN0cnVjdCB1Ymlmc19pbmZv
ICpjOwotfTsKLQotc3RhdGljIExJU1RfSEVBRChmbWlfbGlzdCk7Ci1zdGF0aWMgREVGSU5FX1NQ
SU5MT0NLKGZtaV9sb2NrKTsKLQotc3RhdGljIHVuc2lnbmVkIGludCBuZXh0OwotCi1zdGF0aWMg
aW50IHNpbXBsZV9yYW5kKHZvaWQpCitzdGF0aWMgaW5saW5lIGludCBjaGFuY2UodW5zaWduZWQg
aW50IG4sIHVuc2lnbmVkIGludCBvdXRfb2YpCiB7Ci0JaWYgKG5leHQgPT0gMCkKLQkJbmV4dCA9
IGN1cnJlbnQtPnBpZDsKLQluZXh0ID0gbmV4dCAqIDExMDM1MTUyNDUgKyAxMjM0NTsKLQlyZXR1
cm4gKG5leHQgPj4gMTYpICYgMzI3Njc7Ci19CisJcmV0dXJuICEhKChyYW5kb20zMigpICUgb3V0
X29mKSArIDEgPD0gbik7CiAKLXN0YXRpYyB2b2lkIGZhaWx1cmVfbW9kZV9pbml0KHN0cnVjdCB1
Ymlmc19pbmZvICpjKQotewotCXN0cnVjdCBmYWlsdXJlX21vZGVfaW5mbyAqZm1pOwotCi0JZm1p
ID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IGZhaWx1cmVfbW9kZV9pbmZvKSwgR0ZQX05PRlMpOwot
CWlmICghZm1pKSB7Ci0JCXViaWZzX2VycigiRmFpbGVkIHRvIHJlZ2lzdGVyIGZhaWx1cmUgbW9k
ZSAtIG5vIG1lbW9yeSIpOwotCQlyZXR1cm47Ci0JfQotCWZtaS0+YyA9IGM7Ci0Jc3Bpbl9sb2Nr
KCZmbWlfbG9jayk7Ci0JbGlzdF9hZGRfdGFpbCgmZm1pLT5saXN0LCAmZm1pX2xpc3QpOwotCXNw
aW5fdW5sb2NrKCZmbWlfbG9jayk7CiB9CiAKLXN0YXRpYyB2b2lkIGZhaWx1cmVfbW9kZV9leGl0
KHN0cnVjdCB1Ymlmc19pbmZvICpjKQorc3RhdGljIGludCBwb3dlcl9jdXRfZW11bGF0ZWQoc3Ry
dWN0IHViaWZzX2luZm8gKmMsIGludCBsbnVtLCBpbnQgd3JpdGUpCiB7Ci0Jc3RydWN0IGZhaWx1
cmVfbW9kZV9pbmZvICpmbWksICp0bXA7Ci0KLQlzcGluX2xvY2soJmZtaV9sb2NrKTsKLQlsaXN0
X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZm1pLCB0bXAsICZmbWlfbGlzdCwgbGlzdCkKLQkJaWYgKGZt
aS0+YyA9PSBjKSB7Ci0JCQlsaXN0X2RlbCgmZm1pLT5saXN0KTsKLQkJCWtmcmVlKGZtaSk7Ci0J
CX0KLQlzcGluX3VubG9jaygmZm1pX2xvY2spOwotfQotCi1zdGF0aWMgc3RydWN0IHViaWZzX2lu
Zm8gKmRiZ19maW5kX2luZm8oc3RydWN0IHViaV92b2x1bWVfZGVzYyAqZGVzYykKLXsKLQlzdHJ1
Y3QgZmFpbHVyZV9tb2RlX2luZm8gKmZtaTsKLQotCXNwaW5fbG9jaygmZm1pX2xvY2spOwotCWxp
c3RfZm9yX2VhY2hfZW50cnkoZm1pLCAmZm1pX2xpc3QsIGxpc3QpCi0JCWlmIChmbWktPmMtPnVi
aSA9PSBkZXNjKSB7Ci0JCQlzdHJ1Y3QgdWJpZnNfaW5mbyAqYyA9IGZtaS0+YzsKLQotCQkJc3Bp
bl91bmxvY2soJmZtaV9sb2NrKTsKLQkJCXJldHVybiBjOwotCQl9Ci0Jc3Bpbl91bmxvY2soJmZt
aV9sb2NrKTsKLQlyZXR1cm4gTlVMTDsKLX0KLQotc3RhdGljIGludCBpbl9mYWlsdXJlX21vZGUo
c3RydWN0IHViaV92b2x1bWVfZGVzYyAqZGVzYykKLXsKLQlzdHJ1Y3QgdWJpZnNfaW5mbyAqYyA9
IGRiZ19maW5kX2luZm8oZGVzYyk7Ci0KLQlpZiAoYyAmJiBkYmdfZmFpbHVyZV9tb2RlKQotCQly
ZXR1cm4gYy0+ZGJnLT5mYWlsdXJlX21vZGU7Ci0JcmV0dXJuIDA7Ci19CisJc3RydWN0IHViaWZz
X2RlYnVnX2luZm8gKmQgPSBjLT5kYmc7CiAKLXN0YXRpYyBpbnQgZG9fZmFpbChzdHJ1Y3QgdWJp
X3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgbG51bSwgaW50IHdyaXRlKQotewotCXN0cnVjdCB1Ymlm
c19pbmZvICpjID0gZGJnX2ZpbmRfaW5mbyhkZXNjKTsKLQlzdHJ1Y3QgdWJpZnNfZGVidWdfaW5m
byAqZDsKKwl1Ymlmc19hc3NlcnQoZGJnX2lzX3RzdF9yY3ZyeShjKSk7CiAKLQlpZiAoIWMgfHwg
IWRiZ19mYWlsdXJlX21vZGUpCi0JCXJldHVybiAwOwotCWQgPSBjLT5kYmc7Ci0JaWYgKGQtPmZh
aWx1cmVfbW9kZSkKLQkJcmV0dXJuIDE7Ci0JaWYgKCFkLT5mYWlsX2NudCkgewotCQkvKiBGaXJz
dCBjYWxsIC0gZGVjaWRlIGRlbGF5IHRvIGZhaWx1cmUgKi8KKwlpZiAoIWQtPnBjX2NudCkgewor
CQkvKiBGaXJzdCBjYWxsIC0gZGVjaWRlIGRlbGF5IHRvIHRoZSBwb3dlciBjdXQgKi8KIAkJaWYg
KGNoYW5jZSgxLCAyKSkgewotCQkJdW5zaWduZWQgaW50IGRlbGF5ID0gMSA8PCAoc2ltcGxlX3Jh
bmQoKSA+PiAxMSk7CisJCQl1bnNpZ25lZCBsb25nIGRlbGF5OwogCiAJCQlpZiAoY2hhbmNlKDEs
IDIpKSB7Ci0JCQkJZC0+ZmFpbF9kZWxheSA9IDE7Ci0JCQkJZC0+ZmFpbF90aW1lb3V0ID0gamlm
ZmllcyArCi0JCQkJCQkgIG1zZWNzX3RvX2ppZmZpZXMoZGVsYXkpOwotCQkJCWRiZ19yY3ZyeSgi
ZmFpbGluZyBhZnRlciAldW1zIiwgZGVsYXkpOworCQkJCWQtPnBjX2RlbGF5ID0gMTsKKwkJCQkv
KiBGYWlsIHdpdGhpbmcgMSBtaW51dGUgKi8KKwkJCQlkZWxheSA9IHJhbmRvbTMyKCkgJSA2MDAw
MDsKKwkJCQlkLT5wY190aW1lb3V0ID0gamlmZmllczsKKwkJCQlkLT5wY190aW1lb3V0ICs9IG1z
ZWNzX3RvX2ppZmZpZXMoZGVsYXkpOworCQkJCXViaWZzX3dhcm4oImZhaWxpbmcgYWZ0ZXIgJWx1
bXMiLCBkZWxheSk7CiAJCQl9IGVsc2UgewotCQkJCWQtPmZhaWxfZGVsYXkgPSAyOwotCQkJCWQt
PmZhaWxfY250X21heCA9IGRlbGF5OwotCQkJCWRiZ19yY3ZyeSgiZmFpbGluZyBhZnRlciAldSBj
YWxscyIsIGRlbGF5KTsKKwkJCQlkLT5wY19kZWxheSA9IDI7CisJCQkJZGVsYXkgPSByYW5kb20z
MigpICUgMTAwMDA7CisJCQkJLyogRmFpbCB3aXRoaW4gMTAwMDAgb3BlcmF0aW9ucyAqLworCQkJ
CWQtPnBjX2NudF9tYXggPSBkZWxheTsKKwkJCQl1Ymlmc193YXJuKCJmYWlsaW5nIGFmdGVyICVs
dSBjYWxscyIsIGRlbGF5KTsKIAkJCX0KIAkJfQotCQlkLT5mYWlsX2NudCArPSAxOworCisJCWQt
PnBjX2NudCArPSAxOwogCX0KKwogCS8qIERldGVybWluZSBpZiBmYWlsdXJlIGRlbGF5IGhhcyBl
eHBpcmVkICovCi0JaWYgKGQtPmZhaWxfZGVsYXkgPT0gMSkgewotCQlpZiAodGltZV9iZWZvcmUo
amlmZmllcywgZC0+ZmFpbF90aW1lb3V0KSkKKwlpZiAoZC0+cGNfZGVsYXkgPT0gMSAmJiB0aW1l
X2JlZm9yZShqaWZmaWVzLCBkLT5wY190aW1lb3V0KSkKIAkJCXJldHVybiAwOwotCX0gZWxzZSBp
ZiAoZC0+ZmFpbF9kZWxheSA9PSAyKQotCQlpZiAoZC0+ZmFpbF9jbnQrKyA8IGQtPmZhaWxfY250
X21heCkKKwlpZiAoZC0+cGNfZGVsYXkgPT0gMiAmJiBkLT5wY19jbnQrKyA8IGQtPnBjX2NudF9t
YXgpCiAJCQlyZXR1cm4gMDsKKwogCWlmIChsbnVtID09IFVCSUZTX1NCX0xOVU0pIHsKLQkJaWYg
KHdyaXRlKSB7Ci0JCQlpZiAoY2hhbmNlKDEsIDIpKQotCQkJCXJldHVybiAwOwotCQl9IGVsc2Ug
aWYgKGNoYW5jZSgxOSwgMjApKQorCQlpZiAod3JpdGUgJiYgY2hhbmNlKDEsIDIpKQogCQkJcmV0
dXJuIDA7Ci0JCWRiZ19yY3ZyeSgiZmFpbGluZyBpbiBzdXBlciBibG9jayBMRUIgJWQiLCBsbnVt
KTsKKwkJaWYgKGNoYW5jZSgxOSwgMjApKQorCQkJcmV0dXJuIDA7CisJCXViaWZzX3dhcm4oImZh
aWxpbmcgaW4gc3VwZXIgYmxvY2sgTEVCICVkIiwgbG51bSk7CiAJfSBlbHNlIGlmIChsbnVtID09
IFVCSUZTX01TVF9MTlVNIHx8IGxudW0gPT0gVUJJRlNfTVNUX0xOVU0gKyAxKSB7CiAJCWlmIChj
aGFuY2UoMTksIDIwKSkKIAkJCXJldHVybiAwOwotCQlkYmdfcmN2cnkoImZhaWxpbmcgaW4gbWFz
dGVyIExFQiAlZCIsIGxudW0pOworCQl1Ymlmc193YXJuKCJmYWlsaW5nIGluIG1hc3RlciBMRUIg
JWQiLCBsbnVtKTsKIAl9IGVsc2UgaWYgKGxudW0gPj0gVUJJRlNfTE9HX0xOVU0gJiYgbG51bSA8
PSBjLT5sb2dfbGFzdCkgewotCQlpZiAod3JpdGUpIHsKLQkJCWlmIChjaGFuY2UoOTksIDEwMCkp
Ci0JCQkJcmV0dXJuIDA7Ci0JCX0gZWxzZSBpZiAoY2hhbmNlKDM5OSwgNDAwKSkKKwkJaWYgKHdy
aXRlICYmIGNoYW5jZSg5OSwgMTAwKSkKKwkJCXJldHVybiAwOworCQlpZiAoY2hhbmNlKDM5OSwg
NDAwKSkKIAkJCXJldHVybiAwOwotCQlkYmdfcmN2cnkoImZhaWxpbmcgaW4gbG9nIExFQiAlZCIs
IGxudW0pOworCQl1Ymlmc193YXJuKCJmYWlsaW5nIGluIGxvZyBMRUIgJWQiLCBsbnVtKTsKIAl9
IGVsc2UgaWYgKGxudW0gPj0gYy0+bHB0X2ZpcnN0ICYmIGxudW0gPD0gYy0+bHB0X2xhc3QpIHsK
LQkJaWYgKHdyaXRlKSB7Ci0JCQlpZiAoY2hhbmNlKDcsIDgpKQotCQkJCXJldHVybiAwOwotCQl9
IGVsc2UgaWYgKGNoYW5jZSgxOSwgMjApKQorCQlpZiAod3JpdGUgJiYgY2hhbmNlKDcsIDgpKQor
CQkJcmV0dXJuIDA7CisJCWlmIChjaGFuY2UoMTksIDIwKSkKIAkJCXJldHVybiAwOwotCQlkYmdf
cmN2cnkoImZhaWxpbmcgaW4gTFBUIExFQiAlZCIsIGxudW0pOworCQl1Ymlmc193YXJuKCJmYWls
aW5nIGluIExQVCBMRUIgJWQiLCBsbnVtKTsKIAl9IGVsc2UgaWYgKGxudW0gPj0gYy0+b3JwaF9m
aXJzdCAmJiBsbnVtIDw9IGMtPm9ycGhfbGFzdCkgewotCQlpZiAod3JpdGUpIHsKLQkJCWlmIChj
aGFuY2UoMSwgMikpCi0JCQkJcmV0dXJuIDA7Ci0JCX0gZWxzZSBpZiAoY2hhbmNlKDksIDEwKSkK
KwkJaWYgKHdyaXRlICYmIGNoYW5jZSgxLCAyKSkKIAkJCXJldHVybiAwOwotCQlkYmdfcmN2cnko
ImZhaWxpbmcgaW4gb3JwaGFuIExFQiAlZCIsIGxudW0pOworCQlpZiAoY2hhbmNlKDksIDEwKSkK
KwkJCXJldHVybiAwOworCQl1Ymlmc193YXJuKCJmYWlsaW5nIGluIG9ycGhhbiBMRUIgJWQiLCBs
bnVtKTsKIAl9IGVsc2UgaWYgKGxudW0gPT0gYy0+aWhlYWRfbG51bSkgewogCQlpZiAoY2hhbmNl
KDk5LCAxMDApKQogCQkJcmV0dXJuIDA7Ci0JCWRiZ19yY3ZyeSgiZmFpbGluZyBpbiBpbmRleCBo
ZWFkIExFQiAlZCIsIGxudW0pOworCQl1Ymlmc193YXJuKCJmYWlsaW5nIGluIGluZGV4IGhlYWQg
TEVCICVkIiwgbG51bSk7CiAJfSBlbHNlIGlmIChjLT5qaGVhZHMgJiYgbG51bSA9PSBjLT5qaGVh
ZHNbR0NIRF0ud2J1Zi5sbnVtKSB7CiAJCWlmIChjaGFuY2UoOSwgMTApKQogCQkJcmV0dXJuIDA7
Ci0JCWRiZ19yY3ZyeSgiZmFpbGluZyBpbiBHQyBoZWFkIExFQiAlZCIsIGxudW0pOworCQl1Ymlm
c193YXJuKCJmYWlsaW5nIGluIEdDIGhlYWQgTEVCICVkIiwgbG51bSk7CiAJfSBlbHNlIGlmICh3
cml0ZSAmJiAhUkJfRU1QVFlfUk9PVCgmYy0+YnVkcykgJiYKIAkJICAgIXViaWZzX3NlYXJjaF9i
dWQoYywgbG51bSkpIHsKIAkJaWYgKGNoYW5jZSgxOSwgMjApKQogCQkJcmV0dXJuIDA7Ci0JCWRi
Z19yY3ZyeSgiZmFpbGluZyBpbiBub24tYnVkIExFQiAlZCIsIGxudW0pOworCQl1Ymlmc193YXJu
KCJmYWlsaW5nIGluIG5vbi1idWQgTEVCICVkIiwgbG51bSk7CiAJfSBlbHNlIGlmIChjLT5jbXRf
c3RhdGUgPT0gQ09NTUlUX1JVTk5JTkdfQkFDS0dST1VORCB8fAogCQkgICBjLT5jbXRfc3RhdGUg
PT0gQ09NTUlUX1JVTk5JTkdfUkVRVUlSRUQpIHsKIAkJaWYgKGNoYW5jZSg5OTksIDEwMDApKQog
CQkJcmV0dXJuIDA7Ci0JCWRiZ19yY3ZyeSgiZmFpbGluZyBpbiBidWQgTEVCICVkIGNvbW1pdCBy
dW5uaW5nIiwgbG51bSk7CisJCXViaWZzX3dhcm4oImZhaWxpbmcgaW4gYnVkIExFQiAlZCBjb21t
aXQgcnVubmluZyIsIGxudW0pOwogCX0gZWxzZSB7CiAJCWlmIChjaGFuY2UoOTk5OSwgMTAwMDAp
KQogCQkJcmV0dXJuIDA7Ci0JCWRiZ19yY3ZyeSgiZmFpbGluZyBpbiBidWQgTEVCICVkIGNvbW1p
dCBub3QgcnVubmluZyIsIGxudW0pOworCQl1Ymlmc193YXJuKCJmYWlsaW5nIGluIGJ1ZCBMRUIg
JWQgY29tbWl0IG5vdCBydW5uaW5nIiwgbG51bSk7CiAJfQotCXViaWZzX2VycigiKioqIFNFVFRJ
TkcgRkFJTFVSRSBNT0RFIE9OIChMRUIgJWQpICoqKiIsIGxudW0pOwotCWQtPmZhaWx1cmVfbW9k
ZSA9IDE7CisKKwlkLT5wY19oYXBwZW5lZCA9IDE7CisJdWJpZnNfd2FybigiPT09PT09PT09PSBQ
b3dlciBjdXQgZW11bGF0ZWQgPT09PT09PT09PSIpOwogCWR1bXBfc3RhY2soKTsKIAlyZXR1cm4g
MTsKIH0KIAotc3RhdGljIHZvaWQgY3V0X2RhdGEoY29uc3Qgdm9pZCAqYnVmLCBpbnQgbGVuKQor
c3RhdGljIHZvaWQgY3V0X2RhdGEoY29uc3Qgdm9pZCAqYnVmLCB1bnNpZ25lZCBpbnQgbGVuKQog
ewotCWludCBmbGVuLCBpOworCXVuc2lnbmVkIGludCBmcm9tLCB0bywgaSwgZmZzID0gY2hhbmNl
KDEsIDIpOwogCXVuc2lnbmVkIGNoYXIgKnAgPSAodm9pZCAqKWJ1ZjsKIAotCWZsZW4gPSAobGVu
ICogKGxvbmcgbG9uZylzaW1wbGVfcmFuZCgpKSA+PiAxNTsKLQlmb3IgKGkgPSBmbGVuOyBpIDwg
bGVuOyBpKyspCi0JCXBbaV0gPSAweGZmOwotfQorCWZyb20gPSByYW5kb20zMigpICUgKGxlbiAr
IDEpOworCWlmIChjaGFuY2UoMSwgMikpCisJCXRvID0gcmFuZG9tMzIoKSAlIChsZW4gLSBmcm9t
ICsgMSk7CisJZWxzZQorCQl0byA9IGxlbjsKIAotaW50IGRiZ19sZWJfcmVhZChzdHJ1Y3QgdWJp
X3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgbG51bSwgY2hhciAqYnVmLCBpbnQgb2Zmc2V0LAotCQkg
aW50IGxlbiwgaW50IGNoZWNrKQotewotCWlmIChpbl9mYWlsdXJlX21vZGUoZGVzYykpCi0JCXJl
dHVybiAtRVJPRlM7Ci0JcmV0dXJuIHViaV9sZWJfcmVhZChkZXNjLCBsbnVtLCBidWYsIG9mZnNl
dCwgbGVuLCBjaGVjayk7CisJaWYgKGZyb20gPCB0bykKKwkJdWJpZnNfd2FybigiZmlsbGVkIGJ5
dGVzICV1LSV1IHdpdGggJXMiLCBmcm9tLCB0byAtIDEsCisJCQkgICBmZnMgPyAiMHhGRnMiIDog
InJhbmRvbSBkYXRhIik7CisKKwlpZiAoZmZzKQorCQlmb3IgKGkgPSBmcm9tOyBpIDwgdG87IGkr
KykKKwkJCXBbaV0gPSAweEZGOworCWVsc2UKKwkJZm9yIChpID0gZnJvbTsgaSA8IHRvOyBpKysp
CisJCQlwW2ldID0gcmFuZG9tMzIoKSAlIDB4MTAwOwogfQogCi1pbnQgZGJnX2xlYl93cml0ZShz
dHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgbG51bSwgY29uc3Qgdm9pZCAqYnVmLAot
CQkgIGludCBvZmZzZXQsIGludCBsZW4sIGludCBkdHlwZSkKK2ludCBkYmdfbGViX3dyaXRlKHN0
cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSwgY29uc3Qgdm9pZCAqYnVmLAorCQkgIGludCBv
ZmZzLCBpbnQgbGVuKQogewogCWludCBlcnIsIGZhaWxpbmc7CiAKLQlpZiAoaW5fZmFpbHVyZV9t
b2RlKGRlc2MpKQorCWlmIChjLT5kYmctPnBjX2hhcHBlbmVkKQogCQlyZXR1cm4gLUVST0ZTOwot
CWZhaWxpbmcgPSBkb19mYWlsKGRlc2MsIGxudW0sIDEpOworCisJZmFpbGluZyA9IHBvd2VyX2N1
dF9lbXVsYXRlZChjLCBsbnVtLCAxKTsKIAlpZiAoZmFpbGluZykKIAkJY3V0X2RhdGEoYnVmLCBs
ZW4pOwotCWVyciA9IHViaV9sZWJfd3JpdGUoZGVzYywgbG51bSwgYnVmLCBvZmZzZXQsIGxlbiwg
ZHR5cGUpOworCWVyciA9IHViaV9sZWJfd3JpdGUoYy0+dWJpLCBsbnVtLCBidWYsIG9mZnMsIGxl
bik7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKIAlpZiAoZmFpbGluZykKQEAgLTI3MDYsMTYy
ICsyNjk0LDIwNyBAQAogCXJldHVybiAwOwogfQogCi1pbnQgZGJnX2xlYl9jaGFuZ2Uoc3RydWN0
IHViaV92b2x1bWVfZGVzYyAqZGVzYywgaW50IGxudW0sIGNvbnN0IHZvaWQgKmJ1ZiwKLQkJICAg
aW50IGxlbiwgaW50IGR0eXBlKQoraW50IGRiZ19sZWJfY2hhbmdlKHN0cnVjdCB1Ymlmc19pbmZv
ICpjLCBpbnQgbG51bSwgY29uc3Qgdm9pZCAqYnVmLAorCQkgICBpbnQgbGVuKQogewogCWludCBl
cnI7CiAKLQlpZiAoZG9fZmFpbChkZXNjLCBsbnVtLCAxKSkKKwlpZiAoYy0+ZGJnLT5wY19oYXBw
ZW5lZCkKKwkJcmV0dXJuIC1FUk9GUzsKKwlpZiAocG93ZXJfY3V0X2VtdWxhdGVkKGMsIGxudW0s
IDEpKQogCQlyZXR1cm4gLUVST0ZTOwotCWVyciA9IHViaV9sZWJfY2hhbmdlKGRlc2MsIGxudW0s
IGJ1ZiwgbGVuLCBkdHlwZSk7CisJZXJyID0gdWJpX2xlYl9jaGFuZ2UoYy0+dWJpLCBsbnVtLCBi
dWYsIGxlbik7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKLQlpZiAoZG9fZmFpbChkZXNjLCBs
bnVtLCAxKSkKKwlpZiAocG93ZXJfY3V0X2VtdWxhdGVkKGMsIGxudW0sIDEpKQogCQlyZXR1cm4g
LUVST0ZTOwogCXJldHVybiAwOwogfQogCi1pbnQgZGJnX2xlYl9lcmFzZShzdHJ1Y3QgdWJpX3Zv
bHVtZV9kZXNjICpkZXNjLCBpbnQgbG51bSkKK2ludCBkYmdfbGViX3VubWFwKHN0cnVjdCB1Ymlm
c19pbmZvICpjLCBpbnQgbG51bSkKIHsKIAlpbnQgZXJyOwogCi0JaWYgKGRvX2ZhaWwoZGVzYywg
bG51bSwgMCkpCisJaWYgKGMtPmRiZy0+cGNfaGFwcGVuZWQpCiAJCXJldHVybiAtRVJPRlM7Ci0J
ZXJyID0gdWJpX2xlYl9lcmFzZShkZXNjLCBsbnVtKTsKKwlpZiAocG93ZXJfY3V0X2VtdWxhdGVk
KGMsIGxudW0sIDApKQorCQlyZXR1cm4gLUVST0ZTOworCWVyciA9IHViaV9sZWJfdW5tYXAoYy0+
dWJpLCBsbnVtKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwotCWlmIChkb19mYWlsKGRlc2Ms
IGxudW0sIDApKQorCWlmIChwb3dlcl9jdXRfZW11bGF0ZWQoYywgbG51bSwgMCkpCiAJCXJldHVy
biAtRVJPRlM7CiAJcmV0dXJuIDA7CiB9CiAKLWludCBkYmdfbGViX3VubWFwKHN0cnVjdCB1Ymlf
dm9sdW1lX2Rlc2MgKmRlc2MsIGludCBsbnVtKQoraW50IGRiZ19sZWJfbWFwKHN0cnVjdCB1Ymlm
c19pbmZvICpjLCBpbnQgbG51bSkKIHsKIAlpbnQgZXJyOwogCi0JaWYgKGRvX2ZhaWwoZGVzYywg
bG51bSwgMCkpCisJaWYgKGMtPmRiZy0+cGNfaGFwcGVuZWQpCisJCXJldHVybiAtRVJPRlM7CisJ
aWYgKHBvd2VyX2N1dF9lbXVsYXRlZChjLCBsbnVtLCAwKSkKIAkJcmV0dXJuIC1FUk9GUzsKLQll
cnIgPSB1YmlfbGViX3VubWFwKGRlc2MsIGxudW0pOworCWVyciA9IHViaV9sZWJfbWFwKGMtPnVi
aSwgbG51bSk7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKLQlpZiAoZG9fZmFpbChkZXNjLCBs
bnVtLCAwKSkKKwlpZiAocG93ZXJfY3V0X2VtdWxhdGVkKGMsIGxudW0sIDApKQogCQlyZXR1cm4g
LUVST0ZTOwogCXJldHVybiAwOwogfQogCi1pbnQgZGJnX2lzX21hcHBlZChzdHJ1Y3QgdWJpX3Zv
bHVtZV9kZXNjICpkZXNjLCBpbnQgbG51bSkKLXsKLQlpZiAoaW5fZmFpbHVyZV9tb2RlKGRlc2Mp
KQotCQlyZXR1cm4gLUVST0ZTOwotCXJldHVybiB1YmlfaXNfbWFwcGVkKGRlc2MsIGxudW0pOwot
fQorLyoKKyAqIFJvb3QgZGlyZWN0b3J5IGZvciBVQklGUyBzdHVmZiBpbiBkZWJ1Z2ZzLiBDb250
YWlucyBzdWItZGlyZWN0b3JpZXMgd2hpY2gKKyAqIGNvbnRhaW4gdGhlIHN0dWZmIHNwZWNpZmlj
IHRvIHBhcnRpY3VsYXIgZmlsZS1zeXN0ZW0gbW91bnRzLgorICovCitzdGF0aWMgc3RydWN0IGRl
bnRyeSAqZGZzX3Jvb3RkaXI7CiAKLWludCBkYmdfbGViX21hcChzdHJ1Y3QgdWJpX3ZvbHVtZV9k
ZXNjICpkZXNjLCBpbnQgbG51bSwgaW50IGR0eXBlKQorc3RhdGljIGludCBkZnNfZmlsZV9vcGVu
KHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlKQogewotCWludCBlcnI7Ci0K
LQlpZiAoZG9fZmFpbChkZXNjLCBsbnVtLCAwKSkKLQkJcmV0dXJuIC1FUk9GUzsKLQllcnIgPSB1
YmlfbGViX21hcChkZXNjLCBsbnVtLCBkdHlwZSk7Ci0JaWYgKGVycikKLQkJcmV0dXJuIGVycjsK
LQlpZiAoZG9fZmFpbChkZXNjLCBsbnVtLCAwKSkKLQkJcmV0dXJuIC1FUk9GUzsKLQlyZXR1cm4g
MDsKKwlmaWxlLT5wcml2YXRlX2RhdGEgPSBpbm9kZS0+aV9wcml2YXRlOworCXJldHVybiBub25z
ZWVrYWJsZV9vcGVuKGlub2RlLCBmaWxlKTsKIH0KIAogLyoqCi0gKiB1Ymlmc19kZWJ1Z2dpbmdf
aW5pdCAtIGluaXRpYWxpemUgVUJJRlMgZGVidWdnaW5nLgotICogQGM6IFVCSUZTIGZpbGUtc3lz
dGVtIGRlc2NyaXB0aW9uIG9iamVjdAotICoKLSAqIFRoaXMgZnVuY3Rpb24gaW5pdGlhbGl6ZXMg
ZGVidWdnaW5nLXJlbGF0ZWQgZGF0YSBmb3IgdGhlIGZpbGUgc3lzdGVtLgotICogUmV0dXJucyB6
ZXJvIGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGluIGNhc2Ug
b2YKKyAqIHByb3ZpZGVfdXNlcl9vdXRwdXQgLSBwcm92aWRlIG91dHB1dCB0byB0aGUgdXNlciBy
ZWFkaW5nIGEgZGVidWdmcyBmaWxlLgorICogQHZhbDogYm9vbGVhbiB2YWx1ZSBmb3IgdGhlIGFu
c3dlcgorICogQHU6IHRoZSBidWZmZXIgdG8gc3RvcmUgdGhlIGFuc3dlciBhdAorICogQGNvdW50
OiBzaXplIG9mIHRoZSBidWZmZXIKKyAqIEBwcG9zOiBwb3NpdGlvbiBpbiB0aGUgQHUgb3V0cHV0
IGJ1ZmZlcgorICoKKyAqIFRoaXMgaXMgYSBzaW1wbGUgaGVscGVyIGZ1bmN0aW9uIHdoaWNoIHN0
b3JlcyBAdmFsIGJvb2xlYW4gdmFsdWUgaW4gdGhlIHVzZXIKKyAqIGJ1ZmZlciB3aGVuIHRoZSB1
c2VyIHJlYWRzIG9uZSBvZiBVQklGUyBkZWJ1Z2ZzIGZpbGVzLiBSZXR1cm5zIGFtb3VudCBvZgor
ICogYnl0ZXMgd3JpdHRlbiB0byBAdSBpbiBjYXNlIG9mIHN1Y2Nlc3MgYW5kIGEgbmVnYXRpdmUg
ZXJyb3IgY29kZSBpbiBjYXNlIG9mCiAgKiBmYWlsdXJlLgogICovCi1pbnQgdWJpZnNfZGVidWdn
aW5nX2luaXQoc3RydWN0IHViaWZzX2luZm8gKmMpCitzdGF0aWMgaW50IHByb3ZpZGVfdXNlcl9v
dXRwdXQoaW50IHZhbCwgY2hhciBfX3VzZXIgKnUsIHNpemVfdCBjb3VudCwKKwkJCSAgICAgICBs
b2ZmX3QgKnBwb3MpCiB7Ci0JYy0+ZGJnID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHViaWZzX2Rl
YnVnX2luZm8pLCBHRlBfS0VSTkVMKTsKLQlpZiAoIWMtPmRiZykKLQkJcmV0dXJuIC1FTk9NRU07
CisJY2hhciBidWZbM107CiAKLQlmYWlsdXJlX21vZGVfaW5pdChjKTsKLQlyZXR1cm4gMDsKKwlp
ZiAodmFsKQorCQlidWZbMF0gPSAnMSc7CisJZWxzZQorCQlidWZbMF0gPSAnMCc7CisJYnVmWzFd
ID0gJ1xuJzsKKwlidWZbMl0gPSAweDAwOworCisJcmV0dXJuIHNpbXBsZV9yZWFkX2Zyb21fYnVm
ZmVyKHUsIGNvdW50LCBwcG9zLCBidWYsIDIpOwogfQogCi0vKioKLSAqIHViaWZzX2RlYnVnZ2lu
Z19leGl0IC0gZnJlZSBkZWJ1Z2dpbmcgZGF0YS4KLSAqIEBjOiBVQklGUyBmaWxlLXN5c3RlbSBk
ZXNjcmlwdGlvbiBvYmplY3QKLSAqLwotdm9pZCB1Ymlmc19kZWJ1Z2dpbmdfZXhpdChzdHJ1Y3Qg
dWJpZnNfaW5mbyAqYykKK3N0YXRpYyBzc2l6ZV90IGRmc19maWxlX3JlYWQoc3RydWN0IGZpbGUg
KmZpbGUsIGNoYXIgX191c2VyICp1LCBzaXplX3QgY291bnQsCisJCQkgICAgIGxvZmZfdCAqcHBv
cykKIHsKLQlmYWlsdXJlX21vZGVfZXhpdChjKTsKLQlrZnJlZShjLT5kYmcpOwotfQorCXN0cnVj
dCBkZW50cnkgKmRlbnQgPSBmaWxlLT5mX3BhdGguZGVudHJ5OworCXN0cnVjdCB1Ymlmc19pbmZv
ICpjID0gZmlsZS0+cHJpdmF0ZV9kYXRhOworCXN0cnVjdCB1Ymlmc19kZWJ1Z19pbmZvICpkID0g
Yy0+ZGJnOworCWludCB2YWw7CiAKLS8qCi0gKiBSb290IGRpcmVjdG9yeSBmb3IgVUJJRlMgc3R1
ZmYgaW4gZGVidWdmcy4gQ29udGFpbnMgc3ViLWRpcmVjdG9yaWVzIHdoaWNoCi0gKiBjb250YWlu
IHRoZSBzdHVmZiBzcGVjaWZpYyB0byBwYXJ0aWN1bGFyIGZpbGUtc3lzdGVtIG1vdW50cy4KLSAq
Lwotc3RhdGljIHN0cnVjdCBkZW50cnkgKmRmc19yb290ZGlyOworCWlmIChkZW50ID09IGQtPmRm
c19jaGtfZ2VuKQorCQl2YWwgPSBkLT5jaGtfZ2VuOworCWVsc2UgaWYgKGRlbnQgPT0gZC0+ZGZz
X2Noa19pbmRleCkKKwkJdmFsID0gZC0+Y2hrX2luZGV4OworCWVsc2UgaWYgKGRlbnQgPT0gZC0+
ZGZzX2Noa19vcnBoKQorCQl2YWwgPSBkLT5jaGtfb3JwaDsKKwllbHNlIGlmIChkZW50ID09IGQt
PmRmc19jaGtfbHByb3BzKQorCQl2YWwgPSBkLT5jaGtfbHByb3BzOworCWVsc2UgaWYgKGRlbnQg
PT0gZC0+ZGZzX2Noa19mcykKKwkJdmFsID0gZC0+Y2hrX2ZzOworCWVsc2UgaWYgKGRlbnQgPT0g
ZC0+ZGZzX3RzdF9yY3ZyeSkKKwkJdmFsID0gZC0+dHN0X3JjdnJ5OworCWVsc2UKKwkJcmV0dXJu
IC1FSU5WQUw7CisKKwlyZXR1cm4gcHJvdmlkZV91c2VyX291dHB1dCh2YWwsIHUsIGNvdW50LCBw
cG9zKTsKK30KIAogLyoqCi0gKiBkYmdfZGVidWdmc19pbml0IC0gaW5pdGlhbGl6ZSBkZWJ1Z2Zz
IGZpbGUtc3lzdGVtLgorICogaW50ZXJwcmV0X3VzZXJfaW5wdXQgLSBpbnRlcnByZXQgdXNlciBk
ZWJ1Z2ZzIGZpbGUgaW5wdXQuCisgKiBAdTogdXNlci1wcm92aWRlZCBidWZmZXIgd2l0aCB0aGUg
aW5wdXQKKyAqIEBjb3VudDogYnVmZmVyIHNpemUKICAqCi0gKiBVQklGUyB1c2VzIGRlYnVnZnMg
ZmlsZS1zeXN0ZW0gdG8gZXhwb3NlIHZhcmlvdXMgZGVidWdnaW5nIGtub2JzIHRvCi0gKiB1c2Vy
LXNwYWNlLiBUaGlzIGZ1bmN0aW9uIGNyZWF0ZXMgInViaWZzIiBkaXJlY3RvcnkgaW4gdGhlIGRl
YnVnZnMKLSAqIGZpbGUtc3lzdGVtLiBSZXR1cm5zIHplcm8gaW4gY2FzZSBvZiBzdWNjZXNzIGFu
ZCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgaW4KLSAqIGNhc2Ugb2YgZmFpbHVyZS4KKyAqIFRoaXMg
aXMgYSBoZWxwZXIgZnVuY3Rpb24gd2hpY2ggaW50ZXJwcmV0IHVzZXIgaW5wdXQgdG8gYSBib29s
ZWFuIFVCSUZTCisgKiBkZWJ1Z2ZzIGZpbGUuIFJldHVybnMgJTAgb3IgJTEgaW4gY2FzZSBvZiBz
dWNjZXNzIGFuZCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUKKyAqIGluIGNhc2Ugb2YgZmFpbHVyZS4K
ICAqLwotaW50IGRiZ19kZWJ1Z2ZzX2luaXQodm9pZCkKK3N0YXRpYyBpbnQgaW50ZXJwcmV0X3Vz
ZXJfaW5wdXQoY29uc3QgY2hhciBfX3VzZXIgKnUsIHNpemVfdCBjb3VudCkKIHsKLQlkZnNfcm9v
dGRpciA9IGRlYnVnZnNfY3JlYXRlX2RpcigidWJpZnMiLCBOVUxMKTsKLQlpZiAoSVNfRVJSKGRm
c19yb290ZGlyKSkgewotCQlpbnQgZXJyID0gUFRSX0VSUihkZnNfcm9vdGRpcik7Ci0JCXViaWZz
X2VycigiY2Fubm90IGNyZWF0ZSBcInViaWZzXCIgZGVidWdmcyBkaXJlY3RvcnksICIKLQkJCSAg
ImVycm9yICVkXG4iLCBlcnIpOwotCQlyZXR1cm4gZXJyOwotCX0KKwlzaXplX3QgYnVmX3NpemU7
CisJY2hhciBidWZbOF07CiAKLQlyZXR1cm4gMDsKLX0KKwlidWZfc2l6ZSA9IG1pbl90KHNpemVf
dCwgY291bnQsIChzaXplb2YoYnVmKSAtIDEpKTsKKwlpZiAoY29weV9mcm9tX3VzZXIoYnVmLCB1
LCBidWZfc2l6ZSkpCisJCXJldHVybiAtRUZBVUxUOwogCi0vKioKLSAqIGRiZ19kZWJ1Z2ZzX2V4
aXQgLSByZW1vdmUgdGhlICJ1YmlmcyIgZGlyZWN0b3J5IGZyb20gZGVidWdmcyBmaWxlLXN5c3Rl
bS4KLSAqLwotdm9pZCBkYmdfZGVidWdmc19leGl0KHZvaWQpCi17Ci0JZGVidWdmc19yZW1vdmUo
ZGZzX3Jvb3RkaXIpOwotfQorCWlmIChidWZbMF0gPT0gJzEnKQorCQlyZXR1cm4gMTsKKwllbHNl
IGlmIChidWZbMF0gPT0gJzAnKQorCQlyZXR1cm4gMDsKIAotc3RhdGljIGludCBvcGVuX2RlYnVn
ZnNfZmlsZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZSkKLXsKLQlmaWxl
LT5wcml2YXRlX2RhdGEgPSBpbm9kZS0+aV9wcml2YXRlOwotCXJldHVybiBub25zZWVrYWJsZV9v
cGVuKGlub2RlLCBmaWxlKTsKKwlyZXR1cm4gLUVJTlZBTDsKIH0KIAotc3RhdGljIHNzaXplX3Qg
d3JpdGVfZGVidWdmc19maWxlKHN0cnVjdCBmaWxlICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAq
YnVmLAotCQkJCSAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpCitzdGF0aWMgc3NpemVfdCBk
ZnNfZmlsZV93cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBfX3VzZXIgKnUsCisJ
CQkgICAgICBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykKIHsKIAlzdHJ1Y3QgdWJpZnNfaW5m
byAqYyA9IGZpbGUtPnByaXZhdGVfZGF0YTsKIAlzdHJ1Y3QgdWJpZnNfZGVidWdfaW5mbyAqZCA9
IGMtPmRiZzsKKwlzdHJ1Y3QgZGVudHJ5ICpkZW50ID0gZmlsZS0+Zl9wYXRoLmRlbnRyeTsKKwlp
bnQgdmFsOwogCi0JaWYgKGZpbGUtPmZfcGF0aC5kZW50cnkgPT0gZC0+ZGZzX2R1bXBfbHByb3Bz
KQotCQlkYmdfZHVtcF9scHJvcHMoYyk7Ci0JZWxzZSBpZiAoZmlsZS0+Zl9wYXRoLmRlbnRyeSA9
PSBkLT5kZnNfZHVtcF9idWRnKQotCQlkYmdfZHVtcF9idWRnKGMsICZjLT5iaSk7Ci0JZWxzZSBp
ZiAoZmlsZS0+Zl9wYXRoLmRlbnRyeSA9PSBkLT5kZnNfZHVtcF90bmMpIHsKKwkvKgorCSAqIFRP
RE86IHRoaXMgaXMgcmFjeSAtIHRoZSBmaWxlLXN5c3RlbSBtaWdodCBoYXZlIGFscmVhZHkgYmVl
bgorCSAqIHVubW91bnRlZCBhbmQgd2UnZCBvb3BzIGluIHRoaXMgY2FzZS4gVGhlIHBsYW4gaXMg
dG8gZml4IGl0IHdpdGgKKwkgKiBoZWxwIG9mICdpdGVyYXRlX3N1cGVyc190eXBlKCknIHdoaWNo
IHdlIHNob3VsZCBoYXZlIGluIHYzLjA6IHdoZW4KKwkgKiBhIGRlYnVnZnMgb3BlbmVkLCB3ZSBy
ZW1iZXIgRlMncyBVVUlEIGluIGZpbGUtPnByaXZhdGVfZGF0YS4gVGhlbgorCSAqIHdoZW5ldmVy
IHdlIGFjY2VzcyB0aGUgRlMgdmlhIGEgZGVidWdmcyBmaWxlLCB3ZSBpdGVyYXRlIGFsbCBVQklG
UworCSAqIHN1cGVyYmxvY2tzIGFuZCBmaW5lIHRoZSBvbmUgd2l0aCB0aGUgc2FtZSBVVUlELCBh
bmQgdGFrZSB0aGUKKwkgKiBsb2NraW5nIHJpZ2h0LgorCSAqCisJICogVGhlIG90aGVyIHdheSB0
byBnbyBzdWdnZXN0ZWQgYnkgQWwgVmlybyBpcyB0byBjcmVhdGUgYSBzZXBhcmF0ZQorCSAqICd1
Ymlmcy1kZWJ1ZycgZmlsZS1zeXN0ZW0gaW5zdGVhZC4KKwkgKi8KKwlpZiAoZmlsZS0+Zl9wYXRo
LmRlbnRyeSA9PSBkLT5kZnNfZHVtcF9scHJvcHMpIHsKKwkJdWJpZnNfZHVtcF9scHJvcHMoYyk7
CisJCXJldHVybiBjb3VudDsKKwl9CisJaWYgKGZpbGUtPmZfcGF0aC5kZW50cnkgPT0gZC0+ZGZz
X2R1bXBfYnVkZykgeworCQl1Ymlmc19kdW1wX2J1ZGcoYywgJmMtPmJpKTsKKwkJcmV0dXJuIGNv
dW50OworCX0KKwlpZiAoZmlsZS0+Zl9wYXRoLmRlbnRyeSA9PSBkLT5kZnNfZHVtcF90bmMpIHsK
IAkJbXV0ZXhfbG9jaygmYy0+dG5jX211dGV4KTsKLQkJZGJnX2R1bXBfdG5jKGMpOworCQl1Ymlm
c19kdW1wX3RuYyhjKTsKIAkJbXV0ZXhfdW5sb2NrKCZjLT50bmNfbXV0ZXgpOwotCX0gZWxzZQor
CQlyZXR1cm4gY291bnQ7CisJfQorCisJdmFsID0gaW50ZXJwcmV0X3VzZXJfaW5wdXQodSwgY291
bnQpOworCWlmICh2YWwgPCAwKQorCQlyZXR1cm4gdmFsOworCisJaWYgKGRlbnQgPT0gZC0+ZGZz
X2Noa19nZW4pCisJCWQtPmNoa19nZW4gPSB2YWw7CisJZWxzZSBpZiAoZGVudCA9PSBkLT5kZnNf
Y2hrX2luZGV4KQorCQlkLT5jaGtfaW5kZXggPSB2YWw7CisJZWxzZSBpZiAoZGVudCA9PSBkLT5k
ZnNfY2hrX29ycGgpCisJCWQtPmNoa19vcnBoID0gdmFsOworCWVsc2UgaWYgKGRlbnQgPT0gZC0+
ZGZzX2Noa19scHJvcHMpCisJCWQtPmNoa19scHJvcHMgPSB2YWw7CisJZWxzZSBpZiAoZGVudCA9
PSBkLT5kZnNfY2hrX2ZzKQorCQlkLT5jaGtfZnMgPSB2YWw7CisJZWxzZSBpZiAoZGVudCA9PSBk
LT5kZnNfdHN0X3JjdnJ5KQorCQlkLT50c3RfcmN2cnkgPSB2YWw7CisJZWxzZQogCQlyZXR1cm4g
LUVJTlZBTDsKIAogCXJldHVybiBjb3VudDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxl
X29wZXJhdGlvbnMgZGZzX2ZvcHMgPSB7Ci0JLm9wZW4gPSBvcGVuX2RlYnVnZnNfZmlsZSwKLQku
d3JpdGUgPSB3cml0ZV9kZWJ1Z2ZzX2ZpbGUsCisJLm9wZW4gPSBkZnNfZmlsZV9vcGVuLAorCS5y
ZWFkID0gZGZzX2ZpbGVfcmVhZCwKKwkud3JpdGUgPSBkZnNfZmlsZV93cml0ZSwKIAkub3duZXIg
PSBUSElTX01PRFVMRSwKIAkubGxzZWVrID0gbm9fbGxzZWVrLAogfTsKQEAgLTI4ODAsMTIgKzI5
MTMsMjQgQEAKICAqLwogaW50IGRiZ19kZWJ1Z2ZzX2luaXRfZnMoc3RydWN0IHViaWZzX2luZm8g
KmMpCiB7Ci0JaW50IGVycjsKKwlpbnQgZXJyLCBuOwogCWNvbnN0IGNoYXIgKmZuYW1lOwogCXN0
cnVjdCBkZW50cnkgKmRlbnQ7CiAJc3RydWN0IHViaWZzX2RlYnVnX2luZm8gKmQgPSBjLT5kYmc7
CiAKLQlzcHJpbnRmKGQtPmRmc19kaXJfbmFtZSwgInViaSVkXyVkIiwgYy0+dmkudWJpX251bSwg
Yy0+dmkudm9sX2lkKTsKKyNpZiAhZGVmaW5lZChDT05GSUdfREVCVUdfRlMpICYmICFkZWZpbmVk
KENPTkZJR19ERUJVR19GU19NT0RVTEUpCisJcmV0dXJuIDA7CisjZW5kaWYKKworCW4gPSBzbnBy
aW50ZihkLT5kZnNfZGlyX25hbWUsIFVCSUZTX0RGU19ESVJfTEVOICsgMSwgVUJJRlNfREZTX0RJ
Ul9OQU1FLAorCQkgICAgIGMtPnZpLnViaV9udW0sIGMtPnZpLnZvbF9pZCk7CisJaWYgKG4gPT0g
VUJJRlNfREZTX0RJUl9MRU4pIHsKKwkJLyogVGhlIGFycmF5IHNpemUgaXMgdG9vIHNtYWxsICov
CisJCWZuYW1lID0gVUJJRlNfREZTX0RJUl9OQU1FOworCQlkZW50ID0gRVJSX1BUUigtRUlOVkFM
KTsKKwkJZ290byBvdXQ7CisJfQorCiAJZm5hbWUgPSBkLT5kZnNfZGlyX25hbWU7CiAJZGVudCA9
IGRlYnVnZnNfY3JlYXRlX2RpcihmbmFtZSwgZGZzX3Jvb3RkaXIpOwogCWlmIChJU19FUlJfT1Jf
TlVMTChkZW50KSkKQEAgLTI5MTAsMTMgKzI5NTUsNTUgQEAKIAkJZ290byBvdXRfcmVtb3ZlOwog
CWQtPmRmc19kdW1wX3RuYyA9IGRlbnQ7CiAKKwlmbmFtZSA9ICJjaGtfZ2VuZXJhbCI7CisJZGVu
dCA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoZm5hbWUsIFNfSVJVU1IgfCBTX0lXVVNSLCBkLT5kZnNf
ZGlyLCBjLAorCQkJCSAgICZkZnNfZm9wcyk7CisJaWYgKElTX0VSUl9PUl9OVUxMKGRlbnQpKQor
CQlnb3RvIG91dF9yZW1vdmU7CisJZC0+ZGZzX2Noa19nZW4gPSBkZW50OworCisJZm5hbWUgPSAi
Y2hrX2luZGV4IjsKKwlkZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZShmbmFtZSwgU19JUlVTUiB8
IFNfSVdVU1IsIGQtPmRmc19kaXIsIGMsCisJCQkJICAgJmRmc19mb3BzKTsKKwlpZiAoSVNfRVJS
X09SX05VTEwoZGVudCkpCisJCWdvdG8gb3V0X3JlbW92ZTsKKwlkLT5kZnNfY2hrX2luZGV4ID0g
ZGVudDsKKworCWZuYW1lID0gImNoa19vcnBoYW5zIjsKKwlkZW50ID0gZGVidWdmc19jcmVhdGVf
ZmlsZShmbmFtZSwgU19JUlVTUiB8IFNfSVdVU1IsIGQtPmRmc19kaXIsIGMsCisJCQkJICAgJmRm
c19mb3BzKTsKKwlpZiAoSVNfRVJSX09SX05VTEwoZGVudCkpCisJCWdvdG8gb3V0X3JlbW92ZTsK
KwlkLT5kZnNfY2hrX29ycGggPSBkZW50OworCisJZm5hbWUgPSAiY2hrX2xwcm9wcyI7CisJZGVu
dCA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoZm5hbWUsIFNfSVJVU1IgfCBTX0lXVVNSLCBkLT5kZnNf
ZGlyLCBjLAorCQkJCSAgICZkZnNfZm9wcyk7CisJaWYgKElTX0VSUl9PUl9OVUxMKGRlbnQpKQor
CQlnb3RvIG91dF9yZW1vdmU7CisJZC0+ZGZzX2Noa19scHJvcHMgPSBkZW50OworCisJZm5hbWUg
PSAiY2hrX2ZzIjsKKwlkZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZShmbmFtZSwgU19JUlVTUiB8
IFNfSVdVU1IsIGQtPmRmc19kaXIsIGMsCisJCQkJICAgJmRmc19mb3BzKTsKKwlpZiAoSVNfRVJS
X09SX05VTEwoZGVudCkpCisJCWdvdG8gb3V0X3JlbW92ZTsKKwlkLT5kZnNfY2hrX2ZzID0gZGVu
dDsKKworCWZuYW1lID0gInRzdF9yZWNvdmVyeSI7CisJZGVudCA9IGRlYnVnZnNfY3JlYXRlX2Zp
bGUoZm5hbWUsIFNfSVJVU1IgfCBTX0lXVVNSLCBkLT5kZnNfZGlyLCBjLAorCQkJCSAgICZkZnNf
Zm9wcyk7CisJaWYgKElTX0VSUl9PUl9OVUxMKGRlbnQpKQorCQlnb3RvIG91dF9yZW1vdmU7CisJ
ZC0+ZGZzX3RzdF9yY3ZyeSA9IGRlbnQ7CisKIAlyZXR1cm4gMDsKIAogb3V0X3JlbW92ZToKIAlk
ZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUoZC0+ZGZzX2Rpcik7CiBvdXQ6CiAJZXJyID0gZGVudCA/
IFBUUl9FUlIoZGVudCkgOiAtRU5PREVWOwotCXViaWZzX2VycigiY2Fubm90IGNyZWF0ZSBcIiVz
XCIgZGVidWdmcyBkaXJlY3RvcnksIGVycm9yICVkXG4iLAorCXViaWZzX2VycigiY2Fubm90IGNy
ZWF0ZSBcIiVzXCIgZGVidWdmcyBmaWxlIG9yIGRpcmVjdG9yeSwgZXJyb3IgJWRcbiIsCiAJCSAg
Zm5hbWUsIGVycik7CiAJcmV0dXJuIGVycjsKIH0KQEAgLTI5MjcsNyArMzAxNCwxODggQEAKICAq
Lwogdm9pZCBkYmdfZGVidWdmc19leGl0X2ZzKHN0cnVjdCB1Ymlmc19pbmZvICpjKQogeworI2lm
IGRlZmluZWQoQ09ORklHX0RFQlVHX0ZTKSB8fCBkZWZpbmVkKENPTkZJR19ERUJVR19GU19NT0RV
TEUpCiAJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKGMtPmRiZy0+ZGZzX2Rpcik7CisjZW5kaWYK
K30KKworc3RydWN0IHViaWZzX2dsb2JhbF9kZWJ1Z19pbmZvIHViaWZzX2RiZzsKKworc3RhdGlj
IHN0cnVjdCBkZW50cnkgKmRmc19jaGtfZ2VuOworc3RhdGljIHN0cnVjdCBkZW50cnkgKmRmc19j
aGtfaW5kZXg7CitzdGF0aWMgc3RydWN0IGRlbnRyeSAqZGZzX2Noa19vcnBoOworc3RhdGljIHN0
cnVjdCBkZW50cnkgKmRmc19jaGtfbHByb3BzOworc3RhdGljIHN0cnVjdCBkZW50cnkgKmRmc19j
aGtfZnM7CitzdGF0aWMgc3RydWN0IGRlbnRyeSAqZGZzX3RzdF9yY3ZyeTsKKworc3RhdGljIHNz
aXplX3QgZGZzX2dsb2JhbF9maWxlX3JlYWQoc3RydWN0IGZpbGUgKmZpbGUsIGNoYXIgX191c2Vy
ICp1LAorCQkJCSAgICBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykKK3sKKwlzdHJ1Y3QgZGVu
dHJ5ICpkZW50ID0gZmlsZS0+Zl9wYXRoLmRlbnRyeTsKKwlpbnQgdmFsOworCisJaWYgKGRlbnQg
PT0gZGZzX2Noa19nZW4pCisJCXZhbCA9IHViaWZzX2RiZy5jaGtfZ2VuOworCWVsc2UgaWYgKGRl
bnQgPT0gZGZzX2Noa19pbmRleCkKKwkJdmFsID0gdWJpZnNfZGJnLmNoa19pbmRleDsKKwllbHNl
IGlmIChkZW50ID09IGRmc19jaGtfb3JwaCkKKwkJdmFsID0gdWJpZnNfZGJnLmNoa19vcnBoOwor
CWVsc2UgaWYgKGRlbnQgPT0gZGZzX2Noa19scHJvcHMpCisJCXZhbCA9IHViaWZzX2RiZy5jaGtf
bHByb3BzOworCWVsc2UgaWYgKGRlbnQgPT0gZGZzX2Noa19mcykKKwkJdmFsID0gdWJpZnNfZGJn
LmNoa19mczsKKwllbHNlIGlmIChkZW50ID09IGRmc190c3RfcmN2cnkpCisJCXZhbCA9IHViaWZz
X2RiZy50c3RfcmN2cnk7CisJZWxzZQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldHVybiBwcm92
aWRlX3VzZXJfb3V0cHV0KHZhbCwgdSwgY291bnQsIHBwb3MpOwogfQogCi0jZW5kaWYgLyogQ09O
RklHX1VCSUZTX0ZTX0RFQlVHICovCitzdGF0aWMgc3NpemVfdCBkZnNfZ2xvYmFsX2ZpbGVfd3Jp
dGUoc3RydWN0IGZpbGUgKmZpbGUsIGNvbnN0IGNoYXIgX191c2VyICp1LAorCQkJCSAgICAgc2l6
ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpCit7CisJc3RydWN0IGRlbnRyeSAqZGVudCA9IGZpbGUt
PmZfcGF0aC5kZW50cnk7CisJaW50IHZhbDsKKworCXZhbCA9IGludGVycHJldF91c2VyX2lucHV0
KHUsIGNvdW50KTsKKwlpZiAodmFsIDwgMCkKKwkJcmV0dXJuIHZhbDsKKworCWlmIChkZW50ID09
IGRmc19jaGtfZ2VuKQorCQl1Ymlmc19kYmcuY2hrX2dlbiA9IHZhbDsKKwllbHNlIGlmIChkZW50
ID09IGRmc19jaGtfaW5kZXgpCisJCXViaWZzX2RiZy5jaGtfaW5kZXggPSB2YWw7CisJZWxzZSBp
ZiAoZGVudCA9PSBkZnNfY2hrX29ycGgpCisJCXViaWZzX2RiZy5jaGtfb3JwaCA9IHZhbDsKKwll
bHNlIGlmIChkZW50ID09IGRmc19jaGtfbHByb3BzKQorCQl1Ymlmc19kYmcuY2hrX2xwcm9wcyA9
IHZhbDsKKwllbHNlIGlmIChkZW50ID09IGRmc19jaGtfZnMpCisJCXViaWZzX2RiZy5jaGtfZnMg
PSB2YWw7CisJZWxzZSBpZiAoZGVudCA9PSBkZnNfdHN0X3JjdnJ5KQorCQl1Ymlmc19kYmcudHN0
X3JjdnJ5ID0gdmFsOworCWVsc2UKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXR1cm4gY291bnQ7
Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRmc19nbG9iYWxfZm9w
cyA9IHsKKwkucmVhZCA9IGRmc19nbG9iYWxfZmlsZV9yZWFkLAorCS53cml0ZSA9IGRmc19nbG9i
YWxfZmlsZV93cml0ZSwKKwkub3duZXIgPSBUSElTX01PRFVMRSwKKwkubGxzZWVrID0gbm9fbGxz
ZWVrLAorfTsKKworLyoqCisgKiBkYmdfZGVidWdmc19pbml0IC0gaW5pdGlhbGl6ZSBkZWJ1Z2Zz
IGZpbGUtc3lzdGVtLgorICoKKyAqIFVCSUZTIHVzZXMgZGVidWdmcyBmaWxlLXN5c3RlbSB0byBl
eHBvc2UgdmFyaW91cyBkZWJ1Z2dpbmcga25vYnMgdG8KKyAqIHVzZXItc3BhY2UuIFRoaXMgZnVu
Y3Rpb24gY3JlYXRlcyAidWJpZnMiIGRpcmVjdG9yeSBpbiB0aGUgZGVidWdmcworICogZmlsZS1z
eXN0ZW0uIFJldHVybnMgemVybyBpbiBjYXNlIG9mIHN1Y2Nlc3MgYW5kIGEgbmVnYXRpdmUgZXJy
b3IgY29kZSBpbgorICogY2FzZSBvZiBmYWlsdXJlLgorICovCitpbnQgZGJnX2RlYnVnZnNfaW5p
dCh2b2lkKQoreworCWludCBlcnI7CisJY29uc3QgY2hhciAqZm5hbWU7CisJc3RydWN0IGRlbnRy
eSAqZGVudDsKKworI2lmICFkZWZpbmVkKENPTkZJR19ERUJVR19GUykgJiYgIWRlZmluZWQoQ09O
RklHX0RFQlVHX0ZTX01PRFVMRSkKKwlyZXR1cm4gMDsKKyNlbmRpZgorCisJZm5hbWUgPSAidWJp
ZnMiOworCWRlbnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZm5hbWUsIE5VTEwpOworCWlmIChJU19F
UlJfT1JfTlVMTChkZW50KSkKKwkJZ290byBvdXQ7CisJZGZzX3Jvb3RkaXIgPSBkZW50OworCisJ
Zm5hbWUgPSAiY2hrX2dlbmVyYWwiOworCWRlbnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKGZuYW1l
LCBTX0lSVVNSIHwgU19JV1VTUiwgZGZzX3Jvb3RkaXIsIE5VTEwsCisJCQkJICAgJmRmc19nbG9i
YWxfZm9wcyk7CisJaWYgKElTX0VSUl9PUl9OVUxMKGRlbnQpKQorCQlnb3RvIG91dF9yZW1vdmU7
CisJZGZzX2Noa19nZW4gPSBkZW50OworCisJZm5hbWUgPSAiY2hrX2luZGV4IjsKKwlkZW50ID0g
ZGVidWdmc19jcmVhdGVfZmlsZShmbmFtZSwgU19JUlVTUiB8IFNfSVdVU1IsIGRmc19yb290ZGly
LCBOVUxMLAorCQkJCSAgICZkZnNfZ2xvYmFsX2ZvcHMpOworCWlmIChJU19FUlJfT1JfTlVMTChk
ZW50KSkKKwkJZ290byBvdXRfcmVtb3ZlOworCWRmc19jaGtfaW5kZXggPSBkZW50OworCisJZm5h
bWUgPSAiY2hrX29ycGhhbnMiOworCWRlbnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKGZuYW1lLCBT
X0lSVVNSIHwgU19JV1VTUiwgZGZzX3Jvb3RkaXIsIE5VTEwsCisJCQkJICAgJmRmc19nbG9iYWxf
Zm9wcyk7CisJaWYgKElTX0VSUl9PUl9OVUxMKGRlbnQpKQorCQlnb3RvIG91dF9yZW1vdmU7CisJ
ZGZzX2Noa19vcnBoID0gZGVudDsKKworCWZuYW1lID0gImNoa19scHJvcHMiOworCWRlbnQgPSBk
ZWJ1Z2ZzX2NyZWF0ZV9maWxlKGZuYW1lLCBTX0lSVVNSIHwgU19JV1VTUiwgZGZzX3Jvb3RkaXIs
IE5VTEwsCisJCQkJICAgJmRmc19nbG9iYWxfZm9wcyk7CisJaWYgKElTX0VSUl9PUl9OVUxMKGRl
bnQpKQorCQlnb3RvIG91dF9yZW1vdmU7CisJZGZzX2Noa19scHJvcHMgPSBkZW50OworCisJZm5h
bWUgPSAiY2hrX2ZzIjsKKwlkZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZShmbmFtZSwgU19JUlVT
UiB8IFNfSVdVU1IsIGRmc19yb290ZGlyLCBOVUxMLAorCQkJCSAgICZkZnNfZ2xvYmFsX2ZvcHMp
OworCWlmIChJU19FUlJfT1JfTlVMTChkZW50KSkKKwkJZ290byBvdXRfcmVtb3ZlOworCWRmc19j
aGtfZnMgPSBkZW50OworCisJZm5hbWUgPSAidHN0X3JlY292ZXJ5IjsKKwlkZW50ID0gZGVidWdm
c19jcmVhdGVfZmlsZShmbmFtZSwgU19JUlVTUiB8IFNfSVdVU1IsIGRmc19yb290ZGlyLCBOVUxM
LAorCQkJCSAgICZkZnNfZ2xvYmFsX2ZvcHMpOworCWlmIChJU19FUlJfT1JfTlVMTChkZW50KSkK
KwkJZ290byBvdXRfcmVtb3ZlOworCWRmc190c3RfcmN2cnkgPSBkZW50OworCisJcmV0dXJuIDA7
CisKK291dF9yZW1vdmU6CisJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKGRmc19yb290ZGlyKTsK
K291dDoKKwllcnIgPSBkZW50ID8gUFRSX0VSUihkZW50KSA6IC1FTk9ERVY7CisJdWJpZnNfZXJy
KCJjYW5ub3QgY3JlYXRlIFwiJXNcIiBkZWJ1Z2ZzIGZpbGUgb3IgZGlyZWN0b3J5LCBlcnJvciAl
ZFxuIiwKKwkJICBmbmFtZSwgZXJyKTsKKwlyZXR1cm4gZXJyOworfQorCisvKioKKyAqIGRiZ19k
ZWJ1Z2ZzX2V4aXQgLSByZW1vdmUgdGhlICJ1YmlmcyIgZGlyZWN0b3J5IGZyb20gZGVidWdmcyBm
aWxlLXN5c3RlbS4KKyAqLwordm9pZCBkYmdfZGVidWdmc19leGl0KHZvaWQpCit7CisjaWYgZGVm
aW5lZChDT05GSUdfREVCVUdfRlMpIHx8IGRlZmluZWQoQ09ORklHX0RFQlVHX0ZTX01PRFVMRSkK
KwkJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKGRmc19yb290ZGlyKTsKKyNlbmRpZgorfQorCisv
KioKKyAqIHViaWZzX2RlYnVnZ2luZ19pbml0IC0gaW5pdGlhbGl6ZSBVQklGUyBkZWJ1Z2dpbmcu
CisgKiBAYzogVUJJRlMgZmlsZS1zeXN0ZW0gZGVzY3JpcHRpb24gb2JqZWN0CisgKgorICogVGhp
cyBmdW5jdGlvbiBpbml0aWFsaXplcyBkZWJ1Z2dpbmctcmVsYXRlZCBkYXRhIGZvciB0aGUgZmls
ZSBzeXN0ZW0uCisgKiBSZXR1cm5zIHplcm8gaW4gY2FzZSBvZiBzdWNjZXNzIGFuZCBhIG5lZ2F0
aXZlIGVycm9yIGNvZGUgaW4gY2FzZSBvZgorICogZmFpbHVyZS4KKyAqLworaW50IHViaWZzX2Rl
YnVnZ2luZ19pbml0KHN0cnVjdCB1Ymlmc19pbmZvICpjKQoreworCWMtPmRiZyA9IGt6YWxsb2Mo
c2l6ZW9mKHN0cnVjdCB1Ymlmc19kZWJ1Z19pbmZvKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFjLT5k
YmcpCisJCXJldHVybiAtRU5PTUVNOworCisJcmV0dXJuIDA7Cit9CisKKy8qKgorICogdWJpZnNf
ZGVidWdnaW5nX2V4aXQgLSBmcmVlIGRlYnVnZ2luZyBkYXRhLgorICogQGM6IFVCSUZTIGZpbGUt
c3lzdGVtIGRlc2NyaXB0aW9uIG9iamVjdAorICovCit2b2lkIHViaWZzX2RlYnVnZ2luZ19leGl0
KHN0cnVjdCB1Ymlmc19pbmZvICpjKQoreworCWtmcmVlKGMtPmRiZyk7Cit9CmRpZmYgLXVOIC11
TnIgbGludXgtMy4wL2ZzL3ViaWZzL2RlYnVnLmggbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2Zz
L3ViaWZzL2RlYnVnLmgKLS0tIGxpbnV4LTMuMC9mcy91Ymlmcy9kZWJ1Zy5oCTIwMTEtMDctMjEg
MjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZnMv
dWJpZnMvZGVidWcuaAkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAwMDAwMCAtMDUwMApAQCAtMjks
MjAgKzI5LDI1IEBACiB0eXBlZGVmIGludCAoKmRiZ196bm9kZV9jYWxsYmFjaykoc3RydWN0IHVi
aWZzX2luZm8gKmMsCiAJCQkJICBzdHJ1Y3QgdWJpZnNfem5vZGUgKnpub2RlLCB2b2lkICpwcml2
KTsKIAotI2lmZGVmIENPTkZJR19VQklGU19GU19ERUJVRwotCi0jaW5jbHVkZSA8bGludXgvcmFu
ZG9tLmg+CisvKgorICogVGhlIFVCSUZTIGRlYnVnZnMgZGlyZWN0b3J5IG5hbWUgcGF0dGVybiBh
bmQgbWF4aW11bSBuYW1lIGxlbmd0aCAoMyBmb3IgInViaSIKKyAqICsgMSBmb3IgIl8iIGFuZCBw
bHVzIDJ4MiBmb3IgMiBVQkkgbnVtYmVycyBhbmQgMSBmb3IgdGhlIHRyYWlsaW5nIHplcm8gYnl0
ZS4KKyAqLworI2RlZmluZSBVQklGU19ERlNfRElSX05BTUUgInViaSVkXyVkIgorI2RlZmluZSBV
QklGU19ERlNfRElSX0xFTiAgKDMgKyAxICsgMioyICsgMSkKIAogLyoqCiAgKiB1Ymlmc19kZWJ1
Z19pbmZvIC0gcGVyLUZTIGRlYnVnZ2luZyBpbmZvcm1hdGlvbi4KICAqIEBvbGRfenJvb3Q6IG9s
ZCBpbmRleCByb290IC0gdXNlZCBieSAnZGJnX2NoZWNrX29sZF9pbmRleCgpJwogICogQG9sZF96
cm9vdF9sZXZlbDogb2xkIGluZGV4IHJvb3QgbGV2ZWwgLSB1c2VkIGJ5ICdkYmdfY2hlY2tfb2xk
X2luZGV4KCknCiAgKiBAb2xkX3pyb290X3NxbnVtOiBvbGQgaW5kZXggcm9vdCBzcW51bSAtIHVz
ZWQgYnkgJ2RiZ19jaGVja19vbGRfaW5kZXgoKScKLSAqIEBmYWlsdXJlX21vZGU6IGZhaWx1cmUg
bW9kZSBmb3IgcmVjb3ZlcnkgdGVzdGluZwotICogQGZhaWxfZGVsYXk6IDA9PmRvbid0IGRlbGF5
LCAxPT5kZWxheSBhIHRpbWUsIDI9PmRlbGF5IGEgbnVtYmVyIG9mIGNhbGxzCi0gKiBAZmFpbF90
aW1lb3V0OiB0aW1lIGluIGppZmZpZXMgd2hlbiBkZWxheSBvZiBmYWlsdXJlIG1vZGUgZXhwaXJl
cwotICogQGZhaWxfY250OiBjdXJyZW50IG51bWJlciBvZiBjYWxscyB0byBmYWlsdXJlIG1vZGUg
SS9PIGZ1bmN0aW9ucwotICogQGZhaWxfY250X21heDogbnVtYmVyIG9mIGNhbGxzIGJ5IHdoaWNo
IHRvIGRlbGF5IGZhaWx1cmUgbW9kZQorICoKKyAqIEBwY19oYXBwZW5lZDogbm9uLXplcm8gaWYg
YW4gZW11bGF0ZWQgcG93ZXIgY3V0IGhhcHBlbmVkCisgKiBAcGNfZGVsYXk6IDA9PmRvbid0IGRl
bGF5LCAxPT5kZWxheSBhIHRpbWUsIDI9PmRlbGF5IGEgbnVtYmVyIG9mIGNhbGxzCisgKiBAcGNf
dGltZW91dDogdGltZSBpbiBqaWZmaWVzIHdoZW4gZGVsYXkgb2YgZmFpbHVyZSBtb2RlIGV4cGly
ZXMKKyAqIEBwY19jbnQ6IGN1cnJlbnQgbnVtYmVyIG9mIGNhbGxzIHRvIGZhaWx1cmUgbW9kZSBJ
L08gZnVuY3Rpb25zCisgKiBAcGNfY250X21heDogbnVtYmVyIG9mIGNhbGxzIGJ5IHdoaWNoIHRv
IGRlbGF5IGZhaWx1cmUgbW9kZQorICoKICAqIEBjaGtfbHB0X3N6OiB1c2VkIGJ5IExQVCB0cmVl
IHNpemUgY2hlY2tlcgogICogQGNoa19scHRfc3oyOiB1c2VkIGJ5IExQVCB0cmVlIHNpemUgY2hl
Y2tlcgogICogQGNoa19scHRfd2FzdGFnZTogdXNlZCBieSBMUFQgdHJlZSBzaXplIGNoZWNrZXIK
QEAgLTU2LDIxICs2MSwzNiBAQAogICogQHNhdmVkX2ZyZWU6IHNhdmVkIGFtb3VudCBvZiBmcmVl
IHNwYWNlCiAgKiBAc2F2ZWRfaWR4X2djX2NudDogc2F2ZWQgdmFsdWUgb2YgQGMtPmlkeF9nY19j
bnQKICAqCisgKiBAY2hrX2dlbjogaWYgZ2VuZXJhbCBleHRyYSBjaGVja3MgYXJlIGVuYWJsZWQK
KyAqIEBjaGtfaW5kZXg6IGlmIGluZGV4IHh0cmEgY2hlY2tzIGFyZSBlbmFibGVkCisgKiBAY2hr
X29ycGg6IGlmIG9ycGhhbnMgZXh0cmEgY2hlY2tzIGFyZSBlbmFibGVkCisgKiBAY2hrX2xwcm9w
czogaWYgbHByb3BzIGV4dHJhIGNoZWNrcyBhcmUgZW5hYmxlZAorICogQGNoa19mczogaWYgVUJJ
RlMgY29udGVudHMgZXh0cmEgY2hlY2tzIGFyZSBlbmFibGVkCisgKiBAdHN0X3JjdnJ5OiBpZiBV
QklGUyByZWNvdmVyeSB0ZXN0aW5nIG1vZGUgZW5hYmxlZAorICoKICAqIEBkZnNfZGlyX25hbWU6
IG5hbWUgb2YgZGVidWdmcyBkaXJlY3RvcnkgY29udGFpbmluZyB0aGlzIGZpbGUtc3lzdGVtJ3Mg
ZmlsZXMKICAqIEBkZnNfZGlyOiBkaXJlbnRyeSBvYmplY3Qgb2YgdGhlIGZpbGUtc3lzdGVtIGRl
YnVnZnMgZGlyZWN0b3J5CiAgKiBAZGZzX2R1bXBfbHByb3BzOiAiZHVtcCBscHJvcHMiIGRlYnVn
ZnMga25vYgogICogQGRmc19kdW1wX2J1ZGc6ICJkdW1wIGJ1ZGdldGluZyBpbmZvcm1hdGlvbiIg
ZGVidWdmcyBrbm9iCiAgKiBAZGZzX2R1bXBfdG5jOiAiZHVtcCBUTkMiIGRlYnVnZnMga25vYgor
ICogQGRmc19jaGtfZ2VuOiBkZWJ1Z2ZzIGtub2IgdG8gZW5hYmxlIFVCSUZTIGdlbmVyYWwgZXh0
cmEgY2hlY2tzCisgKiBAZGZzX2Noa19pbmRleDogZGVidWdmcyBrbm9iIHRvIGVuYWJsZSBVQklG
UyBpbmRleCBleHRyYSBjaGVja3MKKyAqIEBkZnNfY2hrX29ycGg6IGRlYnVnZnMga25vYiB0byBl
bmFibGUgVUJJRlMgb3JwaGFucyBleHRyYSBjaGVja3MKKyAqIEBkZnNfY2hrX2xwcm9wczogZGVi
dWdmcyBrbm9iIHRvIGVuYWJsZSBVQklGUyBMRVAgcHJvcGVydGllcyBleHRyYSBjaGVja3MKKyAq
IEBkZnNfY2hrX2ZzOiBkZWJ1Z2ZzIGtub2IgdG8gZW5hYmxlIFVCSUZTIGNvbnRlbnRzIGV4dHJh
IGNoZWNrcworICogQGRmc190c3RfcmN2cnk6IGRlYnVnZnMga25vYiB0byBlbmFibGUgVUJJRlMg
cmVjb3ZlcnkgdGVzdGluZwogICovCiBzdHJ1Y3QgdWJpZnNfZGVidWdfaW5mbyB7CiAJc3RydWN0
IHViaWZzX3picmFuY2ggb2xkX3pyb290OwogCWludCBvbGRfenJvb3RfbGV2ZWw7CiAJdW5zaWdu
ZWQgbG9uZyBsb25nIG9sZF96cm9vdF9zcW51bTsKLQlpbnQgZmFpbHVyZV9tb2RlOwotCWludCBm
YWlsX2RlbGF5OwotCXVuc2lnbmVkIGxvbmcgZmFpbF90aW1lb3V0OwotCXVuc2lnbmVkIGludCBm
YWlsX2NudDsKLQl1bnNpZ25lZCBpbnQgZmFpbF9jbnRfbWF4OworCisJaW50IHBjX2hhcHBlbmVk
OworCWludCBwY19kZWxheTsKKwl1bnNpZ25lZCBsb25nIHBjX3RpbWVvdXQ7CisJdW5zaWduZWQg
aW50IHBjX2NudDsKKwl1bnNpZ25lZCBpbnQgcGNfY250X21heDsKKwogCWxvbmcgbG9uZyBjaGtf
bHB0X3N6OwogCWxvbmcgbG9uZyBjaGtfbHB0X3N6MjsKIAlsb25nIGxvbmcgY2hrX2xwdF93YXN0
YWdlOwpAQCAtODQsMTggKzEwNCw1MCBAQAogCWxvbmcgbG9uZyBzYXZlZF9mcmVlOwogCWludCBz
YXZlZF9pZHhfZ2NfY250OwogCi0JY2hhciBkZnNfZGlyX25hbWVbMTAwXTsKKwl1bnNpZ25lZCBp
bnQgY2hrX2dlbjoxOworCXVuc2lnbmVkIGludCBjaGtfaW5kZXg6MTsKKwl1bnNpZ25lZCBpbnQg
Y2hrX29ycGg6MTsKKwl1bnNpZ25lZCBpbnQgY2hrX2xwcm9wczoxOworCXVuc2lnbmVkIGludCBj
aGtfZnM6MTsKKwl1bnNpZ25lZCBpbnQgdHN0X3JjdnJ5OjE7CisKKwljaGFyIGRmc19kaXJfbmFt
ZVtVQklGU19ERlNfRElSX0xFTiArIDFdOwogCXN0cnVjdCBkZW50cnkgKmRmc19kaXI7CiAJc3Ry
dWN0IGRlbnRyeSAqZGZzX2R1bXBfbHByb3BzOwogCXN0cnVjdCBkZW50cnkgKmRmc19kdW1wX2J1
ZGc7CiAJc3RydWN0IGRlbnRyeSAqZGZzX2R1bXBfdG5jOworCXN0cnVjdCBkZW50cnkgKmRmc19j
aGtfZ2VuOworCXN0cnVjdCBkZW50cnkgKmRmc19jaGtfaW5kZXg7CisJc3RydWN0IGRlbnRyeSAq
ZGZzX2Noa19vcnBoOworCXN0cnVjdCBkZW50cnkgKmRmc19jaGtfbHByb3BzOworCXN0cnVjdCBk
ZW50cnkgKmRmc19jaGtfZnM7CisJc3RydWN0IGRlbnRyeSAqZGZzX3RzdF9yY3ZyeTsKK307CisK
Ky8qKgorICogdWJpZnNfZ2xvYmFsX2RlYnVnX2luZm8gLSBnbG9iYWwgKG5vdCBwZXItRlMpIFVC
SUZTIGRlYnVnZ2luZyBpbmZvcm1hdGlvbi4KKyAqCisgKiBAY2hrX2dlbjogaWYgZ2VuZXJhbCBl
eHRyYSBjaGVja3MgYXJlIGVuYWJsZWQKKyAqIEBjaGtfaW5kZXg6IGlmIGluZGV4IHh0cmEgY2hl
Y2tzIGFyZSBlbmFibGVkCisgKiBAY2hrX29ycGg6IGlmIG9ycGhhbnMgZXh0cmEgY2hlY2tzIGFy
ZSBlbmFibGVkCisgKiBAY2hrX2xwcm9wczogaWYgbHByb3BzIGV4dHJhIGNoZWNrcyBhcmUgZW5h
YmxlZAorICogQGNoa19mczogaWYgVUJJRlMgY29udGVudHMgZXh0cmEgY2hlY2tzIGFyZSBlbmFi
bGVkCisgKiBAdHN0X3JjdnJ5OiBpZiBVQklGUyByZWNvdmVyeSB0ZXN0aW5nIG1vZGUgZW5hYmxl
ZAorICovCitzdHJ1Y3QgdWJpZnNfZ2xvYmFsX2RlYnVnX2luZm8geworCXVuc2lnbmVkIGludCBj
aGtfZ2VuOjE7CisJdW5zaWduZWQgaW50IGNoa19pbmRleDoxOworCXVuc2lnbmVkIGludCBjaGtf
b3JwaDoxOworCXVuc2lnbmVkIGludCBjaGtfbHByb3BzOjE7CisJdW5zaWduZWQgaW50IGNoa19m
czoxOworCXVuc2lnbmVkIGludCB0c3RfcmN2cnk6MTsKIH07CiAKICNkZWZpbmUgdWJpZnNfYXNz
ZXJ0KGV4cHIpIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCiAJaWYgKHVubGlrZWx5KCEoZXhwcikpKSB7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCiAJCXByaW50ayhLRVJOX0NSSVQgIlVCSUZTIGFzc2Vy
dCBmYWlsZWQgaW4gJXMgYXQgJXUgKHBpZCAlZClcbiIsIFwKIAkJICAgICAgIF9fZnVuY19fLCBf
X0xJTkVfXywgY3VycmVudC0+cGlkKTsgICAgICAgICAgICAgICAgICAgICAgXAotCQlkYmdfZHVt
cF9zdGFjaygpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CisJCWR1bXBfc3RhY2soKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKIAl9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIH0gd2hpbGUgKDApCiAKQEAgLTEwNyw0NiAr
MTU5LDM5IEBACiAJfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCiB9IHdoaWxlICgwKQogCi0jZGVmaW5lIGRiZ19k
dW1wX3N0YWNrKCkgZHVtcF9zdGFjaygpCisjZGVmaW5lIHViaWZzX2RiZ19tc2codHlwZSwgZm10
LCAuLi4pIFwKKwlwcl9kZWJ1ZygiVUJJRlMgREJHICIgdHlwZSAiOiAiIGZtdCAiXG4iLCAjI19f
VkFfQVJHU19fKQogCi0jZGVmaW5lIGRiZ19lcnIoZm10LCAuLi4pIGRvIHsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCXNwaW5fbG9jaygmZGJnX2xv
Y2spOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAot
CXViaWZzX2VycihmbXQsICMjX19WQV9BUkdTX18pOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAotCXNwaW5fdW5sb2NrKCZkYmdfbG9jayk7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotfSB3aGlsZSAoMCkKLQotY29uc3Qg
Y2hhciAqZGJnX2tleV9zdHIwKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLAotCQkJIGNvbnN0
IHVuaW9uIHViaWZzX2tleSAqa2V5KTsKLWNvbnN0IGNoYXIgKmRiZ19rZXlfc3RyMShjb25zdCBz
dHJ1Y3QgdWJpZnNfaW5mbyAqYywKLQkJCSBjb25zdCB1bmlvbiB1Ymlmc19rZXkgKmtleSk7Ci0K
LS8qCi0gKiBEQkdLRVkgbWFjcm9zIHJlcXVpcmUgQGRiZ19sb2NrIHRvIGJlIGhlbGQsIHdoaWNo
IGl0IGlzIGluIHRoZSBkYmcgbWVzc2FnZQotICogbWFjcm9zLgotICovCi0jZGVmaW5lIERCR0tF
WShrZXkpIGRiZ19rZXlfc3RyMChjLCAoa2V5KSkKLSNkZWZpbmUgREJHS0VZMShrZXkpIGRiZ19r
ZXlfc3RyMShjLCAoa2V5KSkKLQotI2RlZmluZSB1Ymlmc19kYmdfbXNnKHR5cGUsIGZtdCwgLi4u
KSBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgXAotCXNwaW5fbG9jaygmZGJnX2xvY2spOyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0JcHJfZGVidWcoIlVCSUZTIERC
RyAiIHR5cGUgIjogIiBmbXQgIlxuIiwgIyNfX1ZBX0FSR1NfXyk7IFwKLQlzcGluX3VubG9jaygm
ZGJnX2xvY2spOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorI2RlZmluZSBE
QkdfS0VZX0JVRl9MRU4gMzIKKyNkZWZpbmUgdWJpZnNfZGJnX21zZ19rZXkodHlwZSwga2V5LCBm
bXQsIC4uLikgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisJY2hhciBfX3RtcF9r
ZXlfYnVmW0RCR19LRVlfQlVGX0xFTl07ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCisJcHJfZGVidWcoIlVCSUZTIERCRyAiIHR5cGUgIjogIiBmbXQgIiVzXG4iLCAjI19fVkFf
QVJHU19fLCAgICAgICAgICAgICBcCisJCSBkYmdfc25wcmludGZfa2V5KGMsIGtleSwgX190bXBf
a2V5X2J1ZiwgREJHX0tFWV9CVUZfTEVOKSk7ICAgIFwKIH0gd2hpbGUgKDApCiAKIC8qIEp1c3Qg
YSBkZWJ1Z2dpbmcgbWVzc2FnZXMgbm90IHJlbGF0ZWQgdG8gYW55IHNwZWNpZmljIFVCSUZTIHN1
YnN5c3RlbSAqLwotI2RlZmluZSBkYmdfbXNnKGZtdCwgLi4uKSAgIHViaWZzX2RiZ19tc2coIm1z
ZyIsIGZtdCwgIyNfX1ZBX0FSR1NfXykKKyNkZWZpbmUgZGJnX21zZyhmbXQsIC4uLikgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisJcHJpbnRr
KEtFUk5fREVCVUcgIlVCSUZTIERCRyAocGlkICVkKTogJXM6ICIgZm10ICJcbiIsIGN1cnJlbnQt
PnBpZCwgICBcCisJICAgICAgIF9fZnVuY19fLCAjI19fVkFfQVJHU19fKQorCiAvKiBHZW5lcmFs
IG1lc3NhZ2VzICovCiAjZGVmaW5lIGRiZ19nZW4oZm10LCAuLi4pICAgdWJpZnNfZGJnX21zZygi
Z2VuIiwgZm10LCAjI19fVkFfQVJHU19fKQogLyogQWRkaXRpb25hbCBqb3VybmFsIG1lc3NhZ2Vz
ICovCiAjZGVmaW5lIGRiZ19qbmwoZm10LCAuLi4pICAgdWJpZnNfZGJnX21zZygiam5sIiwgZm10
LCAjI19fVkFfQVJHU19fKQorI2RlZmluZSBkYmdfam5sayhrZXksIGZtdCwgLi4uKSBcCisJdWJp
ZnNfZGJnX21zZ19rZXkoImpubCIsIGtleSwgZm10LCAjI19fVkFfQVJHU19fKQogLyogQWRkaXRp
b25hbCBUTkMgbWVzc2FnZXMgKi8KICNkZWZpbmUgZGJnX3RuYyhmbXQsIC4uLikgICB1Ymlmc19k
YmdfbXNnKCJ0bmMiLCBmbXQsICMjX19WQV9BUkdTX18pCisjZGVmaW5lIGRiZ190bmNrKGtleSwg
Zm10LCAuLi4pIFwKKwl1Ymlmc19kYmdfbXNnX2tleSgidG5jIiwga2V5LCBmbXQsICMjX19WQV9B
UkdTX18pCiAvKiBBZGRpdGlvbmFsIGxwcm9wcyBtZXNzYWdlcyAqLwogI2RlZmluZSBkYmdfbHAo
Zm10LCAuLi4pICAgIHViaWZzX2RiZ19tc2coImxwIiwgZm10LCAjI19fVkFfQVJHU19fKQogLyog
QWRkaXRpb25hbCBMRUIgZmluZCBtZXNzYWdlcyAqLwogI2RlZmluZSBkYmdfZmluZChmbXQsIC4u
LikgIHViaWZzX2RiZ19tc2coImZpbmQiLCBmbXQsICMjX19WQV9BUkdTX18pCiAvKiBBZGRpdGlv
bmFsIG1vdW50IG1lc3NhZ2VzICovCiAjZGVmaW5lIGRiZ19tbnQoZm10LCAuLi4pICAgdWJpZnNf
ZGJnX21zZygibW50IiwgZm10LCAjI19fVkFfQVJHU19fKQorI2RlZmluZSBkYmdfbW50ayhrZXks
IGZtdCwgLi4uKSBcCisJdWJpZnNfZGJnX21zZ19rZXkoIm1udCIsIGtleSwgZm10LCAjI19fVkFf
QVJHU19fKQogLyogQWRkaXRpb25hbCBJL08gbWVzc2FnZXMgKi8KICNkZWZpbmUgZGJnX2lvKGZt
dCwgLi4uKSAgICB1Ymlmc19kYmdfbXNnKCJpbyIsIGZtdCwgIyNfX1ZBX0FSR1NfXykKIC8qIEFk
ZGl0aW9uYWwgY29tbWl0IG1lc3NhZ2VzICovCkBAIC0xNjIsNDEgKzIwNywzNiBAQAogLyogQWRk
aXRpb25hbCByZWNvdmVyeSBtZXNzYWdlcyAqLwogI2RlZmluZSBkYmdfcmN2cnkoZm10LCAuLi4p
IHViaWZzX2RiZ19tc2coInJjdnJ5IiwgZm10LCAjI19fVkFfQVJHU19fKQogCi0vKgotICogRGVi
dWdnaW5nIGNoZWNrIGZsYWdzLgotICoKLSAqIFVCSUZTX0NIS19HRU46IGdlbmVyYWwgY2hlY2tz
Ci0gKiBVQklGU19DSEtfVE5DOiBjaGVjayBUTkMKLSAqIFVCSUZTX0NIS19JRFhfU1o6IGNoZWNr
IGluZGV4IHNpemUKLSAqIFVCSUZTX0NIS19PUlBIOiBjaGVjayBvcnBoYW5zCi0gKiBVQklGU19D
SEtfT0xEX0lEWDogY2hlY2sgdGhlIG9sZCBpbmRleAotICogVUJJRlNfQ0hLX0xQUk9QUzogY2hl
Y2sgbHByb3BzCi0gKiBVQklGU19DSEtfRlM6IGNoZWNrIHRoZSBmaWxlLXN5c3RlbQotICovCi1l
bnVtIHsKLQlVQklGU19DSEtfR0VOICAgICA9IDB4MSwKLQlVQklGU19DSEtfVE5DICAgICA9IDB4
MiwKLQlVQklGU19DSEtfSURYX1NaICA9IDB4NCwKLQlVQklGU19DSEtfT1JQSCAgICA9IDB4OCwK
LQlVQklGU19DSEtfT0xEX0lEWCA9IDB4MTAsCi0JVUJJRlNfQ0hLX0xQUk9QUyAgPSAweDIwLAot
CVVCSUZTX0NIS19GUyAgICAgID0gMHg0MCwKLX07CitleHRlcm4gc3RydWN0IHViaWZzX2dsb2Jh
bF9kZWJ1Z19pbmZvIHViaWZzX2RiZzsKIAotLyoKLSAqIFNwZWNpYWwgdGVzdGluZyBmbGFncy4K
LSAqCi0gKiBVQklGU19UU1RfUkNWUlk6IGZhaWx1cmUgbW9kZSBmb3IgcmVjb3ZlcnkgdGVzdGlu
ZwotICovCi1lbnVtIHsKLQlVQklGU19UU1RfUkNWUlkgICAgICAgICAgICAgPSAweDQsCi19Owot
Ci1leHRlcm4gc3BpbmxvY2tfdCBkYmdfbG9jazsKLQotZXh0ZXJuIHVuc2lnbmVkIGludCB1Ymlm
c19tc2dfZmxhZ3M7Ci1leHRlcm4gdW5zaWduZWQgaW50IHViaWZzX2Noa19mbGFnczsKLWV4dGVy
biB1bnNpZ25lZCBpbnQgdWJpZnNfdHN0X2ZsYWdzOworc3RhdGljIGlubGluZSBpbnQgZGJnX2lz
X2Noa19nZW4oY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMpCit7CisJcmV0dXJuICEhKHViaWZz
X2RiZy5jaGtfZ2VuIHx8IGMtPmRiZy0+Y2hrX2dlbik7Cit9CitzdGF0aWMgaW5saW5lIGludCBk
YmdfaXNfY2hrX2luZGV4KGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjKQoreworCXJldHVybiAh
ISh1Ymlmc19kYmcuY2hrX2luZGV4IHx8IGMtPmRiZy0+Y2hrX2luZGV4KTsKK30KK3N0YXRpYyBp
bmxpbmUgaW50IGRiZ19pc19jaGtfb3JwaChjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKK3sK
KwlyZXR1cm4gISEodWJpZnNfZGJnLmNoa19vcnBoIHx8IGMtPmRiZy0+Y2hrX29ycGgpOworfQor
c3RhdGljIGlubGluZSBpbnQgZGJnX2lzX2Noa19scHJvcHMoY29uc3Qgc3RydWN0IHViaWZzX2lu
Zm8gKmMpCit7CisJcmV0dXJuICEhKHViaWZzX2RiZy5jaGtfbHByb3BzIHx8IGMtPmRiZy0+Y2hr
X2xwcm9wcyk7Cit9CitzdGF0aWMgaW5saW5lIGludCBkYmdfaXNfY2hrX2ZzKGNvbnN0IHN0cnVj
dCB1Ymlmc19pbmZvICpjKQoreworCXJldHVybiAhISh1Ymlmc19kYmcuY2hrX2ZzIHx8IGMtPmRi
Zy0+Y2hrX2ZzKTsKK30KK3N0YXRpYyBpbmxpbmUgaW50IGRiZ19pc190c3RfcmN2cnkoY29uc3Qg
c3RydWN0IHViaWZzX2luZm8gKmMpCit7CisJcmV0dXJuICEhKHViaWZzX2RiZy50c3RfcmN2cnkg
fHwgYy0+ZGJnLT50c3RfcmN2cnkpOworfQorc3RhdGljIGlubGluZSBpbnQgZGJnX2lzX3Bvd2Vy
X2N1dChjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKK3sKKwlyZXR1cm4gISFjLT5kYmctPnBj
X2hhcHBlbmVkOworfQogCiBpbnQgdWJpZnNfZGVidWdnaW5nX2luaXQoc3RydWN0IHViaWZzX2lu
Zm8gKmMpOwogdm9pZCB1Ymlmc19kZWJ1Z2dpbmdfZXhpdChzdHJ1Y3QgdWJpZnNfaW5mbyAqYyk7
CkBAIC0yMDcsMjUgKzI0NywyOSBAQAogY29uc3QgY2hhciAqZGJnX2poZWFkKGludCBqaGVhZCk7
CiBjb25zdCBjaGFyICpkYmdfZ2V0X2tleV9kdW1wKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpj
LAogCQkJICAgICBjb25zdCB1bmlvbiB1Ymlmc19rZXkgKmtleSk7Ci12b2lkIGRiZ19kdW1wX2lu
b2RlKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2Rl
KTsKLXZvaWQgZGJnX2R1bXBfbm9kZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgY29uc3Qg
dm9pZCAqbm9kZSk7Ci12b2lkIGRiZ19kdW1wX2xwdF9ub2RlKGNvbnN0IHN0cnVjdCB1Ymlmc19p
bmZvICpjLCB2b2lkICpub2RlLCBpbnQgbG51bSwKLQkJICAgICAgIGludCBvZmZzKTsKLXZvaWQg
ZGJnX2R1bXBfYnVkZ2V0X3JlcShjb25zdCBzdHJ1Y3QgdWJpZnNfYnVkZ2V0X3JlcSAqcmVxKTsK
LXZvaWQgZGJnX2R1bXBfbHN0YXRzKGNvbnN0IHN0cnVjdCB1Ymlmc19scF9zdGF0cyAqbHN0KTsK
LXZvaWQgZGJnX2R1bXBfYnVkZyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgY29uc3Qgc3RydWN0IHVi
aWZzX2J1ZGdfaW5mbyAqYmkpOwotdm9pZCBkYmdfZHVtcF9scHJvcChjb25zdCBzdHJ1Y3QgdWJp
ZnNfaW5mbyAqYywgY29uc3Qgc3RydWN0IHViaWZzX2xwcm9wcyAqbHApOwotdm9pZCBkYmdfZHVt
cF9scHJvcHMoc3RydWN0IHViaWZzX2luZm8gKmMpOwotdm9pZCBkYmdfZHVtcF9scHRfaW5mbyhz
dHJ1Y3QgdWJpZnNfaW5mbyAqYyk7Ci12b2lkIGRiZ19kdW1wX2xlYihjb25zdCBzdHJ1Y3QgdWJp
ZnNfaW5mbyAqYywgaW50IGxudW0pOwotdm9pZCBkYmdfZHVtcF96bm9kZShjb25zdCBzdHJ1Y3Qg
dWJpZnNfaW5mbyAqYywKLQkJICAgIGNvbnN0IHN0cnVjdCB1Ymlmc196bm9kZSAqem5vZGUpOwot
dm9pZCBkYmdfZHVtcF9oZWFwKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgdWJpZnNfbHB0
X2hlYXAgKmhlYXAsIGludCBjYXQpOwotdm9pZCBkYmdfZHVtcF9wbm9kZShzdHJ1Y3QgdWJpZnNf
aW5mbyAqYywgc3RydWN0IHViaWZzX3Bub2RlICpwbm9kZSwKLQkJICAgIHN0cnVjdCB1Ymlmc19u
bm9kZSAqcGFyZW50LCBpbnQgaWlwKTsKLXZvaWQgZGJnX2R1bXBfdG5jKHN0cnVjdCB1Ymlmc19p
bmZvICpjKTsKLXZvaWQgZGJnX2R1bXBfaW5kZXgoc3RydWN0IHViaWZzX2luZm8gKmMpOwotdm9p
ZCBkYmdfZHVtcF9scHRfbGVicyhjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYyk7Citjb25zdCBj
aGFyICpkYmdfc25wcmludGZfa2V5KGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLAorCQkJICAg
ICBjb25zdCB1bmlvbiB1Ymlmc19rZXkgKmtleSwgY2hhciAqYnVmZmVyLCBpbnQgbGVuKTsKK3Zv
aWQgdWJpZnNfZHVtcF9pbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgY29uc3Qgc3RydWN0IGlu
b2RlICppbm9kZSk7Cit2b2lkIHViaWZzX2R1bXBfbm9kZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5m
byAqYywgY29uc3Qgdm9pZCAqbm9kZSk7Cit2b2lkIHViaWZzX2R1bXBfYnVkZ2V0X3JlcShjb25z
dCBzdHJ1Y3QgdWJpZnNfYnVkZ2V0X3JlcSAqcmVxKTsKK3ZvaWQgdWJpZnNfZHVtcF9sc3RhdHMo
Y29uc3Qgc3RydWN0IHViaWZzX2xwX3N0YXRzICpsc3QpOwordm9pZCB1Ymlmc19kdW1wX2J1ZGco
c3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCB1Ymlmc19idWRnX2luZm8gKmJpKTsK
K3ZvaWQgdWJpZnNfZHVtcF9scHJvcChjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKKwkJICAg
ICAgY29uc3Qgc3RydWN0IHViaWZzX2xwcm9wcyAqbHApOwordm9pZCB1Ymlmc19kdW1wX2xwcm9w
cyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYyk7Cit2b2lkIHViaWZzX2R1bXBfbHB0X2luZm8oc3RydWN0
IHViaWZzX2luZm8gKmMpOwordm9pZCB1Ymlmc19kdW1wX2xlYihjb25zdCBzdHJ1Y3QgdWJpZnNf
aW5mbyAqYywgaW50IGxudW0pOwordm9pZCB1Ymlmc19kdW1wX3NsZWIoY29uc3Qgc3RydWN0IHVi
aWZzX2luZm8gKmMsCisJCSAgICAgY29uc3Qgc3RydWN0IHViaWZzX3NjYW5fbGViICpzbGViLCBp
bnQgb2Zmcyk7Cit2b2lkIHViaWZzX2R1bXBfem5vZGUoY29uc3Qgc3RydWN0IHViaWZzX2luZm8g
KmMsCisJCSAgICAgIGNvbnN0IHN0cnVjdCB1Ymlmc196bm9kZSAqem5vZGUpOwordm9pZCB1Ymlm
c19kdW1wX2hlYXAoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCB1Ymlmc19scHRfaGVhcCAq
aGVhcCwKKwkJICAgICBpbnQgY2F0KTsKK3ZvaWQgdWJpZnNfZHVtcF9wbm9kZShzdHJ1Y3QgdWJp
ZnNfaW5mbyAqYywgc3RydWN0IHViaWZzX3Bub2RlICpwbm9kZSwKKwkJICAgICAgc3RydWN0IHVi
aWZzX25ub2RlICpwYXJlbnQsIGludCBpaXApOwordm9pZCB1Ymlmc19kdW1wX3RuYyhzdHJ1Y3Qg
dWJpZnNfaW5mbyAqYyk7Cit2b2lkIHViaWZzX2R1bXBfaW5kZXgoc3RydWN0IHViaWZzX2luZm8g
KmMpOwordm9pZCB1Ymlmc19kdW1wX2xwdF9sZWJzKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpj
KTsKIAogaW50IGRiZ193YWxrX2luZGV4KHN0cnVjdCB1Ymlmc19pbmZvICpjLCBkYmdfbGVhZl9j
YWxsYmFjayBsZWFmX2NiLAogCQkgICBkYmdfem5vZGVfY2FsbGJhY2sgem5vZGVfY2IsIHZvaWQg
KnByaXYpOwpAQCAtMjQwLDggKzI4NCw4IEBACiBpbnQgZGJnX2NoZWNrX2x0YWIoc3RydWN0IHVi
aWZzX2luZm8gKmMpOwogaW50IGRiZ19jaGtfbHB0X2ZyZWVfc3BjKHN0cnVjdCB1Ymlmc19pbmZv
ICpjKTsKIGludCBkYmdfY2hrX2xwdF9zeihzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgaW50IGFjdGlv
biwgaW50IGxlbik7Ci1pbnQgZGJnX2NoZWNrX3N5bmNlZF9pX3NpemUoc3RydWN0IGlub2RlICpp
bm9kZSk7Ci1pbnQgZGJnX2NoZWNrX2Rpcl9zaXplKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25z
dCBzdHJ1Y3QgaW5vZGUgKmRpcik7CitpbnQgZGJnX2NoZWNrX3N5bmNlZF9pX3NpemUoY29uc3Qg
c3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCBpbm9kZSAqaW5vZGUpOworaW50IGRiZ19jaGVj
a19kaXIoc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCBpbm9kZSAqZGlyKTsKIGlu
dCBkYmdfY2hlY2tfdG5jKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgZXh0cmEpOwogaW50IGRi
Z19jaGVja19pZHhfc2l6ZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgbG9uZyBsb25nIGlkeF9zaXpl
KTsKIGludCBkYmdfY2hlY2tfZmlsZXN5c3RlbShzdHJ1Y3QgdWJpZnNfaW5mbyAqYyk7CkBAIC0y
NTQsNTQgKzI5OCwxMSBAQAogaW50IGRiZ19jaGVja19kYXRhX25vZGVzX29yZGVyKHN0cnVjdCB1
Ymlmc19pbmZvICpjLCBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkKTsKIGludCBkYmdfY2hlY2tfbm9u
ZGF0YV9ub2Rlc19vcmRlcihzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IGxpc3RfaGVhZCAq
aGVhZCk7CiAKLS8qIEZvcmNlIHRoZSB1c2Ugb2YgaW4tdGhlLWdhcHMgbWV0aG9kIGZvciB0ZXN0
aW5nICovCi1zdGF0aWMgaW5saW5lIGludCBkYmdfZm9yY2VfaW5fdGhlX2dhcHNfZW5hYmxlZCh2
b2lkKQotewotCXJldHVybiB1Ymlmc19jaGtfZmxhZ3MgJiBVQklGU19DSEtfR0VOOwotfQotaW50
IGRiZ19mb3JjZV9pbl90aGVfZ2Fwcyh2b2lkKTsKLQotLyogRmFpbHVyZSBtb2RlIGZvciByZWNv
dmVyeSB0ZXN0aW5nICovCi0jZGVmaW5lIGRiZ19mYWlsdXJlX21vZGUgKHViaWZzX3RzdF9mbGFn
cyAmIFVCSUZTX1RTVF9SQ1ZSWSkKLQotI2lmbmRlZiBVQklGU19EQkdfUFJFU0VSVkVfVUJJCi0j
ZGVmaW5lIHViaV9sZWJfcmVhZCAgIGRiZ19sZWJfcmVhZAotI2RlZmluZSB1YmlfbGViX3dyaXRl
ICBkYmdfbGViX3dyaXRlCi0jZGVmaW5lIHViaV9sZWJfY2hhbmdlIGRiZ19sZWJfY2hhbmdlCi0j
ZGVmaW5lIHViaV9sZWJfZXJhc2UgIGRiZ19sZWJfZXJhc2UKLSNkZWZpbmUgdWJpX2xlYl91bm1h
cCAgZGJnX2xlYl91bm1hcAotI2RlZmluZSB1YmlfaXNfbWFwcGVkICBkYmdfaXNfbWFwcGVkCi0j
ZGVmaW5lIHViaV9sZWJfbWFwICAgIGRiZ19sZWJfbWFwCi0jZW5kaWYKLQotaW50IGRiZ19sZWJf
cmVhZChzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgbG51bSwgY2hhciAqYnVmLCBp
bnQgb2Zmc2V0LAotCQkgaW50IGxlbiwgaW50IGNoZWNrKTsKLWludCBkYmdfbGViX3dyaXRlKHN0
cnVjdCB1Ymlfdm9sdW1lX2Rlc2MgKmRlc2MsIGludCBsbnVtLCBjb25zdCB2b2lkICpidWYsCi0J
CSAgaW50IG9mZnNldCwgaW50IGxlbiwgaW50IGR0eXBlKTsKLWludCBkYmdfbGViX2NoYW5nZShz
dHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgbG51bSwgY29uc3Qgdm9pZCAqYnVmLAot
CQkgICBpbnQgbGVuLCBpbnQgZHR5cGUpOwotaW50IGRiZ19sZWJfZXJhc2Uoc3RydWN0IHViaV92
b2x1bWVfZGVzYyAqZGVzYywgaW50IGxudW0pOwotaW50IGRiZ19sZWJfdW5tYXAoc3RydWN0IHVi
aV92b2x1bWVfZGVzYyAqZGVzYywgaW50IGxudW0pOwotaW50IGRiZ19pc19tYXBwZWQoc3RydWN0
IHViaV92b2x1bWVfZGVzYyAqZGVzYywgaW50IGxudW0pOwotaW50IGRiZ19sZWJfbWFwKHN0cnVj
dCB1Ymlfdm9sdW1lX2Rlc2MgKmRlc2MsIGludCBsbnVtLCBpbnQgZHR5cGUpOwotCi1zdGF0aWMg
aW5saW5lIGludCBkYmdfcmVhZChzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgbG51
bSwgY2hhciAqYnVmLAotCQkJICAgaW50IG9mZnNldCwgaW50IGxlbikKLXsKLQlyZXR1cm4gZGJn
X2xlYl9yZWFkKGRlc2MsIGxudW0sIGJ1Ziwgb2Zmc2V0LCBsZW4sIDApOwotfQotCi1zdGF0aWMg
aW5saW5lIGludCBkYmdfd3JpdGUoc3RydWN0IHViaV92b2x1bWVfZGVzYyAqZGVzYywgaW50IGxu
dW0sCi0JCQkgICAgY29uc3Qgdm9pZCAqYnVmLCBpbnQgb2Zmc2V0LCBpbnQgbGVuKQotewotCXJl
dHVybiBkYmdfbGViX3dyaXRlKGRlc2MsIGxudW0sIGJ1Ziwgb2Zmc2V0LCBsZW4sIFVCSV9VTktO
T1dOKTsKLX0KLQotc3RhdGljIGlubGluZSBpbnQgZGJnX2NoYW5nZShzdHJ1Y3QgdWJpX3ZvbHVt
ZV9kZXNjICpkZXNjLCBpbnQgbG51bSwKLQkJCQkgICAgY29uc3Qgdm9pZCAqYnVmLCBpbnQgbGVu
KQotewotCXJldHVybiBkYmdfbGViX2NoYW5nZShkZXNjLCBsbnVtLCBidWYsIGxlbiwgVUJJX1VO
S05PV04pOwotfQoraW50IGRiZ19sZWJfd3JpdGUoc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBs
bnVtLCBjb25zdCB2b2lkICpidWYsIGludCBvZmZzLAorCQkgIGludCBsZW4pOworaW50IGRiZ19s
ZWJfY2hhbmdlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSwgY29uc3Qgdm9pZCAqYnVm
LCBpbnQgbGVuKTsKK2ludCBkYmdfbGViX3VubWFwKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQg
bG51bSk7CitpbnQgZGJnX2xlYl9tYXAoc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBsbnVtKTsK
IAogLyogRGVidWdmcy1yZWxhdGVkIHN0dWZmICovCiBpbnQgZGJnX2RlYnVnZnNfaW5pdCh2b2lk
KTsKQEAgLTMwOSwxMzYgKzMxMCw0IEBACiBpbnQgZGJnX2RlYnVnZnNfaW5pdF9mcyhzdHJ1Y3Qg
dWJpZnNfaW5mbyAqYyk7CiB2b2lkIGRiZ19kZWJ1Z2ZzX2V4aXRfZnMoc3RydWN0IHViaWZzX2lu
Zm8gKmMpOwogCi0jZWxzZSAvKiAhQ09ORklHX1VCSUZTX0ZTX0RFQlVHICovCi0KLS8qIFVzZSAi
aWYgKDApIiB0byBtYWtlIGNvbXBpbGVyIGNoZWNrIGFyZ3VtZW50cyBldmVuIGlmIGRlYnVnZ2lu
ZyBpcyBvZmYgKi8KLSNkZWZpbmUgdWJpZnNfYXNzZXJ0KGV4cHIpICBkbyB7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0JaWYgKDAgJiYgKGV4cHIpKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0J
CXByaW50ayhLRVJOX0NSSVQgIlVCSUZTIGFzc2VydCBmYWlsZWQgaW4gJXMgYXQgJXUgKHBpZCAl
ZClcbiIsIFwKLQkJICAgICAgIF9fZnVuY19fLCBfX0xJTkVfXywgY3VycmVudC0+cGlkKTsgICAg
ICAgICAgICAgICAgICAgICAgXAotfSB3aGlsZSAoMCkKLQotI2RlZmluZSBkYmdfZXJyKGZtdCwg
Li4uKSAgIGRvIHsgICAgICAgICAgICAgICAgICAgXAotCWlmICgwKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCi0JCXViaWZzX2VycihmbXQsICMjX19WQV9BUkdTX18pOyAg
ICAgXAotfSB3aGlsZSAoMCkKLQotI2RlZmluZSB1Ymlmc19kYmdfbXNnKGZtdCwgLi4uKSBkbyB7
ICAgICAgICAgICAgICAgXAotCWlmICgwKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCi0JCXByX2RlYnVnKGZtdCAiXG4iLCAjI19fVkFfQVJHU19fKTsgXAotfSB3aGlsZSAo
MCkKLQotI2RlZmluZSBkYmdfZHVtcF9zdGFjaygpCi0jZGVmaW5lIHViaWZzX2Fzc2VydF9jbXRf
bG9ja2VkKGMpCi0KLSNkZWZpbmUgZGJnX21zZyhmbXQsIC4uLikgICB1Ymlmc19kYmdfbXNnKGZt
dCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX2dlbihmbXQsIC4uLikgICB1Ymlmc19kYmdf
bXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX2pubChmbXQsIC4uLikgICB1Ymlm
c19kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX3RuYyhmbXQsIC4uLikg
ICB1Ymlmc19kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX2xwKGZtdCwg
Li4uKSAgICB1Ymlmc19kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX2Zp
bmQoZm10LCAuLi4pICB1Ymlmc19kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUg
ZGJnX21udChmbXQsIC4uLikgICB1Ymlmc19kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNk
ZWZpbmUgZGJnX2lvKGZtdCwgLi4uKSAgICB1Ymlmc19kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1Nf
XykKLSNkZWZpbmUgZGJnX2NtdChmbXQsIC4uLikgICB1Ymlmc19kYmdfbXNnKGZtdCwgIyNfX1ZB
X0FSR1NfXykKLSNkZWZpbmUgZGJnX2J1ZGcoZm10LCAuLi4pICB1Ymlmc19kYmdfbXNnKGZtdCwg
IyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX2xvZyhmbXQsIC4uLikgICB1Ymlmc19kYmdfbXNn
KGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX2djKGZtdCwgLi4uKSAgICB1Ymlmc19k
YmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX3NjYW4oZm10LCAuLi4pICB1
Ymlmc19kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLSNkZWZpbmUgZGJnX3JjdnJ5KGZtdCwg
Li4uKSB1Ymlmc19kYmdfbXNnKGZtdCwgIyNfX1ZBX0FSR1NfXykKLQotI2RlZmluZSBEQkdLRVko
a2V5KSAgKChjaGFyICopKGtleSkpCi0jZGVmaW5lIERCR0tFWTEoa2V5KSAoKGNoYXIgKikoa2V5
KSkKLQotc3RhdGljIGlubGluZSBpbnQgdWJpZnNfZGVidWdnaW5nX2luaXQoc3RydWN0IHViaWZz
X2luZm8gKmMpICAgICAgeyByZXR1cm4gMDsgfQotc3RhdGljIGlubGluZSB2b2lkIHViaWZzX2Rl
YnVnZ2luZ19leGl0KHN0cnVjdCB1Ymlmc19pbmZvICpjKSAgICAgeyByZXR1cm47IH0KLXN0YXRp
YyBpbmxpbmUgY29uc3QgY2hhciAqZGJnX250eXBlKGludCB0eXBlKSAgICAgICAgICAgICAgICAg
ICAgIHsgcmV0dXJuICIiOyB9Ci1zdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKmRiZ19jc3RhdGUo
aW50IGNtdF9zdGF0ZSkgICAgICAgICAgICAgICB7IHJldHVybiAiIjsgfQotc3RhdGljIGlubGlu
ZSBjb25zdCBjaGFyICpkYmdfamhlYWQoaW50IGpoZWFkKSAgICAgICAgICAgICAgICAgICAgeyBy
ZXR1cm4gIiI7IH0KLXN0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqCi1kYmdfZ2V0X2tleV9kdW1w
KGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLAotCQkgY29uc3QgdW5pb24gdWJpZnNfa2V5ICpr
ZXkpICAgICAgICAgICAgICAgICAgICAgIHsgcmV0dXJuICIiOyB9Ci1zdGF0aWMgaW5saW5lIHZv
aWQgZGJnX2R1bXBfaW5vZGUoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsCi0JCQkJICBjb25z
dCBzdHJ1Y3QgaW5vZGUgKmlub2RlKSAgICAgIHsgcmV0dXJuOyB9Ci1zdGF0aWMgaW5saW5lIHZv
aWQgZGJnX2R1bXBfbm9kZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKLQkJCQkgY29uc3Qg
dm9pZCAqbm9kZSkgICAgICAgICAgICAgICAgeyByZXR1cm47IH0KLXN0YXRpYyBpbmxpbmUgdm9p
ZCBkYmdfZHVtcF9scHRfbm9kZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKLQkJCQkgICAg
IHZvaWQgKm5vZGUsIGludCBsbnVtLAotCQkJCSAgICAgaW50IG9mZnMpICAgICAgICAgICAgICAg
ICAgICB7IHJldHVybjsgfQotc3RhdGljIGlubGluZSB2b2lkCi1kYmdfZHVtcF9idWRnZXRfcmVx
KGNvbnN0IHN0cnVjdCB1Ymlmc19idWRnZXRfcmVxICpyZXEpICAgICAgICAgICB7IHJldHVybjsg
fQotc3RhdGljIGlubGluZSB2b2lkCi1kYmdfZHVtcF9sc3RhdHMoY29uc3Qgc3RydWN0IHViaWZz
X2xwX3N0YXRzICpsc3QpICAgICAgICAgICAgICAgICB7IHJldHVybjsgfQotc3RhdGljIGlubGlu
ZSB2b2lkCi1kYmdfZHVtcF9idWRnKHN0cnVjdCB1Ymlmc19pbmZvICpjLAotCSAgICAgIGNvbnN0
IHN0cnVjdCB1Ymlmc19idWRnX2luZm8gKmJpKSAgICAgICAgICAgICAgICAgICB7IHJldHVybjsg
fQotc3RhdGljIGlubGluZSB2b2lkIGRiZ19kdW1wX2xwcm9wKGNvbnN0IHN0cnVjdCB1Ymlmc19p
bmZvICpjLAotCQkJCSAgY29uc3Qgc3RydWN0IHViaWZzX2xwcm9wcyAqbHApICB7IHJldHVybjsg
fQotc3RhdGljIGlubGluZSB2b2lkIGRiZ19kdW1wX2xwcm9wcyhzdHJ1Y3QgdWJpZnNfaW5mbyAq
YykgICAgICAgICAgeyByZXR1cm47IH0KLXN0YXRpYyBpbmxpbmUgdm9pZCBkYmdfZHVtcF9scHRf
aW5mbyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYykgICAgICAgIHsgcmV0dXJuOyB9Ci1zdGF0aWMgaW5s
aW5lIHZvaWQgZGJnX2R1bXBfbGViKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLAotCQkJCWlu
dCBsbnVtKSAgICAgICAgICAgICAgICAgICAgICAgICB7IHJldHVybjsgfQotc3RhdGljIGlubGlu
ZSB2b2lkCi1kYmdfZHVtcF96bm9kZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKLQkgICAg
ICAgY29uc3Qgc3RydWN0IHViaWZzX3pub2RlICp6bm9kZSkgICAgICAgICAgICAgICAgICAgeyBy
ZXR1cm47IH0KLXN0YXRpYyBpbmxpbmUgdm9pZCBkYmdfZHVtcF9oZWFwKHN0cnVjdCB1Ymlmc19p
bmZvICpjLAotCQkJCSBzdHJ1Y3QgdWJpZnNfbHB0X2hlYXAgKmhlYXAsCi0JCQkJIGludCBjYXQp
ICAgICAgICAgICAgICAgICAgICAgICAgIHsgcmV0dXJuOyB9Ci1zdGF0aWMgaW5saW5lIHZvaWQg
ZGJnX2R1bXBfcG5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsCi0JCQkJICBzdHJ1Y3QgdWJpZnNf
cG5vZGUgKnBub2RlLAotCQkJCSAgc3RydWN0IHViaWZzX25ub2RlICpwYXJlbnQsCi0JCQkJICBp
bnQgaWlwKSAgICAgICAgICAgICAgICAgICAgICAgIHsgcmV0dXJuOyB9Ci1zdGF0aWMgaW5saW5l
IHZvaWQgZGJnX2R1bXBfdG5jKHN0cnVjdCB1Ymlmc19pbmZvICpjKSAgICAgICAgICAgICB7IHJl
dHVybjsgfQotc3RhdGljIGlubGluZSB2b2lkIGRiZ19kdW1wX2luZGV4KHN0cnVjdCB1Ymlmc19p
bmZvICpjKSAgICAgICAgICAgeyByZXR1cm47IH0KLXN0YXRpYyBpbmxpbmUgdm9pZCBkYmdfZHVt
cF9scHRfbGVicyhjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYykgIHsgcmV0dXJuOyB9Ci0KLXN0
YXRpYyBpbmxpbmUgaW50IGRiZ193YWxrX2luZGV4KHN0cnVjdCB1Ymlmc19pbmZvICpjLAotCQkJ
CSBkYmdfbGVhZl9jYWxsYmFjayBsZWFmX2NiLAotCQkJCSBkYmdfem5vZGVfY2FsbGJhY2sgem5v
ZGVfY2IsCi0JCQkJIHZvaWQgKnByaXYpICAgICAgICAgICAgICAgICAgICAgIHsgcmV0dXJuIDA7
IH0KLXN0YXRpYyBpbmxpbmUgdm9pZCBkYmdfc2F2ZV9zcGFjZV9pbmZvKHN0cnVjdCB1Ymlmc19p
bmZvICpjKSAgICAgIHsgcmV0dXJuOyB9Ci1zdGF0aWMgaW5saW5lIGludCBkYmdfY2hlY2tfc3Bh
Y2VfaW5mbyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYykgICAgICB7IHJldHVybiAwOyB9Ci1zdGF0aWMg
aW5saW5lIGludCBkYmdfY2hlY2tfbHByb3BzKHN0cnVjdCB1Ymlmc19pbmZvICpjKSAgICAgICAg
ICB7IHJldHVybiAwOyB9Ci1zdGF0aWMgaW5saW5lIGludAotZGJnX29sZF9pbmRleF9jaGVja19p
bml0KHN0cnVjdCB1Ymlmc19pbmZvICpjLAotCQkJIHN0cnVjdCB1Ymlmc196YnJhbmNoICp6cm9v
dCkgICAgICAgICAgICAgeyByZXR1cm4gMDsgfQotc3RhdGljIGlubGluZSBpbnQKLWRiZ19jaGVj
a19vbGRfaW5kZXgoc3RydWN0IHViaWZzX2luZm8gKmMsCi0JCSAgICBzdHJ1Y3QgdWJpZnNfemJy
YW5jaCAqenJvb3QpICAgICAgICAgICAgICAgICAgeyByZXR1cm4gMDsgfQotc3RhdGljIGlubGlu
ZSBpbnQgZGJnX2NoZWNrX2NhdHMoc3RydWN0IHViaWZzX2luZm8gKmMpICAgICAgICAgICAgeyBy
ZXR1cm4gMDsgfQotc3RhdGljIGlubGluZSBpbnQgZGJnX2NoZWNrX2x0YWIoc3RydWN0IHViaWZz
X2luZm8gKmMpICAgICAgICAgICAgeyByZXR1cm4gMDsgfQotc3RhdGljIGlubGluZSBpbnQgZGJn
X2Noa19scHRfZnJlZV9zcGMoc3RydWN0IHViaWZzX2luZm8gKmMpICAgICAgeyByZXR1cm4gMDsg
fQotc3RhdGljIGlubGluZSBpbnQgZGJnX2Noa19scHRfc3ooc3RydWN0IHViaWZzX2luZm8gKmMs
Ci0JCQkJIGludCBhY3Rpb24sIGludCBsZW4pICAgICAgICAgICAgIHsgcmV0dXJuIDA7IH0KLXN0
YXRpYyBpbmxpbmUgaW50IGRiZ19jaGVja19zeW5jZWRfaV9zaXplKHN0cnVjdCBpbm9kZSAqaW5v
ZGUpICAgIHsgcmV0dXJuIDA7IH0KLXN0YXRpYyBpbmxpbmUgaW50IGRiZ19jaGVja19kaXJfc2l6
ZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKLQkJCQkgICAgIGNvbnN0IHN0cnVjdCBpbm9kZSAqZGly
KSAgICAgeyByZXR1cm4gMDsgfQotc3RhdGljIGlubGluZSBpbnQgZGJnX2NoZWNrX3RuYyhzdHJ1
Y3QgdWJpZnNfaW5mbyAqYywgaW50IGV4dHJhKSAgeyByZXR1cm4gMDsgfQotc3RhdGljIGlubGlu
ZSBpbnQgZGJnX2NoZWNrX2lkeF9zaXplKHN0cnVjdCB1Ymlmc19pbmZvICpjLAotCQkJCSAgICAg
bG9uZyBsb25nIGlkeF9zaXplKSAgICAgICAgICB7IHJldHVybiAwOyB9Ci1zdGF0aWMgaW5saW5l
IGludCBkYmdfY2hlY2tfZmlsZXN5c3RlbShzdHJ1Y3QgdWJpZnNfaW5mbyAqYykgICAgICB7IHJl
dHVybiAwOyB9Ci1zdGF0aWMgaW5saW5lIHZvaWQgZGJnX2NoZWNrX2hlYXAoc3RydWN0IHViaWZz
X2luZm8gKmMsCi0JCQkJICBzdHJ1Y3QgdWJpZnNfbHB0X2hlYXAgKmhlYXAsCi0JCQkJICBpbnQg
Y2F0LCBpbnQgYWRkX3BvcykgICAgICAgICAgIHsgcmV0dXJuOyB9Ci1zdGF0aWMgaW5saW5lIGlu
dCBkYmdfY2hlY2tfbHB0X25vZGVzKHN0cnVjdCB1Ymlmc19pbmZvICpjLAotCXN0cnVjdCB1Ymlm
c19jbm9kZSAqY25vZGUsIGludCByb3csIGludCBjb2wpICAgICAgICAgICAgICB7IHJldHVybiAw
OyB9Ci1zdGF0aWMgaW5saW5lIGludCBkYmdfY2hlY2tfaW5vZGVfc2l6ZShzdHJ1Y3QgdWJpZnNf
aW5mbyAqYywKLQkJCQkgICAgICAgY29uc3Qgc3RydWN0IGlub2RlICppbm9kZSwKLQkJCQkgICAg
ICAgbG9mZl90IHNpemUpICAgICAgICAgICAgICAgeyByZXR1cm4gMDsgfQotc3RhdGljIGlubGlu
ZSBpbnQKLWRiZ19jaGVja19kYXRhX25vZGVzX29yZGVyKHN0cnVjdCB1Ymlmc19pbmZvICpjLAot
CQkJICAgc3RydWN0IGxpc3RfaGVhZCAqaGVhZCkgICAgICAgICAgICAgICAgeyByZXR1cm4gMDsg
fQotc3RhdGljIGlubGluZSBpbnQKLWRiZ19jaGVja19ub25kYXRhX25vZGVzX29yZGVyKHN0cnVj
dCB1Ymlmc19pbmZvICpjLAotCQkJICAgICAgc3RydWN0IGxpc3RfaGVhZCAqaGVhZCkgICAgICAg
ICAgICAgeyByZXR1cm4gMDsgfQotCi1zdGF0aWMgaW5saW5lIGludCBkYmdfZm9yY2VfaW5fdGhl
X2dhcHModm9pZCkgICAgICAgICAgICAgICAgICAgICB7IHJldHVybiAwOyB9Ci0jZGVmaW5lIGRi
Z19mb3JjZV9pbl90aGVfZ2Fwc19lbmFibGVkKCkgMAotI2RlZmluZSBkYmdfZmFpbHVyZV9tb2Rl
ICAgICAgICAgICAgICAgIDAKLQotc3RhdGljIGlubGluZSBpbnQgZGJnX2RlYnVnZnNfaW5pdCh2
b2lkKSAgICAgICAgICAgICAgICAgICAgICAgICAgeyByZXR1cm4gMDsgfQotc3RhdGljIGlubGlu
ZSB2b2lkIGRiZ19kZWJ1Z2ZzX2V4aXQodm9pZCkgICAgICAgICAgICAgICAgICAgICAgICAgeyBy
ZXR1cm47IH0KLXN0YXRpYyBpbmxpbmUgaW50IGRiZ19kZWJ1Z2ZzX2luaXRfZnMoc3RydWN0IHVi
aWZzX2luZm8gKmMpICAgICAgIHsgcmV0dXJuIDA7IH0KLXN0YXRpYyBpbmxpbmUgaW50IGRiZ19k
ZWJ1Z2ZzX2V4aXRfZnMoc3RydWN0IHViaWZzX2luZm8gKmMpICAgICAgIHsgcmV0dXJuIDA7IH0K
LQotI2VuZGlmIC8qICFDT05GSUdfVUJJRlNfRlNfREVCVUcgKi8KICNlbmRpZiAvKiAhX19VQklG
U19ERUJVR19IX18gKi8KZGlmZiAtdU4gLXVOciBsaW51eC0zLjAvZnMvdWJpZnMvZGlyLmMgbGlu
dXgtMy4wLngudWJpZnMubGF0ZXN0L2ZzL3ViaWZzL2Rpci5jCi0tLSBsaW51eC0zLjAvZnMvdWJp
ZnMvZGlyLmMJMjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMu
MC54LnViaWZzLmxhdGVzdC9mcy91Ymlmcy9kaXIuYwkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAw
MDAwMCAtMDUwMApAQCAtMTAyLDcgKzEwMiw3IEBACiAJICogVUJJRlMgaGFzIHRvIGZ1bGx5IGNv
bnRyb2wgImNsZWFuIDwtPiBkaXJ0eSIgdHJhbnNpdGlvbnMgb2YgaW5vZGVzCiAJICogdG8gbWFr
ZSBidWRnZXRpbmcgd29yay4KIAkgKi8KLQlpbm9kZS0+aV9mbGFncyB8PSAoU19OT0NNVElNRSk7
CisJaW5vZGUtPmlfZmxhZ3MgfD0gU19OT0NNVElNRTsKIAogCWlub2RlX2luaXRfb3duZXIoaW5v
ZGUsIGRpciwgbW9kZSk7CiAJaW5vZGUtPmlfbXRpbWUgPSBpbm9kZS0+aV9hdGltZSA9IGlub2Rl
LT5pX2N0aW1lID0KQEAgLTE3MCwxMSArMTcwLDExIEBACiAJcmV0dXJuIGlub2RlOwogfQogCi0j
aWZkZWYgQ09ORklHX1VCSUZTX0ZTX0RFQlVHCi0KLXN0YXRpYyBpbnQgZGJnX2NoZWNrX25hbWUo
c3RydWN0IHViaWZzX2RlbnRfbm9kZSAqZGVudCwgc3RydWN0IHFzdHIgKm5tKQorc3RhdGljIGlu
dCBkYmdfY2hlY2tfbmFtZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKKwkJCSAgY29uc3Qg
c3RydWN0IHViaWZzX2RlbnRfbm9kZSAqZGVudCwKKwkJCSAgY29uc3Qgc3RydWN0IHFzdHIgKm5t
KQogewotCWlmICghKHViaWZzX2Noa19mbGFncyAmIFVCSUZTX0NIS19HRU4pKQorCWlmICghZGJn
X2lzX2Noa19nZW4oYykpCiAJCXJldHVybiAwOwogCWlmIChsZTE2X3RvX2NwdShkZW50LT5ubGVu
KSAhPSBubS0+bGVuKQogCQlyZXR1cm4gLUVJTlZBTDsKQEAgLTE4MywxMiArMTgzLDYgQEAKIAly
ZXR1cm4gMDsKIH0KIAotI2Vsc2UKLQotI2RlZmluZSBkYmdfY2hlY2tfbmFtZShkZW50LCBubSkg
MAotCi0jZW5kaWYKLQogc3RhdGljIHN0cnVjdCBkZW50cnkgKnViaWZzX2xvb2t1cChzdHJ1Y3Qg
aW5vZGUgKmRpciwgc3RydWN0IGRlbnRyeSAqZGVudHJ5LAogCQkJCSAgIHN0cnVjdCBuYW1laWRh
dGEgKm5kKQogewpAQCAtMjE5LDcgKzIxMyw3IEBACiAJCWdvdG8gb3V0OwogCX0KIAotCWlmIChk
YmdfY2hlY2tfbmFtZShkZW50LCAmZGVudHJ5LT5kX25hbWUpKSB7CisJaWYgKGRiZ19jaGVja19u
YW1lKGMsIGRlbnQsICZkZW50cnktPmRfbmFtZSkpIHsKIAkJZXJyID0gLUVJTlZBTDsKIAkJZ290
byBvdXQ7CiAJfQpAQCAtNTIyLDcgKzUxNiw3IEBACiAJdWJpZnNfYXNzZXJ0KG11dGV4X2lzX2xv
Y2tlZCgmZGlyLT5pX211dGV4KSk7CiAJdWJpZnNfYXNzZXJ0KG11dGV4X2lzX2xvY2tlZCgmaW5v
ZGUtPmlfbXV0ZXgpKTsKIAotCWVyciA9IGRiZ19jaGVja19zeW5jZWRfaV9zaXplKGlub2RlKTsK
KwllcnIgPSBkYmdfY2hlY2tfc3luY2VkX2lfc2l6ZShjLCBpbm9kZSk7CiAJaWYgKGVycikKIAkJ
cmV0dXJuIGVycjsKIApAQCAtNTc3LDcgKzU3MSw3IEBACiAJCWlub2RlLT5pX25saW5rLCBkaXIt
PmlfaW5vKTsKIAl1Ymlmc19hc3NlcnQobXV0ZXhfaXNfbG9ja2VkKCZkaXItPmlfbXV0ZXgpKTsK
IAl1Ymlmc19hc3NlcnQobXV0ZXhfaXNfbG9ja2VkKCZpbm9kZS0+aV9tdXRleCkpOwotCWVyciA9
IGRiZ19jaGVja19zeW5jZWRfaV9zaXplKGlub2RlKTsKKwllcnIgPSBkYmdfY2hlY2tfc3luY2Vk
X2lfc2l6ZShjLCBpbm9kZSk7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKIApAQCAtMTE4NSwx
MiArMTE3OSwxMCBAQAogCS5yZW5hbWUgICAgICA9IHViaWZzX3JlbmFtZSwKIAkuc2V0YXR0ciAg
ICAgPSB1Ymlmc19zZXRhdHRyLAogCS5nZXRhdHRyICAgICA9IHViaWZzX2dldGF0dHIsCi0jaWZk
ZWYgQ09ORklHX1VCSUZTX0ZTX1hBVFRSCiAJLnNldHhhdHRyICAgID0gdWJpZnNfc2V0eGF0dHIs
CiAJLmdldHhhdHRyICAgID0gdWJpZnNfZ2V0eGF0dHIsCiAJLmxpc3R4YXR0ciAgID0gdWJpZnNf
bGlzdHhhdHRyLAogCS5yZW1vdmV4YXR0ciA9IHViaWZzX3JlbW92ZXhhdHRyLAotI2VuZGlmCiB9
OwogCiBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHViaWZzX2Rpcl9vcGVyYXRpb25zID0g
ewpkaWZmIC11TiAtdU5yIGxpbnV4LTMuMC9mcy91Ymlmcy9maWxlLmMgbGludXgtMy4wLngudWJp
ZnMubGF0ZXN0L2ZzL3ViaWZzL2ZpbGUuYwotLS0gbGludXgtMy4wL2ZzL3ViaWZzL2ZpbGUuYwky
MDExLTA3LTIxIDIxOjE3OjIzLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtMy4wLngudWJpZnMu
bGF0ZXN0L2ZzL3ViaWZzL2ZpbGUuYwkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAwMDAwMCAtMDUw
MApAQCAtOTcsNyArOTcsNyBAQAogZHVtcDoKIAl1Ymlmc19lcnIoImJhZCBkYXRhIG5vZGUgKGJs
b2NrICV1LCBpbm9kZSAlbHUpIiwKIAkJICBibG9jaywgaW5vZGUtPmlfaW5vKTsKLQlkYmdfZHVt
cF9ub2RlKGMsIGRuKTsKKwl1Ymlmc19kdW1wX25vZGUoYywgZG4pOwogCXJldHVybiAtRUlOVkFM
OwogfQogCkBAIC0xMjYzLDcgKzEyNjMsNyBAQAogCWlmIChlcnIpCiAJCXJldHVybiBlcnI7CiAK
LQllcnIgPSBkYmdfY2hlY2tfc3luY2VkX2lfc2l6ZShpbm9kZSk7CisJZXJyID0gZGJnX2NoZWNr
X3N5bmNlZF9pX3NpemUoYywgaW5vZGUpOwogCWlmIChlcnIpCiAJCXJldHVybiBlcnI7CiAKQEAg
LTE1NjEsMTIgKzE1NjEsMTAgQEAKIGNvbnN0IHN0cnVjdCBpbm9kZV9vcGVyYXRpb25zIHViaWZz
X2ZpbGVfaW5vZGVfb3BlcmF0aW9ucyA9IHsKIAkuc2V0YXR0ciAgICAgPSB1Ymlmc19zZXRhdHRy
LAogCS5nZXRhdHRyICAgICA9IHViaWZzX2dldGF0dHIsCi0jaWZkZWYgQ09ORklHX1VCSUZTX0ZT
X1hBVFRSCiAJLnNldHhhdHRyICAgID0gdWJpZnNfc2V0eGF0dHIsCiAJLmdldHhhdHRyICAgID0g
dWJpZnNfZ2V0eGF0dHIsCiAJLmxpc3R4YXR0ciAgID0gdWJpZnNfbGlzdHhhdHRyLAogCS5yZW1v
dmV4YXR0ciA9IHViaWZzX3JlbW92ZXhhdHRyLAotI2VuZGlmCiB9OwogCiBjb25zdCBzdHJ1Y3Qg
aW5vZGVfb3BlcmF0aW9ucyB1Ymlmc19zeW1saW5rX2lub2RlX29wZXJhdGlvbnMgPSB7CmRpZmYg
LXVOIC11TnIgbGludXgtMy4wL2ZzL3ViaWZzL2ZpbmQuYyBsaW51eC0zLjAueC51Ymlmcy5sYXRl
c3QvZnMvdWJpZnMvZmluZC5jCi0tLSBsaW51eC0zLjAvZnMvdWJpZnMvZmluZC5jCTIwMTEtMDct
MjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3Qv
ZnMvdWJpZnMvZmluZC5jCTIwMTItMDYtMjggMTE6MjY6MTUuMDAwMDAwMDAwIC0wNTAwCkBAIC05
MzksOCArOTM5LDggQEAKIAl9CiAJZGJnX2ZpbmQoIkxFQiAlZCwgZGlydHkgJWQgYW5kIGZyZWUg
JWQgZmxhZ3MgJSN4IiwgbHAtPmxudW0sIGxwLT5kaXJ0eSwKIAkJIGxwLT5mcmVlLCBscC0+Zmxh
Z3MpOwotCXViaWZzX2Fzc2VydChscC0+ZmxhZ3MgfCBMUFJPUFNfVEFLRU4pOwotCXViaWZzX2Fz
c2VydChscC0+ZmxhZ3MgfCBMUFJPUFNfSU5ERVgpOworCXViaWZzX2Fzc2VydChscC0+ZmxhZ3Mg
JiBMUFJPUFNfVEFLRU4pOworCXViaWZzX2Fzc2VydChscC0+ZmxhZ3MgJiBMUFJPUFNfSU5ERVgp
OwogCXJldHVybiBsbnVtOwogfQogCmRpZmYgLXVOIC11TnIgbGludXgtMy4wL2ZzL3ViaWZzL2dj
LmMgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2ZzL3ViaWZzL2djLmMKLS0tIGxpbnV4LTMuMC9m
cy91Ymlmcy9nYy5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51
eC0zLjAueC51Ymlmcy5sYXRlc3QvZnMvdWJpZnMvZ2MuYwkyMDEyLTA2LTI4IDExOjI2OjE1LjAw
MDAwMDAwMCAtMDUwMApAQCAtMTA5LDcgKzEwOSw3IEBACiAJCXJldHVybiBlcnI7CiAKIAljLT5n
Y19sbnVtID0gLTE7Ci0JZXJyID0gdWJpZnNfd2J1Zl9zZWVrX25vbG9jayh3YnVmLCBnY19sbnVt
LCAwLCBVQklfTE9OR1RFUk0pOworCWVyciA9IHViaWZzX3didWZfc2Vla19ub2xvY2sod2J1Ziwg
Z2NfbG51bSwgMCk7CiAJcmV0dXJuIGVycjsKIH0KIApkaWZmIC11TiAtdU5yIGxpbnV4LTMuMC9m
cy91Ymlmcy9pby5jIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9mcy91Ymlmcy9pby5jCi0tLSBs
aW51eC0zLjAvZnMvdWJpZnMvaW8uYwkyMDExLTA3LTIxIDIxOjE3OjIzLjAwMDAwMDAwMCAtMDUw
MAorKysgbGludXgtMy4wLngudWJpZnMubGF0ZXN0L2ZzL3ViaWZzL2lvLmMJMjAxMi0wNi0yOCAx
MToyNjoxNS4wMDAwMDAwMDAgLTA1MDAKQEAgLTg2LDEwICs4NiwxMjYgQEAKIAkJYy0+bm9fY2hr
X2RhdGFfY3JjID0gMDsKIAkJYy0+dmZzX3NiLT5zX2ZsYWdzIHw9IE1TX1JET05MWTsKIAkJdWJp
ZnNfd2Fybigic3dpdGNoZWQgdG8gcmVhZC1vbmx5IG1vZGUsIGVycm9yICVkIiwgZXJyKTsKLQkJ
ZGJnX2R1bXBfc3RhY2soKTsKKwkJZHVtcF9zdGFjaygpOwogCX0KIH0KIAorLyoKKyAqIEJlbG93
IGFyZSBzaW1wbGUgd3JhcHBlcnMgb3ZlciBVQkkgSS9PIGZ1bmN0aW9ucyB3aGljaCBpbmNsdWRl
IHNvbWUKKyAqIGFkZGl0aW9uYWwgY2hlY2tzIGFuZCBVQklGUyBkZWJ1Z2dpbmcgc3R1ZmYuIFNl
ZSBjb3JyZXNwb25kaW5nIFVCSSBmdW5jdGlvbgorICogZm9yIG1vcmUgaW5mb3JtYXRpb24uCisg
Ki8KKworaW50IHViaWZzX2xlYl9yZWFkKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQg
bG51bSwgdm9pZCAqYnVmLCBpbnQgb2ZmcywKKwkJICAgaW50IGxlbiwgaW50IGV2ZW5fZWJhZG1z
ZykKK3sKKwlpbnQgZXJyOworCisJZXJyID0gdWJpX3JlYWQoYy0+dWJpLCBsbnVtLCBidWYsIG9m
ZnMsIGxlbik7CisJLyoKKwkgKiBJbiBjYXNlIG9mICUtRUJBRE1TRyBwcmludCB0aGUgZXJyb3Ig
bWVzc2FnZSBvbmx5IGlmIHRoZQorCSAqIEBldmVuX2ViYWRtc2cgaXMgdHJ1ZS4KKwkgKi8KKwlp
ZiAoZXJyICYmIChlcnIgIT0gLUVCQURNU0cgfHwgZXZlbl9lYmFkbXNnKSkgeworCQl1Ymlmc19l
cnIoInJlYWRpbmcgJWQgYnl0ZXMgZnJvbSBMRUIgJWQ6JWQgZmFpbGVkLCBlcnJvciAlZCIsCisJ
CQkgIGxlbiwgbG51bSwgb2ZmcywgZXJyKTsKKwkJZHVtcF9zdGFjaygpOworCX0KKwlyZXR1cm4g
ZXJyOworfQorCitpbnQgdWJpZnNfbGViX3dyaXRlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQg
bG51bSwgY29uc3Qgdm9pZCAqYnVmLCBpbnQgb2ZmcywKKwkJICAgIGludCBsZW4pCit7CisJaW50
IGVycjsKKworCXViaWZzX2Fzc2VydCghYy0+cm9fbWVkaWEgJiYgIWMtPnJvX21vdW50KTsKKwlp
ZiAoYy0+cm9fZXJyb3IpCisJCXJldHVybiAtRVJPRlM7CisJaWYgKCFkYmdfaXNfdHN0X3JjdnJ5
KGMpKQorCQllcnIgPSB1YmlfbGViX3dyaXRlKGMtPnViaSwgbG51bSwgYnVmLCBvZmZzLCBsZW4p
OworCWVsc2UKKwkJZXJyID0gZGJnX2xlYl93cml0ZShjLCBsbnVtLCBidWYsIG9mZnMsIGxlbik7
CisJaWYgKGVycikgeworCQl1Ymlmc19lcnIoIndyaXRpbmcgJWQgYnl0ZXMgdG8gTEVCICVkOiVk
IGZhaWxlZCwgZXJyb3IgJWQiLAorCQkJICBsZW4sIGxudW0sIG9mZnMsIGVycik7CisJCXViaWZz
X3JvX21vZGUoYywgZXJyKTsKKwkJZHVtcF9zdGFjaygpOworCX0KKwlyZXR1cm4gZXJyOworfQor
CitpbnQgdWJpZnNfbGViX2NoYW5nZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgaW50IGxudW0sIGNv
bnN0IHZvaWQgKmJ1ZiwgaW50IGxlbikKK3sKKwlpbnQgZXJyOworCisJdWJpZnNfYXNzZXJ0KCFj
LT5yb19tZWRpYSAmJiAhYy0+cm9fbW91bnQpOworCWlmIChjLT5yb19lcnJvcikKKwkJcmV0dXJu
IC1FUk9GUzsKKwlpZiAoIWRiZ19pc190c3RfcmN2cnkoYykpCisJCWVyciA9IHViaV9sZWJfY2hh
bmdlKGMtPnViaSwgbG51bSwgYnVmLCBsZW4pOworCWVsc2UKKwkJZXJyID0gZGJnX2xlYl9jaGFu
Z2UoYywgbG51bSwgYnVmLCBsZW4pOworCWlmIChlcnIpIHsKKwkJdWJpZnNfZXJyKCJjaGFuZ2lu
ZyAlZCBieXRlcyBpbiBMRUIgJWQgZmFpbGVkLCBlcnJvciAlZCIsCisJCQkgIGxlbiwgbG51bSwg
ZXJyKTsKKwkJdWJpZnNfcm9fbW9kZShjLCBlcnIpOworCQlkdW1wX3N0YWNrKCk7CisJfQorCXJl
dHVybiBlcnI7Cit9CisKK2ludCB1Ymlmc19sZWJfdW5tYXAoc3RydWN0IHViaWZzX2luZm8gKmMs
IGludCBsbnVtKQoreworCWludCBlcnI7CisKKwl1Ymlmc19hc3NlcnQoIWMtPnJvX21lZGlhICYm
ICFjLT5yb19tb3VudCk7CisJaWYgKGMtPnJvX2Vycm9yKQorCQlyZXR1cm4gLUVST0ZTOworCWlm
ICghZGJnX2lzX3RzdF9yY3ZyeShjKSkKKwkJZXJyID0gdWJpX2xlYl91bm1hcChjLT51YmksIGxu
dW0pOworCWVsc2UKKwkJZXJyID0gZGJnX2xlYl91bm1hcChjLCBsbnVtKTsKKwlpZiAoZXJyKSB7
CisJCXViaWZzX2VycigidW5tYXAgTEVCICVkIGZhaWxlZCwgZXJyb3IgJWQiLCBsbnVtLCBlcnIp
OworCQl1Ymlmc19yb19tb2RlKGMsIGVycik7CisJCWR1bXBfc3RhY2soKTsKKwl9CisJcmV0dXJu
IGVycjsKK30KKworaW50IHViaWZzX2xlYl9tYXAoc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBs
bnVtKQoreworCWludCBlcnI7CisKKwl1Ymlmc19hc3NlcnQoIWMtPnJvX21lZGlhICYmICFjLT5y
b19tb3VudCk7CisJaWYgKGMtPnJvX2Vycm9yKQorCQlyZXR1cm4gLUVST0ZTOworCWlmICghZGJn
X2lzX3RzdF9yY3ZyeShjKSkKKwkJZXJyID0gdWJpX2xlYl9tYXAoYy0+dWJpLCBsbnVtKTsKKwll
bHNlCisJCWVyciA9IGRiZ19sZWJfbWFwKGMsIGxudW0pOworCWlmIChlcnIpIHsKKwkJdWJpZnNf
ZXJyKCJtYXBwaW5nIExFQiAlZCBmYWlsZWQsIGVycm9yICVkIiwgbG51bSwgZXJyKTsKKwkJdWJp
ZnNfcm9fbW9kZShjLCBlcnIpOworCQlkdW1wX3N0YWNrKCk7CisJfQorCXJldHVybiBlcnI7Cit9
CisKK2ludCB1Ymlmc19pc19tYXBwZWQoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBs
bnVtKQoreworCWludCBlcnI7CisKKwllcnIgPSB1YmlfaXNfbWFwcGVkKGMtPnViaSwgbG51bSk7
CisJaWYgKGVyciA8IDApIHsKKwkJdWJpZnNfZXJyKCJ1YmlfaXNfbWFwcGVkIGZhaWxlZCBmb3Ig
TEVCICVkLCBlcnJvciAlZCIsCisJCQkgIGxudW0sIGVycik7CisJCWR1bXBfc3RhY2soKTsKKwl9
CisJcmV0dXJuIGVycjsKK30KKwogLyoqCiAgKiB1Ymlmc19jaGVja19ub2RlIC0gY2hlY2sgbm9k
ZS4KICAqIEBjOiBVQklGUyBmaWxlLXN5c3RlbSBkZXNjcmlwdGlvbiBvYmplY3QKQEAgLTE3Nyw4
ICsyOTMsOCBAQAogb3V0OgogCWlmICghcXVpZXQpIHsKIAkJdWJpZnNfZXJyKCJiYWQgbm9kZSBh
dCBMRUIgJWQ6JWQiLCBsbnVtLCBvZmZzKTsKLQkJZGJnX2R1bXBfbm9kZShjLCBidWYpOwotCQlk
YmdfZHVtcF9zdGFjaygpOworCQl1Ymlmc19kdW1wX25vZGUoYywgYnVmKTsKKwkJZHVtcF9zdGFj
aygpOwogCX0KIAlyZXR1cm4gZXJyOwogfQpAQCAtNDA2LDE0ICs1MjIsOSBAQAogCWRpcnQgPSBz
eW5jX2xlbiAtIHdidWYtPnVzZWQ7CiAJaWYgKGRpcnQpCiAJCXViaWZzX3BhZChjLCB3YnVmLT5i
dWYgKyB3YnVmLT51c2VkLCBkaXJ0KTsKLQllcnIgPSB1YmlfbGViX3dyaXRlKGMtPnViaSwgd2J1
Zi0+bG51bSwgd2J1Zi0+YnVmLCB3YnVmLT5vZmZzLAotCQkJICAgIHN5bmNfbGVuLCB3YnVmLT5k
dHlwZSk7Ci0JaWYgKGVycikgewotCQl1Ymlmc19lcnIoImNhbm5vdCB3cml0ZSAlZCBieXRlcyB0
byBMRUIgJWQ6JWQiLAotCQkJICBzeW5jX2xlbiwgd2J1Zi0+bG51bSwgd2J1Zi0+b2Zmcyk7Ci0J
CWRiZ19kdW1wX3N0YWNrKCk7CisJZXJyID0gdWJpZnNfbGViX3dyaXRlKGMsIHdidWYtPmxudW0s
IHdidWYtPmJ1Ziwgd2J1Zi0+b2Zmcywgc3luY19sZW4pOworCWlmIChlcnIpCiAJCXJldHVybiBl
cnI7Ci0JfQogCiAJc3Bpbl9sb2NrKCZ3YnVmLT5sb2NrKTsKIAl3YnVmLT5vZmZzICs9IHN5bmNf
bGVuOwpAQCAtNDQ5LDE0ICs1NjAsMTIgQEAKICAqIEB3YnVmOiB3cml0ZS1idWZmZXIKICAqIEBs
bnVtOiBsb2dpY2FsIGVyYXNlYmxvY2sgbnVtYmVyIHRvIHNlZWsgdG8KICAqIEBvZmZzOiBsb2dp
Y2FsIGVyYXNlYmxvY2sgb2Zmc2V0IHRvIHNlZWsgdG8KLSAqIEBkdHlwZTogZGF0YSB0eXBlCiAg
KgogICogVGhpcyBmdW5jdGlvbiB0YXJnZXRzIHRoZSB3cml0ZS1idWZmZXIgdG8gbG9naWNhbCBl
cmFzZWJsb2NrIEBsbnVtOkBvZmZzLgogICogVGhlIHdyaXRlLWJ1ZmZlciBoYXMgdG8gYmUgZW1w
dHkuIFJldHVybnMgemVybyBpbiBjYXNlIG9mIHN1Y2Nlc3MgYW5kIGEKICAqIG5lZ2F0aXZlIGVy
cm9yIGNvZGUgaW4gY2FzZSBvZiBmYWlsdXJlLgogICovCi1pbnQgdWJpZnNfd2J1Zl9zZWVrX25v
bG9jayhzdHJ1Y3QgdWJpZnNfd2J1ZiAqd2J1ZiwgaW50IGxudW0sIGludCBvZmZzLAotCQkJICAg
aW50IGR0eXBlKQoraW50IHViaWZzX3didWZfc2Vla19ub2xvY2soc3RydWN0IHViaWZzX3didWYg
KndidWYsIGludCBsbnVtLCBpbnQgb2ZmcykKIHsKIAljb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAq
YyA9IHdidWYtPmM7CiAKQEAgLTQ3OSw3ICs1ODgsNiBAQAogCXdidWYtPmF2YWlsID0gd2J1Zi0+
c2l6ZTsKIAl3YnVmLT51c2VkID0gMDsKIAlzcGluX3VubG9jaygmd2J1Zi0+bG9jayk7Ci0Jd2J1
Zi0+ZHR5cGUgPSBkdHlwZTsKIAogCXJldHVybiAwOwogfQpAQCAtNjA1LDkgKzcxMyw4IEBACiAJ
CWlmIChhbGlnbmVkX2xlbiA9PSB3YnVmLT5hdmFpbCkgewogCQkJZGJnX2lvKCJmbHVzaCBqaGVh
ZCAlcyB3YnVmIHRvIExFQiAlZDolZCIsCiAJCQkgICAgICAgZGJnX2poZWFkKHdidWYtPmpoZWFk
KSwgd2J1Zi0+bG51bSwgd2J1Zi0+b2Zmcyk7Ci0JCQllcnIgPSB1YmlfbGViX3dyaXRlKGMtPnVi
aSwgd2J1Zi0+bG51bSwgd2J1Zi0+YnVmLAotCQkJCQkgICAgd2J1Zi0+b2Zmcywgd2J1Zi0+c2l6
ZSwKLQkJCQkJICAgIHdidWYtPmR0eXBlKTsKKwkJCWVyciA9IHViaWZzX2xlYl93cml0ZShjLCB3
YnVmLT5sbnVtLCB3YnVmLT5idWYsCisJCQkJCSAgICAgIHdidWYtPm9mZnMsIHdidWYtPnNpemUp
OwogCQkJaWYgKGVycikKIAkJCQlnb3RvIG91dDsKIApAQCAtNjQyLDggKzc0OSw4IEBACiAJCWRi
Z19pbygiZmx1c2ggamhlYWQgJXMgd2J1ZiB0byBMRUIgJWQ6JWQiLAogCQkgICAgICAgZGJnX2po
ZWFkKHdidWYtPmpoZWFkKSwgd2J1Zi0+bG51bSwgd2J1Zi0+b2Zmcyk7CiAJCW1lbWNweSh3YnVm
LT5idWYgKyB3YnVmLT51c2VkLCBidWYsIHdidWYtPmF2YWlsKTsKLQkJZXJyID0gdWJpX2xlYl93
cml0ZShjLT51YmksIHdidWYtPmxudW0sIHdidWYtPmJ1Ziwgd2J1Zi0+b2ZmcywKLQkJCQkgICAg
d2J1Zi0+c2l6ZSwgd2J1Zi0+ZHR5cGUpOworCQllcnIgPSB1Ymlmc19sZWJfd3JpdGUoYywgd2J1
Zi0+bG51bSwgd2J1Zi0+YnVmLCB3YnVmLT5vZmZzLAorCQkJCSAgICAgIHdidWYtPnNpemUpOwog
CQlpZiAoZXJyKQogCQkJZ290byBvdXQ7CiAKQEAgLTY2MSw4ICs3NjgsOCBAQAogCQkgKi8KIAkJ
ZGJnX2lvKCJ3cml0ZSAlZCBieXRlcyB0byBMRUIgJWQ6JWQiLAogCQkgICAgICAgd2J1Zi0+c2l6
ZSwgd2J1Zi0+bG51bSwgd2J1Zi0+b2Zmcyk7Ci0JCWVyciA9IHViaV9sZWJfd3JpdGUoYy0+dWJp
LCB3YnVmLT5sbnVtLCBidWYsIHdidWYtPm9mZnMsCi0JCQkJICAgIHdidWYtPnNpemUsIHdidWYt
PmR0eXBlKTsKKwkJZXJyID0gdWJpZnNfbGViX3dyaXRlKGMsIHdidWYtPmxudW0sIGJ1Ziwgd2J1
Zi0+b2ZmcywKKwkJCQkgICAgICB3YnVmLT5zaXplKTsKIAkJaWYgKGVycikKIAkJCWdvdG8gb3V0
OwogCkBAIC02ODMsOCArNzkwLDggQEAKIAkJbiA8PD0gYy0+bWF4X3dyaXRlX3NoaWZ0OwogCQlk
YmdfaW8oIndyaXRlICVkIGJ5dGVzIHRvIExFQiAlZDolZCIsIG4sIHdidWYtPmxudW0sCiAJCSAg
ICAgICB3YnVmLT5vZmZzKTsKLQkJZXJyID0gdWJpX2xlYl93cml0ZShjLT51YmksIHdidWYtPmxu
dW0sIGJ1ZiArIHdyaXR0ZW4sCi0JCQkJICAgIHdidWYtPm9mZnMsIG4sIHdidWYtPmR0eXBlKTsK
KwkJZXJyID0gdWJpZnNfbGViX3dyaXRlKGMsIHdidWYtPmxudW0sIGJ1ZiArIHdyaXR0ZW4sCisJ
CQkJICAgICAgd2J1Zi0+b2Zmcywgbik7CiAJCWlmIChlcnIpCiAJCQlnb3RvIG91dDsKIAkJd2J1
Zi0+b2ZmcyArPSBuOwpAQCAtNzI4LDkgKzgzNSw5IEBACiBvdXQ6CiAJdWJpZnNfZXJyKCJjYW5u
b3Qgd3JpdGUgJWQgYnl0ZXMgdG8gTEVCICVkOiVkLCBlcnJvciAlZCIsCiAJCSAgbGVuLCB3YnVm
LT5sbnVtLCB3YnVmLT5vZmZzLCBlcnIpOwotCWRiZ19kdW1wX25vZGUoYywgYnVmKTsKLQlkYmdf
ZHVtcF9zdGFjaygpOwotCWRiZ19kdW1wX2xlYihjLCB3YnVmLT5sbnVtKTsKKwl1Ymlmc19kdW1w
X25vZGUoYywgYnVmKTsKKwlkdW1wX3N0YWNrKCk7CisJdWJpZnNfZHVtcF9sZWIoYywgd2J1Zi0+
bG51bSk7CiAJcmV0dXJuIGVycjsKIH0KIApAQCAtNzQxLDcgKzg0OCw2IEBACiAgKiBAbGVuOiBu
b2RlIGxlbmd0aAogICogQGxudW06IGxvZ2ljYWwgZXJhc2VibG9jayBudW1iZXIKICAqIEBvZmZz
OiBvZmZzZXQgd2l0aGluIHRoZSBsb2dpY2FsIGVyYXNlYmxvY2sKLSAqIEBkdHlwZTogbm9kZSBs
aWZlLXRpbWUgaGludCAoJVVCSV9MT05HVEVSTSwgJVVCSV9TSE9SVFRFUk0sICVVQklfVU5LTk9X
TikKICAqCiAgKiBUaGlzIGZ1bmN0aW9uIGF1dG9tYXRpY2FsbHkgZmlsbHMgbm9kZSBtYWdpYyBu
dW1iZXIsIGFzc2lnbnMgc2VxdWVuY2UKICAqIG51bWJlciwgYW5kIGNhbGN1bGF0ZXMgbm9kZSBD
UkMgY2hlY2tzdW0uIFRoZSBsZW5ndGggb2YgdGhlIEBidWYgYnVmZmVyIGhhcwpAQCAtNzUwLDcg
Kzg1Niw3IEBACiAgKiBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgaW4gY2FzZSBv
ZiBmYWlsdXJlLgogICovCiBpbnQgdWJpZnNfd3JpdGVfbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAq
Yywgdm9pZCAqYnVmLCBpbnQgbGVuLCBpbnQgbG51bSwKLQkJICAgICBpbnQgb2ZmcywgaW50IGR0
eXBlKQorCQkgICAgIGludCBvZmZzKQogewogCWludCBlcnIsIGJ1Zl9sZW4gPSBBTElHTihsZW4s
IGMtPm1pbl9pb19zaXplKTsKIApAQCAtNzY2LDEzICs4NzIsOSBAQAogCQlyZXR1cm4gLUVST0ZT
OwogCiAJdWJpZnNfcHJlcGFyZV9ub2RlKGMsIGJ1ZiwgbGVuLCAxKTsKLQllcnIgPSB1YmlfbGVi
X3dyaXRlKGMtPnViaSwgbG51bSwgYnVmLCBvZmZzLCBidWZfbGVuLCBkdHlwZSk7Ci0JaWYgKGVy
cikgewotCQl1Ymlmc19lcnIoImNhbm5vdCB3cml0ZSAlZCBieXRlcyB0byBMRUIgJWQ6JWQsIGVy
cm9yICVkIiwKLQkJCSAgYnVmX2xlbiwgbG51bSwgb2ZmcywgZXJyKTsKLQkJZGJnX2R1bXBfbm9k
ZShjLCBidWYpOwotCQlkYmdfZHVtcF9zdGFjaygpOwotCX0KKwllcnIgPSB1Ymlmc19sZWJfd3Jp
dGUoYywgbG51bSwgYnVmLCBvZmZzLCBidWZfbGVuKTsKKwlpZiAoZXJyKQorCQl1Ymlmc19kdW1w
X25vZGUoYywgYnVmKTsKIAogCXJldHVybiBlcnI7CiB9CkBAIC04MjQsMTMgKzkyNiw5IEBACiAK
IAlpZiAocmxlbiA+IDApIHsKIAkJLyogUmVhZCBldmVyeXRoaW5nIHRoYXQgZ29lcyBiZWZvcmUg
d3JpdGUtYnVmZmVyICovCi0JCWVyciA9IHViaV9yZWFkKGMtPnViaSwgbG51bSwgYnVmLCBvZmZz
LCBybGVuKTsKLQkJaWYgKGVyciAmJiBlcnIgIT0gLUVCQURNU0cpIHsKLQkJCXViaWZzX2Vycigi
ZmFpbGVkIHRvIHJlYWQgbm9kZSAlZCBmcm9tIExFQiAlZDolZCwgIgotCQkJCSAgImVycm9yICVk
IiwgdHlwZSwgbG51bSwgb2ZmcywgZXJyKTsKLQkJCWRiZ19kdW1wX3N0YWNrKCk7CisJCWVyciA9
IHViaWZzX2xlYl9yZWFkKGMsIGxudW0sIGJ1Ziwgb2ZmcywgcmxlbiwgMCk7CisJCWlmIChlcnIg
JiYgZXJyICE9IC1FQkFETVNHKQogCQkJcmV0dXJuIGVycjsKLQkJfQogCX0KIAogCWlmICh0eXBl
ICE9IGNoLT5ub2RlX3R5cGUpIHsKQEAgLTg1NSw4ICs5NTMsOCBAQAogCiBvdXQ6CiAJdWJpZnNf
ZXJyKCJiYWQgbm9kZSBhdCBMRUIgJWQ6JWQiLCBsbnVtLCBvZmZzKTsKLQlkYmdfZHVtcF9ub2Rl
KGMsIGJ1Zik7Ci0JZGJnX2R1bXBfc3RhY2soKTsKKwl1Ymlmc19kdW1wX25vZGUoYywgYnVmKTsK
KwlkdW1wX3N0YWNrKCk7CiAJcmV0dXJuIC1FSU5WQUw7CiB9CiAKQEAgLTg4NSwxMiArOTgzLDkg
QEAKIAl1Ymlmc19hc3NlcnQoIShvZmZzICYgNykgJiYgb2ZmcyA8IGMtPmxlYl9zaXplKTsKIAl1
Ymlmc19hc3NlcnQodHlwZSA+PSAwICYmIHR5cGUgPCBVQklGU19OT0RFX1RZUEVTX0NOVCk7CiAK
LQllcnIgPSB1YmlfcmVhZChjLT51YmksIGxudW0sIGJ1Ziwgb2ZmcywgbGVuKTsKLQlpZiAoZXJy
ICYmIGVyciAhPSAtRUJBRE1TRykgewotCQl1Ymlmc19lcnIoImNhbm5vdCByZWFkIG5vZGUgJWQg
ZnJvbSBMRUIgJWQ6JWQsIGVycm9yICVkIiwKLQkJCSAgdHlwZSwgbG51bSwgb2ZmcywgZXJyKTsK
KwllcnIgPSB1Ymlmc19sZWJfcmVhZChjLCBsbnVtLCBidWYsIG9mZnMsIGxlbiwgMCk7CisJaWYg
KGVyciAmJiBlcnIgIT0gLUVCQURNU0cpCiAJCXJldHVybiBlcnI7Ci0JfQogCiAJaWYgKHR5cGUg
IT0gY2gtPm5vZGVfdHlwZSkgewogCQl1Ymlmc19lcnIoImJhZCBub2RlIHR5cGUgKCVkIGJ1dCBl
eHBlY3RlZCAlZCkiLApAQCAtOTE1LDggKzEwMTAsOCBAQAogb3V0OgogCXViaWZzX2VycigiYmFk
IG5vZGUgYXQgTEVCICVkOiVkLCBMRUIgbWFwcGluZyBzdGF0dXMgJWQiLCBsbnVtLCBvZmZzLAog
CQkgIHViaV9pc19tYXBwZWQoYy0+dWJpLCBsbnVtKSk7Ci0JZGJnX2R1bXBfbm9kZShjLCBidWYp
OwotCWRiZ19kdW1wX3N0YWNrKCk7CisJdWJpZnNfZHVtcF9ub2RlKGMsIGJ1Zik7CisJZHVtcF9z
dGFjaygpOwogCXJldHVybiAtRUlOVkFMOwogfQogCkBAIC05NTQsNyArMTA0OSw2IEBACiAJICov
CiAJc2l6ZSA9IGMtPm1heF93cml0ZV9zaXplIC0gKGMtPmxlYl9zdGFydCAlIGMtPm1heF93cml0
ZV9zaXplKTsKIAl3YnVmLT5hdmFpbCA9IHdidWYtPnNpemUgPSBzaXplOwotCXdidWYtPmR0eXBl
ID0gVUJJX1VOS05PV047CiAJd2J1Zi0+c3luY19jYWxsYmFjayA9IE5VTEw7CiAJbXV0ZXhfaW5p
dCgmd2J1Zi0+aW9fbXV0ZXgpOwogCXNwaW5fbG9ja19pbml0KCZ3YnVmLT5sb2NrKTsKZGlmZiAt
dU4gLXVOciBsaW51eC0zLjAvZnMvdWJpZnMvam91cm5hbC5jIGxpbnV4LTMuMC54LnViaWZzLmxh
dGVzdC9mcy91Ymlmcy9qb3VybmFsLmMKLS0tIGxpbnV4LTMuMC9mcy91Ymlmcy9qb3VybmFsLmMJ
MjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZz
LmxhdGVzdC9mcy91Ymlmcy9qb3VybmFsLmMJMjAxMi0wNi0yOCAxMToyNjoxNS4wMDAwMDAwMDAg
LTA1MDAKQEAgLTIxNCw3ICsyMTQsNyBAQAogCWVyciA9IHViaWZzX2FkZF9idWRfdG9fbG9nKGMs
IGpoZWFkLCBsbnVtLCBvZmZzKTsKIAlpZiAoZXJyKQogCQlnb3RvIG91dF9yZXR1cm47Ci0JZXJy
ID0gdWJpZnNfd2J1Zl9zZWVrX25vbG9jayh3YnVmLCBsbnVtLCBvZmZzLCB3YnVmLT5kdHlwZSk7
CisJZXJyID0gdWJpZnNfd2J1Zl9zZWVrX25vbG9jayh3YnVmLCBsbnVtLCBvZmZzKTsKIAlpZiAo
ZXJyKQogCQlnb3RvIG91dF91bmxvY2s7CiAKQEAgLTM4NSw5ICszODUsOSBAQAogCWlmIChlcnIg
PT0gLUVOT1NQQykgewogCQkvKiBUaGlzIGFyZSBzb21lIGJ1ZGdldGluZyBwcm9ibGVtcywgcHJp
bnQgdXNlZnVsIGluZm9ybWF0aW9uICovCiAJCWRvd25fd3JpdGUoJmMtPmNvbW1pdF9zZW0pOwot
CQlkYmdfZHVtcF9zdGFjaygpOwotCQlkYmdfZHVtcF9idWRnKGMsICZjLT5iaSk7Ci0JCWRiZ19k
dW1wX2xwcm9wcyhjKTsKKwkJZHVtcF9zdGFjaygpOworCQl1Ymlmc19kdW1wX2J1ZGcoYywgJmMt
PmJpKTsKKwkJdWJpZnNfZHVtcF9scHJvcHMoYyk7CiAJCWNtdF9yZXRyaWVzID0gZGJnX2NoZWNr
X2xwcm9wcyhjKTsKIAkJdXBfd3JpdGUoJmMtPmNvbW1pdF9zZW0pOwogCX0KQEAgLTY5Nyw5ICs2
OTcsOCBAQAogCWludCBkbGVuID0gQ09NUFJFU1NFRF9EQVRBX05PREVfQlVGX1NaLCBhbGxvY2F0
ZWQgPSAxOwogCXN0cnVjdCB1Ymlmc19pbm9kZSAqdWkgPSB1Ymlmc19pbm9kZShpbm9kZSk7CiAK
LQlkYmdfam5sKCJpbm8gJWx1LCBibGsgJXUsIGxlbiAlZCwga2V5ICVzIiwKLQkJKHVuc2lnbmVk
IGxvbmcpa2V5X2ludW0oYywga2V5KSwga2V5X2Jsb2NrKGMsIGtleSksIGxlbiwKLQkJREJHS0VZ
KGtleSkpOworCWRiZ19qbmxrKGtleSwgImlubyAlbHUsIGJsayAldSwgbGVuICVkLCBrZXkgIiwK
KwkJKHVuc2lnbmVkIGxvbmcpa2V5X2ludW0oYywga2V5KSwga2V5X2Jsb2NrKGMsIGtleSksIGxl
bik7CiAJdWJpZnNfYXNzZXJ0KGxlbiA8PSBVQklGU19CTE9DS19TSVpFKTsKIAogCWRhdGEgPSBr
bWFsbG9jKGRsZW4sIEdGUF9OT0ZTIHwgX19HRlBfTk9XQVJOKTsKQEAgLTExNzcsNyArMTE3Niw3
IEBACiAJCWRuID0gKHZvaWQgKil0cnVuICsgVUJJRlNfVFJVTl9OT0RFX1NaOwogCQlibGsgPSBu
ZXdfc2l6ZSA+PiBVQklGU19CTE9DS19TSElGVDsKIAkJZGF0YV9rZXlfaW5pdChjLCAma2V5LCBp
bnVtLCBibGspOwotCQlkYmdfam5sKCJsYXN0IGJsb2NrIGtleSAlcyIsIERCR0tFWSgma2V5KSk7
CisJCWRiZ19qbmxrKCZrZXksICJsYXN0IGJsb2NrIGtleSAiKTsKIAkJZXJyID0gdWJpZnNfdG5j
X2xvb2t1cChjLCAma2V5LCBkbik7CiAJCWlmIChlcnIgPT0gLUVOT0VOVCkKIAkJCWRsZW4gPSAw
OyAvKiBOb3QgZm91bmQgKHNvIGl0IGlzIGEgaG9sZSkgKi8KQEAgLTEyNjgsNyArMTI2Nyw2IEBA
CiAJcmV0dXJuIGVycjsKIH0KIAotI2lmZGVmIENPTkZJR19VQklGU19GU19YQVRUUgogCiAvKioK
ICAqIHViaWZzX2pubF9kZWxldGVfeGF0dHIgLSBkZWxldGUgYW4gZXh0ZW5kZWQgYXR0cmlidXRl
LgpAQCAtMTQ2Myw0ICsxNDYxLDMgQEAKIAlyZXR1cm4gZXJyOwogfQogCi0jZW5kaWYgLyogQ09O
RklHX1VCSUZTX0ZTX1hBVFRSICovCmRpZmYgLXVOIC11TnIgbGludXgtMy4wL2ZzL3ViaWZzL2xv
Zy5jIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9mcy91Ymlmcy9sb2cuYwotLS0gbGludXgtMy4w
L2ZzL3ViaWZzL2xvZy5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBs
aW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZnMvdWJpZnMvbG9nLmMJMjAxMi0wNi0yOCAxMToyNjox
NS4wMDAwMDAwMDAgLTA1MDAKQEAgLTI5LDExICsyOSw3IEBACiAKICNpbmNsdWRlICJ1Ymlmcy5o
IgogCi0jaWZkZWYgQ09ORklHX1VCSUZTX0ZTX0RFQlVHCiBzdGF0aWMgaW50IGRiZ19jaGVja19i
dWRfYnl0ZXMoc3RydWN0IHViaWZzX2luZm8gKmMpOwotI2Vsc2UKLSNkZWZpbmUgZGJnX2NoZWNr
X2J1ZF9ieXRlcyhjKSAwCi0jZW5kaWYKIAogLyoqCiAgKiB1Ymlmc19zZWFyY2hfYnVkIC0gc2Vh
cmNoIGJ1ZCBMRUIuCkBAIC0yNjIsNyArMjU4LDcgQEAKIAkJICogYW4gdW5jbGVhbiByZWJvb3Qs
IGJlY2F1c2UgdGhlIHRhcmdldCBMRUIgbWlnaHQgaGF2ZSBiZWVuCiAJCSAqIHVubWFwcGVkLCBi
dXQgbm90IHlldCBwaHlzaWNhbGx5IGVyYXNlZC4KIAkJICovCi0JCWVyciA9IHViaV9sZWJfbWFw
KGMtPnViaSwgYnVkLT5sbnVtLCBVQklfU0hPUlRURVJNKTsKKwkJZXJyID0gdWJpZnNfbGViX21h
cChjLCBidWQtPmxudW0pOwogCQlpZiAoZXJyKQogCQkJZ290byBvdXRfdW5sb2NrOwogCX0KQEAg
LTI3MCw3ICsyNjYsNyBAQAogCWRiZ19sb2coIndyaXRlIHJlZiBMRUIgJWQ6JWQiLAogCQljLT5s
aGVhZF9sbnVtLCBjLT5saGVhZF9vZmZzKTsKIAllcnIgPSB1Ymlmc193cml0ZV9ub2RlKGMsIHJl
ZiwgVUJJRlNfUkVGX05PREVfU1osIGMtPmxoZWFkX2xudW0sCi0JCQkgICAgICAgYy0+bGhlYWRf
b2ZmcywgVUJJX1NIT1JUVEVSTSk7CisJCQkgICAgICAgYy0+bGhlYWRfb2Zmcyk7CiAJaWYgKGVy
cikKIAkJZ290byBvdXRfdW5sb2NrOwogCkBAIC0yODMsOCArMjc5LDYgQEAKIAlyZXR1cm4gMDsK
IAogb3V0X3VubG9jazoKLQlpZiAoZXJyICE9IC1FQUdBSU4pCi0JCXViaWZzX3JvX21vZGUoYywg
ZXJyKTsKIAltdXRleF91bmxvY2soJmMtPmxvZ19tdXRleCk7CiAJa2ZyZWUocmVmKTsKIAlrZnJl
ZShidWQpOwpAQCAtNDI0LDcgKzQxOCw3IEBACiAKIAlsZW4gPSBBTElHTihsZW4sIGMtPm1pbl9p
b19zaXplKTsKIAlkYmdfbG9nKCJ3cml0aW5nIGNvbW1pdCBzdGFydCBhdCBMRUIgJWQ6MCwgbGVu
ICVkIiwgYy0+bGhlYWRfbG51bSwgbGVuKTsKLQllcnIgPSB1Ymlmc19sZWJfd3JpdGUoYywgYy0+
bGhlYWRfbG51bSwgY3MsIDAsIGxlbiwgVUJJX1NIT1JUVEVSTSk7CisJZXJyID0gdWJpZnNfbGVi
X3dyaXRlKGMsIGMtPmxoZWFkX2xudW0sIGNzLCAwLCBsZW4pOwogCWlmIChlcnIpCiAJCWdvdG8g
b3V0OwogCkBAIC02MjUsNyArNjE5LDcgQEAKIAkJaW50IHN6ID0gQUxJR04oKm9mZnMsIGMtPm1p
bl9pb19zaXplKSwgZXJyOwogCiAJCXViaWZzX3BhZChjLCBidWYgKyAqb2Zmcywgc3ogLSAqb2Zm
cyk7Ci0JCWVyciA9IHViaWZzX2xlYl9jaGFuZ2UoYywgKmxudW0sIGJ1Ziwgc3osIFVCSV9TSE9S
VFRFUk0pOworCQllcnIgPSB1Ymlmc19sZWJfY2hhbmdlKGMsICpsbnVtLCBidWYsIHN6KTsKIAkJ
aWYgKGVycikKIAkJCXJldHVybiBlcnI7CiAJCSpsbnVtID0gdWJpZnNfbmV4dF9sb2dfbG51bShj
LCAqbG51bSk7CkBAIC03MDQsNyArNjk4LDcgQEAKIAkJaW50IHN6ID0gQUxJR04ob2ZmcywgYy0+
bWluX2lvX3NpemUpOwogCiAJCXViaWZzX3BhZChjLCBidWYgKyBvZmZzLCBzeiAtIG9mZnMpOwot
CQllcnIgPSB1Ymlmc19sZWJfY2hhbmdlKGMsIHdyaXRlX2xudW0sIGJ1Ziwgc3osIFVCSV9TSE9S
VFRFUk0pOworCQllcnIgPSB1Ymlmc19sZWJfY2hhbmdlKGMsIHdyaXRlX2xudW0sIGJ1Ziwgc3op
OwogCQlpZiAoZXJyKQogCQkJZ290byBvdXRfZnJlZTsKIAkJb2ZmcyA9IEFMSUdOKG9mZnMsIGMt
Pm1pbl9pb19zaXplKTsKQEAgLTczNiw4ICs3MzAsNiBAQAogCXJldHVybiBlcnI7CiB9CiAKLSNp
ZmRlZiBDT05GSUdfVUJJRlNfRlNfREVCVUcKLQogLyoqCiAgKiBkYmdfY2hlY2tfYnVkX2J5dGVz
IC0gbWFrZSBzdXJlIGJ1ZCBieXRlcyBjYWxjdWxhdGlvbiBhcmUgYWxsIHJpZ2h0LgogICogQGM6
IFVCSUZTIGZpbGUtc3lzdGVtIGRlc2NyaXB0aW9uIG9iamVjdApAQCAtNzUyLDcgKzc0NCw3IEBA
CiAJc3RydWN0IHViaWZzX2J1ZCAqYnVkOwogCWxvbmcgbG9uZyBidWRfYnl0ZXMgPSAwOwogCi0J
aWYgKCEodWJpZnNfY2hrX2ZsYWdzICYgVUJJRlNfQ0hLX0dFTikpCisJaWYgKCFkYmdfaXNfY2hr
X2dlbihjKSkKIAkJcmV0dXJuIDA7CiAKIAlzcGluX2xvY2soJmMtPmJ1ZHNfbG9jayk7CkBAIC03
NjksNSArNzYxLDMgQEAKIAogCXJldHVybiBlcnI7CiB9Ci0KLSNlbmRpZiAvKiBDT05GSUdfVUJJ
RlNfRlNfREVCVUcgKi8KZGlmZiAtdU4gLXVOciBsaW51eC0zLjAvZnMvdWJpZnMvbHByb3BzLmMg
bGludXgtMy4wLngudWJpZnMubGF0ZXN0L2ZzL3ViaWZzL2xwcm9wcy5jCi0tLSBsaW51eC0zLjAv
ZnMvdWJpZnMvbHByb3BzLmMJMjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysr
IGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9mcy91Ymlmcy9scHJvcHMuYwkyMDEyLTA2LTI4IDEx
OjI2OjE1LjAwMDAwMDAwMCAtMDUwMApAQCAtNDQ3LDcgKzQ0Nyw3IEBACiAJaW50IG5ld19jYXQg
PSB1Ymlmc19jYXRlZ29yaXplX2xwcm9wcyhjLCBscHJvcHMpOwogCiAJaWYgKG9sZF9jYXQgPT0g
bmV3X2NhdCkgewotCQlzdHJ1Y3QgdWJpZnNfbHB0X2hlYXAgKmhlYXAgPSAmYy0+bHB0X2hlYXBb
bmV3X2NhdCAtIDFdOworCQlzdHJ1Y3QgdWJpZnNfbHB0X2hlYXAgKmhlYXA7CiAKIAkJLyogbHBy
b3BzIG9uIGEgaGVhcCBub3cgbXVzdCBiZSBtb3ZlZCB1cCBvciBkb3duICovCiAJCWlmIChuZXdf
Y2F0IDwgMSB8fCBuZXdfY2F0ID4gTFBST1BTX0hFQVBfQ05UKQpAQCAtNTA0LDcgKzUwNCw3IEBA
CiAJcG5vZGUgPSAoc3RydWN0IHViaWZzX3Bub2RlICopY29udGFpbmVyX29mKGxwcm9wcyAtIHBv
cywKIAkJCQkJCSAgIHN0cnVjdCB1Ymlmc19wbm9kZSwKIAkJCQkJCSAgIGxwcm9wc1swXSk7Ci0J
cmV0dXJuICF0ZXN0X2JpdChDT1dfWk5PREUsICZwbm9kZS0+ZmxhZ3MpICYmCisJcmV0dXJuICF0
ZXN0X2JpdChDT1dfQ05PREUsICZwbm9kZS0+ZmxhZ3MpICYmCiAJICAgICAgIHRlc3RfYml0KERJ
UlRZX0NOT0RFLCAmcG5vZGUtPmZsYWdzKTsKIH0KIApAQCAtODQ2LDcgKzg0Niw5IEBACiAJcmV0
dXJuIGxwcm9wczsKIH0KIAotI2lmZGVmIENPTkZJR19VQklGU19GU19ERUJVRworLyoKKyAqIEV2
ZXJ5dGhpbmcgYmVsb3cgaXMgcmVsYXRlZCB0byBkZWJ1Z2dpbmcuCisgKi8KIAogLyoqCiAgKiBk
YmdfY2hlY2tfY2F0cyAtIGNoZWNrIGNhdGVnb3J5IGhlYXBzIGFuZCBsaXN0cy4KQEAgLTg2MCw3
ICs4NjIsNyBAQAogCXN0cnVjdCBsaXN0X2hlYWQgKnBvczsKIAlpbnQgaSwgY2F0OwogCi0JaWYg
KCEodWJpZnNfY2hrX2ZsYWdzICYgKFVCSUZTX0NIS19HRU4gfCBVQklGU19DSEtfTFBST1BTKSkp
CisJaWYgKCFkYmdfaXNfY2hrX2dlbihjKSAmJiAhZGJnX2lzX2Noa19scHJvcHMoYykpCiAJCXJl
dHVybiAwOwogCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShscHJvcHMsICZjLT5lbXB0eV9saXN0LCBs
aXN0KSB7CkBAIC05NTgsNyArOTYwLDcgQEAKIHsKIAlpbnQgaSA9IDAsIGosIGVyciA9IDA7CiAK
LQlpZiAoISh1Ymlmc19jaGtfZmxhZ3MgJiAoVUJJRlNfQ0hLX0dFTiB8IFVCSUZTX0NIS19MUFJP
UFMpKSkKKwlpZiAoIWRiZ19pc19jaGtfZ2VuKGMpICYmICFkYmdfaXNfY2hrX2xwcm9wcyhjKSkK
IAkJcmV0dXJuOwogCiAJZm9yIChpID0gMDsgaSA8IGhlYXAtPmNudDsgaSsrKSB7CkBAIC0xMDAx
LDggKzEwMDMsOCBAQAogb3V0OgogCWlmIChlcnIpIHsKIAkJZGJnX21zZygiZmFpbGVkIGNhdCAl
ZCBocG9zICVkIGVyciAlZCIsIGNhdCwgaSwgZXJyKTsKLQkJZGJnX2R1bXBfc3RhY2soKTsKLQkJ
ZGJnX2R1bXBfaGVhcChjLCBoZWFwLCBjYXQpOworCQlkdW1wX3N0YWNrKCk7CisJCXViaWZzX2R1
bXBfaGVhcChjLCBoZWFwLCBjYXQpOwogCX0KIH0KIApAQCAtMTEwOSw4ICsxMTExLDggQEAKIAlp
ZiAoSVNfRVJSKHNsZWIpKSB7CiAJCXJldCA9IFBUUl9FUlIoc2xlYik7CiAJCWlmIChyZXQgPT0g
LUVVQ0xFQU4pIHsKLQkJCWRiZ19kdW1wX2xwcm9wcyhjKTsKLQkJCWRiZ19kdW1wX2J1ZGcoYywg
JmMtPmJpKTsKKwkJCXViaWZzX2R1bXBfbHByb3BzKGMpOworCQkJdWJpZnNfZHVtcF9idWRnKGMs
ICZjLT5iaSk7CiAJCX0KIAkJZ290byBvdXQ7CiAJfQpAQCAtMTIzNyw3ICsxMjM5LDcgQEAKIAl1
Ymlmc19lcnIoImJhZCBhY2NvdW50aW5nIG9mIExFQiAlZDogZnJlZSAlZCwgZGlydHkgJWQgZmxh
Z3MgJSN4LCAiCiAJCSAgInNob3VsZCBiZSBmcmVlICVkLCBkaXJ0eSAlZCIsCiAJCSAgbG51bSwg
bHAtPmZyZWUsIGxwLT5kaXJ0eSwgbHAtPmZsYWdzLCBmcmVlLCBkaXJ0eSk7Ci0JZGJnX2R1bXBf
bGViKGMsIGxudW0pOworCXViaWZzX2R1bXBfbGViKGMsIGxudW0pOwogb3V0X2Rlc3Ryb3k6CiAJ
dWJpZnNfc2Nhbl9kZXN0cm95KHNsZWIpOwogCXJldCA9IC1FSU5WQUw7CkBAIC0xMjYyLDcgKzEy
NjQsNyBAQAogCWludCBpLCBlcnI7CiAJc3RydWN0IHViaWZzX2xwX3N0YXRzIGxzdDsKIAotCWlm
ICghKHViaWZzX2Noa19mbGFncyAmIFVCSUZTX0NIS19MUFJPUFMpKQorCWlmICghZGJnX2lzX2No
a19scHJvcHMoYykpCiAJCXJldHVybiAwOwogCiAJLyoKQEAgLTEzMTUsNSArMTMxNywzIEBACiBv
dXQ6CiAJcmV0dXJuIGVycjsKIH0KLQotI2VuZGlmIC8qIENPTkZJR19VQklGU19GU19ERUJVRyAq
LwpkaWZmIC11TiAtdU5yIGxpbnV4LTMuMC9mcy91Ymlmcy9scHQuYyBsaW51eC0zLjAueC51Ymlm
cy5sYXRlc3QvZnMvdWJpZnMvbHB0LmMKLS0tIGxpbnV4LTMuMC9mcy91Ymlmcy9scHQuYwkyMDEx
LTA3LTIxIDIxOjE3OjIzLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtMy4wLngudWJpZnMubGF0
ZXN0L2ZzL3ViaWZzL2xwdC5jCTIwMTItMDYtMjggMTE6MjY6MTUuMDAwMDAwMDAwIC0wNTAwCkBA
IC03MDEsOCArNzAxLDcgQEAKIAkJCWFsZW4gPSBBTElHTihsZW4sIGMtPm1pbl9pb19zaXplKTsK
IAkJCXNldF9sdGFiKGMsIGxudW0sIGMtPmxlYl9zaXplIC0gYWxlbiwgYWxlbiAtIGxlbik7CiAJ
CQltZW1zZXQocCwgMHhmZiwgYWxlbiAtIGxlbik7Ci0JCQllcnIgPSB1YmlfbGViX2NoYW5nZShj
LT51YmksIGxudW0rKywgYnVmLCBhbGVuLAotCQkJCQkgICAgIFVCSV9TSE9SVFRFUk0pOworCQkJ
ZXJyID0gdWJpZnNfbGViX2NoYW5nZShjLCBsbnVtKyssIGJ1ZiwgYWxlbik7CiAJCQlpZiAoZXJy
KQogCQkJCWdvdG8gb3V0OwogCQkJcCA9IGJ1ZjsKQEAgLTczMiw4ICs3MzEsNyBAQAogCQkJCXNl
dF9sdGFiKGMsIGxudW0sIGMtPmxlYl9zaXplIC0gYWxlbiwKIAkJCQkJICAgIGFsZW4gLSBsZW4p
OwogCQkJCW1lbXNldChwLCAweGZmLCBhbGVuIC0gbGVuKTsKLQkJCQllcnIgPSB1YmlfbGViX2No
YW5nZShjLT51YmksIGxudW0rKywgYnVmLCBhbGVuLAotCQkJCQkJICAgICBVQklfU0hPUlRURVJN
KTsKKwkJCQllcnIgPSB1Ymlmc19sZWJfY2hhbmdlKGMsIGxudW0rKywgYnVmLCBhbGVuKTsKIAkJ
CQlpZiAoZXJyKQogCQkJCQlnb3RvIG91dDsKIAkJCQlwID0gYnVmOwpAQCAtNzgwLDggKzc3OCw3
IEBACiAJCQlhbGVuID0gQUxJR04obGVuLCBjLT5taW5faW9fc2l6ZSk7CiAJCQlzZXRfbHRhYihj
LCBsbnVtLCBjLT5sZWJfc2l6ZSAtIGFsZW4sIGFsZW4gLSBsZW4pOwogCQkJbWVtc2V0KHAsIDB4
ZmYsIGFsZW4gLSBsZW4pOwotCQkJZXJyID0gdWJpX2xlYl9jaGFuZ2UoYy0+dWJpLCBsbnVtKyss
IGJ1ZiwgYWxlbiwKLQkJCQkJICAgICBVQklfU0hPUlRURVJNKTsKKwkJCWVyciA9IHViaWZzX2xl
Yl9jaGFuZ2UoYywgbG51bSsrLCBidWYsIGFsZW4pOwogCQkJaWYgKGVycikKIAkJCQlnb3RvIG91
dDsKIAkJCXAgPSBidWY7CkBAIC04MDYsNyArODAzLDcgQEAKIAkJYWxlbiA9IEFMSUdOKGxlbiwg
Yy0+bWluX2lvX3NpemUpOwogCQlzZXRfbHRhYihjLCBsbnVtLCBjLT5sZWJfc2l6ZSAtIGFsZW4s
IGFsZW4gLSBsZW4pOwogCQltZW1zZXQocCwgMHhmZiwgYWxlbiAtIGxlbik7Ci0JCWVyciA9IHVi
aV9sZWJfY2hhbmdlKGMtPnViaSwgbG51bSsrLCBidWYsIGFsZW4sIFVCSV9TSE9SVFRFUk0pOwor
CQllcnIgPSB1Ymlmc19sZWJfY2hhbmdlKGMsIGxudW0rKywgYnVmLCBhbGVuKTsKIAkJaWYgKGVy
cikKIAkJCWdvdG8gb3V0OwogCQlwID0gYnVmOwpAQCAtODI2LDcgKzgyMyw3IEBACiAKIAkvKiBX
cml0ZSByZW1haW5pbmcgYnVmZmVyICovCiAJbWVtc2V0KHAsIDB4ZmYsIGFsZW4gLSBsZW4pOwot
CWVyciA9IHViaV9sZWJfY2hhbmdlKGMtPnViaSwgbG51bSwgYnVmLCBhbGVuLCBVQklfU0hPUlRU
RVJNKTsKKwllcnIgPSB1Ymlmc19sZWJfY2hhbmdlKGMsIGxudW0sIGJ1ZiwgYWxlbik7CiAJaWYg
KGVycikKIAkJZ290byBvdXQ7CiAKQEAgLTkyNiw3ICs5MjMsNyBAQAogCWlmIChjcmMgIT0gY2Fs
Y19jcmMpIHsKIAkJdWJpZnNfZXJyKCJpbnZhbGlkIGNyYyBpbiBMUFQgbm9kZTogY3JjICVoeCBj
YWxjICVoeCIsIGNyYywKIAkJCSAgY2FsY19jcmMpOwotCQlkYmdfZHVtcF9zdGFjaygpOworCQlk
dW1wX3N0YWNrKCk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAlyZXR1cm4gMDsKQEAgLTk0OSw3
ICs5NDYsNyBAQAogCWlmIChub2RlX3R5cGUgIT0gdHlwZSkgewogCQl1Ymlmc19lcnIoImludmFs
aWQgdHlwZSAoJWQpIGluIExQVCBub2RlIHR5cGUgJWQiLCBub2RlX3R5cGUsCiAJCQkgIHR5cGUp
OwotCQlkYmdfZHVtcF9zdGFjaygpOworCQlkdW1wX3N0YWNrKCk7CiAJCXJldHVybiAtRUlOVkFM
OwogCX0KIAlyZXR1cm4gMDsKQEAgLTEyMjIsNyArMTIxOSw3IEBACiAJCWlmIChjLT5iaWdfbHB0
KQogCQkJbm5vZGUtPm51bSA9IGNhbGNfbm5vZGVfbnVtX2Zyb21fcGFyZW50KGMsIHBhcmVudCwg
aWlwKTsKIAl9IGVsc2UgewotCQllcnIgPSB1YmlfcmVhZChjLT51YmksIGxudW0sIGJ1Ziwgb2Zm
cywgYy0+bm5vZGVfc3opOworCQllcnIgPSB1Ymlmc19sZWJfcmVhZChjLCBsbnVtLCBidWYsIG9m
ZnMsIGMtPm5ub2RlX3N6LCAxKTsKIAkJaWYgKGVycikKIAkJCWdvdG8gb3V0OwogCQllcnIgPSB1
Ymlmc191bnBhY2tfbm5vZGUoYywgYnVmLCBubm9kZSk7CkBAIC0xMjQ3LDYgKzEyNDQsNyBAQAog
CiBvdXQ6CiAJdWJpZnNfZXJyKCJlcnJvciAlZCByZWFkaW5nIG5ub2RlIGF0ICVkOiVkIiwgZXJy
LCBsbnVtLCBvZmZzKTsKKwlkdW1wX3N0YWNrKCk7CiAJa2ZyZWUobm5vZGUpOwogCXJldHVybiBl
cnI7CiB9CkBAIC0xMjkwLDcgKzEyODgsNyBAQAogCQkJbHByb3BzLT5mbGFncyA9IHViaWZzX2Nh
dGVnb3JpemVfbHByb3BzKGMsIGxwcm9wcyk7CiAJCX0KIAl9IGVsc2UgewotCQllcnIgPSB1Ymlf
cmVhZChjLT51YmksIGxudW0sIGJ1Ziwgb2ZmcywgYy0+cG5vZGVfc3opOworCQllcnIgPSB1Ymlm
c19sZWJfcmVhZChjLCBsbnVtLCBidWYsIG9mZnMsIGMtPnBub2RlX3N6LCAxKTsKIAkJaWYgKGVy
cikKIAkJCWdvdG8gb3V0OwogCQllcnIgPSB1bnBhY2tfcG5vZGUoYywgYnVmLCBwbm9kZSk7CkBA
IC0xMzExLDcgKzEzMDksOCBAQAogCiBvdXQ6CiAJdWJpZnNfZXJyKCJlcnJvciAlZCByZWFkaW5n
IHBub2RlIGF0ICVkOiVkIiwgZXJyLCBsbnVtLCBvZmZzKTsKLQlkYmdfZHVtcF9wbm9kZShjLCBw
bm9kZSwgcGFyZW50LCBpaXApOworCXViaWZzX2R1bXBfcG5vZGUoYywgcG5vZGUsIHBhcmVudCwg
aWlwKTsKKwlkdW1wX3N0YWNrKCk7CiAJZGJnX21zZygiY2FsYyBudW06ICVkIiwgY2FsY19wbm9k
ZV9udW1fZnJvbV9wYXJlbnQoYywgcGFyZW50LCBpaXApKTsKIAlrZnJlZShwbm9kZSk7CiAJcmV0
dXJuIGVycjsKQEAgLTEzMzEsNyArMTMzMCw3IEBACiAJYnVmID0gdm1hbGxvYyhjLT5sdGFiX3N6
KTsKIAlpZiAoIWJ1ZikKIAkJcmV0dXJuIC1FTk9NRU07Ci0JZXJyID0gdWJpX3JlYWQoYy0+dWJp
LCBjLT5sdGFiX2xudW0sIGJ1ZiwgYy0+bHRhYl9vZmZzLCBjLT5sdGFiX3N6KTsKKwllcnIgPSB1
Ymlmc19sZWJfcmVhZChjLCBjLT5sdGFiX2xudW0sIGJ1ZiwgYy0+bHRhYl9vZmZzLCBjLT5sdGFi
X3N6LCAxKTsKIAlpZiAoZXJyKQogCQlnb3RvIG91dDsKIAllcnIgPSB1bnBhY2tfbHRhYihjLCBi
dWYpOwpAQCAtMTM1NCw3ICsxMzUzLDggQEAKIAlidWYgPSB2bWFsbG9jKGMtPmxzYXZlX3N6KTsK
IAlpZiAoIWJ1ZikKIAkJcmV0dXJuIC1FTk9NRU07Ci0JZXJyID0gdWJpX3JlYWQoYy0+dWJpLCBj
LT5sc2F2ZV9sbnVtLCBidWYsIGMtPmxzYXZlX29mZnMsIGMtPmxzYXZlX3N6KTsKKwllcnIgPSB1
Ymlmc19sZWJfcmVhZChjLCBjLT5sc2F2ZV9sbnVtLCBidWYsIGMtPmxzYXZlX29mZnMsCisJCQkg
ICAgIGMtPmxzYXZlX3N6LCAxKTsKIAlpZiAoZXJyKQogCQlnb3RvIG91dDsKIAllcnIgPSB1bnBh
Y2tfbHNhdmUoYywgYnVmKTsKQEAgLTE3MzcsMTYgKzE3MzcsMjAgQEAKIAlpZiAocmQpIHsKIAkJ
ZXJyID0gbHB0X2luaXRfcmQoYyk7CiAJCWlmIChlcnIpCi0JCQlyZXR1cm4gZXJyOworCQkJZ290
byBvdXRfZXJyOwogCX0KIAogCWlmICh3cikgewogCQllcnIgPSBscHRfaW5pdF93cihjKTsKIAkJ
aWYgKGVycikKLQkJCXJldHVybiBlcnI7CisJCQlnb3RvIG91dF9lcnI7CiAJfQogCiAJcmV0dXJu
IDA7CisKK291dF9lcnI6CisJdWJpZnNfbHB0X2ZyZWUoYywgMCk7CisJcmV0dXJuIGVycjsKIH0K
IAogLyoqCkBAIC0xODE0LDggKzE4MTgsOCBAQAogCQlpZiAoYy0+YmlnX2xwdCkKIAkJCW5ub2Rl
LT5udW0gPSBjYWxjX25ub2RlX251bV9mcm9tX3BhcmVudChjLCBwYXJlbnQsIGlpcCk7CiAJfSBl
bHNlIHsKLQkJZXJyID0gdWJpX3JlYWQoYy0+dWJpLCBicmFuY2gtPmxudW0sIGJ1ZiwgYnJhbmNo
LT5vZmZzLAotCQkJICAgICAgIGMtPm5ub2RlX3N6KTsKKwkJZXJyID0gdWJpZnNfbGViX3JlYWQo
YywgYnJhbmNoLT5sbnVtLCBidWYsIGJyYW5jaC0+b2ZmcywKKwkJCQkgICAgIGMtPm5ub2RlX3N6
LCAxKTsKIAkJaWYgKGVycikKIAkJCXJldHVybiBFUlJfUFRSKGVycik7CiAJCWVyciA9IHViaWZz
X3VucGFja19ubm9kZShjLCBidWYsIG5ub2RlKTsKQEAgLTE4ODMsOCArMTg4Nyw4IEBACiAJCXVi
aWZzX2Fzc2VydChicmFuY2gtPmxudW0gPj0gYy0+bHB0X2ZpcnN0ICYmCiAJCQkgICAgIGJyYW5j
aC0+bG51bSA8PSBjLT5scHRfbGFzdCk7CiAJCXViaWZzX2Fzc2VydChicmFuY2gtPm9mZnMgPj0g
MCAmJiBicmFuY2gtPm9mZnMgPCBjLT5sZWJfc2l6ZSk7Ci0JCWVyciA9IHViaV9yZWFkKGMtPnVi
aSwgYnJhbmNoLT5sbnVtLCBidWYsIGJyYW5jaC0+b2ZmcywKLQkJCSAgICAgICBjLT5wbm9kZV9z
eik7CisJCWVyciA9IHViaWZzX2xlYl9yZWFkKGMsIGJyYW5jaC0+bG51bSwgYnVmLCBicmFuY2gt
Pm9mZnMsCisJCQkJICAgICBjLT5wbm9kZV9zeiwgMSk7CiAJCWlmIChlcnIpCiAJCQlyZXR1cm4g
RVJSX1BUUihlcnIpOwogCQllcnIgPSB1bnBhY2tfcG5vZGUoYywgYnVmLCBwbm9kZSk7CkBAIC0x
OTgzLDEyICsxOTg3LDExIEBACiAKIAkJCQlpZiAocGF0aFtoXS5pbl90cmVlKQogCQkJCQljb250
aW51ZTsKLQkJCQlubm9kZSA9IGttYWxsb2Moc3osIEdGUF9OT0ZTKTsKKwkJCQlubm9kZSA9IGtt
ZW1kdXAoJnBhdGhbaF0ubm5vZGUsIHN6LCBHRlBfTk9GUyk7CiAJCQkJaWYgKCFubm9kZSkgewog
CQkJCQllcnIgPSAtRU5PTUVNOwogCQkJCQlnb3RvIG91dDsKIAkJCQl9Ci0JCQkJbWVtY3B5KG5u
b2RlLCAmcGF0aFtoXS5ubm9kZSwgc3opOwogCQkJCXBhcmVudCA9IG5ub2RlLT5wYXJlbnQ7CiAJ
CQkJcGFyZW50LT5uYnJhbmNoW25ub2RlLT5paXBdLm5ub2RlID0gbm5vZGU7CiAJCQkJcGF0aFto
XS5wdHIubm5vZGUgPSBubm9kZTsKQEAgLTIwMDEsMTIgKzIwMDQsMTEgQEAKIAkJCQljb25zdCBz
aXplX3Qgc3ogPSBzaXplb2Yoc3RydWN0IHViaWZzX3Bub2RlKTsKIAkJCQlzdHJ1Y3QgdWJpZnNf
bm5vZGUgKnBhcmVudDsKIAotCQkJCXBub2RlID0ga21hbGxvYyhzeiwgR0ZQX05PRlMpOworCQkJ
CXBub2RlID0ga21lbWR1cCgmcGF0aFtoXS5wbm9kZSwgc3osIEdGUF9OT0ZTKTsKIAkJCQlpZiAo
IXBub2RlKSB7CiAJCQkJCWVyciA9IC1FTk9NRU07CiAJCQkJCWdvdG8gb3V0OwogCQkJCX0KLQkJ
CQltZW1jcHkocG5vZGUsICZwYXRoW2hdLnBub2RlLCBzeik7CiAJCQkJcGFyZW50ID0gcG5vZGUt
PnBhcmVudDsKIAkJCQlwYXJlbnQtPm5icmFuY2hbcG5vZGUtPmlpcF0ucG5vZGUgPSBwbm9kZTsK
IAkJCQlwYXRoW2hdLnB0ci5wbm9kZSA9IHBub2RlOwpAQCAtMjA3OSw4ICsyMDgxLDYgQEAKIAly
ZXR1cm4gZXJyOwogfQogCi0jaWZkZWYgQ09ORklHX1VCSUZTX0ZTX0RFQlVHCi0KIC8qKgogICog
ZGJnX2Noa19wbm9kZSAtIGNoZWNrIGEgcG5vZGUuCiAgKiBAYzogdGhlIFVCSUZTIGZpbGUtc3lz
dGVtIGRlc2NyaXB0aW9uIG9iamVjdApAQCAtMjA5NSw4ICsyMDk1LDggQEAKIAlpbnQgaTsKIAog
CWlmIChwbm9kZS0+bnVtICE9IGNvbCkgewotCQlkYmdfZXJyKCJwbm9kZSBudW0gJWQgZXhwZWN0
ZWQgJWQgcGFyZW50IG51bSAlZCBpaXAgJWQiLAotCQkJcG5vZGUtPm51bSwgY29sLCBwbm9kZS0+
cGFyZW50LT5udW0sIHBub2RlLT5paXApOworCQl1Ymlmc19lcnIoInBub2RlIG51bSAlZCBleHBl
Y3RlZCAlZCBwYXJlbnQgbnVtICVkIGlpcCAlZCIsCisJCQkgIHBub2RlLT5udW0sIGNvbCwgcG5v
ZGUtPnBhcmVudC0+bnVtLCBwbm9kZS0+aWlwKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCWZv
ciAoaSA9IDA7IGkgPCBVQklGU19MUFRfRkFOT1VUOyBpKyspIHsKQEAgLTIxMTAsMTQgKzIxMTAs
MTQgQEAKIAkJaWYgKGxudW0gPj0gYy0+bGViX2NudCkKIAkJCWNvbnRpbnVlOwogCQlpZiAobHBy
b3BzLT5sbnVtICE9IGxudW0pIHsKLQkJCWRiZ19lcnIoImJhZCBMRUIgbnVtYmVyICVkIGV4cGVj
dGVkICVkIiwKLQkJCQlscHJvcHMtPmxudW0sIGxudW0pOworCQkJdWJpZnNfZXJyKCJiYWQgTEVC
IG51bWJlciAlZCBleHBlY3RlZCAlZCIsCisJCQkJICBscHJvcHMtPmxudW0sIGxudW0pOwogCQkJ
cmV0dXJuIC1FSU5WQUw7CiAJCX0KIAkJaWYgKGxwcm9wcy0+ZmxhZ3MgJiBMUFJPUFNfVEFLRU4p
IHsKIAkJCWlmIChjYXQgIT0gTFBST1BTX1VOQ0FUKSB7Ci0JCQkJZGJnX2VycigiTEVCICVkIHRh
a2VuIGJ1dCBub3QgdW5jYXQgJWQiLAotCQkJCQlscHJvcHMtPmxudW0sIGNhdCk7CisJCQkJdWJp
ZnNfZXJyKCJMRUIgJWQgdGFrZW4gYnV0IG5vdCB1bmNhdCAlZCIsCisJCQkJCSAgbHByb3BzLT5s
bnVtLCBjYXQpOwogCQkJCXJldHVybiAtRUlOVkFMOwogCQkJfQogCQkJY29udGludWU7CkBAIC0y
MTI5LDggKzIxMjksOCBAQAogCQkJY2FzZSBMUFJPUFNfRlJESV9JRFg6CiAJCQkJYnJlYWs7CiAJ
CQlkZWZhdWx0OgotCQkJCWRiZ19lcnIoIkxFQiAlZCBpbmRleCBidXQgY2F0ICVkIiwKLQkJCQkJ
bHByb3BzLT5sbnVtLCBjYXQpOworCQkJCXViaWZzX2VycigiTEVCICVkIGluZGV4IGJ1dCBjYXQg
JWQiLAorCQkJCQkgIGxwcm9wcy0+bG51bSwgY2F0KTsKIAkJCQlyZXR1cm4gLUVJTlZBTDsKIAkJ
CX0KIAkJfSBlbHNlIHsKQEAgLTIxNDIsOCArMjE0Miw4IEBACiAJCQljYXNlIExQUk9QU19GUkVF
QUJMRToKIAkJCQlicmVhazsKIAkJCWRlZmF1bHQ6Ci0JCQkJZGJnX2VycigiTEVCICVkIG5vdCBp
bmRleCBidXQgY2F0ICVkIiwKLQkJCQkJbHByb3BzLT5sbnVtLCBjYXQpOworCQkJCXViaWZzX2Vy
cigiTEVCICVkIG5vdCBpbmRleCBidXQgY2F0ICVkIiwKKwkJCQkJICBscHJvcHMtPmxudW0sIGNh
dCk7CiAJCQkJcmV0dXJuIC1FSU5WQUw7CiAJCQl9CiAJCX0KQEAgLTIxODMsMjQgKzIxODMsMjQg
QEAKIAkJCWJyZWFrOwogCQl9CiAJCWlmICghZm91bmQpIHsKLQkJCWRiZ19lcnIoIkxFQiAlZCBj
YXQgJWQgbm90IGZvdW5kIGluIGNhdCBoZWFwL2xpc3QiLAotCQkJCWxwcm9wcy0+bG51bSwgY2F0
KTsKKwkJCXViaWZzX2VycigiTEVCICVkIGNhdCAlZCBub3QgZm91bmQgaW4gY2F0IGhlYXAvbGlz
dCIsCisJCQkJICBscHJvcHMtPmxudW0sIGNhdCk7CiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJfQog
CQlzd2l0Y2ggKGNhdCkgewogCQljYXNlIExQUk9QU19FTVBUWToKIAkJCWlmIChscHJvcHMtPmZy
ZWUgIT0gYy0+bGViX3NpemUpIHsKLQkJCQlkYmdfZXJyKCJMRUIgJWQgY2F0ICVkIGZyZWUgJWQg
ZGlydHkgJWQiLAotCQkJCQlscHJvcHMtPmxudW0sIGNhdCwgbHByb3BzLT5mcmVlLAotCQkJCQls
cHJvcHMtPmRpcnR5KTsKKwkJCQl1Ymlmc19lcnIoIkxFQiAlZCBjYXQgJWQgZnJlZSAlZCBkaXJ0
eSAlZCIsCisJCQkJCSAgbHByb3BzLT5sbnVtLCBjYXQsIGxwcm9wcy0+ZnJlZSwKKwkJCQkJICBs
cHJvcHMtPmRpcnR5KTsKIAkJCQlyZXR1cm4gLUVJTlZBTDsKIAkJCX0KIAkJY2FzZSBMUFJPUFNf
RlJFRUFCTEU6CiAJCWNhc2UgTFBST1BTX0ZSRElfSURYOgogCQkJaWYgKGxwcm9wcy0+ZnJlZSAr
IGxwcm9wcy0+ZGlydHkgIT0gYy0+bGViX3NpemUpIHsKLQkJCQlkYmdfZXJyKCJMRUIgJWQgY2F0
ICVkIGZyZWUgJWQgZGlydHkgJWQiLAotCQkJCQlscHJvcHMtPmxudW0sIGNhdCwgbHByb3BzLT5m
cmVlLAotCQkJCQlscHJvcHMtPmRpcnR5KTsKKwkJCQl1Ymlmc19lcnIoIkxFQiAlZCBjYXQgJWQg
ZnJlZSAlZCBkaXJ0eSAlZCIsCisJCQkJCSAgbHByb3BzLT5sbnVtLCBjYXQsIGxwcm9wcy0+ZnJl
ZSwKKwkJCQkJICBscHJvcHMtPmRpcnR5KTsKIAkJCQlyZXR1cm4gLUVJTlZBTDsKIAkJCX0KIAkJ
fQpAQCAtMjIyNCw3ICsyMjI0LDcgQEAKIAlzdHJ1Y3QgdWJpZnNfY25vZGUgKmNuOwogCWludCBu
dW0sIGlpcCA9IDAsIGVycjsKIAotCWlmICghKHViaWZzX2Noa19mbGFncyAmIFVCSUZTX0NIS19M
UFJPUFMpKQorCWlmICghZGJnX2lzX2Noa19scHJvcHMoYykpCiAJCXJldHVybiAwOwogCiAJd2hp
bGUgKGNub2RlKSB7CkBAIC0yMjM0LDkgKzIyMzQsMTAgQEAKIAkJCS8qIGNub2RlIGlzIGEgbm5v
ZGUgKi8KIAkJCW51bSA9IGNhbGNfbm5vZGVfbnVtKHJvdywgY29sKTsKIAkJCWlmIChjbm9kZS0+
bnVtICE9IG51bSkgewotCQkJCWRiZ19lcnIoIm5ub2RlIG51bSAlZCBleHBlY3RlZCAlZCAiCi0J
CQkJCSJwYXJlbnQgbnVtICVkIGlpcCAlZCIsIGNub2RlLT5udW0sIG51bSwKLQkJCQkJKG5ub2Rl
ID8gbm5vZGUtPm51bSA6IDApLCBjbm9kZS0+aWlwKTsKKwkJCQl1Ymlmc19lcnIoIm5ub2RlIG51
bSAlZCBleHBlY3RlZCAlZCAiCisJCQkJCSAgInBhcmVudCBudW0gJWQgaWlwICVkIiwKKwkJCQkJ
ICBjbm9kZS0+bnVtLCBudW0sCisJCQkJCSAgKG5ub2RlID8gbm5vZGUtPm51bSA6IDApLCBjbm9k
ZS0+aWlwKTsKIAkJCQlyZXR1cm4gLUVJTlZBTDsKIAkJCX0KIAkJCW5uID0gKHN0cnVjdCB1Ymlm
c19ubm9kZSAqKWNub2RlOwpAQCAtMjI3Myw1ICsyMjc0LDMgQEAKIAl9CiAJcmV0dXJuIDA7CiB9
Ci0KLSNlbmRpZiAvKiBDT05GSUdfVUJJRlNfRlNfREVCVUcgKi8KZGlmZiAtdU4gLXVOciBsaW51
eC0zLjAvZnMvdWJpZnMvbHB0X2NvbW1pdC5jIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9mcy91
Ymlmcy9scHRfY29tbWl0LmMKLS0tIGxpbnV4LTMuMC9mcy91Ymlmcy9scHRfY29tbWl0LmMJMjAx
MS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZzLmxh
dGVzdC9mcy91Ymlmcy9scHRfY29tbWl0LmMJMjAxMi0wNi0yOCAxMToyNjoxNS4wMDAwMDAwMDAg
LTA1MDAKQEAgLTI3LDEzICsyNywxMCBAQAogCiAjaW5jbHVkZSA8bGludXgvY3JjMTYuaD4KICNp
bmNsdWRlIDxsaW51eC9zbGFiLmg+CisjaW5jbHVkZSA8bGludXgvcmFuZG9tLmg+CiAjaW5jbHVk
ZSAidWJpZnMuaCIKIAotI2lmZGVmIENPTkZJR19VQklGU19GU19ERUJVRwogc3RhdGljIGludCBk
YmdfcG9wdWxhdGVfbHNhdmUoc3RydWN0IHViaWZzX2luZm8gKmMpOwotI2Vsc2UKLSNkZWZpbmUg
ZGJnX3BvcHVsYXRlX2xzYXZlKGMpIDAKLSNlbmRpZgogCiAvKioKICAqIGZpcnN0X2RpcnR5X2Nu
b2RlIC0gZmluZCBmaXJzdCBkaXJ0eSBjbm9kZS4KQEAgLTExNiw4ICsxMTMsOCBAQAogCQlyZXR1
cm4gMDsKIAljbnQgKz0gMTsKIAl3aGlsZSAoMSkgewotCQl1Ymlmc19hc3NlcnQoIXRlc3RfYml0
KENPV19aTk9ERSwgJmNub2RlLT5mbGFncykpOwotCQlfX3NldF9iaXQoQ09XX1pOT0RFLCAmY25v
ZGUtPmZsYWdzKTsKKwkJdWJpZnNfYXNzZXJ0KCF0ZXN0X2JpdChDT1dfQ05PREUsICZjbm9kZS0+
ZmxhZ3MpKTsKKwkJX19zZXRfYml0KENPV19DTk9ERSwgJmNub2RlLT5mbGFncyk7CiAJCWNuZXh0
ID0gbmV4dF9kaXJ0eV9jbm9kZShjbm9kZSk7CiAJCWlmICghY25leHQpIHsKIAkJCWNub2RlLT5j
bmV4dCA9IGMtPmxwdF9jbmV4dDsKQEAgLTMyMywxMSArMzIwLDEwIEBACiAJcmV0dXJuIDA7CiAK
IG5vX3NwYWNlOgotCXViaWZzX2VycigiTFBUIG91dCBvZiBzcGFjZSIpOwotCWRiZ19lcnIoIkxQ
VCBvdXQgb2Ygc3BhY2UgYXQgTEVCICVkOiVkIG5lZWRpbmcgJWQsIGRvbmVfbHRhYiAlZCwgIgot
CQkiZG9uZV9sc2F2ZSAlZCIsIGxudW0sIG9mZnMsIGxlbiwgZG9uZV9sdGFiLCBkb25lX2xzYXZl
KTsKLQlkYmdfZHVtcF9scHRfaW5mbyhjKTsKLQlkYmdfZHVtcF9scHRfbGVicyhjKTsKKwl1Ymlm
c19lcnIoIkxQVCBvdXQgb2Ygc3BhY2UgYXQgTEVCICVkOiVkIG5lZWRpbmcgJWQsIGRvbmVfbHRh
YiAlZCwgIgorCQkgICJkb25lX2xzYXZlICVkIiwgbG51bSwgb2ZmcywgbGVuLCBkb25lX2x0YWIs
IGRvbmVfbHNhdmUpOworCXViaWZzX2R1bXBfbHB0X2luZm8oYyk7CisJdWJpZnNfZHVtcF9scHRf
bGVicyhjKTsKIAlkdW1wX3N0YWNrKCk7CiAJcmV0dXJuIGVycjsKIH0KQEAgLTQyMCw3ICs0MTYs
NyBAQAogCQkJCWFsZW4gPSBBTElHTih3bGVuLCBjLT5taW5faW9fc2l6ZSk7CiAJCQkJbWVtc2V0
KGJ1ZiArIG9mZnMsIDB4ZmYsIGFsZW4gLSB3bGVuKTsKIAkJCQllcnIgPSB1Ymlmc19sZWJfd3Jp
dGUoYywgbG51bSwgYnVmICsgZnJvbSwgZnJvbSwKLQkJCQkJCSAgICAgICBhbGVuLCBVQklfU0hP
UlRURVJNKTsKKwkJCQkJCSAgICAgICBhbGVuKTsKIAkJCQlpZiAoZXJyKQogCQkJCQlyZXR1cm4g
ZXJyOwogCQkJfQpAQCAtNDY1LDcgKzQ2MSw3IEBACiAJCSAqLwogCQljbGVhcl9iaXQoRElSVFlf
Q05PREUsICZjbm9kZS0+ZmxhZ3MpOwogCQlzbXBfbWJfX2JlZm9yZV9jbGVhcl9iaXQoKTsKLQkJ
Y2xlYXJfYml0KENPV19aTk9ERSwgJmNub2RlLT5mbGFncyk7CisJCWNsZWFyX2JpdChDT1dfQ05P
REUsICZjbm9kZS0+ZmxhZ3MpOwogCQlzbXBfbWJfX2FmdGVyX2NsZWFyX2JpdCgpOwogCQlvZmZz
ICs9IGxlbjsKIAkJZGJnX2Noa19scHRfc3ooYywgMSwgbGVuKTsKQEAgLTQ3OCw4ICs0NzQsNyBA
QAogCQkJd2xlbiA9IG9mZnMgLSBmcm9tOwogCQkJYWxlbiA9IEFMSUdOKHdsZW4sIGMtPm1pbl9p
b19zaXplKTsKIAkJCW1lbXNldChidWYgKyBvZmZzLCAweGZmLCBhbGVuIC0gd2xlbik7Ci0JCQll
cnIgPSB1Ymlmc19sZWJfd3JpdGUoYywgbG51bSwgYnVmICsgZnJvbSwgZnJvbSwgYWxlbiwKLQkJ
CQkJICAgICAgVUJJX1NIT1JUVEVSTSk7CisJCQllcnIgPSB1Ymlmc19sZWJfd3JpdGUoYywgbG51
bSwgYnVmICsgZnJvbSwgZnJvbSwgYWxlbik7CiAJCQlpZiAoZXJyKQogCQkJCXJldHVybiBlcnI7
CiAJCQlkYmdfY2hrX2xwdF9zeihjLCAyLCBjLT5sZWJfc2l6ZSAtIG9mZnMpOwpAQCAtNTA1LDgg
KzUwMCw3IEBACiAJCQl3bGVuID0gb2ZmcyAtIGZyb207CiAJCQlhbGVuID0gQUxJR04od2xlbiwg
Yy0+bWluX2lvX3NpemUpOwogCQkJbWVtc2V0KGJ1ZiArIG9mZnMsIDB4ZmYsIGFsZW4gLSB3bGVu
KTsKLQkJCWVyciA9IHViaWZzX2xlYl93cml0ZShjLCBsbnVtLCBidWYgKyBmcm9tLCBmcm9tLCBh
bGVuLAotCQkJCQkgICAgICBVQklfU0hPUlRURVJNKTsKKwkJCWVyciA9IHViaWZzX2xlYl93cml0
ZShjLCBsbnVtLCBidWYgKyBmcm9tLCBmcm9tLCBhbGVuKTsKIAkJCWlmIChlcnIpCiAJCQkJcmV0
dXJuIGVycjsKIAkJCWRiZ19jaGtfbHB0X3N6KGMsIDIsIGMtPmxlYl9zaXplIC0gb2Zmcyk7CkBA
IC01MzAsNyArNTI0LDcgQEAKIAl3bGVuID0gb2ZmcyAtIGZyb207CiAJYWxlbiA9IEFMSUdOKHds
ZW4sIGMtPm1pbl9pb19zaXplKTsKIAltZW1zZXQoYnVmICsgb2ZmcywgMHhmZiwgYWxlbiAtIHds
ZW4pOwotCWVyciA9IHViaWZzX2xlYl93cml0ZShjLCBsbnVtLCBidWYgKyBmcm9tLCBmcm9tLCBh
bGVuLCBVQklfU0hPUlRURVJNKTsKKwllcnIgPSB1Ymlmc19sZWJfd3JpdGUoYywgbG51bSwgYnVm
ICsgZnJvbSwgZnJvbSwgYWxlbik7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKIApAQCAtNTUx
LDExICs1NDUsMTAgQEAKIAlyZXR1cm4gMDsKIAogbm9fc3BhY2U6Ci0JdWJpZnNfZXJyKCJMUFQg
b3V0IG9mIHNwYWNlIG1pc21hdGNoIik7Ci0JZGJnX2VycigiTFBUIG91dCBvZiBzcGFjZSBtaXNt
YXRjaCBhdCBMRUIgJWQ6JWQgbmVlZGluZyAlZCwgZG9uZV9sdGFiICIKLQkJIiVkLCBkb25lX2xz
YXZlICVkIiwgbG51bSwgb2ZmcywgbGVuLCBkb25lX2x0YWIsIGRvbmVfbHNhdmUpOwotCWRiZ19k
dW1wX2xwdF9pbmZvKGMpOwotCWRiZ19kdW1wX2xwdF9sZWJzKGMpOworCXViaWZzX2VycigiTFBU
IG91dCBvZiBzcGFjZSBtaXNtYXRjaCBhdCBMRUIgJWQ6JWQgbmVlZGluZyAlZCwgZG9uZV9sdGFi
ICIKKwkJICAiJWQsIGRvbmVfbHNhdmUgJWQiLCBsbnVtLCBvZmZzLCBsZW4sIGRvbmVfbHRhYiwg
ZG9uZV9sc2F2ZSk7CisJdWJpZnNfZHVtcF9scHRfaW5mbyhjKTsKKwl1Ymlmc19kdW1wX2xwdF9s
ZWJzKGMpOwogCWR1bXBfc3RhY2soKTsKIAlyZXR1cm4gZXJyOwogfQpAQCAtMTE2MCwxMSArMTE1
MywxMSBAQAogCXZvaWQgKmJ1ZiA9IGMtPmxwdF9idWY7CiAKIAlkYmdfbHAoIkxFQiAlZCIsIGxu
dW0pOwotCWVyciA9IHViaV9yZWFkKGMtPnViaSwgbG51bSwgYnVmLCAwLCBjLT5sZWJfc2l6ZSk7
Ci0JaWYgKGVycikgewotCQl1Ymlmc19lcnIoImNhbm5vdCByZWFkIExFQiAlZCwgZXJyb3IgJWQi
LCBsbnVtLCBlcnIpOworCisJZXJyID0gdWJpZnNfbGViX3JlYWQoYywgbG51bSwgYnVmLCAwLCBj
LT5sZWJfc2l6ZSwgMSk7CisJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKLQl9CisKIAl3aGlsZSAo
MSkgewogCQlpZiAoIWlzX2Ffbm9kZShjLCBidWYsIGxlbikpIHsKIAkJCWludCBwYWRfbGVuOwpA
QCAtMTQ5Niw3ICsxNDg5LDkgQEAKIAlrZnJlZShjLT5scHRfbm9kX2J1Zik7CiB9CiAKLSNpZmRl
ZiBDT05GSUdfVUJJRlNfRlNfREVCVUcKKy8qCisgKiBFdmVyeXRoaW5nIGJlbG93IGlzIHJlbGF0
ZWQgdG8gZGVidWdnaW5nLgorICovCiAKIC8qKgogICogZGJnX2lzX2FsbF9mZiAtIGRldGVybWlu
ZSBpZiBhIGJ1ZmZlciBjb250YWlucyBvbmx5IDB4RkYgYnl0ZXMuCkBAIC0xNjQwLDcgKzE2MzUs
NyBAQAogCWludCByZXQ7CiAJdm9pZCAqYnVmLCAqcDsKIAotCWlmICghKHViaWZzX2Noa19mbGFn
cyAmIFVCSUZTX0NIS19MUFJPUFMpKQorCWlmICghZGJnX2lzX2Noa19scHJvcHMoYykpCiAJCXJl
dHVybiAwOwogCiAJYnVmID0gcCA9IF9fdm1hbGxvYyhjLT5sZWJfc2l6ZSwgR0ZQX05PRlMsIFBB
R0VfS0VSTkVMKTsKQEAgLTE2NTAsMTEgKzE2NDUsMTEgQEAKIAl9CiAKIAlkYmdfbHAoIkxFQiAl
ZCIsIGxudW0pOwotCWVyciA9IHViaV9yZWFkKGMtPnViaSwgbG51bSwgYnVmLCAwLCBjLT5sZWJf
c2l6ZSk7Ci0JaWYgKGVycikgewotCQlkYmdfbXNnKCJ1YmlfcmVhZCBmYWlsZWQsIExFQiAlZCwg
ZXJyb3IgJWQiLCBsbnVtLCBlcnIpOworCisJZXJyID0gdWJpZnNfbGViX3JlYWQoYywgbG51bSwg
YnVmLCAwLCBjLT5sZWJfc2l6ZSwgMSk7CisJaWYgKGVycikKIAkJZ290byBvdXQ7Ci0JfQorCiAJ
d2hpbGUgKDEpIHsKIAkJaWYgKCFpc19hX25vZGUoYywgcCwgbGVuKSkgewogCQkJaW50IGksIHBh
ZF9sZW47CkBAIC0xNzExLDcgKzE3MDYsNyBAQAogewogCWludCBsbnVtLCBlcnIsIGksIGNudDsK
IAotCWlmICghKHViaWZzX2Noa19mbGFncyAmIFVCSUZTX0NIS19MUFJPUFMpKQorCWlmICghZGJn
X2lzX2Noa19scHJvcHMoYykpCiAJCXJldHVybiAwOwogCiAJLyogQnJpbmcgdGhlIGVudGlyZSB0
cmVlIGludG8gbWVtb3J5ICovCkBAIC0xNzM0LDcgKzE3MjksNyBAQAogCWZvciAobG51bSA9IGMt
PmxwdF9maXJzdDsgbG51bSA8PSBjLT5scHRfbGFzdDsgbG51bSsrKSB7CiAJCWVyciA9IGRiZ19j
aGVja19sdGFiX2xudW0oYywgbG51bSk7CiAJCWlmIChlcnIpIHsKLQkJCWRiZ19lcnIoImZhaWxl
ZCBhdCBMRUIgJWQiLCBsbnVtKTsKKwkJCXViaWZzX2VycigiZmFpbGVkIGF0IExFQiAlZCIsIGxu
dW0pOwogCQkJcmV0dXJuIGVycjsKIAkJfQogCX0KQEAgLTE3NTQsNyArMTc0OSw3IEBACiAJbG9u
ZyBsb25nIGZyZWUgPSAwOwogCWludCBpOwogCi0JaWYgKCEodWJpZnNfY2hrX2ZsYWdzICYgVUJJ
RlNfQ0hLX0xQUk9QUykpCisJaWYgKCFkYmdfaXNfY2hrX2xwcm9wcyhjKSkKIAkJcmV0dXJuIDA7
CiAKIAlmb3IgKGkgPSAwOyBpIDwgYy0+bHB0X2xlYnM7IGkrKykgewpAQCAtMTc2NiwxMCArMTc2
MSwxMCBAQAogCQkJZnJlZSArPSBjLT5sZWJfc2l6ZTsKIAl9CiAJaWYgKGZyZWUgPCBjLT5scHRf
c3opIHsKLQkJZGJnX2VycigiTFBUIHNwYWNlIGVycm9yOiBmcmVlICVsbGQgbHB0X3N6ICVsbGQi
LAotCQkJZnJlZSwgYy0+bHB0X3N6KTsKLQkJZGJnX2R1bXBfbHB0X2luZm8oYyk7Ci0JCWRiZ19k
dW1wX2xwdF9sZWJzKGMpOworCQl1Ymlmc19lcnIoIkxQVCBzcGFjZSBlcnJvcjogZnJlZSAlbGxk
IGxwdF9zeiAlbGxkIiwKKwkJCSAgZnJlZSwgYy0+bHB0X3N6KTsKKwkJdWJpZnNfZHVtcF9scHRf
aW5mbyhjKTsKKwkJdWJpZnNfZHVtcF9scHRfbGVicyhjKTsKIAkJZHVtcF9zdGFjaygpOwogCQly
ZXR1cm4gLUVJTlZBTDsKIAl9CkBAIC0xNzk2LDcgKzE3OTEsNyBAQAogCWxvbmcgbG9uZyBjaGtf
bHB0X3N6LCBscHRfc3o7CiAJaW50IGVyciA9IDA7CiAKLQlpZiAoISh1Ymlmc19jaGtfZmxhZ3Mg
JiBVQklGU19DSEtfTFBST1BTKSkKKwlpZiAoIWRiZ19pc19jaGtfbHByb3BzKGMpKQogCQlyZXR1
cm4gMDsKIAogCXN3aXRjaCAoYWN0aW9uKSB7CkBAIC0xODA2LDEzICsxODAxLDEzIEBACiAJCWQt
PmNoa19scHRfbGVicyA9IDA7CiAJCWQtPmNoa19scHRfd2FzdGFnZSA9IDA7CiAJCWlmIChjLT5k
aXJ0eV9wbl9jbnQgPiBjLT5wbm9kZV9jbnQpIHsKLQkJCWRiZ19lcnIoImRpcnR5IHBub2RlcyAl
ZCBleGNlZWQgbWF4ICVkIiwKLQkJCQljLT5kaXJ0eV9wbl9jbnQsIGMtPnBub2RlX2NudCk7CisJ
CQl1Ymlmc19lcnIoImRpcnR5IHBub2RlcyAlZCBleGNlZWQgbWF4ICVkIiwKKwkJCQkgIGMtPmRp
cnR5X3BuX2NudCwgYy0+cG5vZGVfY250KTsKIAkJCWVyciA9IC1FSU5WQUw7CiAJCX0KIAkJaWYg
KGMtPmRpcnR5X25uX2NudCA+IGMtPm5ub2RlX2NudCkgewotCQkJZGJnX2VycigiZGlydHkgbm5v
ZGVzICVkIGV4Y2VlZCBtYXggJWQiLAotCQkJCWMtPmRpcnR5X25uX2NudCwgYy0+bm5vZGVfY250
KTsKKwkJCXViaWZzX2VycigiZGlydHkgbm5vZGVzICVkIGV4Y2VlZCBtYXggJWQiLAorCQkJCSAg
Yy0+ZGlydHlfbm5fY250LCBjLT5ubm9kZV9jbnQpOwogCQkJZXJyID0gLUVJTlZBTDsKIAkJfQog
CQlyZXR1cm4gZXJyOwpAQCAtMTgyOSwyMyArMTgyNCwyMyBAQAogCQljaGtfbHB0X3N6ICo9IGQt
PmNoa19scHRfbGViczsKIAkJY2hrX2xwdF9zeiArPSBsZW4gLSBjLT5uaGVhZF9vZmZzOwogCQlp
ZiAoZC0+Y2hrX2xwdF9zeiAhPSBjaGtfbHB0X3N6KSB7Ci0JCQlkYmdfZXJyKCJMUFQgd3JvdGUg
JWxsZCBidXQgc3BhY2UgdXNlZCB3YXMgJWxsZCIsCi0JCQkJZC0+Y2hrX2xwdF9zeiwgY2hrX2xw
dF9zeik7CisJCQl1Ymlmc19lcnIoIkxQVCB3cm90ZSAlbGxkIGJ1dCBzcGFjZSB1c2VkIHdhcyAl
bGxkIiwKKwkJCQkgIGQtPmNoa19scHRfc3osIGNoa19scHRfc3opOwogCQkJZXJyID0gLUVJTlZB
TDsKIAkJfQogCQlpZiAoZC0+Y2hrX2xwdF9zeiA+IGMtPmxwdF9zeikgewotCQkJZGJnX2Vycigi
TFBUIHdyb3RlICVsbGQgYnV0IGxwdF9zeiBpcyAlbGxkIiwKLQkJCQlkLT5jaGtfbHB0X3N6LCBj
LT5scHRfc3opOworCQkJdWJpZnNfZXJyKCJMUFQgd3JvdGUgJWxsZCBidXQgbHB0X3N6IGlzICVs
bGQiLAorCQkJCSAgZC0+Y2hrX2xwdF9zeiwgYy0+bHB0X3N6KTsKIAkJCWVyciA9IC1FSU5WQUw7
CiAJCX0KIAkJaWYgKGQtPmNoa19scHRfc3oyICYmIGQtPmNoa19scHRfc3ogIT0gZC0+Y2hrX2xw
dF9zejIpIHsKLQkJCWRiZ19lcnIoIkxQVCBsYXlvdXQgc2l6ZSAlbGxkIGJ1dCB3cm90ZSAlbGxk
IiwKLQkJCQlkLT5jaGtfbHB0X3N6LCBkLT5jaGtfbHB0X3N6Mik7CisJCQl1Ymlmc19lcnIoIkxQ
VCBsYXlvdXQgc2l6ZSAlbGxkIGJ1dCB3cm90ZSAlbGxkIiwKKwkJCQkgIGQtPmNoa19scHRfc3os
IGQtPmNoa19scHRfc3oyKTsKIAkJCWVyciA9IC1FSU5WQUw7CiAJCX0KIAkJaWYgKGQtPmNoa19s
cHRfc3oyICYmIGQtPm5ld19uaGVhZF9vZmZzICE9IGxlbikgewotCQkJZGJnX2VycigiTFBUIG5l
dyBuaGVhZCBvZmZzOiBleHBlY3RlZCAlZCB3YXMgJWQiLAotCQkJCWQtPm5ld19uaGVhZF9vZmZz
LCBsZW4pOworCQkJdWJpZnNfZXJyKCJMUFQgbmV3IG5oZWFkIG9mZnM6IGV4cGVjdGVkICVkIHdh
cyAlZCIsCisJCQkJICBkLT5uZXdfbmhlYWRfb2ZmcywgbGVuKTsKIAkJCWVyciA9IC1FSU5WQUw7
CiAJCX0KIAkJbHB0X3N6ID0gKGxvbmcgbG9uZyljLT5wbm9kZV9jbnQgKiBjLT5wbm9kZV9zejsK
QEAgLTE4NTQsMTMgKzE4NDksMTMgQEAKIAkJaWYgKGMtPmJpZ19scHQpCiAJCQlscHRfc3ogKz0g
Yy0+bHNhdmVfc3o7CiAJCWlmIChkLT5jaGtfbHB0X3N6IC0gZC0+Y2hrX2xwdF93YXN0YWdlID4g
bHB0X3N6KSB7Ci0JCQlkYmdfZXJyKCJMUFQgY2hrX2xwdF9zeiAlbGxkICsgd2FzdGUgJWxsZCBl
eGNlZWRzICVsbGQiLAotCQkJCWQtPmNoa19scHRfc3osIGQtPmNoa19scHRfd2FzdGFnZSwgbHB0
X3N6KTsKKwkJCXViaWZzX2VycigiTFBUIGNoa19scHRfc3ogJWxsZCArIHdhc3RlICVsbGQgZXhj
ZWVkcyAlbGxkIiwKKwkJCQkgIGQtPmNoa19scHRfc3osIGQtPmNoa19scHRfd2FzdGFnZSwgbHB0
X3N6KTsKIAkJCWVyciA9IC1FSU5WQUw7CiAJCX0KIAkJaWYgKGVycikgewotCQkJZGJnX2R1bXBf
bHB0X2luZm8oYyk7Ci0JCQlkYmdfZHVtcF9scHRfbGVicyhjKTsKKwkJCXViaWZzX2R1bXBfbHB0
X2luZm8oYyk7CisJCQl1Ymlmc19kdW1wX2xwdF9sZWJzKGMpOwogCQkJZHVtcF9zdGFjaygpOwog
CQl9CiAJCWQtPmNoa19scHRfc3oyID0gZC0+Y2hrX2xwdF9zejsKQEAgLTE4NzksNyArMTg3NCw3
IEBACiB9CiAKIC8qKgotICogZGJnX2R1bXBfbHB0X2xlYiAtIGR1bXAgYW4gTFBUIExFQi4KKyAq
IHViaWZzX2R1bXBfbHB0X2xlYiAtIGR1bXAgYW4gTFBUIExFQi4KICAqIEBjOiBVQklGUyBmaWxl
LXN5c3RlbSBkZXNjcmlwdGlvbiBvYmplY3QKICAqIEBsbnVtOiBMRUIgbnVtYmVyIHRvIGR1bXAK
ICAqCkBAIC0xOTAxLDExICsxODk2LDEwIEBACiAJCXJldHVybjsKIAl9CiAKLQllcnIgPSB1Ymlf
cmVhZChjLT51YmksIGxudW0sIGJ1ZiwgMCwgYy0+bGViX3NpemUpOwotCWlmIChlcnIpIHsKLQkJ
dWJpZnNfZXJyKCJjYW5ub3QgcmVhZCBMRUIgJWQsIGVycm9yICVkIiwgbG51bSwgZXJyKTsKKwll
cnIgPSB1Ymlmc19sZWJfcmVhZChjLCBsbnVtLCBidWYsIDAsIGMtPmxlYl9zaXplLCAxKTsKKwlp
ZiAoZXJyKQogCQlnb3RvIG91dDsKLQl9CisKIAl3aGlsZSAoMSkgewogCQlvZmZzID0gYy0+bGVi
X3NpemUgLSBsZW47CiAJCWlmICghaXNfYV9ub2RlKGMsIHAsIGxlbikpIHsKQEAgLTE5ODYsMTMg
KzE5ODAsMTMgQEAKIH0KIAogLyoqCi0gKiBkYmdfZHVtcF9scHRfbGVicyAtIGR1bXAgTFBUIGxl
YnMuCisgKiB1Ymlmc19kdW1wX2xwdF9sZWJzIC0gZHVtcCBMUFQgbGVicy4KICAqIEBjOiBVQklG
UyBmaWxlLXN5c3RlbSBkZXNjcmlwdGlvbiBvYmplY3QKICAqCiAgKiBUaGlzIGZ1bmN0aW9uIGR1
bXBzIGFsbCBMUFQgTEVCcy4gVGhlIGNhbGxlciBoYXMgdG8gbWFrZSBzdXJlIHRoZSBMUFQgaXMK
ICAqIGxvY2tlZC4KICAqLwotdm9pZCBkYmdfZHVtcF9scHRfbGVicyhjb25zdCBzdHJ1Y3QgdWJp
ZnNfaW5mbyAqYykKK3ZvaWQgdWJpZnNfZHVtcF9scHRfbGVicyhjb25zdCBzdHJ1Y3QgdWJpZnNf
aW5mbyAqYykKIHsKIAlpbnQgaTsKIApAQCAtMjAxOSw3ICsyMDEzLDcgQEAKIAlzdHJ1Y3QgdWJp
ZnNfbHB0X2hlYXAgKmhlYXA7CiAJaW50IGk7CiAKLQlpZiAoISh1Ymlmc19jaGtfZmxhZ3MgJiBV
QklGU19DSEtfR0VOKSkKKwlpZiAoIWRiZ19pc19jaGtfZ2VuKGMpKQogCQlyZXR1cm4gMDsKIAlp
ZiAocmFuZG9tMzIoKSAmIDMpCiAJCXJldHVybiAwOwpAQCAtMjA0Niw1ICsyMDQwLDMgQEAKIAog
CXJldHVybiAxOwogfQotCi0jZW5kaWYgLyogQ09ORklHX1VCSUZTX0ZTX0RFQlVHICovCmRpZmYg
LXVOIC11TnIgbGludXgtMy4wL2ZzL3ViaWZzL21hc3Rlci5jIGxpbnV4LTMuMC54LnViaWZzLmxh
dGVzdC9mcy91Ymlmcy9tYXN0ZXIuYwotLS0gbGludXgtMy4wL2ZzL3ViaWZzL21hc3Rlci5jCTIw
MTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51Ymlmcy5s
YXRlc3QvZnMvdWJpZnMvbWFzdGVyLmMJMjAxMi0wNi0yOCAxMToyNjoxNS4wMDAwMDAwMDAgLTA1
MDAKQEAgLTI0MSw3ICsyNDEsNyBAQAogCiBvdXQ6CiAJdWJpZnNfZXJyKCJiYWQgbWFzdGVyIG5v
ZGUgYXQgb2Zmc2V0ICVkIGVycm9yICVkIiwgYy0+bXN0X29mZnMsIGVycik7Ci0JZGJnX2R1bXBf
bm9kZShjLCBjLT5tc3Rfbm9kZSk7CisJdWJpZnNfZHVtcF9ub2RlKGMsIGMtPm1zdF9ub2RlKTsK
IAlyZXR1cm4gLUVJTlZBTDsKIH0KIApAQCAtMzE3LDcgKzMxNyw3IEBACiAJCWlmIChjLT5sZWJf
Y250IDwgb2xkX2xlYl9jbnQgfHwKIAkJICAgIGMtPmxlYl9jbnQgPCBVQklGU19NSU5fTEVCX0NO
VCkgewogCQkJdWJpZnNfZXJyKCJiYWQgbGViX2NudCBvbiBtYXN0ZXIgbm9kZSIpOwotCQkJZGJn
X2R1bXBfbm9kZShjLCBjLT5tc3Rfbm9kZSk7CisJCQl1Ymlmc19kdW1wX25vZGUoYywgYy0+bXN0
X25vZGUpOwogCQkJcmV0dXJuIC1FSU5WQUw7CiAJCX0KIApAQCAtMzc5LDcgKzM3OSw3IEBACiAJ
Yy0+bXN0X29mZnMgPSBvZmZzOwogCWMtPm1zdF9ub2RlLT5oaWdoZXN0X2ludW0gPSBjcHVfdG9f
bGU2NChjLT5oaWdoZXN0X2ludW0pOwogCi0JZXJyID0gdWJpZnNfd3JpdGVfbm9kZShjLCBjLT5t
c3Rfbm9kZSwgbGVuLCBsbnVtLCBvZmZzLCBVQklfU0hPUlRURVJNKTsKKwllcnIgPSB1Ymlmc193
cml0ZV9ub2RlKGMsIGMtPm1zdF9ub2RlLCBsZW4sIGxudW0sIG9mZnMpOwogCWlmIChlcnIpCiAJ
CXJldHVybiBlcnI7CiAKQEAgLTM5MCw3ICszOTAsNyBAQAogCQlpZiAoZXJyKQogCQkJcmV0dXJu
IGVycjsKIAl9Ci0JZXJyID0gdWJpZnNfd3JpdGVfbm9kZShjLCBjLT5tc3Rfbm9kZSwgbGVuLCBs
bnVtLCBvZmZzLCBVQklfU0hPUlRURVJNKTsKKwllcnIgPSB1Ymlmc193cml0ZV9ub2RlKGMsIGMt
Pm1zdF9ub2RlLCBsZW4sIGxudW0sIG9mZnMpOwogCiAJcmV0dXJuIGVycjsKIH0KZGlmZiAtdU4g
LXVOciBsaW51eC0zLjAvZnMvdWJpZnMvbWlzYy5oIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9m
cy91Ymlmcy9taXNjLmgKLS0tIGxpbnV4LTMuMC9mcy91Ymlmcy9taXNjLmgJMjAxMS0wNy0yMSAy
MToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9mcy91
Ymlmcy9taXNjLmgJMjAxMi0wNi0yOCAxMToyNjoxNS4wMDAwMDAwMDAgLTA1MDAKQEAgLTM5LDYg
KzM5LDI5IEBACiB9CiAKIC8qKgorICogdWJpZnNfem5fb2Jzb2xldGUgLSBjaGVjayBpZiB6bm9k
ZSBpcyBvYnNvbGV0ZS4KKyAqIEB6bm9kZTogem5vZGUgdG8gY2hlY2sKKyAqCisgKiBUaGlzIGhl
bHBlciBmdW5jdGlvbiByZXR1cm5zICUxIGlmIEB6bm9kZSBpcyBvYnNvbGV0ZSBhbmQgJTAgb3Ro
ZXJ3aXNlLgorICovCitzdGF0aWMgaW5saW5lIGludCB1Ymlmc196bl9vYnNvbGV0ZShjb25zdCBz
dHJ1Y3QgdWJpZnNfem5vZGUgKnpub2RlKQoreworCXJldHVybiAhIXRlc3RfYml0KE9CU09MRVRF
X1pOT0RFLCAmem5vZGUtPmZsYWdzKTsKK30KKworLyoqCisgKiB1Ymlmc196bl9jb3cgLSBjaGVj
ayBpZiB6bm9kZSBoYXMgdG8gYmUgY29waWVkIG9uIHdyaXRlLgorICogQHpub2RlOiB6bm9kZSB0
byBjaGVjaworICoKKyAqIFRoaXMgaGVscGVyIGZ1bmN0aW9uIHJldHVybnMgJTEgaWYgQHpub2Rl
IGlzIGhhcyBDT1cgZmxhZyBzZXQgYW5kICUwCisgKiBvdGhlcndpc2UuCisgKi8KK3N0YXRpYyBp
bmxpbmUgaW50IHViaWZzX3puX2Nvdyhjb25zdCBzdHJ1Y3QgdWJpZnNfem5vZGUgKnpub2RlKQor
eworCXJldHVybiAhIXRlc3RfYml0KENPV19aTk9ERSwgJnpub2RlLT5mbGFncyk7Cit9CisKKy8q
KgogICogdWJpZnNfd2FrZV91cF9iZ3QgLSB3YWtlIHVwIGJhY2tncm91bmQgdGhyZWFkLgogICog
QGM6IFVCSUZTIGZpbGUtc3lzdGVtIGRlc2NyaXB0aW9uIG9iamVjdAogICovCkBAIC0xMjIsODYg
KzE0NSw2IEBACiB9CiAKIC8qKgotICogdWJpZnNfbGViX3VubWFwIC0gdW5tYXAgYW4gTEVCLgot
ICogQGM6IFVCSUZTIGZpbGUtc3lzdGVtIGRlc2NyaXB0aW9uIG9iamVjdAotICogQGxudW06IExF
QiBudW1iZXIgdG8gdW5tYXAKLSAqCi0gKiBUaGlzIGZ1bmN0aW9uIHJldHVybnMgJTAgb24gc3Vj
Y2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCi0gKi8KLXN0YXRpYyBp
bmxpbmUgaW50IHViaWZzX2xlYl91bm1hcChjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgaW50
IGxudW0pCi17Ci0JaW50IGVycjsKLQotCXViaWZzX2Fzc2VydCghYy0+cm9fbWVkaWEgJiYgIWMt
PnJvX21vdW50KTsKLQlpZiAoYy0+cm9fZXJyb3IpCi0JCXJldHVybiAtRVJPRlM7Ci0JZXJyID0g
dWJpX2xlYl91bm1hcChjLT51YmksIGxudW0pOwotCWlmIChlcnIpIHsKLQkJdWJpZnNfZXJyKCJ1
bm1hcCBMRUIgJWQgZmFpbGVkLCBlcnJvciAlZCIsIGxudW0sIGVycik7Ci0JCXJldHVybiBlcnI7
Ci0JfQotCi0JcmV0dXJuIDA7Ci19Ci0KLS8qKgotICogdWJpZnNfbGViX3dyaXRlIC0gd3JpdGUg
dG8gYSBMRUIuCi0gKiBAYzogVUJJRlMgZmlsZS1zeXN0ZW0gZGVzY3JpcHRpb24gb2JqZWN0Ci0g
KiBAbG51bTogTEVCIG51bWJlciB0byB3cml0ZQotICogQGJ1ZjogYnVmZmVyIHRvIHdyaXRlIGZy
b20KLSAqIEBvZmZzOiBvZmZzZXQgd2l0aGluIExFQiB0byB3cml0ZSB0bwotICogQGxlbjogbGVu
Z3RoIHRvIHdyaXRlCi0gKiBAZHR5cGU6IGRhdGEgdHlwZQotICoKLSAqIFRoaXMgZnVuY3Rpb24g
cmV0dXJucyAlMCBvbiBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVy
ZS4KLSAqLwotc3RhdGljIGlubGluZSBpbnQgdWJpZnNfbGViX3dyaXRlKGNvbnN0IHN0cnVjdCB1
Ymlmc19pbmZvICpjLCBpbnQgbG51bSwKLQkJCQkgIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IG9mZnMs
IGludCBsZW4sIGludCBkdHlwZSkKLXsKLQlpbnQgZXJyOwotCi0JdWJpZnNfYXNzZXJ0KCFjLT5y
b19tZWRpYSAmJiAhYy0+cm9fbW91bnQpOwotCWlmIChjLT5yb19lcnJvcikKLQkJcmV0dXJuIC1F
Uk9GUzsKLQllcnIgPSB1YmlfbGViX3dyaXRlKGMtPnViaSwgbG51bSwgYnVmLCBvZmZzLCBsZW4s
IGR0eXBlKTsKLQlpZiAoZXJyKSB7Ci0JCXViaWZzX2Vycigid3JpdGluZyAlZCBieXRlcyBhdCAl
ZDolZCwgZXJyb3IgJWQiLAotCQkJICBsZW4sIGxudW0sIG9mZnMsIGVycik7Ci0JCXJldHVybiBl
cnI7Ci0JfQotCi0JcmV0dXJuIDA7Ci19Ci0KLS8qKgotICogdWJpZnNfbGViX2NoYW5nZSAtIGF0
b21pYyBMRUIgY2hhbmdlLgotICogQGM6IFVCSUZTIGZpbGUtc3lzdGVtIGRlc2NyaXB0aW9uIG9i
amVjdAotICogQGxudW06IExFQiBudW1iZXIgdG8gd3JpdGUKLSAqIEBidWY6IGJ1ZmZlciB0byB3
cml0ZSBmcm9tCi0gKiBAbGVuOiBsZW5ndGggdG8gd3JpdGUKLSAqIEBkdHlwZTogZGF0YSB0eXBl
Ci0gKgotICogVGhpcyBmdW5jdGlvbiByZXR1cm5zICUwIG9uIHN1Y2Nlc3MgYW5kIGEgbmVnYXRp
dmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgotICovCi1zdGF0aWMgaW5saW5lIGludCB1Ymlmc19s
ZWJfY2hhbmdlKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSwKLQkJCQkgICBj
b25zdCB2b2lkICpidWYsIGludCBsZW4sIGludCBkdHlwZSkKLXsKLQlpbnQgZXJyOwotCi0JdWJp
ZnNfYXNzZXJ0KCFjLT5yb19tZWRpYSAmJiAhYy0+cm9fbW91bnQpOwotCWlmIChjLT5yb19lcnJv
cikKLQkJcmV0dXJuIC1FUk9GUzsKLQllcnIgPSB1YmlfbGViX2NoYW5nZShjLT51YmksIGxudW0s
IGJ1ZiwgbGVuLCBkdHlwZSk7Ci0JaWYgKGVycikgewotCQl1Ymlmc19lcnIoImNoYW5naW5nICVk
IGJ5dGVzIGluIExFQiAlZCwgZXJyb3IgJWQiLAotCQkJICBsZW4sIGxudW0sIGVycik7Ci0JCXJl
dHVybiBlcnI7Ci0JfQotCi0JcmV0dXJuIDA7Ci19Ci0KLS8qKgogICogdWJpZnNfZW5jb2RlX2Rl
diAtIGVuY29kZSBkZXZpY2Ugbm9kZSBJRHMuCiAgKiBAZGV2OiBVQklGUyBkZXZpY2Ugbm9kZSBp
bmZvcm1hdGlvbgogICogQHJkZXY6IGRldmljZSBJRHMgdG8gZW5jb2RlCmRpZmYgLXVOIC11TnIg
bGludXgtMy4wL2ZzL3ViaWZzL29ycGhhbi5jIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9mcy91
Ymlmcy9vcnBoYW4uYwotLS0gbGludXgtMy4wL2ZzL3ViaWZzL29ycGhhbi5jCTIwMTEtMDctMjEg
MjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZnMv
dWJpZnMvb3JwaGFuLmMJMjAxMi0wNi0yOCAxMToyNjoxNS4wMDAwMDAwMDAgLTA1MDAKQEAgLTUy
LDExICs1Miw3IEBACiAgKiB0aGFuIHRoZSBtYXhpbXVtIG51bWJlciBvZiBvcnBoYW5zIGFsbG93
ZWQuCiAgKi8KIAotI2lmZGVmIENPTkZJR19VQklGU19GU19ERUJVRwogc3RhdGljIGludCBkYmdf
Y2hlY2tfb3JwaGFucyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYyk7Ci0jZWxzZQotI2RlZmluZSBkYmdf
Y2hlY2tfb3JwaGFucyhjKSAwCi0jZW5kaWYKIAogLyoqCiAgKiB1Ymlmc19hZGRfb3JwaGFuIC0g
YWRkIGFuIG9ycGhhbi4KQEAgLTkyLDcgKzg4LDcgQEAKIAkJZWxzZSBpZiAoaW51bSA+IG8tPmlu
dW0pCiAJCQlwID0gJigqcCktPnJiX3JpZ2h0OwogCQllbHNlIHsKLQkJCWRiZ19lcnIoIm9ycGhh
bmVkIHR3aWNlIik7CisJCQl1Ymlmc19lcnIoIm9ycGhhbmVkIHR3aWNlIik7CiAJCQlzcGluX3Vu
bG9jaygmYy0+b3JwaGFuX2xvY2spOwogCQkJa2ZyZWUob3JwaGFuKTsKIAkJCXJldHVybiAwOwpA
QCAtMTU4LDggKzE1NCw4IEBACiAJCX0KIAl9CiAJc3Bpbl91bmxvY2soJmMtPm9ycGhhbl9sb2Nr
KTsKLQlkYmdfZXJyKCJtaXNzaW5nIG9ycGhhbiBpbm8gJWx1IiwgKHVuc2lnbmVkIGxvbmcpaW51
bSk7Ci0JZGJnX2R1bXBfc3RhY2soKTsKKwl1Ymlmc19lcnIoIm1pc3Npbmcgb3JwaGFuIGlubyAl
bHUiLCAodW5zaWduZWQgbG9uZylpbnVtKTsKKwlkdW1wX3N0YWNrKCk7CiB9CiAKIC8qKgpAQCAt
MjQ4LDggKzI0NCw3IEBACiAJCXViaWZzX2Fzc2VydChjLT5vaGVhZF9vZmZzID09IDApOwogCQl1
Ymlmc19wcmVwYXJlX25vZGUoYywgYy0+b3JwaF9idWYsIGxlbiwgMSk7CiAJCWxlbiA9IEFMSUdO
KGxlbiwgYy0+bWluX2lvX3NpemUpOwotCQllcnIgPSB1Ymlmc19sZWJfY2hhbmdlKGMsIGMtPm9o
ZWFkX2xudW0sIGMtPm9ycGhfYnVmLCBsZW4sCi0JCQkJICAgICAgIFVCSV9TSE9SVFRFUk0pOwor
CQllcnIgPSB1Ymlmc19sZWJfY2hhbmdlKGMsIGMtPm9oZWFkX2xudW0sIGMtPm9ycGhfYnVmLCBs
ZW4pOwogCX0gZWxzZSB7CiAJCWlmIChjLT5vaGVhZF9vZmZzID09IDApIHsKIAkJCS8qIEVuc3Vy
ZSBMRUIgaGFzIGJlZW4gdW5tYXBwZWQgKi8KQEAgLTI1OCw3ICsyNTMsNyBAQAogCQkJCXJldHVy
biBlcnI7CiAJCX0KIAkJZXJyID0gdWJpZnNfd3JpdGVfbm9kZShjLCBjLT5vcnBoX2J1ZiwgbGVu
LCBjLT5vaGVhZF9sbnVtLAotCQkJCSAgICAgICBjLT5vaGVhZF9vZmZzLCBVQklfU0hPUlRURVJN
KTsKKwkJCQkgICAgICAgYy0+b2hlYWRfb2Zmcyk7CiAJfQogCXJldHVybiBlcnI7CiB9CkBAIC01
NjksNyArNTY0LDcgQEAKIAkJaWYgKHNub2QtPnR5cGUgIT0gVUJJRlNfT1JQSF9OT0RFKSB7CiAJ
CQl1Ymlmc19lcnIoImludmFsaWQgbm9kZSB0eXBlICVkIGluIG9ycGhhbiBhcmVhIGF0ICIKIAkJ
CQkgICIlZDolZCIsIHNub2QtPnR5cGUsIHNsZWItPmxudW0sIHNub2QtPm9mZnMpOwotCQkJZGJn
X2R1bXBfbm9kZShjLCBzbm9kLT5ub2RlKTsKKwkJCXViaWZzX2R1bXBfbm9kZShjLCBzbm9kLT5u
b2RlKTsKIAkJCXJldHVybiAtRUlOVkFMOwogCQl9CiAKQEAgLTU5Nyw3ICs1OTIsNyBAQAogCQkJ
CXViaWZzX2Vycigib3V0IG9mIG9yZGVyIGNvbW1pdCBudW1iZXIgJWxsdSBpbiAiCiAJCQkJCSAg
Im9ycGhhbiBub2RlIGF0ICVkOiVkIiwKIAkJCQkJICBjbXRfbm8sIHNsZWItPmxudW0sIHNub2Qt
Pm9mZnMpOwotCQkJCWRiZ19kdW1wX25vZGUoYywgc25vZC0+bm9kZSk7CisJCQkJdWJpZnNfZHVt
cF9ub2RlKGMsIHNub2QtPm5vZGUpOwogCQkJCXJldHVybiAtRUlOVkFMOwogCQkJfQogCQkJZGJn
X3JjdnJ5KCJvdXQgb2YgZGF0ZSBMRUIgJWQiLCBzbGViLT5sbnVtKTsKQEAgLTcyNSw3ICs3MjAs
OSBAQAogCXJldHVybiBlcnI7CiB9CiAKLSNpZmRlZiBDT05GSUdfVUJJRlNfRlNfREVCVUcKKy8q
CisgKiBFdmVyeXRoaW5nIGJlbG93IGlzIHJlbGF0ZWQgdG8gZGVidWdnaW5nLgorICovCiAKIHN0
cnVjdCBjaGVja19vcnBoYW4gewogCXN0cnVjdCByYl9ub2RlIHJiOwpAQCAtOTI5LDcgKzkyNiw3
IEBACiAJc3RydWN0IGNoZWNrX2luZm8gY2k7CiAJaW50IGVycjsKIAotCWlmICghKHViaWZzX2No
a19mbGFncyAmIFVCSUZTX0NIS19PUlBIKSkKKwlpZiAoIWRiZ19pc19jaGtfb3JwaChjKSkKIAkJ
cmV0dXJuIDA7CiAKIAljaS5sYXN0X2lubyA9IDA7CkBAIC05NjgsNSArOTY1LDMgQEAKIAlrZnJl
ZShjaS5ub2RlKTsKIAlyZXR1cm4gZXJyOwogfQotCi0jZW5kaWYgLyogQ09ORklHX1VCSUZTX0ZT
X0RFQlVHICovCmRpZmYgLXVOIC11TnIgbGludXgtMy4wL2ZzL3ViaWZzL3JlY292ZXJ5LmMgbGlu
dXgtMy4wLngudWJpZnMubGF0ZXN0L2ZzL3ViaWZzL3JlY292ZXJ5LmMKLS0tIGxpbnV4LTMuMC9m
cy91Ymlmcy9yZWNvdmVyeS5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisr
KyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZnMvdWJpZnMvcmVjb3ZlcnkuYwkyMDEyLTA2LTI4
IDExOjI2OjE1LjAwMDAwMDAwMCAtMDUwMApAQCAtMTE3LDcgKzExNyw3IEBACiAJaWYgKCFzYnVm
KQogCQlyZXR1cm4gLUVOT01FTTsKIAotCWVyciA9IHViaV9yZWFkKGMtPnViaSwgbG51bSwgc2J1
ZiwgMCwgYy0+bGViX3NpemUpOworCWVyciA9IHViaWZzX2xlYl9yZWFkKGMsIGxudW0sIHNidWYs
IDAsIGMtPmxlYl9zaXplLCAwKTsKIAlpZiAoZXJyICYmIGVyciAhPSAtRUJBRE1TRykKIAkJZ290
byBvdXRfZnJlZTsKIApAQCAtMjEzLDEwICsyMTMsMTAgQEAKIAltc3QtPmZsYWdzIHw9IGNwdV90
b19sZTMyKFVCSUZTX01TVF9SQ1ZSWSk7CiAKIAl1Ymlmc19wcmVwYXJlX25vZGUoYywgbXN0LCBV
QklGU19NU1RfTk9ERV9TWiwgMSk7Ci0JZXJyID0gdWJpX2xlYl9jaGFuZ2UoYy0+dWJpLCBsbnVt
LCBtc3QsIHN6LCBVQklfU0hPUlRURVJNKTsKKwllcnIgPSB1Ymlmc19sZWJfY2hhbmdlKGMsIGxu
dW0sIG1zdCwgc3opOwogCWlmIChlcnIpCiAJCWdvdG8gb3V0OwotCWVyciA9IHViaV9sZWJfY2hh
bmdlKGMtPnViaSwgbG51bSArIDEsIG1zdCwgc3osIFVCSV9TSE9SVFRFUk0pOworCWVyciA9IHVi
aWZzX2xlYl9jaGFuZ2UoYywgbG51bSArIDEsIG1zdCwgc3opOwogCWlmIChlcnIpCiAJCWdvdG8g
b3V0Owogb3V0OgpAQCAtMjc0LDcgKzI3NCw4IEBACiAJCQkJaWYgKGNvcjEpCiAJCQkJCWdvdG8g
b3V0X2VycjsKIAkJCQltc3QgPSBtc3QxOwotCQkJfSBlbHNlIGlmIChvZmZzMSA9PSAwICYmIG9m
ZnMyICsgc3ogPj0gYy0+bGViX3NpemUpIHsKKwkJCX0gZWxzZSBpZiAob2ZmczEgPT0gMCAmJgor
CQkJCSAgIGMtPmxlYl9zaXplIC0gb2ZmczIgLSBzeiA8IHN6KSB7CiAJCQkJLyogMXN0IExFQiB3
YXMgdW5tYXBwZWQgYW5kIHdyaXR0ZW4sIDJuZCBub3QgKi8KIAkJCQlpZiAoY29yMSkKIAkJCQkJ
Z290byBvdXRfZXJyOwpAQCAtMzYxLDEyICszNjIsMTIgQEAKIG91dF9mcmVlOgogCXViaWZzX2Vy
cigiZmFpbGVkIHRvIHJlY292ZXIgbWFzdGVyIG5vZGUiKTsKIAlpZiAobXN0MSkgewotCQlkYmdf
ZXJyKCJkdW1waW5nIGZpcnN0IG1hc3RlciBub2RlIik7Ci0JCWRiZ19kdW1wX25vZGUoYywgbXN0
MSk7CisJCXViaWZzX2VycigiZHVtcGluZyBmaXJzdCBtYXN0ZXIgbm9kZSIpOworCQl1Ymlmc19k
dW1wX25vZGUoYywgbXN0MSk7CiAJfQogCWlmIChtc3QyKSB7Ci0JCWRiZ19lcnIoImR1bXBpbmcg
c2Vjb25kIG1hc3RlciBub2RlIik7Ci0JCWRiZ19kdW1wX25vZGUoYywgbXN0Mik7CisJCXViaWZz
X2VycigiZHVtcGluZyBzZWNvbmQgbWFzdGVyIG5vZGUiKTsKKwkJdWJpZnNfZHVtcF9ub2RlKGMs
IG1zdDIpOwogCX0KIAl2ZnJlZShidWYyKTsKIAl2ZnJlZShidWYxKTsKQEAgLTUzOSw4ICs1NDAs
OCBAQAogCQkJaW50IGxlbiA9IEFMSUdOKGVuZHB0LCBjLT5taW5faW9fc2l6ZSk7CiAKIAkJCWlm
IChzdGFydCkgewotCQkJCWVyciA9IHViaV9yZWFkKGMtPnViaSwgbG51bSwgc2xlYi0+YnVmLCAw
LAotCQkJCQkgICAgICAgc3RhcnQpOworCQkJCWVyciA9IHViaWZzX2xlYl9yZWFkKGMsIGxudW0s
IHNsZWItPmJ1ZiwgMCwKKwkJCQkJCSAgICAgc3RhcnQsIDEpOwogCQkJCWlmIChlcnIpCiAJCQkJ
CXJldHVybiBlcnI7CiAJCQl9CkBAIC01NTQsOCArNTU1LDcgQEAKIAkJCQkJdWJpZnNfcGFkKGMs
IGJ1ZiwgcGFkX2xlbik7CiAJCQkJfQogCQkJfQotCQkJZXJyID0gdWJpX2xlYl9jaGFuZ2UoYy0+
dWJpLCBsbnVtLCBzbGViLT5idWYsIGxlbiwKLQkJCQkJICAgICBVQklfVU5LTk9XTik7CisJCQll
cnIgPSB1Ymlmc19sZWJfY2hhbmdlKGMsIGxudW0sIHNsZWItPmJ1ZiwgbGVuKTsKIAkJCWlmIChl
cnIpCiAJCQkJcmV0dXJuIGVycjsKIAkJfQpAQCAtNjc4LDEwICs2NzgsMTEgQEAKIAkJCSAgIHJl
dCA9PSBTQ0FOTkVEX0dBUkJBR0UgICAgIHx8CiAJCQkgICByZXQgPT0gU0NBTk5FRF9BX0JBRF9Q
QURfTk9ERSB8fAogCQkJICAgcmV0ID09IFNDQU5ORURfQV9DT1JSVVBUX05PREUpIHsKLQkJCWRi
Z19yY3ZyeSgiZm91bmQgY29ycnVwdGlvbiAtICVkIiwgcmV0KTsKKwkJCWRiZ19yY3ZyeSgiZm91
bmQgY29ycnVwdGlvbiAoJWQpIGF0ICVkOiVkIiwKKwkJCQkgIHJldCwgbG51bSwgb2Zmcyk7CiAJ
CQlicmVhazsKIAkJfSBlbHNlIHsKLQkJCWRiZ19lcnIoInVuZXhwZWN0ZWQgcmV0dXJuIHZhbHVl
ICVkIiwgcmV0KTsKKwkJCXViaWZzX2VycigidW5leHBlY3RlZCByZXR1cm4gdmFsdWUgJWQiLCBy
ZXQpOwogCQkJZXJyID0gLUVJTlZBTDsKIAkJCWdvdG8gZXJyb3I7CiAJCX0KQEAgLTc4Nyw3ICs3
ODgsNyBAQAogCiBjb3JydXB0ZWRfcmVzY2FuOgogCS8qIFJlLXNjYW4gdGhlIGNvcnJ1cHRlZCBk
YXRhIHdpdGggdmVyYm9zZSBtZXNzYWdlcyAqLwotCWRiZ19lcnIoImNvcnJ1cHRpbyAlZCIsIHJl
dCk7CisJdWJpZnNfZXJyKCJjb3JydXB0aW8gJWQiLCByZXQpOwogCXViaWZzX3NjYW5fYV9ub2Rl
KGMsIGJ1ZiwgbGVuLCBsbnVtLCBvZmZzLCAxKTsKIGNvcnJ1cHRlZDoKIAl1Ymlmc19zY2FubmVk
X2NvcnJ1cHRpb24oYywgbG51bSwgb2ZmcywgYnVmKTsKQEAgLTgxOSwyMiArODIwLDIzIEBACiAJ
CXJldHVybiAtRU5PTUVNOwogCWlmIChjLT5sZWJfc2l6ZSAtIG9mZnMgPCBVQklGU19DU19OT0RF
X1NaKQogCQlnb3RvIG91dF9lcnI7Ci0JZXJyID0gdWJpX3JlYWQoYy0+dWJpLCBsbnVtLCAodm9p
ZCAqKWNzX25vZGUsIG9mZnMsIFVCSUZTX0NTX05PREVfU1opOworCWVyciA9IHViaWZzX2xlYl9y
ZWFkKGMsIGxudW0sICh2b2lkICopY3Nfbm9kZSwgb2ZmcywKKwkJCSAgICAgVUJJRlNfQ1NfTk9E
RV9TWiwgMCk7CiAJaWYgKGVyciAmJiBlcnIgIT0gLUVCQURNU0cpCiAJCWdvdG8gb3V0X2ZyZWU7
CiAJcmV0ID0gdWJpZnNfc2Nhbl9hX25vZGUoYywgY3Nfbm9kZSwgVUJJRlNfQ1NfTk9ERV9TWiwg
bG51bSwgb2ZmcywgMCk7CiAJaWYgKHJldCAhPSBTQ0FOTkVEX0FfTk9ERSkgewotCQlkYmdfZXJy
KCJOb3QgYSB2YWxpZCBub2RlIik7CisJCXViaWZzX2VycigiTm90IGEgdmFsaWQgbm9kZSIpOwog
CQlnb3RvIG91dF9lcnI7CiAJfQogCWlmIChjc19ub2RlLT5jaC5ub2RlX3R5cGUgIT0gVUJJRlNf
Q1NfTk9ERSkgewotCQlkYmdfZXJyKCJOb2RlIGEgQ1Mgbm9kZSwgdHlwZSBpcyAlZCIsIGNzX25v
ZGUtPmNoLm5vZGVfdHlwZSk7CisJCXViaWZzX2VycigiTm9kZSBhIENTIG5vZGUsIHR5cGUgaXMg
JWQiLCBjc19ub2RlLT5jaC5ub2RlX3R5cGUpOwogCQlnb3RvIG91dF9lcnI7CiAJfQogCWlmIChs
ZTY0X3RvX2NwdShjc19ub2RlLT5jbXRfbm8pICE9IGMtPmNtdF9ubykgewotCQlkYmdfZXJyKCJD
UyBub2RlIGNtdF9ubyAlbGx1ICE9IGN1cnJlbnQgY210X25vICVsbHUiLAotCQkJKHVuc2lnbmVk
IGxvbmcgbG9uZylsZTY0X3RvX2NwdShjc19ub2RlLT5jbXRfbm8pLAotCQkJYy0+Y210X25vKTsK
KwkJdWJpZnNfZXJyKCJDUyBub2RlIGNtdF9ubyAlbGx1ICE9IGN1cnJlbnQgY210X25vICVsbHUi
LAorCQkJICAodW5zaWduZWQgbG9uZyBsb25nKWxlNjRfdG9fY3B1KGNzX25vZGUtPmNtdF9ubyks
CisJCQkgIGMtPmNtdF9ubyk7CiAJCWdvdG8gb3V0X2VycjsKIAl9CiAJKmNzX3NxbnVtID0gbGU2
NF90b19jcHUoY3Nfbm9kZS0+Y2guc3FudW0pOwpAQCAtOTE5LDggKzkyMSw3IEBACiAgKgogICog
VGhpcyBmdW5jdGlvbiByZXR1cm5zICUwIG9uIHN1Y2Nlc3MgYW5kIGEgbmVnYXRpdmUgZXJyb3Ig
Y29kZSBvbiBmYWlsdXJlLgogICovCi1zdGF0aWMgaW50IHJlY292ZXJfaGVhZChjb25zdCBzdHJ1
Y3QgdWJpZnNfaW5mbyAqYywgaW50IGxudW0sIGludCBvZmZzLAotCQkJdm9pZCAqc2J1ZikKK3N0
YXRpYyBpbnQgcmVjb3Zlcl9oZWFkKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSwgaW50
IG9mZnMsIHZvaWQgKnNidWYpCiB7CiAJaW50IGxlbiA9IGMtPm1heF93cml0ZV9zaXplLCBlcnI7
CiAKQEAgLTkzMSwxNSArOTMyLDE1IEBACiAJCXJldHVybiAwOwogCiAJLyogUmVhZCBhdCB0aGUg
aGVhZCBsb2NhdGlvbiBhbmQgY2hlY2sgaXQgaXMgZW1wdHkgZmxhc2ggKi8KLQllcnIgPSB1Ymlf
cmVhZChjLT51YmksIGxudW0sIHNidWYsIG9mZnMsIGxlbik7CisJZXJyID0gdWJpZnNfbGViX3Jl
YWQoYywgbG51bSwgc2J1Ziwgb2ZmcywgbGVuLCAxKTsKIAlpZiAoZXJyIHx8ICFpc19lbXB0eShz
YnVmLCBsZW4pKSB7CiAJCWRiZ19yY3ZyeSgiY2xlYW5pbmcgaGVhZCBhdCAlZDolZCIsIGxudW0s
IG9mZnMpOwogCQlpZiAob2ZmcyA9PSAwKQogCQkJcmV0dXJuIHViaWZzX2xlYl91bm1hcChjLCBs
bnVtKTsKLQkJZXJyID0gdWJpX3JlYWQoYy0+dWJpLCBsbnVtLCBzYnVmLCAwLCBvZmZzKTsKKwkJ
ZXJyID0gdWJpZnNfbGViX3JlYWQoYywgbG51bSwgc2J1ZiwgMCwgb2ZmcywgMSk7CiAJCWlmIChl
cnIpCiAJCQlyZXR1cm4gZXJyOwotCQlyZXR1cm4gdWJpX2xlYl9jaGFuZ2UoYy0+dWJpLCBsbnVt
LCBzYnVmLCBvZmZzLCBVQklfVU5LTk9XTik7CisJCXJldHVybiB1Ymlmc19sZWJfY2hhbmdlKGMs
IGxudW0sIHNidWYsIG9mZnMpOwogCX0KIAogCXJldHVybiAwOwpAQCAtOTYyLDcgKzk2Myw3IEBA
CiAgKgogICogVGhpcyBmdW5jdGlvbiByZXR1cm5zICUwIG9uIHN1Y2Nlc3MgYW5kIGEgbmVnYXRp
dmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgogICovCi1pbnQgdWJpZnNfcmVjb3Zlcl9pbmxfaGVh
ZHMoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIHZvaWQgKnNidWYpCitpbnQgdWJpZnNfcmVj
b3Zlcl9pbmxfaGVhZHMoc3RydWN0IHViaWZzX2luZm8gKmMsIHZvaWQgKnNidWYpCiB7CiAJaW50
IGVycjsKIApAQCAtOTgyLDcgKzk4Myw3IEBACiB9CiAKIC8qKgotICogIGNsZWFuX2FuX3VuY2xl
YW5fbGViIC0gcmVhZCBhbmQgd3JpdGUgYSBMRUIgdG8gcmVtb3ZlIGNvcnJ1cHRpb24uCisgKiBj
bGVhbl9hbl91bmNsZWFuX2xlYiAtIHJlYWQgYW5kIHdyaXRlIGEgTEVCIHRvIHJlbW92ZSBjb3Jy
dXB0aW9uLgogICogQGM6IFVCSUZTIGZpbGUtc3lzdGVtIGRlc2NyaXB0aW9uIG9iamVjdAogICog
QHVjbGViOiB1bmNsZWFuIExFQiBpbmZvcm1hdGlvbgogICogQHNidWY6IExFQi1zaXplZCBidWZm
ZXIgdG8gdXNlCkBAIC05OTMsNyArOTk0LDcgQEAKICAqCiAgKiBUaGlzIGZ1bmN0aW9uIHJldHVy
bnMgJTAgb24gc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCiAg
Ki8KLXN0YXRpYyBpbnQgY2xlYW5fYW5fdW5jbGVhbl9sZWIoY29uc3Qgc3RydWN0IHViaWZzX2lu
Zm8gKmMsCitzdGF0aWMgaW50IGNsZWFuX2FuX3VuY2xlYW5fbGViKHN0cnVjdCB1Ymlmc19pbmZv
ICpjLAogCQkJCXN0cnVjdCB1Ymlmc191bmNsZWFuX2xlYiAqdWNsZWIsIHZvaWQgKnNidWYpCiB7
CiAJaW50IGVyciwgbG51bSA9IHVjbGViLT5sbnVtLCBvZmZzID0gMCwgbGVuID0gdWNsZWItPmVu
ZHB0LCBxdWlldCA9IDE7CkBAIC0xMDA5LDcgKzEwMTAsNyBAQAogCQlyZXR1cm4gMDsKIAl9CiAK
LQllcnIgPSB1YmlfcmVhZChjLT51YmksIGxudW0sIGJ1Ziwgb2ZmcywgbGVuKTsKKwllcnIgPSB1
Ymlmc19sZWJfcmVhZChjLCBsbnVtLCBidWYsIG9mZnMsIGxlbiwgMCk7CiAJaWYgKGVyciAmJiBl
cnIgIT0gLUVCQURNU0cpCiAJCXJldHVybiBlcnI7CiAKQEAgLTEwNjksNyArMTA3MCw3IEBACiAJ
fQogCiAJLyogV3JpdGUgYmFjayB0aGUgTEVCIGF0b21pY2FsbHkgKi8KLQllcnIgPSB1YmlfbGVi
X2NoYW5nZShjLT51YmksIGxudW0sIHNidWYsIGxlbiwgVUJJX1VOS05PV04pOworCWVyciA9IHVi
aWZzX2xlYl9jaGFuZ2UoYywgbG51bSwgc2J1ZiwgbGVuKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4g
ZXJyOwogCkBAIC0xMDg5LDcgKzEwOTAsNyBAQAogICoKICAqIFRoaXMgZnVuY3Rpb24gcmV0dXJu
cyAlMCBvbiBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KICAq
LwotaW50IHViaWZzX2NsZWFuX2xlYnMoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIHZvaWQg
KnNidWYpCitpbnQgdWJpZnNfY2xlYW5fbGVicyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgdm9pZCAq
c2J1ZikKIHsKIAlkYmdfcmN2cnkoInJlY292ZXJ5Iik7CiAJd2hpbGUgKCFsaXN0X2VtcHR5KCZj
LT51bmNsZWFuX2xlYl9saXN0KSkgewpAQCAtMTEzNiw5ICsxMTM3LDkgQEAKIAkgKi8KIAlsbnVt
ID0gdWJpZnNfZmluZF9mcmVlX2xlYl9mb3JfaWR4KGMpOwogCWlmIChsbnVtIDwgMCkgewotCQlk
YmdfZXJyKCJjb3VsZCBub3QgZmluZCBhbiBlbXB0eSBMRUIiKTsKLQkJZGJnX2R1bXBfbHByb3Bz
KGMpOwotCQlkYmdfZHVtcF9idWRnKGMsICZjLT5iaSk7CisJCXViaWZzX2VycigiY291bGQgbm90
IGZpbmQgYW4gZW1wdHkgTEVCIik7CisJCXViaWZzX2R1bXBfbHByb3BzKGMpOworCQl1Ymlmc19k
dW1wX2J1ZGcoYywgJmMtPmJpKTsKIAkJcmV0dXJuIGxudW07CiAJfQogCkBAIC0xMjE2LDcgKzEy
MTcsNyBAQAogCX0KIAltdXRleF91bmxvY2soJndidWYtPmlvX211dGV4KTsKIAlpZiAoZXJyIDwg
MCkgewotCQlkYmdfZXJyKCJHQyBmYWlsZWQsIGVycm9yICVkIiwgZXJyKTsKKwkJdWJpZnNfZXJy
KCJHQyBmYWlsZWQsIGVycm9yICVkIiwgZXJyKTsKIAkJaWYgKGVyciA9PSAtRUFHQUlOKQogCQkJ
ZXJyID0gLUVJTlZBTDsKIAkJcmV0dXJuIGVycjsKQEAgLTE0NTQsNyArMTQ1NSw3IEBACiAJaWYg
KGlfc2l6ZSA+PSBlLT5kX3NpemUpCiAJCXJldHVybiAwOwogCS8qIFJlYWQgdGhlIExFQiAqLwot
CWVyciA9IHViaV9yZWFkKGMtPnViaSwgbG51bSwgYy0+c2J1ZiwgMCwgYy0+bGViX3NpemUpOwor
CWVyciA9IHViaWZzX2xlYl9yZWFkKGMsIGxudW0sIGMtPnNidWYsIDAsIGMtPmxlYl9zaXplLCAx
KTsKIAlpZiAoZXJyKQogCQlnb3RvIG91dDsKIAkvKiBDaGFuZ2UgdGhlIHNpemUgZmllbGQgYW5k
IHJlY2FsY3VsYXRlIHRoZSBDUkMgKi8KQEAgLTE0NzAsNyArMTQ3MSw3IEBACiAJCWxlbiAtPSAx
OwogCWxlbiA9IEFMSUdOKGxlbiArIDEsIGMtPm1pbl9pb19zaXplKTsKIAkvKiBBdG9taWNhbGx5
IHdyaXRlIHRoZSBmaXhlZCBMRUIgYmFjayBhZ2FpbiAqLwotCWVyciA9IHViaV9sZWJfY2hhbmdl
KGMtPnViaSwgbG51bSwgYy0+c2J1ZiwgbGVuLCBVQklfVU5LTk9XTik7CisJZXJyID0gdWJpZnNf
bGViX2NoYW5nZShjLCBsbnVtLCBjLT5zYnVmLCBsZW4pOwogCWlmIChlcnIpCiAJCWdvdG8gb3V0
OwogCWRiZ19yY3ZyeSgiaW5vZGUgJWx1IGF0ICVkOiVkIHNpemUgJWxsZCAtPiAlbGxkIiwKZGlm
ZiAtdU4gLXVOciBsaW51eC0zLjAvZnMvdWJpZnMvcmVwbGF5LmMgbGludXgtMy4wLngudWJpZnMu
bGF0ZXN0L2ZzL3ViaWZzL3JlcGxheS5jCi0tLSBsaW51eC0zLjAvZnMvdWJpZnMvcmVwbGF5LmMJ
MjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZz
LmxhdGVzdC9mcy91Ymlmcy9yZXBsYXkuYwkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAwMDAwMCAt
MDUwMApAQCAtMTU0LDggKzE1NCw3IEBACiAKIAkvKiBNYWtlIHN1cmUgdGhlIGpvdXJuYWwgaGVh
ZCBwb2ludHMgdG8gdGhlIGxhdGVzdCBidWQgKi8KIAllcnIgPSB1Ymlmc193YnVmX3NlZWtfbm9s
b2NrKCZjLT5qaGVhZHNbYi0+YnVkLT5qaGVhZF0ud2J1ZiwKLQkJCQkgICAgIGItPmJ1ZC0+bG51
bSwgYy0+bGViX3NpemUgLSBiLT5mcmVlLAotCQkJCSAgICAgVUJJX1NIT1JUVEVSTSk7CisJCQkJ
ICAgICBiLT5idWQtPmxudW0sIGMtPmxlYl9zaXplIC0gYi0+ZnJlZSk7CiAKIG91dDoKIAl1Ymlm
c19yZWxlYXNlX2xwcm9wcyhjKTsKQEAgLTIyMSw4ICsyMjAsOCBAQAogewogCWludCBlcnI7CiAK
LQlkYmdfbW50KCJMRUIgJWQ6JWQgbGVuICVkIGRlbGV0aW9uICVkIHNxbnVtICVsbHUgJXMiLCBy
LT5sbnVtLAotCQlyLT5vZmZzLCByLT5sZW4sIHItPmRlbGV0aW9uLCByLT5zcW51bSwgREJHS0VZ
KCZyLT5rZXkpKTsKKwlkYmdfbW50aygmci0+a2V5LCAiTEVCICVkOiVkIGxlbiAlZCBkZWxldGlv
biAlZCBzcW51bSAlbGx1IGtleSAiLAorCQkgci0+bG51bSwgci0+b2Zmcywgci0+bGVuLCByLT5k
ZWxldGlvbiwgci0+c3FudW0pOwogCiAJLyogU2V0IGMtPnJlcGxheV9zcW51bSB0byBoZWxwIGRl
YWwgd2l0aCBkYW5nbGluZyBicmFuY2hlcy4gKi8KIAljLT5yZXBsYXlfc3FudW0gPSByLT5zcW51
bTsKQEAgLTM2MSw3ICszNjAsNyBAQAogewogCXN0cnVjdCByZXBsYXlfZW50cnkgKnI7CiAKLQlk
YmdfbW50KCJhZGQgTEVCICVkOiVkLCBrZXkgJXMiLCBsbnVtLCBvZmZzLCBEQkdLRVkoa2V5KSk7
CisJZGJnX21udGsoa2V5LCAiYWRkIExFQiAlZDolZCwga2V5ICIsIGxudW0sIG9mZnMpOwogCiAJ
aWYgKGtleV9pbnVtKGMsIGtleSkgPj0gYy0+aGlnaGVzdF9pbnVtKQogCQljLT5oaWdoZXN0X2lu
dW0gPSBrZXlfaW51bShjLCBrZXkpOwpAQCAtNDA5LDcgKzQwOCw3IEBACiAJc3RydWN0IHJlcGxh
eV9lbnRyeSAqcjsKIAljaGFyICpuYnVmOwogCi0JZGJnX21udCgiYWRkIExFQiAlZDolZCwga2V5
ICVzIiwgbG51bSwgb2ZmcywgREJHS0VZKGtleSkpOworCWRiZ19tbnRrKGtleSwgImFkZCBMRUIg
JWQ6JWQsIGtleSAiLCBsbnVtLCBvZmZzKTsKIAlpZiAoa2V5X2ludW0oYywga2V5KSA+PSBjLT5o
aWdoZXN0X2ludW0pCiAJCWMtPmhpZ2hlc3RfaW51bSA9IGtleV9pbnVtKGMsIGtleSk7CiAKQEAg
LTUyMyw4ICs1MjIsNyBAQAogCWlmICghbGlzdF9pc19sYXN0KCZuZXh0LT5saXN0LCAmamgtPmJ1
ZHNfbGlzdCkpCiAJCXJldHVybiAwOwogCi0JZXJyID0gdWJpX3JlYWQoYy0+dWJpLCBuZXh0LT5s
bnVtLCAoY2hhciAqKSZkYXRhLAotCQkgICAgICAgbmV4dC0+c3RhcnQsIDQpOworCWVyciA9IHVi
aWZzX2xlYl9yZWFkKGMsIG5leHQtPmxudW0sIChjaGFyICopJmRhdGEsIG5leHQtPnN0YXJ0LCA0
LCAxKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4gMDsKIApAQCAtNjg3LDcgKzY4NSw3IEBACiAKIG91
dF9kdW1wOgogCXViaWZzX2VycigiYmFkIG5vZGUgaXMgYXQgTEVCICVkOiVkIiwgbG51bSwgc25v
ZC0+b2Zmcyk7Ci0JZGJnX2R1bXBfbm9kZShjLCBzbm9kLT5ub2RlKTsKKwl1Ymlmc19kdW1wX25v
ZGUoYywgc25vZC0+bm9kZSk7CiAJdWJpZnNfc2Nhbl9kZXN0cm95KHNsZWIpOwogCXJldHVybiAt
RUlOVkFMOwogfQpAQCAtODYyLDE2ICs4NjAsMTYgQEAKIAkJICogbnVtYmVycy4KIAkJICovCiAJ
CWlmIChzbm9kLT50eXBlICE9IFVCSUZTX0NTX05PREUpIHsKLQkJCWRiZ19lcnIoImZpcnN0IGxv
ZyBub2RlIGF0IExFQiAlZDolZCBpcyBub3QgQ1Mgbm9kZSIsCi0JCQkJbG51bSwgb2Zmcyk7CisJ
CQl1Ymlmc19lcnIoImZpcnN0IGxvZyBub2RlIGF0IExFQiAlZDolZCBpcyBub3QgQ1Mgbm9kZSIs
CisJCQkJICBsbnVtLCBvZmZzKTsKIAkJCWdvdG8gb3V0X2R1bXA7CiAJCX0KIAkJaWYgKGxlNjRf
dG9fY3B1KG5vZGUtPmNtdF9ubykgIT0gYy0+Y210X25vKSB7Ci0JCQlkYmdfZXJyKCJmaXJzdCBD
UyBub2RlIGF0IExFQiAlZDolZCBoYXMgd3JvbmcgIgotCQkJCSJjb21taXQgbnVtYmVyICVsbHUg
ZXhwZWN0ZWQgJWxsdSIsCi0JCQkJbG51bSwgb2ZmcywKLQkJCQkodW5zaWduZWQgbG9uZyBsb25n
KWxlNjRfdG9fY3B1KG5vZGUtPmNtdF9ubyksCi0JCQkJYy0+Y210X25vKTsKKwkJCXViaWZzX2Vy
cigiZmlyc3QgQ1Mgbm9kZSBhdCBMRUIgJWQ6JWQgaGFzIHdyb25nICIKKwkJCQkgICJjb21taXQg
bnVtYmVyICVsbHUgZXhwZWN0ZWQgJWxsdSIsCisJCQkJICBsbnVtLCBvZmZzLAorCQkJCSAgKHVu
c2lnbmVkIGxvbmcgbG9uZylsZTY0X3RvX2NwdShub2RlLT5jbXRfbm8pLAorCQkJCSAgYy0+Y210
X25vKTsKIAkJCWdvdG8gb3V0X2R1bXA7CiAJCX0KIApAQCAtODkzLDcgKzg5MSw3IEBACiAKIAkv
KiBNYWtlIHN1cmUgdGhlIGZpcnN0IG5vZGUgc2l0cyBhdCBvZmZzZXQgemVybyBvZiB0aGUgTEVC
ICovCiAJaWYgKHNub2QtPm9mZnMgIT0gMCkgewotCQlkYmdfZXJyKCJmaXJzdCBub2RlIGlzIG5v
dCBhdCB6ZXJvIG9mZnNldCIpOworCQl1Ymlmc19lcnIoImZpcnN0IG5vZGUgaXMgbm90IGF0IHpl
cm8gb2Zmc2V0Iik7CiAJCWdvdG8gb3V0X2R1bXA7CiAJfQogCkBAIC05MDYsOCArOTA0LDggQEAK
IAkJfQogCiAJCWlmIChzbm9kLT5zcW51bSA8IGMtPmNzX3NxbnVtKSB7Ci0JCQlkYmdfZXJyKCJi
YWQgc3FudW0gJWxsdSwgY29tbWl0IHNxbnVtICVsbHUiLAotCQkJCXNub2QtPnNxbnVtLCBjLT5j
c19zcW51bSk7CisJCQl1Ymlmc19lcnIoImJhZCBzcW51bSAlbGx1LCBjb21taXQgc3FudW0gJWxs
dSIsCisJCQkJICBzbm9kLT5zcW51bSwgYy0+Y3Nfc3FudW0pOwogCQkJZ290byBvdXRfZHVtcDsK
IAkJfQogCkBAIC05NTksNyArOTU3LDcgQEAKIG91dF9kdW1wOgogCXViaWZzX2VycigibG9nIGVy
cm9yIGRldGVjdGVkIHdoaWxlIHJlcGxheWluZyB0aGUgbG9nIGF0IExFQiAlZDolZCIsCiAJCSAg
bG51bSwgb2ZmcyArIHNub2QtPm9mZnMpOwotCWRiZ19kdW1wX25vZGUoYywgc25vZC0+bm9kZSk7
CisJdWJpZnNfZHVtcF9ub2RlKGMsIHNub2QtPm5vZGUpOwogCXViaWZzX3NjYW5fZGVzdHJveShz
bGViKTsKIAlyZXR1cm4gLUVJTlZBTDsKIH0KZGlmZiAtdU4gLXVOciBsaW51eC0zLjAvZnMvdWJp
ZnMvc2IuYyBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZnMvdWJpZnMvc2IuYwotLS0gbGludXgt
My4wL2ZzL3ViaWZzL3NiLmMJMjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysr
IGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9mcy91Ymlmcy9zYi5jCTIwMTItMDYtMjggMTE6MjY6
MTUuMDAwMDAwMDAwIC0wNTAwCkBAIC0xMzAsNyArMTMwLDYgQEAKIAkgKiBvcnBoYW4gbm9kZS4K
IAkgKi8KIAlvcnBoX2xlYnMgPSBVQklGU19NSU5fT1JQSF9MRUJTOwotI2lmZGVmIENPTkZJR19V
QklGU19GU19ERUJVRwogCWlmIChjLT5sZWJfY250IC0gbWluX2xlYl9jbnQgPiAxKQogCQkvKgog
CQkgKiBGb3IgZGVidWdnaW5nIHB1cnBvc2VzIGl0IGlzIGJldHRlciB0byBoYXZlIGF0IGxlYXN0
IDIKQEAgLTEzOCw3ICsxMzcsNiBAQAogCQkgKiBjb25zb2xpZGF0aW9ucyBhbmQgd291bGQgYmUg
c3RyZXNzZWQgbW9yZS4KIAkJICovCiAJCW9ycGhfbGVicyArPSAxOwotI2VuZGlmCiAKIAltYWlu
X2xlYnMgPSBjLT5sZWJfY250IC0gVUJJRlNfU0JfTEVCUyAtIFVCSUZTX01TVF9MRUJTIC0gbG9n
X2xlYnM7CiAJbWFpbl9sZWJzIC09IG9ycGhfbGViczsKQEAgLTE5Niw3ICsxOTQsNyBAQAogCXN1
cC0+cnBfc2l6ZSA9IGNwdV90b19sZTY0KHRtcDY0KTsKIAlzdXAtPnJvX2NvbXBhdF92ZXJzaW9u
ID0gY3B1X3RvX2xlMzIoVUJJRlNfUk9fQ09NUEFUX1ZFUlNJT04pOwogCi0JZXJyID0gdWJpZnNf
d3JpdGVfbm9kZShjLCBzdXAsIFVCSUZTX1NCX05PREVfU1osIDAsIDAsIFVCSV9MT05HVEVSTSk7
CisJZXJyID0gdWJpZnNfd3JpdGVfbm9kZShjLCBzdXAsIFVCSUZTX1NCX05PREVfU1osIDAsIDAp
OwogCWtmcmVlKHN1cCk7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKQEAgLTI0NywxOSArMjQ1
LDE4IEBACiAJbXN0LT50b3RhbF9kaXJ0eSA9IGNwdV90b19sZTY0KHRtcDY0KTsKIAogCS8qICBU
aGUgaW5kZXhpbmcgTEVCIGRvZXMgbm90IGNvbnRyaWJ1dGUgdG8gZGFyayBzcGFjZSAqLwotCXRt
cDY0ID0gKGMtPm1haW5fbGVicyAtIDEpICogYy0+ZGFya193bTsKKwl0bXA2NCA9ICgobG9uZyBs
b25nKShjLT5tYWluX2xlYnMgLSAxKSAqIGMtPmRhcmtfd20pOwogCW1zdC0+dG90YWxfZGFyayA9
IGNwdV90b19sZTY0KHRtcDY0KTsKIAogCW1zdC0+dG90YWxfdXNlZCA9IGNwdV90b19sZTY0KFVC
SUZTX0lOT19OT0RFX1NaKTsKIAotCWVyciA9IHViaWZzX3dyaXRlX25vZGUoYywgbXN0LCBVQklG
U19NU1RfTk9ERV9TWiwgVUJJRlNfTVNUX0xOVU0sIDAsCi0JCQkgICAgICAgVUJJX1VOS05PV04p
OworCWVyciA9IHViaWZzX3dyaXRlX25vZGUoYywgbXN0LCBVQklGU19NU1RfTk9ERV9TWiwgVUJJ
RlNfTVNUX0xOVU0sIDApOwogCWlmIChlcnIpIHsKIAkJa2ZyZWUobXN0KTsKIAkJcmV0dXJuIGVy
cjsKIAl9Ci0JZXJyID0gdWJpZnNfd3JpdGVfbm9kZShjLCBtc3QsIFVCSUZTX01TVF9OT0RFX1Na
LCBVQklGU19NU1RfTE5VTSArIDEsIDAsCi0JCQkgICAgICAgVUJJX1VOS05PV04pOworCWVyciA9
IHViaWZzX3dyaXRlX25vZGUoYywgbXN0LCBVQklGU19NU1RfTk9ERV9TWiwgVUJJRlNfTVNUX0xO
VU0gKyAxLAorCQkJICAgICAgIDApOwogCWtmcmVlKG1zdCk7CiAJaWYgKGVycikKIAkJcmV0dXJu
IGVycjsKQEAgLTI4Miw4ICsyNzksNyBAQAogCWtleV93cml0ZV9pZHgoYywgJmtleSwgJmJyLT5r
ZXkpOwogCWJyLT5sbnVtID0gY3B1X3RvX2xlMzIobWFpbl9maXJzdCArIERFRkFVTFRfREFUQV9M
RUIpOwogCWJyLT5sZW4gID0gY3B1X3RvX2xlMzIoVUJJRlNfSU5PX05PREVfU1opOwotCWVyciA9
IHViaWZzX3dyaXRlX25vZGUoYywgaWR4LCB0bXAsIG1haW5fZmlyc3QgKyBERUZBVUxUX0lEWF9M
RUIsIDAsCi0JCQkgICAgICAgVUJJX1VOS05PV04pOworCWVyciA9IHViaWZzX3dyaXRlX25vZGUo
YywgaWR4LCB0bXAsIG1haW5fZmlyc3QgKyBERUZBVUxUX0lEWF9MRUIsIDApOwogCWtmcmVlKGlk
eCk7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKQEAgLTMxNSw4ICszMTEsNyBAQAogCWluby0+
ZmxhZ3MgPSBjcHVfdG9fbGUzMihVQklGU19DT01QUl9GTCk7CiAKIAllcnIgPSB1Ymlmc193cml0
ZV9ub2RlKGMsIGlubywgVUJJRlNfSU5PX05PREVfU1osCi0JCQkgICAgICAgbWFpbl9maXJzdCAr
IERFRkFVTFRfREFUQV9MRUIsIDAsCi0JCQkgICAgICAgVUJJX1VOS05PV04pOworCQkJICAgICAg
IG1haW5fZmlyc3QgKyBERUZBVUxUX0RBVEFfTEVCLCAwKTsKIAlrZnJlZShpbm8pOwogCWlmIChl
cnIpCiAJCXJldHVybiBlcnI7CkBAIC0zMzUsOCArMzMwLDcgQEAKIAkJcmV0dXJuIC1FTk9NRU07
CiAKIAljcy0+Y2gubm9kZV90eXBlID0gVUJJRlNfQ1NfTk9ERTsKLQllcnIgPSB1Ymlmc193cml0
ZV9ub2RlKGMsIGNzLCBVQklGU19DU19OT0RFX1NaLCBVQklGU19MT0dfTE5VTSwKLQkJCSAgICAg
ICAwLCBVQklfVU5LTk9XTik7CisJZXJyID0gdWJpZnNfd3JpdGVfbm9kZShjLCBjcywgVUJJRlNf
Q1NfTk9ERV9TWiwgVUJJRlNfTE9HX0xOVU0sIDApOwogCWtmcmVlKGNzKTsKIAogCXViaWZzX21z
ZygiZGVmYXVsdCBmaWxlLXN5c3RlbSBjcmVhdGVkIik7CkBAIC00MTAsMTMgKzQwNCwyMyBAQAog
CX0KIAogCWlmIChjLT5tYWluX2xlYnMgPCBVQklGU19NSU5fTUFJTl9MRUJTKSB7Ci0JCWVyciA9
IDc7CisJCXViaWZzX2VycigidG9vIGZldyBtYWluIExFQnMgY291bnQgJWQsIG11c3QgYmUgYXQg
bGVhc3QgJWQiLAorCQkJICBjLT5tYWluX2xlYnMsIFVCSUZTX01JTl9NQUlOX0xFQlMpOwogCQln
b3RvIGZhaWxlZDsKIAl9CiAKLQlpZiAoYy0+bWF4X2J1ZF9ieXRlcyA8IChsb25nIGxvbmcpYy0+
bGViX3NpemUgKiBVQklGU19NSU5fQlVEX0xFQlMgfHwKLQkgICAgYy0+bWF4X2J1ZF9ieXRlcyA+
IChsb25nIGxvbmcpYy0+bGViX3NpemUgKiBjLT5tYWluX2xlYnMpIHsKLQkJZXJyID0gODsKKwlt
YXhfYnl0ZXMgPSAobG9uZyBsb25nKWMtPmxlYl9zaXplICogVUJJRlNfTUlOX0JVRF9MRUJTOwor
CWlmIChjLT5tYXhfYnVkX2J5dGVzIDwgbWF4X2J5dGVzKSB7CisJCXViaWZzX2VycigidG9vIHNt
YWxsIGpvdXJuYWwgKCVsbGQgYnl0ZXMpLCBtdXN0IGJlIGF0IGxlYXN0ICIKKwkJCSAgIiVsbGQg
Ynl0ZXMiLCAgYy0+bWF4X2J1ZF9ieXRlcywgbWF4X2J5dGVzKTsKKwkJZ290byBmYWlsZWQ7CisJ
fQorCisJbWF4X2J5dGVzID0gKGxvbmcgbG9uZyljLT5sZWJfc2l6ZSAqIGMtPm1haW5fbGViczsK
KwlpZiAoYy0+bWF4X2J1ZF9ieXRlcyA+IG1heF9ieXRlcykgeworCQl1Ymlmc19lcnIoInRvbyBs
YXJnZSBqb3VybmFsIHNpemUgKCVsbGQgYnl0ZXMpLCBvbmx5ICVsbGQgYnl0ZXMiCisJCQkgICJh
dmFpbGFibGUgaW4gdGhlIG1haW4gYXJlYSIsCisJCQkgIGMtPm1heF9idWRfYnl0ZXMsIG1heF9i
eXRlcyk7CiAJCWdvdG8gZmFpbGVkOwogCX0KIApAQCAtNDUwLDcgKzQ1NCw2IEBACiAJCWdvdG8g
ZmFpbGVkOwogCX0KIAotCW1heF9ieXRlcyA9IGMtPm1haW5fbGVicyAqIChsb25nIGxvbmcpYy0+
bGViX3NpemU7CiAJaWYgKGMtPnJwX3NpemUgPCAwIHx8IG1heF9ieXRlcyA8IGMtPnJwX3NpemUp
IHsKIAkJZXJyID0gMTQ7CiAJCWdvdG8gZmFpbGVkOwpAQCAtNDY2LDcgKzQ2OSw3IEBACiAKIGZh
aWxlZDoKIAl1Ymlmc19lcnIoImJhZCBzdXBlcmJsb2NrLCBlcnJvciAlZCIsIGVycik7Ci0JZGJn
X2R1bXBfbm9kZShjLCBzdXApOworCXViaWZzX2R1bXBfbm9kZShjLCBzdXApOwogCXJldHVybiAt
RUlOVkFMOwogfQogCkBAIC01MDksNyArNTEyLDcgQEAKIAlpbnQgbGVuID0gQUxJR04oVUJJRlNf
U0JfTk9ERV9TWiwgYy0+bWluX2lvX3NpemUpOwogCiAJdWJpZnNfcHJlcGFyZV9ub2RlKGMsIHN1
cCwgVUJJRlNfU0JfTk9ERV9TWiwgMSk7Ci0JcmV0dXJuIHViaWZzX2xlYl9jaGFuZ2UoYywgVUJJ
RlNfU0JfTE5VTSwgc3VwLCBsZW4sIFVCSV9MT05HVEVSTSk7CisJcmV0dXJuIHViaWZzX2xlYl9j
aGFuZ2UoYywgVUJJRlNfU0JfTE5VTSwgc3VwLCBsZW4pOwogfQogCiAvKioKQEAgLTY3NCwxNSAr
Njc3LDE1IEBACiAKIAlpZiAobGVuID09IDApIHsKIAkJZGJnX21udCgidW5tYXAgZW1wdHkgTEVC
ICVkIiwgbG51bSk7Ci0JCXJldHVybiB1YmlfbGViX3VubWFwKGMtPnViaSwgbG51bSk7CisJCXJl
dHVybiB1Ymlmc19sZWJfdW5tYXAoYywgbG51bSk7CiAJfQogCiAJZGJnX21udCgiZml4dXAgTEVC
ICVkLCBkYXRhIGxlbiAlZCIsIGxudW0sIGxlbik7Ci0JZXJyID0gdWJpX3JlYWQoYy0+dWJpLCBs
bnVtLCBjLT5zYnVmLCAwLCBsZW4pOworCWVyciA9IHViaWZzX2xlYl9yZWFkKGMsIGxudW0sIGMt
PnNidWYsIDAsIGxlbiwgMSk7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKIAotCXJldHVybiB1
YmlfbGViX2NoYW5nZShjLT51YmksIGxudW0sIGMtPnNidWYsIGxlbiwgVUJJX1VOS05PV04pOwor
CXJldHVybiB1Ymlmc19sZWJfY2hhbmdlKGMsIGxudW0sIGMtPnNidWYsIGxlbik7CiB9CiAKIC8q
KgpkaWZmIC11TiAtdU5yIGxpbnV4LTMuMC9mcy91Ymlmcy9zY2FuLmMgbGludXgtMy4wLngudWJp
ZnMubGF0ZXN0L2ZzL3ViaWZzL3NjYW4uYwotLS0gbGludXgtMy4wL2ZzL3ViaWZzL3NjYW4uYwky
MDExLTA3LTIxIDIxOjE3OjIzLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtMy4wLngudWJpZnMu
bGF0ZXN0L2ZzL3ViaWZzL3NjYW4uYwkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAwMDAwMCAtMDUw
MApAQCAtMTAxLDcgKzEwMSw3IEBACiAJCQlpZiAoIXF1aWV0KSB7CiAJCQkJdWJpZnNfZXJyKCJi
YWQgcGFkIG5vZGUgYXQgTEVCICVkOiVkIiwKIAkJCQkJICBsbnVtLCBvZmZzKTsKLQkJCQlkYmdf
ZHVtcF9ub2RlKGMsIHBhZCk7CisJCQkJdWJpZnNfZHVtcF9ub2RlKGMsIHBhZCk7CiAJCQl9CiAJ
CQlyZXR1cm4gU0NBTk5FRF9BX0JBRF9QQURfTk9ERTsKIAkJfQpAQCAtMTA5LDggKzEwOSw4IEBA
CiAJCS8qIE1ha2UgdGhlIG5vZGUgcGFkcyB0byA4LWJ5dGUgYm91bmRhcnkgKi8KIAkJaWYgKChu
b2RlX2xlbiArIHBhZF9sZW4pICYgNykgewogCQkJaWYgKCFxdWlldCkKLQkJCQlkYmdfZXJyKCJi
YWQgcGFkZGluZyBsZW5ndGggJWQgLSAlZCIsCi0JCQkJCW9mZnMsIG9mZnMgKyBub2RlX2xlbiAr
IHBhZF9sZW4pOworCQkJCXViaWZzX2VycigiYmFkIHBhZGRpbmcgbGVuZ3RoICVkIC0gJWQiLAor
CQkJCQkgIG9mZnMsIG9mZnMgKyBub2RlX2xlbiArIHBhZF9sZW4pOwogCQkJcmV0dXJuIFNDQU5O
RURfQV9CQURfUEFEX05PREU7CiAJCX0KIApAQCAtMTQ4LDcgKzE0OCw3IEBACiAJSU5JVF9MSVNU
X0hFQUQoJnNsZWItPm5vZGVzKTsKIAlzbGViLT5idWYgPSBzYnVmOwogCi0JZXJyID0gdWJpX3Jl
YWQoYy0+dWJpLCBsbnVtLCBzYnVmICsgb2Zmcywgb2ZmcywgYy0+bGViX3NpemUgLSBvZmZzKTsK
KwllcnIgPSB1Ymlmc19sZWJfcmVhZChjLCBsbnVtLCBzYnVmICsgb2Zmcywgb2ZmcywgYy0+bGVi
X3NpemUgLSBvZmZzLCAwKTsKIAlpZiAoZXJyICYmIGVyciAhPSAtRUJBRE1TRykgewogCQl1Ymlm
c19lcnIoImNhbm5vdCByZWFkICVkIGJ5dGVzIGZyb20gTEVCICVkOiVkLCIKIAkJCSAgIiBlcnJv
ciAlZCIsIGMtPmxlYl9zaXplIC0gb2ZmcywgbG51bSwgb2ZmcywgZXJyKTsKQEAgLTI0MCwxMiAr
MjQwLDEyIEBACiAJaW50IGxlbjsKIAogCXViaWZzX2VycigiY29ycnVwdGlvbiBhdCBMRUIgJWQ6
JWQiLCBsbnVtLCBvZmZzKTsKLQlpZiAoZGJnX2ZhaWx1cmVfbW9kZSkKKwlpZiAoZGJnX2lzX3Rz
dF9yY3ZyeShjKSkKIAkJcmV0dXJuOwogCWxlbiA9IGMtPmxlYl9zaXplIC0gb2ZmczsKIAlpZiAo
bGVuID4gODE5MikKIAkJbGVuID0gODE5MjsKLQlkYmdfZXJyKCJmaXJzdCAlZCBieXRlcyBmcm9t
IExFQiAlZDolZCIsIGxlbiwgbG51bSwgb2Zmcyk7CisJdWJpZnNfZXJyKCJmaXJzdCAlZCBieXRl
cyBmcm9tIExFQiAlZDolZCIsIGxlbiwgbG51bSwgb2Zmcyk7CiAJcHJpbnRfaGV4X2R1bXAoS0VS
Tl9ERUJVRywgIiIsIERVTVBfUFJFRklYX09GRlNFVCwgMzIsIDQsIGJ1ZiwgbGVuLCAxKTsKIH0K
IApAQCAtMzAwLDE2ICszMDAsMTYgQEAKIAogCQlzd2l0Y2ggKHJldCkgewogCQljYXNlIFNDQU5O
RURfR0FSQkFHRToKLQkJCWRiZ19lcnIoImdhcmJhZ2UiKTsKKwkJCXViaWZzX2VycigiZ2FyYmFn
ZSIpOwogCQkJZ290byBjb3JydXB0ZWQ7CiAJCWNhc2UgU0NBTk5FRF9BX05PREU6CiAJCQlicmVh
azsKIAkJY2FzZSBTQ0FOTkVEX0FfQ09SUlVQVF9OT0RFOgogCQljYXNlIFNDQU5ORURfQV9CQURf
UEFEX05PREU6Ci0JCQlkYmdfZXJyKCJiYWQgbm9kZSIpOworCQkJdWJpZnNfZXJyKCJiYWQgbm9k
ZSIpOwogCQkJZ290byBjb3JydXB0ZWQ7CiAJCWRlZmF1bHQ6Ci0JCQlkYmdfZXJyKCJ1bmtub3du
Iik7CisJCQl1Ymlmc19lcnIoInVua25vd24iKTsKIAkJCWVyciA9IC1FSU5WQUw7CiAJCQlnb3Rv
IGVycm9yOwogCQl9CmRpZmYgLXVOIC11TnIgbGludXgtMy4wL2ZzL3ViaWZzL3N1cGVyLmMgbGlu
dXgtMy4wLngudWJpZnMubGF0ZXN0L2ZzL3ViaWZzL3N1cGVyLmMKLS0tIGxpbnV4LTMuMC9mcy91
Ymlmcy9zdXBlci5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51
eC0zLjAueC51Ymlmcy5sYXRlc3QvZnMvdWJpZnMvc3VwZXIuYwkyMDEyLTA2LTI4IDExOjI2OjE1
LjAwMDAwMDAwMCAtMDUwMApAQCAtODUsNyArODUsNyBAQAogCWlmICh1aS0+ZGF0YV9sZW4gPCAw
IHx8IHVpLT5kYXRhX2xlbiA+IFVCSUZTX01BWF9JTk9fREFUQSkKIAkJcmV0dXJuIDQ7CiAKLQlp
ZiAodWktPnhhdHRyICYmIChpbm9kZS0+aV9tb2RlICYgU19JRk1UKSAhPSBTX0lGUkVHKQorCWlm
ICh1aS0+eGF0dHIgJiYgIVNfSVNSRUcoaW5vZGUtPmlfbW9kZSkpCiAJCXJldHVybiA1OwogCiAJ
aWYgKCF1Ymlmc19jb21wcl9wcmVzZW50KHVpLT5jb21wcl90eXBlKSkgewpAQCAtOTQsNyArOTQs
NyBAQAogCQkJICAgdWJpZnNfY29tcHJfbmFtZSh1aS0+Y29tcHJfdHlwZSkpOwogCX0KIAotCWVy
ciA9IGRiZ19jaGVja19kaXJfc2l6ZShjLCBpbm9kZSk7CisJZXJyID0gZGJnX2NoZWNrX2Rpcihj
LCBpbm9kZSk7CiAJcmV0dXJuIGVycjsKIH0KIApAQCAtMjQ2LDggKzI0Niw4IEBACiAKIG91dF9p
bnZhbGlkOgogCXViaWZzX2VycigiaW5vZGUgJWx1IHZhbGlkYXRpb24gZmFpbGVkLCBlcnJvciAl
ZCIsIGlub2RlLT5pX2lubywgZXJyKTsKLQlkYmdfZHVtcF9ub2RlKGMsIGlubyk7Ci0JZGJnX2R1
bXBfaW5vZGUoYywgaW5vZGUpOworCXViaWZzX2R1bXBfbm9kZShjLCBpbm8pOworCXViaWZzX2R1
bXBfaW5vZGUoYywgaW5vZGUpOwogCWVyciA9IC1FSU5WQUw7CiBvdXRfaW5vOgogCWtmcmVlKGlu
byk7CkBAIC02NjksOCArNjY5LDggQEAKIAl0bXAgPSBVQklGU19DU19OT0RFX1NaICsgVUJJRlNf
UkVGX05PREVfU1ogKiBjLT5qaGVhZF9jbnQ7CiAJdG1wID0gQUxJR04odG1wLCBjLT5taW5faW9f
c2l6ZSk7CiAJaWYgKHRtcCA+IGMtPmxlYl9zaXplKSB7Ci0JCWRiZ19lcnIoInRvbyBzbWFsbCBM
RUIgc2l6ZSAlZCwgYXQgbGVhc3QgJWQgbmVlZGVkIiwKLQkJCWMtPmxlYl9zaXplLCB0bXApOwor
CQl1Ymlmc19lcnIoInRvbyBzbWFsbCBMRUIgc2l6ZSAlZCwgYXQgbGVhc3QgJWQgbmVlZGVkIiwK
KwkJCSAgYy0+bGViX3NpemUsIHRtcCk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIApAQCAtNjg0
LDggKzY4NCw4IEBACiAJdG1wIC89IGMtPmxlYl9zaXplOwogCXRtcCArPSAxOwogCWlmIChjLT5s
b2dfbGVicyA8IHRtcCkgewotCQlkYmdfZXJyKCJ0b28gc21hbGwgbG9nICVkIExFQnMsIHJlcXVp
cmVkIG1pbi4gJWQgTEVCcyIsCi0JCQljLT5sb2dfbGVicywgdG1wKTsKKwkJdWJpZnNfZXJyKCJ0
b28gc21hbGwgbG9nICVkIExFQnMsIHJlcXVpcmVkIG1pbi4gJWQgTEVCcyIsCisJCQkgIGMtPmxv
Z19sZWJzLCB0bXApOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKQEAgLTgxNCwxMyArODE0LDEw
IEBACiAJCWMtPmpoZWFkc1tpXS5ncm91cGVkID0gMTsKIAl9CiAKLQljLT5qaGVhZHNbQkFTRUhE
XS53YnVmLmR0eXBlID0gVUJJX1NIT1JUVEVSTTsKIAkvKgotCSAqIEdhcmJhZ2UgQ29sbGVjdG9y
IGhlYWQgbGlrZWx5IGNvbnRhaW5zIGxvbmctdGVybSBkYXRhIGFuZAotCSAqIGRvZXMgbm90IG5l
ZWQgdG8gYmUgc3luY2hyb25pemVkIGJ5IHRpbWVyLiBBbHNvIEdDIGhlYWQgbm9kZXMgYXJlCi0J
ICogbm90IGdyb3VwZWQuCisJICogR2FyYmFnZSBDb2xsZWN0b3IgaGVhZCBkb2VzIG5vdCBuZWVk
IHRvIGJlIHN5bmNocm9uaXplZCBieSB0aW1lci4KKwkgKiBBbHNvIEdDIGhlYWQgbm9kZXMgYXJl
IG5vdCBncm91cGVkLgogCSAqLwotCWMtPmpoZWFkc1tHQ0hEXS53YnVmLmR0eXBlID0gVUJJX0xP
TkdURVJNOwogCWMtPmpoZWFkc1tHQ0hEXS53YnVmLm5vX3RpbWVyID0gMTsKIAljLT5qaGVhZHNb
R0NIRF0uZ3JvdXBlZCA9IDA7CiAKQEAgLTg2NCw3ICs4NjEsNyBAQAogCQlvcnBoID0gbGlzdF9l
bnRyeShjLT5vcnBoX2xpc3QubmV4dCwgc3RydWN0IHViaWZzX29ycGhhbiwgbGlzdCk7CiAJCWxp
c3RfZGVsKCZvcnBoLT5saXN0KTsKIAkJa2ZyZWUob3JwaCk7Ci0JCWRiZ19lcnIoIm9ycGhhbiBs
aXN0IG5vdCBlbXB0eSBhdCB1bm1vdW50Iik7CisJCXViaWZzX2Vycigib3JwaGFuIGxpc3Qgbm90
IGVtcHR5IGF0IHVubW91bnQiKTsKIAl9CiAKIAl2ZnJlZShjLT5vcnBoX2J1Zik7CkBAIC05MTQs
NyArOTExLDcgQEAKIAogCWMtPmVtcHR5ID0gMTsKIAlmb3IgKGxudW0gPSAwOyBsbnVtIDwgYy0+
bGViX2NudDsgbG51bSsrKSB7Ci0JCWVyciA9IHViaV9pc19tYXBwZWQoYy0+dWJpLCBsbnVtKTsK
KwkJZXJyID0gdWJpZnNfaXNfbWFwcGVkKGMsIGxudW0pOwogCQlpZiAodW5saWtlbHkoZXJyIDwg
MCkpCiAJCQlyZXR1cm4gZXJyOwogCQlpZiAoZXJyID09IDEpIHsKQEAgLTExNDgsOCArMTE0NSw4
IEBACiAJdWJpZnNfYXNzZXJ0KGMtPmRhcmtfd20gPiAwKTsKIAlpZiAoYy0+bHN0LnRvdGFsX2Zy
ZWUgKyBjLT5sc3QudG90YWxfZGlydHkgPCBjLT5kYXJrX3dtKSB7CiAJCXViaWZzX2VycigiaW5z
dWZmaWNpZW50IGZyZWUgc3BhY2UgdG8gbW91bnQgaW4gUi9XIG1vZGUiKTsKLQkJZGJnX2R1bXBf
YnVkZyhjLCAmYy0+YmkpOwotCQlkYmdfZHVtcF9scHJvcHMoYyk7CisJCXViaWZzX2R1bXBfYnVk
ZyhjLCAmYy0+YmkpOworCQl1Ymlmc19kdW1wX2xwcm9wcyhjKTsKIAkJcmV0dXJuIC1FTk9TUEM7
CiAJfQogCXJldHVybiAwOwpAQCAtMTMwMiw3ICsxMjk5LDcgQEAKIAlpZiAoIWMtPnJvX21vdW50
ICYmIGMtPnNwYWNlX2ZpeHVwKSB7CiAJCWVyciA9IHViaWZzX2ZpeHVwX2ZyZWVfc3BhY2UoYyk7
CiAJCWlmIChlcnIpCi0JCQlnb3RvIG91dF9tYXN0ZXI7CisJCQlnb3RvIG91dF9scHQ7CiAJfQog
CiAJaWYgKCFjLT5yb19tb3VudCkgewpAQCAtMjEyOSw4ICsyMTI2LDggQEAKIAkgKi8KIAl1Ymkg
PSBvcGVuX3ViaShuYW1lLCBVQklfUkVBRE9OTFkpOwogCWlmIChJU19FUlIodWJpKSkgewotCQlk
YmdfZXJyKCJjYW5ub3Qgb3BlbiBcIiVzXCIsIGVycm9yICVkIiwKLQkJCW5hbWUsIChpbnQpUFRS
X0VSUih1YmkpKTsKKwkJdWJpZnNfZXJyKCJjYW5ub3Qgb3BlbiBcIiVzXCIsIGVycm9yICVkIiwK
KwkJCSAgbmFtZSwgKGludClQVFJfRVJSKHViaSkpOwogCQlyZXR1cm4gRVJSX0NBU1QodWJpKTsK
IAl9CiAKZGlmZiAtdU4gLXVOciBsaW51eC0zLjAvZnMvdWJpZnMvdG5jLmMgbGludXgtMy4wLngu
dWJpZnMubGF0ZXN0L2ZzL3ViaWZzL3RuYy5jCi0tLSBsaW51eC0zLjAvZnMvdWJpZnMvdG5jLmMJ
MjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZz
LmxhdGVzdC9mcy91Ymlmcy90bmMuYwkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAwMDAwMCAtMDUw
MApAQCAtMjIzLDcgKzIyMyw3IEBACiAJX19zZXRfYml0KERJUlRZX1pOT0RFLCAmem4tPmZsYWdz
KTsKIAlfX2NsZWFyX2JpdChDT1dfWk5PREUsICZ6bi0+ZmxhZ3MpOwogCi0JdWJpZnNfYXNzZXJ0
KCF0ZXN0X2JpdChPQlNPTEVURV9aTk9ERSwgJnpub2RlLT5mbGFncykpOworCXViaWZzX2Fzc2Vy
dCghdWJpZnNfem5fb2Jzb2xldGUoem5vZGUpKTsKIAlfX3NldF9iaXQoT0JTT0xFVEVfWk5PREUs
ICZ6bm9kZS0+ZmxhZ3MpOwogCiAJaWYgKHpub2RlLT5sZXZlbCAhPSAwKSB7CkBAIC0yNzEsNyAr
MjcxLDcgQEAKIAlzdHJ1Y3QgdWJpZnNfem5vZGUgKnpuOwogCWludCBlcnI7CiAKLQlpZiAoIXRl
c3RfYml0KENPV19aTk9ERSwgJnpub2RlLT5mbGFncykpIHsKKwlpZiAoIXViaWZzX3puX2Nvdyh6
bm9kZSkpIHsKIAkJLyogem5vZGUgaXMgbm90IGJlaW5nIGNvbW1pdHRlZCAqLwogCQlpZiAoIXRl
c3RfYW5kX3NldF9iaXQoRElSVFlfWk5PREUsICZ6bm9kZS0+ZmxhZ3MpKSB7CiAJCQlhdG9taWNf
bG9uZ19pbmMoJmMtPmRpcnR5X3puX2NudCk7CkBAIC0zMzksMTcgKzMzOSwxNiBAQAogCiAJZXJy
ID0gdWJpZnNfdmFsaWRhdGVfZW50cnkoYywgZGVudCk7CiAJaWYgKGVycikgewotCQlkYmdfZHVt
cF9zdGFjaygpOwotCQlkYmdfZHVtcF9ub2RlKGMsIGRlbnQpOworCQlkdW1wX3N0YWNrKCk7CisJ
CXViaWZzX2R1bXBfbm9kZShjLCBkZW50KTsKIAkJcmV0dXJuIGVycjsKIAl9CiAKLQlsbmNfbm9k
ZSA9IGttYWxsb2MoemJyLT5sZW4sIEdGUF9OT0ZTKTsKKwlsbmNfbm9kZSA9IGttZW1kdXAobm9k
ZSwgemJyLT5sZW4sIEdGUF9OT0ZTKTsKIAlpZiAoIWxuY19ub2RlKQogCQkvKiBXZSBkb24ndCBo
YXZlIHRvIGhhdmUgdGhlIGNhY2hlLCBzbyBubyBlcnJvciAqLwogCQlyZXR1cm4gMDsKIAotCW1l
bWNweShsbmNfbm9kZSwgbm9kZSwgemJyLT5sZW4pOwogCXpici0+bGVhZiA9IGxuY19ub2RlOwog
CXJldHVybiAwOwogfQpAQCAtMzczLDggKzM3Miw4IEBACiAKIAllcnIgPSB1Ymlmc192YWxpZGF0
ZV9lbnRyeShjLCBub2RlKTsKIAlpZiAoZXJyKSB7Ci0JCWRiZ19kdW1wX3N0YWNrKCk7Ci0JCWRi
Z19kdW1wX25vZGUoYywgbm9kZSk7CisJCWR1bXBfc3RhY2soKTsKKwkJdWJpZnNfZHVtcF9ub2Rl
KGMsIG5vZGUpOwogCQlyZXR1cm4gZXJyOwogCX0KIApAQCAtNDYyLDcgKzQ2MSw3IEBACiAKIAlk
YmdfaW8oIkxFQiAlZDolZCwgJXMsIGxlbmd0aCAlZCIsIGxudW0sIG9mZnMsIGRiZ19udHlwZSh0
eXBlKSwgbGVuKTsKIAotCWVyciA9IHViaV9yZWFkKGMtPnViaSwgbG51bSwgYnVmLCBvZmZzLCBs
ZW4pOworCWVyciA9IHViaWZzX2xlYl9yZWFkKGMsIGxudW0sIGJ1Ziwgb2ZmcywgbGVuLCAxKTsK
IAlpZiAoZXJyKSB7CiAJCXViaWZzX2VycigiY2Fubm90IHJlYWQgbm9kZSB0eXBlICVkIGZyb20g
TEVCICVkOiVkLCBlcnJvciAlZCIsCiAJCQkgIHR5cGUsIGxudW0sIG9mZnMsIGVycik7CkBAIC01
MDYsNyArNTA1LDcgQEAKIHsKIAlpbnQgcmV0OwogCi0JZGJnX3RuYygiTEVCICVkOiVkLCBrZXkg
JXMiLCB6YnItPmxudW0sIHpici0+b2ZmcywgREJHS0VZKGtleSkpOworCWRiZ190bmNrKGtleSwg
IkxFQiAlZDolZCwga2V5ICIsIHpici0+bG51bSwgemJyLT5vZmZzKTsKIAogCXJldCA9IHRyeV9y
ZWFkX25vZGUoYywgbm9kZSwga2V5X3R5cGUoYywga2V5KSwgemJyLT5sZW4sIHpici0+bG51bSwK
IAkJCSAgICB6YnItPm9mZnMpOwpAQCAtNTIwLDggKzUxOSw4IEBACiAJCQlyZXQgPSAwOwogCX0K
IAlpZiAocmV0ID09IDAgJiYgYy0+cmVwbGF5aW5nKQotCQlkYmdfbW50KCJkYW5nbGluZyBicmFu
Y2ggTEVCICVkOiVkIGxlbiAlZCwga2V5ICVzIiwKLQkJCXpici0+bG51bSwgemJyLT5vZmZzLCB6
YnItPmxlbiwgREJHS0VZKGtleSkpOworCQlkYmdfbW50ayhrZXksICJkYW5nbGluZyBicmFuY2gg
TEVCICVkOiVkIGxlbiAlZCwga2V5ICIsCisJCQl6YnItPmxudW0sIHpici0+b2ZmcywgemJyLT5s
ZW4pOwogCXJldHVybiByZXQ7CiB9CiAKQEAgLTk5Niw5ICs5OTUsOSBAQAogCWlmIChhZGRpbmcg
fHwgIW9fem5vZGUpCiAJCXJldHVybiAwOwogCi0JZGJnX21udCgiZGFuZ2xpbmcgbWF0Y2ggTEVC
ICVkOiVkIGxlbiAlZCAlcyIsCisJZGJnX21udGsoa2V5LCAiZGFuZ2xpbmcgbWF0Y2ggTEVCICVk
OiVkIGxlbiAlZCBrZXkgIiwKIAkJb196bm9kZS0+emJyYW5jaFtvX25dLmxudW0sIG9fem5vZGUt
PnpicmFuY2hbb19uXS5vZmZzLAotCQlvX3pub2RlLT56YnJhbmNoW29fbl0ubGVuLCBEQkdLRVko
a2V5KSk7CisJCW9fem5vZGUtPnpicmFuY2hbb19uXS5sZW4pOwogCSp6biA9IG9fem5vZGU7CiAJ
Km4gPSBvX247CiAJcmV0dXJuIDE7CkBAIC0xMTgwLDcgKzExNzksNyBAQAogCXN0cnVjdCB1Ymlm
c196bm9kZSAqem5vZGU7CiAJdW5zaWduZWQgbG9uZyB0aW1lID0gZ2V0X3NlY29uZHMoKTsKIAot
CWRiZ190bmMoInNlYXJjaCBrZXkgJXMiLCBEQkdLRVkoa2V5KSk7CisJZGJnX3RuY2soa2V5LCAi
c2VhcmNoIGtleSAiKTsKIAl1Ymlmc19hc3NlcnQoa2V5X3R5cGUoYywga2V5KSA8IFVCSUZTX0lO
VkFMSURfS0VZKTsKIAogCXpub2RlID0gYy0+enJvb3Quem5vZGU7CkBAIC0xMzE2LDcgKzEzMTUs
NyBAQAogCXN0cnVjdCB1Ymlmc196bm9kZSAqem5vZGU7CiAJdW5zaWduZWQgbG9uZyB0aW1lID0g
Z2V0X3NlY29uZHMoKTsKIAotCWRiZ190bmMoInNlYXJjaCBhbmQgZGlydHkga2V5ICVzIiwgREJH
S0VZKGtleSkpOworCWRiZ190bmNrKGtleSwgInNlYXJjaCBhbmQgZGlydHkga2V5ICIpOwogCiAJ
em5vZGUgPSBjLT56cm9vdC56bm9kZTsKIAlpZiAodW5saWtlbHkoIXpub2RlKSkgewpAQCAtMTY2
Niw3ICsxNjY1LDcgQEAKIAlpZiAoIW92ZXJsYXApIHsKIAkJLyogV2UgbWF5IHNhZmVseSB1bmxv
Y2sgdGhlIHdyaXRlLWJ1ZmZlciBhbmQgcmVhZCB0aGUgZGF0YSAqLwogCQlzcGluX3VubG9jaygm
d2J1Zi0+bG9jayk7Ci0JCXJldHVybiB1YmlfcmVhZChjLT51YmksIGxudW0sIGJ1Ziwgb2Zmcywg
bGVuKTsKKwkJcmV0dXJuIHViaWZzX2xlYl9yZWFkKGMsIGxudW0sIGJ1Ziwgb2ZmcywgbGVuLCAw
KTsKIAl9CiAKIAkvKiBEb24ndCByZWFkIHVuZGVyIHdidWYgKi8KQEAgLTE2ODAsNyArMTY3OSw3
IEBACiAKIAlpZiAocmxlbiA+IDApCiAJCS8qIFJlYWQgZXZlcnl0aGluZyB0aGF0IGdvZXMgYmVm
b3JlIHdyaXRlLWJ1ZmZlciAqLwotCQlyZXR1cm4gdWJpX3JlYWQoYy0+dWJpLCBsbnVtLCBidWYs
IG9mZnMsIHJsZW4pOworCQlyZXR1cm4gdWJpZnNfbGViX3JlYWQoYywgbG51bSwgYnVmLCBvZmZz
LCBybGVuLCAwKTsKIAogCXJldHVybiAwOwogfQpAQCAtMTcyMyw4ICsxNzIyLDggQEAKIAlpZiAo
IWtleXNfZXEoYywgJnpici0+a2V5LCAma2V5MSkpIHsKIAkJdWJpZnNfZXJyKCJiYWQga2V5IGlu
IG5vZGUgYXQgTEVCICVkOiVkIiwKIAkJCSAgemJyLT5sbnVtLCB6YnItPm9mZnMpOwotCQlkYmdf
dG5jKCJsb29rZWQgZm9yIGtleSAlcyBmb3VuZCBub2RlJ3Mga2V5ICVzIiwKLQkJCURCR0tFWSgm
emJyLT5rZXkpLCBEQkdLRVkxKCZrZXkxKSk7CisJCWRiZ190bmNrKCZ6YnItPmtleSwgImxvb2tl
ZCBmb3Iga2V5ICIpOworCQlkYmdfdG5jaygma2V5MSwgImZvdW5kIG5vZGUncyBrZXkgIik7CiAJ
CWdvdG8gb3V0X2VycjsKIAl9CiAKQEAgLTE3MzQsOCArMTczMyw4IEBACiAJZXJyID0gLUVJTlZB
TDsKIG91dDoKIAl1Ymlmc19lcnIoImJhZCBub2RlIGF0IExFQiAlZDolZCIsIHpici0+bG51bSwg
emJyLT5vZmZzKTsKLQlkYmdfZHVtcF9ub2RlKGMsIGJ1Zik7Ci0JZGJnX2R1bXBfc3RhY2soKTsK
Kwl1Ymlmc19kdW1wX25vZGUoYywgYnVmKTsKKwlkdW1wX3N0YWNrKCk7CiAJcmV0dXJuIGVycjsK
IH0KIApAQCAtMTc2Nyw3ICsxNzY2LDcgQEAKIAlpZiAod2J1ZikKIAkJZXJyID0gcmVhZF93YnVm
KHdidWYsIGJ1LT5idWYsIGxlbiwgbG51bSwgb2Zmcyk7CiAJZWxzZQotCQllcnIgPSB1YmlfcmVh
ZChjLT51YmksIGxudW0sIGJ1LT5idWYsIG9mZnMsIGxlbik7CisJCWVyciA9IHViaWZzX2xlYl9y
ZWFkKGMsIGxudW0sIGJ1LT5idWYsIG9mZnMsIGxlbiwgMCk7CiAKIAkvKiBDaGVjayBmb3IgYSBy
YWNlIHdpdGggR0MgKi8KIAlpZiAobWF5YmVfbGViX2djZWQoYywgbG51bSwgYnUtPmdjX3NlcSkp
CkBAIC0xNzc2LDggKzE3NzUsOCBAQAogCWlmIChlcnIgJiYgZXJyICE9IC1FQkFETVNHKSB7CiAJ
CXViaWZzX2VycigiZmFpbGVkIHRvIHJlYWQgZnJvbSBMRUIgJWQ6JWQsIGVycm9yICVkIiwKIAkJ
CSAgbG51bSwgb2ZmcywgZXJyKTsKLQkJZGJnX2R1bXBfc3RhY2soKTsKLQkJZGJnX3RuYygia2V5
ICVzIiwgREJHS0VZKCZidS0+a2V5KSk7CisJCWR1bXBfc3RhY2soKTsKKwkJZGJnX3RuY2soJmJ1
LT5rZXksICJrZXkgIik7CiAJCXJldHVybiBlcnI7CiAJfQogCkBAIC0xODEyLDcgKzE4MTEsNyBA
QAogCWludCBmb3VuZCwgbiwgZXJyOwogCXN0cnVjdCB1Ymlmc196bm9kZSAqem5vZGU7CiAKLQlk
YmdfdG5jKCJuYW1lICclLipzJyBrZXkgJXMiLCBubS0+bGVuLCBubS0+bmFtZSwgREJHS0VZKGtl
eSkpOworCWRiZ190bmNrKGtleSwgIm5hbWUgJyUuKnMnIGtleSAiLCBubS0+bGVuLCBubS0+bmFt
ZSk7CiAJbXV0ZXhfbG9jaygmYy0+dG5jX211dGV4KTsKIAlmb3VuZCA9IHViaWZzX2xvb2t1cF9s
ZXZlbDAoYywga2V5LCAmem5vZGUsICZuKTsKIAlpZiAoIWZvdW5kKSB7CkBAIC0xOTg2LDggKzE5
ODUsNyBAQAogCXpwID0gem5vZGUtPnBhcmVudDsKIAlpZiAoem5vZGUtPmNoaWxkX2NudCA8IGMt
PmZhbm91dCkgewogCQl1Ymlmc19hc3NlcnQobiAhPSBjLT5mYW5vdXQpOwotCQlkYmdfdG5jKCJp
bnNlcnRlZCBhdCAlZCBsZXZlbCAlZCwga2V5ICVzIiwgbiwgem5vZGUtPmxldmVsLAotCQkJREJH
S0VZKGtleSkpOworCQlkYmdfdG5jayhrZXksICJpbnNlcnRlZCBhdCAlZCBsZXZlbCAlZCwga2V5
ICIsIG4sIHpub2RlLT5sZXZlbCk7CiAKIAkJaW5zZXJ0X3picmFuY2goem5vZGUsIHpiciwgbik7
CiAKQEAgLTIwMDIsNyArMjAwMCw3IEBACiAJICogVW5mb3J0dW5hdGVseSwgQHpub2RlIGRvZXMg
bm90IGhhdmUgbW9yZSBlbXB0eSBzbG90cyBhbmQgd2UgaGF2ZSB0bwogCSAqIHNwbGl0IGl0Lgog
CSAqLwotCWRiZ190bmMoInNwbGl0dGluZyBsZXZlbCAlZCwga2V5ICVzIiwgem5vZGUtPmxldmVs
LCBEQkdLRVkoa2V5KSk7CisJZGJnX3RuY2soa2V5LCAic3BsaXR0aW5nIGxldmVsICVkLCBrZXkg
Iiwgem5vZGUtPmxldmVsKTsKIAogCWlmICh6bm9kZS0+YWx0KQogCQkvKgpAQCAtMjA5Niw3ICsy
MDk0LDcgQEAKIAl9CiAKIAkvKiBJbnNlcnQgbmV3IGtleSBhbmQgYnJhbmNoICovCi0JZGJnX3Ru
YygiaW5zZXJ0aW5nIGF0ICVkIGxldmVsICVkLCBrZXkgJXMiLCBuLCB6bi0+bGV2ZWwsIERCR0tF
WShrZXkpKTsKKwlkYmdfdG5jayhrZXksICJpbnNlcnRpbmcgYXQgJWQgbGV2ZWwgJWQsIGtleSAi
LCBuLCB6bi0+bGV2ZWwpOwogCiAJaW5zZXJ0X3picmFuY2goemksIHpiciwgbik7CiAKQEAgLTIx
NzIsNyArMjE3MCw3IEBACiAJc3RydWN0IHViaWZzX3pub2RlICp6bm9kZTsKIAogCW11dGV4X2xv
Y2soJmMtPnRuY19tdXRleCk7Ci0JZGJnX3RuYygiJWQ6JWQsIGxlbiAlZCwga2V5ICVzIiwgbG51
bSwgb2ZmcywgbGVuLCBEQkdLRVkoa2V5KSk7CisJZGJnX3RuY2soa2V5LCAiJWQ6JWQsIGxlbiAl
ZCwga2V5ICIsIGxudW0sIG9mZnMsIGxlbik7CiAJZm91bmQgPSBsb29rdXBfbGV2ZWwwX2RpcnR5
KGMsIGtleSwgJnpub2RlLCAmbik7CiAJaWYgKCFmb3VuZCkgewogCQlzdHJ1Y3QgdWJpZnNfemJy
YW5jaCB6YnI7CkBAIC0yMjIxLDggKzIyMTksOCBAQAogCXN0cnVjdCB1Ymlmc196bm9kZSAqem5v
ZGU7CiAKIAltdXRleF9sb2NrKCZjLT50bmNfbXV0ZXgpOwotCWRiZ190bmMoIm9sZCBMRUIgJWQ6
JWQsIG5ldyBMRUIgJWQ6JWQsIGxlbiAlZCwga2V5ICVzIiwgb2xkX2xudW0sCi0JCW9sZF9vZmZz
LCBsbnVtLCBvZmZzLCBsZW4sIERCR0tFWShrZXkpKTsKKwlkYmdfdG5jayhrZXksICJvbGQgTEVC
ICVkOiVkLCBuZXcgTEVCICVkOiVkLCBsZW4gJWQsIGtleSAiLCBvbGRfbG51bSwKKwkJIG9sZF9v
ZmZzLCBsbnVtLCBvZmZzLCBsZW4pOwogCWZvdW5kID0gbG9va3VwX2xldmVsMF9kaXJ0eShjLCBr
ZXksICZ6bm9kZSwgJm4pOwogCWlmIChmb3VuZCA8IDApIHsKIAkJZXJyID0gZm91bmQ7CkBAIC0y
MzA0LDggKzIzMDIsOCBAQAogCXN0cnVjdCB1Ymlmc196bm9kZSAqem5vZGU7CiAKIAltdXRleF9s
b2NrKCZjLT50bmNfbXV0ZXgpOwotCWRiZ190bmMoIkxFQiAlZDolZCwgbmFtZSAnJS4qcycsIGtl
eSAlcyIsIGxudW0sIG9mZnMsIG5tLT5sZW4sIG5tLT5uYW1lLAotCQlEQkdLRVkoa2V5KSk7CisJ
ZGJnX3RuY2soa2V5LCAiTEVCICVkOiVkLCBuYW1lICclLipzJywga2V5ICIsCisJCSBsbnVtLCBv
ZmZzLCBubS0+bGVuLCBubS0+bmFtZSk7CiAJZm91bmQgPSBsb29rdXBfbGV2ZWwwX2RpcnR5KGMs
IGtleSwgJnpub2RlLCAmbik7CiAJaWYgKGZvdW5kIDwgMCkgewogCQllcnIgPSBmb3VuZDsKQEAg
LTIzOTgsMTQgKzIzOTYsMTQgQEAKIAkvKiBEZWxldGUgd2l0aG91dCBtZXJnZSBmb3Igbm93ICov
CiAJdWJpZnNfYXNzZXJ0KHpub2RlLT5sZXZlbCA9PSAwKTsKIAl1Ymlmc19hc3NlcnQobiA+PSAw
ICYmIG4gPCBjLT5mYW5vdXQpOwotCWRiZ190bmMoImRlbGV0aW5nICVzIiwgREJHS0VZKCZ6bm9k
ZS0+emJyYW5jaFtuXS5rZXkpKTsKKwlkYmdfdG5jaygmem5vZGUtPnpicmFuY2hbbl0ua2V5LCAi
ZGVsZXRpbmcga2V5ICIpOwogCiAJemJyID0gJnpub2RlLT56YnJhbmNoW25dOwogCWxuY19mcmVl
KHpicik7CiAKIAllcnIgPSB1Ymlmc19hZGRfZGlydChjLCB6YnItPmxudW0sIHpici0+bGVuKTsK
IAlpZiAoZXJyKSB7Ci0JCWRiZ19kdW1wX3pub2RlKGMsIHpub2RlKTsKKwkJdWJpZnNfZHVtcF96
bm9kZShjLCB6bm9kZSk7CiAJCXJldHVybiBlcnI7CiAJfQogCkBAIC0yNDIzLDcgKzI0MjEsNyBA
QAogCSAqLwogCiAJZG8gewotCQl1Ymlmc19hc3NlcnQoIXRlc3RfYml0KE9CU09MRVRFX1pOT0RF
LCAmem5vZGUtPmZsYWdzKSk7CisJCXViaWZzX2Fzc2VydCghdWJpZnNfem5fb2Jzb2xldGUoem5v
ZGUpKTsKIAkJdWJpZnNfYXNzZXJ0KHViaWZzX3puX2RpcnR5KHpub2RlKSk7CiAKIAkJenAgPSB6
bm9kZS0+cGFyZW50OwpAQCAtMjQ3OSw5ICsyNDc3LDggQEAKIAkJCWMtPnpyb290Lm9mZnMgPSB6
YnItPm9mZnM7CiAJCQljLT56cm9vdC5sZW4gPSB6YnItPmxlbjsKIAkJCWMtPnpyb290Lnpub2Rl
ID0gem5vZGU7Ci0JCQl1Ymlmc19hc3NlcnQoIXRlc3RfYml0KE9CU09MRVRFX1pOT0RFLAotCQkJ
CSAgICAgJnpwLT5mbGFncykpOwotCQkJdWJpZnNfYXNzZXJ0KHRlc3RfYml0KERJUlRZX1pOT0RF
LCAmenAtPmZsYWdzKSk7CisJCQl1Ymlmc19hc3NlcnQoIXViaWZzX3puX29ic29sZXRlKHpwKSk7
CisJCQl1Ymlmc19hc3NlcnQodWJpZnNfem5fZGlydHkoenApKTsKIAkJCWF0b21pY19sb25nX2Rl
YygmYy0+ZGlydHlfem5fY250KTsKIAogCQkJaWYgKHpwLT5jbmV4dCkgewpAQCAtMjUwOSw3ICsy
NTA2LDcgQEAKIAlzdHJ1Y3QgdWJpZnNfem5vZGUgKnpub2RlOwogCiAJbXV0ZXhfbG9jaygmYy0+
dG5jX211dGV4KTsKLQlkYmdfdG5jKCJrZXkgJXMiLCBEQkdLRVkoa2V5KSk7CisJZGJnX3RuY2so
a2V5LCAia2V5ICIpOwogCWZvdW5kID0gbG9va3VwX2xldmVsMF9kaXJ0eShjLCBrZXksICZ6bm9k
ZSwgJm4pOwogCWlmIChmb3VuZCA8IDApIHsKIAkJZXJyID0gZm91bmQ7CkBAIC0yNTQwLDcgKzI1
MzcsNyBAQAogCXN0cnVjdCB1Ymlmc196bm9kZSAqem5vZGU7CiAKIAltdXRleF9sb2NrKCZjLT50
bmNfbXV0ZXgpOwotCWRiZ190bmMoIiUuKnMsIGtleSAlcyIsIG5tLT5sZW4sIG5tLT5uYW1lLCBE
QkdLRVkoa2V5KSk7CisJZGJnX3RuY2soa2V5LCAiJS4qcywga2V5ICIsIG5tLT5sZW4sIG5tLT5u
YW1lKTsKIAllcnIgPSBsb29rdXBfbGV2ZWwwX2RpcnR5KGMsIGtleSwgJnpub2RlLCAmbik7CiAJ
aWYgKGVyciA8IDApCiAJCWdvdG8gb3V0X3VubG9jazsKQEAgLTI2NTIsMTAgKzI2NDksMTAgQEAK
IAkJCWVyciA9IHViaWZzX2FkZF9kaXJ0KGMsIHpub2RlLT56YnJhbmNoW2ldLmxudW0sCiAJCQkJ
CSAgICAgem5vZGUtPnpicmFuY2hbaV0ubGVuKTsKIAkJCWlmIChlcnIpIHsKLQkJCQlkYmdfZHVt
cF96bm9kZShjLCB6bm9kZSk7CisJCQkJdWJpZnNfZHVtcF96bm9kZShjLCB6bm9kZSk7CiAJCQkJ
Z290byBvdXRfdW5sb2NrOwogCQkJfQotCQkJZGJnX3RuYygicmVtb3ZpbmcgJXMiLCBEQkdLRVko
a2V5KSk7CisJCQlkYmdfdG5jayhrZXksICJyZW1vdmluZyBrZXkgIik7CiAJCX0KIAkJaWYgKGsp
IHsKIAkJCWZvciAoaSA9IG4gKyAxICsgazsgaSA8IHpub2RlLT5jaGlsZF9jbnQ7IGkrKykKQEAg
LTI3NzUsNyArMjc3Miw3IEBACiAJc3RydWN0IHViaWZzX3picmFuY2ggKnpicjsKIAl1bmlvbiB1
Ymlmc19rZXkgKmRrZXk7CiAKLQlkYmdfdG5jKCIlcyAlcyIsIG5tLT5uYW1lID8gKGNoYXIgKilu
bS0+bmFtZSA6ICIobG93ZXN0KSIsIERCR0tFWShrZXkpKTsKKwlkYmdfdG5jayhrZXksICIlcyAi
LCBubS0+bmFtZSA/IChjaGFyICopbm0tPm5hbWUgOiAiKGxvd2VzdCkiKTsKIAl1Ymlmc19hc3Nl
cnQoaXNfaGFzaF9rZXkoYywga2V5KSk7CiAKIAltdXRleF9sb2NrKCZjLT50bmNfbXV0ZXgpOwpA
QCAtMjg2NSw3ICsyODYyLDcgQEAKIAkJc3RydWN0IHViaWZzX3pub2RlICp6bm9kZSA9IGNuZXh0
OwogCiAJCWNuZXh0ID0gY25leHQtPmNuZXh0OwotCQlpZiAodGVzdF9iaXQoT0JTT0xFVEVfWk5P
REUsICZ6bm9kZS0+ZmxhZ3MpKQorCQlpZiAodWJpZnNfem5fb2Jzb2xldGUoem5vZGUpKQogCQkJ
a2ZyZWUoem5vZGUpOwogCX0gd2hpbGUgKGNuZXh0ICYmIGNuZXh0ICE9IGMtPmNuZXh0KTsKIH0K
QEAgLTMyNzgsOCArMzI3NSw2IEBACiAJcmV0dXJuIGVycjsKIH0KIAotI2lmZGVmIENPTkZJR19V
QklGU19GU19ERUJVRwotCiAvKioKICAqIGRiZ19jaGVja19pbm9kZV9zaXplIC0gY2hlY2sgaWYg
aW5vZGUgc2l6ZSBpcyBjb3JyZWN0LgogICogQGM6IFVCSUZTIGZpbGUtc3lzdGVtIGRlc2NyaXB0
aW9uIG9iamVjdApAQCAtMzMwMSw3ICszMjk2LDcgQEAKIAogCWlmICghU19JU1JFRyhpbm9kZS0+
aV9tb2RlKSkKIAkJcmV0dXJuIDA7Ci0JaWYgKCEodWJpZnNfY2hrX2ZsYWdzICYgVUJJRlNfQ0hL
X0dFTikpCisJaWYgKCFkYmdfaXNfY2hrX2dlbihjKSkKIAkJcmV0dXJuIDA7CiAKIAlibG9jayA9
IChzaXplICsgVUJJRlNfQkxPQ0tfU0laRSAtIDEpID4+IFVCSUZTX0JMT0NLX1NISUZUOwpAQCAt
MzMzNCwxNiArMzMyOSwxNSBAQAogCiBvdXRfZHVtcDoKIAlibG9jayA9IGtleV9ibG9jayhjLCBr
ZXkpOwotCXViaWZzX2VycigiaW5vZGUgJWx1IGhhcyBzaXplICVsbGQsIGJ1dCB0aGVyZSBhcmUg
ZGF0YSBhdCBvZmZzZXQgJWxsZCAiCi0JCSAgIihkYXRhIGtleSAlcykiLCAodW5zaWduZWQgbG9u
Zylpbm9kZS0+aV9pbm8sIHNpemUsCi0JCSAgKChsb2ZmX3QpYmxvY2spIDw8IFVCSUZTX0JMT0NL
X1NISUZULCBEQkdLRVkoa2V5KSk7Ci0JZGJnX2R1bXBfaW5vZGUoYywgaW5vZGUpOwotCWRiZ19k
dW1wX3N0YWNrKCk7Ci0JZXJyID0gLUVJTlZBTDsKKwl1Ymlmc19lcnIoImlub2RlICVsdSBoYXMg
c2l6ZSAlbGxkLCBidXQgdGhlcmUgYXJlIGRhdGEgYXQgb2Zmc2V0ICVsbGQiLAorCQkgICh1bnNp
Z25lZCBsb25nKWlub2RlLT5pX2lubywgc2l6ZSwKKwkJICAoKGxvZmZfdClibG9jaykgPDwgVUJJ
RlNfQkxPQ0tfU0hJRlQpOworCW11dGV4X3VubG9jaygmYy0+dG5jX211dGV4KTsKKwl1Ymlmc19k
dW1wX2lub2RlKGMsIGlub2RlKTsKKwlkdW1wX3N0YWNrKCk7CisJcmV0dXJuIC1FSU5WQUw7CiAK
IG91dF91bmxvY2s6CiAJbXV0ZXhfdW5sb2NrKCZjLT50bmNfbXV0ZXgpOwogCXJldHVybiBlcnI7
CiB9Ci0KLSNlbmRpZiAvKiBDT05GSUdfVUJJRlNfRlNfREVCVUcgKi8KZGlmZiAtdU4gLXVOciBs
aW51eC0zLjAvZnMvdWJpZnMvdG5jX2NvbW1pdC5jIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9m
cy91Ymlmcy90bmNfY29tbWl0LmMKLS0tIGxpbnV4LTMuMC9mcy91Ymlmcy90bmNfY29tbWl0LmMJ
MjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZz
LmxhdGVzdC9mcy91Ymlmcy90bmNfY29tbWl0LmMJMjAxMi0wNi0yOCAxMToyNjoxNS4wMDAwMDAw
MDAgLTA1MDAKQEAgLTIyLDYgKzIyLDcgQEAKIAogLyogVGhpcyBmaWxlIGltcGxlbWVudHMgVE5D
IGZ1bmN0aW9ucyBmb3IgY29tbWl0dGluZyAqLwogCisjaW5jbHVkZSA8bGludXgvcmFuZG9tLmg+
CiAjaW5jbHVkZSAidWJpZnMuaCIKIAogLyoqCkBAIC01MywxOCArNTQsMTYgQEAKIAkJYnItPmxl
biA9IGNwdV90b19sZTMyKHpici0+bGVuKTsKIAkJaWYgKCF6YnItPmxudW0gfHwgIXpici0+bGVu
KSB7CiAJCQl1Ymlmc19lcnIoImJhZCByZWYgaW4gem5vZGUiKTsKLQkJCWRiZ19kdW1wX3pub2Rl
KGMsIHpub2RlKTsKKwkJCXViaWZzX2R1bXBfem5vZGUoYywgem5vZGUpOwogCQkJaWYgKHpici0+
em5vZGUpCi0JCQkJZGJnX2R1bXBfem5vZGUoYywgemJyLT56bm9kZSk7CisJCQkJdWJpZnNfZHVt
cF96bm9kZShjLCB6YnItPnpub2RlKTsKIAkJfQogCX0KIAl1Ymlmc19wcmVwYXJlX25vZGUoYywg
aWR4LCBsZW4sIDApOwogCi0jaWZkZWYgQ09ORklHX1VCSUZTX0ZTX0RFQlVHCiAJem5vZGUtPmxu
dW0gPSBsbnVtOwogCXpub2RlLT5vZmZzID0gb2ZmczsKIAl6bm9kZS0+bGVuID0gbGVuOwotI2Vu
ZGlmCiAKIAllcnIgPSBpbnNlcnRfb2xkX2lkeF96bm9kZShjLCB6bm9kZSk7CiAKQEAgLTg3LDgg
Kzg2LDEyIEBACiAJYXRvbWljX2xvbmdfZGVjKCZjLT5kaXJ0eV96bl9jbnQpOwogCiAJdWJpZnNf
YXNzZXJ0KHViaWZzX3puX2RpcnR5KHpub2RlKSk7Ci0JdWJpZnNfYXNzZXJ0KHRlc3RfYml0KENP
V19aTk9ERSwgJnpub2RlLT5mbGFncykpOworCXViaWZzX2Fzc2VydCh1Ymlmc196bl9jb3coem5v
ZGUpKTsKIAorCS8qCisJICogTm90ZSwgdW5saWtlICd3cml0ZV9pbmRleCgpJyB3ZSBkbyBub3Qg
YWRkIG1lbW9yeSBiYXJyaWVycyBoZXJlCisJICogYmVjYXVzZSB0aGlzIGZ1bmN0aW9uIGlzIGNh
bGxlZCB3aXRoIEBjLT50bmNfbXV0ZXggbG9ja2VkLgorCSAqLwogCV9fY2xlYXJfYml0KERJUlRZ
X1pOT0RFLCAmem5vZGUtPmZsYWdzKTsKIAlfX2NsZWFyX2JpdChDT1dfWk5PREUsICZ6bm9kZS0+
ZmxhZ3MpOwogCkBAIC0zMTcsOCArMzIwLDcgQEAKIAkJCQkgIDAsIDAsIDApOwogCWlmIChlcnIp
CiAJCXJldHVybiBlcnI7Ci0JZXJyID0gdWJpZnNfbGViX2NoYW5nZShjLCBsbnVtLCBjLT5pbGVi
X2J1ZiwgYy0+aWxlYl9sZW4sCi0JCQkgICAgICAgVUJJX1NIT1JUVEVSTSk7CisJZXJyID0gdWJp
ZnNfbGViX2NoYW5nZShjLCBsbnVtLCBjLT5pbGViX2J1ZiwgYy0+aWxlYl9sZW4pOwogCWlmIChl
cnIpCiAJCXJldHVybiBlcnI7CiAJZGJnX2djKCJMRUIgJWQgd3JvdGUgJWQgaW5kZXggbm9kZXMi
LCBsbnVtLCB0b3Rfd3JpdHRlbik7CkBAIC0zNzcsMTQgKzM3OSwxNCBAQAogCQkJCWMtPmdhcF9s
ZWJzID0gTlVMTDsKIAkJCQlyZXR1cm4gZXJyOwogCQkJfQotCQkJaWYgKGRiZ19mb3JjZV9pbl90
aGVfZ2Fwc19lbmFibGVkKCkpIHsKKwkJCWlmICghZGJnX2lzX2Noa19pbmRleChjKSkgewogCQkJ
CS8qCiAJCQkJICogRG8gbm90IHByaW50IHNjYXJ5IHdhcm5pbmdzIGlmIHRoZSBkZWJ1Z2dpbmcK
IAkJCQkgKiBvcHRpb24gd2hpY2ggZm9yY2VzIGluLXRoZS1nYXBzIGlzIGVuYWJsZWQuCiAJCQkJ
ICovCiAJCQkJdWJpZnNfd2Fybigib3V0IG9mIHNwYWNlIik7Ci0JCQkJZGJnX2R1bXBfYnVkZyhj
LCAmYy0+YmkpOwotCQkJCWRiZ19kdW1wX2xwcm9wcyhjKTsKKwkJCQl1Ymlmc19kdW1wX2J1ZGco
YywgJmMtPmJpKTsKKwkJCQl1Ymlmc19kdW1wX2xwcm9wcyhjKTsKIAkJCX0KIAkJCS8qIFRyeSB0
byBjb21taXQgYW55d2F5ICovCiAJCQllcnIgPSAwOwpAQCAtNDUxLDExICs0NTMsOSBAQAogCiAJ
CW9mZnMgPSBidWZfb2ZmcyArIHVzZWQ7CiAKLSNpZmRlZiBDT05GSUdfVUJJRlNfRlNfREVCVUcK
IAkJem5vZGUtPmxudW0gPSBsbnVtOwogCQl6bm9kZS0+b2ZmcyA9IG9mZnM7CiAJCXpub2RlLT5s
ZW4gPSBsZW47Ci0jZW5kaWYKIAogCQkvKiBVcGRhdGUgdGhlIHBhcmVudCAqLwogCQl6cCA9IHpu
b2RlLT5wYXJlbnQ7CkBAIC00OTEsMjUgKzQ5MSw2IEBACiAJCWVsc2UKIAkJCW5leHRfbGVuID0g
dWJpZnNfaWR4X25vZGVfc3ooYywgY25leHQtPmNoaWxkX2NudCk7CiAKLQkJaWYgKGMtPm1pbl9p
b19zaXplID09IDEpIHsKLQkJCWJ1Zl9vZmZzICs9IEFMSUdOKGxlbiwgOCk7Ci0JCQlpZiAobmV4
dF9sZW4pIHsKLQkJCQlpZiAoYnVmX29mZnMgKyBuZXh0X2xlbiA8PSBjLT5sZWJfc2l6ZSkKLQkJ
CQkJY29udGludWU7Ci0JCQkJZXJyID0gdWJpZnNfdXBkYXRlX29uZV9scChjLCBsbnVtLCAwLAot
CQkJCQkJYy0+bGViX3NpemUgLSBidWZfb2ZmcywgMCwgMCk7Ci0JCQkJaWYgKGVycikKLQkJCQkJ
cmV0dXJuIGVycjsKLQkJCQlsbnVtID0gLTE7Ci0JCQkJY29udGludWU7Ci0JCQl9Ci0JCQllcnIg
PSB1Ymlmc191cGRhdGVfb25lX2xwKGMsIGxudW0sCi0JCQkJCWMtPmxlYl9zaXplIC0gYnVmX29m
ZnMsIDAsIDAsIDApOwotCQkJaWYgKGVycikKLQkJCQlyZXR1cm4gZXJyOwotCQkJYnJlYWs7Ci0J
CX0KLQogCQkvKiBVcGRhdGUgYnVmZmVyIHBvc2l0aW9ucyAqLwogCQl3bGVuID0gdXNlZCArIGxl
bjsKIAkJdXNlZCArPSBBTElHTihsZW4sIDgpOwpAQCAtNTUwLDEwICs1MzEsOCBAQAogCQlicmVh
azsKIAl9CiAKLSNpZmRlZiBDT05GSUdfVUJJRlNfRlNfREVCVUcKIAljLT5kYmctPm5ld19paGVh
ZF9sbnVtID0gbG51bTsKIAljLT5kYmctPm5ld19paGVhZF9vZmZzID0gYnVmX29mZnM7Ci0jZW5k
aWYKIAogCXJldHVybiAwOwogfQpAQCAtNjU4LDcgKzYzNyw3IEBACiAJfQogCWNudCArPSAxOwog
CXdoaWxlICgxKSB7Ci0JCXViaWZzX2Fzc2VydCghdGVzdF9iaXQoQ09XX1pOT0RFLCAmem5vZGUt
PmZsYWdzKSk7CisJCXViaWZzX2Fzc2VydCghdWJpZnNfem5fY293KHpub2RlKSk7CiAJCV9fc2V0
X2JpdChDT1dfWk5PREUsICZ6bm9kZS0+ZmxhZ3MpOwogCQl6bm9kZS0+YWx0ID0gMDsKIAkJY25l
eHQgPSBmaW5kX25leHRfZGlydHkoem5vZGUpOwpAQCAtNzA0LDcgKzY4Myw3IEBACiAJCWMtPmls
ZWJzW2MtPmlsZWJfY250KytdID0gbG51bTsKIAkJZGJnX2NtdCgiTEVCICVkIiwgbG51bSk7CiAJ
fQotCWlmIChkYmdfZm9yY2VfaW5fdGhlX2dhcHMoKSkKKwlpZiAoZGJnX2lzX2Noa19pbmRleChj
KSAmJiAhKHJhbmRvbTMyKCkgJiA3KSkKIAkJcmV0dXJuIC1FTk9TUEM7CiAJcmV0dXJuIDA7CiB9
CkBAIC04MzAsNyArODA5LDcgQEAKIAlzdHJ1Y3QgdWJpZnNfaWR4X25vZGUgKmlkeDsKIAlzdHJ1
Y3QgdWJpZnNfem5vZGUgKnpub2RlLCAqY25leHQ7CiAJaW50IGksIGxudW0sIG9mZnMsIGxlbiwg
bmV4dF9sZW4sIGJ1Zl9sZW4sIGJ1Zl9vZmZzLCB1c2VkOwotCWludCBhdmFpbCwgd2xlbiwgZXJy
LCBsbnVtX3BvcyA9IDA7CisJaW50IGF2YWlsLCB3bGVuLCBlcnIsIGxudW1fcG9zID0gMCwgYmxl
biwgbnh0X29mZnM7CiAKIAljbmV4dCA9IGMtPmVuZXh0OwogCWlmICghY25leHQpCkBAIC04Nzgs
OSArODU3LDkgQEAKIAkJCWJyLT5sZW4gPSBjcHVfdG9fbGUzMih6YnItPmxlbik7CiAJCQlpZiAo
IXpici0+bG51bSB8fCAhemJyLT5sZW4pIHsKIAkJCQl1Ymlmc19lcnIoImJhZCByZWYgaW4gem5v
ZGUiKTsKLQkJCQlkYmdfZHVtcF96bm9kZShjLCB6bm9kZSk7CisJCQkJdWJpZnNfZHVtcF96bm9k
ZShjLCB6bm9kZSk7CiAJCQkJaWYgKHpici0+em5vZGUpCi0JCQkJCWRiZ19kdW1wX3pub2RlKGMs
IHpici0+em5vZGUpOworCQkJCQl1Ymlmc19kdW1wX3pub2RlKGMsIHpici0+em5vZGUpOwogCQkJ
fQogCQl9CiAJCWxlbiA9IHViaWZzX2lkeF9ub2RlX3N6KGMsIHpub2RlLT5jaGlsZF9jbnQpOwpA
QCAtODk1LDE5ICs4NzQsMTcgQEAKIAkJfQogCQlvZmZzID0gYnVmX29mZnMgKyB1c2VkOwogCi0j
aWZkZWYgQ09ORklHX1VCSUZTX0ZTX0RFQlVHCiAJCWlmIChsbnVtICE9IHpub2RlLT5sbnVtIHx8
IG9mZnMgIT0gem5vZGUtPm9mZnMgfHwKIAkJICAgIGxlbiAhPSB6bm9kZS0+bGVuKSB7CiAJCQl1
Ymlmc19lcnIoImluY29uc2lzdGVudCB6bm9kZSBwb3NuIik7CiAJCQlyZXR1cm4gLUVJTlZBTDsK
IAkJfQotI2VuZGlmCiAKIAkJLyogR3JhYiBzb21lIHN0dWZmIGZyb20gem5vZGUgd2hpbGUgd2Ug
c3RpbGwgY2FuICovCiAJCWNuZXh0ID0gem5vZGUtPmNuZXh0OwogCiAJCXViaWZzX2Fzc2VydCh1
Ymlmc196bl9kaXJ0eSh6bm9kZSkpOwotCQl1Ymlmc19hc3NlcnQodGVzdF9iaXQoQ09XX1pOT0RF
LCAmem5vZGUtPmZsYWdzKSk7CisJCXViaWZzX2Fzc2VydCh1Ymlmc196bl9jb3coem5vZGUpKTsK
IAogCQkvKgogCQkgKiBJdCBpcyBpbXBvcnRhbnQgdGhhdCBvdGhlciB0aHJlYWRzIHNob3VsZCBz
ZWUgJURJUlRZX1pOT0RFCkBAIC05MjIsNiArODk5LDI4IEBACiAJCWNsZWFyX2JpdChDT1dfWk5P
REUsICZ6bm9kZS0+ZmxhZ3MpOwogCQlzbXBfbWJfX2FmdGVyX2NsZWFyX2JpdCgpOwogCisJCS8q
CisJCSAqIFdlIGhhdmUgbWFya2VkIHRoZSB6bm9kZSBhcyBjbGVhbiBidXQgaGF2ZSBub3QgdXBk
YXRlZCB0aGUKKwkJICogQGMtPmNsZWFuX3puX2NudCBjb3VudGVyLiBJZiB0aGlzIHpub2RlIGJl
Y29tZXMgZGlydHkgYWdhaW4KKwkJICogYmVmb3JlICdmcmVlX29ic29sZXRlX3pub2RlcygpJyBp
cyBjYWxsZWQsIHRoZW4KKwkJICogQGMtPmNsZWFuX3puX2NudCB3aWxsIGJlIGRlY3JlbWVudGVk
IGJlZm9yZSBpdCBnZXRzCisJCSAqIGluY3JlbWVudGVkIChyZXN1bHRpbmcgaW4gMiBkZWNyZW1l
bnRzIGZvciB0aGUgc2FtZSB6bm9kZSkuCisJCSAqIFRoaXMgbWVhbnMgdGhhdCBAYy0+Y2xlYW5f
em5fY250IG1heSBiZWNvbWUgbmVnYXRpdmUgZm9yIGEKKwkJICogd2hpbGUuCisJCSAqCisJCSAq
IFE6IHdoeSB3ZSBjYW5ub3QgaW5jcmVtZW50IEBjLT5jbGVhbl96bl9jbnQ/CisJCSAqIEE6IGJl
Y2F1c2Ugd2UgZG8gbm90IGhhdmUgdGhlIEBjLT50bmNfbXV0ZXggbG9ja2VkLCBhbmQgdGhlCisJ
CSAqICAgIGZvbGxvd2luZyBjb2RlIHdvdWxkIGJlIHJhY3kgYW5kIGJ1Z2d5OgorCQkgKgorCQkg
KiAgICBpZiAoIXViaWZzX3puX29ic29sZXRlKHpub2RlKSkgeworCQkgKiAgICAgICAgICAgIGF0
b21pY19sb25nX2luYygmYy0+Y2xlYW5fem5fY250KTsKKwkJICogICAgICAgICAgICBhdG9taWNf
bG9uZ19pbmMoJnViaWZzX2NsZWFuX3puX2NudCk7CisJCSAqICAgIH0KKwkJICoKKwkJICogICAg
VGh1cywgd2UganVzdCBkZWxheSB0aGUgQGMtPmNsZWFuX3puX2NudCB1cGRhdGUgdW50aWwgd2UK
KwkJICogICAgaGF2ZSB0aGUgbXV0ZXggbG9ja2VkLgorCQkgKi8KKwogCQkvKiBEbyBub3QgYWNj
ZXNzIHpub2RlIGZyb20gdGhpcyBwb2ludCBvbiAqLwogCiAJCS8qIFVwZGF0ZSBidWZmZXIgcG9z
aXRpb25zICovCkBAIC05MzgsNzYgKzkzNyw0NiBAQAogCQllbHNlCiAJCQluZXh0X2xlbiA9IHVi
aWZzX2lkeF9ub2RlX3N6KGMsIGNuZXh0LT5jaGlsZF9jbnQpOwogCi0JCWlmIChjLT5taW5faW9f
c2l6ZSA9PSAxKSB7Ci0JCQkvKgotCQkJICogV3JpdGUgdGhlIHByZXBhcmVkIGluZGV4IG5vZGUg
aW1tZWRpYXRlbHkgaWYgdGhlcmUgaXMKLQkJCSAqIG5vIG1pbmltdW0gSU8gc2l6ZQotCQkJICov
Ci0JCQllcnIgPSB1Ymlmc19sZWJfd3JpdGUoYywgbG51bSwgYy0+Y2J1ZiwgYnVmX29mZnMsCi0J
CQkJCSAgICAgIHdsZW4sIFVCSV9TSE9SVFRFUk0pOwotCQkJaWYgKGVycikKLQkJCQlyZXR1cm4g
ZXJyOwotCQkJYnVmX29mZnMgKz0gQUxJR04od2xlbiwgOCk7Ci0JCQlpZiAobmV4dF9sZW4pIHsK
LQkJCQl1c2VkID0gMDsKLQkJCQlhdmFpbCA9IGJ1Zl9sZW47Ci0JCQkJaWYgKGJ1Zl9vZmZzICsg
bmV4dF9sZW4gPiBjLT5sZWJfc2l6ZSkgewotCQkJCQllcnIgPSB1Ymlmc191cGRhdGVfb25lX2xw
KGMsIGxudW0sCi0JCQkJCQlMUFJPUFNfTkMsIDAsIDAsIExQUk9QU19UQUtFTik7Ci0JCQkJCWlm
IChlcnIpCi0JCQkJCQlyZXR1cm4gZXJyOwotCQkJCQlsbnVtID0gLTE7Ci0JCQkJfQorCQlueHRf
b2ZmcyA9IGJ1Zl9vZmZzICsgdXNlZCArIG5leHRfbGVuOworCQlpZiAobmV4dF9sZW4gJiYgbnh0
X29mZnMgPD0gYy0+bGViX3NpemUpIHsKKwkJCWlmIChhdmFpbCA+IDApCiAJCQkJY29udGludWU7
Ci0JCQl9CisJCQllbHNlCisJCQkJYmxlbiA9IGJ1Zl9sZW47CiAJCX0gZWxzZSB7Ci0JCQlpbnQg
Ymxlbiwgbnh0X29mZnMgPSBidWZfb2ZmcyArIHVzZWQgKyBuZXh0X2xlbjsKKwkJCXdsZW4gPSBB
TElHTih3bGVuLCA4KTsKKwkJCWJsZW4gPSBBTElHTih3bGVuLCBjLT5taW5faW9fc2l6ZSk7CisJ
CQl1Ymlmc19wYWQoYywgYy0+Y2J1ZiArIHdsZW4sIGJsZW4gLSB3bGVuKTsKKwkJfQogCi0JCQlp
ZiAobmV4dF9sZW4gJiYgbnh0X29mZnMgPD0gYy0+bGViX3NpemUpIHsKLQkJCQlpZiAoYXZhaWwg
PiAwKQotCQkJCQljb250aW51ZTsKLQkJCQllbHNlCi0JCQkJCWJsZW4gPSBidWZfbGVuOwotCQkJ
fSBlbHNlIHsKLQkJCQl3bGVuID0gQUxJR04od2xlbiwgOCk7Ci0JCQkJYmxlbiA9IEFMSUdOKHds
ZW4sIGMtPm1pbl9pb19zaXplKTsKLQkJCQl1Ymlmc19wYWQoYywgYy0+Y2J1ZiArIHdsZW4sIGJs
ZW4gLSB3bGVuKTsKLQkJCX0KLQkJCS8qCi0JCQkgKiBUaGUgYnVmZmVyIGlzIGZ1bGwgb3IgdGhl
cmUgYXJlIG5vIG1vcmUgem5vZGVzCi0JCQkgKiB0byBkbwotCQkJICovCi0JCQllcnIgPSB1Ymlm
c19sZWJfd3JpdGUoYywgbG51bSwgYy0+Y2J1ZiwgYnVmX29mZnMsCi0JCQkJCSAgICAgIGJsZW4s
IFVCSV9TSE9SVFRFUk0pOwotCQkJaWYgKGVycikKLQkJCQlyZXR1cm4gZXJyOwotCQkJYnVmX29m
ZnMgKz0gYmxlbjsKLQkJCWlmIChuZXh0X2xlbikgewotCQkJCWlmIChueHRfb2ZmcyA+IGMtPmxl
Yl9zaXplKSB7Ci0JCQkJCWVyciA9IHViaWZzX3VwZGF0ZV9vbmVfbHAoYywgbG51bSwKLQkJCQkJ
CUxQUk9QU19OQywgMCwgMCwgTFBST1BTX1RBS0VOKTsKLQkJCQkJaWYgKGVycikKLQkJCQkJCXJl
dHVybiBlcnI7Ci0JCQkJCWxudW0gPSAtMTsKLQkJCQl9Ci0JCQkJdXNlZCAtPSBibGVuOwotCQkJ
CWlmICh1c2VkIDwgMCkKLQkJCQkJdXNlZCA9IDA7Ci0JCQkJYXZhaWwgPSBidWZfbGVuIC0gdXNl
ZDsKLQkJCQltZW1tb3ZlKGMtPmNidWYsIGMtPmNidWYgKyBibGVuLCB1c2VkKTsKLQkJCQljb250
aW51ZTsKKwkJLyogVGhlIGJ1ZmZlciBpcyBmdWxsIG9yIHRoZXJlIGFyZSBubyBtb3JlIHpub2Rl
cyB0byBkbyAqLworCQllcnIgPSB1Ymlmc19sZWJfd3JpdGUoYywgbG51bSwgYy0+Y2J1ZiwgYnVm
X29mZnMsIGJsZW4pOworCQlpZiAoZXJyKQorCQkJcmV0dXJuIGVycjsKKwkJYnVmX29mZnMgKz0g
YmxlbjsKKwkJaWYgKG5leHRfbGVuKSB7CisJCQlpZiAobnh0X29mZnMgPiBjLT5sZWJfc2l6ZSkg
eworCQkJCWVyciA9IHViaWZzX3VwZGF0ZV9vbmVfbHAoYywgbG51bSwgTFBST1BTX05DLCAwLAor
CQkJCQkJCSAgMCwgTFBST1BTX1RBS0VOKTsKKwkJCQlpZiAoZXJyKQorCQkJCQlyZXR1cm4gZXJy
OworCQkJCWxudW0gPSAtMTsKIAkJCX0KKwkJCXVzZWQgLT0gYmxlbjsKKwkJCWlmICh1c2VkIDwg
MCkKKwkJCQl1c2VkID0gMDsKKwkJCWF2YWlsID0gYnVmX2xlbiAtIHVzZWQ7CisJCQltZW1tb3Zl
KGMtPmNidWYsIGMtPmNidWYgKyBibGVuLCB1c2VkKTsKKwkJCWNvbnRpbnVlOwogCQl9CiAJCWJy
ZWFrOwogCX0KIAotI2lmZGVmIENPTkZJR19VQklGU19GU19ERUJVRwogCWlmIChsbnVtICE9IGMt
PmRiZy0+bmV3X2loZWFkX2xudW0gfHwKIAkgICAgYnVmX29mZnMgIT0gYy0+ZGJnLT5uZXdfaWhl
YWRfb2ZmcykgewogCQl1Ymlmc19lcnIoImluY29uc2lzdGVudCBpaGVhZCIpOwogCQlyZXR1cm4g
LUVJTlZBTDsKIAl9Ci0jZW5kaWYKIAogCWMtPmloZWFkX2xudW0gPSBsbnVtOwogCWMtPmloZWFk
X29mZnMgPSBidWZfb2ZmczsKQEAgLTEwMjksNyArOTk4LDcgQEAKIAlkbyB7CiAJCXpub2RlID0g
Y25leHQ7CiAJCWNuZXh0ID0gem5vZGUtPmNuZXh0OwotCQlpZiAodGVzdF9iaXQoT0JTT0xFVEVf
Wk5PREUsICZ6bm9kZS0+ZmxhZ3MpKQorCQlpZiAodWJpZnNfem5fb2Jzb2xldGUoem5vZGUpKQog
CQkJa2ZyZWUoem5vZGUpOwogCQllbHNlIHsKIAkJCXpub2RlLT5jbmV4dCA9IE5VTEw7CmRpZmYg
LXVOIC11TnIgbGludXgtMy4wL2ZzL3ViaWZzL3RuY19taXNjLmMgbGludXgtMy4wLngudWJpZnMu
bGF0ZXN0L2ZzL3ViaWZzL3RuY19taXNjLmMKLS0tIGxpbnV4LTMuMC9mcy91Ymlmcy90bmNfbWlz
Yy5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51
Ymlmcy5sYXRlc3QvZnMvdWJpZnMvdG5jX21pc2MuYwkyMDEyLTA2LTI4IDExOjI2OjE1LjAwMDAw
MDAwMCAtMDUwMApAQCAtMjkzLDEwICsyOTMsMTAgQEAKIAkJbG51bSwgb2Zmcywgem5vZGUtPmxl
dmVsLCB6bm9kZS0+Y2hpbGRfY250KTsKIAogCWlmICh6bm9kZS0+Y2hpbGRfY250ID4gYy0+ZmFu
b3V0IHx8IHpub2RlLT5sZXZlbCA+IFVCSUZTX01BWF9MRVZFTFMpIHsKLQkJZGJnX2VycigiY3Vy
cmVudCBmYW5vdXQgJWQsIGJyYW5jaCBjb3VudCAlZCIsCi0JCQljLT5mYW5vdXQsIHpub2RlLT5j
aGlsZF9jbnQpOwotCQlkYmdfZXJyKCJtYXggbGV2ZWxzICVkLCB6bm9kZSBsZXZlbCAlZCIsCi0J
CQlVQklGU19NQVhfTEVWRUxTLCB6bm9kZS0+bGV2ZWwpOworCQl1Ymlmc19lcnIoImN1cnJlbnQg
ZmFub3V0ICVkLCBicmFuY2ggY291bnQgJWQiLAorCQkJICBjLT5mYW5vdXQsIHpub2RlLT5jaGls
ZF9jbnQpOworCQl1Ymlmc19lcnIoIm1heCBsZXZlbHMgJWQsIHpub2RlIGxldmVsICVkIiwKKwkJ
CSAgVUJJRlNfTUFYX0xFVkVMUywgem5vZGUtPmxldmVsKTsKIAkJZXJyID0gMTsKIAkJZ290byBv
dXRfZHVtcDsKIAl9CkBAIC0zMTYsNyArMzE2LDcgQEAKIAkJaWYgKHpici0+bG51bSA8IGMtPm1h
aW5fZmlyc3QgfHwKIAkJICAgIHpici0+bG51bSA+PSBjLT5sZWJfY250IHx8IHpici0+b2ZmcyA8
IDAgfHwKIAkJICAgIHpici0+b2ZmcyArIHpici0+bGVuID4gYy0+bGViX3NpemUgfHwgemJyLT5v
ZmZzICYgNykgewotCQkJZGJnX2VycigiYmFkIGJyYW5jaCAlZCIsIGkpOworCQkJdWJpZnNfZXJy
KCJiYWQgYnJhbmNoICVkIiwgaSk7CiAJCQllcnIgPSAyOwogCQkJZ290byBvdXRfZHVtcDsKIAkJ
fQpAQCAtMzI4LDggKzMyOCw4IEBACiAJCWNhc2UgVUJJRlNfWEVOVF9LRVk6CiAJCQlicmVhazsK
IAkJZGVmYXVsdDoKLQkJCWRiZ19tc2coImJhZCBrZXkgdHlwZSBhdCBzbG90ICVkOiAlcyIsIGks
Ci0JCQkJREJHS0VZKCZ6YnItPmtleSkpOworCQkJZGJnX21zZygiYmFkIGtleSB0eXBlIGF0IHNs
b3QgJWQ6ICVkIiwKKwkJCQlpLCBrZXlfdHlwZShjLCAmemJyLT5rZXkpKTsKIAkJCWVyciA9IDM7
CiAJCQlnb3RvIG91dF9kdW1wOwogCQl9CkBAIC0zNDAsMTkgKzM0MCwxOSBAQAogCQl0eXBlID0g
a2V5X3R5cGUoYywgJnpici0+a2V5KTsKIAkJaWYgKGMtPnJhbmdlc1t0eXBlXS5tYXhfbGVuID09
IDApIHsKIAkJCWlmICh6YnItPmxlbiAhPSBjLT5yYW5nZXNbdHlwZV0ubGVuKSB7Ci0JCQkJZGJn
X2VycigiYmFkIHRhcmdldCBub2RlICh0eXBlICVkKSBsZW5ndGggKCVkKSIsCi0JCQkJCXR5cGUs
IHpici0+bGVuKTsKLQkJCQlkYmdfZXJyKCJoYXZlIHRvIGJlICVkIiwgYy0+cmFuZ2VzW3R5cGVd
Lmxlbik7CisJCQkJdWJpZnNfZXJyKCJiYWQgdGFyZ2V0IG5vZGUgKHR5cGUgJWQpIGxlbmd0aCAo
JWQpIiwKKwkJCQkJICB0eXBlLCB6YnItPmxlbik7CisJCQkJdWJpZnNfZXJyKCJoYXZlIHRvIGJl
ICVkIiwgYy0+cmFuZ2VzW3R5cGVdLmxlbik7CiAJCQkJZXJyID0gNDsKIAkJCQlnb3RvIG91dF9k
dW1wOwogCQkJfQogCQl9IGVsc2UgaWYgKHpici0+bGVuIDwgYy0+cmFuZ2VzW3R5cGVdLm1pbl9s
ZW4gfHwKIAkJCSAgIHpici0+bGVuID4gYy0+cmFuZ2VzW3R5cGVdLm1heF9sZW4pIHsKLQkJCWRi
Z19lcnIoImJhZCB0YXJnZXQgbm9kZSAodHlwZSAlZCkgbGVuZ3RoICglZCkiLAotCQkJCXR5cGUs
IHpici0+bGVuKTsKLQkJCWRiZ19lcnIoImhhdmUgdG8gYmUgaW4gcmFuZ2Ugb2YgJWQtJWQiLAot
CQkJCWMtPnJhbmdlc1t0eXBlXS5taW5fbGVuLAotCQkJCWMtPnJhbmdlc1t0eXBlXS5tYXhfbGVu
KTsKKwkJCXViaWZzX2VycigiYmFkIHRhcmdldCBub2RlICh0eXBlICVkKSBsZW5ndGggKCVkKSIs
CisJCQkJICB0eXBlLCB6YnItPmxlbik7CisJCQl1Ymlmc19lcnIoImhhdmUgdG8gYmUgaW4gcmFu
Z2Ugb2YgJWQtJWQiLAorCQkJCSAgYy0+cmFuZ2VzW3R5cGVdLm1pbl9sZW4sCisJCQkJICBjLT5y
YW5nZXNbdHlwZV0ubWF4X2xlbik7CiAJCQllcnIgPSA1OwogCQkJZ290byBvdXRfZHVtcDsKIAkJ
fQpAQCAtMzcwLDEzICszNzAsMTMgQEAKIAogCQljbXAgPSBrZXlzX2NtcChjLCBrZXkxLCBrZXky
KTsKIAkJaWYgKGNtcCA+IDApIHsKLQkJCWRiZ19lcnIoImJhZCBrZXkgb3JkZXIgKGtleXMgJWQg
YW5kICVkKSIsIGksIGkgKyAxKTsKKwkJCXViaWZzX2VycigiYmFkIGtleSBvcmRlciAoa2V5cyAl
ZCBhbmQgJWQpIiwgaSwgaSArIDEpOwogCQkJZXJyID0gNjsKIAkJCWdvdG8gb3V0X2R1bXA7CiAJ
CX0gZWxzZSBpZiAoY21wID09IDAgJiYgIWlzX2hhc2hfa2V5KGMsIGtleTEpKSB7CiAJCQkvKiBU
aGVzZSBjYW4gb25seSBiZSBrZXlzIHdpdGggY29sbGlkaW5nIGhhc2ggKi8KLQkJCWRiZ19lcnIo
ImtleXMgJWQgYW5kICVkIGFyZSBub3QgaGFzaGVkIGJ1dCBlcXVpdmFsZW50IiwKLQkJCQlpLCBp
ICsgMSk7CisJCQl1Ymlmc19lcnIoImtleXMgJWQgYW5kICVkIGFyZSBub3QgaGFzaGVkIGJ1dCBl
cXVpdmFsZW50IiwKKwkJCQkgIGksIGkgKyAxKTsKIAkJCWVyciA9IDc7CiAJCQlnb3RvIG91dF9k
dW1wOwogCQl9CkBAIC0zODcsNyArMzg3LDcgQEAKIAogb3V0X2R1bXA6CiAJdWJpZnNfZXJyKCJi
YWQgaW5kZXhpbmcgbm9kZSBhdCBMRUIgJWQ6JWQsIGVycm9yICVkIiwgbG51bSwgb2ZmcywgZXJy
KTsKLQlkYmdfZHVtcF9ub2RlKGMsIGlkeCk7CisJdWJpZnNfZHVtcF9ub2RlKGMsIGlkeCk7CiAJ
a2ZyZWUoaWR4KTsKIAlyZXR1cm4gLUVJTlZBTDsKIH0KQEAgLTQ3NSw3ICs0NzUsNyBAQAogCQkJ
CSAgICAgIHpici0+b2Zmcyk7CiAKIAlpZiAoZXJyKSB7Ci0JCWRiZ190bmMoImtleSAlcyIsIERC
R0tFWShrZXkpKTsKKwkJZGJnX3RuY2soa2V5LCAia2V5ICIpOwogCQlyZXR1cm4gZXJyOwogCX0K
IApAQCAtNDg0LDkgKzQ4NCw5IEBACiAJaWYgKCFrZXlzX2VxKGMsIGtleSwgJmtleTEpKSB7CiAJ
CXViaWZzX2VycigiYmFkIGtleSBpbiBub2RlIGF0IExFQiAlZDolZCIsCiAJCQkgIHpici0+bG51
bSwgemJyLT5vZmZzKTsKLQkJZGJnX3RuYygibG9va2VkIGZvciBrZXkgJXMgZm91bmQgbm9kZSdz
IGtleSAlcyIsCi0JCQlEQkdLRVkoa2V5KSwgREJHS0VZMSgma2V5MSkpOwotCQlkYmdfZHVtcF9u
b2RlKGMsIG5vZGUpOworCQlkYmdfdG5jayhrZXksICJsb29rZWQgZm9yIGtleSAiKTsKKwkJZGJn
X3RuY2soJmtleTEsICJidXQgZm91bmQgbm9kZSdzIGtleSAiKTsKKwkJdWJpZnNfZHVtcF9ub2Rl
KGMsIG5vZGUpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKZGlmZiAtdU4gLXVOciBsaW51eC0z
LjAvZnMvdWJpZnMvdWJpZnMuaCBsaW51eC0zLjAueC51Ymlmcy5sYXRlc3QvZnMvdWJpZnMvdWJp
ZnMuaAotLS0gbGludXgtMy4wL2ZzL3ViaWZzL3ViaWZzLmgJMjAxMS0wNy0yMSAyMToxNzoyMy4w
MDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTMuMC54LnViaWZzLmxhdGVzdC9mcy91Ymlmcy91Ymlm
cy5oCTIwMTItMDYtMjggMTE6MjY6MTUuMDAwMDAwMDAwIC0wNTAwCkBAIC04NCw5ICs4NCw2IEBA
CiAjZGVmaW5lIElOVU1fV0FSTl9XQVRFUk1BUksgMHhGRkYwMDAwMAogI2RlZmluZSBJTlVNX1dB
VEVSTUFSSyAgICAgIDB4RkZGRkZGMDAKIAotLyogTGFyZ2VzdCBrZXkgc2l6ZSBzdXBwb3J0ZWQg
aW4gdGhpcyBpbXBsZW1lbnRhdGlvbiAqLwotI2RlZmluZSBDVVJfTUFYX0tFWV9MRU4gVUJJRlNf
U0tfTEVOCi0KIC8qIE1heGltdW0gbnVtYmVyIG9mIGVudHJpZXMgaW4gZWFjaCBMUFQgKExFQiBj
YXRlZ29yeSkgaGVhcCAqLwogI2RlZmluZSBMUFRfSEVBUF9TWiAyNTYKIApAQCAtMjMwLDE0ICsy
MjcsMTQgQEAKICAqIExQVCBjbm9kZSBmbGFnIGJpdHMuCiAgKgogICogRElSVFlfQ05PREU6IGNu
b2RlIGlzIGRpcnR5Ci0gKiBDT1dfQ05PREU6IGNub2RlIGlzIGJlaW5nIGNvbW1pdHRlZCBhbmQg
bXVzdCBiZSBjb3BpZWQgYmVmb3JlIHdyaXRpbmcKICAqIE9CU09MRVRFX0NOT0RFOiBjbm9kZSBp
cyBiZWluZyBjb21taXR0ZWQgYW5kIGhhcyBiZWVuIGNvcGllZCAob3IgZGVsZXRlZCksCi0gKiBz
byBpdCBjYW4gKGFuZCBtdXN0KSBiZSBmcmVlZCB3aGVuIHRoZSBjb21taXQgaXMgZmluaXNoZWQK
KyAqICAgICAgICAgICAgICAgICBzbyBpdCBjYW4gKGFuZCBtdXN0KSBiZSBmcmVlZCB3aGVuIHRo
ZSBjb21taXQgaXMgZmluaXNoZWQKKyAqIENPV19DTk9ERTogY25vZGUgaXMgYmVpbmcgY29tbWl0
dGVkIGFuZCBtdXN0IGJlIGNvcGllZCBiZWZvcmUgd3JpdGluZwogICovCiBlbnVtIHsKIAlESVJU
WV9DTk9ERSAgICA9IDAsCi0JQ09XX0NOT0RFICAgICAgPSAxLAotCU9CU09MRVRFX0NOT0RFID0g
MiwKKwlPQlNPTEVURV9DTk9ERSA9IDEsCisJQ09XX0NOT0RFICAgICAgPSAyLAogfTsKIAogLyoK
QEAgLTI3NywxMCArMjc0LDEwIEBACiAKIC8qIFRoZSBiZWxvdyB1bmlvbiBtYWtlcyBpdCBlYXNp
ZXIgdG8gZGVhbCB3aXRoIGtleXMgKi8KIHVuaW9uIHViaWZzX2tleSB7Ci0JdWludDhfdCB1OFtD
VVJfTUFYX0tFWV9MRU5dOwotCXVpbnQzMl90IHUzMltDVVJfTUFYX0tFWV9MRU4vNF07Ci0JdWlu
dDY0X3QgdTY0W0NVUl9NQVhfS0VZX0xFTi84XTsKLQlfX2xlMzIgajMyW0NVUl9NQVhfS0VZX0xF
Ti80XTsKKwl1aW50OF90IHU4W1VCSUZTX1NLX0xFTl07CisJdWludDMyX3QgdTMyW1VCSUZTX1NL
X0xFTi80XTsKKwl1aW50NjRfdCB1NjRbVUJJRlNfU0tfTEVOLzhdOworCV9fbGUzMiBqMzJbVUJJ
RlNfU0tfTEVOLzRdOwogfTsKIAogLyoqCkBAIC02NTMsOCArNjUwLDYgQEAKICAqIEBhdmFpbDog
bnVtYmVyIG9mIGJ5dGVzIGF2YWlsYWJsZSBpbiB0aGUgd3JpdGUtYnVmZmVyCiAgKiBAdXNlZDog
IG51bWJlciBvZiB1c2VkIGJ5dGVzIGluIHRoZSB3cml0ZS1idWZmZXIKICAqIEBzaXplOiB3cml0
ZS1idWZmZXIgc2l6ZSAoaW4gW0BjLT5taW5faW9fc2l6ZSwgQGMtPm1heF93cml0ZV9zaXplXSBy
YW5nZSkKLSAqIEBkdHlwZTogdHlwZSBvZiBkYXRhIHN0b3JlZCBpbiB0aGlzIExFQiAoJVVCSV9M
T05HVEVSTSwgJVVCSV9TSE9SVFRFUk0sCi0gKiAlVUJJX1VOS05PV04pCiAgKiBAamhlYWQ6IGpv
dXJuYWwgaGVhZCB0aGUgbXV0ZXggYmVsb25ncyB0byAobm90ZSwgbmVlZGVkIG9ubHkgdG8gc2h1
dCBsb2NrZGVwCiAgKiAgICAgICAgIHVwIGJ5ICdtdXRleF9sb2NrX25lc3RlZCgpKS4KICAqIEBz
eW5jX2NhbGxiYWNrOiB3cml0ZS1idWZmZXIgc3luY2hyb25pemF0aW9uIGNhbGxiYWNrCkBAIC02
ODgsNyArNjgzLDYgQEAKIAlpbnQgYXZhaWw7CiAJaW50IHVzZWQ7CiAJaW50IHNpemU7Ci0JaW50
IGR0eXBlOwogCWludCBqaGVhZDsKIAlpbnQgKCpzeW5jX2NhbGxiYWNrKShzdHJ1Y3QgdWJpZnNf
aW5mbyAqYywgaW50IGxudW0sIGludCBmcmVlLCBpbnQgcGFkKTsKIAlzdHJ1Y3QgbXV0ZXggaW9f
bXV0ZXg7CkBAIC03NjUsNiArNzU5LDkgQEAKICAqIEBvZmZzOiBvZmZzZXQgb2YgdGhlIGNvcnJl
c3BvbmRpbmcgaW5kZXhpbmcgbm9kZQogICogQGxlbjogbGVuZ3RoICBvZiB0aGUgY29ycmVzcG9u
ZGluZyBpbmRleGluZyBub2RlCiAgKiBAemJyYW5jaDogYXJyYXkgb2Ygem5vZGUgYnJhbmNoZXMg
KEBjLT5mYW5vdXQgZWxlbWVudHMpCisgKgorICogTm90ZSEgVGhlIEBsbnVtLCBAb2ZmcywgYW5k
IEBsZW4gZmllbGRzIGFyZSBub3QgcmVhbGx5IG5lZWRlZCAtIHdlIGhhdmUgdGhlbQorICogb25s
eSBmb3IgaW50ZXJuYWwgY29uc2lzdGVuY3kgY2hlY2suIFRoZXkgY291bGQgYmUgcmVtb3ZlZCB0
byBzYXZlIHNvbWUgUkFNLgogICovCiBzdHJ1Y3QgdWJpZnNfem5vZGUgewogCXN0cnVjdCB1Ymlm
c196bm9kZSAqcGFyZW50OwpAQCAtNzc1LDkgKzc3Miw5IEBACiAJaW50IGNoaWxkX2NudDsKIAlp
bnQgaWlwOwogCWludCBhbHQ7Ci0jaWZkZWYgQ09ORklHX1VCSUZTX0ZTX0RFQlVHCi0JaW50IGxu
dW0sIG9mZnMsIGxlbjsKLSNlbmRpZgorCWludCBsbnVtOworCWludCBvZmZzOworCWludCBsZW47
CiAJc3RydWN0IHViaWZzX3picmFuY2ggemJyYW5jaFtdOwogfTsKIApAQCAtMTQ0Nyw5ICsxNDQ0
LDcgQEAKIAlzdHJ1Y3QgcmJfcm9vdCBzaXplX3RyZWU7CiAJc3RydWN0IHViaWZzX21vdW50X29w
dHMgbW91bnRfb3B0czsKIAotI2lmZGVmIENPTkZJR19VQklGU19GU19ERUJVRwogCXN0cnVjdCB1
Ymlmc19kZWJ1Z19pbmZvICpkYmc7Ci0jZW5kaWYKIH07CiAKIGV4dGVybiBzdHJ1Y3QgbGlzdF9o
ZWFkIHViaWZzX2luZm9zOwpAQCAtMTQ2OCwxNiArMTQ2MywyMyBAQAogCiAvKiBpby5jICovCiB2
b2lkIHViaWZzX3JvX21vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBlcnIpOworaW50IHVi
aWZzX2xlYl9yZWFkKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSwgdm9pZCAq
YnVmLCBpbnQgb2ZmcywKKwkJICAgaW50IGxlbiwgaW50IGV2ZW5fZWJhZG1zZyk7CitpbnQgdWJp
ZnNfbGViX3dyaXRlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSwgY29uc3Qgdm9pZCAq
YnVmLCBpbnQgb2ZmcywKKwkJICAgIGludCBsZW4pOworaW50IHViaWZzX2xlYl9jaGFuZ2Uoc3Ry
dWN0IHViaWZzX2luZm8gKmMsIGludCBsbnVtLCBjb25zdCB2b2lkICpidWYsIGludCBsZW4pOwor
aW50IHViaWZzX2xlYl91bm1hcChzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgaW50IGxudW0pOworaW50
IHViaWZzX2xlYl9tYXAoc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBsbnVtKTsKK2ludCB1Ymlm
c19pc19tYXBwZWQoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBsbnVtKTsKIGludCB1
Ymlmc193YnVmX3dyaXRlX25vbG9jayhzdHJ1Y3QgdWJpZnNfd2J1ZiAqd2J1Ziwgdm9pZCAqYnVm
LCBpbnQgbGVuKTsKLWludCB1Ymlmc193YnVmX3NlZWtfbm9sb2NrKHN0cnVjdCB1Ymlmc193YnVm
ICp3YnVmLCBpbnQgbG51bSwgaW50IG9mZnMsCi0JCQkgICBpbnQgZHR5cGUpOworaW50IHViaWZz
X3didWZfc2Vla19ub2xvY2soc3RydWN0IHViaWZzX3didWYgKndidWYsIGludCBsbnVtLCBpbnQg
b2Zmcyk7CiBpbnQgdWJpZnNfd2J1Zl9pbml0KHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3Qg
dWJpZnNfd2J1ZiAqd2J1Zik7CiBpbnQgdWJpZnNfcmVhZF9ub2RlKGNvbnN0IHN0cnVjdCB1Ymlm
c19pbmZvICpjLCB2b2lkICpidWYsIGludCB0eXBlLCBpbnQgbGVuLAogCQkgICAgaW50IGxudW0s
IGludCBvZmZzKTsKIGludCB1Ymlmc19yZWFkX25vZGVfd2J1ZihzdHJ1Y3QgdWJpZnNfd2J1ZiAq
d2J1Ziwgdm9pZCAqYnVmLCBpbnQgdHlwZSwgaW50IGxlbiwKIAkJCSBpbnQgbG51bSwgaW50IG9m
ZnMpOwogaW50IHViaWZzX3dyaXRlX25vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsIHZvaWQgKm5v
ZGUsIGludCBsZW4sIGludCBsbnVtLAotCQkgICAgIGludCBvZmZzLCBpbnQgZHR5cGUpOworCQkg
ICAgIGludCBvZmZzKTsKIGludCB1Ymlmc19jaGVja19ub2RlKGNvbnN0IHN0cnVjdCB1Ymlmc19p
bmZvICpjLCBjb25zdCB2b2lkICpidWYsIGludCBsbnVtLAogCQkgICAgIGludCBvZmZzLCBpbnQg
cXVpZXQsIGludCBtdXN0X2Noa19jcmMpOwogdm9pZCB1Ymlmc19wcmVwYXJlX25vZGUoc3RydWN0
IHViaWZzX2luZm8gKmMsIHZvaWQgKmJ1ZiwgaW50IGxlbiwgaW50IHBhZCk7CkBAIC0xNzQ3LDgg
KzE3NDksOCBAQAogCQkJCQkgaW50IG9mZnMsIHZvaWQgKnNidWYsIGludCBqaGVhZCk7CiBzdHJ1
Y3QgdWJpZnNfc2Nhbl9sZWIgKnViaWZzX3JlY292ZXJfbG9nX2xlYihzdHJ1Y3QgdWJpZnNfaW5m
byAqYywgaW50IGxudW0sCiAJCQkJCSAgICAgaW50IG9mZnMsIHZvaWQgKnNidWYpOwotaW50IHVi
aWZzX3JlY292ZXJfaW5sX2hlYWRzKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCB2b2lkICpz
YnVmKTsKLWludCB1Ymlmc19jbGVhbl9sZWJzKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCB2
b2lkICpzYnVmKTsKK2ludCB1Ymlmc19yZWNvdmVyX2lubF9oZWFkcyhzdHJ1Y3QgdWJpZnNfaW5m
byAqYywgdm9pZCAqc2J1Zik7CitpbnQgdWJpZnNfY2xlYW5fbGVicyhzdHJ1Y3QgdWJpZnNfaW5m
byAqYywgdm9pZCAqc2J1Zik7CiBpbnQgdWJpZnNfcmN2cnlfZ2NfY29tbWl0KHN0cnVjdCB1Ymlm
c19pbmZvICpjKTsKIGludCB1Ymlmc19yZWNvdmVyX3NpemVfYWNjdW0oc3RydWN0IHViaWZzX2lu
Zm8gKmMsIHVuaW9uIHViaWZzX2tleSAqa2V5LAogCQkJICAgICBpbnQgZGVsZXRpb24sIGxvZmZf
dCBuZXdfc2l6ZSk7CmRpZmYgLXVOIC11TnIgbGludXgtMy4wL2ZzL3ViaWZzL3hhdHRyLmMgbGlu
dXgtMy4wLngudWJpZnMubGF0ZXN0L2ZzL3ViaWZzL3hhdHRyLmMKLS0tIGxpbnV4LTMuMC9mcy91
Ymlmcy94YXR0ci5jCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51
eC0zLjAueC51Ymlmcy5sYXRlc3QvZnMvdWJpZnMveGF0dHIuYwkyMDEyLTA2LTI4IDExOjI2OjE1
LjAwMDAwMDAwMCAtMDUwMApAQCAtMTM4LDEyICsxMzgsMTEgQEAKIAl1aSA9IHViaWZzX2lub2Rl
KGlub2RlKTsKIAl1aS0+eGF0dHIgPSAxOwogCXVpLT5mbGFncyB8PSBVQklGU19YQVRUUl9GTDsK
LQl1aS0+ZGF0YSA9IGttYWxsb2Moc2l6ZSwgR0ZQX05PRlMpOworCXVpLT5kYXRhID0ga21lbWR1
cCh2YWx1ZSwgc2l6ZSwgR0ZQX05PRlMpOwogCWlmICghdWktPmRhdGEpIHsKIAkJZXJyID0gLUVO
T01FTTsKIAkJZ290byBvdXRfZnJlZTsKIAl9Ci0JbWVtY3B5KHVpLT5kYXRhLCB2YWx1ZSwgc2l6
ZSk7CiAJaW5vZGUtPmlfc2l6ZSA9IHVpLT51aV9zaXplID0gc2l6ZTsKIAl1aS0+ZGF0YV9sZW4g
PSBzaXplOwogCkBAIC0yMDQsMTIgKzIwMywxMSBAQAogCQlyZXR1cm4gZXJyOwogCiAJa2ZyZWUo
dWktPmRhdGEpOwotCXVpLT5kYXRhID0ga21hbGxvYyhzaXplLCBHRlBfTk9GUyk7CisJdWktPmRh
dGEgPSBrbWVtZHVwKHZhbHVlLCBzaXplLCBHRlBfTk9GUyk7CiAJaWYgKCF1aS0+ZGF0YSkgewog
CQllcnIgPSAtRU5PTUVNOwogCQlnb3RvIG91dF9mcmVlOwogCX0KLQltZW1jcHkodWktPmRhdGEs
IHZhbHVlLCBzaXplKTsKIAlpbm9kZS0+aV9zaXplID0gdWktPnVpX3NpemUgPSBzaXplOwogCXVp
LT5kYXRhX2xlbiA9IHNpemU7CiAKQEAgLTQwMSw4ICszOTksOCBAQAogCWlmIChidWYpIHsKIAkJ
LyogSWYgQGJ1ZiBpcyAlTlVMTCB3ZSBhcmUgc3VwcG9zZWQgdG8gcmV0dXJuIHRoZSBsZW5ndGgg
Ki8KIAkJaWYgKHVpLT5kYXRhX2xlbiA+IHNpemUpIHsKLQkJCWRiZ19lcnIoImJ1ZmZlciBzaXpl
ICV6ZCwgeGF0dHIgbGVuICVkIiwKLQkJCQlzaXplLCB1aS0+ZGF0YV9sZW4pOworCQkJdWJpZnNf
ZXJyKCJidWZmZXIgc2l6ZSAlemQsIHhhdHRyIGxlbiAlZCIsCisJCQkJICBzaXplLCB1aS0+ZGF0
YV9sZW4pOwogCQkJZXJyID0gLUVSQU5HRTsKIAkJCWdvdG8gb3V0X2lwdXQ7CiAJCX0KZGlmZiAt
dU4gLXVOciBsaW51eC0zLjAvaW5jbHVkZS9saW51eC9tdGQvdWJpLmggbGludXgtMy4wLngudWJp
ZnMubGF0ZXN0L2luY2x1ZGUvbGludXgvbXRkL3ViaS5oCi0tLSBsaW51eC0zLjAvaW5jbHVkZS9s
aW51eC9tdGQvdWJpLmgJMjAxMS0wNy0yMSAyMToxNzoyMy4wMDAwMDAwMDAgLTA1MDAKKysrIGxp
bnV4LTMuMC54LnViaWZzLmxhdGVzdC9pbmNsdWRlL2xpbnV4L210ZC91YmkuaAkyMDEyLTA2LTI4
IDExOjI2OjE1LjAwMDAwMDAwMCAtMDUwMApAQCAtMjUsNiArMjUsOSBAQAogI2luY2x1ZGUgPGxp
bnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8bXRkL3ViaS11c2VyLmg+CiAKKy8qIEFsbCB2b3VtZXMv
TEVCcyAqLworI2RlZmluZSBVQklfQUxMIC0xCisKIC8qCiAgKiBlbnVtIHViaV9vcGVuX21vZGUg
LSBVQkkgdm9sdW1lIG9wZW4gbW9kZSBjb25zdGFudHMuCiAgKgpAQCAtMTU1LDEyICsxNTgsMTQg
QEAKIH07CiAKIC8qCi0gKiBlbnVtIC0gdm9sdW1lIG5vdGlmaWNhdGlvbiB0eXBlcy4KLSAqIEBV
QklfVk9MVU1FX0FEREVEOiB2b2x1bWUgaGFzIGJlZW4gYWRkZWQKLSAqIEBVQklfVk9MVU1FX1JF
TU9WRUQ6IHN0YXJ0IHZvbHVtZSB2b2x1bWUKLSAqIEBVQklfVk9MVU1FX1JFU0laRUQ6IHZvbHVt
ZSBzaXplIGhhcyBiZWVuIHJlLXNpemVkCi0gKiBAVUJJX1ZPTFVNRV9SRU5BTUVEOiB2b2x1bWUg
bmFtZSBoYXMgYmVlbiByZS1uYW1lZAotICogQFVCSV9WT0xVTUVfVVBEQVRFRDogdm9sdW1lIG5h
bWUgaGFzIGJlZW4gdXBkYXRlZAorICogVm9sdW1lIG5vdGlmaWNhdGlvbiB0eXBlcy4KKyAqIEBV
QklfVk9MVU1FX0FEREVEOiBhIHZvbHVtZSBoYXMgYmVlbiBhZGRlZCAoYW4gVUJJIGRldmljZSB3
YXMgYXR0YWNoZWQgb3IgYQorICogICAgICAgICAgICAgICAgICAgIHZvbHVtZSB3YXMgY3JlYXRl
ZCkKKyAqIEBVQklfVk9MVU1FX1JFTU9WRUQ6IGEgdm9sdW1lIGhhcyBiZWVuIHJlbW92ZWQgKGFu
IFVCSSBkZXZpY2Ugd2FzIGRldGFjaGVkCisgKgkJCW9yIGEgdm9sdW1lIHdhcyByZW1vdmVkKQor
ICogQFVCSV9WT0xVTUVfUkVTSVpFRDogYSB2b2x1bWUgaGFzIGJlZW4gcmUtc2l6ZWQKKyAqIEBV
QklfVk9MVU1FX1JFTkFNRUQ6IGEgdm9sdW1lIGhhcyBiZWVuIHJlLW5hbWVkCisgKiBAVUJJX1ZP
TFVNRV9VUERBVEVEOiBkYXRhIGhhcyBiZWVuIHdyaXR0ZW4gdG8gYSB2b2x1bWUKICAqCiAgKiBU
aGVzZSBjb25zdGFudHMgZGVmaW5lIHdoaWNoIHR5cGUgb2YgZXZlbnQgaGFzIGhhcHBlbmVkIHdo
ZW4gYSB2b2x1bWUKICAqIG5vdGlmaWNhdGlvbiBmdW5jdGlvbiBpcyBpbnZva2VkLgpAQCAtMjA2
LDE0ICsyMTEsMTUgQEAKIGludCB1YmlfbGViX3JlYWQoc3RydWN0IHViaV92b2x1bWVfZGVzYyAq
ZGVzYywgaW50IGxudW0sIGNoYXIgKmJ1ZiwgaW50IG9mZnNldCwKIAkJIGludCBsZW4sIGludCBj
aGVjayk7CiBpbnQgdWJpX2xlYl93cml0ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBp
bnQgbG51bSwgY29uc3Qgdm9pZCAqYnVmLAotCQkgIGludCBvZmZzZXQsIGludCBsZW4sIGludCBk
dHlwZSk7CisJCSAgaW50IG9mZnNldCwgaW50IGxlbik7CiBpbnQgdWJpX2xlYl9jaGFuZ2Uoc3Ry
dWN0IHViaV92b2x1bWVfZGVzYyAqZGVzYywgaW50IGxudW0sIGNvbnN0IHZvaWQgKmJ1ZiwKLQkJ
ICAgaW50IGxlbiwgaW50IGR0eXBlKTsKKwkJICAgaW50IGxlbik7CiBpbnQgdWJpX2xlYl9lcmFz
ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgbG51bSk7CiBpbnQgdWJpX2xlYl91
bm1hcChzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgbG51bSk7Ci1pbnQgdWJpX2xl
Yl9tYXAoc3RydWN0IHViaV92b2x1bWVfZGVzYyAqZGVzYywgaW50IGxudW0sIGludCBkdHlwZSk7
CitpbnQgdWJpX2xlYl9tYXAoc3RydWN0IHViaV92b2x1bWVfZGVzYyAqZGVzYywgaW50IGxudW0p
OwogaW50IHViaV9pc19tYXBwZWQoc3RydWN0IHViaV92b2x1bWVfZGVzYyAqZGVzYywgaW50IGxu
dW0pOwogaW50IHViaV9zeW5jKGludCB1YmlfbnVtKTsKK2ludCB1YmlfZmx1c2goaW50IHViaV9u
dW0sIGludCB2b2xfaWQsIGludCBsbnVtKTsKIAogLyoKICAqIFRoaXMgZnVuY3Rpb24gaXMgdGhl
IHNhbWUgYXMgdGhlICd1YmlfbGViX3JlYWQoKScgZnVuY3Rpb24sIGJ1dCBpdCBkb2VzIG5vdApA
QCAtMjI0LDI1ICsyMzAsNCBAQAogewogCXJldHVybiB1YmlfbGViX3JlYWQoZGVzYywgbG51bSwg
YnVmLCBvZmZzZXQsIGxlbiwgMCk7CiB9Ci0KLS8qCi0gKiBUaGlzIGZ1bmN0aW9uIGlzIHRoZSBz
YW1lIGFzIHRoZSAndWJpX2xlYl93cml0ZSgpJyBmdW5jdGlvbnMsIGJ1dCBpdCBkb2VzCi0gKiBu
b3QgaGF2ZSB0aGUgZGF0YSB0eXBlIGFyZ3VtZW50LgotICovCi1zdGF0aWMgaW5saW5lIGludCB1
Ymlfd3JpdGUoc3RydWN0IHViaV92b2x1bWVfZGVzYyAqZGVzYywgaW50IGxudW0sCi0JCQkgICAg
Y29uc3Qgdm9pZCAqYnVmLCBpbnQgb2Zmc2V0LCBpbnQgbGVuKQotewotCXJldHVybiB1YmlfbGVi
X3dyaXRlKGRlc2MsIGxudW0sIGJ1Ziwgb2Zmc2V0LCBsZW4sIFVCSV9VTktOT1dOKTsKLX0KLQot
LyoKLSAqIFRoaXMgZnVuY3Rpb24gaXMgdGhlIHNhbWUgYXMgdGhlICd1YmlfbGViX2NoYW5nZSgp
JyBmdW5jdGlvbnMsIGJ1dCBpdCBkb2VzCi0gKiBub3QgaGF2ZSB0aGUgZGF0YSB0eXBlIGFyZ3Vt
ZW50LgotICovCi1zdGF0aWMgaW5saW5lIGludCB1YmlfY2hhbmdlKHN0cnVjdCB1Ymlfdm9sdW1l
X2Rlc2MgKmRlc2MsIGludCBsbnVtLAotCQkJCSAgICBjb25zdCB2b2lkICpidWYsIGludCBsZW4p
Ci17Ci0JcmV0dXJuIHViaV9sZWJfY2hhbmdlKGRlc2MsIGxudW0sIGJ1ZiwgbGVuLCBVQklfVU5L
Tk9XTik7Ci19Ci0KICNlbmRpZiAvKiAhX19MSU5VWF9VQklfSF9fICovCmRpZmYgLXVOIC11TnIg
bGludXgtMy4wL2luY2x1ZGUvbXRkL3ViaS11c2VyLmggbGludXgtMy4wLngudWJpZnMubGF0ZXN0
L2luY2x1ZGUvbXRkL3ViaS11c2VyLmgKLS0tIGxpbnV4LTMuMC9pbmNsdWRlL210ZC91YmktdXNl
ci5oCTIwMTEtMDctMjEgMjE6MTc6MjMuMDAwMDAwMDAwIC0wNTAwCisrKyBsaW51eC0zLjAueC51
Ymlmcy5sYXRlc3QvaW5jbHVkZS9tdGQvdWJpLXVzZXIuaAkyMDEyLTA2LTI4IDExOjI2OjE1LjAw
MDAwMDAwMCAtMDUwMApAQCAtMTk2LDIzICsxOTYsNiBAQAogI2RlZmluZSBVQklfTUFYX1JOVk9M
IDMyCiAKIC8qCi0gKiBVQkkgZGF0YSB0eXBlIGhpbnQgY29uc3RhbnRzLgotICoKLSAqIFVCSV9M
T05HVEVSTTogbG9uZy10ZXJtIGRhdGEKLSAqIFVCSV9TSE9SVFRFUk06IHNob3J0LXRlcm0gZGF0
YQotICogVUJJX1VOS05PV046IGRhdGEgcGVyc2lzdGVuY2UgaXMgdW5rbm93bgotICoKLSAqIFRo
ZXNlIGNvbnN0YW50cyBhcmUgdXNlZCB3aGVuIGRhdGEgaXMgd3JpdHRlbiB0byBVQkkgdm9sdW1l
cyBpbiBvcmRlciB0bwotICogaGVscCB0aGUgVUJJIHdlYXItbGV2ZWxpbmcgdW5pdCB0byBmaW5k
IG1vcmUgYXBwcm9wcmlhdGUgcGh5c2ljYWwKLSAqIGVyYXNlYmxvY2tzLgotICovCi1lbnVtIHsK
LQlVQklfTE9OR1RFUk0gID0gMSwKLQlVQklfU0hPUlRURVJNID0gMiwKLQlVQklfVU5LTk9XTiAg
ID0gMywKLX07Ci0KLS8qCiAgKiBVQkkgdm9sdW1lIHR5cGUgY29uc3RhbnRzLgogICoKICAqIEBV
QklfRFlOQU1JQ19WT0xVTUU6IGR5bmFtaWMgdm9sdW1lCkBAIC0zNzUsMjUgKzM1OCwzNCBAQAog
ICogICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlcXVlc3RzLgogICogQGxudW06IGxvZ2lj
YWwgZXJhc2VibG9jayBudW1iZXIgdG8gY2hhbmdlCiAgKiBAYnl0ZXM6IGhvdyBtYW55IGJ5dGVz
IHdpbGwgYmUgd3JpdHRlbiB0byB0aGUgbG9naWNhbCBlcmFzZWJsb2NrCi0gKiBAZHR5cGU6IGRh
dGEgdHlwZSAoJVVCSV9MT05HVEVSTSwgJVVCSV9TSE9SVFRFUk0sICVVQklfVU5LTk9XTikKKyAq
IEBkdHlwZTogcGFzcyAiMyIgZm9yIGJldHRlciBjb21wYXRpYmlsaXR5IHdpdGggb2xkIGtlcm5l
bHMKICAqIEBwYWRkaW5nOiByZXNlcnZlZCBmb3IgZnV0dXJlLCBub3QgdXNlZCwgaGFzIHRvIGJl
IHplcm9lZAorICoKKyAqIFRoZSBAZHR5cGUgZmllbGQgdXNlZCB0byBpbmZvcm0gVUJJIGFib3V0
IHdoYXQga2luZCBvZiBkYXRhIHdpbGwgYmUgd3JpdHRlbgorICogdG8gdGhlIExFQjogbG9uZyB0
ZXJtICh2YWx1ZSAxKSwgc2hvcnQgdGVybSAodmFsdWUgMiksIHVua25vd24gKHZhbHVlIDMpLgor
ICogVUJJIHRyaWVkIHRvIHBpY2sgYSBQRUIgd2l0aCBsb3dlciBlcmFzZSBjb3VudGVyIGZvciBz
aG9ydCB0ZXJtIGRhdGEgYW5kIGEKKyAqIFBFQiB3aXRoIGhpZ2hlciBlcmFzZSBjb3VudGVyIGZv
ciBsb25nIHRlcm0gZGF0YS4gQnV0IHRoaXMgd2FzIG5vdCByZWFsbHkKKyAqIHVzZWQgYmVjYXVz
ZSB1c2VycyB1c3VhbGx5IGRvIG5vdCBrbm93IHRoaXMgYW5kIGNvdWxkIGVhc2lseSBtaXNsZWFk
IFVCSS4gV2UKKyAqIHJlbW92ZWQgdGhpcyBmZWF0dXJlIGluIE1heSAyMDEyLiBVQkkgY3VycmVu
dGx5IGp1c3QgaWdub3JlcyB0aGUgQGR0eXBlCisgKiBmaWVsZC4gQnV0IGZvciBiZXR0ZXIgY29t
cGF0aWJpbGl0eSB3aXRoIG9sZGVyIGtlcm5lbHMgaXQgaXMgcmVjb21tZW5kZWQgdG8KKyAqIHNl
dCBAZHR5cGUgdG8gMyAodW5rbm93bikuCiAgKi8KIHN0cnVjdCB1YmlfbGViX2NoYW5nZV9yZXEg
ewogCV9fczMyIGxudW07CiAJX19zMzIgYnl0ZXM7Ci0JX19zOCAgZHR5cGU7CisJX19zOCAgZHR5
cGU7IC8qIG9ic29sZXRlLCBkbyBub3QgdXNlISAqLwogCV9fczggIHBhZGRpbmdbN107CiB9IF9f
cGFja2VkOwogCiAvKioKICAqIHN0cnVjdCB1YmlfbWFwX3JlcSAtIGEgZGF0YSBzdHJ1Y3R1cmUg
dXNlZCBpbiBtYXAgTEVCIHJlcXVlc3RzLgorICogQGR0eXBlOiBwYXNzICIzIiBmb3IgYmV0dGVy
IGNvbXBhdGliaWxpdHkgd2l0aCBvbGQga2VybmVscwogICogQGxudW06IGxvZ2ljYWwgZXJhc2Vi
bG9jayBudW1iZXIgdG8gdW5tYXAKLSAqIEBkdHlwZTogZGF0YSB0eXBlICglVUJJX0xPTkdURVJN
LCAlVUJJX1NIT1JUVEVSTSwgJVVCSV9VTktOT1dOKQogICogQHBhZGRpbmc6IHJlc2VydmVkIGZv
ciBmdXR1cmUsIG5vdCB1c2VkLCBoYXMgdG8gYmUgemVyb2VkCiAgKi8KIHN0cnVjdCB1YmlfbWFw
X3JlcSB7CiAJX19zMzIgbG51bTsKLQlfX3M4ICBkdHlwZTsKKwlfX3M4ICBkdHlwZTsgLyogb2Jz
b2xldGUsIGRvIG5vdCB1c2UhICovCiAJX19zOCAgcGFkZGluZ1szXTsKIH0gX19wYWNrZWQ7CiAK
--f46d044401deb4a7bd04c4f6824e--
