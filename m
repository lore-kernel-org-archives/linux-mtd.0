Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD5EC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 04:50:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F6C2086C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 04:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jIDwV8Ij";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzHJfH+g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F6C2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH3RY00KzwKLei2N6+qedq4ukcOAK1rSrsBW/4dSSzw=; b=jIDwV8IjHx9yCK
	Pu1dodnPKADKLTeuyoR1SIfe2q37La/kXdmqMIrzsZ2fVmFExEpq4dkvZPlQPiUiOeaC8YVGtM+rZ
	at5SM7+jxjwAc854FX5c0xMdRiisMLWLIiXy/k/G4FkdMY0zTz8207EuazZbyh/PC5DvhAAtctXxj
	87F/lO2z98PYNIfY6ULl7AaEzM5Uan8uMW/Mc0XvFHATlKf+TbmsDqcmwnTDJPU2QeVJM6qO0I2Yr
	17yM2Lz4hc3NgYEB1lMiVRvd03WUvKXfa0pA87qyM0oHoqp3gLcr5vqR0k4CKFGYFoF81FYKh3zt1
	lgQlDy7I7waLJcw2CGOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAotU-0003zD-0V; Mon, 01 Apr 2019 04:50:00 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAotL-0003qt-OM
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 04:49:53 +0000
Received: by mail-pf1-x444.google.com with SMTP id 9so3890718pfj.13
 for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2019 21:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PFXB52oKOKtWpAtHBWrZrl223idOSLqoOifI3aKzID0=;
 b=qzHJfH+gXoL+e3XbbyUDNtYpk4IUcqV6A7nMsP1VO9cEbancdc9BfuNgW0k7iGoUA8
 fwQV4lrerur+amO7XbG/y7pG8+afQnY3we2UlsYVfhvfPNFQUdalU1bDj7B5dcMOP1UV
 mVIsQV7kCWqzBG9i1IpzA3VkK4CiGeQiWb+xHuPDxJFR+qDQowEWWPEfO7nJ6nrwnMIi
 TeY6o96IkcOIs8ScaKXXuyRrdcqw0tMKH+52bRvfwg4cq7ScqE2gH97+/yeyqBd2Cmfv
 nCq/IFkgdChjfDZKVUypMdlRmyvxn5kRFO4Y66YuCpXNp/rA46UCbdwHBugqBivASu9W
 YJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PFXB52oKOKtWpAtHBWrZrl223idOSLqoOifI3aKzID0=;
 b=QEb5a2wvuzJaX/KDVnWQtDtxw+7xpDZV42VKl9H5CMtQ23ExuyNwmwoTQsMlrC/kqp
 g6dFuUQPB9tGnwhtbePd4PhHY/sDGLkIfgk7u+qnm7+7STH/CMJNV5lcduW1E1XI6PYF
 0Z8J5sZ9fccg5YqCe8zsheRbzbyMoaQU6EsVcgAXR8vadV/2+XgliI0pDdRrXe6IcMUI
 PYdKXKIlX+da7i4wHLvFaJ7BqyfwvKHLooNTJevlXKzsKkprPvFjtnzLfKO5uS2AgrBR
 iQkGJmCGMj1agmZKAYohjqtdyx3+vOHTr9l0YKct9NMTFQ23G9DfSvu+Ghmwv3hrXs/z
 QjhQ==
X-Gm-Message-State: APjAAAUiUAYFW0XA+/64vQDyKx6GBpdfTxvPB+K8bJZRB2UW4/RY9FMQ
 2Ad1v2s1MMV1YnfvA0lY5Rkcdy/F
X-Google-Smtp-Source: APXvYqxA6JlUi0W041FN16C641ZvmSjGPW8+EAd+/bdmJ+gnOhuKIAxGTRBVkdIehKj9nBq90d2Ulg==
X-Received: by 2002:a63:550d:: with SMTP id j13mr13455225pgb.18.1554094190765; 
 Sun, 31 Mar 2019 21:49:50 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id i31sm16256097pgi.36.2019.03.31.21.49.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 31 Mar 2019 21:49:49 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: devices: m25p80: Drop extra length clamping in
 m25p80_write()
Date: Sun, 31 Mar 2019 21:49:37 -0700
Message-Id: <20190401044938.31237-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190401044938.31237-1-andrew.smirnov@gmail.com>
References: <20190401044938.31237-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_214951_788927_102B249F 
X-CRM114-Status: GOOD (  11.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

All of the needed length clamping should already be taken care of by
spi_mem_adjust_op_size(). No check like this is done in read path, so
this extra check in write doesn't appear to be necessary. Drop it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/devices/m25p80.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 114f8ccea85b..a54cad9bb6e3 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -103,7 +103,6 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	ret = spi_mem_adjust_op_size(flash->spimem, &op);
 	if (ret)
 		return ret;
-	op.data.nbytes = len < op.data.nbytes ? len : op.data.nbytes;
 
 	ret = spi_mem_exec_op(flash->spimem, &op);
 	if (ret)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
