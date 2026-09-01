Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD195C624CF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2026 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VCwPY4vhjYrNb+KFnNQ/8UCiD8fAX0yIGRJ4mVIOb+w=; b=dbV0dGKsh2kzkM
	ccHDZUIJVI5XdIEg/aVT674KS32jL2YWwfS22HWr8I53DjLuCu31QU+uVh2tZ5vLie+XLW6lskaLX
	uyquBujkBv5KZTineRlKxQjlfsS5IgzyZTCb94GR19Ewm+1xDKtjw0O4nJRjDVHbw2WibahR7maxU
	DBAZyBrVl5vBZLw9ItarWS3DMPvF1DTJWEft0seDT00N9pfojP1XSFTFLbcpGBZ7JkDCpGp9a5VtH
	Mt2AQ5CMuZg0C0djNZzbqRKNXsSWHtll56K42gm0cnxqGDN5MhL/H6KXNtWitnXD0FbxaxM4vXjrC
	TIWTq98tVcTbL1NXQggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1J5O-0000000B900-37WF;
	Tue, 01 Sep 2026 07:39:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1J5K-0000000B8yT-3CuH
	for linux-mtd@lists.infradead.org;
	Tue, 01 Sep 2026 07:39:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48436216a98so1261868f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2026 00:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248349; x=1788853149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjZHkrxVpcQFOwJwauqd2i3GemqcaPp8+D6Ys4sNuvs=;
        b=qhunAC3096WDPino3kuEEia69OwIY/vhz7JiMx6QXyiT+HH5Slhl/xdUAvu567822C
         eqdXa1VRDz98aVWkKIlFmw15hRdt1WD5hiPhlqZyzKCxieTYEtqN7YPktvCzPl1je+vm
         acjZh3cXCBTWww11cHYXY2E5f4RyLQ8vokTSmjvYrBwm0vI+R/T4jaI0BySUx720imVT
         gmRPWzfYbixF1fU7HOwATd0/EmPyVsc+BjFEQTr4H1i6OoDYEc61jjDvkzAS0lnAssHG
         b4s2bGgSmZSVPP3J9sOVosTwz59Ofc4r+7tkrmOFLhJDWqDVSPyiQkuRta6NKrYhbS6s
         /+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248349; x=1788853149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjZHkrxVpcQFOwJwauqd2i3GemqcaPp8+D6Ys4sNuvs=;
        b=NbvOFILjAy8CNxjxU+0cJNsEXtVjSps/tKNkWU5tLBbt6CNlO2Rxj6kYUkRPcWYYLy
         veiIbYj8U4ecYytKNj+YaUngpAC6msq+c/Rg8/KSximxMwVyepTTqlzZe6gC68k6pq9U
         Oth27rv/HC+n1o4u8IfgsD5rjpObYasq5KPX3h2dxIn+6Ttg6Ul7NyN+7nkHuOdj9YzK
         osfJAQZSw0312lhuYbg6DmVGXRZ6vH/ehz3W6XwHA2H2Oft1vIT22O1i9afdfiNunwOE
         uGohYZvAmcaJOhjPnGoSq+w7jm8wT8S+8STlXQqoY6TGXeeWsAVlw1FyliV+DAf09cCF
         JoZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyszeh5was51do8ew5+OQRoWqjOrKOj4e+DeQxUGvy+llmonTlRwqW5Hm+yVTdxw4y4rsXzQDeQNE=@lists.infradead.org
X-Gm-Message-State: AFuF++lqLZC7jVDvHpJ+/kAVRdeO0c13P8/IJLo27QzXDr+4RjRJD7O/
	KUbbS8tiqB5BXdhRHDD3ysnzmL8DmWww0ycqkeyCx6lE3NjADRXsTA2f
X-Gm-Gg: AYBFou1JYQZORmi81UWhC65ZRGG1GyZB2UDuCWcZH/uyXBsvv78antyLKe3hJ7BzESD
	27Cq2/IK1D/H05RVhgGLhQNrhTZzz/k6gS1cSTL6VkOYotuxgSs9F9lvpTfLzrg2hJxTFZ1DHaK
	vuLl5HaZ3W8tC+x2Doui1R/yt9hqMvPLcVYlj7M+7j0Zc3mukp+JXzHx0RkpkDU1M0TYP2xFXQh
	31okB2vEZ7RZMI8SEGehe7BoU9StS+G6ncZdYORWJn9V71eMicSLghOF9WKEWPBEQY/rEgQQYLj
	QgZGXDniJGfx7VOcdeRmj4U8rrFL3cMhY9N8nSVsrRupgR/tvofRCabjPDxEgqJTjpuaS9MXenL
	zrX1pRlPC8HcqK4pXJ1Q5ubGEGXdsPeu/sJLB7CwKqkWBZdd4CnVVqCRdYiGy116s3RAyR3XtGT
	lxfin8lr2I+EhHklAin1DPKgkJtznVUiNS6ca1uguPpFZqJCmEFVjlbjUk0/zGj5oriA==
X-Received: by 2002:a05:6000:4910:b0:482:a8b1:aa6d with SMTP id ffacd0b85a97d-482f79c1923mr50050718f8f.10.1788248348682;
        Tue, 01 Sep 2026 00:39:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c460sm3014790f8f.13.2026.09.01.00.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:39:08 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 0/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Tue,  1 Sep 2026 09:39:05 +0200
Message-ID: <20260901073907.2443698-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_003910_828290_3BFC4C3A 
X-CRM114-Status: GOOD (  10.35  )
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

The detected OOB size stays, the driver gets its own mtd_ooblayout_ops
computed on the first 64 OOB bytes, and the data paths keep
transferring exactly those 64 spare bytes, so the on-flash format stays
identical to U-Boot and to the kernels that clamped.

v3 addresses Miquel's review and the confirmed finding from the Sashiko
report: ECC page reads now fill the tail of oob_poi with 0xff, since
mtd->oobsize bytes of it may reach userspace while only 64 are
transferred. Retested on both boards. Colibri VF61 (112 bytes of OOB):
BBT found and read clean, UBI attaches and the UBIFS root mounts, 8 MiB
write/read-back intact, and OOB reads return 0xff in the 48 bytes past
the transferred area on every page sampled (6000+ pages, written and
erased). Colibri VF50 (64-byte chip, tail fill is a no-op): layout
unchanged, corrected counter stays zero across a full dump.

v2: https://lore.kernel.org/linux-mtd/20260828085337.3916199-1-mehmet.fide@gmail.com/
v1: https://lore.kernel.org/linux-mtd/20260818114208.2780311-1-mehmet.fide@gmail.com/


Mehmet Fide (2):
  mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of
    OOB
  mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages

 drivers/mtd/nand/raw/vf610_nfc.c | 85 ++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 15 deletions(-)

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
