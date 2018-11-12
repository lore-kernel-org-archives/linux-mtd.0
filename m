Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMF3g-0003vG-UN
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2018 16:27:30 +0000
Received: by mail-lj1-x242.google.com with SMTP id t9-v6so8155007ljh.6
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2018 08:27:18 -0800 (PST)
MIME-Version: 1.0
References: <CGME20180823084348eucas1p2157ab1089290298cf43647e522b8be4f@eucas1p2.samsung.com>
 <1535013819-1646-1-git-send-email-huijin.park@samsung.com>
 <20181031150225.175ec1d4@bbrezillon>
In-Reply-To: <20181031150225.175ec1d4@bbrezillon>
From: Huijin Park <bbanghj.park@gmail.com>
Date: Tue, 13 Nov 2018 01:27:05 +0900
Message-ID: <CAMy0x0nSjhRrG913NBeood68NfYAYngg=PAL+pmy4U4=WRuJxg@mail.gmail.com>
Subject: Re: [PATCH] mtd: change len type from signed to unsigned type
To: boris.brezillon@bootlin.com
Cc: huijin.park@samsung.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Wed, Oct 31, 2018 at 11:02 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> Hi Huijin,
>
> On Thu, 23 Aug 2018 04:43:39 -0400
> Huijin Park <huijin.park@samsung.com> wrote:
>
> > From: "huijin.park" <huijin.park@samsung.com>
> >
> > assign of a signed value which has type 'int' to a variable of
> > a bigger unsigned integer type 'uint64_t'.
>
> Why are you mentioning u64? AFAICT, the len passed to erase_write() is
> always an unsigned int.

It's my mistake.
Messages about u64 are not related to this patch.

>
> > this is ok most of the time, but can lead to unexpectedly large
> > resulting value if the original signed value is negative.
> > in addtion, the callers of the erase_write() pass the len parameter
>
>   ^In addition,
>
> > as unsigned type.
> >
> > Signed-off-by: huijin.park <huijin.park@samsung.com>
> > ---
> >  drivers/mtd/mtdblock.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> > index a5b1933..b2d5ed1 100644
> > --- a/drivers/mtd/mtdblock.c
> > +++ b/drivers/mtd/mtdblock.c
> > @@ -56,7 +56,7 @@ struct mtdblk_dev {
> >   */
> >
> >  static int erase_write (struct mtd_info *mtd, unsigned long pos,
> > -                     int len, const char *buf)
> > +                     unsigned int len, const char *buf)
>
> The diff looks good, but the commit message is not clear at all. Can
> you reword it?
>
> Thanks,
>
> Boris
>
> >  {
> >       struct erase_info erase;
> >       size_t retlen;
>

I will send again patch after reword the commit message.

Thanks & best regards,

Huijin
