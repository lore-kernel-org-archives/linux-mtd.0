Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1XgrnK-000533-8k
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 09:01:26 +0000
Date: Wed, 22 Oct 2014 11:01:02 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/2] ubiformat: Leave space for fastmap anchor
Message-ID: <20141022090102.GY14443@pengutronix.de>
References: <1413964111-4048-1-git-send-email-s.hauer@pengutronix.de>
 <1413964111-4048-3-git-send-email-s.hauer@pengutronix.de>
 <54476785.5020603@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54476785.5020603@nod.at>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 22, 2014 at 10:15:01AM +0200, Richard Weinberger wrote:
> Am 22.10.2014 um 09:48 schrieb Sascha Hauer:
> > The fastmap code needs a free eraseblock in the first 64 erasblocks
> > to write a fastmap anchor. Since ubiformat continuously writes the
> > image to the flash the fastmap code won't find a free block and
> > fastmap will be disabled. 
> 
> If UBI is unable to write a fastmap it will try again later.
> So, it will be not disabled.
> 
> > With this patch ubiformat skips flashing
> > a block at the beginning thus allowing the fastmap code to write
> > an anchor.
> 
> Hmm, this is a bit hacky. What prevents UBI itself from using this free PEB
> after the first attach? I.e. if a bitflip happens?
> The in kernel code has already a mechanism to move used PEBs < 64 to make space
> for the anchor.

Ah, indeed. I wasn't aware of this. I think we were confused by not
having fm_autoconvert enabled in the kernel and using ubiformat and UBI
from barebox.
So right now I tested that the kernel makes space for the anchor and
has fastmap support on the second attach of an mtd device.

So it seems my problem is solved without patching ubiformat. Nice ;)

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
