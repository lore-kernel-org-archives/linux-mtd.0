Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkXwI-0004ei-Fg
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 08:19:47 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>,
	Holger Brunck <holger.brunck@keymile.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: [PATCH 0/7] UBIFS: fix recovery on CFI NOR
Date: Wed,  2 Feb 2011 10:21:51 +0200
Message-Id: <1296634917-19335-1-git-send-email-dedekind1@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Hi,

here is the patch-set against the latest Linux kernel (e.g. 2.6.38-rc3)
which should fix CFI NOR flash recovery.

The previous attempt was not entirely successful - it broke backward
compatibility and was reverted:

http://marc.info/?l=linux-kernel&m=129631939419818&w=2

This patch-set goes the following way:
1. Incorporates the notion of 'writebufsize' into UBI and UBIFS as
   'max_write_size', because using term write-buffer would be confusing, as
   UBIFS has its own write-buffers.
2. Changes UBIFS write-buffer and makes it of 'max_write_size', instead of
   'min_io_size'. This presumably leads to better performance because we
   accumulate more data and write them in larger chunks and faster.
   And we do not waste space when synchronizing UBIFS write-buffers because we
   write only the used amount of bytes aligned to 'min_io_size'. So this is an
   improvement.
3. Tweak UBIFS recovery and make it aware of the fact that we can write in
   chunks larger than 'min_io_size'. Namely, we can write in 'max_write_size'
   chunks.

Could you guys please test this WRT power cuts and let me know if it solves the
issues?

Note, obviously this requires patches from Anatolij which introduce
'writebufsize' to MTD, except of the UBI patch which was reverted later.

Artem.
