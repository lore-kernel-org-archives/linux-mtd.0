Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0086606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BlI4rRu5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pWSmR4VT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iRhxftDh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K1x2mNj5Nak4KcczeFfDMuav8dv1CH0fr7dU4qQ3i3w=; b=BlI4rRu5VTWuPiIfmG0aQt3p9J
	Ggb+fEvRLtMG/zZPSc/BTqZtRB5ilKFxwkAy8wrQROpLJHKlOaVCIMX5nyH7C9F4g2LjRCtrDXw6e
	a6NxEBu5Wl6b36VQ2idRAb7tnZGnN7x5wJ7J0dUKhQ3DmB/D8phikBpvJaqTqEzzKuxmxUWu2TC9Z
	g0tYXoZ18Sd9ctXxMSAJ1mc0F80s67f+lOIvZdddXVsH/VlBP6rKwn/2SqLfUMDQI4t75uXRNBQfg
	5zB28ubWkrdftP91EZTGcs7ON6d6JGdQG3dXwAILQcgGiQcO/7Io/6OTxveYhM+O9Ny4noUt7RsLx
	AHJ5XlhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFX-00000001Hj9-228H;
	Mon, 16 Nov 2026 06:31:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEw-00000001GUn-373b
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=; b=pWSmR4VTmVXq4+aZaLkrhWVqSE
	cB6PT3ANsr50p1sr/dBXQ+sS8PAfK7WahMa0DuXpR1p3bJDbmj/emmYgyNq58Th0aTDLRrxz/LOs+
	YONLfceDLmNWxZvFcKmDYDy4Ls8LnVlxUBnwDCQyFaAnkNyKh+cOLmlckEgMcbYJ0lQUyVV5Bfujt
	wJdFaUzdejYSYtCXaTAXs2/SsnczvX8EwqX73oEOklII09pN897AC3tSfGoaXVyP/ff1p3YM4gpfw
	yKhSk2pXWQ48nh7zG3eMKnDicVXKYEGASge1eTh7qdcR24buqK4mf1agTdrOvOgdv+EV/WdFgk4mu
	kp21HLsw==;
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEq-0000000DPLE-3Ihy
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:52 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6aa9606ddadso2737969eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810645; x=1795415445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=iRhxftDhUxbHZtG3glod3DnFb70KMz43dd9jodVr5e1wCGrj76QPSmlX2gQpLoHX1O
         PG8WxrWZrdcw6ubwhNg+FoNqRjTn964vkg6bO5kH8lPkKfUqKwmV4iZMXLuDX94JtD7+
         GooCbbYNIUhGM3NJgc3draZ5i+y8Us3JXzsp051KiPyJp9tTbP09L3m4d0XNlQMwagWz
         CRZyoTqYbwNeQKBVicMFCS2yuZI8qCWVg+lEboHtxtNI7phIlbRY0tOAGxyGgc/ERYQY
         LZo7qmwIYcM4QA6fo8go0SLjBz74SLMiLS1Ct6UEzSAX9tqbT+IeBdf0XK4qMLYZJ4Sr
         37xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810645; x=1795415445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=Dc1bvhVXt7nRTyTtMPLMn3JsBive2gQKjHkdF+6cls90lzYsjYAjWPsZZwje/UJcps
         T1oEXaAVZhBbKuje0qEvlFk8fiL4OvK2d+oNBGpEChIRNtm8iF//UquFl6pIs+Z0c0uL
         Wp4lrbojf3FS9b0vURAUIeHgWfo6eVNKZOVLJTQQAwPFVZJ6MUTBi9ZcIg6uHMhmXnUl
         hpFUeI6Dcz04df+EmN2lkYcb16wtg8gFLw2wm/NoIEk1+sllwAGPCyF1qjYJ61NUaTeg
         2AxKVWiSfTi/KEBD3a9Xrq+tggGfGwN53fec2I0EiqRjps1bKBHQkaj7Z3cBWcn42qWp
         qu7w==
