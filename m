Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4BC606A32F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LQ8bvUYt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCe2deVv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=k0fU+v9keSLnBHIS4wxFNOJ/oUX1Gs76EXcaw8i0hAc=; b=LQ8bvUYt0FuCBprrcb+hwZn9sv
	fffxBV3kMdH8Uww9CgC0u1nRF0vP2gPupocpFY5mcaKIOdl4nxMj7BVAs0K5rUoNhwcLcJ0GZlz4W
	8uv7GdiWpWEwJiEBmVDlF5dMZIFeeIE8tU+nK/iMI0VetTh0yfzLkR/aoxHrhtwKXHijUu8kzJGIC
	1tl7AVDZ4V1OU/XAv/i12XrHRuCLESPP9wbgF2gHrS4T1g4rHMANeVIQ1YHiKBOdqer2+ZTyt1tF8
	nv1K6EEi2TT+Y3Bp5tZvq3ifVb0rR5nRqGqsAdzrsxyU6FcFuWZnJwAhetLW/2Ikv1Qxe9QSuGBfQ
	Tk2sGNDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjC9-00000009jU9-0goF;
	Wed, 18 Nov 2026 17:11:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjC6-00000009jTK-0juh
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:11:39 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so859135e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 09:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795021895; x=1795626695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zWp0jG2juceevuM2YsolFtcRIHWNJWaTOnAlYBFAhC4=;
        b=iCe2deVvQcsGd8fv/qn7bo0iZ55p35GJhUDJZpSi3z5zLW40Wsi+L8aDhJc+sLWZpl
         B1R/UGwUVAHrg0Y8qAvE1kUtSpF74GRITObmYSlkqxIp4EzfMZwwtiL8BKsO/nqm4pFc
         z3gkqqhTG76/TLZPIwwmqBhg7xhbCENzRUu4gFPYh8bpYbCZBXvlZ5bKbGL/CVoFMGUX
         olXs+khVbc/LyE9NeObC6gkCrf7vWiZG5+MpsrjJw051UwDUsPjapqXls6H1Bthp21+9
         7IM0BeEdNMcRnJQ56Z9wjzImAC0ORCnBQ654dwZVV2p9Lf44eeyu9G6Fqd1Nx/qMzV15
         ZLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021895; x=1795626695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWp0jG2juceevuM2YsolFtcRIHWNJWaTOnAlYBFAhC4=;
        b=u7uisbuxwarREdc+oP9Fo7k/j7GpScy58w/gcsYD4Rb3meaS+PWVtZ36gg5Lv19nPl
         bf4JXeZHnfGup2SlK7Y2d5iwHa2iG/G+08wlTw3wEFz6EZWFGVmfGFBxdHY2uRa4BXSb
         mNhmq+fb2V0vTnsKEk2AJiYlKBvuxE35kWZk0YGnN5Y9IVtGpfBiFGtu+qliLuInhYyT
         rOhFoDUjWqXc9zMsGkTwETyA5qZvEHbpTZoaUv1P1bNif1QgLgkoKZO7iAEWT/t2BTQG
         8f6ycWsxIAnoIlob10fgWDSU2BkiixmMNc4thDEc7kIYe602b8LWHCucQmvXoXq6JU8M
         wyNw==
X-Forwarded-Encrypted: i=1; AL+hErGpUyEBy4FZHRcBZ3Q0ozAoJB6SPx56xICCDX+mXUETmj4Saia80aQPYb6zhxsm8DNdHMlktq8gwKU=@lists.infradead.org
X-Gm-Message-State: APuU4Z/JPt4m/UwKiJA06RTeMF7xaCRFFEuca+09Jf8tToL9JbopnCHE
	raJ8tD3TtsmpeeghldKwmgMbI6GQMfKbvk7MTtEIR0IZS6eXvHSIv/P3
X-Gm-Gg: AYBFou3RUEwpW3I9k8GXN2RCkX1uZhqVQwUvWb15Cpve5CBWjBTf6N0e5VUc5MAjc20
	bD/sh80rtu4fiUFZrjTGhHp68O222vReFdhcd9H3xRsOUH5hANPLS+lqrbQZp88b6eoxVDRvQYm
	/uAl4Z9sw7tfrGoib9l88TV9KpFjQB/WtLQM8EsmUNDic1dRMzX1Ao1lYtHdeCxiQfsJpXFlxtn
	i20rd1ZtuMi7YQbNz6QE0pm/lBxBbEV4BBK/rZsvT+f5gpVKfBzTSM7qBnfZBzp8HEba19/mxLv
	gtLHGrqzbuN4jky4On3eiDsEG7q3SISMQaLQib8BHiC1YL9uNbeb0BD2tOhJ/JjSIjHd4a3hC5Y
	oAWaYuuB0RpaTBHqRdup4oXg+usDqSuvWHk3NjffcrZaISf6F5OQ0DgeFMWiQYUWkx0IIB888Lq
	OOc+1TepNDUeveDdEI5C2dVLJL8npTxz3g0RBJTrJGSFCysZ3RAo6DOhTIecn1yGPesTtaAR2cQ
	EkNawRqQ2mS82ZQgrXqIE6RCYeT7PdR+0HLrvFgX45ZyzhhThe35okhCNWFAkLGC6g/JdfhSDM8
	+3eJqQJ0rzDSrWnEpTIBRRQOllMRKqPdR3d72PuKeEwmQST1AQ==
