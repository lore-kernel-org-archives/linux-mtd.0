Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF7BC5DF6E
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Aug 2026 16:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ntXJ4s9YNoBnFdT0rJLsTH78CHifKVEVVCubdenWC2E=; b=JMzCvirqjyShwB
	qjqH1kRh6CsIE+bmRlmrk2TGrd74dJsJVOnXOSgGbqVPG2rFLpmeHzLXM8zUBSyaGVudAMltwby/v
	v3VFK1/F1lUrTkaKk+eCLmKPC4aUPWWIa2TuNiCvLYhLdMm3K59DqxyrTbs/ehd7CVG6V2ZfQ9rMu
	SdZxpgTyTUx11ZOts9m5WaSxdSAsFBom0p3MSNeWPt4xnU5Xj7z+3hLmJtewrT13TnQjFXa0T0e6r
	WMUcZgLAmeDe3598gbN1wSfNa6J5TsuJzoT3w/1b59M0OzYkcquRCvOsT35P6RV56cnA412SfyUIM
	1ZBstQAAg7EsOsYxTt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvdlJ-00000004teM-1sPl;
	Sun, 16 Aug 2026 16:31:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvdlH-00000004tda-2h22
	for linux-mtd@lists.infradead.org;
	Sun, 16 Aug 2026 16:31:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso18992225e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2026 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897862; x=1787502662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=na390AzNOkaUQFi+p7Hb8paqMuka4IP5Q/AXi6RWtec=;
        b=AWcaRQej9Iv47FoTZZPIMcwZ1BIdD7bgk48dzIwAoZsvl/0pv1s9ucKGIZjHPRTg/h
         DVFEX7CBcNDmrr9e+TcG91VWv13MsZo9GRgLxUWQJQ9aadmygV9tH60mW3WCy38LokWT
         8H5nPDY5FrcWMyXeNKtMNHeqOkk8DU1llgl+PlHJITcPnr9Wxtp2Z9AEgkYJ1lbadcuK
         iDH7Em+l8yKptNerpeNV1CLAZjydbiVeOwaD/zndMxJ6H49qMDGUkaBxzwzMYfYd26DN
         M0KICt84hRX0yE+FM7PCqCG7Jc/Yor5G5HpwSn7K5XQUinO4zwxYtDqK9YHZWYGkPnk+
         nGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897862; x=1787502662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=na390AzNOkaUQFi+p7Hb8paqMuka4IP5Q/AXi6RWtec=;
        b=fsZP14Ffhk5KjD6+il9Z5AnB+uVdbHq+DsFbiZIZRVES14ESnnAuUcc+ADF/rxwC2P
         rTJIsmvXx/MI5ToS8AwWatmnPzNccS0ublBTG5F05atvH1JHAI7l6g6PUFscr5ZiE0xU
         9qqcdV4DS+0kH+cBULU+M/wZm3QmvJlNFBJPM1o++9+2+z7xCcXPvo0Mj4J4rGvxjWnd
         ZXBzZJRLbNMMNvELNVqJVaHq1Sch0VyZzBf9e/KZiHmMRtD8IUaJsF3SY2ZnwfinXb9f
         vWV1o7AzFr2lSSbAt5TxrE2LFSnbDJMYLbV6JZhOiwEQ2jsok40sWXfbYUZrMMhiCvXm
         pV0Q==
X-Forwarded-Encrypted: i=1; AHgh+RryJCYvDKUTrCxElE+lHN/UIZwPMcZPY2Qpn1tQJuX5cwOmnfWlYqE7jvLzipfpBhJCrLD7IzNQcMY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxqNqkOFARc/7tWpxQZqKeKVwTFM2aNhlkFa9iO4CSSmCDhbht
	ro45vUlQmcIm1vSfGXUnbYiwRHyWJBSAZBRojHd3WH5cSltQhPSRSQYB
X-Gm-Gg: AR+sD11lgPe/xQdb1DjiWibd9H8qePZSgDARDhEGjPK89GT04Wo1o31wx+lD5jaKE5j
	663um54fU+7pkfZggu3fHPjEqDMU9OAmM3n40fI5tK6+85ScXsv8uVeBa9DIiD6unWQKK6uF3B/
	tkqfizg7YraaqxADfr6JMYlCSyUAQgRl5CbK+o/DYCSCPOJg7WTCeb0pfNqWw0+QCFvPs0PZUsk
	iE7+bx1u+AjJO96krlx1ET6/uxq50nZbVysBaOfaz7LylhKGsFHUAplMRu2iQJlH8EnKgZ91PuC
	b4l3GhPEV2mZBprvzzJ7Op+OZhMhewO8tWXC2QVt+Tvc+M5Dt0lRC7jsxl2O4b7D/oTK9eCWyQV
	U0GW0iPM/CDHiI025oF4jwdyW1sMvpeumKCcq68d/OLRXSSx+J9tOyzniKJB7HvEDC0QGF6j4T3
	sA0KuBXCN3NHd1KccW+tXDQsqatX0eTuWlMvY4o36gyVpXp6pvMNPQCaNXrXZdI+ZYVSAfhzOhc
	lK8eHDU/hJnHmPcJGrxbgJ43AGz4QOr8Qyv4LG/8NPUKHfwY/fXcc0Aq0TtAT7mcZ0oT7f6H8NC
	ebA1y1ZRhcE6DPHGrLiLe6W0WEwFlY3r9fJ0iEG6kM1OI/swup/NsPgvarkawmBGTRk=
X-Received: by 2002:a05:600c:4715:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49994a07c77mr92587015e9.6.1786897861275;
        Sun, 16 Aug 2026 09:31:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc5-9401-09c8-a88d-e919-d148.310.pool.telefonica.de. [2a02:3100:9dc5:9401:9c8:a88d:e919:d148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996109652sm80268635e9.4.2026.08.16.09.31.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 16 Aug 2026 09:31:00 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: core: call _get_device() with the master MTD
Date: Sun, 16 Aug 2026 18:30:58 +0200
Message-Id: <20260816163058.10099-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_093103_694797_F5504821 
X-CRM114-Status: GOOD (  11.12  )
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

__get_mtd_device() calls the master's _get_device() callback with mtd,
which may be a partition. __put_mtd_device() passes the master.

This breaks gluebi partitions because gluebi_get_device() uses
container_of() and therefore requires the master MTD. Pass the master
to _get_device(), matching _put_device().

Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 16629382a787b..ab840922b5b1 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1333,7 +1333,7 @@ int __get_mtd_device(struct mtd_info *mtd)
 	int err;
 
 	if (master->_get_device) {
-		err = master->_get_device(mtd);
+		err = master->_get_device(master);
 		if (err)
 			return err;
 	}

base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
-- 
2.53.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
