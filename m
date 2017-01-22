Subject: Re: [PATCH 09/22] mtd: add DT bindings for the Cortina Systems Gemini
 Flash
To: Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170122122119.10510-1-linus.walleij@linaro.org>
Cc: Janos Laube <janos.dev@gmail.com>,
 Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <fdc38613-18c2-3ae3-09e6-d8103c0a8f93@gmail.com>
Date: Sun, 22 Jan 2017 15:40:00 +0100
MIME-Version: 1.0
In-Reply-To: <20170122122119.10510-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/22/2017 01:21 PM, Linus Walleij wrote:
> This adds device tree bindings for the Cortina systems Gemini
> flash controller, a simple physmap which however need a few
> syscon bits to be poked to operate properly.
> 
> Cc: Janos Laube <janos.dev@gmail.com>
> Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Looks pretty OK to me:
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> MTD maintainers: please just apply this to the MTD tree when
> you are happy with it. It is functionally orthogonal to the rest
> of the series and is just in the series for context.
> ---
>  .../bindings/mtd/cortina,gemini-flash.txt          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt b/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> new file mode 100644
> index 000000000000..3fa1b34d69ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> @@ -0,0 +1,24 @@
> +Flash device on Cortina Systems Gemini SoC
> +
> +This flash is regular CFI compatible (Intel or AMD extended) flash chips with
> +some special bits that can be controlled by the machine's system controller.
> +
> +Required properties:
> +- compatible : must be "cortina,gemini-flash", "cfi-flash";
> +- reg : memory address for the flash chip
> +- syscon : must be a phandle to the system controller
> +- bank-width : width in bytes of flash interface, should be <2>
> +
> +For the rest of the properties, see mtd-physmap.txt.
> +
> +The device tree may optionally contain sub-nodes describing partitions of the
> +address space. See partition.txt for more detail.
> +
> +Example:
> +
> +flash@30000000 {
> +	compatible = "cortina,gemini-flash", "cfi-flash";
> +	reg = <0x30000000 0x01000000>;
> +	syscon = <&syscon>;
> +	bank-width = <2>;
> +};
> 


-- 
Best regards,
Marek Vasut
