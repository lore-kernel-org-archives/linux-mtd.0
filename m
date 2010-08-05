Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ogs6m-0004Eu-RZ
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 04:31:10 +0000
Received: by fxm3 with SMTP id 3so3244207fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 21:31:07 -0700 (PDT)
Subject: Re: [PATCH] mtd/nand: Support Micron chips, 4KB page
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C4DEA3D.5070208@broadcom.com>
References: <4C4DEA3D.5070208@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 07:31:04 +0300
Message-Id: <1280982664.4363.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-07-26 at 13:04 -0700, Brian Norris wrote:
> The following parts exhibit some interesting patterns in their ID strings.
> Their ID strings are not fully compatible with the current nand_base.c
> detection algorithm. In order to detect them properly, I have taken the
> liberty to develop a heuristic algorithm. None of these chips have a *good*
> detection pattern listed in their datasheets, although MT29F16G08MAA has a
> table on p.24 of its data sheet (not included here).
> 
> Part			ID String		Block	Page	OOB
> MT29F16G08ABABA		2C 48 00 26 89 00 00	512K	4K	224
> MT29F16G08CBABA		2C 48 04 46 85 00 00	1024K	4K	224
> MT29F16G08MAA		2C D5 94 3E 74 00 00	512K	4K	218
> 
> I have attached a table logging most of the relevant data for the many chips
> I have researched. The three chips are highlighted red, although there are
> variants of the chips listed as well. I believe this patch should correctly
> identify all the 5-byte ID Micron chips.
> 
> And before the question is asked: I realize that these chips support ONFI,
> so that should be the primary means by which to identify them, but I would
> still like to be able to detect these properly without ONFI if necessary,
> especially considering some of the older NAND controllers we still use do not
> support reading ONFI data.
> 
> Feedback on my logic is appreciated.
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>

Really not sure about this patch. Sounds like ONFI should be used,
except for those few chips which do not support reading ONFI data. The
heuristics you add smell fishy...
 
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
