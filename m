Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eQxqI-0001zI-HU
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 16:00:40 +0000
Date: Mon, 18 Dec 2017 17:00:16 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] MAINTAINERS: Move all MTD related branches to a single
 repo
Message-ID: <20171218170016.1f83f0d6@bbrezillon>
In-Reply-To: <1513612535.11477.25.camel@infradead.org>
References: <20171218154934.6674-1-boris.brezillon@free-electrons.com>
 <1513612535.11477.25.camel@infradead.org>
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

On Mon, 18 Dec 2017 15:55:35 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Mon, 2017-12-18 at 16:49 +0100, Boris Brezillon wrote:
> > 
> > In the meantime, we should try to keep both l2-mtd and linux-mtd synced
> > (that means pushing the xxx/next branches on both l2-mtd and mtd-next).  
> 
> You could make a symlink which would mean you don't have to (and
> mustn't) do that...

Hm, during the transition we still have 2 master branches which are
both pulled by Stephen in linux-next, so if we do that before Stephen
has updated his script, mtd/next won't appear in linux-next anymore.
