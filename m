Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMsZf-0000qc-VW
 for linux-mtd@lists.infradead.org; Thu, 07 Dec 2017 09:34:37 +0000
Date: Thu, 7 Dec 2017 10:34:02 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Antonio Borneo <borneo.antonio@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Oberhollenzer
 <david.oberhollenzer@sigma-star.at>
Subject: Re: Question on mtd devices with zero erasesize
Message-ID: <20171207103402.3b4b5b69@bbrezillon>
In-Reply-To: <CAAj6DX0_BQjB1c1b_qyabAEEbP7BGHDawxF1C=Z7GD4eqeiS3Q@mail.gmail.com>
References: <CAAj6DX0_BQjB1c1b_qyabAEEbP7BGHDawxF1C=Z7GD4eqeiS3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+David (the mtd-utils maintainer)

Hi Antonio

On Wed, 6 Dec 2017 14:28:25 +0100
Antonio Borneo <borneo.antonio@gmail.com> wrote:

> Hi,
> I have searched in the mailing list archives but didn't found such topic.
> 
> In mainline kernel there are already few RAM based mtd devices; the
> concept of "erase unit" (sector or page) does not always apply to
> them.
> At least two of such devices set the field "erasesize" to zero (or,
> better, do not set it at all and left it to zero):
> - drivers/mtd/devices/ms02-nv.c
> - drivers/mtd/devices/mchp23k256.c
> 
> The following is tested with mchp23k256 only.
> Of course I read zero from /sys/class/mtd/mtdX/erasesize
> The tool mdtinfo core-dumps for division by zero when it try to
> compute the number of erase units by dividing device size by
> erasesize.
> 
> What would be the proper fix?

Fix mtd-utils to check if MTD_NO_ERASE is set
in /sys/class/mtd/mtdX/flags. If it's not, then the device does not
support erase, and erasesize is likely to be 0. In this case, you
should not try to divide something by erasesize.

> 
> First of all, is erasesize=1 correct in this case, or for some reason
> it is better to use another value?

No it's not. We should fix the tools instead of declaring a fake
erasesize.

> 
> Then, is the driver that is supposed to provide a non-zero value for erasesize?

Nope.

> Or is the mtd framework that should check the value set by the driver
> and eventually replace it with a minimum erasesize?

And No.

> Or is the userland that has to accept the zero value?

I think this is the correct answer. We'll keep drivers that were
declaring an ->erasesize of 1, just to not break existing users, but
new drivers for devices that simply don't support the erase operation
should stop implementing dummy erase methods, should set erasesize to 0
and set the MTD_NO_ERASE flag.

And of course, mtd-utils should be fixed to gracefully handle the
MTD_NO_ERASE/erasesize=0 case.

Regards,

Boris
