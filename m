Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AD0CCF9FE
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Nov 2025 05:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ps8Pxs4YBD6BGoI5MMfrX9ZhE4Dl8dHxHOZed1P4FXI=; b=Ev427upSdcPyq1
	+G9jIvCrLeRPzcBp/2dinIYtcAXMXAmknrvyNb8Jrf/wrkZ1t63HLEwCZgCCP+ISFBJSSywj/5qV9
	vvFhWU0VayxP3Yl38bJ0xmxFyX+77wk2oMl5k5zAslBC67pScGFxkgyRO+ZaGBjM5btLKpGqieAf9
	EGlnF7fSfiWrrww+gexBPThWXYOtvaLsIRcAAp9aKWrwHIJrdlMc7f5mi++VnqzDQd5rALZUMmm6L
	EWBdpEMrXCkxKCtAktb7BOGIig1qbRbt1qGKxoNU/gbapXKYqBEphN4k77Y6RYnSfZIMedgbhJSeW
	pMOIOlXUwRStqEBTiy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFnCu-00000009Ej8-1zAn;
	Mon, 03 Nov 2025 05:34:20 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFnCr-00000009Eik-03LD
	for linux-mtd@lists.infradead.org;
	Mon, 03 Nov 2025 05:34:18 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7abe8442103so91029b3a.1
        for <linux-mtd@lists.infradead.org>; Sun, 02 Nov 2025 21:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762148056; x=1762752856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tl+1ME660P0RrPzwjGoxlP43t1wlN8lONhAe7XdLRx4=;
        b=c6lxDahDQ6uH5x7m1Aop2fDz2ZxO9DuIG6TD6Hi2dBgVv5iS0NLo7VqFoGs97lTtL+
         x2O6Mf/oqc10WpyRJr6dyUhrAYpci+cp1Fo/y2UPySIbsWWR7gjci/1sCZ7qIpqK4sRX
         KigFci0T3vaGftN/9SuAgwAQygCJQquRMF49oe5FP/5PZTydMJerS9iLUbfQZb0Jn55f
         VXyYDQRsfufR4tgBzNyc+QXgIgr5fRwhNkBBnlctO4Ink6rMkrkLqJ6I+awOcAR6x8R8
         l/K9k/Yl4JNeCNvqiBKOJ4RbSFleabcLt8EqfyrabTkXIk/yjCvhqitvazZIUcRL0H49
         rbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762148056; x=1762752856;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tl+1ME660P0RrPzwjGoxlP43t1wlN8lONhAe7XdLRx4=;
        b=YqWsmWd9iwM2bqeZKZ3aoFQcl/skI7+ZD+0NViuCwZk0JFFRo5jsUYt4K23uTGXYHo
         Ea73hpRMCmc7r5+zyk/wB8OcTL5+Qw0MihT5kUNHDmbeE9HHqYU9oqIsScmxjroLP8Ft
         zNFjS7ljjAtc+gmopych84S9tAIDwLg1adKDitLHLtr++Ni1BCedfcSWHz+cDd15SxGW
         +BfmPx9zUrAEwSFvYuF4wM7d6cqpkYeqJdTBWc++QnUoxkG4TQt3g4czC0ukAz+KiVlD
         FIx4javN3Zun4F54D/vUdF2tp52iZQ6KDTw0yaDj6CE/Ip2JNPNRjG2ie5T/fEb5hsGj
         NN+A==
X-Forwarded-Encrypted: i=1; AJvYcCWajN0nEOSQK2TOfw+RQx6Hi7BcqBaLMEsFDRNeZs6BfQ9NfvbySWTAVDHW+/Gg3Ci+M/KYnrlyB+4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwM0EHKUoRxCvUI7iu5XxzL3LINaVcZCiMREFKcTvhTmOKrX2HO
	Ocl810eWuQ0JGO/eH8pLyuDvW6QqoeFUDFgEVc340+8ENFqvOyFURrYS
X-Gm-Gg: ASbGncs5Jr+4oB5uE9rqsrvxh0pUCK/pDhgjWYFnpoHKUMz2F0I8jed0WRxPcpO67zL
	KeHCIXQ2H4hjrHD4kqgokDjl2SwdIieaKXmlXcTL89iNbSrtbIac1dcZhScGGl5V4yMNHWQLSqR
	9CAsgT0HV8rNlcmwgik1XwAuLozGCK6xbEbHgQiK6EyfbQ9E2fL39ePVoX2tIpMYbY/qsBJUeup
	qxmke5lKBlPQEo1Z5ttsBcF+Di9ASoPuKzs3cdJoFnLXbkqxXbHWhoAzD9KAE957B0Sb6uJwJ16
	Q/FO6I5/pw4yMNMZLM3Pr/UovN83DWVm3JzI9315/N6IbRLxVQJaI7UAtoMx3A0Y/RF/84iXCqH
	nxrHJiDCpwTPkMrpUWiNgqxXcnApELqM9nh6ts3fy8TqIosdYFoAEMI7EIdlt3w==
X-Google-Smtp-Source: AGHT+IHD2dAZfADdDFXllu/HFA49Sven+QJ7TUxa4MZZ4UV56hgv8yVqQeRNFjhgd9N3dIxrk8DDxA==
X-Received: by 2002:a05:6a20:6a09:b0:33f:df99:11d5 with SMTP id adf61e73a8af0-348ca463b62mr15746310637.13.1762148055244;
        Sun, 02 Nov 2025 21:34:15 -0800 (PST)
Received: from ehlo.thunderbird.net ([2001:df0:a640:1::14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8aa3ef0sm8969044a12.11.2025.11.02.21.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 21:34:14 -0800 (PST)
Date: Mon, 03 Nov 2025 13:34:13 +0800
From: Tianling Shen <cnsztl@gmail.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
CC: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: fmsh: remove QE bit for FM25S01A flash
User-Agent: Thunderbird for Android
In-Reply-To: <20251103010148.3855648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251103010148.3855648-1-mikhail.kshevetskiy@iopsys.eu>
Message-ID: <4A71A9B2-6886-4250-A285-EDCA81242836@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_213417_078798_405BBAA4 
X-CRM114-Status: GOOD (  11.19  )
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

Hi Mikhail,

On November 3, 2025 9:01:48 AM GMT+08:00, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu> wrote:
>According to datasheet (http://eng.fmsh.com/nvm/FM25S01A_ds_eng.pdf)
>there is no QE (Quad Enable) bit for FM25S01A flash, so remove it.

Thank you so much for the fix!

>
>Fixes: 5f284dc15ca86 ("mtd: spinand: add support for FudanMicro FM25S01A")
>Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Tested-by: Tianling Shen <cnsztl@gmail.com>

Thanks,
Tianling.

>---
> drivers/mtd/nand/spi/fmsh.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
>index 8b2097bfc771..c2b9a8c113cb 100644
>--- a/drivers/mtd/nand/spi/fmsh.c
>+++ b/drivers/mtd/nand/spi/fmsh.c
>@@ -58,7 +58,7 @@ static const struct spinand_info fmsh_spinand_table[] = {
> 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> 					      &write_cache_variants,
> 					      &update_cache_variants),
>-		     SPINAND_HAS_QE_BIT,
>+		     0,
> 		     SPINAND_ECCINFO(&fm25s01a_ooblayout, NULL)),
> };
> 
>-- 
>2.51.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
