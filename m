Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nchwn-00035L-9K
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 16:19:25 +0000
Subject: Re: Squashfs over UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Saurabh Jain <saurabh@thinvent.in>
In-Reply-To: <c11c61211001241116i50063d7ds6e2fb4edcce0769@mail.gmail.com>
References: <c11c61211001241116i50063d7ds6e2fb4edcce0769@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 03 Feb 2010 18:17:32 +0200
Message-ID: <1265213852.7343.107.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-01-25 at 00:46 +0530, Saurabh Jain wrote:
> Hi!
> 
> I've been trying to get squashfs working on a new board with NAND
> flash. However, the mtd of the mtdblock I am using contains bad
> blocks. When I dd in the squashfs file system, the kernel throws
> end_request, nand_erase_nand and mtdblock errors.

Yeah, IMHO, current mtdblock* should die and we need one which can cope
with bad blocks...

> I therefore decided to use squashfs over UBI.

If you are fine with mtdblock otherwise, i.e., you are OK with the
wear-levelling and error handling aspects of it, then for you it will be
better to hack it a little and teach it to skip bad blocks.

UBI has some overhead you might not want.

>  I saw this discussed in
> a couple of places on the web. However, the /dev/ubi0 device created
> by ubiattach is a character device.

Right. This is documented in the MTD web pages.

>  I can't just dd my squashfs into
> it.

Right.

But you can try this hack:

1. load gluebi which will emoulate an /dev/mtdX on top of /dev/ubi0.
2. load mtdblock which will emulate /dev/mtdblockX on top of
that /dev/mtdx.

For item 1, see here:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_run_jffs2

>  If I create a UBIFS over this /dev/ubi0, and then put my squashfs
> into it, that works, but now I've got "double compression", something
> I don't want on an embedded system.
> 
> Is it possible to get squashfs to use the bad block avoidance features
> of UBI, without using UBIFS?

See above for a not very beautiful way, which should work, nevertheless.
 
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
