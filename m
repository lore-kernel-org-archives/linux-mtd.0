Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DECC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 16:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bNZDYqPFWJN9eGonqNjhUHEoayEVkdaJk1MfqSw9BbY=; b=payQEtSCrzwtA/
	oHkCA4SmQkfA23pT5zhp+TMeNfsyB8tIvXkC3IJyspQZ7iXsu2C15uz0Mxqdkh8EcNSR8aB+D0xtv
	3hEDIEo9GbJc8W0nbtAA49TpFYWtwlM2X5S5PIAdqgntx391ujNKoykWWguAtT0waUB8eBNNVTQ6W
	VxXZCxU7Ntlhha7KJVbwJZN6SF//sNKX1OdCLt82pqhl7V3yLvjLzlb5Nrau9FWvb6kGUyenTZHI+
	OfXFf/zZgqeMgtJFIMqr7Vdd+SOWRimHZFrMCUrN1Qqqa0jn8g7A+LHSl1FGZgZ/iC6jTOKWSr0kX
	MUYWoPrsPrxC0BF06anQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olvHG-0092ad-Vl; Fri, 21 Oct 2022 16:53:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olvHE-0092VG-Jy
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 16:53:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so5504007wme.5
        for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2022 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D7USE7AcSD2YljcS61kNBptWjf/iLrS8g55c3sCGb5Y=;
        b=NWnooMotQFthGKv372Qu9SJBLRm/oAX/AuviKEsNRI2p2YWt6j8yleyRgwYR+BDmeE
         rVCZB05mibw5nfAH86+caUccRaOoRmYEe6fi4xonykx886oXK+MtgZpjqrGwO8c4j705
         IxVhP4NhYarzG+1/JE61XIvTMNKpllqwqu3S/Ji4p8fEYX1h2ExzeW4j1/qo/9zqy3zM
         J9rIKE26g2w4eCSDk519lzzmX4fUiiBrXRkL6kwLrn93BEotZZDrKQ8OiOZmHIqULddp
         DfEYIareszj9xkET2HCbMBDljv60wn7pYZO/Wn4DAFvMfs4/ImN44xK3xAWipZ18/h67
         OYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7USE7AcSD2YljcS61kNBptWjf/iLrS8g55c3sCGb5Y=;
        b=OhG/Q+2LozY42KrxuxjfR53Flgs6VfmCGy0G/k1KrKgo91ZhD/+aTsvTsPTHCHmdjT
         PnG0hw37KnxfleqZGM4bWyFUUQ83JSirankrcqGOH4AP5QHKnx8a9hwJ+/ZeHm/Q1Lb7
         m4HuClacPW/2KwVG6vF1kS9kQHQlnoeotZjG46COu4szlArsRPld3q8RE7AzOuYiks9f
         AK8gv2JnQhfv1547c7vPqr//MXfYk4bQnRULrDyiLaNtKhRiFPb9+gH0NYvKEka/7d5F
         HGT++RWENy4taLpLwK4yrAdAcF5oQ6nerIGB2wuY7L6AKyW7J6ByIONAoUtHWUakMJsN
         z3AA==
X-Gm-Message-State: ACrzQf0SUU86cMjUFuz5nh9U6CTQsNTYAgXc5e2Y+NjoPsLSTvW2SkJ9
	zTc+lpSPeYOhAk9JZsH36TU=
X-Google-Smtp-Source: AMsMyM6/Nq4vjgilkRSoMe2QbfspmZeCAOdOstO79QV0k7bIX7XPsVdCW2Mw0iZJ3zw6btCR6hNVFA==
X-Received: by 2002:a05:600c:3108:b0:3c6:ff0a:c22 with SMTP id g8-20020a05600c310800b003c6ff0a0c22mr13609539wmo.25.1666371221909;
        Fri, 21 Oct 2022 09:53:41 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-134.ip85.fastwebnet.it. [93.42.70.134])
        by smtp.googlemail.com with ESMTPSA id a15-20020adfeecf000000b00228692033dcsm18663234wrp.91.2022.10.21.09.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:53:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] mtd: nand: raw: qcom_nandc: handle ret from parse with codeword_fixup
Date: Fri, 21 Oct 2022 18:53:04 +0200
Message-Id: <20221021165304.19991-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_095344_693925_B3039258 
X-CRM114-Status: GOOD (  13.39  )
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

With use_codeword_fixup enabled, any return from
mtd_device_parse_register gets overwritten. Aside from the clear bug, this
is also problematic as a parser can EPROBE_DEFER and because this is not
correctly handled, the nand is never rescanned later in the bootup
process.

An example of this problem is when smem requires additional time to be
probed and nandc use qcomsmempart as parser. Parser will return
EPROBE_DEFER but in the current code this ret gets overwritten by
qcom_nand_host_parse_boot_partitions and qcom_nand_host_init_and_register
return 0.

Correctly handle the return code from mtd_device_parse_register so that
any error from this function is not ignored.

Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
Cc: stable@vger.kernel.org # v6.0+
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 8f80019a9f01..198a44794d2d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3167,16 +3167,18 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 
 	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (ret)
-		nand_cleanup(chip);
+		goto err;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
-		if (ret) {
-			nand_cleanup(chip);
-			return ret;
-		}
+		if (ret)
+			goto err;
 	}
 
+	return 0;
+
+err:
+	nand_cleanup(chip);
 	return ret;
 }
 
-- 
2.37.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
