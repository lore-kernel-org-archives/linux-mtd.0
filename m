Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDA3C282DE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 22:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFBF921880
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 22:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d+ALLBjI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFBF921880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allycomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wJW7fOh7S0G6B/oAjdedNzbukPsoJCOTN3vU4yneomc=; b=d+ALLBjIwC9lk7
	bqrjP1C+x9rJAwGS9NdwpRjv5kTW0skwwmSi6xJELBR3SVddCs8K6rFCLYdIIp/DCSCqOg9uXPI8b
	WL5RjNMWlZUV0WqMklxeKUO01eSu11No2Hb58hSRoafjmdZ/wq9+Qah6nkuSVBT6IWU+v0HsVZx4+
	5U0uXRurDiI5xXrFjUY3jpw7Nu5Km3cO8Q1S1x4DsBDJ6hE0tLLWQuV49R5DLqB4klyLKZ2iehlqk
	Uh1/8MIddYLZ/FveXTKmltO9Sph7YO3UAyaudBJwgu01zbcLDsAXQxa1uu7OJhEHj6Y0Y9wOx+F2f
	lhfMFHZmYPenz4dWqjHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTZNC-0004O4-Tg; Wed, 22 May 2019 22:06:10 +0000
Received: from mx.allycomm.com ([138.68.30.55])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTZN9-0004NM-VU
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 22:06:09 +0000
Received: from allycomm.com (unknown [IPv6:2601:647:5401:2210::49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.allycomm.com (Postfix) with ESMTPSA id 82C893CB13;
 Wed, 22 May 2019 15:06:05 -0700 (PDT)
From: Jeff Kletsky <lede@allycomm.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 0/3] mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG
Date: Wed, 22 May 2019 15:05:52 -0700
Message-Id: <20190522220555.11626-1-lede@allycomm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_150608_027887_9A71A5D9 
X-CRM114-Status: GOOD (  10.27  )
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
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 kbuild-all@01.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Addresses changes in macros and related data structures introduced by
  commit 377e517b5fa5
      mtd: nand: Add max_bad_eraseblocks_per_lun info to memorg

Resolves issue detected by kbuild test robot
  Tue, 21 May 2019 17:28:09 +0800
  Tue, 21 May 2019 18:17:28 +0800

GD5F1GQ4UFxxG data sheet on page 34 of gd5f1gq4xfxxg_v2.4_20190322.pdf
indicates "Minumum number of valid blocks (Nvb)" 1004 out of 1024 total.

Newly introduced "max bad blocks" parameter set to 20 (1024-1020).

Rebased on v5.2-rc1 and confirmed patch applies on master.


Patches 1/3 and 2/3 are the same as in the previous series.

Patch 3/3, mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG,
includes the additional parameter (compared here to v3 of the series):

    SPINAND_INFO("GD5F1GQ4UFxxG", 0xb148,
    -                    NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
    +                    NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
                         NAND_ECCREQ(8, 512),
                         SPINAND_INFO_OP_VARIANTS(&read_cache_variants_f,
                         &write_cache_variants,

R-b of Frieder Schrempf removed from [3/3] as a result this change.

Supersedes series:

mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=108868



Jeff



Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kbuild-all@01.org




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
