Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eXvKN-0003HY-Hh
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 20:44:29 +0000
Date: Sat, 6 Jan 2018 21:44:13 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Richard Weinberger
 <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Colin Ian King <colin.king@canonical.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH -next] mtd: sharpslpart: make local function
 sharpsl_nand_cleanup_ftl() static
Message-ID: <20180106214413.7a8f9eea@bbrezillon>
In-Reply-To: <CAAQYJAuOy65Obc+HmtmvwSLB5js-rvLZ5D=6kcDgcxDZQYKebQ@mail.gmail.com>
References: <1513748736-165067-1-git-send-email-weiyongjun1@huawei.com>
 <CAAQYJAuOy65Obc+HmtmvwSLB5js-rvLZ5D=6kcDgcxDZQYKebQ@mail.gmail.com>
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

On Fri, 22 Dec 2017 11:09:15 +0100
Andrea Adami <andrea.adami@gmail.com> wrote:

> On Wed, Dec 20, 2017 at 6:45 AM, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> > Fixes the following sparse warnings:
> >
> > drivers/mtd/parsers/sharpslpart.c:222:6: warning:
> >  symbol 'sharpsl_nand_cleanup_ftl' was not declared. Should it be static?
> >
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/mtd/parsers/sharpslpart.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/parsers/sharpslpart.c b/drivers/mtd/parsers/sharpslpart.c
> > index 0ddb79a..8893dc8 100644
> > --- a/drivers/mtd/parsers/sharpslpart.c
> > +++ b/drivers/mtd/parsers/sharpslpart.c
> > @@ -219,7 +219,7 @@ static int sharpsl_nand_init_ftl(struct mtd_info *mtd, struct sharpsl_ftl *ftl)
> >         return ret;
> >  }
> >
> > -void sharpsl_nand_cleanup_ftl(struct sharpsl_ftl *ftl)
> > +static void sharpsl_nand_cleanup_ftl(struct sharpsl_ftl *ftl)
> >  {
> >         kfree(ftl->log2phy);
> >  }
> >  
> 
> Thanks, this should be indeed static like the other functions.
> 
> Acked-by: Andrea Adami <andrea.adami@gmail.com>
> 

Applied.

Thanks,

Boris

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
