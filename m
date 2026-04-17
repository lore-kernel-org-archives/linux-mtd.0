Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F67F436B9
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KNPwhoJCjHQ/iJbrhXPxyplW15/ENniujNpS8Kxv2yk=; b=pCvqS7QnULXls4
	OpbkVrustUEC5be65Ts0CGyohrybSeEbW7z98keWs1417LT+L0qgUcd6aIGzwsPlgTOfKJ/LAj+PX
	V2YdgT/R3nvDgxJLMTlPUJdBa82QjKIoTPL26WKRv0So5xzqF+B0ciy5e8/RPrnXyGoNK+hkGd9iP
	8QSaJ9ktz/eVTtn0NAJwFN1bS7Km95AjniWvvNsCsGEwLg/E9cVWJoGhJ3KbqVkz72jeVSHEI3k5l
	ZnvAUE94qpyvGMOus6UH2pDyJizHTfjyIwXdwntwtUHV2rMSdB3snQ2g/LYEmyhoCQ6N2vbnN7gtu
	HQpQ9IWqPYqtdZ3KKUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl3o-00000004CrP-2xg8;
	Fri, 17 Apr 2026 15:24:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl3k-00000004Cr2-2AJb
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 15:24:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-482f454be5bso18845515e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 17 Apr 2026 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776439482; x=1777044282; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2bC6Hz2MAErwrJ8lu8pBzVTd3KLTohmvccUkPb3vXE=;
        b=u8u9ixX/ndJl9G2sBDRI4DtfJBqPpPRqLXYk7Jv3S/3YkU3+KPzSVIw4sYjJsF7TJ6
         dSbErorHJVZOp3f4xv4MNpOykovvYenHX/IKWDES9jcnHBRQ0yapo9oq9Wtbpja5lpyc
         QxvM+rtLh+Mzu0G+4jF0OsqWhAgP8hg1diPM2ctwW1j4QEKxpMG93o++jEbYxD0D3QyG
         xHhhfu1SFez247xUnuX/nGYAEnAOC+HAyJjNnoXbl/Zk6W4ZYeQhgw1vB8JIeHYA3lbl
         pbQWRSrVMYcoe21fOWSv6f5kupvD/oVPwHWuO1cpWozQWr5h4KIM6jS9djFQMZj+jXs0
         AcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439482; x=1777044282;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2bC6Hz2MAErwrJ8lu8pBzVTd3KLTohmvccUkPb3vXE=;
        b=C1oRpg4e+jCXczw527MSf9cade37xSC6aU8jrRAFWCyZuZugwmjbbxaW43Z7dPSQRR
         CDl1Es5aQKs4nTqDaQvdzG97FAyD9g12aJY8N7FXYpi0EoaP64kLy4ZnpWhlZjIliDNh
         rj6KVAMgI4La6MHppbB1e/UCkwDolzdpT6aepR0+v2Gf37yoY2iUzMbmePKbQJyOWaXN
         kxgPmaDgs+qCNWqLt1oNHbp26my3zkj4QSQMsbLXGANEyGzVTlGP4cX6L3M4FcqxdB/K
         YrsR/Wo/VnH3/DVUXOj7rRmnRDhPgcAxd0ooz3iYBxL0Bu1zN4KOS/dF+kPxaIFkKU74
         FFjg==
X-Forwarded-Encrypted: i=1; AFNElJ85WCclF2dS5K1xNRBdDoWQsagybUeKAXNsc3pTSSQfBaxQYWF1Deg8dSq9DkPDh27E8fTat++UQZY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJTvZR6JEHJ9AemDdMAQJ4Jy2fI6fQ6hU+hnJR81+8lDrHYSgl
	R6ulgDgHaIeN+EKOITFkenjjcXtMfIxtgWEIyMVT0N7OJ43m06YFnPItBON8/3TxKj8=
