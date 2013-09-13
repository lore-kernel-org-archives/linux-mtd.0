Date: Thu, 12 Sep 2013 22:58:30 -0400
From: Huang Shijie <shijie8@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Message-ID: <20130913025827.GA3051@gmail.com>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com> <522D3B79.3060707@freescale.com>
 <52318953.6090405@freescale.com>
 <1378979431.2627.402.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1378979431.2627.402.camel@shinybook.infradead.org>
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

On Thu, Sep 12, 2013 at 10:50:31AM +0100, David Woodhouse wrote:
> On Thu, 2013-09-12 at 17:28 +0800, Huang Shijie wrote:
> > 于 2013年09月11日 22:05, David Woodhouse 写道:
> > > What*actually*  happens, on the wire(s), when the flash driver asks the
> > > SPI controller to perform a transaction?
> > The LUT registers tell the controller how many wires are needed for a 
> > transaction.
> > For example, the read status only use a single line, while the quad read 
> > uses 4 lines.
> 
> Is this not something that could theoretically be provided by the caller
> when it *makes* the transaction?
> 
> Conceptually speaking, could it not be an additional argument to
> spi_write_then_read() ? 
> 
> After all, it's the *device* driver (m25p80.c etc.) which will know what
> the transaction actually *is*, and how many lines the device will want
> to use for each transaction?
yes. we can set the lines information in the spi_write_then_read().

But for the quadspi driver, it does not need this information.

When the drivers knows that it is a Quad-read transaction, it will uses
the relative LUT sequence which uses the 4 lines.

thanks
Huang Shijie
