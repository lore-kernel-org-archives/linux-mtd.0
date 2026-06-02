Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1283CD6E4A
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 12:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXOqS+eUrcf6rFdbWEU0O0XSU9+03yXl5tMTTywTqcU=; b=jAMTx8+avTj+ww
	839iCKkDiB8SmPrQiSJ0ABE0wILVB1GlMYe13vycRBmVPCz9Z611gJ/ZsHC6LwgGX7p4bGiKM8V5a
	eKCfEVGXw2WkSCZdqFSxLKasAo2BZnEatg8nVpcBh/H0Pt1Ohj/6mLP684D0fhQuZudoO5Mwfvs7f
	hMpyimOBPrbfDe/il+imRpcty2Kd/3evZ7HaI2RavAg851GlXnWc29xbUED/zFAKe/Rj0OGsQGKxG
	EWRDGr3qt55+n2K1AA0nuuspmlx5lzRaaILjuNXfGh7UySs6qhbDp7NeVmWdl8nXlm4soOjrlNVp9
	OurxKUvHMdu6XbQkiweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOM9-0000000Czve-1Oz6;
	Tue, 02 Jun 2026 12:36:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOM5-0000000Czv2-3iwH
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 12:36:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 71FE54E42DC0;
	Tue,  2 Jun 2026 12:36:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43069603BC;
	Tue,  2 Jun 2026 12:36:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CE99108883E7;
	Tue,  2 Jun 2026 14:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780403782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SRPRaAh+bKL/wfIfWcgbiLpj4JaAtntWVoPHMgKJ5hk=;
	b=IzdBcF7KMuSb7rZ5XB+aZYiM0E5ckcEKMIFaaFmESlAG2XXd/oPBYuAePWkIA+1XVt8AnE
	Uaae1GYa00ns3rwjBIIHI8NNiSRjpJ/HlnFxpC3VQjR21RTIaezCw4oUPpdI0Vb4S8sBE+
	9YG3xXTIGSm/2KP05PNUZNU5X1zOOayandiof2fO57ZKW4Cna75LUsxYSzHOF4SSldoRgs
	XZMzpGuHNAMXLxwgIKqtuZPCl1GVYEweyOfHNkDN699VQawnNiUZabi3YJ79OVIGpwCqRZ
	PDPoMjuKitoxIWOn2lQn18DJxCtPkpODwqQcIjYPub9VBM+0aypiC4umizGmHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  <broonie@kernel.org>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <pratyush@kernel.org>,
  <mwalle@kernel.org>,  <takahiro.kuwano@infineon.com>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <a-dutta@ti.com>
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY
 tuning pattern partition property
In-Reply-To: <4a570d36-dda6-4f3d-9c16-d3e57ac55f1c@ti.com> (Santhosh Kumar
	K.'s message of "Tue, 2 Jun 2026 12:00:36 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-3-s-k6@ti.com>
	<20260530-original-peccary-of-cubism-af68ed@quoll>
	<2f091813-fa28-407f-892d-bbbbe3cac4e4@ti.com>
	<063fe976-9a28-4670-90df-921fbc1c3a8c@kernel.org>
	<20260601-stirring-tested-mayfly-e97c14@quoll>
	<4a570d36-dda6-4f3d-9c16-d3e57ac55f1c@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 02 Jun 2026 14:36:17 +0200
Message-ID: <87mrxd15mm.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_053626_056800_30705708 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgo+Pj4+PiBJIGFsc28gaGF2ZSBkb3VidHMgdGhhdCB0aGlzIGlzIHBlci1kZXZpY2Ug
cHJvcGVydHkuIFlvdXIgY29tbWl0IG1zZwo+Pj4+PiBzdWdnZXN0cyBpdCBpcyBwZXIgY29udHJv
bGxlci4KPj4+Pgo+Pj4+IFRoaXMgaXMgYSBwZXItZGV2aWNlIHByb3BlcnR5LiBJdCBpcyBjb25z
dW1lZCBieSB0aGUgY29udHJvbGxlciBkcml2ZXIKPj4+PiBvbmx5IHRvIGxvY2F0ZSBhbmQgcmV0
cmlldmUgdGhlIG9mZnNldCBvZiB0aGUgUEhZIHBhdHRlcm4gcGFydGl0aW9uCj4+Pgo+Pj4gU28g
d2l0aCB0d28gZGV2aWNlcyBvbiBhIGJ1cywgeW91IG5lZWQgdHdvIHNlcGFyYXRlIHBhcnRpdGlv
bnMgZm9yIHR1bmluZz8KPgo+IEVhY2ggU1BJIE5PUiBmbGFzaCBkZXZpY2UgbmVlZHMgYSBwYXJ0
aXRpb24gdG8gc3RvcmUgUEhZIHR1bmluZwo+IHBhdHRlcm4uCgpJZiBJIG1heSB0cnkgdG8gZXhw
bGFpbiBhIGJpdCB3aGF0IGlzIGJlaGluZCwgdGhlIHJlYWQgdHVuaW5nIHByb2NlZHVyZQppcyBh
Ym91dCByZWFkaW5nIGRhdGEgZnJvbSB0aGUgc3BpIG1lbW9yeSBjYWNoZSAoc29tZSBraW5kIG9m
IGludGVybmFsClNSQU0pIG92ZXIgYW5kIG92ZXIgYWdhaW4sIHdoaWxlIHR1bmluZyB0aGUgY29u
dHJvbGxlciBwYXJhbWV0ZXJzIHVudGlsCndlIGdldCB0aGUgYmVzdCBzdGFiaWxpdHkgKHRoZSBj
b250cm9sbGVyIGRyaXZlciBrbm93cyB0aGUgcGF0dGVybiBpdAptdXN0IGdldCkuIFdoaWxlIFNQ
SSBOQU5EIGNoaXBzIGhhdmUgIndyaXRlIHRvIGNhY2hlIiBvcGNvZGVzIHRoYXQgY291bGQKYmUg
dXNlZCB0byBsb2FkIHRoZSBwYXR0ZXJuIGludG8gdGhlIGNoaXAgd2l0aG91dCBhbnkgYWN0dWFs
IHJlYWQgZnJvbQp0aGUgbWVtb3J5IGFycmF5LCB0aGlzIGlzIG5vdCBwb3NzaWJsZSB3aXRoIFNQ
SSBOT1IgZGV2aWNlcyB3aGljaCBkbyBub3QKaGF2ZSBzdWNoIGNhcGFiaWxpdHkuIFNpbmNlIHdl
IHdhbnQgdG8ga2VlcCB0aGlzIHRyYWluaW5nIHByb2NlZHVyZQptZW1vcnkgYWdub3N0aWMgKGFu
ZCBhbHNvIHNvbWV3aGF0IHNpbXBsZSksIHdlIHNoYWxsIGV4cGVjdCBvbmUgcGF0dGVybgpwZXIg
bWVtb3J5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
