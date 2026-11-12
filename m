Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DAC606A891
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EBDPjwnD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=C2k0NI2c;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpJUvOnp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZqrwM4ZT/L/Z+SZkR9o+O0ltjO5nNMSN5TPA5MoKyew=; b=EBDPjwnDASesMsuia4B3pGK1mR
	0YdznRliAN0Z5I5TtC0FsO/6Xh+1wjLa167evy3Jd0sey5P0DIrMMvpBLyhv6av5ChW0GcOXdoAjp
	kl4AXe72A2fQGRKui7PsJxV/j3KBPyd76nm3mcZ7PY2mZ4PYv8/cHYhLRhKV6Nn8pc6kz16+UO7CE
	761Dt1l9f8RPlj8kessBu4JMY+4dAc7TYcw4H/p9jLdm/5fpc4EVyF4PRQpDuJ1T0FSlecEEheqWW
	Agv3rB4GO14Xp1nPTv2oJVSiRtSIM17/kcUIfFwBo7UV0dbUhFJsdQkOPmxCmNt3B+5wZhm85T/6M
	mtrL/wIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdK-00000008NC6-3zj8;
	Thu, 12 Nov 2026 01:29:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJco-00000008MHA-1pWS
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=; b=C2k0NI2c1K2Pd8tiCLdLpYplbv
	nUz+WOLPfEcUAIeJb5Tq583WyxhuliBXfyiBzg3pTTqdJuypXC/f0dY8Cxut9S4hZ2/K+x1Zwnit5
	HCQcafa1J3pl+XIB2GFICd+HPRy5xR3UXYrYoSXAXbmWyEDRwu5AdTGp0sm+bpTaJ9tOLXhrEmuWt
	fpQxRhE0AST/hB/KNL8BJbdp0svEJBgX4UdzJ+lSuWtjdlQGK04Th8yCgrYKdFiHhvBPBmEcG5iR7
	DRZKPu5DiVIX5cankzI3ZqC5MzQKk0zgymqk9gRpv4zIZZ38VKVNo5zJBkk0Bi97aIbve1NksOANA
	USLQuqVw==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJck-00000009mph-0VIl
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:13 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-567cb8f983bso1843438b6e.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446948; x=1795051748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=kpJUvOnpzOqjDvV2XD3ktBU5Jq1YsyXPal7vh4srGzwRscAYzdAIi6REvo72DxFqAT
         bFiT99th7/ZQXuE4//z7hILJN8t33nXKpfGKJuNSLoMk1zib6pBG1A82zuShFue9Gkym
         ti+MbhZ4pm13j4nICSC2Pphrbzfgf2BeUxxBp+EbACk3YpPpaabzqzKO2FdrDZgeuxO9
         y3WTkmpQsxzbRLS92XoJOUN9wTUKOL2QWntQyBs5NjPMmjCe1swxuzC+YYptCXIKgX0N
         X9nizMVWGaR+2WGVjPiqXKYU2uSY656PpoiE7iLHRt9NsjRgiYJoyEKxXplDotdvraO8
         2PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446948; x=1795051748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=Z51J6rPjVVyR9fXFHeZe5qDWjwoPkVj0uuMOerJpPyF6xXzdTi+AOu3us0WycjB4AG
         JAnd7oEja1PDHTRKMry3If2nlhM/VScve87kyIbEEIrXGD5AqNkQMhVgGItZRbkJomCE
         iNAQTQmLLIpfedjYazH2N3fewz5jzb7INFboq2wyxqxID5uWuYTXulihzwf67oY2PLc/
         hzHLAJTJb3w0Km4RD0uUuMwC0tNtJm1NSaPWU8jAxtcCPCJKFcaT1xdo5ajJKHaLUoYt
         SW0urHKYO09OEnPwYuDke8tTZYRNv7P58BAQ8bXxDDHceMgjHX5XJK7M7eDnu+nK4aB+
         mO9A==
X-Gm-Message-State: APuU4Z8ieaNlI+WFgCOY+pOPixChI8i5albMD8SZtYm0Eykq4pkZSq9N
	i8tz6xsTSNa4bNPOqNA7Ujfy0Pr5vEK1ij8JmmQSctauE1otsJDPdcam
X-Gm-Gg: AYBFou0GaK6SXJQHF4qN8QsUW4dTirjqRSqnQL8+W8T2nO7+TrWok1LoUuUPDYYiXeM
	bWAw1ltg2iNXqAHbgzGllLqfR4FFHfXGnghXT5sYKacW0Qe6JWeRi20LjEdixC6oVKXl2j5/qPf
	D1Jys7HLZ5CmSv/LgRqbKh4MU4zkf29tK+kk8Vf+D6seEWaln8wBMBKi+PPxAOuoGnVFR97CzIa
	PD+rLjmwA6CSnTv4sodEa2E8EvOlxgRK66tqwnXx4NkDqsh7K3uhiPR2OeCrdpcE+gP75cffCg9
	sHDK8g4gutZ3pNcYQbATCdaxquvDj9MwDnB+0DZKrBd2yhEPTStATUBPDOgXHso7c+gNcBZMwNt
	c3l6bdhCxaq80lwiduK26Mplym8Fk1xw6eMZJaBvt5LoAjAQKUa82O+qAlh80wX2Toc9lORUrfK
	dcfN+YJV8wUEcra4Rrp6fjwTehaLO35oM9QiKlw54bavvNNlWj4jCnwm2eiIFTdWDBi9+bEVpx4
	JiJcloa76r9sg+V9+J2zEq1mt0EbcaTX5Q459Nsr2kxiDoHlYeJ0dgo0tYuxh1n5eUcwtRJA3uz
	ReoxO2QkpbnGsTwT5GOEnI3OXfyXO6SPhbZNoBGujbA0QPqpo/7STv0bzIGrBBuOKTDXeD05KOK
	tlBnZ+E/aoibDJBuJ8X4zUX8/EdKlGUEJs+suIgGDW8rZ0Nqk/JloP9E/6fo/Zy9IPzfsTPoszH
	ELma15vdPQi2iFzt6QbGIBw8t5ukY8RgVdQ0reG0i+YAkmTBU68lxyIhKpLpTsL+lEwByWFXt7W
	lk=
X-Received: by 2002:a05:6808:c3ef:b0:4d6:92f4:d684 with SMTP id 5614622812f47-56b989191f4mr3926705b6e.63.1794446943169;
        Wed, 11 Nov 2026 17:29:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:10 -0700
Subject: [PATCH v3 31/58] mtd: rawnand: mxc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-31-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012910_742280_3D5E234E 
X-CRM114-Status: GOOD (  17.52  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded legacy controller and drain I/O before clock
disable.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f976cf3f7210..b68c2f13234f 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1694,10 +1694,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, host);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1800,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1831,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
