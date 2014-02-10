Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCmAa-0002mq-QT
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 08:24:49 +0000
Message-ID: <1392020652.32363.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 10 Feb 2014 10:24:12 +0200
In-Reply-To: <20140210081159.GA10872@localhost>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140210012913.GA9505@localhost> <52F8856A.6050208@nod.at>
 <20140210081159.GA10872@localhost>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-02-10 at 05:12 -0300, Ezequiel Garcia wrote:
> On Mon, Feb 10, 2014 at 08:53:14AM +0100, Richard Weinberger wrote:
> > Am 10.02.2014 02:29, schrieb Ezequiel Garcia:
> > >>> +
> > >>> +               mutex_lock(&dev->vol_mutex);
> > >>> +               res = do_ubiblock_request(dev, req);
> > >>> +               mutex_unlock(&dev->vol_mutex);
> > >>
> > >> This means that you can never do parallel IO?
> > >>
> > > 
> > > Indeed. Feel free to prepare a follow-up patch improving it,
> > > once this is merged.
> > 
> > Sorry, this is a very lame argument.
> > 
> > You need to describe why your application design has this flaw.
> 
> Not at all. It's perfectly fine to merge a feature with a simple
> implementation and improve it progressively. In fact, I've explicitly
> chosen the simplest implementation whenever possible. We can always
> get back here and improve the performance.

The NAND part of the MTD layer serializes all the I/O, so probably it is
OK. May be needs to be documented, though. May be a comment in the code
would be nice to have too.

I mean, it is fine to have limitations, just be explicit and open about
all of them, in order to make your user aware of what to expect.

Would you be able to write a small article for the MTD web site about
the driver, may be some I/O figures there too, the limitations too? And
send a patch against mtd-www.git 

-- 
Best Regards,
Artem Bityutskiy
