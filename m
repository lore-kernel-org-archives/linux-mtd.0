Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BB3C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 13:09:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E80E52184C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 13:09:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pEvbpaPF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E80E52184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28soOl8Mog9XuHl/qVHB3BWMcwMlKxipOcC0QQup4H8=; b=pEvbpaPFkq6G3G
	YAoYasYS6jWHVZ0sH5tcPT3z2t55jdYl4qkma3xx5+slZLwL2rWzLREISEstH0s4+45iLlCWyAB10
	w8uMooJsJAJcJmMOsVbo+MaTr0GN+QxMs6rnCsU9cA+/sL8AnXKVKqWuZe+SOzzIfd9HTgDm0DJVP
	Y1WwCj5JZ23+iFpTf0aq9KndDzEBzmTBx20rRfv2uIl+DdrLUWVK4IgcAGS+8plUC73K8rwjJ8Hai
	/dZcDOh01tt5cA9AqfEWXzcZATMlov7gOGjB4HmaIK9LB+ZC1/YbkBiY8aCdWkvmLXb/XPDiojSBa
	+G52CCMD1y2499+olxeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h43do-0002gd-M5; Wed, 13 Mar 2019 13:09:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h43dl-0002fq-OT
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 13:09:51 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 540FB28018B;
 Wed, 13 Mar 2019 13:09:46 +0000 (GMT)
Date: Wed, 13 Mar 2019 14:09:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible
 strings for JZ4740 and JZ4725B
Message-ID: <20190313140943.01afcbdc@collabora.com>
In-Reply-To: <1552481734.2412.1@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190304104554.09be4cd4@xps13> <1551723742.4932.2@crapouillou.net>
 <20190304195149.7cca9c64@xps13> <1552481734.2412.1@crapouillou.net>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_060949_931506_56E2FFF0 
X-CRM114-Status: GOOD (  17.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxMyBNYXIgMjAxOSAwOTo1NTozNCAtMDMwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+IEhpLAo+IAo+IExlIGx1bi4gNCBtYXJzIDIwMTkgw6Ag
MTU6NTEsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IAo+IGEgw6lj
cml0IDoKPiA+IEhpIFBhdWwsCj4gPiAgIAo+ID4+ICA+PiAgLS0tICAgCj4gPj4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2luZ2VuaWMsano0NzgwLW5hbmQudHh0ICAK
PiA+PiAgPj4gICsrKyAgIAo+ID4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9pbmdlbmljLGp6NDc4MC1uYW5kLnR4dCAgCj4gPj4gID4+ICBAQCAtNiw3ICs2LDEwIEBA
IG1lbW9yeS1jb250cm9sbGVycy9pbmdlbmljLGp6NDc4MC1uZW1jLnR4dCksICAgCj4gPj4gYW5k
ID4+IHRodXMgTkFORCBkZXZpY2Ugbm9kZXMgbXVzdCAgCj4gPj4gID4+ICAgYmUgY2hpbGRyZW4g
b2YgdGhlIE5FTUMgbm9kZS4gIAo+ID4+ICA+PiA+PiAgIFJlcXVpcmVkIE5BTkQgY29udHJvbGxl
ciBkZXZpY2UgcHJvcGVydGllczogIAo+ID4+ICA+PiAgLS0gY29tcGF0aWJsZTogU2hvdWxkIGJl
IHNldCB0byAiaW5nZW5pYyxqejQ3ODAtbmFuZCIuCj4gPj4gID4+ICArLSBjb21wYXRpYmxlOiBT
aG91bGQgYmUgb25lIG9mOgo+ID4+ICA+PiAgKyAgKiBpbmdlbmljLGp6NDc0MC1uYW5kCj4gPj4g
ID4+ICArICAqIGluZ2VuaWMsano0NzI1Yi1uYW5kCj4gPj4gID4+ICArICAqIGluZ2VuaWMsano0
NzgwLW5hbmQgIAo+ID4+ICA+Cj4gPj4gID4gV291bGRuJ3QgIi1uYW5kLWNvbnRyb2xsZXIiIHN1
ZmZpeCBiZSBiZXR0ZXI/IE9mIGNvdXJzZSBpbiB0aGUgICAKPiA+PiBkcml2ZXIgIAo+ID4+ICA+
IHlvdSBzaG91bGQgc3RpbGwgY2hlY2sgZm9yIGp6NDc4MC1uYW5kLiAgCj4gPj4gCj4gPj4gIFNv
IEkgd291bGQgYmUgY29tcGF0aWJsZSB3aXRoOgo+ID4+ICAqIGluZ2VuaWMsano0NzQwLW5hbmQt
Y29udHJvbGxlcgo+ID4+ICAqIGluZ2VuaWMsano0NzI1Yi1uYW5kLWNvbnRyb2xsZXIKPiA+PiAg
KiBpbmdlbmljLGp6NDc4MC1uYW5kCj4gPj4gID8gIAo+ID4gCj4gPiBGcm9tIGEgZHJpdmVyIFBP
ViBJIHdvdWxkIGV2ZW4gcHJlZmVyIGluZ2VuaWMsano0NzgwLW5hbmQtY29udHJvbGxlci4gCj4g
PiBJCj4gPiBkb24ndCBrbm93IHdoYXQncyBiZXN0IGhlcmUuIE1heWJlIEJvcmlzIG9yIFJvYiBj
YW4gaGVscD8KCkxldCdzIGtlZXAgaXQgY29uc2lzdGVudCBhbmQgaGF2ZSBhbGwgY29tcGF0aWJs
ZXMgZm9sbG93IHRoZSBvbGQKbmFtaW5nIHNjaGVtZSAoaW5nZW5pYyw8c29jPi1uYW5kKS4gQnV0
IHllcywgZm9yIG5ldyBkcml2ZXJzLCBJIGFncmVlCnRoYXQgLW5hbmQtY29udHJvbGxlciBpcyBi
ZXR0ZXIgdGhhbiBqdXN0IC1uYW5kLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
