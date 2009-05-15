Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4yAE-0007Rd-LT
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 14:13:37 +0000
Subject: Re: [patch 2.6.30-rc5+] davinci_nand: cmdlinepart uses MTD IDs
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200905121623.32809.david-b@pacbell.net>
References: <200905121623.32809.david-b@pacbell.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 May 2009 17:13:07 +0300
Message-Id: <1242396787.27996.252.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Snehaprabha Narnakaje <nsnehaprabha@ti.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-05-12 at 16:23 -0700, David Brownell wrote:
> From: David Brownell <dbrownell@users.sourceforge.net>
> 
> Remove some legacy code from the davinci_nand driver, which made
> cmdlinepart ignore the the MTD ID passed to it.  Boards can have
> multiple NAND chips, and some do (like the DM357 EVM), so this
> dated hack is undesirable.
> 
> Correct labels a"re like davinci_nand.0" (for chipselect 0).
> 
> Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>

Taken to l2-mtd-2.6.git.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