X-Gm-Gg: AeBDiesNdGjNii90DKLxsOdUHcZ6NpfeeFaqvmQewlAib84Jva37xWj3tJYGT7YD5w7
	KCKrQJNONh6VHbyCobL3xYwtO6pb7I5cIB+Z8yBHJJSguzDmCuT4djafUrRKMEmLyfst34d6PW+
	N+ucYC/nYm4wFol9bQ3YbNDmE13lFNrQhzCBOwYtUEfOp5FlEF/8YgRckuLZUlbiOaAvSxNdnEu
	0F8YoDnsSgQK+R2l97DlCyfBBR8zfoVR5v/oiQhpEiX8XYMH5BTqohwdUd/hMtVL5FD1xyc5u43
	rCjyMM4iVM+0QEsczfPbnRavTU+KHeNgGGmheZOSfD1acf+a32npnGqYroVPDOf2yXR6GDpsj1c
	TrCLjV+9A7Z2WIrYimu9We5R7QeBjriGzEsbpquUfe2ZUevnscFc58MDxagc0dXGITcJdwHvVAa
	NhBfBJFvKMrQysUyzD3GKaEiujkiOPqOO+yTwu3+BXbec7tCGMmnTmVJ4NuK6AVgtsVG0nrzAbg
	GjK32UttFJVW1IrJg==
X-Received: by 2002:a05:600c:c0d8:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-488fb8838abmr31594955e9.1.1776439482480;
        Fri, 17 Apr 2026 08:24:42 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7aa593sm19318855e9.24.2026.04.17.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:24:42 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 17 Apr 2026 15:24:39 +0000
Subject: [PATCH] mtd: spi-nor: debugfs: fix out-of-bounds read in
 spi_nor_params_show()
MIME-Version: 1.0
Message-Id: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
X-B4-Tracking: v=1; b=H4sIALZQ4mkC/x2MQQqAIBAAvxJ7bkHNivpKdNDcai8aK0QQ/j3pO
 DAzL2QSpgxz84LQzZlTrKDbBrbTxYOQQ2UwygzK6hF3fjAlj0IuYL4YYxI0vVWT73RQ2kFNL6H
 q/dtlLeUD/N0NFmYAAAA=
X-Change-ID: 20260417-fix-oob-read-spi-nor-25409b31d01a
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776439482; l=2246;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=tPwzxOzm9uakxuwTOcaC6u3ngixwWgQyrsHL71YIYTU=;
 b=YEZm7VO5nMzhEC2ZjHHkxyVPrh8RqY7QfAve2g2czKQlHG7IhQzXTiAzdiWNjmv/aHtJCgjXz
 J7wTQsy5Gv4BqCCXi8QEBKX9Rwd5fEhlGUpMBPbQHGmhGJ31U8ZID0B
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_082444_615051_CBB548B0 
X-CRM114-Status: GOOD (  12.30  )
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

Sashiko noticed an out-of-bounds read [1].

In spi_nor_params_show(), the snor_f_names array is passed to
spi_nor_print_flags() using sizeof(snor_f_names).

Since snor_f_names is an array of pointers, sizeof() returns the total
number of bytes occupied by the pointers
	(element_count * sizeof(void *))
rather than the element count itself. On 64-bit systems, this makes the
passed length 8x larger than intended.

Inside spi_nor_print_flags(), the 'names_len' argument is used to
bounds-check the 'names' array access. An out-of-bounds read occurs
if a flag bit is set that exceeds the array's actual element count
but is within the inflated byte-size count.

Correct this by using ARRAY_SIZE() to pass the actual number of
string pointers in the array.

Cc: stable@vger.kernel.org
Fixes: 0257be79fc4a ("mtd: spi-nor: expose internal parameters via debugfs")
Closes: https://sashiko.dev/#/patchset/20260417-die-erase-fix-v2-1-73bb7004ebad%40infineon.com [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
We shall assign a CVE to this. I'll look into how next week.

Link: https://lore.kernel.org/linux-mtd/20260417-die-erase-fix-v2-1-73bb7004ebad@infineon.com/
---
 drivers/mtd/spi-nor/debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index fa6956144d2e..14ba1680c315 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/array_size.h>
 #include <linux/debugfs.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/spi/spi.h>
@@ -92,7 +93,8 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	seq_printf(s, "address nbytes\t%u\n", nor->addr_nbytes);
 
 	seq_puts(s, "flags\t\t");
-	spi_nor_print_flags(s, nor->flags, snor_f_names, sizeof(snor_f_names));
+	spi_nor_print_flags(s, nor->flags, snor_f_names,
+			    ARRAY_SIZE(snor_f_names));
 	seq_puts(s, "\n");
 
 	seq_puts(s, "\nopcodes\n");

---
base-commit: 43cfbdda5af60ffc6272a7b8c5c37d1d0a181ca9
change-id: 20260417-fix-oob-read-spi-nor-25409b31d01a

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
