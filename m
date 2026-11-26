Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0473606A31E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 20:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dpXnNOaK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NHZCsJPm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RVwcCtkbZuJQi9286uZSMVsLXC2ZqYCkqnhla2pRX1I=; b=dpXnNOaKMmPUWnEJA7lls9jIyE
	jrS7DiQv/fPMeSsiX54sY2w2REpNXgBOsIbUQWuQkJtXsTTLlW0PkzYPm8c2ACpKyna0kBaqiB8xv
	x+Ht3nAl2NYYYGjvVGBR6VGF9kR/uhQR1n3lw8xmF9tCrCXgRqt5kbTV8KtgJojFKHA3+xssGVebD
	ObrVdoiNBEwNEmQdoU9ynXOXGiGhlVi9rxssVllwwicSWwPnrOjwy6NO+uA5pfeaqbGDPvd1TZhtp
	fdD32IuHjqFlhMzrABImypcdztAZfeOqyWMUvHIAoLwbpPE6rUdinVj0qrk4tk45YT5DIlgyQgkAJ
	2BvHGoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfiS-0000000EQec-018c;
	Thu, 26 Nov 2026 20:05:12 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfiO-0000000EQdV-3ixW
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 20:05:10 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4b0348a4c79so5107937fac.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 12:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795723508; x=1796328308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RoDpXKihy0m0eE8eaR3PRpGL9mwDqhVFzBp2hDW0qA=;
        b=NHZCsJPmfsH9iVfv2F3n9dtA2cbme+sLKCezU/1Ta3tEUCgCaY04K/l698r7I/6R0H
         bNNDtRhTAqq7CQrduIuwUgP6GAICzwNKOw4pXyi5p4r9pezJ8oBgJ/dHchj7ORecFX4z
         V6SPkIQTCM9f35Ge9o6e9U/J4c1zI5udiLsrgeIvbahvAohro96N2KCHGM+rBaXS0FdV
         axo2oYo7dDFrkEqIyDga+jSRuL2Y70i9ALevE5LcBIAXTYR/ACIThBEVFbPHZF4yil73
         ZVDDi7tT0mNT4fqeixbGAY/2gV8Lxfzg8ysG51p+cRqj32YXPHWVSPvWkbx28iHKjdAX
         8JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723508; x=1796328308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RoDpXKihy0m0eE8eaR3PRpGL9mwDqhVFzBp2hDW0qA=;
        b=seRxV8drsKhGlYNfrDfGjf5suyJfTrbKhwzGIovsgt0WE0/EpNXZlzSERyVEFKwXgP
         K+n9t8m48aGNbhDTyH8LUje4PaG3tf1jrceluTAVRJMeLl67I+xVh55vfeWcSTMoTyOM
         4/4SLkKWIMwqO8XCOPjiJO1UIAYIhl3I2Acz+6Dj0nLQxETEFHfTlN/FD0MMigZ7DwFY
         KzPherHkiOdn6KcW7reTiDCwa7jbDlGJ5Ua8KLfXrKpVNvt1GTHt0N3cC75j1nQMvfSC
         /SK4OuWJNgDfXo5vCI3x/t7flZaX+mFVOGzkkchcmX6+EfUYf8a69GH8ngm/ZIvu2Z4E
         nJJQ==
X-Gm-Message-State: APuU4Z/CueZVgOgMxG8x8CULxp3Qylr3lskNfXm2X+cCzf4Pf7A4me+g
	+brV/z/Okep0Q69k2hzvKUYh13LQYF2anBdeGsJhRdjb6coe/mb5DiOQ
