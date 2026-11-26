Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED548606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 20:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNU6hfhp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1AsMzXR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MFS+sj3qnYPhV0Hpxw1vS8zolgHbxvDzHYQxsLhMI/s=; b=BNU6hfhpOQ1LmS6N4zLyuVZmVR
	nk3mKWcKsBnDWFaJ6ZBTVEbdsjBdRgmUh+HuwdRgGIZmSjH49nuLWYhpgHW22aPb8Vc8hgvXmj/in
	uosZBNLANO+3Sa0cJ/PQZEHXcs2Xv8zEzE7hl6GKHYZSsoniYAfm0GK3rEOrVBrS5mWsfD+aNJsVV
	DhA1oFIv/aD7Bdti0bZ9RMixofP9ptcQBZVdDVMc83VADwIovFgZqMPVXY0kY42Hgt6BXib4/oBXa
	G/5+DZQWNioGFgKDfJDUGLjDPF/+p0yht5uqHCSOimtG8ftY4FxbpYywdQtEVPRCjw0ebbkXsOMVd
	b2/MsAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfiQ-0000000EQdy-3PCV;
	Thu, 26 Nov 2026 20:05:10 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfiN-0000000EQd2-0r0J
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 20:05:09 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-483c607ccb4so3777117fac.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 12:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795723506; x=1796328306; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tjcnLeVYykQLpngMcaexUPjWqyhAHn6eUqbyAQMUfmo=;
        b=c1AsMzXRpcqoL+6jSKQu8OidV3Gw1FfHQSt2n30k/d1kCi9Mn11OAtCO9gbZ7yKnuI
         HpeHFSjFQ90Id4s80vX3AenGCthTZnz3lAp4BRc25s0yp6Zgq5rBi4wjj8wQAbnXVYD1
         88LZjeuz/ie/p5METfrTRnhykz9Z5A3+Z4pwU+2R9fiTwdymNR8xWwKzGaHnmIvSq/sT
         ZsyEqwLVeaNS0rhKJFOCkRl9deft42+WtwLlqSZ5RIlcz+ScFW4G6YiCh2BwrChb3VFa
         t7LQ+6PYr3VI1rn33lyxvfEFaM94rJVoKw6kUpIHzRL4s5G1FRWGqEB0DdEOlaFt3Hvi
         RZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723506; x=1796328306;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tjcnLeVYykQLpngMcaexUPjWqyhAHn6eUqbyAQMUfmo=;
        b=NdCRKMY/JXQkn8E2DHJUkqNK0m88yzRTu/Ygfwv4GDNLwUn9i6fFY4IfEybiqlJg7f
         p+3s6fL28ZriLehZrzkIpjStsejDNiN378n1w5lRJjXH8ARCrzQ7YnnbcqaQqldO2uH5
         CqUuMbppX2I1jvEGsxGxo8K8niAAEyhyq8iCJoq0k/TijN1E9rQ3JG8i+pp2ecamuWUW
         XDnPL7rzvuERHu2aWHKVxHYFOmorbm6ihl04M5yuPAJHiJ/VC1J8ZY8kq93pRSWTuRbF
         Oty5Ou/tBhD0MnzAC81S9CJlxTFa59w4WIVFRoXdfiLGLGrC0+HcQawT/dF/hfebFZWg
         eJXQ==
X-Gm-Message-State: APuU4Z/PbOUwyTAil7Otxn4Gmy9JUPAb4vmm68ZOWZGPYZbRApUoOjAV
	dyeamRPGw81vn8yeB4wTkhDn+FrTzx8hqeiyYFDZYbJPH/PIe9C7xdgo
