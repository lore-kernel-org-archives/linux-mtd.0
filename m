Subject: Re: [patch 1/4] mtd-nand: davinci: Correct 4-bit error correction
From: David Woodhouse <dwmw2@infradead.org>
To: akpm@linux-foundation.org
In-Reply-To: <200911172245.nAHMjk8X001820@imap1.linux-foundation.org>
References: <200911172245.nAHMjk8X001820@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Nov 2009 11:38:04 +0000
Message-ID: <1259581084.19465.381.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, sudhakar.raj@ti.com, nsnehaprabha@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-17 at 14:45 -0800, akpm@linux-foundation.org wrote:
> +       /*
> +        * ECC_STATE field reads 0x3 (Error correction complete) immediately
> +        * after setting the 4BITECC_ADD_CALC_START bit. So if you immediately
> +        * begin trying to poll for the state, you may fall right out of your
> +        * loop without any of the correction calculations having taken place.
> +        * The recommendation from the hardware team is to wait till ECC_STATE
> +        * reads less than 4, which means ECC HW has entered correction state.
> +        */
> +       do {
> +               ecc_state = (davinci_nand_readl(info,
> +                               NANDFSR_OFFSET) >> 8) & 0x0f;
> +               cpu_relax();
> +       } while (ecc_state < 4); 

Please can this have a timeout. Infinite loops waiting for hardware are
generally a bad idea.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
