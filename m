Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUurC-0002Bv-Kf
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 09:19:47 +0000
Received: by mail-pa0-f46.google.com with SMTP id kx10so4040930pab.19
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 02:19:24 -0700 (PDT)
Date: Tue, 1 Apr 2014 02:19:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [REV3] mtd: nand: Prepare for Micron on-die ECC controller
 support.
Message-ID: <20140401091920.GJ6400@brian-ubuntu>
References: <1396025800-18444-1-git-send-email-davidm@egauge.net>
 <20140329131642.GA2775@book.gsilab.sittig.org>
 <CALnQHM2whsLcM_4q76Skgjj4oVjgAbofX7iAVBgqZkPOu5UWEQ@mail.gmail.com>
 <20140331194522.GL2775@book.gsilab.sittig.org>
 <CALnQHM29vnXxpFNEe1rtgc1-yuSSy8e6hSna-WJ+=YvzZJ1pAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALnQHM29vnXxpFNEe1rtgc1-yuSSy8e6hSna-WJ+=YvzZJ1pAQ@mail.gmail.com>
Cc: Gerhard Sittig <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 31, 2014 at 02:58:12PM -0600, David Mosberger wrote:
> On Mon, Mar 31, 2014 at 1:45 PM, Gerhard Sittig <gsi@denx.de> wrote:
> > Isn't there the ONFI SETFEATURE request?  And don't you use this
> > very request to disable and enable chip internal ECC support, to
> > get the raw (uncorrected) bits after bitflips were detected?  So
> > I understand that there is support to enable this mode at will,
> > and we already have (or will have) code to do so.
> >
> > If we consider disabling on-die-ECC support when we find it
> > enabled and know it's not what the user wants to run, then the
> > next logical step might be to support enabling this feature if
> > the user wants it and the chip doesn't have it enabled at this
> > point in time.
> >
> > So I guess the buffers should get allocated as soon as the chip
> > supports on-die-ECC.  (While the allocation should only get
> > introduced in the phase where the raw-read and bitflip count gets
> > added.)
> 
> The ECC-mode of the driver never changes.
> Sure, what you describe could be implemented as an additional feature
> in the future (I don't have any plans to do so since it makes little sense to
> me, as no other ECC-mode uses the layout of the on-die-controller).

I don't think we should expect changes at runtime. I'd go with your
assessment and implementation (although I don't really like 2 extra
buffers...).

Brian
