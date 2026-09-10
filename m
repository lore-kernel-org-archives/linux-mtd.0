Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF80C79F9F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKlhWArQ/kD3E/0HDSDVHDy6EDmobccIeQvQKL6vUsY=; b=tbKWuUhDF6643r
	JgfphFSV5vq7HSjZjpfzi0Fb7TleDlw1a92ibBJCaLEPEx/AjmciMKm17kW2CVD7JC+Ene7yf4UDy
	cs/c94GPYHWFNLvecLIRagQI7eta5Dg/GuusyTWW1vHWGGLwjaS4bQS2BacUnt/5Of5RV4usFeHwS
	KVo0d+mQZ5MH51xK6UBsIFeNWhqbU+4NBfi82GtEh3bTEDQdnr8mCqg5CDS1rpR/rnmWUCgNQcef3
	jQaphp43L5Mi/E9fjZYt2DIuaSToY9JIjzglXXvTv0eRANe41Mj5SC61NcwUHmtGcQiYmHvbI/EH1
	MpCFydLOWpPOwT9s6PAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jmO-0000000FB5R-1Eza;
	Thu, 10 Sep 2026 18:45:48 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jmL-0000000FB4C-3Pow
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 18:45:47 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843af75de5so4235f8f.3
        for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2026 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065944; x=1789670744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYKvuY+VqGTbeddLCjHS1PA1XfFdTZPu7ob+AkuwS84=;
        b=G3I8IgnRfh46OTpSTfJNSvf9RDFGHxBIPxtIuwaVi+7QUfFAa8HbM1Lb4pX1OB1LPP
         SHBa8Sm0qiO8nFApid10Ou8tWSklc8psp/ToJJYvhgClMauCqqBnIZdRkjf+PLMJtJSs
         Vb4YddzhUu9CIKdgYu/hbOAfRCa+62MA+6nf78BJBVdFR+PxuDD8qmOcJOCG0Ee3JQsj
         jOwsdunRn2d50rx7lXsVO1gXM8e/z9P7WeFalaHTgnyRPBghrn158jDAKrE0aL1zoBJk
         S2B8K0twlA5+ESAXn8xsI5UVjQwixuDb4Lo84it67QZ/VHEaJxKuNzVxuMlnVsiwXM6+
         ZC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065944; x=1789670744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYKvuY+VqGTbeddLCjHS1PA1XfFdTZPu7ob+AkuwS84=;
        b=sTnL7sJ+t2zSeFBFxBIsrSadmY9AglvbUnT34AxAJJZVq9bd793ffFiLoMM9wzk308
         fwsrxkk/IJsTfCsrbpJ4INbBb2fo7uG17XRQyLvxAdhA6rYdV3kys4diyBwfUVclW18i
         ayAxyXBgGYdoTN7tH1bd+tD2rDGag2H9BCqlwsz5UrgnTLZv4ahMNrV02apAVlYEzXvV
         guA0KV66qrW7bpuf54TIG7RaQeobqsS+7fVZ6NZbr/ac1t3cBugFzqcnreznFt9iOue4
         gtuBLh1PFSu5yzzrYpRIAayn5k6wqdm1Acr2Lwl+QY2CekCp6pT5mMuBWh2wFoPOR6pY
         iqRg==
X-Forwarded-Encrypted: i=1; AKwUvBz5H7nEqMVckm6asbPA3j490oXVDXs3opcVgbjwDUJAJIOHCUWxQzFVI1fo8tLepWxNZ2a+VxhD5As=@lists.infradead.org
X-Gm-Message-State: AFuF++lW8tziI6SAbkEO75IG+XYtZC0OqXljMfCqHQtv8hwEyse5B0vi
	cWxKClW/FdR8I8rWS9nmf6HspVocgVhgwEZkTACoRvDBMf4lSGgORWJf
