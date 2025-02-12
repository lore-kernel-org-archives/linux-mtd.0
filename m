Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D109C021A0
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdrGo1fvillPuiinP2z7XC7flFNkBLDFjl99QjKuPM4=; b=msiBLl0GcKI4zH
	SA5mFqNZz/+JuquBMI4d3gOPbMD9QjKWfgy04dq9pKyexP7M47PbWVpk/wvblWv2pCJVVXnQqVEjk
	tnI9QQKx4GzvxWP82nCvblinTOecpye7ViJC0IUQu1a9JEDludh3+QxM8aHBie5fXX8VKBr4tvPtw
	NaiYrCwFKRIdJXIUGYShrB662Ag7MKaCBeZUPfqVfkNWBEKn/cUnPz6BWChprTptf77RBaTg9S+J5
	P0VH8JRsMEmEImPnmWNrZ7pq4rOo5ViBKdxVpHSiBN2qyJpVZcH10OZeArtPCiIR/mS6SC74/CwmR
	OiB6kYGgcZblUBhdtdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFbd-000000084yE-0bK1;
	Wed, 12 Feb 2025 16:28:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFGP-000000080DT-3Z3o
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 16:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0676A40135;
	Wed, 12 Feb 2025 16:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7F8C4CEDF;
	Wed, 12 Feb 2025 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739376420;
	bh=DtovoddXJ18poDRZ4vbP7OjpbXwDBro1r4lUquhEprQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTrhUs0yFCO8s6nTGOWuKDRgvVsSeU/uokg+mhSj3yP0lbJlJuG+nXNyjlZA85rca
	 QHns45dGnZTjymwwTfONn2w6RfUCjxkpw4YEkGadzfzFAl9OuDAEw+BckrE1ixOu5L
	 aF6h7ha3q4tZvQ/+BLtlrPyVHINGBiOf61oBok+D9FNEUuv/o5D/WBO5oqwhWdZ4Ag
	 mbmN7wArkjTc/wWwCw9OtnT3PpdlHv5l/69iWVO8KY6B7SmeXfVHbFtSxHsde6iFiI
	 mGYtaqNEjcaIwYCb/oD7plsL3TayoYssJSP5mdVQ49zZ40/TUhkuEfO7Djkbnwliob
	 XOtFNqW5JX02g==
Date: Wed, 12 Feb 2025 10:06:59 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, richard@nod.at,
	vigneshr@ti.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v12 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
Message-ID: <20250212160659.GA3883406-robh@kernel.org>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
 <20250205133730.273985-2-amit.kumar-mahapatra@amd.com>
 <20250211212928.GA1188800-robh@kernel.org>
 <87r043r2lq.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r043r2lq.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_080701_947917_A3FC54A2 
X-CRM114-Status: GOOD (  15.39  )
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

On Wed, Feb 12, 2025 at 09:25:53AM +0100, Miquel Raynal wrote:
> Hi,
> 
> >> The partitions that gets created are
> >> part0_0
> >> part1_1
> >> part0_1-part1_0-concat
> >
> > 'part-concat' doesn't work if you have multiple sets of partitions you 
> > want to concatenate.
> >
> > I think you need something like 'prev-partition' or 'next-partition' in 
> > the partition nodes to create a linked list of partitions. Hopefully, 
> > you don't need both properties, but you do have to scan everything to 
> > figure out which ones are concatenated or not. For example, no property 
> > can mean not concatenated or last partition if you use 'next-partition'. 
> 
> Out of curiosity, would the chosen node be eligible as a central place
> where to look at?

Why would you need that?

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
