Received: from mail-it0-x22e.google.com ([2607:f8b0:4001:c0b::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eCg2z-0003to-CZ
 for linux-mtd@lists.infradead.org; Thu, 09 Nov 2017 06:10:43 +0000
Received: by mail-it0-x22e.google.com with SMTP id j140so9395914itj.1
 for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2017 22:10:20 -0800 (PST)
Date: Wed, 8 Nov 2017 22:10:16 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Enable notifications for linux-mtd
Message-ID: <20171109061016.GA107426@google.com>
References: <20171107092628.461ff68a@bbrezillon>
 <46cc2db3-fa2d-61ab-5e78-c88d9f371584@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46cc2db3-fa2d-61ab-5e78-c88d9f371584@ozlabs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 08, 2017 at 09:29:35AM +0800, Jeremy Kerr wrote:
> Hi Boris,
> 
> > Is there a way to send notifications to the submitter/author when the
> > status of a linux-mtd patch is changed?
> 
> Absolutely - that's just something I can turn on in your project's
> config. I assume your co-maintainers are OK with this?

What does "notification to submitter/author" mean? Only to the person
who sent the patch? Or to everyone CC'd (including the mailing list)? If
it's not the latter, then I hope no maintainer starts relying on that.
It really obscures the process if authors are getting private
notifications, and nobody ever responds publicly to say things have been
applied.

> > Not sure we'll need a notification for any kind of change, but having
> > one when the patch is marked as Accepted would be good.
> 
> Currently, the notifications are for all state changes (there's no
> config to do it selectively). Will this be a problem?

In general, mailing lists get a lot of inapplicable junk. Cross-posts,
at least (e.g., device tree source changes, documentation, and driver
patches in a single series -- we might only care about the latter 2).
Does that mean we notify submitters when things move to "Not
Applicable"? What about "Archived"? There's still non-archived stuff on
the tracker that's >3 years old. I guess spamming people isn't the end
of the world...

Brian
