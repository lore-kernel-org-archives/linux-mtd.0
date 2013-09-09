Message-ID: <522D3B79.3060707@freescale.com>
Date: Mon, 9 Sep 2013 11:07:37 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C885@DBDE04.ent
In-Reply-To: <20130908134725.GQ29403@sirena.org.uk>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA09=D4=C208=C8=D5 21:47, Mark Brown =D0=B4=B5=C0:
> On Thu, Sep 05, 2013 at 10:36:44PM -0400, Huang Shijie wrote:
>> On Thu, Sep 05, 2013 at 02:50:32PM +0100, Mark Brown wrote:
>>> Looking at the current header there just seem to be defines in there,=
 no
>>> abstraction for the chips.  Perhaps that is what is missing?
>> we do not need any abstraction for this chip, we only need the SPI NOR=
=20
>> commands, such as Quad read / DDR quad read.
> So the abstraction could say what the commands are, or what's supported
thanks.

I have already added the comment for what the commands are, please see
patch 3 & patch 4.
> if they're standard?
In actually, there is no standard for the SPI NOR commands now.

I added these commands just in the Spansion section now.
(Of course, other NOR vendors may also uses the same commands.)

thanks
Huang Shijie
