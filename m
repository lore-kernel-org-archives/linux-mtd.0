Message-ID: <20040.45443.810005.525431@ipc1.ka-ro>
Date: Mon, 15 Aug 2011 07:41:23 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Ivan Djelic <ivan.djelic@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: GPMI-NAND Status?
In-Reply-To: <20110814081139.GD17063@parrot.com>
References: <20110805135133.GA26981@pengutronix.de>
	<20110814081139.GD17063@parrot.com>
Cc: Koen Beel <koen.beel.barco@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
	Huang Shijie <b32955@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Ivan Djelic writes:
> On Fri, Aug 05, 2011 at 02:51:33PM +0100, Wolfram Sang wrote:
> (...)
> > 
> > problem overwriting all-0xff data in NAND [2]
> > =============================================
> > 
> > Although it occured only when writing JFFS2 images so far, this is a generic
> > issue and needs to be fixed, right?
> > 
> > 
> (...)
> > [2] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037104.html
> 
> As explained in the thread linked above, this issue should be fixed in your
> flashing tool, _not_ in your driver. The nand device you are using does not
> support programming pages multiple times in a row; pretending it does in the
>
It's not a problem of the device (Samsung K9F1G08U0B in my case)! The
problem is that the controller generates an ECC code that is non-FF
for all-FF data, which JFFS2 cannot handle properly.


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
