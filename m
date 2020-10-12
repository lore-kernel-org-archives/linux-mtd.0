Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1094C43457
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 18:04:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF9E2076D
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 18:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S5oY5xNW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yBJLGoVC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EF9E2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zpJ5q2NZj9g3JxJV8otilQdK9klKOVFOiditppdxjAQ=; b=S5oY5xNWjjVJhyOxUxQiWToQC5
	CN2+FhQLJvTy4Hfbzl3hVmld1P9wTjF+sNUKImdvSxIZ7vUKSV86rKaK9OPt4zmVn9CaGwO0RG7Zp
	DL1OwFbzvK+joNTsYhLfgpdwP8Puab/1V/CQP98zYukAYdNFkJ5JxWggLROYr89ZoxT8IX2hRWOJM
	8RL783uBuzmOUZ170awLIXZZpGdV2+58cUAa/WxlZ0tQr8xMAWmaPdz+9K9GvDDiukMOi9LxkKbuC
	D7JcVhVtdFKwE9Xw7AKK8Ev3d465zChSxZaNXRUQR8Cb9MnzS31eyE0p6MM3MJQqleheWtwW/IJCk
	0gPz2OSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS2BF-0001Eg-KE; Mon, 12 Oct 2020 18:04:17 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS2BC-0001Dh-DH
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 18:04:15 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09CI48q7055209;
 Mon, 12 Oct 2020 13:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602525848;
 bh=ueTk+NXUctZm45WSAn64xT320s7C7sPFAPrludm8rhA=;
 h=From:To:CC:Subject:Date;
 b=yBJLGoVCIfUK24UfG/ogh6qS62wqpKEpkfU2yGmH4UpBS9toH/VjbT54px8KYAyb1
 em3APbdkZYxCKSJs1bnSYD6RiM5QjcKyJJroMOHXHgK0SayH4DJouGHOnnrdaqcsql
 JJwqKLB1IjO0frGUf0hwQe40hPoeKETxrT1271Jg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09CI481F100700
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Oct 2020 13:04:08 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 12
 Oct 2020 13:04:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 12 Oct 2020 13:04:08 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09CI45j2021531;
 Mon, 12 Oct 2020 13:04:06 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
Date: Mon, 12 Oct 2020 23:34:01 +0530
Message-ID: <20201012180404.6476-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_140414_636461_D1B4CCB7 
X-CRM114-Status: GOOD (  14.66  )
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

This series fixes that problem by introducing a flag
MTD_NO_MULTI_PASS_WRITE that tells the file system layer that it can't
do multi-pass writes. It also sets the writesize to the page size for
such flashes to make sure file systems know that they should write the
entire page in one go.

It is based on the xSPI/8D series that adds support for Cypress S28
flash [0]. The patches themselves are independent of that series in the
sense that they don't rely on 8D support. But since S28 flash is not
supported without that series, these patches don't make much sense
without it.

Tested on Cypress S28HS512T and MT35XU512ABA on J7200 and J721E
respectively.

[0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/

Pratyush Yadav (3):
  mtd: abi: Introduce MTD_NO_MULTI_PASS_WRITE
  UBI: Do not zero out EC and VID when multi-pass writes are not
    supported
  mtd: spi-nor: core: Introduce SPI_NOR_NO_MULTI_PASS_PP

 drivers/mtd/spi-nor/core.c     | 5 +++++
 drivers/mtd/spi-nor/core.h     | 6 ++++++
 drivers/mtd/spi-nor/spansion.c | 2 +-
 drivers/mtd/ubi/io.c           | 2 +-
 include/uapi/mtd/mtd-abi.h     | 1 +
 5 files changed, 14 insertions(+), 2 deletions(-)

--
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
