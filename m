Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8D8FD4F03
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 16:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=riaRmNnLREpct5DbZwT165CSiZ5jmdW74RpyvqwDP/o=; b=WSAzSKRfKLfZiR
	AMMVb3eRZqCyXdkrIAyvIcYiyUUEKkanRBtThV26qmZ3jdHNa/jLkCJm+vN69EOr2XafhzAQ0fD6b
	YRfLum30OZmFkF1lKMDPYV8WOeP1aqwPLP7A5MZIZRuACzdMGzXwQwpGnPvWsdUEkjIQoVRopEJMQ
	ZkaKZuruGfhggnwyIsjpJL/fchUrMKSAB27MbUMf8+sHQx+B4ToKCPTbkf+DTKCGkXqVQV/FXGp1X
	uP0nw4TS1POzAWBs5V7xOnipaCsrYGRcvmkT7kJhZRFxqRcWdvS9aA4cCVgmd/VNNjZSOQhgZ882+
	dn4q0ZbbKosOFNpJ29ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzz1-00000009v9T-2XFT;
	Tue, 10 Mar 2026 16:30:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzyw-00000009v8w-0bAu
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 16:30:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so21652355e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 09:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773160252; x=1773765052; darn=lists.infradead.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYBvK2rlSIcllf1TDoPU5OPmatvR57ndq7IdcRF+FTw=;
        b=OVK/v8Em/WezpqXhoGuduwSV8twEFwZMTUTIl2iLVBDxosmWQklN9OZnImqY0nqfK5
         HlatYQnOZqTsV6JfNJxLzqkVf7SN9pmPVPJqtR8sOUJ9vydeVbAwTnqsaRKef3bY3KFt
         Fx8zIWE1HvGyGIFt6FzV/Z0GPpEryyfRlD0BGOqAqn0jYCyVnKKWRXN5rhbJ2yHSwbbl
         enPmuwHIcmZpJGzjWSNtPkoh8NX4xStUsuJofteVC0f6hvqIXWEtxU1JZru/mepGc3MV
         MaZ//TD/OUIrzHa/cpe/93KpbIBNINRZBOfRstTzKgK8iPHgdoHCsxiW/ARL8E9HVIu1
         NyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773160252; x=1773765052;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYBvK2rlSIcllf1TDoPU5OPmatvR57ndq7IdcRF+FTw=;
        b=az9o1pv/M57lfr/94KCf7VEe9rzeZ6zzRNeQd7LsguKMONWu0kmtDDk+PeQLHRmGAW
         2+ezuDEwucoDp0+M8NKRPRJJGYB4do4fmVVix7ot4J8i32YIU8tQt5cv77fRUMm88o2p
         DLJ+GoJslOuJ+X4P35QBvsXQBf4rtKcDZnIU8UTOpAR0x6vbtNN9ImIryO3vlhBePv8l
         NV6npXZsgWdzBkGqpg1dvwSm3rAxMC6HnjwzAcytLxHqpKaSZr5r+s9batOrc740uNbe
         w1ZNbUmc/S2hc9YcVyHEPPpgqjb1eaUUBo5v1CbJZFMlienbXQkzEFrdrfLloMsm6QTf
         7RNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhWNDdkg5GAkPdzCaCeqe7hpqLesOd5ZtD4tW3P6jZUg9xRXOTvFII0DykcNLanf6PhN8dMGyQ26M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yww8nuHjuqy2W5rb9aF7jmc6Vmr71fJlpx8tWYfpxE0YXvce2i6
	XGYDnzfJS+3itbvtTgrcwZQaHtPbbMJ49RYp2gi89XowJPYhQksa3hErkTVul0MZxn8=
X-Gm-Gg: ATEYQzyHspM05YkzD6rCXr/I58o0nY0RD/y8vh02YguN2kq5wxVhW/UjAsfohMc5C4p
	ajdCcfXEvF/lftfZ3lx0pF/PpMxWBXD4ozdGU4gnz4ACkUUP0nPLHdWSHMmAKNqSoADNMXGfBSA
	odYBc38AZewJ+CW7oCLXK6igIZ9xaNJLieNhmvqZ9OYdsD34PcpclBrrQ3SXpmVVE9XvtvroxL4
	wtvIp5vlbKhnLY2MYkTlakC+UjP5IZMcDYy90lXSVtNYJ3qwkhJAUj7RyEZnvdAHAmJAXmehMiP
	xD0YfiS9goZAg1Nrc9IQQPN3yVt8sQ1xrSSuoksqzPBQRHwVU96jjiXf5zUQaSc8xYjpLpbY5fc
	DEUNNhyj+Cu+IVIZ9fmpPIWL1alV/jfaILwj2lSWOzdzmbaD3Q1ce0rJ4KSwNpQ6ZNQgh9rHL6X
	MHTmkpVgrfL+roqcmHZttwb6ERUWdJXf6/PgCFZSaIR/kU0IxQA6TxAuWUqQVQ
X-Received: by 2002:a05:600c:3b0c:b0:483:ad56:8d16 with SMTP id 5b1f17b1804b1-48526918944mr271866725e9.6.1773160251764;
        Tue, 10 Mar 2026 09:30:51 -0700 (PDT)
Received: from r1chard (1-164-69-22.dynamic-ip.hinet.net. [1.164.69.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852f369118sm112376625e9.20.2026.03.10.09.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 09:30:51 -0700 (PDT)
Date: Wed, 11 Mar 2026 00:30:43 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Lyu <richard.lyu@suse.com>,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Thomas Gleixner <tglx@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: Use scoped_guard for mutex in nand_resume
Message-ID: <20260310163036.300392-1-richard.lyu@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_093054_221356_28650F40 
X-CRM114-Status: GOOD (  15.15  )
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

Refactor nand_resume() to use scoped_guard() instead of explicit
mutex_lock/unlock. This improves code safety by ensuring the mutex
is always released through the RAII-based cleanup infrastructure.

The behavior is functionally equivalent. The mutex is released at the
end of the scoped block, after which wake_up_all() is called to
preserve the original locking semantics.

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
---
 drivers/mtd/nand/raw/nand_base.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 770c26f9c6ce..9e3561f34ea8 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -43,6 +43,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 #include <linux/gpio/consumer.h>
+#include <linux/cleanup.h>
 
 #include "internals.h"
 
@@ -4704,16 +4705,16 @@ static void nand_resume(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
-	mutex_lock(&chip->lock);
-	if (chip->suspended) {
-		if (chip->ops.resume)
-			chip->ops.resume(chip);
-		chip->suspended = 0;
-	} else {
-		pr_err("%s called for a chip which is not in suspended state\n",
-			__func__);
+	scoped_guard(mutex, &chip->lock) {
+		if (chip->suspended) {
+			if (chip->ops.resume)
+				chip->ops.resume(chip);
+			chip->suspended = 0;
+		} else {
+			pr_err("%s called for a chip which is not in suspended state\n",
+				__func__);
+		}
 	}
-	mutex_unlock(&chip->lock);
 
 	wake_up_all(&chip->resume_wq);
 }
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
