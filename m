Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOSkF-0000Is-GS
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 17:51:49 +0000
Received: by mail-pf0-x22d.google.com with SMTP id s66so26518525pfs.1
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2017 10:51:27 -0700 (PDT)
Date: Fri, 23 Jun 2017 10:51:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Colin King <colin.king@canonical.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][mtd-next] mtd: parser: print hex size_t value using
 correct %zx printk format specifier
Message-ID: <20170623175124.GI14148@google.com>
References: <20170623090023.9482-1-colin.king@canonical.com>
 <e8cf8fb56ef0b56cca3dce61302a1099@milecki.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8cf8fb56ef0b56cca3dce61302a1099@milecki.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 23, 2017 at 12:02:34PM +0200, Rafał Miłecki wrote:
> On 2017-06-23 11:00, Colin King wrote:
> >From: Colin Ian King <colin.king@canonical.com>
> >
> >Use %zx instead of %X for size_t variable offset, fixes build warning:
> >
> >warning: format '%X' expects argument of type 'unsigned int', but
> >argument
> >2 has type 'size_t {aka long unsigned int}' [-Wformat=]
> >
> >Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> I sent similar patch few hours earlier:
> [PATCH] mtd: parsers: trx: fix pr_err format for printing offset
> https://patchwork.ozlabs.org/patch/779789/
> 
> Brian: you may pick the one with nicer commit message, whichever one you
> prefer :)

I'll go with:
(a) the earlier one and
(b) the one that doesn't change 'X' to 'x'

That means Rafał, you're our lucky winner today! Thanks for playing,
Colin.

Regards,
Brian
