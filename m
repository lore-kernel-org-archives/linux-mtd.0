Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0DFC43616
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:35:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36FF361995
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36FF361995
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=emJSoPLW5/LwpQUBp4nqjdh7aGNJKeGYYZJdJnyJCqQ=; b=lnP3iWqN/BeqeFNYB/PdIfnAq
	Q64oKVNhf7qJlz6lnPOtWVarGRsj3L1xum7Rwl3bU0KmDEe1i4tZe1aOzE8N1SKJyHJ/gZ1vmgYGM
	KsgYgcnfu5QTuP5UXOUByrxthhSaTtsHTyk5+4Fbrdu9NvbzriZCLei8ghwK4UrUnu02eItWz0Cp6
	FiswiHZdP0q5AJq4/EMsOIzldA0+ZWoWQQtdZliiWwk27oYsNu4DSGyAj5pizLwVgvSgWob5aVxHk
	EAKu8OjlYiT8qAxxLZb2J1bgC7EBDXKSzE7s3FZLOPFUOAjDraIOkCUa8deWIxhL+aLhh6ojzewBm
	7DU9EyfHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3FM-00DxHn-TP; Mon, 10 May 2021 10:34:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg38r-00Dvz9-BN
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=p1HK1m35YLb6qqp0aJ2nt2Kqg9UYL0ptjLhcEC0fS/w=; b=Ovz3y4LH9bE2Ucl9ZcZHETYSTe
 gKvh+V6JKVbUsEx+GDO5Yov2Bmq6yV2iydY/DSztK8UHc9c5WHuYx0p3KddJLgrb01Qfhl0c+g/qq
 FjjXR/MUJ6F/RNgSQrTCG5g756D7FobhdlozjCMZ/Xy2l8epOwMOgB+gz/9NgUa61HWA+78pahy3S
 0aZ/a5SqM3470ZxLyu79uEbAw6SW2yaC8WMWtjsqepnXNG+U+zWAG4DqjJ2kik7dgCGgfLcpvSt7N
 VeuMVUOTDsr81CA0+jz3ytinCnoeDRPIMSbsRb3Qz/+fgJklBotkne+19XzOlPQnVcsX5Lv6DNbXg
 x55OpMow==;