X-Gm-Gg: AZFdTZc3mPvGvc/otdtnZWUfJWR1laQHfsFD2R7onnfASXgNMT8s8e3ZvAZ8D3Dx5g5
	RATbJp/V4DvxQRiSBDdou+R9+OgHSeEUVP7NjVvUW1ZxmzFrm/qbClMqyZ2QlUlcoskiSKaHd3V
	hioCpFr7T43b7FsSBcsNzmZ5akVQd1XAlvMtWWhH+v35IUMddqYpg1IQEtp7ZZnEgaxn4UHi+TQ
	oIicUob37LBiPSLv6v+0aoj/lri3lmdXq7Zdtykx0KXJCFJl/8GnIQRS40pEuhBog58rbO7KQ3h
	ZFAfOW3xJHLJvyHkYYk8uJ5//whQa4yxyZ1mbrL5m6DIoXXfQV+ohk6cAGq50m0V61yExdTpkez
	u5SC5UdheOjLP3XwEq2+8fWMCsfZHUkc0E8qBN0KBXKxorzvA4WFqdyBrnTl7B5A6ZUQgJXkGFi
	X+7Nwps/DN78pVTsm3baHeOOnlvxZjRcF/GYqYkifieLjCQ5lvaGl/Bquqtq/4pO/FHsDwvQ/7p
	ZBMH/dK+S3Yr7wVfApomw93ztcNGU1HfeE+BNxAKUwjn/DpbmBWeIMqGPl3Dnk62yjtc0JhVMLg
	IeFEWUdLv3++W3rvyXDGW6McFbYy1790MJnVe1tcPHIeBzHxatoJgSZBqpeBsm9Tzgkv5Y3AfOw
	diQddCgPpd7OvlmbawIO2Bukd6qb1J4LaBXYhXO+t2NWf20GCcNnEHl/pqYZ/+hw5Ljg4Xtf7Hk
	AVezUUJ2dpOE0f4+ipp1w+X6LsOmJ7w9hgemzBsl8PxQIr5pnE/gzb
X-Received: by 2002:a05:6870:b88:b0:4a7:4c99:8d96 with SMTP id 586e51a60fabf-4bc7beaefd6mr20170070fac.2.1795723507852;
        Thu, 26 Nov 2026 12:05:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fc97bb2sm19548249fac.9.2026.11.26.12.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:05:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Nov 2026 13:04:52 -0700
Subject: [PATCH v3 2/2] mtd: rawnand: serialize bad-block marker writes
 during BBT recovery
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-submit-rawnand-operation-locking-v1-v3-2-cd3794332f23@gmail.com>
References: <20261126-submit-rawnand-operation-locking-v1-v3-0-cd3794332f23@gmail.com>
In-Reply-To: <20261126-submit-rawnand-operation-locking-v1-v3-0-cd3794332f23@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Kyle Roeschley <kyle.roeschley@ni.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_120508_961729_17738303 
X-CRM114-Status: GOOD (  14.14  )
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

When erasing or writing a flash-based BBT fails, write_bbt() marks the
failed block bad before trying another reserved block. The erase and
write helpers release the NAND locks before returning, but
mark_bbt_block_bad() calls nand_markbad_bbm() without acquiring them.

A BBT update triggered by a bad-block marking request can therefore
issue the recovery marker commands concurrently with other NAND I/O or
while the chip is suspended. The chip selection and shared page/OOB
buffers are not protected on this path.

Take the chip and controller locks around the recovery marker write,
as nand_block_markbad_lowlevel() already does for normal marker writes.
Expose the raw NAND lock helpers through the internal header for this
cross-file use.

Fixes: 10ffd570f117 ("mtd: nand_bbt: scan for next free bbt block if writing bbt fails")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h | 2 ++
 drivers/mtd/nand/raw/nand_base.c | 4 ++--
 drivers/mtd/nand/raw/nand_bbt.c  | 2 ++
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
index 5c877e2536e4..886512cf87bc 100644
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
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index a18e10284b9f..a56597dfcea0 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -721,10 +721,12 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 	loff_t to;
 	int res;
 
+	nand_get_device(this);
 	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
 
 	to = (loff_t)block << this->bbt_erase_shift;
 	res = nand_markbad_bbm(this, to);
+	nand_release_device(this);
 	if (res)
 		pr_warn("error %d while marking block %d bad\n",
 			res, block);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
