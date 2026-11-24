Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C42606A321
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YRJMamBR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snXUYCyi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Oq9iwlRB2wke3J9KKHJdKnLmY4RbZ7w/1UQJXnC7JvA=; b=YRJMamBRYTmmF05iMitd2V4aGq
	EUhfYICIT/ErghUEXgEGk/FPX07XQXvektV1uVeV66yFSkNDHC4TsMBoH+DKzEiOGK9kvGvdluHn2
	68fXGGXxLfRpBAQvC0UKTjSCvI0Td4TA/53z3ANxbEpLoZPGtnkTIp8s6iAUSEiWOxcEbLwGmxwia
	JX1vF1b6frImNiVv9KiG6dTYg2duBBsEujIIhiCe+Cp8smAZBh3hIviNDCbPTTRKJlrYrFBXTx8rg
	DqzaVOR1IBz35t2zpIbXdFUQWTZviXs7/di89bLleqgIfGK7uAK6jeRNhh5S+l+OWKqh2TIxafkXt
	r0OpvG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqEV-00000006Zio-2gF0;
	Tue, 24 Nov 2026 13:06:51 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqES-00000006ZhL-0isj
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 13:06:50 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso2136968a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2026 05:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525606; x=1796130406; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQHzCrvzke+hr2Xi0X+IPsE6+lahl8beI9U/c68AOh8=;
        b=snXUYCyiuAHC9K2p4XxDUK+1R6Z8ar9u+FDtHrenGunoyIm8JwEFe+K5xs/JZ5BLRH
         aDuyfjQoMSPU9SNrxrkL80HdMOGd5g7PJNocfh+tPivZKT9dS/QP5oENRVrUiU0PLjg/
         sui7YIwtaSAqKdDdkEjuEOJVbPKbaHU8OAKhGDDlfixlZS/b+uKcLG/+sPJr+d/HaXey
         lghj+ImY4PnPxWy0WD8GW735g3R/kXN1kdunSrL9/1CVb0n8K6F08cztIRET9Q+Bf+oZ
         OxS4SJzPRDgNW9jXrhMAXrBDpXw/dOoS3xDrnW2X9j+b71rWb+6LhADGZRhXQm5DbG/A
         HH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525606; x=1796130406;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQHzCrvzke+hr2Xi0X+IPsE6+lahl8beI9U/c68AOh8=;
        b=R9necRczGUbkwDntdqgpZtR7Y7ilJ7llqyNP0/+Sq2KBM34CVW0Sv5MymrR0trGqrM
         OvHuByASqEOq4RD1sPMKh8pD7pMI/mIbBm+yVXB7GQeg3I1B2ulcQPrSK59T144U39/S
         t4nhTOSnkwUXtHMBqFFJLzwqP7JVqHtDJESQHOFH6DOdZgEeFjRc+cpGfUmw7duafLgU
         yMXLWRERd/4PzmmwwnTet8hl5hphciQHJ61VryMPbkpJeQMpu/ZGQD9n1vA18+/P7gTu
         xwEaatJUBHHTUiua9FGwTSf1XB52lo2ILIsqWDjz3Lx4zE07a403S4c61r2QAeVQpoyO
         Zv4Q==
X-Gm-Message-State: APuU4Z8Un1a/B/DJVQ6gysUcCBh7SKrz/a4JsKMd/AcvfLhmmT+JK9uc
	+PiUSgI0DwSNweuybfFtlqG2mLh9uSDa8uaM+upsnx0rGXXBGofyz/ti//4Gfg==
