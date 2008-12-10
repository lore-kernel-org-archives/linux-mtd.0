Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAGGY-0007hR-Oa
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 04:01:39 +0000
Date: Tue, 9 Dec 2008 23:01:35 -0500
From: Sean MacLennan <smaclennan@pikatech.com>
To: "Mitch Bradley" <wmb@firmworks.com>
Subject: Re: [PATCH] ndfc driver
Message-ID: <20081209230135.35e1b9d1@lappy.seanm.ca>
In-Reply-To: <493E24D8.6040406@firmworks.com>
References: <20081203222832.3fc77d28@lappy.seanm.ca>
	<20081204090107.20269571@zod.rchland.ibm.com>
	<20081208193446.37e27e26@lappy.seanm.ca>
	<20081209021115.GA13948@oksana.dev.rtsoft.ru>
	<20081208214512.461276d2@lappy.seanm.ca>
	<20081208223227.19a702a9@zod.rchland.ibm.com>
	<20081208235437.08323e3a@lappy.seanm.ca>
	<493E24D8.6040406@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org,
	avorontsov@ru.mvista.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 08 Dec 2008 21:57:12 -1000
"Mitch Bradley" <wmb@firmworks.com> wrote:

> One address/size cell isn't enough for the next generation of NAND
> FLASH chips.
> 

I am no dts expert, but I thought I could put:

	nand {
		#address-cells = <1>;
		#size-cells = <1>;

in my dts and you could put:

	nand {
		#address-cells = <2>;
		#size-cells = <2>;

and, assuming we specified the reg entry right, everything would just
work. Is that assumption wrong?

And if the assumption is true, should I make a note in the doc that you
can make the address and size bigger?

Cheers,
   Sean
