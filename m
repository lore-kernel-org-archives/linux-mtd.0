Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647ABC38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 09:40:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36CFE208E4
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 09:40:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OA6g835n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36CFE208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNz7P4svPeDzwWPX3nV4eCEvL6+kd5bvaLAStfXReHk=; b=OA6g835n8GBTIn
	uHFtNwocxmkubYOTwT02XxiZVSX5BDOeTyTdAE2LDRnEaZZew9lelKyI8hEVDcmaybsPbu3MXmTXP
	ufw9IhKnhGp8ED8zyt95FwN4GJBjhgJUdvtFxYF5LrwwZi83G/1RpEVyw1+hncqO7bwxCpb7tLvn4
	oJKXjZ7NI0Dvmrd/iiSUsRO6lF+a9xcjB6VlGu+/EYoF8XQ17QK6SwsR1mTzcx6utvS7YZLwlzfqN
	UWAfq5GbPDoTcMnKwGgVvl+wxX2bxjPe1dByXbIpdziZT0o6ihI+Mi5VTFJfVldAvyaI48dwNsIZx
	RlkoOvGdFfnIjcmW7Beg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWd1R-0001Ob-KB; Thu, 07 May 2020 09:40:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWd1O-0001MC-6I
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 09:40:51 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2C3DA2A039A;
 Thu,  7 May 2020 10:40:47 +0100 (BST)
Date: Thu, 7 May 2020 11:40:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Message-ID: <20200507114044.1f0b51af@collabora.com>
In-Reply-To: <BN7PR08MB568434AC9C9168C016CC1592DBA50@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506180420.13996633@collabora.com>
 <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <1414270659.192477.1588790669444.JavaMail.zimbra@nod.at>
 <20200506210158.7fe33cec@collabora.com>
 <662469728.192614.1588792998746.JavaMail.zimbra@nod.at>
 <20200506224016.2d48d0b4@collabora.com>
 <130342272.192940.1588798779898.JavaMail.zimbra@nod.at>
 <20200506231116.2d16b747@collabora.com>
 <BN7PR08MB568434AC9C9168C016CC1592DBA50@BN7PR08MB5684.namprd08.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_024050_364955_55A90674 
X-CRM114-Status: GOOD (  20.00  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Steve deRosier <derosier@gmail.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 7 May 2020 09:28:29 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Boris, Richard 
> 
> > >
> > > A missing VID header plus good payload will cause UBI to stop
> > > attaching since it violates the IO model.  
> > 
> > Sure, and that's not what we want to do anyway. We basically have 2 choices
> > here:
> > 
> > 1/ overwrite all pages starting from page 0 and ending at page 15. This will lead
> > to ECC errors on already written pages, and 0-filled pages for others (unless we
> > go for a raw write, in which case it might actually lead to ECC errors depending
> > on the engine).  
> 
> No need for overwriting all pages. I overwrite EC and VID page just for prevent of 
> Erase power loss issue. But you hate this since FS-specific approach.
> According to Richard's emails, we don't need to overwrite page0,  overwrite page1
> Is enough.

It's still UBI specific, so that's still a no-go for me.

> 
> > 2/ track already written pages (by reading them first), and only writes those that
> > have not been written yet. That means no ECC error in that case, and no
> > corrupted EC/VID header as well.  
> 
> This is similar with my patch approach, but corrupted EC and VID headers. 
> 
> I have two proposals:
> 1.  rebase my patch, and copy one idea from Miquel's patch which records the programmed pages.
> But page 1 should be overwrote considering the UBIFS re-erase mechanism.

See above, and remember we do all that because Micron broke one of the
base assumptions we have about NANDs => erase should reset all bits to
1 or return an error if that fails.

> 
> 2.  add a new padding structure in the MTD,  which is used to filling empty page in the MTD.
> And once FS layer detects this padding data, just ignore or trigger re-erase this block. 

Not sure what you mean by padding structure, but yes, filling empty
pages with 0s and expecting the FS/wear-leveling layers to be happy
with that would be ideal. But, as for the "erase only 2-page because
this is where UBI puts its VID header" thing, that's a NACK on my side
if you want to introduce a new pattern that's only understood by
UBI/UBIFS.

I really wish FS/wear-leveling layers were immune to corrupted/invalid
LEBs they should no longer reference, but according to Richard, that's
not that simple.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
