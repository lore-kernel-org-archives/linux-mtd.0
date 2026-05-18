Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C446CD4F52
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2026 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c71o34G309pmwTZ69iUFWUapNfhDND7Kphu89TsUt3A=; b=AI0acS1/LYL8Cx
	iJ2gFX3nfrGeOK5mMkEX95BqHrpi2wBCfpH/FslQrHzKWM5m3JXIFYhM8232Kn0WyOOD/e+NEfuuE
	vK0KzG9cEOuBLzC/bPyQgFGo5kQ+XoaL0yVlyAIz3S+NMVzWg4OylzlFQedWAuKb8oIIddkW/kTDd
	rgmIVboxyaBGO39NzvSwhpDs+CcOoHbXbg338WXQ3wBSNyMOg9MfcTbOURdua2dwwp8Mq06TOp2Uw
	wzDkP84JKjeHSNyfMsNTyfJypxtAMfQwJ+mbgbM4lsDYZjeu6GvqsAcFKilLaGR4facwVDDJ193m4
	L59xhkV3VUkJUnWwp4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRI-0000000FUOB-0Qru;
	Mon, 18 May 2026 11:47:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRH-0000000FUNw-0myn
	for linux-mtd@bombadil.infradead.org;
	Mon, 18 May 2026 11:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HP1FkQP3upUXw27uw6hA2g2czB6GYP9RbzsbFRYmzIQ=; b=aoxTYqbg+e3cedQA5t1BdUlRcu
	ht4mH7exyoocUj4jiYxQUYdVUaigfsIpIcjmRT90goWCwg8fh1PTgj+wRW5+4v5Gaue+asCKVM5D7
	EAxt9RkJzDWUq9tk8E5MtIkZc8Icu1yBfExuDJ/fkfnGJWONcCLkCW/eBDtOEjgXjoDo0VUgIyaSR
	AiJQG0iPyROPmC0wHZSsR7l1IZi4mknei9NEyvjW1z7jbeZRmWyGYTlaFL5udt1JcdzbFsn63cInV
	AUqYfJyeHTjY+VCBn9fm8B07cbncrqYlsSkNemi7R89zVwFUE+MZwYuXlCaOTtJcvlsi7vBj66DAM
	kWe12m4g==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRD-0000000Aztz-2zZP
	for linux-mtd@lists.infradead.org;
	Mon, 18 May 2026 11:47:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso11805165e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 18 May 2026 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104829; x=1779709629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HP1FkQP3upUXw27uw6hA2g2czB6GYP9RbzsbFRYmzIQ=;
        b=qGXDONnvbLF2lJGVLTWz+RtySqc8sNTLd+QjcdEjRNU5yE3UqQ8sra+b2woWsv3Orj
         uLP8iB+ZKYvqvF9HQ/8f9ZhOCnLbN+0+Y5YBEzp7z564OLd6BD4UTdHFe/Fi7ud1AWq+
         vvwaPQ2A6bNBPrcHALFvolo2o+f6v5t9qZeg1/ERqD8HUhQ/LibDUbsi5SwxVXhzXr2d
         CDWNW6ZOtcy9LhIYE1EX6DG9Wl9ReYRZZjaYWB1G1QhNWhboI93h8wllkbqAgDpT+sbi
         jG7CxrnsvG1D5B+36F3pMH8sobUZ6u5JEkuLi7qdLqW/wWHCVxLv16Lym/Nadllxg1cw
         TtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104829; x=1779709629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP1FkQP3upUXw27uw6hA2g2czB6GYP9RbzsbFRYmzIQ=;
        b=MprkG8OqOQ5/dE6t5VlvWs2zc6Iduhk2AW9KaWwz7iHze4L6eJ2duYLnY+Y+ZB+mcp
         YvfMl9zYVuhSquwgrkOsOM6bXZ2ApXxO7WKCM4bG3eDV4cV3hLFkiM87LYxecsXl4DK9
         SvCg5RJBt58T6mwfA+1QH5bisL/c8mCTSLXkMwEapRmC5PRjHD1gHM9wrRucrCb7DIQb
         hDX63FgBjYbGqHbVC6s3cF79etHdn+PTJ75JV9qjqOuGoSGZ25GEOe/BalcHqnAIeVgt
         7KkokhwQz96bx2a8b4c8k7RS7B4lmbKZp4qY5J9FPQCvfmVxL0DIsTTPUoXkU80GRRJb
         f5Lw==
