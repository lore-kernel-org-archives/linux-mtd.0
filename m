Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B271CA0FE1
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Aug 2025 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7zVrtA3yIuPgyJXuj4e3vb3JSnnHROkW+l7Nh7PS5I=; b=piuOuZ8tQPRFXv
	Zw4A8i6WDVaYSNR5RapYaWkm6DEda6UrOw+NL/ZdUWWxd35XMIICuwmOvkNefDjKo26Rd8c5s6KMZ
	7N8O2KbRfh81iq1GLeyi3dax/QP4VsihC5ibn03j3pdi0mxkikN/CCoyTp4fBvjy9VKdErpleouKp
	QCGoHZb9QPM7p8Hw8K87Bwqmw9bAvrnNT4nyx6V+kOonB4ANKrziyC0PZqCuQefSgs7A7KNsTIj1D
	h8CO/Lt2C0EDk13EmIhtenFd02gat58D5DK7KgbBUn+95Sb15+GZkw7JzdBU9ysF2yU99F1/8ntEM
	FCDBK3Vd8WsW0uyuSObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSK3-00000007Gbx-2Ax3;
	Mon, 25 Aug 2025 08:12:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRbB-00000007ADF-3kLR
	for linux-mtd@lists.infradead.org;
	Mon, 25 Aug 2025 07:26:39 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-61c68525abbso1323447a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 25 Aug 2025 00:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756106796; x=1756711596; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0rXI81DHDPeimgUQGGujUCeB3VepV9XFgBCotb060w=;
        b=VWPrebPiq0VynnJ/bY2Pb3ihHfT/IVMtwTrtq+ruL4s0Z/gpdLnNodJlDT6wI1OPcA
         kkXIiZJMVKyxqT46DgTBFWrIjOk4ryKt0wzK79kXjX1qNCJd5ZxthqsNr2nZqT5bfW5l
         609rbdT9iXoSwv3UzQ0ulHuy14Rpl0NDGWGX3CpBTcaD8a0wSVWHk1WI/+6n6KG4Xtyj
         rCulqY0jFhFJsabqLO1wV4TPWb5ffLDh364Ih2/w4vi6AnNQRLRvIMc8IimPxks/gkbY
         ND2tTR5AtkqkowzPA9SKAS0GOae5Jc/w5wizfqn0dCuCAaA0sw4G43OGZ1L/c3IQvIuL
         RS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756106796; x=1756711596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0rXI81DHDPeimgUQGGujUCeB3VepV9XFgBCotb060w=;
        b=t5iu8PzaYOaN8gIhWucniQlHgSWv3KtJ/BUmV/XXamR795NZrjCmiQctPJv202yQUA
         aivBlKda9hnMRtEhv3TDS+rgZOuwYl7HpXEMqUjOdng8AsckZdovFM+OzKh8EKZEX33Y
         XCt4VyKqRvZ+h0n1451Ygx4yk4hacR/Om/WIwoI1dEBM/GfJn2LeqHSxwcO8LLoJVkHT
         vXSRu0ctrlFAGD/tWs+FhtLnh0NrqsGA7P/pO3mtVx9zhJoNH7qGUHaKh/mQLoaPmvEk
         Sd5eY4495Jeo740jcyEROZINbTr0DLk0tRy58TdheF4Oajvmh0YDEPrX6A0AV5XocOH6
         nXug==
X-Forwarded-Encrypted: i=1; AJvYcCUO/hbosnHM7epnS5w5/uuW9TZTEgPLk3jR/Nkm8+0R0d2vFGRo0OYr5KLgbR+TP1XXJxn5yzP7Z6Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhw8ZjtWD3MKT1jDe7WFK/pqsPVrMDY3WACGPltTnVYA+NcLq+
	+OXE7QFD5etS56jRq3ppJWA3BDhSUf0kaVA1AQ1n38sLmYPsVhY9ZIyf8CW6hmTDQ2KXkqiHK7V
	Zj2R164KaMR0cY52gyMEgYgG6mKHwovE=
X-Gm-Gg: ASbGncsoXzLp7Z4qOKsewU5O36aJpLFCx7lgYer06zglKnvd4N5Q1oQ/MdM/z4heH8Y
	ukZESTJVk6wEtb38GC/WKjpl9/waOYTCo3PMRWoZznK2aBRjWdLeKSihxjMl08uhUYex2YXE3Dv
	oW41gaQqJ7p9Y9btH9jBRJLxz6h1HGXPInbot3haRF44+FEhc/2ILhZKsVAQLYwnHlrxxbI7OWn
	LvXOrnU7y24O3T08s0+
X-Google-Smtp-Source: AGHT+IEMMavT5lPcHDOmWN6D73yFcbhZ6LlVvdyIDZoFcQ0UkTHvd0fdnieclEyOSRj7wdZZ1vHKCxOSg4bVNUh2lp8=
X-Received: by 2002:a05:6402:40c9:b0:61c:73f2:4b3a with SMTP id
 4fb4d7f45d1cf-61c73f24d9amr999037a12.30.1756106796261; Mon, 25 Aug 2025
 00:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755757841.git.zhoubinbin@loongson.cn> <f01986dcb9f16450bd7f38c8fd663df686e6d145.1755757841.git.zhoubinbin@loongson.cn>
 <875xeclodp.fsf@bootlin.com>
