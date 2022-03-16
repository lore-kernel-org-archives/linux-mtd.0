Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E86DC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ka71AbaCMGC044Fba1bs9Ynowmm5+Z2te7JEZ4rYQU=; b=fPSjlWGXIlmSQ8
	ShDc8AHPVGZH7uZBkwNq3FWHa54Y9ucdHJL24nnL4eNHBOh8Hc+HQbeKfTcP95VvQF8lT74raz+ih
	ynRzHpTHBx5G2q1sU975y5IwqtJYJxwiSpEzUwX2ZdJW8tBZ6BtlOKw8TYva+pAG0bMtBagb+uPyU
	vs290A7FfVH/SJjkIX/6IBy4+a+cxp3ac7Aa6Wr/+PPrOU+XM8e7udgej8vdLSQEZFQNsmGylwhX9
	6Sw+DMV7jMj6lb27FqMMv84dWyHQSIHYn5N9FRjR7g3yGNL+MqQc9Ziq0sPkUjILmX+CoW3l8sEzY
	Z7kKw0jbF6DdMSqYx5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUW05-00Df4l-ET; Wed, 16 Mar 2022 15:55:49 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVzb-00Deub-MA
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 15:55:21 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 q1-20020a17090a4f8100b001c6575ae105so1960291pjh.0
 for <linux-mtd@lists.infradead.org>; Wed, 16 Mar 2022 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hf4eUjJPl39bYBB18Mdop1GNf8QxiXiipbWV7+E28HA=;
 b=PMTVZh9Aza57CeoU/n1lzylHby6Qw82CRt7Cn2HCKrFnogz/JXHYXGCfl123KaLJ8k
 L4pvT5575L2VhKuyBGcTA8xmT+H/gktAIDhfhdQ8f2HLyenCy3TNa4dI+fXjn9PkxzMW
 YmA9w17a7+TX1E4Z2awJkkxPNlTrpVg6It2CaDe2jqubX0qifyEatVGmHeRFnQnrGDq8
 dkT4d2FuZvBpOAPikrJvBfuKYilM1PePjZJIGx4zDt/LtKjPwxowtk926NLbgU9FT71N
 hZZBbTgn+XfaYw4BaUrpkspoC7b5fPZY0lH82GND7gbRv+5utBBcraTckmNqqfbVBKu/
 D+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hf4eUjJPl39bYBB18Mdop1GNf8QxiXiipbWV7+E28HA=;
 b=AftnKQI7i0XiCUqS10tZnmf6NQrbafGQoqpauff3wdq7DiHsL027unU9gh7kr0m2Fd
 +jEhkMZh9vK9uHUvh/Pp2MwA/nkDpU0p3a2iaUDu3EaCymdxO7SRRSfEBJ55cPIorYdl
 Oq3s7TjsNNQ+yO41cBX5SA7tWJv23Ud29cef96GqpalQOWeQAd0OZ7AH+cWLGb6pUEzC
 Ux7pIjFSa9owRtgCcE7/eL4hzwM0zvXcHVpveuGNWk/ym1YqBkknbkeIK5XqaPRSItAl
 /iMFdG2e+nvfwZIb4pL16zc7jWfWGWKNA4AaxlIxvgbq2hLAIpl+zT8p0lxREsLGQx6t
 Stmw==
X-Gm-Message-State: AOAM533iI9ZYEJLNN6RX/Onpafryqp9emezCvoPhHEjzTrFJyOy7ZCvU
 k/TLLdcJFhqbPlcKlmrAQFKuH80ZCUlANw==
X-Google-Smtp-Source: ABdhPJxU/WVMLtytRQR7DlNVafCcPTnNO5ETFvUCMNJvjgb/Gmay6MWsrGKMhRYjaY0YpYLnKKdLLw==
X-Received: by 2002:a17:90b:314:b0:1be:dc22:62f2 with SMTP id
 ay20-20020a17090b031400b001bedc2262f2mr10988151pjb.102.1647446118474; 
 Wed, 16 Mar 2022 08:55:18 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:9500:ad27:b03f:5499])
 by smtp.gmail.com with ESMTPSA id
 x29-20020aa79a5d000000b004f0ef1822d3sm3427852pfj.128.2022.03.16.08.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:55:18 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v4 3/3] mtd: cfi_cmdset_0002: Add S29GL064N ID definition
Date: Thu, 17 Mar 2022 00:54:55 +0900
Message-Id: <20220316155455.162362-4-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316155455.162362-1-ikegami.t@gmail.com>
References: <20220316155455.162362-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_085519_752099_6757BEF6 
X-CRM114-Status: GOOD (  12.81  )
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

It is for the model number 01, 02, V1 and V2.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 6c57f85e1b8e..c0f51edb7cca 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -48,6 +48,7 @@
 #define SST49LF040B		0x0050
 #define SST49LF008A		0x005a
 #define AT49BV6416		0x00d6
+#define S29GL064N_MN12		0x0c01
 
 /*
  * Status Register bit description. Used by flash devices that don't
@@ -462,7 +463,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi },
 	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi },
 	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi },
-	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors },
+	{ CFI_MFR_AMD, S29GL064N_MN12, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },
@@ -870,7 +871,7 @@ static bool __xipram cfi_use_chip_ready_for_write(struct map_info *map)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 
-	return cfi->mfr == CFI_MFR_AMD && cfi->id == 0x0c01;
+	return cfi->mfr == CFI_MFR_AMD && cfi->id == S29GL064N_MN12;
 }
 
 static int __xipram chip_good_for_write(struct map_info *map,
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
