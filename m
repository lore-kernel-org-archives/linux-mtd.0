Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1DOl-0002KX-7R
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2015 13:12:44 +0000
Received: by wmec201 with SMTP id c201so208186780wme.0
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2015 05:12:21 -0800 (PST)
Date: Tue, 24 Nov 2015 14:12:18 +0100
From: LABBE Corentin <clabbe.montjoie@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/2] mtd: nand: atmel_nand: fix a possible NULL
 dereference
Message-ID: <20151124131218.GA7545@Red>
References: <1448005517-26004-1-git-send-email-clabbe.montjoie@gmail.com>
 <1448005517-26004-3-git-send-email-clabbe.montjoie@gmail.com>
 <564EDACA.30204@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <564EDACA.30204@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 20, 2015 at 04:33:14PM +0800, Josh Wu wrote:
> Hi, Corentin
> 
> Thanks for the patch. It looks fine to me, just one nitpick in below:
> 
> On 11/20/2015 3:45 PM, LABBE Corentin wrote:
> > of_match_device could return NULL, and so cause a NULL pointer
> > dereference later.
> >
> > Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> > ---
> >   drivers/mtd/nand/atmel_nand.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> > index 475c938..7902967 100644
> > --- a/drivers/mtd/nand/atmel_nand.c
> > +++ b/drivers/mtd/nand/atmel_nand.c
> > @@ -1496,8 +1496,9 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
> >   	struct atmel_nand_data *board = &host->board;
> >   	enum of_gpio_flags flags = 0;
> >   
> > -	host->caps = (struct atmel_nand_caps *)
> > -		of_match_device(atmel_nand_dt_ids, host->dev)->data;
> > +	host->caps = of_device_get_match_data(host->dev);
> > +	if (!host->caps)
> > +		return 1;
> 
> it's better to use -EINVAL here.
> 

Hello

I do that Uwe Kleine-König said to me to do in others thread:
https://lkml.org/lkml/2015/11/12/70 and https://lkml.org/lkml/2015/11/16/211

Regards
