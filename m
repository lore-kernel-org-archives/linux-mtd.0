Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA72C4332B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 09:55:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BABDD2070A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 09:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="doSywvyc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rZXtaeq1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BABDD2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qjSu9Y1wfZOY/liU903qoXKc54CyX3fkiFDLUu9SeJA=; b=doSywvycZcskwG
	J2diGPRVIl8SJu4kG0NkAfiL/8XMBr6Wc9Wta84Dvd37ntoc8UcmVXFDmAonTy51s6VYBaWLvRiNV
	WGrc1SAZ/MmE5wIOFXXrw9aBA4gsvcrCSBbFTHQ5t2ekxsjdkgE7TV/YXpYyZTaTTNfkJ1xMNfUCB
	yla0wegP2/PSlgI5jeJgIzvH/R/udYyq/onDh31djNO7HwkAulXq76SfGCgx38JOn69aZCeuYd+jM
	/d9l/KYGgH7SCmzpxYwYZnN4SBafJhIGSW6KbdDP+O4QB4LZrXxpeeVu2/76yuQECgGkLXhvPlscq
	ze0o+WG6O8OYvaywG7ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGgHM-0000tZ-58; Tue, 24 Mar 2020 09:55:24 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGgHI-0000sz-Ua
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 09:55:22 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02O9tFiZ016240;
 Tue, 24 Mar 2020 04:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1585043715;
 bh=fzPKUUZmm2sb5yxlF09F6LYdwQupBQrV0dqPylZjbSA=;
 h=To:CC:From:Subject:Date;
 b=rZXtaeq1OWbrF3cUEBGwg3YgBXREvXiM3ikPfriUuy+QhGlMbwKda38cENcv8eqhI
 Uf3RBqcSEZS+C2EIMHLrDQPHKBgS26s1bOG4qfZaE3K4np2UKnAZoRZRWXARG20HiS
 DJUhLODgBsavnDyzyRGprT1Ro17QmGVP6lmrPxWI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02O9tF1p028649
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Mar 2020 04:55:15 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Mar 2020 04:55:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Mar 2020 04:55:14 -0500
Received: from [10.250.132.85] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02O9tCuV055734;
 Tue, 24 Mar 2020 04:55:13 -0500
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL] CFI and HyperFlash changes for v5.7-rc1
Message-ID: <9f7fe986-bba8-e7d8-889b-2fff4a2e9a76@ti.com>
Date: Tue, 24 Mar 2020 15:25:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_025521_026124_35735DB5 
X-CRM114-Status: GOOD (  12.11  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel Richard,

Here is the CFI and HyperFlash related PR for v5.7-rc1

Regards
Vignesh


The following changes since commit 11a48a5a18c63fd7621bb050228cebf13566e4d8:

  Linux 5.6-rc2 (2020-02-16 13:16:59 -0800)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/mtd/linux.git tags/cfi/for-5.7

for you to fetch changes up to b6fe8bc67d2d33a9eff1b0785482bccd14979115:

  mtd: hyperbus: move direct mapping setup to AM654 HBMC driver (2020-03-03 10:13:11 +0530)

----------------------------------------------------------------
HyperBus changes

* Print err msg when compatible is wrong or missing
* Move mapping of direct access window from core to individual drivers

----------------------------------------------------------------
Dirk Behme (1):
      mtd: hyperbus: Add proper error message for missing compatible

Sergei Shtylyov (1):
      mtd: hyperbus: move direct mapping setup to AM654 HBMC driver

 drivers/mtd/hyperbus/hbmc-am654.c    | 12 ++++++++
 drivers/mtd/hyperbus/hyperbus-core.c | 15 ++--------
 2 files changed, 15 insertions(+), 12 deletions(-)
	

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
