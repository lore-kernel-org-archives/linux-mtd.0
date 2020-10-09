Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50543C433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 11:44:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1F2122268
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 11:44:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uq4oZ6JK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MN1KsAKE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1F2122268
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=97Qai03hBDAaMZY5lYgrbWX2plnml3L/ePXvlRLp8nE=; b=Uq4oZ6JKCU/JVqJUllzEYr1Xyh
	y/s48CIMyo9RaJOfrpIIoPSREiTxTjw1oXv/nC+AmPGpsNCbcNuBi9/lOyBAmtJyUlnGOBNi7XvNs
	DxAZku5s+WHeQzew2szRMMdptYP7CET4GnWY+vsKvdE6MWw4K/PbldGayZA4RZeyu/y5qGgAp7BOe
	+2//rjPAgeLg5LEGV3+eZZArDhebMuCVGfcOpzdUUfDf11JkMhnGeto+Cp9rT1q7CKXvIf04pkkF3
	ntvYTc2BmBvsNqahnUvVhcMb/Y2n0Jn1Ak+wgoL8KTLuwvzdtL7y6FD32KM9nNQ9kE3QpOWONmFJy
	RXE7QdOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQqoO-0003G1-0E; Fri, 09 Oct 2020 11:43:48 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQqoL-0003FC-Ck
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2020 11:43:46 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 099BhddW112227;
 Fri, 9 Oct 2020 06:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602243819;
 bh=kbmzpSBnjsoZnqZ/qE6YiojSx7UE6gm6NgaocJymKOo=;
 h=From:Subject:To:CC:Date;
 b=MN1KsAKEFRINzOlo04qh9Jvv0NwrDTF1mqSKsoewgtqfSt2dwe7UZelc32do3MGG1
 4uRYecftDbiG3QF532lh93mzomjWIHNwZUFyCA2MYthELcX18I48QBgN8MGYveB8hJ
 hKWNxXH9+E3/iqjpOoHzguKiCdeLhStehqdyi4vY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 099BhdUU063784
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 9 Oct 2020 06:43:39 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 9 Oct
 2020 06:43:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 9 Oct 2020 06:43:39 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 099Bhbpd058344;
 Fri, 9 Oct 2020 06:43:38 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL] CFI and HyperFlash changes for v5.10-rc1
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
Message-ID: <6755a43e-1fec-4a5f-760d-44ac834787aa@ti.com>
Date: Fri, 9 Oct 2020 17:13:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_074345_526883_C9498015 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi  Miquel, Richard,

Here is the CFI and HyperFlash related PR for v5.10-rc1. Thanks!

Regards
Vignesh

The following changes since commit ba4f184e126b751d1bffad5897f263108befc780:

  Linux 5.9-rc6 (2020-09-20 16:33:55 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/mtd/linux.git tags/cfi/for-5.10

for you to fetch changes up to 5de15b610f785f0e188fefb707f0b19de156968a:

  mtd: hyperbus: add Renesas RPC-IF driver (2020-10-06 12:36:21 +0530)

----------------------------------------------------------------
HyperBus changes

* DMA support for TI's AM654 HyperBus controller driver.
* HyperBus frontend driver for Renesas RPC-IF driver.

----------------------------------------------------------------
Sergei Shtylyov (1):
      mtd: hyperbus: add Renesas RPC-IF driver

Vignesh Raghavendra (4):
      mtd: hyperbus: Provide per device private pointer
      mtd: hyperbus: hbmc-am654: Fix direct mapping setup flash access
      mtd: hyperbus: hbmc-am654: Drop pm_runtime* calls from probe
      mtd: hyperbus: hbmc-am654: Add DMA support for reads

 drivers/mtd/hyperbus/Kconfig      |   7 +
 drivers/mtd/hyperbus/Makefile     |   1 +
 drivers/mtd/hyperbus/hbmc-am654.c | 144 +++++++-
 drivers/mtd/hyperbus/rpc-if.c     | 170 ++++++++++
 include/linux/mtd/hyperbus.h      |  13 +
 5 files changed, 319 insertions(+), 16 deletions(-)
 create mode 100644 drivers/mtd/hyperbus/rpc-if.c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
