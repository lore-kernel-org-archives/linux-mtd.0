Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIitf-0007w0-5L
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 19:44:43 +0000
Received: by pacan13 with SMTP id an13so19240606pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 12:44:22 -0700 (PDT)
Date: Fri, 24 Jul 2015 12:44:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Zhi Li <lznuaa@gmail.com>
Cc: "Frank.Li@freescale.com" <Frank.Li@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Allen Xu <b45815@freescale.com>
Subject: Re: [PATCH 4/7] mtd: spi-nor: fsl-quadspi: i.MX6SX: fixed the random
 QSPI access failed issue
Message-ID: <20150724194419.GL8876@google.com>
References: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
 <1437507599-25424-4-git-send-email-Frank.Li@freescale.com>
 <20150724165649.GH8876@google.com>
 <CAHrpEqSW_WS3a5y3W521339PZDD1QJ_JozMD-vHu8Gbm=13-HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHrpEqSW_WS3a5y3W521339PZDD1QJ_JozMD-vHu8Gbm=13-HQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 24, 2015 at 12:10:54PM -0500, Zhi Li wrote:
> On Fri, Jul 24, 2015 at 11:56 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > This patch does not apply to l2-mtd.git.
> 
> Did you try to apply below patch firstly?
> 
> [PATCH 1/1] mtd: spi-nor: fsl-qspi: dynamically map memory space for AHB read

No. Why should I? You didn't tell me or any other reviewer. Please list
dependencies explicitly in the cover letter next time.

> Which branch? I can double check.

master
