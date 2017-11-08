Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCLdP-0001jp-II
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 08:22:57 +0000
Date: Wed, 8 Nov 2017 09:22:33 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marex@denx.de>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Enable notifications for linux-mtd
Message-ID: <20171108092233.3812521a@bbrezillon>
In-Reply-To: <46cc2db3-fa2d-61ab-5e78-c88d9f371584@ozlabs.org>
References: <20171107092628.461ff68a@bbrezillon>
 <46cc2db3-fa2d-61ab-5e78-c88d9f371584@ozlabs.org>
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

Hi Jeremy,

On Wed, 8 Nov 2017 09:29:35 +0800
Jeremy Kerr <jk@ozlabs.org> wrote:

> Hi Boris,
> 
> > Is there a way to send notifications to the submitter/author when the
> > status of a linux-mtd patch is changed?  
> 
> Absolutely - that's just something I can turn on in your project's
> config. I assume your co-maintainers are OK with this?

I now for sure that Richard is fine with that. Cyrille, Marek, Brian,
any problem with enabling notifications for linux-mtd?

> 
> > Not sure we'll need a notification for any kind of change, but having
> > one when the patch is marked as Accepted would be good.  
> 
> Currently, the notifications are for all state changes (there's no
> config to do it selectively). Will this be a problem?

No, that's fine. It's just that notifying when the state moves to
'Changes Requested' is a bit redundant, because the review would attest
that. Same goes for 'Superseded', the user is already aware that his
new version supersedes the old one. Anyway, it's really not a big deal,
and I'd be happy with notifications for all state changes.

Thanks,

Boris
