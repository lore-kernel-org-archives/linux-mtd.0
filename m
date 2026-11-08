Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6212D606D809
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SI8yP5Uz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cssmb05R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=z5AhFb99K8pgpAFYv0KNZAxFXrMCWC41GdTPef33wPA=; b=SI8yP5Uz5YKrromaMJiy9Syllg
	nem2MqnNPo0b7qPrY2Cy5TcCp6lbGjYPAXjx/X8566OIYDjc+l304crmNIhF//XaH3by5WxqBcmQw
	owdVVRNC6fTiWYj0nwXrz/ABvTH7pVVCvzxQOyqJ0tx3ztb+4k3rff9G1kp3xiGlJbrswFF5pCXaH
	+DAf0jFlFitRa8J5uynPXpjChHptBuCWtEXo7CzpfKxhV0/ZErgINvRiZ5sGKqhUVyeVV9e2tiuwX
	6IPQnqibTKfCgrn9+vA6JhD+IMd1mUEkd/3qu8+wGQG2lb7PzxJ8WBW4b5aAnc8wBj+shnvJkgIjw
	f2yOKbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBRs-0000000GpIH-3SHb;
	Sun, 08 Nov 2026 22:33:16 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBRp-0000000GpHq-31Ep
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:33:15 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso128468fac.2
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177192; x=1794781992; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PkdH+wEUMUSeDLAeSoZy2bnkjMkJXd9IxOdgSs+yng8=;
        b=cssmb05RNNcWnlVIDkbh3WNP5bYT3uVQ+m+ndO+2r9S9cOCgBCvVzgXAOApn51Y+2v
         kvxuGjSfESmF5ju8IuuXdoHh/1+2I6ZzmkdRefLtrjPP05OnqafguFCoQvoK40EJ8XxZ
         NyCN7oOST0zaA2kgSE7Qp7wWV4PFKqa/vPSx8BdHJmqAf+4g3FnjTjRFKhPivn3OkgFf
         A4AdqyUggDZb3/I6uMFzhVZD8PA9Z8ipLDhWC8NjSDLmg+9fyHxetzDorV1Tx3QO3D/Y
         v4mCwvWf/yHRXs/e/WvsN26xeoYVp+Gb/Tr3T45reb/4wzkT2DoLnhQdyFx+MzOC/Y/B
         7j2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177192; x=1794781992;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PkdH+wEUMUSeDLAeSoZy2bnkjMkJXd9IxOdgSs+yng8=;
        b=k2G9pK3XaAliOjr19VIhmwPIJWkQbNQwhtVuXRlHF1fx17v6UDfIptfE43lv3yh2W8
         Htj/paifcOrGq/HHspJE/ZA3AfdGxbII//NZWFUrD9H59+RDpdiK3fiTNb4hfRrlVXXI
         3aMG+lzk7zvLJpTyo6DwkXtot6eACq3gEf/bRJ2X/s34i9STJIV/PZY6VTKiZqeIljJP
         pbzzaCG0tCSHCyiQ1VfQxLBWGtN84bOxipXIRNm2KRa+XXWIsMkY+FoG6KuZQBFM59m7
         65v1436ND9LlSVwoLIqvHYdsDsz6wXHEooQE6iE/BfYX5Sy1Ot/KjmyisLR8nWjit3xg
         FHHQ==
X-Gm-Message-State: APuU4Z8r2toB0vsqcFmgTwMo9UjMyukOff4PkXlV72iE/aenwspOIVn/
	6wK9AoT3xiWZVsdEo3HLhV/Ypq1RYmCac59P8f4g4Xv/dPTgn9HI5MWk
