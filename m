Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8B9C433E7
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 12:59:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF2A920848
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 12:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="te9Xwb3+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF2A920848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AJk2Ju66uUwxPT3SZ54gaOMt7wUuBnsOCSzq9ApMK5s=; b=te9Xwb3+hPdVcvrO+K6PaUMX9
	gfFdxgyskUTOWRwo+U7G8UIYv1iH+oLtk9oLPyNYL7iGXWr8S8RmjuaIInIe/PDJsfSgL91/Ntd4I
	z+uRHnmG+Tbxee4w2zFva0TPCg1ILmPvKUIuS6qVOrj/5mtlW1WaHm9uKneEHlfJLoHn3I45aWa3w
	s+aoomglDrjEUxUtHggw+NIl1YGcKIWo38M2dcZprJ6JaGloFfkpeWQRNAUdFYiGKpKpQuUAG7c4W
	DQyUva7LW2IRyc2r7RcdgG++HwxjaR9F5GPcNq6NP+DUv/4hoLzloFDELynbl5NxRTTYGcUIYuGeH
	JeXK1jt1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSgMu-0008KH-Qd; Wed, 14 Oct 2020 12:59:00 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSgMr-0008J3-Jq
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2020 12:58:58 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B936D200013;
 Wed, 14 Oct 2020 12:58:47 +0000 (UTC)
Date: Wed, 14 Oct 2020 14:58:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
Message-ID: <20201014145846.613977d5@xps13>
In-Reply-To: <CAOMZO5DxVQ1va4aviTkgC0O6+KmpkYvYDVPh7v2Ajqggq7aoow@mail.gmail.com>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
 <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org>
 <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
 <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
 <20201011055258.22337d66@canb.auug.org.au>
 <CA+-6iNwpFeJaa7CisS-DD2q45uaV8Jz6YU0kPucqpZAAK3ojuQ@mail.gmail.com>
 <c7e7b9ab-95a8-625f-7988-7f7397a0749f@gmail.com>
 <CAOMZO5DxVQ1va4aviTkgC0O6+KmpkYvYDVPh7v2Ajqggq7aoow@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_085857_740131_9BF45D63 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: lkft-triage@lists.linaro.org, linux-mtd@lists.infradead.org,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, abhimanyu.saini@nxp.com,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Richard Weinberger <richard@nod.at>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>, masonccyang@mxic.com.tw,
 Poonam Aggrwal <poonam.aggrwal@nxp.com>, Joerg Roedel <jroedel@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>, open list <linux-kernel@vger.kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Suram Suram <suram@nxp.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIFdlZCwg
MTQgT2N0IDIwMjAgMDk6Mjg6NDkKLTAzMDA6Cgo+IEhpIEZsb3JpYW4sCj4gCj4gT24gU3VuLCBP
Y3QgMTEsIDIwMjAgYXQgNjo1OSBQTSBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWls
LmNvbT4gd3JvdGU6Cj4gCj4gPiBob3dldmVyIHRoZSBOQU5EIHdhcm5pbmcgc3RpbGwgcmVtYWlu
cy4gU29tZW9uZSBlbHNlIGZhbWlsaWFyIHdpdGggdGhlc2UKPiA+IE5YUCBkZXZlbG9wbWVudCBi
b2FyZHMgc2hvdWxkIGZpeCB0aGUgRFRTIHNvIGFzIHRvIHByb3ZpZGUgdGhlIHJlcXVpcmUKPiA+
IEVDQyBzdHJlbmd0aCBwcm9wZXJ0eS4gIAo+IAo+IFRoZSBFQ0MgTkFORCB3YXJuaW5nIGxvb2tz
IGxpa2UgYSByZWdyZXNzaW9uLgo+IAo+IEkgaGFkIG9yaWdpbmFsbHkgcmVwb3J0ZWQgaXQgZm9y
IGFuIGlteDI3IGJvYXJkIGFuZCBub3cgSSBhbHNvIHBvaW50ZWQKPiBvdXQgdGhhdCBpdCBhbHNv
IGFmZmVjdHMgTGF5ZXJzY2FwZToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQv
MjAyMDEwMTMxOTM2NTIuMGM1MzVjN2NAeHBzMTMvVC8jbTA5ZmFkN2VhY2RmODZhZWUwODM0YmJk
ODg2M2Q2ZDVlZTJlNjlmOGMKCkkgdGhpbmsgdGhpcyB0aHJlYWQgaW5pdGlhbGx5IHJlcG9ydGVk
IHR3byBkaXN0aW5jdCBkZWZlY3RzLCBvbmUgaGFzCmJlZW4gc29sdmVkLCB0aGUgc2Vjb25kIG9u
ZSBpcyBpbiBteSBoYW5kcyBidXQgSSBjb3VsZG4ndCBmaW5kIHRoZSByb290CmNhdXNlIHlldC4g
SSB0cmllZCB0byByZXByb2R1Y2UsIHdpdGhvdXQgbHVjaywgd2l0aCBhbm90aGVyIE5BTkQKY29u
dHJvbGxlci4gSWYgc29tZW9uZSBoYXMgYW4gaW14IGJhc2VkIGJvYXJkIGFuZCBhIE5BTkQgY29u
dHJvbGxlciBvbgppdCwgSSB3b3VsZCBhcHByZWNpYXRlIHNvbWUgaGVscC4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
