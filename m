Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11286D41D69
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 07:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fb1y+Wv4BcaCM+qRp7TMLpP6/JPQ5AcRa8KiW5kV9Sc=; b=HR7QRy+fND/aww
	1Clt7Q3CgcpzUNn9aN4hOq/ruzIuWXtvZqKnJYMk4o2UdwLbahW6qzz0eQUbVx03qH8DP+aSpypQR
	LhSykS/H3W012yK32+0fSfufiDwlInlLjw7P/zw4d2Ec0tet28TtWNsIHb+gr2SJIPSmsg5PEbUl1
	7TA28dPeZzBhtUNYcUCMPZJjKaAD0YkGzomkJNDvzOCkSaSQSX6MJyAou41HlWUcJZJw9ie+eLZcY
	TQAS2yMU/WAE8q6Gw8sMdylGWjK4d81dSprKiyd3ZHSrHg9YD9+Pz2GosMnBjZcqrJqI1Q2+0d4/+
	Rw+YCHy/oFA8+T3Wo1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlln-00000002YQ1-3PL3;
	Tue, 12 Nov 2024 07:57:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAliu-00000002XrB-05QD
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 07:54:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2113da91b53so37578495ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 23:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731398043; x=1732002843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuWrfgsQNTJ716oVrGfZpRhEFToaTIMrYD6gaLXxeaM=;
        b=GkKtLjLkA3nxThX/vqont/eoel2dHUm68+yn2KW4Vw63z9ZoikMwaa66MrmazsthFr
         6Y++p8J1zDMX44zSvoLHAqmqtMThFxvGNBe5UTTsA1l+pAB3Q0Jkn3NP6gMHHi0iHNun
         zk8t5Po+6xgWSfYe/8O8gn4dWqu8w1nFqyI1cyRrVMf6YF4OVU2S3keKlzQew9/jd0yC
         VwWKYX4AGIvkC+wM0YChZ4qG3ajJ1v/4luESJMSnnZ7bNSZwRppxKfGCgBuJhPrAqOZa
         ehAzNl/kx0WOOiycgslshr6qaj/K6i+v9C/ODIADheObwj6qpCt+RM8m7eI2ZHUlnXBk
         v7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731398043; x=1732002843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuWrfgsQNTJ716oVrGfZpRhEFToaTIMrYD6gaLXxeaM=;
        b=EANCFkARrT69c+2VW02wiGjt0PwmRYvmAxozMHAyRGtOfQoKTU40AiJVGEePX2QFiO
         JqYT9RmYAJMk3QwII6nxvCLAMtFnESnTRvUk3F6yXjC6TlmIxWm1sqizR1c93dapuAD9
         9nYIkoPxLv4RiJ1svUiUZCWW40ipXQtrufm+05CDi3yg1BTaN9Vm7EyUdk69G40qi1bD
         vxW6gbcVfYCF77WQBi6Bc78XQ5fTmCiT0fDfodJrmxAQ9d0z8fNNszJr9x17KG0Hhnh3
         gJJhOza/YfuKsRr6NBLyNAT8C4ZGOw2vBBz0yfmcnT3wlV9az5TdNEZKvPHW6exLelAr
         kETQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDCH63rnFZfqUCTqWlKEfUyGPb1W148iUSLIB+Q/9hvV1T8XRh0buO/vFv3Y/2Os9YzIn8CoX7j2I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyab2JU8Vw+3b4POuDI8nf9rZ181BFasKmVlUsBQarwD5r7jXFn
	nb7EQbjQ8SzIWs+nGTO9a/9BnDuVZm3VAJjr2FTENjFfQsTblkdktA6UFw==
X-Google-Smtp-Source: AGHT+IHPcZFOF0VLKgPkcEkYLMgH2BDqOjgsATgTZyQxwWDBFqv9hjd6OidpQsZvBIsz52G33B8qGQ==
X-Received: by 2002:a17:902:dacf:b0:20c:c01d:54a8 with SMTP id d9443c01a7336-21183d1b658mr217602935ad.16.1731398042766;
        Mon, 11 Nov 2024 23:54:02 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6c137sm87719485ad.249.2024.11.11.23.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 23:54:02 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 16A89802EC;
	Tue, 12 Nov 2024 16:00:31 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/1] mtd: spi-nor: core: replace dummy buswidth from addr to data
Date: Tue, 12 Nov 2024 15:52:42 +0800
Message-Id: <20241112075242.174010-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241112075242.174010-1-linchengming884@gmail.com>
References: <20241112075242.174010-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_235404_084590_A6617124 
X-CRM114-Status: GOOD (  13.73  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

The default dummy cycle for Macronix SPI NOR flash in Octal Output
Read Mode(1-1-8) is 20.

Currently, the dummy buswidth is set according to the address bus width.
In the 1-1-8 mode, this means the dummy buswidth is 1. When converting
dummy cycles to bytes, this results in 20 x 1 / 8 = 2 bytes, causing the
host to read data 4 cycles too early.

Since the protocol data buswidth is always greater than or equal to the
address buswidth. Setting the dummy buswidth to match the data buswidth
increases the likelihood that the dummy cycle-to-byte conversion will be
divisible, preventing the host from reading data prematurely.

Fixes: 0e30f47232ab5 ("mtd: spi-nor: add support for DTR protocol")
Cc: stable@vger.kernel.org
Reviewd-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f9c189ed7353..c7aceaa8a43f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
 
 	if (op->dummy.nbytes)
-		op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
+		op->dummy.buswidth = spi_nor_get_protocol_data_nbits(proto);
 
 	if (op->data.nbytes)
 		op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
