Received: from [66.78.16.3] (helo=host2.hosting4everyone.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qJXm-000264-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 19:57:14 +0000
Message-ID: <008801c1d5c9$d6c25f90$be04010a@MTG016>
From: "Sebastian" <sebastian.vaitus@masstechgroup.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <005a01c1d5c0$26756730$be04010a@MTG016>  <001201c1cf6b$64df4a50$be04010a@MTG016> <8945.1016645253@redhat.com>  <16753.1017256426@redhat.com>
Subject: Re: No space left on device 
Date: Wed, 27 Mar 2002 14:58:58 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

It's a 512K AMD flash with 8 erase blocks on an IBM Walnut board. The ROM
Monitor program which I use for booting takes up the last 2 blocks, and I'm
trying to use the first 6 blocks for JFFS.
I've attached a previous email below that gives more details.

Sebastian



Hi,

I'm trying to use JFFS2 on a 512K AMD (AM29F040B) flash chip (8 erase
blocks) installed on the IBM Walnut board. I was able to create a JFFS2
image with mkfs.jffs2, erase the flash, and then copy the image to the flash
( about 200 bytes). I can mount the mtdblock and browse the files on the
JFFS2 file system, but I cannot make any changes to the existing files or
add new ones. Everytime I try to modify it I get the 'No space left on
device' error. I had a quick look through the JFFS2 code and I see that
there has to be at least 5 free erase blocks (+ data) for the FS to function
properly ... but I have 8! I tried changing JFFS2_RESERVED_BLOCKS_BASE from
3 to 1 (which gives a total of 3 blocks for minimum requirement) and it
still didn't work. Am I missing something here? Do I have to pad my image
with 0xFF and make it 512K before I copy it? Is there another way to make
the image and copy it to the flash ... etc?

Regards,
Sebastian Vaitus


>
> sebastian.vaitus@masstechgroup.com said:
> > Erase at 0x00010000 finished, but state != MTD_ERASE_DONE. State is
> > 0x0 instead.
>
> What hardware?
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
