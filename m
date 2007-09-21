Received: from rwcrmhc11.comcast.net ([216.148.227.151])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IYmDm-00055P-Bl
	for linux-mtd@lists.infradead.org; Fri, 21 Sep 2007 13:23:22 -0400
Message-ID: <46F3FE02.7020800@vertical.com>
Date: Fri, 21 Sep 2007 13:23:14 -0400
From: Jon Ringle <jringle@vertical.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Clobbered file after jffs2 mount
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This falls under the category of bizarre behavior and I'm hoping someone 
on this list can help.

I have a jffs2 filesystem on my target (IXP455 processor) running Linux 
2.6.16.29. Sometimes the first time that Linux mounts the jffs2 
filesystem after reflashing the jffs2 image, sshd would strangely 
misbehave and not allow incoming connections. After much 
troubleshooting, it was discovered that the md5sum of the sshd file was 
different than the expected md5sum. However, if the system is rebooted, 
then sshd works correctly and the md5sum of sshd on the target magically 
corrected itself to the expected value.

I patched jffs2reader.c with the set of 4 patches found in this thread 
to help me extract the sshd that is found in the physical medium:
http://lists.infradead.org/pipermail/linux-mtd/2005-October/014066.html

The correct md5sum for sshd is: 9e7e08056641d4029d239dc3c6028de9

[root@isc1 ~]# md5sum /usr/sbin/sshd
8c56d103db48c6ec69bba8189f3e64bf  /usr/sbin/sshd
[root@isc1 ~]# cp /dev/mtd1 /tmp/jffs2.dmp
[root@isc1 ~]# jffs2reader -b -f /usr/sbin/sshd /tmp/jffs2.dmp > /tmp/sshd
[root@isc1 ~]# md5sum /tmp/sshd
9e7e08056641d4029d239dc3c6028de9  /tmp/sshd

I then did a hexdump of both files and found that there are two 32 bit 
values that got clobbered:

[root@isc1 ~]# hexdump -C /usr/sbin/sshd > /tmp/sshd.bad.hex
[root@isc1 ~]# hexdump -C /tmp/sshd > /tmp/sshd.good.hex

(The following diff has been hand edited slightly just to avoid line 
wrap by email)
[root@isc1 ~]# diff -u /tmp/sshd.bad.hex /tmp/sshd.good.hex
--- /tmp/sshd.bad.hex   2007-09-21 09:42:55 +0000
+++ /tmp/sshd.good.hex  2007-09-21 09:43:06 +0000
@@ -9817,7 +9817,7 @@
 00026630  e3a030cc ebffe64b  e59f04b0 ebffee5b  |..0....K.......[|
 00026640  e5993048 e3130001  01a00009 0bffff77  |..0H...........w|
 00026650  e3a01000 e2890024  ebfffef8 e28d1024  |.......$.......$|
-00026660  00000023 e1a00005  ebfffef4 e58d001c  |...#............|
+00026660  e58d0020 e1a00005  ebfffef4 e58d001c  |... ............|
 00026670  e5993014 e3530000  159d1020 059d2020  |..0..S..... ..  |
 00026680  059d301c 158d0018  e3a0b000 158d1014  |..0.............|
 00026690  058d2018 058d3014  e3a00040 ebfff933  |.. ...0....@...3|
@@ -9945,7 +9945,7 @@
 00026e30  e2466004 e1a01007  81a02004 859f00d0  |.F`....... .....|
 00026e40  8a000011 ebff7108  e1a02004 e1a01007  |......q... .....|
 00026e50  e1a00005 ebff727b  e1a00008 ebff719e  |......r{......q.|
-00026e60  00000073 e1a02fc3  e0833ea2 e1a041c3  |...s../...>...A.|
+00026e60  e2803007 e1a02fc3  e0833ea2 e1a041c3  |..0.../...>...A.|
 00026e70  e2443040 e3530d1f  e1a01007 e1a00008  |.D0@.S..........|
 00026e80  9a000003 e59f008c  e1a02004 e59f1088  |.......... .....|
 00026e90  ebffe21b ebff70f4  e1a01007 e1a02004  |......p....... .|

It would seem that the underlying image of sshd on the physical medium 
is correct, however the image of sshd as presented via Linux's VFS and 
JFFS2 has damaged the image.

Does anyone have any suggestions?

Thanks,
Jon
