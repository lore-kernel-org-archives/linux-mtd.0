Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4742C5AD7B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 23:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pmq8E5FvLXiugmDN5uYR8AKM80gjgXbMi912jAa+hbk=; b=qwrSVicPE9sHZC
	24+t1sPM7zMfkguSc/qthpPqaItItjh72Z2mrbDsQBRilQ08syVTKsUhuOQQJdc058isFO2mMSbWS
	pN7Jk9LlVzToJ96i8M5DyFgA3ZiPOvce21Nf/WEKAsWlcQF4FAwdcVXUCNpy5A1I0QhOhC+6CzzbL
	qm1zDy7a8vMPfiYRKoDVQN8Yy9/dU7PiN6VOpggw6ya4DueTmEMhJ4X3F/1O35MmCfLsw8sxdJUxB
	XQqePo9lPXq9C1arBOwio7aN9bGrG3Jm3ti0qm1io3BjxUendoEDODVDxjnXHf43I5xrfHFek4r34
	3ckNJ/TWzWTDSCV9OOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3L-0000000D0JG-3Tja;
	Mon, 10 Aug 2026 23:05:07 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3I-0000000D0GN-161Q
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 23:05:06 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7ec1e9d3359so187697a34.0
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403102; x=1787007902; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nkXfL18wjL8DTexX95EbzIZJDQIzq4nnjKVqXhVM+tw=;
        b=dHyr4A7csGGUMI93LeyDiBhB8aDNHmwNDSwnAWLMR5gDNMfYOIyP2Fv8KY4/uytrlr
         O5FSAyXTfTCFcPhYmq3UuivuLe3a1mcGPRItQau1dPJZld3HGwptjlrbzL2bwmYyxkmK
         +SWDOwzkd+TObEbxQIsfToMrRfcLp6HYDfRJL6UT6tQWFsnCN9Fl3WZUAHqEJVx63fDS
         5FUbtsMDxg06aRDBgRcW6bpDTP0P8AVBZ/ZcR/4zaiUw6FAQzx9JkGJYCjGTP9U04/s2
         RIDs58cEFNEfJyceH1WqHthsXkvZfpqHevfAcJvEfxKNZaBQu3kNLPbSA0CrRa6WvCSK
         WJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403102; x=1787007902;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nkXfL18wjL8DTexX95EbzIZJDQIzq4nnjKVqXhVM+tw=;
        b=GBoGxCQqsCex+Q60zkKyg/xamH/XpRGnR2NpPlIQD/PeN60Mp1PDnjxjfQOo924Rtp
         r7j777datT6Y2o8uhVIM7Uf5rRrscG8Vn49xPNw6lBmBqQSeS3BXuG36clOpb167yfqT
         5DO2b+4Y7gpovzXHqEA7lWQd2eAkMUHeUewcpcLaWG/APoipNLaTIiTRKdQPcErcvSqV
         MnkTpZb9YD4A09/4A1GeiuO7mdpKcTScibaW8F6wADOGkwnjGsTbp/3YQkE4HNpHWYn5
         jrK+OT4cbVUhVLKeTjSEIVlEdjrh/s9kMyflcaaLju8fMJ76pNuxrhVHZ+oTVm+j85Fo
         aKnA==
X-Gm-Message-State: AOJu0Yw4RY4zn7DrkNAF+XHpfwMaVymceLhnPbG3hcuA7n3OZnOZEml8
	lGCqm7xlJNmbhZuvrVEpWWQPvpkAO9srVkTxIKg6PA0OuWvOvrDutq9/
X-Gm-Gg: AR+sD110Cx9iHZOtQWRAtggQat7OKq2dVltAtUBKYBgRPmWfEICqVOIbTy+WKIP1qAe
	USbfPOoAZtNZqCaUccVlFwCfKJYhkaRfDMN6EXQ/6qOov5N9vUTfeH2in+CNW3IRDC3YtzcnOqz
	wZ5CVoD32NmIyzI2zo4GcY3+t5JVetarpXSrK+pZbNtGXpt/Q/YQBYt/FaVBxG83+TQr3YfbOO8
	o3s9i2XkX0QiABJCisA25LFFxNs97gRKrv4rB9XciOB5lp2FEpuis1ANAtcWSGT8YhOZWWs+yx3
	+Knxo8gre5anLvZKmd8MqKXjUw/m7rygibmRCzF+oQyCfNsyn8QegEcBx541u87ZVy8+C9Q4+Ur
	H6c/Smqq9VfEklVYcCFkhWY/pF5IiGZiWmXHcEiHrYBNQ9bYeyH6GgtcLBIFlHy9vO3QyJpux6V
	QHV4sSuag5P+qoPOkdpzA/1IiQuCKDWoyTLBkK53t23l5mo5ihFjCy1GFKUZGIoOTGMM+6cBqzc
	nIaoqxBMgQt+1Hco1ucy45+Zbm7soyBTo7MD9nLUpXU9ugBjryqpK7mj+Aq4po7d2GKGP1uLbiJ
	oKqI8Keug/vfB98kVH6EkZnsebA/jTD0xDqP5g8vuimBFgSK0sEh/FPh030wbW02DRApXvDINkT
	JqvvlRc1PoudvLgjXmWiWJbiRE5RI
X-Received: by 2002:a05:6830:3913:b0:7e6:d0ad:5254 with SMTP id 46e09a7af769-7f1e5d8da15mr33431338a34.8.1786403102060;
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: sunxi: support the Allwinner randomized
 OOB format
Date: Mon, 10 Aug 2026 17:04:48 -0600
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBCF4auUWTuQaUXUq4iLdDLqiE4kSUOl9
 O5GXT2+zf8WyJJUMhy7BZJUzRqtgTYd8M3bVVBDM/Su37k9OczT+NTSxmZF8xawioWYMMYRH/4
 dp4KVUAaibSDHfGBosVeSi86/o9P571a6C5dvHdb1A2a1yZmKAAAA
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_160504_328566_847F938E 
X-CRM114-Status: GOOD (  11.15  )
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

The sunxi NAND controller randomizes normal pages, including their OOB
data. The mainline driver compensates the bad block marker so that it
remains plain on flash. On H6 and H616 it also fills the OOB space left
after ECC with protected user data. These choices produce a different
physical OOB format from the one used by Allwinner NAND firmware.

Add allwinner,randomized-oob to select the Allwinner randomized OOB
format. The property enables page randomization unconditionally, keeps
the bad block marker in the randomizer data stream, and selects the
controller-specific protected user-data placement. H6 and H616 use four
protected bytes per 1 KiB ECC step, capped at 16 bytes, with the complete
protected region placed before the first ECC step. Older controllers
retain their existing fixed user-data placement.

When the property is absent, retain the existing mainline marker handling
and H6/H616 maximized OOB layout.

The series first documents the opt-in format, then implements randomized
marker handling for all supported controllers and finally selects the
packed H6/H616 protected user-data layout.

Tested on an H616 board with a Toshiba TC58NVG1S3H NAND using matching
Linux and U-Boot implementations. Linux initialized the NAND, SPL and
U-Boot cold-booted from it, U-Boot loaded the FIT from UBI, and Linux
attached the same UBI with 2004 good PEBs, two bad PEBs and no corrupted
PEBs. A target-timed 64 MiB raw-MTD read completed without ECC, timeout
or I/O errors.

Validation completed with strict checkpatch, dt_binding_check and an
arm64 W=1 object build.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |  9 +++++
 drivers/mtd/nand/raw/sunxi_nand.c                  | 46 ++++++++++++++++++----
 2 files changed, 47 insertions(+), 8 deletions(-)
---
base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
