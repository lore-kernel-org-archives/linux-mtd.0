Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C82DC47DAF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jan 2024 22:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEw6jH6JO5lATusN7mTcroBiVJ9OleKMBsCWOXT5DOA=; b=y/xqHmO3eMSsby
	UuJ8wmz5DckLmX7kErN+0K2VSmOAvHvOwi1hXC8t6sQqIpDcebu8MHv7yE28Re1ZmqspvBC+Zlq7C
	xzceixNvdwj5YF2rLSSyQUmJv5iavKUZh+zbrLUZdRR+O0sNsioBC2vdpF+li4v0ZrWqpVhBBcVCB
	xLt8Hl461DhXQP0qScHthwLRrIAs7wWLrkNqufDMYTEXmFaZV4pMxtY86ZJaRxFFY1HtBvjuw9sxP
	a87RRoTcWka5ilmd2+JXwr/BoOIVVDLb8RBfHPOGMtcQylepE6k8aWXi1Ic50388ijeEKeiC7b7MX
	1ozQeRTqo1mpdHLdXcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQxR7-006my7-0O;
	Fri, 19 Jan 2024 22:34:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQxR1-006mx4-1r
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jan 2024 22:34:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1114615B8;
	Fri, 19 Jan 2024 22:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C57C433C7;
	Fri, 19 Jan 2024 22:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705703638;
	bh=ngixGCop/FGHGM4VzT1CdOop6LC5rXZwbYzCfDoGwts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L/ux92ACavMeQTuySYHzUdjzBdTshNCu8men0WVqNM8xU8CzmL8Haom99430LD/yO
	 jVeoVk+JB5RCGBz4asKTRhVO8A+lWq+kn9iVY5t+UUzwhpED/gZacqIcfDyTUhbz+P
	 4jWFKEhFOEhOIFIbzsObO6/AIZ2d06gJKeuIF7VALZQQPLwB4VYlVCvRS3gmnn4MEu
	 9do9ADGapuKlJfF83YmsujncFeCXK+tWLfSKM8iC0j7tPKWl1kIK0rOPS0wysyeegx
	 F4vnMaCTeympnvCFKjdCLeTZJCagf0NLgj/9AszYLWZlsXuuzSXjGuEoHYiloWsdtz
	 hareX2ZIrt4Fg==
Date: Fri, 19 Jan 2024 16:33:56 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ansuel Smith <ansuelsmth@gmail.com>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: mtd: partitions: make partition an NVMEM
 provider
Message-ID: <20240119223356.GA1179470-robh@kernel.org>
References: <20240111121940.15628-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111121940.15628-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_143359_656337_3D620872 
X-CRM114-Status: GOOD (  15.14  )
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

T24gVGh1LCBKYW4gMTEsIDIwMjQgYXQgMDE6MTk6NDBQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBN
VEQgcGFydGl0aW9uIHByb3ZpZGVzIGZsYXNoIGRldmljZSBkYXRhIGFuZCBjYW4gYmUgdXNlZCBh
cyBOVk1FTQo+IGRldmljZS4KCkkgZG9uJ3QgZm9sbG93IHdoYXQgaXMgdGhlIHJlbGF0aW9uc2hp
cCBiZXR3ZWVuIHRoaXMgYW5kIHlvdXIgb3RoZXIgCnNlcmllcy4KCj4gCj4gU2lnbmVkLW9mZi1i
eTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+ICAuLi4vYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgICAgICAgfCAxNiArKysrKysrKystLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFy
dGl0aW9ucy9wYXJ0aXRpb24ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+IGluZGV4IDFlYmU5ZTIzNDdlYS4uN2Ix
ZDg0Y2U1ZWY1IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+IEBAIC01Nywx
MyArNTcsMTUgQEAgcHJvcGVydGllczoKPiAgICAgICAgdXNlciBzcGFjZSBmcm9tCj4gICAgICB0
eXBlOiBib29sZWFuCj4gIAo+IC1pZjoKPiAtICBub3Q6Cj4gLSAgICByZXF1aXJlZDogWyByZWcg
XQo+IC10aGVuOgo+IC0gIHByb3BlcnRpZXM6Cj4gLSAgICAkbm9kZW5hbWU6Cj4gLSAgICAgIHBh
dHRlcm46ICdecGFydGl0aW9uLS4qJCcKPiArYWxsT2Y6Cj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9u
dm1lbS9udm1lbS55YW1sCgpPbmx5IHNvbWUgcGFydGl0aW9ucyBhcmUgbnZtZW0gbm9kZXMsIHNv
IHdlIHNob3VsZG4ndCBhbHdheXMgaW5jbHVkZSBpdC4gClRoZW4gd2UgY2FuJ3QgZXhjbHVkZSBu
dm1lbSBwcm9wZXJ0aWVzIGZyb20gcGFydGl0aW9uIG5vZGVzIHdoaWNoIAphcmVuJ3QuIFdlIHNo
b3VsZCBpZGVudGlmeSB0aG9zZSBub2RlcyBieSBjb21wYXRpYmxlIGFuZCB0aGVpciBzY2hlbWEg
CnNob3VsZCByZWZlcmVuY2UgcGFydGl0aW9uLnlhbWwgYW5kIG52bWVtLnlhbWwuCgpUaGVyZSdz
IGEgZ2VuZXJhbCBwcm9ibGVtIHdpdGggdGhlIHBhcnRpdGlvbiByZWxhdGVkIHNjaGVtYXMgdGhh
dCAKdW5kZWZpbmVkIHByb3BlcnRpZXMgYXJlIG5vdCBjYXVnaHQuIFRoaXMgaXMgcGFydGx5IGJl
Y2F1c2UgCnBhcnRpdGlvbiBub2RlcyBjYW4gYmUgbmVzdGVkIGFuZCBleHByZXNzaW5nIHRoYXQg
d2l0aCB0aGUgc2NoZW1hIGlzIApoYXJkLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
