Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4094C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 14:19:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C11892075E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 14:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTl+ukZV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcL9IbHx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C11892075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=o+xhnxza/XiJtnBwsXYOWUodN9ZCW6MKIYCxAwWHI30=; b=dTl
	+ukZVvDUcZLal2PsTwXnw2cIG1BM92MAu0L9BFbjSEngjMhnqBuK1yfK4rBrwSRyVJwhaFwGNp38E
	wq6IbswQT3j5/aROoVWEhDWfPpBzAzjvCkMro9KAeBD81+EYtGOmRJKrX52ZKjasMw/+KttYj/Pg9
	4mPU2d5ISnOxLPx7nhCWfXfug1IsHJK9VPNRDz0AxSLOzfN2qAXi8qhs/7Ag9TLz6b6rsLRSDJBfk
	WqohL/jviwKyuhm9UVpj6a2hgJMtxFcIdT3ZBA+ZcGENHUMh3R4XdeY+eekxJJ1O/4QeMPMgXzwl9
	iD9tD2yiIjvpWagwv2RyXpvMrU+w1Vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9VsC-0001tl-PZ; Thu, 28 Mar 2019 14:19:16 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9VsA-0001si-9q
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 14:19:15 +0000
Received: by mail-wm1-x343.google.com with SMTP id y197so1526550wmd.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 07:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kxi9Xw0rPP9E+6rF5Q2Up/hUyZzAdi6u3y6OfYt/pFE=;
 b=ZcL9IbHxWTKpH4iBWcXifyLWGngLEXBIJBpMHQpfTrbV+ux22Fh/FSQK03PTXhtgNR
 Wh36u7zA79B+CFma8aWq3OgHcRVDRV3waDne/n47SXujRhPKJLzvXKgDMsuYw9zhamn3
 1g84ptwmxd9cRibhSQF+sulUXi1ofmMdPkt6ys3S4J7z0AnaTt8ysk36OXpFQtD9i7hk
 xMRiMmHRmQVIKQrGuo1WvMlEvpnKomt2EyDgu5QtqueMMlJMG+yh7+JmtU6H544nS1g3
 SN8pAtemmgh6fvt+ZXadeDrA41uRVyM9TTWevxFjfA67IvUt6GfhzTO4L0+SNYb7YYoM
 o+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kxi9Xw0rPP9E+6rF5Q2Up/hUyZzAdi6u3y6OfYt/pFE=;
 b=BVeS7vCyQesi24NUtwcvH36CWjh3jFzrUzTdOCuOjk7TI5C+vLYCsds1tGopZavahc
 H+Ch6dW8twC2weZYyhUTb45jpR/uV6YkIl085AzYEAxz+s0bB3MWaG80WEcqkGv1yuAy
 kLa9UeyS4Sc5vxW8wJPVqlQUCM6oFCv0O/9C9GtGahlEXkdsAvKkDZ/nyJ2XpayZpt+I
 KMTQu4L6yMgeuyZYPW+rUptjIQefM8b5aSo4xOWs9AdS2RzqXQXQ9qq1O+Q/oWXexEwG
 FTegjPViwWtWqZphF4t9zJUk9rGTMwsyK8Q5n616nypVemKCxxEAWepDh1KkjTdIzYSp
 Wi9g==
X-Gm-Message-State: APjAAAX3sIQuqHla1jt6zgcdeyDbE6bfhLNXuhJyK8HK2ByiiWsleOjC
 HqmQ0eJ7LAitnnZ8LCPmMRA=
X-Google-Smtp-Source: APXvYqzIvoq0AsB1NwJuqv3ddxHk7iF+FoX+SAYHKTUrvjxkdNfgaDvkeLoAC0sxx/+AwqqHm2n6KA==
X-Received: by 2002:a7b:c382:: with SMTP id s2mr176966wmj.56.1553782751578;
 Thu, 28 Mar 2019 07:19:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
 by smtp.gmail.com with ESMTPSA id t2sm51802879wra.9.2019.03.28.07.19.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 07:19:10 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH V2 0/5] mtd: bcm63xxpart: add device tree support
Date: Thu, 28 Mar 2019 15:19:05 +0100
Message-Id: <20190328141910.5723-1-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_071914_345751_3535FEFC 
X-CRM114-Status: GOOD (  19.39  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patchset adds appropriate bindings for parsing various bcm963xx NOR
flash layouts found in the wild.

The image header is quite limited, and only has fixed fields for the
offsets and sizes of the kernel and rootfs partitions. If any additional
partitions exist, they need to be described externally, e.g. through
fixed partition layouts.

The first two patches add the bindings for the full flash parser for the
"common" case: first erase block bootloader, last erase block nvram,
reminder available for firmware.

The third patch splits out the image header parsing into its own parser.

Then patches four and five add bindings for the split out parser, to
support non-trivial cases with additional partitions, or a non-standard
offset of the firmware partition.

These patches have been in used since a while in OpenWrt.

Changes V1 -> V2:
 * dropped the second example from brcm,bcm963xx-imagetag.txt
 * added reviewed bys from Rob Herring

Jonas Gorski (5):
  dt-bindings: mtd: describe the simple BCM963XX NOR flash layout
  mtd: bcm63xxpart: add of_match_table support
  mtd: bcm63xxpart: move imagetag parsing to its own parser
  dt-bindings: mtd: describe BCM963XX ImageTag format and usage
  mtd: parser_imagetag: add of_match_table support

 .../brcm,bcm963xx-cfe-nor-partitions.txt           |  24 +++
 .../mtd/partitions/brcm,bcm963xx-imagetag.txt      |  45 +++++
 drivers/mtd/Kconfig                                |   1 +
 drivers/mtd/bcm63xxpart.c                          | 163 ++-------------
 drivers/mtd/parsers/Kconfig                        |  11 +
 drivers/mtd/parsers/Makefile                       |   1 +
 drivers/mtd/parsers/parser_imagetag.c              | 222 +++++++++++++++++++++
 7 files changed, 320 insertions(+), 147 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
 create mode 100644 drivers/mtd/parsers/parser_imagetag.c

-- 
2.13.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
