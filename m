Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCiLV-00057A-S9
 for linux-mtd@lists.infradead.org; Thu, 09 Nov 2017 08:38:00 +0000
Date: Thu, 9 Nov 2017 09:37:25 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Jeremy Kerr <jk@ozlabs.org>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse
 <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: Enable notifications for linux-mtd
Message-ID: <20171109093725.5eb2d511@bbrezillon>
In-Reply-To: <20171109061016.GA107426@google.com>
References: <20171107092628.461ff68a@bbrezillon>
 <46cc2db3-fa2d-61ab-5e78-c88d9f371584@ozlabs.org>
 <20171109061016.GA107426@google.com>
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

On Wed, 8 Nov 2017 22:10:16 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> On Wed, Nov 08, 2017 at 09:29:35AM +0800, Jeremy Kerr wrote:
> > Hi Boris,
> >   
> > > Is there a way to send notifications to the submitter/author when the
> > > status of a linux-mtd patch is changed?  
> > 
> > Absolutely - that's just something I can turn on in your project's
> > config. I assume your co-maintainers are OK with this?  
> 
> What does "notification to submitter/author" mean? Only to the person
> who sent the patch? Or to everyone CC'd (including the mailing list)? If
> it's not the latter, then I hope no maintainer starts relying on that.
> It really obscures the process if authors are getting private
> notifications, and nobody ever responds publicly to say things have been
> applied.

That's true. Jeremy, are notifications sent to all people in Cc of a
patch/patch-series, or is it just sent to the submitter and author of
the patch?

> 
> > > Not sure we'll need a notification for any kind of change, but having
> > > one when the patch is marked as Accepted would be good.  
> > 
> > Currently, the notifications are for all state changes (there's no
> > config to do it selectively). Will this be a problem?  
> 
> In general, mailing lists get a lot of inapplicable junk. Cross-posts,
> at least (e.g., device tree source changes, documentation, and driver
> patches in a single series -- we might only care about the latter 2).
> Does that mean we notify submitters when things move to "Not
> Applicable"? What about "Archived"? There's still non-archived stuff on
> the tracker that's >3 years old. I guess spamming people isn't the end
> of the world...
> 
> Brian
