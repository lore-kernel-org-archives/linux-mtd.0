Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwoC8-0000VC-Af
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 09:29:29 +0000
Received: by wmvv187 with SMTP id v187so23096464wmv.1
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 01:29:06 -0800 (PST)
Date: Thu, 12 Nov 2015 10:29:03 +0100
From: LABBE Corentin <clabbe.montjoie@gmail.com>
To: Joachim Eastwood <manabian@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, josh.wu@atmel.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: atmel_nand: fix a possible NULL dereference
Message-ID: <20151112092903.GB9850@Red>
References: <1447314579-31374-1-git-send-email-clabbe.montjoie@gmail.com>
 <CAGhQ9VyGeYUuaHTOnte--ASX9Wvd5wkDrRDx8mRoD=aJqD7JTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGhQ9VyGeYUuaHTOnte--ASX9Wvd5wkDrRDx8mRoD=aJqD7JTA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 09:29:57AM +0100, Joachim Eastwood wrote:
> On 12 November 2015 at 08:49, LABBE Corentin <clabbe.montjoie@gmail.com> wrote:
> > of_match_device could return NULL, and so cause a NULL pointer
> > dereference later.
> >
> > Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> > ---
> >  drivers/mtd/nand/atmel_nand.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> > index 475c938..f3cf68b 100644
> > --- a/drivers/mtd/nand/atmel_nand.c
> > +++ b/drivers/mtd/nand/atmel_nand.c
> > @@ -1495,9 +1495,12 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
> >         int ecc_mode;
> >         struct atmel_nand_data *board = &host->board;
> >         enum of_gpio_flags flags = 0;
> > +       const struct of_device_id *of_id;
> >
> > -       host->caps = (struct atmel_nand_caps *)
> > -               of_match_device(atmel_nand_dt_ids, host->dev)->data;
> > +       of_id = of_match_device(atmel_nand_dt_ids, host->dev);
> > +       if (!of_id)
> > +               return -ENODEV;
> > +       host->caps = of_id->data;
> 
> It might be cleaner to use of_device_get_match_data() here.
> 

I agree, I will resend shortly with it.
And this time, I wont forgot the patch which permit to supress the kbuild_robot warning.

Regards

LABBE Corentin
