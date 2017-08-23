Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkW9x-0005Ca-43
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 13:57:30 +0000
Date: Wed, 23 Aug 2017 15:57:03 +0200
From: Oleksij Rempel <ore@pengutronix.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kernel@pengutronix.de
Subject: Re: "UBIFS error (pid 396): dbg_check_space_info: free space changed
 from" + ecryptfs
Message-ID: <20170823135702.7qrbhlyzk54rua3h@pengutronix.de>
References: <dbc5bc9f-6c38-a0c3-e776-050a70382814@rempel-privat.de>
 <20170802140642.kpsdh3jfow2azevm@pengutronix.de>
 <2d11efa2-dda2-7810-dd22-965b295bbff9@nod.at>
 <CAFLxGvwK=J0zMyNa6zYG9jHXz3yTb_TFfEQBkMy0sqJyw7K73g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvwK=J0zMyNa6zYG9jHXz3yTb_TFfEQBkMy0sqJyw7K73g@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 18, 2017 at 12:59:02PM +0200, Richard Weinberger wrote:
> On Sun, Aug 6, 2017 at 11:25 AM, Richard Weinberger <richard@nod.at> wrote:
> > Oleksij,
> >
> > Am 02.08.2017 um 16:06 schrieb Oleksij Rempel:
> >> Hallo all,
> >>
> >> Initial issue was detected on kernel 4.0.9 and is still reproducible
> >> with same kernel version + most of back ported ubi/ubifs patches till
> >> the kernel v4.12. UBIfs encryption patches was not backported.
> >>
> >> To reproduce it I needed:
> >> - system with fresh flashed ubi image.
> >> - on first start it should run following script:
> >>> mount -o remount,rw /
> >>> mount -t ecryptfs ... /dst
> >>> ... do some work and mv some files to /dst
> >>> umount /dst
> >>> mount -o remount,ro / <--  UBIFS error (pid 396): dbg_check_space_info:
> >
> > Does this also happen on mainline?
> > Also please try in nandsim to rule out chip specific issues.
> >
> > Can you please share the ecryptfs configuration?
> > i.e. are file names encrypted or not?

File name should be encrypted. The mount option is:
mount -t ecryptfs -o
ecryptfs_sig=${SIG},ecryptfs_fnek_sig=${SIG},ecryptfs_unlink_sigs,ecryptfs_key_bytes=32,ecryptfs_cipher=aes
/$dst /$dst

I'll try to reproduce it tomorrow with mainline kernel.

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
