Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRU45-0007zW-Ma
	for linux-mtd@lists.infradead.org; Tue, 31 May 2011 18:53:18 +0000
Received: by wwb39 with SMTP id 39so4091358wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 May 2011 11:52:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306387008.2785.138.camel@localhost>
References: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
	<4DDDE19D.9010505@compulab.co.il>
	<1306387008.2785.138.camel@localhost>
Date: Tue, 31 May 2011 11:52:10 -0700
Message-ID: <BANLkTimsTWAcR4HgOoHguDMv9P-Eox=kbg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: generalized error messages with __func__
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Sorry if this is a second message anyone, I didn't hit Reply-All.

On Wed, May 25, 2011 at 10:16 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Right, but in this _particular_ case the best thing to do is to just
> kill the error messages - if any of the allocation functions fail they
> print a large scary warning with a backtrace anyway, and the backtrace
> will contain the caller function names.
>
> Brian, would you please instead just zap the prints?

Sure, can do. In general, then, is it best practice to simply 'return
-ENOMEM' or similar (without any printing) in all MTD code?

> On Thu, 2011-05-26 at 08:14 +0300, Igor Grinberg wrote:
>> On 05/26/11 00:59, Brian Norris wrote:
>> pr_err() will save you from the need to define the log level each time.
>> pr_fmt will save you the need to add %s: and __func__.

Also, it seems that the second statement is not necessarily true. In
fact, in include/linux/printk.h, we default to the following
declaration:
     #define pr_fmt(fmt) fmt
So it seems that, when we desire to print out the relevant function
name, we should manually use __func__ instead of relying on
pr_fmt...or should we define our own pr_fmt in include/linux/mtd.h?

Brian
