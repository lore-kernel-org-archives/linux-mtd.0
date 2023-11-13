Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041DCC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qOFbV7QZLk/AiFgZHbWEb+hgHswpv2sRKkCc/GzKDkA=; b=Ta0QcUccih1wEs
	iLUbCwQGohoblenaFh9FrYWPUH1WDgQl2nOqaZcKow1iPiIpFVjbkN2VucU/POLX3PESqnd9XUpBE
	U/PXaZCuGwPc3UHrIlVNxe69rg81tPhXvUkzwK6G/ey4EySKxdLpqxF63AMSoi98xESqmQ/VU5P+g
	m1/bMUfNcxXET1IzLTT9hzMsObLJdWtv6AUFGkVoPapTEGyW5h0P9RLkkroHmKqrNuNfQZ5Kcics2
	YttbkrCedYUmbwGjCYNNA2zErNqBiGd1t6vwPSxXI8UbxJVQRzpNwTDeLMOkYBk7+HEfhp5jKNwD9
	sK/SaZpO12fiULtQhh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wp3-00E28g-0J;
	Mon, 13 Nov 2023 13:17:49 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wox-00E27j-0b
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 13:17:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc3bb32b5dso38454105ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2023 05:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699881459; x=1700486259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BENlKbuFPKHXVOXGwxTOg37z6FdtT5c5MFKpNXhyfZY=;
        b=ZG2mR5gRCMUVkeosXMo31H1d4YosSm5SlL1FZx+vXQ2Hs5i6kK3cE9kzzl/lmlxvAu
         5X96JjO8S8O5dHt4HCLtvxAMzSwr91jZOvp2q0M5DX0mnJudVKXrTeoBP+BWGYAcubDt
         tPwqGy+9XzA+DOnZohPMca8ap1TzJDyi6xh51+HcVp2Qo08VC7dYJJjthNxQXhTnTtpJ
         3MlHisGjP6KdfZG5kV3yREusnnzoisMrnGL4mB7N4j5ppe7c+KZlCu69ISnmTDRSjEWR
         hWpLf9jCu6thGYBkxmjh3THTW3ZsDte/ov9PIt/O3Mkg6IjtNKMZ8r7azwxMerAA1olg
         I8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699881459; x=1700486259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BENlKbuFPKHXVOXGwxTOg37z6FdtT5c5MFKpNXhyfZY=;
        b=t104LIP4cKkl2arwWvTv18A2YdEu2x+ZcTlEHCCSRTYuBtFu6Js6LGaaJ7FExpAV54
         Qwa/e/BKNNm6ES9eTffIgJRo+j5u4jH39/1QpZlsx+yfPntDI8BkDis2K1tdSBePGcGx
         w4e7G05tPFSM7y7TKqCWEX8+4wGJOQYHN4ufILHNtyiHuj9WK+b9LJ8XwjV0iWieLSxS
         NZ9ZyMZKpYOI3VEIA5+HyyOlfNf/AtYGl3WGMF778KTnlXOpJYihQs6duETb8p0cLKrR
         53Onl397HzrYHOPzMxKbTIPvIvuaLy3muLzM7F9NrX1+Gl9vu9Pk9F3i0CvnvXHqRn2H
         BzcA==
X-Gm-Message-State: AOJu0Yw2hPO3QOZoW+FsfC/gL0nOYlIBPLpAaZwbwbjBOubrf+KF7EFo
	yh9dFwmQBhlml1V8bUtTTf8=
X-Google-Smtp-Source: AGHT+IHqm4pW1ifICU5+1F7FEK25e8uswN0H7HrMr7MU2H/FOdlpI4jqngLLlc2SDiSyEOdRJVj0sg==
X-Received: by 2002:a17:903:2289:b0:1cc:665d:f822 with SMTP id b9-20020a170903228900b001cc665df822mr9071037plh.32.1699881458663;
        Mon, 13 Nov 2023 05:17:38 -0800 (PST)
Received: from localhost.localdomain ([149.167.148.33])
        by smtp.gmail.com with ESMTPSA id z18-20020a170903019200b001bb97e51ab4sm4020621plg.98.2023.11.13.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 05:17:38 -0800 (PST)
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] mtd:nand: Increment IFC_TIMEOUT_MSECS for nand controller response
Date: Mon, 13 Nov 2023 23:16:28 +1000
Message-Id: <20231113131634.614467-1-debug.penguin32@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_051743_229712_35686C6D 
X-CRM114-Status: GOOD (  14.02  )
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

The nand controller not responding scenario occurs causing blocked tasks
and rcu_prempt warnings of stall on cpus. Incrementing the
IFC_TIMEOUT_MSECS appears to solve the nand controller not responding
issue.

** ID_531 main/smrcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu:    Tasks blocked on level-0 rcu_node (CPUs 0-1): P116/2:b..l
        (detected by 1, t=2102 jiffies, g=12653, q=518)
