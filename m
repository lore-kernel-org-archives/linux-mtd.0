Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2570AC54E60
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAa24KwfAhS8cLPplRaC4D+lmgfxiTtP8F7Rn8ZGoro=; b=oQXKCbxHFcdWuu
	6xoNQ6vaNFYXMPQ0ocQNSofMKbeaE5zjcb1DFDtLBaV/e0BQlfuIxWzcrqeQnITpRnabFy/lZqZiu
	9cCSsfljvFyqm9NaPSaI3NQ3UrNa2hYjd9bisfECHYjVDIQhiRyHyZhWkfAEQUtlOAb4voAZtugsE
	cgy1XElsazdEE4lwbTJWVkAxJqsXisWvrdrByETc+jpxilPaxw3MSiSURq12mbbwG0RmoWLFG85M0
	qKK7ArcJP4J+WUH9fCM50IkaIAteIcFmV/f9lSiF4yCzNgsTqiCmxP87Zjtlf8vUJxJKFkGkoWPWy
	RcBO+Us2wQn4QDQOfNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmW9r-0000000CB7N-261Z;
	Tue, 19 Mar 2024 09:53:23 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmW9m-0000000CB52-1s4t;
	Tue, 19 Mar 2024 09:53:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3CB1FF80D;
	Tue, 19 Mar 2024 09:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710841993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EBDDiNG/eNmY+ueIncptOoRVdMb4em3Z5Wr8wvDjWc=;
	b=LyzUosUWbZmhrAA4qvwA0ojyg9rDBL6yH+R73/Cl/AGOQYhPpeDYpbVg1jJWu+O1/a6MiY
	GBtEWVlXLRdBYAfeMbmpOHGLpgAKW+VDmM+X3OTurys03prNWASCLdD7QloxLQT5lWKEcK
	Jwor7i4jxb3XKQjqvKriBWQQpRtMnJVJicefmt3ecDm2AlHMHsSaMVfI95oAdTr03N/yRg
	+qp5UgKZGXIpdlewjym3wvEOhprR6T9pCv9wPgYXSxkC5i1o17+vt8Cbj0CF15sCTGTSpK
	SRTtIkMjzAFEMh75v0eGJSLFpvSufCkkMYqFgr3oJdm08AfYkBdvYQMPZiXCvw==
Date: Tue, 19 Mar 2024 10:53:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Manojkiran Eda <manojkiran.eda@gmail.com>,
 patrick.rudolph@9elements.com, chiawei_wang@aspeedtech.com,
 ryan_chen@aspeedtech.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 joel@jms.id.au, andrew@codeconstruct.com.au, richard@nod.at,
 vigneshr@ti.com, jk@codeconstruct.com.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/4] mtd: Replace module_init with subsys_initcall
Message-ID: <20240319105309.7cdfe106@xps-13>
In-Reply-To: <4e3fbff7-6edc-4196-bc72-1095f14d0dfa@linaro.org>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
	<20240319093405.39833-3-manojkiran.eda@gmail.com>
	<4e3fbff7-6edc-4196-bc72-1095f14d0dfa@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_025318_784574_12D649A9 
X-CRM114-Status: UNSURE (   9.14  )
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

SGksCgprcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmcgd3JvdGUgb24gVHVlLCAxOSBNYXIg
MjAyNCAxMDo1MTowMCArMDEwMDoKCj4gT24gMTkvMDMvMjAyNCAxMDozNCwgTWFub2praXJhbiBF
ZGEgd3JvdGU6Cj4gPiBXaGlsZSBlbmdhZ2VkIGluIGRldmVsb3BtZW50IG9uIHRoZSBlc3BpIGtl
cm5lbCBkZXZpY2UgZHJpdmVyWzFdLAo+ID4gSSBub3RpY2VkIHRoYXQgdGhlIGVzcGkgZmxhc2gg
ZHJpdmVyLCB1dGlsaXppbmcgdGhlIG10ZCBzdWJzeXN0ZW0sCj4gPiBhcHBlYXJzIHRvIGluaXRp
YWxpemUgYmVmb3JlIHRoZSBtdGRjb3JlIHN1YnN5c3RlbSByZWdpc3RlcnMgdGhlICAKPiAKPiBO
QUsKPiAKPiBZb3UgaW5jb3JyZWN0bHkgb3JkZXJlZCB5b3VyIGNhbGwsIHNvIG5vdyB0byBmaXgg
dGhpcyB5b3UgaW5jb3JyZWN0bHkKPiByZS1vcmRlciByZXN0IG9mIGtlcm5lbC4gTm8uIEZpeCB5
b3VyIGNvZGUgdG8gaGFuZGxlIG1vZHVsZXMsIHByb2JlCj4gZGVmZXJyYWxzIGFuZCBkZXZpY2Ug
bGlua3MuCgpBZ3JlZWQuIFlvdSBzaGFsbCBub3QgbmVlZCB0aGlzLiBNYXliZSBqdXN0IG1vdmlu
ZyB0aGUgZHJpdmVyIHRvIHRoZQpyaWdodCBsb2NhdGlvbiAoc3BpKSBtaWdodCBmaXggaXQuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
