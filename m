From: Arnd Bergmann <arnd@arndb.de>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 04/20] ARM: pxa: ssp: add DT bindings
Date: Wed, 7 Aug 2013 17:54:17 +0200
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-5-git-send-email-zonque@gmail.com>
In-Reply-To: <1375889649-14638-5-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201308071754.17741.arnd@arndb.de>
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, broonie@kernel.org,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 07 August 2013, Daniel Mack wrote:
> +Device tree bindings for Marvell PXA SSP ports
> +
> +Required properties:
> +
> +       - compatible:   Must be one of
> +                               mrvl,pxa25x-ssp
> +                               mvrl,pxa25x-nssp
> +                               mrvl,pxa27x-ssp
> +                               mrvl,pxa3xx-ssp
> +                               mvrl,pxa168-ssp
> +                               mrvl,pxa910-ssp
> +                               mrvl,ce4100-ssp
> +                               mrvl,lpss-ssp
> +
> +       - reg:          The memory base
> +
> +

It seems you are missing the 'dmas' properties here and that two of them
("rx" and "tx") are required by the code.

	Arnd