task:irq/31-arm-irq1 state:D stack: 0 pid:  116 ppid: 2 flags:0x00000000
[<8064b97f>] (__schedule) from [<8064bb01>] (schedule+0x8d/0xc2)
[<8064bb01>] (schedule) from [<8064fa65>] (schedule_timeout+0x6d/0xa0)
[<8064fa65>] (schedule_timeout) from [<804ba353>] (fsl_ifc_run_command+0x6f/0x178)
[<804ba353>] (fsl_ifc_run_command) from [<804ba72f>] (fsl_ifc_cmdfunc+0x203/0x2b8)
[<804ba72f>] (fsl_ifc_cmdfunc) from [<804b135f>] (nand_status_op+0xaf/0xe0)
[<804b135f>] (nand_status_op) from [<804b13b3>] (nand_check_wp+0x23/0x48)
[<804b13b3>] (nand_check_wp) from [<804b231d>] (nand_do_write_ops+0x99/0x2b8)
[<804b231d>] (nand_do_write_ops) from [<804b5355>] (nand_write_oob+0x3b/0x4a)
[<804b5355>] (nand_write_oob) from [<804a3585>] (mtd_write+0x41/0x5c)
[<804a3585>] (mtd_write) from [<804c1d47>] (ubi_io_write+0x17f/0x22c)
[<804c1d47>] (ubi_io_write) from [<804c047b>] (ubi_eba_write_leb+0x5b/0x1d0)
[<804c047b>] (ubi_eba_write_leb) from [<804bf62d>] (ubi_leb_write+0x75/0x90)
[<804bf62d>] (ubi_leb_write) from [<803745b7>] (ubifs_leb_write+0x4b/0x8c)
[<803745b7>] (ubifs_leb_write) from [<80374bbb>] (ubifs_wbuf_sync_nolock+0x10f/0x1a4)
[<80374bbb>] (ubifs_wbuf_sync_nolock) from [<8036c6dd>] (ubifs_jnl_update+0x1e9/0x36c)
[<8036c6dd>] (ubifs_jnl_update) from [<80370933>] (ubifs_create+0xb3/0x130)
[<80370933>] (ubifs_create) from [<802cf0c7>] (lookup_open+0x173/0x1c4)
[<802cf0c7>] (lookup_open) from [<802cf8a3>] (open_last_lookups+0xd7/0x16c)
[<802cf8a3>] (open_last_lookups) from [<802d08e5>] (path_openat+0x91/0x104)
[<802d08e5>] (path_openat) from [<802d0989>] (do_filp_open+0x31/0x74)
[<802d0989>] (do_filp_open) from [<802c4fb3>] (file_open_name+0x33/0x48)
[<802c4fb3>] (file_open_name) from [<802c4fe9>] (filp_open+0x21/0x2e)
[<802c4fe9>] (filp_open) from [<80490bd3>] (irq1_handler+0x53/0xa4)
[<80490bd3>] (irq1_handler) from [<80247dd7>] (irq_forced_thread_fn+0x1f/0x4c)
[<80247dd7>] (irq_forced_thread_fn) from [<80247cd9>] (irq_thread+0x89/0x114)
[<80247cd9>] (irq_thread) from [<8022ca67>] (kthread+0xcf/0xe4)
[<8022ca67>] (kthread) from [<80200149>] (ret_from_fork+0x11/0x28)
Exception stack(0x822bbfb0 to 0x822bbff8)
bfa0:                                     00000000 00000000 00000000 00000000
bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
bfe0: 00000000 00000000 00000000 00000000 00000013 00000000

fsl,ifc-nand 7e800000.nand: Controller is not responding
ID_531 main/smp_fsm.c:1884 <inrcu: rcu_preempt detected stalls on CPUs:
rcu:    Tasks blocked on level-0 rcu_node (CPUs 0-1): P116/2:b..l
        (detected by 1, t=2102 jiffies, g=7729, q=754)
task:irq/31-arm-irq1 state:D stack: 0 pid:  116 ppid: 2 flags:0x00000000
[<8064b97f>] (__schedule) from [<8064bb01>] (schedule+0x8d/0xc2)
[<8064bb01>] (schedule) from [<8064dacd>] (rt_mutex_slowlock_block.con)
[<8064dacd>] (rt_mutex_slowlock_block.constprop.0) from [<8064db57>] 
[<8064db57>] (__rt_mutex_slowlock.constprop.0) from [<8064dbf7>] 
[<8064dbf7>] (rt_mutex_slowlock.constprop.0) from [<804b2047>] 
[<804b2047>] (nand_get_device) from [<804b5335>] (nand_write_oob+0x1b/0x4a)
[<804b5335>] (nand_write_oob) from [<804a3585>] (mtd_write+0x41/0x5c)
[<804a3585>] (mtd_write) from [<804c1d47>] (ubi_io_write+0x17f/0x22c)
[<804c1d47>] (ubi_io_write) from [<804c047b>] (ubi_eba_write_leb+0x5b/0x1d0)
[<804c047b>] (ubi_eba_write_leb) from [<804bf62d>] (ubi_leb_write+0x75/0x90)
[<804bf62d>] (ubi_leb_write) from [<803745b7>] (ubifs_leb_write+0x4b/0x8c)
[<803745b7>] (ubifs_leb_write) from [<80374bbb>] (ubifs_wbuf_sync_nolock+0x10f/0x1a4)
[<80374bbb>] (ubifs_wbuf_sync_nolock) from [<8036c6dd>] (ubifs_jnl_update+0x1e9/0x36c)

Signed-off-by: Ronald Monthero <debug.penguin32@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 2 +-
 drivers/mtd/nand/raw/nand_base.c    | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

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
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 9e24bedffd89..05b52ed41f4c 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -363,8 +363,11 @@ static int nand_check_wp(struct nand_chip *chip)
 	int ret;
 
 	/* Broken xD cards report WP despite being writable */
-	if (chip->options & NAND_BROKEN_XD)
+	if (chip->options & NAND_BROKEN_XD) {
+		pr_info("nand_chip->options indicates NAND_BROKEN_XD %d\n",
+			(chip->options & NAND_BROKEN_XD));
 		return 0;
+	}
 
 	/* Check the WP bit */
 	ret = nand_status_op(chip, &status);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
