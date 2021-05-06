Return-Path: <SRS0=TrVe=KB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74796C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:20:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE72C6113E
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE72C6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XKxK+NlV854ji1y43vVux7mgCpjj1wJhtO0NP/49BAA=; b=lzwsZKAFxYEHoGWyR9Xhq4M9YQ
	ermmFP0ScpUFXOLaO9TclbyvV2rbf/J12wH2nB3vT0KyCyPCZtZvSmqOmnbk+UsB2T9HVZXSyxoCJ
	vYBeJzMXYCKt6YL43zn/eh4P49C0TJZtrdnBhVWq1MZqQDEnXCVkQmBmy9zpr4ysnybdOdonui/Hs
	QiBm87CS3PV2azm/To+z+0M9w5iOR4lLtIftdwlsmk3gfbuAyfKvTb4XyWhO7VrUiq8NpifaW2Fgy
	putF5/9cRgrJGJJoj0CvMEC94LDSq5hlbxxayyOxgCi3B5QHk0T0rb/mCDCDL3B+9e+iT9XQHrH90
	77uVtE2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lejWE-0057Z0-PY; Thu, 06 May 2021 19:18:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWD-0057Yh-Ms
 for linux-mtd@desiato.infradead.org; Thu, 06 May 2021 19:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=1wiZrWzcyNZj6lpRovJTnOwElMwQbWA/q/MvRyb+uZM=; b=OQrdd+agsa/B/p2scC0dUBOn/c
 +27/WTpyB9fdsxMMlzxBqk8LqotBEjLx9jlL1EX9QIxRq1uEpi7JzFSSt1fA/DiTZav4oS2ZwfhyG
 /JpSk9iHzmhYt0LT4MYj2tTw9p/LG4vWEn2So8FJWa24slda6tDDQvkTPhF3xZ1MSwitL1mSG16LJ
 wSH9/7uAf2eSOahiVq6hOpH6UKXnFhC5CR29UdKHtipVJ1GfrtocTwIwECVj+73N/5EkOTHfeuPC/
 DSKN6WEGB7e7e9iwfHgMWZrl7dFk/PUj0V/QrGqsuhjOx+VvcqAz/2CG+vQjJNbwg12uuQxbxcLKW
 n3sVYLyg==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWA-006KhJ-R1
 for linux-mtd@lists.infradead.org; Thu, 06 May 2021 19:18:40 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 146JIYdC080646;
 Thu, 6 May 2021 14:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620328714;
 bh=1wiZrWzcyNZj6lpRovJTnOwElMwQbWA/q/MvRyb+uZM=;
 h=From:To:CC:Subject:Date;
 b=TWfZf4q6lTgL/3z5HO3tshxouBbFYdaawlN1EuvFHy/O0FmvT46SoPQQ5VlSq3ZPn
 zMXTGKIVmbviL/8gaZd4jXzNWDCtC3FYt5AGTYDVIjqNQjbYKbzZUy/cqG75eeghGS
 6cpubmwf3dpVnjSRs/t/33j7p51PMUsIZt+XWUyE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 146JIYGX016536
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 May 2021 14:18:34 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 6 May
 2021 14:18:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 6 May 2021 14:18:34 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 146JIUNC026052;
 Thu, 6 May 2021 14:18:31 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark
 Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 0/6] Avoid odd length/address read/writes in 8D-8D-8D mode.
Date: Fri, 7 May 2021 00:48:23 +0530
Message-ID: <20210506191829.8271-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_121839_228595_468FBB3A 
X-CRM114-Status: GOOD (  11.79  )
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

On Octal DTR flashes like Micron Xcella or Cypress S28 family, reads or
writes cannot start at an odd address in 8D-8D-8D mode. Neither can they
be odd bytes long. Upper layers like filesystems don't know what mode
the flash is in, and hence don't know the read/write address or length
limitations. They might issue reads or writes that leave the flash in an
error state. In fact, using UBIFS on top of the flash was how I first
noticed this problem.

This series fixes that problem by padding the read/write with extra
bytes to make sure the final operation has an even address and length.
More info in patches 5 and 6.

Patches 1-3 fix some existing odd-byte long reads. Patch 4 adds checks
to disallow odd length command/address/dummy/data phases in 8D-8D-8D
mode. Note that this does not restrict the _value_ of the address from
being odd since this is a restriction on the flash, not the protocol
itself.

Patch 4 should go through the SPI tree but I have included it in this
series because if it goes in before patches 1-3, Micron MT35XU and
Cypress S28HS flashes will stop working correctly.

Tested on TI J721E for Micron MT35 and on TI J7200 for Cypress S28.


Pratyush Yadav (6):
  mtd: spi-nor: core: use 2 data bytes for template ops
  mtd: spi-nor: spansion: write 2 bytes when disabling Octal DTR mode
  mtd: spi-nor: micron-st: write 2 bytes when disabling Octal DTR mode
  spi: spi-mem: reject partial cycle transfers in 8D-8D-8D mode
  mtd: spi-nor: core; avoid odd length/address reads on 8D-8D-8D mode
  mtd: spi-nor: core; avoid odd length/address writes in 8D-8D-8D mode

 drivers/mtd/spi-nor/core.c      | 157 +++++++++++++++++++++++++++++++-
 drivers/mtd/spi-nor/micron-st.c |  22 ++++-
 drivers/mtd/spi-nor/spansion.c  |  18 +++-
 drivers/spi/spi-mem.c           |  12 ++-
 4 files changed, 194 insertions(+), 15 deletions(-)

-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
