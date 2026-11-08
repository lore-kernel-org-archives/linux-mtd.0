Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF67606D831
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qzpmplse;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQi/PYR4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gm/AdkWX6ieWFVse529lkrC78VEqAFLOGEGFvDE/7Hk=; b=qzpmplseNIaouQ9A9eteKYjN4o
	x8DZEdPamc6gS2bStP9jGztBja34EmRluCqyrSjLhP5b1SJH3OPBtD+zNO8SvVkWs6Yrt/y1HJwzo
	l042zVadnRjab3xHDokAZSBUTnJ4Pts5l+h8HrHdyTsfzQoKDez5YwVQBZyFFvfBo2UYawCrM2HME
	0WlssFyZBaFmTN/jiveixDd1B+g7QY6878C/IrNKbTy5a9gsFA/aKqm/V6LlZrfT4XEEpA7Ch7bhM
	bvdVO6CMnhvhAOmOUdyQvwfICGSvsSZNKBjcqV3o9hbFMoURpZM+9LvmMRReaIugjUi4aQp0/A3x+
	zxGHnVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBal-0000000GqyC-1u96;
	Sun, 08 Nov 2026 22:42:27 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBah-0000000GqwH-2LTv
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:42:24 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-55651e7de9bso153457b6e.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177742; x=1794782542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=aQi/PYR4L3TkD+l7D8uiAG/21itJQsiMSljLRP4rRDV681iuED5Nlq9jXC0gEhc2P6
         KAdPjBh+EHBS4y0mtCRyN9ATggzWbXL4mra4zwzZOR8WxJ/XojyIApj87VFOl7E812bG
         MuEedSAqQ2M0hAhYu9Sai79TPDZhT0xZkQ1M+jT2eDd+fIBdvqSEGhxg+PLrFdkK4k6X
         Z1kld3svLeP2h4oLTMqJH17VBzbnDPBR07QVbFqugALgIPp9Ka/d7CdlQwjEBk4TydCm
         X2D17fx6UBpHd7bWsriTk/uXZ2U6aZw3ZIow5EfQtb3RZE7Giwvl4JEBeTE6YTY/myzN
         sOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177742; x=1794782542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=KvHlbchDgq46jUu8JK8VEHXRqzQR/kRfhKD430t4lm+itFq7rzRqR+zzk+4sL9IAlX
         jOPvCCvZT2T3/Coa555V7PqvPgO2HHy3wvCvONcJNuVdMt/hbHm2+zIVnRIgR2HeijWO
         2LLDCEg7T+0bTIaJO7KeliGMZvqHZ78iyj/z/hcnoeBH4JvE3HxZSvI5zk8ANh6vR1gm
         ve4FFzJfqI9uxuDmxi6BjW8fNhopWNO5JjhuUSATc8KVgF2+uy6iVRwEf8XjYc+dVsdR
         Lu1peW45z7+9KxkuOdrBBoeM6YPg2iahaYbYOMbBs54W7LgTAbmCChIuUTlTvkevHnW5
         yerw==
X-Gm-Message-State: APuU4Z9pOXkvgYM+8jvtJ6dQGFaOfPXqy4mirDL3eUi/OjdWvWMlNIVH
	SWqoYwvXmeLHnQWINGcr/VEE1fwWjFRnHOMmDmyLu1+6S3BZ4TR03M2b
X-Gm-Gg: AYBFou1UzJG08eFZuihES9AXBBtV8SzPJ364AWix4mg54gqKqmoTp7lNqntEBKaikgy
	98TqqtL0b2wrwgO8Lgw81mTuLTI607xpKluZDAuFjmB3nX5+JN18bORQY17fL+g3TQWZRRXt3Qy
	jvWe+DWeEpVhkLn3JRgAqC6+Wwrlr/kAl5hroI0elBXyr02VzNAkywYtBvMRq2dzQMPv4dIcyr5
	eo9j/qrnj+HnkQfnw8O31QwlOCkyNAvZztcRy8+g1mMnNc3xDk3/c4kme8QU8UkKroMeBKe2aOZ
	GzT8xi+vQwQFq2+jmlmT6slGYVZntL7p/KKQ9RHJbdl4V9Lq1Tre5MlGM+3y/8UvKp59lTpHjOE
	vnA6lCOElT4F78Dx64l/pHZMgy1KT0z1oiXFB9bO8+H1SJ05TFa/Q6yeeYXR0+30xSF1/0C8wtr
	5sw04mBNlAkT842QQVCuYD8MpJC3cw1N4ixJ+ubIO3etsBRtcrLe67LZ4Hh4AnnTeCYGcpQKz61
	Yv9mV/sda1U0mBjt3ejFTq+u2Grdg2MFL2eDFuE/GY7nwMBSE66yhnc8yFptT9qE9QavjnxN7PY
	rAjOA9d8KCfyFu/RAkPz846r+9zFpx5zzMV/yu6hSORVjyndqvrjbWM9g2MlEhDZGBqIMvYUJUX
	xIll1eJMfoYHnOBbNK5dP+NSoTUHKLYaFXzqtbXMwsDQPTztKpZXwDLEd5gDl1O23a856eBoQh7
	PC7pWAYDrMakl2x8uox6895loUf/zYh+DiPZhA6gA/QuKDeZAOoWMuPGLC5vODokNjU02j1W6YA
	A==
X-Received: by 2002:a05:6808:1514:b0:4c1:5614:acab with SMTP id 5614622812f47-568143a9715mr1370591b6e.37.1794177742300;
        Sun, 08 Nov 2026 14:42:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:08 -0700
Subject: [PATCH v2 1/4] mtd: rawnand: qcom: parse boot partitions before
 registering MTD
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-1-4a8704cbf7b4@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_144223_598004_BBF17C8B 
X-CRM114-Status: GOOD (  11.91  )
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

A boot-partition parsing error currently calls nand_cleanup() after the
MTD device has already been registered, leaving a published device backed
by freed chip resources. Registration can also invoke consumers before
the boot-partition layout is available.

Parse that layout after nand_scan() supplies the geometry but before
publishing the device. All failures then reach cleanup without leaving a
registered MTD behind.

Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 2d98f79b492d..f240d1effa04 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2052,16 +2052,16 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
-
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
 		if (ret)
 			goto err;
 	}
 
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
