Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0AAC433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:55:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3406664F6B
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3406664F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1rcb8AJq7UfJwxHCJaD5xTcRZkdnYZ60mFbiPTvQvog=; b=ijLUc5T6w4hSvpZrWtr3vP4gn
	CKmM9Wzcq6Ah7mx/nb4IiHFIp/WaW62s4DB6NPtQwI+tC1qklhFaXx/0nWgEKCX9dFNth3qCbSTPg
	qDxUCfEcLEi/zXH9GaL/Yoj3H45XPFQcGuRTmW6xTEdfv/iCFVa4UkOTQYsDyik2YuxorRFNNUZ7m
	gz2uIdmOR6gJOjV++ua/rRjr2kfRYELRzMUpqBp6p/LICFoWgYlIqkC/VlavTgrvjSxaYlki39Vo0
	ZT0CmoxiZWWa5mgFoKtQokL4LnVEBTAuXJcGrmjJSByYdNJaGFUXRILtLq7Clf+Z2KZ3hTHGzKatx
	cyLHkOIIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN92D-006jfl-8l; Fri, 19 Mar 2021 06:55:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN928-006jev-GC
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 06:54:58 +0000
Received: by mail-pf1-x42f.google.com with SMTP id y200so5215736pfb.5
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FjJFKSBNtgpb7z1WJLLhkY281cgaWBDGouXCklMUp9Y=;
 b=g2OF1YOc4d/iypX3B3xhBWyg3Tf5KRGtzl1l8JP57aJRa9oq6uCpx+CkImrXDN2lFa
 r/2Q9XHMYzbDrESJ/sjO0ffBLXyR+PDaADVRPWlMHmBTRt5HpavAIw45ju6n3qv0McGm
 1dTx8Y360WIOJijmKYd3gCvAbnzMHFhJbafaoF1EtM1emi1n9MCB+PaCrMeR4nKvhPAn
 U8qcKxNS66k0MyG5oR20hNpK0l60lq7gnPezv4fyLbaysK7M9weUQYwP3uU5eZ7YSg71
 3Ti95v3MX+K8q8qEI7d9QarKAqje6J5zP4AnNyFiPxstCEd2GgW4/WWwbhdGa56KYWFt
 nUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjJFKSBNtgpb7z1WJLLhkY281cgaWBDGouXCklMUp9Y=;
 b=JOjxiwbncYsyw/dvdR8Ebz32kDuvt6ZozRXxAfRdFyRgATr1nW8E9OQiEF20pG2fM/
 gtn5zK1bfJzPZTs2TW+jigPv84yO5VBQEqckArHybEUfkJ/3vbVWmn2NPX7nEKZzeaAc
 iEbYKHsrLNWR+3Wn2miPxv48IlKupx76ASigyMd7qcJjpurrQPwsWbu51setYjaAo+ZY
 nndacowfNBgNnEgUsvd74MsYY7/uiom4XMjJcHmimX0mMh0huVtk4v9nuEESg7IykQos
 qXG9Yi2BAGzElYEi83lM5o1L4cBqHEk2pHIA//MZA1ZkihLFgFjovfbT24RmAiQrYzHf
 PcOQ==
X-Gm-Message-State: AOAM533Se5ecG/pWGfOVRpnfCiCnyKNbA8+UTw1UfNnTthSff671MMRC
 w3K9Oh8KD90U3IsvSBBRfWxRu7GW1f31SQ==
X-Google-Smtp-Source: ABdhPJzTtEdLxRNmE9LRzoMxjG2WTQWuR/y3mGmTdCBJWDqNiwW3NoToYM9eufUj+OvNuhAv2rwStg==
X-Received: by 2002:a62:dd89:0:b029:1fd:d370:7a5e with SMTP id
 w131-20020a62dd890000b02901fdd3707a5emr7863843pff.61.1616136894896; 
 Thu, 18 Mar 2021 23:54:54 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id fa21sm4490145pjb.41.2021.03.18.23.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 23:54:54 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Yaliang.Wang@windriver.com,
 tkuw584924@gmail.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 2/6] mtd: spi-nor: core: Expose spi_nor_clear_sr() to
 manufacturer drivers
Date: Fri, 19 Mar 2021 15:54:39 +0900
Message-Id: <791ae06b79cf0229e3dea332f2b0b136c229ec4a.1616130675.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_065456_824156_A532584D 
X-CRM114-Status: GOOD (  11.80  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

spi_nor_clear_sr() needs to be called from manufacturer drivers that
implement the ->ready().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
Changes in v4:
  - No change
  
Changes in v3:
  - New in v3

 drivers/mtd/spi-nor/core.c | 2 +-
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5de72322ae32..7ab0225473e1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -653,7 +653,7 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
  * spi_nor_clear_sr() - Clear the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  */
-static void spi_nor_clear_sr(struct spi_nor *nor)
+void spi_nor_clear_sr(struct spi_nor *nor)
 {
 	int ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4d06c27630fe..596480aef924 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -447,6 +447,7 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
 
+void spi_nor_clear_sr(struct spi_nor *nor);
 int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
