Date: Fri, 7 Jan 2005 14:23:42 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501071142460.12054@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.58.0501071419550.12054@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
	<20041223135231.GB24503@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412231634580.4006@phoenix.infradead.org>
	<Pine.LNX.4.58.0501071100260.12054@phoenix.infradead.org>
	<1105096161.5547.106.camel@baythorne.infradead.org>
	<Pine.LNX.4.61.0501071127370.26716@hex.linuxgrrls.org>
	<Pine.LNX.4.58.0501071142460.12054@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1456859747-1961630448-1105107822=:12054"
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, joakim.tjernlund@lumentis.se,
	jasmine@linuxgrrls.org
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--1456859747-1961630448-1105107822=:12054
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hello,

here is the test. 

I added ARM support and use timers in case of ARM. I use the 
system_timer->offset() call which returns the content of the timer 
registers casted to nanoseconds. On small problem - the system_timer 
structure is not exported, so I failed to create module in case of ARM. 
But it is still possible to compile it with kernel and the test will be 
performed during linux load.

The new test version is attached. Please, review it. If it is possible, 
try on linux board you have. MIPS, PPC, ARM IMHO especially interesting.
If there are some offers to add smth to test, you are welcome :-)

I've run the test on ARM and x86.
My results show that Jorn's adler32r is the winer (adler32 is the next).

Strange results with data walks - two backward walks are fastest. This 
doesn't fit what we discussed about passing data forward then backward... 
May be 128K array is too small?

P.S. Test is attached.

-----------------------------------------------------------------------
ARM (OMAP):

#cat /proc/cpuinfo
Processor       : ARM926EJ-Sid(wb) rev 3 (v5l)
BogoMIPS        : 107.72
Features        : swp half thumb fastmult edsp java
CPU implementer : 0x41
CPU architecture: 5TEJ
CPU variant     : 0x0
CPU part        : 0x926
CPU revision    : 3
Cache type      : VIPT write-back
Cache clean     : cp15 c7 ops
Cache lockdown  : format C
Cache format    : Harvard
I size          : 32768
I assoc         : 4
I line length   : 32
I sets          : 256
D size          : 16384
D assoc         : 4
D line length   : 32
D sets          : 128

