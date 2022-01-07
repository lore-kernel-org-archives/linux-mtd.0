Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89764C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 18:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMgelFg7f7tC1DkhXUDyGL7icMUl8fqfJhS0qfHVdrQ=; b=4V8SB4XVvU++m+
	M2UDg6OFwh47iWKOHTmAGx3G/hPXMueoicp5/TYDOvZKE1xCju1xov6aVJDXXi4/MpdOj6Tha+LkQ
	voHgwnNO+brUkYiV9U/N1sApvtIOFRFw4WAWVUFbm9l9GSmAfwT4XDXTSPdnKH69i3KVk3cZPnukU
	Z7JMloy7jQlpMDQXwKU7/hu5wjpwIF6Mmd6ABftlAjTk+LXwW5BQKcqKQLWxJXJW87REnfPbpU+/h
	Bd58FYUm74Jmf/eUSPoCN9nu7y8aZoyo61Y9tuvVmxOM/KYMH+68dHB50t1v8UVq9hlm20qdw7uaJ
	jSnQPelLMJ2V1bsT//Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5uKG-004xmk-DU; Fri, 07 Jan 2022 18:50:56 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5uG9-004w3b-8Q
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 18:46:42 +0000
Received: by mail-pg1-x52f.google.com with SMTP id f5so6144458pgk.12
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jan 2022 10:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6SNHpzA6FkPy7IZMV8KM77XcancB04AysWoNYDyPct0=;
 b=S6U3Vkqir3kza+H4liGIRTeZGJqWgv9o/B9o7wDr0/MwSUjATAoUthqoTx8QGYcGER
 Jh8xNY4l2zZZWWibPug+69+o7fiq7zWmhcyl/tCJEmwEZ1VWebKObr8hZ7TmVevW5J8e
 NDh862oEF9oykH5ZVK+U2cn49mTHn3TBmdG7w4WiF4Eob8QLLTworwLDcy8+AZp7152k
 SI/sm+c0GWiUJx0dbDTSr6hbSexvyy3qsfHUaiY5WTveR2uX1zrpMeKeoA4ufZgOj0K6
 rHX0u4DhDJnSAr6zHmt4sshB9zZkqjd58gJoTtLZXn4S5nkd4puoXDpLiSvANj9OUaAM
 oS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6SNHpzA6FkPy7IZMV8KM77XcancB04AysWoNYDyPct0=;
 b=sCO82k7HYeOp1jJRdAMagQIQqSvr6qIvlci3n+irpSNmVR3QLRETQkYJHp75pDO0u+
 hAAEjcJEhKlBpTIym1jbjG2i8mrJBvqIshT16kfBWrUrBl8fU/++o7PMCE5hmWXQPG6r
 AWjpzQ9Qa/OLqWUn9fGjzYM3CobNI5eV7xfxqdGXlvw+QOOc/H6J8xCjqgcUeUuX9kjZ
 E9cDPzq3wEFI1UFTIDYI4Yggf+FT2oK+ekzaZVFIic3gQIh27z69v62czrZKxL8xI9uc
 HV1MtuFNeevO4cVBTEuJ6wi9cOdFx7d29qy2IqWJexuid+SxSQ5V5459BXUVRvjVjK4Y
 TDaA==
X-Gm-Message-State: AOAM532okbNVlCQwtjiQQnwA3cOmNWs4MYy3mu7NxLGx+MsDwVKrjxGV
 ylhBcNerhGcUnr7a7Eo6PQmk9PsJ1Jg=
X-Google-Smtp-Source: ABdhPJwLoQ8g8tvgpBidAKCpvCBwIXZ/nNmFCy9WLby+U1NoavHQE8vU5Q/IC0k1Evzx023BThFz5A==
X-Received: by 2002:a65:5c87:: with SMTP id a7mr58184852pgt.600.1641581199667; 
 Fri, 07 Jan 2022 10:46:39 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x33sm7219417pfh.212.2022.01.07.10.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:46:39 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-wireless@vger.kernel.org (open list:BROADCOM SPECIFIC AMBA DRIVER
 (BCMA)), 
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: [PATCH v3 8/9] mtd: rawnand: brcmnand: BCMA controller uses command
 shift of 0
Date: Fri,  7 Jan 2022 10:46:13 -0800
Message-Id: <20220107184614.2670254-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107184614.2670254-1-f.fainelli@gmail.com>
References: <20220107184614.2670254-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_104641_323798_F74550CD 
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

For some odd and unexplained reason the BCMA NAND controller, albeit
revision 3.4 uses a command shift of 0 instead of 24 as it should be,
quirk that.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index eab19df152f3..4759303ece7c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -916,6 +916,12 @@ static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
 
 static inline int brcmnand_cmd_shift(struct brcmnand_controller *ctrl)
 {
+	/* Kludge for the BCMA-based NAND controller which does not actually
+	 * shift the command
+	 */
+	if (ctrl->nand_version == 0x0304 && brcmnand_non_mmio_ops(ctrl))
+		return 0;
+
 	if (ctrl->nand_version < 0x0602)
 		return 24;
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
