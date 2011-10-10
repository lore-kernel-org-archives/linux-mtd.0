Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RDEfZ-0006SX-Oe
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2011 12:09:22 +0000
Received: by yxi11 with SMTP id 11so6499110yxi.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Oct 2011 05:09:19 -0700 (PDT)
MIME-Version: 1.0
Sender: dsdrake@gmail.com
Date: Mon, 10 Oct 2011 13:09:19 +0100
Message-ID: <CAMLZHHSW9daPS9RsMyBnhTfzUQLC0+e9_-=xqiWE4T6upbcaiQ@mail.gmail.com>
Subject: ubi vol_size and lots of bad blocks
From: Daniel Drake <dsd@laptop.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We're still working on getting ubifs shipped on OLPC XO-1.

One outstanding issue we have is that on some laptops, when switching
from jffs2 to ubifs, the laptop simply does not boot (root fs mounting
difficulties).

One case of this is when there are a large number of bad blocks on the
disk, during boot we get:
[   76.855427] UBI error: vtbl_check: too large reserved_pebs 7850,
good PEBs 7765
[   76.867878] UBI error: vtbl_check: volume table check failed:
record 0, error 9

With so many bad blocks, this is likely a problematic nand or a
corrupt BBT. However, jffs2 worked in this situation, and (with many
of our laptops in remote places) it would be nice for us to figure out
how to make ubifs handle it as well.


There are other cases of this error in the archive, and people have
generally solved it by using a smaller vol_size in the ubinize config.
Am I right in saying that reserved_pebs is computed from the vol_size
specified in the ubinize config?

I guess "good PEBs" is calculated from the amount of non-bad blocks
found during the boot process.

This suggests that using vol_size is unsafe for installations such as
ours, where while we do know the NAND size in advance, we also want to
support an unknown, high number of bad blocks which will vary
throughout the field.

I found a note in the UBI FAQ where it says vol_size can be excluded
and it will be computed to be the size of the input image, and then
the autoresize flag can be used to expand the partition later.
Excluding vol_size in this way indeed solves the problem and the
problematic laptop now boots.

So, am I right in saying that for an installation such as OLPC, where
resilience to strange NAND conditions involving high numbers of bad
blocks is desired, it is advisable to *not* specify vol_size in
ubinize.cfg?

(If so I'll send in a FAQ update for the website.)

The one bit I don't understand is what happens if another block goes
bad later. If the autoresize functionality has modified reserved_pebs
to represent the exact number of good blocks on the disk (i.e.
reserved_pebs==good_PEBs), next time a block goes bad the same
reserved_pebs>good_PEBs boot failure would be hit again. But I am
probably missing something.

cheers,
Daniel
