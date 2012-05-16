Message-ID: <20403.29677.517067.528042@ipc1.ka-ro>
Date: Wed, 16 May 2012 11:31:25 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 3/3] MTD: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
In-Reply-To: <1337160353.24809.26.camel@sauron.fi.intel.com>
References: <1337093256-19117-1-git-send-email-josh.wu@atmel.com>
 <1337093256-19117-4-git-send-email-josh.wu@atmel.com>
 <1337160353.24809.26.camel@sauron.fi.intel.com>
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, Josh Wu <josh.wu@atmel.com>,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Artem Bityutskiy writes:
> On Tue, 2012-05-15 at 22:47 +0800, Josh Wu wrote:
> > +	while (!(pmerrloc_readl(host->pmerrloc_base, ELISR)
> > +		 & PMERRLOC_CALC_DONE))
> > +		cpu_relax();
> 
> How about some kind of time-out in something goes wrong?
> 
> > +		dev_warn(host->dev, "Only 2048 page size is currently " \
> > +			"supported for PMECC, rolling back to Software ECC\n");
> 
> Why do you use backslashes?
> 
message text should not be split across lines anyway to ease grepping
for the message.


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
