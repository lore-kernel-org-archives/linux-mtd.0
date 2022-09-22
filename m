Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BA1C6FA86
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RdAhkIEdlbW467y5JHOr8yIj4J9jtfNHLehtGogzgA=; b=PYYY7KSVwa0ynx
	IvEkfv9tAKcuKlRn7z9pQu27aJesYxgi5znb4VudGWgJN1U1cOFUOyJ/zK7xkgP0Y8ih3HiDDsN8/
	z4Tt/FzNqQSMd19V95VroPMO9f/l8zQPm5+lS0tj+U6Nb0Uo9etstc4s499KdifjC97YQjigjXuH+
	rl9kFxC/ZJRfJpaNto/NsZV5C14z4JYje1btkI19k3uztsqzv+ByLZS7GnCSMW9G0UzggXJY3zRHw
	W+LwzmcPSxBHxeZnv5y7RngCQNs/HeHDbpqGEkt7aUkBO+icVlAzoLC416qvF3VSJUvNnM88ePh5k
	wVQkSXqL2k8nx21ag8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obImS-00EXtX-0S; Thu, 22 Sep 2022 09:46:04 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obIPd-00EQQR-FM; Thu, 22 Sep 2022 09:22:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 01E4E1C0004;
	Thu, 22 Sep 2022 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663838542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sNNs6mkshJUfVhodqkvh+WxLUvE+EftG/ZXnoTujoc=;
	b=n5mx3gyqVEaoFkx7UXA7ki7OtX+uxGsMbc77DZthlrjl8y/RK5vXVhKyfF/i0vsqdpNPlQ
	gPXxlfSfnevJDDlJQ7CagKDHZTsRkpwdu7KScFjxsTukzyNRlcWz7KmVrDYQiUF2LWlJpL
	DE8LHAOJPnD0Z/IwUFXWFVy0h/s/StHPzTi5xNQlFalHt2xr7KXwsQxUhtcnaGli4m91pl
	f8PeEA92OPVkPfqkilNbcHYb0sT/HXgwYLjSxpXp6rtE5F0/kHVLqSB5T0v+l312Nq2K7R
	0xyPr4mvGNO9wHycYtu3jvGHgHkgPtkOmTYk3uzptfbFB75H1ZUPUrNAHk11Fw==
Date: Thu, 22 Sep 2022 11:22:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Rob Herring <robh@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Frank Rowand <frowand.list@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Robert Marko
 <robert.marko@sartura.hr>
Subject: Re: [PATCH v2 15/20] dt-bindings: nvmem: add YAML schema for the
 sl28 vpd layout
Message-ID: <20220922112218.3aff146f@xps-13>
In-Reply-To: <aa53a858e362ae747a2cbd28caa3fa78@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
	<20220901221857.2600340-16-michael@walle.cc>
	<20220912192038.GA1661550-robh@kernel.org>
	<aa53a858e362ae747a2cbd28caa3fa78@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_022229_892300_2F003B42 
X-CRM114-Status: GOOD (  23.70  )
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

