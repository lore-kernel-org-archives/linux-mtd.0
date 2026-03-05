Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD473F513E6
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 22:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8HZrDqVOnRg33SzVXmfRgn8uD0TcP2nX6whexyk8bQ=; b=oeHn7v6IF6mDLY
	MdATwU2iXRsWfPTdfFJwoZ7cC7JzXLdsJegemRJNFUlY530v75VQoHoMIxMAqW9ZIB1OPt2vaKojQ
	EORmF52pCxfzrLXgc6qphjWdYVMZL8CHGPedbusl7iFjVxgmSMbZe5RuVl5yaN7n0gn++uP1hQnIv
	Gi5HUZRBKhVhZoH7CU9d4+Te4Z5aHLpTYn7yGxmR7wcms06Vpzh7D4nxUlOBQ/u0QM6sJWZjT7Iub
	+K+VQPo1J26IW5n8e9EOH+jSdfFRFhsuro+BkHmcAILdEueDdgY+Q6+d6OlFu4rR0kIyEb3CFgm76
	OBHq0cYjtYlsP80VsSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyHQn-00000002h9I-1wst;
	Thu, 05 Mar 2026 22:44:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyHQl-00000002h8I-0qgX
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 22:44:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ad4d639db3so39204985ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 14:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772750670; x=1773355470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ruj//+N0PDXJjZsC+IcqmIp3UGMkpYjjecZnM6Zp70A=;
        b=FWerljsX+l1vSk0GbSxnZO9YBz2hLnTOdqKP1qOjvW7B4OQKauvi3aOEtq1uyl+dgK
         g5HUkUzP1jyoJwFg+irLbpIUAtpZXcHiR+PRIK7/hTnV70cMtp1rsCCMIwkKBJk8ufE0
         bctXvjZZBpFs9ORIc8t1r/JcBs+SoOU88aLWUmekYdwDiipEMraZNEMrMy1w3RXXLvNJ
         Flz+4d5z9cRciMqSEZCaG/V4+pP8Y26+6nGtaAIlHhSzhkclHmnVyCWzU7/5bhgxlxQ2
         dWRJGnIyTmAJLvIT5xfS6Jpj0QS0S47V9N4IrlLkoPh6dAibFgiXUCZ4YI1v3NgsVF8I
         mg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772750670; x=1773355470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ruj//+N0PDXJjZsC+IcqmIp3UGMkpYjjecZnM6Zp70A=;
        b=nUKK2DwoiM6emHH6qB2efGh76kls0xiQgvDaMm4oZfWPWAwb00G62T2w2pHzpADL4y
         ybg/4VXF2feprh6mysfDB3y+jrf5ZNe1Gsubb5/99rGr+tIckumg10iC5dV0HWDm0lQG
         69s1RFieI5rbhRsfTqjTj+EmOBuhGaCW6cuPm/hM04t1AXuFAqbMMswqwFVdaR4yvVAF
         9XdGK+aQUryp8iP0j98GFr+61jd8xoGbubsyvKtVDPH0OZTOGYExWhsp0303NwNwGeRo
         +lCC0SuiVSKi0CervsRwYJVTbvIbFjt8ML88TZO1m0B2BOp6NorilCKQ58tVHIwmgLP3
         wplg==
X-Gm-Message-State: AOJu0Yxzh32TcBWnOR4py/cGLC1iXrT4NcjEkL/hj6FeB5OtXM44i+3+
	/bW+jEW/F2Rs/MsXgQjxniNkB5KkDrsBfbygPq6+VqmBGJUSDBcr7sgL3GYERPi8sSM=
X-Gm-Gg: ATEYQzy5Wzmgc3SxAV05CQ6qTi6EXF5qvxqwiDosalbYLGFB0fjT8/S1vUmY4+Q+ErQ
	AVQmMjJCNK+zyXdlAcd24WLtmmKfNBWH4LMQ+E31GeugcGwYB/2W/TVi3thiES/cmfPWsas6Yia
	H0HSlaRhdiJw7fQm8LvyG0+CV5/WH83+Mw6io06sbhVw8g/+k8o+HcRedNXuxmgkNWafPxoPPjz
	4Ts8sPrNlgM63MNIvuwROc9Q6g32/M6uQGkIvAp6Vms0fiukd++CTfMRE+rsEu30mNNnr+sM4pN
	LtuRcYHPXRTaDDPKmUVpz7OPZAyr/PoQYVPVvkox8iUPxUSBM4wu6BSqNrSfAlmzvsKtjq35tpS
	Kw7WL5ZSVC8xSgSuDkpZArsYo5r2DZIgEXf2eHIqBIefO3Db3CE27uepzv8uWloEcBKEiMQLeBY
	rhbgyixAp9vRDil2lzVON5MSzPcucR3AKk0oJuKBDN88V/ojPFxKxnWw==
X-Received: by 2002:a17:903:4b50:b0:2ae:63a4:3baf with SMTP id d9443c01a7336-2ae8248ed61mr1294875ad.46.1772750669885;
        Thu, 05 Mar 2026 14:44:29 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c738877202fsm3565477a12.25.2026.03.05.14.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 14:44:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 1/2] mtd: virt_concat: use single allocation for node
Date: Thu,  5 Mar 2026 14:44:09 -0800
Message-ID: <20260305224410.14251-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305224410.14251-1-rosenp@gmail.com>
References: <20260305224410.14251-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_144431_244087_119D5686 
X-CRM114-Status: GOOD (  12.82  )
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

Simpler to reason about and avoids having to free nodes separately.

Also add __counted_by attribute for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/mtd_virt_concat.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index aea88d1c9bc5..33f9a63dd450 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -31,8 +31,8 @@ static LIST_HEAD(concat_node_list);
 struct mtd_virt_concat_node {
 	struct list_head head;
 	unsigned int count;
-	struct device_node **nodes;
 	struct mtd_concat *concat;
+	struct device_node *nodes[] __counted_by(count);
 };
 
 /**
@@ -133,7 +133,6 @@ int mtd_virt_concat_destroy(struct mtd_info *mtd)
 		for (idx = 0; idx < item->count; idx++)
 			of_node_put(item->nodes[idx]);
 
-		kfree(item->nodes);
 		kfree(item);
 	}
 	return 0;
@@ -167,16 +166,11 @@ static int mtd_virt_concat_create_item(struct device_node *parts,
 			return 0;
 	}
 
-	item = kzalloc(sizeof(*item), GFP_KERNEL);
+	item = kzalloc_flex(*item, nodes, count, GFP_KERNEL);
 	if (!item)
 		return -ENOMEM;
 
 	item->count = count;
-	item->nodes = kcalloc(count, sizeof(*item->nodes), GFP_KERNEL);
-	if (!item->nodes) {
-		kfree(item);
-		return -ENOMEM;
-	}
 
 	/*
 	 * The partition in which "part-concat-next" property
@@ -216,7 +210,6 @@ void mtd_virt_concat_destroy_items(void)
 		for (i = 0; i < item->count; i++)
 			of_node_put(item->nodes[i]);
 
-		kfree(item->nodes);
 		kfree(item);
 	}
 }
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
