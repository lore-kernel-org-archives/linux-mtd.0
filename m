Date: Thu, 5 Sep 2013 22:36:44 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Message-ID: <20130906023605.GA2292@gmail.com>
References: <20130905014350.GA2261@gmail.com>
 <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C885@DBDE04.ent.ti.com>
 <5228369A.9000904@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C907@DBDE04.ent.ti.com>
 <52284F32.2020302@freescale.com>
 <20130905135032.GB3084@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130905135032.GB3084@sirena.org.uk>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 05, 2013 at 02:50:32PM +0100, Mark Brown wrote:
> On Thu, Sep 05, 2013 at 05:30:26PM +0800, Huang Shijie wrote:
> > 于 2013年09月05日 17:11, Gupta, Pekon 写道:
> 
> > >Anyway, if you really want to continue with this is, then please re-name
> > >include/linux/mtd/spi-nor.h to
> > >include/linux/mtd/spi-fsl-quadspi.h
> > >because something specific for your driver should not conflict with
> > >generic spi-nor framework added later.
> 
> > i think there is no specific thing for this driver. The S25FL128S is
> > a common flash,
> > other person may uses it too. Could you show me what is specific?
> 
> > so, i prefer to spi-nor.h.
> 
> Looking at the current header there just seem to be defines in there, no
> abstraction for the chips.  Perhaps that is what is missing?
we do not need any abstraction for this chip, we only need the SPI NOR 
commands, such as Quad read / DDR quad read.


thanks
Huang Shijie