X-Gm-Gg: AYBFou3SldG+N+1VhIFLZnoaSwIHSduWw1XlKOGcejjF2dLM3it4OqpvKpM1MzeHUP0
	GMEeuD2twBTXoL6yeUxwZ9Otx+EBYxJ4AJS22q72prZ5/8E4Uz/KOG6KyPPavMa7+BlBdtmgsfY
	9693qUhQ8bYL/NX2BfY7zvKbH+w+Y/BsKiGyVDPy0i5VTaJ5liCI/dZsNXxuIM7jNN5mN37SIsb
	6mzQQLtQCC6H3lvUsVwKhEY1llPgLOSEp810hmzdSORiFP2AqUOY3bF5EZ2b+Sr4yliAxqP3Wdu
	iEbwucUj2ugeU/+0MxPPDtu6eFDZKaPcnI+Wg/5xJoyu1TFOLgqIQ9AP9EqVJec98gpTrljaA/P
	Fwffur5z2zoMNGAVs3aATPX72RsRb+zuNBqSO8brmCOpucqozIXUJrJwp+KIMSHfX5vDUpyQrwZ
	kRUgZZ7INYTGp9ZBwAS6W47l5yt17ladz9XCxCuKsZ8C9kgNBmWtnWTfqX5G0zYYaUUzQEbb6+l
	05x0GctdIJ294JCGjw=
X-Received: by 2002:a05:600c:4688:b0:49c:cbf4:572b with SMTP id 5b1f17b1804b1-49e619ec129mr3232775e9.2.1789065943543;
        Thu, 10 Sep 2026 11:45:43 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm18760055e9.14.2026.09.10.11.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:45:43 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mtd: spi-nor: take the flash lock in spi_nor_shutdown()
Date: Thu, 10 Sep 2026 21:44:51 +0300
Message-Id: <20260910184452.895485-2-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910184452.895485-1-itai.handler@gmail.com>
References: <20260910184452.895485-1-itai.handler@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_114545_878279_BE6470A1 
X-CRM114-Status: GOOD (  19.55  )
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

spi_nor_shutdown() calls spi_nor_restore() to put the flash back into
3-byte addressing before the system reboots or kexecs. It does so
without taking nor->lock, which every other path that talks to the chip
acquires through spi_nor_prep_and_lock().

device_shutdown() does not freeze userspace and does not stop kernel
threads; it walks the device list calling ->shutdown with all CPUs
online. Another thread can therefore be in the middle of an operation,
with the restore running concurrently with it. A write and a read are
both damaged, in different ways.

A program or erase leaves the flash busy, and a busy flash accepts only
status register reads and ignores everything else, including the EX4B
that spi_nor_restore() sends. Neither spi_nor_write_enable() nor
spi_nor_set_4byte_addr_mode() reads anything back, so the restore
reports success while the flash is left in 4-byte addressing. The next
boot stage then addresses it with 3 bytes and reads the wrong data,
which is the failure commit 59b356ffd0b0 ("mtd: m25p80: restore the
status of SPI flash when exiting") introduced this restore to prevent.

A read, by contrast, does not ignore the restore - it is corrupted by
it. spi_nor_read() holds the lock across a loop that issues one
spi_nor_read_data() per chunk, each using nor->addr_nbytes.
spi_nor_set_4byte_addr_mode() updates nor->params->addr_nbytes and not
nor->addr_nbytes, so a restore landing between two chunks switches the
chip to 3-byte addressing while the driver carries on sending 4 address
bytes. The rest of the transfer is addressed wrongly and returns wrong
data, and nothing reports an error. A restore may also soft reset the
chip in the middle of that same read.

Take nor->lock for the restore, so it runs between operations instead of
during one: a program or erase has finished waiting on the chip, and a
read has issued its last chunk. This is a locking fix rather than a
missing wait - each operation already waits for completion at the site
that started it.

This narrows the race without closing it. The restore still runs while
MTD users are attached, so an operation that starts after it has
completed will address a chip that is now in 3-byte mode while
nor->addr_nbytes is still 4. Closing that as well would mean having MTD
stop accepting operations before ->shutdown runs, which is a larger
change; serialising against the operations already in flight is what
keeps the restore itself from being issued into a busy chip.

Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
Cc: stable@vger.kernel.org
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
 drivers/mtd/spi-nor/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..96dd6ae6d619 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3862,8 +3862,21 @@ static int spi_nor_remove(struct spi_mem *spimem)
 static void spi_nor_shutdown(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+	int ret;
+
+	/*
+	 * Wait for an operation started by another thread to finish.
+	 * device_shutdown() runs with MTD users still active: a busy flash
+	 * ignores the commands spi_nor_restore() issues, leaving it in
+	 * 4-byte address mode, and a restore landing mid-read changes the
+	 * chip's address width under the transfer.
+	 */
+	ret = spi_nor_prep_and_lock(nor);
+	if (ret)
+		return;
 
 	spi_nor_restore(nor);
+	spi_nor_unlock_and_unprep(nor);
 }
 
 /*

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
