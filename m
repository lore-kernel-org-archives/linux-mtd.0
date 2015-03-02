Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSTOH-000308-RL
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2015 16:40:22 +0000
Received: by iecrl12 with SMTP id rl12so49274681iec.4
 for <linux-mtd@lists.infradead.org>; Mon, 02 Mar 2015 08:39:59 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 2 Mar 2015 08:39:59 -0800
Message-ID: <CALupW3CugdN+cwMZzePAhZSHbGhd9gfjk==DH=7Ezu54Y1BXUA@mail.gmail.com>
Subject: "corrupt empty space" error on boot?!?
From: Steve deRosier <derosier@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

So, after torturing one of our devices by rebooting it for a few
hundred iterations, we ran across a situation where the system fails
to boot due to a corrupt empty space error:

    Starting kernel ...

    Uncompressing Linux... done, booting the kernel.
    UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB 4:3918
    UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 4:398
    UBIFS error (pid 1): ubifs_scanned_corruption: first 8192 bytes from 8
    UBIFS error (pid 1): ubifs_scan: LEB 4 scanning failed
    Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-b)

This is on kernel v3.8, atmel_nand diver.  In earlier discussions, it
was suggested that the driver would encounter this sort of problem
because the driver/chip can't do ECC in erased pages so a bitflip
there could be an issue.  This is the first time I've seen this
problem in the wild though.

1. Is this likely what I'm seeing?
2. Will moving to a recent kernel help (we're currently updating our
mainline to bleeding-edge 4.0)?
3. How can I programmatically recover from this situation?

Logically, it seems to me that a non ecc protected bit-flip in an
empty page should be a non-issue. UBI should be able to move the
block, erase the block, torture/return-to-service and move on with
it's life.  No data is destroyed or even affected.

A unit not mounting the rootfs because of a bit-flip in _empty_space_
is unacceptable to us, so I've got to figure out a way to deal with
this rare event.

Any help would be appreciated.

Thanks,
- Steve
