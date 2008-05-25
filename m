Received: from mail02.syd.optusnet.com.au ([211.29.132.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K0P3k-0004M8-Ct
	for linux-mtd@lists.infradead.org; Sun, 25 May 2008 22:51:25 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<1211524684.6203.13.camel@torchwood>
	<80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>
	<1211526311.6203.27.camel@torchwood>
	<80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 26 May 2008 08:50:45 +1000
Message-Id: <1211755845.6724.29.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Alessandro Rubini <rubini-list@gnudd.com>,
	michael <trimarchi@gandalf.sssup.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-05-23 at 09:27 +0200, Richard Genoud wrote:
> 2008/5/23 James <jamessteward@optusnet.com.au>:
> > What tool chain are you using?
> i think it was buildroot + gcc3.4.6 and glib2.3.2, but i'm not sure.
> 
> On Fri, 2008-05-23 at 09:03 +0200, Alessandro Rubini wrote:
> > So you should only write the boot code with sam-ba, and write your
> > kernel and filesystem from either u-boot or linux. You'll probably
> > want to erase and re-program the boot loader from itself, to get rid
> > of remaining wrong sam-ba bits.
> I agree with Alessandro, don't rely to much on sam-ba for nand writing.
> That's why I asked you to do the test from linux (erase/mount/write/read)

root@at91sam9263ek:~/mtd-tools$ ./flash_eraseall -j /dev/mtd0
Erasing 128 Kibyte @ 3ee0000 -- 99 % complete. Cleanmarker written at
3ee0000.
root@at91sam9263ek:~/mtd-tools$ mount -t
jffs2 /dev/mtdblock0  /mnt/nand/
mtd->read(0x400 bytes from 0xa00000) returned ECC error
mtd->read(0x400 bytes from 0xdc0000) returned ECC error
mtd->read(0x400 bytes from 0xfa0000) returned ECC error
mtd->read(0x400 bytes from 0x13e0000) returned ECC error
mtd->read(0x400 bytes from 0x2000000) returned ECC error
mtd->read(0x400 bytes from 0x20e0000) returned ECC error
mtd->read(0x400 bytes from 0x2680000) returned ECC error
mtd->read(0x400 bytes from 0x2fc0000) returned ECC error
mtd->read(0x400 bytes from 0x3540000) returned ECC error
mtd->read(0x400 bytes from 0x3820000) returned ECC error
root@at91sam9263ek:~/mtd-tools$ umount /mnt/nand/

Then I tried this;
root@at91sam9263ek:~/mtd-tools$ ./nandwrite -a /dev/mtd0 ./fs.jffs2 
Writing data to block 0
Writing data to block 20000
Writing data to block 40000
<snip>
root@at91sam9263ek:~/mtd-tools$ mount -t
jffs2 /dev/mtdblock0  /mnt/nand/
mtd->read(0x1fc0c bytes from 0x3f4) returned ECC error
mtd->read(0x800 bytes from 0x3f800) returned ECC error
mtd->read(0x1f6d4 bytes from 0x2092c) returned ECC error
mtd->read(0x1f7dc bytes from 0x40824) returned ECC error
jffs2_scan_inode_node(): CRC failed on node at 0x0005b020: Read
0x31199cbf, calculated 0x81b0002e
mtd->read(0x1fbf0 bytes from 0x60410) returned ECC error
jffs2_scan_inode_node(): CRC failed on node at 0x00060a4c: Read
0x2072000c, calculated 0x207200ff
mtd->read(0x1f6d8 bytes from 0x80928) returned ECC error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00094c88:
0x578a instead

<big snip - lots more>

Hardware failures?  Or have I not used the tools correctly?

Regards,
James.
