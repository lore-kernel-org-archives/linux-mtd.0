Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018AF606E568
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XvoaNoL+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dApuPGKc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TqWQdrVJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bGIOhWKifi5k+JowlSeEQ0JmG1+F+TBji4XN147rI8s=; b=XvoaNoL+b9/wurT4HfgAjj3ozJ
	fDhLhlkHD2T7LcJz3CAGo7vQTSGPbB+eBB4iNOtHrFP62qBTqaf/UlW8ueWRjYq02sNJu5dOWMDaW
	/OSjPJ8yKxC5+llvUwlt8YamMoqTb1NNIEz7IkA0wJMNa+8Ss8Jc/siv1Kqr35dof9cAgVTBCx3fa
	pcNZG1yaQGE7+v/w8rA31Tg6ZY33dzwx7+2sE+cxkeoW776mfhqi6HGTkhmEwScOmaU/oQkA1kK/I
	ELxeaa7qYx6hdBaCblti3crzfLVnrvRNxOk0M6cHn5NWbhybYOALl5CIL+clt3ihHYbKxpA7YFND1
	iQvhVAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvz5-0000000DwIu-1bi2;
	Fri, 13 Nov 2026 18:26:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvz2-0000000DwEM-3AL5
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=; b=dApuPGKcSOqRMhL3JgMSMJzn0X
	mteh3ZRZNFHkHf9iJo907s3HP0JHXoYBcbK5dqClI9IQL5jQslTTENgyCBMNoL9y7VcmkRMlRresp
	jfN8j9zTTN4Uvf3Aw4u5eGmdt2yYM4BqiWaHzyNUmHANkg+XLo45NV7QYFg5qq+2tDGqY0WQJFK+4
	mLwRRqW1QweoR9rIDy4pNLb5Uznl1qsKwP/xP3xz3tjAr1mEN0PgsDL+HurUBseKcM17caEY4LtRw
	sFfAy7I5FPkS3rTlqvzdWl5n9XE1HhRNzs8WdM3ImIKF/VvH6ryw4ZTLyPYYvYVGffqyLuD9QMFoO
	dLwJ7raA==;
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvz0-0000000BeT0-094L
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:43 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-4adf4431ca0so333781fac.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594400; x=1795199200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=TqWQdrVJ4AyIAtBT7qKUYvGQ3a470xLa2o67lkYonudBEFoubY9AFnRZ6zJ52JYZQQ
         Tw/0LkA9THHE8vmahgcrbSuusLd1WYYSWawTPGRN0HgT3dN8dklTbvZGWxRKl7F32JaV
         lxO+W76Bcg2LhmKjZwIRZkKh+LjHLdPdshJLO5fBYj0003w/9wOuAnxLnL7dhwOdgMas
         O+uZU5/MDdWAEAdbEsOCjYjtuPB8mEDAHx+DykHtAveLnCX0ZUSixWERbdxB+vyIFQX1
         l1fqRykD1KNvXbBFX6W9m+pGbOrSnsLEzVPXaei0AUmvHBB4PDQJcSo2kq/D4eUwdJxj
         0emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594400; x=1795199200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=i9j15aKylLz9xhkFBXoAqwKmDDPgV0tJDGXPFY7PLYHEAfnUc6iorircmSqKuGM1Db
         zKNNFIjdV2+MLnCfpf+gpW+3MFDXx3lXpT+ZutwdSV0+dE6945c+qXDUCpO1TfJc6oVQ
         43Jj1M7sRrAlynjuVSGzEByuNIyoVC/tt0Wyf4iPn+5Sdrqty3JzEqgyNPqASvV7T9BK
         EYB8dJyPp+OdKuhQX1nXgxNzOL2lFaAg1ZIkKKZcTySHbl5RJa3+Xfh8Da6fJWX5H+Rm
         61BhPsjc5+YiDKkZyDPWLPw+Ken0WyOg2ERILd5sRsHw+q48A9ZcNFDMu/zE4A7GMycu
         dQsg==
X-Gm-Message-State: APuU4Z8XbKTMXSPubcfLsFMMkk8GVK+D1GCL8nT9isciVvUu1vrGWX9K
	MgloxfXrIUMOmtfE/h6LjQs65NaJlrIg5Op1njzQNuPjcbXlMKbs/DaC
X-Gm-Gg: AYBFou0wQfVaGaQt0T15Ymqf8oR7tucVuhybPGMUdcqH78/93O9Ykra/htOfnsNqfzl
	pEkPTdYv+H5sZsPt4UooJx3yS3KjGsSjiRMRChpdir80fDLaLfa05nRSFnuyNm3xvnI/gAQ49RC
	TzuE5sojw09TCAvroYsIQXPKN+UhcUUzNgB7ScvgNwiEBEnl/lnvKmBciBZGEy7PCAyxbF3Q32u
	8/EUQBR3poGSYZAT5kQ1RGEMlvd1DCdvTiolAOwWKBtE09WrSEIv2kZV6opZI3IbsmQMKdWBbGX
	mAh0CiTEUQpCVR0z6I7kZi5bWfv7nqS957+Vlmx2R+RH0tzjQtWSjDoNiE+9BIzcUTXS6rECrmA
	F2wwVLFRg3wdqwZwxO/pa/26ScKXpdqZDBR+T6jlaloNCuBaJdxc9X0AJmsZy54Ufx7Jw/aY1+v
	lX48WB6TdSyeu15Wi71vnU/4QcGG8PRuK9s4WBqw9ZzRy1XR4PO34FfiP755VF8ZtQBxH3nEnGo
	NWj3U5NhM9xn6ayqVNb46ZARraYxfJFoOti4u2c9VyOICkdgVNgKa1ZUuxzTKPSg3jdqSgQlT3a
	OocE3yKKtL37/jiFDwaxtQ/2TnbRsaeZQgjP8BDPDk8CMO8jYveirJyq0Jk/gSMHmt2IQ3ll4EZ
	bakmMI+NyIyQyR7u3U2jrj4JbuDxX44lZ0yT9aSLVKnH90lYqblcHFHePP9QqIjPSvmiXmJbuCK
	y/YiA7FLpqjvFyEadI6MiETquEaBRR06XTlYZeO+wQuGX+hy3KwBg=
X-Received: by 2002:a05:6871:c91a:b0:483:b752:633f with SMTP id 586e51a60fabf-4afdf450f19mr3178899fac.36.1794594399654;
        Fri, 13 Nov 2026 10:26:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:14 -0700
Subject: [PATCH v4 58/58] mtd: rawnand: diskonchip: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-58-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_182642_041669_1EA29414 
X-CRM114-Status: GOOD (  14.37  )
X-Spam-Score: 0.1 (/)
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