X-Gm-Gg: AYBFou0rRzqHrW+gijiy/Nvwtrkuvc1fvJuVofg+7MizXZJpgl0OoNrTu8E1fHrhWG9
	PWSZWzLvGreVx27BOaoXEA4bQ7HMhzHeqWh5aP+1gffGt/PbUm8p08a2brQcLikgoJo4pN22v/7
	QpnLr70sc+ewZnEzRg2MZ9ACf7+1F8iKRsrmJDb8LBZ9eljNqtubEGEiB4rlhe259tGw4CJEGb5
	xTn7dY6vBFXDMxhZFkz/N3+9kTlK4mULyFw+we4TK6B1ZfIQleTr8AmCVHqVBl8/Y0jWYwsZWui
	hbnpE+LS7KT8KQxPTEZ+Y1dluKeLN3pm4kXfvEEui1qPJTVpJ2TqJafpUXFs7QSg5Di79uDWiwa
	qXXNy66CNdPgCAbnVTNGwX042F+NQTWD6tnQpcR5t9rtE4d+M33z2umP3bM7Lq6p0wesqujU5MD
	NpT3TQy8Y1vqowS9ITJfmiIU9+5UkvnahhqQTqdjPo/cdR9NtDdzRChTLticKM5hrpDromL+Ucf
	vnpYg6hkndDL9QkOKQmtgp70vGf3Q5saupCf/UtIFWwc6Jn0/4CZpU1TlHIIe6JvHNi85PTU9Ww
	LtzguzZF66dYZcqbrky5jGJbnQxyIIl/JpXqbmMgcPn0mVY+UEQiMG0rLcsdzStbMP9i0sYCa5J
	KS2UmkXfk98Js3mesaNmiZMfVIfMli9vRvleqQBIyTnDuH/doGtB85eo8sjJHljh+GepChsgcmg
	ICkL2ptJz/6PJadUGO8m765gWVmtU37DyinBNNPE9DEhtBWlz2Zps=
X-Received: by 2002:a05:6870:a414:b0:48f:e3f5:c41c with SMTP id 586e51a60fabf-4adecbf500fmr1245207fac.61.1794177192413;
        Sun, 08 Nov 2026 14:33:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a326fdsm3563668fac.17.2026.11.08.14.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:33:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:33:04 -0700
Subject: [PATCH] mtd: rawnand: macronix: preserve OTP operation errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-macronix-otp-errors-v1-v1-1-8f64a2ad5a10@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqDMAyF4VeRXC/MKsxurzK8qG2cGZhK2okgv
 vvqdhP4w+HbIZEyJXhUOyitnDhKCXOpwE9OXoQcSkNTNzdjaovpM8yccXZeo/CGMS9IqlETrgb
 r0badbe+m8wGKsSiNvP38Z//vArzJ5xM9F4NLhIM68dP5mnO4ipNyaMtwHF+SDBugoQAAAA==
X-Change-ID: 20261108-submit-macronix-otp-errors-v1-0f83783917cd
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_143313_807658_12C0B206 
X-CRM114-Status: GOOD (  11.63  )
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

The OTP read/write helper replaces the result of enabling OTP mode or
transferring data with the result of disabling OTP mode. Successful cleanup
therefore hides an earlier failure. The read wrapper can report an empty
transfer instead of the error, while the write wrapper converts it to
-ENOSPC because no bytes were reported.

Keep the operation result and the cleanup result separately. Return the
original error when an operation fails, or the cleanup error when the
operation succeeded. Still attempt to disable OTP mode after an enable
failure, since the failed command may already have changed the device.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204080@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_macronix.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..16847f28b19d 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -377,7 +377,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	size_t bytes_handled;
 	off_t offs_in_page;
 	u64 page;
-	int ret;
+	int ret, cleanup_ret;
 
 	nand = mtd_to_nand(mtd);
 	nand_select_target(nand, 0);
@@ -420,14 +420,14 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	if (ret)
 		dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", ret);
 
-	ret = macronix_30lfxg18ac_otp_disable(nand);
-	if (ret)
+	cleanup_ret = macronix_30lfxg18ac_otp_disable(nand);
+	if (cleanup_ret)
 		dev_err(&mtd->dev, "failed to leave OTP mode after %s\n",
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
 
-	return ret;
+	return ret ? ret : cleanup_ret;
 }
 
 static int macronix_30lfxg18ac_write_otp(struct mtd_info *mtd, loff_t to,

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-macronix-otp-errors-v1-0f83783917cd

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
