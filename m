Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGx4F-0004ls-K3
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 23:00:37 +0000
Received: by mail-pa0-x22f.google.com with SMTP id cy9so242086374pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 15:00:15 -0800 (PST)
Date: Wed, 6 Jan 2016 15:00:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Yao Yuan <yao.yuan@nxp.com>
Cc: Han Xu <han.xu@freescale.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] mtd: spi-nor: fsl-quadspi: add big-endian support
Message-ID: <20160106230010.GL109450@google.com>
References: <1450954821-7483-1-git-send-email-yao.yuan@freescale.com>
 <20160104205830.GA27554@chopperman.am.freescale.net>
 <AM2PR04MB0722319A9E6027EA76EAE81389F40@AM2PR04MB0722.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM2PR04MB0722319A9E6027EA76EAE81389F40@AM2PR04MB0722.eurprd04.prod.outlook.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 06, 2016 at 07:52:31AM +0000, Yao Yuan wrote:
> On Tue, Jan 05, 2015 at 04:58AM, Han Xu wrote:
> > once again, please document the new property.
> 
> Thanks for your review.
> I have already send the patch named "Documentation: fsl-quadspi: Add optional properties" to community on Dec 24.
> Sorry for forget to send this patch to you.

You also forgot to send it to anyone who could apply it. Like me, and
linux-mtd.

Please resend your series with all parties CC'd, after rereading
Documentation/devicetree/bindings/submitting-patches.txt.

Regards,
Brian
