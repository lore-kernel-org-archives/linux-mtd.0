Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E339C83F15
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jul 2025 13:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+wKUDhRIuznomQ22A+n9ECxo1gzwgNBzk/RhVhm40U=; b=l4vi9fsiMsotf1
	nfGzLAx1sEOdH4dd/1pDWfTkx7yDBfDAW/2hMf4K4LJxwAJJ54Zijcn9WTpKYFcp1cxHxaqdfwvLO
	D/H8iRMsbma22ShgrEDVM3ixybKIR38Tbco6SxMgLlMH7HIlLj0hu9oJ6FR8U+PNRJW/4nwssoj/p
	ei+w/ti0VMTNrBmho7myePXDviuR3GLTR12w9Ya1zQNl1+wrLp9PMAG4vjRj64VJjtzB/d4yOHcd7
	e98YDEsPDm+cqDB3zJRWQDmnP5JTUmFpEF7NhCknXgjFRVcUsBIwCjPpz+4OvBJqYtiMTeBruaIkv
	FlueF50F6gQMio64eUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRp-00000002TK7-1s08;
	Mon, 07 Jul 2025 12:59:53 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkkI-00000002OXb-3rfW
	for linux-mtd@lists.infradead.org;
	Mon, 07 Jul 2025 12:14:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-236377f00a1so25350915ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2025 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751890494; x=1752495294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtZP/1pit+u9E57t8tJ9droyWQUdI1DIG6nGfsucN78=;
        b=A4aRpBavr26X5TlVAULPN3T24dbEWNFKANg2AvjwNxOcUB6KfG+4PJf0X65UNTvSX4
         TDvkyisnX9cObklPr3ErL91HYddjh7WMI0+6ugBaLOCmP7VVI+q2zv+35H1pbYAwSUm9
         YuaTi64aR8e5x3zAZURyTSGLRHdvhjZjrUwwQbg0vwRAOwy1Ss3gp64r+rq2phGjsvtk
         jgnocH5z6roJzLgWMf3So+l6Gr3F2mmW9V6F/ZJgVe10RP07E5FlBIf2kljekOnfregA
         h4+wwSbmBeNbN1NBq9rsd/HNgCKVcg3KB+OhlZM04AWO4Q8G60MKatKRwQ3C8nNy3ThA
         +rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751890494; x=1752495294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtZP/1pit+u9E57t8tJ9droyWQUdI1DIG6nGfsucN78=;
        b=MW1oz2/EmomS7p0K0bvNPielkh+6u/uDCGY96IEkCLBHp3xnDN1xwDDRbY+SKyIgdb
         fCy+nURSu3p0fOyiaHdUmLzFz9sjnzkhqexiPJcClNtS0XEX8mcRp4P63FfO+z2TToaT
         YgMJZ4JHtyvnewyT1FOfSANbUVAaBdROJpZBeeZxJ//lLpPz1QXEG/mFqH29ZGPVG+92
         QTekj5j8r5djNTdw4NerAq6f2JDdxXRbFagKcF86JcUC6qWn/Rm2UCJu7UWuWzrBGcxw
         RS3QmMMyAv1MXy2b0YdcQD+mr2M9ikyQM+4tNnHfzJXAPn9FQ+svcyJPXEh0dL7Urcia
         2ziw==
X-Forwarded-Encrypted: i=1; AJvYcCWRBJZLrCYty304fQRIJwRIBuyJXzOO8o18/DltDvajZ9ZxQ4Yh20Ow5fD9lhgpZw7oPQ00m7RI+e0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwtU7xL4NTshY7usER7aSUmcOFWfh995Mr0+//egVm8hCmbbf9T
	TGQJ3nZlMvUECG7gZl65xbLUI10qWWDKj2V7bpurWQbNCAfdIxFMqajf
X-Gm-Gg: ASbGnctwk/Z2QqAz3gD38Ze0R+BGJrK51NrKfE4XFW/aoZDGAAYlXOGIz+NE0pkO7x8
	l8sB4luAGFXpIhd/g4puf7AxNHdDwsurtqQwZWMconnIDpvNkUiT2pJWWeq0utYTkutaWFxlg/Q
	ay9DpSZqAdthVPaMUEw6QGeLhabalh3vkdqRcodDp3T2GoOxT9ddHNOYSp9XZ73eT2PFyl+yk9M
	QVSUShKSDMUEEavwpH34vPLLBTGEr78/dFOr+YhwpHoLXLHwZdjPiqa33GAD/8nqkiJ2S0lTaLw
	hQXhRfEp+atXZ6Y3qzj9LyFPI3P8rYaPlXBhHzGgpoHRWH3rFeubUrwSbfP6hYfsI3QvCP4t+DW
	BXk9sR1xTRpS4t8NrlA==
X-Google-Smtp-Source: AGHT+IEHCWpeyLeaqOGGWZDCYftAXJ8hiLYre0AfFgtmg7p4vdQEXPNjC6YVd+8CA2rxo20dDkxpIQ==
X-Received: by 2002:a17:903:fa7:b0:235:779:edea with SMTP id d9443c01a7336-23c9101aef5mr123241765ad.38.1751890493310;
        Mon, 07 Jul 2025 05:14:53 -0700 (PDT)
Received: from sun-virtual-machine.localdomain ([104.168.88.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457f31esm90155025ad.158.2025.07.07.05.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 05:14:52 -0700 (PDT)
From: Ssunk <ssunkkan@gmail.com>
To: mwalle@kernel.org
Cc: hhlee@google.com,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	roccochen@google.com,
	ssunkkan@gmail.com,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: [PATCH v3] Add support for XM25LU64C
Date: Mon,  7 Jul 2025 20:14:28 +0800
Message-Id: <20250707121428.3683-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DAZUMXW900R8.196NNPD9CWDCJ@kernel.org>
References: <DAZUMXW900R8.196NNPD9CWDCJ@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_051454_980866_24C54689 
X-CRM114-Status: GOOD (  12.81  )
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

The device is produced by Wuhan Xinxin Semiconductor Manufacturing Corp. (XMC)
and found on some routers from Chinese manufactures.
We need to add this chip to google's AVL
The flash ID was incorrectly set to 0x16 0x41 0x17.
Update to 0x20 0x41 0x17 as per the datasheet.

The data sheet can be found here:
https://www.xmcwh.com/uploads/954/XM25LU64C_V1.5.pdf

Signed-off-by: Kankan Sun <ssunkkan@gmail.com>
---
Changes since v3:
  - Our xm25lu64c is not working properly with flashrom, we need to add the following SPI_NOR_HAS_LOCK, SPI_NOR_HAS_TB flags to make the flashrom work normally.
 v2->v3: Add SPI_NOR_HAS_LOCK, SPI_NOR_HAS_TB flags to make the flashrom work normally.
 v1->v2: Update the flash ID to 0x20 0x41 0x17 as per the datasheet.
 drivers/mtd/spi-nor/xmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index d5a06054b0dd..f1f2a9ba353e 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -19,6 +19,12 @@ static const struct flash_info xmc_nor_parts[] = {
 		.name = "XM25QH128A",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x41, 0x17),
+		.name = "XM25LU64C",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
