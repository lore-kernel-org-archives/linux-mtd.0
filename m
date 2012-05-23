Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SX73p-0007U6-OP
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 08:36:50 +0000
Date: Wed, 23 May 2012 10:36:00 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
 nand_wait{_ready, }
Message-ID: <20120523083600.GA4201@parrot.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
 <1337589758-8775-3-git-send-email-johan.gunnarsson@axis.com>
 <1337673190.2483.115.camel@sauron.fi.intel.com>
 <A612847CFE53224C91B23E3A5B48BAC7534B129D18@xmail3.se.axis.com>
 <20120522171023.GA2372@parrot.com>
 <CAN8TOE90vWS713_vKNwkBDMBPbEiz10R0oiawnRVgmTYFRPh0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAN8TOE90vWS713_vKNwkBDMBPbEiz10R0oiawnRVgmTYFRPh0g@mail.gmail.com>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jesper Nilsson <jespern@axis.com>,
 Johan Gunnarsson <johan.gunnarsson@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 23, 2012 at 07:39:51AM +0100, Brian Norris wrote:
(...)
> >> > Can we simplify this function and assume everyone has "dev_ready()" and
> >> > add BUG_ON(!chip->dev_ready) - could you make a small research ? Or can
> >>
> >> The drivers/mtd/nand/h1910.c driver sets dev_ready to NULL on init. The others seem to have dev_ready implementations.
> 
> Not true: there are several drivers which do not have dev_ready, but
> this is also because they are controller-based, so they provide their
> own cmdfunc as well, mostly avoiding the nand_wait_ready stuff.
> (Drivers: denali.c, docg4.c, my out-of-tree driver, ...)
> 
> Note: another use of nand_wait_ready is in nand_do_read_ops and
> nand_do_read_oob, under the following condition:
>     if (!(chip->options & NAND_NO_READRDY)) {
> Isn't NAND_NO_READRDY no longer needed, since I killed autoincrement?
> (i.e., we *always* "do not support autoincrement", as its comment says
> in nand.h) So if we kill this option, we can kill the only use of
> nand_wait_ready outside of cmdfunc(); this brings us closer to being
> able to using BUG_ON(!chip->dev_ready). I'll send a patch for this,
> and you guys can comment.

Agreed.
 
> >> Actually, it's worse than that. If dev_ready is NULL (as in the h1910.c case) we'll crash the kernel, right?
> 
> No, I don't think so. It looks like nand_wait_ready is never called
> when dev_ready is NULL.

True, but since nand_wait_ready() is a public function, it could be called from a driver that has (dev_ready == NULL), resulting in a crash.
So all drivers must make sure they define dev_ready if they are going to call nand_wait_ready() (like cafe_nand.c).

(...)
> 
> > * the udelay() fallback should probably be phased out if only one driver (h1910) depends on it because it does not define chip->dev_ready() ?
> 
> Clarification: only one driver does leaves both chip->dev_ready and
> chip->cmdfunc NULL, right?

Yes, exactly. I meant that we could get rid of the udelay in the default chip->cmdfunc implementations (nand_command and nand_command_lp).
In other words, if chip->cmdfunc == NULL, we require chip->dev_ready != NULL. And move the existing udelay in an implementation of chip->dev_ready for the h1910 driver.

> Feel free to send a patch; it's probably easier to talk more
> concretely about a patch that implements your (seemingly reasonable)
> suggestions, and then provide comments based on concrete ideas.

Will do,
Thanks,

--
Ivan
