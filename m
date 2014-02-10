Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WClyk-0002UQ-Ml
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 08:12:35 +0000
Date: Mon, 10 Feb 2014 05:12:00 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210081159.GA10872@localhost>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140210012913.GA9505@localhost> <52F8856A.6050208@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52F8856A.6050208@nod.at>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 10, 2014 at 08:53:14AM +0100, Richard Weinberger wrote:
> Am 10.02.2014 02:29, schrieb Ezequiel Garcia:
> >>> +
> >>> +               mutex_lock(&dev->vol_mutex);
> >>> +               res = do_ubiblock_request(dev, req);
> >>> +               mutex_unlock(&dev->vol_mutex);
> >>
> >> This means that you can never do parallel IO?
> >>
> > 
> > Indeed. Feel free to prepare a follow-up patch improving it,
> > once this is merged.
> 
> Sorry, this is a very lame argument.
> 
> You need to describe why your application design has this flaw.

Not at all. It's perfectly fine to merge a feature with a simple
implementation and improve it progressively. In fact, I've explicitly
chosen the simplest implementation whenever possible. We can always
get back here and improve the performance.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
