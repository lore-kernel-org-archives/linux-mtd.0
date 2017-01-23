Date: Mon, 23 Jan 2017 14:13:47 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Janos Laube <janos.dev@gmail.com>,
 Paulius Zaleckas <paulius.zaleckas@gmail.com>,
 openwrt-devel@openwrt.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 09/22] mtd: add DT bindings for the Cortina Systems
 Gemini Flash
Message-ID: <20170123201347.zjarugehax7zovig@rob-hp-laptop>
References: <20170122122119.10510-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170122122119.10510-1-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 22, 2017 at 01:21:19PM +0100, Linus Walleij wrote:
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
> ---
> MTD maintainers: please just apply this to the MTD tree when
> you are happy with it. It is functionally orthogonal to the rest
> of the series and is just in the series for context.
> ---
>  .../bindings/mtd/cortina,gemini-flash.txt          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt

Acked-by: Rob Herring <robh@kernel.org>
