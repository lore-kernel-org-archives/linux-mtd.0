Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4y9g-0006rk-Bh
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 14:13:03 +0000
Subject: Re: oobavail size calculation error in nand_base.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jinyoung Park <parkjy@mtekvision.com>
In-Reply-To: <280b69ac0905140128u135f8b2aua50114faebb593e0@mail.gmail.com>
References: <280b69ac0905140128u135f8b2aua50114faebb593e0@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 May 2009 17:11:43 +0300
Message-Id: <1242396703.27996.251.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-05-14 at 17:28 +0900, Jinyoung Park wrote:
> Hello.
> 
> I found error in nand_base.c.
> In nand_scan_tail() function, oobavail size calculation result is
> wrong as follow circumstances.
>     - Define nand_ecclayout using full oobfree array like below.
> 	.oobfree = { {2, 6}, {11, 2}, {16, 8}, {27, 2}, {32, 8}, {43, 2},{48,
> 8}, {59, 2} }
>     - Using ARM EABI cross compiler when kernel compile also enable
> "Use the ARM EABI to compile the kernl" feature in kernel menuconfig.
>       I using ARM EABI compiler that codesourcery release arm-2008q3-51.
> 
> In this case, right oobavail size is 38 but result is too much
> value(e.g. 2703572308...). It's random.
> I think sometimes happen that after beyond oobfree array(oobfree[8])
> is not 0 when ARM EABI compilation.
> Below codes are my modified code. Please check...

It seems the following patch which sits in my l2-mtd-2.6.git fixes
this as well: http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

Author: David Brownell <dbrownell@users.sourceforge.net>
Date:   Tue Apr 21 19:51:20 2009 -0700

    MTD: NAND: don't walk past end of oobfree[]

    Resolve issue noted by Sneha:  when computing oobavail from
    the list of free areas in the OOB, don't assume there will
    always be an unused slot at the end.  With ECC_HW_SYNDROME
    and 4KB page chips, it's fairly likely there *won't* be one.

    Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
    Cc: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>"
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
