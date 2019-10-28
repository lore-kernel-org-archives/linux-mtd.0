Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B13CA9EC0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 18:08:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDFD20862
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 18:08:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ou7I1v9K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1PKiPJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBDFD20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q0epYvEM8gjqpwJlQdM2//H5yOq5e0joXQmcXhyo7jc=; b=ou7I1v9KnMbIbH
	Z/ZFgHKyv5H4jZPCT1kp6nAVPmaNPmHhMcUZmqexotE2blXU2OgUxCN0cDEn2VwNCnq805c7rtNiq
	G+F9n6ceAopEuwfX7QOjFHS/nHycZwM4JR0kOXgg2QAiVOmciKBEmWr7PUUU0SW8i8x93t2WZqpCN
	oO/jGSC6MqaZ/OnSTsk5WvPe8ry/2zxX3aZqO8YMcghQLShvmf1yNUu3l80CMKkaHCIaEBfUvCVy2
	fwcZvcmFN7otFITkOyup2HzGWLnA8d7UWgsHegD+6tpK+tIfKJh1jIGETCtmMBGsoeIJYmylca9E6
	hcR154QSroAYJmTDpuZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP9Ql-0003SK-Rx; Mon, 28 Oct 2019 18:07:51 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP9Qc-0003Qc-8u
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 18:07:50 +0000
Received: by mail-pg1-x542.google.com with SMTP id e10so7385979pgd.11
 for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2019 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=KooIewZwbvjOkWEaBdb5ogJ6e+TbvWJNeEYKOS8P4w0=;
 b=Y1PKiPJSo5cC4StnmwLOwPxBIOiH1/YjuhzkGWx/4kjWfWLT96mT2xSrwfVi7yHFEl
 Nh5NKHRthKhTX38td42WJaxB7C3k4RnOtzAnd/+cwXMPAkE3gXJcIgkRB0vVN8o9bcN4
 KAp7kN+geHLFssZe5717qy+JPk/T5xKxDrkTMcvlXZmievm/WR8G9YLZjh9nakfkEi8c
 DuqWxZHoTQVwkP3WRh337YW3LM5Mvc9mLDhNNXAY5c6wXqksrU5cSXZO2Ga09wU9SwfR
 LCosxU8Rahy9Gs3YHw1vnjY/XZ7JWwuSclzwONsO/L1nul6Ksh4YXaEw13q3UQ39M2GX
 TZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=KooIewZwbvjOkWEaBdb5ogJ6e+TbvWJNeEYKOS8P4w0=;
 b=c/b3W2qL96U0GVK17tp885k5/+47FZZv0pVK2D3BiQeD/8WFUcyoQtAs/JFjeiZ8NP
 UYwGDBZiS89zEGD00/E2JaRdSg4Zhl0wWRZipr1VZjkhuKvWgJA505Ow7GK+JqapcO6l
 vnK0/m6gjUU87/RTvTLYOnxSTktn2greCBmKbaaWolw9DjI+gUar/yxEx19mApKTF3VT
 cvz6ZyCeT246dGpBQPsfuNlYCnABzEKG7M+otkx6nqO13eJrgBpJzyp7PiBrDTieKgJA
 IjNtIkI0SnrBLAk6lbqR2loGZeBBcqhCNgubpIT+5e3B78cTIUdM1ucWlBUbDSoWKraJ
 i7GQ==
X-Gm-Message-State: APjAAAWlZstX70LgMBa1hMwKFEFYAGcygc29oOuN5cxdfIQgxSHhuyFd
 DKeOKGQfZoNCQkGLbmFokvI=
X-Google-Smtp-Source: APXvYqxbYQIyXuOm4thgIzsK1cAneqYYBmH5ZCOjF7KVYtMewLsSjXsd96H2cMKo8EN9gFEru5EWjw==
X-Received: by 2002:a17:90a:37e4:: with SMTP id v91mr773608pjb.8.1572286061510; 
 Mon, 28 Oct 2019 11:07:41 -0700 (PDT)
Received: from saurav ([27.62.167.137])
 by smtp.gmail.com with ESMTPSA id i102sm168856pje.17.2019.10.28.11.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 11:07:40 -0700 (PDT)
Date: Mon, 28 Oct 2019 23:37:33 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: joern@lazybastard.org, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: devices: phram.c: Fix multiple kfree statement from
 phram_setup]
Message-ID: <20191028180733.GA26168@saurav>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_110746_639802_A08F669F 
X-CRM114-Status: UNSURE (   9.94  )
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
Cc: saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Remove multiple kfree statement from phram_setup() in phram.c

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/mtd/devices/phram.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index c467286ca007..38f95a1517ac 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -243,22 +243,22 @@ static int phram_setup(const char *val)
 
 	ret = parse_num64(&start, token[1]);
 	if (ret) {
-		kfree(name);
 		parse_err("illegal start address\n");
+		goto free_nam;
 	}
 
 	ret = parse_num64(&len, token[2]);
 	if (ret) {
-		kfree(name);
 		parse_err("illegal device length\n");
+		goto free_nam;
 	}
 
 	ret = register_device(name, start, len);
 	if (!ret)
 		pr_info("%s device: %#llx at %#llx\n", name, len, start);
-	else
-		kfree(name);
 
+free_nam:
+	kfree(name);
 	return ret;
 }
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
