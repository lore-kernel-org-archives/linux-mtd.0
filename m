Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO093-0000QD-7J
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 03:47:46 +0000
Received: by bwz5 with SMTP id 5so7108830bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Dec 2010 19:47:44 -0800 (PST)
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark Mason <mason@postdiluvian.org>
In-Reply-To: <20101129203306.GA22692@postdiluvian.org>
References: <20101129195014.19224240@wker>
	<20101129203306.GA22692@postdiluvian.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 05:47:39 +0200
Message-ID: <1291261659.14534.13.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-11-29 at 15:33 -0500, Mark Mason wrote:
> I have seen something similar in the last few months with Samsung
> K9WAG08U1B-PIB0 chips on a PowerPC 8260.  Sadly I can't be much help
> since I no longer have access to the hardware and don't have detailed
> notes anymore, but I did experience UBI/UBIFS corruption that
> prevented mounting after power cycle tests.  The frequency was
> approximately what you quote, and there was a high volume of writes to
> NAND.
> 
> Reformatting the NAND was not a big problem for us, so we went with a
> workaround and never had a chance to track down the actual problem
> before the product shipped.
> 
> Wish I could be more help.

Well, you could have reported it, I usually try to provide at least some
help...

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
