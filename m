Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMZkn-0004Id-Pd
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 13:28:51 +0000
Received: by mail-lf0-x234.google.com with SMTP id f18so4224273lfg.8
 for <linux-mtd@lists.infradead.org>; Wed, 06 Dec 2017 05:28:28 -0800 (PST)
MIME-Version: 1.0
From: Antonio Borneo <borneo.antonio@gmail.com>
Date: Wed, 6 Dec 2017 14:28:25 +0100
Message-ID: <CAAj6DX0_BQjB1c1b_qyabAEEbP7BGHDawxF1C=Z7GD4eqeiS3Q@mail.gmail.com>
Subject: Question on mtd devices with zero erasesize
To: linux-mtd@lists.infradead.org
Cc: Antonio Borneo <borneo.antonio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have searched in the mailing list archives but didn't found such topic.

In mainline kernel there are already few RAM based mtd devices; the
concept of "erase unit" (sector or page) does not always apply to
them.
At least two of such devices set the field "erasesize" to zero (or,
better, do not set it at all and left it to zero):
- drivers/mtd/devices/ms02-nv.c
- drivers/mtd/devices/mchp23k256.c

The following is tested with mchp23k256 only.
Of course I read zero from /sys/class/mtd/mtdX/erasesize
The tool mdtinfo core-dumps for division by zero when it try to
compute the number of erase units by dividing device size by
erasesize.

What would be the proper fix?

First of all, is erasesize=1 correct in this case, or for some reason
it is better to use another value?

Then, is the driver that is supposed to provide a non-zero value for erasesize?
Or is the mtd framework that should check the value set by the driver
and eventually replace it with a minimum erasesize?
Or is the userland that has to accept the zero value?

Thanks and Best Regards,
Antonio Borneo
