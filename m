Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B26C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 12:31:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDB820835
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 12:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LxOlkSMG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FDB820835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=co97Fbi+kSm5JNZkEjkk1CA85f7peWi+wetsO7iia3M=; b=LxOlkSMGbunHeg
	R7SgcLuQB4bWAprNRoI9Q6uXfmjr0QRGeh0DtO+jUHKFLoWp7P6O1bPTIgp1GlL2M/ZaIOApOTKmt
	UDd6d0rh3LF9BTJXj3m6f0yxWdEemSO0Yk/iYgOjRfDT/WwHE78KHxqQAo17gwu9P+B7whRdzt/cT
	UJcVfWOyJiKVxYaMpBeKyqhuo1zGNLTgABcCX556WWF+P+//g4Lm2g8AjwNwPYFX6iXeRE70gAR2F
	iWxQ0aqyQ92ixRsdRBi66ZSpXyQQzXeE6u+4NdqUmp2SrVTbw2DZz2r7osGqIxO7vgFRMy3n8tT/F
	RJVIPqhvbUa10N//9CxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGjio-0002V7-H8; Wed, 17 Apr 2019 12:31:26 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGjil-0002U9-GV
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 12:31:25 +0000
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 4669367A896;
 Wed, 17 Apr 2019 14:31:21 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 17 Apr
 2019 14:31:20 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 17 Apr 2019 14:31:20 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/7] mtd: rawnand: Support bad block markers in first, 
 second or last page
Thread-Topic: [PATCH v5 0/7] mtd: rawnand: Support bad block markers in first, 
 second or last page
Thread-Index: AQHU9Rcyt+xmDTJnpkOrxDzu8FWr2KZAJzYA
Date: Wed, 17 Apr 2019 12:31:20 +0000
Message-ID: <7973d314-078e-8065-682e-c29684455bc4@kontron.de>
References: <20190417121420.21752-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190417121420.21752-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <1EA25AE1441B2147B913420A42D0B761@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 4669367A896.AC5C5
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_053123_881649_66887FEF 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Please forget about this, I forgot to squash the fixes for patch 5.
I will send a new version. Sorry!

On 17.04.19 14:15, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Currently supported bad block marker positions within the block are:
> * in first page only
> * in last page only
> * in first or second page
> 
> After some cleanup and preparation in patches 1 to 4 we make it
> possible to set NAND_BBM_FIRSTPAGE, NAND_BBM_SECONDPAGE and
> NAND_BBM_LASTPAGE independently of each other (patch 5).
> 
> Some ESMT NANDs are known to have been shipped by the manufacturer
> with bad block markers in the first or last page, instead of the
> first or second page.
> 
> Also the datasheets for Cypress/Spansion/AMD NANDs claim that the
> first, second *and* last page needs to be checked.
> 
> Therefore in patch 6 and 7 we set all three flags for
> AMD/Spansion/Cypress and ESMT chips.
> ---
> Changes in v5:
> ==============
> * Rebase onto current nand/next
> * Fix nand_bbm_get_next_page() docs
> * Use inclusive values for start page in nand_bbm_get_next_page()
> * Return -EINVAL from nand_bbm_get_next_page() when no more pages are available
> * Improve code style in nand_block_bad()
> * Add parentheses in scan_block_fast() and nand_default_block_markbad()
> * Unsign badblockpos field in struct nand_chip and struct onenand_chip
> * Add R-b tags
> 
> Changes in v4:
> ==============
> * Move onenand changes to separate patch
> * Add missing badblockpos field to onenand_chip struct
> * Move cleanup of badblockpos field and flags to separate patch
> * Move assignemnt of badblockpos from onenand_bbt.c to onenand_base.c
> * Fix incorrect usage of bbt_options in nand_bbt.c
> * Add R-b tags
> 
> Changes in v3:
> ==============
> * Fix bit offsets for new flags in nand_chip->options
> * Move separation of flags for first and second page markers to a
>    separate patch
> * Fix cover letter
> * Fix S-o-b tag
> * Add R-b tags
> 
> Changes in v2:
> ==============
> * Rebase on 5.0-rc1
> * Add patch to move bad block marker position info to a common place and
>    rename/prepare existing flags
> * improve/rename function nand_bbm_get_next_page() to use new flags
> ---
> Frieder Schrempf (7):
>    mtd: rawnand: Always store info about bad block markers in chip struct
>    mtd: onenand: Store bad block marker position in chip struct
>    mtd: nand: Cleanup flags and fields for bad block marker position
>    mtd: nand: Make flags for bad block marker position more granular
>    mtd: rawnand: Support bad block markers in first, second or last page
>    mtd: rawnand: ESMT: Also use the last page for bad block markers
>    mtd: rawnand: AMD: Also use the last page for bad block markers
> 
>   drivers/mtd/nand/onenand/onenand_base.c |  5 +-
>   drivers/mtd/nand/onenand/onenand_bbt.c  |  3 --
>   drivers/mtd/nand/raw/internals.h        |  1 +
>   drivers/mtd/nand/raw/nand_amd.c         |  8 +++-
>   drivers/mtd/nand/raw/nand_base.c        | 64 +++++++++++++++++--------
>   drivers/mtd/nand/raw/nand_bbt.c         | 28 +++++------
>   drivers/mtd/nand/raw/nand_esmt.c        |  9 +++-
>   drivers/mtd/nand/raw/nand_hynix.c       |  4 +-
>   drivers/mtd/nand/raw/nand_macronix.c    |  2 +-
>   drivers/mtd/nand/raw/nand_micron.c      |  2 +-
>   drivers/mtd/nand/raw/nand_samsung.c     |  4 +-
>   drivers/mtd/nand/raw/nand_toshiba.c     |  2 +-
>   drivers/mtd/nand/raw/sh_flctl.c         |  4 +-
>   include/linux/mtd/bbm.h                 | 14 +-----
>   include/linux/mtd/onenand.h             |  3 ++
>   include/linux/mtd/rawnand.h             | 17 ++++++-
>   16 files changed, 105 insertions(+), 65 deletions(-)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
