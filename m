Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A8FC7EE29
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 16:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lThlMxBvlP3urYU+f3uEfJFYX0Kwg0umQJFo7olTLyU=; b=roll7XyWhmVT0k
	8egjn5brLSPgJCpX2HTPDdJStMGAqMRLd306QsNE1sSLZGYfN+UY7ifXmPp5mgwROocTrhDrAWK2y
	Ya3IMicg9zjTfC3evfZkrie2wWjVW7X6+gNa/D/VWvWCAEB7QxDz62RluQ3MIa09JCpSwz1dF2UiV
	0Zs7CexDEkz1Ijk2Yz0DMxKJzgc5A3xzP+SZPqCDLPardRR5hird2GKu74vbRaI3uoY0vsTGWbgUD
	rDRVYbIzGCV7YBlvywifVa8pf1sCPoQewTWn6Gy4s6MQv3LEVe20R5jJOjfQ9q48CgG4Z5sbUgrqP
	l4iQmSjr89++CD+bJRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IXN-009tIn-1n;
	Thu, 08 Jun 2023 16:31:01 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IXI-009tEL-1a;
	Thu, 08 Jun 2023 16:31:00 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5147dce372eso1270101a12.0;
        Thu, 08 Jun 2023 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686241854; x=1688833854;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/+lWdxdyjn98DSIsUOubwz/2jxFFE94HkilpG/MpBg8=;
        b=lnFfQTWL93+gmaq67BRhQvuLlxlzloh39fybowrXPtD+Ttb2I6xa8z0AYOQ6AZQz7P
         3PdYvcE/9ePKM4Qbs1nLAfWrz6xuqYGMI5VjVysieAVPYWU0iu+7pki8NRQb/EzUOGQ9
         CpKARlQMgFXYbManoFWczAg4I8OYbCj3FEJyP9qCczB8rr8W6ZiJZM8z0LFsRjceTfOi
         DVI0l830g+qr9wmvqrtLx97Tw7lTOb6s/VAtHEKwewQBudGog5WE9V2hCPZ5qssX5UxF
         jittVF2oLYZ5OYvVJB1ygq/IKHFIizTZKpKxEu0kEDJ4JKGm+qK9JolleF3AygvlwaWe
         Q6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686241854; x=1688833854;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+lWdxdyjn98DSIsUOubwz/2jxFFE94HkilpG/MpBg8=;
        b=RBx+f+ro9S5NNNW+2+AUdiK5VbbXKsdzdSyNhtloeMN9q0wohig018yhfgvVT3cqBr
         bKts/uocBFTdLoj255Z9tVWu/GTsOlQWbsxLgIuCtozdTcHnl8KKqB0YpNAzmgFki9UO
         Q8bfghaUZGd925jrXxf7KjhiNfVGevZ+gv8qR9e+cXRYXCptjQSH3DUgC5fsdfFtkSKt
         6zuAkMoTH2yJPQDvXD67SCgHuf0OuPI9gdXggyxMPu7gn9VRpR+psmHk0YZXBNGH0s8G
         LqfI3cIwWWkDGkT54qj74151WhDFCNb8RWWYZJX20e3TCYRVGbHx7ajzL/prJpyozjJM
         P9dg==
X-Gm-Message-State: AC+VfDysIhPl6lbEJ2WkFK5JRiQxBu0pVs4FrhJkd2+eeUOz1XL9aTDf
	7PH3ogFHIbWQccxkyD2ON8M=
X-Google-Smtp-Source: ACHHUZ4dAiHZdXniLxJTkgUTGxFZTA34BkWqXauEnC4CDgR/tTjfboJFNTivZhmLJ2Adyf7+kXoPbA==
X-Received: by 2002:a17:906:d550:b0:974:20bd:6e15 with SMTP id cr16-20020a170906d55000b0097420bd6e15mr413482ejc.4.1686241854107;
        Thu, 08 Jun 2023 09:30:54 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id l6-20020a1709065a8600b0097866bc5119sm24920ejq.200.2023.06.08.09.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:30:53 -0700 (PDT)
Message-ID: <9f606cfd-6823-3232-4f96-d0bd70b17211@gmail.com>
Date: Thu, 8 Jun 2023 18:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 4/5] mtd: nand: raw: rockchip-nand-controller: fix oobfree
 offset and description
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
Content-Language: en-US
In-Reply-To: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_093056_550225_5D3328AD 
X-CRM114-Status: GOOD (  15.18  )
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

The MTD framework reserves 1 or 2 bytes for the bad block marker
depending on the bus size. The rockchip-nand-controller driver
currently only supports a 8 bit bus, but reserves standard 2 bytes
for the BBM. The first free OOB byte is therefore OOB2 at offset 2.
Page address(PA) bytes are moved to the last 4 positions before
ECC. Update the description for Linux.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index e39431cfa..cf0fe502f 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -568,9 +568,10 @@ static int rk_nfc_write_page_raw(struct nand_chip *chip, const u8 *buf,
 		 *    BBM  OOB1 OOB2 OOB3 |......|  PA0  PA1  PA2  PA3
 		 *
 		 * The rk_nfc_ooblayout_free() function already has reserved
-		 * these 4 bytes with:
+		 * these 4 bytes together with 2 bytes for BBM
+		 * by reducing it's length:
 		 *
-		 * oob_region->offset = NFC_SYS_DATA_SIZE + 2;
+		 * oob_region->length = rknand->metadata_size - NFC_SYS_DATA_SIZE - 2;
 		 */
 		if (!i)
 			memcpy(rk_nfc_oob_ptr(chip, i),
@@ -947,12 +948,8 @@ static int rk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section)
 		return -ERANGE;

-	/*
-	 * The beginning of the OOB area stores the reserved data for the NFC,
-	 * the size of the reserved data is NFC_SYS_DATA_SIZE bytes.
-	 */
 	oob_region->length = rknand->metadata_size - NFC_SYS_DATA_SIZE - 2;
-	oob_region->offset = NFC_SYS_DATA_SIZE + 2;
+	oob_region->offset = 2;

 	return 0;
 }
--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
