Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E0EC46CCD
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTSaaKKVXyTRkp9c0D6YEiM58kDiRq5yIJGh3Q7KSqo=; b=HEMge3lzPfRB0g
	0AgLAwe6PjowzO1e+qsPEFSmvG0dUSGAySj3SRfXAfEOhW8U8fXI1doNqKWlobw1fQG7OXfTxeN/w
	qmTRDFByW0XlrbjHza4Q5m3BoGbS5CMFzD2/nPHO6gUqlUyJ+hIJUtv1DVm2enFP/0J6h2Ty03nz4
	Y5AnZKJY4Sn45b/InQBe3xdBgYZpWq2CWG7AbLN6CY7XvLyMvr5ULCFeWGWqFVhgro7ilfBo0G2Rd
	vILrwPY7ODu72Ac0FAqcwx+a8L5nInpBbqvWFW/jeJU78UvIapc/lFcL+Hf2jDbN9oQm3I24JjmDn
	yz295MnmVyE9bO5PoF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGF1b-002AxJ-2l;
	Thu, 21 Dec 2023 09:07:27 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGF1Y-002Atp-1U
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 09:07:25 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-35fd04ede25so2525895ab.0
        for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 01:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703149642; x=1703754442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVTTWWtZhFqG9GH7YEwD3bL8dviTGVgBf2t5fcazJks=;
        b=MLaHPvcVRsbTm1BEwmUhacVJy1fVg27mNI4YqHY7vYPCgPefFZHuzny1tVaI+BVQIP
         BGvVjf7TTk7Fm4IM/SqYuswIvE82dXObB14ntS+6oDcdcLPs8tDSJ3FYVAyGD5OiD9uv
         3u2xrpl2TlBQgFJHVjjMhScPjJyJzZWsD01DbjBlsFrY0y3FT1lf+s/b8NWvv/rH8grs
         KkWBzoeV6g/RSJ+N7+bEDONZ+lkBPWHE4VXOeE6nUKfdA+c72iHqMidEcnGxgLEmqZ3k
         kpB+R/1c6ubZgu4v0m8KopYa36SuHs45K1oHDxoiay2JX3xA1Jh7NTLASLFSwM9kKXho
         Xpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703149642; x=1703754442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVTTWWtZhFqG9GH7YEwD3bL8dviTGVgBf2t5fcazJks=;
        b=ZV6S5CGizoHPLlJ52wah6jSutyZgjRCVGyhItjpYlYGZDDNI+Caqro0CdXe/P5rxcL
         TmpKx3ob4YUEWDJEIhsXGlNhsglEH9ZUamwF9OkH5OYl7nAnbKgL3oIngELfb0gnmkWJ
         +YJfz9jo1DXCMENJeZh0m30mh7Gv+iXmKJkX0J3JMDdMvRA057AcOz+YF61+g5/rbLgT
         w4KKZwjU8ExgbkC+nLZ+zh9U1GVQm9rQiw+XLFBPpCWapahikRkbl2tXKM6ZevypNKa0
         /+6ZAeFpVc58CMT7HBJG3VG9RdW/cUp04HIgRf2ClTZR05bffY6+JmSYXA5rqrz5pJ5e
         Bbeg==
X-Gm-Message-State: AOJu0YyhNFf45w62eUlkXkbOONGgXe7vlEIks0tM3ZKjiYDG091u2zJG
	LbpmK8Qg+1HSBZrCgCaBLkk=
X-Google-Smtp-Source: AGHT+IEoEnn0aL40fGvnvoWWR1nq9STufUIN5V0xUSvkL3vsTsUU1WeIjc7TJ3iHg9N80xrO6xuC3g==
X-Received: by 2002:a5d:841a:0:b0:7b7:c91b:f624 with SMTP id i26-20020a5d841a000000b007b7c91bf624mr8474473ion.7.1703149641903;
        Thu, 21 Dec 2023 01:07:21 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id i17-20020aa78b51000000b006d93789402bsm1106196pfd.69.2023.12.21.01.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:07:20 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 9F0E08061B;
	Thu, 21 Dec 2023 17:11:30 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v7 3/7] mtd: spi-nor: core: Allow specifying the byte order in DTR mode
Date: Thu, 21 Dec 2023 17:06:58 +0800
Message-Id: <20231221090702.103027-4-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_010724_499408_A672292C 
X-CRM114-Status: GOOD (  13.06  )
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
