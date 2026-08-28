Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B74FC61DCD
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t5ez4gHnCtLqImjlMPqUDPdgLp8MmL6tDpP9w6FYquQ=; b=4tMjI+yVfXkY6/
	p95sZ5fUftErl/DvQbTi9WWn2XsV1krdhKdt4sUBT2dTSt/8zNBkLAOCpNgED/S4Dl41tXo9A1dde
	d1hu5GX+bkBvXsOsyg5IydQcm96EwyHuU3VLIm2M1iySagso52AtlhbnFwggPqJhmjS4GWEmDLjJS
	urAjUvvLYV0t+B6To+/ee73STdcF3FMgLcF/K1B2lsF9Fnf8jBKPz0Ah7nJ6WgRWLfg5sEhhKZUhw
	+ygpBzrqFTwumxp6x7hfaukQSUvQZPONbwCyyqFI/2WRSqCBV0kFlmo65K0g7BZAI2HMjv+Yw6PDb
	GJ4B42RyZkdoDtg0EvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLG-00000005Mt1-4AZK;
	Fri, 28 Aug 2026 08:53:42 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLE-00000005Ms2-2qXo
	for linux-mtd@lists.infradead.org;
	Fri, 28 Aug 2026 08:53:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47db714766aso1365806f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2026 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907219; x=1788512019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ams9vzAHvFHkyir1iT+FKrvFhu2cxSyXqvCfm8j6nFQ=;
        b=pWn4RYCc3K5IYu6IIkRALzu9byzYTPVD9L5kLi0BhznfisWYwwo+2b00/YgG1GEWBg
         /mDnQQVp+64+9HFfR2OWq4HeBV7QznCml7UHtL1PRFkcyOSfMsy1kvOUkTKk+zNXOb1x
         wWPoeVK5y1rs5uu5K99oqT9gqzQyN4TKmnNAsN9N8w8nboRwQTfLXmuBF6WvUyVZraU7
         HpdKUywy9ZY3QkHnkYrKr+hFLZjEfTTnAtPdDn/Z/mNUqOJh9QUDIDixb2GqogVYuFbk
         SZ3PJB4DGnBRGq0P3lXvqXJbmyae5xjaLhCyJzic/YyeXSUVdV/k7QJ6THNG/VabynBd
         zMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907219; x=1788512019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ams9vzAHvFHkyir1iT+FKrvFhu2cxSyXqvCfm8j6nFQ=;
        b=hMCb3TBtLkXp9WFUJDlrsLrz56+vpPZTnQkj1ltOG2LpOKdmIqWRRqe2mLPnEm3q5t
         yddn84g3O/tXvpf7x9KZ1pMrirB3uDbWqf5QP1yETMBKA2J0BxnqpVGhtnPaZGZka0/1
         emQYK9J9mPqvazl9lQ2wA4xIH+xdFXeEjUD0UPJi5tVn/MGv/Yhx5KWloAfj1UoaDq53
         5QqPhQnug9ZS+4IP4pkQ5zhGXyprPGGoJfKAeJ5ZTfFLkjOGLjwzonTrG9z7SuxGBWgR
         136Lt/8dy1cGnCIHIaSj+TaKq7OcxUYAYpEJK4gkJ0qCfmvnjxJsMePvY02iTHWfyHd7
         frnw==
X-Forwarded-Encrypted: i=1; AHgh+RrBUVbQftyFTw279Jgd1zyegvxhWEp070wNkHnRo7tdjo0iRw1wAiiWaYt/wuRL06GGi+3L0r0X+98=@lists.infradead.org
X-Gm-Message-State: AFuF++nXNdTHcgfaw3Z1AxmfKLrWITEu3s66ZJrlgR89KjdaGqlyEkdX
	f9XLJSQ1WVzFbwhn7SwZhvcWoxkUffPukGqnN8Fg64g7uFydGGlVwZ7S
X-Gm-Gg: AR+sD13vqUTXLjp2SC+cv2051Wy06BYJvNDVEnznhjvI8FsA9maMmThTJ12YRa9lnDD
	Hsh5dI7Npl+t0v/RXf/jYfCvhGus/6wmiP7YroCecfL4WUVK5Yg6QRcAsQEmDe062FbdH4Qk2X4
	O+gtsNW4poopw8wSj5MjSR8a28ySwdI0Sph4pUYiyKTz2EQgwAJb8x9EFaDNTh4p1oz21Kv/HKi
	rL4i3XxC/9NfWdkImU9KWojC1pR3Bxff1qeul3rd3TAqBYPttONbI9OxgC9fdjtupmjUxEdICWi
	z4gt1prdzgZ0dBtRaSpRSqOmzagZ8E7F6drG7m8Yn1cm5QVo5duhV9YK0J401zhNK6E4/xD/n57
	UZdV4UogLb9CZIHuS7qu5ahI6ayk68/7P6EmXiIR6KeL+V66PS5b3oXzcYCE71GONwfZLcPCfW7
	zy3IAeEXoE7SrJd8F7QKQO52R+uEqDb1dRv/K7ZKzqPTYnYwiRvV0Snt0AMa3W14mYPw==
X-Received: by 2002:a05:600d:1:b0:499:8afd:4a9f with SMTP id 5b1f17b1804b1-49b0dd4e54fmr159448325e9.0.1787907218477;
        Fri, 28 Aug 2026 01:53:38 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb278f7sm2921103f8f.26.2026.08.28.01.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:37 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Fri, 28 Aug 2026 10:53:35 +0200
Message-ID: <20260828085337.3916199-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015340_754738_C831C350 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The driver only implements the 64-byte OOB format the controller
transfers, so chips with a larger OOB (the Colibri VF61's MX30LF4G28AC
has 112 bytes) stopped working when nanddev_init() began restoring
mtd->oobsize after ->attach_chip(): the parity moved and every
ECC-protected read failed, including the BBT and everything UBI needs.

v2 takes the approach Miquel suggested instead of clamping the memory
organization: the detected OOB size stays, the driver gets its own
mtd_ooblayout_ops computed on the first 64 OOB bytes, and the data
paths keep transferring exactly those 64 spare bytes, so the on-flash
format stays identical to U-Boot and to the kernels that clamped.

Tested on a Colibri VF61 (112-byte OOB): mtd->oobsize now reads 112,
the flash-based BBT is found and read without errors, UBIFS written by
a clamping kernel mounts read-write, and an 8 MiB write/read-back
returns identical data with zero corrected bits. Regression-tested on a
Colibri VF50 (64-byte OOB chip): unchanged layout, oobavail and clean
ECC counters.

The two pre-existing issues the Sashiko report flagged on v1 are sent
as a separate series, as they are independent of this fix.

v1: https://lore.kernel.org/linux-mtd/20260818114208.2780311-1-mehmet.fide@gmail.com/


Mehmet Fide (2):
  mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of
    OOB
  mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages

 drivers/mtd/nand/raw/vf610_nfc.c | 66 ++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 11 deletions(-)

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
