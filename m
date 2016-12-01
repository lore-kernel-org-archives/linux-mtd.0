Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCVNE-0000af-8S
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 17:42:21 +0000
Received: by mail-pg0-x244.google.com with SMTP id p66so5232068pga.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 09:41:59 -0800 (PST)
Date: Thu, 1 Dec 2016 09:41:56 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [GIT PULL] mtd: spi-nor: updates for 4.10
Message-ID: <20161201174156.GA66143@google.com>
References: <2bdf6239-d998-825c-cd22-db6ac09d3391@atmel.com>
 <20161201022238.GA3973@google.com>
 <a16b5d6e-2fcf-be61-f41d-788a08c23177@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a16b5d6e-2fcf-be61-f41d-788a08c23177@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 01, 2016 at 03:36:35PM +0100, Marek Vasut wrote:
> On 12/01/2016 03:22 AM, Brian Norris wrote:
> > BTW, does Marek have access to your repo, or are you planning on doing
> > all the merging?
> 
> I'm not a big github fan, but I have access, yep.

Not even as a dumb git server? I can understand not appreciating the
web interface.

Anyway, nothing (except MAINTAINERS, which can be changed) requires we
use github. We could probably set up a shared infradead.org repo or
maybe even kernel.org if you'd prefer.

Brian
