Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZN6dU-0007x9-MV
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 21:54:09 +0000
Message-ID: <1438811611.6328.32.camel@embedded.rocks>
Subject: Re: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Date: Wed, 05 Aug 2015 23:53:31 +0200
In-Reply-To: <55C2840B.5000709@nod.at>
References: <1438809724.6328.18.camel@embedded.rocks>
 <55C28070.2000804@nod.at> <1438810690.6328.26.camel@embedded.rocks>
 <55C2840B.5000709@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mi, 2015-08-05 at 23:45 +0200, Richard Weinberger wrote:
> Jörg,
> 
> Am 05.08.2015 um 23:38 schrieb Jörg Krause:
> > On Mi, 2015-08-05 at 23:30 +0200, Richard Weinberger wrote:

[snip]

> > 
> > I attached the kernel boot log.
> 
> Thanks.
> That's a really small UBI setup.
> [    3.202421] ubi1: default fastmap pool size: 10
> [    3.207174] ubi1: default fastmap WL pool size: 5

What do you exactly mean by small UBI setup? The fastmap pool size? The
UBI layout?

[snip]

> > 
> > It is enabled in the kernel config. Not sure how to use it.
> 
> Then just disable it. :)

I did :) I thought fastmap is used automatically by the UBI driver?

> Meanwhile I'll find out what exactly is going on.

Many thanks!