X-Received: by 2002:a05:600c:4e92:b0:4bb:7ae0:30bf with SMTP id 5b1f17b1804b1-4bb7da147cfmr56248205e9.2.1795021895045;
        Wed, 18 Nov 2026 09:11:35 -0800 (PST)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb832879f1sm1345515e9.6.2026.11.18.09.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:11:34 -0800 (PST)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6] mtd: spi-nor: take the flash lock around spi_nor_restore()
Date: Wed, 18 Nov 2026 19:10:54 +0200
Message-Id: <20261118171054.3885914-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_091138_541580_5BA90E0F 
X-CRM114-Status: GOOD (  30.68  )
X-Spam-Score: -2.1 (--)
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

spi_nor_restore() runs on shutdown and unbind without nor->lock, while
the MTD device is still registered. Tasks are not frozen on reboot or
kexec, so the restore can run in the middle of a program or erase. A
busy flash ignores the command to exit 4-byte address mode, so a boot
ROM that reads the flash with 3-byte addresses then fails to boot the
board, and the soft reset aborts the program or erase, which can
corrupt data.

Take the lock in spi_nor_restore(), so that it waits for the operation
in flight, and refuse later operations with -EIO, as the CFI drivers do
after their reboot reset. Otherwise, a later operation could still be
running at the reboot or kexec, and after an exit from 4-byte mode, it
would still use 4-byte addresses.

In spi_nor_remove(), unregister the MTD device before the restore, so
that its users, such as mtdblock, can still write back their data. If
the SPI controller removes itself on shutdown, spi_nor_remove() finds
the flash already restored, and does not restore it again.

The wait can be long, as spi_nor_erase() holds the lock for the whole
request, up to a full chip erase. If the lock cannot be taken, warn and
restore without it, as before.

Backport note: from v6.4 on, apply this on top of
commit f594a33f9721 ("mtd: spi-nor: Unprepare legacy controllers upon
RWW wait interruption"), which is also tagged for stable; only the
context differs, e.g. spi_nor_restore() tests nor->flags before v7.4.
Before v6.4, the lock helper is spi_nor_lock_and_prep(), and it has no
_pe and _rd variants.

Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
Cc: stable@vger.kernel.org # see patch description, needs adjustments for <= 7.3
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
Changes in v6:
- Return -EIO instead of -ESHUTDOWN, as the CFI drivers do after their
  reboot reset (Michael).
- Move the _pe and _rd unlock helpers up instead of declaring them
  (Michael).
- Take the lock in spi_nor_restore() itself, and drop the
  spi_nor_lock_and_restore() helper (Michael).
- Rename the flag to "restored", test the flag rather than the error
  code, and set it also when the lock cannot be taken (Michael). As
  another operation can then read it at the same time, use READ_ONCE()
  and WRITE_ONCE() for it.
- In spi_nor_remove(), unregister the MTD device before the restore,
  so that the unregister can still write back data, e.g. mtdblock's
  cache.
- Shorten the commit message, and update the backport note.
- Drop the Assisted-by tag, which the documentation no longer asks for
  since commit 1e035297ffda ("docs: remove Assisted-by references").
  As with v5, I used an LLM to help write the code, the commit message
  and the QEMU tests.

Testing:
- Built with W=1 for arm64 on mainline, and its backports on v7.3,
  v6.18, v6.12 and v6.6.
- In QEMU (v7.3, ZynqMP GQSPI, n25q512a11 with broken-flash-reset, and
  the flash model patched to stay busy during an erase):
  - kexec while an application erases and programs the flash, with a
    3 s and a 10 s erase: the flash obeys EX4B, nothing reaches it
    after the restore, and the secondary kernel finds the flash.
  - kexec with the GQSPI driver changed to remove itself on shutdown:
    the kexec completes, and the flash is restored once.
  - Unbind with a write still in the page cache of mtdblock0: the data
    reaches the flash. With the restore before the unregister, the
    write-back fails ("lost async page write").

v5: https://lore.kernel.org/r/20261029210153.3986211-1-itai.handler@gmail.com
v4: https://lore.kernel.org/r/20261004104311.2196527-1-itai.handler@gmail.com
v3: https://lore.kernel.org/r/20260915113811.2429311-1-itai.handler@gmail.com

 drivers/mtd/spi-nor/core.c  | 87 +++++++++++++++++++++++++------------
 include/linux/mtd/spi-nor.h |  2 +
 2 files changed, 62 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a04d22d2e2e1..44cb9c4a411b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1230,6 +1230,11 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_exclusive(nor));
 