X-Gm-Message-State: APuU4Z/2+tXLmfcGSVPzWVpdvoUcNrZq7ePZyw+T2/E9fitBQSqik8Pp
	dhvgz3Hxzr3ar24PZCql7Nl7oHSH/iCKmxmnikZ0vFXZ/Fb/UbvAqwtq
X-Gm-Gg: AYBFou2bCubkPerNOTek2kBWPP4XOjzMjahqNO68ox4Z+5t1kAnEMxqGdG8sE4OnzHy
	atLMrNdNnOH94CcjtR1jmFV7M4NMZv5w7eT87xvD4uF4iSPjoLGLSZwr4//4bqmDI+HKOyZabOe
	OQj04R8AUKJjZzSj/un+uSSyAWSiBYXkXYqObFnpzlkw2aoO9l0Ne76eZXYqkl6uTFtPKy+I+S2
	HMrV0aBMKiBS7PhAI2elw1Cvn7T9cvTIO9V1M6JgTauTzRzqkWjNapc2b8rnjHUH6M4ywrTnV/p
	IcPNwhxiFkDbMabiP2qODIlbHJ+/2GVD9oGJ9DMqwJPLZqYfNDKyfpLM02y8DErszDxvMftojK5
	Z4exjeGxNZ4lDaFtFifIchCOGE02gUEBKeZFcaK7zaT9iSvh2eQ3qdl5vu+qQqZlL2oTygGSgF9
	uiesnKBRMFxNsyhQjMfAX/nsChmdm7ZqajZvgOKYv5r+LBtiETK+jtbsu1wth6zPSANEkqjIO+J
	X8SZyOYlsXdCdugHxTFDhmVeTno/p4ouN/z6yDY87qhsmptdiX4n3qeKTQhRjvInZM4ej8bIPyE
	QlaYu3zRouhWf3nkSXwD/HtLkCzrigu3aYfEg7gxcaSeZuAr9ryzyNYzyERJr7SNm8L1/XplWcj
	P+uP4gvLyYsxDykb6q2EFpp1VPh8pc40AXzDIlOxwI+KGoStcHDcB2QsUF2elf9ceb03U5FQiI1
	NJk684uaIEKek/faafCFP7zgWHHhRL3AbkMyonqK1DPjiRMF79h0s=
X-Received: by 2002:a05:6820:718c:b0:6f9:59ee:cfb7 with SMTP id 006d021491bc7-71ab4f91762mr6030827eaf.23.1794810644630;
        Sun, 15 Nov 2026 22:30:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:04 -0700
Subject: [PATCH v5 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-49-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063049_270927_1CB17E2A 
X-CRM114-Status: GOOD (  16.60  )
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

Retain each chip and its shared controller while MTD references remain.
Unregister and disconnect before dropping driver ownership, and check
MTD registration failure without publishing partially initialized chip
slots.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 6fd6e530c38b..bd0cc30ab820 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,28 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
 	.attach_chip = txx9ndfmc_attach_chip,
 };
 
+static void txx9ndfmc_chip_release(struct nand_chip *chip)
+{
+	struct txx9ndfmc_priv *priv = nand_get_controller_data(chip);
+
+	kfree(priv->mtdname);
+	kfree(priv);
+}
+
 static int txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
-	int i;
+	int i, ret;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
 
-	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = kzalloc_obj(*drvdata);
 	if (!drvdata)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, drvdata);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +317,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +371,20 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_lifetime(chip, txx9_priv);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		kfree(txx9_priv->mtdname);
+		txx9_priv->mtdname = NULL;
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +399,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
 		struct mtd_info *mtd = drvdata->mtds[i];
 		struct nand_chip *chip;
-		struct txx9ndfmc_priv *txx9_priv;
 
 		if (!mtd)
 			continue;
 		chip = mtd_to_nand(mtd);
-		txx9_priv = nand_get_controller_data(chip);
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
-		kfree(txx9_priv->mtdname);
-		kfree(txx9_priv);
+		nand_disconnect(chip);
+		drvdata->mtds[i] = NULL;
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
