Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F52C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daVDhlxhL/Itc31Yn/TL2AUHqeoJP+b7ilHTeY42SnY=; b=cZxFptF6Xr13Si
	odfeZ9FFLpIHMoYyVjI6XxAYxVv/QY/5rD0ohe/ySf7J1MrkBU4o6olVVVJmBEeQUCx+fiqsvjb38
	JsPtvpJyfq1NMzQT22Xpo1d06VqGrji+vWj3HqFAyZCEAkQdy2lKlRPp0hz1b2lrzT5X/RuylE5fj
	ybFoP1x6xrHmpLNzT3v/KQ7bcNmbd7e0jv30FA/uu9PnhTDu6wRFm1cBU7D2E4ixwrU1szFOzT8J6
	aEUHcrJ8I6wBokVWpp8hJfItPCIcogUT9UkXMjob5KF7amlAdH63xkX8vg5KB9HadH90w1TcKsGas
	K6qc7s/6HyeIcB1QrGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZGc-00EHC8-26;
	Mon, 13 Nov 2023 15:54:26 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZGZ-00EHB1-0O
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 15:54:24 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b2f28caab9so2851802b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2023 07:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699890860; x=1700495660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9P5g3/fICZscbHOqQNcqknCdN9kVr+xTLjYRH6XTbc=;
        b=NsfTla3v7urnp4fLLn5DrORHrG6bDPVJFGwdkVk8pzFEiNBH1oqWJSc5rZhy8c1HLC
         9+CUyQgG7jWuHND+flJULSeU4kjgEGBEl8xGo8QJTvkKo3+/8/kv6Gy3LsuE54pU2C0/
         fR+7WVd4mDQY1edXG89lgVRBBsDFCEKkaWfEvaf1JyYrKAlv8AD9D1iHwS2YwvLGcbOb
         V9YZgtl6ca8bft9zrZrUET6EdYMwl/Y8PuYpHQSWS5XXDJ3Q/XKqpnJcQQqPha2x8ZSV
         xv2bkkesizs4VMsZoPLTnTsoHpeXPcRoXdj53M7tn8pdFxb5dTy//zERNUkWByZM2rib
         /keQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699890860; x=1700495660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9P5g3/fICZscbHOqQNcqknCdN9kVr+xTLjYRH6XTbc=;
        b=jnbbSLT402f3LUVPifmN3wQwYYgQb2hmKGWUjKkhKaPSS/TXUScwmGcXPlNBB+UVLl
         avXkKJy23bzmsK9dgI0hq1SvrQ2JWE/bFv2w8koJc3Vf8lUTmRUrJdtmOJP5AcD4ViLg
         iOPnot+m5hK4u+c6LzVGGGYAxfj2t/EzBa88ELKIxWOKAcxEJPaCxdoIU1NUwHgLVdZo
         9NaQJwXaYC/E6Z4sePwE6rZkicZIJW8ZOdkOXQv2k74rw9iOT8LVZdnrA5xNnbSEGwnP
         iJgKsk6BaxEF7XtAjzEnn9zwffeCnxsX04/VoMOyDGu7JHHzI8Znua3+uNwcrRmnJmSI
         mWBQ==
X-Gm-Message-State: AOJu0YytdoJf7jjmfeGj72rrGOwOj582prvF3sTMSVDzki2g1SQL1FT4
	Id0anXCgSyN10apa6BDCyo8=
X-Google-Smtp-Source: AGHT+IH7k7dXZTgMDY7KAlEHkCgMgyykBUG0pei1zXSEMtetT39nGZqwDyaAZ6slrLKnSuvOyvLMAw==
X-Received: by 2002:a54:4810:0:b0:3ac:a4ec:e136 with SMTP id j16-20020a544810000000b003aca4ece136mr7716635oij.51.1699890860256;
        Mon, 13 Nov 2023 07:54:20 -0800 (PST)
Received: from localhost.localdomain ([149.167.148.33])
        by smtp.gmail.com with ESMTPSA id e15-20020a65678f000000b0057ab7d42a4dsm3562722pgr.86.2023.11.13.07.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 07:54:19 -0800 (PST)
From: Ronald Monthero <debug.penguin32@gmail.com>
To: 
Cc: richard@nod.at,
	vigneshr@ti.com,
	heiko@sntech.de,
	martin.blumenstingl@googlemail.com,
	paul@crapouillou.net,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	debug.penguin32@gmail.com,
	AVKrasnov@sberdevices.ru,
	r.czerwinski@pengutronix.de,
	andriy.shevchenko@linux.intel.com,
	jaimeliao.tw@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand controller response
Date: Tue, 14 Nov 2023 01:53:51 +1000
Message-Id: <20231113155354.620298-1-debug.penguin32@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231113131634.614467-1-debug.penguin32@gmail.com>
References: <20231113131634.614467-1-debug.penguin32@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_075423_160243_2C24A632 
X-CRM114-Status: GOOD (  12.27  )
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

Under heavy load it is likely that the controller is done
with its own task but the thread unlocking the wait is not
scheduled in time. Increasing IFC_TIMEOUT_MSECS allows the
controller to respond within allowable timeslice of 1 sec

fsl,ifc-nand 7e800000.nand: Controller is not responding
main/smp_fsm.c:1884 <inrcu: rcu_preempt detected stalls on CPUs/tasks:
rcu:    Tasks blocked on level-0 rcu_node (CPUs 0-1): P116/2:b..l
        (detected by 1, t=2102 jiffies, g=7729, q=754)
task:irq/31-arm-irq1 state:D stack: 0 pid: 116 ppid: 2 flags:0x00000000
[<8064b97f>] (__schedule) from [<8064bb01>] (schedule+0x8d/0xc2)
[<8064bb01>] (schedule) from [<8064dacd>]
[<8064dacd>] (rt_mutex_slowlock_block.constprop.0) from [<8064db57>]
[<8064db57>] (__rt_mutex_slowlock.constprop.0) from [<8064dbf7>]
[<8064dbf7>] (rt_mutex_slowlock.constprop.0) from [<804b2047>]
[<804b2047>] (nand_get_device) from [<804b5335>] (nand_write_oob+0x1b/0x4a)
[<804b5335>] (nand_write_oob) from [<804a3585>] (mtd_write+0x41/0x5c)
[<804a3585>] (mtd_write) from [<804c1d47>] (ubi_io_write+0x17f/0x22c)
[<804c1d47>] (ubi_io_write) from [<804c047b>] (ubi_eba_write_leb+0x5b/0x1d0)

Signed-off-by: Ronald Monthero <debug.penguin32@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 20bb1e0cb5eb..42f8ea46b6a8 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -21,7 +21,7 @@
 
 #define ERR_BYTE		0xFF /* Value returned for read
 					bytes when read failed	*/
-#define IFC_TIMEOUT_MSECS	500  /* Maximum number of mSecs to wait
+#define IFC_TIMEOUT_MSECS	1000  /* Maximum number of mSecs to wait
 					for IFC NAND Machine	*/
 
 struct fsl_ifc_ctrl;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
