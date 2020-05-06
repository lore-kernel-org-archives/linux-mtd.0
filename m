Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E758BC28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 16:29:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB94A20708
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 16:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HdaMzW01"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB94A20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhUSYpsD6KFXA50seHLJoVfPAPQ1O2p3AcF2cKYU6r0=; b=HdaMzW01F8vdMM
	f6p/M8MX+lu6O6K3HvlL2TVE/bT8Uq225sCfxU/DfiEBarr1zcVBhNo69GtLRULVbxT05pOjEFgi8
	vbD0QO3rR7OEjCFlALJXyh/tgd4HkArsRXglPIVGAH5GhJlF0aAkyRIKeaH8YW5eUjp/5+ZxUw3YR
	iQh6N0BjMS7OaIE7mPM4NmTdlW0/UiQEg5/0GSmecp/z4b8Sdt/S0fJeLF9DBtt0KUDdyzuFCF57x
	HkufyExVC+1pcL4kcVXsIubTOpWyDXpbyhGWVdUs3exG8Ta0S9WtxVtkFjEMMKsyyH0euVYOnwHLT
	m+WkPXw6tw1+WZjExGCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWMv7-0005vr-NB; Wed, 06 May 2020 16:29:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWMv5-0005ut-CC
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 16:29:16 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BBC312A24E9;
 Wed,  6 May 2020 17:29:13 +0100 (BST)
Date: Wed, 6 May 2020 18:29:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Message-ID: <20200506182910.6a9863bd@collabora.com>
In-Reply-To: <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506104522.6c90f88f@collabora.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506180420.13996633@collabora.com>
 <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_092915_550334_A6E3C158 
X-CRM114-Status: GOOD (  19.17  )
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

On Wed, 6 May 2020 16:09:19 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Richard
> 
> > > > > > +	}  
> > > > >
> > > > >
> > > > > Here, if the power loss happens before erasing this block, for the
> > > > > next time boot up, What will happen from FS layer in case FS
> > > > > detect this filled  
> > > > data?
> > > >
> > > > Most likely ECC errors will be returned, but that doesn't matter
> > > > since this block was about to be erased. You have pretty much the
> > > > same problem for partially erase blocks already, and that should be
> > > > handled by the wear-leveling/FS, if not, that would be bug (note
> > > > that it's properly handled by UBI, which just considers the block as invalid and  
> > schedules an erase).  
> > > >  
> > >
> > > Concerning this, I still have question, for the UBIFS,  If I am
> > > correct, there are EC and VID header both being damaged, then UBIFS
> > > will re-erase it. I don't know if UBIFS can handle there is dirty/filling data in the  
> > some pages  and EC/VID valid.  
> > > Maybe Richard has fixed it.  
> > 
> > If the block is being erased that means there's another one mapped to the same
> > LEB, or the block is simply not needed anymore. In both cases, this old block
> > shouldn't be referenced. Again, if that happens, it's a bug.  
> 
> Would you please help us confirm this?  how does ubifs handle this situation? Also other FS? Eg, jffs2, yaffs
> 

And if you're really worried about that, forcibly writing all pages
starting from 0 should do the trick. But I don't think that's needed.
As I said, when you trigger an erase, you're not guaranteed the erase
will complete before a potential power-cut, meaning that part of your
data might still be valid, while others could be corrupted.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
