Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN5Z5-0005AF-EW
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 21:17:48 +0000
Received: by mail-pa0-x235.google.com with SMTP id uo6so60962141pac.1
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 13:17:27 -0800 (PST)
Date: Sat, 23 Jan 2016 13:17:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Yao Yuan <yao.yuan@nxp.com>, Yuan Yao <yao.yuan@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: mtd: spi-nor: fsl-quadspi: add support for ls1021a
Message-ID: <20160123211723.GA24744@localhost>
References: <1453362836-44377-1-git-send-email-yao.yuan@freescale.com>
 <CA+EcR20=OaZOOPMKVys-NDbTeXhEDCzre8L_vv53s+Ukv3XQLw@mail.gmail.com>
 <AM2PR04MB072287A0E9C83F507FDF282389C40@AM2PR04MB0722.eurprd04.prod.outlook.com>
 <CA+EcR2197eSd--Xt2ePXJc5kW1qhDa5_5DQh9R4s6HdFtDs_Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EcR2197eSd--Xt2ePXJc5kW1qhDa5_5DQh9R4s6HdFtDs_Qw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 22, 2016 at 11:30:55AM -0600, Han Xu wrote:
> On Fri, Jan 22, 2016 at 3:01 AM, Yao Yuan <yao.yuan@nxp.com> wrote:
> > On Thu, Jan 21, 2016 at 11:42 PM, Han Xu < xhnjupt@gmail.com > wrote:
> >> On Thu, Jan 21, 2016 at 1:53 AM, Yuan Yao <yao.yuan@freescale.com> wrote:
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
> > But those patches are dts binding patch. And will send to  devicetree@vger.kernel.org and some corresponding maintainer.
> >
> > Those two patch sets will send to different mail-list and maintainers separately.
> >
> > So, maybe it's better to send the patch to the maintainer accordingly and thus I think can also reduce the workload of maintainer.
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

Brian
