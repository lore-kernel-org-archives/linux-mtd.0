Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764C4CCFA04
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sctqE+wJPA4DfDST32+BOcL0SKMOwR2tHoThBIrObso=; b=cm/1xHeqceIaNU
	z1qyefTDMKHy6McSMhxvtpFa3tYvd3PoXLPYZKm8JhB3gr4fN3Mm9dcLZoM9tAdBN1kxSFUxWsmUx
	lioUQUd98XKK1Wu5dv2pb9daufKC254aEm24UWhIJ4X3v0fqcU2s+/IV7czWNjckXO1xjIWZZfOZ6
	5C0X05ViM7eY4aTOrkvD/sXkjFeSA1VLx2AVPJXFciskM9JGM+kQHLEuW6ptAmMspK1p1bsR4VDIw
	S7nsUk28BNmiFANAJZSkDc6cSDnODdsN6N1UwKE/134swq6XoTmx8bf7oqERDrdsDQjzE+dN3+dZG
	0EbT/l/C7VQXZBRlrP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stZqO-00000006bBe-3j7r;
	Wed, 25 Sep 2024 21:46:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stZqL-00000006b9n-3vdv
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 21:46:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42cc8782869so2334385e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 14:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727300800; x=1727905600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GVmVgaclLf08yTC2h5OjCOTI7DSU5jBV3Cn+WzQVxUs=;
        b=ElE/wZs3H3G7c3ZgaCxYA76FSB10B7yRV4duez0TcycT9chY73n+WLG+qNzvf6Kj1B
         YbuDCPv84Vf/5lnZ7PD1K/+j5LGVEJtRBPams9g1sLEouz23/1JiCnnmqGcDxZNUO8Ou
         JUmzGwQBR+Ay55SBQkwXZUxe+0DNhTNu00FG/BvSjfWpo41A1zaZV7qLp6WGBzcm7PPk
         0w9wHzxZ/iXLDRSgNLElUlS/8I67kbBfcvWBZ4WRkYtMD5FKVNiq9lKGeMoBb3p6g10I
         bnXBr29G14HK4CbjpmYpoJnnAN7qtVXmuY2r1mWJ/aYbEZlrWLdiSS/JfteV8xXHWzP9
         eoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300800; x=1727905600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVmVgaclLf08yTC2h5OjCOTI7DSU5jBV3Cn+WzQVxUs=;
        b=ZyZPfpcexI5Pt4GajjqnyEVnD/iQraYe9mU1w7bmq6Tx8JDeaTj9QPP9tgJIDFzunv
         fkVCApNQv026Klo9ZuG7U8ts97FAUBW5tfrdNKpQLMlWla2hPV4eWX1ZNEUlZV+iJ2cq
         RFeVb+35FTXWvVaeMcQcRSfvUW+PhUoohOpo5AAXPBvyqUWiF+fv6gLbCBd0E/dbIhE2
         lQrni+z5jbWH5NH6GhVPq84GoQ/7Jdz4VW2c0iqYfxnw7Ck7TFhNeAH1PEx9CS/aS9dX
         XjnePsvhw4q5dabL7q4AekqfwtdXVMRbmigSUUOAokEiVd/3GRBaAZl4SChr4fkcGa/E
         SqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBWgxZW25pcan6wlB1CKXSJFzMLktiYGruAt4pNV2qx7wcAwZKDJGKgBEV4TKwabgbobmG2iUd2YA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkR9Bi8szP2U0i1bUvXAq2vN15lRSBARvONLUL+zwvL7s/sJ9M
	OC3lwBXLXFfWVp8sIS5wWqkG6q3SAMGkExo0xlbr2jgo7vK+d2EJ
