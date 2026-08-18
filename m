Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A54DC5DF7F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 02:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r9wyRK7QajPsc7Fb/n2iIQrd5b8ueiTXUEBADupHmHU=; b=uBmcUMlhMs8OdM
	pKy4TxWxnVVaTH5iWGs/qJkcxvT4GK02Fw1c5qtoJ94kMIHpeiE/bM0loOMs3SmNAF0lrJy+fvXRs
	stpFwskcabdky9QH3gLU5Iwc4a2UfWidkOCURgjIFLrHSriTcwNufH5mvIP6dyYsvAXBcPjPpxGUp
	SwW8gAd14E3jLWbcZucqXVurn6LZLPkhxPn8jzVN6xjKRsOUapXb7tYDb35S2adZBFOt+NH1NoKBl
	IV+gI7QSp16dXMF779P0rFfFa0sAb4fzLGL6p42IV0gB7IiwITh17Tj3UF7VDj+g8xeiqbCtMJaLV
	EfSjihKKvJys7UhdOjgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9HR-000000075I5-3WXG;
	Tue, 18 Aug 2026 02:10:21 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9HN-000000075H2-1TYs
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 02:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1787019013;
	bh=cA9WlMYoxFTZK4iF8Acv03xZwGQZkOeymCDFeNB9gRI=;
	h=From:Subject:Date:To:Cc:From;
	b=s4nibJhyforM80XUBFegshhkex7nQijmPAj+zyBCpQGTMFDY+nuTDhaE+tYGlV+Ay
	 PypuJVKDd2kGDOlcYfzb77rKkyWiHHp5pmg8Vsm/iAW8IqC+QFglsy5XQXt9Ft25jM
	 ahLDUNjdMgAUX/Uwg9PyGPIUR6b7yISdMiJUgnAKO6vzavVczFOsEFI6sO3kwtzCts
	 QdhWEBWFusv3ONe8b+/CfAYoF1ibvVhhuM6wQuU3E9whUQR2JLnGXWEfkiSxxSw3R1
	 e1vpkkfRVnfLDCsXiJKA+9hx1ReXYHYtqr3oRtzQLD7/JBpPXps88VeqSSq0pVCMzC
	 DKpz0RfRHNq0g==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id BE218836
	for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 11:10:13 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=GhC5NzUL;
	dkim-atps=neutral
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id A47B4836
	for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 11:10:12 +0900 (JST)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84eee2147ffso5121391b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2026 19:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1787019011; x=1787623811; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kkzuUIkcjhrbl+NLRbOh+awbahBdDgYrrv/qyvkX3fg=;
        b=GhC5NzUL2eGNNS/7xmgZ9F5J53wRo+dnwl8PxFnY0agp8IbmeWpgFWbptWvalVCstU
         5hXhhkYGD/N5Mv3YirmA2AjSd70i9aHPr3fjdFknsAPmQ1avimXfbdE6bHIm/UDnBH/t
         fTP+Ja+jA896E0WD6hpJWudwnyq4hBU74M76BSm+ltkOKIGDkCP1bl7SZi9JMoqO1tu3
         D/X0Q0u5pOUVfnHbVGwkFGcdjWOUhFAbe2nCW8heRBrovhYYkxRnZ++GYn15RcTgE/WB
         D7wDWEYMm3n9668A5urG6Sj3U6aaOBtQvOG33r0jX+SHaSF0+SZFkYbgErxwcYYl2hps
         6/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787019011; x=1787623811;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kkzuUIkcjhrbl+NLRbOh+awbahBdDgYrrv/qyvkX3fg=;
        b=K+ZdnloABfc2eUQirW1u41HaIF7+/y8VxCQlToTMqXkFaDxIDGIBSDpHvsXSFFSVM/
         JISOIdH6piRUxBVFCxFOnl5RxuycqvGnskIBm6LefIuyNYZ4C5RtGEMr9AbeaR89nAaq
         1Rxr+rPhDUP0+FbBIUlTxg10Ujab3/WzmcOVmBa9CdMFkH9ObdSacd/sdLmJu941HtXw
         LswuL0RNFGCgPH0L6z6fb/ZE9FGoqEAeZE0EBD6mH1G9kWLGIWplTRW6bdtzzbj6NyBD
         y+11ZQf9rDH78n8NxkldfwW2hsXUAe/tYdFlbOMd2zUoGeRu9KwX1Q34Zs/idSuTLHNq
         xZRA==
X-Forwarded-Encrypted: i=1; AHgh+RodU0ghjS6zazwvs9mYY6FFUx1ftY6yi1FBcfOg32kRuw1APFQ5W5Yj4/w1z4tyC1QNU15KTaGDbEU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsTp+jl6pNqkzMlmUh85hylEJqAHc8OwZulZ1pDOsOd7mlEcC1
	6m0GRRx3RzF1M2EgWGZoHavP2/zAXFHnmyeNtVPuWRaiymjGuLWj+C4kABWGMzcmIsk+OaYkAgt
	N65t8UDcJGuBGUGXILIL4buObgE9N8Mbyd1660bW5V/CUmQZAy8yghenD7bNRtfb1fsFT
