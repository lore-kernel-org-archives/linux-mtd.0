Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1665CA5FEC
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 10:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dd9zOlpqI2Ip4uCq1ZHJGpoYc5rNfo2EzjHiLZde4EE=; b=v+UYoupl57LV4K
	Ly4I1e3Y+oidf7WByJs9WxnseGcHTOlMrAlRoMcQCTXwv2rkEB0sUyznBTpnrOXRsf/ZGVAPAT561
	qlKBlF6RfcDHyewygKUeoPDaSHj6jaBouAuX0/vVJ6VwpyikHyFNdmludIHijbgsSReCVBAUdN4ud
	KAalWA6f3Veu4f4ZbGHksKmvSYgV8o4jqooUFrIwpH6ma2iTKLqBpirpH0wxpNfLogvWj4C6kHPdM
	/pmnsfc7hx6EuZ3wprJL90vcMM3r3sdvBw2KuS3NWWFJHwSc9rW5gMfqU2IMX3W6kN8qcVfW6DVks
	ogPMmkfuzKHJMNX6RwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJhA-0000000Efji-3juM;
	Sun, 04 Oct 2026 10:43:52 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJh6-0000000EfjO-3mXB
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 10:43:50 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48b02f47696so111125f8f.2
        for <linux-mtd@lists.infradead.org>; Sun, 04 Oct 2026 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791110626; x=1791715426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuzfUhec6lTMalGhDglyxwQlHTBIqwq6CfD+AAkmFlE=;
        b=e/XepkZGtGB4fa7N/UhsKJLGAIdcGvWC2bO+t+P6UPzBy5ngoAGSGMq90w5NSXu+l/
         2SV4/gTipmPL+XQu6KQRCUfHwXZCwiMycnt5x24zJJiJwq5tqBYmJ2In6WaE5ECK8vWn
         85E7nDyZALWGVDEiQpZznuV2HRINLp/JToeZYWBJeRh/JLiElR7bLgBO0bDhliy0ZA8v
         HRZOL68U3r4DjsxBEyn+BoTfsMR4u8SPP3EhswfyjAMpylTXa4vHGB5dKSUyaBcwVhRD
         mrhx9inz3enK2Ud/d5+iytkhwcPapTnhV/u0uP6tOJcft2RSi/gH1vvtC699eEHfX7/8
         WfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791110626; x=1791715426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuzfUhec6lTMalGhDglyxwQlHTBIqwq6CfD+AAkmFlE=;
        b=fxK7btre9j0MsIs9jBJwswi80jiKsg2L5Eccacq5DrdPd22isyMwDmBOJ2WbhhFvZg
         5HxXKpbbugZ7vJJGOxJFXBBWlglsGZXAIG4emmnWyNB/eW9a6tup2DE/Koz14p49rACn
         k2YEzrnd1mXmB699PrAwJbXrxH/QSM4RKcLzOkt76qfjZjtIIYzsW+ti0cznvvJu/ifm
         7caN9h0AVVev2I+3YoRwy7kecGwRHl8xE5bdgxpyROajdeGoD/x1oUGUUngNdL44a2ms
         +iFHupp6eMdurLl58qbIiF3DvotCbECtsqledMLR2eI3tnoN0wrBVy6qWDkRlIfuCkdU
         J2IA==
X-Forwarded-Encrypted: i=1; AKwUvBwuJIvmo+Z3NFQL0OJiGY0zhzwB9VGdPkxBFqlM/k+53UiVmSfb6ePWjDvfYnAXkHZRyJVbMxc1AZI=@lists.infradead.org
X-Gm-Message-State: AFq9FYK0dyk0IEmgUVQjFGIaRjcpJg79AU0niIUiRMUBeAZrYj4/cH+X
	GTsKF1JILWfGDLVq0Jilnz621xCsWggA10F+/t+3gqWbLBoON92cQpal
X-Gm-Gg: AYBFou3V7sVW6ctfNRV5A/s6ztLcp8O4Kka3h/8jc2PJ0zk3I3BlPBYjMEu9vqxbG1W
	0EpA8kDL4OgUzQpbRQbWgdxNVNXxo7ZLPl92TWv9eKVSTsgLznnhkDX36DbMQoASvOnTsxiIGjV
	5aVXO108PBXBHuysZlifJyvebK8IodwBzC5UdyZ+ZDZnWYHQo9BFv2YUPul7Tj/ytizYdfIdBvt
	cPrVMo4RATUiaooAl+niwBaUICEl2G67kcGmgbJlFRfNZc+rvGkiOWbHwEygGidz52oUgjqKog0
	HPbh/aUIsFDa8sT+N1P4yxGWtefUBwBSMrPZTN8n4t0IdeyEmrjUehoe9jviJYrZDw3vW/XpTye
	YuOzzpXISBPH6Rkvl8Rpu2+nWQRs6ZiqP8D62r7JggT7CmUzrI1AnuzrJwnXrjE/GmdhPnGF89x
	1jd4EJurwLvnr/PAMbmJxjkAi99Untv+CRi0/D5/QGRa9pHi06951tOCu5SA7stjNev4DWbKNeQ
	XTGbDTx/NGHew0BXxw=
