Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F291C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  5 May 2022 02:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CRD8nCsv05fEl/ehUc9AfHtqhhlBrWEp1ln8nuqeBHc=; b=wGY/5bKe6tX7Z+
	PyK+YwFmH9ByHEuxR5CtiaXxOIWXl1v6TQZqdEcp3SsReljoasjvJ4iq39Rx7mFw/4Bze1qUytiR8
	7WjQp1vMQEQEg9puRZwADsD+RvELGXXz3kkoPMdTwcwAdz016ydBNXilF8HWqz48H8vF0KXUcnC9Q
	Kq5YXjbAVgI4MgNFoL+DSPnkhiu1pBWAC4aE2dcjQa+1hnroV8wC1VoQhbUFS2DoNmQJ0lpaHPai4
	INb+d/oelRFzJQAvqQhTtP8lX0KCOcK2Cql/UD2kCsnS9NpANSBOBd/Gx/upQIT3p0A+yE7F981Ya
	U6joYyBUopSZpwXtrLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmR9w-00Dc7k-Aj; Thu, 05 May 2022 02:24:04 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmR9r-00Dc6F-OD
 for linux-mtd@lists.infradead.org; Thu, 05 May 2022 02:24:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id e24so2902663pjt.2
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 19:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q38L+5vJ92fuvVynN1L7WfjgLwHAa0h+20EWg5+2ZbA=;
 b=P1Sax+qeu8zu7OldU9p7tZCHML7RqVZDZ+OohB5xa0quMwTa//Q/W5bBINaeWZmMTA
 FNJmexTiachc8+FGGTh66kh6yvjOGrWhpfLpfCvux0Fk3q6kcj5Q812TPjuNKtJ4Yumm
 iTH3Fxv1LELwtuUGByweo5R3busBdI5CHPkGTXOlZTaEIfiz/vvAF69mv3T4HtB7xz/f
 Qb6666sIgEqjxvooH1Dg+KfY4UFOFyHz9w4P3LxNi/+fmQOlpCH312Kv/3iYoJyxSFxS
 BWYGwhUkOWAnG/g/hxfevnSIcqHOOlkrLSiKr05W3i/RCSZ9L2z+UWODHGKG1gQ80jwe
 vavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q38L+5vJ92fuvVynN1L7WfjgLwHAa0h+20EWg5+2ZbA=;
 b=g0lScjmWw7ou2TODarEOL396EZekVxI9hxx2fA9B7XWPdMXkBrbu26873KgkfdmpiR
 dBQlQ8kdiE4di5y6izOEO4Ht5coVguEUMpcyLjKgZ8oaj2Vkv1eT+WJ/llIKc7Akbbqq
 tpLORhuf0VfP2bmYF0rJCZ8owAj0p44dtRAct3+6glrNBYtldhp20ou78QLNneuzXEvX
 GwkCCSZfTaIyYAg8piM8dEGstFJ5hDJamoFdqbBsICdAP5p6n5VoIkrCggVCfcFyAhf1
 yh+f/6ayxqMjIq7G9edXHDsnqtVEsNERt9enclLpt17MicZ1ME5Ae3b0lZP9UGBVSYei
 YEPA==
X-Gm-Message-State: AOAM530VMbNBpbqjwUFUoXOrwSw8PHVxkr8VfekxV4PFSzH1EaW1HbNL
 WZeAw+0Ew1b0xhB/w36ow7k=
X-Google-Smtp-Source: ABdhPJx3T+F8sg9zQWRkrt6YeWsYaOfA1Oh/4dVFRxavhm+mWavC+T8fNbpZyDH0w/5d6xql/TEwbQ==
X-Received: by 2002:a17:902:ccc1:b0:15a:24df:a7cc with SMTP id
 z1-20020a170902ccc100b0015a24dfa7ccmr24973092ple.42.1651717438190; 
 Wed, 04 May 2022 19:23:58 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a170902700c00b0015eb200cc00sm188663plk.138.2022.05.04.19.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 19:23:57 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] mtd: rawnand: cs553x: simplify the return expression of
 cs553x_write_ctrl_byte()
Date: Thu,  5 May 2022 02:23:54 +0000
Message-Id: <20220505022354.61458-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_192359_835592_C165A1F0 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 6edf78c16fc8..f0a15717cf05 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -104,17 +104,12 @@ static int cs553x_write_ctrl_byte(struct cs553x_nand_controller *cs553x,
 				  u32 ctl, u8 data)
 {
 	u8 status;
-	int ret;
 
 	writeb(ctl, cs553x->mmio + MM_NAND_CTL);
 	writeb(data, cs553x->mmio + MM_NAND_IO);
-	ret = readb_poll_timeout_atomic(cs553x->mmio + MM_NAND_STS, status,
+	return readb_poll_timeout_atomic(cs553x->mmio + MM_NAND_STS, status,
 					!(status & CS_NAND_CTLR_BUSY), 1,
 					100000);
-	if (ret)
-		return ret;
-
-	return 0;
 }
 
 static void cs553x_data_in(struct cs553x_nand_controller *cs553x, void *buf,
-- 
2.25.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
