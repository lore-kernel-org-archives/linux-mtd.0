Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAmxN-0002Cd-CD
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 21:55:30 +0000
Received: by mail-la0-f47.google.com with SMTP id hz20so26480844lab.6
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jan 2015 13:55:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150112215317.GG9759@ld-irv-0074>
References: <1421094288-24750-1-git-send-email-Frank.Li@freescale.com>
 <20150112215317.GG9759@ld-irv-0074>
Date: Mon, 12 Jan 2015 15:55:05 -0600
Message-ID: <CAHrpEqTkpc0kXLSLvo=hzSLVXwf3tp_QmTVkRq1jHW5ppG0Awg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: spi-nor: fsl-qspi: support DSM fro imx6 sx chip
From: Zhi Li <lznuaa@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On Mon, Jan 12, 2015 at 3:53 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Regarding subject: "[PATCH 1/1] mtd: spi-nor: fsl-qspi: support DSM fro imx6 sx chip"
>
> s/fro/for/

Sorry for that.

>
> And, what is DSM?

Deep sleep mode.  QSPI controller power can be turned off during suspend.

>
> Brian
