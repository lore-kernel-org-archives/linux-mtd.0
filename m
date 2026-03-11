Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8F9104BECD
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 10:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFjUhTjGeUXXFtw0EIuDNveo46ICpViMxzXtKRm7n9E=; b=exYcXMbkolXzUS
	5WYoJDKARaiKaFlEJ/HVrECw5AmWt/txVRGLt6u7N82d3fIGuvVrWMTHxRqzZMBEOv2rvI1jZzxjQ
	GhO+aLkPavtQoiZJJRHp2m9GPaC0iifQ1Ub8bUHED8edy1Qb7u0Lhh0b3Uicp+eEtDUAyowJG/cxn
	E/KYQEMDjxRWc5HFTMlrkhhQnhihtE0Upc0Pifb5b3oAzEFF+qS6ON7jnPczN7cYYVvjwoniNOXy2
	XuX+Z7gfgSXQefJv+TEcgKxGCcwxu2/Yl/q3gftL++Tt1/oQ1IKFPm0+RBgTNyN9bBOLaT5yx7umh
	McFzqteZvHOL7oF63YYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gql-0000000BR9s-2Fpi;
	Wed, 11 Mar 2026 10:31:35 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gqj-0000000BR8v-1T3w
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 10:31:34 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-829ac8d56c5so4528032b3a.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2026 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773225092; x=1773829892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmNvd1PHGKe/+jOkhZ60vdpiKJgn6ANHvZ8AjwmtkSQ=;
        b=O9TCSu+5vyeZXn7YU6dwfv8lRpAwXkfL/I3jE3qSiWQmA/YZy7SGwvJRTSJusm4XG7
         O3ghmKfhJqYm5QtKI39AYNVcr3l0RidVFixK6VMVoOFwHHJFeh9cTA2/12owL5YKtNbM
         LHY68xhQVfvGJpTtAyHkAaJ+TLMyvDcGvc1sMBJ8Ct45xkzAfUGyt3AQ9V5ukJV7kPcP
         ZW86SH7Q/Uw2ALnVvTmrR4Mude79zuuKMfQDv6kNLwBMm5eyNiylqnlhSr9ncisyJbV+
         9QuvpgyUnE1RPK89tqSH3BCjnswplJJmIa1tOQr9go4Ts1ECPQTvx36/KzwxF6/zZ863
         lSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225092; x=1773829892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CmNvd1PHGKe/+jOkhZ60vdpiKJgn6ANHvZ8AjwmtkSQ=;
        b=CGmgF/LQD72dsukCWkB4p39UZ5bAlMLDun1bFtmfj5BXgymRWpwKf+hdV0zSHq8GU+
         akV+ap9J3afLWRVprx13o9vLJ4YBa16RilssGcCECmTIgjCQDuPWiD13qdF1IeJ8JjhO
         oqqd5k4ej9OWVpHn/J67qOnmaKPL/LYXXQoBWDhUXIH3o5Hba84vNXtFiySnBgJhhcUy
         azuuTCKx3BG3kZ78oYEQatx0Tp+qZJOqEleGjQhSl9JaHH/4raxAe6uyqkvifFO0F4Z6
         yY4Yxjo8aSK1OY48AZyzM10qnozHLiZLO5PmAuNh0PJhr9i7odv6unOYREkeMnwa3Ogd
         DD+g==
X-Forwarded-Encrypted: i=1; AJvYcCVoXoqqOXy2bEI7m62V+erkgiVTirkwdPOhccRbGMSacpvWEcl0IMCuWrwMlZpua8Q39IkHn3qjm5g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSOa4x1oywKjwjuea3SHGM+Ang9owwNEAtp2vPSaFxX6c+cfTH
	KkHyl5kZSyw6nx35RUW702gtCY7on1NMVT2enerGVJFLzw8tJVgQE+sb
X-Gm-Gg: ATEYQzyFNHlNv7GhwH0SPF546QygCPje7vK02uJhbdU+PKaXACxcb1/5H7EeUf9ed5o
	ABCB0y4VDSpxJ0BXra7RnePuUI3yAO09T9pyf++mIg9WkvE/EK6k3Sq+CL5NC81IFjROuq3aP3U
	mvbUOYTZfW9n1acmf+6fnf/1tzPZjjEN8/84FgLEipQm5+iajOvKeUW48N2OJtBKQ2fykwH+syh
	PIoup3uUjA930ziuKBaL8jktdTc/bf2DCbuSNno2XtPkYtyimAeISUz5xai0hgWz2g2/vmhlKGk
	aprAmWZClJ2QjOEfH+dxuXaRpjc5NgvVNDK7iXuindJXj1HXM2sFjy2l5g4gu1TY6/oUSXgm8/c
	egMI/F1ykG+nz2cjmpvSTXQ94L6S3AO8dX7jg2H4txkXZGyeXD7L5MW1F7EK8kGxFOcf68mfS+R
	mjBGQo/AEjzmGcHWyCSleqM3y4pZ1i6A==
X-Received: by 2002:a05:6a00:ac0f:b0:827:2d0f:1ed3 with SMTP id d2e1a72fcca58-829f7199380mr2087752b3a.56.1773225092254;
        Wed, 11 Mar 2026 03:31:32 -0700 (PDT)
Received: from 1f3ae71dd79f ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6eebf57sm2052558b3a.38.2026.03.11.03.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:31:31 -0700 (PDT)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: mwalle@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	sanjaikumar.vs@dicortech.com,
	sanjaikumarvs@gmail.com,
	stable@vger.kernel.org,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: [PATCH v4 2/2] mtd: spi-nor: core: Fix AAI mode when dirmap is not available
Date: Wed, 11 Mar 2026 10:30:57 +0000
Message-ID: <20260311103057.29-3-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260311103057.29-1-sanjaikumarvs@gmail.com>
References: <20260311103057.29-1-sanjaikumarvs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_033133_395220_653F91B1 
X-CRM114-Status: GOOD (  12.57  )
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

From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>

When the SPI controller lacks direct mapping support, the fallback path
in spi_nor_spimem_write_data() uses nor->write_proto based operation
template. However, this template uses the standard page program opcode
set during probe, not the AAI opcode required for SST flash.

Add check for nodirmap flag to ensure the code falls through to
spi_nor_spimem_exec_op() path which builds the operation at runtime
with the correct program_opcode set by sst_nor_write_data().

Fixes: df5c21002cf4 ("mtd: spi-nor: use spi-mem dirmap API")
Cc: stable@vger.kernel.org
Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8ffeb41c3e08..cb7f4d447156 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -281,7 +281,7 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
 	if (spi_nor_spimem_bounce(nor, &op))
 		memcpy(nor->bouncebuf, buf, op.data.nbytes);
 
-	if (nor->dirmap.wdesc) {
+	if (nor->dirmap.wdesc && !nor->dirmap.wdesc->nodirmap) {
 		nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc, op.addr.val,
 					      op.data.nbytes, op.data.buf.out);
 	} else {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
