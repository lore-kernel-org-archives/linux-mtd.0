Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RijIk-0002Cc-Q1
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2012 09:07:59 +0000
Received: by eekc13 with SMTP id c13so212329eek.36
 for <linux-mtd@lists.infradead.org>; Thu, 05 Jan 2012 01:07:56 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: GPMI-NAND: Wrong ECC size in driver
Date: Thu, 5 Jan 2012 10:07:54 +0100
References: <201201040148.32847.marek.vasut@gmail.com>
 <201201042233.15645.marek.vasut@gmail.com> <4F050635.1020103@freescale.com>
In-Reply-To: <4F050635.1020103@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201201051007.54725.marek.vasut@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi,
> 
> >> I will be happy if the driver works only by setting the
> >> 
> >> >  NAND_NO_SUBPAGE_WRITE, without setting the ecc.size.
> > 
> > So you intentionally set the ecc.size to 1 to work around the issue?
> 
> yes.
> I read the code, and it seemed setting the ecc.size to 1 is the right
> solution.
> 
> Best Regards
> Huang Shijie

It's definitelly wrong because it relies on undefined behaviour! The right 
solution here is to fix NAND_NO_SUBPAGE_WRITE pass-through as Scott and I 
proposed.

M
