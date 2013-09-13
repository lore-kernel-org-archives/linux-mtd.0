Date: Thu, 12 Sep 2013 23:14:47 -0400
From: Huang Shijie <shijie8@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Message-ID: <20130913031444.GB3051@gmail.com>
References: <52304BFF.4060007@freescale.com>
 <20130911113002.GP29403@sirena.org.uk>
 <523186DF.4070203@freescale.com>
 <1378982395.2627.416.camel@shinybook.infradead.org>
 <20980858CB6D3A4BAE95CA194937D5E73EA0EE8B@DBDE04.ent.ti.com>
 <1378984665.2627.423.camel@shinybook.infradead.org>
 <20130912114831.GL29403@sirena.org.uk>
 <1378987323.2627.429.camel@shinybook.infradead.org>
 <20130912134345.GQ29403@sirena.org.uk>
 <1378994596.2627.449.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1378994596.2627.449.camel@shinybook.infradead.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 12, 2013 at 03:03:16PM +0100, David Woodhouse wrote:
> On Thu, 2013-09-12 at 14:43 +0100, Mark Brown wrote:
> > 
> 
> So to go back to your question: the commands that it "knows" we are
> going to send are indeed specific to (one particular type of) SPI NOR
> flash. But there's nothing on the MTD side which justifies that
> assumption. Even if you use a different type of SPI NOR flash which uses
> different opcodes for its commands, this broken scheme will fall over.

Beside the quad-read/ddr-quad-read commands, all the commands needed by
this driver is common. If we do not enable the quad-read, this driver
can works with the fast-read mode.

If we use a different NOR which uses different opcodes
(different quad-read opcodes ?), i should add a small patch to fix it. 


I think i should follow Mark's advice to split out the quad-read code.

thanks
Huang Shijie
