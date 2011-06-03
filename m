Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSWTB-0001iZ-IL
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 15:39:30 +0000
Received: by ewy3 with SMTP id 3so895338ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 08:39:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: nand: generalized error messages with __func__
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <BANLkTi=BYeQ+cBMpRodDDY_KapjEoHVA+A@mail.gmail.com>
References: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
	<4DDDE19D.9010505@compulab.co.il> <1306387008.2785.138.camel@localhost>
	<BANLkTimsTWAcR4HgOoHguDMv9P-Eox=kbg@mail.gmail.com>
	<1306924235.4405.102.camel@localhost>
	<BANLkTi=BYeQ+cBMpRodDDY_KapjEoHVA+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 18:35:17 +0300
Message-ID: <1307115317.3069.18.camel@localhost>
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

On Wed, 2011-06-01 at 11:37 -0700, Brian Norris wrote:
> On Wed, Jun 1, 2011 at 3:30 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> or should we define our own pr_fmt in include/linux/mtd.h?
> >
> > Yes, before you include files.
> 
> Well, I've tried this, and as I suspected, I can't just include it in
> mtd.h at the top, since we can't guarantee that <linux/mtd/mtd.h> is
> going to be the first included header in other files.

In any case we do not want to blow the kernel binary size by too many
__func__ strings. They should be used only when needed.

>  Specifically, in
> include/linux/mtd/nand.h, we include other headers before mtd.h and so
> printk.h has already defined pr_fmt() for us, so this doesn't work.
> I'm not sure if there's a nice place to define pr_fmt() right now...

.c files, AFAIU.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
