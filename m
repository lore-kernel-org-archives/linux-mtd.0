Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E680CA1007
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 17:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=azuGUXu99ioDRkeCkL5376CC1XkT1SkGBvp6ERHxvWQ=; b=tIGx67dqyExkLE
	b9rj8RzpDjqrTSJVsi3zF3fwFG6ZedaRMfvyLsukYp2YEKT8j91CkMn1jK8k3L5BLPtshb3FS9cbx
	637cYUtaN5qvK2ZAwgkmt7782RUne1FgmwacHhE65rGbQUfiBNKz1I39jbIYSUNMdhdcS4Au4EQq2
	cOTBstr+oPjPntshjp3q3PxvT/0riNM35kmuioNtJbrK7h3wCJrkRYYUdpjfarCbse55H1iz7bLPi
	IoPGzk6NZHfvKNG/br7Ocr9HOkQfdIZYTpQFsPjP/iNhpgSJgJlhBYekY9lcrEtb5AP8lQHfYepiA
	6GFHogsllhyxs+26/jtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8VQ-0000000DTzH-3VaO;
	Mon, 01 Sep 2025 17:39:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5Sh-0000000CpPc-1ztO
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 14:24:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3d0dd9c9381so2996176f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 01 Sep 2025 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756736684; x=1757341484; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rqvcXlp0W7MSF3vmJ03eJQXl6LGqOtNp4w5UN/Mvcy0=;
        b=OE/DwbAUv8RA+3p+53IbNAYONhOPXbtJ3LwaBEM+9HqmHHb1HJjXhFB4XxmwR40idS
         ZSMod1YIP3UGaj/xSRGyJpvU4QEM/QjnECC4RS3v4PqOukQKYP+3hCIWSuIJ82J7nEvY
         HHWQrYLcZMho9lvypHqNZy3hH08pJ5Nl2CokEmhpILUz7PxzM5C3eU7LwtzMZS9dhtun
         cxvwqmDBfjq8r1CWwLBKmzgPAzewqgjWxFR7+fiPoVePEt+27UELiICOOiVZYwvf5K5u
         +ezp/grCPwkRZbk+fYenB7aX9IQDecMFc9vvzXYeeEZ+orNvPNZTXsTpuWdjMQXgx7/q
         0AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756736684; x=1757341484;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqvcXlp0W7MSF3vmJ03eJQXl6LGqOtNp4w5UN/Mvcy0=;
        b=QM1lRb0e4nxf8+bulW4zgfWskbfIv4slgHrLTqApiB5FtVgurLAfW80v7fINdHHVxt
         h4r6yLSK7c09fh5o+gH/IXx8X3iQRXkBnHoEt/L6bNirURdgRdKgL/x7wfyuEONkxvFp
         I8zJyngg0V+V812h6YoYYX9AxHHj6aaYdPFjY7a9nXm74M/eU/+eaF6aWPLwptCqY5uR
         kSQk2sua35Y2oJ5me57jJ2UYb7dgXAXnwW8/TmhYmR7amUR3bf08suJb4mLm4ALmk9Hn
         vS/ARrxVq0gLNSwDBrJnkVkj1C537pSP3uNax15yD9xxgrdwgn/l8x8EzBaGW+6DLt73
         Yhiw==
X-Gm-Message-State: AOJu0YwrwMrfQTtJFLmJXeimRCfNFBPjnZctvHsBd/AfXC4J47OUDtWZ
	y/QrQ5dFHYLYaXyviCZt1JW6we7k2eAXLu7SPbayTpVN9Xgvr3Pto6NZ
X-Gm-Gg: ASbGncuwzJYWs+OlUMjZlaK/yqviC1AcWAGyRG/l3s4QBghvXKsKgXI5uFseLdY4VSt
	SdrdF09m5cKb9cAXS/6abp+wsa3zOFb45AJc7NH8U/Op3X9LU/g1hU6R8mzKzDJ5sMOL7XJT2Of
	tXE58f18a83FYlJtho27KiATXmYudCBOdxsbmXkbfRrxz6xnqwEmk+2eKE3kcPNfkUk+TiTMFfS
	qM0YOpzmsoxq22+ri5tMZCvuQv9MTMeGFHJxWLowdy1mCJuDXsQAmkWcihmKLBLSJTy+2uy3/4C
	3657G2rKOnFG2bQGmgvdzokdDTxjaRcnQljg0URDpu7RBYn6x2AD7tlqMc2JHugntCQec8kFbqK
	RyiuDhF+Khku+DSQsa4GuzpwpPzg0qjr9ZTJwzcFH2jlQFogiLuctectTwcS6Gw==
X-Google-Smtp-Source: AGHT+IHqPtct6XqWPq/LJ5GxcIfD94d0NHMlxPrBgPKNbuLPMxEx6hG7wkfcL+GTCikbm6rlk5HEHQ==
X-Received: by 2002:a05:6000:2408:b0:3cb:d8e2:48b2 with SMTP id ffacd0b85a97d-3d1dc78e7f4mr7803896f8f.13.1756736684089;
        Mon, 01 Sep 2025 07:24:44 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3d26f22f5bdsm10142026f8f.37.2025.09.01.07.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 07:24:43 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 01 Sep 2025 16:24:35 +0200
