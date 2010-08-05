Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ogzzm-0006ze-66
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 12:56:27 +0000
Subject: Re: [PATCH] NAND: add support for reading ONFI parameters from
	NAND device
From: Maxime Bizon <mbizon@freebox.fr>
To: dedekind1@gmail.com
In-Reply-To: <1280984059.1175.13.camel@localhost.localdomain>
References: <201007290047.06394.ffainelli@freebox.fr>
	<1280984059.1175.13.camel@localhost.localdomain>
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Date: Thu, 05 Aug 2010 14:56:13 +0200
Message-ID: <1281012973.12446.273.camel@sakura.staff.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Brian Norris <norris@broadcom.com>, Florian Fainelli <ffainelli@freebox.fr>
Reply-To: mbizon@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2010-08-05 at 07:54 +0300, Artem Bityutskiy wrote:
> On Thu, 2010-07-29 at 00:47 +0200, Florian Fainelli wrote:
> > A nand_chip which has valid ONFI parameters gets its options field updated
> > with the NAND_ONFI flag. In that case both the ONFI version (in BCD format)
> > as well as the complete page parameters is available in the struct nand_chip.
> > This allows for better detection of some new devices, as well as fine tuning of
> > NAND driver timings. This patch only adds support for ONFI 1.0 parameters.
> > 
> > Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
> > Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
> 
> I assume you will send v2 of this patch, so not taking this one.

Please don't

We still need to address all remarks Matthieu did, and of course gives
this more testing (this was more an "RFC" than a "PATCH", sorry)

-- 
Maxime
