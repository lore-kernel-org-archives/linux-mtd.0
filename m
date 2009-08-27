Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MgYUo-0006oy-8A
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 06:30:10 +0000
Subject: Re: Creating an ext3 partition on an mtd device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark Ryden <markryde@gmail.com>
In-Reply-To: <dac45060908262259r2f5ff85tb2608bd02153e797@mail.gmail.com>
References: <dac45060908261244wbfc744apec0d5195a0f1dbcf@mail.gmail.com>
	<1251321997.10982.101.camel@jjw-linux>
	<dac45060908262259r2f5ff85tb2608bd02153e797@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Aug 2009 09:29:20 +0300
Message-Id: <1251354560.3514.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Justin Waters <justin.waters@timesys.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-27 at 08:59 +0300, Mark Ryden wrote:
> Hello, Justin,
> Thanks for your answer.
> 
> Then why do I have in "Essential Linux Device Drivers" this , in
> "Block Device Emulation" section of chapter 17, "Memory Technology
> Devices" , this:
> 
> Block Device Emulation
> The MTD subsystem provides a block driver called mtdblock that
> emulates a hard disk over flash memory. You can put any filesystem,
> say EXT2, over the emulated flash disk. Mtdblock hides complicated
> flash access procedures (such as preceding a write with an erase of
> the corresponding sector) from the filesystem. Device nodes created by
> mtdblock are named /dev/mtdblock/X, where X is the partition number.
> To create an EXT2 filesystem on the pda_fs partition of the handheld,
> as shown in Figure 17.2, do the following:
> bash> mkfs.ext2 /dev/mtdblock/2                 Create an EXT2 filesystem
>                                                  on the second partition
> 
> bash> mount /dev/mtdblock/2 /mnt                Mount the partition

mtdblock does not do any bad block handling, so you cannot use it with
NAND. And it does not do any wear-leveling, and it has zero tolerance to
power cuts.

I think the text above assumes that you have NOR, you do not care about
WL and power-cuts.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
