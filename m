Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOT7U-0004Nz-7Y
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 18:15:50 +0000
Received: by mail-pf0-x244.google.com with SMTP id y7so8474612pfd.3
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2017 11:15:28 -0700 (PDT)
Date: Fri, 23 Jun 2017 11:15:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Colin Ian King <colin.king@canonical.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][mtd-next] mtd: parser: print hex size_t value using
 correct %zx printk format specifier
Message-ID: <20170623181524.GB55942@google.com>
References: <20170623090023.9482-1-colin.king@canonical.com>
 <e8cf8fb56ef0b56cca3dce61302a1099@milecki.pl>
 <20170623175124.GI14148@google.com>
 <c8049ec7-74c6-3a44-dbe3-b9f4b02c8666@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8049ec7-74c6-3a44-dbe3-b9f4b02c8666@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 23, 2017 at 07:03:11PM +0100, Colin Ian King wrote:
> On 23/06/17 18:51, Brian Norris wrote:
> > On Fri, Jun 23, 2017 at 12:02:34PM +0200, Rafał Miłecki wrote:
> >> On 2017-06-23 11:00, Colin King wrote:
> >>> From: Colin Ian King <colin.king@canonical.com>
> >>>
> >>> Use %zx instead of %X for size_t variable offset, fixes build warning:
> >>>
> >>> warning: format '%X' expects argument of type 'unsigned int', but
> >>> argument
> >>> 2 has type 'size_t {aka long unsigned int}' [-Wformat=]
> >>>
> >>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >>
> >> I sent similar patch few hours earlier:
> >> [PATCH] mtd: parsers: trx: fix pr_err format for printing offset
> >> https://patchwork.ozlabs.org/patch/779789/
> >>
> >> Brian: you may pick the one with nicer commit message, whichever one you
> >> prefer :)
> > 
> > I'll go with:
> > (a) the earlier one and
> > (b) the one that doesn't change 'X' to 'x'
> > 
> > That means Rafał, you're our lucky winner today! Thanks for playing,
> > Colin.
> 
> FYI, I used %zx rather than %zX as couldn't find any instances of it in
> the kernel and I wasn't 100% sure if it was supported or not.

'x' and 'X' are handled nearly identically in lib/vsprintf.c. Don't see
why it wouldn't be.

> linux-next:
> 
> $ git grep "%zx" | wc -l
> 161
> 
> $ git grep "%zX" | wc -l
> 0

Yay, we're unique!

Seriously though: I don't really care which one is used (though I guess
I'm personally more used to lower-case hex). I just figured the less
churn the better.

Brian
