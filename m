Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MyomG-00045X-FA
	for linux-mtd@lists.infradead.org; Fri, 16 Oct 2009 15:31:41 +0000
Date: Fri, 16 Oct 2009 10:31:29 -0500
From: Scott Wood <scottwood@freescale.com>
To: Felix Radensky <felix@embedded-sol.com>
Subject: Re: UBIFS problem on MPC8536DS
Message-ID: <20091016153128.GA11838@loki.buserror.net>
References: <4AD5ADC9.30503@embedded-sol.com> <4AD5C5B4.3060303@nokia.com>
	<4AD5D053.9000901@embedded-sol.com> <4AD5FFE7.7080703@nokia.com>
	<4AD60EF4.4080306@embedded-sol.com>
	<4AD614E4.6030005@freescale.com> <4AD7811A.6040501@freescale.com>
	<4AD7FE37.1060705@embedded-sol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4AD7FE37.1060705@embedded-sol.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 16, 2009 at 07:01:43AM +0200, Felix Radensky wrote:
> Thanks for confirmation. So the real problem is eLBC ?
> What happens if I access other devices on eLBC (e.g. FPGA)
> simultaneously with NAND or NOR ?

AFAICT, the problem is NAND being accessed simultaneously with anything else
on the eLBC (at least GPCM -- not sure about UPM).  Instead of delaying the
memory-like transaction until the NAND special operation has completed, it
seems to just abort the NAND operation.

eLBC can't really tell the difference whether you've got NOR or FPGA hooked
up to a GPCM chip select, so the problem should still apply.

-Scott
