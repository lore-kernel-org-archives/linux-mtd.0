Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqSM5-0008Mc-4S
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 22:34:24 +0000
Subject: Re: [PATCH 0/5] mtd: nand: add support for on-die ECC
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll
 <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Kumar Gala <galak@codeaurora.org>
References: <1490092686-16509-1-git-send-email-thomas.petazzoni@free-electrons.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <c6ffc948-85ba-21dc-871c-3fd0b7b4b97b@nod.at>
Date: Tue, 21 Mar 2017 23:33:50 +0100
MIME-Version: 1.0
In-Reply-To: <1490092686-16509-1-git-send-email-thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

Am 21.03.2017 um 11:38 schrieb Thomas Petazzoni:
> Hello,
> 
> This patch series adds support for on-die ECC, i.e ECC performed by
> the NAND chip itself, as opposed to having the ECC calculated by the
> NAND controller or in software.
> 
> It is useful in situations where the NAND chip has an ECC requirement
> that is not met by the ECC capabilities of the NAND controller.
> 
> Patch 1 adjusts the NAND generic DT binding to add "on-die" as an
> nand-ecc-mode.
> 
> Patch 2 adds the core support for on-die ECC, which is really simple
> and minimal: all the work is really done in the vendor-specific NAND
> code.
> 
> Patch 3 and 4 adds the on-die ECC implementation for Micron NANDs.
> 
> Patch 5 allows the FSMC NAND driver to use on-die ECC.
> 
> This series was tested on a SPEAr600 platform, with a Micron
> MT29F1G08ABADAWP NAND. The mtd_nandbiterrs.ko test is passing
> successfully, which shows that the on-die ECC is correcting bitflips
> as expected.

This series looks good to me. Great job!

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
