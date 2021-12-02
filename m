Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347EBC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4axa3hlTavUdn1vnmKY5mTqt1fRODIhWVR/srKQ8iOA=; b=SzBFuW2Uh+wXht
	j/78Cxy47BCxIzFhMsW1AVv7Da3oJZUveEOyphI5X+2xhND6KWOFWyAOdkXaP4Oggpbbm9DF5Olav
	JWczCZ3HLJ6ptrtBvTC5nNL2RDq8R2rBMj98gl0MYJWZ74XXfeoiqGnA61GAB7XECyi/iqiYRINuB
	QaxbKUJKKdyp+3s7cRui48VnONmmDOAcm03gwbLVci/vvt72dMYYZn+N7CyTDDcopY5Sh2dDy3sTg
	gQEa+NIA0k0AjwypXup2CYddQgTZaAVT5/jBQzMGtzuSIMn/G0JctHipPd46jqb2aLcJ7ASlFDJgJ
	x2xP7bN9vV/le4wYCHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msnEr-00Cajf-Qj; Thu, 02 Dec 2021 14:39:09 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msnEk-00CahK-KD
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 14:39:04 +0000
Received: by mail-qk1-x72b.google.com with SMTP id t83so47862qke.8
 for <linux-mtd@lists.infradead.org>; Thu, 02 Dec 2021 06:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BtkiMIAT+RslrOrn1Xp5gWgVRtyOFW6KruoQ9Exypno=;
 b=CjSOGOIR3Szio3DUD/Qf/j8g0M98siSHKBQriLZOkxa9/iiy6WmS90myb7cJmtjjB9
 0VJ3Z/7404jmVSagmxzhBJjqC4Rgz76GnF6As1TmAVhy/rnoJkyYXrnKLX8/NZlIunxQ
 0RzOMPZteO6kIUeIKFpVGwiHU8fYFblfGB6fwXNTavV8PTrbb/e3JeRpcbG7hYAT5CqW
 3dtr1WFFKtd8C33xebkB6sCr+OcVY/V+MtSFc+37E9XV79aa2ydviuwhzYqeiltR0XMJ
 5gme+E+BcPXv61XD1Y6XFeuRJGFGaWSLDusT1WherBy6dbL32mXfPumCC7gC667O3mtb
 IRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BtkiMIAT+RslrOrn1Xp5gWgVRtyOFW6KruoQ9Exypno=;
 b=D1leTvSUJHK5cvpQdeQuVAlppfzd1y2QGja455Xn2Y72DBO4AB1k+L71DO96CI5u8e
 4MSrsJvirlZNVwXQsZHLU0BZTP93mBftEjOTF2N+3KxkDAcwj6hKg9KNcb/G7EXuep8p
 ypxXLxH3OZ/rMQXMTeMPUOE468+2EhqeoefYgh6Anhz5rRNj4EonIUJe8pVRkOrb20gH
 7ImiLC3DAfQedFQ0TcqVR+z8UtTDYPI+qTRuLEbjjKzYrXuTSdRknFDfgG7cYEwBuk/0
 2w3wMxo1N6CR7+qPp7gfK+aHr22kmuu2uX9DCvfsvAnjusskVnKzB+pdqXZVTc/AkNWR
 A3sw==
X-Gm-Message-State: AOAM531jgaJ4bSqhPNMb1dhmelN3BpI0f63FSQkO0vmmFhbLukF9M02d
 ZTm3aE7Ov9CNIloHivpAV3FIXg==
X-Google-Smtp-Source: ABdhPJyXf7bAGjRX/896rcFnSpzuIZafCW7b3I+ZYUkIz5/6DFh2kfRa3iIgiHv3V3ydz9CVAsiSPg==
X-Received: by 2002:a05:620a:d96:: with SMTP id
 q22mr12618702qkl.219.1638455941162; 
 Thu, 02 Dec 2021 06:39:01 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
 by smtp.gmail.com with ESMTPSA id y21sm1790970qtw.10.2021.12.02.06.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 06:39:00 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: david.oberhollenzer@sigma-star.at,
	miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] mtd-tests: use pages during readtest and stress
Date: Thu,  2 Dec 2021 09:38:52 -0500
Message-Id: <20211202143852.3132942-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_063902_696487_400C67ED 
X-CRM114-Status: GOOD (  10.75  )
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

Same fix as a2c6bbc ("mtd-tests: Read and write pages during speed
tests") but applied to flash_readtest and flash_stress.

Resolves failure of flash_readtest when subpages are present. The test
reads a (sub)page followed by the entire OOB. Upon reaching the 2nd
subpage, the OOB read fails because it is beyond the end of OOB.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 tests/mtd-tests/flash_readtest.c | 2 +-
 tests/mtd-tests/flash_stress.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/mtd-tests/flash_readtest.c b/tests/mtd-tests/flash_readtest.c
index c5fabc9..b4f4e10 100644
--- a/tests/mtd-tests/flash_readtest.c
+++ b/tests/mtd-tests/flash_readtest.c
@@ -227,7 +227,7 @@ int main(int argc, char **argv)
 		puts("not NAND flash, assume page size is 512 bytes.");
 		pgsize = 512;
 	} else {
-		pgsize = mtd.subpage_size;
+		pgsize = mtd.min_io_size;
 	}
 
 	pgcnt = mtd.eb_size / pgsize;
diff --git a/tests/mtd-tests/flash_stress.c b/tests/mtd-tests/flash_stress.c
index 249d8cb..b7a0fec 100644
--- a/tests/mtd-tests/flash_stress.c
+++ b/tests/mtd-tests/flash_stress.c
@@ -242,7 +242,7 @@ int main(int argc, char **argv)
 		puts("not NAND flash, assume page size is 512 bytes.");
 		pgsize = 512;
 	} else {
-		pgsize = mtd.subpage_size;
+		pgsize = mtd.min_io_size;
 	}
 
 	pgcnt = mtd.eb_size / pgsize;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
