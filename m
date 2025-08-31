Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE379CA0FF2
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Aug 2025 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vx/r40KMxBZ+klqZ+gmyzOJ+Fnhn69KidXhW2aIaSk0=; b=NqB+4JI9G9xgWr
	HTpuL5ykHt0gtX8PvUQvWl495b1yzvpto9kD2Unu0id2GeLkhVGTXPAOP8FyfZx4R8dEeWOLt7chd
	PDVfUv3XQDoUTqHvjaz9ACI9xl3kKkFkJVAGJgiyoBAgTTVRtX2dGj9qUxWxTtxPPM9JmzD5BVDsw
	KWgRoa8dURmIPl5bA6X4lJwKBYJCARF+AUMWPlPt2P478zNKa1EhIJf5gHtMx0gQcSrDskX4fWopa
	iV4TxrNKuLfUCvvmQTXkoOAbVNDqeg1NXM9ILdXa5cEmrfq5dGa89h95n2X5zBu8bcXuaTu9ufYCc
	86JlUMdvfjskXuH+4oOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjEG-0000000AI3u-19Vj;
	Sun, 31 Aug 2025 14:40:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjEC-0000000AI3R-2ZlE
	for linux-mtd@lists.infradead.org;
	Sun, 31 Aug 2025 14:40:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b87a13242so7283455e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 31 Aug 2025 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756651219; x=1757256019; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uK+63tF9hV8oMnf210yJC1/tTQmsNNUHWIDHsThjdw=;
        b=ZWjtDozenXyuGD5qP4B8X6DceopXRqdtgJZ7g46oQVa/TgL0/JxGYSTanNQHjI6A32
         TiU5ApReAuwJDfn2JYemFUmAf2sS6AZvODZrfl72lujKB9UUldYqekQg/GwbmMK5IsRX
         3DaaQNs2QL5bo1pWm9aBr8qhO4CV31jamI8y4G9CTllnDB1N699h7lwMFjWAMdPHskpr
         1/T3Ouy4Rg2H9ERnMTKkZoq8C2G4J0pjjCHc+GA4yZ2FsOrgc6ha/HdhWUfjSWNS1vBY
         PrHlVMWud0RDC6D6RXFLTJf9MD/S+II6xGu2fZTKTzpBAXHKJhYNP4+mbzMfPsvcLwqN
         yeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756651219; x=1757256019;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uK+63tF9hV8oMnf210yJC1/tTQmsNNUHWIDHsThjdw=;
        b=ILVXKPb543s7Vc0ZeQQ1WKOaaynMbN/VdSvyY9MGMaQHvV+d3uZNkVQ1gFk+ggim3Y
         Jw6DXIjCFelBxtrC15sAmdAHoLwTVHz0pVjby4YBzW/c/V5+EJJ+hdEzLidCiRASEPuY
         3JScSh2tR3FxQ7joAhD/Ba9tWAhTU5a2aHK1SdueqUJr9su6E1BN2nJahbYEJTzwQN1N
         fDpCzablkiL0sKMsd9m40+TodE33YIDjHtYRmbxMnVUo35HSaZki358bDxkKf9f04Q9a
         LEYchnyBl6lSbVIZYD3sBdgap3XRMUZo1BRwW9dbbG3i0SXjcNHQrEMFh7ZVsSjm1eHY
         yZ7Q==
X-Gm-Message-State: AOJu0Yw4KIlqepM+wpFAWnBoDYy8IJEQj5R+xxeSkCp2EXGDHWmGGPW4
	yr9gWpUBeVUYoZpR4tfNEgPAKfos+GN4OnW6mcwUxWI7N57+JlZNKDaZEi1jMA==
X-Gm-Gg: ASbGncsXRWgslO3Cc51CTQSx9oNmm6mUlwubxiAbmNOI5RJdhmRApRnsO+nsH72xIqD
	BvXpAbTw9fcmOfTGUghQkq8VkOyWOrVfDnFzlA7NIc1K3qC6IRvQVCdpxS+hy59IUEgHZ2UxmdW
	8769mZ4jzmhBiUpYF4ud8H3n5FXsgm8O8Ug1R0jC7PYp4g2D60WGP7JNEllRH++rc3V4+Z6QEae
	Rzrsf2G+h16YCE55/ZWRfKdwAR3JgBFVRsF+DDWnGgoiugyPxXTXqexjLu9wjPdfqYuNP1X7rhe
	EUK7DWEOu6tK4PVIrH3KFLj70zp0T40B6JmXnXdE2ZytWJDwHezAwft7KDU14AYkLZ9kAlwbknT
	n/04eyiR4hPfzs2yXvBe99AQvoK7aN5j/RJ+8AjmIITpl0qoxpXA=
X-Google-Smtp-Source: AGHT+IGmNiaoVhPlVK76Q0iZFW2fo2EpnrQ5R1q8cpqr1ZXwl1vz3jEJqjp7fRgR1H1I05IorYswug==
X-Received: by 2002:a05:600c:3b84:b0:45b:89ef:65ae with SMTP id 5b1f17b1804b1-45b89ef6623mr24158065e9.16.1756651218368;
        Sun, 31 Aug 2025 07:40:18 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e92a42asm115956885e9.20.2025.08.31.07.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 07:40:17 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 31 Aug 2025 16:40:10 +0200
Subject: [PATCH] mtd: core: always verify OOB offset in mtd_check_oob_ops()
MIME-Version: 1.0
Message-Id: <20250831-mtd-validate-ooboffs-v1-1-d3fdce7a8698@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMletGgC/x3MTQqAIBBA4avErBvQyv6uEi0sxxqoDI0IwrsnL
 b/Fey8E8kwB+uwFTzcHdkeCzDOYV30shGySoRCFEm0pcb8M3npjoy9C5yZnbUAq1dx0taqEJUj
 p6cny82+HMcYPBDu9T2YAAAA=
X-Change-ID: 20250831-mtd-validate-ooboffs-e35c796540fe
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_074020_668459_344DC2BD 
X-CRM114-Status: GOOD (  21.18  )
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

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
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
