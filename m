Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LK0fW-00013l-Na
	for linux-mtd@lists.infradead.org; Tue, 06 Jan 2009 01:23:43 +0000
Date: Mon, 5 Jan 2009 20:23:40 -0500
From: Sean MacLennan <smaclennan@pikatech.com>
To: "Kostas Nakos" <knakos@inaccessnetworks.com>
Subject: Re: [PATCH] ndfc driver
Message-ID: <20090105202340.7fd0f8c1@lappy.seanm.ca>
In-Reply-To: <4958AD4E.8090608@inaccessnetworks.com>
References: <4950D8EA.7010905@inaccessnetworks.com>
	<20081223170040.4e58de3f@lappy.seanm.ca>
	<4958AD4E.8090608@inaccessnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 29 Dec 2008 12:58:22 +0200
"Kostas Nakos" <knakos@inaccessnetworks.com> wrote:

> Alright, with:
> 
> <0 0 2000>  ->
> 
> __ioremap(): phys addr 0x0 is RAM lr c0008c94
> ndfc 0.ndfc: failed to get memory
> ndfc: probe of 0.ndfc failed with error -5
> 
> I notice that the 0xd0000000 value is also defined in the (our)
> platform include for our platform in u-boot (include/configs/...):
> 
> #define CFG_NAND_ADDR           0xd0000000

That is where the NAND is on the warp. Could you post the complete dts?

Cheers,
   Sean
