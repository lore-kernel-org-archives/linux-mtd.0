Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902C8C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 23:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vHPrxZQiFZbU6Qu4gM3jtlQwQs0u4A8FgH6eiSiFGQg=; b=V1Wr00MvFDgW3q
	XBKcstifYC1yypRFzmEVwTKJAZmjKCuXFJfdPJzQGtPYcnSUQxlh8fO6Qq+rel0Qtve3I+eh1C/wW
	a6is3CgeJMtV4DPKO9H+LXF3PUxOKCSo+Jdm+qLpGCDxWGTrH/mSIeqWJPf1qi6L8gZMoWUwG5lKk
	/Q7Dj8IlEwoPmYLQ87F/Cj0QzWL5HICjVRVSvdRJBuE/UiEAs3VUjVPu48BkqS6ckr1W31op/Wk0+
	9r6BzmlwU6jsbK6LwOMyaBvpYtA59q7A6DEe6H5j9B1zkQVkHo3XjIxRtTG2TAGwHjSVCkuGKe6nQ
	6XoKdEBC7nOqRBPVKKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWoGS-00CSbx-97; Tue, 22 Mar 2022 23:50:12 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWoGP-00CSbK-8M
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 23:50:10 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 mm17-20020a17090b359100b001c6da62a559so4776145pjb.3
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2022 16:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tDMKrzRjWp/70TWTxkhO6K88wGJIlo8Mgq4G7UFs0Xc=;
 b=nnrcyO/kx1ZmZ/mb3WXDXRohgFnLWFK9u+KhAoaJfBbsi5vyYaSKhXVHZkN2bXj8Vw
 aEOkJNEWplioG4nLuHqd/9T9eZ4U1peUwyfE0hhKHPfRWDpZhW1NR+yMQj9R4Svd+WpS
 pbfzOFnlFcMkSqz0E3VeumP9pd5P7PZatnhNUoE2awXDxiaxcvHm80WCdpHkaWy5PcV5
 xMyCCcBVLkdaQaDI8QgrcCVnsG+ov52UMMNcpoI6D8yTsnmdptkHtb48zsEy8C6g/Fst
 Ddid1zIYwKH81kr6U5U5nkU31WddhfQeG+HglZN0bNmVgit/paZpZGIGWf7HE3AxLfx1
 HZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tDMKrzRjWp/70TWTxkhO6K88wGJIlo8Mgq4G7UFs0Xc=;
 b=AHI1dRE54ChZ9ouUJUraVzDokvYU1BKERfWPVRA2lEGRi1MY/w2QOLQ+L237krfJG1
 I0dgj6Nyjq8HfuNjngfiD7hbnUv1B5f/FXdnHWUPY35OjiQnAfhxSZ21NrHazyr60Mdv
 cACdSzxaiJMe9jZ2zNSznwBgUpdecvMoQQVJJPj2y8I3tRuJ/TQClSS5s17A05nMLbtw
 h9g6lKnsLImjFZh4rAj4PJS09cQUyEWDPbPOZ7cEm5W+iYjg8rDbQWZPvujKOEKCIqMx
 eHJEO9y6enxx/PTbZUvELhPcjmeIwCgzwQYOtBGYg5701+1hUy08KXufzKxpM821b4c2
 fX0w==
X-Gm-Message-State: AOAM531/AqV0dWKB3TmosLRBbCdvOORHpnpKDUsf9kB4oHoP3rFM8nl8
 f2F7hf8oWnjPFAgZ1iMYvCg=
X-Google-Smtp-Source: ABdhPJzjmfBvkYnsZCGG5uehl1xtTwbuSzW4M0pn0eJqW1TqucUZXwBdjKSxc81MeTLsePD9l9hoRQ==
X-Received: by 2002:a17:902:f789:b0:14e:ebbc:264b with SMTP id
 q9-20020a170902f78900b0014eebbc264bmr20356278pln.169.1647993007090; 
 Tue, 22 Mar 2022 16:50:07 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:21fa:ea93:9e2b:20e7])
 by smtp.gmail.com with ESMTPSA id
 lw4-20020a17090b180400b001c7327d09c3sm4350899pjb.53.2022.03.22.16.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:50:06 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 3/3] mtd: cfi_cmdset_0002: Rename chip_ready variables and
 add ID definition
Date: Wed, 23 Mar 2022 08:49:52 +0900
Message-Id: <20220322234952.25520-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_165009_341499_368E74ED 
X-CRM114-Status: GOOD (  13.15  )
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

The definition is for the S29GL064N model number 01, 02, V1 and V2.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 59334530dd46..67453f59c69c 100644
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
@@ -833,7 +834,7 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 			       unsigned long addr, map_word *expected)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word d, t;
+	map_word oldd, curd;
 	int ret;
 
 	if (cfi_use_status_reg(cfi)) {
@@ -844,20 +845,20 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 		 */
 		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
 				 cfi->device_type, NULL);
-		t = map_read(map, addr);
+		curd = map_read(map, addr);
 
-		return map_word_andequal(map, t, ready, ready);
+		return map_word_andequal(map, curd, ready, ready);
 	}
 
-	d = map_read(map, addr);
-	t = map_read(map, addr);
+	oldd = map_read(map, addr);
+	curd = map_read(map, addr);
 
-	ret = map_word_equal(map, d, t);
+	ret = map_word_equal(map, oldd, curd);
 
 	if (!ret || !expected)
 		return ret;
 
-	return map_word_equal(map, t, *expected);
+	return map_word_equal(map, curd, *expected);
 }
 
 static int __xipram chip_good(struct map_info *map, struct flchip *chip,
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
