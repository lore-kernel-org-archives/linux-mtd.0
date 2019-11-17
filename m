Return-Path: <SRS0=J9sr=ZJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8EDC432C0
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Nov 2019 20:25:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F00120740
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Nov 2019 20:25:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LrlBPLrM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAhShT4Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F00120740
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6nBu3vLMUcxwJXHM2TL05bj5dxF+xeWtFdsczXouGZ8=; b=Lrl
	BPLrMpbwxZ2mtsU9KOxgZfog2oeyMUc8FmWZGFv53tFTyaAgQk79fqoJibyVZpPDR1P77mu3cwX0c
	S4YOpmgZv+8cmdi/7MRx7j1iLreUrJBNSRULSnwBh0Tz9SGKlQ3qfhewm9lS/vCWw4V0CLf/Yf2Zg
	uH7/P1Vj9zP4aeiz5SrvGFvXzWIXh8epwNb6Rx9w9RIfr4mK+8yVT/kfHfEV2wF7PcNZBYhhU2MwT
	br+rf2cIGME1lLY0PgT6g///8YfKEdyERVCS3Aky5xjkiMA4c9jyEbQW9dhM8omlpjLuBSjmCbh7n
	SyYzgrnDgGKBsu/zKkV+luW9tfpBYfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWR6C-0003Kc-TL; Sun, 17 Nov 2019 20:24:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWR6A-0003K7-LH
 for linux-mtd@lists.infradead.org; Sun, 17 Nov 2019 20:24:44 +0000
Received: by mail-wr1-x442.google.com with SMTP id q15so4231981wrw.7
 for <linux-mtd@lists.infradead.org>; Sun, 17 Nov 2019 12:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IUxQw7G9TADghldCcYoUqe3xol1SpZ9SeCsa+dH2lVI=;
 b=VAhShT4YLFAAEeUX84eHEMF5xj5KMok6kStnxT93Jj+dscCQPsB1ggSGNp8t+Ogc4p
 2cy/9dhfRPGgXqHTCh+fjbPG77D1g/tRPcD/1t5j85Jjuiuk8GwB9Neb1bRiZ+F3OIFc
 nVKNtubcOzIr0lutZuWI+hHhb+Fs9SzYotXdejIKEWAEDkF8IkIoCV/FWTAq75nyGP+w
 uImYzuVnYYbh92C375XOOm55V1a5OtfEwqx5MoEttpN22ISJC/rkm2dILPybLJLN7hsm
 0NX+tBSkeHXPno3O5z8oek+jAw55Th2nDlfclMV4hGGU7WzYw8QCKDErNPu5kjEv55+P
 bJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IUxQw7G9TADghldCcYoUqe3xol1SpZ9SeCsa+dH2lVI=;
 b=fUAXp8rYKyVLEwbpryHczMJUSPTw/Vp73clqz5KD7No3iNVQFXPzeL7L1pOVm4i6cS
 Is+DHbrbUjksHKeZcYF0m/9k+oCgRc5LaRZ64guuq2oW0yleR8wpVjMzwU+fLhiAyxRT
 dLQhIyibqAyhXyxpfnfYfz89+pKmwkZq3+xf6npEuCFik7s5+IAvzE4gcfXGC7+sKEn8
 EKwjfCtrnw6gWnniXzm26cBOOOjtM/lerZRLLkVLZltxkdrEbbp503yAo+XXAoUO79sb
 Lej+k9z1Z/QdMAgf95CTUJ+SxyC9A/oji12Sk7TP+ynRBhmxcFChzxiXl+M/LSyAnQ33
 R6Bg==
X-Gm-Message-State: APjAAAWZbgNlSm/y7UJlp+G1UfNc9YpqK1XCNA7jYH7OW6IqW6DfUnEp
 g2IJoXY1Md8hf5bYanptl8ndoWuM
X-Google-Smtp-Source: APXvYqxRvsFNNbAdZe3wFWBqjruArbkV8Rv6VXA8w1ZrP6Xh5SGeIX8nfBaGOerT4YBs1Y0UJJFVhw==
X-Received: by 2002:a5d:67c2:: with SMTP id n2mr26150338wrw.222.1574022278756; 
 Sun, 17 Nov 2019 12:24:38 -0800 (PST)
