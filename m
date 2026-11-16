Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CBE606A337
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ntfSLC66;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JNCruSTM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXYWGN/o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yKUUne9jTHsLyRc1Guy01mloIFOQXeO7MASDDae+I2Y=; b=ntfSLC66Asl4Cn3S5w8RolNZAQ
	N1cqRBG5Rn1NiRjQUrjGTNKXGxaV4f/WFh3bftykphHO9jdO0ZVhnQHAGkFDyAP/04zRe4/cudSeg
	BkynsHq8Szp0+r7ST8ehkaOBWZACAPcS54VMbJedwVw4eywljHBiIdnGD1/puyfGLd/JJphMMJxgo
	BWiWvkfkZm4QkJ1H1Eke7L529f6dfvUEhBXcfxTcSYLl+0lZ0bEsEZjjmn/uE3WGA55rm0avbg/Ot
	Ao9bMGZxI9qc0FTN5k3hcL6UbIy0DRvdzgZ+5On1LMaK5/czhhvEd3SoKzf5S9e7VlNUj50Qrz70M
	fMhAOKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFI-00000001H8W-0a6t;
	Mon, 16 Nov 2026 06:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEk-00000001G6w-3C0M
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=; b=JNCruSTMe9qySqGfBZfCZi7X+3
	HKnfJlzSHtE5bPoyLaBVOTLALnawkxS9JoRXca7fwP8cgjG0FFZ2zReBz3z8KiBEAlt9fBH1MFzeA
	AiHxHlgFShxwe6qOHzKWFY+1Ek5w1iJvpPeMvoKUT1D7mpV2LprVyhVO2EU4Ymj7/17TwfLjM2jN3
	BwpEsdB+uL6DnztFnad3snhDdN3LLJ1LQ+FmvezR7KPEe6TA/DhNGawioqaDTfJO3jji6ifm0QzvQ
	L2OWuWR+R9GFN3F6ndkAII/xuhQh9D1BVoTjuin7reCMAjI2fEbYa8+2JIYkSqG9v81/xoNyUKkLY
	v7loFGwQ==;
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEg-0000000DPJK-3jp4
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:40 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-71acdd32a53so635011eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810637; x=1795415437; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=gXYWGN/oYK8XymYYV01kH70hQWRLgJv0GiMpAL9VX7x25XVBDdmOO52aDvnrI+lSFe
         RvYGLcdTni1Hr80LKxck7mWStCr/cbS7AybExbawJahtKo8WCWlvR32zaD4t2lX4nGXK
         rgXXt1G2pqPQRdxaB00Qtya2Zo+HiDs5kxMZtPmqyKYz/Bi/M2Nq9e69CEMMPMse1BsZ
         8N7AizAv7hHvMcXnUcaKYz6Tc7x012gL97zOQHoLzE8M16RuA+l6J1i6jTh3G/y9A7V0
         MEI9rmJopkDHerqOF/w3oMGTuf9Xrj0qh+LnvsaBMGdjlUqIfgNF5qfT1Z/gbfOz2voK
         HnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810637; x=1795415437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=bY+1LLXsyzUizFkLAomF07GptaMUeSNm/UIfkZrv/ZxMT24YDgEL+1rLXN2qMT8wmJ
         M9l47r8Wxjr+WCrMuMXfh0JZ+bKBXCVQzR3A809Nwz3kQwBCC4UyCWPweF1i0g3vhy5E
         Qsz4Rp59Lc6+yunRaJKKqHE92new3KyhTor7CTxdC61/KYMvBUy2RfMcv6/qYb+S32G2
         th7N74zg+UAnbJV1BdUHiNtWoFkmrwtCj6MFwBsVOFdmL8Oqm9c62VTvQjFkf28x7MkQ
         D+dhW0Se1/j8spqyTUFR1nT4uMQvKO1J2wIfQIMoSig7SUnyqlDmIM8h3hy5h964eEgM
         XLaQ==
