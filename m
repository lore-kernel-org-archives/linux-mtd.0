Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsuOP-0001H3-8h
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 09:23:09 +0000
Received: by fxm12 with SMTP id 12so3674685fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 02:23:04 -0700 (PDT)
Subject: Re: [RFC] [MTD-utils] mkfs.jffs2: JFFS2 and minimal erase block size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
In-Reply-To: <AANLkTim5Feo4a_37eRpx0TSsNWBoR2TxtX7cUPxRG6ry@mail.gmail.com>
References: <AANLkTinR9H7B5taVHmowOQ8Z==dQU4PdcnjLyHKPRibV@mail.gmail.com>
	<1283427501.3085.11.camel@brekeke>
	<AANLkTim5Feo4a_37eRpx0TSsNWBoR2TxtX7cUPxRG6ry@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Sep 2010 12:21:35 +0300
Message-ID: <1283851295.2979.26.camel@localhost>
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

On Tue, 2010-09-07 at 11:16 +0200, Yegor Yefremov wrote:
> Hello Artem,
> 
> >> I'm using a NOR flash SST39VF3201. According to its data sheet the
> >> erase size is 2 Kword. That corresponds to -e 0x1000 value. But the
> >> mkfs.jffs2 utility has a limit of 0x2000 bytes. If I change this limit
> >> to 0x1000 and create an image, I can successfully mount and use it,
> >> with 8KiB value the jffs2 driver fails to work with such an image. I
> >> have found some similar complains like this one
> >> http://lists.infradead.org/pipermail/linux-mtd/2009-February/024523.html,
> >> but no one seems to have asked this question on the list.
> >>
> >> Is there any reason for limiting erase block to 0x2000?
> >>
> >> I've created a patch to decrease this value to 0x1000, but perhaps
> >> there are any other way?
> >
> > JFFS2 should be able to fit at least one node to eraseblock. The maximum
> > node size is 4KiB+few bytes. This is why the minimum eraseblocks size is
> > 8KiB.
> >
> > But in practice, even 8KiB is bad because you and up with wasting a lot
> > of space at the end of eraseblocks.
> >
> > You should join several erasblock into one virtual eraseblock of 64 or
> > 128 KiB and use it - this will be more optiomal.
> 
> I tried to use 128KiB, but still got following errors:
> 
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f4024:
> 0xadec instead
> Further such events for this erase block will not be printed
> Node at 0x000f4fb8 with length 0x0000004a would run over the end of
> the erase block
> Perhaps the file system was created with the wrong erase size?
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f5000:
> 0x706d instead
> # JFFS2 warning: (563) jffs2_do_read_inode_internal: Truncating ino
> #318 to 62192 bytes failed because it only had 61440 bytes to start
> with!
> JFFS2 warning: (563) jffs2_do_read_inode_internal: Truncating ino #424
> to 7828 bytes failed because it only had 4096 bytes to start with!
> JFFS2 warning: (563) jffs2_do_read_inode_internal: Truncating ino #489 to 11528
> bytes failed because it only had 8192 bytes to start with!

You need to make your driver report 128KiB eraseblock size and emulate
it, then it'll work. It won't work out of the box.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
