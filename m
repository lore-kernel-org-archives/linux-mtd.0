Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B862FEFCE4C
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2026 22:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSwE4b7YtHK3N/kS6UbNqiEvI0+rv0Pot8fBoaRJ52Q=; b=mbDwsWytz3Frup
	Ww9Xwm3Z5Aq2dJ/HBLgzlkru75dLlyc7sZ7z6pUIQ9NF9pHkzxmHhxD0rvnKZbXxuKhYjdYX5YiMs
	n/Ne7HsBV+vepvZg7hSf681wuq6dD7PdzcwMxRwJ0hrzK5a81NBl7Ce9JcxS6R/2BmukKvAq8nJjK
	61c9K9W8BeJ0kNORWRPxHwVF4L9rVt37azX2CzFqm7jmAQiPH0M+mloZejnhLboRI4C8RKk3pf1dA
	8Zw0GTKPSVo1GWnOTw1g9mZdFTmSpUl0k5AJPP2DohtOgygkLjSE+Dy9InPtK4P2ee7bdAGxoJSPM
	0nlNZv1aDLGF3ze8HouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuVX-00000000ZCe-1fHt;
	Wed, 04 Mar 2026 22:15:55 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuVS-00000000ZBE-3XBZ
	for linux-mtd@lists.infradead.org;
	Wed, 04 Mar 2026 22:15:54 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82748095892so3620603b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2026 14:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772662550; x=1773267350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CfzrWus7cpldnCjcicm+ZA4TLtGttdNpR4LRwnpAfg=;
        b=UxzzlVT4qOWfLKIo3qUtv5mphPRI4uP4BCdh7xylnLR6jCpjlaqHQJ8C6aZXCOBqh0
         4a1R0GjKQKgkMbWcl8fsHEuaqYX8Z1vrsa3QP84oPo6i2eSCRrS6o3+xBSJQ5KhbpXu+
         0HiJcMi5k/nJm8ERyzz3KqMFjJbxcCNz+3UA9Fhy7WpfHxBx8TfZ3JdxvYoDIr1KNxc/
         P9Id5IRVMAljce3vRgCyHCfpIuSE19YnkMa6UJdj82jJ2IhgjrpbEAPDMsQyKzkL7yBS
         EzuV2VXxkMRmoMMSEk1em0kOi64FmxAnxew1eMplNAZKinjxbOzCAND5+kmKOUwo0xvP
         NvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772662550; x=1773267350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CfzrWus7cpldnCjcicm+ZA4TLtGttdNpR4LRwnpAfg=;
        b=usgjwNYv0+YEBWei4EJDWstQKx0tpzk86cC53j/PK5OWR9B4bSKPYylXE1QfaovmTP
         m5EtoUPEOvzv1r2USSX93Su6Klcxs6Py3jSIrZYdy/og91Uv1iQrcC2GGRALziv0gae9
         MdpHRfLqapkm8XUttk3g9EYBr7pnXNTcrZpgdFbZNb6Np63u4bBGCkj8t7xpBUUR+5zn
         2HJKRRUxLdO4cO7be0vV939jtcrV81PPPamxVhpzfGDNM8qfFsRZ8tMJ0GbLlDbxxLpi
         Ii9r6Bbrq2CaOOT7mf8DrPF1uwB4wkhXtW2uENDRbJhKIkFX0R/KfFgv4PVLPPXaA3b6
         5AMA==
X-Gm-Message-State: AOJu0Yz5cK2v2AXcBu4TDOFgbLzKRrr8EwpaGu6jEyCzWIk0mwjOBpL3
	C0f2eL1dxz3JeJSq369qj5yobyFhxeqzqGzjsDYsenPXZCgdq7VnqzYfZRnITrDeXPo=
X-Gm-Gg: ATEYQzzRI6NPP6EQtk8B85qfa54yH7Y84Y3SgwRYjXq4/by341N0ZEaO9trfN/W7avf
	pfhFEBOBTFmBADSe3VQUPejBmtvMHXPIzP4vQxAYXt6pV/30n8FxOXHUik0wOIxoVnIfZt06328
	DRd6DhUMWnfkpT08Lr52+hUBwv9CaDm04KCBh2/F5dxqocvURQOhepCvytaz/9bsPE3umKo+9/R
	2VD+s/JWVwzWBLQ97q0mtHlHGbWWnq0VTUon08dT4cR4tcHdQL5hJmXF4rKWrBkpay32WLKffFz
	e8v0zpsB2G/c0oyj5gW8N0H42fkTPbt+KwT0EbXZZ6MT/IBx+tCK+6ntGNyTlkSMRU6h2TsYCn/
	khjotjbHdyg+lFaca3786vVVUonVIiRUWWAdK7oU8eB7aXmfr5Kc4b03D61+kkITBNyKLc+x413
	je1jEAKwZzRMgavFEmjKYK0EDYYC4JGsl1+3t+mxb5PQ1an1RczZbOJQ==
X-Received: by 2002:a05:6a20:3282:b0:38d:f6d7:963d with SMTP id adf61e73a8af0-3982e268f33mr3006564637.57.1772662549713;
        Wed, 04 Mar 2026 14:15:49 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa6203a6sm17637399a12.8.2026.03.04.14.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:15:49 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH 1/2] mtd: virt_concat: use single allocation for node
Date: Wed,  4 Mar 2026 14:15:29 -0800
Message-ID: <20260304221530.15018-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304221530.15018-1-rosenp@gmail.com>
References: <20260304221530.15018-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141550_882460_26CE2E7A 
X-CRM114-Status: GOOD (  13.34  )
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
index aea88d1c9bc5..89e223edac6a 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -31,8 +31,8 @@ static LIST_HEAD(concat_node_list);
 struct mtd_virt_concat_node {
 	struct list_head head;
 	unsigned int count;
-	struct device_node **nodes;
 	struct mtd_concat *concat;
+	struct device_node *nodes[] __counted_by(nodes);
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
