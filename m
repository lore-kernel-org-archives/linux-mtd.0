Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012EBC433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 12:23:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 900E922284
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 12:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qb4xymRx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pVtQGxSo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 900E922284
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=36IwXPtST2xFrGEOxzo79mJlcsey7F+Gd6Xn6PwplgE=; b=Qb4xymRxdgr/v8XtRmPcKBXAW2
	uEj8TrmRuTyVw28PpvUP3iGyXS9mRKpJXy+UNVvl2tPcnqb2YLp9qV9yb3beO+endKEYedyqrcngA
	UJrlklvlIcc8c0iv6DkN9ev4MpJG7gSSHg4L6vGe8s9PFoOHh+zbwAttdYKiIsOexGc1oduGg32eF
	5+3q5z9cTrN9gPP/IVfmkmXxbihg3ERHpFKeZgFGcb8d72+EuJNUzAyetyHA04Ah2y5v5pbJHA0W1
	QbzbM8TKHEGKZmqtLQpP4XYDYlAsJGsZGJiy9e+5N2vFkT3EgYm0EWxijt5lwcZ/e0RL2kLsokfie
	nSPykmpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQrQM-0007oF-Ot; Fri, 09 Oct 2020 12:23:02 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQrQJ-0007nb-4x
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2020 12:23:00 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 099CMuhT125787;
 Fri, 9 Oct 2020 07:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602246176;
 bh=SBimvmacFTcGqlasAygx09rqk0xtvaO4kxa1H7vBKvY=;
 h=From:Subject:To:CC:Date;
 b=pVtQGxSoB67/RyoJ1RtQ+Jw9GLF9o3ilamiV7zKIBEb0/QVqMi8rUNZX0jvW2Kn9c
 HCTziiEYXuJHR3g4hf1FTYcE3bq4Khf+QfLkUfxaDav2sv7aSKssvhit+8fcytc9jS
 hW5Rg54mPDYnLUTER3n6gGTeYxeeob8J2tFc39tw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 099CMtwk086287
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 9 Oct 2020 07:22:55 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 9 Oct
 2020 07:22:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 9 Oct 2020 07:22:55 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 099CMrfw110770;
 Fri, 9 Oct 2020 07:22:54 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.10
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>
Message-ID: <f91ae16f-7995-aa27-c2ff-4e519929417e@ti.com>
Date: Fri, 9 Oct 2020 17:52:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_082259_703500_B6D942BC 
X-CRM114-Status: GOOD (  12.15  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel, Richard

Please pull SPI NOR changes for 5.10-rc1.

Regards
Vignesh


The following changes since commit ba4f184e126b751d1bffad5897f263108befc780:

  Linux 5.9-rc6 (2020-09-20 16:33:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.10

for you to fetch changes up to 9a3422a110c868e511387a81df25a315eaa3a7b8:

  Revert "mtd: spi-nor: Prefer asynchronous probe" (2020-10-06 10:46:07 +0530)

----------------------------------------------------------------
SPI NOR core changes:
- Support for Winbond w25q64jwm flash
- Enable 4K sector support for mx25l12805d

SPI NOR controller drivers changes:
- intel-spi:
   - Add Alder Lake-S PCI ID

----------------------------------------------------------------
Douglas Anderson (1):
      mtd: spi-nor: Prefer asynchronous probe

Ikjoon Jang (1):
      mtd: spi-nor: winbond: Add support for w25q64jwm

Mika Westerberg (1):
      mtd: spi-nor: intel-spi: Add support for Intel Alder Lake-S SPI serial flash

Robert Marko (1):
      mtd: spi-nor: macronix: Add SECT_4K to mx25l12805d

Vignesh Raghavendra (1):
      Revert "mtd: spi-nor: Prefer asynchronous probe"

 drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 1 +
 drivers/mtd/spi-nor/macronix.c                  | 2 +-
 drivers/mtd/spi-nor/winbond.c                   | 9 +++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