In-Reply-To: <875xeclodp.fsf@bootlin.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 25 Aug 2025 15:26:24 +0800
X-Gm-Features: Ac12FXyNgFXyJt4UvVNk5DenquiAD_QBeEewphZzs_VIgu82Xp2pbDEb2NAVMxo
Message-ID: <CAMpQs4JcuCVk6BxB66DrneUv6iw8rzYyLnZX6vrQYp41n+=-vw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] mtd: rawnand: loongson: Add Loongson-2K1000 NAND
 controller support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_002637_935786_A4E916D0 
X-CRM114-Status: GOOD (  22.17  )
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

SGkgTWlxdWVsOgoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKT24gU3VuLCBBdWcgMjQsIDIwMjUg
YXQgMTE6NDDigK9QTSBNaXF1ZWwgUmF5bmFsCjxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cm90ZToKPgo+IE9uIDIxLzA4LzIwMjUgYXQgMTQ6Mzk6MjEgKzA4LCBCaW5iaW4gWmhvdSA8emhv
dWJpbmJpbkBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4KPiA+IFRoZSBMb29uZ3Nvbi0ySzEwMDAgTkFO
RCBjb250cm9sbGVyIGlzIGFsc28gc2ltaWxhciB0byB0aGUgTG9vbmdzb24tMUMuCj4gPgo+ID4g
SXQgc3VwcG9ydHMgYSBtYXhpbXVtIGNhcGFjaXR5IG9mIDE2R0IgRkxBU0ggcGVyIGNoaXAgd2l0
aCBhIG1heGltdW0KPiA+IHBhZ2Ugc2l6ZSBvZiA4S0IsIGFuZCBpdCBzdXBwb3J0cyB1cCB0byA0
IGNoaXAgc2VsZWN0cyBhbmQgNCBSRFkKPiA+IHNpZ25hbHMuCj4gPgo+ID4gVGhlIGtleSBkaWZm
ZXJlbmNlIGZyb20gdGhlIExvb25nc29uLTJLMDUwMCBpcyB0aGF0IGl0IHJlcXVpcmVzIGV4cGxp
Y2l0Cj4gPiBjb25maWd1cmF0aW9uIG9mIHRoZSBETUEgY29udHJvbCByb3V0ZS4gVHlwaWNhbGx5
LCBpdCBpcyBjb25maWd1cmVkIGFzCj4gPiBBUEJETUEwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEJpbmJpbiBaaG91IDx6aG91YmluYmluQGxvb25nc29uLmNuPgo+ID4gLS0tCj4gPiAgLi4uL210
ZC9uYW5kL3Jhdy9sb29uZ3Nvbi1uYW5kLWNvbnRyb2xsZXIuYyAgIHwgNDggKysrKysrKysrKysr
KysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29uLW5hbmQtY29udHJvbGxlci5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmMKPiA+IGlu
ZGV4IDdiMzMxZDBjYTJmMC4uNjYxMGMyMzlmNzIxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmMKPiA+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2xvb25nc29uLW5hbmQtY29udHJvbGxlci5jCj4gPiBAQCAtNzMsOSArNzMs
MTggQEAKPiA+ICAjZGVmaW5lIExPT05HU09OX05BTkRfUkVBRF9JRF9USU1FT1VUX1VTICAgICA1
MDAwCj4gPgo+ID4gICNkZWZpbmUgTE9PTkdTT05fTkFORF82NEJJVF9ETUEgICAgICAgICAgICAg
IEJJVCgwKQo+ID4gKyNkZWZpbmUgTE9PTkdTT05fTkFORF9ETUFfQ09ORklHICAgICBCSVQoMSkK
Pgo+IFlvdSdyZSByZXVzaW5nIHRoaXMgZmxhZ3MgbWVtYmVyLCBzbyBpdCdzIGZpbmUsIHBsZWFz
ZSBpZ25vcmUgdGhlCj4gcHJldmlvdXMgY29tbWVudCAoZXhjZXB0IHRoZSBzdHlsZSBpc3N1ZSku
Cj4KPiAuLi4KPgo+ID4gKyAgICAgcmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJj
ZShwZGV2LCAyKTsKPgo+IFdvdWxkIGl0IGJlIGNsZWFyZXIgdG8gZ2V0IHRoZSByZXNvdXJjZSBi
eSBuYW1lPyAobm90IGEgc3Ryb25nIHJlcXVlc3QpCgpJdCB3aWxsIGJlIHJlcGxhY2VkIGJ5Cgpk
ZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsICJkbWEtY29uZmlnIik7
Cgo+Cj4gVGhhbmtzCj4gTWlxdcOobAoKCi0tIApUaGFua3MuCkJpbmJpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