Received: from debian.lan (host-78-144-219-162.as13285.net. [78.144.219.162])
 by smtp.gmail.com with ESMTPSA id
 x5sm17045704wmj.7.2019.11.17.12.24.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 Nov 2019 12:24:38 -0800 (PST)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>
Subject: [PATCH v2] {tty: serial,
 nand: onenand}: samsung: rename to fix build warning
Date: Sun, 17 Nov 2019 20:24:35 +0000
Message-Id: <20191117202435.28127-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_122442_723012_61A017EA 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Any arm config which has 'CONFIG_MTD_ONENAND_SAMSUNG=m' and
'CONFIG_SERIAL_SAMSUNG=m' gives a build warning:

warning: same module names found:
  drivers/tty/serial/samsung.ko
  drivers/mtd/nand/onenand/samsung.ko

Rename both drivers/tty/serial/samsung.c to
drivers/tty/serial/samsung_tty.c and drivers/mtd/nand/onenand/samsung.c
drivers/mtd/nand/onenand/samsung_mtd.c to fix the warning.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---

v1: only renamed drivers/tty/serial/samsung.c
link: https://lore.kernel.org/lkml/20191018194707.27188-1-sudipm.mukherjee@gmail.com

v2: rename both files.

I was not sure if this should have been two different patch, but since
this will be fixing the same problem so it seems its better to have them
in a single patch.

 drivers/mtd/nand/onenand/Makefile                     | 2 +-
 drivers/mtd/nand/onenand/{samsung.c => samsung_mtd.c} | 0
 drivers/tty/serial/Makefile                           | 2 +-
 drivers/tty/serial/{samsung.c => samsung_tty.c}       | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/mtd/nand/onenand/{samsung.c => samsung_mtd.c} (100%)
 rename drivers/tty/serial/{samsung.c => samsung_tty.c} (100%)

diff --git a/drivers/mtd/nand/onenand/Makefile b/drivers/mtd/nand/onenand/Makefile
index f8b624aca9cc..a27b635eb23a 100644
--- a/drivers/mtd/nand/onenand/Makefile
+++ b/drivers/mtd/nand/onenand/Makefile
@@ -9,6 +9,6 @@ obj-$(CONFIG_MTD_ONENAND)		+= onenand.o
 # Board specific.
 obj-$(CONFIG_MTD_ONENAND_GENERIC)	+= generic.o
 obj-$(CONFIG_MTD_ONENAND_OMAP2)		+= omap2.o
-obj-$(CONFIG_MTD_ONENAND_SAMSUNG)       += samsung.o
+obj-$(CONFIG_MTD_ONENAND_SAMSUNG)       += samsung_mtd.o
 
 onenand-objs = onenand_base.o onenand_bbt.o
diff --git a/drivers/mtd/nand/onenand/samsung.c b/drivers/mtd/nand/onenand/samsung_mtd.c
similarity index 100%
rename from drivers/mtd/nand/onenand/samsung.c
rename to drivers/mtd/nand/onenand/samsung_mtd.c
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index 863f47056539..d056ee6cca33 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -30,7 +30,7 @@ obj-$(CONFIG_SERIAL_PXA_NON8250) += pxa.o
 obj-$(CONFIG_SERIAL_PNX8XXX) += pnx8xxx_uart.o
 obj-$(CONFIG_SERIAL_SA1100) += sa1100.o
 obj-$(CONFIG_SERIAL_BCM63XX) += bcm63xx_uart.o
-obj-$(CONFIG_SERIAL_SAMSUNG) += samsung.o
+obj-$(CONFIG_SERIAL_SAMSUNG) += samsung_tty.o
 obj-$(CONFIG_SERIAL_MAX3100) += max3100.o
 obj-$(CONFIG_SERIAL_MAX310X) += max310x.o
 obj-$(CONFIG_SERIAL_IP22_ZILOG) += ip22zilog.o
diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung_tty.c
similarity index 100%
rename from drivers/tty/serial/samsung.c
rename to drivers/tty/serial/samsung_tty.c
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
