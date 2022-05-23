Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C63AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nf+zBGmRKoYkW1kptsl5qfFZkNC/Y1MkKvocmJ/Pe/g=; b=bZKAnAee/Klg5R
	WSKtMwJct/O0wSBK+C2Hm1fL+gLH38AUYO4cv5JFOr2oyPY/qkS/lMIe/YhL3fUu1sh9j5kT2TVhU
	1/PZqC3x6Zy6bP4hdLirccgpSx49eoda5qyuCeffiJOcn29jiSorOk1QRgkzryCbUC5w+r5TvBGx1
	aoNO8qw1+Gql9Aeaqh0Xq02OaEPX4xe5meZSBjBY0KlmoIlE404Dk8kaswt3xwTPqvSuoX+2GzSAq
	foysBZTqy4MUTlQ5kd46/ZdQXxRZk/xd0/njH59MnhB9dDDMyBXmk5vwLhNCANna+rkTjMApf8dOd
	MGppOxU1Th8o8u7RYUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt8dl-004cYf-Aj; Mon, 23 May 2022 14:02:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt8dX-004cUT-TG; Mon, 23 May 2022 14:02:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id b5so6135097plx.10;
 Mon, 23 May 2022 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/uPYvFeZZTkSS8WJjVNbiWQjecsqWmcRfd8xMpRg01E=;
 b=P3PHrmTAKhkPTFWosISHQujRQUzSuvYr35CbU+SPaqg2lslJhSb5IyhvSw0mzzk9kR
 82VlQKVbOpAqMmhcG7IX6OeFBEZp+1hl6ojaXwFqjLlN/G0vLW8Mh7DfPebUGmT2oki6
 SuvLQOxErrRKGAlI4FhXZ27F5tjbsx1XMsJX2M4LoiA03rh+VZvGDVyLCSXgjXdbwmSz
 bbmNG/+XdAz7/JLXaFY+53DLwEhWI6AkVCxzEEdDlHT9VmAQ8fm9PpyHyQkh0BMcBboR
 abIYgucvKt8pUeTdldsxwNL2sCrMeEAGZQLVYAkduBTspicz7QzptSqQ34NPk/yyfIND
 ++tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/uPYvFeZZTkSS8WJjVNbiWQjecsqWmcRfd8xMpRg01E=;
 b=F8By8UkcgpZp6oMoUdK9UN8F/s9HRS1L5ktFe76JADDpLfgoZSAAu78fybqqiQ57m5
 gIK1d4sUGvQndI6bcWh3VXFVJR604YYveGzVv5Bn04P9kVp5czQ2AmPyl3ykMkSfcmYV
 O/0aD8UHyT6x/JzBhYNwCMALxAGxdeNUzriaY20MpVHC5w/VfQTDXi1cT5cbt29fqd/I
 ATx6Wiu0R6MJuZka0EOJtm5XUZPTo1cfaHYpQharJnEaaZIvKTtIhvjNkRo6q0sm1ya+
 GNwdroeKs5yeMbDdXjgUHN/FQB1UnHVVA4lzHxIpNVqGejz190nDHe+6c17DYoFW4U9Z
 Xerw==
X-Gm-Message-State: AOAM532+4tT/hfwmhVyUGaIwNF/7qZ3Z91JR2rf9SuFq6r/Kr0XiDMBw
 PClPfVONGRXaNT02ikzcr0mU+iONSIot3w==
X-Google-Smtp-Source: ABdhPJycRpTQOgsr2QIRd/XkuP5twDc97y3ftQbX8ngGJKEKcSlErTYDksg8GPnzJ06vkOrXGmWP7w==
X-Received: by 2002:a17:903:32d2:b0:161:d485:613f with SMTP id
 i18-20020a17090332d200b00161d485613fmr23118997plr.173.1653314534606; 
 Mon, 23 May 2022 07:02:14 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 i5-20020a62c105000000b0050dc7628169sm7203366pfg.67.2022.05.23.07.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 07:02:14 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] mtd: maps: Fix refcount leak in of_flash_probe_versatile
Date: Mon, 23 May 2022 18:02:05 +0400
Message-Id: <20220523140205.48625-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070219_987179_5C933E38 
X-CRM114-Status: GOOD (  10.27  )
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

of_find_matching_node_and_match() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: b0afd44bc192 ("mtd: physmap_of: add a hook for Versatile write protection")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/mtd/maps/physmap-versatile.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/physmap-versatile.c b/drivers/mtd/maps/physmap-versatile.c
index ad7cd9cfaee0..297a50957356 100644
--- a/drivers/mtd/maps/physmap-versatile.c
+++ b/drivers/mtd/maps/physmap-versatile.c
@@ -207,6 +207,7 @@ int of_flash_probe_versatile(struct platform_device *pdev,
 
 		versatile_flashprot = (enum versatile_flashprot)devid->data;
 		rmap = syscon_node_to_regmap(sysnp);
+		of_node_put(sysnp);
 		if (IS_ERR(rmap))
 			return PTR_ERR(rmap);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
