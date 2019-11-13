Return-Path: <SRS0=mbSa=ZF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06663C17442
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2019 04:44:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF31A222D3
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2019 04:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qlPqwaCg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y0DFwwa9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF31A222D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mwNOSnxZgnSMCsV7zS4X3O8Jkgj1uUNXg+7Xd6dieMw=; b=qlPqwaCgn6IIyF
	YgoVPbq7z2308FGuLcLGBRhv3m4vtV4WDRMi7dXhbKJE6mtYWZFgAq6jTohQQJI4zPkJcfVauTAXt
	RVeltBoQ6ws/1Arbtk1QLYeC066ytbXUXhGFtlNyRMQmFbmCphzd07VPepM7A5qylq+mC5HrzfEX6
	sY6iW7FLzuxuNZgC5aBNIS/j99iIOenjPJbLtK8+ZhdYsqztNXS2eWGeHlzKwMbqHTnfIoPVxOf4f
	Ub5inPtJjAA5MaGD2WiZAHsDae2oQitKbZARpx1DHgEHOq5B5HwoQohq2l+rUZraXaTRaVc7v5Kvu
	kpMEwVRQQml+E3qni9tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUkVt-00011C-6y; Wed, 13 Nov 2019 04:44:17 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUkVp-00010T-LS
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2019 04:44:15 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAD4i3Zm009531;
 Tue, 12 Nov 2019 22:44:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573620243;
 bh=krfS/M4AMWq2GPPOK+NBW+TNgj20t18mmVDIkEHgP/8=;
 h=To:CC:From:Subject:Date;
 b=y0DFwwa9oc+2N3uFRwezabPcN5nLnjsEi20myxZiXTbv3c1bkgu7dNlMnsMoXVEy1
 2aI7MZfQ4ArJygytAan2hEWxQP5IdswfmuoeQ9WSi/bpWc2354o8OoufSvp4VuM6oH
 5qGrFl7zFiOcJ2E5OCd/e9LgAzcWuEat5sOwbv2Q=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAD4i37D110114
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 Nov 2019 22:44:03 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 22:43:45 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 22:43:46 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD4i19G082073;
 Tue, 12 Nov 2019 22:44:02 -0600
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL] CFI and HyperFlash changes for v5.5-rc1
Message-ID: <50180087-48c5-ab5a-88b5-5178d4ac933b@ti.com>
Date: Wed, 13 Nov 2019 10:14:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_204413_809403_22EE599E 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

Here is the CFI and HyperFlash related PR for v5.5-rc1

Regards
Vignesh

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://github.com/r-vignesh/linux.git tags/for-v5.5-rc1

for you to fetch changes up to c15995695ea971253ea9507f6732c8cd35384e01:

  mtd: cfi_cmdset_0002: fix delayed error detection on HyperFlash (2019-11-09 14:43:53 +0530)

----------------------------------------------------------------
CFI core changes:

* Code cleanups related useless initializers and coding style issues
* Fix for a possible double free problem in cfi_cmdset_0002
* Improved error reporting and handling in cfi_cmdset_0002 core for HyperFlash

----------------------------------------------------------------
Hou Tao (1):
      mtd: cfi_cmdset_0002: don't free cfi->cfiq in error path of cfi_amdstd_setup()

Sergei Shtylyov (4):
      mtd: cfi_util: use DIV_ROUND_UP() in cfi_udelay()
      mtd: cfi_cmdset_*: kill useless 'ret' variable initializers
      mtd: cfi_cmdset_0002: only check errors when ready in cfi_check_err_status()
      mtd: cfi_cmdset_0002: fix delayed error detection on HyperFlash

 drivers/mtd/chips/cfi_cmdset_0001.c | 10 +-
 drivers/mtd/chips/cfi_cmdset_0002.c | 79 ++++++----
 drivers/mtd/chips/cfi_cmdset_0020.c |  8 +-
 drivers/mtd/chips/cfi_util.c        |  2 +-
 4 files changed, 55 insertions(+), 44 deletions(-)

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
