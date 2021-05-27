Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B3EC4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 14:11:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C87FE61248
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 14:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C87FE61248
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7YvcrTndErrIyqC4o6tc7bKHYBfLgUb2cqumLDyEPs=; b=otS8Lj2X9ebVSk
	d6PRONxWKJsneLOy2VlH9h56EFmRQXTcpE2S8KrfQ7YkqiicRvvVNcYM25FzMoFu+mkMnI8OOB3bm
	zO3hXoxCC3nGWL3hK2CENDq4Vftr1VrPtfR5N3PalXmK4Wv9IIn7zbMtziPKExmMAujikpbn9Oluv
	drD+TulFCSiXX15i0ryhQjiYAi36xVUQmEXq5+WROh9lTrMksmDgqQxVwaL9ekvhdr3VZYaYKWPTe
	ViB9mFbu/0o4QYb/Xd2PsbFsAlEtRavK9LhOTSgkjsetVpKWQyjLQWyrebemagdgi5eZ8jrxxcLJ3
	dbGOl0U55EAp6zjuUOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmGiE-006bNB-Tu; Thu, 27 May 2021 14:10:15 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmGTP-006TM8-M0
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 13:54:57 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RDsoVe019379;
 Thu, 27 May 2021 08:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622123690;
 bh=UYNtIv4igfdc++GPHNkn5lwZ1ApSQiPm1M2QVo60QmM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=KZL1AHNf5cdWBGEn/bmAZu8ABuab/xqSjOBEi7I9jA9WyaXC7QmRuc3G7uVCRIBwR
 uWknbja6Zht0gs+Q7DSNaqB+d6E0Up3HtP/LmT2KTNN63/TxYektc5hy0cCucYu476
 Txj6mv7AeFTqkyfY0BmJQXlz0S4+kt5GWu/dUNRo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RDso5X026360
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 May 2021 08:54:50 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 08:54:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 08:54:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RDsnf1128847;
 Thu, 27 May 2021 08:54:49 -0500
Date: Thu, 27 May 2021 19:24:48 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Petr Malat <oss@malat.biz>, <linux-mtd@lists.infradead.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] spi-nor: sfdp: Allow configuring unknown flashes using
 SFDP
Message-ID: <20210527135446.5ywjta5w75aez4gg@ti.com>
References: <20210520160701.28176-1-oss@malat.biz>
 <20210521095503.qw3aivg4zklupwcj@ti.com>
 <20210521115350.GA7908@ntb.petris.klfree.czf>
 <64dd1df6-0ace-702b-f205-a7c7d4d12697@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64dd1df6-0ace-702b-f205-a7c7d4d12697@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_065455_852042_AA0B0FFB 
X-CRM114-Status: GOOD (  29.28  )
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

On 27/05/21 07:22PM, Vignesh Raghavendra wrote:
> 
> 
> On 5/21/21 5:23 PM, Petr Malat wrote:
> > Hi!
> > On Fri, May 21, 2021 at 03:25:05PM +0530, Pratyush Yadav wrote:
> >> On 20/05/21 06:07PM, Petr Malat wrote:
> >>> This change allows adding a support for flashes with correct SFDP
> >>> without recompilation of the kernel by setting sfdp-compatible property
> >>> in their node. Alternatively, sfdp_compatible module option can be used
> >>> to list JEDEC IDs of flashes, whose SFDP can be trusted. Star "*" can
> >>> be used to match all JEDEC IDs.
> >>
> >> I have skimmed through the patch. Before I look at it more closely, I 
> >> want to understand the use case for this patch. Why would you not want 
> >> to recompile the kernel when adding support for new hardware? Do you 
> >> want the ability to support flashes on devices that have already been 
> >> deployed in the field? Is it something that comes up frequently?
> > In my case the kernel is loaded from a USB mass storage device, which
> > can be preproduced and on stock (with the kernel already on it). With
> > my patch I can change the flash vendor without the need of updating
> > the image on already existing USB mass storage devices.
> > 
> > The patch is also useful for people who use distribution kernel as they
> > will not have to wait until (and if) the distribution updates it.
> 
> Don't need separate DT property or cmdline argument. There is no way to
> know if the SFDP tables are 100% valid when kernel is working with a
> "generic flash".
> Flashes are often replaced with newer revisions of the part that may/may
> not have valid SFDP tables.
> 
> So just rely on SFDP, when no valid entry is found in the manufacturer's
> flash_info[] while printing out a warning to user that this is just best
> effort support.

+1

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
