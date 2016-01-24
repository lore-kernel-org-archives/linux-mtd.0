Received: from mail-he1eur01on0058.outbound.protection.outlook.com
 ([104.47.0.58] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNC6Y-0008FZ-Az
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2016 04:16:48 +0000
From: Yao Yuan <yao.yuan@nxp.com>
To: Brian Norris <computersforpeace@gmail.com>, Han Xu <xhnjupt@gmail.com>
CC: Yuan Yao <yao.yuan@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: mtd: spi-nor: fsl-quadspi: add support for ls1021a
Date: Sun, 24 Jan 2016 04:16:21 +0000
Message-ID: <AM2PR04MB0722FEFEBDF36AA91450D33189C60@AM2PR04MB0722.eurprd04.prod.outlook.com>
References: <1453362836-44377-1-git-send-email-yao.yuan@freescale.com>
 <CA+EcR20=OaZOOPMKVys-NDbTeXhEDCzre8L_vv53s+Ukv3XQLw@mail.gmail.com>
 <AM2PR04MB072287A0E9C83F507FDF282389C40@AM2PR04MB0722.eurprd04.prod.outlook.com>
 <CA+EcR2197eSd--Xt2ePXJc5kW1qhDa5_5DQh9R4s6HdFtDs_Qw@mail.gmail.com>,
 <20160123211723.GA24744@localhost>
In-Reply-To: <20160123211723.GA24744@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 24, 2016 05:17 AM +0800, Brian Norris wrote:
On Fri, Jan 22, 2016 at 11:30:55AM -0600, Han Xu wrote:
> On Fri, Jan 22, 2016 at 3:01 AM, Yao Yuan <yao.yuan@nxp.com> wrote:
> > On Thu, Jan 21, 2016 at 11:42 PM, Han Xu < xhnjupt@gmail.com > wrote:
> >> On Thu, Jan 21, 2016 at 1:53 AM, Yuan Yao <yao.yuan@freescale.com> wro=
te:
> >> > Any extra information you can find them on the patchwork:
> >> > https://patchwork.kernel.org/patch/8078931/
> >> > https://patchwork.kernel.org/patch/8078951/
> >> > https://patchwork.kernel.org/patch/8079091/
> >> > https://patchwork.kernel.org/patch/8078941/
> >>
> >> Please send all patches in one patch set, this is not acceptable.
> >>
> >
> > Thanks for your review.
> > But those patches are dts binding patch. And will send to  devicetree@v=
ger.kernel.org and some corresponding maintainer.
> >
> > Those two patch sets will send to different mail-list and maintainers s=
eparately.
> >
> > So, maybe it's better to send the patch to the maintainer accordingly a=
nd thus I think can also reduce the workload of maintainer.
> >
> > How about your think?
>
> Send the complete patch set to maintainer and cc all related
> sub-module groups, so everybody could understand the whole story.

Agreed. You apparently did not read the suggested documentation from
last time:

  Documentation/devicetree/bindings/submitting-patches.txt

Particularly, points 2 and 3.

Subsystem maintainers merge binding patches, so please send them as part
of the regular series.

OK, Got it.
Thanks Han Xu and  Brian Norris.

I will resend them as a complete patch set.=
