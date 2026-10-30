Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7F3606A321
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=twIyOvU9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FdonKK5b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XvZyaLvymMfG7uiJoxYQotuHohcaVi6L8K2/8aAeHDc=; b=twIyOvU9orMDn5buyXvQ3OqZR0
	zyAh29kU222vDNGnrbchi3fsLxMjGHKV+ZrkWizvXjmZe47F97wdIXuB4Q8xevjYBbumq/Vkv0GNx
	zAe4VLsEUURd+hWAGXkdp6S3H+zb/ZDBngN8a6ZhbOGK1pYToXCBDNlh+69tbqU++VIXx9e5geP07
	ZhtnqqabYaGj7nrvz0Ncsk5Jxb3scVtLdWqd61vF28Slk4DID5xWs6V7Mu4Qn/mIShmZs2eCMDYEN
	Umf0WNXewApu2ZUbexaBIsJ9F8Vi9xW8u1tqyzdIo35VQ5nh1vDb6SMbEKS/XWtnjN3xB35Dfo90H
	86g8GaPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLh-0000000C6eV-3rFh;
	Fri, 30 Oct 2026 16:21:01 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLc-0000000C6bx-362x
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:20:58 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-49de8ea072cso447466fac.3
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377255; x=1793982055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
        b=FdonKK5bwPuI8rKBH7LPAjhtcKE3C6seYoWxah2xyaAc4Ju9EkXLxo2pu//cVQBY6W
         Z4kFX0qrPl9q4MnshGMqNx03269KPCrOgZFlGtjZe3/jTeFsG3oBwXJyCnz/oOELZ5UY
         S5bqoQOcHgYL5DW751CpMs1TYgHP2ik3rWmd7fZ6H6aTiH4rN2RxLVjqBNV2yEcpIM23
         9/lgHBOJTsNHRTp4eKmdwl1NhhhbEqmPzg3AV+nv6/XJ9KuIkxtjwCUhpuCrR18fuXao
         k63SDBz7a+MPpRbHmHahVl6BH1GZJ3c3Ax/q8DPQ4K5lsWabWiR8unTlam4niD1rw+XF
         eJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377255; x=1793982055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
        b=rVAM6oxcwujYkQLfs7NuAONUGJCG8RpRfW1tkHQqvyVajTila+kEFmL4WYW6hiprbA
         F5ynUbmW4dHx+hYjvBENX/fVw0wkPKYrVaNVcOZ3yvW6uIcmM11sCsOe1V+SEJNWETf9
         y39e9XN2/m3df99cwmL+sbO/mMngthfWy/OGkS9ax0Ov/5caY3x49CXcoMTFwP+hLmBN
         AkwIgAaYuFTXN4By+qEtilP8vYLKJq6LBXLCz/n5pH+ix/l1ynSPrbJ4Qqe8CjBBC/Fl
         9GO/B9gUlhwnp2O34XwGuf7KE6x6h5Ke91jJw6OTDkwsn39vJlxWQQj5ia8x9qlNIpvs
         N3FA==
X-Forwarded-Encrypted: i=1; AKwUvBx6XDbYFjr+fi7FmhIH7OAjbXQk4uzXCTFKhKyiBS9NFEw20ahzNIUPXMmyL5T7GlKDBFMqKTIQDXI=@lists.infradead.org
X-Gm-Message-State: AFq9FYJqdzNKo1Iv/LKephE7z+nYUnJoiXYFv84CiZgLfgWgOJdJAM1s
	etWzkyzlhLONHQQ/qP1Dz99uIWdlxliHw3qQ9Qckvd3+dFw9GfB91BO8
X-Gm-Gg: AYBFou31Al4Z1l4LeeuTFoYqNbsDZDf2hGDMxDvubi8pbij64lyS2WTVNiczpDr0RPj
	75dHL4TjHkZ3g3oHmi3WlHLRAySJwxda/xr15N9FZ57XmcDg0roobc0fj/NbevXWdhS/Fi+XQ25
	UWi16+t6Wulrcr49xPs6InOkKvmgM+dPv+HQa5gZcxJPHW3yfow6NdatrzjwTFLEbmCy4FIzvIg
	kLVkEoAc+1o+9x4SHef8Cu8BNi2iAN7T4vinwi3X2tGNM/smdPA3BtLCpkHc9UxiCUNfJc+O9sq
	xHHd0lFg1MrxSXjy2mUwjfZ0FDc+qOiC3wRQni43VIPxjv6EQQ/EZ/syqmqg2VzvmmVSjSf3RW6
	IdNvfJqPtwGr7qsEu6iEah3BYXWyoNpVBQFok8C+EwR4j/qLMsBiON5+sVGpVoHf094wVgp4waR
	4L9mFgZ0DxEH77Vm6xCv1LBaTaIFao6KXNdk0zvvz+lLhQGVFrcinsW0g2NoUZ1OKepUORml0NV
	R6vJNsOtN25ORu8Lcuk7+kxzMroXI2cDx6r+mhOLueuaHOoCWrHkocDPI6/gMJ+2IuI2c96bdzw
	Pp1yprrnFFiFA6wAmwW3HNKbtBFeJPigvzBSbu09Nyli9X3Ne1dJZNCQOfSHYFbNycaDwKiNboF
	xpetXZ+MQoktGOHsu/vjhLzVVkMRb0AA7Jc1Q9yn3GyIq8D79eW8VNVy7HrxQfT4+gtlw1tnvjq
	md2f4mmFVARSS+GAE=
X-Received: by 2002:a05:6871:a1e7:b0:49e:334f:312d with SMTP id 586e51a60fabf-4a90764b81amr1805240fac.16.1793377254766;
        Fri, 30 Oct 2026 09:20:54 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:54 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 1/6] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 16:20:36 +0000
Message-Id: <20261030162041.2998170-2-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092056_792968_96208C2B 
X-CRM114-Status: GOOD (  10.66  )
X-Spam-Score: -2.1 (--)
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

When DMA completion times out in gpmi_nfc_exec_op(), the driver unmaps
the operation's buffers and returns -ETIMEDOUT without stopping the APBH
DMA channel. Since mxs-dma leaves the channel in DMA_IN_PROGRESS, the
pending descriptor chain may resume after the timeout, while a
subsequent operation can append new descriptors to the stale chain and
cause the old DATA_IN transfer to execute again against an unmapped
buffer.

This can result in DMA writes to memory that has already been released,
including buffers freed after ONFI parameter page detection in
nand_onfi_detect().

Terminate the channel with dmaengine_terminate_sync() before unmapping
so that outstanding transfers are stopped and subsequent operations
begin with a fresh descriptor chain.

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..86163a552 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2659,6 +2659,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
+		dmaengine_terminate_sync(get_dma_chan(this));
 		ret = -ETIMEDOUT;
 		goto unmap;
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
