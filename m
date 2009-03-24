Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmBqA-0004AX-Ni
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 18:59:17 +0000
Message-ID: <49C92D78.7010907@grandegger.com>
Date: Tue, 24 Mar 2009 19:59:04 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v2 4/5] powerpc: NAND: FSL UPM: document new bindings
References: <1237475768-11481-1-git-send-email-wg@grandegger.com>
	<1237475768-11481-2-git-send-email-wg@grandegger.com>
	<1237475768-11481-3-git-send-email-wg@grandegger.com>
	<1237475768-11481-4-git-send-email-wg@grandegger.com>
	<1237475768-11481-5-git-send-email-wg@grandegger.com>
	<20090319170530.GA2744@ld0162-tx32.am.freescale.net>
In-Reply-To: <20090319170530.GA2744@ld0162-tx32.am.freescale.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Scott Wood wrote:
> On Thu, Mar 19, 2009 at 04:16:07PM +0100, Wolfgang Grandegger wrote:
>> +Optional properties:
>> +- fsl,upm-mar-offset : use the UPM machine address register to drive a
>> +  		       custom chip select logic using the specified
>> +		       offset.
> 
> Your example uses the name fsl,upm-mar-chip-offset instead.

I need to fix the documentation then.

>> +- chip-offset : address offset between chips for multi-chip support.
> 
> How is this different from fsl,upm-mar-offset?

Well, after a closer look, it's the same, hardware-wise. The offset sets
the corresponding address lines, which are used to select the chip. As
it is currently, "chip-offset" is used for:

 chip->IO_ADDR_R = chip->IO_ADDR_W =
                        fun->upm.io_addr + fun->chip_offset * chip_nr;

and "upm-mar-chip-offset" to set the address lines through the MAR
register when running the command or address patterns:

  mar += fun->upm_mar_chip_offset * fun->chip_nr;

I'm going to remove "upm_mar_chip_offset" and use "chip_offset" instead,
also for the U-Boot version. Thanks for pointing that out.

Wolfgang.
