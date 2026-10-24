Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59DC606A323
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Oct 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P6+sFtgQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=B2z5nwCc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tddHPVLO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=oGPHF0zARR5mJr7Rr7znrddPt7KR/L+5vkdooZk0oMI=; b=P6+sFtgQo9ZA5nB1I2RnG1KOGW
	L7H9LcVlaVWvZWZddVdiYdwtLkl2HaNNO4SYF8RUNq73J2ZMF+NrnwscI97P9ahEhSursqZPNm+YJ
	YbODEDHSBGkw1vy1FUQqewm2asEdEkR05C97W90YoaZiafJIA2mZtsxMKMvm5M7Ro7FSd8/MEUyY5
	WJ9sIpE30kvlXZHjihG7uIMdv9MaYvvZlF9Me+TsgzPSpDeFfBEebhgT2e3VjYNzEMbTM9BgedMua
	pAZWE/5VlqgArdOJCOdaCI0PCQ0+JcLt2eK575LlA/gOOmwzlURejef9U6X6zGCn6OHr/M9ZrLwZ0
	1QyNqoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKb6L-00000000BsD-1xqi;
	Sat, 24 Oct 2026 12:43:57 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKb6I-00000000BrD-2vqO
	for linux-mtd@lists.infradead.org;
	Sat, 24 Oct 2026 12:43:56 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 4FC6B13019AE
	for <linux-mtd@lists.infradead.org>; Sat, 24 Oct 2026 08:43:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 08:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1792845832; x=1792849432; bh=PJMwachCcqRYCX2Z0PCMjUBZKODxkOBb
	1Ewo6sCszuk=; b=B2z5nwCc1t+VwpnKFv+BwVvspR+YFw7bqUwBwWo8c3KxoTNX
	s8mibMmcSnhDSILmfMj4QYYQvp3G18YqpD7qPGj5vNXev6MRCujYZaeExoCWY6ik
	iIYvygkKvrkPwZNM+VrO7M4dwd+OokU3xcY82YOCfUmzMvOMTe2tqMZSlZONOcup
	D3HWuDU4dwmEVqDEo9GQYYTeWAD8iPWXaOWppHlsqMFO+MH11CA6wNQ3r+gO4QRQ
	SNhLdHZi9ZDTiFrI3GUayxVw98lSG6itl4bjl4sFQJoLURmH2hhVuj5WCTlWS7vv
	JiojujZzNzPq5L/HfbBvu9QF/q5GvewLWF/bzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792845832; x=
	1792849432; bh=PJMwachCcqRYCX2Z0PCMjUBZKODxkOBb1Ewo6sCszuk=; b=t
	ddHPVLOCfEdlhDgbefLAecc+6/Ig2KSEmGN/meiBIUzjqgy1yEx5L8xcHiMiwF00
	3y4lIHxl9vxJhWEtdsJomauKcTc6yYzWyiZpMfnOfo8KtQb8C8bFkoU/KWJs1+yp
	QK+E/er8PhsgbmTBP6Tdbzh4Fv6NCg6u9HwnJrXAOUspJ0pI3qcMFJWCPTIIrmwp
	bik4miLeA98/+uffPxkl+W/arsJqPVwWV3+Nrcz8/QeUSVCT5pdmdseu50jeCiIf
	ZjI7QIrK6I/WMYvJYqFVdqxANfcSFmUMtqtGUmEHGmuG4fyvKclqR8O6P9tvvUXE
	eHRb2hy5k3ZXVwPInJGhQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792845832; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPg==;
	s=fm1:rsa-sha256:Wk9po1Iec7pnN/2AsR9UtatB2XW+M2SwcXSTIuFLhCkZbLa
	eYMtz9Mvwktl4s7LTPSkg31/UVgPPE+vHE2745KBM+cxdtA3l00Q1y5ouqDNC+OE
	UEmrnhaTQe5EJDEYwKKCCuivH7An8zLYTqzBz5ihd8R2MA+baruNJftgno8yv6H8
	sIM4cX25csYI8sfJWdsSP8145CEH6whNXzFIVQ3f30qtkpcE/RF6rotLQDsBOtij
	pUpKxAY/dw8aUZvs/QL55oxBS8KGYn4ENqEqX2oh/8Ii+90iWP19J6ymtFWXqscw
	fG//eR/UQ2cbQKcvPBU7Wddo/sbG2ei5+hq6/XA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:HSrSjjqnhb4zF3qYbXac3wWr9W9/ieZc48VxVizXgUk=:/WwECYBYaz0RtfG4RJ17uKTJsKoSrZsHFkJyi/TPmLs=;