X-Gm-Message-State: APuU4Z9ojsjKViK6pbYLltnlxwYM3GEFOQi9Tv02GS8+uXHaUhSVRJk9
	D9tKdvMPvQAr/zEd6DW9yWHWgFZLycMQF3ezciUN5HwPgRdE2kUwBGzd
X-Gm-Gg: AYBFou0l156KVs3rifjTkkcniitSC8v+0aF8YCscHFMrzgoQ70OFR1jDY80Hj424UjR
	s+xsxh2vHzSZgZt3jhSJ5pqtV2Q/+LsghibFa7wakn4YJeHIdyiWqYKwnWnRF1UWmj7p9t0om0i
	2PO1uzL/vdbQ/K3GpDgBqWLNTVkELEDDp+NGpxqB7vAqAo2EWT89f04Uh/PoUtJMD7C9u8F5um9
	s2benG2/R14WfvKiNqK6QZUpnq13L6KPKUCHCKLFbG4VQ4Ox+6yLf12JVMThnwwvvyjLZgujHpP
	dWqMO3QkjfOpWN3rEnBrD5VUMxI3IeYNf3UpomcFC3mjQhZxOXXzVIpcE2N5Ml3IkrdBetBvo7m
	ttos2N/r+0bTYhpNhTjw8PZqguiwEOR67LpNsjKE1/6+bnUh0UxJ4Fgw/kBK2JJ7AOQmKwOeI7l
	U0n0XSQIR8MenHyBLnskH5TzRxhoV11GRNqzDb2Rc/FoMDfi/u3DGPDAmY3kz39Nu52jswdbPWA
	qhXhCHNEiTGtiM3OShLh+WGnz5fQyZHcRoj1x0zgMxQ9iKKhp6SBbI0avZ4OgZA5aJZrtibFFTb
	wWmQhvxFBsLtvYMvFRdZAPqg1u3soR72Fu15BMxQT90OCH4AxrMKbUsAl4NkvMUpIesLrX5gZmg
	3cdwV0YsfiRr7J3cuDO2URG/oIElru0l6eE6nQr6p0oliRUWwzYvSrUdXnZk8gyI0nvFOuzZVXC
	WxuCekYiXjRpORsFI+KowjwHjC6uXSk0JA/us/OSDh5idELtax0Go=
X-Received: by 2002:a05:6820:7082:10b0:71a:e6e4:5554 with SMTP id 006d021491bc7-71ae6e45dbemr1816031eaf.12.1794810637010;
        Sun, 15 Nov 2026 22:30:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:57 -0700
Subject: [PATCH v5 42/58] mtd: rawnand: au1550nd: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-42-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063039_401769_0F2EF771 
X-CRM114-Status: GOOD (  14.87  )
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

Drain NAND access before unmapping the chip-select window, and retain
the chip and controller until the final MTD reference is released. Check
MTD registration errors so unsuccessful publication releases the same
ownership.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 01c2c8b191eb..83db1963c449 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -269,6 +269,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &ctx->controller, ctx);
+	if (ret)
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -302,7 +305,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 	ctx->cs = cs;
 
-	nand_controller_init(&ctx->controller);
 	ctx->controller.ops = &au1550nd_ops;
 	this->controller = &ctx->controller;
 
@@ -322,7 +324,17 @@ static int au1550nd_probe(struct platform_device *pdev)
 		goto out3;
 	}
 
-	mtd_device_register(mtd, pd->parts, pd->num_parts);
+	ret = nand_set_lifetime(this, NULL);
+	if (ret) {
+		nand_cleanup(this);
+		goto out3;
+	}
+	ret = mtd_device_register(mtd, pd->parts, pd->num_parts);
+	if (ret) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto out3;
+	}
 
 	platform_set_drvdata(pdev, ctx);
 
@@ -333,7 +345,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 out2:
 	release_mem_region(r->start, resource_size(r));
 out1:
-	kfree(ctx);
 	return ret;
 }
 
@@ -346,10 +357,10 @@ static void au1550nd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	iounmap(ctx->base);
 	release_mem_region(r->start, 0x1000);
-	kfree(ctx);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver au1550nd_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
