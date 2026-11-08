Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64F606A332
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pd6u5SGz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b4ZV31Hh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bp9+w6aqShFRyJIQEuAK+EDSRPKjCGJBfKO8w2bTyn4=; b=Pd6u5SGzyU+ysrOgHlfuDD3y6h
	LrzUZvNv59DKimNXtGpB0tzHZ6hUdGm5L1+4kh0IryPlsSEZZInqm7gW2aBD3Tikid6BzTmzrDE8j
	Zj30KMmYT+6h+U8dOPhmSsm9KrMzShicxpcaiGGR6kK3Pun844VWzyJ++KtpLjDnaQF/BrFGpYBH7
	5T7Z7hJN71MGEmn0Q52n+7UcSr7H0nQisg8Gd6p4Fakcn/DGV4XJoq/Ff7RVcV1qanRlYIRWt7ks2
	mWhJfPh+XzW//AG0c6Q4OPxO8fcdN8b6EOUZlhy+7fg3zz8xu4tApu8viipdKjFthxsZHcLDdNBi+
	/OYNlSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAMo-0000000Gi8u-2muC;
	Sun, 08 Nov 2026 21:23:58 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAMm-0000000Gi7G-1EXz
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:23:57 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6dd7070699eso162152eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173035; x=1794777835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V99b1R97qH/1vch1IDRgvyZu2Doy5l4KvwZ7hr979kc=;
        b=b4ZV31HhoHLTDpJNSSmQNMWOznq04kC9crE3oE3S5BVntQE3ofXIafA89JjZSzFoGb
         Zb/937jNDOPJiUBbST7BVrLKtAgzg86IZ81eyv+9W2AttgtJavAlARLx9jKDnPQhdvpG
         /U2X0NyPGyPEdIqxu+Es30NlEESe8Y0cfwVo1g5rCOx+46NhiYmwfGav+E+5IUsipxf9
         8kGdPNqTqgg2Gx2gjfeLr3DiYbGdFP52/zfyMS0iu1FkWCLTG1OTtqhZ1NmkAmDgER2x
         Hg9WPkUAEjR/VgLvbibBNFDFcBNcbm/Liap2e6hznK0zxjFMSd7JEQd/RsRsVVOVnFUW
         hXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173035; x=1794777835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V99b1R97qH/1vch1IDRgvyZu2Doy5l4KvwZ7hr979kc=;
        b=NrcW+xdER5PA3JEfqc7GU5IjoQgNpBJwi85ixzAjU35Mp7Kmdr+gsGH+8i8ImKU2oM
         jQdZ5gvpzUtBZbr9C+rCa143T081Oj+RlMTLlTCx8EWiJSAIxn5niOgBJ+iNuZ74YCeY
         D1BDlxvU2YVRe6NMVeJYI/Kd4cquvmWN+ijsVn1K0in2emg9WoPbskD5K3Tk1Nr9nJKA
         UEfz2Ip00mgzH06msE0ORNqvobZdRafLc11WNS/0YDKvLlHjk4ihhoSel8QmOYk8rmj6
         bK203SbEISnmtdovp2MluXw/IeExcrgztqjYP5N3La/xstxnblw1n5O7fN+BGW+HbKP2
         OWIA==
X-Gm-Message-State: APuU4Z/MF7H4bmFY/axEOfthcIrQgH7DTLqgWLZJuLBw6gsO1HJtPfic
	VBMHz6y/SFiMfJytZGE7vJKDWL9g6XyINu9hgVbt3R4VZbLTBAZhzI4G
X-Gm-Gg: AYBFou3x+TnNZvknXBVmhtsGPj8GDyyBw8iO4Dvk9Fvkfjrv29NJ8DlWHQWG/5EE0b9
	qSVw1c5uKgGpUvCLXQSBN/VAPz30oXRpCjRndGakZDj4UV2AR/Un1dPuDPAL14CQBvTWvjhny9e
	d+83EUFkI3hF+6D+JWLIltSl/XZX2OJWKEFDC30EUQAw/1UwPMrCY92e8gIf0C0snTs14juq/BU
	xqzrtvAxrl5jF57RVJx96cwoxOgWW0TTbT3A/U7i6tWmLvm+mWBO1mJvrIy/sZRHVgGHDruic1K
	6AK7TklRV7WAZNhW6OYfk/ul4LXsOA7X3/eA0YtC/3bVhOttWLCf7jAQJ3zvJIo3j8dQhtBkvT5
	kyON4J2a/uhZTdWedYLxVuPAzv/bzda/bI+uxzLzLVb1uMTptA6hxIukzsZpLVNCaFARJpr8lJY
	0WLEp5beXcPgbpyJCShrhXBgWclhQyIrVJZ/cpFgozUSmoewf+lDeg7yrQy/SpvepO/1c2jqfvO
	JpH0uq+lXIAEUDpEsJRBnC55oLJtH9RBlu8bPDb8QY4XBv0HPM67yv4lQCBuYq/4jk/K1sMePIc
	duolwqRFVrVbRQ8+eYOpc0S8CZocHwBUSta4twHzcGTtDaXIvve4plwPbF5p6QrMt2Eyqn2RD8U
	MDSOqbzu5tq2HNwIDblRTD+aJ1LTjFstP7zgr9qeoCX6bnCtcW/937t6iuk6y0qnoDtR0J4WLbE
	pGuECHz1ns9zAWr1XnKAUhaf2zezpNqDUCnnX/+OxseXdbZ18mPUk=
X-Received: by 2002:a05:6820:570a:10b0:702:f7c2:1937 with SMTP id 006d021491bc7-7170f35c361mr769608eaf.83.1794173035037;
        Sun, 08 Nov 2026 13:23:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1908138eaf.12.2026.11.08.13.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:23:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:23:22 -0700
Subject: [PATCH 1/2] mtd: rawnand: macronix: serialize OTP access with NAND
 operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-rawnand-operation-locking-v1-v1-1-565010fc5f8b@gmail.com>
References: <20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com>
In-Reply-To: <20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_132356_352205_D78101A9 
X-CRM114-Status: GOOD (  15.08  )
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

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. Normal NAND I/O
can interleave with these commands, use a different target or access
pages while OTP mode is enabled. OTP I/O can also run while the chip
is suspended.

Make the existing NAND serialization helpers available within the raw
NAND core and hold them across the entire OTP transaction, including
restoring normal mode and deselecting the target. This uses the same
lock ordering and suspend handling as normal NAND I/O.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Cc: stable@vger.kernel.org
Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..2668f527e637 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+void nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a5b278ab9384..f125c529c62d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static void nand_get_device(struct nand_chip *chip)
+void nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..4fe7036ae992 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
+	nand_get_device(nand);
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +427,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret;
 }

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
