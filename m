Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03E0E65296
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Feb 2026 16:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uyes9DKTL2LHmL47l1QMOKgcTGjuKoORt91AzWVVGyw=; b=2uASgt4YK8KM/z
	MpHo2ZHdDN9rW9GZeOsCg/KY1PqD+b16R3V35HXsqmJFcZxxnpyMqNWOdtedq/BkDBfTXjFY72iBb
	vGEeXzvcojBUhCBpfPYfP/7iZXj19+064KRGXH9QuxsO4J2z6rdQwQwd7jfvVdV8BbQ1EIUTTeHGA
	T17LXc8YaJ8YsOpCgPS+OoTEXYJY2sHSofSbtYBFcMc6Pyvqt9CN4mhsbB2sg0QfQTk2Iuf31YWyC
	WVXibpSliePkS1jF2emA9pJltq1hrV0VHPgWrqmpvndYvlh/tQFW8Qju/weSiQMLIggKbgsTdOyjj
	wElX7kBwDjHqZ98vthFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmama-000000040lw-11HC;
	Sun, 01 Feb 2026 16:58:44 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmamX-000000040lT-349O
	for linux-mtd@lists.infradead.org;
	Sun, 01 Feb 2026 16:58:42 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so38845005ad.2
        for <linux-mtd@lists.infradead.org>; Sun, 01 Feb 2026 08:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769965121; x=1770569921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBfv8eejZu+05bJxMtDkYGwkiaLBdKZ0g8Il/kPgKWI=;
        b=MuS3CXHnbieaz+ay1Ndfyf4yoVanOp5E26xpBj2T+DumeHlB1aBCjPKwKHvJoWm3Rh
         GIrT5cG81ybG64SKiN6Z9S3xOlkvHAzTlYY2DZpt2ftDNQIZFJhnSSH7itLZi91lyOuA
         owlbmOMryol13FgiId/1+ZPw5lrlJu+4AJ/gz4dvYdrRvIvcqxbNBSQ+KE/ol+NFmtvU
         U9Hmg0waFLxnrng/m9AGVXWjH7qCVJuy1PRvnEIaJB8rvvLRna4VfUUVmFfEer4FBcJn
         958yEHDm/WYYizTYRVn4R/zz30hYAX1YfwoHTm2HIMmehbtGiSkx149iByfCClenweLm
         DS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769965121; x=1770569921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBfv8eejZu+05bJxMtDkYGwkiaLBdKZ0g8Il/kPgKWI=;
        b=ECIb3xvO2qjAOG3vdL9teVK3hshP7ZH3TbiK+9kvvTHvuJOTdRyrE1IOMfPx39TfHB
         UNiFK+XI8PCvPainsiRDosWYVvnF3vJv+j/PfYJUyYl7b/aViwaiSkkI+C2Dwz01Ioab
         HVpe93N/IGxT+OPdRP9nlyF4KKj/g9fDNFPlG50u5Xcdvif80MCKDEPNqdH1aVcVHAJQ
         ZMKUGZFcvXF9k4bmfNnKHkcTJiVh/+EPJyUjix9NDkYhFmnfNCZtuy/sUMFFx/MTdoHg
         0wxLtSTa2jAfOV8ZVC+95Yn2Pl6x8YJOg21d3rBihsTVSapPSSpn66Mjc5MpNdSA+153
         SV6Q==
X-Gm-Message-State: AOJu0Yymkrfd0jIyipGoB6jnYr7OpW5O8AmUY6cqSGq49rB2pGp6EWKz
	fp86VI+iH20T6zFeQJ1gkO8h7bUztN37se9r9GJ8Ql14vSoqgF3e5a1s
X-Gm-Gg: AZuq6aK8swRUofJiIXBkM/JeI3n6+iX2qVaZMDr/mRWiruJd/dtnjBd+psdC9CqYuhi
	nMe+jFox2uRvyQYH1X4Rfd2D+vLO2UCdOyt3PImB93GTVFKlWjpXGYPNmlRS1dJGwDhsLlA8xPY
	QYl2RbKpPsoR4/Aepl0T5e9lLzFWOjPk0HhjaoKP8bdneW/fQy63emCcmXXJiqIjXeOD+qGf8nD
	T5cqb3yYGS4YNzRA0R+BgjhLpipQCiWgKsJ80OuTt87b8hub6Yld84AtCZnH+B6DYOV9C+4QuPE
	JDWK3A7/7SpVfIrkNSA6hpCAaKCDb2NzzjMwn7seFWz91xs/lPy5H3klEfh0b+8r0i1nrwxEgsV
	2SN0Xtttzn/XU/UWQ3OoUOvug1s6ML0phwlklxnh+lD2QgblrnxzXOiWGK893nba7TJAK6dvsy8
	N5np4YJnA4NyJdaELra5+TpbsK
X-Received: by 2002:a17:903:2389:b0:29e:e925:1abb with SMTP id d9443c01a7336-2a8d96e3de3mr95621095ad.27.1769965120650;
        Sun, 01 Feb 2026 08:58:40 -0800 (PST)
Received: from 4aee0dccb4bc ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3afdsm120222755ad.61.2026.02.01.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 08:58:39 -0800 (PST)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
X-Google-Original-From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael.walle@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sanjaikumar V S <sanjaikumar.vs@dicortech.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mtd: spi-nor: sst: Fix write enable before AAI sequence
Date: Sun,  1 Feb 2026 16:58:16 +0000
Message-ID: <20260201165817.53-2-sanjaikumar.vs@dicortech.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201165817.53-1-sanjaikumar.vs@dicortech.com>
References: <20260201165817.53-1-sanjaikumar.vs@dicortech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_085841_772341_779D4563 
X-CRM114-Status: GOOD (  11.49  )
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

When writing to SST flash starting at an odd address, a single byte is
first programmed using the byte program (BP) command. After this
operation completes, the flash hardware automatically clears the Write
Enable Latch (WEL) bit.

If an AAI (Auto Address Increment) word program sequence follows, it
requires WEL to be set. Without re-enabling writes, the AAI sequence
fails.

Add spi_nor_write_enable() after the odd-address byte program, but only
when an AAI sequence will follow (len > 2 bytes remaining).

Cc: stable@vger.kernel.org
Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
---
 drivers/mtd/spi-nor/sst.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 175211fe6a5e..fe714e6d0914 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -210,6 +210,13 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		to++;
 		actual++;
+
+		/* BP clears WEL, re-enable if AAI sequence follows */
+		if (actual < len - 1) {
+			ret = spi_nor_write_enable(nor);
+			if (ret)
+				goto out;
+		}
 	}
 
 	/* Write out most of the data here. */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
