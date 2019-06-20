Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C297C43613
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 07:13:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 451C62084A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 07:13:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Md1hd4KQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 451C62084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaehlKHMtsm4f6FeW6tvwq1VRR5gQ4f7ybNjQugG6oc=; b=Md1hd4KQ1V7mRG
	9ymDQnLdLFShXA2VH1UtAoc+DfEG7TEhHrvW0sqvj/FLCTM3U4lEX1/QAkO5XNQiZ1pJnHWua/8SA
	+SOl2dB0R71hrDal02k422SkhS7LVlTx3KZsdnJsKeDXdkxtSIIO9fNsRja11yZuB4jzdte1kZnBm
	WMjhsbBbUT68iaNvkMW9TbEa59PQzzAx50dHlpouR7kIi76gugoKLqTcxN+GLDR8qtAqOLMCbLfcQ
	kWF4Zsqv5ESEkrARJQdF7zGbLoYYWryBgi6EWZXlg3KZMJ9eChfYonhSzZthkQcmZnvtrHnQIKxKD
	cAYVm3Xt3gsDCe3mPiRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdrG7-0001AI-9k; Thu, 20 Jun 2019 07:13:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdrG4-000198-FK
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2019 07:13:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5F3D82639EC;
 Thu, 20 Jun 2019 08:13:17 +0100 (BST)
Date: Thu, 20 Jun 2019 09:13:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2] mtd: spinand: read return badly if the last page has
 bitflips
Message-ID: <20190620091314.70bc99a2@collabora.com>
In-Reply-To: <1560992416-5753-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1560992416-5753-1-git-send-email-liaoweixiong@allwinnertech.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_001320_648687_0452BD46 
X-CRM114-Status: GOOD (  18.56  )
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
 linux-kernel@vger.kernel.org, Schrempf Frieder <frieder.schrempf@kontron.De>,
 Marek Vasut <marek.vasut@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, linux-mtd@lists.infradead.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 20 Jun 2019 09:00:16 +0800
liaoweixiong <liaoweixiong@allwinnertech.com> wrote:

> In case of the last page containing bitflips (ret > 0),
> spinand_mtd_read() will return that number of bitflips for the last
> page. But to me it looks like it should instead return max_bitflips like
> it does when the last page read returns with 0.
> 
> Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/spi/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 556bfdb..6b9388d 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -511,12 +511,12 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
>  		if (ret == -EBADMSG) {
>  			ecc_failed = true;
>  			mtd->ecc_stats.failed++;
> -			ret = 0;
>  		} else {
>  			mtd->ecc_stats.corrected += ret;
>  			max_bitflips = max_t(unsigned int, max_bitflips, ret);
>  		}
>  
> +		ret = 0;
>  		ops->retlen += iter.req.datalen;
>  		ops->oobretlen += iter.req.ooblen;
>  	}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
