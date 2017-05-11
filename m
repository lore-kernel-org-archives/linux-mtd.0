Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8swi-0002vU-5k
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 18:36:17 +0000
Received: by mail-pg0-x244.google.com with SMTP id i63so4507093pgd.2
 for <linux-mtd@lists.infradead.org>; Thu, 11 May 2017 11:35:55 -0700 (PDT)
Date: Thu, 11 May 2017 11:35:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Colin King <colin.king@canonical.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: make nand_ooblayout_lp_hamming_ops static
Message-ID: <20170511183552.GI70297@google.com>
References: <20170504121100.2709-1-colin.king@canonical.com>
 <20170504160813.23bad4f9@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170504160813.23bad4f9@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 04, 2017 at 04:08:13PM +0200, Boris Brezillon wrote:
> On Thu,  4 May 2017 13:11:00 +0100
> Colin King <colin.king@canonical.com> wrote:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > nand_ooblayout_lp_hamming_ops can be made static as it does not need to be
> > in global scope.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Brian, feel free to apply this patch directly if you want, otherwise,
> I'll queue it for 4.13.

Eh, queue it for 4.13, or in a fixes branch if you want.
