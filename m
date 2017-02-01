Date: Wed, 1 Feb 2017 09:39:20 -0600
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org,
 Vinod Koul <vinod.koul@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Haavard Skinnemoen <hskinnemoen@gmail.com>,
 Hans-Christian Egtvedt <egtvedt@samfundet.no>,
 linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-arm-kernel@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 4/5] mtd: nand: atmel: Document the new DT bindings
Message-ID: <20170201153920.g26erfzxnxrmsu4z@rob-hp-laptop>
References: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
 <1485535324-28393-5-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485535324-28393-5-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 27, 2017 at 05:42:03PM +0100, Boris Brezillon wrote:
> Document the new DT bindings for the Atmel NAND controller and
> deprecate the old ones.

Why?

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt         | 106 ++++++++++++++++++++-
>  1 file changed, 105 insertions(+), 1 deletion(-)
