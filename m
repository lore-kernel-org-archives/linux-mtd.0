Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D963BCCD1A4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 15:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKPeSsg1VsDlpXik7Y1ITnvlkSUGRuvGYy28xgqDCJs=; b=wAdTbZLncVvK/GLTq90rgJ60mp
	wWgUxkhajjDriOrozN7rFegfPSsUC8aIrTaiOY3k7+JOiFgqUKjD5lHLH2g4PpzpIgafjHU7W/vYC
	fDQQNCOUYWsiBhJQkPfB+GQO6hSA7JOhZiYJnNXz2pbto6onAUdIJBX48t/Gp0xX1X8FAQVwiUyzh
	xqhhpPdmTnJlfc5Hk/hPAksmeBH4RUpA06F8amzZJPsodPom8dCuUuzFgCZFVnIRxxfg+j6+TQGmd
	QQdXMtWWZnqtSVBsuRTg+guoPF6Mtb5puSJRNm6UBQcsK8QdnYpbD0kCK98vciiaHKbCgcOwLHvG8
	mSVM+PIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAriv-0000000E6ho-27eU;
	Mon, 20 Oct 2025 15:23:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAris-0000000E6hU-2yRq
	for linux-mtd@lists.infradead.org;
	Mon, 20 Oct 2025 15:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B0E761FE2;
	Mon, 20 Oct 2025 15:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A271BC4CEF9;
	Mon, 20 Oct 2025 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760973777;
	bh=pkWCRgKje8+lMG6BeJd66Pm/J7E6gx/JTrAJgsFBx7k=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=d3QB9lk6p0NS7pcoM9t04x8GFUc9pFinspU4yAdGjmtuQtrnznIbNiSapRH7IUGdC
	 4wSO4RDhLJHA+h8zyvb/hTBZifUD5oU/9iAOf4iv+m1stMym3MB+zSiADAbD4RDw1z
	 do0hC+SSRhh9iYSuQgcwZaD1bvV3M1iljTXbVbyLfk6eJV+z6EDbwwW3IFXGbTb3dg
	 EYziadNUZwTpGwFp6B4TQBo7ShqEZzU5oAdyI39RDZFJsVytgCc9BkoiKE43zbAOBX
	 Duc1gVD0h0y/l2mZWcX/w+0Cr2kiQgpyJfYN+BoP6AA8PmpZ2yCgjBtd0IW32kR8b4
	 RZFKSrF5KQPoQ==
Message-ID: <6b9528bb-feee-4c6f-8d93-3bda1c4f7e96@kernel.org>
Date: Mon, 20 Oct 2025 10:22:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add iommu supports
To: Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM"
 <dmaengine@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
 "open list:CADENCE NAND DRIVER" <linux-mtd@lists.infradead.org>,
 Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
References: <cover.1760486497.git.khairul.anuar.romli@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1760486497.git.khairul.anuar.romli@altera.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMC8xNC8yNSAxOToxMywgS2hhaXJ1bCBBbnVhciBSb21saSB3cm90ZToKPiBUaGlzIHBh
dGNoIHNlcmllcyBhZGRzIElPTU1VIHN1cHBvcnQgZm9yIHRoZSBBZ2lsZXg1IHBsYXRmb3JtIGJ5
Ogo+IAo+IC0gVXBkYXRpbmcgdGhlIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvcjoKPiAgICAtIENh
ZGVuY2UgSFAgTkFORCBjb250cm9sbGVyIChgY2RucyxocC1uZmNgKQo+ICAgIC0gU3lub3BzeXMg
RGVzaWduV2FyZSBBWEkgRE1BIGNvbnRyb2xsZXIgKGBzbnBzLGR3LWF4aS1kbWFjYCkKPiAgICB0
byBhY2NlcHQgdGhlIGBpb21tdXNgIHByb3BlcnR5Lgo+IAo+IC0gQWRkaW5nIHRoZSBTTU1VIChT
eXN0ZW0gTWVtb3J5IE1hbmFnZW1lbnQgVW5pdCkgbm9kZSB0byB0aGUgQWdpbGV4NQo+ICAgIGRl
dmljZSB0cmVlIGFuZCB3aXJpbmcgdXAgdGhlIElPTU1VIHByb3BlcnRpZXMgdG8gdGhlIHN1cHBv
cnRlZAo+ICAgIHBlcmlwaGVyYWxzOgo+ICAgIC0gTkFORCBjb250cm9sbGVyCj4gICAgLSBETUEg
Y29udHJvbGxlcgo+ICAgIC0gU1BJIGNvbnRyb2xsZXIKPiAKPiBUaGUgQWdpbGV4NSBTb0MgaW5j
bHVkZXMgYW4gQVJNIFNNTVUgdjMgd2l0aCBkZWRpY2F0ZWQgVHJhbnNsYXRpb24gQnVmZmVyCj4g
VW5pdHMgKFRCVXMpIGZvciBwZXJpcGhlcmFscy4gVGhlc2UgYWxsb3cgZm9yIGhhcmR3YXJlLWVu
Zm9yY2VkIERNQQo+IGFkZHJlc3MgdHJhbnNsYXRpb24gYW5kIG1lbW9yeSBpc29sYXRpb24gdXNp
bmcgdGhlIElPTU1VIGZyYW1ld29yay4KPiAKPiBFbmFibGluZyBJT01NVSBzdXBwb3J0IGVuc3Vy
ZXMgcHJvcGVyIGludGVncmF0aW9uIG9mIHRoZXNlIGRldmljZXMgaW4KPiB2aXJ0dWFsaXplZCBv
ciBzZWN1cmUgZW52aXJvbm1lbnRzLCBhbmQgYWxpZ25zIHRoZSBwbGF0Zm9ybSB3aXRoIEFSTeKA
mXMKPiBhcmNoaXRlY3R1cmFsIHJlcXVpcmVtZW50cy4KPiAKPiAtLS0KPiBDaGFuZ2VzIGluIHYz
Ogo+IAktIFJlZmluZWQgY29tbWl0IG1lc3NhZ2VzIHdpdGggZGV0YWlsZWQgaGFyZHdhcmUgZGVz
Y3JpcHRpb25zLgo+IAktIENsYXJpZmllZCB3aGljaCBwZXJpcGhlcmFscyBhcmUgY292ZXJlZCBp
biB0aGUgRFQgY2hhbmdlcy4KPiBDaGFuZ2VzIGluIHYyOgo+IAktIEFkZCBtb3JlIGRlc2NyaXB0
aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZSBib2R5IHRvIGNsYXJpZnkKPiAJICBkZXZpY2UgcmVx
dWlyZWQgZm9yIHRoaXMgY2hhbmdlcy4KPiAtLS0KPiBLaGFpcnVsIEFudWFyIFJvbWxpICgzKToK
PiAgICBkdC1iaW5kaW5nczogbXRkOiBjZG5zLGhwLW5mYzogQWRkIGlvbW11IHByb3BlcnR5Cj4g
ICAgZHQtYmluZGluZ3M6IGRtYTogc25wcyxkdy1heGktZG1hYzogQWRkIGlvbW11IHByb3BlcnR5
Cj4gICAgYXJtNjQ6IGR0czogc29jZnBnYTogYWdpbGV4NTogQWRkIFNNTVUgbm9kZXMKPiAKCkFw
cGxpZWQhCgpUaGFua3MsCkRpbmgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
