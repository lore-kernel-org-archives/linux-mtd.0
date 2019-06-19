Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A679C31E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE4F217D7
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:18:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ranICyTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE4F217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jcnj5/4EDz7FFawy4tpV2aRyir7aZkP8+iu1PgOUzEo=; b=ranICyTL9/brjC
	LF9G3H3VXKlz06q4LqHzu75p65uCx4++/YUTDiGimXdD5y/sqCe9jQV24mjAHfKX0dfuHpoDAZ+G0
	ZaIwZFRyN15bquv2EIeQu/eT1tgfotDODM3ztPKw+LSn8tEc+TQLCaywSunl30gNVuIMEcqBmXUy+
	VNiOfcgV3NPazuG9jSbO4kl6oV+JdqSw6ef+kQ6Zy8fHuukIV92TdV9xgFx0AFx4pv4wqYMLfw7uq
	TUNR60AaEfAA7+7hBuYMC3xMctU60UmzoKCh6Z+RxKMR4yXIjX6Tz+nY7yKR/jSbdiTg+ocLINyOC
	rq+WCOxpfYXSO8ODn0QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hddIH-0000aj-J5; Wed, 19 Jun 2019 16:18:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddIE-0000ZU-T1
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 16:18:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 840CE28A302;
 Wed, 19 Jun 2019 17:18:35 +0100 (BST)
Date: Wed, 19 Jun 2019 18:18:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH] mtd: spinand: fix error read return value
Message-ID: <20190619181832.6f467279@collabora.com>
In-Reply-To: <99279437-54a6-c81d-aad2-231009f18cfc@kontron.de>
References: <1560950005-8868-1-git-send-email-liaoweixiong@allwinnertech.com>
 <20190619154611.3bfc007b@collabora.com>
 <99279437-54a6-c81d-aad2-231009f18cfc@kontron.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_091839_065294_6824C898 
X-CRM114-Status: GOOD (  22.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 19 Jun 2019 14:02:14 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> On 19.06.19 15:46, Boris Brezillon wrote:
> > Hi liaoweixiong,
> > 
> > On Wed, 19 Jun 2019 21:13:24 +0800
> > liaoweixiong <liaoweixiong@allwinnertech.com> wrote:
> >   
> >> In function spinand_mtd_read, if the last page to read occurs bitflip,
> >> this function will return error value because veriable ret not equal to 0.  
> > 
> > Actually, that's exactly what the MTD core expects (see [1]), so you're
> > the one introducing a regression here.  
> 
> To me it looks like the patch description is somewhat incorrect, but the 
> fix itself looks okay, unless I'm getting it wrong.
> 
> In case of the last page containing bitflips (ret > 0), 
> spinand_mtd_read() will return that number of bitflips for the last 
> page. But to me it looks like it should instead return max_bitflips like 
> it does when the last page read returns with 0.

Oh, you're right. liaoweixiong, can you adjust the commit message
accordingly?

> 
> >>
> >> Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>
> >> ---
> >>   drivers/mtd/nand/spi/core.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> >> index 556bfdb..6b9388d 100644
> >> --- a/drivers/mtd/nand/spi/core.c
> >> +++ b/drivers/mtd/nand/spi/core.c
> >> @@ -511,12 +511,12 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
> >>   		if (ret == -EBADMSG) {
> >>   			ecc_failed = true;
> >>   			mtd->ecc_stats.failed++;
> >> -			ret = 0;
> >>   		} else {
> >>   			mtd->ecc_stats.corrected += ret;
> >>   			max_bitflips = max_t(unsigned int, max_bitflips, ret);
> >>   		}
> >>   
> >> +		ret = 0;
> >>   		ops->retlen += iter.req.datalen;
> >>   		ops->oobretlen += iter.req.ooblen;
> >>   	}  
> > 
> > [1]https://elixir.bootlin.com/linux/latest/source/drivers/mtd/mtdcore.c#L1209
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
