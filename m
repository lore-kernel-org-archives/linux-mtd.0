Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1da0pF-0002mU-L0
 for linux-mtd@lists.infradead.org; Tue, 25 Jul 2017 14:28:43 +0000
Received: by mail-wm0-x241.google.com with SMTP id 184so16468279wmo.3
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2017 07:28:20 -0700 (PDT)
Date: Tue, 25 Jul 2017 16:28:16 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] mtd: block2mtd: Fallback to read-only mode
Message-ID: <20170725142816.GM30901@pali>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-4-git-send-email-pali.rohar@gmail.com>
 <CAFLxGvxjUgj=R6h9suNf4+eXRRtomw-WshxKpW5H1QY3EE1=1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLxGvxjUgj=R6h9suNf4+eXRRtomw-WshxKpW5H1QY3EE1=1g@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 21 July 2017 21:53:26 Richard Weinberger wrote:
> > @@ -240,6 +244,13 @@ static struct block2mtd_dev *add_device(char *devname, uint32_t erase_size,
> >         /* Get a handle on the device */
> >         bdev = blkdev_get_by_path(devname, mode, dev);
> >
> > +       /* Try fallback to read only mode */
> > +       if (IS_ERR(bdev)) {
> > +               bdev = blkdev_get_by_path(devname, FMODE_READ, dev);
> > +               if (!IS_ERR(bdev))
> > +                       dev->ro_mode = true;
> > +       }
> > +
> 
> Please use bdev_read_only() instead of blindly trying again with another mode.
> 
> >  #ifndef MODULE
> >         /*
> >          * We might not have the root device mounted at this point.
> > @@ -261,6 +272,13 @@ static struct block2mtd_dev *add_device(char *devname, uint32_t erase_size,
> >                 if (!devt)
> >                         continue;
> >                 bdev = blkdev_get_by_dev(devt, mode, dev);
> > +
> > +               /* Try fallback to read only mode */
> > +               if (IS_ERR(bdev)) {
> > +                       bdev = blkdev_get_by_path(devname, FMODE_READ, dev);
> > +                       if (!IS_ERR(bdev))
> > +                               dev->ro_mode = true;
> > +               }
> 
> Same here.

Ok, I will change it.

-- 
Pali Rohár
pali.rohar@gmail.com
