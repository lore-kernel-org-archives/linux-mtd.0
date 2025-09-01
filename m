Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4654CA1007
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N3C14Nvc9deS5ENaasBAcxSMtYM371xhhjvzpzx3CpQ=; b=DrqT4CmbD3VRve
	HdSVRTCzdfdHMAh4874PeDelgec3q2PqT0aDFk664CDxeTVXMHeLSG51q45li9zd447f2mclqhWUp
	iC3MNaBdqglBsbm9zNl+uj5e+gM4ZmKQ+cHNrOFJCvxOOe8ZLXHdNUyQ3wm3AU7Elobyeve/8bgaY
	f/QoSJTdyFwFVm0QL14pRqvyD8u+HHh9gXX0XWTz7cnGiWNl7mSEnKSb0H5hJGJHHGhN686WjEDzG
	/96ekB9IIdTbIip0gHOz2sOCEDelU+ofXNifhfKYujctnfznUe5CQbZw15F0wtaS5Mj5MaaD81XjY
	AuMgZ81oERprJTYQzc9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDhb-0000000EEow-3fpl;
	Mon, 01 Sep 2025 23:12:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7by-0000000DJuX-2guB
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 16:42:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b627ea685so38966545e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 01 Sep 2025 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756744949; x=1757349749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2SJ8RSGWgF5HRF8KbGcSTB5S7+ggg3wF5EeaWmlInI=;
        b=fBewGIV3dOat7ky9Bpl1Ybchuc5npZmOwsyO95MbWP0OwPmZcybL19eQwna4TjnkGJ
         afBE709/hOieMnB56qFEW3HXB9efWv3aTB9YWKj/BfoyIVHTNwh8aSmbn9YsxJut1/Q7
         NWBNcHd1l57+kbuZlk2FP+P2AeSl7pVMpr+yQgTesgLaupBkvPvEg3dWxXB3uYxL+HJt
         x36e6tTxhJCXy0IsH41QSLX3V7moZYR1+T0LC2JRAFxlCg0w9oM7fsbe+0N+5cHJFJ4z
         FnZX3OHKQLHDwOFZNXzKtwKdKhgGr/9FtZxJWYcNnPNYMwfsL9wot7JWk5xg78dVP9DS
         E5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756744949; x=1757349749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2SJ8RSGWgF5HRF8KbGcSTB5S7+ggg3wF5EeaWmlInI=;
        b=XIDcSrFkA0dyCRYhthzRSg3LVVKDGsyKipDWl+jUaUpQ0hP7abe4os/pJntsaHCCsS
         SUNN9o5IOyPGBtbQ6zEhIwve6EtiUxd497FI5fvoLFXE5Ybz4ez4BWwdBwz0PRwI7uyR
         efC7f/oeckXo/mZdPCralNMn8YiYIJGf6uIweoR2y4qLCW+SUNevj8HDWQA3dLeR1NBG
         ymTzTtDWB4cKboctw0u7SVqPBTVF1Zxg9OYUWkv1Q4+6prkoIdjDIM5u4tZ/+3jjuzUp
         iDJJxeQoQF5bCYZFiPUeVni2n/+W0iQlDjnAmBlwU85PKzX4VQGpwS+eoAfZDYGeqnI9
         CFgA==
X-Gm-Message-State: AOJu0YyRBc9fLFJyZyP6s+kyf/H8tXXkjaCg+UtPoYBAa/ooBadgIgIG
	62qr2uMgDwZC/S88kxwBDIUCVdJt6qEsxEy7WXGDqypt2TJ9ACjO85av
X-Gm-Gg: ASbGnctgKTSFJt2mnHsE9Rruwk8WqK9Gm6+ZJq3QkZxLUdt04ogBCQ+HygP3XWXkXtt
	lH/YHEZCPgsD/npFN1lsvn9W39TcDkBoz3c0cNgh2m3KrqKLBx90gHzwn9LQuoZI+TibNdeoJ1c
	mHSAi89rncDNYROJtY1Igw9Z4y37OjSuIsFi5rrXNHnVGxW3Du1z5lo/UOG/I0zTwaYldoc2fzn
	5SnwFcQO0uS8ct8P/f1hq1vlIKHcM9AoIi0KyGwxk2p9uXLijY381w2984gUyK+jXrAZePfxTKC
	+j4qSGg8h44rjOZY2Nwotllw2CRXvq0wvfA5wvdrTqtpSma1IDpOxHyoaVuEJunR/SF6xRupcUJ
	SjSDvBS07yNvtRdDafCbPCFQYx9GMKe2WdlsN+cEbVuGVo2iR/DYdvo9yiPs=
X-Google-Smtp-Source: AGHT+IHTXAHnefNNy9w0+6gvsMWlpSk+Oc4A9sHqoF9uPqjcvvmUzftHA+m30QKEQxkbMsfI90G2HQ==
X-Received: by 2002:a05:6000:124e:b0:3d3:9b18:2262 with SMTP id ffacd0b85a97d-3d39b182471mr4749459f8f.25.1756744948592;
        Mon, 01 Sep 2025 09:42:28 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.80.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7ef7cfsm163388585e9.6.2025.09.01.09.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:42:27 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	flaviu.nistor@gmail.com
Subject: [PATCH] mtd: spi-nor: issi: Add support for is25wx01g
Date: Mon,  1 Sep 2025 19:42:18 +0300
Message-ID: <20250901164218.11165-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_094230_679581_D712B2DA 
X-CRM114-Status: GOOD (  11.08  )
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

Add support for the IS25WX01G 128MB (1Gb) ISSI Serial Flash Memory.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/mtd/spi-nor/issi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 18d9a00aa22e..e4997f9bd557 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -126,6 +126,9 @@ static const struct flash_info issi_nor_parts[] = {
 		.flags = SPI_NOR_QUAD_PP,
 		.fixups = &is25lp256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		/* IS25WX01G */
+		.id = SNOR_ID(0x9d, 0x5b, 0x1b),
 	}
 };
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
