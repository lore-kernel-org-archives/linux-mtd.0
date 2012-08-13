Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T0uxS-0001TO-I0
 for linux-mtd@lists.infradead.org; Mon, 13 Aug 2012 13:45:31 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1T0ux7-0006Dm-M5
 for linux-mtd@lists.infradead.org; Mon, 13 Aug 2012 15:45:06 +0200
Received: from gate-il06-2.motorola.com ([129.188.33.26])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2012 15:45:05 +0200
Received: from motobud by gate-il06-2.motorola.com with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2012 15:45:05 +0200
To: linux-mtd@lists.infradead.org
From: Brent Taylor <motobud@gmail.com>
Subject: Re: UBIFS Recovery Issue: =?utf-8?b?J2dyYWJfZW1wdHlfbGViOg==?= could
 not find an empty LEB'
Date: Mon, 13 Aug 2012 13:41:44 +0000 (UTC)
Message-ID: <loom.20120813T153641-586@post.gmane.org>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brent Taylor <motobud <at> gmail.com> writes:

> 
> 
> I'm developing on custom hardware using an at91sam9g45 processor with 64 MB of
RAM and 64 MB of NOR flash running Linux 3.0.13.I'm doing some power-cycle
testing and after several hours, UBIFS failed to mount the root partition and
printed the message "grab_empty_leb: could not find an empty LEB".  The system
boots and starts a script that will power cycle the board anytime between 10 and
20 seconds after the script has started.  Just before a power cycle occurs,
syslog and our main process are the only processes that could be writing to
disk.  I then checked http://git.infradead.org/users/dedekind/ubifs-v3.0.git to
see if there was a patch and couldn't find anything describing my exact
problem.  I generated a patch from commit
02f8c6aee8df3cdc935e9bdd4f2d020306035dbe to
a0c2d5050bd191e53a761381027c8e5ab8e25336 (see attached ubifs.3.0.diff) and
rebuilt the kernel.  If there was a patch for my issue, I was expecting the root
partition to be recovered but it wasn't.  I'm currently running the same test
with the patched kernel.  Below is the information from the patched kernel.If
there is any more information I need to provide, please let me know.
> Any help would be appreciated,
> Bud[linux-16][~> uname -aLinux linux 3.0.13 #20 Mon Jul 16 11:16:58 CDT 2012
armv5tejl GNU/Linux[linux-16][~> mtdinfo -aCount of MTD devices:          
5Present MTD devices:            mtd0, mtd1, mtd2, mtd3, mtd4Sysfs interface
supported:      yesmtd0Name:                          
bootType:                           norEraseblock size:                131072
bytes, 128.0 KiBAmount of eraseblocks:          1 (131072 bytes, 128.0
KiB)Minimum input/output unit size: 1 byteSub-page size:                  1
byteCharacter device major/minor:   90:0Bad blocks are allowed:        
falseDevice is writable:             falsemtd1Name:                          
ubootType:                           norEraseblock size:                131072
bytes, 128.0 KiBAmount of eraseblocks:          1 (131072 bytes, 128.0
KiB)Minimum input/output unit size: 1 byteSub-page size:                  1
byteCharacter device major/minor:   90:2Bad blocks are allowed:        
falseDevice is writable:             falsemtd2Name:                          
envType:                           norEraseblock size:                131072
bytes, 128.0 KiBAmount of eraseblocks:          1 (131072 bytes, 128.0
KiB)Minimum input/output unit size: 1 byteSub-page size:                  1
byteCharacter device major/minor:   90:4Bad blocks are allowed:        
falseDevice is writable:             truemtd3Name:                          
kernelType:                           norEraseblock size:                131072
bytes, 128.0 KiBAmount of eraseblocks:          16 (2097152 bytes, 2.0
MiB)Minimum input/output unit size: 1 byteSub-page size:                  1
byteCharacter device major/minor:   90:6Bad blocks are allowed:        
falseDevice is writable:             falsemtd4Name:                          
root-fsType:                           norEraseblock size:                131072
bytes, 128.0 KiBAmount of eraseblocks:          493 (64618496 bytes, 61.6
MiB)Minimum input/output unit size: 1 byteSub-page size:                  1
byteCharacter device major/minor:   90:8Bad blocks are allowed:        
falseDevice is writable:             true[linux-16][~> ubinfo -a
/dev/ubi0ubi0Volumes count:                           1Logical eraseblock
size:                 130944 bytes, 127.9 KiBTotal amount of logical
eraseblocks:     493 (64555392 bytes, 61.6 MiB)Amount of available logical
eraseblocks: 0 (0 bytes)Maximum count of volumes                 128Count of bad
physical eraseblocks:       0Count of reserved physical eraseblocks:  0Current
maximum erase counter value:     154Minimum input/output unit size:          1
byteCharacter device major/minor:            253:0Present
volumes:                         0Volume ID:   0 (on ubi0)Type:       
dynamicAlignment:   1Size:        489 LEBs (64031616 bytes, 61.1
MiB)State:       OKName:        ubirootfsCharacter device major/minor:
253:1[linux-16][~> mount -t ubifs ubi0:ubirootfs /opt/root/UBIFS: recovery
neededUBIFS error (pid 958): grab_empty_leb: could not find an empty LEB(pid
958) start dumping LEB properties(pid 958) Lprops statistics: empty_lebs 2,
idx_lebs  28        taken_empty_lebs 2, total_free 1193080, total_dirty
19318832        total_used 41441632, total_dark 1291912, total_dead 56LEB
10      free 24       dirty 4064     used 126856   free + dirty 4088     dark
4088 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 11      free 8        dirty
640      used 130296   free + dirty 648      dark 648  dead 0    nodes fit 0  
flags 0x1  (dirty)LEB 12      free 40       dirty 960      used 129944   free +
dirty 1000     dark 1000 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 13     
free 0        dirty 1600     used 129344   free + dirty 1600     dark 1600 dead
0    nodes fit 0   flags 0x1  (dirty)LEB 14      free 104      dirty 1272    
used 129568   free + dirty 1376     dark 1376 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB>  15      free 104      dirty 1920     used 128920   free + dirty
2024     dark 2024 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 16      free
152      dirty 1120     used 129672   free + dirty 1272     dark 1272 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 17      free 112      dirty 1120     used
129712   free + dirty 1232     dark 1232 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 18      free 48       dirty 1120     used 129776   free + dirty
1168     dark 1168 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 19      free
104      dirty 1120     used 129720   free + dirty 1224     dark 1224 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 20      free 56       dirty 1280     used
129608   free + dirty 1336     dark 1336 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 21      free 56       dirty 1120     used 129768   free + dirty
1176     dark 1176 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 22      free
128      dirty 640      used 130176   free + dirty 768      dark 768  dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 23      free 120      dirty 480      used
130344   free + dirty 600      dark 600  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 24      free 64       dirty 1600     used 129280   free + dirty
1664     dark 1664 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 25      free
24       dirty 1440     used 129480   free + dirty 1464     dark 1464 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 26      free 8        dirty 640      used
130296   free + dirty 648      dark 648  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 27      free 40       dirty 1760     used 129144   free + dirty
1800     dark 1800 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 28      free
64       dirty 1120     used 129760   free + dirty 1184     dark 1184 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 29      free 32       dirty 160      used
130752   free + dirty 192      dark 192  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 30      free 72       dirty 1328     used 129544   free + dirty
1400     dark 1400 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 31      free
48       dirty 2272     used 128624   free + dirty 2320     dark 2320 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 32      free 56       dirty 1280     used
129608   free + dirty 1336     dark 1336 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 33      free 48       dirty 800      used 130096   free + dirty
848      dark 848  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 34      free
128      dirty 1440     used 129376   free + dirty 1568     dark 1568 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 35      free 64       dirty 960      used
129920   free + dirty 1024     dark 1024 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 36      free 104      dirty 160      used 130680   free + dirty
264      dark 264  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 37      free
40       dirty 640      used 130264   free + dirty 680      dark 680  dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 38      free 72       dirty 2112     used
128760   free + dirty 2184     dark 2184 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 39      free 104      dirty 25328    used 105512   free + dirty
25432    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)LEB 40      free
72       dirty 96464    used 34408    free + dirty 96536    dark 4256 dead 0   
nodes fit 22  flags 0x1  (dirty)LEB 41      free 104      dirty 104832   used
26008    free + dirty 104936   dark 4256 dead 0    nodes fit 24  flags 0x1 
(dirty)LEB 42      free 72       dirty 111616   used 19256    free + dirty
111688   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)LEB 43      free
88       dirty 83008    used 47848    free + dirty 83096    dark 4256 dead 0   
nodes fit 19  flags 0x1  (dirty)LEB 44      free 48       dirty 53944    used
76952    free + dirty 53992    dark 4256 dead 0    nodes fit 12  flags 0x1 
(dirty)LEB 45      free 128      dirty 88752    used 42064    free + dirty
88880    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)LEB 46      free
136      dirty 111976   used 18832    free + dirty 112112   dark 4256 dead 0   
nodes fit 26  flags 0x1  (dirty)LEB 47      free 16       dirty 89176    used
41752    free + dirty 89192    dark 4256 dead 0    nodes fit 20  flags 0x1 
(dirty)LEB 48      free 24       dirty 96616    used 34304    free + dirty
96640    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)LEB 49      free
48       dirty 88320    used 42576    free + dirty 88368    dark 4256 dead 0   
nodes fit 20  flags 0x1  (dirty)LEB 50      free 88       dirty 1120     used
129736   free + dirty 1208     dark 1208 dead 0    nodes fit 0   flags 0x1&>
nbsp; (dirty)LEB 51      free 152      dirty 84456    used 46336    free + dirty
84608    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)LEB 52      free
24       dirty 1736     used 129184   free + dirty 1760     dark 1760 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 53      free 32       dirty 107272   used
23640    free + dirty 107304   dark 4256 dead 0    nodes fit 25  flags 0x1 
(dirty)LEB 54      free 72       dirty 8696     used 122176   free + dirty
8768     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)LEB 55      free
144      dirty 92152    used 38648    free + dirty 92296    dark 4256 dead 0   
nodes fit 21  flags 0x1  (dirty)LEB 56      free 120      dirty 86160    used
44664    free + dirty 86280    dark 4256 dead 0    nodes fit 20  flags 0x1 
(dirty)LEB 57      free 56       dirty 97728    used 33160    free + dirty
97784    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)LEB 58      free
16       dirty 50696    used 80232    free + dirty 50712    dark 4256 dead 0   
nodes fit 11  flags 0x1  (dirty)LEB 59      free 0        dirty 97448    used
33496    free + dirty 97448    dark 4256 dead 0    nodes fit 22  flags 0x1 
(dirty)LEB 60      free 80       dirty 83216    used 47648    free + dirty
83296    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)LEB 61      free
64       dirty 43384    used 87496    free + dirty 43448    dark 4256 dead 0   
nodes fit 10  flags 0x1  (dirty)LEB 62      free 40       dirty 2568     used
128336   free + dirty 2608     dark 2608 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 63      free 64       dirty 3632     used 127248   free + dirty
3696     dark 3696 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 64      free
0        dirty 9528     used 121416   free + dirty 9528     dark 4256 dead 0   
nodes fit 2   flags 0x1  (dirty)LEB 65      free 152      dirty 696      used
130096   free + dirty 848      dark 848  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 66      free 48       dirty 57392    used 73504    free + dirty
57440    dark 4256 dead 0    nodes fit 13  flags 0x1  (dirty)LEB 67      free
64       dirty 90192    used 40688    free + dirty 90256    dark 4256 dead 0   
nodes fit 21  flags 0x1  (dirty)LEB 68      free 72       dirty 111312   used
19560    free + dirty 111384   dark 4256 dead 0    nodes fit 26  flags 0x1 
(dirty)LEB 69      free 0        dirty 85128    used 45816    free + dirty
85128    dark 4256 dead 0    nodes fit 20  flags 0x1  (dirty)LEB 70      free
96       dirty 97600    used 33248    free + dirty 97696    dark 4256 dead 0   
nodes fit 22  flags 0x1  (dirty)LEB 71      free 16       dirty 91408    used
39520    free + dirty 91424    dark 4256 dead 0    nodes fit 21  flags 0x1 
(dirty)LEB 72      free 48       dirty 103064   used 27832    free + dirty
103112   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)LEB 73      free
112      dirty 98704    used 32128    free + dirty 98816    dark 4256 dead 0   
nodes fit 23  flags 0x1  (dirty)LEB 74      free 8        dirty 1712     used
129224   free + dirty 1720     dark 1720 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 75      free 144      dirty 1656     used 129144   free + dirty
1800     dark 1800 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 76      free
80       dirty 76656    used 54208    free + dirty 76736    dark 4256 dead 0   
nodes fit 18  flags 0x1  (dirty)LEB 77      free 128      dirty 61016    used
69800    free + dirty 61144    dark 4256 dead 0    nodes fit 14  flags 0x1 
(dirty)LEB 78      free 40       dirty 48576    used 82328    free + dirty
48616    dark 4256 dead 0    nodes fit 11  flags 0x1  (dirty)LEB 79      free
88       dirty 9592     used 121264   free + dirty 9680     dark 4256 dead 0   
nodes fit 2   flags 0x1  (dirty)LEB 80      free 40       dirty 54184    used
76720    free + dirty 54224    dark 4256 dead 0    nodes fit 12  flags 0x1 
(dirty)LEB 81      free 32       dirty 8592     used 122320   free + dirty
8624     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)LEB 82      free
8        dirty 1112     used 129824   free + dirty 1120     dark 1120 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 83      free 24       dirty 104352   used
26568    free + dirty 104376   dark 4256 dead 0    nodes fit 24  flags 0x1 
(dirty)LEB 84      free 56       dirty 9680     used 121208   free + dirty
9736     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)LEB 85      free
32       dirty 1112     used 129800   free + dirty 1144     dark 1144 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 86      free 72       dirty 88976    used
41896    free + dirty 89048    dark 4256 dead 0    nodes fit 20  flags 0x1 
(dirty)LEB 87      free 0        dirty 90504    u> sed 40440    free + dirty
90504    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)LEB 88      free
128      dirty 82728    used 48088    free + dirty 82856    dark 4256 dead 0   
nodes fit 19  flags 0x1  (dirty)LEB 89      free 64       dirty 104640   used
26240    free + dirty 104704   dark 4256 dead 0    nodes fit 24  flags 0x1 
(dirty)LEB 90      free 88       dirty 68744    used 62112    free + dirty
68832    dark 4256 dead 0    nodes fit 16  flags 0x1  (dirty)LEB 91      free
152      dirty 1528     used 129264   free + dirty 1680     dark 1680 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 92      free 448      dirty 124120   used
6376     free + dirty 124568   dark 4256 dead 0    nodes fit 29  flags 0x10
(taken, bud of jhead 2 (data))LEB 93      free 72       dirty 480      used
130392   free + dirty 552      dark 552  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 94      free 64       dirty 108216   used 22664    free + dirty
108280   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)LEB 95      free
72       dirty 105400   used 25472    free + dirty 105472   dark 4256 dead 0   
nodes fit 24  flags 0x1  (dirty)LEB 96      free 72       dirty 112456   used
18416    free + dirty 112528   dark 4256 dead 0    nodes fit 26  flags 0x1 
(dirty)LEB 97      free 16       dirty 99960    used 30968    free + dirty
99976    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)LEB 98      free
24       dirty 58792    used 72128    free + dirty 58816    dark 4256 dead 0   
nodes fit 13  flags 0x1  (dirty)LEB 99      free 0        dirty 92688    used
38256    free + dirty 92688    dark 4256 dead 0    nodes fit 21  flags 0x1 
(dirty)LEB 100     free 88728    dirty 20312    used 21904    free + dirty
109040   flags 0x22 (dirty index)LEB 101     free 7152     dirty 107016   used
16776    free + dirty 114168   flags 0x22 (dirty index)LEB 102     free 40      
dirty 100824   used 30080    free + dirty 100864   dark 4256 dead 0    nodes fit
23  flags 0x1  (dirty)LEB 103     free 128      dirty 98464    used 32352   
free + dirty 98592    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)LEB
104     free 72       dirty 112808   used 18064    free + dirty 112880   dark
4256 dead 0    nodes fit 26  flags 0x1  (dirty)LEB 105     free 0        dirty
85704    used 45240    free + dirty 85704    dark 4256 dead 0    nodes fit 20 
flags 0x1  (dirty)LEB 106     free 48       dirty 1488     used 129408   free +
dirty 1536     dark 1536 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 107    
free 88       dirty 320      used 130536   free + dirty 408      dark 408  dead
0    nodes fit 0   flags 0x1  (dirty)LEB 108     free 48       dirty 960     
used 129936   free + dirty 1008     dark 1008 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 109     free 8880     dirty 106784   used 15280    free + dirty
115664   flags 0x22 (dirty index)LEB 110     free 128      dirty 94504    used
36312    free + dirty 94632    dark 4256 dead 0    nodes fit 22  flags 0x1 
(dirty)LEB 111     free 64       dirty 9728     used 121152   free + dirty
9792     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)LEB 112     free
40       dirty 1672     used 129232   free + dirty 1712     dark 1712 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 113     free 88       dirty 2400     used
128456   free + dirty 2488     dark 2488 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 114     free 152      dirty 15152    used 115640   free + dirty
15304    dark 4256 dead 0    nodes fit 3   flags 0x1  (dirty)LEB 115     free
40       dirty 64424    used 66480    free + dirty 64464    dark 4256 dead 0   
nodes fit 15  flags 0x1  (dirty)LEB 116     free 32       dirty 1904     used
129008   free + dirty 1936     dark 1936 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 117     free 80       dirty 2184     used 128680   free + dirty
2264     dark 2264 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 118     free
144      dirty 82784    used 48016    free + dirty 82928    dark 4256 dead 0   
nodes fit 19  flags 0x1  (dirty)LEB 119     free 80       dirty 101648   used
29216    free + dirty 101728   dark 4256 dead 0    nodes fit 23  flags 0x1 
(dirty)LEB 120     free 136      dirty 99720    used 31088    free + dirty
99856    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)LEB 121     free
72       dirty 94688    used 36184    free + dirty 94760    dark 4256 dead 0   
nodes fit 22  flags 0x1  (dirty)LEB 122     free 104      dirty 1920     used
128920   free + dirty 2024     dark 2024 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 123     free 144      dirty 1440     used 129360   free + dirty
1584     dark 1584 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 124     free
96       dirty 81088    used 49760    free + dirty 81184    dark 4256 dead 0   
nodes fit 19  flags 0x1  (dirty)LEB 125     free 16       dirty 78320  > ;  used
52608    free + dirty 78336    flags 0x22 (dirty index)LEB 126     free 120     
dirty 89976    used 40848    free + dirty 90096    dark 4256 dead 0    nodes fit
21  flags 0x1  (dirty)LEB 127     free 8        dirty 72       used 130864  
free + dirty 80       dark 80   dead 0    nodes fit 0   flags 0x1  (dirty)LEB
128     free 8        dirty 1120     used 129816   free + dirty 1128     dark
1128 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 129     free 88       dirty
2560     used 128296   free + dirty 2648     dark 2648 dead 0    nodes fit 0  
flags 0x1  (dirty)LEB 130     free 144      dirty 1120     used 129680   free +
dirty 1264     dark 1264 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 131    
free 104      dirty 1600     used 129240   free + dirty 1704     dark 1704 dead
0    nodes fit 0   flags 0x1  (dirty)LEB 132     free 40       dirty 1120    
used 129784   free + dirty 1160     dark 1160 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 133     free 32       dirty 1192     used 129720   free + dirty
1224     dark 1224 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 134     free
88       dirty 2216     used 128640   free + dirty 2304     dark 2304 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 135     free 120      dirty 1760     used
129064   free + dirty 1880     dark 1880 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 136     free 88       dirty 160      used 130696   free + dirty
248      dark 248  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 137     free
8        dirty 160      used 130776   free + dirty 168      dark 168  dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 138     free 144      dirty 800      used
130000   free + dirty 944      dark 944  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 139     free 56       dirty 2080     used 128808   free + dirty
2136     dark 2136 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 140     free
40       dirty 2392     used 128512   free + dirty 2432     dark 2432 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 141     free 40       dirty 800      used
130104   free + dirty 840      dark 840  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 142     free 24       dirty 320      used 130600   free + dirty
344      dark 344  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 143     free
48       dirty 1600     used 129296   free + dirty 1648     dark 1648 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 144     free 32       dirty 2400     used
128512   free + dirty 2432     dark 2432 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 145     free 104      dirty 1440     used 129400   free + dirty
1544     dark 1544 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 146     free
96       dirty 640      used 130208   free + dirty 736      dark 736  dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 147     free 104      dirty 1120     used
129720   free + dirty 1224     dark 1224 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 148     free 48       dirty 0        used 130896   free + dirty
48       dark 0    dead 48   nodes fit 0   flags 0x3  (free)LEB 149     free
24       dirty 320      used 130600   free + dirty 344      dark 344  dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 150     free 128      dirty 2360     used
128456   free + dirty 2488     dark 2488 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 151     free 72       dirty 1896     used 128976   free + dirty
1968     dark 1968 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 152     free
40       dirty 320      used 130584   free + dirty 360      dark 360  dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 153     free 48       dirty 480      used
130416   free + dirty 528      dark 528  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 154     free 112      dirty 160      used 130672   free + dirty
272      dark 272  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 155     free
8        dirty 2584     used 128352   free + dirty 2592     dark 2592 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 156     free 88       dirty 1280     used
129576   free + dirty 1368     dark 1368 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 157     free 0        dirty 1344     used 129600   free + dirty
1344     dark 1344 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 158     free
72       dirty 2624     used 128248   free + dirty 2696     dark 2696 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 159     free 104      dirty 1600     used
129240   free + dirty 1704     dark 1704 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 160     free 24       dirty 1120     used 129800   free + dirty
1144     dark 1144 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 161     free
96 > ;      dirty 1760     used 129088   free + dirty 1856     dark 1856 dead
0    nodes fit 0   flags 0x1  (dirty)LEB 162     free 48       dirty 480     
used 130416   free + dirty 528      dark 528  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 163     free 88       dirty 464      used 130392   free + dirty
552      dark 552  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 164     free
48       dirty 3696     used 127200   free + dirty 3744     dark 3744 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 165     free 48       dirty 13688    used
117208   free + dirty 13736    dark 4256 dead 0    nodes fit 3   flags 0x1 
(dirty)LEB 166     free 72       dirty 21328    used 109544   free + dirty
21400    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)LEB 167     free
128      dirty 28752    used 102064   free + dirty 28880    dark 4256 dead 0   
nodes fit 6   flags 0x1  (dirty)LEB 168     free 144      dirty 97760    used
33040    free + dirty 97904    dark 4256 dead 0    nodes fit 23  flags 0x1 
(dirty)LEB 169     free 192      dirty 71616    used 59136    free + dirty
71808    flags 0x22 (dirty index)LEB 170     free 1352     dirty 60440    used
69152    free + dirty 61792    flags 0x22 (dirty index)LEB 171     free 144     
dirty 1656     used 129144   free + dirty 1800     dark 1800 dead 0    nodes fit
0   flags 0x1  (dirty)LEB 172     free 104      dirty 23568    used 107272  
free + dirty 23672    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)LEB
173     free 112      dirty 20336    used 110496   free + dirty 20448    dark
4256 dead 0    nodes fit 4   flags 0x1  (dirty)LEB 174     free 72       dirty
27808    used 103064   free + dirty 27880    dark 4256 dead 0    nodes fit 6  
flags 0x1  (dirty)LEB 175     free 120      dirty 30488    used 100336   free +
dirty 30608    dark 4256 dead 0    nodes fit 7   flags 0x1  (dirty)LEB 176    
free 64       dirty 160      used 130720   free + dirty 224      dark 224  dead
0    nodes fit 0   flags 0x1  (dirty)LEB 177     free 120      dirty 23416   
used 107408   free + dirty 23536    dark 4256 dead 0    nodes fit 5   flags 0x1 
(dirty)LEB 178     free 48       dirty 55992    used 74904    free + dirty
56040    dark 4256 dead 0    nodes fit 13  flags 0x1  (dirty)LEB 179     free
88       dirty 1904     used 128952   free + dirty 1992     dark 1992 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 180     free 96       dirty 9712     used
121136   free + dirty 9808     dark 4256 dead 0    nodes fit 2   flags 0x1 
(dirty)LEB 181     free 72       dirty 320      used 130552   free + dirty
392      dark 392  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 182     free
128      dirty 23920    used 106896   free + dirty 24048    dark 4256 dead 0   
nodes fit 5   flags 0x1  (dirty)LEB 183     free 80       dirty 800      used
130064   free + dirty 880      dark 880  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 184     free 32       dirty 320      used 130592   free + dirty
352      dark 352  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 185     free
8        dirty 2400     used 128536   free + dirty 2408     dark 2408 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 186     free 8        dirty 64       used
130872   free + dirty 72       dark 72   dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 187     free 0        dirty 960      used 129984   free + dirty
960      dark 960  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 188     free
152      dirty 480      used 130312   free + dirty 632      dark 632  dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 189     free 48       dirty 640      used
130256   free + dirty 688      dark 688  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 190     free 56       dirty 93312    used 37576    free + dirty
93368    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)LEB 191     free
104      dirty 1920     used 128920   free + dirty 2024     dark 2024 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 192     free 0        dirty 160      used
130784   free + dirty 160      dark 160  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 193     free 0        dirty 800      used 130144   free + dirty
800      dark 800  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 194     free
24       dirty 128      used 130792   free + dirty 152      dark 152  dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 195     free 40       dirty 15816    used
115088   free + dirty 15856    dark 4256 dead 0    nodes fit 3   flags 0x1 
(dirty)LEB 196     free 32       dirty 39160    used 91752    free + dirty
39192    dark 4256 dead 0    nodes fit 9   flags 0x1  (dirty)LEB 197     free
40       dirty 36632    used 94272    free + dirty 36672    dark 4256 dead
0 &nb> sp;  nodes fit 8   flags 0x1  (dirty)LEB 198     free 16       dirty
62008    used 68920    free + dirty 62024    dark 4256 dead 0    nodes fit 14 
flags 0x1  (dirty)LEB 199     free 40       dirty 1600     used 129304   free +
dirty 1640     dark 1640 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 200    
free 56       dirty 160      used 130728   free + dirty 216      dark 216  dead
0    nodes fit 0   flags 0x1  (dirty)LEB 201     free 8        dirty 108008  
used 22928    free + dirty 108016   dark 4256 dead 0    nodes fit 25  flags 0x1 
(dirty)LEB 202     free 16       dirty 64       used 130864   free + dirty
80       dark 80   dead 0    nodes fit 0   flags 0x1  (dirty)LEB 203     free
71648    dirty 31168    used 28128    free + dirty 102816   flags 0x22 (dirty
index)LEB 204     free 24       dirty 66320    used 64600    free + dirty
66344    dark 4256 dead 0    nodes fit 15  flags 0x1  (dirty)LEB 205     free
8        dirty 1760     used 129176   free + dirty 1768     dark 1768 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 206     free 1048     dirty 125856   used
4040     free + dirty 126904   dark 4256 dead 0    nodes fit 29  flags 0x10
(taken, bud of jhead 2 (data))LEB 207     free 80       dirty 1480     used
129384   free + dirty 1560     dark 1560 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 208     free 104      dirty 9272     used 121568   free + dirty
9376     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)LEB 209     free
56       dirty 76344    used 54544    free + dirty 76400    dark 4256 dead 0   
nodes fit 17  flags 0x1  (dirty)LEB 210     free 40       dirty 85824    used
45080    free + dirty 85864    dark 4256 dead 0    nodes fit 20  flags 0x1 
(dirty)LEB 211     free 80       dirty 984      used 129880   free + dirty
1064     dark 1064 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 212     free
16       dirty 49080    used 81848    free + dirty 49096    dark 4256 dead 0   
nodes fit 11  flags 0x1  (dirty)LEB 213     free 48       dirty 93840    used
37056    free + dirty 93888    dark 4256 dead 0    nodes fit 22  flags 0x1 
(dirty)LEB 214     free 24       dirty 104256   used 26664    free + dirty
104280   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)LEB 215     free
112      dirty 111328   used 19504    free + dirty 111440   dark 4256 dead 0   
nodes fit 26  flags 0x1  (dirty)LEB 216     free 32       dirty 108456   used
22456    free + dirty 108488   dark 4256 dead 0    nodes fit 25  flags 0x1 
(dirty)LEB 217     free 144      dirty 100152   used 30648    free + dirty
100296   dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)LEB 218     free
32       dirty 108136   used 22776    free + dirty 108168   dark 4256 dead 0   
nodes fit 25  flags 0x1  (dirty)LEB 219     free 264      dirty 56600    used
74080    free + dirty 56864    flags 0x22 (dirty index)LEB 220     free 40      
dirty 89960    used 40944    free + dirty 90000    dark 4256 dead 0    nodes fit
21  flags 0x1  (dirty)LEB 221     free 56       dirty 23272    used 107616  
free + dirty 23328    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)LEB
222     free 144      dirty 480      used 130320   free + dirty 624      dark
624  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 223     free 96       dirty
1120     used 129728   free + dirty 1216     dark 1216 dead 0    nodes fit 0  
flags 0x1  (dirty)LEB 224     free 80       dirty 640      used 130224   free +
dirty 720      dark 720  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 225    
free 96       dirty 2560     used 128288   free + dirty 2656     dark 2656 dead
0    nodes fit 0   flags 0x1  (dirty)LEB 226     free 64       dirty 1120    
used 129760   free + dirty 1184     dark 1184 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 227     free 24       dirty 92784    used 38136    free + dirty
92808    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)LEB 228     free
0        dirty 18472    used 112472   free + dirty 18472    dark 4256 dead 0   
nodes fit 4   flags 0x1  (dirty)LEB 229     free 0        dirty 1760     used
129184   free + dirty 1760     dark 1760 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 230     free 40       dirty 640      used 130264   free + dirty
680      dark 680  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 231     free
24       dirty 1280     used 129640   free + dirty 1304     dark 1304 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 232     free 40       dirty 640      used
130264   free + dirty 680      dark 680  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 233     free 0        dirty 1280     used 129664   free + dirty
1280     dark 1280 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 234     free
0        dirty 80       used 130864   free + dirty 80       dark 80   dead 0   
node> s fit 0   flags 0x1  (dirty)LEB 235     free 64       dirty 320      used
130560   free + dirty 384      dark 384  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 236     free 56       dirty 320      used 130568   free + dirty
376      dark 376  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 237     free
0        dirty 0        used 130944   free + dirty 0        dark 0    dead 0   
nodes fit 0   flags 0x10 (taken, jhead 0(GC))LEB 238     free 16       dirty
960      used 129968   free + dirty 976      dark 976  dead 0    nodes fit 0  
flags 0x1  (dirty)LEB 239     free 48       dirty 100736   used 30160    free +
dirty 100784   dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)LEB 240    
free 88       dirty 110216   used 20640    free + dirty 110304   dark 4256 dead
0    nodes fit 25  flags 0x1  (dirty)LEB 241     free 8        dirty 960     
used 129976   free + dirty 968      dark 968  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 242     free 24       dirty 20632    used 110288   free + dirty
20656    dark 4256 dead 0    nodes fit 4   flags 0x1  (dirty)LEB 243     free
0        dirty 2720     used 128224   free + dirty 2720     dark 2720 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 244     free 144      dirty 640      used
130160   free + dirty 784      dark 784  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 245     free 1400     dirty 110912   used 18632    free + dirty
112312   flags 0x22 (dirty index)LEB 246     free 0        dirty 640      used
130304   free + dirty 640      dark 640  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 247     free 32       dirty 640      used 130272   free + dirty
672      dark 672  dead 0    nodes fit 0   flags 0x1  (dirty)LEB 248     free
112      dirty 1760     used 129072   free + dirty 1872     dark 1872 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 249     free 96       dirty 3360     used
127488   free + dirty 3456     dark 3456 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 250     free 0        dirty 1280     used 129664   free + dirty
1280     dark 1280 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 251     free
48       dirty 54736    used 76160    free + dirty 54784    dark 4256 dead 0   
nodes fit 12  flags 0x1  (dirty)LEB 252     free 88       dirty 47472    used
83384    free + dirty 47560    dark 4256 dead 0    nodes fit 11  flags 0x1 
(dirty)LEB 253     free 0        dirty 78304    used 52640    free + dirty
78304    dark 4256 dead 0    nodes fit 18  flags 0x1  (dirty)LEB 254     free
48       dirty 109800   used 21096    free + dirty 109848   dark 4256 dead 0   
nodes fit 25  flags 0x1  (dirty)LEB 255     free 120      dirty 19704    used
111120   free + dirty 19824    dark 4256 dead 0    nodes fit 4   flags 0x1 
(dirty)LEB 256     free 136      dirty 98760    used 32048    free + dirty
98896    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)LEB 257     free
136      dirty 80736    used 50072    free + dirty 80872    dark 4256 dead 0   
nodes fit 19  flags 0x1  (dirty)LEB 258     free 40       dirty 480      used
130424   free + dirty 520      dark 520  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 259     free 48       dirty 109424   used 21472    free + dirty
109472   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)LEB 260     free
88       dirty 2080     used 128776   free + dirty 2168     dark 2168 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 261     free 104      dirty 480      used
130360   free + dirty 584      dark 584  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 262     free 240      dirty 125416   used 5288     free + dirty
125656   dark 4256 dead 0    nodes fit 29  flags 0x1  (dirty)LEB 263     free
16       dirty 640      used 130288   free + dirty 656      dark 656  dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 264     free 64       dirty 2240     used
128640   free + dirty 2304     dark 2304 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 265     free 0        dirty 24520    used 106424   free + dirty
24520    dark 4256 dead 0    nodes fit 5   flags 0x1  (dirty)LEB 266     free
128      dirty 160      used 130656   free + dirty 288      dark 288  dead 0   
nodes fit 0   flags 0x0  (not categorized)LEB 267     free 104      dirty
124248   used 6592     free + dirty 124352   dark 4256 dead 0    nodes fit 29 
flags 0x1  (dirty)LEB 268     free 88       dirty 160      used 130696   free +
dirty 248      dark 248  dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
269     free 72       dirty 160      used 130712   free + dirty 232      dark
232  dead 0    nodes fit 0   flags 0x0  (not categorized)LEB 270     free
120      dirty 960      used 129864   free + dirty 1080     dark 1080 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 271>      free 88       dirty 103400   used
27456    free + dirty 103488   dark 4256 dead 0    nodes fit 24  flags 0x1 
(dirty)LEB 272     free 96       dirty 112344   used 18504    free + dirty
112440   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)LEB 273     free
88       dirty 2080     used 128776   free + dirty 2168     dark 2168 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 274     free 112      dirty 75144    used
55688    free + dirty 75256    dark 4256 dead 0    nodes fit 17  flags 0x1 
(dirty)LEB 275     free 88       dirty 93264    used 37592    free + dirty
93352    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)LEB 276     free
56       dirty 99160    used 31728    free + dirty 99216    dark 4256 dead 0   
nodes fit 23  flags 0x1  (dirty)LEB 277     free 64       dirty 57136    used
73744    free + dirty 57200    dark 4256 dead 0    nodes fit 13  flags 0x1 
(dirty)LEB 278     free 80       dirty 8472     used 122392   free + dirty
8552     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)LEB 279     free
80       dirty 2080     used 128784   free + dirty 2160     dark 2160 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 280     free 0        dirty 8576     used
122368   free + dirty 8576     dark 4256 dead 0    nodes fit 2   flags 0x1 
(dirty)LEB 281     free 128      dirty 81352    used 49464    free + dirty
81480    dark 4256 dead 0    nodes fit 19  flags 0x1  (dirty)LEB 282     free
56       dirty 1920     used 128968   free + dirty 1976     dark 1976 dead 0   
nodes fit 0   flags 0x0  (not categorized)LEB 283     free 0        dirty
1920     used 129024   free + dirty 1920     dark 1920 dead 0    nodes fit 0  
flags 0x1  (dirty)LEB 284     free 16       dirty 2080     used 128848   free +
dirty 2096     dark 2096 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
285     free 64       dirty 320      used 130560   free + dirty 384      dark
384  dead 0    nodes fit 0   flags 0x0  (not categorized)LEB 286     free
72       dirty 109792   used 21080    free + dirty 109864   dark 4256 dead 0   
nodes fit 25  flags 0x1  (dirty)LEB 287     free 0        dirty 98144    used
32800    free + dirty 98144    dark 4256 dead 0    nodes fit 23  flags 0x1 
(dirty)LEB 288     free 16576    dirty 89760    used 24608    free + dirty
106336   flags 0x22 (dirty index)LEB 289     free 144      dirty 11304    used
119496   free + dirty 11448    dark 4256 dead 0    nodes fit 2   flags 0x1 
(dirty)LEB 290     free 104      dirty 58744    used 72096    free + dirty
58848    dark 4256 dead 0    nodes fit 13  flags 0x1  (dirty)LEB 291     free
144      dirty 64856    used 65944    free + dirty 65000    dark 4256 dead 0   
nodes fit 15  flags 0x1  (dirty)LEB 292     free 88       dirty 320      used
130536   free + dirty 408      dark 408  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 293     free 4952     dirty 124872   used 1120     free + dirty
129824   dark 4256 dead 0    nodes fit 30  flags 0x10 (taken, jhead 1 (base))LEB
294     free 32       dirty 1440     used 129472   free + dirty 1472     dark
1472 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB 295     free
128      dirty 960      used 129856   free + dirty 1088     dark 1088 dead 0   
nodes fit 0   flags 0x0  (not categorized)LEB 296     free 8        dirty
1920     used 129016   free + dirty 1928     dark 1928 dead 0    nodes fit 0  
flags 0x0  (not categorized)LEB 297     free 128      dirty 800      used
130016   free + dirty 928      dark 928  dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 298     free 136      dirty 1120     used 129688   free + dirty
1256     dark 1256 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
299     free 16       dirty 1440     used 129488   free + dirty 1456     dark
1456 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB 300     free
32       dirty 103952   used 26960    free + dirty 103984   flags 0x22 (dirty
index)LEB 301     free 40       dirty 96       used 130808   free + dirty
136      dark 136  dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
302     free 80       dirty 800      used 130064   free + dirty 880      dark
880  dead 0    nodes fit 0   flags 0x0  (not categorized)LEB 303     free
152      dirty 1120     used 129672   free + dirty 1272     dark 1272 dead 0   
nodes fit 0   flags 0x0  (not categorized)LEB 304     free 0        dirty
480      used 130464   free + dirty 480      dark 480  dead 0    nodes fit 0  
flags 0x0  (not categorized)LEB 305     free 96       dirty 2080     used
128768   free + dirty 2176     dark 2176 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 306     free 64       dirty 1440     used 129440   free + dirty
1504     dark 1504 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
307     free 16       dirty 1920     used 129008   free + dirty 1936     da> rk
1936 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 308     free 16       dirty
1920     used 129008   free + dirty 1936     dark 1936 dead 0    nodes fit 0  
flags 0x1  (dirty)LEB 309     free 8        dirty 1440     used 129496   free +
dirty 1448     dark 1448 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 310    
free 136      dirty 1760     used 129048   free + dirty 1896     dark 1896 dead
0    nodes fit 0   flags 0x1  (dirty)LEB 311     free 24       dirty 7496    
used 123424   free + dirty 7520     dark 4256 dead 0    nodes fit 1   flags 0x1 
(dirty)LEB 312     free 680      dirty 125816   used 4448     free + dirty
126496   dark 4256 dead 0    nodes fit 29  flags 0x10 (taken, bud of jhead 2
(data))LEB 313     free 0        dirty 15928    used 115016   free + dirty
15928    dark 4256 dead 0    nodes fit 3   flags 0x1  (dirty)LEB 314     free
24       dirty 42344    used 88576    free + dirty 42368    dark 4256 dead 0   
nodes fit 9   flags 0x1  (dirty)LEB 315     free 96       dirty 99848    used
31000    free + dirty 99944    dark 4256 dead 0    nodes fit 23  flags 0x1 
(dirty)LEB 316     free 48       dirty 95152    used 35744    free + dirty
95200    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)LEB 317     free
8        dirty 0        used 130936   free + dirty 8        dark 0    dead 8   
nodes fit 0   flags 0x3  (free)LEB 318     free 72       dirty 8088     used
122784   free + dirty 8160     dark 4256 dead 0    nodes fit 1   flags 0x1 
(dirty)LEB 319     free 40       dirty 1440     used 129464   free + dirty
1480     dark 1480 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
320     free 120      dirty 960      used 129864   free + dirty 1080     dark
1080 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 321     free 32       dirty
480      used 130432   free + dirty 512      dark 512  dead 0    nodes fit 0  
flags 0x1  (dirty)LEB 322     free 40       dirty 1600     used 129304   free +
dirty 1640     dark 1640 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 323    
free 56       dirty 108416   used 22472    free + dirty 108472   dark 4256 dead
0    nodes fit 25  flags 0x1  (dirty)LEB 324     free 96       dirty 960     
used 129888   free + dirty 1056     dark 1056 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 325     free 0        dirty 2720     used 128224   free + dirty
2720     dark 2720 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 326     free
56       dirty 9344     used 121544   free + dirty 9400     dark 4256 dead 0   
nodes fit 2   flags 0x0  (not categorized)LEB 327     free 8        dirty
1904     used 129032   free + dirty 1912     dark 1912 dead 0    nodes fit 0  
flags 0x0  (not categorized)LEB 328     free 96       dirty 8376     used
122472   free + dirty 8472     dark 4256 dead 0    nodes fit 1   flags 0x1 
(dirty)LEB 329     free 66160    dirty 41304    used 23480    free + dirty
107464   flags 0x22 (dirty index)LEB 330     free 0        dirty 109496   used
21448    free + dirty 109496   dark 4256 dead 0    nodes fit 25  flags 0x1 
(dirty)LEB 331     free 0        dirty 89744    used 41200    free + dirty
89744    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)LEB 332     free
128      dirty 111744   used 19072    free + dirty 111872   dark 4256 dead 0   
nodes fit 26  flags 0x1  (dirty)LEB 333     free 56       dirty 105848   used
25040    free + dirty 105904   dark 4256 dead 0    nodes fit 24  flags 0x1 
(dirty)LEB 334     free 80       dirty 110080   used 20784    free + dirty
110160   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)LEB 335     free
112      dirty 52312    used 78520    free + dirty 52424    dark 4256 dead 0   
nodes fit 12  flags 0x1  (dirty)LEB 336     free 40       dirty 99824    used
31080    free + dirty 99864    dark 4256 dead 0    nodes fit 23  flags 0x1 
(dirty)LEB 337     free 128      dirty 111152   used 19664    free + dirty
111280   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)LEB 338     free
24       dirty 74768    used 56152    free + dirty 74792    dark 4256 dead 0   
nodes fit 17  flags 0x1  (dirty)LEB 339     free 128      dirty 87632    used
43184    free + dirty 87760    dark 4256 dead 0    nodes fit 20  flags 0x1 
(dirty)LEB 340     free 32       dirty 93392    used 37520    free + dirty
93424    dark 4256 dead 0    nodes fit 21  flags 0x1  (dirty)LEB 341     free
56       dirty 93800    used 37088    free + dirty 93856    dark 4256 dead 0   
nodes fit 22  flags 0x1  (dirty)LEB 342     free 0        dirty 86024    used
44920    free + dirty 86024    dark 4256 dead 0    nodes fit 20  flags 0x1 
(dirty)LEB 343     free 31880    dirty 81056    used 18008    free + dirty
112936   flags 0x22 (dirty index)LEB 344     free 0        dirty 130944   used
0        free + dirty 130944   dark 4256 dead 0    nodes fit 30  flags 0x5  (f>
reeable)LEB 345     free 40176    dirty 62576    used 28192    free + dirty
102752   flags 0x22 (dirty index)LEB 346     free 96       dirty 108880   used
21968    free + dirty 108976   dark 4256 dead 0    nodes fit 25  flags 0x1 
(dirty)LEB 347     free 144      dirty 48248    used 82552    free + dirty
48392    dark 4256 dead 0    nodes fit 11  flags 0x1  (dirty)LEB 348     free
40       dirty 99680    used 31224    free + dirty 99720    dark 4256 dead 0   
nodes fit 23  flags 0x1  (dirty)LEB 349     free 120      dirty 104912   used
25912    free + dirty 105032   dark 4256 dead 0    nodes fit 24  flags 0x1 
(dirty)LEB 350     free 136      dirty 2400     used 128408   free + dirty
2536     dark 2536 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 351     free
96       dirty 8152     used 122696   free + dirty 8248     dark 4256 dead 0   
nodes fit 1   flags 0x1  (dirty)LEB 352     free 96       dirty 31248    used
99600    free + dirty 31344    dark 4256 dead 0    nodes fit 7   flags 0x1 
(dirty)LEB 353     free 8        dirty 1440     used 129496   free + dirty
1448     dark 1448 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 354     free
120      dirty 1112     used 129712   free + dirty 1232     dark 1232 dead 0   
nodes fit 0   flags 0x0  (not categorized)LEB 355     free 56       dirty
25824    used 105064   free + dirty 25880    dark 4256 dead 0    nodes fit 6  
flags 0x1  (dirty)LEB 356     free 112      dirty 1840     used 128992   free +
dirty 1952     dark 1952 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
357     free 48       dirty 97264    used 33632    free + dirty 97312    dark
4256 dead 0    nodes fit 22  flags 0x1  (dirty)LEB 358     free 8        dirty
6736     used 124200   free + dirty 6744     dark 4256 dead 0    nodes fit 1  
flags 0x1  (dirty)LEB 359     free 72       dirty 104552   used 26320    free +
dirty 104624   dark 4256 dead 0    nodes fit 24  flags 0x1  (dirty)LEB 360    
free 136      dirty 3008     used 127800   free + dirty 3144     dark 3144 dead
0    nodes fit 0   flags 0x0  (not categorized)LEB 361     free 48       dirty
106704   used 24192    free + dirty 106752   dark 4256 dead 0    nodes fit 25 
flags 0x1  (dirty)LEB 362     free 40       dirty 95136    used 35768    free +
dirty 95176    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)LEB 363    
free 128      dirty 9264     used 121552   free + dirty 9392     dark 4256 dead
0    nodes fit 2   flags 0x1  (dirty)LEB 364     free 96       dirty 320     
used 130528   free + dirty 416      dark 416  dead 0    nodes fit 0   flags 0x0 
(not categorized)LEB 365     free 48       dirty 94408    used 36488    free +
dirty 94456    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)LEB 366    
free 72       dirty 1288     used 129584   free + dirty 1360     dark 1360 dead
0    nodes fit 0   flags 0x0  (not categorized)LEB 367     free 8        dirty
8808     used 122128   free + dirty 8816     dark 4256 dead 0    nodes fit 2  
flags 0x1  (dirty)LEB 368     free 56       dirty 2368     used 128520   free +
dirty 2424     dark 2424 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 369    
free 32       dirty 41872    used 89040    free + dirty 41904    dark 4256 dead
0    nodes fit 9   flags 0x1  (dirty)LEB 370     free 136      dirty 26984   
used 103824   free + dirty 27120    dark 4256 dead 0    nodes fit 6   flags 0x0 
(not categorized)LEB 371     free 152      dirty 1864     used 128928   free +
dirty 2016     dark 2016 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
372     free 24       dirty 1576     used 129344   free + dirty 1600     dark
1600 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 373     free 16       dirty
2368     used 128560   free + dirty 2384     dark 2384 dead 0    nodes fit 0  
flags 0x1  (dirty)LEB 374     free 128      dirty 98464    used 32352    free +
dirty 98592    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)LEB 375    
free 24       dirty 1480     used 129440   free + dirty 1504     dark 1504 dead
0    nodes fit 0   flags 0x0  (not categorized)LEB 376     free 16       dirty
1328     used 129600   free + dirty 1344     dark 1344 dead 0    nodes fit 0  
flags 0x0  (not categorized)LEB 377     free 96       dirty 2376     used
128472   free + dirty 2472     dark 2472 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 378     free 8        dirty 1760     used 129176   free + dirty
1768     dark 1768 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
379     free 80       dirty 112208   used 18656    free + dirty 112288   dark
4256 dead 0    nodes fit 26  flags 0x1  (dirty)LEB 380     free 144      dirty
99024    used 31776    free + dirty 99168    dark 4256 dead 0    nodes fit 23 
flags 0x1  (dirty)LEB 381     free 40       dirty 81256    used 49648    free +
dirty 81296    dark 4256 dead 0    nodes fit 19  flags 0x1 > ; (dirty)LEB
382     free 96       dirty 1072     used 129776   free + dirty 1168     dark
1168 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB 383     free
96       dirty 2344     used 128504   free + dirty 2440     dark 2440 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 384     free 16       dirty 760      used
130168   free + dirty 776      dark 776  dead 0    nodes fit 0   flags 0x0  (not
categorized)LEB 385     free 56       dirty 2672     used 128216   free + dirty
2728     dark 2728 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 386     free
40       dirty 95928    used 34976    free + dirty 95968    dark 4256 dead 0   
nodes fit 22  flags 0x1  (dirty)LEB 387     free 8        dirty 99496    used
31440    free + dirty 99504    dark 4256 dead 0    nodes fit 23  flags 0x1 
(dirty)LEB 388     free 72       dirty 110648   used 20224    free + dirty
110720   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)LEB 389     free
152      dirty 99536    used 31256    free + dirty 99688    dark 4256 dead 0   
nodes fit 23  flags 0x1  (dirty)LEB 390     free 5888     dirty 104784   used
20272    free + dirty 110672   flags 0x22 (dirty index)LEB 391     free 152     
dirty 71184    used 59608    free + dirty 71336    dark 4256 dead 0    nodes fit
16  flags 0x1  (dirty)LEB 392     free 16       dirty 2240     used 128688  
free + dirty 2256     dark 2256 dead 0    nodes fit 0   flags 0x0  (not
categorized)LEB 393     free 112      dirty 2232     used 128600   free + dirty
2344     dark 2344 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 394     free
40       dirty 1088     used 129816   free + dirty 1128     dark 1128 dead 0   
nodes fit 0   flags 0x0  (not categorized)LEB 395     free 8        dirty
84400    used 46536    free + dirty 84408    dark 4256 dead 0    nodes fit 19 
flags 0x1  (dirty)LEB 396     free 136      dirty 93696    used 37112    free +
dirty 93832    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)LEB 397    
free 48       dirty 110888   used 20008    free + dirty 110936   dark 4256 dead
0    nodes fit 26  flags 0x1  (dirty)LEB 398     free 58064    dirty 54072   
used 18808    free + dirty 112136   flags 0x22 (dirty index)LEB 399     free
120      dirty 84936    used 45888    free + dirty 85056    dark 4256 dead 0   
nodes fit 19  flags 0x1  (dirty)LEB 400     free 77168    dirty 37248    used
16528    free + dirty 114416   flags 0x22 (dirty index)LEB 401     free 96      
dirty 92512    used 38336    free + dirty 92608    dark 4256 dead 0    nodes fit
21  flags 0x1  (dirty)LEB 402     free 136      dirty 9360     used 121448  
free + dirty 9496     dark 4256 dead 0    nodes fit 2   flags 0x0  (not
categorized)LEB 403     free 144      dirty 480      used 130320   free + dirty
624      dark 624  dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
404     free 27096    dirty 74360    used 29488    free + dirty 101456   flags
0x22 (dirty index)LEB 405     free 0        dirty 63200    used 67744    free +
dirty 63200    dark 4256 dead 0    nodes fit 14  flags 0x1  (dirty)LEB 406    
free 64       dirty 2672     used 128208   free + dirty 2736     dark 2736 dead
0    nodes fit 0   flags 0x0  (not categorized)LEB 407     free 88       dirty
109440   used 21416    free + dirty 109528   dark 4256 dead 0    nodes fit 25 
flags 0x1  (dirty)LEB 408     free 96       dirty 110248   used 20600    free +
dirty 110344   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)LEB 409    
free 88       dirty 3912     used 126944   free + dirty 4000     dark 4000 dead
0    nodes fit 0   flags 0x1  (dirty)LEB 410     free 16       dirty 1768    
used 129160   free + dirty 1784     dark 1784 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 411     free 88       dirty 5312     used 125544   free + dirty
5400     dark 4256 dead 0    nodes fit 1   flags 0x1  (dirty)LEB 412     free
130944   dirty 0        used 0        free + dirty 130944   dark 4256 dead 0   
nodes fit 30  flags 0x10 (taken, bud of jhead 2 (data))LEB 413     free 112     
dirty 9480     used 121352   free + dirty 9592     dark 4256 dead 0    nodes fit
2   flags 0x1  (dirty)LEB 414     free 0        dirty 101064   used 29880   
free + dirty 101064   dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)LEB
415     free 48       dirty 98656    used 32240    free + dirty 98704    dark
4256 dead 0    nodes fit 23  flags 0x1  (dirtyLEB 416     free 48       dirty
86224    used 44672    free + dirty 86272    dark 4256 dead 0    nodes fit 20 
flags 0x1  (dirty)LEB 417     free 48       dirty 16552    used 114344   free +
dirty 16600    dark 4256 dead 0    nodes fit 3   flags 0x1  (dirty)LEB 418    
free 128      dirty 76176    used 54640    free + dirty 76304    dark 4256 dead
0    nodes fit 17  flags 0x1  (dirty)LEB 419     free 82224    dirty 30024   
used 18696    free + dirty 112248   flags 0x22 (dirty index)LEB 420     > free
38112    dirty 70008    used 22824    free + dirty 108120   flags 0x22 (dirty
index)LEB 421     free 42104    dirty 66416    used 22424    free + dirty
108520   flags 0x22 (dirty index)LEB 422     free 15768    dirty 98416    used
16760    free + dirty 114184   flags 0x22 (dirty index)LEB 423     free 112     
dirty 2504     used 128328   free + dirty 2616     dark 2616 dead 0    nodes fit
0   flags 0x1  (dirty)LEB 424     free 56       dirty 3184     used 127704  
free + dirty 3240     dark 3240 dead 0    nodes fit 0   flags 0x1  (dirty)LEB
425     free 8        dirty 61376    used 69560    free + dirty 61384    dark
4256 dead 0    nodes fit 14  flags 0x1  (dirty)LEB 426     free 8        dirty
880      used 130056   free + dirty 888      dark 888  dead 0    nodes fit 0  
flags 0x0  (not categorized)LEB 427     free 24       dirty 1848     used
129072   free + dirty 1872     dark 1872 dead 0    nodes fit 0   flags 0x0  (not
categorized)LEB 428     free 0        dirty 888      used 130056   free + dirty
888      dark 888  dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
429     free 48       dirty 640      used 130256   free + dirty 688      dark
688  dead 0    nodes fit 0   flags 0x0  (not categorized)LEB 430     free
16       dirty 1432     used 129496   free + dirty 1448     dark 1448 dead 0   
nodes fit 0   flags 0x0  (not categorized)LEB 431     free 8        dirty
64       used 130872   free + dirty 72       dark 72   dead 0    nodes fit 0  
flags 0x0  (not categorized)LEB 432     free 56       dirty 1984     used
128904   free + dirty 2040     dark 2040 dead 0    nodes fit 0   flags 0x0  (not
categorized)LEB 433     free 32       dirty 2992     used 127920   free + dirty
3024     dark 3024 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 434     free
96       dirty 107624   used 23224    free + dirty 107720   dark 4256 dead 0   
nodes fit 25  flags 0x1  (dirty)LEB 435     free 80       dirty 18656    used
112208   free + dirty 18736    dark 4256 dead 0    nodes fit 4   flags 0x1 
(dirty)LEB 436     free 48       dirty 96312    used 34584    free + dirty
96360    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)LEB 437     free
88       dirty 111288   used 19568    free + dirty 111376   dark 4256 dead 0   
nodes fit 26  flags 0x1  (dirty)LEB 438     free 104      dirty 1824     used
129016   free + dirty 1928     dark 1928 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 439     free 0        dirty 1376     used 129568   free + dirty
1376     dark 1376 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 440     free
40       dirty 94600    used 36304    free + dirty 94640    dark 4256 dead 0   
nodes fit 22  flags 0x1  (dirty)LEB 441     free 144      dirty 112056   used
18744    free + dirty 112200   dark 4256 dead 0    nodes fit 26  flags 0x1 
(dirty)LEB 442     free 72       dirty 107008   used 23864    free + dirty
107080   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)LEB 443     free
120      dirty 98544    used 32280    free + dirty 98664    dark 4256 dead 0   
nodes fit 23  flags 0x1  (dirty)LEB 444     free 8        dirty 91832    used
39104    free + dirty 91840    dark 4256 dead 0    nodes fit 21  flags 0x1 
(dirty)LEB 445     free 104      dirty 96344    used 34496    free + dirty
96448    dark 4256 dead 0    nodes fit 22  flags 0x1  (dirty)LEB 446     free
152      dirty 91600    used 39192    free + dirty 91752    dark 4256 dead 0   
nodes fit 21  flags 0x1  (dirty)LEB 447     free 8        dirty 9008     used
121928   free + dirty 9016     dark 4256 dead 0    nodes fit 2   flags 0x1 
(dirty)LEB 448     free 120      dirty 1440     used 129384   free + dirty
1560     dark 1560 dead 0    nodes fit 0   flags 0x0  (not categorized)LEB
449     free 144      dirty 7480     used 123320   free + dirty 7624     dark
4256 dead 0    nodes fit 1   flags 0x1  (dirty)LEB 450     free 88       dirty
7352     used 123504   free + dirty 7440     dark 4256 dead 0    nodes fit 1  
flags 0x0  (not categorized)LEB 451     free 80       dirty 58008    used
72856    free + dirty 58088    dark 4256 dead 0    nodes fit 13  flags 0x1 
(dirty)LEB 452     free 9040     dirty 95656    used 26248    free + dirty
104696   flags 0x22 (dirty index)LEB 453     free 8152     dirty 113096   used
9696     free + dirty 121248   flags 0x30 (index, taken)LEB 454     free
40       dirty 99984    used 30920    free + dirty 100024   dark 4256 dead 0   
nodes fit 23  flags 0x1  (dirty)LEB 455     free 56       dirty 7832     used
123056   free + dirty 7888     dark 4256 dead 0    nodes fit 1   flags 0x1 
(dirty)LEB 456     free 64       dirty 111448   used 19432    free + dirty
111512   dark 4256 dead 0    nodes fit 26  flags 0x1  (dirty)LEB 457     free
40       dirty 95480    used 35424    free + dirty 95520    dark 4256 dead 0   
nodes fit 22  flags 0x1  (dirty)L> EB 458     free 60056    dirty 53472    used
17416    free + dirty 113528   flags 0x22 (dirty index)LEB 459     free 16      
dirty 100136   used 30792    free + dirty 100152   dark 4256 dead 0    nodes fit
23  flags 0x1  (dirty)LEB 460     free 0        dirty 320      used 130624  
free + dirty 320      dark 320  dead 0    nodes fit 0   flags 0x0  (not
categorized)LEB 461     free 104      dirty 109608   used 21232    free + dirty
109712   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)LEB 462     free
64       dirty 114528   used 16352    free + dirty 114592   dark 4256 dead 0   
nodes fit 26  flags 0x1  (dirty)LEB 463     free 152      dirty 109624   used
21168    free + dirty 109776   dark 4256 dead 0    nodes fit 25  flags 0x1 
(dirty)LEB 464     free 112      dirty 99080    used 31752    free + dirty
99192    dark 4256 dead 0    nodes fit 23  flags 0x1  (dirty)LEB 465     free
72       dirty 99264    used 31608    free + dirty 99336    dark 4256 dead 0   
nodes fit 23  flags 0x1  (dirty)LEB 466     free 48       dirty 480      used
130416   free + dirty 528      dark 528  dead 0    nodes fit 0   flags 0x0  (not
categorized)LEB 467     free 152      dirty 2560     used 128232   free + dirty
2712     dark 2712 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 468     free
55128    dirty 47592    used 28224    free + dirty 102720   flags 0x22 (dirty
index)LEB 469     free 130944   dirty 0        used 0        free + dirty
130944   dark 4256 dead 0    nodes fit 30  flags 0x10 (taken, jhead 2(data))LEB
470     free 40       dirty 1968     used 128936   free + dirty 2008     dark
2008 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 471     free 144      dirty
960      used 129840   free + dirty 1104     dark 1104 dead 0    nodes fit 0  
flags 0x0  (not categorized)LEB 472     free 32       dirty 9000     used
121912   free + dirty 9032     dark 4256 dead 0    nodes fit 2   flags 0x1 
(dirty)LEB 473     free 144      dirty 9048     used 121752   free + dirty
9192     dark 4256 dead 0    nodes fit 2   flags 0x1  (dirty)LEB 474     free
0        dirty 126600   used 4344     free + dirty 126600   dark 4256 dead 0   
nodes fit 29  flags 0x1  (dirty)LEB 475     free 152      dirty 63856    used
66936    free + dirty 64008    dark 4256 dead 0    nodes fit 15  flags 0x1 
(dirty)LEB 476     free 144      dirty 1760     used 129040   free + dirty
1904     dark 1904 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 477     free
88       dirty 2008     used 128848   free + dirty 2096     dark 2096 dead 0   
nodes fit 0   flags 0x0  (not categorized)LEB 478     free 13448    dirty
99712    used 17784    free + dirty 113160   flags 0x22 (dirty index)LEB 479    
free 104      dirty 9152     used 121688   free + dirty 9256     dark 4256 dead
0    nodes fit 2   flags 0x1  (dirty)LEB 480     free 0        dirty 1152    
used 129792   free + dirty 1152     dark 1152 dead 0    nodes fit 0   flags 0x1 
(dirty)LEB 481     free 0        dirty 2664     used 128280   free + dirty
2664     dark 2664 dead 0    nodes fit 0   flags 0x1  (dirty)LEB 482     free
112      dirty 125704   used 5128     free + dirty 125816   dark 4256 dead 0   
nodes fit 29  flags 0x1  (dirty)LEB 483     free 80       dirty 8288     used
122576   free + dirty 8368     dark 4256 dead 0    nodes fit 1   flags 0x0  (not
categorized)LEB 484     free 168      dirty 125736   used 5040     free + dirty
125904   dark 4256 dead 0    nodes fit 29  flags 0x1  (dirty)LEB 485     free
48       dirty 2696     used 128200   free + dirty 2744     dark 2744 dead 0   
nodes fit 0   flags 0x1  (dirty)LEB 486     free 96       dirty 107016   used
23832    free + dirty 107112   dark 4256 dead 0    nodes fit 25  flags 0x1 
(dirty)LEB 487     free 56       dirty 110128   used 20760    free + dirty
110184   dark 4256 dead 0    nodes fit 25  flags 0x1  (dirty)LEB 488     free
67464    dirty 36960    used 26520    free + dirty 104424   flags 0x22 (dirty
index)(pid 958) finish dumping LEB properties(pid 958) Budgeting info: data
budget sum 0, total budget sum 0        budg_data_growth 0, budg_dd_growth 0,
budg_idx_growth 0        min_idx_lebs 19, old_idx_sz 774952, uncommitted_idx
9024        page_budget 4144, inode_budget 160, dent_budget 312        nospace
0, nospace_rp 0        dark_wm 4256, dead_wm 56, max_idx_node_sz 192       
freeable_cnt 1, calc_idx_sz 768632, idx_gc_cnt 0        dirty_pg_cnt 0,
dirty_zn_cnt 47, clean_zn_cnt 0        gc_lnum -1, ihead_lnum 453        jhead 0
(GC)     LEB 237        jhead 1 (base)   LEB 293        jhead 2 (data)   LEB
469        bud LEB 92        bud LEB 206        bud LEB 237        bud LEB
293        bud LEB 312        bud LEB 412        bud LEB 469        commit state
0Budgeting predictions:      &> nbsp; available: 16938560, outstanding 0, free
16002679mount: No space left on device
> 
> Attachment (ubifs.3.0.diff): application/octet-stream, 425 KiB
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


I've been running with the patched kernel for about a month now and I've seen
this issue once since then.  Does anyone have any other ideas on how I can
better track this down.  I've taken precautions to test if the external data
partitions mounted properly, if not, then they are reformatted and initialized.
 I will have a problem if the issue occurs in the root filesystem.

Thanks,
Bud