X-Received: by 2002:a05:6000:260a:b0:48c:45c1:5592 with SMTP id ffacd0b85a97d-48c45c1565fmr8429713f8f.0.1791110626430;
        Sun, 04 Oct 2026 03:43:46 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0858sm19831719f8f.8.2026.10.04.03.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:43:46 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tudor.ambarus@linaro.org
Subject: [PATCH v4] mtd: spi-nor: take the flash lock in spi_nor_restore()
Date: Sun,  4 Oct 2026 13:43:11 +0300
Message-Id: <20261004104311.2196527-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_034348_991850_E2126866 
X-CRM114-Status: GOOD (  20.97  )
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

spi_nor_shutdown() and spi_nor_remove() reach the chip through
spi_nor_restore() without holding nor->lock, which every other path to
the flash takes through spi_nor_prep_and_lock(). Both run with the MTD
device still registered, so another thread can be mid-operation.

Neither outcome of that race is good. While the chip is busy the
address mode exit is typically ignored, so the restore is silently
dropped and the chip is left in 4-byte addressing, which a kexec then
hands to a kernel that cannot read it. The soft reset is typically
accepted even while busy, so it instead aborts an in-flight erase part
way through.

Take the lock in spi_nor_restore(); both callers are teardown paths
that can sleep and neither already holds it. Waiting is deliberate: a
partially erased sector cannot be undone from here, and the wait is
bounded by the one operation already in flight. If the lock cannot be
taken the restore is skipped with a warning.

Requests arriving after the restore are a separate problem: they race
with device removal itself rather than with the restore.

Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
Cc: stable@vger.kernel.org
Assisted-by: Claude Opus 5
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
Changes in v4:
- Correct what v3 claimed a busy chip does. v3 said it "ignores
  everything but status reads", which is roughly right for the address
  mode exit but wrong for the soft reset: that one is accepted while
  busy and aborts an in-flight erase. This strengthens the case for
  taking the lock rather than weakening it, but the old wording was
  not accurate and the comment now says both halves.
- Lock inside spi_nor_restore() instead of adding a
  spi_nor_restore_locked() wrapper around it. The _locked suffix
  conventionally means "the caller holds the lock", which is the
  opposite of what that wrapper did, and spi_nor_restore() is static
  with only the two teardown callers.
- Handle the spi_nor_prep_and_lock() error return instead of ignoring
  it, and warn when the restore is skipped.
- Say what happens to an operation that is already in flight, which
  Michael asked about on v3. Short answer: it is waited for, because
  an erase cannot be cancelled safely.
- Rebased on mainline. v3 depended on the spi_nor_rww_start_exclusive()
  mutex leak fix, which has since merged as 44b8a0bf5f96 ("mtd:
  spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()"), so
  this no longer depends on anything unmerged. Note that it is not yet
  in a released tag: v7.3-rc5 does not have it.

Link to v3:
  https://lore.kernel.org/r/20260915113811.2429311-1-itai.handler@gmail.com
Link to v2:
  https://lore.kernel.org/r/20260914081149.1916589-1-itai.handler@gmail.com

 drivers/mtd/spi-nor/core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b..94dbf1b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3455,6 +3455,21 @@ static void spi_nor_restore(struct spi_nor *nor)
 {
 	int ret;
 
+	/*
+	 * The MTD device is still registered here, so another thread may
+	 * have an operation in flight. Wait for it rather than cut in:
+	 * while the chip is busy the address mode exit below is typically
+	 * ignored, which silently loses the restore, and the soft reset is
+	 * typically accepted, which aborts an erase part way through.
+	 */
+	ret = spi_nor_prep_and_lock(nor);
+	if (ret) {
+		dev_warn(nor->dev,
+			 "Failed to lock flash, skipping restore, err = %d\n",
+			 ret);
+		return;
+	}
+
 	/* restore the addressing mode */
 	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET) {
@@ -3470,6 +3485,8 @@ static void spi_nor_restore(struct spi_nor *nor)
 
 	if (nor->flags & SNOR_F_SOFT_RESET)
 		spi_nor_soft_reset(nor);
+
+	spi_nor_unlock_and_unprep(nor);
 }
 
 static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,

base-commit: 6addb4f385570ebc11c4eb499a4f1c149f313e84

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
