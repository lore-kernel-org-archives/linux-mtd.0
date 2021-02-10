Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB91C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 08:59:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AC7564E42
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 08:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AC7564E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sh8Y8YYMkPWDFiuSmUkufTFT/vGAhSZ9nuuqwhb8Nxk=; b=qDE3Q+BNQNbDdbL6qq4BlIuOK
	gJ8yA4Lk1QY5MTNAdjlMXGneXVBcBvWJYLm8f4MER1VtRSjLhHhTXbsQ2QSY6k5fgSdx/91vnT5YU
	o9AeUbgUWMYKMv9H/8Z1jMeZdj7ArX93TGZT6uiMy5Mfu4s6oXqu9fXBps4G9K9xMIa0edJG0Yg+g
	2VWOtuXo5P4UYG92jrh57TUtiAoWEF+xPiW7PeH3E8+mF9bhyoE55JWTy5kzmapjbzER2pZ3rW5+S
	lVsihxy8Nyy8IjSZPjHQPFHRibiF8Tf4EtZBtZDm66YswaMI0CM1WkbIUPfsVoeq0b6MtXFBU131p
	iUL8Dzl0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9lKV-0000DZ-Qf; Wed, 10 Feb 2021 08:58:35 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9lKR-0000Ci-LG
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 08:58:33 +0000
Received: by mail-pj1-x102b.google.com with SMTP id l18so763234pji.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2021 00:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=14cbO29LuktGiYaDXOwJMmB+J2xlnJQtq+WESBAPEX8=;
 b=aLrLlunIXBW4l/SEpI0298+gRoeV8AZtghYW1QkIuJ/V+OG24lrpSEdjVi5qZudQz5
 gjpLHfTyC4a/j6yMuIOPU0TGDotDs2vX/7glIKdahctRamp9fhH3D0vBOWwifzoseHkb
 5nhG/KA79EYz1U/3eaOuEnUCZkaiQJubBkisI11f2IoTpiK1o/jlKOfr0pcZVap6kr2f
 /ub3LS9W+YD9xApR+1fIzbcxP65k0vd31KQLASWvtFdjDwxBu0nwpCBTx6aKuHfKHDJS
 KzrydVZWCite0l/IgeG6yVmI6RJrVawWnCXiqAGfHcUAKPx374iSzPjWJTMcsaYQoeZd
 XPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=14cbO29LuktGiYaDXOwJMmB+J2xlnJQtq+WESBAPEX8=;
 b=Eg3WWDlr67YlP2lja1og2wQDJB4ZmEAyAldLo8/NjoA6AAecogml19moqNxYDWt1Jd
 tVO2SqYlcFNyutou5rTzW7pZ7FyVe2m67jy0L3AnBdJRgFxVs7Piiew9QeRYKXXW4oLG
 Dn37gC3sfRLZc3LVYkX4MNS3yMFzJzcIECEdz92V6K+rZUf/5CPtEC0XheIXNMW8zT9u
 /UKpjl3LRDFL1aHiYRthk1cZVSBo9oAgypfeqrEpDpX9aULMavQSlZi5++52H8QvhNZm
 Psp86hlzzeXVKR2nNcGSHEBpZBRMFsixnykHQcw1NGDHyqkpx0XMRlDxxaJ93LPVAM2v
 naCQ==
X-Gm-Message-State: AOAM530hER741ARFScO1uNxOIY5qHOiR1k+KSfUSgq5i+DigmWWE6VPu
 Uih1LevkFA0NaaBRFecQerde
X-Google-Smtp-Source: ABdhPJyZPCjK0q7RrLm0H6OU6gbb8dvQSi/mrS4BL38zEe9km08JQh8tcG6lMD1xsBNfqDppLjDbMQ==
X-Received: by 2002:a17:902:9b90:b029:e0:6c0:df4f with SMTP id
 y16-20020a1709029b90b02900e006c0df4fmr2075706plp.60.1612947509380; 
 Wed, 10 Feb 2021 00:58:29 -0800 (PST)
Received: from work ([103.66.79.29])
 by smtp.gmail.com with ESMTPSA id k13sm1420146pfg.146.2021.02.10.00.58.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 00:58:28 -0800 (PST)
Date: Wed, 10 Feb 2021 14:28:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: Update register macro name for 0x2c
 offset
Message-ID: <20210210085824.GD19226@work>
References: <1612037236-7954-1-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612037236-7954-1-git-send-email-mdalam@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_035831_888201_8E10CAE5 
X-CRM114-Status: GOOD (  17.76  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, sricharan@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jan 31, 2021 at 01:37:16AM +0530, Md Sadre Alam wrote:
> This change will remove unused register name macro NAND_DEV1_ECC_CFG.
> Since this register was only available in QPIC version 1.4.20 ipq40xx
> and it was not used. In QPIC version 1.5 on wards this register got
> removed.In QPIC version 2.0 0x2c offset is updated with register
> NAND_AUTO_STATUS_EN So adding this register macro NAND_AUTO_STATUS_EN
> with offset 0x2c.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
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
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
