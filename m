Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A74606A32A
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=014kjFb/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVXsewZ/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fHZs2hnAP514NA+1IcL2sC5tCeB3jokbr+9fHsLNSYk=; b=014kjFb/eeFWolzUaVqZQPjLO1
	kqVjCB6TGVhHCBJPlJXhHu1fkpeUISymVIDEkfz/ocNLUpaKHGnMYAxbYTunnC6dGFFfM2h1RgWtH
	2KeXc0tfaVqBhCJlwucKEnQuqtSUZsRypMORw/ooECy+bjyzCbxYgZRtBzGZ/OIjCtE9BFKyNE1g/
	r2dAeXp8fO/MR2v+f8dFHrzrVM0U21So0bE0fXD/iJl32Xj/JtR+MjoznGb30E9iROUIdWcEFTYKx
	qA9GdCy0qwWFK1EQTJisGyuGBomTylpjPjFm4wghF46MIr7sFwRRrWNX1q6T7w1meqydNtePJ41/T
	6JMyQsJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA4p-0000000GfNz-084G;
	Sun, 08 Nov 2026 21:05:23 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA4m-0000000GfNO-2gn7
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:05:21 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-84e513874f8so179269a34.2
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171919; x=1794776719; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VOXdJqtU61quagom20vbQEtOrGbaqfLbHDdzOijlTys=;
        b=TVXsewZ/0cGnU9UKtLEAzsjKjCLB632Ipt/ufrKmLab8rzBinVLPa++Qy2MCGhftqm
         EG6lEM6xctSRs3RVPSeD9ylqwfHXsiOicRU13z0tY2HFUNXhEFw5Dqun4/ebFhHJ+e8I
         BwaotJ7lXqMuFYj5T/kLL2hX+QO1emIFWRvCxrZPcvZjK9uECwH00keeGcocpp887HkN
         Oy6ROOuhoxrmsqB75RGXIe+aJx6y0l8mXwPrsGHBVv8dNwj/SKV6UdXVa/twzkyKL7ll
         ZtMgjrbS0U+c57HHbMEuvdNEFsPiErHyaqrIelPgCA6vERnlRVnHSN182PaC7j8Yy83r
         ZYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171919; x=1794776719;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VOXdJqtU61quagom20vbQEtOrGbaqfLbHDdzOijlTys=;
        b=cKKEwyBnDNzHJceZXx2v07u22B7ZeEPD6V7ZnfN+49PFX2RRsnKOFc5Sq1bsKSmOwm
         JFGSjguHS2uCJOcjySzbGiNeECavRDiqtX/zN80DRfCfUyDU1sY9WAJHzeUzIy7Wcjo2
         MTSnk2JaMosQaJposiVHM49bUhbyjKStNshhP8hB077XPLkRaqlWEY+FdH/5t1CMmG6h
         r8RH/FGEsd0NFQmgbZ6fvAXdUT1FLBP+ep9hKyeFYQpvslhyUJxT9hvbV/2fdKLyxNl0
         O27bpGyVvo6e+ZvOPOZFlixuCjMdPG8BcLHUtJOJBwjbHYJP1xpd6R7IAdDc7xVvuHHS
         PRlQ==
X-Gm-Message-State: APuU4Z/0s5XyGrLa2VjcswVEzF1Ak+Xpswva22svrCrG8DWi+HpYnbzL
	7b21p+zKdX6bDBWnaabW+79ZCpDt+QqpFvqHncq+d8ggoidK4j95hchk
X-Gm-Gg: AYBFou3PMYsAscsGMFmWMm7CvpLkDaBij1gLlG13w8O9yFJBeAj1pMOaJa5bnse0VjG
	RVQmTvfWv/8+yS9miSFMFBsG5oN+pw6/a3CeXbK+AdFDGs6+lhAwfmZv67vOiM2ndbAQ4NYk5y4
	8zrFSirnPhWyB3SdB9N1kmQ5Ki80X6xiYx19lRNZDpTzUwGFp26AIeQsbAfuUpwRca2WIklKCSG
	00OkmpsS58+cCG9L5XX2KoyHoVjokdlu5Swedw6QsA03w/jAfaCLVyMI1scJLy8d6pmR7kcwHPQ
	cI5PsrAAYVZS5/Q1CPP2dq+boKh7MBSu47WQdyTY2bjkfkarhDCPWCp7wH1Kald8Ss2zVIxKgnx
	iAUzgevd9KuW9QRbDN6nmsdYC9x31EFm5tay7WXpC/wU0PeA9dMAXjITBHPy+9epTLn/yLUgw8O
	cx1q8G61zAJIAmK/kYTWu6NG91Zh2s4a1xfx0lZ9Dt74Vq4/pvhBe6E/saV0GgjcQxMgxtK4rHE
	4oFBmxR+Xqqsem8Ylkq8f0ug/iI7gUkqFoiPwj7OBArny/yaCGIFGs3wEzkb3TgxOoE9I4iw7CX
	vaQttPXc8sbV4qNDWbeLnqgV7C7NgJMtguPyTyIf2zVZIcDuEmf9kBKolc7ewYNaC7RyEasz/2V
	dpOX7B5K2zjZq2/aJJmL9FfLxXBh2ByPWzbh61BR01uKDDetxbgNDDK/rwajghjBA0R56AF2Eib
	H9yegoK4Kcgaiw2SnymQ+pnvv+eDQ2b7boUDLM/kSMRz9+T5jFSQdA
X-Received: by 2002:a05:6830:91a:b0:85c:4897:f2ff with SMTP id 46e09a7af769-85f5084cce8mr2349585a34.25.1794171919700;
        Sun, 08 Nov 2026 13:05:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fbd820csm2226208a34.23.2026.11.08.13.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:05:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:05:17 -0700
Subject: [PATCH] mtd: rawnand: intel: disable NAND when probe fails after
 scanning
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-intel-nand-probe-disable-v1-v1-1-eb0471429e09@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3QrCMAyG4VsZOTasHTrBWxEP+hNdZMtGU8dg7
 N5t9fD9CE92UEpMCrdmh0QrK89Swp4aCIOTFyHH0tCZrrfWXFE/fuKMLJlGFCcRlzR7wsjq/Ei
 4WjS9ucRozi70AQq0JHry9ntyf/y7KG8Kucr1wjsl9MlJGOo05dhWuhXaMhzHFziLSe2mAAAA
X-Change-ID: 20261107-submit-intel-nand-probe-disable-v1-0605dd04ac6c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130520_694218_1126CD5C 
X-CRM114-Status: GOOD (  10.49  )
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

Operations issued by nand_scan() enable NAND mode in EBU_NAND_CON through
ebu_select_chip(). A failed scan or MTD registration releases the DMA
channels and other probe resources without clearing that enable bit.

Disable NAND mode on both error paths, as the removal path already does.
Keep failures before scanning on their existing cleanup path.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 477a427dac1f..97c82e9c1af2 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -690,7 +690,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	/* Scan to find existence of the device */
 	ret = nand_scan(&ebu_host->chip, 1);
 	if (ret)
-		goto err_cleanup_dma;
+		goto err_disable_nand;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
@@ -700,6 +700,8 @@ static int ebu_nand_probe(struct platform_device *pdev)
 
 err_clean_nand:
 	nand_cleanup(&ebu_host->chip);
+err_disable_nand:
+	ebu_nand_disable(&ebu_host->chip);
 err_cleanup_dma:
 	ebu_dma_cleanup(ebu_host);
 err_of_node_put:

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-intel-nand-probe-disable-v1-0605dd04ac6c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
