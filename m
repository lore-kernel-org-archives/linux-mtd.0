Received: from cbshost-12-155-143-237.sbcox.net ([12.155.143.237]
	helo=sb-lnx3.rinconnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VCV0-0003MD-Dl
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 16:47:54 +0100
Received: from sb-lnx3.rinconnetworks.com (localhost.localdomain [127.0.0.1])
	h5PFmFUJ015543
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 08:48:15 -0700
Received: (from vangool@localhost)
	by sb-lnx3.rinconnetworks.com (8.12.8/8.12.8/Submit) id h5PFmFNV015541
	for linux-mtd@lists.infradead.org; Wed, 25 Jun 2003 08:48:15 -0700
Date: Wed, 25 Jun 2003 08:48:15 -0700
From: Paul van Gool <paul.vangool@rinconnetworks.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20030625154815.GA15437@rinconnetworks.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
Subject: No space left on almost empty JFFS2 filesystem
Reply-To: paul.vangool@rinconnetworks.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have created an small and almost empty JFFS2 filesystem and have put it
on my flash. The image is padded to 128K and there should be space left.
When I mount it though the filesystem shows up as full. Any hints where to
look?

I created the image with:

mkfs.jffs2 --pad --little-endian --squash -e 0x20000 -d /home/vangool/jffs -o jffs.img

/home/vangool/jffs contains:

[vangool@sb-lnx3 vangool]$ ls -l /home/vangool/jffs
total 16
-rwxr-xr-x    1 vangool  develop     11769 Jun 25 07:49 hello
-rw-r--r--    1 vangool  develop       158 Jun 25 07:49 hello.c

When I mount it on my dev board I see:

# mount -t jffs2  /dev/mtdblock4 /mnt/jffs                                      
mtdblock_open                                                                   
ok                                                                              
# df                                                                              
Filesystem           1k-blocks      Used Available Use% Mounted on              
rootfs                    7931      3682      4249  46% /                       
/dev/root                 7931      3682      4249  46% /                       
10.0.2.11:/           74730396   3471336  67462904   5% /mnt/camb-lnx1          
10.0.2.12:/           74754492   5980872  64976256   8% /mnt/camb-lnx2          
/dev/mtdblock4             128       128         0 100% /mnt/jffs

And as a result:

# /mnt/jffs/hello > /mnt/jffs/hello.out                                         
cannot create /mnt/jffs/hello.out: No space left on device                      

In case it's important, I flashed the image using Redboot:

load -r -v -b 0x8F000000 camb-devbrd1/jffs.img -m TFTP -h 10.0.2.12
fis create jffs -f 0x80300000 -l 0x20000 -b 0x8F000000 -r 0x8F000000

Thanks in advance.

Paul
-- 
Paul van Gool                                               Rincon Networks
paul.vangool@rinconnetworks.com                              (805)-705-1442
