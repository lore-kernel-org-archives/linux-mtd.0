Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BEECD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQ+Wiz2AyqYYaUiVBpzSKus24EdiFrvW42SY2DwaVS4=; b=O57sADMpPO9Sde
	WKULN4nlwMEUWP1Xgd0JuCHodO/mrlin+wJshLkv7bZsSUTEY8Ev86NZojSuv82S8nADAwprHD1ch
	IGXd7/DFGD3q2usdx0kczmiDKjtMInFxYQ6AHadkuds/xk97Wj49gfrFHZXb0Vu+isP6QjEVcF6fl
	REn2VWPNn/IT+sYMiVr4CdNHa+/hbr++3iP8HVsAyMgFThmw+k4VGUFj/XG8avGsiM6C02Z8NkbyN
	YYMwEVUfXP2JSJ+m/XVK7aAarZemFWqbzsgqU2/Vq783IRd+Q1sr6G/EuyONbSCGRUt7IUQ/dCIvi
	iR2yvF4bOFM9ehduTs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAE9-00000003ayS-19yZ;
	Wed, 27 May 2026 09:07:01 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAE7-00000003axC-0coW
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:07:00 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c8016d642b2so5140859a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 27 May 2026 02:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779872818; x=1780477618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHfJs41z74yWyxNYCsI9T7FUV5fvNUyK3Y2GYC39FLg=;
        b=JRZ4u6Ui7sncjGLdq/loJC2ngp3/vqUQNrNf+rSly19LDHmOuePHOEBCELn4ACDnDG
         CTCXDmsTNfmI0f54sHcArFtNynRClY7nRccwX8RMNBr+PTNjwZj04TKtxnyJN//v71KV
         XA1R7DSd8WyzswOhPHqtsWipGOLoB0tY1mNce7WGruJnJA9YrirgDnjsKEpMRq6LjuR2
         vtMjYzckgLSmE0vsgMIf/MSNndCn6rJJXv238R81h66JM0W/1jN3iWlLrP+CaAD2uAUo
         +R7XZoabnn1YnlDbkBuKsDFOMCkGtHJL8A9QnPO+GAAQhW8RCIRbdEJehGgY6nQdwxuR
         iktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872818; x=1780477618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IHfJs41z74yWyxNYCsI9T7FUV5fvNUyK3Y2GYC39FLg=;
        b=TBjuC3paUFDlyONzHCtUgXVAsgtAaxgTMLjhdLOxZRDAFZX5zza/QObR2pAtGXtM7C
         gBMsXgaoFDW63Dd5Cni7sBZMseqhqHSRJfuJSF2fqVbFmUTIisAMluUEq3KrRjMPKQPs
         C7QwRzB7JxalZwYTlkJVRIhw4isf89JekankxsNWGckkUXU3+cnygz+sBhu9Xw2F8X1u
         oCJCrYKxILmz6WjOd0Qxp37wzCo2eXbnc++iinPlhYmwfE5VwrYNbqKjUaw0/E6qREqE
         cKSWdsQVKbuDRgPotWfvxALegkaiJgEysLVwTxmhC6RiPuxxt+6dMngHjqMd4cOJHIcD
         v/+w==
X-Gm-Message-State: AOJu0Yw2h2OWx7UjztImHag6SiLZ6+fsMjnvxn8p/LOYM5paISjfjJg6
	4USfeCnlopPMuZAfIQWapC844M3SIjAIelsYqCSGTJiKMoY6l7KwlhKg
X-Gm-Gg: Acq92OGwPQ8QSYGidFDrkfUv1YDBzt6kpCWneLxK6oEF6OzIV7F/dsMJuH4D5RbfjOD
	/+PbM+xS/SxMQoriJdcRYxGa4ZuStl1/+Ocsiny3EhfX+Nd8lR/AOSB5NhvzbUhFRqHXxe0I2dR
	5Uqrv+zzglkuZ/7qAmuYNiqRLWEWWzRPTJNfQba3+PKATav8jLNLRYIDKr2950Acs/wyHfuFmbm
	HEN9CVnu2Zld42HY/tJ5S0oRat3c4oSH5urJodgbnXgpWyDN1ohxvKnjIfO77RL5zUW3tGUQwKs
	2CNzyJxdnP7pp/YRNRYhVia1/OliuOfUI3xLQi+8f/xZz/7eIR9mdVhakN9n2Mkq/g1WaoxaNJ7
	5bh8vqJEgb3GWcKnay02vo2N5CEF9bIWTUNNWpUCpE0asgcbM/c7KTKCbt+iLSMBbL6gIhygTwH
	YBJiO0ThW7WjMSqI434pDzHf8E6XFOynxuGIpxR6NmkejY/autICh8qFcKcZv5rFn9e9OHiUr1f
	UTvIammjdFQWDsye3U=
X-Received: by 2002:a05:6a20:a122:b0:395:acfc:b679 with SMTP id adf61e73a8af0-3b307ec72e9mr22523522637.18.1779872818298;
        Wed, 27 May 2026 02:06:58 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b91c6sm12065004a12.14.2026.05.27.02.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:06:57 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: takahiro.kuwano@infineon.com
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: spansion: add die erase support in s28hx-t
Date: Wed, 27 May 2026 18:05:40 +0900
Message-ID: <36045be168c5e9525f9c649986b0f1a54dcb2be1.1779872008.git.takahiro.kuwano@infineon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779872008.git.takahiro.kuwano@infineon.com>
References: <cover.1779872008.git.takahiro.kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_020659_191199_BEFF796B 
X-CRM114-Status: GOOD (  11.25  )
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

From: Takahiro Kuwano <takahiro.kuwano@infineon.com>

S28Hx-T family has multi-die devices that support die erase opcode.
Update die erase opcode when the device is multi-die.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b6023076903a..65227d989de1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -762,6 +762,9 @@ static int s28hx_t_late_init(struct spi_nor *nor)
 	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
+	if (params->n_dice > 1)
+		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+
 	return 0;
 }
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
