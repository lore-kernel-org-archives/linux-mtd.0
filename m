Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A503606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 05:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GIqfb6Go;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3WY5rNy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=acKWBvpsrooCR+LprnPT96c4HDLxptwtQNjqUCo7FWk=; b=GIqfb6Go0l7sPEX5/h3GG0hEu+
	jTN0qc17mgpkLnFn4A8giCXO16qB7nByUgynVph+gg6qN1yA72mz9ipzxTBW4Htmo2xg3hSp95FdO
	9cTK20DnIoXrbCr38hiLdlexE/+s3oxS8V2m0uyGiZAcB9Fx9dQuNZqlsjXf8n9yFo+8tyZrx/wma
	iT7VouSjCNGxZBLaI/5JdtuOpwJ9PKYHCrza7R1XOk99mJjVmW/1YSRGjPzsCgh2+FHF462xgIkqY
	fFKlSd2gwrD+QmEk3mryg7s0jha3y8chB8wZ5l4vgRvWTXpzmyE0SDExF4VeXLmj0oZFnogZvMDdJ
	5PrKyzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMwn-00000002L0b-1NFL;
	Mon, 23 Nov 2026 05:50:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMwk-00000002Kz2-1eZw
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 05:50:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1178776a91.3
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 21:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413033; x=1796017833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmnXF3v4tuK1ZqxzI4mf7SiDYhBDjm5JKI84VQtIpT0=;
        b=H3WY5rNy3j1LaN81kbC60809fEkRUXreJMTCmQUyOcBdYsqgs85BHw+g39lCm026vn
         UOozwYZO0oIc8qxY/iUf6H5HtPhBzI+LoCd5McnyEuPRaVD+afhoE4bRBIOtOQeTW/Il
         D7pJr4unKUEvJ2XcY3Bq0VyfADoM7dpQt/nvk1CRBFziTqlq4G+ZLycZedEz/Cuyp0KY
         Y3eEHyD+JhqZj0UJ29Y4ywbzX1XZEcQlA+8dV18oixRuXoqZZubGD3ZBNTpIeEicYs+R
         /iw2iMHRaCsALpl24fHxXN/ERjo8Xqx2yWzACdCIEyhiyiekevU8nVIYPc5dOntirdlq
         ZrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413033; x=1796017833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmnXF3v4tuK1ZqxzI4mf7SiDYhBDjm5JKI84VQtIpT0=;
        b=aZ2fWJ0Q264UFHp0h3rjIKuBagHECxUM8sPDWQo4ixxEPhadAQshf4OF+rkcnyYala
         sMrgVGQcoyK9a6napydMZ/GkRXztIDZl9e5vjBr9B7XO857/vjGRGRNugMr/M5ugpM0P
         7PmKBdVVtwuNWx54JS1cba/5xgfVq9cngDidWIhAmDNNgR1dDurhtw2eneCvhV4hYh0U
         rXRrd2Om+/y5ln73kSVKGqdT6PQwWQhCtibTB+jfl09IDhMX75bcwaNm3FrOtsstfMYk
         kw12W/ah6Oy4atj375qIwNX7sYrjodIvQUJ14HkB+zskFnD3G8b/7qCXQQxnpOTsPoVd
         eoaA==
X-Gm-Message-State: APuU4Z8X+KseuXOOZ49nHpZVYYqfXs92PHHB83WGcvBhpo8IAYs2WPPn
	2/jB4OdyvE3oi5ofB4BB/iMqaLPT9GDhgCx/ne6XiggYy+PWEjj5qAHMo8nM6lDJ
X-Gm-Gg: AZFdTZc5YbpSoefs87k4HnM7abJyh8Hm+l3qDAPLzDMDT9zuLa7LDCyXGmuHZiL4yaN
	n1J4gWyPCU26q6jg9XM2QFplcKijySyg99CmNPP3UFNIKeBSV6Lzo4p582GcJ6rCc6cuuT2C6E2
	XwssrFO1XaCwqXOgJrB7EuMy140W008osY1W6wISMDn6Q2fHygq8b2NiJpFxfHRotY3yPxM7NQM
	R+iDIn8NYla9ZltmHze2AV8r7RM1JgjHvDFkkZYjxCjn8xatXXple27WQVKr5ATw4V+3Hg5wfWX
	qJ3X6jHnUyFntt8JvLJxretSgYydTPYU3vJp/csO2VNDvpL2uLJYkGO5LxpP+pdCGlbAXmvEGHp
	trQ51CYwCojuTyneV+Qyr0Z1Qyxg2uxrIsBwA3HWOj0zFckzC0ds/pFZBA/RUC7fx6em8I2Uv6D
	o68nsvdqVlNlc9TMQFA+PWNIYUKrBToSF4yaZkw420AioqyjI5EjmaZLLO8Cx0GPvPpX3d1Kvf5
	RCxuOEg16h3XjxddJp+u962BCcl61G769YwEtsEqIUt+HY3FSU5EfPteVwTSee166qr9SESEGCm
	1tVgi0P0PUCI73I6c1OzMdUXvgAg/Q==
X-Received: by 2002:a17:90b:4490:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b41c7b606cmr9764335a91.7.1795413033347;
        Sun, 22 Nov 2026 21:50:33 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm46486325ad.50.2026.11.22.21.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:33 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 1/3] mtd: rawnand: fsmc: declare NAND_USES_DMA
Date: Mon, 23 Nov 2026 13:50:18 +0800
Message-Id: <20261123055020.1995251-2-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123055020.1995251-1-ping.li@horizon.auto>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_215034_482795_F1A51717 
X-CRM114-Status: GOOD (  12.95  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ping Li <leeonion.muyu@gmail.com>

fsmc_exec_op() passes the data buffers provided by the NAND core
straight to dma_map_single() when the controller runs in DMA mode,
but the driver never declares NAND_USES_DMA.  Because of this,
nand_base cannot know the controller DMAs these buffers and never
bounces non-linear-map ones (see the use_bounce_buf logic in
nand_do_read_ops()/nand_do_write_ops()).

Since the mtdchar MEMREAD/MEMWRITE ioctls allocate their buffers
with kvmalloc(), a heavily fragmented system can already feed a
vmalloc'd buffer into fsmc's DMA engine, which is not a valid
dma_map_single() input.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, as the other DMA-capable
controllers (arasan, denali, meson, mtk, nuvoton...) already do.

Fixes: 83208e106a8e8 ("mtdchar: use kvmalloc() for potentially large allocations")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index eee00c6f43e0..2c3da9242a14 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -871,7 +871,7 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 	u32 val;
 	int ret;
 
-	nand->options = 0;
+	nand->options = NAND_USES_DMA;
 
 	if (!of_property_read_u32(np, "bank-width", &val)) {
 		if (val == 2) {

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
