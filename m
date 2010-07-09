Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OXMFD-0003Xa-7G
	for linux-mtd@lists.infradead.org; Fri, 09 Jul 2010 22:40:32 +0000
Date: Fri, 9 Jul 2010 15:39:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Subject: Re: [PATCH] mtd-nand: davinci: correct 4-bit error correction
Message-Id: <20100709153932.0a6cdbcd.akpm@linux-foundation.org>
In-Reply-To: <1278653389-12019-1-git-send-email-sudhakar.raj@ti.com>
References: <1278653389-12019-1-git-send-email-sudhakar.raj@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: nsnehaprabha@ti.com, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri,  9 Jul 2010 10:59:49 +0530
Sudhakar Rajashekhara <sudhakar.raj@ti.com> wrote:

> +
> +	/*
> +	 * ECC_STATE field reads 0x3 (Error correction complete) immediately
> +	 * after setting the 4BITECC_ADD_CALC_START bit. So if you immediately
> +	 * begin trying to poll for the state, you may fall right out of your
> +	 * loop without any of the correction calculations having taken place.
> +	 * The recommendation from the hardware team is to wait till ECC_STATE
> +	 * reads less than 4, which means ECC HW has entered correction state.
> +	 */
> +	do {
> +		ecc_state = (davinci_nand_readl(info,
> +				NANDFSR_OFFSET) >> 8) & 0x0f;
> +		cpu_relax();
> +	} while ((ecc_state < 4) && time_before(jiffies, timeo));

An up-to-100-milliseond busy wait is pretty bad.  For how long do you
expect this to spin in practice?
