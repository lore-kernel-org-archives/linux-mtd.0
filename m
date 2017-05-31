Date: Wed, 31 May 2017 11:56:45 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Jiri Prchal <jiri.prchal@aksignal.cz>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Rodolfo Giometti <giometti@linux.it>,
 Antoine Aubert <a.aubert@overkiz.com>,
 Peter Rosin <peda@axentia.se>, info@egnite.de,
 Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: dts: at91: Migrate to the new EBI/NAND
 bindings
Message-ID: <20170531095645.7jwews2fbofhntjk@piout.net>
References: <1496136054-12390-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496136054-12390-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30/05/2017 at 11:20:50 +0200, Boris Brezillon wrote:
> Hello,
> 
> This is the last step of the EBI/NAND bindings rework started here [1].
> 
> The first patch is adding missing nfc-io bindings doc to atmel-nand.txt
> and can be applied independently.
> 
> Patches 2 and 3 are migrating all at91/sama5 SoCs (except the
> at91rm9200) to the new EBI/NAND representation introduced in 4.12.
> 
> The last patch is showing how one can add a non-NAND device under the
> EBI bus.
> 
> Regards,
> 
> Boris
> 
> [1]http://lkml.iu.edu/hypermail/linux/kernel/1703.2/00124.html
> 
> Changes since v1:
> - Cc board maintainers
> - merge patches 3 and 4 into a single patch doing all board
>   modifications
> 
> Boris Brezillon (4):
>   dt-bindings: mtd: atmel-nand: Document the nfc-io bindings
>   ARM: dts: at91: Declare EBI/NAND controllers
>   ARM: dts: at91: Switch to the new NAND bindings
>   ARM: dts: at91: Add the NOR flash available on sama5d3 dev kits
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
