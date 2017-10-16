Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e4DnK-0007d5-4L
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 22:23:36 +0000
From: Richard Weinberger <richard@nod.at>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 user-mode-linux-devel@lists.sourceforge.net,
 user-mode-linux-user@lists.sourceforge.net, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] kconfig: kill off GENERIC_IO option
Date: Tue, 17 Oct 2017 00:23:44 +0200
Message-ID: <1670220.TrXKNt6kix@blindfold>
In-Reply-To: <20171016221631.23472-1-robh@kernel.org>
References: <20171016221631.23472-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 17. Oktober 2017, 00:16:31 CEST schrieb Rob Herring:
> The GENERIC_IO option is set for every architecture except tile and score
> as those define NO_IOMEM. The option only controls visibility of
> CONFIG_MTD which doesn't appear to be necessary for any reason, so let's
> just remove GENERIC_IO.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: user-mode-linux-devel@lists.sourceforge.net
> Cc: user-mode-linux-user@lists.sourceforge.net
> Cc: linux-mtd@lists.infradead.org
> ---
>  arch/um/Kconfig.common | 1 -
>  drivers/mtd/Kconfig    | 1 -
>  lib/Kconfig            | 4 ----
>  3 files changed, 6 deletions(-)

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
