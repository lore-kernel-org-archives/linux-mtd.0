Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD68AC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 08:19:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F49E20897
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 08:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dkKbix50"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F49E20897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAqwMOIb6XU3fSlicabmXp1ELg1p7E449VXAWMGO+kk=; b=dkKbix50ZPyWz3
	SyV2Pz1SvVUMXzg/Huj66U32qMqsjRxwwXeNh6UJq5LR3bOQHmMH5U4neMDg7NJ9YJPMHSJ+6mr5t
	aP8FouxtwVuIAOxBBkHoFhkjRx45UfTTGEcPvvZVMrWvQ4fdXGOrTMtoq/ssMe6Hsr1/snSTdxyHp
	fQ9GREHLa5eADy7/Hdrg4diUrxn0pH+9oIOzYROLsJKhMfFQg2hn/omIs8qIJU3Y0FvK5yLdHryrz
	Gb62Ilm40QoOm7DmIXKHSLBeRbUVM9dQFegYwRdGsjEWiqln0c7YULFr0rAlAsAQNsStxt2IQlTqQ
	RekqT0+wa+F5Y0gGHTtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeaEk-0003jM-Ri; Fri, 29 May 2020 08:19:30 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeaEh-0003ih-4E
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 08:19:29 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6BE6DFF80D;
 Fri, 29 May 2020 08:19:19 +0000 (UTC)
Date: Fri, 29 May 2020 10:19:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 17/30] mtd: rawnand: s/data_interface/interface_config/
Message-ID: <20200529101917.434c7fd6@xps13>
In-Reply-To: <20200529101107.6dadcfd5@collabora.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
 <20200528231612.8958-18-miquel.raynal@bootlin.com>
 <20200529094755.6b53f88a@collabora.com>
 <20200529101107.6dadcfd5@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_011927_665313_5B658F2E 
X-CRM114-Status: GOOD (  13.62  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Fri, 29 May
2020 10:11:07 +0200:

> On Fri, 29 May 2020 09:47:55 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Fri, 29 May 2020 01:15:59 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > 
> > > The name/suffix data_interface is a bit misleading in that the field
> > > or functions actually represent a configuration that can be applied by
> > > the controller/chip. Let's rename all fields/functions/hooks that are
> > > worth renaming.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>    
> > 
> > I know it's painful to move that one, but I think it should be at the
> > beginning of the series so the functions/fields you introduce have the
> > right name from the start.  
> 
> Hm, maybe I'm wrong and you don't introduce any new interface-related
> functions/fields before that one.


Indeed, I don't introduce new hooks before this patch. What I do is
renaming a few fields, but honestly, before of after, the
s/data_interface/interface_config/ applies anyway.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