SGVsbG8gUm9iICYgS3J6eXN6dG9mLAoKbWljaGFlbEB3YWxsZS5jYyB3cm90ZSBvbiBUdWUsIDEz
IFNlcCAyMDIyIDE2OjIxOjI0ICswMjAwOgoKPiBBbSAyMDIyLTA5LTEyIDIxOjIwLCBzY2hyaWVi
IFJvYiBIZXJyaW5nOgo+IAo+ID4+ICsgIGJhc2UtbWFjLWFkZHJlc3M6Cj4gPj4gKyAgICB0eXBl
OiBvYmplY3QKPiA+PiArICAgIGRlc2NyaXB0aW9uOgo+ID4+ICsgICAgICBCYXNlIE1BQyBhZGRy
ZXNzIGZvciBhbGwgb24tbW9kdWxlIG5ldHdvcmsgaW50ZXJmYWNlcy4gVGhlID4+IGZpcnN0Cj4g
Pj4gKyAgICAgIGFyZ3VtZW50IG9mIHRoZSBwaGFuZGxlIHdpbGwgYmUgdHJlYXRlZCBhcyBhbiBv
ZmZzZXQuCj4gPj4gKwo+ID4+ICsgICAgcHJvcGVydGllczoKPiA+PiArICAgICAgIiNudm1lbS1j
ZWxsLWNlbGxzIjogIAo+ID4gCj4gPiBZb3UgY2FuJ3QganVzdCBhZGQgYSBuZXcgIy4qLWNlbGxz
IGJ1cmllZCBpbiBhIGRldmljZSBiaW5kaW5nLiBJJ20gZmluZQo+ID4gd2l0aCB0aGUgY29uY2Vw
dCB0aG91Z2ggaGF2aW5nIG1vcmUgdGhhbiAxIHVzZXIgd291bGQgYmUgbmljZS4gIAo+IAo+IEkg
d2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoZSB0b29saW5nIHdpbGwgaGFuZGxlIGl0LCBidXQg
YXMgeW91Cj4gcG9pbnRlZCBvdXQgYmVsb3csIHRoaXMgaXNuJ3QgdGhlIGNhc2UgZm9yIGEgbWlz
c2luZyBkZWZhdWx0LiBUaGUKPiBzdGF0ZW1lbnQgYWJvdmUgc2hvdWxkIG9ubHkgYmUgdG8gdmFs
aWRhdGUgdGhhdCB0aGVyZSBpcyBvbmUKPiBhZGRpdGlvbmFsIGFyZ3VtZW50IGlmIHRoZSBiYXNl
LW1hYy1hZGRyZXNzIG5vZGUgaXMgdXNlZCBpbiBhCj4gcGhhbmRsZS4KPiAKPiA+IEFueSBjYXNl
IHRoYXQgZG9lc24ndCBtYXRjaCBmb29zLT4jZm9vLWNlbGxzIG9yIGhhcyBhIGRlZmF1bHQgIyBv
Zgo+ID4gY2VsbHMgaWYgbWlzc2luZyAoYXMgdGhpcyBkb2VzKSBoYXMgdG8gYmUgYWRkZWQgdG8g
ZHRzY2hlbWEgdG8gZGVjb2RlID4gaXQKPiA+IHByb3Blcmx5LiBJdCB3b24ndCByZWFsbHkgbWF0
dGVyIHVudGlsIHRoZXJlJ3MgYSB1c2VyIHdpdGggMiBvciBtb3JlCj4gPiBlbnRyaWVzLiBJJ20g
aGFwcHkgdG8gZG8gdXBkYXRlIHRoZSBkdHNjaGVtYSBwYXJ0LCBidXQgSSdkIHByZWZlciB0byA+
IHNlZQo+ID4gdGhlIHNjaGVtYSBpbiBkdHNjaGVtYSByYXRoZXIgdGhhbiB0aGUga2VybmVsLiAg
Cj4gCj4gT2ssIGJ1dCBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHlvdSBjb3JyZWN0bHkgaGVy
ZS4gWW91IHdpbGwKPiB1cGRhdGUgdGhlIGR0c2NoZW1hIHRvb2xpbmcgKEkgZ3Vlc3MgaXQncyBh
Ym91dCBmaXh1cF9waGFuZGxlcygpIGluCj4gZHRiLnB5KSBhbmQgd2hpY2ggc2NoZW1hIHNob3Vs
ZCBiZSBpbiBkdHNjaGVtYT8gbnZtZW0ueWFtbAo+IGFuZC9vciBudm1lbS1jb25zdW1lci55YW1s
PyBUaGUgZW50aXJlIHNjaGVtYSBvciBvbmx5IGEKPiBzdWJzZXQgb2YgaXQ/CgpJIGN1cnJlbnRs
eSBzZWUgdGhpcyBhcyB0aGUgbWFpbiAiYmxvY2tpbmcgcG9pbnQiLCBhbHRob3VnaCBSb2IgdG9s
ZCBoZQp3YXMgaGFwcHkgd2l0aCB0aGUgb3ZlcmFsbCBpZGVhLCBzbyBsZXQncyB0cnkgdG8gbW92
ZSBmb3J3YXJkIHRvZ2V0aGVyLgoKV2UgZGlzY3Vzc2VkIG9uIElSQyB3aXRoIE1pY2hhZWwsIEkg
Z3Vlc3Mgd2hhdCdzIHJlbWFpbmluZyBpczoKLSBNaWNoYWVsOiBNb3ZlICNudm1lbS1jZWxsLWNl
bGxzIHRvIG52bWVtLnlhbWwgaW4gdGhlIGNvcmUgZHRzY2hlbWEuCi0gUm9iL0tyenlzenRvZjog
QWRkIHRoZSBuZWNlc3NhcnkgdG9vbGluZyB0byB1c2UgdGhpcyBuZXcKICBwcm9wZXJ0eSBhbmQg
ZW5mb3JjZSB0aGUgcmlnaHQgIyBvZiBjZWxscyBjZWxscyAobWF5IGJlIGFkZGVkIGxhdGVyCiAg
YXMgYW55d2F5IGZvciBub3cgd2Ugb25seSBoYXZlIHNpbmdsZSBjb25zdW1lciBjYXNlcykuCgpJ
cyB0aGlzIHdoYXQgeW91IG1lYW50PwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
