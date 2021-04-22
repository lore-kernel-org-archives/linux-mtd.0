Return-Path: <SRS0=7f2K=JT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9C7C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Apr 2021 04:22:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AA366054E
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Apr 2021 04:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AA366054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NDPv+5QXE/CrYEvQeYM0EkIkRcetbv5C6T3In3v2vP8=; b=VeGjC4BYeGcz700uIsdbK7UYE
	ax8bAn2JPzdKygEWz/lS5DI4LRAsKlaWYJ4dmJWZ2/yZkmlwxecng7cFO/teqILL/YN/24Q12Szn2
	3aL9X9/cE+7sOj58T5VHnZb9C9wz0wP7XeTQwc/orwHcssUstaHsPxBRsR8fi7QEyHEsRH5Xq3QJU
	GOtr5Qf42DaXVsU7gcqNRnDoN4Xj/KEoZ4sW8JBkIdBJDRuh1J+gHYoLKIEuo+2QB/9bvtD+OfNVr
	3wUTwx/ncilBvm0bfe2CY1jpCaVhgn8t8YxxHfhUDhuqx3u4kwRH6IPiL5ql6ecGkm1vP8wBwLdPi
	ksthXNKPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQqO-00FpHs-Q4; Thu, 22 Apr 2021 04:21:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQqM-00FpHR-Lj
 for linux-mtd@desiato.infradead.org; Thu, 22 Apr 2021 04:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=E0i26DAmV3ldAArVs/maIm8EXodb/kDs7uJ+CS5q4h0=; b=bPwN2Rt947tfiSplJrhU13WsE8
 V2vI/imXSvx6mtkH7df7/HeYBiPw7WBJkdaLzIu+oqLDXYdXjqc/AxF972l6LLDc+snwXjpjS0MI6
 Yeb5SlLnWFWqBH9ZKsY04C6oKqoCd9PoFINLdK8vn2km7Xt6fE9aIHZwmj94VStBveZV23awcdSyR
 K+p2UUNsYI0Xbl/Z/Zy1eCrNmEYJ55nfTtbQCZj5JXjBTEYBYtr4z644ohNrMjM73BpBqqIj1OJV5
 o4KeJwp2YleKJM0R1+6LeQUjK2n2wsoJoWO9Uix6ldbcMSIgAZdmGNCQ3Ut7xfxnlU/HpqXrxcLYZ
 lF1fYNXA==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQqJ-00DMNc-QX
 for linux-mtd@lists.infradead.org; Thu, 22 Apr 2021 04:21:33 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so253383pjv.1
 for <linux-mtd@lists.infradead.org>; Wed, 21 Apr 2021 21:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E0i26DAmV3ldAArVs/maIm8EXodb/kDs7uJ+CS5q4h0=;
 b=OIu46RXUgOGhWNTRts4uxgAgnCcOoP2lUaXA50qwIa44/aG4+aBcSvZAi0FuhAzXsW
 5qwaKPkJwccxUg4HjD2d7Dw5dm2EtQIwxzg2JzPTxE96M7/s+PENgilVjBie4xzdKyh+
 ku3B3KO1koHfLXJ5fm+DiP1dmGL9d6rT/H98OSh5691PcvpcDY7h8du+W9uuvuSbtk0W
 LqcamT1EX1j3RHomFxM2CwbC7WpZStJC8FUUqQAkggvXPqDeKNtSwGxJEoe8ALYjYE0C
 cSvDcq9VFsa8DF78KSQLJxJ4UFNkGXdXni6RuClcqIwWznjBFu0Al4kjehdIhqWykkpv
 tMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E0i26DAmV3ldAArVs/maIm8EXodb/kDs7uJ+CS5q4h0=;
 b=ay8QDkolrN1teNoJ5s7PwpF5gqRct6auPYD8Z/n9XahvfXnEx6zAWTrqt1/Q7tpKnH
 J0wDYCdwTGShdKdcJRnzlQdT7mNDdta71fI8O9iL/81uLZvE1p/pTC90k/vWIN8ROEnc
 PrHWhicxiVOPGiRoLKuUWoiD2fA+RR5oZ7Brkdvrw2JpPRDHgmB0DFDBfjChzztonQfT
 +ADdaqJPfYBYOW5kcph/Amr2Oe6B73oIjlx04Sl0KTmOXo8NoLWKg//HBi90ZYR7Icz1
 2iLzIaN69ctgVPjtRzomB2QvnmTDUObKhXsc6u8Ks7IFQ1wSyV4YOq8W5Q8d3lWzBO+a
 NsvA==
X-Gm-Message-State: AOAM533/BVAZyQwRznYotpA7Ea3cBWMPxc8bRllbqfHMMS+AoS9rdbN0
 860VwzGMZIX9ZCBfduU9C2UTCubJlMIa
X-Google-Smtp-Source: ABdhPJx7WMl21+a0hR34L1XYW6Jynv6DAbVHE6WxUMK9nP1hLbu3asodDP/LxbQcqlHfMcKZBfP6kQ==
X-Received: by 2002:a17:90b:388a:: with SMTP id
 mu10mr14590314pjb.203.1619065290159; 
 Wed, 21 Apr 2021 21:21:30 -0700 (PDT)
Received: from work ([103.77.37.174])
 by smtp.gmail.com with ESMTPSA id q3sm754262pgb.80.2021.04.21.21.21.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Apr 2021 21:21:29 -0700 (PDT)
Date: Thu, 22 Apr 2021 09:51:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baruch Siach <baruch@tkos.co.il>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: qcom_nandc: allow override of partition parser
Message-ID: <20210422042126.GA14470@work>
References: <cf470f05af514acd5bd94548804ffa96b966a0a8.1619029869.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf470f05af514acd5bd94548804ffa96b966a0a8.1619029869.git.baruch@tkos.co.il>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_212131_917294_B2EBA7A4 
X-CRM114-Status: GOOD (  18.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 21, 2021 at 09:31:09PM +0300, Baruch Siach wrote:
> Commit 82bfd11f1b03 ("mtd: rawnand: qcom: Add support for Qcom SMEM
> parser") made qcomsmem the only parser for qcom_nandc partitions. This
> might be problematic for systems with both SPI and NAND MTD devices.
> When booting from SPI flash the partition table should not apply to the
> NAND flash.
> 
> Prepend cmdlinepart and ofpart parsers to allow override of the
> partition parser.
> 
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index fd4c318b520f..30cc85a32cd7 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2821,7 +2821,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
>  	return 0;
>  }
>  
> -static const char * const probes[] = { "qcomsmem", NULL };
> +static const char * const probes[] = { "cmdlinepart", "ofpart", "qcomsmem", NULL };
>  
>  static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
>  					    struct qcom_nand_host *host,
> -- 
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