X-Google-Smtp-Source: AGHT+IFLnDQbe1OOtOZOCODKOAoHYW+yOXDMI3pVNSMriwEKjgwO+0xQ1+cxh4UpT8hlWIhtMosbxQ==
X-Received: by 2002:a05:600c:3107:b0:42c:b995:20d9 with SMTP id 5b1f17b1804b1-42e9613634fmr31493025e9.28.1727300799582;
        Wed, 25 Sep 2024 14:46:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a1f2aasm28802565e9.45.2024.09.25.14.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:46:39 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Simon Glass <sjg@chromium.org>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Li Lingfeng <lilingfeng3@huawei.com>,
	Christian Heusel <christian@heusel.eu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [RFC PATCH v2 0/5] block: partition table OF support
Date: Wed, 25 Sep 2024 23:45:20 +0200
Message-ID: <20240925214544.6114-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_144642_170304_95AF8724 
X-CRM114-Status: GOOD (  27.43  )
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

Hi,
this is an initial proposal to complete support for manually defining
partition table.

Some background on this. Many OEM on embedded device (modem, router...)
are starting to migrate from NOR/NAND flash to eMMC. The reason for this
is that OEM are starting to require more and more space for the firmware
and price difference is becoming so little that using eMMC is only benefits
and no cons.

Given these reason, OEM are also using very custom way to provide a
partition table and doesn't relay on common method like writing a table
on the eMMC.

One way that is commonly used is to hardcode the partition table and
pass it to the system via various way (cmdline, special glue driver,
block2mtd...)
This way is also used on Android where the partition table
is passed from the bootloader via cmdline.

One reason to use this method is to save space on the device and to
permit more flexibility on partition handling.

What this series does is complete support for this feature.
It's possible to use the cmdline to define a partition table similar
to how it's done for MTD but this is problematic for a number of device
where tweaking the cmdline is not possible. This series adds OF support
to make it possible to define a partition table in the Device Tree.

We implement a similar schema to the MTD fixed-partition, where we define
a "label" and a "reg" with "offset" and "size".

A new block partition parser is introduced that check if the block device
have an OF node attached and check if a fixed-partition table is defined.

If a correct node is found, then partition table is filled. cmdline will
still have priority to this new parser.

Some block device also implement boot1 and boot2 additional disk. Similar
to the cmdline parser, these disk can have OF support using the
"partitions-boot0" and "partitions-boot1" additional node.

It's also completed support for declaring partition as read-only as this
feature was introduced but never finished in the cmdline parser.

Posting as RFC for any comments or additional checks on OF parser code.

I hope this solution is better accepted as downstream this is becoming
a real problem with a growing number of strange solution for the simple
task of providing a fixed partition table.

Changes v2:
- Reference bytes in DT instead of Sector Size
- Validate offset and size after Sector Size conversion
- Limit boot0 and boot1 to eMMC and add comments about JEDEC spec
- Generalize MTD partition schema and introduce block partitions schema
- Add missing code to actually attach the OF parser to block partition core
- Add reviewed by tag for read-only patch

Christian Marangi (5):
  block: add support for defining read-only partitions
  docs: block: Document support for read-only partition in cmdline part
  block: add support for partition table defined in OF
  dt-bindings: block: Generalize and introduce property for partitions
  dt-bindings: mmc: Document support for partition table in mmc-card

 Documentation/block/cmdline-partition.rst     |   5 +-
 .../bindings/block/partitions/partition.yaml  |  33 ++++
 .../bindings/block/partitions/partitions.yaml |  27 ++++
 .../devicetree/bindings/mmc/mmc-card.yaml     |  57 +++++++
 .../bindings/mtd/partitions/partition.yaml    |  10 +-
 block/blk.h                                   |   1 +
 block/partitions/Kconfig                      |   8 +
 block/partitions/Makefile                     |   1 +
 block/partitions/check.h                      |   1 +
 block/partitions/cmdline.c                    |   3 +
 block/partitions/core.c                       |   6 +
 block/partitions/of.c                         | 144 ++++++++++++++++++
 12 files changed, 287 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/block/partitions/partition.yaml
 create mode 100644 Documentation/devicetree/bindings/block/partitions/partitions.yaml
 create mode 100644 block/partitions/of.c

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
