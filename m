Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mgh92-0003VW-Lo
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 15:44:16 +0000
Subject: Re: mtdoops and non pre-emptible kernel
From: Richard Purdie <rpurdie@openedhand.com>
To: matt@bubblegen.co.uk
In-Reply-To: <e5b07cfc262281f1e1c2687c19cb3524.squirrel@webmail.plus.net>
References: <4A9573CF.8030105@bubblegen.co.uk>
	<1251323622.16040.13.camel@dax.rpnet.com>
	<9f22e03e9efbb90b242869d7652caa97.squirrel@webmail.plus.net>
	<1251367574.9940.2.camel@dax.rpnet.com>
	<e5b07cfc262281f1e1c2687c19cb3524.squirrel@webmail.plus.net>
Content-Type: text/plain
Date: Thu, 27 Aug 2009 16:44:14 +0100
Message-Id: <1251387854.21836.13.camel@dax.rpnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-27 at 11:30 +0100, Matthew Lear wrote:
> That's fair enough. I suppose a possible solution would be to do what I've
> done locally for testing, ie:
> 
> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index 1a6b3be..2d734e2 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -335,7 +335,7 @@ static void mtdoops_console_sync(void)
>                 /* Interrupt context, we're going to panic so try and log */
>                 mtdoops_write(cxt, 1);
>         else
> -               schedule_work(&cxt->work_write);
> +               mtdoops_write(cxt, 0);
>  }

I just refreshed my memory a bit. I'd guess your mtd driver doesn't have
a panic_write function which is highly desirable for this kind of use.

How about some code like this?:

	if (mtd->panic_write && in_interrupt())
		/* Interrupt context, we're going to panic so try and log */
		mtdoops_write(cxt, 1);
	else if (in_interrupt())
		/* Interrupt context but with no panic write function */
                /* We're going to crash anyway so we may as well try and log */
		mtdoops_write(cxt, 0);
	else
		schedule_work(&cxt->work_write);

Cheers,

Richard
