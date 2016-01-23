Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN5My-0008EO-Rk
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 21:05:19 +0000
Received: by mail-pa0-x235.google.com with SMTP id cy9so59710475pac.0
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 13:04:56 -0800 (PST)
Date: Sat, 23 Jan 2016 13:04:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Yao Yuan <yao.yuan@nxp.com>
Cc: Han Xu <han.xu@freescale.com>, Yuan Yao <yao.yuan@freescale.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 4/4] mtd: spi-nor: fsl-quadspi: extend support for
 some special requerment.
Message-ID: <20160123210453.GC35559@google.com>
References: <1450954821-7483-1-git-send-email-yao.yuan@freescale.com>
 <1450954821-7483-4-git-send-email-yao.yuan@freescale.com>
 <20160104210223.GB27554@chopperman.am.freescale.net>
 <AM2PR04MB07229FADBBF527A93CC5410489CA0@AM2PR04MB0722.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM2PR04MB07229FADBBF527A93CC5410489CA0@AM2PR04MB0722.eurprd04.prod.outlook.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 12, 2016 at 04:09:04AM +0000, Yao Yuan wrote:
> Hi Xu Han, David Woodhouse, Brian Norris
> 
> By the way, there are some patches depend on this patch for QSPI Spansion S25FS-S family flash support on ARMv8 platform.
> in order to the completeness of the patch sets. I want to just send the patch set for QSPI LS1021A and LS1043A SOC support.
> Include: mtd-spi-nor-fsl-quadspi-add-big-endian-support.patch mtd-spi-nor-fsl-quadspi-add-support-for-ls1021a.patch
> Those patches add the QSPI support on LS1021A and LS1043A SOC.
> 
> And another patch set will send to support Spansion S25FS-S family flash.
> Include: mtd-spi-nor-fsl-quadspi-add-support-for-layerscape.patch mtd-spi-nor-fsl-quadspi-extend-support-for-some-spec.patch
> And some other patches.
> Those patches will add the QSPI Spansion S25FS-S family flash support. This is used for NXP LS2080A SOC.
> 
> Is that OK?

I don't really care what patches you send all at once vs. delayed for a
later time; just make sure that when you send out a series, it includes
all the necessary patches to make a coherent story, without breaking
anything, and that it is addressed to all the right parties. So far,
you've failed that by leaving out documentation, and by forgetting to
CC the relevant mailing lists and maintainers.

AIUI, you're asking about new SoC support vs. new flash support. Those
seem orthogonal enough to me that it would be fine to send the former,
and then later tackle the latter.

Regards,
Brian
