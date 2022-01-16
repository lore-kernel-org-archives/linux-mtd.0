Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE74C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jan 2022 03:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MxCIeWYLEAU/v4EN5Bo0Rpen1sdNONMJVufC+4MNTKE=; b=zt63yBOAVtIuAB
	zNjgeHzUk0RgDn6JvILGgT87/QgijjO6PN6gVE49p5jQCxDblWrMn7Do/uh7Cli3V/3Mq61YYE+jc
	XNxo+AHvlWdP7rNlliLH0Hb1mqFVOOmu265ywfNg52ay1i9+OZORp205dqQETRA3qem6NSTrelNyl
	EZO+1dh4g3uq8u/2ffU9BE8TmoTcZIeJwSqk7cevgh7aHgmapHcJ5ySvCQnUquW1bBGFhwdu8Kn5U
	mUdErAOv0LHe0RQVA4z1ojCqwgPLoBJUd8HhvdcbaHIeUTfA6fJPhhg7LikJXDP1g+V/AfgeA+NCf
	xZe9C3XvOc3y9tnnJxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8w7l-00BniA-9t; Sun, 16 Jan 2022 03:22:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8w7i-00BnhF-IY
 for linux-mtd@lists.infradead.org; Sun, 16 Jan 2022 03:22:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id c66so13487180wma.5
 for <linux-mtd@lists.infradead.org>; Sat, 15 Jan 2022 19:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PtVAa/r3Ho8RpTk/oGLVeaQ3Tn1StJzXSfcrQ//zcLE=;
 b=CSJLvxWy+3bL9jUbNu+QHIjHM7dacGonCvZqtYmqAqyECJmADWK2uw6wzNa/JO+nar
 umfxiBNbwZKF99mLpsb0sUIcEb2v96V5a7F7bkIE43a9n/7Hr3iaHWiw2y3989DEJR7u
 fGF/bMlsw8RnzXKfvJpjCd6MUG23mhfLA445WI8lCMC6izjGUFPGeySWhP3wuOfXkqsw
 JjEU29NI7+2ZCLNjgHgj8cKBeELLpBOaJOVHcsziAs4tSYDNQR0OCbhUrhAh+5p7qW+5
 kXepoaV2gZz89MQwzn5NUbsVoS+QhwjSa9xtkg4U8L05rTtczg4p9q0ArFaa6AF2UlMM
 Ru0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PtVAa/r3Ho8RpTk/oGLVeaQ3Tn1StJzXSfcrQ//zcLE=;
 b=lHD3KZrfeaQgIWFqcrobcEefDKbgeYLEbtJiiMR0NQcFoxVe0gaPfzqBPUTnwdnYjS
 mEeSqnHZVOtwNKVN9IKTo/SLr+in9RtRfZqz2EPadnFY8b+tbBU8SXy5v9v4n9HfvZUa
 a4OmA4BuYEGiIf0p/ta0QwI+kGJPhhgpJHCCvN+AxmGBBJg2zeWR/Lb3ZUVOJkQkuMSK
 jhAPPwXNnnrrwziH8QvK/eRmuKCDHHxeEuw6SV6l5yACVXtJZgN5vW1kGOjeCNyx9aSO
 o+ePaM3pSXmyOQDUpKzf9SqAAvz8TVwmgU8fv4ujckAQTQL3BNw86ulu7jNd25+WlKdb
 FbFw==
X-Gm-Message-State: AOAM532LHuIZzKHE03MJq3FUizHIpVHxonf46mP7y9fpUGPGoZXofwnq
 jsQYQzAEPtZYLsG0UdTRJqw=
X-Google-Smtp-Source: ABdhPJx7gMj7wQTQ4DwpJYQDmjcURscLM20JCKTVhXQRYyW91D4imPL/8TFzxIDIXijBJz4N/HG/Mw==
X-Received: by 2002:adf:f102:: with SMTP id r2mr12335057wro.480.1642303346152; 
 Sat, 15 Jan 2022 19:22:26 -0800 (PST)
Received: from localhost.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.googlemail.com with ESMTPSA id u16sm1446785wmq.23.2022.01.15.19.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 19:22:25 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] mtd: parsers: qcom: Fix missing free for pparts in cleanup
Date: Sun, 16 Jan 2022 04:22:11 +0100
Message-Id: <20220116032211.9728-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220116032211.9728-1-ansuelsmth@gmail.com>
References: <20220116032211.9728-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_192230_649625_2FCC4A1F 
X-CRM114-Status: GOOD (  12.18  )
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

Mtdpart doesn't free pparts when a cleanup function is declared.
Add missing free for pparts in cleanup function for smem to fix the
leak.

Fixes: 10f3b4d79958 ("mtd: parsers: qcom: Fix leaking of partition name")
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/parsers/qcomsmempart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index f4fc7635c1f3..32ddfea70142 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -173,6 +173,8 @@ static void parse_qcomsmem_cleanup(const struct mtd_partition *pparts,
 
 	for (i = 0; i < nr_parts; i++)
 		kfree(pparts[i].name);
+
+	kfree(pparts);
 }
 
 static const struct of_device_id qcomsmem_of_match_table[] = {
-- 
2.33.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
