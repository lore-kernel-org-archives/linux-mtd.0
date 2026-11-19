Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA45606A324
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WLpTvbmi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ojwcPY7h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qwQzZG9/WQO/P5vBaqTMrdQbCTmpTJrJqAWrWmQWGKQ=; b=WLpTvbmicWOvEXzLeSs817OSv8
	ORZUMlEtaz2q0+Yd20XiF+x6drqGLjOc/RtIx9Jejwf7wv7LvdWURpz8QJwJWraqXwVfvcZfpuop5
	HhN2oc0uX+0GDsJ/hIzA+WVvme38ev46Yrks9Jk+UIlCb8EFbA4cF/1uNaI8zVKGw+IlREbgO0gbp
	3sHEWN88qguEPDmt4TtdQ7qx3ThI1c4AsLWxT1hYMYbKtM+wjViNB04/z6Vz2fZ8AvceOC7AlaO15
	H6sA3Uy1NZyc8LmfdSxoli3H5KJMnayGkN8B9p5jZYlSxw0QkwjfZB6MhCGAlflj+aH20XtcK4DDr
	xUybL6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx1l-0000000B7dT-3IP7;
	Thu, 19 Nov 2026 07:57:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx1i-0000000B7d3-3S4b
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 07:57:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-491971ac844so1881350f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 23:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795075068; x=1795679868; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=54XwvnTRZEcAZvG4/CsgVJ6fnI4Exs8l1O0OeDpAayY=;
        b=ojwcPY7hVa8sUWma1+PSvAmRqcf5ZXs40kgTxQr53AnjbN+U0z1ITWC3uYfHYs4jPU
         muYFE3kZ201wQI4vZiRiQBKAk0MHtEyndXLbi1Ons9SJtKieKdvWJN5Ru6jd37nrnsyV
         41XiCumz3I93/IkG+5ixFItBwBURkH8KGSv245xpYhzbn3nDbJ0mrQ8mtaLAQynsPWcb
         eTVfZ2JgNSLc5WM/+nM9mVN1UiiDgAVeEnq6uAJ1bXhw3jJtmY42lvF4mHcbCzBc2JvK
         b9Bv/PxlGEoZoQKlRyydgAnFs3iWMjcDc5iOep0j++CDnagDTzpOUFPzeyD3XXiF4fee
         jSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075068; x=1795679868;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=54XwvnTRZEcAZvG4/CsgVJ6fnI4Exs8l1O0OeDpAayY=;
        b=LA/nyz2A0AOU7Cv4znoFDFR/i9RjT83EqqOTEiOk/TmeyPTOJlU5xCmdLwuHyn9bGS
         3mz8+mdCZS+7mIs+Y35O2oHZrvsht0Vo+ICZbSkPhw5xfrtzc1qbYRmuOQtWhG6WKNEo
         1nejSPkO0Vc5ZqntHZHT1RxoIV+k+nfGgTF0oWtcY4hFEuS+Y4ltlWqrNaUQC0IzXnwU
         FrFv6z3Wsmo6ilVttphHk7Me4/PdCuKv7OKM+4zXQOT/2dc0koxu8ltKTwsTkHdN57Yb
         MghMS8C/WLRbS1rSrKMpAO5zIJsL+IjIi20v8TNkQw1AJcXnewvhgySLHovjKupoHXrO
         eCPA==
X-Gm-Message-State: APuU4Z+Fao66Zupb0PggS0T5yrT1t3WBSzuPI0cjPYOXtGbu3bXLSbjq
	ytGA8gvsM5EBjUnybZA6QwMwPmrn8A0OB1//jWlLYiYWmGceup9/JiEl
