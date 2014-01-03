Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz6Uz-0000Ua-Tf
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 15:17:22 +0000
Received: by mail-pd0-f169.google.com with SMTP id v10so15438389pde.14
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 07:16:59 -0800 (PST)
Date: Fri, 3 Jan 2014 23:16:49 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v6] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20140103151647.GA1766@gmail.com>
References: <1387393632-5338-1-git-send-email-eliedebrauwer@gmail.com>
 <1387393632-5338-2-git-send-email-eliedebrauwer@gmail.com>
 <20131219051050.GA12530@shlinux2.ap.freescale.net>
 <CAGWqfii6=8bS8Au0m=u6zhdhmaFgAtCOCATodb_9nBtUu1geXA@mail.gmail.com>
 <20140103094412.GA16089@shlinux2.ap.freescale.net>
 <CAGWqfiiQ0V0FGGV0UiTqw9wpqUtb2hFh2mj+WhMx8_zmct1OyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWqfiiQ0V0FGGV0UiTqw9wpqUtb2hFh2mj+WhMx8_zmct1OyA@mail.gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 11:34:54AM +0100, Elie De Brauwer wrote:
> >
> > I confirmed with the hardware guy just now.
> > the hardware guy ate his word!
> >
> > If we do not apply this patch, does it mean the UBIFS can not work?
> >
> >
> 
> Thanks for doublechecking ! I'll provide a new version of this patch
> in the weekend.
> 
> If this patch does not get applied you will get bugreports related to
> "corrupt empty space"
> issues when using UBIFS, for the simple reason that ubifs only claims
> to be tolerant to
> corruption due to powercuts, and ubifs relies on the mtd layer that
> bitflips are detected
> and corrected.  In my situation I have already seen two distinct units
> (on a 20 unit population
> over a timespan of about two months) refuse to boot because of this
> issue, which were
> both solved by this patch. So ubifs might seem to work, but people
> using it will likely bump
> into nasty field issues.
I will discuss with our manager next week, and i hope the hardware guy
can fix it in the future.

thanks
Huang Shijie
