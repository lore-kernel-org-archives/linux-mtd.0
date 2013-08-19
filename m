Received: from avon.wwwdotorg.org ([2001:470:1f0f:bd7::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBWjn-0001g9-8r
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 21:11:43 +0000
Message-ID: <521289F7.8090503@wwwdotorg.org>
Date: Mon, 19 Aug 2013 15:11:19 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v4 4/4] mtd: nand: gpio: Add support for multichip devices
References: <1376637583-12485-1-git-send-email-shc_work@mail.ru>
 <1376637583-12485-2-git-send-email-shc_work@mail.ru>
In-Reply-To: <1376637583-12485-2-git-send-email-shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Rob Herring <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org,
 Grant Likely <grant.likely@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/16/2013 01:19 AM, Alexander Shiyan wrote:
> This patch adds support for multichip NAND devices controlled through GPIOs.
> To implement this, the properties of tree have been renamed. All current
> boards and DTS files converted to use an updated driver. Also driver
> temporarily keep support for DTS files which use the previous names scheme.

> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt

> -- gpios : specifies the gpio pins to control the NAND device.  nwp is an
> -  optional gpio and may be set to 0 if not present.
> +- ale-gpios : specifies the ALE gpio pin.
> +- cle-gpios : specifies the CLE gpio pin.
> +- nwp-gpios : specifies the NWP gpio pin (Optional).
> +- nce-gpios : specifies the NCE gpio pin or several NCE GPIOs for multichip NAND.
> +- rdy-gpios : specifies the RDY gpio pin or several RDY GPIOs for multichip NAND.

Why not put the nwp-gpios into the "Optional properties" section of the
document?

Documenting the deprecated properties is good; thanks!
