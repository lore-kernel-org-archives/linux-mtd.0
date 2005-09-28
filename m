Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKYM8-0001vx-8s
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 05:36:08 -0400
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id BEAE7BB5E
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Sep 2005 11:35:58 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87248-08 for <linux-mtd@lists.infradead.org>;
	Wed, 28 Sep 2005 11:35:50 +0200 (CEST)
Received: from [192.1.1.75] (unknown [192.168.66.2])
	by n1.cetrtapot.si (Postfix) with ESMTP id 7A2D5BB5A
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Sep 2005 11:35:50 +0200 (CEST)
Message-ID: <433A640D.6030200@cetrtapot.si>
Date: Wed, 28 Sep 2005 11:36:13 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We started using new CVS code that provides EBS and fragtree method. 
Below are some measurements of mount times for old and new setup.

NAND partitions size tested were:
flash4 - 4Mb
flash5 - 12Mb
flash6 - 16Mb

OLD setup uses ~April 2005 MTD code, 2.6.11 kernel, no EBS and produces 
following:

Mounting flash4 clean partition	[1]
real	0m 0.83s
user	0m 0.01s
sys	0m 0.83s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition	[2]
real	0m 8.37s
user	0m 0.01s
sys	0m 8.35s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 2.70s
user	0m 0.02s
sys	0m 2.38s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 26.42s
user	0m 0.01s
sys	0m 26.40s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.29s
user	0m 0.02s
sys	0m 3.16s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 35.81s
user	0m 0.01s
sys	0m 35.77s
-- -- -- -- -- -- -- -- -- --

On new setup - using yesterdays MTD CVS and 2.6.12 kernel with EBS enabled:
Mounting flash4 clean partition	[1]
real    0m 3.75s
user    0m 0.02s
sys     0m 1.17s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition	[2]
real    0m 0.75s
user    0m 0.02s
sys     0m 0.73s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real    0m 3.55s
user    0m 0.02s
sys     0m 3.47s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real    0m 2.12s
user    0m 0.03s
sys     0m 2.08s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real    0m 4.82s
user    0m 0.01s
sys     0m 4.63s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real    0m 2.82s
user    0m 0.01s
sys     0m 2.80s
-- -- -- -- -- -- -- -- -- --

Compared to old setup this is GREAAAAAT improvment (if my mesurements 
are correct:). Great job!

This holds true /only/ if partition is erased beforehand and then 
mounted, filled with files, umounted and mounted again to mesure mount 
time for dirty partition. Mounting jffs2 partition filled on old setup 
shows no performance improvement.

We found sumtool utility in tools dir and if my understanding is correct 
it is used to convert jffs2 image with no EBS to jffs2 image with EBS.

Is this the only way to upgrade 'old' jffs2 partitions already in place 
(on the nand flash) to use EBS? Thing is, we have several system up and 
running in the wild and would like to upgrade jffs2 partitions 
as-painless-as-possible, preferably without complete reflash of the systems.

I've just ran sumtool on old raw 4Mb mtd char device (containing jffs2 
fs) and it produced 4Mb image on the output. I figure, if I copy this 
image back to flash and test it with EBS supported kernel it should 
recognize it as new jffs2 image and mount it super-fast. I still need to 
erase the nand partition and gather enough ram for temporary EBS image 
on the system and so this could be a problem in our setup.

regards,
hinko

[1] Mounting clean partition means that we erased the partition with 
flash_eraseall and then mounted it. mount time was measured with 'time'.
[2] After cleaning up the partition, then creating, appending, erasing 
several small files on it, we umounted the partition and mounted it 
back. mount time was measured eith 'time'.

All partitions contained 150 - 700 few kbytes sizes files and were ~80 % 
full when dirty.
