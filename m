Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA03C4167D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ju3gu/5UojQhgj8FIitveKo5lUCdNSWRKWtB8JiuHDA=; b=oGz/MjA3iXMCPW
	ICNov0z2aMo1lZqIYpDGQpsXwcFGikWVq8LPVoTGQ6q4aHLDh/tWRKwMjzbtCuRR4ikBMcvqmxnTN
	dYxoBwsswHhVebG6DSbOtu03lIY/J41pn4o6V0A0r+TsI4AF4haTMp1P9PD3yqKbrv8so9hWyzwxA
	s1ygA4sQKlagTwkjbvc87wG/DKYsBIl/A74lwHTlFPvzj6aIEmnimb5Hq8T1ZxG7AuxuPbzEXJHxu
	80YII0EJtVkZ5f8425GEs2uubJK4RH+kbhVgcopXmYEnTzruGaCTMCM6g/Cg4/+PfFjgJCNsl3eYS
	tgdTa1kYFkj+8tWhTpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZUf-00EIpV-34;
	Mon, 13 Nov 2023 16:08:57 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZUc-00EIoq-2U
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 16:08:56 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5bd099e3d3cso2700982a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2023 08:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699891732; x=1700496532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPuU6NHbUp/SgydRBNeLDEaf5ofrHVDlSX75GYurXdQ=;
        b=QeHu1w9ZGUuPUd2I357caDPCkCCi40h0Pc+vP3Qbm1lW0p39c2FxEi8hDkUF2R4JiA
         CT2ch9gRIk+8ogZb+gfzRsoNK7Pw9VH9iutahPhVYJxsINOBwPac0Hu4YX5WGHF0wOLQ
         Bhsuf0+KH/3LhQ/jjj57WJg5eDH8Kew+BqwGLqk0zqFysFb8xCjV5RZQAMvmZdv2KjZg
         pReQAAzZRYTyRGFzDIOdQg2HLVMqhdK4BO0o326hONK+nSdWRpxCAoRdGcnUPzCvwVUv
         FcOyKBEHbt8/1H8xmCYabf4AhbpWwYXCnxxPS0TX3pY0I4dGTALMQcKG/oKNjt0G0hdM
         9S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891732; x=1700496532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPuU6NHbUp/SgydRBNeLDEaf5ofrHVDlSX75GYurXdQ=;
        b=vDlXheje9Q/lcTYSDrCQRpmRoIhVNRmd2M22+wBMr91rgrD55Q5Lcwc/f3x7huiKMQ
         eUpgYJrVHsOFNQxEN0jiAwvtS4jdiDOhB3RM4I0Kp/Gtb13KQYRCSV9SgUGhSXABjQ2F
         oaT4MR1ChMQFxYDzKZNDdNKWRKtrmDv9T8+bfRd0t3CBSm65jQzgo1K69jRv6se7V4Gw
         HwJmyPdRo/ZPokGP9ydFbmmdSh2ogvfixJI6wpNy72jeeb0X+T+R7rescAxjNtDA9MQ6
         zluwWPGuwlk1ap5Vf/xwy51Pt4sDYxjJ8BwRYXBUV30SyT8q1o5qHzVZbCWNNtN0UR+W
         jwmA==
X-Gm-Message-State: AOJu0YycxOR0Rqt4GdiOE6IHt4Wkt3TyoUqm3s/12S2cnPLQgGF0juSx
	lK3oMEgJZkz26SXIB8yYquY=
X-Google-Smtp-Source: AGHT+IGBR1PQkuTCOAB2gjuro2F+BqtLV3jLOeCnkGMb78QpXMwT2zy1xxCdY45tREDYMdOC6/UwBQ==
X-Received: by 2002:a17:90b:11c1:b0:280:14ac:a6dc with SMTP id gv1-20020a17090b11c100b0028014aca6dcmr4522639pjb.25.1699891731757;
        Mon, 13 Nov 2023 08:08:51 -0800 (PST)
Received: from localhost.localdomain ([149.167.148.33])
        by smtp.gmail.com with ESMTPSA id p17-20020a17090adf9100b00281032f9f9csm5778832pjv.35.2023.11.13.08.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 08:08:51 -0800 (PST)
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH v2] mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand controller response
Date: Tue, 14 Nov 2023 02:07:49 +1000
Message-Id: <20231113160751.620810-1-debug.penguin32@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231113131634.614467-1-debug.penguin32@gmail.com>
References: <20231113131634.614467-1-debug.penguin32@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_080854_805854_2D1A9307 
X-CRM114-Status: GOOD (  12.49  )
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

Cc: stable@vger.kernel.org
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