[crctest] (ARM timers) Data pass both forward, 32 bytes: delta 10, ts1 
86284, ts2 86294
[crctest] (ARM timers) Data pass both backward, 32 bytes: delta 8, ts1 
165359, ts2 165367
[crctest] (ARM timers) Data pass backward/forward, 32 bytes: delta 9, ts1 
244402, ts2 244411
[crctest] (ARM timers) Data pass forward/backward, 32 bytes: delta 9, ts1 
323449, ts2 323458
[crctest] (ARM timers) Data pass both forward, 4096 bytes: delta 635, ts1 
402496, ts2 403131
[crctest] (ARM timers) Data pass both backward, 4096 bytes: delta 524, ts1 
482171, ts2 482695
[crctest] (ARM timers) Data pass backward/forward, 4096 bytes: delta 582, 
ts1 561735, ts2 562317
[crctest] (ARM timers) Data pass forward/backward, 4096 bytes: delta 577, 
ts1 641359, ts2 641936
[crctest] (ARM timers) Data pass both forward, 32768 bytes: delta 5219, 
ts1 720979, ts2 726198
[crctest] (ARM timers) Data pass both backward, 32768 bytes: delta 4361, 
ts1 805222, ts2 809583
[crctest] (ARM timers) Data pass backward/forward, 32768 bytes: delta 
4695, ts1 888609, ts2 893304
[crctest] (ARM timers) Data pass forward/backward, 32768 bytes: delta 
4682, ts1 972332, ts2 977014
[crctest] (ARM timers) Data pass both forward, 65536 bytes: delta 10487, 
ts1 1056042, ts2 1066529
[crctest] (ARM timers) Data pass both backward, 65536 bytes: delta 8769, 
ts1 1145579, ts2 1154348
[crctest] (ARM timers) Data pass backward/forward, 65536 bytes: delta 
9534, ts1 1233398, ts2 1242932
[crctest] (ARM timers) Data pass forward/backward, 65536 bytes: delta 
9522, ts1 1321982, ts2 1331504
[crctest] (ARM timers) Data pass both forward, 131072 bytes: delta 20970, 
ts1 1410557, ts2 1431527
[crctest] (ARM timers) Data pass both backward, 131072 bytes: delta 17533, 
ts1 1510579, ts2 1528112
[crctest] (ARM timers) Data pass backward/forward, 131072 bytes: delta 
19157, ts1 1607164, ts2 1626321
[crctest] (ARM timers) Data pass forward/backward, 131072 bytes: delta 
19145, ts1 1705375, ts2 1724520
[crctest] (ARM timers) adler32, 32 bytes: delta 10, ts1 1724634, ts2 
1724644
[crctest] (ARM timers) adler32, 4096 bytes: delta 662, ts1 4917, ts2 5579
[crctest] (ARM timers) adler32, 32768 bytes: delta 6529, ts1 6299, ts2 
12828
[crctest] (ARM timers) adler32, 65536 bytes: delta 13031, ts1 4287, ts2 
17318
[crctest] (ARM timers) adler32, 131072 bytes: delta 26044, ts1 10038, ts2 
36082
[crctest] (ARM timers) adler32r, 32 bytes: delta 10, ts1 6205, ts2 6215
[crctest] (ARM timers) adler32r, 4096 bytes: delta 639, ts1 6358, ts2 6997
[crctest] (ARM timers) adler32r, 32768 bytes: delta 6480, ts1 7711, ts2 
14191
[crctest] (ARM timers) adler32r, 65536 bytes: delta 12944, ts1 5599, ts2 
18543
[crctest] (ARM timers) adler32r, 131072 bytes: delta 25873, ts1 11246, ts2 
37119
[crctest] (ARM timers) engel32, 32 bytes: delta 11, ts1 7241, ts2 7252
[crctest] (ARM timers) engel32, 4096 bytes: delta 911, ts1 7422, ts2 8333
[crctest] (ARM timers) engel32, 32768 bytes: delta 8553, ts1 9255, ts2 
17808
[crctest] (ARM timers) engel32, 65536 bytes: delta 17086, ts1 9629, ts2 
26715
[crctest] (ARM timers) engel32, 131072 bytes: delta 34152, ts1 10361, ts2 
44513
[crctest] (ARM timers) engel32r, 32 bytes: delta 12, ts1 4644, ts2 4656
[crctest] (ARM timers) engel32r, 4096 bytes: delta 953, ts1 4815, ts2 5768
[crctest] (ARM timers) engel32r, 32768 bytes: delta 7589, ts1 6592, ts2 
14181
[crctest] (ARM timers) engel32r, 65536 bytes: delta 15175, ts1 5792, ts2 
20967
[crctest] (ARM timers) engel32r, 131072 bytes: delta 30345, ts1 4079, ts2 
34424
[crctest] (ARM timers) 16-bit CRC CCITT, 32 bytes: delta 24, ts1 4515, ts2 
4539
[crctest] (ARM timers) 16-bit CRC CCITT, 4096 bytes: delta 2817, ts1 4903, 
ts2 7720
[crctest] (ARM timers) 16-bit CRC CCITT, 32768 bytes: delta 23752, ts1 
10166, ts2 33918
[crctest] (ARM timers) 16-bit CRC CCITT, 65536 bytes: delta 47409, ts1 
8775, ts2 56184
[crctest] (ARM timers) 16-bit CRC CCITT, 131072 bytes: delta 94831, ts1 
15781, ts2 110612
[crctest] (ARM timers) CRC32, 32 bytes: delta 14, ts1 740, ts2 754
[crctest] (ARM timers) CRC32, 4096 bytes: delta 1402, ts1 971, ts2 2373
[crctest] (ARM timers) CRC32, 32768 bytes: delta 12502, ts1 3689, ts2 
16191
[crctest] (ARM timers) CRC32, 65536 bytes: delta 24847, ts1 8787, ts2 
33634
[crctest] (ARM timers) CRC32, 131072 bytes: delta 49724, ts1 8714, ts2 
58438
[crctest] (ARM timers) CRC32c, 32 bytes: delta 26, ts1 8563, ts2 8589
[crctest] (ARM timers) CRC32c, 4096 bytes: delta 2857, ts1 8953, ts2 11810
[crctest] (ARM timers) CRC32c, 32768 bytes: delta 24094, ts1 4298, ts2 
28392
[crctest] (ARM timers) CRC32c, 65536 bytes: delta 48066, ts1 13308, ts2 
61374
[crctest] (ARM timers) CRC32c, 131072 bytes: delta 96113, ts1 11096, ts2 
107209

