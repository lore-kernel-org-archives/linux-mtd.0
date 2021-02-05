Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8354AC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 17:57:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D25E64E0A
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 17:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D25E64E0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SGiwC+mQgCj4jZEBkOqNs0Il8gywAh3S3RS4WkFkPxo=; b=OtnVACSL0nVo5oUer82cnY/oc
	qWkta785pqSzsQTuc61OFlkiqf/kMJGyosWxMplVj0deRVBCYUnwl+f33/sN1ZQFjpVjlmMpTd/rW
	t47pfTWTCvakteiVxucgTd7tatl7/IXoB025oPYj+oW/S8VuOB4Y/uAdukfCE0N8jxpuXDJvbFqDP
	HqIUO3iOpz/jWJ98r3ZZyp0ydagwq14lFSMRykjkn0swOI+3bI7BLpxUbZ+jbdKncT1W2ORBPrHrM
	E0xEnz0HbdPvyS0OxaiYIDuYzeTwchx+AtoR0IqfNCmB+LZ7ahLtgrXtlbe9xPEaNfxqIRBL2Ad1W
	JQ018pF0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l85LR-00016n-SJ; Fri, 05 Feb 2021 17:56:37 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l85LP-00015u-3O
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 17:56:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612547794; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yjcgfI0QYGg6Rxk3COL/nMdKpQeHfQgSqPtTICgLZeo=;
 b=EBHo4wA1hx+tAuw5IH7fCYMLCgqtGzZw4bnK12+JS2vQ5Fzu8TbBZisLIdn6OFvvUrZxaYn1
 1j0Win8eOOmJjfwNoj9vHVmeHTt1FGTw2oNs73B+UnTvDpy3Z0qw+H7BsFkMw0u2NGz/xDLd
 U6hFjfKs82Bx95YA8SC2u+ODqFc=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 601d86d2f112b7872cb50b3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Feb 2021 17:56:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 25145C43468; Fri,  5 Feb 2021 17:56:34 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44975C43461;
 Fri,  5 Feb 2021 17:56:33 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 05 Feb 2021 23:26:33 +0530
From: mdalam@codeaurora.org
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 boris.brezillon@collabora.com, manivannan.sadhasivam@linaro.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Update register macro name for 0x2c
 offset
In-Reply-To: <1612037236-7954-1-git-send-email-mdalam@codeaurora.org>
References: <1612037236-7954-1-git-send-email-mdalam@codeaurora.org>
Message-ID: <7ca35f62c4d3ba7833e192cab3a2701d@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_125635_345433_A45EFA19 
X-CRM114-Status: GOOD (  17.12  )
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
Cc: sricharan@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2021-01-31 01:37, Md Sadre Alam wrote:
> This change will remove unused register name macro NAND_DEV1_ECC_CFG.
> Since this register was only available in QPIC version 1.4.20 ipq40xx
> and it was not used. In QPIC version 1.5 on wards this register got
> removed.In QPIC version 2.0 0x2c offset is updated with register
> NAND_AUTO_STATUS_EN So adding this register macro NAND_AUTO_STATUS_EN
> with offset 0x2c.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

   Ping! Is any additional info needed for this patch ?

> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c
> b/drivers/mtd/nand/raw/qcom_nandc.c
> index 9484be8..c238a35 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -27,7 +27,7 @@
>  #define	NAND_DEV0_CFG0			0x20
>  #define	NAND_DEV0_CFG1			0x24
>  #define	NAND_DEV0_ECC_CFG		0x28
> -#define	NAND_DEV1_ECC_CFG		0x2c
> +#define	NAND_AUTO_STATUS_EN		0x2c
>  #define	NAND_DEV1_CFG0			0x30
>  #define	NAND_DEV1_CFG1			0x34
>  #define	NAND_READ_ID			0x40

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
