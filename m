Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC45606A336
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A9tHOCNj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osGv7Es3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bGIOhWKifi5k+JowlSeEQ0JmG1+F+TBji4XN147rI8s=; b=A9tHOCNj50Ht2Y09t/cfSq9q31
	eTbwW0nfqcxrmeLBr9s2eBCNZ9ypMrx0aXtK56bFXwODxAyRWn/bJRgADfaj2BYuJ/PlS5CreNpxN
	WnS7f6HWWOXIVQ9YQcAMUHsoc366GscozAE7toV6UbD54UQNC7i6vYof0ErlNTfxuAH9gFNCAYgjO
	eeuwOSdVfQniAa/e/vUT49iEFOnerHqKq754OY84rXhr1rw7uCXRH6SVZNQ5Twy1zXEInAhS9yHjj
	0YMphs2rHTsZdAxfIWQyJiuJ+yvYU2tK5GmDxriOEnp1FQ5wm5fAT0hrPzD2B6Z7jHOtddmRooZWx
	EHOQ9owQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFZ-00000001Hno-16ej;
	Mon, 16 Nov 2026 06:31:33 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEx-00000001GaN-4AMC
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:31:01 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-71ac798b8bbso1416285eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810655; x=1795415455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=osGv7Es3isu8Gp82z9jv7fbPQOl3jLF0H2/JVf91dmTkqCmk6nt6T0zdUkbFW/kW8t
         mvp8amd69Q8VH7PHHdcHSOCPtRTxJraV6G4TTi+EPgkgKW0RhP8Y91RNyXytJEcQeYIy
         JhPkcHqik/6w5acqTxGjqaJr+wF8wM3H6Sjh+8XUAbudGpPSnL0mEGMNBCZedGSQrCYx
         uVEp+9BPV/if3nGAT2TLxUrVyevin6mxgVw4iEuI2rTgcJgLa6M0VzA6RD54qNb5w/Hw
         pwGu+DduiMQ4ARKDC+TRC3CmHF/AxFZ2Nl4tjOpFMR6NUCYy68850pCPfwmukajPbtK5
         IgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810655; x=1795415455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=NnY40lbIWeB5Nx3w1A0PYmwZ8U/Z0XZ1HqS0dox0mMFMNG52m80OZxLgMAd7bum6R1
         deR+1wGC6soKZOzQkqSzeBRuYuIJB3G7c3c8H4i7uah/OTuZuq+sARlgxa6AmrdYgUcx
         0VaNha2bwoufpIGQNzvbIsPNQZo1zcwDrNBWWGfY++SCtHN/fjJVRbDiIYaILMycA7QD
         xEm/nlieKlU1yGqzDftYuuf7lnDdG9LKBUKlSBtMEUHv0JYPrFg3lW1jTvr01eKyHsGQ
         /dduOQPf60WCti3c/VNaioEmgGgIagA/J72a73vT3IESPlQL/SCNubET+9tVyvYNf5gK
         qJ/g==
X-Gm-Message-State: APuU4Z9CvL6yAU1IvfayY9n/9Br/nsVLfUZnEvLRONiB9LCr4wL40333
	4JwZ9LqUQ2hlhhl7Ymm9DEowHz+gpOAlyGpWUVVt2OGArztHnYVUexLf
X-Gm-Gg: AYBFou3+FQMyrBrVNxosoEIEq1IiZzuM3jQWGJDwXVD0KPDzHgdWVNSGRzylq00zyWU
	9Jw//RLvX9S0yrhafBAnUwFqOOe+2qia2PP5ZMrUdj0DKqo9F/IwLcGc0xdPpQOArSSbEZMxvG8
	KFXCyjexhSuyBLW9E5jn2+1QgK6xTleBuplVaqK6tz9k9jV7QS5mCG+CeN+LXdAWO51vHFnU8Q1
	wrIWvMc8Tr7Wfa+aIEw0cwfksrp0IqbUIF2we4/98M/PZlXaYJ7eCmlr7Hhlv/WYK/gUFR8Ucnp
	XCnCnkvdpqke+mII93/J9Q6QCEr82PQ/bOsnbHPIkCrjc9EPLpYrwldr4IG6hgWQ06HQiuTw1tF
	8bvfbZUs9TB4uRORPD9EKvf/b7Y5gPeh+pFjH4F2/eLHviPrQ43fjz4GFTfgJriXfUaZa6g0s+y
	SBtf3P3zUFY2i7DFQf3HZq/ZwDd8p96MNzqgj2g7A8qAgqScI25xM+3kE1mALKuhHLp+JZaqRLB
	kLa1BkSzsm6gr++3XAIX72/yYmGGJmKOusQHcHeFnPZxAOaGUxoWFRvGvRseQ4bFaHVlSAPFxBg
	aF1EvDh8yre4qXAo437nIGtZ7IxBHbr7FHHfy6OhBI+Jopa2SKSwWHR4WmlUAaZLt5KUuSOQ12z
	STEjwJy/prOiQEt717+p3eJCR6KDjF2vYJCXOlY+7NJTuNS4WYLlXxlFgnWiS/RtotFZASEJqp1
	ACrLeWR/IG9FPpzkzocA89HEOLPzL7hBhO/NJ6CHVHQi3MbvfMf64=
X-Received: by 2002:a05:6820:3383:20b0:703:8835:5fd5 with SMTP id 006d021491bc7-71ab4f55eb4mr3885591eaf.25.1794810655100;
        Sun, 15 Nov 2026 22:30:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:13 -0700
Subject: [PATCH v5 58/58] mtd: rawnand: diskonchip: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-58-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223057_172651_C2807863 
X-CRM114-Status: GOOD (  13.46  )
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

MTD references may outlive a partially published registration failure.
Disconnect before unmapping the device and freeing the hardware ECC
codec, while retaining chip metadata until the final MTD reference is
released. Install lifetime ownership before the late initializer
publishes partitions.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 540b6baf8bb1..2c6d0c0fdb2d 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1466,7 +1466,6 @@ static int __init doc_probe(unsigned long physadr)
 	nand->bbt_td		= (struct nand_bbt_descr *) (doc + 1);
 	nand->bbt_md		= nand->bbt_td + 1;
 
-	mtd->owner		= THIS_MODULE;
 	mtd_set_ooblayout(mtd, &doc200x_ooblayout_ops);
 
 	nand->controller	= &doc->base;
@@ -1494,13 +1493,21 @@ static int __init doc_probe(unsigned long physadr)
 	ret = nand_scan(nand, numchips);
 	if (ret)
 		goto fail;
-
-	ret = doc->late_init(mtd);
+	ret = nand_set_lifetime(nand, nand);
 	if (ret) {
 		nand_cleanup(nand);
 		goto fail;
 	}
 
+	ret = doc->late_init(mtd);
+	if (ret) {
+		nand_disconnect(nand);
+		free_rs(doc->rs_decoder);
+		iounmap(virtadr);
+		mtd_put_master(mtd);
+		goto error_ioremap;
+	}
+
 	/* Success! */
 	doclist = mtd;
 	return 0;
@@ -1535,11 +1542,11 @@ static void release_nanddoc(void)
 		nextmtd = doc->nextdoc;
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
 		iounmap(doc->virtadr);
 		release_mem_region(doc->physadr, DOC_IOREMAP_LEN);
 		free_rs(doc->rs_decoder);
-		kfree(nand);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
