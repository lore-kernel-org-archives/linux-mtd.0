Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138C1CD5BD5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1r0n6bmjwrKZ/DaIOSe2YaI1jjx0d9Vp1MkLyQWlWk=; b=e1ZgCAsCd9OD2P
	s+mtoAzbDnk3SCaOnFyCaZSgZnZqfVDBFdrErLQwGbP8KWqdH3H6peUx555Noq8iUT5tt035sJgU9
	TkgrABfciUoYbSrV9wvAyK3+B//VPx4kl089uhSrq6x907qNNyCH/f0IA7L5NTecwU9rFrEH9cEjp
	cr3QGxmGtuzfaGDihrQaefZIVHPfcrdITXgBcn5aAc6BKMnWMF8eCaiK1yjcLfFHcRcD6gY2c/E0G
	7ICF2p24iv1yPjkMoSeuWj4u1UfXPfU2Q1nq76G5zZ66qzb4edQTScgiabNWEVe4+uvND0eoSlWYg
	Nxd+7zoV4+3w5faNmO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWCy-00000005P7W-2nLB;
	Thu, 28 May 2026 08:35:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWCy-00000005P7L-0Vvw
	for linux-mtd@bombadil.infradead.org;
	Thu, 28 May 2026 08:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M56eRJSkoeZGYpGwZOTyQ5aXY21sscvasyo7WERYLoU=; b=UPHWOEXA9Njgr/82VodiGAfvkZ
	J2W9wghKp/eB9KlIkyZmKdpYXon3+RQ5/guFIv5/g8yl3CjPIefPJPPjTunpK9VqARvQHdr0LTZJp
	ZcYUaTVfegZPtep4aGktvmWsJrTCr2RvdK0bHKcN8+xqOPGlFjG8M/kvPLARlhh7qPtdtGzca3CLf
	nnJtXzuT+anBKi4DCztLdR9wXwRUD6UptVT8K32XI0qPPFX1erQNv8R5nktOmvSmQeDBZchJOoyNi
	nC0GScexn/1Gpua7Gf+y60zbKXFcppMU6PE+l1CYoDs+cZ8kCW94TO8mevGsZujkbsFKBX7WSDTdy
	V31ZlN6w==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWCs-0000000FqaK-0tza
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 08:35:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B37A4E42D66;
	Thu, 28 May 2026 08:35:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2947060495;
	Thu, 28 May 2026 08:35:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D59CB1088877F;
	Thu, 28 May 2026 10:34:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779957299; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M56eRJSkoeZGYpGwZOTyQ5aXY21sscvasyo7WERYLoU=;
	b=cnpE5h7MRH8sI7n622w/jjPJPNGinPbr7SiiFVDEFKXLeNtHiLl4SAxNmVTDEhK9sLql7R
	mxGKrjO3w40kqbIJTC/zZTsTROdrql3wbwQV2gqG8TbH7UTLUZ4CLNxOYyuD2ld/hdHekc
	HTzKvx7EcdVdWfY/rg7a17VIByb0nwthLx94vAHNnhWKXzYzSwflch4C0UnKlB/h+UvtX8
	zardFwSAcEyD7F0/d8fmO+ZAmoGD4Sl97I8OFysY7P6zcdKeQDl2liZ01to/2Q6238acrP
	v3SXi59qm7DE/sstUFgY6EwNK3VAvxFo4cE9O6Aj9cKCOZFt8tVAiCZWRrHc/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY
 tuning pattern partition property
In-Reply-To: <20260527175527.2247679-3-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Wed, 27 May 2026 23:25:16 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-3-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 28 May 2026 10:34:55 +0200
Message-ID: <87qzmwgceo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_093510_878647_F3FBD869 
X-CRM114-Status: GOOD (  14.88  )
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

