Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5E8C4724C
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 16:04:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9493D208CA
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 16:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GaQ0xjLz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9493D208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYFGFVKy3bnfSn1XW1JPyAxfFbXswXBAg5gMi2atwF4=; b=GaQ0xjLzSIF0CE
	ED/yrMw98vWSS3TOz7IiGIiLAIEYHalaNH8JzuBedkK3Tk8k1Gi920Edh/Z4iFz2v8ma5ir3zfa94
	U8lHAQ1lBOLJTlYS/AtrnQ0Fz0+MfymUHCABm3+f18bRK9I6Ay8jwEncwhSEl30T0SkrCkTYWn7Cg
	WBRfnteojI2+zK3vYwVscjp+lfnWb/sGjQbVOqVIW/MfK945neMghTewwBiBdSUBp/Oz6oClzG869
	9xho4qX/Z8O97FMRMDo5Pu2SHNAjrdpga6sHarxolCd8ahY9A4hirnmGYzNIgGUNU9fDmWAqQygr4
	mt/aftzPj3/xNGSC2Qjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWMX4-000404-Oi; Wed, 06 May 2020 16:04:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWMX2-0003zW-IO
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 16:04:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 959512A02A4;
 Wed,  6 May 2020 17:04:22 +0100 (BST)
Date: Wed, 6 May 2020 18:04:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Message-ID: <20200506180420.13996633@collabora.com>
In-Reply-To: <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506104522.6c90f88f@collabora.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_090424_728808_DD34AE7E 
X-CRM114-Status: GOOD (  27.82  )
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
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 6 May 2020 15:50:32 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Boris
> 
> > 
> > On Wed, 6 May 2020 08:28:43 +0000
> > "Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
> >   
> > > Hi, Miquel
> > > I have two questions about your patch, please help me.
> > >  
> > > > +	 */
> > > > +	for (eb = first_eb; eb < first_eb + nb_eb; eb++) {
> > > > +		/* Il all the first pages are not written yet, do it */
> > > > +		if (micron->writtenp[eb] != MICRON_PAGE_MASK_TRIGGER)
> > > > +			micron_nand_avoid_shallow_erase(chip, eb);
> > > > +
> > > > +		micron->writtenp[eb] = 0;
> > > > +	}  
> > >
> > >
> > > Here, if the power loss happens before erasing this block, for the
> > > next time boot up, What will happen from FS layer in case FS detect this filled  
> > data?
> > 
> > Most likely ECC errors will be returned, but that doesn't matter since this block
> > was about to be erased. You have pretty much the same problem for partially
> > erase blocks already, and that should be handled by the wear-leveling/FS, if not,
> > that would be bug (note that it's properly handled by UBI, which just considers
> > the block as invalid and schedules an erase).
> >   
> 
> Concerning this, I still have question, for the UBIFS,  If I am correct, there are
> EC and VID header both being damaged, then UBIFS will re-erase it. I don't know if
> UBIFS can handle there is dirty/filling data in the some pages  and EC/VID valid.
> Maybe Richard has fixed it.

If the block is being erased that means there's another one mapped to
the same LEB, or the block is simply not needed anymore. In both cases,
this old block shouldn't be referenced. Again, if that happens, it's a
bug.

> 
> > >
> > > This micron->written is stored in the system memory, once power cut,
> > > for the next time Boot up, will it be reinstated or it will be 0x00?  
> > 
> > Yep, and that shouldn't be a problem, it just means we might have unneeded
> > page writes if the pages were already written, but, other than the perf penalty it
> > incurs, it should work fine.
> > 
> > We can optimize that a bit by adding a ->post_read_page() hook so we can flag
> > already read pages as written/erased and avoid those unneeded writes in some
> > situations.  
> 
> That means we assume this block being read before erasing.

Not necessarily. If pages have been read because the MTD user wanted to
access then data (e.g. UBI reads the EC/VID header, UBIFS read its
metadata, ...) it's a good opportunity for us to flag pages as
'written/erased'. But we should not generate extra IOs just for that.

You seem to assume that page reads are almost free compared to erase
operations, and that's true if you only consider the time it takes to
load a page in the NAND cache, but doing IOs is much more expensive
that you think on a shitload of platforms. If we do as you suggest, we
might have 2 rounds of IOs, one to read the pages, and one to write
them if they've not been written already.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
