From: David Woodhouse <dwmw2@infradead.org>
To: David Updegraff <dave@cray.com>
In-Reply-To: <405F0840.3030503@cray.com>
References: <6.0.1.1.0.20040317175202.01f80e70@dns.struinfo.it>
	 <200403181411.25596.tglx@linutronix.de>
	 <6.0.1.1.0.20040318154520.01ec5658@192.168.2.1>
	 <1079621971.16952.154.camel@hades.cambridge.redhat.com>
	 <405F0840.3030503@cray.com>
Content-Type: text/plain
Message-Id: <1079971069.16509.125.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 22 Mar 2004 15:57:49 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Large block NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-03-22 at 09:37 -0600, David Updegraff wrote:
> I am looking at the existing 'drivers' in drivers/mtd/nand; am a bit 
> baffled; need help understanding approach.
> 
> The files (spia, autcpu12..) are apparently drivers for particular NAND 
> chips, 

They're not. They're drivers for particular ways wiring up a NAND chip. 

The code in nand.c handles all currently-supported (i.e 8-bit, 256- or
512-byte per page) NAND chips, and uses access functions provided by the
board-specific 'wiring' driver to waggle the control lines, etc.



> but it appears to me that they all call nand_scan in nand.c, 
> which in turn just looks for ids enumerated in nand_ids.h.  Does this 
> not make it necessary to hand-tune which driver you want to compile with 
> nand.c instead of having the drivers themselves control with nand chip 
> they know how to drive -- based on what ID one finds?  Or is the 
> thinking that the quirks of each little embedded gadget to too wierd 
> anyway; so must hand-tune?
> 
> -dbu.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
dwmw2