-----------------------------------------------------------------------
i686

#cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 6
model name      : Celeron (Mendocino)
stepping        : 5
cpu MHz         : 534.805
cache size      : 128 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 mtrr pge mca cmov pat 
pse36 mmx fxsr
bogomips        : 1052.67

[crctst] (get_cycles) Data pass both forward, 32 bytes: delta 731, ts1 
5554559977084, ts2 5554559977815
[crctst] (get_cycles) Data pass both backward, 32 bytes: delta 755, ts1 
5554571204036, ts2 5554571204791
[crctst] (get_cycles) Data pass backward/forward, 32 bytes: delta 762, ts1 
5554582493116, ts2 5554582493878
[crctst] (get_cycles) Data pass forward/backward, 32 bytes: delta 575, ts1 
5554593729476, ts2 5554593730051
[crctst] (get_cycles) Data pass both forward, 4096 bytes: delta 70053, ts1 
5554604977980, ts2 5554605048033
[crctst] (get_cycles) Data pass both backward, 4096 bytes: delta 70096, 
ts1 5554616415540, ts2 5554616485636
[crctst] (get_cycles) Data pass backward/forward, 4096 bytes: delta 70125, 
ts1 5554627702308, ts2 5554627772433
[crctst] (get_cycles) Data pass forward/backward, 4096 bytes: delta 70126, 
ts1 5554639032212, ts2 5554639102338
[crctst] (get_cycles) Data pass both forward, 32768 bytes: delta 561878, 
ts1 5554650362692, ts2 5554650924570
[crctst] (get_cycles) Data pass both backward, 32768 bytes: delta 555688, 
ts1 5554662199516, ts2 5554662755204
[crctst] (get_cycles) Data pass backward/forward, 32768 bytes: delta 
552954, ts1 5554673970492, ts2 5554674523446
[crctst] (get_cycles) Data pass forward/backward, 32768 bytes: delta 
446164, ts1 5554685910812, ts2 5554686356976
[crctst] (get_cycles) Data pass both forward, 65536 bytes: delta 1091671, 
ts1 5554697756260, ts2 5554698847931
[crctst] (get_cycles) Data pass both backward, 65536 bytes: delta 1114579, 
ts1 5554710185588, ts2 5554711300167
[crctst] (get_cycles) Data pass backward/forward, 65536 bytes: delta 
1111689, ts1 5554722654316, ts2 5554723766005
[crctst] (get_cycles) Data pass forward/backward, 65536 bytes: delta 
1118957, ts1 5554735058076, ts2 5554736177033
[crctst] (get_cycles) Data pass both forward, 131072 bytes: delta 2131183, 
ts1 5554747495004, ts2 5554749626187
[crctst] (get_cycles) Data pass both backward, 131072 bytes: delta 
2081712, ts1 5554760991724, ts2 5554763073436
[crctst] (get_cycles) Data pass backward/forward, 131072 bytes: delta 
2211375, ts1 5554774343292, ts2 5554776554667
[crctst] (get_cycles) Data pass forward/backward, 131072 bytes: delta 
2237850, ts1 5554787816988, ts2 5554790054838
[crctst] (get_cycles) adler32, 32 bytes: delta 208, ts1 5554790070690, ts2 
5554790070898
[crctst] (get_cycles) adler32, 4096 bytes: delta 6464, ts1 5554797404641, 
ts2 5554797411105
[crctst] (get_cycles) adler32, 32768 bytes: delta 56771, ts1 
5554797649035, ts2 5554797705806
[crctst] (get_cycles) adler32, 65536 bytes: delta 113785, ts1 
5554798361404, ts2 5554798475189
[crctst] (get_cycles) adler32, 131072 bytes: delta 233520, ts1 
5554799374350, ts2 5554799607870
[crctst] (get_cycles) adler32r, 32 bytes: delta 216, ts1 5554800107526, 
ts2 5554800107742
[crctst] (get_cycles) adler32r, 4096 bytes: delta 5113, ts1 5554800150365, 
ts2 5554800155478
[crctst] (get_cycles) adler32r, 32768 bytes: delta 53081, ts1 
5554800379348, ts2 5554800432429
[crctst] (get_cycles) adler32r, 65536 bytes: delta 106798, ts1 
5554801010586, ts2 5554801117384
[crctst] (get_cycles) adler32r, 131072 bytes: delta 218664, ts1 
5554802198998, ts2 5554802417662
[crctst] (get_cycles) engel32, 32 bytes: delta 144, ts1 5554802654360, ts2 
5554802654504
[crctst] (get_cycles) engel32, 4096 bytes: delta 7693, ts1 5554802696176, 
ts2 5554802703869
[crctst] (get_cycles) engel32, 32768 bytes: delta 65239, ts1 
5554803294336, ts2 5554803359575
[crctst] (get_cycles) engel32, 65536 bytes: delta 130514, ts1 
5554803958262, ts2 5554804088776
[crctst] (get_cycles) engel32, 131072 bytes: delta 266126, ts1 
5554805379160, ts2 5554805645286
[crctst] (get_cycles) engel32r, 32 bytes: delta 150, ts1 5554806129841, 
ts2 5554806129991
[crctst] (get_cycles) engel32r, 4096 bytes: delta 7246, ts1 5554806153189, 
ts2 5554806160435
[crctst] (get_cycles) engel32r, 32768 bytes: delta 56813, ts1 
5554806224973, ts2 5554806281786
[crctst] (get_cycles) engel32r, 65536 bytes: delta 113411, ts1 
5554806402638, ts2 5554806516049
[crctst] (get_cycles) engel32r, 131072 bytes: delta 226662, ts1 
5554807652080, ts2 5554807878742
[crctst] (get_cycles) 16-bit CRC CCITT, 32 bytes: delta 316, ts1 
5554807901011, ts2 5554807901327
[crctst] (get_cycles) 16-bit CRC CCITT, 4096 bytes: delta 29361, ts1 
5554807970344, ts2 5554807999705
[crctst] (get_cycles) 16-bit CRC CCITT, 32768 bytes: delta 235446, ts1 
5554808413329, ts2 5554808648775
[crctst] (get_cycles) 16-bit CRC CCITT, 65536 bytes: delta 473151, ts1 
5554809580918, ts2 5554810054069
[crctst] (get_cycles) 16-bit CRC CCITT, 131072 bytes: delta 940992, ts1 
5554812013686, ts2 5554812954678
[crctst] (get_cycles) CRC32, 32 bytes: delta 242, ts1 5554813156313, ts2 
5554813156555
[crctst] (get_cycles) CRC32, 4096 bytes: delta 22075, ts1 5554813404036, 
ts2 5554813426111
[crctst] (get_cycles) CRC32, 32768 bytes: delta 176204, ts1 5554813816461, 
ts2 5554813992665
[crctst] (get_cycles) CRC32, 65536 bytes: delta 352496, ts1 5554814878041, 
ts2 5554815230537
[crctst] (get_cycles) CRC32, 131072 bytes: delta 697640, ts1 
5554817199646, ts2 5554817897286
[crctst] (get_cycles) CRC32c, 32 bytes: delta 268, ts1 5554818293652, ts2 
5554818293920
[crctst] (get_cycles) CRC32c, 4096 bytes: delta 26211, ts1 5554818362264, 
ts2 5554818388475
[crctst] (get_cycles) CRC32c, 32768 bytes: delta 213319, ts1 
5554818787865, ts2 5554819001184
[crctst] (get_cycles) CRC32c, 65536 bytes: delta 426616, ts1 
5554820096814, ts2 5554820523430
[crctst] (get_cycles) CRC32c, 131072 bytes: delta 859504, ts1 
5554822563046, ts2 5554823422550

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
--1456859747-1961630448-1105107822=:12054
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="crctest.c"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.58.0501071423420.12054@phoenix.infradead.org>
Content-Description: 
Content-Disposition: attachment; filename="crctest.c"

LyoNCiAqICAgICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCiAqICAgICAg
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhcyBwdWJsaXNoZWQgYnkNCiAqICAgICAgdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGlj
ZW5zZSwgb3INCiAqICAgICAgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIg
dmVyc2lvbi4NCiAqDQogKiAgICAgIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmli
dXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KICog
ICAgICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0
aGUgaW1wbGllZCB3YXJyYW50eSBvZg0KICogICAgICBNRVJDSEFOVEFCSUxJ
VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUg
dGhlDQogKiAgICAgIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBt
b3JlIGRldGFpbHMuDQogKg0KICogICAgICBZb3Ugc2hvdWxkIGhhdmUgcmVj
ZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZQ0KICogICAgICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3
cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQ0KICogICAgICBGb3VuZGF0aW9u
LCBJbmMuLCA2NzUgTWFzcyBBdmUsIENhbWJyaWRnZSwgTUEgMDIxMzksIFVT
QS4NCiAqLw0KI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPg0KI2luY2x1ZGUgPGxpbnV4L3BhZ2VtYXAuaD4N
CiNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPg0KI2luY2x1ZGUgPGxpbnV4
L2NyYzMyLmg+DQojaW5jbHVkZSA8bGludXgvY3JjMzJjLmg+DQojaW5jbHVk
ZSA8bGludXgvY3JjLWNjaXR0Lmg+DQojaW5jbHVkZSA8YXNtL3RpbWV4Lmg+
DQoNCi8qIFRoZSBudW1iZXIgb2YgbWVtb3J5IGN1bmtzIHRvIHRlc3QgKi8N
CiNkZWZpbmUgTUVNX0NIVU5LUyAzDQoNCi8qIFRoZSB0ZXN0IGl0ZXJhdGlv
bnMgbnVtYmVyICovDQojZGVmaW5lIElURVJBVElPTlMgMQ0KDQojZGVmaW5l
IFRFU1RfUFJFRklYICJbY3JjdHN0XSAiDQoNCi8qIA0KICogTW9zdCBhcmNo
aXRlY3R1cmVzIGhhdmUgc29tZSBraW5kIG9mIGhpZ2h0IHJlc29sdXRpb24g
dGltZS1zdGFtcA0KICogY291bnRlciBhbmQgZGVmaW5lIHRoZSBnZXRfY3lj
bGVzKCkgbWFjcm8gdG8gYWNjZXNzIGl0Lg0KICovDQojZGVmaW5lIFRJTUVT
VEFNUCBnZXRfY3ljbGVzKCkNCg0KLyogDQogKiBUaGUgc2l6ZXMgb2YgbWVt
b3J5IGNodW5rcyBmb3Igd2hpY2ggQ1JDcyBzaG91bGQgYmUgdGVzdGVkLg0K
ICovDQpzdGF0aWMgaW50DQptZW1zaXplc1tNRU1fQ0hVTktTXSA9IHszMiwg
UEFHRV9TSVpFLCA2NCoxMDI0fTsNCg0KLyogDQogKiBXZSBwZXJmb3JtIGFj
dHVhbCB0ZXN0aW5nIGluIHRoZSBtb2R1bGUgaW5pdGlhbGl6YXRpb24gZnVu
Y3Rpb24uDQogKi8NCnN0YXRpYyBpbnQgX19pbml0DQppbml0X2NyY3Rlc3Qo
dm9pZCkNCnsNCglyZWdpc3RlciBpbnQgaSwgajsNCgljaGFyICptZW1bTUVN
X0NIVU5LU107DQoJdW5zaWduZWQgbG9uZyBmbGFnczsNCglzcGlubG9ja190
IGxvY2sgPSBTUElOX0xPQ0tfVU5MT0NLRUQ7DQoJaW50IHJldCA9IDA7DQoJ
Y3ljbGVzX3QgdHMxLCB0czI7DQoNCgltZW1jbXAoJm1lbVswXSwgJ1wwJywg
TUVNX0NIVU5LUyAqIHNpemVvZihjaGFyICopKTsNCg0KCS8qIEFsbG9jYXRl
IG1lbW9yeSAqLw0KCWZvciAoaSA9IDA7IGkgPCBNRU1fQ0hVTktTOyBpKysp
IHsNCgkJaWYgKChtZW1baV0gPSBrbWFsbG9jKG1lbXNpemVzW2ldLCBHRlBf
S0VSTkVMKSkgPT0gTlVMTCkgew0KCQkJcHJpbnRrKEtFUk5fRVJSIFRFU1Rf
UFJFRklYICJjYW4ndCBhbGxvY2F0ZSAlZCBieXRlc1xuIiwNCgkJCQkJbWVt
c2l6ZXNbaV0pOw0KCQkJcmV0ID0gLUVOT01FTTsNCgkJCWdvdG8gZXhpdDsN
CgkJfQ0KCX0NCgkNCgkvKiANCgkgKiBXZSBkbyBub3Qgd2FudCB0byBiZSBw
cmVlbXB0ZWQgZHVyaW5nIHRoZSB0ZXN0IGFzIHdlbGwgYXMgZG8NCgkgKiBu
b3Qgd2FudCBpbnRlcnJ1cHRzIGFmZmVjdCBvdXIgcmVzdWx0cy4gQm90aCBv
ZiB0aGVzZSBhcmUNCgkgKiBwcmV2ZW50ZWQgYnkgc3Bpbl9sb2NrX2lycXNh
dmUoKS4NCgkgKi8NCglzcGluX2xvY2tfaXJxc2F2ZSgmbG9jaywgZmxhZ3Mp
Ow0KCQ0KCS8qIFRlc3QgMTYgYml0IENSQyBDQ0lUVCAqLw0KCWZvciAoaSA9
IDA7IGkgPCBNRU1fQ0hVTktTOyBpKyspIHsNCgkJdTE2IGNyYzsNCgkJDQoJ
CS8qIERvIG9uZSBmYWtlIHBhc3MgdG8gZXhjbHVkZSBDUFUgY2FjaGUgaW5m
bHVlbmNlICovDQoJCWNyYyA9IGNyY19jY2l0dCgweEZGRkYsIG1lbVtpXSwg
bWVtc2l6ZXNbaV0pOw0KDQoJCXRzMSA9IFRJTUVTVEFNUDsNCgkJZm9yIChq
ID0gMDsgaiA8IElURVJBVElPTlM7IGorKykgew0KCQkJY3JjID0gY3JjX2Nj
aXR0KDB4RkZGRiwgbWVtW2ldLCBtZW1zaXplc1tpXSk7IA0KCQl9DQoJCXRz
MiA9IFRJTUVTVEFNUDsNCg0KCQlwcmludGsoS0VSTl9OT1RJQ0UgVEVTVF9Q
UkVGSVggIjE2LWJpdCBDUkMgQ0NJVFQgJWQgYnl0ZXM6ICINCgkJCSJ0czEg
JWxsdSwgdHMyICVsbHUsIGRlbHRhICVsbHVcbiIsIG1lbXNpemVzW2ldLA0K
CQkJKHVuc2lnbmVkIGxvbmcgbG9uZyl0czEsICh1bnNpZ25lZCBsb25nIGxv
bmcpdHMyLA0KCQkJKHVuc2lnbmVkIGxvbmcgbG9uZykodHMyIC0gdHMxKSk7
DQoJfQ0KDQoJLyogVGVzdCBjcmMzMiAqLw0KCWZvciAoaSA9IDA7IGkgPCBN
RU1fQ0hVTktTOyBpKyspIHsNCgkJdTMyIGNyYzsNCgkJDQoJCWNyYyA9IGNy
YzMyKDB4RkZGRiwgbWVtW2ldLCBtZW1zaXplc1tpXSk7IA0KCQl0czEgPSBU
SU1FU1RBTVA7DQoJCWZvciAoaiA9IDA7IGogPCBJVEVSQVRJT05TOyBqKysp
IHsNCgkJCWNyYyA9IGNyYzMyKDB4RkZGRiwgbWVtW2ldLCBtZW1zaXplc1tp
XSk7IA0KCQl9DQoJCXRzMiA9IFRJTUVTVEFNUDsNCg0KCQlwcmludGsoS0VS
Tl9OT1RJQ0UgVEVTVF9QUkVGSVggImNyYzMyICVkIGJ5dGVzOiAiDQoJCQki
dHMxICVsbHUsIHRzMiAlbGx1LCBkZWx0YSAlbGx1XG4iLCBtZW1zaXplc1tp
XSwNCgkJCSh1bnNpZ25lZCBsb25nIGxvbmcpdHMxLCAodW5zaWduZWQgbG9u
ZyBsb25nKXRzMiwNCgkJCSh1bnNpZ25lZCBsb25nIGxvbmcpKHRzMiAtIHRz
MSkpOw0KCX0NCgkNCgkvKiBUZXN0IGNyYzMyYyAqLw0KCWZvciAoaSA9IDA7
IGkgPCBNRU1fQ0hVTktTOyBpKyspIHsNCgkJdTMyIGNyYzsNCgkJDQoJCWNy
YyA9IGNyYzMyYygweEZGRkYsIG1lbVtpXSwgbWVtc2l6ZXNbaV0pOyANCgkJ
dHMxID0gVElNRVNUQU1QOw0KCQlmb3IgKGogPSAwOyBqIDwgSVRFUkFUSU9O
UzsgaisrKSB7DQoJCQljcmMgPSBjcmMzMmMoMHhGRkZGLCBtZW1baV0sIG1l
bXNpemVzW2ldKTsgDQoJCX0NCgkJdHMyID0gVElNRVNUQU1QOw0KDQoJCXBy
aW50ayhLRVJOX05PVElDRSBURVNUX1BSRUZJWCAiY3JjMzJjICVkIGJ5dGVz
OiAiDQoJCQkidHMxICVsbHUsIHRzMiAlbGx1LCBkZWx0YSAlbGx1XG4iLCBt
ZW1zaXplc1tpXSwNCgkJCSh1bnNpZ25lZCBsb25nIGxvbmcpdHMxLCAodW5z
aWduZWQgbG9uZyBsb25nKXRzMiwNCgkJCSh1bnNpZ25lZCBsb25nIGxvbmcp
KHRzMiAtIHRzMSkpOw0KCX0NCglzcGluX3VubG9ja19pcnFyZXN0b3JlKCZs
b2NrLCBmbGFncyk7DQoJDQpleGl0Og0KCWZvciAoaSA9IDA7IGkgPCBNRU1f
Q0hVTktTICYmIG1lbVtpXSAhPSBOVUxMOyBpKyspDQoJCWtmcmVlKG1lbVtp
XSk7DQoNCglyZXR1cm4gcmV0Ow0KfQ0KDQptb2R1bGVfaW5pdChpbml0X2Ny
Y3Rlc3QpOw0KDQpzdGF0aWMgdm9pZCBfX2V4aXQNCmNsZWFudXBfY3JjdGVz
dCh2b2lkKQ0Kew0KCXJldHVybjsNCn0NCg0KbW9kdWxlX2V4aXQoY2xlYW51
cF9jcmN0ZXN0KTsNCg0KTU9EVUxFX0xJQ0VOU0UgKCJHUEwiKTsNCk1PRFVM
RV9BVVRIT1IgKCJBcnRlbSBCLiBCaXR5dWNraXkiKTsNCk1PRFVMRV9ERVND
UklQVElPTiAoIlRoZSBDUkMgdGVzdCIpOw0KDQo=

--1456859747-1961630448-1105107822=:12054--
