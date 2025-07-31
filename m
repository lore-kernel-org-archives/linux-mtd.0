Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ADEC87FCC
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DLadrgrPnaiiZssPETn7V1Ia1WJwSYujAV+sCgLtyAw=; b=JO9P/T46qnGmss
	hpf+27HjSXR8y3/3hwC+i6LqoBsQcff/j/q+RpDdcuOZHpyiSl1QfzuDPok1pfHV6x5tplK9GlfEZ
	d8on9OLN7V2Qz5zcd/Uho7N26gbCkQzoLF8mGFnOOYFYGDTI5g46ZowbbJowtsCn/0MOgva/YoTmb
	fQehA6Y/b+9a1H6uZq2Zrzg6zNS5BIqSzBhxzrulAN/hUZRAlnOwpYGUkDOwsoTWiEs5+3FlaIw0P
	+9PSh11x9ZmkqHL9B66UOSu3eCEOxtOmruqkleMrr6JOGIfTkzvx3V+AFsvNN4bjoRUaVyU4YIegB
	vSJzuLN/cwLdPNkMeF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXkt-00000004EUI-0gsw;
	Thu, 31 Jul 2025 18:11:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXkr-00000004ESu-16yI
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 18:11:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b78bca0890so894638f8f.3
        for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2025 11:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753985507; x=1754590307; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz97ueWXiz4b/PbiskTtWUPg9WrFPlFZWDXca6NwBTg=;
        b=LLEzVzgS8jSWXLlkPW6ySL46ZkTjusPN5yARxtMwy6W9O76nSJhQ9t10GlnEduQjui
         dcB7MANslnbd//NREcrZof1N+RJyg8258gLxCbTBV1qIOaMKNAnTMwVCPKDx6f6CDp0u
         ONlpwFJB8N0etqdzpVRnjmX3n/pwOK5p5SNRP54WeFwa5Kd5uD7wWWW8NqVMGA3vuAuj
         vdOnKhE9BiPKgKIdtruUcEqxeT2a06P9OJtUcwRUZusf8QK1vC/vSMVmlF5o9u85kuWx
         2mIsFlXWy68oCVN4vby7nB1l/sBu00PPBgq+INkk5oEM/4LYTUso7QQ2js5BUfoz14Hg
         vTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753985507; x=1754590307;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oz97ueWXiz4b/PbiskTtWUPg9WrFPlFZWDXca6NwBTg=;
        b=rSC2a5MIDp4zAklKSwxeEX/tH/gFbFwQPjo95WMUpUrGW5jjUKNi0Ua1RcRFoniBxI
         syzcuMXkHoOkLeWhJCRFEV26NGhMTw7qxd2X0TG5/BtVsZhJtgqLtx5EaOn2FQLvzIuj
         uUAxF9eHPOQeLkMlP7070doJaTGTYjD4bZI+Yxlssl2w4jV5vgVlbw5qEaKvsNNl30ZI
         3VvIlMR/uZoc2RjK7PFJ4+J4Ygh+iqcOU6H/CtuBPi3RGwb4aK+R1Ows8g6HEwzc1b5D
         c3Pc4y9h9uboniH8LJJO9W9mEd7lVj10361KKTVfrOQ50FZOClBjJUZ3eafBcZkflHxV
         Dc9g==
X-Forwarded-Encrypted: i=1; AJvYcCU3sfoeOUjl48AG1+W/oPbGo6p4BQH9p8yYLrQHci3y1wZTjvkJ2x3+ccmSd7CrWVg+FnJdWq5oC+s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbOA9qGlq/B7MgqhEqZc/+8flr82dnbEI6jJPAJXVAntxajKHW
	v2KKz984TKCuATIg9kXAlc9gPE6HZgdqIGs0/uiJiFQv02/SP1EiEY4D
X-Gm-Gg: ASbGnct4vORnO8WJxD73bdbOx1R5KWqr1Xcu7jrDRu79KBXe5z542/YUJBLp+FgSCoJ
	j0JL6wLAmiGOKqdaY47JklHCzOYERDV3UoyQruu3rfDIWCkaii8FEswNZmoUJa9YYHgeUMSYAbQ
	ZB5zldd/gA7IVwd7qXUoSf6OWkCRXfSjNndvGvD5ngC1k794ULC2GvRhYALbUEE+i/HCPb5ozA7
	haR5hMWPii6bON9Ux1ot0pGZNXlld7PSouiWIspWRonXW0hiKuEhT3BbvZ9o4hfMGm3GjnpgK6A
	X1vU5N50uuDpEenjxUCEI7cSBtVH8H/lWvvQKLP4aWIzX4yKa74dz4Y+J4AcWVHGqkV3EOQmC8M
	MvlSrDRQsRoiw5YWrWOrUhweIAXFt+JnCKgeE6uOBmGcFDqdaVyvGUtnAEHW9nA==
