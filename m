Received: from mail-yh0-x230.google.com ([2607:f8b0:4002:c01::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAmzW-0003pY-PI
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 21:57:43 +0000
Received: by mail-yh0-f48.google.com with SMTP id i57so10910465yha.7
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jan 2015 13:57:20 -0800 (PST)
Date: Mon, 12 Jan 2015 13:57:17 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhi Li <lznuaa@gmail.com>
Subject: Re: [PATCH 1/1] mtd: spi-nor: fsl-qspi: support DSM fro imx6 sx chip
Message-ID: <20150112215717.GH9759@ld-irv-0074>
References: <1421094288-24750-1-git-send-email-Frank.Li@freescale.com>
 <20150112215317.GG9759@ld-irv-0074>
 <CAHrpEqTkpc0kXLSLvo=hzSLVXwf3tp_QmTVkRq1jHW5ppG0Awg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHrpEqTkpc0kXLSLvo=hzSLVXwf3tp_QmTVkRq1jHW5ppG0Awg@mail.gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, Allen Xu <b45815@freescale.com>,
 "Frank.Li@freescale.com" <Frank.Li@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 12, 2015 at 03:55:05PM -0600, Zhi Li wrote:
> On Mon, Jan 12, 2015 at 3:53 PM, Brian Norris <computersforpeace@gmail.com> wrote:
> > And, what is DSM?
> 
> Deep sleep mode.  QSPI controller power can be turned off during suspend.

OK, please include that in version 2.

Brian
