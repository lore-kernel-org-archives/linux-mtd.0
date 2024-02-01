Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B024C48293
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BcvR8jndXN8HM7e5rr1zKaUyp3slvqp7p85qMqwP8/A=; b=eSpQPXuLJNH5V9
	fzsW0OXmmnq6HV99u4ZET4JxxHpWlcJEYU7+5BzHfMmKZ8cLXv+aopwRJXErQFsqwWKxGmIvvCnfx
	YnbsfrSfTsPUE3CtLBVsOKydUc1CedYlt27Ukz+wGsCbzE44gV2c93wcOnheHGk2oJil4KxX9NWla
	YMb6G/cBFtznLGYTzFO9iW7kwLO4/LgKlVXjr/URBLwV/pLXM3+wig6ua99kEQdgxwmaTGcMsQLzf
	q3PANuqdVb4gGQVB/hkAAg5VK8pKfrPa1IB4/XldiOh7Nu3ixSxrcMz8ZP6HVBUQUCanjKBQLbizS
	4qiVU6ezi5Rd3X+npqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTcA-00000007K7e-2J7O;
	Thu, 01 Feb 2024 09:44:10 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc4-00000007K3w-3ez3
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 09:44:06 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-363923728aaso3412855ab.0
        for <linux-mtd@lists.infradead.org>; Thu, 01 Feb 2024 01:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706780643; x=1707385443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh0L/4UkHUI+FuJ0B+Zs8HedEUkaHqmAc7rdEuQbRD0=;
        b=Kui3+xILXYALsTF6lgdq+uwsCDLB3tDh2615hJMuabrxQmZmTGj2Z/xz9OLiJD4UdG
         hDwe8Bl2Qd5ZKqGan3+Se+zDi9NqsucWD9A126sbGQxW85EW6MDi74YDiYT1MAj8pQL0
         1TwJnk1PnbgR/5Du/+tJuFM4u9PBBVIijYoKvPRYmNlSTlBimJ4+jR0AB9wsMPRrIsWL
         uvKKcTFysoeWZZtGLVikyR0vWWTGZZlMVreOV8gAzQ6JAdFDCYvVYHJSuE+MYu3XFRke
         1OI87+oQzWXzjnXpnk2nb1N+aVpvI6R9BM5jg/RtpEV+zbk8m46vWXQ2ElLDY7N9Prvq
         GS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780643; x=1707385443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yh0L/4UkHUI+FuJ0B+Zs8HedEUkaHqmAc7rdEuQbRD0=;
        b=kjgbdXCVlwwr9jlQI0erOdSN2ssh+n5BFiPcVf6Ni7OVAuczxd5TfN3b5fJqKzcsE/
         PWD9poeCyYNZR3zUOm66Y8w5ioT+b8BettGNLJEDMWjKS1trvtiEW4FpxLfjoH3oNdgr
         EsGhsIRm+6xL83PUVXeBVnLE2VEoWuUz9dgJzmWOXxLajit/7n+YR87v0bB4z/Rae17g
         jxv1DZ7JfwLflfqyIqUcXq6JERKIYDbUyS10A40xsiyUS3fJz4pgpXV0SFIIe22/3Pi0
         55NOsFactCQNsBrnY//nT2okrF4L5zx+ZGGHGg7JC0AidYRZETbu0Tjpzu+70jpKYcFe
         xncA==
X-Gm-Message-State: AOJu0YyT3kbayFh0V4yZ7AkUgPShCXQ/GIMBNgKcLl79fs4WFac1jhLw
	H9M9aB4Vpux1CllIaSDO76rsxcJSp7Iq+g++B8AG765rF9wv1hfI
X-Google-Smtp-Source: AGHT+IH+XgPXNFKkJpG7P27Z9/gNLhny1ofBMZo8aI8B+L3YRW8BdTpkGEsdKmS2l3W1N52e/vwFOg==
X-Received: by 2002:a05:6e02:1d85:b0:363:7f81:6bda with SMTP id h5-20020a056e021d8500b003637f816bdamr2625300ila.15.1706780642895;
        Thu, 01 Feb 2024 01:44:02 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV/R4YRO6kC45uz1ozc8Zu8JEQzMXGKzxEIwwWt6+5HQiT+ZojDkyDRNlkthbsTws596aFaNJcEbGXqHrxG0yQaxxwa1u4hjzUzA50EiX1Arda420MA2zx++wVu0JfJhjFzf/fc68d1lJzXx5rhb/orzFqvTK+WpCah8D9POY3OnCaTJAeEjLPjexyqT7pTtcEb+H/6A0VF4MILCbZ7bklTzpNjXBwx4QIEu86A9N6qnCgNioyGCBJx0REPffBF87+lp6MVzFMTOZ/PFvLnNgKg6I3oQ2RYKTDqGiGjLZisaAtoAQIoQaBYl2nL6SuIpYs3Pw==
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 31-20020a630d5f000000b005c21c23180bsm11972741pgn.76.2024.02.01.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:44:01 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 527878095A;
	Thu,  1 Feb 2024 17:50:02 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v8 3/9] mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode
Date: Thu,  1 Feb 2024 17:43:47 +0800
Message-Id: <20240201094353.33281-4-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_014404_941819_422FEA13 
X-CRM114-Status: GOOD (  14.39  )
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

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 5 +++++
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4129764fad8c..0076007e1cde 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -113,6 +113,11 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->cmd.opcode = (op->cmd.opcode << 8) | ext;
 		op->cmd.nbytes = 2;
 	}
+
+	/* SWAP16 is only applicable when Octal DTR mode */
+	if (nor->read_proto == SNOR_PROTO_8_8_8_DTR)
+		if (nor->flags & SNOR_F_SWAP16)
+			op->data.swap16 = true;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d36c0e072954..3c5190ac0a79 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -140,6 +140,7 @@ enum spi_nor_option_flags {
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
+	SNOR_F_SWAP16		= BIT(17),
 };
 
 struct spi_nor_read_command {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
