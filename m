Subject: Re: [PATCH] Blackfin BF54x NAND Flash Controller driver
From: David Woodhouse <dwmw2@infradead.org>
To: bryan.wu@analog.com
In-Reply-To: <1188804323.29566.6.camel@roc-laptop>
References: <1188804323.29566.6.camel@roc-laptop>
Content-Type: text/plain
Date: Mon, 03 Sep 2007 17:46:30 +0100
Message-Id: <1188837990.6075.32.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-09-03 at 15:25 +0800, Bryan Wu wrote:
> +       if (hardware_ecc) {
> +               if (plat->page_size == NFC_PG_SIZE_256) {
> +                       chip->ecc.bytes = 3;
> +                       chip->ecc.size = 256;
> +               } else if (mtd->writesize == NFC_PG_SIZE_512) { 

Comparing against plat->page_size in one case, but mtd->writesize in the
other? And elsewhere it seems plat->page_size is treated as a boolean,
indicating only 256-byte vs. 512-byte pages (you don't support 2KiB or
other page sizes at all?)

-- 
dwmw2