X-Gm-Gg: AZFdTZd0y9RCurCA8wGvw3Q/QwIa186FbNBNva5mgdgU6wr4Q3yyPGFFl05VP7ClaC+
	l5KCtmUpseu1N7qWyi9vk92Nl70weo22AuhIHoFEJi5scA2xfjRpL+cXQlYdS4exIS8O6NipSCo
	UrZWOBklqXFAeMfsHaJzrD+o5zizyr5s8XXf3x7Yhqrb3IMMUc07WSTE1qMA57YoU5s+sATsNUk
	Ll5pnJIhzegyY0PuqlJlRPLTPeXv33o6b1jgMZlCclg1s/9NlhJGnesmDr1PU7FdtV0IYQL7F1K
	Dc/SkBorI1h8AN+Ov2iPpI2njJtPVGrWwePm8ylvI6MliQPQiOjZz16QjRVMisrv6OYNGOr0EAG
	QZ3sKqnVKIIJTeUQUgtSA/RduBMFh/lo/PbiKN9D2DV2Umw7qxq0Sy0skWUn5rQOCE7LwIdD+p6
	C9d2GE/wl/dgjLsGXQ9wg7BQd+rSsBi+6k+loykDVFXnjrhhUGAcxa+MmPy5m8IyVgw4QxzFQiN
	kM91bF7Bna02Ad3sg57hnmMoCtDfj0uKg3kw12J6TIlZERMj4Isw4M1RvVrY6xno7SLjQ4GGzRp
	xMkZSCtj1tXxEAHoGepK4u0ce8dglT+J2bdX3DgcfJIl2yZ7nraPtfS8+5wDNGjZxSlbxCKYecc
	K1wAOEC6qicCtLbSHLbdXf5oxK9DuDrN6I1fFpzEKlbpspY5R/Wn8JY8vkKTPkQ94RDXd4PvcUL
	FiRyQT0UCUHxMvwtaNDVceT7qWaLExa/QMhJvAlcjguWzb5HC6peXM
X-Received: by 2002:a05:6870:f61e:b0:4a8:1837:bc27 with SMTP id 586e51a60fabf-4bc7d272a48mr21046401fac.3.1795723505731;
        Thu, 26 Nov 2026 12:05:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fc97bb2sm19548249fac.9.2026.11.26.12.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:05:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/2] mtd: rawnand: serialize OTP and BBT recovery
 operations
Date: Thu, 26 Nov 2026 13:04:50 -0700
Message-Id: <20261126-submit-rawnand-operation-locking-v1-v3-0-cd3794332f23@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQ0U6EMBBFf4X02ZppgVKIMf6H8WFaBra6UGxZX
 LPZf7eAiRufNOnLTWfOvXcuLFJwFFmTXVigxUXnxyTyu4zZA449cdcmzSRIJQRoHk9mcDMP+DH
 i2HI/UcA5LfGjt29u7PkiuEAwuqNKq7ZgiTQF6tx5c3l+2XXCvJKdV/Q6cXBx9uFzi7GIde5/j
 ukBL1UJAjpbdto89QO64731A1sdF3nDlPJvTJmYkIOxWlUd2OqWed1rBHo/pZvNezdmMBJP/4n
 dZGQF6aIwdaFVDhILrdFYyAlroVujoIK6UorW/gPFiNuxm+zhd/MBbfCjO3M/T5xC8CF+dxZcd
 6pAiW2JAn7yPaaA1y/XtZlU3AEAAA==
X-Change-ID: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Kyle Roeschley <kyle.roeschley@ni.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_120507_249578_53EC503A 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Route raw NAND OTP callbacks through core wrappers that hold the chip
and controller locks, and protect marker writes performed by BBT
failure recovery. Both paths issue NAND commands outside the ordinary
MTD read/write wrappers, so they need the same serialization and
suspend handling as normal operations.

The first patch registers manufacturer OTP operations with the raw NAND
core, which invokes them under the normal locks. The second uses those
locks around BBT recovery marker writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v3:
- Run raw NAND OTP callbacks under core-managed chip/controller locking
  and resume handling; keep target selection in the device-specific
  callbacks.
- Keep helper visibility changes with the BBT recovery patch that uses
  them.
- Link to v2: https://patch.msgid.link/20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com

Changes in v2:
- Rebase on nand/next after the BBT logging change.
- Apply the Macronix locking change on top of the posted OTP error
  propagation fix; both touch the OTP cleanup path.
- Link to v1: https://patch.msgid.link/20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com

---
James Hilliard (2):
      mtd: rawnand: serialize OTP operations in the core
      mtd: rawnand: serialize bad-block marker writes during BBT recovery

 drivers/mtd/nand/raw/internals.h     |   2 +
 drivers/mtd/nand/raw/nand_base.c     | 110 ++++++++++++++++++++++++++++++++++-
 drivers/mtd/nand/raw/nand_bbt.c      |   2 +
 drivers/mtd/nand/raw/nand_macronix.c |  32 +++++-----
 include/linux/mtd/rawnand.h          |  24 ++++++++
 5 files changed, 151 insertions(+), 19 deletions(-)
---
base-commit: ec1e844b9486302a488abc03ea918db60709766e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4
prerequisite-message-id: <20261108-submit-macronix-otp-errors-v1-v1-1-8f64a2ad5a10@gmail.com>
prerequisite-patch-id: a542c9cd698d2d4c090932b8d74dc6f520a71166

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
