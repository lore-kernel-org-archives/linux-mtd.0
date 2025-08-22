Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E37CA0EE4
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=SdjnjFETWAg+/HwlZgXccSVtxwHMtIWrxi0zGODN6ZM=; b=zVO
	rLAUb0IbegPqlz1jtTB77zVg7baW8zKLJrP9obe2sHHZOLMufUgxADzHiBlwZoE9gQiNujg/KdPKp
	rSLqHwQh8Ol0IQqL1mOfbp3zJKLTgdEJS3NaLFifmgtoO3GCfapjRwWDQ4xUUPfcmtjUVTtsX6mBZ
	vQr31sGGEMjw0NxnKEVyD/LO3saSOHHzuR7fD+qGyhF2zB283ry2RkgD2MUuEBCIk6W+eB357G+XY
	qwRCa+DRI/1YmPLqX2uLHJzfbGP03EC8tH/yeySKS5BRFxVKSuJJB3aK7kCi4SEDHTtsBD5uxmkBV
	GoAeB/OS7ZS8CgNiBbxwGY16Gxrtqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphjx-00000003wD8-005g;
	Sat, 23 Aug 2025 06:28:37 +0000
Received: from smtp16.bhosted.nl ([2a02:9e0:8000::27])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQUI-00000002Prh-03kJ
	for linux-mtd@lists.infradead.org;
	Fri, 22 Aug 2025 12:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-type:to:subject:message-id:date:from:mime-version:from;
	bh=agZH95BV+SfNfW4ieKsz9a1uyUEhoiBk3JniUxmCs3s=;
	b=asJgRDfZ2LtxQUP46zZ5Gz8XdQAbWfZnKprwtX8sNM9JtDJGlttjvxnLb2O4sK2dkv2CRoNUMnznp
	 aASdlr7t2SrNsKS99CM9trXYs/OCjNwdiOdr+Fwzf9pTo0y3zui5/YL6QNJ1f63FuXu8YEjvg/sM32
	 N9fe2qQ1YQb/lE5C90qgdSkLiWDPA0o+Tn/Z45WS+YZVkLPSQYn6TrengR8XbwByyOqku7OMUg3xbn
	 PG+kqD2wRYhs5Xtzu5VyXihc3s/YHkBbzH9GudLcwdSn4vf9+KZKl1/UhiUCdJ+UuwPfI2m/ZKbhHn
	 aQ/QCi/ac6KPU9zca4OVrN7rTjzKTrw==
X-MSG-ID: fb6cd2a4-7f4f-11f0-8568-005056817704
X-Forwarded-Encrypted: i=1; AJvYcCVPJokoWb92nTY2TZ83Lkjqw50AVNTUhFFrZEa60Wiczt0e6w81XtDRHIhQuU7QOw1ljYPbe5FvFEc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHb0/Tlh8vgPrm1/bFKycKQNCQOdmaICsKxYg3KMwrA0kNrJdC
	1XJBcOOwl6/HIFbhDUb+4tnPtoFpsmPdicMNWXcB+sWCKlPqHGvTqq18+ptDRDSdhtSnQOSw/yx
	1Ej0d3F1JBH8jr7C31XMJPihwCKNfVWA=
X-Google-Smtp-Source: AGHT+IEQ07x0gnWG64Aqq/nxF5ljgHgVfwnjUS7NmxwqdyQmR9cpuJbXK26uQT0Li5qLunE3fuUAxq1cPId3vPYwwMQ=
X-Received: by 2002:a05:690c:12:b0:71b:f7b5:8979 with SMTP id
 00721157ae682-71fdc4234a3mr28102007b3.37.1755864194245; Fri, 22 Aug 2025
 05:03:14 -0700 (PDT)
MIME-Version: 1.0
From: Maarten Zanders <maarten@zanders.be>
Date: Fri, 22 Aug 2025 14:03:02 +0200
X-Gmail-Original-Message-ID: <CAPB_pELpdie+=VB3h3tqZCkdTd9cKyhnYNmXjeP1vYODDricLw@mail.gmail.com>
X-Gm-Features: Ac12FXzfb9RYBSETJdN4v8lzOCgQhVBUiCIRU1WYCbn5jFypx93tM3WeNaxJdiM
Message-ID: <CAPB_pELpdie+=VB3h3tqZCkdTd9cKyhnYNmXjeP1vYODDricLw@mail.gmail.com>
Subject: [spi-nor] Macronix MX25L requires CR read opcode 0x15 (not 0x35)
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_050318_187351_465E402D 
X-CRM114-Status: UNSURE (   5.90  )
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

Hi all,

On the Macronix MX25L12833F (ID 0xC22018) & others of this family/mfg,
the CR (condition register) must be read with opcode 0x15. The driver
currently uses 0x35, which the chip does not recognize.

Datasheet: https://www.macronix.com/Lists/Datasheet/Attachments/8934/MX25L12833F,%203V,%20128Mb,%20v1.0.pdf
(p.27, RDCR).

With 0x35 the data line floats and the driver reads CR as 0xFF
(depending on previous state of the line or pull up/down). This value
is then written back in spi_nor_write_16bit_sr_and_check(), setting CR
to 0xFF. One consequence is flipping the OTP Top/Bottom protection
bit, so from then on, locking the top block actually locks the bottom
sector. This breaks bootloader updates (in my case) and similar flows.

Possible fixes:
- Make CR read opcode configurable per device.
- Force Macronix parts to 8-bit SR accesses (clear SNOR_F_HAS_16BIT_SR).
- Implement T/B bit handling for Macronix (needed for already-fielded
devices with flipped OTP bit, but complicated by non-uniform
protection blocks).

What would be the preferred approach? Other ideas? Anyone seen similar
with Macronix parts?
A quick fix which can be backported easily and the full implementation
later on would be beneficial IMHO.

Thanks,
Maarten

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
