Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A394606A680
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0o9HXvm9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RSLNJBwN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=L2LzWFKngADMzVYWgtxSkMnavB+I1EP6x3ZSUM0dELQ=; b=0o9HXvm9D784YhVVkUxJxhjGuP
	aO0oqvgC7HNBSTy7VTUeU8BXgf3T1bj6ISa4QIFm3CrPVeRTJX401Lf8veqSdN21XvdMeOfGxaDM7
	H8rnA/Ub29gMpyHlUisBol1MNnLOr+6mk/CcA+Ikede4QExHwenAIe7A0kNmyTWE9PzCkw07vx1mu
	XDjutmbDm0DKuNr9SwdNcJyRw7W3C6Tg6TgttQqot5bzmGHUWNpLMXAmrOxNyjW5JKOh7wtVNA0hA
	rFEIXHp2HcQN55EhpSDynxL1snIP2N78GCQqy8ltsCsUd+maKRukqsQzvizLdHx43irvVoVY133bz
	mzs/peqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZkL-0000000DPp5-2DkT;
	Thu, 26 Nov 2026 13:42:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZkG-0000000DPln-4C8r
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 13:42:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0C10EC2B9CF;
	Thu, 26 Nov 2026 13:42:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87769604ED;
	Thu, 26 Nov 2026 13:42:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53CCD11E680FD;
	Thu, 26 Nov 2026 14:42:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xqUDWasaCfPhDHYSBTjnp6pf/Pq7EjevJ+F+V/SKQbk=;
	b=RSLNJBwNJl30Iyh9xdc5uiUZwuXvIUs7M+lfMR/4H+Ea1ZZu/H9d9hccz+BUQJcAHCM2GC
	rYUQmk9YGDtNbim+zf9rPwBO5ZTPUTmYnmXxg6lRl+aZGRPG2I4XKMWBHeksYRkGdD7lSk
	CHLZUfDryKFA+pLj5mq/+Ku2vH64fKmlPZGwbdRAKpTOpeGj00erJvHmKimrONzXa+gKuS
	biC5w3SXdOylf703p/1v2NE5o7fkD4XVDr/p6t+K61JokrMiKPrxBYsoGDzWTZeBQAuLDQ
	ol559AUelk6rzt3IJr+vb204MU863KV6t+sofRhOaIDorts03T8R+3OHZg+ubg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/4] mtd: spi-nor: macronix: Improve general support
Date: Thu, 26 Nov 2026 14:42:25 +0100
Message-Id: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-0-672a59abed62@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0Jm7RgKKoSV9zAs2jLqJNDitBAM4
 e5WPIHL9/Pz318hkDAFaLIVhGYO7F2C4pCBfWr3IOQuMRR5cVGqOOOgrXjHC05jiEJ6YPfAMDI
 6L2h70m4aUed1eVbGUKU6SFOj0J2XXXNrfyz0mpIt/kIwOhBaPwwcm2yujicUW8K3++QQvbz3h
 7Pay/+dmRXmmHdKm6ou711trsb72LM7Jh+027Z9ADFd6BoGAQAA
X-Change-ID: 20261125-macronix-upstreaming-spi-nor-cleanup-a08351bbe71d
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_054241_202974_3A9F620B 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There are multiple ongoing issues with the current state of the Macronix
vendor driver:
- wrong RDCR opcode in general
- erroneous QER handling
- issues with locking

This series aims at fixing all those open points. One reason they have
stayed for so long, is because there was no easy way to define a clean
per-vendor RDCR opcode nor to easily hook fixups to JEDEC IDs *and*
extra conditions. This is all possible now thanks to the recently merged
heavy QER handling rework, so let's use these capabilities.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- Also prevent 2-byte wide SR writes in patch 1.
- Replace patch 2 (no longer relevant) and instead drop the redundant QE
  setting (also redundant now).
- Clear the RDCR opcode and the 16-bit write that SFDP restores for
  parts whose BFPT reports QER_NONE.
- Use a local buffer when reading SR2 (to avoid overlapping memcpy()'s,
  see Sashiko complaint).
- Link to v1: https://lore.kernel.org/r/20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com

---
Miquel Raynal (4):
      mtd: spi-nor: macronix: Clear the default RDCR opcode
      mtd: spi-nor: macronix: Drop redundant MX25L3255E QE settings
      mtd: spi-nor: macronix: Enable RDCR for the parts that support it
      mtd: spi-nor: macronix: Describe locking support for MX25L51245G

 drivers/mtd/spi-nor/macronix.c | 120 +++++++++++++++++++++++++++++++++++------
 1 file changed, 103 insertions(+), 17 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20261125-macronix-upstreaming-spi-nor-cleanup-a08351bbe71d

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
