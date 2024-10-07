Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EE5CFB43F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCPYHjLA5Ek4wgNAJL6n36NKeJCc8KkCOYajlUQICIA=; b=UwvwqtrvlyK2dh
	Uz9uCi8xuynKXIVEMbHF6+02cMmMEPx23f+oSp/YmBwlpC14RMK7qYvoX22b8XnwJENX8aB5MpDvE
	B2n+eXUUdB+oNYC4vYFrKRuaY/aOQcBclSxG/GiFJonYEpGzDySUtabgs6jC8NrkCP+h7D9nkYLLc
	PR0QoVc6mcpKI5jIzrtFdTNd1y9piqjUnpHfsPVfrGi0rR6e6qnJivz9HAKwRRwOe8o8LTjNtDZ1I
	2DMkh2+yaGVyFY5V3qa3EBaEICfGfpkpaLEZxJ+qG3zUM7KFzE6B+LqYxZ58mfzVv/YipWjvedb4p
	nBP984I0cqCRluV0RYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxj9I-00000001m78-0ChZ;
	Mon, 07 Oct 2024 08:31:24 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxj9E-00000001m5u-2ULz
	for linux-mtd@lists.infradead.org;
	Mon, 07 Oct 2024 08:31:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0B75C0005;
	Mon,  7 Oct 2024 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728289876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rb0qAok+4nN5Eq9733pEqebLsnhZLk/VLDHYW7fziQ=;
	b=pXM8LD5c8H8QrgcQFgWuGAYamfTYSxpx9XiiylWBubTJHJUwAwR20s8mt/z1bc1JF5EzM5
	uR6wBGGMd7TSNPCj0tZqBak9clIj7VtJH/1YITcLVYuse0S5EJCZnUeKGdGfTizl01jh/y
	cfGR6Rq6+bN0scEzcsP8IMeruuNUQHwiO4LzV2MQAmbzHqx3kNgDgG9yxnwdh6SACJ3ZkQ
	b52yTTfKCb5E5+plVm8utctGG7arqN7EnTzXh/4zsyTvfo0+OGqH1L5fqn7iWUbCqkpmk7
	GFuDit5+EuJltoNgT5ty/1fEA50Mxtp/v1ldkbUFTlTPGk2Mm7m8myrOHwIj2Q==
Date: Mon, 7 Oct 2024 10:31:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <20241007103114.1a63e3e2@xps-13>
In-Reply-To: <ZwN_2LsLep_mXUgy@gmail.com>
References: <20241006-ondie-v4-0-ff9b9fd9a81d@gmail.com>
	<20241006-ondie-v4-2-ff9b9fd9a81d@gmail.com>
	<deeflg5wd756tkfr6zdta4imuc7ijwl56yclfwiqexlqdq6jsk@5za5g6i7wj6k>
	<ZwN_2LsLep_mXUgy@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_013120_785274_29D52DC3 
X-CRM114-Status: GOOD (  14.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyY3VzLAoKbWFyY3VzLmZvbGtlc3NvbkBnbWFpbC5jb20gd3JvdGUgb24gTW9uLCA3IE9j
dCAyMDI0IDA4OjI5OjQ0ICswMjAwOgoKPiBPbiBNb24sIE9jdCAwNywgMjAyNCBhdCAwODowNzoy
N0FNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gT24gU3VuLCBPY3QgMDYs
IDIwMjQgYXQgMDM6MDU6NDdQTSArMDIwMCwgTWFyY3VzIEZvbGtlc3NvbiB3cm90ZTogIAo+ID4g
PiArICB0aSxkYXZpbmNpLW5hbmQtdXNlLWJidDoKPiA+ID4gKyAgICB0eXBlOiBib29sZWFuCj4g
PiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiA+ICsgICAgICBVc2UgZmxhc2ggYmFzZWQgYmFkIGJs
b2NrIHRhYmxlIHN1cHBvcnQuIE9PQiBpZGVudGlmaWVyIGlzIHNhdmVkIGluIE9PQgo+ID4gPiAr
ICAgICAgYXJlYS4KPiA+ID4gKyAgICBkZXByZWNhdGVkOiB0cnVlCj4gPiA+ICsKPiA+ID4gK3Jl
cXVpcmVkOgo+ID4gPiArICAtIGNvbXBhdGlibGUKPiA+ID4gKyAgLSByZWcKPiA+ID4gKyAgLSB0
aSxkYXZpbmNpLWNoaXBzZWxlY3QKPiA+ID4gKwo+ID4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6
IHRydWUgIAo+ID4gCj4gPiBUaGF0J3MgYSBmaW5hbCBkZXZpY2Ugc2NoZW1hLCB0aGlzIGNhbm5v
dCBiZSB0cnVlLiBXaHkgeW91IGFyZSBkb2luZwo+ID4gdGhpcyBlbnRpcmVseSBkaWZmZXJlbnQg
dGhhbiBhbGwgb3RoZXIgYmluZGluZ3M/ICAKPiAKPiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzIGlzIHRvIGluZGljYXRlIHRoYXQgdGhlCj4gc2NoZW1hIGNvdWxk
IGNvbnRhaW4gcHJvcGVydGllcyB0aGF0IHdlcmUgbm90IGV4cGxpY2l0IGxpc3RlZCBoZXJlIGJ1
dAo+IGluaGVyaXRlZCBmcm9tIGUuZy4gbmFuZC1jb250cm9sbGVyLnlhbWwuCgphZGRpdGlvbmFs
UHJvcGVydGllczogdHJ1ZSBtZWFucyB0aGVyZSBpcyBubyBjb250cm9sIG92ZXIgdGhlCnByb3Bl
cnRpZXMgYWxsb3dlZCwgc28gd2UgZ2VuZXJhbGx5IGRvbid0IHdhbnQgdGhhdCAodW5sZXNzIHlv
dSdyZQp3cml0aW5nIHNwZWNpZmljICJnZW5lcmljIiBiaW5kaW5ncywgd2hpY2ggaXMgbm90IHRo
ZSBjYXNlIGhlcmUpLgoKWW91IGFyZSBkZXNjcmliaW5nIGEgY29udHJvbGxlciBzbyBoZXJlIHlv
dSBzaG91bGQgcmVmZXJlbmNlIHRvCm5hbmQtY29udHJvbGxlci55YW1sLCBidXQgdGhlbiBwcmV2
ZW50IGFueSBwcm9wZXJ0eSBub3QgZGVmaW5lZCBpbgpuYW5kLWNvbnRyb2xsZXIueWFtbCBmcm9t
IGJlaW5nIHVzZWQuIEluIHRoaXMgY2FzZSB5b3UgcHJvYmFibHkgd2FudCB0bwp0cnkgdW5ldmFs
dWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZSwgd2hpY2ggbWVhbnMgdGhhdCBhbnkgcHJvcGVydHkgbm90
Cmxpc3RlZCBoZXJlIG9yIGluIHRoZSByZWZlcmVuY2VkIHNjaGVtYXMgd2lsbCBiZSBwcm9oaWJp
dGVkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
