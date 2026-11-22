Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F7B606A320
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2026 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=olch2s9I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ZQPIkkn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=j1qZe55ZiQZ9b4k7uGBD8AfjeDDCpx6iooURGvi2QYk=; b=olch2s9IntH7Mfqd6ZP1uQAX3U
	UQCncqL8OnR6jfZrSY3pneIIOscHUiH8EEKYUp81iM+mCxXpbc7Jhw+HZUoQ065jYP2R2VeGtVYoa
	jr5KFyQzKFrc/49J1nCRlkGRH0hvhqS/NsgbBn2N92zXcTTB6q5uSanhoICm/pvUy2Al39Qc4tUns
	/BeGpks+R3+jKC4rYBYt2S/uGoAdG7i52294cva1WE25KathM0qtszF9cWNbBpYqTTfcXE37WGH5k
	RkGVbACraIpQAhXHMqmvE6XIsOW6rmUufmGY5AyBHruRtF37q+r8Mnf8i+cEvzPfDud5eZOTtyfVb
	9YebZw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3pg-00000000uOM-0Evt;
	Sun, 22 Nov 2026 09:26:00 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3pd-00000000uNZ-0fQY
	for linux-mtd@lists.infradead.org;
	Sun, 22 Nov 2026 09:25:58 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-483d290f398so1397765fac.2
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 01:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339556; x=1795944356; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BTf5fmfGtJLtKBIVqGLksqJZqD13fP13MFLwQsUjm60=;
        b=0ZQPIkkn11bN6PoPVkJfULqPng1bSNJJUXBg8g5SI6JW9R0nuafwdhXGDNCB/wqJAB
         UYfOXchYtn5MT1LBvj3Os74n61Cvi828VKZk3mlc9xqr4aaNiK313JslhbqRBdDOBONQ
         0q9aynJ8zaAMA+dJI3+41c/t+SKAomd11QpyZZz8s/pDkE8DhpNf6F30JfeZrvSARzkd
         Qa3JAc7tRaXYBkxIpjMFX47JN/lR3MF+PE81In82ABvHebsJmA8sssKRkxF6lEDL9mPU
         Ddgm8Mog20zvSgIf2mwiS7g2auFKmwj0lqumlEeoiaSJ/gRyLl2UqO2x7Hj6SrCRIRmi
         Jq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339556; x=1795944356;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BTf5fmfGtJLtKBIVqGLksqJZqD13fP13MFLwQsUjm60=;
        b=L9UJgePhDgqkWFimuGOO1/yjjnILNoWEnkLQ9TYJ5L/i2vbOPz5853H1UcxvK/t5Wc
         gyHJ3l08Ss9ktvMsLctMgx3PiffQvTHs76ZicScILaQVwtdPqL+bU6UO1Zm3s/PCUsUE
         UXaL3oeJHgLJSOh1TvQcoxwaixbWFysi6j7WRN02Yo8U/AkGITX3NNMW8JKhq1KWB7oc
         GmRAQtehUScBNToYkgzzoAxDLQIJNyYdNFxu4kpXAiOpuU4ZwGw3dm/+kXT1K4DPLDuS
         PnciABl415A0W1KMWrnN/Ifm/n+MGkA7Jwum5mesZigvofz8Oq4Qno2LOCmyR+e4alyw
         j+RQ==
X-Gm-Message-State: APuU4Z9tE/7aXvWzbmD9uJzAt+KmxmEDSM1E2ZQq2qNyzy2OS88oUcXn
	B66YYk53e7v/05TNv0CR3vWXKDTH5xTIFjinrYZrbKUvBMa2ZF5AOYkK
