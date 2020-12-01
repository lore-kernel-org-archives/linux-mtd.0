Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AB9C64E7A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 10:28:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE0A520770
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 10:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TVSn/WL5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dSPRwwKd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE0A520770
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a7YDabAApTxwD0fH7xqQF30WJEO/FOuh1qgouPU+oqc=; b=TVSn/WL5C9bQIOijdBFDw5s6Pb
	LwYInG+KhAa7KKHtMdrHXDlv6no01MS7dGt5Tifj+SK0fLONc7umm+iJK+SDL7bdr/VlJcgJFGLIh
	BJnHklYHKCzL8g+U0tsk7QhIvYn5ZKhVLdks1WnMkHVnQV/9tdl4SGmY9tkjv6rrhEFTGaNp/EVzL
	k14/i/6RiVr6J++JyH9tFGdTIKKonTo9jh0MGktxC2zOSbo3p0hQUH0wUQJL6VnuFiXauxrk0TvWN
	Pt0yX38ikoT1WoW24rFg8+fUEgwzYyP0p69dLal7o0Q8oXq17yM0ELqxRaT52WVl4h4RMUuRA9tfy
	jPXolsfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk2sU-0005pB-PR; Tue, 01 Dec 2020 10:27:22 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk2sR-0005ni-Nl
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 10:27:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1ARFoF026753;
 Tue, 1 Dec 2020 04:27:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606818435;
 bh=dzMlfGnG8XmlsSokD5RUWqJd9nznHlbq2+gpDGLKO48=;
 h=From:To:CC:Subject:Date;
 b=dSPRwwKd4jtX3qiI4RHJJZ/9fh14BfSWgoK2Po+SBnVZ8so7MqQ6Rf0GhBGZxM6k6
 8cAtKQxpdYmDa3dU0Dhvmxfi/qqsuSpuq9pkudLVDR7WQM04FTxCi5q+EZm5z/XYJ8
 p8ZO547RselZoRC1yp/40d5zmm52KOX2i2PU42Zg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1ARFmq095872
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 04:27:15 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 04:27:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 04:27:15 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1ARCuY080862;
 Tue, 1 Dec 2020 04:27:13 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
Date: Tue, 1 Dec 2020 15:57:08 +0530
Message-ID: <20201201102711.8727-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_052719_874814_4A95787D 
X-CRM114-Status: GOOD (  16.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

The Cypress Semper S28 flash family uses 2-bit ECC by default. Under
this ECC scheme, multi-pass page programs result in a program error.
This means that unlike many other SPI NOR flashes, bit-walking cannot be
done. In other words, once a page is programmed, its bits cannot then be
flipped to 0 without an erase in between.

This causes problems with UBIFS because it uses bit-walking to clear EC
and VID magic numbers from a PEB before issuing an erase to preserve the
file system correctness in case of power cuts.

This series fixes that by setting mtd->writesize to the ECC block size
(16) and making sure UBIFS does not try to do a multi-pass write on
flashes with writesize > 1.

It is based on the xSPI/8D series that adds support for Cypress S28
flash [0] (it is in next now). The patches themselves are independent of
that series in the sense that they don't rely on 8D support. But since
S28 flash is not supported without that series, these patches don't make
much sense without it.

Tested on Cypress S28HS512T and MT35XU512ABA on J7200 and J721E
respectively.

[0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/

Pratyush Yadav (3):
  UBI: Do not zero out EC and VID on ECC-ed NOR flashes
  mtd: spi-nor: core: Allow flashes to specify MTD writesize
  mtd: spi-nor: spansion: Set ECC block size

 drivers/mtd/spi-nor/core.c     | 3 ++-
 drivers/mtd/spi-nor/core.h     | 3 +++
 drivers/mtd/spi-nor/spansion.c | 1 +
 drivers/mtd/ubi/build.c        | 4 +---
 drivers/mtd/ubi/io.c           | 9 ++++++++-
 5 files changed, 15 insertions(+), 5 deletions(-)

--
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
