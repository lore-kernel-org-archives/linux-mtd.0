Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRjii-0001im-L0
 for linux-mtd@lists.infradead.org; Wed, 20 Dec 2017 19:08:02 +0000
Received: by mail-it0-x243.google.com with SMTP id d137so8036461itc.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2017 11:07:50 -0800 (PST)
Date: Wed, 20 Dec 2017 11:07:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] MAINTAINERS: Move all MTD related branches to a single
 repo
Message-ID: <20171220190745.GA178979@google.com>
References: <20171218154934.6674-1-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171218154934.6674-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 18, 2017 at 04:49:34PM +0100, Boris Brezillon wrote:
> Hi MTD maintainers,
> 
> As discussed a few weeks ago, this patch is moving all MTD related
> branches to the linux-mtd repo in an attempt to make things easier
> for maintainers (it's not unusal to push the next or fixes branch to
> the wrong repo) and developers (it's hard to know where the patch was
> applied, especially when the maintainer does not specify it in his
> reply, which I do a lot :)).
> 
> Once I have gathered acks from all active maintainers, I'll apply this

Eh, I'm not sure I qualify as "active" these days, but anyway...

> patch to the mtd/next branch and ask Stephen to pull next branches from
> their new locations.
> 
> In the meantime, we should try to keep both l2-mtd and linux-mtd synced
> (that means pushing the xxx/next branches on both l2-mtd and mtd-next).

Seems fine.

Acked-by: Brian Norris <computersforpeace@gmail.com>

(Oh, well you've already pushed it.)
