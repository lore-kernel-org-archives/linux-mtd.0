Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 20 Jul 2011 08:16:35 +0300
In-Reply-To: <4E24E804.10002@freescale.com>
References: <20004.12663.29494.339601@ipc1.ka-ro>
	<20110718164354.GA3328@S2100-06.ap.freescale.net>
	<4E24E804.10002@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1311139000.20738.146.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawn.guo@freescale.com>,
	Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-07-19 at 10:12 +0800, Huang Shijie wrote:
> hi  Lothar:
> > On Mon, Jul 18, 2011 at 03:13:27PM +0200, Lothar Waßmann wrote:
> >> Hi,
> >>
> >> with the gpmi-nfc driver for imx28 from Shawn Guo on a TX28 I
> > To be clear, the author of gpmi-nfc driver is Huang Shijie (Cc-ed).
> >
> > Regards,
> > Shawn
> >
> >> encountered some problems with jffs2 when overwriting pages that have
> >> been written with 0xff (e.g. from padding from the file system image
> >> file).
> The GPMI driver now does not support the JFFS2 very well.
> The JFFS2 will write the OOB, while the BCH of GPMI will use the OOB too.
> So I have to disable the JFFS2 to use the OOB. I have not finish the 
> code about it now.
> 
> I recommend you use the UBIFS. But the latest version of GPMI driver 
> meets a DMA bug.
> I am debugging the DMA bug now. and I will send it out when i fix it.

This is a different issue. You refer to the "GPMI-controlled flash has
no space in OOB for JFFS2". Lothar's issue is about "GPMI-controlled
flash does not allow writing 0xFFs and then writing something else",
which is very normal.

-- 
Best Regards,
Artem Bityutskiy