X-Gm-Gg: AR+sD12vq9oYK6kz2NJ8fZaUS+koWYQ0NixRkhtk9GPjWRQASOa5jbUqpdSQNob6Y68
	Q/mrQz/Nsn1e7xrmzGkt1h1DqGFUQbZmotqpE+NsP1qHhRHa3CxvVN2DqYtnUqWdfsCt1viC2qS
	KzvxZZa4RXRWQyzWueYkntVMWL1zxPQ4plLIqninpBs0xuvixManJQFkMOsJqbFB/4zkCYF2xBh
	wHPdUczJuFEyxUeRwJd5oSe4DiZBSlfy8unCRqZ6FvcqHALmEp/c0oknLBhk3J02a0jsHx4SAXY
	Nd9RDTZc80+ybEc+wRkPbGRlIiOPFFK+CR/ti7e3y/RICgoR8W7Glfzi7upKdr/+ptsgvmNrYri
	L2IU7lNv0XIYVrr76ojTKddkRtc8BBO8O+tFQUuhiAkaPoE8f
X-Received: by 2002:a05:6a00:c94:b0:845:dde9:ab62 with SMTP id d2e1a72fcca58-84fde2e8fb0mr29085195b3a.19.1787019011518;
        Mon, 17 Aug 2026 19:10:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:c94:b0:845:dde9:ab62 with SMTP id d2e1a72fcca58-84fde2e8fb0mr29085143b3a.19.1787019011034;
        Mon, 17 Aug 2026 19:10:11 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-851b404f349sm1175062b3a.24.2026.08.17.19.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:10:10 -0700 (PDT)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: [PATCH 0/2] Backport fixes for UBI
Date: Tue, 18 Aug 2026 02:09:33 +0000
Message-Id: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN6+g2oC/yWMwQqDMBAFf0XeuRETaJT+SunBZNe6CipZlRbx3
 5u2x2GYOaCchBW34kDiXVTmKYO9FIh9Oz3ZCGWGq5yvGtuYLYgJbRyXOa1qXHel2hNTYEJulsS
 dvH6/O3ZfWle+8fgL3cLAcf3ecJ4flDnwzHoAAAA=
X-Change-ID: 20260818-ubi-backports-2f5d76dedbed
To: stable@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, 
 Liyuan Pang <pangliyuan1@huawei.com>
X-Mailer: b4 0.16-dev-a9e92
X-Developer-Signature: v=1; a=openpgp-sha256; l=879;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=cA9WlMYoxFTZK4iF8Acv03xZwGQZkOeymCDFeNB9gRI=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBqg78AdXyHPIvw96F/8CArO9a8ZxlKEIfjDxv87
 8V3HsusQ4mJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCaoO/AAAKCRDyimB/1oxx
 B4NDD/0SRC5VCr0hPJCtUU8ccD5oT57yYjDX+m7VCGw4GmpEseeDC66N82/iM1yNI8AAL5wFhAm
 03qWXI6wMKxmi6zHyV6rhOZ9kst2ZxwU3mCzEdy/3oDQrKD5j9UAO5OMpW5e3GnY3h32Uh88z62
 8mHmloTWQgY/pt+VQRkRuVLhwBq5kRjKUkEc+XpDjDFrpyg8q5/gbD3hbbp7UzqaoR3DGVsFhEG
 +IJvi6Bqi+hH2uuRe8vTuQ9qdX1nC2XwD/I5N87cekN5jZFIwwjXJNzqHJ3QHGqr2zyKdSuG+VW
 yKcO6ovhkkS4Sa5UmqrfVm1lgFIsffqZsHGEaDtCEb74yjOBDQaqfBWeSYyU8JiEFGTAEbQVz/5
 AHVmYdy4uMD/8+XIV0LP82Dxtgc9MCpt2Sm8763e+kS5Ldz9Tu44FkAzLbheenTR5V4cKnQ/gwo
 Zs9XexEUxrkHHSs5xA+DetRK1R+oQZjTJdtU2w0czlLCQPM5NkJWG/OQ9lgXpkphq/sOAfM7hpm
 b/jFuBYaW4PBCcKEZXSWsk7pxMivIzdPZC/YWTEeOg0TEyE5DfSpfWMrkihR8gMbJeNrvKbRQ2j
 +Swibt82y2bew4cjADQH/9Ynh3cNbFpKTA+CDsUsFPE6tl5By68WVQrVSqVICEJyadzTsJgtmap
 FSH/1NsTVCbFtxQ==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_191017_626986_BF3C2EA4 
X-CRM114-Status: GOOD (  10.39  )
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

While looking at recent UBI patches I found these two commits that I
believe are worth backporting.

We're not using fastmap so I don't care much about the leak there, but
reducing wear is always good to take

Thanks!

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
Cheng Ming Lin (1):
      mtd: ubi: skip programming unused bits in ubi headers

Liyuan Pang (1):
      ubi: fastmap: fix ubi->fm memory leak

 drivers/mtd/ubi/attach.c     |  4 +++-
 drivers/mtd/ubi/fastmap-wl.c |  8 +-------
 drivers/mtd/ubi/io.c         | 10 ++++++++++
 drivers/mtd/ubi/ubi.h        | 12 ++++++++++++
 4 files changed, 26 insertions(+), 8 deletions(-)
---
base-commit: 98c5a5b9f23ede08be1dcd8be0a13b32fbe2b462
change-id: 20260818-ubi-backports-2f5d76dedbed

Best regards,
--  
Dominique Martinet <dominique.martinet@atmark-techno.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
