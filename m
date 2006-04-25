From: David Woodhouse <dwmw2@infradead.org>
To: Jonathan McDowell <noodles@earth.li>
In-Reply-To: <20060424161529.GR7570@earth.li>
References: <20060424161529.GR7570@earth.li>
Content-Type: text/plain
Date: Tue, 25 Apr 2006 14:43:12 +0100
Message-Id: <1145972592.11909.392.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] Add Amstrad Delta NAND support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-04-24 at 17:15 +0100, Jonathan McDowell wrote:
> The patch below adds support for the NAND device on the Amstrad Delta.
> This is a 32MB 8bit Toshiba device, with the data bus connected to the
> OMAP MPUIO pins and ALE, CLE, NCE, NRE, NWE and NWP all connected to the
> Delta's latch2 16bit latch.
> 
> I'm submitting this purely for comments at this stage. While I have
> tested it (booting fine with the NAND as / and able to read/write to it
> ok) and had a report from another user that it works fine for them I
> would appreciate any opinions you may have about the code.

Looks OK to me in general.

> In particular I'm using "udelay(1);" in the read/write routines to wait
> for the bus to settle after setting the read/write enable lines. Really
> I want "ndelay(40);", but ndelay doesn't seem to be implemented on ARM,
> except in terms of udelay. Can I get away with udelay(0.04)? Should I be
> doing something else entirely?

That's a question best directed at linux-arm-kernel list.

> +/*
> + * These 3 functions are basically identical to the ones in nand_base.c, but
> + * we have to call our read_byte/write_byte functions instead of readb/writeb
> + * directly. I submitted a patch to MTD to move this to nand_base.c, but it
> + * was deemed too intrusive.
> + */

Thomas' decision, I assume? I think he's right -- this way it can be
inlined in the loop rather than being a real function call for every
byte.

-- 
dwmw2
