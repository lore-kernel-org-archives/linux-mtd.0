Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64983C7EE39
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jun 2025 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAqweEI2qDnIlPF4Pr+d3fkTjYuqM0v12/JgKhMbc6o=; b=mEdTMRIYiPecjH
	U7c3wGH7WOypm5Qp3aG0Te1zwkUA6tanEw8fu/NrfrJiU+1OcnOFTLt9b3em5vE7Sb8C9laUoz1et
	RZKLnOCyqzbxswVDm6RnqVpdwMNdD2u/eP/xkplHbZNqv0Vyz/DJZwmVlQCXyfDdtiazTzQTQwjZy
	i9ygFQHPv+B/HI2xUUXoK0+SPYdDjOt6rtqlzj9/IwF5zKNpw+uMdHsTsu24twDPFNhqVROmsETwk
	3o9KJZTKZUbjl7r2TLJ/z11HQRB0KER/0qnYC1YdudAGpkXjDs1hCmP1MlF/r1GHySogK0P+CtR8u
	Js38iXZ3Tykymc8MDRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCZE-000000020PM-1rGr;
	Mon, 30 Jun 2025 11:20:56 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCAS-00000001x4o-2mgN
	for linux-mtd@lists.infradead.org;
	Mon, 30 Jun 2025 10:55:22 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b2fd091f826so3720797a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Jun 2025 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751280919; x=1751885719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOLt0laTo71qmfivlEGpwRyCLDx2kN9fgg5USjybj84=;
        b=h0mI5290dchrD3i68OSPIppsU2KPMpOUYMqOcJ9ZN1+/nvFKbsKeeU86xZMHAhDzyg
         TAwi35pvAu+o1oFmTjF3lQmZ5wgFR7/SuGwdO22ZNtHzTECMrEcPka+njsnBf7vPTTNE
         fVifNWUlCk/NZ89CmXf6yzhVSKRQNS0Up8yf8DgbLplgOK6eTUdLOfUt2h6ZrG3Mrk55
         K1WnPFrN/ybIgeBflU3hEkH18Krj387kRI6Vh7oq1Mp7KN4vPm27FmkCrCYB5vyexTje
         WZalYhNmCwmWWeGDPJDmwGHb2Jxi3HKEfE/WsM+gBxn2tGOMY2e1u+52lCJcFzEWthRt
         NCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751280919; x=1751885719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOLt0laTo71qmfivlEGpwRyCLDx2kN9fgg5USjybj84=;
        b=ufimZjmZy+r0tLTtVLFbhY/JPjVudV0Yi98If2XRvL0pmsY2OSedqAV1ruNunrq8Fl
         zfd9z6VhQdK0iemodPWzWXorbL2gdIL7bngsMprkoVaqudbL+y3kjp5RuqdywLJyvsLj
         ysEBt+03c7h3DUhdwpXPQAYFr7LU9o5/SblCuvI08aJg2jCkUR94phch7T8c4+N94rJt
         imQ7205FGZzGBaEU7aDflpqzjfajwAt/IuYvH2Ola/9uyNAgYZJu33iA/ag8NBdqy4MV
         RyhQsB1bPvFMQSQ0Oye9NBIa/Me25gfVQioSAKWZBG58n3o7GQA+OEjNh7LO+10otmBN
         FhvA==
X-Forwarded-Encrypted: i=1; AJvYcCVx/wvQi8GjSsC1bnj7beRzjhVaAzBxkHCjSK4GQOFBmzq+ZjYEGTY3R++YDx3wbOj82Mxypqm9qJM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGggFa8AvJ0JPgSln8R2GUR4WqEJ7Yrffd8qS7DXwl9mdNZlzT
	AbGsaNnqPaQiAkWy0GjAMRx6G9YR3G5ZkN5CWqFfb6ibDLBSznay1PWv
X-Gm-Gg: ASbGncsI9RsTP/cuIaxrZeUWz9iKqxxctaheve+ToWLvFXUXohbYWHnOkkYrka6VmGJ
	ZJCW/QlT4keZTqCA3XvIQgOKfawqGCBk2SZgwC/4Ohbw4UUvj5es0Wbo9Lk/HbST7321LYSew/1
	L8bkzw8sUXrMVd/iZn+VTh0osCDDYHrsvXYSt72t8qRCQiLKUy2hCJroJGMzg5n8mGo5xU/FXPN
	XUZzeZyDi7mAllFHYL39ROq1gquA7ou53KVunu0gYU8aFhDcW4MHg/6HYMH1eevXZ70gNrmfK2f
	LoRbStGXTlXlrMyxWfdudqWt20EatqfRGWIx2Bcb90S/f32TvWckphhi8fBoSTMXa50OBIX2xYF
	9wgnfU+Q=
X-Google-Smtp-Source: AGHT+IHPWCrIrwpVH5Rem/E0e4ErtM5i1TOdgOMS91Bjqqze7RazUd/vesCtrg2Yzq0nJxTCTEpWFg==
X-Received: by 2002:a05:6a20:3d8d:b0:220:1c04:80cc with SMTP id adf61e73a8af0-220a091ded2mr22546214637.9.1751280919295;
        Mon, 30 Jun 2025 03:55:19 -0700 (PDT)
Received: from sun-virtual-machine.localdomain ([104.168.88.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5409895sm8705367b3a.7.2025.06.30.03.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 03:55:18 -0700 (PDT)
From: Ssunk <ssunkkan@gmail.com>
To: pratyush@kernel.org
Cc: hhlee@google.com,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	mwalle@kernel.org,
	richard@nod.at,
	roccochen@google.com,
	ssunkkan@gmail.com,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: [PATCH v2] Add support for XM25LU64C
Date: Mon, 30 Jun 2025 18:55:03 +0800
Message-Id: <20250630105503.4673-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <mafs0ecwarovz.fsf@kernel.org>
References: <mafs0ecwarovz.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_035520_711127_494A6DA3 
X-CRM114-Status: GOOD (  12.36  )
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
https://www.xmcwh.com/uploads/954/XM25LU64C%20_%20Ver1.5.pdf

Signed-off-by: Kankan Sun <ssunkkan@gmail.com>
---
Changes in v2: 
 - Fix flash ID from 0x16 0x41 0x17 to 0x20 0x41 0x17 (datasheet confirmed).
 drivers/mtd/spi-nor/xmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index d5a06054b0dd..bc7b1a2afa9b 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -19,6 +19,11 @@ static const struct flash_info xmc_nor_parts[] = {
 		.name = "XM25QH128A",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x41, 0x17),
+		.name = "XM25LU64C",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
