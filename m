Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F57C88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 01:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qZ/l6em5ZMexLI/AdR9vWyJFfXlpxTlZYedLOS7ELzQ=; b=3dODnPlJaGlVWF
	mi9Twl05f2A0wYI24SpnN8jbenOa7V6TziwzeQ09XIMERHENKqGePk2F3rb5sRemj47ysQQ/dEjDZ
	6d6+/EBk9QzCGIiPSN/tKy30jHTZuwUHIN2JPr6rofsk+GoO6i2At/yRYwUfpgUIrojvmxcYicLNT
	kRmXWJx6DxszMstun41LHuhnQuKXEIcrsct35kEXyHc1yu44raMJ37SJsKeC5AWxbASV0q0D3mn5h
	bfY5CApRADV5fjhobieXEdVx8COptTQbkFW6nMTmrD0gVuP1wpTxORXIJ8Cp2+RMHa05qBjIQ3/Dv
	5dUnHIjVPWedrrtKTURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HdW-00000004wEr-0G6q;
	Tue, 15 Sep 2026 01:07:02 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HdQ-00000004wES-29TO
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 01:07:01 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-52fb76bcb1eso31415681cf.3
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 18:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434415; x=1790039215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0NSuQEoXQJcg9ajYYVwURRCgxkdaWdgI2zUIGcducQ=;
        b=MD1bJ7PIfIUsnGm8mwzhEp1kg7zVLCeTU5dg4J3BibWKyMQNoTQxlmFzm+hTLQ4egY
         k2xdjPb9zP/Am8xiNc4ig2kPg07CQnbhgMcg3U4Ok84BOdSWUURVmG9Z6dr65FXLBhOv
         KkmEgmxFh4b6ihwqFKVMTdBULYrgD3jIyP2uQzKvJnEVc3IF9m4hye6BrlPNxHu8cx6j
         PAmL7uNewBmTgGaYzTvIM9ZKaXAme97TQpgms3vco6h+UBe6Z174P8zvdNr/ymH7H4Zv
         KyGFOAykKiSwyUWo5IJgpaT+BzJfOgr69NgrRqCIIoYnjMui8Z5cEZNSgXJA3kmJikyj
         10Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434415; x=1790039215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0NSuQEoXQJcg9ajYYVwURRCgxkdaWdgI2zUIGcducQ=;
        b=kzN5apNYzxnZy5IaMVgn4j3sRpuWy6EYmslUR43TmG0Ixe9PwfvutbO2W/NgNqr5nI
         pJJ5FUroe0hQeWI9rfC40Zlq5QHAjdY+X4kEXAUGqN47IdqBWYFUfUJhnnnOKThtd8ZE
         ePNeHE0iVHAX0TmDoLX5kZ72YxPIpqxMA1PtwPcdViaGj1Oqw+YdWJx2BFyJo0iYizb7
         NTVDJSxI4sQ+nTgepMFCtRxWKSD7pan5+7GmgjDv8LJHBA6N5mVLji4bOauPZI0EAsCo
         VmLzW1BGZp7D3Po40/3sBeww+SK3s65ZeEkOWGfx5608oh/oL/pl9+XgDf9rt0plRAKj
         YvFw==
X-Gm-Message-State: AFuF++lW23SEcYR+c2qKHJNw88SrNwIVr12Fk7JHbpZDtzhkeI9L0/jF
	sjijge2SdG8LefWJatUTBLcTpWDg6x1vAtOkDiDXABnZw6lqDfMDlEqltPaM6rVibw==
X-Gm-Gg: AYBFou22Y/7AFdSXuez9eyDVF9WW8sLCtfy5NGZUfIMygw2im0JPBzt/A1R+1a8mNpn
	K7pXfX6wmuyXQKGAq8aCps3RB5csDfVpmdf6ca6gBXKvly8qx8SwQM+U6rdTQois73PAIO2QT36
	Vj2JhE009FjtK7S14iFf68lfOF6d9O0BLTIgQPB6gHX9X6h1nhySt0D9osyiawkrhlxDZfVx55r
	++dA4ub18oOnL9tLBewjXcRxxZL75roAd1nyHbgDuC9WPgTGLm7mVS6Li0RlXX1s8OgGQohRG4y
	VxNsKlGAbt67d158Z3/2Vy6ZhK30jTf0k5o6UPmeXHKd9+21lzOhfRhiaVYDD5n1AulBhYwR9tN
	mKZVmoxzRsO1mq3iH4x6p7ZpmD61Amzw11cfyWKZPoWPPteGv+E8PEmpoNybwV9q7PyBH1g0XY3
	sKCbUMm3QoohDNYPK5Eh0WLX5vbSsxMhJt18UN+eboHwQywWxAYVw5lFGRD7R9onqd++V4gFvWR
	5nw0KUzhEPlZApUv2PLLLPCBuguG1miTINkkVlDosJfbkSC6QQlrgF7WHsfRW9dxdu2ydtiHmdt
	GEsUBt86PCmSbiT3Mu68bjLLVd9kl13ZIQxHpnExBe/7mc16svufK9weluNMyDWk76h4BmVuybB
	igk/y
X-Received: by 2002:a05:622a:4c8:b0:530:8853:1be5 with SMTP id d75a77b69052e-5310cf0d3fbmr79307801cf.10.1789434415206;
        Mon, 14 Sep 2026 18:06:55 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a5e5sm108327076d6.19.2026.09.14.18.06.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:06:54 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: maps: pci: balance PCI enable on cleanup
Date: Mon, 14 Sep 2026 21:06:47 -0400
Message-ID: <20260915010647.54099-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_180659_379648_CB680486 
X-CRM114-Status: GOOD (  11.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

mtd_pci_probe() leaves the PCI device enabled on later probe failure and
mtd_pci_remove() does not disable it either. Use pcim_enable_device() to
release the enable reference after the existing map and region cleanup.

The imbalance is already present in the initial Git import.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/mtd/maps/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/pci.c b/drivers/mtd/maps/pci.c
--- a/drivers/mtd/maps/pci.c
+++ b/drivers/mtd/maps/pci.c
@@ -250,7 +250,7 @@
 	struct mtd_info *mtd = NULL;
 	int err;
 
-	err = pci_enable_device(dev);
+	err = pcim_enable_device(dev);
 	if (err)
 		goto out;
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