+	if (!ret && READ_ONCE(nor->restored)) {
+		spi_nor_unlock_and_unprep(nor);
+		return -EIO;
+	}
+
 	if (ret)
 		spi_nor_unprep(nor);
 
@@ -1290,6 +1295,18 @@ static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
 	rww->ongoing_pe = false;
 }
 
+static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len)
+{
+	if (!spi_nor_use_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		spi_nor_rww_end_pe(nor, start, len);
+		wake_up(&nor->rww.wait);
+	}
+
+	spi_nor_unprep(nor);
+}
+
 static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
 	int ret;
@@ -1304,24 +1321,17 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_pe(nor, start, len));
 
+	if (!ret && READ_ONCE(nor->restored)) {
+		spi_nor_unlock_and_unprep_pe(nor, start, len);
+		return -EIO;
+	}
+
 	if (ret)
 		spi_nor_unprep(nor);
 
 	return ret;
 }
 
-static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len)
-{
-	if (!spi_nor_use_parallel_locking(nor)) {
-		mutex_unlock(&nor->lock);
-	} else {
-		spi_nor_rww_end_pe(nor, start, len);
-		wake_up(&nor->rww.wait);
-	}
-
-	spi_nor_unprep(nor);
-}
-
 /* Internal locking helpers for read operations */
 static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
@@ -1366,6 +1376,18 @@ static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 	rww->ongoing_rd = false;
 }
 
+static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len)
+{
+	if (!spi_nor_use_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		spi_nor_rww_end_rd(nor, start, len);
+		wake_up(&nor->rww.wait);
+	}
+
+	spi_nor_unprep(nor);
+}
+
 static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
 	int ret;
@@ -1380,24 +1402,17 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_rd(nor, start, len));
 
+	if (!ret && READ_ONCE(nor->restored)) {
+		spi_nor_unlock_and_unprep_rd(nor, start, len);
+		return -EIO;
+	}
+
 	if (ret)
 		spi_nor_unprep(nor);
 
 	return ret;
 }
 
-static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len)
-{
-	if (!spi_nor_use_parallel_locking(nor)) {
-		mutex_unlock(&nor->lock);
-	} else {
-		spi_nor_rww_end_rd(nor, start, len);
-		wake_up(&nor->rww.wait);
-	}
-
-	spi_nor_unprep(nor);
-}
-
 /*
  * Initiate the erasure of a single sector
  */
@@ -3231,7 +3246,16 @@ static void spi_nor_put_device(struct mtd_info *mtd)
 static void spi_nor_restore(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
-	int ret;
+	int lock_ret, ret;
+
+	/* Already restored, e.g. remove() after shutdown(). */
+	if (nor->restored)
+		return;
+
+	lock_ret = spi_nor_prep_and_lock(nor);
+	if (lock_ret)
+		dev_warn(nor->dev, "Failed to lock flash, restoring anyway, err = %d\n",
+			 lock_ret);
 
 	/* restore the addressing mode */
 	if (nor->addr_nbytes == 4 && !(params->flags & SNOR_F_4B_OPCODES) &&
@@ -3248,6 +3272,12 @@ static void spi_nor_restore(struct spi_nor *nor)
 
 	if (params->flags & SNOR_F_SOFT_RESET)
 		spi_nor_soft_reset(nor);
+
+	/* Refuse any further operations. */
+	WRITE_ONCE(nor->restored, true);
+
+	if (!lock_ret)
+		spi_nor_unlock_and_unprep(nor);
 }
 
 static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
@@ -3630,11 +3660,14 @@ static int spi_nor_probe(struct spi_mem *spimem)
 static int spi_nor_remove(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+	int ret;
+
+	/* Clean up MTD stuff before the restore refuses further operations. */
+	ret = mtd_device_unregister(&nor->mtd);
 
 	spi_nor_restore(nor);
 
-	/* Clean up MTD stuff. */
-	return mtd_device_unregister(&nor->mtd);
+	return ret;
 }
 
 static void spi_nor_shutdown(struct spi_mem *spimem)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3e3c6b10186..b9f4e041c4c2 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -361,6 +361,7 @@ struct spi_nor_flash_parameter;
  * @read_opcode:	the read opcode
  * @read_dummy:		the dummy needed by the read operation
  * @program_opcode:	the program opcode
+ * @restored:		the flash was restored, refuse further operations
  * @sst_write_second:	used by the SST write operation
  * @read_proto:		the SPI protocol for read operations
  * @write_proto:	the SPI protocol for write operations
@@ -402,6 +403,7 @@ struct spi_nor {
 	enum spi_nor_protocol	read_proto;
 	enum spi_nor_protocol	write_proto;
 	enum spi_nor_protocol	reg_proto;
+	bool			restored;
 	bool			sst_write_second;
 	struct sfdp		*sfdp;
 	struct dentry		*debugfs_root;

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
