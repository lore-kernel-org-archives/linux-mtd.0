Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B082C00528
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCRwQymGJVsYDhE9ObhJm+yOxOocNsLPUkg71PcKuFs=; b=ilWH4pjSIrJUDq
	eiDXqCjDzYzfQAcv8bbpyfAYHWpSa81jYtsoKMdLy8i9CnKgTAzf1wALMuOz3IjwYDm/hWjMCPSF8
	hM88lXci2RxtF3UYnAOtO3ACRdglxlFBj9OAx+ingLcj4Pdiyzl3McsVYWVNHmpS6BEk4RC2fansG
	5NW2ZCQ1U7vYYoAfejrqGlNw6A/L/NBS/lRMHxCWAinCJKpdFZUiGdqAAmtVQaJWQENLbCCg1+Bct
	IQYrAa/rlHgRwq0QVhUdyscL2Kw2J77mXTgrxDaP0Vc19pg/Gv4aoLAaZMbQY4o8CTzS6zloEOO7q
	xobdXkvQnxDC8UwYvy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWS-00C48l-0l;
	Fri, 04 Aug 2023 09:55:04 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWN-00C45T-0g
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 09:55:01 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68706d67ed9so1414042b3a.2
        for <linux-mtd@lists.infradead.org>; Fri, 04 Aug 2023 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691142896; x=1691747696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvFfsAoVmKNuk9dEBdHEE09f5rPlbZdt4Ayo1+e4v4o=;
        b=Dm0TYacsMQvks6Dvt7p/j+wkKEAXCLS5jh687MPqEKTSvedbPKwl7m4bw9ZUpJE7jA
         gnqxVMJri3B+LXL1zEH4Z/ZSuYnjWgqbVMwW7WFSleE336NaLH7KJ6rLqmeTkp2hInNy
         oKKHBioLPqjlr1+g+zsG4LNSkexLPqM6tKGOL9bbwsDEJoRZFyuaPKwgHNJNLMLtwGWd
         p2iifKJuur/Lfy0ZbyOpgxhwKHT8m+u1YfYXzHT4emt/4f5/I9wM6/wgDWmWx9pYZqAG
         Vb2fhquHxHSQsbldiUSKuKUAkQMAq+I/o0g/dobqA3BIcZDVqEQz86vhbz7GBtgZ5N5s
         aHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142896; x=1691747696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvFfsAoVmKNuk9dEBdHEE09f5rPlbZdt4Ayo1+e4v4o=;
        b=Y3XumNvaSwuR4bcbIykytZXpGJsygbBslhqyrSzCw7cdxqncW3yDZR6ZA5BG6xoz8R
         URP9QJdmhuZv2OZMLwHkM1TzVnpxUoLhRkrDgJH8PfwLjcrzDTHbd4E5zuqwEeTekMey
         jUe4lz9a0Q2u/ya0WTubIipuEkOsKz9DVX0r+iY0yLyHr4nKkxW5kayEwoskiYNG+ELM
         zWwPhqi3oFBovRSeAF01eJjwXrc3fk+ZcT1ZfSQIC+1XkEOdtNQC5SJ9MrgKi2u9XmLB
         8ledEq6fsZrHjHMmBpGwsKjrt4ws+8dNmarT9xwfFIBjY4QGtAl2OHwKCqlEYdxMrsmz
         TzjA==
X-Gm-Message-State: AOJu0Yy0uusCrk7mZBBJoI31CPIms7W1vU114cEgR9PNAJTZNpvQ8qGi
	KdfMajOA6Fi2v0x7Vpb2LDI=
X-Google-Smtp-Source: AGHT+IGA9BW2lP5v91CNlREtmhvZXJg2bvDfg034m6Z1qnmi4S2wNkYr9QFDlgENyex5VskIOFN5SA==
X-Received: by 2002:a05:6a00:188f:b0:687:4ec4:95c6 with SMTP id x15-20020a056a00188f00b006874ec495c6mr1200724pfh.16.1691142896299;
        Fri, 04 Aug 2023 02:54:56 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id b14-20020aa7870e000000b00687790191a2sm1244657pfo.58.2023.08.04.02.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:54:55 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 0C08480570;
	Fri,  4 Aug 2023 17:53:44 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v3 4/5] mtd: spi-nor: core: Allow specifying the byte order in DTR mode
Date: Fri,  4 Aug 2023 17:54:08 +0800
Message-Id: <20230804095409.278419-5-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_025459_249234_3479EAB3 
X-CRM114-Status: GOOD (  12.39  )
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

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 8 ++++++++
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index eb0a09c06bf4..447cf1bc7fa4 100644
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
index 4fb5ff09c63a..08925e222416 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -132,6 +132,7 @@ enum spi_nor_option_flags {
 	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
+	SNOR_F_DTR_SWAB16	= BIT(16),
 };
 
 struct spi_nor_read_command {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