X-Forwarded-Encrypted: i=1; AFNElJ+wXK50WGBwEEbl++wkWTPDnSG6rwQCFog5+l2+endrmJTPlSNvKe5E9IBH8HDx5F8Pzn2x3pSI3Wo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiwG8kzCSpF1NBf9S3tYWh54dGosX0McmFPB9o+pwqzAUqAAcn
	TeCtr+NXR891p6jjSoKgVYzP1awmuR5wurA2GETir7CIvBf+sSKCfzg06tnmDiQ=
X-Gm-Gg: Acq92OFl6D6dmX8iud/lh3W3FBSWNzpWDgi9TV0VAjebIXrjWNbqDVwUAOgIIe76T3P
	DPOrrvX624fqeJo3giDg6qSnZ0MuEUzy22ZRu9qu/amY01pIN7iAlP2t6SxkrWMUHGKt+xpd4bE
	UnoiYq4187LAihbP9GzRKtSeWqQ75At5FD3376/5xepN0Mmwj44oY25AzbneeWyxeiXy/moSsp/
	bATQlyfM/prUOZkXQf+sCcwivsEIe7L2yvdzKXdQyrhA4HuM+SphtLPYdbbDJHFtfv9ByD9oAPo
	hN1scvKrsVwhTLjAcPDuv8F+sydEHIP9sAkVoeyjBHMtwtxwGISxnEnQse3g8f2BlWmZcD7tu8H
	25GF/orfVY90iQ/3l1Xis/qUwidayq0uHi6WzPFa/7Y7ML1ZSQ4G4akeiL0I21usPk1f5BK9Mfe
	qpU7CSAL4RNEz0+QJNYchJ9lKvkcGNZzGi/qYutt8wUY7PmfQR8wohVnzf5y/kH2mXkeP7W+2oR
	AwFBIeT
X-Received: by 2002:a05:600c:3f0f:b0:48f:99a9:bbcc with SMTP id 5b1f17b1804b1-48fe60ecb9cmr207456935e9.10.1779104829093;
        Mon, 18 May 2026 04:47:09 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:f15c:fd38:3fe1:9653])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9e767d0bsm35203411f8f.3.2026.05.18.04.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:47:08 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Adrian McMenamin <adrian@newgolddream.dyndns.info>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v3 0/3] mtd: maps: vmu-flash: Fix build and runtime errors
Date: Mon, 18 May 2026 13:45:18 +0200
Message-ID: <20260518114521.81564-1-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124712_180258_1917F001 
X-CRM114-Status: GOOD (  11.82  )
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

This small series fixes build and runtime errors in the vmu-flash driver
(enabled by CONFIG_MTD_VMU) and the related maple.h. These changes were
verified on real Dreamcast hardware with a physical VMU. The VMU can now
be successfully probed, read and written with MTD tools like mtdinfo and
mtd_debug. Previously, the driver failed to build or crashed during
probing.

        bash-5.3# mtdinfo /dev/mtd0
        mtd0
        Name:                           vmu2.1.0
        Type:                           mlc-nand
        Eraseblock size:                512 bytes
        Amount of eraseblocks:          256 (131072 bytes, 128.0 KiB)
        Minimum input/output unit size: 512 bytes
        Sub-page size:                  512 bytes
        Character device major/minor:   90:0
        Bad blocks are allowed:         true
        Device is writable:             true

Thanks,
Florian
---
v2->v3: Add Fixes tag to respective patches, fix subject to previous
        commits
v1->v2: Rebased patches and fixed the hotplug issues in other sh
        patches.

v2: https://lore.kernel.org/lkml/20260427114750.2480900-1-fuchsfl@gmail.com/
v1: https://lore.kernel.org/lkml/20251117224408.498449-1-fuchsfl@gmail.com/

The original v1 was postponed until the hotplug issue and other runtime
panics were fixed by the following patch:
"[PATCH v3] sh: maple: fix empty port handling":
https://lore.kernel.org/linux-sh/20260515181115.3244161-1-fuchsfl@gmail.com/

Using VMUs while some ports are empty requires the above patch.

Florian Fuchs (3):
  maple: fix build error due to missing include of linux/device.h
  mtd: maps: vmu-flash: fix fault in unaligned fixup
  mtd: maps: vmu-flash: fix NULL pointer dereference in initialization

 drivers/mtd/maps/vmu-flash.c | 7 ++++---
 include/linux/maple.h        | 3 +--
 2 files changed, 5 insertions(+), 5 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