T24gMjcvMDUvMjAyNiBhdCAyMzoyNToxNiArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBQSFkgdHVuaW5nIHJlcXVpcmVzIGEga25vd24gZGF0YSBwYXR0ZXJu
IHRvIGJlIHJlYWRhYmxlIGZyb20gZmxhc2guCj4gV2hlbiBubyBwYXJ0aXRpb24gaXMgZXhwbGlj
aXRseSBpZGVudGlmaWVkLCB0aGUgY29udHJvbGxlciBtdXN0IHNlYXJjaAo+IGFsbCBhdmFpbGFi
bGUgcGFydGl0aW9ucyB0byBsb2NhdGUgdGhlIHBhdHRlcm4gYnkgbGFiZWwsIHdoaWNoIGFkZHMK
PiBvdmVyaGVhZCBhbmQgcmVsaWVzIG9uIGxhYmVsIG5hbWluZyBjb252ZW50aW9ucyBvdXRzaWRl
IHRoZQo+IGNvbnRyb2xsZXIncyBjb250cm9sLgo+Cj4gQWRkIGNkbnMscGh5LXBhdHRlcm4tcGFy
dGl0aW9uLCBhIHBoYW5kbGUgcHJvcGVydHkgdGhhdCBhbGxvd3MgdGhlIERUCj4gYXV0aG9yIHRv
IGRpcmVjdGx5IHJlZmVyZW5jZSB0aGUgZmxhc2ggcGFydGl0aW9uIGhvbGRpbmcgdGhlIFBIWSB0
dW5pbmcKPiBwYXR0ZXJuLiBUaGUgY29udHJvbGxlciB1c2VzIHRoaXMgcGFydGl0aW9uIGR1cmlu
ZyBjYWxpYnJhdGlvbiwgYXZvaWRpbmcKPiB0aGUgcGFydGl0aW9uIHNlYXJjaCBlbnRpcmVseS4K
Ckkgd291bGQgcmVtb3ZlIHRoZSAiYXZvaWRpbmcgdGhlIHBhcnRpdGlvbiBzZWFyY2ggZW50aXJl
bHkiLiBXaGlsZQp0aHJ1dGhmdWwsIHRoaXMgaXMgcmVsYXRlZCB0byB0aGUgaGlzdG9yeSBvZiB0
aGUgZmVhdHVyZSAoaG93IGl0IHdhcwppbXBsZW1lbnRlZCBiZWZvcmUpIGJ1dCBkb2Vzbid0IGdp
dmUgYW55IHVzZWZ1bCBoaW50IHRvIHRoZSByZWFkZXIgb2YKdGhlIExpbnV4IGtlcm5lbCBtYWlu
bGluZSByZXBvc2l0b3J5LiBJIHdvdWxkIGp1c3QgZHJvcCB0aGF0IG1lbnRpb24sCmFuZCBzYW1l
IGJlbG93LgoKPiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4K
PiAtLS0KPiAgLi4uL2JpbmRpbmdzL3NwaS9jZG5zLHFzcGktbm9yLXBlcmlwaGVyYWwtcHJvcHMu
eWFtbCAgICAgIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9j
ZG5zLHFzcGktbm9yLXBlcmlwaGVyYWwtcHJvcHMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zcGkvY2Rucyxxc3BpLW5vci1wZXJpcGhlcmFsLXByb3BzLnlhbWwKPiBp
bmRleCA1MTBiODJjMTc3YzAuLjBmZmNkZjViMDBkMCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2NkbnMscXNwaS1ub3ItcGVyaXBoZXJhbC1wcm9w
cy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9jZG5z
LHFzcGktbm9yLXBlcmlwaGVyYWwtcHJvcHMueWFtbAo+IEBAIC0zOSw0ICszOSwxMiBAQCBwcm9w
ZXJ0aWVzOgo+ICAgICAgICBEZWxheSBpbiBuYW5vc2Vjb25kcyBiZXR3ZWVuIHNldHRpbmcgcXNw
aV9uX3NzX291dCBsb3cgYW5kCj4gICAgICAgIGZpcnN0IGJpdCB0cmFuc2Zlci4KPiAgCj4gKyAg
Y2RucyxwaHktcGF0dGVybi1wYXJ0aXRpb246Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgUGhh
bmRsZSB0byB0aGUgZmxhc2ggcGFydGl0aW9uIGNvbnRhaW5pbmcgdGhlIFBIWSB0dW5pbmcgcGF0
dGVybi4KPiArICAgICAgV2hlbiBwcmVzZW50LCB0aGUgY29udHJvbGxlciB1c2VzIHRoaXMgcGFy
dGl0aW9uIHRvIGxvY2F0ZSB0aGUKPiArICAgICAgcGF0dGVybiBkYXRhIGR1cmluZyBQSFkgdHVu
aW5nCgpQZXJpb2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgo+ICsgICAgICBp
bnN0ZWFkIG9mIHNlYXJjaGluZyBhbGwgcGFydGl0aW9ucyBieSBsYWJlbC4KClRoaXMgc2VudGVu
Y2UgY2FuIGJlIGRyb3BwZWQuCgo+ICsKPiAgYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKCldp
dGggdGhlc2UgY29tbWVudHMgYWRkcmVzc2VkLCB5b3UgY2FuIGFkZCBteQoKUmV2aWV3ZWQtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
