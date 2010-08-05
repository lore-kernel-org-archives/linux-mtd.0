Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh5Hy-0004da-D0
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 18:35:35 +0000
Received: by pzk3 with SMTP id 3so3002442pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 11:35:32 -0700 (PDT)
From: Kevin Hilman <khilman@deeprootsystems.com>
To: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Subject: Re: [PATCH v3] mtd-nand: davinci: correct 4-bit error correction
References: <1279521506-4537-1-git-send-email-sudhakar.raj@ti.com>
Date: Thu, 05 Aug 2010 11:35:30 -0700
In-Reply-To: <1279521506-4537-1-git-send-email-sudhakar.raj@ti.com> (Sudhakar
	Rajashekhara's message of "Mon, 19 Jul 2010 12:08:26 +0530")
Message-ID: <878w4kvrf1.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sudhakar Rajashekhara <sudhakar.raj@ti.com> writes:

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
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Acked-by: Kevin Hilman <khilman@deeprootsystems.com>
