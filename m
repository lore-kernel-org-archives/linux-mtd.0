Received: from smtp.fh-landshut.de ([193.175.141.50])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGwcR-0007JB-89
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2004 10:05:11 +0100
Message-ID: <4088DBE9.2010702@fh-landshut.de>
Date: Fri, 23 Apr 2004 11:03:37 +0200
From: Oliver Korpilla <okorpil@fh-landshut.de>
MIME-Version: 1.0
To: David Vrabel <dvrabel@arcom.com>
References: <4088D26D.8070105@fh-landshut.de> <4088D9F4.3010002@arcom.com>
In-Reply-To: <4088D9F4.3010002@arcom.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: MVME2100 flash mapping patch - please review
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Vrabel wrote:
>  > cfi_cmdset_0002.c is version 1.93
> 
> If your flash chips support suspending erases then this version is 
> broken.  You'll need either 1.94 or 1.98.
> 

Thanks, I've tried now with both, 1.93 and 1.98, too:

When trying with my patch against the old revision, I get this:

/ # cat tmp/rootfs.jffs2.img > /dev/mtd2
MTD do_write_oneword(): FLASH internal timeout: 0x00200020 0x7aa6fe27 
0x851901e0
cat: Write Error: Input/output error 

/ # eraseall /dev/mtd2
Erasing 256 Kibyte @ 2c0000 -- 91 % complete.
/ # cat tmp/rootfs.jffs2.img > /dev/mtd2
MTD do_write_oneword(): FLASH internal timeout: 0x00200000 0xd4a70000 
0x2b000000
/ # mount -t jffs2 -o ro /dev/mtdblock2 tmp
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 
0x0100 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 
0x0100 instead
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 
nodes
empty_blocks 11, bad_blocks 0, c->nr_blocks 12
mount: Mounting /dev/mtdblock2 on /tmp failed: Invalid argument

When trying with the newest revision from CVS, I get this:

On boot:

Motorola MVME2100 flash device: 0x400000 at 0xff000000
Found: AMD AM29LV800BT
MVME2100 flash: Found 4 x16 devices at 0x0 in 32-bit mode
number of JEDEC chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 2 MTD partitions on "MVME2100 flash":
0x00000000-0x00100000 : "MVME2100 flash BOOT partition"
0x00100000-0x00400000 : "MVME2100 flash rootfs partition"

When I try to use it:

/ # eraseall /dev/mtd2
Erasing 256 Kibyte @ 2c0000 -- 91 % complete.
/ # cat tmp/rootfs.jffs2.img > /dev/mtd2
MTD do_write_oneword(): software timeout
cat: Write Error: Input/output error
/ # mount -t jffs2 /dev/mtdblock2 /tmp
mountjffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00000000: 0x0100 instead
: /dev/mtdblock2jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x00000004: 0x0100 instead
  is write-protected, mounting reCowardly refusing to erase blocks on 
filesystem with no valid JFFS2 nodes
ad-only 

empty_blocks 11, bad_blocks 0, c->nr_blocks 12
mount: Mounting /dev/mtdblock2 on /tmp failed: Invalid argument

The write error in cat is described as follows in /var/log/messages:

Apr 24 09:59:42 mvme2100 kern.warn klogd: MTD do_write_oneword(): 
software timeout

What am I doing wrong?

Thanks in advance,
Oliver Korpilla