X-ME-Sender: <xms:CKjcavf7vfJ4fOPhXMJPcB0Za3mHPN5cUAwI5wtQq10t7-wFcKvMXA>
    <xme:CKjcagAGh2AYBe7DzUU3wUWJvvYHI6FLFYjBmjggwABoTyrZYdUu9iQgHt63_ql4_
    ol6Zg8Sq38H1W7RVwJGLAOCEwR1QUzL-Ip8t8UZ7WxwCQGW7prYxweF>
X-ME-Proxy-Cause: dmFkZTFQaEfFHmDDkMRiWeU7z8blMPF79QeSm/V8M6NPW120fk/aMqYMXuF6FpKygg1L4p
    407ISxGstzXVbmW8WHCRHwrbAIk1vhEZ9NvHBU0+1hT0t/Winvf8n2naQgXwgu8kuirct1
    5DPglaqhPRL7CcSo8w/ljCSnqoOvATzNFDRdh/bykfa0Kk7sFYltoazi/TWEG//XuvXGP9
    S3Lyc4rxl1g1EFY/0gcZuTSnPqLu+WOmsxsH89R+4SSabZyOi4xZJH3+UMaiwLIcZWzBPB
    Ybq2BXLgumBP1tLWQE2lpttLw+JP7vn5BjraRG2XEu11gSpXylsR7s6QOLSpxFSigaMJOV
    F4jvUrJd/RzGJeq0iE8cfj0oI73H5R9/FK6cJHBL2YXvtVw0bwlieylcvVXkRqhQ+5LesT
    W8HNE854voc+SFmHI3SYj/PnR4atYlSw8XlnfAdQHwCwqFLKMoMKlje8s3tRJGUTrrzOi4
    JnVwBel1YAu8XRrKgeO5xDXgwNIXOu5eNm+mbRgE+f5/NLyH4c2GAIzio8m/BwuCE+eiXe
    np8UVzBSzHdNuD5wesbp2K/HtJoqoQRTuU1x3FS8994Zu2dvKR6o3FX4GXUIa+AYBE0oX5
    ScrSEO4ATCPJYqMs9ySxQ82KeOTxjjItSlx1uNz47rfKUfPRTFuE6axEwKPA
X-ME-Proxy: <xmx:CKjcag8svclYnT23DcRHZPksx5yrdbWMAP2ThPwhPFCjXCLDheIzMQ>
    <xmx:CKjcajpbJQo-2aRHN5BegBgJKXaDYLSq9wwxhHIZ08dBfzvrLogUgA>
    <xmx:CKjcalBqXlV964imdSAFRsaPJ6KEaRiJGYdJ3gcjiCwj4rAmjpVeuw>
    <xmx:CKjcalwoRY3z0vKdKPU_krsxMahXx2tqLTtfUoJv_3VuQVtvKfYHFg>
    <xmx:CKjcaoRJGjLGxdwfKwxokEIVuqg90uHsJKI9scc1VB926oq_Lgcqwvld>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A22F6700069; Sat, 24 Oct 2026 08:43:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 08:43:52 -0400