X-Gm-Gg: AZFdTZea+K9eA9pBGe+F01Zpr/94d9jN0rm9lBKh/dQI9YwSrkNE7uEKwe9o9oVgtGw
	puktKN2r0uBNxLOV4uVutpVXD+h9QwoUU/r2Xc9uYDls/OIOqvoYRblcJqWpmm5Z2wQheYmENYD
	+zqi5XqaJZ0Fs5ULsokLxulqHAvKckXilNfz3IMfdm1/q/nj1M1VbOM4k0Rw0M8GOc7wyEqowpu
	Rt8yagjFtqIpU2SXP3GqoI/2f7pYekUJusV4QfhF1ixnQzV3ktgGvkxGQPTOscJo2R4T8G2fokm
	3PuV2/oysAEBtGlEUVOLfgV5BTxRZHjcwZhQh3RzZEj/pN77qDlVQSZEUXbwKE5+tZiUV/iQgDQ
	fxNY1W6Y12iAOzkM/OL0FE8vrR0eIiXM9fuOv7TyRfkhD2KGqlKa8NSoFTOC/foS580UwNHM/uu
	EG2metYUQLih418FR489dnHrhz4v4tOt5NtafMV1ltJhvXQVPtKZ2ZYOgSGpuEe7bEg+MMqQ9o/
	VuwrzqsSadT7TOXE787CIop9o+lkByAtDPVsaO8kNnUhp7h9Y1CR1BnVDtEWx5h55URpofX36xj
	XQ8brKP4MvAtBy+rE0Orysb6nVj09wRP+BKlNcedFDQVzfaioZCA
X-Received: by 2002:a17:90b:3fc5:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b41c91135emr9461581a91.23.1795525605953;
        Tue, 24 Nov 2026 05:06:45 -0800 (PST)
Received: from Fantast-WT.localdomain ([120.229.37.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm25959489a91.12.2026.11.24.05.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:06:45 -0800 (PST)
Date: Tue, 24 Nov 2026 21:06:21 +0800
From: Teng Wu <gigadevice2025@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at,
	linux-kernel@vger.kernel.org, teng.wu@gigadevice.com,
	weijie.huang@gigadevice.com
Subject: [PATCH] mtd: rawnand: Skip timing mode readback check for GigaDevice
 NAND
Message-ID: <awWLzWDg-m9VBZVr@Fantast-WT.localdomain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_050648_245655_372F664A 
X-CRM114-Status: GOOD (  15.33  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

GigaDevice raw NAND chips (manufacturer ID 0xC8) support the timing
modes advertised in their ONFI parameter page, so there is no need to
verify or enforce the timing mode switch on them.  The supported set
depends on the supply voltage: 3.3V parts (e.g. GD9FU2G8F3A, DID DAh)
report modes 0-5 (3Fh in byte 129-130 of the parameter page), while
1.8V parts (e.g. GD9FS2G8F3A, DID AAh) report modes 0-4 (1Fh).  The
highest supported mode is already picked automatically from the
parameter page by nand_choose_best_sdr_timings(), so the only thing
getting in the way is the readback check.

The GET_FEATURE timing mode readback on these chips does not reflect
the mode selected through SET_FEATURE.  The strict check in
nand_setup_interface() therefore misdetects the chip as not
acknowledging the requested timing mode, printing "timing mode N not
acknowledged by the NAND chip" and falling back to a slower mode for
no reason.

Skip the readback check for GigaDevice chips while keeping it for all
other vendors, and go straight to updating the interface
configuration.

Signed-off-by: Teng Wu <gigadevice2025@gmail.com>
---
 drivers/mtd/nand/raw/nand_base.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a225b10f8145..8d77ebac4939 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -890,6 +890,15 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 		goto err_reset_chip;
 
 	if (request != tmode_param[0]) {
+		/*
+		* GigaDevice raw NAND chips (manufacturer ID 0xC8) support
+		* the timing modes advertised in their ONFI parameter page.
+		* Skip the strict ack check; keep it for other vendors.
+		*/
+		if (chip->id.data[0] == 0xC8) {
+			goto update_interface_config;
+		}
+
 		pr_warn("%s timing mode %d not acknowledged by the NAND chip\n",
 			nand_interface_is_nvddr(chip->best_interface_config) ? "NV-DDR" : "SDR",
 			chip->best_interface_config->timings.mode);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
