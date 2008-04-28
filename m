Received: from an-out-0708.google.com ([209.85.132.251])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JqcPm-0005ec-RN
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 23:05:43 +0000
Received: by an-out-0708.google.com with SMTP id c3so1154045ana.99
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Apr 2008 16:05:41 -0700 (PDT)
Message-ID: <c260b4940804281605u5d7ae562of9495970f24de2e0@mail.gmail.com>
Date: Mon, 28 Apr 2008 16:05:41 -0700
From: "N Cheung" <brjerome.1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Need advice on NAND support for cramfs
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

Hello all,

I am new to MTD and would appreciate help.  I have a requirement to
run cramfs on MTD / NAND.  David in the mail below pointed out for me
that to support bad block in cramfs MTD needs either a new translation
layer or some modification to the mtdblock.   I wonder which would be
a simpler and easier to implement solution. Or would it be easier to
fix it in the cramfs code?  What will be the right approach? and what
would be a quick heck...

Any pointers would be much appreciated.

Thanks,
Norman


---------- Forwarded message ----------
From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, Apr 26, 2008 at 11:10 PM
Subject: Re: MTD NAND bad block management for cramfs
To: N Cheung <brjerome.1@gmail.com>


On Sat, 2008-04-26 at 12:25 -0700, N Cheung wrote:
 > Hello David,
 >
 > My apology for sending you mail directly.  For some reason I am not
 > able to send mail to the list.

 Your mail didn't get through to the list because it was HTML, although
 this one isn't.


 > This might be a basic question.  I am new to MTD and NAND.  I am
 > building a system with 32M of NAND (kernel 2.6.22 planning to move to
 > 24 soon) and plan a ro RFS (either cramfs or squashfs) and a 2M JFFS2
 > for rw.
 >
 > I built a kernel with MTD partitions and boot successfully from a
 > cramfs.  The cramfs image was written into NAND with u-boot's NAND
 > write fucntion.  I was told that MTD does not support cramfs, re: bad
 > block.

 If you encounter a bad block, presumably U-boot will just ignore it and
 write to the next block instead. So imagine you have a bad block at
 block #10. U-boot will write block #10 of your cramfs image to block #11
 of the flash, block #11 ro block#12, and so on.

 But cramfs uses the location on the 'disk' to find things, unlike JFFS2.
 So if it has a pointer which says one of its files is stored in block
 #11, it'll read block #11 from the flash, and get what _should_ have
 been the contents of block #10 in the cramfs image.

 The kernel needs to work around that, and present a block device to
 userspace which completely misses out the bad blocks of the flash.

 We need either a new translation layer, or a modification to mtdblock.

 --
 dwmw2
