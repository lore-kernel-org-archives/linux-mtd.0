Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CFAC5AD4C
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTSaaKKVXyTRkp9c0D6YEiM58kDiRq5yIJGh3Q7KSqo=; b=L4m2SEuNv5aqad
	KuZvuuR0/FFcRk4zQnKK3RoEfWJH2Xn6ED0+aTLjoq86dqG7oRjvnANy09izULFC6ZyYp9AC/iafB
	FWFgwo+gagV+JfPuM+3KWA1dcTFGGg3ZSe7fPp2hxP3DhQByoX4bVMvNJaqXN9y1yl1qWySFydBzr
	dpg7ntJbkg1zQnUAgOtuCdnZBcvWHAeGT6mBVbyvnESaQYeZFGeaiqXAtdKEd1QfKZ7N5l8eRaRc9
	j8wNGobkMBJoDnYXCH4+00S4BjWZFINaQLXxCIfVS3A0ZcFtbnqKJvHaNWOnMu/i8p8eIIDc9imRU
	KzzAW+ECFBhrUMF7iugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNY-005xEw-0z;
	Fri, 17 Nov 2023 08:39:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNU-005xCf-37
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 08:39:06 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ce627400f6so749975ad.2
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 00:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700210342; x=1700815142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVTTWWtZhFqG9GH7YEwD3bL8dviTGVgBf2t5fcazJks=;
        b=gQV/tNN3OGmhdfYpKkyeaRWcqrpWaPcYNlh9C4XnrhOH6ibTwxzC1w+QckZ1ZVTvS2
         tPjwnzJaAEd9QAEE3KGoRVjfzoBjcFkCKG8EbXwDKuojC6ViwZlGIwdrdzYa5C+H8BKg
         YXjrV+9brkZBQ//GSLPsVtCnfVKXgd/mmi9YIEZgz/PjpL0pEVxgtk3oFUQdtnxSX6yj
         axSFdpw0L1ePgsNewfg75OFjf/PlulpAuIOaW7X7Kf/bkMzmXScSpv1sqUPoEKxWp/xr
         27JZisCRpgdLXe7JUr2HRljGXALSnJchRW9jTyBIuFq0UMOmd6U5t9MNcFxda3BsLP6T
         3bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700210342; x=1700815142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVTTWWtZhFqG9GH7YEwD3bL8dviTGVgBf2t5fcazJks=;
        b=eVOwyyeH8m8DUmxw13IvAipFhk3akJiQQKY6QxTCSctqpcK/zpA5koyujmBBS7mL9C
         HgxmTr9s6Hrgo3EJpNcVOmItGsXODPSXqZnwzM0BeoKN6tHa2BuFyjPO/be6T6ed1G0g
         h1IGDZsDh7N5tbB0wfjiPoMBELwGM58qMEyZDuk5QsLDX8DtyspMV1XD+yLvNzo0yvcN
         UdV5/Ei61RjVVlai7Vbk441Q0CJBsbHmWPjJhacjAsiRCj4hBfKDAWt10gR/mRZLnMtB
         CG2YZHUMgRWwp/2CrsiU0yRNEJSLuVrZodBie4HeNmzat9wTTCpNe3PIdzvBqAH4DTPj
         hNqA==
X-Gm-Message-State: AOJu0YwFvyh6S5MYWiyBn3jC8DPazMBpGD6a35y5Okj47uAh1dvx2VWA
	j0WShWakfFB5i/iWtbsl3JE=
X-Google-Smtp-Source: AGHT+IEY4be2/71CTCqKq/4/UsWb//FUXsqzjUgGRCVN+TLf+7UWAR11hkRdP94ggySZoZxqiH3ZeA==
X-Received: by 2002:a17:902:7e88:b0:1cc:65bd:b453 with SMTP id z8-20020a1709027e8800b001cc65bdb453mr11290311pla.32.1700210341968;
        Fri, 17 Nov 2023 00:39:01 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090264c800b001c9c5a1b477sm920758pli.169.2023.11.17.00.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:39:01 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 646F38056D;
	Fri, 17 Nov 2023 16:39:01 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v5 3/6] mtd: spi-nor: core: Allow specifying the byte order in DTR mode
Date: Fri, 17 Nov 2023 16:38:50 +0800
Message-Id: <20231117083853.33329-4-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_003905_003939_3C4BD88C 
X-CRM114-Status: GOOD (  12.77  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
The byte order of 16-bit words is swapped when read or written in 8D-8D-8D
mode compared to STR modes. Allow operations to specify the byte order in
DTR mode, so that controllers can swap the bytes back at run-time to
address the flash's endianness requirements, if they are capable. If the
controllers are not capable of swapping the bytes, the protocol is
downgrade via spi_nor_spimem_adjust_hwcaps(). When available, the swapping
of the bytes is always done regardless if it's a data or register access,
so that we comply with the JESD216 requirements: "Byte order of 16-bit
words is swapped when read in 8D-8D-8D mode compared to 1-1-1".

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 8 ++++++++
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..f659dd037a25 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -70,6 +70,13 @@ static u8 spi_nor_get_cmd_ext(const struct spi_nor *nor,
 	}
 }
 
+static inline bool spi_nor_is_octal_dtr_swab16(const struct spi_nor *nor,
+						enum spi_nor_protocol proto)
+{
+	return (proto == SNOR_PROTO_8_8_8_DTR) &&
+		(nor->flags & SNOR_F_DTR_SWAB16);
+}
+
 /**
  * spi_nor_spimem_setup_op() - Set up common properties of a spi-mem op.
  * @nor:		pointer to a 'struct spi_nor'
@@ -105,6 +112,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->addr.dtr = true;
 		op->dummy.dtr = true;
 		op->data.dtr = true;
+		op->data.dtr_swab16 = spi_nor_is_octal_dtr_swab16(nor, proto);
 
 		/* 2 bytes per clock cycle in DTR mode. */
 		op->dummy.nbytes *= 2;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 93cd2fc3606d..fe1259b32110 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -140,6 +140,7 @@ enum spi_nor_option_flags {
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
+	SNOR_F_DTR_SWAB16       = BIT(17),
 };
 
 struct spi_nor_read_command {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
