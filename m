Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE3FC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 17:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9okSJXL285A0FoAmDc2qNCDS1gxzfsYAQPQg3GfOcRg=; b=OU8kjEnZte389e
	f2fzeWa8sa3+un2DkWuFCpqvHp3NYwkjpXrbUYuBJKS8ya1gIeWkxR+5XfHdjHwItQvY9f4KQWpIA
	CDv6VXFealYZxxLOkwHzuAs7GJB8TCqHVzC17NJxw+gT2BVJnv2OQS35y/EqcwdlMAKr9vn35ZwHN
	wy/JX6t1Y9JXDRm8R0LHar/q1IGLeQwqJmZ+7NzjG1XdLjWfepUCts4nHpTM7oobXGixh8xQSHEm3
	SCUmwD/VXpJNG0nqxZXoStHsETgvSmf+nLdUsuR9BjytwFZaGxgVkuz6vDCRSHRmRovMp1li5JQIC
	LxUQvANjjzfxqLWdavgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4Qz-00EM6g-0p; Wed, 23 Mar 2022 17:06:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4Qj-00EM1Q-Ep
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 17:05:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id t2so1942965pfj.10
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2022 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GO6zjHowx42SMC6U+DIqwzUrunU8CwJJVzSOH2Jqjd0=;
 b=lRcnbRusZjgOiJbhrZHfujb/U/pUZgu9oOIgxYi1AYglBYUbJDgHvbemsxkdEo1QJr
 mQ+3RH1tWFydciSIskeKBDHubnAlKqG+Xz90e1mKpuInE8a+oFdNd5ZABhRd4o2xZWwu
 wYq0KVBU73dIzxTQsjAQIWnveeBqSj+sO0pH+2jwaklZDX3MSW+uocp/3RYkiZYnBQMj
 Ixz8VTGbhCjEWbxdjcUmk/t/7rpk4M4c75NTprSJIBYcDOk7qo6U6FGlviUI1QS+BoZi
 1nDgP5OhOIOWuTnilT5JsBb5+TEYFAIBmEPQGj9DUacAntL8xYawVfp3H8tEGJDXA93a
 xS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GO6zjHowx42SMC6U+DIqwzUrunU8CwJJVzSOH2Jqjd0=;
 b=yeb9gSOFv2WlBRI3SXl8xM9yrdeQBCczZcH4OfJ6Ds057AhqGuFQwm+y0hmAtHhRCU
 SqzEcEQXsTnPKj6U172PrEtkt0JMy3pT0yaW0QJIR3oocycxMCqDvvGJUE6D1TLY6lv0
 f7dJcI9G58zDtpvXkbjsdux0eRwy6wF1k2UF4kXhk7yOpuWxtjMkqB9pn0bsXgLMJvfG
 RwtD1SUHaL14tr2gV73XRSusHW35+rKB+yKYQjuuX+6PJu4mveA6D48euPq73bN2AJuz
 oOSa21RE3OzXYtZRp5RUgF49s0hkoVNR91ZTgtF9QjJVEWHSjsWLt2AoHv+fXYFbxmHY
 Z9bg==
X-Gm-Message-State: AOAM532DgqqPlrYmB9kU7E29DS1FqJePxPTb1jwaC8T+cgB6apBvt8oM
 +cOPAJcGZkYABKhRUOhOQrk=
X-Google-Smtp-Source: ABdhPJwlmYAKoRJ7Hi5vjXFDYxWaDAgibyXE9EvEG3JBPjXz8AKLY3E5mLUrrFcvFE8oyiIwzeVdrQ==
X-Received: by 2002:a65:5247:0:b0:382:9715:44fe with SMTP id
 q7-20020a655247000000b00382971544femr646234pgp.577.1648055152246; 
 Wed, 23 Mar 2022 10:05:52 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:98c:eff5:b721:5f7b])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090a890c00b001b8efcf8e48sm6649709pjn.14.2022.03.23.10.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:05:51 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 Tokunori Ikegami <ikegami.t@gmail.com>
Subject: [PATCH v7 3/4] mtd: cfi_cmdset_0002: Add S29GL064N ID definition
Date: Thu, 24 Mar 2022 02:04:57 +0900
Message-Id: <20220323170458.5608-4-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220323170458.5608-1-ikegami.t@gmail.com>
References: <20220323170458.5608-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_100553_531540_93690BA6 
X-CRM114-Status: GOOD (  13.01  )
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
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 59334530dd46..b31439e44435 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -48,6 +48,7 @@
 #define SST49LF040B		0x0050
 #define SST49LF008A		0x005a
 #define AT49BV6416		0x00d6
+#define S29GL064N_MN12		0x0c01
 
 /*
  * Status Register bit description. Used by flash devices that don't
@@ -445,7 +446,7 @@ static void fixup_quirks(struct mtd_info *mtd)
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 
-	if (cfi->mfr == CFI_MFR_AMD && cfi->id == 0x0c01)
+	if (cfi->mfr == CFI_MFR_AMD && cfi->id == S29GL064N_MN12)
 		cfi->quirks |= CFI_QUIRK_DQ_TRUE_DATA;
 }
 
@@ -475,7 +476,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi },
 	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi },
 	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi },
-	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors },
+	{ CFI_MFR_AMD, S29GL064N_MN12, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