From: "Alejandro Pacheco" <ale@alepacheco.dev>
To: "Richard Weinberger" <richard@nod.at>
Cc: "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <67870349-f17c-44ef-8647-28a78da80624@alepacheco.dev>
In-Reply-To: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
References: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
Subject: [PATCH 1/2] ubi: fastmap: Check the PEB numbers in the fastmap lists
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_054354_833156_DB51FCA3 
X-CRM114-Status: GOOD (  15.19  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alejandro Pacheco <ale@alepacheco.dev>

ubi_attach_fastmap() reads the free, used, scrub and erase lists of the
fastmap and adds every PEB number in them to the attach information as
it is on the media. ubi_wl_init() later uses these PEB numbers as
indexes into ubi->lookuptbl, which has ubi->peb_count entries, and the
PEBs of the used and scrub lists become the PEBs of the volumes' LEBs.
None of them is checked against the device, so a fastmap listing a PEB
number that is negative or not below ubi->peb_count makes ubi_wl_init()
write outside ubi->lookuptbl.

The PEB numbers of the two pools are not affected: scan_pool() reads
every pool PEB from the flash before using it, and the MTD layer refuses
an offset outside the device. A PEB number of an EBA table is only
accepted when it is found in the used list.

Check every PEB number of the four lists against ubi->peb_count, next to
the other sanity checks of the fastmap, and treat a fastmap with a bad
one as unusable, so that UBI attaches by scanning instead. Fastmaps
written by UBI are not affected: ubi_write_fastmap() only lists PEBs of
the device.

This needs a crafted fastmap (its data CRC catches random corruption)
on a device that UBI attaches at boot or that a user with
CAP_SYS_RESOURCE attaches.

An LLM coding assistant was used to find this bug and to write this
patch and its changelog.

Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
Cc: stable@vger.kernel.org
Signed-off-by: Alejandro Pacheco <ale@alepacheco.dev>
---
 drivers/mtd/ubi/fastmap.c | 40 +++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 3f9fb7c181f..41ead6b4f0a 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -558,7 +558,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	struct ubi_fm_ec *fmec;
 	struct ubi_fm_volhdr *fmvhdr;
 	struct ubi_fm_eba *fm_eba;
-	int ret, i, j, pool_size, wl_pool_size;
+	int ret, i, j, pnum, pool_size, wl_pool_size;
 	size_t fm_pos = 0, fm_size = ubi->fm_size;
 	unsigned long long max_sqnum = 0;
 	void *fm_raw = ubi->fm_buf;
@@ -640,8 +640,13 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		if (fm_pos >= fm_size)
 			goto fail_bad;
 
-		ret = add_aeb(ai, &ai->free, be32_to_cpu(fmec->pnum),
-			      be32_to_cpu(fmec->ec), 0);
+		pnum = be32_to_cpu(fmec->pnum);
+		if (pnum < 0 || pnum >= ubi->peb_count) {
+			ubi_err(ubi, "bad PEB %i in fastmap free list", pnum);
+			goto fail_bad;
+		}
+
+		ret = add_aeb(ai, &ai->free, pnum, be32_to_cpu(fmec->ec), 0);
 		if (ret)
 			goto fail;
 	}
@@ -653,8 +658,13 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		if (fm_pos >= fm_size)
 			goto fail_bad;
 
-		ret = add_aeb(ai, &used, be32_to_cpu(fmec->pnum),
-			      be32_to_cpu(fmec->ec), 0);
+		pnum = be32_to_cpu(fmec->pnum);
+		if (pnum < 0 || pnum >= ubi->peb_count) {
+			ubi_err(ubi, "bad PEB %i in fastmap used list", pnum);
+			goto fail_bad;
+		}
+
+		ret = add_aeb(ai, &used, pnum, be32_to_cpu(fmec->ec), 0);
 		if (ret)
 			goto fail;
 	}
@@ -666,8 +676,13 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		if (fm_pos >= fm_size)
 			goto fail_bad;
 
-		ret = add_aeb(ai, &used, be32_to_cpu(fmec->pnum),
-			      be32_to_cpu(fmec->ec), 1);
+		pnum = be32_to_cpu(fmec->pnum);
+		if (pnum < 0 || pnum >= ubi->peb_count) {
+			ubi_err(ubi, "bad PEB %i in fastmap scrub list", pnum);
+			goto fail_bad;
+		}
+
+		ret = add_aeb(ai, &used, pnum, be32_to_cpu(fmec->ec), 1);
 		if (ret)
 			goto fail;
 	}
@@ -679,8 +694,13 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		if (fm_pos >= fm_size)
 			goto fail_bad;
 
-		ret = add_aeb(ai, &ai->erase, be32_to_cpu(fmec->pnum),
-			      be32_to_cpu(fmec->ec), 1);
+		pnum = be32_to_cpu(fmec->pnum);
+		if (pnum < 0 || pnum >= ubi->peb_count) {
+			ubi_err(ubi, "bad PEB %i in fastmap erase list", pnum);
+			goto fail_bad;
+		}
+
+		ret = add_aeb(ai, &ai->erase, pnum, be32_to_cpu(fmec->ec), 1);
 		if (ret)
 			goto fail;
 	}
@@ -732,7 +752,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		}
 
 		for (j = 0; j < be32_to_cpu(fm_eba->reserved_pebs); j++) {
-			int pnum = be32_to_cpu(fm_eba->pnum[j]);
+			pnum = be32_to_cpu(fm_eba->pnum[j]);
 
 			if (pnum < 0)
 				continue;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
