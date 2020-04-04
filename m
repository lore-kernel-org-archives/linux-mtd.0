Return-Path: <SRS0=65ud=5U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E55C2BA15
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Apr 2020 15:36:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B5C20644
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Apr 2020 15:36:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e2uj6/xC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myi6YLyo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B5C20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=xGEEl9IaErIBv34XAZ2FrJtfDopZv2rbovlGHpJlqng=; b=e2u
	j6/xCdbAoF/dfwPzij4PzQ+APPiPsx/Sky7qiH/psGBa62rgvqRPoMkoCCPO0jNYHpPKhlUduV5B7
	BIbOHSIYfBcREnViLRKzIQ6WMm8lwIqbxfk1+KbQVjJ7w4gLRDL9mEgR4yjVibd4j7ijQuWBMJeJm
	2ebYMkt8Hw2lqk1arPAW31QMhwRNe+J3uMB6OTrUfwZdgdyLbb30mFZerRFlziXBWgcAMK/t4hUOc
	5aoYh5q8lzNSwykzEcVWphsY0BiAiKzdILNMd8PR9NX3YjACotBPc5L6T2rQvnUj/DRHjXoKhq+lY
	/dnteBvzrljtrpP321CaxMFoBlxnXSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKkqb-0003z2-CT; Sat, 04 Apr 2020 15:36:37 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKkqZ-0003yY-Bz
 for linux-mtd@lists.infradead.org; Sat, 04 Apr 2020 15:36:36 +0000
Received: by mail-pf1-x442.google.com with SMTP id c138so5227038pfc.0
 for <linux-mtd@lists.infradead.org>; Sat, 04 Apr 2020 08:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=pbazCulCIKKkz9Ego4v5HD0m1P/J+HUtTSIcWpG1JoY=;
 b=myi6YLyoE+RLHDUNGBvNMpbBa8r3y1anRiBMDobXca9RTKlmkYJPkFfUogM2JOOQdP
 Wx50qpAwF3QvQxetWKFQL3wTH8BpostygOCO68OAEnFZq9hrKKlcsGi1TTrokdgRa/lG
 VooGtC0aZwpvg69Rl6WvdFUFku90XFfp+iBqOX4MDh2LN0Hdi1054ptYzfpSF2Lgj/Yc
 PS+eGFjSZSaJq1IvO1gu0gjEcoxmTjNJj9IKvZUDo4ZEa+ldGTfKi0hyuMMyawyIP8WO
 f5OX09f1bN7Zh+wtihrvLDKMZWkjpjmGl+KlEfrjX4kg9u+tYhwfUjPJ9AE2NIW8w3CD
 KMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=pbazCulCIKKkz9Ego4v5HD0m1P/J+HUtTSIcWpG1JoY=;
 b=OL9YRfm/flZ2yo3Z3awe6B71CiZGt0saD9TT3mOXJu5Ks88Pfn54S/2YJ8Bl5tKuM9
 qeguxxlbR3sdc0M0mqAM6jqN7BOZuBAw9/TzE5hoZ9DgofnN9/s0tQb05QKOKY0y26EN
 zEzgwadTkE6Gq3rnjRzC9aTHGTSK4u4ighdDC3/lkTX+cgnaUaUFlUNhIs1CbA1LDRzt
 JZdFy+BfKbprd8XN18dsHh6pyWm1sd1IrD8Rr/WBdh5rfDRzXGW7Ahv+msWMjt8OAm93
 roW56n3XZQGCgoN2Y/JwbSZy3A0W77S/ireqssKd8PEmlA6VcZyGBqd1Kd3NTNMyze0n
 51MA==
X-Gm-Message-State: AGi0PuaAGFsOJMCNDVAUzbzuE6nHpc/H/v58TotWjF47+rAIIHc7GXli
 BidqAMOWrhwXltJ1vKdUOgo=
X-Google-Smtp-Source: APiQypK7h6kbAovnIT6y/Nq2jrHhKaImbbfuqw0UqwWnEZtaSrfx+B7XRFvZyN6Ei4FD/vezZlWRkA==
X-Received: by 2002:a63:f113:: with SMTP id f19mr13951250pgi.168.1586014594406; 
 Sat, 04 Apr 2020 08:36:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id x75sm8028885pfc.161.2020.04.04.08.36.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 04 Apr 2020 08:36:33 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: Compile files in controllers/ directory
Date: Sat,  4 Apr 2020 08:36:31 -0700
Message-Id: <20200404153631.103549-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_083635_409111_FB2F83FD 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code
split") moved various files into a new directory, but did not add the new
directory to its parent directory Makefile. The moved files no longer
build, and affected flash chips no longer instantiate.

Adding the new directory to the parent directory Makefile fixes the
problem.

Fixes: a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code split")
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/mtd/spi-nor/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 7ddb742de1fe..653923896205 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -18,3 +18,5 @@ spi-nor-objs			+= winbond.o
 spi-nor-objs			+= xilinx.o
 spi-nor-objs			+= xmc.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
+
+obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