X-Gm-Gg: AZFdTZdBSbYFJ7Mg02du9fVHcEF4f9efqxkXAYKGpJNlzJuZlGOJuU+ae2jEB5SYCzg
	vQeE6L+2bz3SdWl0lrIOdj7Ad2ezeez9kPpOouO/pi/2r02u5fThWn1E/tDjJQs2f19rhjqzxkw
	UfiM7KvxQFvpEUE0v9bPBt9RdNZjafQPqhj0WGGn73dZxjjfr0BnL8D0cNcLYuq4A9QynkV4zYP
	OX7sZPn6+Y4F97nkuReOOgbq96ueSYExAtf0VU7KLsI8qrktIL4IqzEmE8EBEZygB1k5unuzfVa
	RoZEej68xAZYelYD0hetoHtmHUi6Y8KCLAsA+M6o1kUvyS2pBYG6A1kyWr7PBuc43B2CtaxTLWc
	DqSDz7fe365nrE79Ly/pWeYAnQFrzbWoRs5JwdsfkkyLAbA79/JkCc0ZL+N/Q3dUKF6S0iAaQJ0
	7+cY5yXAqIA0ijzgdBKg2uocA1fERCd/bzouPaBlx2M4JRMFoY1U0/uAckdLt+2t3zqQHTNpEcE
	gZsIvBN2OzIZ0XNwxypQpCcCJj+i7or7HgrrTmDSJM8Sj2Jn58HctZQCf5IQXlSaCyJy5dhM1+G
	Ud60XMHwoI/CdnCtiDYfl2rw9I5DvFEVQPdoubFdgwbQHpK1Q7s9jTIPkg==
X-Received: by 2002:a05:6000:4555:b0:4a4:7328:21f1 with SMTP id ffacd0b85a97d-4a63ac6be9fmr7344622f8f.24.1795075068411;
        Wed, 18 Nov 2026 23:57:48 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a654a8c411sm9450116f8f.16.2026.11.18.23.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:57:47 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 19 Nov 2026 08:57:42 +0100
Subject: [PATCH v2] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-spinand-set-req-type-in-bbm-functions-v2-1-4dc4f995dfad@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNTQ6CMBBGr0Jm7RjKr3HlPQwLWqYwiRToVCIh3
 N3KDVy+L1/e20HIMwnckx08rSw8uQjZJQEztK4n5C4yZGlWKaVqlJld6zoUCuhpwbDN8eNQ6xH
 t25kQBYJ5UdclVUYVlEJ0zZ4sf87Os4k8sITJb2d2Vb/138KqUKEtqq7Uub4Zmz/6seXX1UwjN
 MdxfAGt2xLY2gAAAA==
X-Change-ID: 20261117-spinand-set-req-type-in-bbm-functions-34775e6c14e0
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235750_883519_C40E25A7 
X-CRM114-Status: GOOD (  16.27  )
X-Spam-Score: -1.9 (-)
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

Commit 701981cab016 ("mtd: nand: Add a NAND page I/O request type")
added a 'type' member to the 'nand_page_io_req' structure and updated
the request iterators to utilize that, but the spinand_{is,mark}bad()
functions were not updated by the commit. However in both of these
functions the new member is implicitly inititalized to zero which
corresponds to NAND_PAGE_READ. This is correct for the spinand_isbad()
function since that uses a read request to get the bad block marker
bytes, but the spinand_markbad() function does a write request so it
should set the request type to NAND_PAGE_WRITE.

Change the spinand_markbad() function to set the request type to the
correct NAND_PAGE_WRITE value. For consistency, also update the
spinand_isbad() function to set the request type to NAND_PAGE_READ
explicitly.

Cc: stable@vger.kernel.org
Fixes: 701981cab016 ("mtd: nand: Add a NAND page I/O request type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/log/192383 # See "**Investigating `req->type` in NAND Write Operations**"
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add stable tag
---
 drivers/mtd/nand/spi/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 18bba02fbd31..35bcb4a8861b 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1105,6 +1105,7 @@ static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	u8 marker[2] = { };
 	struct nand_page_io_req req = {
+		.type = NAND_PAGE_READ,
 		.pos = *pos,
 		.ooblen = sizeof(marker),
 		.ooboffs = 0,
@@ -1148,6 +1149,7 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	u8 marker[2] = { };
 	struct nand_page_io_req req = {
+		.type = NAND_PAGE_WRITE,
 		.pos = *pos,
 		.ooboffs = 0,
 		.ooblen = sizeof(marker),

---
base-commit: 760d2efe91a84363d25c1051a10572242e75fe86
change-id: 20261117-spinand-set-req-type-in-bbm-functions-34775e6c14e0

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
