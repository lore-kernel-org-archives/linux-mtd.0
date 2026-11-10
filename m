Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF709606A339
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yMqf7TWl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iT0b5OFU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HprWCN3K94Wbtxz5mI4NBmRtY+oOQ1fK9OpAwbEYgqU=; b=yMqf7TWlWXY7MV7+LzLLGcP+mI
	9KPpLDSnTPvWsXdbDTDsEErrAI+yERjCdscEFhH3EBDLLM9SVIwPGnrP3Rw9JOIuEQVKb3D58SPz+
	1BEAfByGnlWQS4ihZ6P8VACJhEa0JvS7KJLzX9KvHiyOD6yl4u8ZEP+iSxER3MRLMha4fSaD+onHn
	fqBbqgnmJZXC1LptR5FRqsfKiZ2m+JJeGL+0rd0hTjLeCahaanpVcEvslV20KZ0rvVuegKzc5irEi
	UdYpR+jAg3pCbmhsS8l7FDh3TbUfeYn2vNcv+bI/WcOFhtq1XU2YHPzNf4/8rrBA+pCUXDzXou54p
	UOMmZ+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZ5-00000002zbK-31Ly;
	Tue, 10 Nov 2026 07:46:47 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXm-00000002xlR-2RIb
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:49 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4adba7b3399so697904fac.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296725; x=1794901525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
        b=iT0b5OFUYSkR5Rg/My7u7kr5/0nA1kkYSvbHg7W7rZRCXSYgXVIfoQrNMuPIpD5hDa
         +E9TxWOhJrY9Za6vKGt7msvC6eL9pF+Ov6q//sK4E2/vWUH+aQ+FeGP+Tlt9gDvimBoq
         JHLMsvHelXhV3f4S9Q3rmyykRAJzyxbPHEIWDUFv+rjChGod5xtmlTN+iXG+QtLzP4Np
         +3uhCecsahLPhDkq7dL6YU0p4qcEsTVsmGSR8KA1HVQ7xDdWsx9dKd/eu5SQUdQKXqO6
         BBiypWYjGnpvrByuD/MiiIgSGvnKzG8O0bwxpq4cMHQyIVlPFDSSh07F7OUh7ZROoRR0
         M1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296725; x=1794901525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
        b=IWD48cIAE84Qb6sIlHQvAFu05q9uDz9/hvM/q9ml12vsJBx64AgmvldRXSfGrqvW3q
         JUzGGjxxH0KDOxSKZ5pJhW+xKCEWkZyx+t5qML82UC24n1Z+Hist5DV19hEzdopfCNzF
         kHD1dPyQN21I3mLNmJJV+AJGi3L3s1YDcR4JgKmIXXp3SgyeomsM820suiItXhsf//NJ
         JZJ3BEKfCc0o+JNDotO7NH/5ciQ9nbKyLStPNtsNTv/GhRAGzagywIyJ+mPQILyREbBc
         O3hdOjzis9bTNXVxcfpSsLtZnqLIqX/XRZdhuI0fijJnDWWv2Z1O+KavGqhWsKRDUhUR
         hLpQ==
X-Gm-Message-State: APuU4Z87wgJZqT4I4etJ9M6zqNbKl34ZPoCliQkKQSgGHRRyy9c/4giP
	S0xdUxdV7CfKH8abRYEKXh5C3R/D4rTAPxrrESvx+oNS3X8N46CfylcC5VMfMiir
X-Gm-Gg: AYBFou1jByqQMZrG+veMT0+5v2NWBaezjj4cqdJIeQniJOvuyIIbGF+ChXttAf0gk6n
	fhGv08gLCw19/TP5w8/uXL8Vk6etQPtEFx0r1B5XF2rg+57udppho30QLJRNmidK7QeFnIqalPa
	Glhm4OOHDlPnU7yNsgY/eP5FCnW0SQt5WecmASGKt+sxJnBqTl1FGFfxFqI8EWq5iWIYvdOX4Tj
	jNIdppVkexR5tip/vXCjyHrjXKHvvnHpu6g8Izo+c+Jjo89p/5McsxwRwTiTDKluYND6TtwbZFY
	kLjpvh82lfWrA322SXODCYb5uj33BflYltv5owQPSkJav5cvpIYbgzeGCc97oh9WbVFKucjqI4M
	tbBrey4jMqfyNZBFQFe+xSreIJdszsRUIj9dt55g21bCsMUmbrlvzTkluwKib78ELCCpD+cgdtX
	h5VC/QahaxYG4/6dg7WmFUizQPj0XvexxVd5YUbZST64/Gd9MbvkUpDwOoNPl+pqHkl5+iP6DKY
	GsL4gxgPQqtJouUvwu6R1MzsMajJO233ke2JnqlHtcQyR/SFiFz0gYb2Cfv8/I3RnB6nCJPUX9h
	1qcv3fnEZWmeBMbXC+yzyYWDgQE8EQj0O7sjJXCuZNoxnKYzHUa7m4e25vU441iZ6s1qYvljYnR
	jGQMCS/gVrq9ZFMWV0CU1Gjq5P3uQVdE8QMVadLDGvDUI9SqCaZ/R32Lf37efGTbaLpPo3oCGrz
	aLZ6I+Cm9nYLDjPBXGHYMDkYdp7k4oE1e1eTEMPjIa096UeFscVliRPV0mdKEckyph28pDFIOe
X-Received: by 2002:a05:6808:1527:b0:4f3:e98f:fa19 with SMTP id 5614622812f47-5683cb83119mr1326842b6e.61.1794296725316;
        Mon, 09 Nov 2026 23:45:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:45:01 -0700
Subject: [PATCH v2 58/58] mtd: rawnand: diskonchip: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-58-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234528_078757_E301FD21 
X-CRM114-Status: GOOD (  14.50  )
X-Spam-Score: -1.8 (-)
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

MTD device references may outlive unregistration during module removal.
Disconnect before unmapping the device and freeing the hardware ECC
codec, while retaining chip metadata until the final MTD reference is
released. Install lifetime ownership before the late initializer
publishes partitions.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 540b6baf8bb1..a4338b51b49d 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1296,6 +1296,11 @@ static const struct nand_controller_ops doc2001plus_ops = {
 	.attach_chip = doc200x_attach_chip,
 };
 
+static void doc_chip_release(struct nand_chip *chip)
+{
+	kfree(chip);
+}
+
 static int __init doc_probe(unsigned long physadr)
 {
 	struct nand_chip *nand = NULL;
@@ -1494,13 +1499,21 @@ static int __init doc_probe(unsigned long physadr)
 	ret = nand_scan(nand, numchips);
 	if (ret)
 		goto fail;
-
-	ret = doc->late_init(mtd);
+	ret = nand_set_release(nand, doc_chip_release);
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
@@ -1535,11 +1548,11 @@ static void release_nanddoc(void)
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
