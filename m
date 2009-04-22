Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LwXAi-0002kY-8X
	for linux-mtd@lists.infradead.org; Wed, 22 Apr 2009 07:47:15 +0000
Subject: Re: [patch/RESEND 2.6.30-rc2 1/3] NAND: don't walk past end of
	oobfree[]
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200904211951.21270.david-b@pacbell.net>
References: <200904211951.21270.david-b@pacbell.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Apr 2009 10:45:24 +0300
Message-Id: <1240386324.19218.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD <linux-mtd@lists.infradead.org>, "Narnakaje,
	Snehaprabha" <nsnehaprabha@ti.com>,
	Andrew Morton <akpm@linux-foundation.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-04-21 at 19:51 -0700, David Brownell wrote:
> From: David Brownell <dbrownell@users.sourceforge.net>
> 
> Resolve issue noted by Sneha:  when computing oobavail from
> the list of free areas in the OOB, don't assume there will
> always be an unused slot at the end.  With ECC_HW_SYNDROME
> and 4KB page chips, it's fairly likely there *won't* be one.
> 
> Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
> Cc: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>"

Hi,

not that I tested your stuff, but it looks OK for me. So I've
added the series to my l2-mtd tree, which means I'll ping
dwmw2 about pulling it at some point. No guarantees, though.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
