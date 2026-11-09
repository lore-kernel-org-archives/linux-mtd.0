Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E92C60A382E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lvTmTagT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMbfP0xq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qfxOJsoEDuqI/JkZD3qkNSNrj59UFVUGAOLX7rbcAp8=; b=lvTmTagTlCSF8nFtwVJDz8gyHJ
	nfQc19irVHyCwp0z4io9mecbn8hWm3kuC4N9tdEpd0cZxp6UL02Svd8YEfOHkzp/QPrJ86MA8BVVM
	Sqmx4EUDPi491hUGMVpMDBDQ86+CC5DA2w40hy7KH5S5BuVMZS90B6viUUOylSvZoOyx6ep3hNmhl
	nyizsYZMoIOOUnNKrEKOb6DNInOf0MUGQehtYf4MmqZ+GFxLMq/ns3DFq08DDFa68OHRG2u4AO2Aj
	bqRzu7eXAgu0R8jfJCq7tmaKs6vzmHd3aPLJ0El2qK5gFogNpXqOgMaLGf15GyTZ6q3VJkR426Iwi
	JIIbXhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF4-00000001ZSm-3xbK;
	Mon, 09 Nov 2026 19:41:22 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF1-00000001ZQm-2nGL
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 19:41:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-491971ac844so1242460f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 11:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253275; x=1794858075; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yQjiec7Yk01SvEkjgAhJ90ZgzbE++iwGitcjYLcR7rI=;
        b=iMbfP0xq1LABGAQ9yjPjbVfJAq6iESASSFEPRJyeIlekAqyU+H1z6Gl64IkTMzX8Iz
         Ewl8QpjwIX+8rKvdoBNi//Ena6dvnUMiLHJQtiFNqJWy0BQ3YEYdwSY/sxDidR48jz/D
         3ICYb3rYNudD7RN0IuW8ce6bs5Xil74kpljHeMGGqhCL65X2yY95PVPyGwgXb9qEMorV
         9Vr6HH7tFSFwVQW2busD3kqM3qHQiFx9QGZ5/cYj99t7WBAvVdwZISLiG8ZBTS07kVbs
         phgh1LFT212OB2k6tanev2+MsoC31NkPpPNFOZMkpY6MSu7nBTOyEJYTFSf2CxcSlKw4
         Qyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253275; x=1794858075;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yQjiec7Yk01SvEkjgAhJ90ZgzbE++iwGitcjYLcR7rI=;
        b=rRdq/kgvaHbavVTR68uVHPCIqak+6Ofu+1X+mDeuZmFtpmiT5Hu0KHQITthT/i5FYn
         BszRz80MDiNyEhlwuoJw5R85rhnHzBMtdI56dHhu4DqAr/hMiWB7/yX50LZxNE7yckVc
         P3+EI4JSsGsdrzWgl6OvM09/iZsvW75jAm/sQHT4N50Gp9IlgfwH2lBN95okLaGrn4B8
         MdgLTOhvNfXAmUoyyUoGf6rWnYBMldq3qE/JGYdAwe4DlayGWpUN38EGsEx/3K9cl2Eb
         F9zSKvY420HlzjvI251kBA6rIi+RZtcKQtaKoCBtBLUyZnDwgjJ+jEiGLW4Ory7lqqwG
         AwYw==
X-Forwarded-Encrypted: i=1; AL+hErHWXE+qM86ia1c+MA6YJ5U/4OoiOmpr5L52KIx7ZXkvQ0s1vjDlrOPz7/JVPAhgTb+RuX9UqNzCQWY=@lists.infradead.org
X-Gm-Message-State: APuU4Z+gUyLob/6G9Um3sBA543bA/P6ddjXueW6WeK+yhdhNEPTiI853
	lS3TZ6K2eVfKQXfEKSl4wS65HQ605bqShvMr2bjRonSEkamRnVtfINVE
