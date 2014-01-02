Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VyWUR-0002cH-2L
 for linux-mtd@lists.infradead.org; Thu, 02 Jan 2014 00:50:24 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYR006IG0YZ6G50@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 02 Jan 2014 09:49:47 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
References: <1388467753-24431-1-git-send-email-sachin.kamat@linaro.org>
 <20131231113428.GA3985@htj.dyndns.org>
In-reply-to: <20131231113428.GA3985@htj.dyndns.org>
Subject: Re: [PATCH 1/1] ata: pata_samsung_cf: Move plat/regs-ata.h to
 drivers/ata
Date: Thu, 02 Jan 2014 09:49:46 +0900
Message-id: <001b01cf0754$88b7fc00$9a27f400$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org,
 'Jingoo Han' <jg1.han@samsung.com>, linux-ide@vger.kernel.org,
 kgene.kim@samsung.com, linux-mtd@lists.infradead.org,
 'Tejun Heo' <tj@kernel.org>, 'Brian Norris' <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, December 31, 2013 8:34 PM, Tejun Heo wrote:
> On Tue, Dec 31, 2013 at 10:59:13AM +0530, Sachin Kamat wrote:
> > plat/regs-ata.h is used only by Samsung PATA driver.
> > Move this file to the drivers folder to remove platform
> > dependency required for multiplatform support.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> 
> Applied to libata/for-3.14.
> 
> As this is only used by pata_samsung_cf.c, can you please follow up
> with a patch to roll pata_samsung_cf.h into .c?  There's no point in
> creating separate header files for stuff which isn't shared among
> multiple files.

(+cc Brian Norris, linux-mtd mailing list)

Right, I also agree with Tejun's opinion.
Would you also send the patch to roll .h into .c for your another
patch "mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd"?
(http://www.spinics.net/lists/linux-samsung-soc/msg25498.html)

Best regards,
Jingoo Han
