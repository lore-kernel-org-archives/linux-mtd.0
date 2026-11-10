Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59722606A957
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=giemBHCi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rQ98QJGN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lc5W2o7g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5HXfSACKJL/TL65SvxERC3kGxJ8zqxJFYM/VzoENbuI=; b=giemBHCiRanXIkAPTWEnYyVzCh
	XUzq1FYbOguBIGORt6Fg0z9ryLpy2fmnj9Y35ozJ7m0wZakic2TKXLjRqaIIIA13eQ0itFwyogeBF
	s+5uBwsxGlMgDhd13t59c/D/bxhRP7oecd2umm4cwxz32xzzR7jHURMMQDJJrJC3cG326bTuESC8+
	6x7jSBoWf7pHAtjXRXxAtKcsA/jZ/OrRM3z08Av+Y2GtATUvKBzJ5C7kTBef32aD9gUtR63AlJ+Es
	qggNrLvxQlpYpM6iW9Zn4aqDiovgwThqKwM2jPHPv4iflZzEghmh7txVoSRxSTFV4tjwB3uHGywMX
	jc5Mpk1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYu-00000002zEx-27mf;
	Tue, 10 Nov 2026 07:46:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXp-00000002xlz-1QH4
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=; b=rQ98QJGNOCGagyxWyA+hhmKQ93
	8M4oLIir3JFR6qwDsh2MRx7RSX0G8c4yV/lWMgc7EXOUKBsP27a1PzX+bdlrYwiQAomNYHUkukKpD
	i/ateoAZX3fF6/nU1aa8bD+fL08PKQwc9SmCkXTj/JsZBgmcolgpydDcYrmvH3g5MZjQrz5WAftKS
	l7J2KStjR2B5Lq3L7Y62c3j7JfZhigBpVBbUIQSDhTlLP2XY2I1GziaiqrMo9Jw3tiUf+6Pd+FeKz
	tSHInT7DqGBzh72oOh4l4vhe58Yib2z1p7WoRYfJoKuFw9pcCXYVXzxq1fc/jxxtLafKOQ2RSuRsr
	iZaOaHSQ==;
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXZ-00000007e8t-1vi0
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:26 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-47b47de8b4cso1096236fac.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296711; x=1794901511; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
        b=Lc5W2o7gn3fGZHNMonlzwPeQYC42EjaeJRz8jTVu8vlpmrXjO01gBXdXmWoryED27Y
         DQYl/Z2VzFpUjVEZveMO7ArKeQPHnhkL53u7r/uQA+UuDOmPmyCBYz9Ndo9/lw33mg1E
         COKpqr8q5cEJeQjLlNb5L0zYHp6qMDtvx8R9LAw9J0v4heXuuTwL/YYtBkNf/B+uPWCI
         F4hAX+r6XTdVlT6pSFrHP/Qz9dY300g3Zi/ni48qpdV05wH8Xu1FeX1wVLeD2plbgHeh
         1490GGpGiyCfTW+jt4TygjenEpRpKkY6govUhCsNAup+G42S6mZCRQo4hrz7/dnMDo4D
         lHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296711; x=1794901511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
        b=cAAzmuXormPnEtu4awOGprXe5NuiGa22kQQ6Ir/lTBN4ghDRfgDYLLvzpG7CtcWMlZ
         9ZL0ltkXdhH2R+lv1kBRbAeDuz29sg+SQXKqtEONthxkPE9nMw5fsUc3oSw7l4eyGlgV
         xuHZkej/vNtA0lDmw/fnUtm0Oetf/8Pq1+sXg3ooI2TjC+g0wPtUfT8K2hYgd0y/w/hv
         CJsy+RSuXLhlaVnZLcbRwiFSFgKBDDKXKeuYpH8jq+G4MvYPZ1rKWxhB3oo+QqyOVxGv
         hcy2suc6EW9QoLWBmJ1JwU6rVdxVmQ7YYwBQMzuKQb1PkP+/olmmw7I/kNn5RFj9Udu+
         xYiw==
X-Gm-Message-State: APuU4Z8+xAQ8gEuss/w1BW2ojNDKFrkY+ZHyd/HHBgQR7h+TafDlvGbT
	uZeSIn4TevZvFnfgjM6a99/EMG5JmjGAjX+gWgkBFp5+3TuNkjKrmbuj
X-Gm-Gg: AYBFou1MyVKV3tXGmWQmJm36YBoJCSRrr1IRY0OkevSH7yyxpi7bmXYuZR8KSoTfzQ7
	IuKoocz45Qm5Ko9Fx4amsWqnn7Yhg8pXtzgGqEFqRTNEXyYu0uftrkHz9T5bSP9tqfQYMfxHypA
	iXu/ijY5ztLy7s2upMkDvM2bEAeiUDqNLMjzPZ/0Q/LsoVuwzUm2snR9njOP17k5qx1mCRsgvtw
	t14+DnUJBB3BhsZhsx6ixd2xP63xj/9KK46xjHVb/byk6xK/1kjCfpOUNK729Mo+FfDJjkXtMDM
	C+vEnlvmmPEsTdoyIZ8f14xJdDivl5rV5B/RaTHVgZTtWKPFqqn/w9pbRWRrVR+xLWGCMdTIUno
	O0aNcyL5fPcou3O5Hvamv42WTebgxgFE9T6Oq1FTiEBZCaNxZul2LQ3LI/v/Eu0REpKgKxLgclH
	lKWC4zS+E/Cfu4a9gSxmPG4ivjarTde4mCDsv2uuGr3Lr6/dGIgKCfK28+PNb94fUwVAcHOmnx5
	xmKd9fQ3F3fqKjlVx7UdlNyNfgMHcr/ePXoiYIeRrkeyDI+E8Ib1LD4uYBKCScbdsm9a64ZPNAO
	Gq1j7mfkSx2mg5KMXfwLEFjly/b2imvFfTo7CN4l7Xk5E4HOXVTzCOrtS/xJDsRIo6tIdtyRGF4
	mIrARXHMI2/OQd//1eBj+kqnd/M4JOQ2ilCCiMLDEn8lsSI3WrLjVoH03n/XXr122XxVV6RUXjC
	NFwK3NoUxkAvvjNH61p+Fk/Civx3NQsPYAnU22V9LwZzxo9KQq3SU=
X-Received: by 2002:a05:6808:1507:b0:4e8:2150:2a1 with SMTP id 5614622812f47-5683cb25815mr1249912b6e.68.1794296711013;
        Mon, 09 Nov 2026 23:45:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:48 -0700
Subject: [PATCH v2 45/58] mtd: rawnand: sh_flctl: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-45-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074523_731821_0481E2F8 
X-CRM114-Status: GOOD (  16.29  )
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

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e481ff..291d809d0ea1 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1109,6 +1109,11 @@ static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 	return pdata;
 }
 
+static void flctl_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sh_flctl, chip.legacy.dummy_controller));
+}
+
 static int flctl_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1119,9 +1124,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl_release);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1197,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1223,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
