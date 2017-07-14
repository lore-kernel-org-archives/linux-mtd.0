Date: Fri, 14 Jul 2017 11:06:03 -0500
From: Rob Herring <robh@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 lee.jones@linaro.org, nicolas.ferre@microchip.com,
 alexandre.belloni@free-electrons.com,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com
Subject: Re: [PATCH 1/3] mfd: syscon: update Atmel SMC binding doc
Message-ID: <20170714160603.b6hwut3t7spoygdx@rob-hp-laptop>
References: <20170711074015.30440-1-ludovic.desroches@microchip.com>
 <20170711074015.30440-2-ludovic.desroches@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170711074015.30440-2-ludovic.desroches@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 11, 2017 at 09:40:13AM +0200, Ludovic Desroches wrote:
> A new compatible string is introduced for SMC on sama5d2 to manage a
> different layout of the registers.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-smc.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
