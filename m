Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2945606A327
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eTp3EW2B;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8ePhDk/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k/JvdDs5jvB4udnzeTBY+vfhXVYpU+8zBF/irW9AJq4=; b=eTp3EW2BY3hwUXlsqNvHgqFyxN
	mH6tuuyPX6D0a/YcT4ZKU88RGBZlyaNHGXoU6DI/nUorMAxmbtpPACz/u0tJ/PkqVIY3Bp9p4s+9D
	vMCAxenwANf2Pp5Stth7cJYhlCRLET3iaWQANCQZmrG+/Q0ZrlAt8ZziDODAaXPd3MtBFRDNMjlaQ
	Os9bWNsYgY7t4Xs2Jf8d9OioKI3vnSiE2z2YbbWQUNvZYH9RFntDN8q5Rj5a9AwHNDno0Mo4nbGND
	So2v0GlNCEScNNlQm5gJdnJtTEI2KOrGLZo+j7neVVBCxRxpESV4L7RUS4TgiAxkE4CwxjKQSLBpB
	184ybE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC11-00000009o4z-1XA9;
	Wed, 25 Nov 2026 12:22:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC0W-00000009ntZ-3vOM
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 12:22:07 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8a06e79e152so2756718b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 04:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609312; x=1796214112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QULW9udHfGSSQHhbWJ4MuomN45Oa80WoGrv85qAreQ=;
        b=r8ePhDk/jQbY7GemxC+N5KDuYVYvEBx02HSYviktrh32T6OFZxrtWTyENyVMOwf1fA
         CeRsnTQuBXeGyqNKc6Juyo+nLvWOS5BixUnoEHtl7u2Ew2cqeIJhmuZGocJlAEbZncaM
         GNDixpZfeViuq3eb4HvbELP+2/CgD++C38bTRJ5vaQQDPDR93x3hY3cdRa1c9ilbRkkn
         8PPtjMzP3NntgUW3uTtuIk4Y3HV3TcDOuYTjZb47vz/uPusr9EWqvecGt8jR5WCRD7kK
         RVARGGDJlOTtb4g1wN/7Nv6bdJodqaPMq6GHdH7DBqKqarl+R8VntgyPUZhFA5W0RThO
         +pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609312; x=1796214112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QULW9udHfGSSQHhbWJ4MuomN45Oa80WoGrv85qAreQ=;
        b=bzepY/dveCfMjg5yK570yGoW4SrqI/mal+vR7OKeBf6WWZR713tFYDuyYErf9Nq4tj
         rxJw8PrVoBxhILMpWE8xQKqJTtpM4jIK6dbajjcNKsN5EOFQcAEnRjwUVKiJ07EzOo+O
         qrKZTkbuQykb1uTXTSrg/OzdJoEv8HAQYCYsBttfxFNEVZryoXk0s4Y6L8xzJHLP5G3s
         gLOAFcClj6c+gPlvOxY5YVvoOfTb6ohdChQHpGXaVcLD4l0jWJMExBEdfuqLUFNJ1sRp
         vfb8cXUAAuUXjwmjq4yVkK9yOmhOzy+jIu83VzAJjCfEozeJgCsKUgayvkPr81fS4ybE
         4aqw==
X-Gm-Message-State: APuU4Z+3f2Q87sQ0r5LukU6tYyDdzQzU4f7TSzdY4b4QpWV3yzFrZOvp
	S0j7vAXPw6aynAvGfdnEbsb5QL0/ZuvJMSy0t3rx3pXAXoN95bShMnjg
X-Gm-Gg: AZFdTZcFxCBzVI/476OtQ3oIjuOCa31LhojKWZ1NIjCVpiW1m4u85m7WTfMxn06n/AF
	SDVXDVQFShBjDQIxe3nOU/jX0vnBrZV7YWir3O+HBO7fkXl452JQYOEKyOnpjMMJlEekqyj21wn
	3iGSMpqJcsJDRxAdGQRUhl9I8niCVqkHGiygRk9wbeNYX3bTrGt8hZD5u3c2dqwDaKf5ENsNuLq
	f2/45pTPpxsn/W30jX+ju5c59mALd0ydT0gK1QDyxokqOEZ2wTnaT3aP+xkaHAwFhXbciBl9Kh2
	rVrf5Tecnhg2+XA+ucpNtRDjKGP5pM0b8xqMUvWfIn1WLq7hQwLgJziF45WZf6i033PjRAkrAg6
	+vr9LDzGKGYQZIlVNjTTg5Y7MtIlsQcLL4g6CnwflYLhCTl5ZR2D359qSQeptKM72FA1HtWYhST
	gOaV9dGEH8MhDl+tLWrEB5aVfLn94+Hrz8SUOXNaKzJgjo171sbJqjS3tGIggNPZz90pC7+79Wv
	68/2g/bjJ6tqzPDOKCiwIwUA4DLFkObNrgy+iSj1Tf0BPwgLC2NPEgCJNsSObxllH9MA2OspoCy
	IRVcWFqDtPJeVYqUR3jJaVvBRnYHQixprg==
X-Received: by 2002:a05:6a20:7489:b0:3f9:a6b6:e16b with SMTP id adf61e73a8af0-4014c94a618mr15927591637.21.1795609311859;
        Wed, 25 Nov 2026 04:21:51 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm8688656b3a.13.2026.11.25.04.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:21:51 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 20:21:35 +0800
Message-Id: <20261125122135.44696-4-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125122135.44696-1-leeonion.muyu@gmail.com>
References: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
 <20261125122135.44696-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042155_792251_0E25DE74 
X-CRM114-Status: GOOD (  11.45  )
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

r852_do_dma() feeds the buffers provided by the NAND core straight
to dma_map_single(), which is only valid for linear-map addresses,
but the driver never declares NAND_USES_DMA.  Because of this,
nand_base cannot know the controller DMAs these buffers and never
bounces non-linear-map ones.  Such buffers are not hypothetical:
mtdblock's write cache is vmalloc'ed and UBIFS passes vmalloc'ed
LPT buffers.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, and advertise the hardware's
512-byte alignment requirement through chip->buf_align so that
misaligned linear buffers are bounced as well, like the other
DMA-capable controllers do.  Both only apply when the controller
actually uses DMA: the PIO fallback path does not care about
buffer addresses being linear-map or 512-byte aligned.

Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..c5a3622cddf6 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -640,6 +640,11 @@ static int r852_register_nand_device(struct r852_device *dev)
 	if (dev->readonly)
 		dev->chip->options |= NAND_ROM;
 
+	if (dev->dma_usable) {
+		dev->chip->options |= NAND_USES_DMA;
+		dev->chip->buf_align = R852_DMA_LEN;
+	}
+
 	r852_engine_enable(dev);
 
 	if (sm_register_device(mtd, dev->sm))
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
