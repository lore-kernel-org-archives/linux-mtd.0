Return-Path: <SRS0=Slyc=WO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BF0C3A589
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 15:53:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E8A20851
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 15:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hJCiXjmi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9E8A20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cs.uga.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=V+akNyL3rAVAcdkXwJJ4lJKHMNC1x67TYLsawCx6cLY=; b=hJC
	iXjmiZrTiCNXraeq5qX9E8wY2SUjVRehWWltRzn5Q0UeLM8bw9swzPOKqOYoigFmDivkD7LxsBZtj
	A8VF8lax77ATUKiOnfTt250flDVp+uG4b4vmPQD0zZPzqqX5faTNVXHAnbWOJPRLUZnmAG+LS7pYY
	CdvLbz922zvfuMGz/WJlzr/qguky+eNcwx0iOkWgH0mgP6l2OqFK2W+W3YWULPJWZnXjx+uIm2BDC
	5um0R6rEpOFffwzr9SEXCEVjV4lKFhzzzK2KBz390D5lSwwscGnInXN/3XX160fgJHC8BmTDjaS/3
	yjwvlhQP97KQ1V4bAG5bXcJ8Q0PcrbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzNUP-0001ms-KA; Sun, 18 Aug 2019 15:53:05 +0000
Received: from mail-yw1-f65.google.com ([209.85.161.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzNUK-0001mG-0q
 for linux-mtd@lists.infradead.org; Sun, 18 Aug 2019 15:53:01 +0000
Received: by mail-yw1-f65.google.com with SMTP id e65so3372672ywh.0
 for <linux-mtd@lists.infradead.org>; Sun, 18 Aug 2019 08:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g1IQSZ36049sL5m/iNqflUFI3mH7QgkOZ4xc+pWsHjk=;
 b=jgo5N0S6+z4k/11qjRW62rF/u2qrbhUgXbncIuVK1mBWmVS3Bmc1rXGWVKv6mmvDsf
 yIzijhLr5CVw8p6qEHJ8tM6NWYrZq2QnvuJkLgyHbLxjmGATgYNYIGYNgVMAQibUy0Vb
 9dKgGe/Qrr54g/xU2kZqAPUPSBUe1fPHMVS7Ira7cQ60oKTI3INpThy+69/o/z+0jMtg
 JRrrxWR0nlHpvO/h2ZQU0RgJRppNxUYvI4bY16KUAWRv7KyAHzN0/ur+amdq/5MYgFwh
 2TZChppRXDHCgVIBaxb6xWe8f2dSxOjY3ehM7nn97Q9dVynZ1BmVwVISE4+q3M2Xu/u5
 5iMQ==
X-Gm-Message-State: APjAAAU3OPlT9paq2NibwjNhTKEVl7Be1BoFtzRitc6QG70+L14zQ8F9
 Ez2M378d4uQ24kvF946bQuc=
X-Google-Smtp-Source: APXvYqxvMZQAwr/cqpIhExoNWtwaedluh56/MAsewvj01XA3Q+KvR1s7Ebyp1pxO0JoR4C3DU74ZWQ==
X-Received: by 2002:a81:48cc:: with SMTP id
 v195mr13809539ywa.140.1566143574212; 
 Sun, 18 Aug 2019 08:52:54 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id r20sm2648984ywe.41.2019.08.18.08.52.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 18 Aug 2019 08:52:53 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Subject: [PATCH] mtd: onenand_base: Fix a memory leak bug
Date: Sun, 18 Aug 2019 10:52:49 -0500
Message-Id: <1566143569-2109-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_085300_067964_03C6B9E3 
X-CRM114-Status: UNSURE (   9.96  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 "open list:ONENAND FLASH DRIVER" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In onenand_scan(), if CONFIG_MTD_ONENAND_VERIFY_WRITE is defined,
'this->verify_buf' is allocated through kzalloc(). However, it is not
deallocated in the following execution, if the allocation for
'this->oob_buf' fails, leading to a memory leak bug. To fix this issue,
free 'this->verify_buf' before returning the error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 drivers/mtd/nand/onenand/onenand_base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index e082d63..77bd32a 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -3880,6 +3880,9 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 		if (!this->oob_buf) {
 			if (this->options & ONENAND_PAGEBUF_ALLOC) {
 				this->options &= ~ONENAND_PAGEBUF_ALLOC;
+#ifdef CONFIG_MTD_ONENAND_VERIFY_WRITE
+				kfree(this->verify_buf);
+#endif
 				kfree(this->page_buf);
 			}
 			return -ENOMEM;
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
