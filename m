Received: from smtp.parrot.fr ([213.41.120.202])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HHiYd-0002zf-Vq
	for linux-mtd@lists.infradead.org; Thu, 15 Feb 2007 10:30:07 -0500
Received: from [172.20.2.179] (40.107.210.62.te-dns.org [62.210.107.40])
	by smtp.parrot.fr (Postfix) with ESMTP id 72F835C30
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Feb 2007 16:31:01 +0100 (CET)
Message-ID: <45D47C92.8080908@parrot.fr>
Date: Thu, 15 Feb 2007 16:30:26 +0100
From: Matthieu CASTET <matthieu.castet@parrot.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2 Erase Block Summary overhead
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

Hi,

after doing some test on a 64MB nand flash, we see that only 50 MB can 
be stored on the filesystem [1]. The extra 10 MB are taken by jffs2 summary.
If we disable jffs2 sumary in the kernel, the 10MB become available.

Is there a way to reduce this overhead ?
20 % seems really big.

May be Centralized Summary [3] give better result ?
What is its status ?

Matthieu

[1]
# time mount /dev/mtdblock3 -t jffs2 /tmp/mnt/ ; time cat 
/tmp/mnt/root/file.1 > /dev/null ; du -sh /tmp/mnt; df
real    0m 3.05s
user    0m 0.00s
sys     0m 3.05s
real    0m 0.34s
user    0m 0.01s
sys     0m 0.33s
50.6M   /tmp/mnt
Filesystem                Size      Used Available Use% Mounted on
/dev/mtdblock3           61.5M     60.7M    832.0k  99% /tmp/mnt

[2]
# time mount /dev/mtdblock3 -t jffs2 /tmp/mnt/ ; time cat 
/tmp/mnt/root/file.1 > /dev/null ; du -sh /tmp/mnt; df
real    0m 11.30s
user    0m 0.01s
sys     0m 11.28s
real    0m 0.35s
user    0m 0.00s
sys     0m 0.33s
50.6M   /tmp/mnt
/dev/mtdblock3           61.5M     51.2M     10.3M  83% /tmp/mnt

[3]
http://www.inf.u-szeged.hu/jffs2/mount.php
