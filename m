Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8AB606A337
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pJb2/GPF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=HHH/hfbq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udGSJLrz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JJLB0L4GJ/JogI0lW5CxdnlzJCoolXgSVsiSBZQ6MeI=; b=pJb2/GPF5bHmLRCGO/qeGtYbG7
	usXdKHG0JvjjPEgKYm3dn8JMpNodhLsuGnqWsFasVcrb0sFkQHQhNMQJQ+2k0v4Cq/Jg9Qr5pTpK7
	Q/JNNp7z9Nbk2Dw+ew266+hcy4KhMlBlwcUPOgjpUgG7/BcUaETKNx8Pp8wDh9j18pFtIllnH+NY0
	KPX2Tdvql6ER8hsoQMP58JZTN2YA/YEV7TDkc8uttCnZthaM1+wYygzKajthQF4o673lSoH4x4aHZ
	FZzJB4sTbEPI4sr2s7yEyIm7KtH9a5Btivstcyhctj6Lpe7soax9HtS4zrp+XNA/c+lYAQSQPPVnY
	cn+c7xVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFc-00000001Hvh-2omb;
	Mon, 16 Nov 2026 06:31:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFI-00000001GWF-25Ps
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=; b=HHH/hfbqfZ5+o6u9LZ3ZwyCUG0
	OlDX2CCkFSHjP0qgW4aBgAFNP3uuryd6nc8guuu2p2BJdbC+C7KKZCKGK7JNbMYl8xcccdoFMTvzb
	xpMP0jkc6ykhcNnx7E4DIj782Dgwz+JIPleOa/BUxRpC3sBlmgJuCRNR48JByklnobX2qG6TiJLbR
	FN+2uF34Swnc8XKytHsLfe91KAXRAKGnfLidh/0bJrLW3D6DPTd8OdWI/gPHn8cA0nqdVB7mZfcSx
	5bgXwiO8HzHHoQSj9M68uCo2yRiCoO6P/5BaGe5kmkPkxJy+KxE8hqK+TSB1+fFLywoTVFd/pwFKH
	83W54rwQ==;
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEs-0000000Celx-2onE
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:53 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-716b58a4365so2119372eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810648; x=1795415448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=udGSJLrzwna5JZuMYM5viSdnsq14Zgyvs1GlEhK2YigsOeNFwI6aj4YPOetXvjXgzn
         s/6VqlPhRiOB+OIJXAim9HEVUUyrRcnGwt6YeYCWhvDoFT9l/ma4wuVBKae7GueAICVW
         V8DoDx7ylZc6G48Av7wwxf93EYe/uPi0BA3yN2HZcHM7Ql84j3ogs7uy98agF5OxU3J3
         oTsQosruI1f2PoFQdXPGXwXl8E4vYdYsj9g1NxmKIHEZIFpbRE8xxhItkkeFtLvCxEOq
         sbHudmuUGfwYh5CoMrk9aWZMYR4BExi7W3SBkTdCVgmkQQXaENBR9Qj6UFBDIN6t0NZL
         1agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810648; x=1795415448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=KVqBQPhKsS09rJaGM/ziXtx71vXGGo8m6x/VIFWPjeUFOE+dfaLxQA992QiygKoOvg
         dvgC1+ACQ26PR/UnLR242hbN93qqK/LoEiNagXiyx5tDEd2e0cwmGSsfVJAT29tBUDdy
         IlawtXcAgZXN8XrM6cOvAu7SzQJsZIZbFn/qKgST0k4hryNzlkGQp3GCzpBwHf7vRObt
         pEF7356QYfm+R6bYdDL5ITY5PIBaJF/8KuONsxc/SnP3qmHoh37xXpHyZy9DG0N97jMn
         6ldDyriArTOecucEtXScRVnrLG3AvmKETLR/tUludEYu74flhgrb4hafoxButcCSpNCn
         Sjug==
X-Gm-Message-State: APuU4Z9hp9DhJ44Ywo/04kQC6itmFMe7ZX9uqYA/yb+5sjNdTtgTrme9
	g25dzzSANble9DxEe45CJbuAmrdGNMUGNfMHVMgxRNi51DkP3P5+hPWo
X-Gm-Gg: AYBFou2SO+FDzY7OAFxZZz+YlvJaA6LSF8lM3npSx7E+5DpzlUuf5nDU7gj1lNYRn3S
	Un0wIESuBjNekI73q9OhlpIAM0yE9O5UjciheVsm91g0ZvZ/OGDetxfzFvzTps9Xk9bPih7PUZM
	z3QIHHdY2fgr9rQ0XbuQQNDr/Cm2Jdg5JxmYhPJXttL1mieHth43QUyTneamPGpg0/Px7OD+mkM
	du3HzOtC44aRlWFl8V7si9XBvMz+C/cezgIekuMIGMx8NyHZkyQlkfeIiKIcVi5DXMPP5oxkfB8
	cFxK3ee2WNabOzlHCRBhEWCoX29czs5mP9d+CTF/WTv9e1lWyYgS9YCzqOHcCevsgpexH4TnS/R
	umIcfcqmqVlhnPteGb3H1aCOQv8I4VrL2IqIV1Wo467RIDbcBAhzrpDbTbuQRBYQMxmY0V5hs8c
	ofRUGpowWZ1BxWrSN6UbJ4kp7xeLe1+HdnXRtZFdVFWZd8+y4salzkmzVrV5D48Z3jQpX6t4MdJ
	L8jFC6pyO1VH/udDDAbJlrjjPYQ2U5JGOlokoEKi62pOc86HGrQMCY5qrjB7HwLrS9O5jdS/cJN
	oXGRFhcl7Dz8o2iiuYyVMElFhsnnp5mTbafMrc5Z+NJWSDg65MSCOuzpfO45t7CTiLvnnSvYX5f
	L0zdL191Q+biB57D6MTj5fOooVrkR7WY/iIDE6MH7/EyGleaKIlVl6oNjXSXqnm9SMI6zZPuLKG
	Dupazd/c+kcZI4+Va8v7fFM7b38o8npMv2PMY9/emSuYR+wGguw3OUdBC5CpMFrokNBlnwTEMG
X-Received: by 2002:a05:6820:1c98:b0:71a:17b:11e0 with SMTP id 006d021491bc7-71ab4f7665emr5897927eaf.42.1794810648221;
        Sun, 15 Nov 2026 22:30:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:07 -0700
Subject: [PATCH v5 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-52-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063051_313108_A388709C 
X-CRM114-Status: GOOD (  12.21  )
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

Disconnect the scanned chip on removal before the BCMA-backed hardware
state becomes unavailable. Retain the embedded NAND controller and chip
until the final MTD put, including registration failure cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4cccf00f67f7..fac96ec596bc 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -26,9 +26,13 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err = 0;
 
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	b47n = kzalloc_obj(*b47n);
 	if (!b47n)
 		return -ENOMEM;
+	b47n->nand_chip.controller = &b47n->nand_chip.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, b47n->nand_chip.controller, b47n);
+	if (err)
+		return err;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
@@ -48,9 +52,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, b47n);
 
+	err = nand_set_lifetime(&b47n->nand_chip, NULL);
+	if (err) {
+		nand_cleanup(&b47n->nand_chip);
+		return err;
+	}
 	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		nand_disconnect(&b47n->nand_chip);
+		mtd_put_master(mtd);
 		return err;
 	}
 
@@ -65,7 +76,8 @@ static void bcm47xxnflash_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver bcm47xxnflash_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
