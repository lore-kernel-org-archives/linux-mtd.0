Message-ID: <19988.26817.208939.223896@ipc1.ka-ro>
Date: Wed, 6 Jul 2011 15:53:05 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Lambrecht =?utf-8?Q?J=C3=BCrgen?= <J.Lambrecht@TELEVIC.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Add 'config IMX_NFC_V1_BISWAP' to swap the Bad block
	Indicator, and use for imx27pdk nand support.
In-Reply-To: <4E145789.8040801@televic.com>
References: <1309872828-13942-1-git-send-email-J.Lambrecht@televic.com>
	<20110706080942.GC26347@pengutronix.de>
	<4E142B18.60407@televic.com> <19988.19315.787284.113228@ipc1.ka-ro>
	<4E145789.8040801@televic.com>
Cc: Estevam Fabio-R49496 <r49496@freescale.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Lambrecht Jürgen writes:
> On 07/06/2011 01:48 PM, Lothar Waßmann wrote:
> > > Am I correct that all nfc-v1's have that bug, so only imx27 and imx51?
> > > The application note we finally got from freescale only mentions "FSL
> > > IMX NFC".
> > >
> > It's not exactly a bug (which would be possible to get fixed), but an
> > inherent feature of the controller which handles NAND flash with a
> > page size larger than 512 byte like it has n pages of 512 byte.
> >
> OK, a "hardware bug" then (can be fixed with a re-write of the 
> VHDL/Verilog code of the NFC, giving v2). It seems to me Freescale tried 
> to enhance their 512B-page controller with to possibility to also handle 
> 2kB pages, but they forgot about the Factory Bad Block byte (n=4 only).
> So to reply to your next mail: only the imx27 and imx31 (thanks sascha, 
> it was a typo to mention 51) have the NFC v1, I believe all the others 
> have NFC v2, which are fixed.
> 
How do you come to that conclusion? All the controllers share the same
flash buffer layout and map it to the actual flash data in the same
way. Thus the problem exists for all of them.
And the original Freescale code for i.MX5 et al. handles the bad block
markers in the same way as for i.MX2 or i.MX3.


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
