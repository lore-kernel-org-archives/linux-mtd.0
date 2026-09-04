Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3B4C79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PG0DjzHk5TdX4SL3U4fN2K5UMp8Jzl83Sx4fUmlsgDQ=; b=w9URQ5sGdbqLSm
	iz+RpIguSno7TtpAubmfTjYgNogcxlaHNTKRxa4te+evZ4cmKo9K/P/WErLmIaaNztAt36/Cl/qbf
	F7xZqaYfzlwSNBuLQQODA2wAoameQ676CtZGyXXO/vykpD2O+zAtyXWwPY4MOWpx6ziTAC1iyFvxn
	dmCeYs6hSnx6hXxbrR0mN4uAy9icG9xrwqJ5A3oh1M6fHi4CbIZUnzBsDGTgjCBZ0Z6JNIfiBSf5R
	ACWlphQzX9mQrpH/2cNimMLWpsNP7l4VsC3/yfUiBYMYNFXjfVrNo7FZYZHPad6+1HgQAbH0gdV73
	VQvuesJLAT3rIxd3wcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZU-00000002qkB-1G9a;
	Fri, 04 Sep 2026 17:19:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZT-00000002qjO-19kk
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GXnm7bwfu9pffhkTj2o9xxxkiDXBKvThIky7UViamJI=; b=ZtSW42yEXhffoTE5NItcu2dDln
	FQr9fE89vxZk2hzo3oHlgZvwbtDPMu91yOaqpxVGWxb2qJhvGD+EDLynNH7cmhTrlrj8b5dwYWyRz
	Q03hW+zO/xdBOrSNmh4dtjkfAb5gQo1pwqyAS5NWrT5H3Z7SXcC4jThaAIc5vh8KaQEzJHZVjBIh1
	MTtweFKFgc1hW1sxHfeARjqygkI/G0C3B+p55FGwxXTTsGFZCIDOBL/U1HXBqjm0rZo55euyi3s6e
	1O0UJ1IUqUnx84EeVQtpcl04Ph5CcRrr/aaot8QGnC9tv0VEOJEdiNOPP7c+UDXjm0GjnEExzK6QZ
	vUMMYa5w==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZP-0000000EKq6-2jpw
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7BD0B1A199B;
	Fri,  4 Sep 2026 17:19:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 505F06057F;
	Fri,  4 Sep 2026 17:19:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6431011C787BD;
	Fri,  4 Sep 2026 19:19:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GXnm7bwfu9pffhkTj2o9xxxkiDXBKvThIky7UViamJI=;
	b=W+ZPbzJTIDoRAQJNYdLLvhAxt5W3mjwahG15HAkhYtNR+8gRYiSYZUOdrL+lQboSmflBq+
	Nm2si9ZSBgJ+3rCmJd4NtvjXQG7yerogTtRf7hW3dEC5by9cwW6ChebohSzoBXldPLJY4A
	Ojx+KcxNQX34mlKBef9QH4IwA4yNmGbD8vXBEBbCJVBo2jRKhASl63Ewsum5fdFEHn5/XU
	+NkAFQCFPeR5twLg6xBGyWbmwY0goZ1k6IATb3/30jCR3VTX7nC8b36qw+C4d7uH7CBn8q
	TW1tgMVsb6bHAL64gKE4be6wUBjydzWpbg6/uhZJ/Udc6S6HZto7/E+v8ta/3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:54 +0200
Subject: [PATCH v6 01/26] mtd: spi-nor: Fix spacing in function call
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-1-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181919_907229_8678F623 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

Remove the double space.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 2a1ed17fcc62..cc403ae97a83 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -484,7 +484,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		    bfpt_header->length * sizeof(u32));
 	addr = SFDP_PARAM_HEADER_PTP(bfpt_header);
 	memset(&bfpt, 0, sizeof(bfpt));
-	err = spi_nor_read_sfdp_dma_unsafe(nor,  addr, len, &bfpt);
+	err = spi_nor_read_sfdp_dma_unsafe(nor, addr, len, &bfpt);
 	if (err < 0)
 		return err;
 

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
