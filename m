Subject: Re: [PATCH v2 3/4] ARM: dts: at91: Switch to the new NAND bindings
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jiri Prchal <jiri.prchal@aksignal.cz>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Rodolfo Giometti <giometti@linux.it>, Antoine Aubert <a.aubert@overkiz.com>,
 info@egnite.de, Fabio Porcedda <fabio.porcedda@gmail.com>
References: <1496136054-12390-1-git-send-email-boris.brezillon@free-electrons.com>
 <1496136054-12390-4-git-send-email-boris.brezillon@free-electrons.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <4561101c-3032-3cdf-7588-31372510c5b3@axentia.se>
Date: Tue, 30 May 2017 15:11:25 +0200
MIME-Version: 1.0
In-Reply-To: <1496136054-12390-4-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-05-30 11:20, Boris Brezillon wrote:
> Use the new EBI/NAND bindings to declare NAND chips and remove old NAND
> nodes along the way.
> 
> Note that we keep using old bindings in at91rm9200.dtsi because this
> SoC is not supported by the EBI driver.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Jiri Prchal <jiri.prchal@aksignal.cz>
> Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Cc: Rodolfo Giometti <giometti@linux.it>
> Cc: Antoine Aubert <a.aubert@overkiz.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: info@egnite.de
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---

For at91-tse850-3.dts (and therefore at91-linea.dtsi).

Tested-by: Peter Rosin <peda@axentia.se>

Cheers,
peda
