Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIjEe-0000Gd-3q
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 20:06:25 +0000
Received: by pdbnt7 with SMTP id nt7so18205424pdb.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 13:06:01 -0700 (PDT)
Date: Fri, 24 Jul 2015 13:05:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Han Xu <xhnjupt@gmail.com>, Cory Tusar <cory.tusar@pid1solutions.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH 1/1] mtd: fsl-quadspi: Add mutex for accessing different
 SPI-NOR devices
Message-ID: <20150724200558.GN8876@google.com>
References: <1437056014-16928-1-git-send-email-alexander.stein@systec-electronic.com>
 <2755588.WRnIZEyBVY@ws-stein>
 <CA+EcR22muPFsg_kRzAaAmhKm1=5xBRDeuke_i9UHvFQd_fgnzQ@mail.gmail.com>
 <1721136.reBpNMVAvj@ws-stein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1721136.reBpNMVAvj@ws-stein>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 23, 2015 at 06:00:43PM +0200, Alexander Stein wrote:
> On Thursday 23 July 2015 10:48:33, Han Xu wrote:
> > The link is the first version, please check the one pushed in l2-mtd
> > repo. Thanks.
> 
> Thanks for the hint. Didn't know about that repo.

It's included in linux-next.git [1], and it's listed in MAINTAINERS and on
the linux-mtd website [2]. There's a full explanation there.

> Found the commit at http://git.infradead.org/l2-mtd.git/commit/392d39cfcaa9bcfa202fb0fd3bc65f3c20de318f
> 
> Brian: When does this hit mainline? v4.3?

Yes, it'll go out for 4.3-rc1.

Brian

[1] https://www.kernel.org/doc/man-pages/linux-next.html
[2] http://linux-mtd.infradead.org/source.html
