Received: from mu-out-0910.google.com ([209.85.134.191])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J0fJu-0001vK-U9
	for linux-mtd@lists.infradead.org; Fri, 07 Dec 2007 15:41:01 +0000
Received: by mu-out-0910.google.com with SMTP id i2so1133132mue
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Dec 2007 07:40:53 -0800 (PST)
Message-ID: <f8f856500712070740p3298da2eu882e97fe4b074634@mail.gmail.com>
Date: Fri, 7 Dec 2007 16:40:52 +0100
From: fabien <fabien.fb@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Jffs2 something strange
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello,

I'm trying to put a jffs2 filesystem on my Flash chip. But i think
there is something strange between the size of the data i've copied in
my filesystem and the percentage used of the partition.

I've created a mtd map to create just one partition of 1 MB. At boot
time the kernel
detect my flash and create one partition :
The processor is an mpc855T.
Fast2100 flash device: 400000 at 2800000
Fast2100 flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 1 MTD partitions on "Fast2100 flash":
0x00300000-0x00400000 : "jffs"
Freeing unused kernel memory: 388k

And in /proc/mtd i see :
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00020000 "Fast2100 flash"
mtd1: 00100000 00020000 "jffs"

I've created my jffs2 filesystem like this :
mkfs.jffs2 -b -U  -e 0x20000 -d jffs2_test/ -o jffs2.bin
i mount my image with :
mount -t jffs2 /dev/mtdblock1 /mnt/flash -o ro
# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock1            1024       980        44  96% /mnt/flash
# cd /mnt/flash
# du .
0       ./rep1
1       ./rep2
0       ./rep3
646     .
# ls
fic1          fic3          rep1          rep3          xorg.conf
fic2          passwd        rep2          targetgd.pdf
# ls -al
drwxr-xr-x    6 0        0               0 Jan  1 00:00 .
drwxr-xr-x    3 0        0               0 Apr 19 06:50 ..
-rw-r--r--    1 0        0               0 Dec  5  2007 fic1
-rw-r--r--    1 0        0               0 Dec  5  2007 fic2
-rw-r--r--    1 0        0               0 Dec  5  2007 fic3
-rw-r--r--    1 0        0            1161 Dec  7  2007 passwd
drwxr-xr-x    2 0        0               0 Dec  5  2007 rep1
drwxr-xr-x    2 0        0               0 Dec  5  2007 rep2
drwxr-xr-x    2 0        0               0 Dec  5  2007 rep3
-rw-r--r--    1 0        0          656332 Dec  7  2007 targetgd.pdf
-rw-r--r--    1 0        0            2470 Dec  7  2007 xorg.conf
#
How it is possible with 646 KBytes of data to have 96% used in 1MBytes
mtd partition space ?
Please explain me, may be i did something wrong ?
Best regards
Fab