X-Gm-Gg: AYBFou1O+lo6m+vPYtV+QEgSNqQlq4d7b8uNLe3RLm9doy7ny963dlUxJvil3ntGPzo
	O1VmnDNcoTsKvke8OEBXtGGZF26SCkdQoOlmJj4XnX3mya2VEOeYNfRJbyJkQE1dgixiwdKS0Ep
	nSJCcTaqPQjjKUEQNQbzoX9p39Z0Ad9Wll3B8s856iFpdxvIK+Wo9HhiCbq4cpd1lLTSP3yjsfu
	yPJem62vm07TPSqalao1bkqnMdDp2xKjkcJ4idwPbheK7jUJD/QcEmww8URrnP6TlY+a++qIUBh
	DiAz9SpNcY6q1xEXhPUERUHk+BPILZb2s6DgGSrA9hwI1pSdY9n+DunT/RlA0JPnW4DXamk2CoW
	eFpigGXB67+etqk7uWJYVFFOLfsbPgzfCr8c59P0nHKcsjyGQz1XjPixTUZfvzpPXopyKidzp3R
	Acm3v3NXhjmEioGy8m6zalie2eh9+y/L7AFQlDDDEp3s2dpLIGHT83M/whCylqHCeOXFpvbijle
	JesUiL+cAAAIDaF2bS+x6TATwu4UMIG5TjA1o8MHyBhuVX+sUwfVXZK5X7vDT1yRN5YSbedgOCS
	+HjaORWmWUZ9MRDT11T5WwG1ebQPBL+AKV2uuZxkzPdrsB43C/RMHG5j2snnjaZ/O3oJ/EXolL6
	tAuM=
X-Received: by 2002:a5d:588a:0:b0:48c:4442:54e with SMTP id ffacd0b85a97d-4982f87455dmr967797f8f.30.1794253274651;
        Mon, 09 Nov 2026 11:41:14 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:14 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/7] spi: spi-qpic-snand: use generic code from the
 'qpic_common' module
Date: Mon, 09 Nov 2026 20:41:01 +0100
Message-Id: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03O0WrDMAwF0F8Jfp7Ach03ya+UPsiK3Blap7GTd
 lDy73PWwfZ4BfcevVSRHKWooXmpLI9Y4pRqwI9G8Seli0Aca1ZGG4fadDDfI0NJlEZYiwBPt9u
 UIKyJl1otgMZjF/hIKK2qK/csIX79CKfzO2eZ1wot7+OfMzS7ontj/iu1DSWmy1X4CVlovE4Mb
 LnrvT24PrTDw+yQp9934jI0lrpAJNQfWy/YsncH56xjPVp2ISAbRO2J1HnbvgFuQHtHBAEAAA=
 =
X-Change-ID: 20261028-qpic-snand-use-common-functions-12b18fc7a1e5
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_114119_738825_10586A31 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

Since commit cfae2182fa7b ("mtd: rawnand: qcom: move common code to the
'qpic_common' module"), the 'qpic_common' module provides several generic
functions which can be utilized from the 'spi-qpic-snand' driver instead
of the locally implemented code.

This series converts the driver to use the common code to reduce code
duplication.

In order to make review easier, there are separate patches for each
functions and another one for reusing the 'qcom_nandc_read_stats'
structure.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (7):
      spi: spi-qpic-snand: use the common qcom_nandc_check_flash_errors() function
      spi: spi-qpic-snand: use the common qcom_nandc_config_page_read() function
      spi: spi-qpic-snand: use the common qcom_nandc_config_page_write() function
      spi: spi-qpic-snand: use the common qcom_nandc_config_cw_write() function
      spi: spi-qpic-snand: use the common qcom_nandc_set_read_loc_first() function
      spi: spi-qpic-snand: use the common qcom_nandc_set_read_loc_last() function
      spi: spi-qpic-snand: use the common 'qcom_nandc_read_stats' structure

 drivers/spi/spi-qpic-snand.c | 137 ++++++++-----------------------------------
 1 file changed, 24 insertions(+), 113 deletions(-)
---
base-commit: 4a8faaea975be15cb636646c0d4c6ff1c2110baa
change-id: 20261028-qpic-snand-use-common-functions-12b18fc7a1e5
prerequisite-change-id: 20260922-qpic-snand-fix-singlecw-readloc-c4c89b4369f5:v2
prerequisite-patch-id: 7f8a48bccb2e3c8de950bbddacfefe052cea50b8

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