Received: from perseus.uberspace.de ([95.143.172.134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg38n-008XDC-UO
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:28:00 +0000
Received: (qmail 24523 invoked from network); 10 May 2021 10:27:55 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
 by perseus.uberspace.de with SMTP; 10 May 2021 10:27:55 -0000
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20210509144716.431650-1-mail@david-bauer.net>
 <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
 <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
 <ef20e03c43d2eacff7133f74a118ea43@walle.cc>
From: David Bauer <mail@david-bauer.net>
Message-ID: <0b8be4c9-4528-8cac-2067-4ad2b180df79@david-bauer.net>
Date: Mon, 10 May 2021 12:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ef20e03c43d2eacff7133f74a118ea43@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_032758_302757_FDF7305B 
X-CRM114-Status: GOOD (  21.03  )
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

SGkgTWljaGFlbCwKCk9uIDUvMTAvMjEgMTE6MzUgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4g
SGkgRGF2aWQsCj4gCj4gQW0gMjAyMS0wNS0xMCAxMToyOCwgc2NocmllYiBEYXZpZCBCYXVlcjoK
Pj4gT24gNS8xMC8yMSAxMDowMCBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZQo+Pgo+PiBbLi4uXQo+
Pgo+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gYm9ob25nX3BhcnRzW10gPSB7
Cj4+Pj4gK8KgwqDCoCAvKiBCb0hvbmcgTWljcm9lbGVjdHJvbmljcyAqLwo+Pj4+ICvCoMKgwqAg
eyAiYmgyNXExMjhhcyIsIElORk8oMHg2ODQwMTgsIDAsIDY0ICogMTAyNCwgMjU2LAo+Pj4KPj4+
IEkgY291bGRuJ3QgZmluZCAiQm9Ib25nIiBpbiBKRVAxMDZCQy4gMHg2OCAod2l0aG91dCBjb250
aW51YXRpb24gY29kZXMpCj4+PiBpcyAiQ29udmV4IENvbXB1dGVyIi4gU28gdGhpcyBpcyB3cm9u
Zy4gT1RPSCBJJ20gbm90IHN1cmUsIGhvdyBtYW55Cj4+PiBTUEkgZmxhc2hlcyAiY29udmV4IGNv
bXB1dGVyIiBoYXZlLCBpZiBhbnkgOykgVGhpcyBjb21wYW55IHdhcyBicm91Z2h0Cj4+PiBieSBI
UCBpbiB0aGUgZW5kLgo+Pj4KPj4+IEluIGFueSBjYXNlLCB0aGlzIHBhdGNoIGRlcGVuZHMgb24g
aG93IHdlIGhhbmRsZSBjb250aW51YXRpb24gY29kZXMgb3IKPj4+IGlmIHdlIGNhbiBoYW5kbGUg
dGhlbSBhdCBhbGwuIE9yIGlmIHRoaXMgZmxhc2gganVzdCBsaWUgYWJvdXQgaXRzCj4+PiBtYW51
ZmFjdHVyZXIgaWQgYW5kIGRvbid0IGFuZCBDQy4KPj4KPj4gRmlyc3Qgb2YgYWxsLCBCb0hvbmcg
YW5kIEJveWEgbWljcm9lbGVjdHJvbmljcyBzZWVtcyB0byBiZSB0aGUgc2FtZQo+PiBjb21wYW55
LCBhcyB0aGVpciBkYXRhc2hlZXRzIHNlZW0gdG8gY29weSBlYWNoIG90aGVyLiBUaGVyZSdzIG5v
dCBtdWNoCj4+IGluZm9ybWF0aW9uIGFib3V0IGVpdGhlciBvZiBib3RoLCBzbyBJJ2Qgc2F5IHRo
YXQncyBhIGZhaXIgYXNzdW1wdGlvbi4KPj4KPj4gUmVnYXJkaW5nIHRoZSBjb250aW51YXRpb24g
Y29kZXMsIEJveWEgaXMgbGlzdGVkIGluIGJhbmsgbmluZSwgaG93ZXZlcgo+PiBpbiB0aGlzIGNh
c2UgSSBzaG91bGQgY3VycmVudGx5IHJlYWQgYW4gYWxsIDB4N2YgSUQgc2hvdWxkbid0IEk/Cj4g
Cj4gSSdkIGd1ZXNzIHNvLCB5ZXMuCj4gCj4+IFRoZSBkYXRhc2hlZXQgYWxzbyBvbmx5IHNwZWNp
ZmllcyAzIGJ5dGVzIGFzIGEgcmV0dXJuIHZhbHVlIGZvcgo+PiByZWdpc3RlciAweDlmaCA6KAo+
IAo+IFllYWguIFNvLCB0aGlzIGZsYXNoIGZhbGxzIGludG8gdGhlIHNhbWUgY2F0ZWdvcnkgInNp
bXBseSBoaWphY2tzCj4gYSBtYW51ZiBpZCIgYXMgYWxsIHRoZSBvdGhlciBmbGFzaGVzLgoKRnJv
bSBhIHF1aWNrIGNoZWNrLCB0aGlzIGlzIGFsc28gYmUgdGhlIGNhc2UgZm9yIEdpZ2FEZXZpY2Vz
IGFuZCBYTUMuCgpNeSBzcG9udGFuZW91cyBpZGVhIHdvdWxkIGJlIHRvIGV4dGVuZCBzdXBwb3J0
IGZvciBKRURFQyBJRHMgdG8gcmVhZAp0aGUgdXAgdG8gOSBiYW5rcyBvZiB0aGUgdmVuZG9yIElE
IGFuZCBmaXggdXAgdGhlIGV4aXN0aW5nIG9mZmVuZGVycy4KClRvIG5vdCBicmVhayBleGlzdGlu
ZyBib2FyZHMsIHdlIGNvdWxkIGVpdGhlciBza2lwIHRoZSBjb250aW51YXRpb24KYnl0ZXMgb2Yg
dGhlIGtlcm5lbCBJRCBkZWZpbml0aW9ucyBmb3IgYWxsIGZsYXNoIGNoaXBzIG9yIGZsYWcgdGhl
CmFscmVhZHkgZXhpc3Rpbmcgb25lcyBhbmQgb25seSBwZXJmb3JtIHRoaXMgb24gc3VjaCBmbGFn
Z2VkIGNoaXBzLgoKUGVyc29uYWxseSwgSSdkIHNheSB0aGF0IG9ubHkgcGVyZm9ybWluZyB0aGlz
IG9uIGV4aXN0aW5nIGNoaXBzIHdvdWxkCmJlIGJldHRlciwgYXMgbmV3IHZlbmRvcnMgd2l0aCB0
aGlzIHZpb2xhdGlvbiBzY2hlbWUgbWlnaHQgcHJvYmFibHkKYXBwZWFyIGFuZCBjYXVzZSBjb25m
bGljdHMuCgpBcyB3ZSBzdGlsbCBsYWNrIGF1dG8gZGV0ZWN0aW9uIGZvciBuZXcgY2hpcHMgd2l0
aCB0aGF0LCBjb25maWd1cmluZwp0aGUgZmxhc2ggY2hpcCB1c2VkIHdpdGggdGhlIGNoaXAgbmFt
ZSB2aWEgRFQgd291bGQgYWxsb3cgdG8gc2V0IHRoZQpleGFjdCBjaGlwIHVzZWQgYW5kIGFsc28g
dmFsaWRhdGUgaWYgdGhlIG1hbnVmYWN0dXJlciAvIHByb2R1Y3QgYWZ0ZXIKdGhlIGNvbnRpbnVh
dGlvbiBiaXRzIG1hdGNoZXMgdGhlIG9uZSByZWFkIGZyb20gdGhlIGNoaXAuCgpXaGF0IGRvIHlv
dSB0aGluaz8KCkJlc3QKRGF2aWQKCj4gCj4gV2Ugc3RpbGwgbmVlZCB0byBjb21lIHVwIHdpdGgg
YSBzb2x1dGlvbiBmb3IgdGhpcyBwcm9ibGVtLgo+IAo+IC1taWNoYWVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
