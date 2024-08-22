Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E915C531DF
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Aug 2024 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1kXKE4VTnBKQ/nZMROMnm4HYkUjH7cnA0tpjwbtYyNg=; b=Z7WjeV4dO9rado
	KpRE+3iED2ezNVizYo1sBXEpYZCOdgR9v/jpwhawopenCWcOkfGblAHa7FRe1mnWZ2YO2WkCUH/NG
	Wc9bXRFhFd99hzbfg67FRs0gT1t7ehROieg3TjRqmJCmfrx4eAZ8S3jQgNzgmDRb6iSqd3hJcNSwv
	qsMHdxo195mQD7LVSzOVnTCzt1AKv6lIGqWE7aHaA+phpJI8jNF/ER86KxG1oxP+iTEFm4ApuCrwl
	PFmKHkUUt4fzGtUWPBqJryrIr71Ejj35V4wSj6HPvCR9hZA1zmEQA0S7gDMdbHU3vl0qPGgGPXehW
	0sQ+DWXa9yL4WnYu3Efg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAzs-0000000DfSN-42x3;
	Thu, 22 Aug 2024 16:49:16 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAxI-0000000Deg7-2VsX
	for linux-mtd@lists.infradead.org;
	Thu, 22 Aug 2024 16:46:38 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso12339421fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2024 09:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724345194; x=1724949994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XfmAhjWG2sOwGq6j8+6XVe0OoaQ5ib14uvk/YZBFpuY=;
        b=MRSY2vCNGNuvcaQkqqCPhOa7IJLH/UKUI0RMJ2oGWVgxZphMK7EavrhLmZabIHchST
         ErTifn5DAxWIsXMqdnJPGKv3HfghhJgTbHKjcsMxKUfUiKdioa7pZjk4m0+Q2AwhIbUW
         TB3VdeRgemHarquraXPYSxw/wsTf9SK32LtJ/OJrqlsUDo7MII1muRovwV/bIzRYznbH
         0d3nP2sAULJ0EnhzjFIHqk9Ck3QNQkXy/XYD9KrvPZTU7vbD2voMWOmKeL25kiuUboCQ
         RCrUfIP686h5O00bSbk9NQ+4N7txHNRK+BRrM51Q9Zqz1MrFOCs8PPXoWQsShKaD6Fxc
         Ah0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724345194; x=1724949994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfmAhjWG2sOwGq6j8+6XVe0OoaQ5ib14uvk/YZBFpuY=;
        b=jt4ci48/5OqFS3AzUyfJu374RD1588sz+w3pfudLfFgF0xxKc0ylypnIde3fvrmMHK
         BKwv88Iiznl183dCuH08BDMAmpT27LhqmxPOvV4JxyA7QcQ1VZaFIGFlnNDKkwPz3QUk
         WPEj/mNjhOh/5V1SphAZE/iSf94ogbl3y1C3x8qlo8ddrgbnvFbbRcBLqM5h3EWC7I8Z
         Hy0V0Ozt2LUwsug+/Mw+0YBq1WjzG6dX0pvLhkKDuSQ1CPzjCi6KEFE4AiJqXZvAhu+S
         iatYQLGqye0PdWfWzeo0TXYG6AUaP7T8XcuL8zzS3jtIYSV+Jd6TJIiaveYkxvstNuM9
         lmNA==
X-Forwarded-Encrypted: i=1; AJvYcCUBQiQE/HXn4JCO+0Hc4Pu8fQFbNRemxqyVTsLbg+Mp/Xj9Wnt4BMdEkZjMmvDFRaxQmZqmuKCIvO0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6xcDgAOEOQPxb5Nj7yZa1UyJnwcXprIVBGIELMtqMBMQjCUZ9
	SZhYfEzxKpsBpABVt4xdlPsVswMiIbGPvu2HdeBJPy557cOd9RBd
X-Google-Smtp-Source: AGHT+IF6GUoQW921ObHker7LldBOgNZ9yNjYnuSAy6U38EnS2MbSKP4J9uiayEbJDgQhtps2Tnm92Q==
X-Received: by 2002:a2e:5152:0:b0:2ef:29cd:3191 with SMTP id 38308e7fff4ca-2f405ef037cmr20766221fa.35.1724345193572;
        Thu, 22 Aug 2024 09:46:33 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0515a6342sm1110560a12.79.2024.08.22.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:46:33 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: parsers: bcm47xxpart: make read-only array possible_nvram_sizes static const
Date: Thu, 22 Aug 2024 17:46:32 +0100
Message-Id: <20240822164632.638171-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_094636_669376_5C57D106 
X-CRM114-Status: GOOD (  12.23  )
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

Don't populate the read-only array possible_nvram_sizes on the stack at
run time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/parsers/bcm47xxpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/bcm47xxpart.c b/drivers/mtd/parsers/bcm47xxpart.c
index 13daf9bffd08..49c8e7f27f21 100644
--- a/drivers/mtd/parsers/bcm47xxpart.c
+++ b/drivers/mtd/parsers/bcm47xxpart.c
@@ -95,7 +95,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	uint32_t blocksize = master->erasesize;
 	int trx_parts[2]; /* Array with indexes of TRX partitions */
 	int trx_num = 0; /* Number of found TRX partitions */
-	int possible_nvram_sizes[] = { 0x8000, 0xF000, 0x10000, };
+	static const int possible_nvram_sizes[] = { 0x8000, 0xF000, 0x10000, };
 	int err;
 
 	/*
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
