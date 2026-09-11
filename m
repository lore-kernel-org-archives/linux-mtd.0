Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA861C88E4D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qlRyTiGj01r1QsexPE7zhZRswQjrm1SVesqJCtdpf3M=; b=TCofTVCrle2L/s
	T91MR3Di2oygjm9PS13WOyBrwjYa26CawvP6c+T1Mk5hWklbkjxtT5NH2/LUWA6Wp3Au/6ySQ5J3p
	LBExtlPtV7BqAI5ju+enT03vyZl2jIVo+fIGUzQvXgseui4nJX6HPViQj8B/o5ZBwc5uxqgSKNIUK
	H4YNrYCL+KZTdNZiAaqCxkv1ge5ssBB/WRZx1pKvQHoFF80qaZiuRKEiByT+qtUKlP8TWbQROfWOF
	ipNFJ3prxV+0s8Fk+uNy17a4wQpMrZ5DI+z1gmg599cCnmGW8FBaum4barg3o3hDmPiO/RyNJ7/Pr
	3frCgq9O6QIO6nhW0w6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56F2-0000000HT0S-1nFL;
	Fri, 11 Sep 2026 18:44:52 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56Ez-0000000HSzT-2ekZ
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 18:44:51 +0000
DKIM-Signature: a=rsa-sha256; b=duTQ74YjWQQZ+u4oM2wsuLy3Vx8sfSV5pihsXaM2Bb/z5AzRTKJMUl6SXzstBlkS9PR6DX9xvYiOcyx7aqFrJiBPIqZNVoIUltuQgfaMyHiKFQkJxzZyne8b3EcZku2wlMJ0ht3D/KwfexpYNXALt800xf0MzO+fY8XNVVIXiUbT+/YlG8QaNvHM0flQhgy7XBDJMQeBi3yC6rd60ZjPAxTkM1j+Vi4EYc7JCyRP0Jp41iq3oja0RKAvXzF7o6bE723b7MFdgL6ZIX+MDhsdmWcrDOSUTI3RbzNgw8DybZwcaJm9M+MGSRDWS0yrxPQbjdLc1n/pG6KF1nez5oRu4g==; s=purelymail1; d=c127.dev; v=1; bh=bJUwiUIJZTg2xrplNNc6KqeDU7Cp83zq+iS/Qhrji1E=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=U1AVAIUx67SC8KPYWPwkeNFInTUOE/s5Juv0+KIWw1L/OP+3lu5lySYOSC8831n3RXM3Y3tDIt3xOnxjMD6aNWOOKz/JIMrl5LRPCuSOPOP3EFZ24AzSV27Kw1RA4Un4AMYX3qM/BVUL5CpIzq7o5X30Y53prr7Mm9iHCcvgv2NXSyYFJe1U9F0bh/SD0mhFwsW7iCfPiGf4Z+yJqw/er4cs2GW6Yv2oxDYzwnxT11FQppDlvlqOf4Wsk17rK9xryYPELKsUvIUlWKrFOOjIVFMjZlVHvi0VjDWw7JpIpVxOzUTMwQypNnMOrP78yU37jgTToNoJUs4d1g1j5rvl4A==; s=purelymail1; d=purelymail.com; v=1; bh=bJUwiUIJZTg2xrplNNc6KqeDU7Cp83zq+iS/Qhrji1E=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1017243:43747:null:purelymail
X-Pm-Original-To: linux-mtd@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 51783469;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 11 Sep 2026 18:44:20 +0000 (UTC)
From: Johan Alvarado <contact@c127.dev>
To: broonie@kernel.org,
	md.alam@oss.qualcomm.com
Cc: konradybcio@kernel.org,
	pengpeng@iscas.ac.cn,
	miquel.raynal@bootlin.com,
	j4g8y7@gmail.com,
	quic_varada@quicinc.com,
	quic_srichara@quicinc.com,
	linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Alvarado <contact@c127.dev>
Subject: [PATCH v2 0/2] spi: spi-qpic-snand: fix the stale ECC context pointer
Date: Fri, 11 Sep 2026 13:44:14 -0500
Message-ID: <20260911184416.109790-1-contact@c127.dev>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_114449_787663_47F71637 
X-CRM114-Status: UNSURE (   8.36  )
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

qcom_spi_ecc_init_ctx_pipelined() installs the ooblayout but never
publishes the ECC context it allocates, so qcom_spi_ooblayout_ecc() and
qcom_spi_ooblayout_free() run against a pointer that describes something
else - a zeroed struct on a first probe, the previous attempt's freed
context on a retry. On IPQ5018 the qcom,smem-part parser makes that retry
routine, and like half the boots on a Mercusys MR80X failed to mount the
rootfs.

Patch 1 is the fix and is unchanged from v1. Patch 2 removes what becomes
redundant once the context is published. It is a cleanup with no
functional change, so it carries no Fixes: tag and is not marked for
stable.

Patch 1 was applied to mtd/fixes as 93bc7c4d2f41 on 2026-09-04 and
dropped the same day, so nothing from this series is queued.

v1: https://lore.kernel.org/all/20260825013848.1056946-1-contact@c127.dev/

Changes in v2:
 - Add Gabor Juhos' Tested-by to patch 1.
 - Add patch 2, dropping the now redundant assignment in
   qcom_spi_ecc_prepare_io_req_pipelined() and the unused zeroed
   struct qpic_ecc allocated in qcom_spi_probe(). Suggested by Gabor
   Juhos, kept separate so the stable backport stays minimal.
 - Rebase onto spi/for-next, which carries commit 44d39535cd4f ("spi:
   spi-qpic-snand: remove interim 'dev_data' variable from
   qcom_spi_probe()") touching the same probe lines as patch 2.

Both patches build with W=1 and sparse without warnings, and each patch
builds on its own.

Johan Alvarado (2):
  spi: spi-qpic-snand: publish the ECC context to snandc->qspi
  spi: spi-qpic-snand: drop the redundant ECC context handling

 drivers/spi/spi-qpic-snand.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)


base-commit: 98100d83adc8e17606605d131e685b1fbedfe092
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
