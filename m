Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B75CDE00D
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXjqo1gFCNCkV0MpCjPxWbacsdwrUXdp37D9lpwdiT4=; b=Zeq6FboX9GE5+x
	nL1pAsrsmpIP2l3nKAIM4CBrq5cWHdADj55UJ6RSH1cZ2hBEAp79WqUVxwHL7bd3mOjNZr2+PI2Sa
	Soo/Syek3bz9oECeu0TLgghM0DBdTiLFVRMTtoid7Enhued079Gv1QU/zVdUqc0g4STr8H/K053KS
	Lf/FUici8yq2gx6oIRdL5lSwrd4imaGBbiBAvW29GVpZr7DRjSCkt+J78FPLxPDAoZiiw0h+FOioS
	5cRWvky3HrAkB8ETPlb+aazeO1meiL/8jCcIBXev7F8ZPCe+XfefvyeHzZATS0QbEHpwcFVvt/cKT
	Dk0WVtOOh8wm+/wLmhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQy-00000008aaU-35v6;
	Thu, 26 Sep 2024 14:25:32 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQo-00000008aQE-0Rqy
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 14:25:23 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso770081a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360720; x=1727965520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbPIZJpcVIEhpHEVG/j37aleyqQqnMhNui3ve62e6y8=;
        b=IBcLyRdJWuJR9ABqsMRxreBojpJEGowyoAoSaZGUzMF3QrwpvTnuaRtawKBIk6kzXq
         gk2+EY7GqOZclGX0W82SnH1X3GBNqO2H+hSEmHRKleTbVcUkzkf3JTsghn6Vf1XC7TGp
         ybDdpDmyyzeXT8Jws6fXs5PslKDbqC22nhKLePaRuuatLHJcmdIkVoSpp8xhZqksx3FB
         DuqKGlhG7jl52kCnLF8pD/Tg9aKL7oYnbYINwJoMbFgNeI92avpy6ZlceqMos21PpBDq
         zzsQtbxrbtHh9d5lRor1cRzepSFW4uRojt8VIS6OvwQUU295MRt3lkNLggXZvwG94r+o
         Ln1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360720; x=1727965520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbPIZJpcVIEhpHEVG/j37aleyqQqnMhNui3ve62e6y8=;
        b=pcu/1u4eOTTDhi2bBYFv6FqBtlWvnrI8YS53QxuY502Ib+kkTfgMNxnCDEz4JOogSR
         Yqe/CeoxNQANpuUzfNabaa5M6MztoSXkhxqkbpViggsiQF1UMqxNPxnmKmxED16TrtCD
         ta9mM4PnnfNBoaTwp6rw2wXsXyDGjuIsUfI4bq0JN5YQ7zwzKgnR9cS6/IJdAVynXr9q
         KPT6zhSG17J8S4BKHIxhqPqo5CDF6pREwKgw+Sgc3mzdjripyIUYqQwU3prDztx+1CN1
         0I72JmHNDu22Z0IlQsBhDkmVLNUZtYg2wJkqeh3MxQI0xQIyAynlIcmPSOm+7j5+oWOi
         J6Ag==
X-Gm-Message-State: AOJu0YzJA9E0k0omABIrV2IUTbWBm0SZBq2nQdfPSFJVFwHGIQj7lFnH
	uuSEyOOqUmG7NnKw8Uk3NNAvutoWwupI8CEY5SZrOPmS+5+m0fLI
X-Google-Smtp-Source: AGHT+IHisqnk7KIiPORJnFsqOHN+dwrtS5lGQysFzmZKGyTwiAq/CDdvSpjHomonSIfnNNGUcrdOyg==
X-Received: by 2002:a17:90b:3e82:b0:2d8:dd14:79ed with SMTP id 98e67ed59e1d1-2e06afbe5c7mr7237287a91.31.1727360719702;
        Thu, 26 Sep 2024 07:25:19 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e085341490sm2751779a91.21.2024.09.26.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:25:19 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id CB751802C9;
	Thu, 26 Sep 2024 22:33:06 +0800 (CST)
From: AlvinZhou <alvinzhou.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	AlvinZhou <alvinzhou@mxic.com.tw>,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v10 6/6] mtd: spi-nor: add support for Macronix Octal flash
Date: Thu, 26 Sep 2024 22:19:56 +0800
Message-Id: <20240926141956.2386374-7-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_072522_256753_D5ECF7F3 
X-CRM114-Status: GOOD (  12.67  )
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

From: AlvinZhou <alvinzhou@mxic.com.tw>

Adding manufacturer ID 0xC2 at the end of ID table
to allow manufacturer fixup to be applied for any
Macronix flashes instead of needing to list each
flash ID in the ID table.

Such as macronix_nor_set_octal_dtr function in the
manufacturer fixup can be applied to any Macronix
Octal Flashes without the need to add the specific
ID in the ID table.

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index f039819a5252..1a8ccebdfe0e 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -200,7 +200,9 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx25l3255e",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
-	}
+	},
+	/* Need the manufacturer fixups, Keep this last */
+	{ .id = SNOR_ID(0xc2) }
 };
 
 static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
