Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B246AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TfP9UVHmUE5523D8hKE+U+6nIBYtZ06ZkZ1zCNJRJ/w=; b=cNl1FMu8yiXa2C
	Mq/1DQ0dqGoBdc89F4Zo/8Ur76WSDOUZvf53OCsYppgtRgrHiT1U9pPepM62teppK7trtes36Ht3C
	HTYLG3rGJquNwHnP0OTHd3ZpmEEyx0Zb5PxSIzlzSoU7RdW2KkeCdUv/wEMEDqTztsa5k/hd6g7Fa
	4SwokDVqZ19hRpe0Q3obc2SpvDFqZeLi4XwPO8wzzR1QZ3fFbzRH9DtQbtW2qWF7lLW6bPOmOo575
	KJjKBQyiU5v2ZUm3f4SR0Til2dwUHelVhqZTb+VmjHcZEeZOESstY3AN/7yRtAWjcFR4+WDmp2nvq
	pGMcwV+PrscHp+Qo/N1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msnKy-00Cd0B-MQ; Thu, 02 Dec 2021 14:45:28 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msnKs-00CcxU-Op
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 14:45:24 +0000
Received: by mail-qk1-x72e.google.com with SMTP id m186so94200qkb.4
 for <linux-mtd@lists.infradead.org>; Thu, 02 Dec 2021 06:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vhfYF1q8pRLBdna4UMdUTJmmhIGXKoIu2xP3XWyR2vM=;
 b=FSDxhg+1iH1mXBvPwqEJ+EGmtPcw33F3cJ8E+jhdh45SJtHAF2RQ1WjSq8zPlxltif
 eB5jNUgHJiKKHYa84BPrEk4LvG1wTYFcJst1F0FsfU0vUygi47oOd4/pPK1BZfn/ZV6k
 5BbC0kzGwhYyIlDEzH0vHq69pmve0ni2TJWVc6h74Q4MpKsSWNDJnD3vPTxkHNI1wMCC
 wOh58Z+Qss5gEHJhCY9amqlX1romuPDQoISJQnHHsh4+fMBDiIvIHOeJeEYVq3MyXLxu
 Q2cdNAVu+64h218DtAeXeDYsSsOVhKCLyizxTRXyLaDhI6E28FqMceO73tPdWheaFsUU
 yvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vhfYF1q8pRLBdna4UMdUTJmmhIGXKoIu2xP3XWyR2vM=;
 b=FU7azAD5hovNicF3ksPTM40lE6hPeAkgEW+mi+MHcInzWiJnZZXqSGkA3hl6MYinAl
 GXzmUmXKe4FrfGScS7tDfsm1Kg/sO0byx4/WJQmLIe/zcOrO1xvd1SzWMJoxZpU/sjdK
 1mZ+bAK1o2xrh7nl7gEq9a22C0hnc7vz1uj+0rewnwscs3gXS5LvvM3ESLI0ysykaH1A
 JX/BeK1SNvHlNXu1xI6gxznPn1BUDTd0Yc86Ufeks+e+pHjXP68wrRG7IrmhzV1mszoL
 1GNs/T+jA7j716E3naER+UyCn6Xrm3Lio5di9ty87KKFD9TU5Tjrg1hMionTbUpE/n8M
 egdg==
X-Gm-Message-State: AOAM5331FXIpjxGE1M/9wafas5l9suYf4HKuQbxCvTEwFhN6W5N4kHvd
 rs27h5dA9ntX8y5XsHclTwR5xw==
X-Google-Smtp-Source: ABdhPJzBU/z33fhZ1UwQ9yKQTPJTu6fz9ZXlScNc0NzKMa7eX2Gar9Y36qxgKq8/2P7xO+NTj7RRXg==
X-Received: by 2002:a05:620a:2808:: with SMTP id
 f8mr12502886qkp.434.1638456321836; 
 Thu, 02 Dec 2021 06:45:21 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
 by smtp.gmail.com with ESMTPSA id f21sm1862119qte.52.2021.12.02.06.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 06:45:21 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: david.oberhollenzer@sigma-star.at
Cc: linux-mtd@lists.infradead.org,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] fectest.c: fix buffer overrun
Date: Thu,  2 Dec 2021 09:45:18 -0500
Message-Id: <20211202144518.3133036-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_064522_842082_E5ADCEB4 
X-CRM114-Status: UNSURE (   9.30  )
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

misc-utils/fectest.c:37:11: warning: iteration 47 invokes undefined behavior [-Waggressive-loop-optimizations]
   37 |   srcs[i] = buf + (i * PKT_SIZE);
      |   ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 misc-utils/fectest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc-utils/fectest.c b/misc-utils/fectest.c
index fcba513..eb1d33e 100644
--- a/misc-utils/fectest.c
+++ b/misc-utils/fectest.c
@@ -21,7 +21,7 @@ int main(void)
 	unsigned char buf[NR_PKTS * PKT_SIZE];
 	unsigned char pktbuf[(NR_PKTS + DROPS) * PKT_SIZE];
 	struct fec_parms *fec;
-	unsigned char *srcs[NR_PKTS];
+	unsigned char *srcs[NR_PKTS + DROPS];
 	unsigned char *pkt[NR_PKTS + DROPS];
 	int pktnr[NR_PKTS + DROPS];
 	struct timeval then, now;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