X-Gm-Gg: AZFdTZc4UckkDycLPM5RzcaNkeW/eEcTIdoDtlA778hO2oqHj7PrCSSE/0uij7VO6Yv
	hBOH/fEUC8oLJVo6NtEu3DYXK8Fy1iLxSvnxcR9mW2AOaY4msveK6zMZjgs/vA3y1mkTap8e0He
	8zn9i7SdQ6oNCmB4idRxBAxkuEYJkzwVjxWI8OT5osFEdgXqAD0+s0/49q2FlzUnSbUErRQOa7b
	JQBk/9ZqRTbGUcaFIP3KaeDc6gr2E7cMPPq6aCj0Hcj1IqMTs/owP7vDW+g0+e1lpz7CF84M8kG
	LAAXbLT/ip8heCoYvlq7JjvAEc3w6e3dvXDu+5GPFHsEYDFIOh99QUO0PwAeI3m2EtUHXSaXsiH
	2mGRkhiAoCYkf8nOqhAP/FDNYkOvsiVk1m4jMZ81SlvmG5SFaFxsFnpfL0D+2MxZk1aM/Xri1i8
	xhmGrQmNYIP3+w34DzDFjis1+Zyi5iwBBdImPE0KtehAhjRayWgc3AjXw/RixGDXXdee7HvXwsy
	LIz9E24P0Lhk+iM8pcgMp3y8YBBT8rRONSG8vKZby73UaNs9lofIvfcLepbEtd+JDzF2BLIFmRh
	Ot15YbPNvzIzTY5vCAzyLSX1a7b3kLPuQR3eFhpUhPiMidbBKXpFjJVAeWuMcQgFeM960yN4BlU
	dEuYsLvMYJMd81ZC2dU3vL4o2MC9iY1RZSqAYFAQncJi99AolYyRj/CWdNihQ0XwwVKxJG9hSKU
	4hBWmxYA8lHHtm2JXTIlMJG3bJTKDE9LzsyEVhY+oYlYTNDE8V7MKs
X-Received: by 2002:a05:6871:c8c5:b0:4ad:73bd:91b3 with SMTP id 586e51a60fabf-4bc829912cfmr8276733fac.9.1795339556073;
        Sun, 22 Nov 2026 01:25:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdc0acsm8698476fac.3.2026.11.22.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:25:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/2] mtd: rawnand: serialize OTP and BBT recovery
 operations
Date: Sun, 22 Nov 2026 02:25:19 -0700
Message-Id: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQ0U7DMAxFf6XKM0ZJl6ZphRD/gfbgpG4XWJOSd
 GVo2r+TtkhIvCH55cr2vce+sUTRUWJtcWORFpdc8FmUDwWzJ/QDgeuyZiUvlRBcQ7qY0c0Q8dO
 j7yBMFHHOS3AO9t35ARYBArnRPdVadZJlpylS765byutx19nmjey8Wq8TJ5fmEL82jEWsc/9Lz
 MWhUhUXvLdVr83LMKI7P9owsuN9j4z0ccn3zTsHM5gIcj97twVZQVpK00itDrxEqTUayw+EjdC
 dUbzmTa0UrawjpYTbY9ri6S/liDYG764Q5gkoxhDTD58A3SuJJXYVCv7L95wB798sdu0FiAEAA
 A==
X-Change-ID: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_012557_243116_C5FEB648 
X-CRM114-Status: UNSURE (   9.33  )
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

Use the existing chip/controller serialization for the Macronix OTP
transaction and for marker writes after a BBT erase or write failure.
Both paths issue NAND commands outside the ordinary MTD read/write
wrappers, so they must acquire the same locks and wait for suspended
chips themselves.

The first patch makes the existing helpers available within the raw
NAND core and uses them for Macronix OTP. The second uses them for BBT
recovery.

Assisted-by: Codex:gpt-6.2-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Rebase on nand/next after the BBT logging change.
- Apply the Macronix locking change on top of the posted OTP error
  propagation fix; both touch the OTP cleanup path.
- Link to v1: https://patch.msgid.link/20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com

---
James Hilliard (2):
      mtd: rawnand: macronix: serialize OTP access with NAND operations
      mtd: rawnand: serialize bad-block marker writes during BBT recovery

 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_bbt.c      | 2 ++
 drivers/mtd/nand/raw/nand_macronix.c | 2 ++
 4 files changed, 8 insertions(+), 2 deletions(-)
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
