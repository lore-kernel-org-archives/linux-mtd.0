Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lqxuz-0001Oo-7O
	for linux-mtd@lists.infradead.org; Mon, 06 Apr 2009 23:08:11 +0000
Date: Tue, 7 Apr 2009 01:07:44 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Sneha Narnakaje <nsnehaprabha@ti.com>
Subject: Re: [PATCH] MTD-NAND: Changes to read_page APIs to support
	NAND_ECC_HW_SYNDROME mode on TI DaVinci DM355
In-Reply-To: <1238601784-9563-1-git-send-email-nsnehaprabha@ti.com>
Message-ID: <alpine.LFD.2.00.0904070102260.21577@localhost.localdomain>
References: <1238601784-9563-1-git-send-email-nsnehaprabha@ti.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sandeep Paulraj <s-paulraj@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sneha,

On Wed, 1 Apr 2009, nsnehaprabha@ti.com wrote:

Would you please care to CC the still caring but admittedly lazy and
distracted maintainer on such patches ?

> From: Sneha Narnakaje <nsnehaprabha@ti.com>
> 
> The NAND controller on TI DaVinci DM355 supports NAND devices with large page size (2K and 4K), but the HW ECC is handled for every 512byte read/write chunks. The current HW_SYNDROME read_page/write_page APIs in the NAND core (nand_base) use the "infix OOB" scheme. The core APIs overwrite NAND manufacturer's bad block meta data, thus complicating the jobs of non-Linux NAND programmers (end equipment manufacturering). These APIs also imply ECC protection for the prepad bytes, causing nand raw_write operations to fail.

Please use proper line breaks. 523 characters do not fit into a
terminal.

Thanks,

	tglx