Subject: [PATCH v2] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
MIME-Version: 1.0
Message-Id: <20250901-mtd-validate-ooboffs-v2-1-c1df86a16743@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKKstWgC/4WNQQ6CMBBFr0Jm7RgKAsWV9zAsajuFSSglLWk0h
 LtbuYDL95L//g6RAlOEe7FDoMSR/ZKhuhSgJ7WMhGwyQ1VWTSlrgW4zmNTMRm2E3r+8tRGpbnT
 Xt82ttAR5ugay/D6zzyHzxHHz4XO+JPGzf4JJoEBTW6OpU7Lt5WN0iuer9g6G4zi+14CeK7gAA
 AA=
X-Change-ID: 20250831-mtd-validate-ooboffs-e35c796540fe
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_072447_682103_ED044A42 
X-CRM114-Status: GOOD (  23.37  )
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

Using an OOB offset past end of the available OOB data is invalid,
irregardless of whether the 'ooblen' is set in the ops or not. Move
the relevant check out from the if statement to always verify that.

The 'oobtest' module executes four tests to verify how reading/writing
OOB data past end of the devices is handled. It expects errors in case
of these tests, but this expectation fails in the last two tests on
MTD devices, which have no OOB bytes available.

This is indicated in the test output like the following:

    [  212.059416] mtd_oobtest: attempting to write past end of device
    [  212.060379] mtd_oobtest: an error is expected...
    [  212.066353] mtd_oobtest: error: wrote past end of device
    [  212.071142] mtd_oobtest: attempting to read past end of device
    [  212.076507] mtd_oobtest: an error is expected...
    [  212.082080] mtd_oobtest: error: read past end of device
    ...
    [  212.330508] mtd_oobtest: finished with 2 errors

For reference, here is the corresponding code from the oobtest module:

    /* Attempt to write off end of device */
    ops.mode      = MTD_OPS_AUTO_OOB;
    ops.len       = 0;
    ops.retlen    = 0;
    ops.ooblen    = mtd->oobavail;
    ops.oobretlen = 0;
    ops.ooboffs   = 1;
    ops.datbuf    = NULL;
    ops.oobbuf    = writebuf;
    pr_info("attempting to write past end of device\n");
    pr_info("an error is expected...\n");
    err = mtd_write_oob(mtd, mtd->size - mtd->writesize, &ops);
    if (err) {
            pr_info("error occurred as expected\n");
    } else {
            pr_err("error: wrote past end of device\n");
            errcnt += 1;
    }

As it can be seen, the code sets 'ooboffs' to 1, and 'ooblen' to
mtd->oobavail which is zero in our case.

Since the mtd_check_oob_ops() function only verifies 'ooboffs' if 'ooblen'
is not zero, the 'ooboffs' value does not gets validated and the function
returns success whereas it should fail.

After the change, the oobtest module will bail out early with an error if
there are no OOB bytes available on the MDT device under test:

    # cat /sys/class/mtd/mtd0/oobavail
    0
    # insmod mtd_test; insmod mtd_oobtest dev=0
    [  943.606228]
    [  943.606259] =================================================
    [  943.606784] mtd_oobtest: MTD device: 0
    [  943.612660] mtd_oobtest: MTD device size 524288, eraseblock size 131072, page size 2048, count of eraseblocks 4, pages per eraseblock 64, OOB size 128
    [  943.616091] mtd_test: scanning for bad eraseblocks
    [  943.629571] mtd_test: scanned 4 eraseblocks, 0 are bad
    [  943.634313] mtd_oobtest: test 1 of 5
    [  943.653402] mtd_oobtest: writing OOBs of whole device
    [  943.653424] mtd_oobtest: error: writeoob failed at 0x0
    [  943.657419] mtd_oobtest: error: use_len 0, use_offset 0
    [  943.662493] mtd_oobtest: error -22 occurred
    [  943.667574] =================================================

This behaviour is more accurate than the current one where most tests
are indicating successful writing of OOB data even that in fact nothing
gets written into the device, which is quite misleading.

Cc: stable@vger.kernel.org
Fixes: 5cdd929da53d ("mtd: Add sanity checks in mtd_write/read_oob()")
Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add Reviewed-by tag from Daniel
  - add stable and Fixes tags
  - Link to v1: https://lore.kernel.org/r/20250831-mtd-validate-ooboffs-v1-1-d3fdce7a8698@gmail.com
---
 drivers/mtd/mtdcore.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5ba9a741f5ac3c297ae21329c2827baf5dc471f0..9a3c9f163219bcb9fde66839f228fd8d38310f2d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1590,12 +1590,12 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
 	if (offs < 0 || offs + ops->len > mtd->size)
 		return -EINVAL;
 
+	if (ops->ooboffs >= mtd_oobavail(mtd, ops))
+		return -EINVAL;
+
 	if (ops->ooblen) {
 		size_t maxooblen;
 
-		if (ops->ooboffs >= mtd_oobavail(mtd, ops))
-			return -EINVAL;
-
 		maxooblen = ((size_t)(mtd_div_by_ws(mtd->size, mtd) -
 				      mtd_div_by_ws(offs, mtd)) *
 			     mtd_oobavail(mtd, ops)) - ops->ooboffs;

---
base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
change-id: 20250831-mtd-validate-ooboffs-e35c796540fe

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
