Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bBYTh-0008RN-Bj
 for linux-mtd@lists.infradead.org; Sat, 11 Jun 2016 02:16:50 +0000
Received: by mail-pf0-x241.google.com with SMTP id 66so4254509pfy.1
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jun 2016 19:16:28 -0700 (PDT)
Date: Fri, 10 Jun 2016 19:16:25 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: add support for pairing scheme description
Message-ID: <20160611021625.GA144502@google.com>
References: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

I've mostly just reviewed the cover and first patch for now, since that
sets up the rest. A few questions and comments. I hope to review some
more and have more to say later this weekend.

On Mon, Apr 25, 2016 at 12:01:17PM +0200, Boris Brezillon wrote:
> Hi,
> 
> This series is the first step towards reliable MLC/TLC NAND support.
> Those patches allows the NAND layer to expose page pairing information
> to MTD users.

Have you surveyed many types of NAND to get a representative sampling of
what kind of pairing schemes are out there? Do you think you've covered
the possibilities well enough in your API? I have a few comments on the
patches to this effect. I honestly don't know the answer to these
questions, because AFAIR, this is rarely well documented in datasheets.

> The plan is to teach UBI about those constraints and let UBI code take
> the appropriate precautions when dealing with those multi-level cells
> NANDs. The way we'll handle this "paired pages" constraint will be
> described soon in a series adapting the UBI layer, so stay tune ;).
> 
> Note that this implementation only allows page pairing scheme description
> when the NAND has a full-id entry in the nand_ids table.
> This should be addressed in some way for ONFI and JEDEC NANDs, though
> I'm not sure how to handle this yet.

Do ONFI or JEDEC parameter pages even provide this kind of info? The
ONFI spec doesn't mention paired pages.

Brian

> Best Regards,
> 
> Boris
> 
> Boris Brezillon (4):
>   mtd: introduce the mtd_pairing_scheme concept
>   mtd: nand: implement two pairing scheme
>   mtd: nand: add a pairing field to nand_flash_dev
>   mtd: nand: H27UCG8T2ATR: point to the correct pairing scheme
>     implementation
> 
>  drivers/mtd/mtdcore.c        | 62 ++++++++++++++++++++++++++++
>  drivers/mtd/mtdpart.c        |  1 +
>  drivers/mtd/nand/nand_base.c | 97 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/nand_ids.c  |  2 +-
>  include/linux/mtd/mtd.h      | 64 +++++++++++++++++++++++++++++
>  include/linux/mtd/nand.h     |  5 +++
>  6 files changed, 230 insertions(+), 1 deletion(-)
> 
> -- 
> 2.7.4
> 
