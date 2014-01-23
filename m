Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W68yF-0002Ra-Fu
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 01:20:41 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZT003LPYDKI5A0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:20:08 +0900 (KST)
From: kgene@kernel.org
Sender: Kukjin Kim <kgene.kim@samsung.com>
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-mtd@lists.infradead.org
References: <1389333253-3802-1-git-send-email-sachin.kamat@linaro.org>
 <1389333253-3802-3-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHzMOhBco0JyNdXMCMiO20B+TFvVTXxa=P1DksHUr67wJQ@mail.gmail.com>
In-reply-to: <CAK9yfHzMOhBco0JyNdXMCMiO20B+TFvVTXxa=P1DksHUr67wJQ@mail.gmail.com>
Subject: RE: [PATCH Resend 3/3] mtd: s3c2410: Merge plat/regs-nand.h into
 s3c2410.c
Date: Thu, 23 Jan 2014 10:20:05 +0900
Message-id: <023501cf17d9$4133f560$c39be020$@kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Brian Norris' <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sachin Kamat wrote:
> 
> On 10 January 2014 11:24, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> > plat/regs-nand.h is used only by S3C2410 nand driver. Since there
> > are no other users, merge this file into the driver code to remove
> > platform dependency. While at it also remove unused macros.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > Cc: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks,
Kukjin

> > ---
> >  arch/arm/plat-samsung/include/plat/regs-nand.h |  123
------------------
> ------
> >  drivers/mtd/nand/s3c2410.c                     |   36 ++++++-
> >  2 files changed, 35 insertions(+), 124 deletions(-)
> >  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-nand.h
