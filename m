Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRqIT-00012T-CP
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 18:37:38 +0000
Received: by wwb39 with SMTP id 39so70393wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 11:37:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306924235.4405.102.camel@localhost>
References: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
	<4DDDE19D.9010505@compulab.co.il>
	<1306387008.2785.138.camel@localhost>
	<BANLkTimsTWAcR4HgOoHguDMv9P-Eox=kbg@mail.gmail.com>
	<1306924235.4405.102.camel@localhost>
Date: Wed, 1 Jun 2011 11:37:32 -0700
Message-ID: <BANLkTi=BYeQ+cBMpRodDDY_KapjEoHVA+A@mail.gmail.com>
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

On Wed, Jun 1, 2011 at 3:30 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> or should we define our own pr_fmt in include/linux/mtd.h?
>
> Yes, before you include files.

Well, I've tried this, and as I suspected, I can't just include it in
mtd.h at the top, since we can't guarantee that <linux/mtd/mtd.h> is
going to be the first included header in other files. Specifically, in
include/linux/mtd/nand.h, we include other headers before mtd.h and so
printk.h has already defined pr_fmt() for us, so this doesn't work.
I'm not sure if there's a nice place to define pr_fmt() right now...

Brian