X-Google-Smtp-Source: AGHT+IHoFq9WeGTsU7QeC5ti5nJJNc+86GuqbQF6LqraQvtG4wJK8mlOFJGJbKAc0bzxUwv9mBUXZQ==
X-Received: by 2002:a05:6000:2dc1:b0:3b6:1948:c763 with SMTP id ffacd0b85a97d-3b794fb707emr6612068f8f.22.1753985507245;
        Thu, 31 Jul 2025 11:11:47 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c469093sm3230086f8f.51.2025.07.31.11.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 11:11:46 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 31 Jul 2025 20:11:32 +0200
Subject: [PATCH] spi: spi-qpic-snand: fix calculating of ECC OOB regions'
 properties
MIME-Version: 1.0
Message-Id: <20250731-qpic-snand-oob-ecc-fix-v1-1-29ba1c6f94e5@gmail.com>
X-B4-Tracking: v=1; b=H4sIANOxi2gC/x2MQQqAIBAAvxJ7bkGNSvpKdLB1q71oKUQQ/j3pO
 AMzL2ROwhmm5oXEt2SJoYJuG6DDhZ1RfGUwyvRq7DRepxDm4ILHGFdkItzkQes7bxWRHayCGp+
 Jq/7H81LKB/TQWPVoAAAA
X-Change-ID: 20250731-qpic-snand-oob-ecc-fix-8d3d80cc8680
To: Mark Brown <broonie@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_111149_313498_24AB4396 
X-CRM114-Status: GOOD (  15.45  )
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

The OOB layout used by the driver has two distinct regions which contains
hardware specific ECC data, yet the qcom_spi_ooblayout_ecc() function sets
the same offset and length values for both regions which is clearly wrong.

Change the code to calculate the correct values for both regions.

For reference, the following table shows the computed offset and length
values for various OOB size/ECC strength configurations:

                              +-----------------+-----------------+
                              |before the change| after the change|
  +-------+----------+--------+--------+--------+--------+--------+
  |  OOB  |   ECC    | region | region | region | region | region |
  |  size | strength | index  | offset | length | offset | length |
  +-------+----------+--------+--------+--------+--------+--------+
  |  128  |     8    |    0   |   113  |   15   |    0   |   49   |
  |       |          |    1   |   113  |   15   |   65   |   63   |
  +-------+----------+--------+--------+--------+--------+--------+
  |  128  |     4    |    0   |   117  |   11   |    0   |   37   |
  |       |          |    1   |   117  |   11   |   53   |   75   |
  +-------+----------+--------+--------+--------+--------+--------+
  |   64  |     4    |    0   |    53  |   11   |    0   |   37   |
  |       |          |    1   |    53  |   11   |   53   |   11   |
  +-------+----------+--------+--------+--------+--------+--------+

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 0cfa0d960fd3c245c2bbf4f5e02d0fc0b13e7696..37ddc48d2c17264499f821d235835c4ff5982873 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -213,8 +213,16 @@ static int qcom_spi_ooblayout_ecc(struct mtd_info *mtd, int section,
 	if (section > 1)
 		return -ERANGE;
 
-	oobregion->length = qecc->ecc_bytes_hw + qecc->spare_bytes;
-	oobregion->offset = mtd->oobsize - oobregion->length;
+	if (!section) {
+		oobregion->offset = 0;
+		oobregion->length = qecc->bytes * (qecc->steps - 1) +
+				    qecc->bbm_size;
+	} else {
+		oobregion->offset = qecc->bytes * (qecc->steps - 1) +
+				    qecc->bbm_size +
+				    qecc->steps * 4;
+		oobregion->length = mtd->oobsize - oobregion->offset;
+	}
 
 	return 0;
 }

---
base-commit: 926406a85ad895fbe6ee4577cdbc4f55245a0742
change-id: 20250731-qpic-snand-oob-ecc-fix-8d3d80cc8680

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
