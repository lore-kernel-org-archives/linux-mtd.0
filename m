Received: from mrqout3.tiscali.it ([195.130.225.13])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3vFG-0002GF-AC
	for linux-mtd@lists.infradead.org; Wed, 04 Jun 2008 15:49:51 +0000
Received: from ps23 (10.39.75.93) by mail-5-it.mail.tiscali.sys (8.0.016)
	id 4816F17C000B7BFA for linux-mtd@lists.infradead.org;
	Wed, 4 Jun 2008 17:49:42 +0200
Message-ID: <25645542.1212594582569.JavaMail.root@ps23>
Date: Wed, 4 Jun 2008 17:49:42 +0200 (CEST)
From: "iw3gtf@tiscali.it" <iw3gtf@tiscali.it>
To: linux-mtd@lists.infradead.org
Subject: Cannot write to ubi volume
MIME-Version: 1.0
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: 7bit
Reply-To: "iw3gtf@tiscali.it" <iw3gtf@tiscali.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hallo,

according to the ubi documentation it should be possible to 'write' in 
a, say, /dev/ubi1_0 (dynamic) volume device.
I tried the following without success:

root@giorgio [ ~ ]# ubimkvol /dev/ubi1 -N "rootfs" -s 32MiB 
Volume ID 0, size 265 LEBs (33648640 bytes, 32.1 MiB), LEB size 126976 
bytes (124.0 KiB), dynamic, name "rootfs", alignment 1
root@giorgio [ ~ ]# ls -al /dev/ubi*
crw-rw---- 1 root root 254,  0 1970-01-01 01:00 /dev/ubi0
crw-rw---- 1 root root 254,  2 1970-01-01 01:00 /dev/ubi0_1
crw-rw---- 1 root root 253,  0 1970-01-01 01:00 /dev/ubi1
crw-rw---- 1 root root 253,  1 2008-06-04 17:03 /dev/ubi1_0
crw-rw---- 1 root root  10, 63 1970-01-01 01:00 /dev/ubi_ctrl
root@giorgio [ ~ ]# dd if=/usr/local/tftp_root/k of=/dev/ubi1_0 
count=1960020 bs=1
dd: writing `/dev/ubi1_0': Operation not permitted
1+0 records in
0+0 records out
0 bytes (0 B) copied, 0.00690123 s, 0.0 kB/s
root@giorgio [ ~ ]# ubinfo /dev/ubi1_0
Volume ID:   0 (on ubi1)
Type:        dynamic
Alignment:   1
Size:        265 LEBs (33648640 bytes, 32.1 MiB)
State:       OK
Name:        rootfs
Character device major/minor: 253:1

Am I completely wrong trying to write with a 'dd' ?
How should I proceed to write something into the volume ?
Is it possible to write something 'directly' in an ubi volume without 
explicitly formatting an image file (with 'ubinize' for example) ?

Excuse me if my questions are a bit silly or naive and thank you for 
your explanations.

giorgio



_________________________________________________________________

Non perdere altro tempo...corri incontro all'amore!  http://incontri.tiscali.it/
