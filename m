Return-Path: <SRS0=uaub=TX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F12C04AAC
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 06:56:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1EBF2133D
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 06:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="On8TKPin"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1EBF2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJv9KSVE07/Tz7CPHTtVsq7c5hR+dojdJvDUDxA8NPQ=; b=On8TKPinOmYf8P
	T5n+eNaxFQrmNy5yjcxSZJidtK9cRIKqecFKRNAJ8pi/lNb4pkiA9n06CkYyW168FiZWXFen/HsWH
	JufRJkMa6bYZqC8YjgzISTWI7RaOb42MQLwQBRcgElyiiXVI81DorxBp69ujoweIjPaUQXB3t+zJw
	YOhN8Xhl6WwNY20XrX/dUAah5c6YFf4HoVaptM27D3D3hrK3iMi7fzUoo+S3mwB2zwvEP/aop5kF1
	2ytzCdb1ryDRYk3znkCTLtty1Gv/Qsi/T4ejznXrzulYUDJ2zRJWohBO/R6Z9pMomPx52cav/sdmu
	BS2pHZV944a+QgO3+z1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTheD-0002wR-CM; Thu, 23 May 2019 06:56:17 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hThe9-0002vf-EX
 for linux-mtd@lists.infradead.org; Thu, 23 May 2019 06:56:15 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id F1C4C66117A;
 Thu, 23 May 2019 08:56:10 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 23 May
 2019 08:56:10 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Thu, 23 May 2019 08:56:10 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Jeff Kletsky <lede@allycomm.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 0/3] mtd: spinand: Add support for GigaDevice
 GD5F1GQ4UFxxG
Thread-Topic: [PATCH v4 0/3] mtd: spinand: Add support for GigaDevice
 GD5F1GQ4UFxxG
Thread-Index: AQHVEOqZITkhzQGdUk6QCGzMLzqE8KZ4JdgA
Date: Thu, 23 May 2019 06:56:10 +0000
Message-ID: <6351c1d6-c284-6bca-3914-3895d847c9c3@kontron.de>
References: <20190522220555.11626-1-lede@allycomm.com>
In-Reply-To: <20190522220555.11626-1-lede@allycomm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <6A0683E7EA1CEF4893A50D6A09536B99@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: F1C4C66117A.A0D76
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, kbuild-all@01.org, lede@allycomm.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_235613_807634_6F09A6D1 
X-CRM114-Status: GOOD (  17.10  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kbuild-all@01.org" <kbuild-all@01.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jeff,

On 23.05.19 00:05, Jeff Kletsky wrote:
> Addresses changes in macros and related data structures introduced by
>    commit 377e517b5fa5
>        mtd: nand: Add max_bad_eraseblocks_per_lun info to memorg
> 
> Resolves issue detected by kbuild test robot
>    Tue, 21 May 2019 17:28:09 +0800
>    Tue, 21 May 2019 18:17:28 +0800
> 
> GD5F1GQ4UFxxG data sheet on page 34 of gd5f1gq4xfxxg_v2.4_20190322.pdf
> indicates "Minumum number of valid blocks (Nvb)" 1004 out of 1024 total.
> 
> Newly introduced "max bad blocks" parameter set to 20 (1024-1020).
> 
> Rebased on v5.2-rc1 and confirmed patch applies on master.
> 
> 
> Patches 1/3 and 2/3 are the same as in the previous series.
> 
> Patch 3/3, mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG,
> includes the additional parameter (compared here to v3 of the series):
> 
>      SPINAND_INFO("GD5F1GQ4UFxxG", 0xb148,
>      -                    NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
>      +                    NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
>                           NAND_ECCREQ(8, 512),
>                           SPINAND_INFO_OP_VARIANTS(&read_cache_variants_f,
>                           &write_cache_variants,
> 
> R-b of Frieder Schrempf removed from [3/3] as a result this change.

As to what I know, this would not have been necessary in this case. I 
missed the missing parameter while reviewing and you fixed it with this 
new version, so you obviously improved the patch with a minor change and 
it wouldn't be working without this anyway. So I think in such cases you 
would typically keep the R-b tags.

Also if you drop the R-b tag from one of the patches in your set, you 
should instead CC the reviewer for the whole set. Otherwise 
get_maintainer will only CC the reviewer for those patches that contain 
his tag. In this case I wasn't CCed for patch 3/3.

Thanks,
Frieder

> 
> Supersedes series:
> 
> mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG
> https://patchwork.ozlabs.org/project/linux-mtd/list/?series=108868
> 
> 
> 
> Jeff
> 
> 
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Schrempf Frieder <frieder.schrempf@kontron.de>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kbuild-all@01.org
> 
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
