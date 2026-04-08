Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE8BFD5F81
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Apr 2026 06:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1Xvh1C0t5iZqdivHrhpi0IyCjQfHL/DVhpaVmxv0UE=; b=OGMFoajkUwgn3v
	dJrovtBmC+iSvKNhpwxtGhKRpxXK3idD4IjCc0a8vQ7dqkeukce7Drina68flWDrmh4z5KFGEvrUn
	4D6aJcvb9PD+3Ngl2q6IRtnOZ3q+dZJIDp7+NyeTMBPtR2MDx2Y2B6Gk/LdIs3I7sa//cZR2KGC8S
	AAQTg6BX9ye7eDReEBd0l1TU9RfQSvkTGkEd07iKYz8DqL26xYwTAW5nYln/6Yrn9LPaAWkdQ+/Hr
	lxKfXNOczYMhtSKjRajAZjCpbp/IlMTk/BIr/MICLyLHPAYHCSD7+4FvtORhK0gbiBpWK9L32wAJl
	5fgH64CiCC/afarlTawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMWG-00000008Lss-3drG;
	Wed, 08 Apr 2026 06:36:08 +0000
Received: from mailout1.hostsharing.net ([2a01:37:1000::53df:5fcc:0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMW8-00000008Ls3-24yl
	for linux-mtd@lists.infradead.org;
	Wed, 08 Apr 2026 06:36:07 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 26F7B364;
	Wed, 08 Apr 2026 08:35:52 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 0C98E60CF552; Wed,  8 Apr 2026 08:35:52 +0200 (CEST)
Date: Wed, 8 Apr 2026 08:35:52 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <adX3SHYgazijahbG@wunner.de>
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_233600_674050_A8284AEE 
X-CRM114-Status: GOOD (  11.39  )
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

On Wed, Feb 04, 2026 at 02:25:27AM +0100, Andy Shevchenko wrote:
> Compiler is not happy about used stack frame:
> 
> drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> Fix this by factoring out do_write_buffer_locked().

FWIW, the issue only occurs with CONFIG_KASAN_STACK=y, so an alternative
to refactoring the function is to disable KASAN for this particular file:

diff --git a/drivers/mtd/chips/Makefile b/drivers/mtd/chips/Makefile
index 1f4e84f1cd88..7110eb97bd25 100644
--- a/drivers/mtd/chips/Makefile
+++ b/drivers/mtd/chips/Makefile
@@ -14,3 +14,8 @@ obj-$(CONFIG_MTD_JEDECPROBE)	+= jedec_probe.o
 obj-$(CONFIG_MTD_RAM)		+= map_ram.o
 obj-$(CONFIG_MTD_ROM)		+= map_rom.o
 obj-$(CONFIG_MTD_ABSENT)	+= map_absent.o
+
+# Avoid exceeding stack frame in do_write_buffer()
+ifeq ($(ARCH),arm)
+KASAN_SANITIZE_cfi_cmdset_0001.o := n
+endif

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
