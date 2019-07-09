Return-Path: <SRS0=DwYL=VG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5CEC73C46
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 17:09:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B9420651
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 17:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O1KIy89a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoYHZDRv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B9420651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xFs7VfYcC2Jc3oRtyAi4PguAlWZ/C3PynElLbMETK4g=; b=O1KIy89aN7LlGc
	ncRYuSWQxah9bwZHWxf48pXP9UkJr+f3u8Nzv46AFfooTYg3n8C//Tmvtkd/YDVgD8FPAr5fvQx3r
	Ubn4etYtjIRCzCPTl1jsPh0vrW25lSpgsqtTRb1FiJBaqFNJ1SUZgHIflZ0kudS/JGpbPTKepvCZ9
	soEwlPO1CXnwV/Vk0t/cEPp2/wosojlIqk4R6P4gcxKJnVnpAnLqNDYBtDIwDAWXTp28A/HkpnCdK
	RQS/MWBDSuDQe40pmqSDd5NJynijKxz/1qDcyfFgktY4EOTnnwuoQXTBPIoJUbm3gaLy5nsrp79vM
	D54IvzmyXEtS7A3sz7gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hktbs-0005YL-EG; Tue, 09 Jul 2019 17:08:56 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hktbp-0005Xu-Gc
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2019 17:08:54 +0000
Received: by mail-pf1-x444.google.com with SMTP id q10so9596747pff.9
 for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2019 10:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5umYZXhCIOizuvf+9N0x82i8rwzZowr7K1Mof1IeQI=;
 b=KoYHZDRvrp0D7zFLV64rFXKXSDPi7YKb2/rq7t0auhE9HqciP39FsjYfAwLdccUw1f
 F1PytLQy77BVfcB/4E96BZuieWr9idfDQSB8QpWFbY/HOnzweXZGYJbYs4FqNeyLCw52
 kS88L+KZuSVoQ6b+Psvte1FEhyfc97jQi5GEg+3n2KauJkWSRaqFaIzXBIQvC/drD6+v
 gnCW1aMP/L6gx5P+kWOmQ6XGWIwH/aoGHAXlpY+4pfAnI0A9DcBUg3eHtq8cbLUW1wDn
 3FHd6MUUDOjcVDi/PK3pg0TgwSL+Ot4soq/PcWuoaXjxBB+NtT6VwliKMUlIhSPHpgy8
 Ynfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5umYZXhCIOizuvf+9N0x82i8rwzZowr7K1Mof1IeQI=;
 b=LiWB5509h0gSh2ipHfAIPQjslfkRpoTk2Whzw/UP+iPEhfm4E14QSDIKV5M9pXulmk
 xjh1KRYtsH9TqjoA4nVH7dYdr2cfiGek4ZiG5SzcXZUXUwqO7gxM0B5ySH7Es+HnrsUt
 9wQpKsljcjnZkFhMfilfc0uro5nEq5pXLKZevFGCnciZyY9UWdgcydu1ebYcVCe+bV7g
 WNVXFyuj1scvVWDDxYCjsLSkHHDVHSwZ6kuGF0WNxrB+FH4qZdH40w3WI1mxlmruuANF
 UEMWuoZHoy/G9EVfUoSyQGa3RqbBfcBUo93SbENYLDRQDmHhD1j6FLQ2tEbx2C6JW5TY
 3+KQ==
X-Gm-Message-State: APjAAAWPzYD0AlD+CPLKPHs30IOKKkwZRxxZTxx9AlT47HxEWDo7Yx6K
 XMQSn45lAFC8sxE85pgKkyQ=
X-Google-Smtp-Source: APXvYqxirR+UlBEiFvBQWvVsLnJQD4J9wnK41QUT76eqfc2Xl47AruO+YnUJp4B7C2nnol3kqgiZJA==
X-Received: by 2002:a65:454c:: with SMTP id x12mr31710217pgr.354.1562692132292; 
 Tue, 09 Jul 2019 10:08:52 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
 by smtp.gmail.com with ESMTPSA id k5sm2804460pjl.32.2019.07.09.10.08.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 10:08:51 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: stefan@agner.ch, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: vf610_nfc: Add of_node_put() before goto
Date: Tue,  9 Jul 2019 22:38:37 +0530
Message-Id: <20190709170837.13315-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_100853_580982_080C1882 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a goto from the middle of the loop, there is no
put, thus causing a memory leak. Hence add an of_node_put before the
goto.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index e4fe8c4bc711..6b399a75f9ae 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -862,6 +862,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
 				err = -EINVAL;
+				of_node_put(child);
 				goto err_disable_clk;
 			}
 
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
