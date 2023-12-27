Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138BCC47073
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Dec 2023 14:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o41liZsEz8NPLioTTQnUwHy4Qm5fzy5c13R0Z39W+34=; b=pZw2tuNSd9C24U
	1RgnYueluhNYZ+qIkA2LynirozMOqtC/URcyCP78hMSHnewkb2wJ0/xJvHuIVIgck+W+HxLLhCE1s
	3+YAI0ibnfGdrdo3TnjdlSqiJvxH4Wkb+ZL7a6EaQzuCdgyH3pOJdkIlAHAOjeVwgx7G40L0jjXSM
	oT7wpTFgjFhgC+wmk5/PaHl15OBV1AO7sd7Ux1DY0UjIPtfEqFN8HfMQ0y67U79KztQGZx7dB2c57
	RWLlKU22QyPpIzB0Sb0CxLNvhS78XunX62L6WL9nkBmnGtCzoIwmXaDGhSR13VCJv7tjVOUjFCdJs
	LziUnhWZ7v/SmeSJ/DsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIVA5-00Eqlu-1d;
	Wed, 27 Dec 2023 14:45:33 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIVA2-00Eql0-2N
	for linux-mtd@lists.infradead.org;
	Wed, 27 Dec 2023 14:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1703688317; x=1704293117; i=markus.elfring@web.de;
	bh=t84TSl+EluuPPFuJEer5T9HrQmpz9O6xB+/yns+xpbg=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
	 In-Reply-To;
	b=H/m2q2Kb4PMC5SWfgWh4y4kWC1MkytkybccUGoogQu06U4j8fAwIBnZ2sg28HD28
	 Rry7HheBp8jVcB8aTAfBgqAlYxIFLOjEil5Jyn4jynQJWHjWZ5D7mzjvypV3Zbeb2
	 muVERTBMDAtTQ9CtIuWNCcBXbJxtBAZFJrQCp8Z6svtTKI3+cmRptxaWjEqK6sBot
	 AVdbVW+T0lWyUDntX9U2rVd3mNrYD9O86cB8oSn76sfUfsai1LaxxCmvBz1JwNv4s
	 sgmJb7nrkD8phbu8Fxg0n4xN5Zi8Y3hMBiLBDoK9akN5GaY1ZY0mlOsCmzc0Rgdes
	 CrSAV/zXrqnPYeNs7Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MDe2F-1rR0020xc7-00AbzV; Wed, 27
 Dec 2023 15:45:17 +0100
Message-ID: <56d92e42-db9e-4767-bcb1-9686bdf34a03@web.de>
Date: Wed, 27 Dec 2023 15:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] mtd: ssfdc: One function call less in ssfdcr_add_mtd()
 after error detection
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
References: <74183091-4c8d-4c92-b3f9-cebaacb41efd@web.de>
In-Reply-To: <74183091-4c8d-4c92-b3f9-cebaacb41efd@web.de>
X-Provags-ID: V03:K1:DsSL0eMHaC2Rk2bw2q1D0zcazt2/fVc+/haL7c/aRJkCieBC1tt
 0AXAwa47Os+poIspl2AHdEo5Z2KI+HFZ8C+kWvuMOXzmUi04y27MTHCaZ4S63IVf3/kQf3Z
 ae89RkE7EPfLGSuhxATXgiCcaIb7MRxaSo2mNdZwiFjvT9gfysj/3ZTtLca3OMFUHxbJkBE
 0DH7shC3T+uLv9aVTo7Dw==
UI-OutboundReport: notjunk:1;M01:P0:43YQzShyX3A=;Ym3MFRhSF+BgUSwIX1xJPMjb5eg
 OrUoJO8pr+zYBSTiBAAl7M1mwf/bpo/+kf4cCjuVBVsl/YRMGD9TNV0W4T776DTorY4brh61U
 KYwd6aAmS8KQ6N02Ucm4EXPyAX4qprD66QosY55lm/+2S6Yo464UbbDVYPrtDWxqUDUJ39Q57
 bc66AUAd+5hHxQaaqoKhfO2zXFJjtUAoiIDNnVzvkz3Ip+eomd3i9vvKW6kGY8Uy9Gb6x49qy
 MYQS8cN/4ShzTEJ2+GAVbrE/y/caS6k/5+mWH3JobIXgJRy0zhCSnu0ugZmRiZhiXSapFv144
 gvF2thSS4OiixNpQjohoLsCBC/mbjKUwuODFmhUuRIg99GU1rQFCR0rj4WwdoGTdJqW37lcVZ
 MmP2uhpY9YMS0K6ifMVQAEOMS+LThmtvMZJLzQM9vwiAEcIBLo+cg0pqUJIsqu2lVj3o6NbHY
 BED9msOL9wWM21z4YBe8QV1RrOXlKAgUidWGjFLG1u5nfCKa2xkxjQozsXWIxLMlCNiZZgI7J
 yg55oNgrWQwEvLI1AjX3svQ5dYFxK1uFQD8FwcsK17HX4WEIpBD4d9U8lAtPflEgVwx0ltuJW
 gznDq6fOUGvIRQ1gOfhLH0F04ZQSXmHGlFrRpoflaO9d6XAb1aQGPARd+diDnTko8kFeTbOZO
 IVwoLEvvuy2dW0DYQm+G8rAJYEXiGXnAWY+PtGBROxQcVlIPEqo1R4Kko2PjP7hZrU12FsrAK
 X6iTVqHqbRM900sJZBork0oNaiktsUPFW8ct62gnKrMU7/XSTB5UYZhmDScxQyl2Oe95csP+u
 bsduiDeYiwJZvOCTKqWSHpKLfzuAM7DzxBEpMBYJTkKBLz16ibxjz2b+n7IvERUF4EycU1B+2
 kSkzyfVRW+M0GNoF12PsGlEtLixSxOW0gXe+SRa3G35q9BNoCvEVRy/V/y8tWCBRivhR4u3tB
 2TuarK8cb68v5enFWHzhNPEB5oc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_064531_056001_E9FC7C35 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Dec 2023 13:21:52 +0100

The kfree() function was called in one case by
the ssfdcr_add_mtd() function during error handling
even if the passed data structure member contained a null pointer.
This issue was detected by using the Coccinelle software.

Thus use another label.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/ssfdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 211f279a33a9..3ee8535d4515 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -332,7 +332,7 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 		kmalloc_array(ssfdc->map_len,
 			      sizeof(ssfdc->logic_block_map[0]), GFP_KERNEL);
 	if (!ssfdc->logic_block_map)
-		goto out_err;
+		goto out_free_ssfdc;
 	memset(ssfdc->logic_block_map, 0xff, sizeof(ssfdc->logic_block_map[0]) *
 		ssfdc->map_len);

@@ -350,6 +350,7 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)

 out_err:
 	kfree(ssfdc->logic_block_map);
+out_free_ssfdc:
         kfree(ssfdc);
 }

--
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
