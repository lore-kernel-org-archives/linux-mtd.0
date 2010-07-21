Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObWm2-0005iH-Ph
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 10:43:39 +0000
Subject: Re: [patch 3/4] mtd-nand: davinci: correct 4-bit error correction
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <201007202224.o6KMO138021388@imap1.linux-foundation.org>
References: <201007202224.o6KMO138021388@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jul 2010 13:36:51 +0300
Message-ID: <1279708611.2306.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nsnehaprabha@ti.com, sudhakar.raj@ti.com, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-20 at 15:24 -0700, akpm@linux-foundation.org wrote:
> From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> 
> On TI's DA830/OMAP-L137, DA850/OMAP-L138 and DM365, after setting the
> 4BITECC_ADD_CALC_START bit in the NAND Flash control register to 1 and
> before waiting for the NAND Flash status register to be equal to 1, 2 or
> 3, we have to wait till the ECC HW goes to correction state.  Without this
> wait, ECC correction calculations will not be proper.
> 
> This has been tested on DA830/OMAP-L137, DA850/OMAP-L138, DM355 and DM365
> EVMs.
> 
> Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> Acked-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Anton Vorontsov <cbouatmailru@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Just pushed this to my l2-mtd-2.6 / master tree as well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
