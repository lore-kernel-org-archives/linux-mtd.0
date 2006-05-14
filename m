From: David Woodhouse <dwmw2@infradead.org>
To: Jonathan McDowell <noodles@earth.li>
In-Reply-To: <20060424161529.GR7570@earth.li>
References: <20060424161529.GR7570@earth.li>
Content-Type: text/plain
Date: Sun, 14 May 2006 03:45:05 +0100
Message-Id: <1147574706.19840.0.camel@shinybook.infradead.org>
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
> he patch below adds support for the NAND device on the Amstrad Delta.
> This is a 32MB 8bit Toshiba device, with the data bus connected to the
> OMAP MPUIO pins and ALE, CLE, NCE, NRE, NWE and NWP all connected to the
> Delta's latch2 16bit latch.
> 
> I'm submitting this purely for comments at this stage. While I have
> tested it (booting fine with the NAND as / and able to read/write to it
> ok) and had a report from another user that it works fine for them I
> would appreciate any opinions you may have about the code.

Needs to set ams_delta_mtd->owner = THIS_MODULE; before calling
nand_scan().

-- 
dwmw2
