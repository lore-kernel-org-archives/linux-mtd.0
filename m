Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D52C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MArye83ojW5HxHVHtqigdE/8DnnKQVapxw7Nw5DoMp8=; b=386/CIQ8qiFoN6
	JvrbxDFQ5aBs85WdoTdNrR1yqwiN+AhR242hMBvDtJ3yZ75bgBHZnB3Aalc79lDmixY/AFCVleOyP
	3/S6dcqux6byWgS1r7382SjsR8doIfxAj+jN3fpnBy7k0ogb6o+/8OxalTSGR4eJNt4iYYsdrOTmm
	fORAUrMktvdWoRigO0vi3mLNO9faYvPyy6SE91O7U3UCFB1uJDKsHKE9tcCTpW2wepr0+bRUAdzuZ
	dJPe8X3d+xsC7u/iwf7rc6zYPzFchFvWjqb6rRWoGPReyEbHeqX2MiaxULxK58B97Xi7JnkG8mYkg
	A7BNFeRCNr60WyRANaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUATp-009weS-CY; Tue, 15 Mar 2022 16:57:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUATk-009wdV-Ss
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 16:57:02 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so2997694pju.2
 for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2022 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rXOXtOWMXdx6V3PaH7y2j67k69HdpGi6JYNx/duExm4=;
 b=jo/ob+3BCrGYRqUTxnl3CJQ2mgP2SWS+gmmrOH08Ij2fdFckrjmp/jFlWMa6AtR8CZ
 TvGSCw1ztXMnpV7pTQlpL9160MosuLUh4xqQILqI/SA4A0+vCYNL6A6S1O4a5AtYULaq
 7blpfvviLeMTSutVML0bJHQYdnmvx3GOH5/Mh4fSpbXix4de1QdTKTx99vyR3XlW/Iq8
 Zd/ehUC8F30CiqRdkRvr37xFOJ99n0uvDtdp3G3mJaovBvJBf6/bPVyqSL6NIjV1SSlG
 T2GO5NEQ7bcX0LArKPrdMyNZu/tHXJt6l2QpVx3QdZmItLbOuJHv6bi9fyXviUi3rClG
 7Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rXOXtOWMXdx6V3PaH7y2j67k69HdpGi6JYNx/duExm4=;
 b=ruiHdRgc06RZNE8GSp3Wn7K5ZZjuk4WGDwabV4Daf+q2A7d/mFy/kcMg750zmMxiLZ
 7AQhUnFZ0yDVe5EuADwqI/Mjl0o0v1dYyIV++lM7KulHok0WRxNboEYt7NoR+HsGzhsS
 vQu1xZwg7RmDV4rxc3ml1FbSGo08ALAgxCLgPwmV9+2Gmf825mwTpu9/Eey7kIQPwsS+
 jOfRMcFbz7hTi0Xg+YefoKyO45p26iN0oLfQAhGCX2+eY4HLGoORJoUnmz4w0t66BFFr
 dlkxWJPK27BgHZ4vswLob2olmQKJfdEas5RTMjOMCkEvOIizcYeRgeDzlRE9ofRUS2Mo
 OLgw==
X-Gm-Message-State: AOAM533Wp22wcwJbDn+cjGCQCs4VWgoXrAabF97AcTmEuTWT+XCWtxyG
 6lbuwlwUhErvhuCR7FsYJWM=
X-Google-Smtp-Source: ABdhPJz4pIEbU4bzv2Y+E2tWGNys+OdN0xbyigN5nAao78yGfAcm97XbkBGKJh+pNXll+r5gUNZ2HA==
X-Received: by 2002:a17:90a:4890:b0:1bf:654e:e1a0 with SMTP id
 b16-20020a17090a489000b001bf654ee1a0mr5646825pjh.113.1647363417941; 
 Tue, 15 Mar 2022 09:56:57 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:3e36:8008:b94b:774d])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm24835809pfu.120.2022.03.15.09.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 09:56:57 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 1/3] mtd: cfi_cmdset_0002: Add S29GL064N ID definition
Date: Wed, 16 Mar 2022 01:56:05 +0900
Message-Id: <20220315165607.390070-2-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220315165607.390070-1-ikegami.t@gmail.com>
References: <20220315165607.390070-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_095700_958793_EC744CA4 
X-CRM114-Status: GOOD (  13.07  )
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

It is for the model number 01, 02, V1 and V2.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a761134fd3be..0125658a1d30 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -48,6 +48,7 @@
 #define SST49LF040B		0x0050
 #define SST49LF008A		0x005a
 #define AT49BV6416		0x00d6
+#define S29GL064N_MN12		0x0c01
 
 /*
  * Status Register bit description. Used by flash devices that don't
@@ -462,7 +463,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi },
 	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi },
 	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi },
-	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors },
+	{ CFI_MFR_AMD, S29GL064N_MN12, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
