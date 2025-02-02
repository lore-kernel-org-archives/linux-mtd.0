Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC4BC0218F
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Feb 2025 20:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hcQ59XqvooueOM9ypqzEX1329beu/vzVcyiHbawmZHs=; b=V89pT+z/iP1tM7
	BSHYtWUIQdjveqNpQIlkOfJKIZP1c8Mwm2n8omPbKXc++cBx4DrWu81ovymsJMSzpNfDRwFZ5NVM8
	3+FY/f89eOW5mtLKThgrUN3fp6gzBNwmJrvvtx4aT6AXn6/5iVHn0Yi5t9GcoIyGJzY+UVDlLZRNz
	6D9XbIxKDGlLmvQxcNISjynYF2UWjytS50Gc9vx98hn+Iko4koNvndu7+gzhetan8nYduBmilzee/
	tIaOV3C46PPGvKI6bdQXgOwEDhE3C4VzeiV+Ktgpoh1Bv2yChunQ6p7ZBXUJ0emKIN8sXZyEoYuAO
	KoDFz8PT4zcqCXmpTFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tegze-0000000EAtc-30sy;
	Sun, 02 Feb 2025 20:55:02 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tegzd-0000000EAsu-09AZ
	for linux-mtd@lists.infradead.org;
	Sun, 02 Feb 2025 20:55:02 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6df83fd01cbso14502376d6.2
        for <linux-mtd@lists.infradead.org>; Sun, 02 Feb 2025 12:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738529699; x=1739134499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rT2razBgYYJeyhqnDlx7RfYfw1o1xvrrpfPKnMB5vQc=;
        b=hr061M0MeDV16u0+rVKICBZK8kJDAID50nw2C1gtc8t1p/kp8CFBuQ7Yjo5XBZ2S01
         0KW7ZNySvqwJ/Qab6r12PpDWikAWvcLz2grQsr4H1wydFkG8r8hFgpewjOPISQ4V7asB
         aqBVx65T9ZFUf4e6i7ODa1KBuEZhLOMx/BXATJg8hThlfY9fnq/1QxCA/cXTY8JNpcFt
         9PukMAW8OFjnTVVVvpVhpe05KPV+CIfjPXrYqQBWr9wf9S2ZcvNA4PD8A5RBwriAs7WD
         RPY3B3ChcafSK10VwUou+8934YTVaEthJmV1+4dOyZqwm/XDwbnYhDOov2q3LRk7g09N
         ZbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738529699; x=1739134499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rT2razBgYYJeyhqnDlx7RfYfw1o1xvrrpfPKnMB5vQc=;
        b=MQkPo04pr8Zvcw1wRvsWTk1kNkh6aD/G+9jZqmWlGfbsu9R015KQOIR1ghjZ3U1olQ
         7IoIzUflTpmis0sMSSgSWsU8RG0h5BnqEWl2f+06C4nb5/UCg6ULFdhQGYahUFT1BzN6
         w4snuq/ha5JGICfkxye7Ffh6pFyK9TytRQOf7ekGq/0PiJq9Tg+8hhL/hFSyFGyTbUUj
         OUviRZK8KcWNn8KBGc5gULoLn9SanHRm481JiBBFiRu9y3+q7b6pXoQEMwrlAQmOM1YX
         BhHXORXxLG9Qi9kg7uJG72kUi5Ke4BOwKn5F3/qhzeQ6am1foMu2AhtmXbDBi9Eiia8x
         Xh5A==
X-Gm-Message-State: AOJu0YwfRQJNQq6YPCiklWWCF1cThylqZkcVij+CL0SUOSYwCcR2XTwy
	Nj6LmYfgVLGW+IDvCQPElJ2pI8uj04f2cENre9Kl7RLNxzeBInd5
X-Gm-Gg: ASbGncuX6Wh5GqYGc4idIL5HBKP+HMOOrKvk+76yudiljFT29ow3/iPXtltY49kCfqR
	X43H9uspmkv2g8XrVrel9YY53A+29Q2zk2wKHOOF5FmdnwIn1gnjqQ7sqUQgciCl0Kq7bbP0Us6
	AKzTEdfebHyXnBst7nKj3Q5XcrXxCOyv+6m1/72EFwHuRoivicCmd249H2UQVE9l65MMCPkfUuZ
	HCREGDDuyrG5wRNdGUkHjc6TLhZFzXJ62SwFYwKbhRXS12+wOfYYAd8Msfd97UtOJBBOM+b7VjU
	MvgzH35jOYQULrMDL8+YvOj/p2SliFGAv0QVLg==
X-Google-Smtp-Source: AGHT+IE+yEzbNvz9i5VKkbMR3ffb0vBqjbRSv2MAfyT5MWhcyo5HeDj2LIiHyPMxpTp1mvukg3bI/Q==
X-Received: by 2002:a05:6214:4008:b0:6d4:b1e:5418 with SMTP id 6a1803df08f44-6e243c648a2mr275585646d6.33.1738529699409;
        Sun, 02 Feb 2025 12:54:59 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e25495e76bsm42373246d6.125.2025.02.02.12.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 12:54:59 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	gmpy.liaowx@gmail.com,
	kees@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] mtd: Add check for kcalloc()
Date: Sun,  2 Feb 2025 20:54:56 +0000
Message-Id: <20250202205456.40790-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_125501_112453_FCC4FE90 
X-CRM114-Status: GOOD (  10.13  )
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

Add a check for kcalloc() and print an error message if it fails.

Fixes: 78c08247b9d3 ("mtd: Support kmsg dumper based on pstore/blk")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/mtd/mtdpstore.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
index 7ac8ac901306..368997155c07 100644
--- a/drivers/mtd/mtdpstore.c
+++ b/drivers/mtd/mtdpstore.c
@@ -423,6 +423,11 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
 	cxt->badmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
 
+	if (!cxt->rmmap || !cxt->usedmap || !cxt->badmap) {
+		dev_err(&mtd->dev, "failed to allocate memory for map\n");
+		return;
+	}
+
 	/* just support dmesg right now */
 	cxt->dev.flags = PSTORE_FLAGS_DMESG;
 	cxt->dev.zone.read = mtdpstore_read;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
