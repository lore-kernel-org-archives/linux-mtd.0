Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRilR-0003u1-Fq
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 10:35:02 +0000
Received: by fxm14 with SMTP id 14so4877062fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 03:34:59 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: nand: generalized error messages with __func__
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <BANLkTimsTWAcR4HgOoHguDMv9P-Eox=kbg@mail.gmail.com>
References: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
	<4DDDE19D.9010505@compulab.co.il> <1306387008.2785.138.camel@localhost>
	<BANLkTimsTWAcR4HgOoHguDMv9P-Eox=kbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 13:30:35 +0300
Message-ID: <1306924235.4405.102.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2011-05-31 at 11:52 -0700, Brian Norris wrote:
> > Brian, would you please instead just zap the prints?
> 
> Sure, can do. In general, then, is it best practice to simply 'return
> -ENOMEM' or similar (without any printing) in all MTD code?

Yes.

> > On Thu, 2011-05-26 at 08:14 +0300, Igor Grinberg wrote:
> >> On 05/26/11 00:59, Brian Norris wrote:
> >> pr_err() will save you from the need to define the log level each time.
> >> pr_fmt will save you the need to add %s: and __func__.
> 
> Also, it seems that the second statement is not necessarily true. In
> fact, in include/linux/printk.h, we default to the following
> declaration:
>      #define pr_fmt(fmt) fmt

To be more precise:

#ifndef pr_fmt
#define pr_fmt(fmt) fmt
#endif

> So it seems that, when we desire to print out the relevant function
> name, we should manually use __func__ instead of relying on
> pr_fmt...or should we define our own pr_fmt in include/linux/mtd.h?

Yes, before you include files.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
