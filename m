Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9DF606A331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 04:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UKlr+1Vc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuycHVa1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9zgHq2x/rhaVN9p3+9Px5gyR6biGnzxqlyedGXjgwOU=; b=UKlr+1VcQPJOQUxJ80R42aXCAU
	zqpW/VqvKspnxAVApWqJmUVfBQPmbHGdys2d2LO5vIwJDLemXsm+e77SRTeCQsGI3qiRUofMC+srN
	g3PXg73jnfApSHHiAAdM22/SJa6r+OFKSsIxZBN9v54yhMw1RE8FIa2N1rGbVgN5mdm7F9ruWsL47
	FEW0zzJYUxNmiaWAo1oQndD7WpNiudZG771YzXaeFJO50BlQPJlmEKBzGBo7jS3NxKRaohy0A5104
	/jUqcDNl69fn7XUExblXwF+WF9Xx1030l3IQ7K5/P65prxictrYqrqGGRey4nF5Jw1ak/xnJ4rCx9
	wCebbHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOohm-00000007jo8-3Hzs;
	Thu, 05 Nov 2026 04:04:02 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOohj-00000007jnh-3Jmg
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 04:04:01 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6d290b10a35so660768eaf.2
        for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2026 20:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793851438; x=1794456238; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AouVsEJi67JgAtqfY1MqGUWfrdWF3xPqbsbhWzfoN5g=;
        b=HuycHVa1+YFHnUXjVHCw2ScK1VraMUhjU5ljnqg8gt2d1ocD99iEHV6noMe2gdpB92
         cOx0boOMMw8YHPkoTwq+VlQ4YTLD30PovLg+oYHdKF4rFvzBrRwconiSKojyMasGgn/Z
         IBUpD1HfuwrcSGUYv/L6gsrnWZT8DFOm6PtZQV6Fe7JF17uxrl/HJlSrsY1V0VbWm77/
         6ongaagFrfp3DOihQtp+5EVivfBB+U7ieWAZ+07WZjT2mA/O4D98jlcyvhGmm3lszRqg
         lJNtZdaRjhT30MpRmfVKQvj0ggNxDAUIpxau4/yBgercwC43uYdJYe/T7kmji0EjIvkQ
         99/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851438; x=1794456238;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AouVsEJi67JgAtqfY1MqGUWfrdWF3xPqbsbhWzfoN5g=;
        b=nLUkrPbfJxWGZf4QxOBtlyqzxYDiDbEjdrwjOvfF1jamgqlNH7k9+Jp+ZSo2PUizQO
         UtJ11qzwd6ric0frF/g/VyYuJzU89D7nWI7rXX7vfU3i3sTOejnya1gH1pn4ozJceV1N
         AGoOoqhwnJrtuNn7BiOHtofOUNXgRm4eRtKsMgJGJDRVQ3eyl+43Ty3NEnoY2jO0iwZO
         doAQhd3Nkr5MK99YF0NAGd55ZJv9HHMO2jEvG6zCDqzscQJhxVlcIKPbIb677mbb+js+
         1t9ukF7fngiimiFnGjVblx0gqObCoP7qHt+Y5bjcGc9lJAZAKGHpdDavR0kDtjufFLp2
         dt9A==
X-Gm-Message-State: APuU4Z9ca+fJcRoGq9g4PG3fsHstdifcl5SMPZkJ61S1XXbBh9TwshYl
	ZmGfGnNCDXKk+8v3+adufCzBKB5pFe8d2H1OLKUF7M7gr/Geg1PNj80A
X-Gm-Gg: AYBFou07D1H7Op29kXbj7eO6DMHtNPF/mF1bJw5LHKv1H21MVn0OZLSn/f98GrY+2y+
	m1NXCtR5hEtJhuQXIVKDjIXZyQqNdBE1SoWYJ5OLgU2CgGNb08DU5G2fzSeIc5FeLH5P+HRDe5V
	v24B4VieUV57G9DcdcUvdN2W4LzOP1qFGOkYzIkuP7z1CCD6dmcE8mDsFwdl9jQkQ2P5mQsMbs3
	iyJb7i5VKBCeY6Rd8BdZVPgKXuJ66vGQ7Kig0E0Y6mCjQtyvO2/SFPXnPPXMY19ziq2TSRpyvpT
	OKv0A5urCdMcRYlKra7Wr3+ILl7RPK1ALFDh2vhvcX+9oOJMS/axIY/t9Hs3prENqfYB4JiqdR2
	vR2MwhnA9KUhK+3HFLDrtpzURhc+a6zUma41VkVUOH3Ekee8lVq4MyIB2ijkFXhfiVtIoicPsx0
	gKhNX/5OCAvrkq8zyryQJj5M8XwK7CZirWNmu+celKFJjwB/Nks7WVAzEtwzEoV9n4kDYDGxzqi
	mHRNhfOve0CyZrCqjs2UBYRkHN1haIhoTij3g69rXRip9Qub+hPcQx2Ir2EkEZG/D0ptqR+kKjU
	K9nHh/qDH6qAO7VnnZCXn2aDP4w/3meSwBt0ItkVHmML+90SY2Ej8yzoBlSIGdQvtSzG3Bc9WoS
	25jy/h+6at0PB5m9/QVDF33mUkmmvKmglnVCYLALhr4xkmerZhhBVJFK17/2uKkCwt26x0QAnTh
	LqMwjlGqiCQb63u1/o/mgFH+TytlD4DGuU4rxJeDHRVv6Mq4aIhqSVvzD+xDT7hXXaWWjHxb18
X-Received: by 2002:a05:6820:560b:b0:700:dac:ba85 with SMTP id 006d021491bc7-714f295ac1cmr6702854eaf.14.1793851438261;
        Wed, 04 Nov 2026 20:03:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12d1f36sm3018997eaf.8.2026.11.04.20.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:03:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 21:03:55 -0700
Subject: [PATCH] mtd: core: avoid overflow when checking data bounds
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-submit-mtd-oob-bounds-v1-v1-1-05209fce5a3e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB0wQ6ulVykuTDJpp2BSMlEK4
 t2b6vIt/t9AOQsr3JsNMq+ikmKFaRtwryk+GcVXA3XUG9NdUBc7S8G5eEzJok1L9IqrQXJXF24
 UaOgHqPknc5DvsX6Mp2v7Zlf+P9j3HzneXbd8AAAA
X-Change-ID: 20261104-submit-mtd-oob-bounds-v1-2c5cf82f2767
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_200359_843389_A264FB4E 
X-CRM114-Status: GOOD (  15.40  )
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

mtd_check_oob_ops() adds the starting offset to the data length before
comparing the result with the device size. On 64-bit systems, a request
with offs == 1 and ops->len == SIZE_MAX wraps that sum to zero and passes
the range check. The public read and write wrappers can then pass an
out-of-range request to the driver.

Validate the starting offset first, then compare the data length with
the remaining capacity. Preserve NULL-buffer length normalization and
empty requests at the end of the device.

Fixes: 5cdd929da53d ("mtd: Add sanity checks in mtd_write/read_oob()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..dda976ef52c9 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1670,7 +1670,7 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
 	if (!ops->oobbuf)
 		ops->ooblen = 0;
 
-	if (offs < 0 || offs + ops->len > mtd->size)
+	if (offs < 0 || offs > mtd->size || ops->len > mtd->size - offs)
 		return -EINVAL;
 
 	if (ops->ooblen) {

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261104-submit-mtd-oob-bounds-v1-2c5cf82f2767

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
