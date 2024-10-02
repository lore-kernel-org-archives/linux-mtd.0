Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AE2CEB2E0
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 17:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QI8RIFxZ4aAvTEGVz64XVsjL8eDAhNYJhHjt8iVlcvc=; b=kh3HQKaiu+mRIY
	hypXfvvn7n5hnMBeWD4WcyFR8pKrj9u2wXjyYlSqP5q/KG34ZLUhE32XVDYg4QPHPaXHG+i2lVuA1
	p79PtnMJaylALfNjhdCReuoyH90/MzR4sViEBNdPdIeMUSzU4fTL12h48mTMsBMZoxY0rJVG4YWH+
	GQx6mnqe6an7oZi+qkywP4F0Yi3eag0NUyIeJB4wKbvKX+iin5Ac5tC/gbRc0Vko0esw6AbDJ5LEj
	cURBfQPytKmLa5LrMvW3vAiGuEIBQYS5OXy9+GuDDoOK/XXZfcT+po7rxni4SMZTYGF7Gkm0LitLU
	ui75D7Z1+cuG9hmYygaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw345-00000007357-2M87;
	Wed, 02 Oct 2024 17:23:05 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw342-0000000734d-1lmx
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 17:23:04 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so1134414566b.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727889779; x=1728494579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FrtYZnJmhnzVc3g3gqJpSVt6lMuSvSPEflszJlzR0nM=;
        b=S8Dwo6gzXj3nA8EF5lxr54paJsnWaebVPA0rbSwwu/8OcwSW/xUoMmV0ABL7Ate+tw
         Exfm/SmvTMhrBLSY/qyJCtxE+qVd3dLyEHa30zXRL1J7MxJ1BlbeItys8gk3Rgy0Ys+R
         P6NKz/29e+AodIgE1888ElLJeSD4EbsrLsTnaI5/j+M+F9lAK2br5Y5jnpXXqqba9IQg
         Dq0m7AS3jGuxVAqI7TaRHKNzA5emgnkaPjgQNz7lIiO1O4Eh8/o59uToixQmK4RD5pvN
         mSaGslHP4mvrm7EoyyLqMBfi2GZOhmYXu0beLdcTjnkr6wDFGorfX+WQwoCjf3ae5h8Y
         4xrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727889779; x=1728494579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrtYZnJmhnzVc3g3gqJpSVt6lMuSvSPEflszJlzR0nM=;
        b=qvYrmSbHUBehLHT8lGLvC5flODNHZfqibciwhZDPJdlfydc0wi7w3px3mYTpX+8sLK
         tHDioR6ZZXNxTc0KSV2xfRXxtB15UmsEnAbcXBlky5ge7tKCv6RMUC/aTvB47VPm8DLU
         H9cy3YWxW2RhcQu2RUODwU9ElYrL+1B0KAym0duVFcYGlWPdezapD7FGOb7JpJxcAIrh
         afS48AGv71q7OWDotiRTfyvfCref23Wjx4Eemuf/FsTT50fdxOP4LYgl4OSj0O9X+umb
         dHXfYlEY/mGMgSSbpnmMu2q2cPix/1GcOGKm+WBftoBMFA1nr4K6ahoPysdoLeNk7bjh
         FaKg==
X-Forwarded-Encrypted: i=1; AJvYcCVEI070wSKd454P0U5JaMy1spLPgMKYSgUMlG3BWZN0OMmgqpDZG0M8YNEu1JOn3t2P14PcPkfr1uY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwuc/GxiPip2Ow3dV/8HXMP1Cy1iu0GfPbrEOuKyENju1n3FGY
	KZlk5lM7Y1A/Z5ttMSeXn25xT2ghFBBoz0LG3U4+EzRwodJqSQsl
X-Google-Smtp-Source: AGHT+IFGrsopjTclFGJVXmRNx7rFlw56ClSxMQyHigziZsbEMOUUTrVwOrOTfgup+dPCSfeklGxdgQ==
X-Received: by 2002:a17:907:1c24:b0:a8d:51a7:d5ec with SMTP id a640c23a62f3a-a98f821ca1emr383865366b.13.1727889779427;
        Wed, 02 Oct 2024 10:22:59 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c58fbsm889697266b.56.2024.10.02.10.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 10:22:58 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: cfi_cmdset_0002: remove redundant assignment to variable ret
Date: Wed,  2 Oct 2024 18:22:58 +0100
Message-Id: <20241002172258.958113-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_102302_487715_1CED7314 
X-CRM114-Status: GOOD (  13.52  )
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

Variable ret is being assigned a value that is never read, the following
goto statement jumps to a statement that assigns ret a return from the
call to function do_write_oneword_once. The assignment is redundant
and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9f2223d3e8e1..7c91429a670b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1775,18 +1775,16 @@ static int __xipram do_write_oneword_retry(struct map_info *map,
  retry:
 	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
 	if (ret) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES) {
-			ret = 0;
+		if (++retry_cnt <= MAX_RETRIES)
 			goto retry;
-		}
 	}
 	xip_enable(map, chip, adr);
 
 	return ret;
 }
 
 static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
