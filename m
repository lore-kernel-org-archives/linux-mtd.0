Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C374BC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 09:41:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72615206A1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 09:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CqEgN7kB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SAnji7g1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72615206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZBSiKkOOnAfY0KxB5GjWWIRe30Rh0o8NKL6oJOM2f9A=; b=CqEgN7kBwmsJJhB4ZLjswW85T
	T+ssS9Cg1FueMrV1La48kE1guADG0X2xn/ZmAvANqlsONkDgZCoNN7ZG0SepTLz/vNn3+OUQKU/Nn
	XDXxgGguFVFdAe4rgYZqP/IPfgRTYA3bkFK77MUWEsjUEFS/DhqEtIUIjAI0Tyvuao+6o3JR9rnSA
	+xaoCbpF1UQab9jUWRallRjJQaE5vM/hXUX3gm2LmNKq5FuE+3pxMspwfhGd46TNoK+S7PJZGubII
	goGPxlq6s9B2U2TcY7r+LJd0jBkUD8bO4sc4bGBna0npgic/BpUsBBN5gi2vOyVqBQd8wOWe2CaeX
	IU639Q5mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqCkK-0007sg-5G; Tue, 30 Jun 2020 09:40:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqCkI-0007rW-BE
 for linux-mtd@merlin.infradead.org; Tue, 30 Jun 2020 09:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=qf8ya7/PLXXnFVysukLe+QCdGHAMuhR3pbXzMbQzMJs=; b=SAnji7g1HcQAH/Z8/Z8myAXWTB
 ssjFCKERZHQmPKLb7fg0VBxqBeU/un+wkrWYPWAdJHXUcl0GIqILd3FmYTSY3rGDs5czAnH4FDV4w
 InvKMJ0bWgjxqZptsujhBFgFkKUOvUbIAtucg8YpolvR4g3EzC9OjAwYM+ENYwpnV0i5J8q/dTEGI
 IRhz0Hf2EEIy69AVhu1Ik8d7TdN0Rqzb73nKPGQSEB2lMB4MtDP2Q5BITPhNmRtpZ9kphPcive/0n
 JKafVnJsEuqvNXgc10RHIcaSgVojAejp+VoN1nMDcGK6LMmwUftuKopQ+Q3qYTazmYNWootYpaMHu
 mwyTxBiQ==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqCkE-0004I8-FB
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 09:40:05 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EB070607400F;
 Tue, 30 Jun 2020 11:39:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qd6xqziz9yTM; Tue, 30 Jun 2020 11:39:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 786BA6074029;
 Tue, 30 Jun 2020 11:39:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UNVw8191GTR5; Tue, 30 Jun 2020 11:39:37 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 423E0607400F;
 Tue, 30 Jun 2020 11:39:37 +0200 (CEST)
Date: Tue, 30 Jun 2020 11:39:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <1839269888.74591.1593509977137.JavaMail.zimbra@nod.at>
In-Reply-To: <e30abadc-83c0-f010-be36-fe8d14c4aea9@st.com>
References: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
 <1591975362-22009-5-git-send-email-christophe.kerello@st.com>
 <CAFLxGvzfh1Qa_gM9bZAxaoCbO6xCoNdaPN=Ea20Up_zPVgjugw@mail.gmail.com>
 <e30abadc-83c0-f010-be36-fe8d14c4aea9@st.com>
Subject: Re: [PATCH v5 4/6] memory: stm32-fmc2-ebi: add STM32 FMC2 EBI
 controller driver
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: memory: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
Thread-Index: IyChESkmAt61iUEj3iffmldxiXkByg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_104002_806513_364D81D0 
X-CRM114-Status: GOOD (  11.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree <devicetree@vger.kernel.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, arnd@linaro.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNocmlzdG9waGUgS2VyZWxs
byIgPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4gQW46ICJSaWNoYXJkIFdlaW5iZXJnZXIi
IDxyaWNoYXJkLndlaW5iZXJnZXJAZ21haWwuY29tPgo+IENDOiAiTWlxdWVsIFJheW5hbCIgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIlZp
Z25lc2ggUmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+ICJSb2IgSGVycmluZyIgPHJv
YmgrZHRAa2VybmVsLm9yZz4sICJNYXJrIFJ1dGxhbmQiIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4s
IGFybmRAbGluYXJvLm9yZywgIkFsZXhhbmRyZSBUb3JndWUiCj4gPGFsZXhhbmRyZS50b3JndWVA
c3QuY29tPiwgIk1hcmVrIFZhc3V0IiA8bWFyZXhAZGVueC5kZT4sICJkZXZpY2V0cmVlIiA8ZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+LCAibGludXgta2VybmVsIgo+IDxsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnPiwgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IEdlc2VuZGV0
OiBEaWVuc3RhZywgMzAuIEp1bmkgMjAyMCAxMTozNTozOAo+IEJldHJlZmY6IFJlOiBbUEFUQ0gg
djUgNC82XSBtZW1vcnk6IHN0bTMyLWZtYzItZWJpOiBhZGQgU1RNMzIgRk1DMiBFQkkgY29udHJv
bGxlciBkcml2ZXIKCj4gSGkgUmljaGFyZCwKPiAKPiBPbiA2LzMwLzIwIDExOjEzIEFNLCBSaWNo
YXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+IE9uIEZyaSwgSnVuIDEyLCAyMDIwIGF0IDU6MjQgUE0g
Q2hyaXN0b3BoZSBLZXJlbGxvCj4+IDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPiB3cm90ZToK
Pj4+Cj4+PiBUaGUgZHJpdmVyIGFkZHMgdGhlIHN1cHBvcnQgZm9yIHRoZSBTVE1pY3JvZWxlY3Ry
b25pY3MgRk1DMiBFQkkgY29udHJvbGxlcgo+Pj4gZm91bmQgb24gU1RNMzJNUCBTT0NzLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxv
QHN0LmNvbT4KPj4+IC0tLQo+Pj4gKyAgICAgICBpZiAoIUlTX0VSUihyc3RjKSkgewo+Pj4gKyAg
ICAgICAgICAgICAgIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KHJzdGMpOwo+Pj4gKyAgICAgICAgICAg
ICAgIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0Yyk7Cj4+IAo+PiBTaG91bGRuJ3QgdGhlcmUg
YmUgYSBzbWFsbCBkZWxheSBiZXR3ZWVuIGFzc2VydCBhbmQgZGVhc3NlcnQ/Cj4+IE90aGVyIHRo
YW4gdGhhdCB0aGUgY29kZSBsb29rcyBnb29kIHRvIG1lLgo+PiAKPiAKPiBFdmVuIGlmIEkgaGF2
ZSBjdXJyZW50bHkgbm90IG1ldCBhbnkgaXNzdWUsIEkgd2lsbCBhZGQgYSB1ZGVsYXkoMikgdG8g
YmUKPiBzYWZlLiBJdCB3aWxsIGJlIHBhcnQgb2YgdjYuCgpXZWxsLCBpZiBpdCB3b3JrcyBhbmQg
eW91IGFyZSBzdXJlLCBwbGVhc2UgZ28gZm9yIGl0LiBMaWtlIEkgc2FpZCwgSSdtIG5vIGV4cGVy
dCBpbgp0aGlzLgpJIGp1c3Qgbm90aWNlZCB0aGF0IG90aGVyIHVzZXJzIGFkZCBhIGRlbGF5IGFu
ZCB3b25kZXJlZC4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
