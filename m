Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F260A2608
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qcXPm/ox;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAWJIK62
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=U/mLLsKBD3TOrxYADuMPG49R6FWqA9ZU7fN7VjPmsqc=; b=qcXPm/oxfLSzJZ/NLT05iTu3L4
	S5xGoDNji5PeaJpnI+e4C+WohTvnU5/vNWl+IIycECaNq5q5bqKURuZyq5LH8hs7MdtcHK2m2gVhx
	otPQ+DSW6iQMArpivSMa2XO6NS5CtVQhJvqzk+rWMC6C8IU8wKQ5GZE/LX0MiCBQK8mwtLAZYfHvl
	0FbLONkW5hinOaA3fYqLvhhiBrYdHDDBQqyn85kQH9zeCPLRvEWELk5SXd08MniWpcAt+qAzTHtoc
	o9/OX/9iml8DENILCTOBUb70jYe30ftHGk+RHTLB3CPX/UatmHO1gV7tniCaAeRGjX57iCDmHyTrE
	mtzQO2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxIL-0000000B9Uz-1kzf;
	Thu, 19 Nov 2026 08:15:01 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxIJ-0000000B9Tq-0MMi
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 08:15:00 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-49465892f7bso1473529f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 00:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795076097; x=1795680897; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ej7ChYpOZ5l1Y3NR+n8BUjqWY6jWLDDINKnXOpUmMGg=;
        b=DAWJIK62AMsWpJh3aXZWy+w5C5k+8n94Vt9eeeKr1XjJI5o5kBp3FcnrIaiRv5uGhd
         m1OEHT3OV3leZSxS1Rbe7LsrzaFLpFtN2/eSYBiquMmHkrb6eXNilTbWNPy+YLeWFGVF
         vNQXGJcaH5gWX0qWW/WGcy6/6U0ClGIFDI4zEFrCP5yXrK86okaSc18/G7L6uzPckVKf
         FCaIW+WQNpH6drHkaa0X+QeXqQ1cFWy36wZATWjWcDzzN6dvY4hTWRs3EA8K3B/Vlg+L
         r4SfRUkMfrqTZimovnlPViHGhAgy7kzCDDFnDuvXTD3epH2xVrI/D/vbe8xi++lt4fZT
         ON6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076097; x=1795680897;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ej7ChYpOZ5l1Y3NR+n8BUjqWY6jWLDDINKnXOpUmMGg=;
        b=0R4bD0VuzcowQiBclG4MA0vCP5wFmrhwxrgTHvAmktzVPEVkLUUHYUXHtm4j2mQz+A
         LzfHajDDeXT7G3ND2do3Avvd9b31dsr+UtRAKt0dH+ol9yhu4AqyVVCmZR3QDHBxbiMW
         w9zg2HhNIW08t8zn0EZGsnanoFEKN5CAK36WdYjlUDfdreWLi46LOv4sZ4BedhPaE+BV
         3GJ/sIDmW/lDtl4Yf+Tubwi1Horz4QsK8d0QG+e4f2X0LJjNFrBwX2x1N+RCF5fUr5xx
         ahmKMyrXU3OjrJD763ls+UPVzU1qcSO1ERiwYT1WjPWZp3NzojUrQiK5Holvy/sTAmAq
         W3aQ==
X-Gm-Message-State: APuU4Z+ZJMzJX1Aky0knjPQfTAHztZFi34XhaG2JIpEldAW8lKLtXWnf
	DWA+cgSReFYubRZNGi8Ow7wceno+vrsUWeDe51po7SIe3uM++e0/36m924IvKw==
X-Gm-Gg: AZFdTZf54f7SDqmi02Kroh9iYo4dV6pDWSzGu+IR3cSHxFSWTX+RaIRXJ9AldysYJKp
	WnkeX2dU7/+wOKmQ8uYH1gaJCBGK4A9UJoWbGfp3GhROAEIOF63ToI73hnx+FrFlBE84iehluQo
	mQAy2GfoDmm3dceemNEIW52utiU8GoTUzh9e4lZQOu3JM3CSsopBRrwRQI9x4bWp2yvbtkOmH87
	GI1kFFgVQMSCvAvCn8F7qIu9l+b/IGb4UAtWYZ56Avwp+m1efq1e4qAlDoa+m6F8YTOvEIoZPZg
	8NupOqPZarWMVR30WgzjheZyAelsueNARl00RcYxyuwHeHUu9LTIwSHk0ir2ZRtIEOguF/dptS6
	JgG/JctO+L8II0nO8odb8S9lUz8Gs9HW15YlwbqlF1JrJy5BWPsaCMB94vr/sGoi8uUJri1RNFS
	Syf2f/E301jfSMDA1T7uJF1UczfxvbOf4L6GeJ35tRqXWcvjvj+qMt3iUBohG0+13DAR6dXOuK9
	tKgcpjACyteJGe4VHqd3f8nSuhENt+CeSfH0sa96BL1dXnjrCR3pK3FFFmm6TCaEb9q3/c8VbNz
	R5pllIPhZA5PdUboASir2A2aCiI/a4LT90qdxLK2UUrQfmYikClXt8xID8QNptcvwtzfbHATrZv
	XCBo=
X-Received: by 2002:a5d:5f92:0:b0:4a9:df02:6040 with SMTP id ffacd0b85a97d-4a9df02654fmr1704178f8f.3.1795076096580;
        Thu, 19 Nov 2026 00:14:56 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a65560911fsm9161190f8f.26.2026.11.19.00.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:14:55 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 19 Nov 2026 09:14:46 +0100
Subject: [PATCH] mtd: spinand: cleanup ECC engine when
 spinand_randomizer_init() fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-spinand-cleanup-ecc-engine-v1-1-60d007d2ddd8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAwF0KtI1gaMFJFepXQRMl8bkHSYQRHEu
 3fo8m3eRRXFUenZXVRwePVvNEjfkX00VrCnZhqHcRKRmWv20EhsGzT2zDBjxOoBTiq6DAbFY6I
 W5ILFz3/+et/3D2xfVgJsAAAA
X-Change-ID: 20261118-spinand-cleanup-ecc-engine-da1af0ceae46
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_001459_150964_8771AD8E 
X-CRM114-Status: GOOD (  12.41  )
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

When the spinand_randomizer_init() fails, the code jumps to the
'err_cleanup_nanddev' label and the code leaves the ECC engine
initialized.

Change the respective goto statement to use the correct label which
ensures that the ECC engine gets cleaned up correctly.

Cc: stable@vger.kernel.org
Fixes: 54e1bc80af0c ("mtd: spinand: Add support for randomizer")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 18bba02fbd31..f6741d121b70 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1982,7 +1982,7 @@ static int spinand_init(struct spinand_device *spinand)
 	spinand_cont_read_init(spinand);
 	ret = spinand_randomizer_init(spinand);
 	if (ret)
-		goto err_cleanup_nanddev;
+		goto err_cleanup_ecc_engine;
 
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;

---
base-commit: 760d2efe91a84363d25c1051a10572242e75fe86
change-id: 20261118-spinand-cleanup-ecc-engine-da1af0ceae46

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
