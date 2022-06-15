Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058AECCA47F
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zW0+S6IxRSgVpDHX+Wu1ZNnktvu2C7BfsaUBoxpZkZ8=; b=JFdcAHvUMWG/0T
	ZDVZsTW8cOuib/fMYliLE6/OYzvnDN+xfDikNl7hXy+BAiUFfU73JFNKG2kVMDdaFp310CkqdKYsU
	8TAdFmPu/LE6xR8Nrw5Q/zXCmM488Iy7ArdWut1MCRbRhs97N8CP1eHon+rBNq6W/14iVFcExR26s
	F/BmSZAkdFP1rX0Jt1jMMkb1iSG1SXzelbRk3cohAU0aqX/qYdzTBraOVexgGewMAAYn7nKtxiUSy
	bO1iH6QGIfIjBP+RjnY4eJSXVg4YRv/1IGjRHmhcQ8ail09zVC9tCZabHUq8eNpKNkZGZHzwMqFlZ
	6AOioHJc5L7V+uAj/vhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Wpo-00FhPP-6h; Wed, 15 Jun 2022 17:29:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Wpi-00FhJj-GY
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 17:29:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id e5so6706766wma.0
        for <linux-mtd@lists.infradead.org>; Wed, 15 Jun 2022 10:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0mmtAiGES9hy6GbZr6mj1I/9d7FHTjal/1dcnEoMib4=;
        b=d/ZM+qkibzc1FPpQIVKOPEDkTrF02xlafmgh2XMchXaJDbGefaV7FPRiq9MMt1jujY
         6nuFUGuuXLbLBgp76pCx/O2r4cIN+CtcNgwKZwpVdzekFdRFqDd7O32A7p8UVj/A62n2
         Xs6cMKvcbN5gyfoMnqEqagWnM3EnMXZvedk5xE7YpROhUtP/QqXRbL8czsAjvcFJvXuX
         QANMtQIxUbMg9ZIuPF5DMRMVZ1WQzcr+DX0meZ2TE8KHPIMPWE1d0RQxcFL/aheiGAh7
         jGGq9WheLGjRcC8FMRMWntkV4+X+jwEX9ITHj/a+kk694HVt/sU0fLCfSXmpuPfrVLhf
         7FLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0mmtAiGES9hy6GbZr6mj1I/9d7FHTjal/1dcnEoMib4=;
        b=l3fClkIvNgRtnytcD/ma5LkeaRtWo94UyOUacSh1Q5dxHdoQVCGNgsYgwDAHaTRfwp
         BLP0E0tuE6zQ3keS0QcCkyDtyLQNawxtFWrGYWWDcfUyf7FKd9PYHOF40fdRPO6skaqt
         5tjqPweSwGBZUuqkXt9fUyu9zl1ShOvmoll/RwgmSPzcpduXw/2BctX3EMySe5QPUmjk
         s38xexTZH0ehuH9jTK991476PJzqR2HnpdzAWhmnPi3cYI1pLI9YLXv+mTXHUWGNdE6t
         KrgHL6ZdKYMHIEgDx2M/7iHzaVO3S/mNOKRq5vcHi0+t/0pUIROhtJt588dTqyQHfD6Z
         MpSQ==
X-Gm-Message-State: AJIora+Smjx4Rq+P6K0vG3ahuoLXnMwXjhyeUOFq4Otk9mD/hNsBYPrW
	qHP9nIkkWR6yd1nFv5KSW8s=
X-Google-Smtp-Source: AGRyM1u6SrzeH7qCFw4qlFWwaZs3p9N6OsL/H2wxtO516NhvYU71hXSl0/p2IYSj34r7su/3P5K8qA==
X-Received: by 2002:a05:600c:4e51:b0:39c:4f18:4c29 with SMTP id e17-20020a05600c4e5100b0039c4f184c29mr537734wmq.101.1655314166756;
        Wed, 15 Jun 2022 10:29:26 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d6a41000000b00218468314d7sm15298550wrw.62.2022.06.15.10.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 10:29:26 -0700 (PDT)
Message-ID: <62aa16f6.1c69fb81.816fc.be7a@mx.google.com>
X-Google-Original-Message-ID: <YqoKTt3G5+hXj2ET@Ansuel-xps.>
Date: Wed, 15 Jun 2022 18:35:26 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] mtd: nand: raw: qcom_nandc: add support for
 unprotected spare data pages
References: <20220615000612.3119-1-ansuelsmth@gmail.com>
 <20220615000612.3119-3-ansuelsmth@gmail.com>
 <20220615172802.GB3606@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615172802.GB3606@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_102934_608057_7A329E27 
X-CRM114-Status: GOOD (  42.34  )
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

T24gV2VkLCBKdW4gMTUsIDIwMjIgYXQgMTA6NTg6MDJQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDE1LCAyMDIyIGF0IDAyOjA2OjExQU0gKzAyMDAs
IEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IElQUTgwNjQgbmFuZCBoYXZlIHNwZWNpYWwgcGFnZXMg
d2hlcmUgYSBkaWZmZXJlbnQgbGF5b3V0IHNjaGVtZSBpcyB1c2VkLgo+ID4gVGhlc2Ugc3BlY2lh
bCBwYWdlIGFyZSB1c2VkIGJ5IGJvb3QgcGFydGl0aW9uIGFuZCBvbiByZWFkaW5nIHRoZW0KPiA+
IGxvdHMgb2Ygd2FybmluZyBhcmUgcmVwb3J0ZWQgYWJvdXQgd3JvbmcgRUNDIGRhdGEgYW5kIGlm
IHdyaXR0ZW4gdG8KPiA+IHJlc3VsdHMgaW4gYnJva2VuIGRhdGEgYW5kIG5vdCBib290YWJsZSBk
ZXZpY2UuCj4gPiAKPiA+IFRoZSBsYXlvdXQgc2NoZW1lIHVzZWQgYnkgdGhlc2Ugc3BlY2lhbCBw
YWdlIGNvbnNpc3QgaW4gdXNpbmcgNTEyIGJ5dGVzCj4gPiBhcyB0aGUgY29kZXdvcmQgc2l6ZSAo
ZXZlbiBmb3IgdGhlIGxhc3QgY29kZXdvcmQpIHdoaWxlIHdyaXRpbmcgdG8gQ0ZHMAo+ID4gcmVn
aXN0ZXIuIFRoaXMgZm9yY2VzIHRoZSBOQU5EIGNvbnRyb2xsZXIgdG8gdW5wcm90ZWN0IHRoZSA0
IGJ5dGVzIG9mCj4gPiBzcGFyZSBkYXRhLgo+ID4gCj4gPiBTaW5jZSB0aGUga2VybmVsIGlzIHVu
YXdhcmUgb2YgdGhpcyBkaWZmZXJlbnQgbGF5b3V0IGZvciB0aGVzZSBzcGVjaWFsCj4gPiBwYWdl
LCBpdCBkb2VzIHRyeSB0byBwcm90ZWN0IHRoZSBzcGFyZSBkYXRhIHRvbyBkdXJpbmcgcmVhZC93
cml0ZSBhbmQKPiA+IHdhcm4gYWJvdXQgQ1JDIGVycm9ycy4KPiA+IAo+ID4gQWRkIHN1cHBvcnQg
Zm9yIHRoaXMgYnkgcGVybWl0dGluZyB0aGUgdXNlciB0byBkZWNsYXJlIHRoZXNlIHNwZWNpYWwK
PiA+IHBhZ2VzIGluIGR0cyBieSBkZWNsYXJpbmcgb2Zmc2V0IGFuZCBzaXplIG9mIHRoZSBwYXJ0
aXRpb24uIFRoZSBkcml2ZXIKPiA+IGludGVybmFsbHkgd2lsbCBjb252ZXJ0IHRoZXNlIHZhbHVl
IHRvIG5hbmQgcGFnZXMuCj4gPiAKPiA+IE9uIHVzZXIgcmVhZC93cml0ZSB0aGUgcGFnZSBpcyBj
aGVja2VkIGFuZCBpZiBpdCdzIGEgYm9vdCBwYWdlIHRoZQo+ID4gY29ycmVjdCBsYXlvdXQgaXMg
dXNlZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5zdWVsIFNtaXRoIDxhbnN1ZWxzbXRoQGdt
YWlsLmNvbT4KPiAKPiBKdXN0IGEgZmV3IG5pdHBpY2tzIGJlbG93LiBXaXRoIHRob3NlIGZpeGVk
LAo+IAo+IFJldmlld2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9y
Zz4KPiAKPiBUaGFua3MsCj4gTWFuaQo+CgpTdXJlISBUaGFua3MgYSBsb3QgZm9yIHRoZSB2YXJp
b3VzIHJldmlldy4gV2lsbCBzZW5kIHY4IHRoYXQgc2hvdWxkIGJlCnRoZSBmaW5hbCB2ZXJzaW9u
LgoKPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDIwMyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTk4IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25h
bmRjLmMKPiA+IGluZGV4IGYyOTkwZDcyMTczMy4uMGRiZmUzMjg4OGZmIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiAKPiBbLi4uXQo+IAo+ID4gK3N0YXRpYyBib29sIHFj
b21fbmFuZGNfaXNfYm9vdF9wYXJ0aXRpb24oc3RydWN0IHFjb21fbmFuZF9ob3N0ICpob3N0LCBp
bnQgcGFnZSkKPiA+ICt7Cj4gPiArCXN0cnVjdCBxY29tX25hbmRfYm9vdF9wYXJ0aXRpb24gKmJv
b3RfcGFydGl0aW9uOwo+ID4gKwl1MzIgc3RhcnQsIGVuZDsKPiA+ICsJaW50IGk7Cj4gPiArCj4g
PiArCS8qCj4gPiArCSAqIFNpbmNlIHRoZSBmcmVxdWVudCBhY2Nlc3Mgd2lsbCBiZSB0byB0aGUg
bm9uLWJvb3QgcGFydGl0aW9ucyBsaWtlIHJvb3RmcywKPiA+ICsJICogb3B0aW1pemUgdGhlIHBh
Z2UgY2hlY2sgYnk6Cj4gPiArCj4gCj4gTWlzc2luZyAiKiIKPiAKPiA+ICsJICogMS4gQ2hlY2tp
bmcgaWYgdGhlIHBhZ2UgbGllcyBhZnRlciB0aGUgbGFzdCBib290IHBhcnRpdGlvbi4KPiA+ICsJ
ICogMi4gQ2hlY2tpbmcgZnJvbSB0aGUgYm9vdCBwYXJ0aXRpb24gZW5kLgo+ID4gKwkgKi8KPiA+
ICsKPiA+ICsJLyogRmlyc3QgY2hlY2sgdGhlIGxhc3QgYm9vdCBwYXJ0aXRpb24gKi8KPiA+ICsJ
Ym9vdF9wYXJ0aXRpb24gPSAmaG9zdC0+Ym9vdF9wYXJ0aXRpb25zW2hvc3QtPm5yX2Jvb3RfcGFy
dGl0aW9ucyAtIDFdOwo+ID4gKwlzdGFydCA9IGJvb3RfcGFydGl0aW9uLT5wYWdlX29mZnNldDsK
PiA+ICsJZW5kID0gc3RhcnQgKyBib290X3BhcnRpdGlvbi0+cGFnZV9zaXplOwo+ID4gKwo+ID4g
KwkvKiBQYWdlIGlzIGFmdGVyIHRoZSBsYXN0IGJvb3QgcGFydGl0aW9uIGVuZC4gVGhpcyBpcyBO
T1QgYSBib290IHBhcnRpdGlvbiAqLwo+ID4gKwlpZiAocGFnZSA+IGVuZCkKPiA+ICsJCXJldHVy
biBmYWxzZTsKPiA+ICsKPiA+ICsJLyogQWN0dWFsbHkgY2hlY2sgaWYgaXQncyBhIGJvb3QgcGFy
dGl0aW9uICovCj4gPiArCWlmIChwYWdlIDwgZW5kICYmIHBhZ2UgPj0gc3RhcnQpCj4gPiArCQly
ZXR1cm4gdHJ1ZTsKPiA+ICsKPiA+ICsJLyogQ2hlY2sgdGhlIG90aGVyIGJvb3QgcGFydGl0aW9u
IHN0YXJ0aW5nIGZyb20gdGhlIHNlY29uZC1sYXN0IHBhcnRpdGlvbiAqLwo+IAo+IHMvYm9vdCBw
YXJ0aXRpb24vYm9vdCBwYXJ0aXRpb25zCj4gCj4gPiArCWZvciAoaSA9IGhvc3QtPm5yX2Jvb3Rf
cGFydGl0aW9ucyAtIDI7IGkgPj0gMDsgaS0tKSB7Cj4gPiArCQlib290X3BhcnRpdGlvbiA9ICZo
b3N0LT5ib290X3BhcnRpdGlvbnNbaV07Cj4gPiArCQlzdGFydCA9IGJvb3RfcGFydGl0aW9uLT5w
YWdlX29mZnNldDsKPiA+ICsJCWVuZCA9IHN0YXJ0ICsgYm9vdF9wYXJ0aXRpb24tPnBhZ2Vfc2l6
ZTsKPiA+ICsKPiA+ICsJCWlmIChwYWdlIDwgZW5kICYmIHBhZ2UgPj0gc3RhcnQpCj4gPiArCQkJ
cmV0dXJuIHRydWU7Cj4gPiArCX0KPiA+ICsKPiA+ICsJcmV0dXJuIGZhbHNlOwo+ID4gK30KPiA+
ICsKPiA+ICtzdGF0aWMgdm9pZAo+ID4gK3Fjb21fbmFuZGNfY29kZXdvcmRfZml4dXAoc3RydWN0
IHFjb21fbmFuZF9ob3N0ICpob3N0LCBpbnQgcGFnZSkKPiAKPiBBcyBsaWtlIG90aGVyIGZ1bmN0
aW9ucywgcGxlYXNlIGFsaWduIHRoZSBmdW5jdGlvbiBvbiB0aGUgc2FtZSBsaW5lCj4gCj4gPiAr
ewo+ID4gKwlib29sIGNvZGV3b3JkX2ZpeHVwID0gcWNvbV9uYW5kY19pc19ib290X3BhcnRpdGlv
bihob3N0LCBwYWdlKTsKPiA+ICsKPiA+ICsJLyogU2tpcCBjb25mIHdyaXRlIGlmIHdlIGFyZSBh
bHJlYWR5IGluIHRoZSBjb3JyZWN0IG1vZGUgKi8KPiA+ICsJaWYgKGNvZGV3b3JkX2ZpeHVwID09
IGhvc3QtPmNvZGV3b3JkX2ZpeHVwKQo+ID4gKwkJcmV0dXJuOwo+ID4gKwo+ID4gKwlob3N0LT5j
b2Rld29yZF9maXh1cCA9IGNvZGV3b3JkX2ZpeHVwOwo+ID4gKwo+ID4gKwlob3N0LT5jd19kYXRh
ID0gY29kZXdvcmRfZml4dXAgPyA1MTIgOiA1MTY7Cj4gPiArCWhvc3QtPnNwYXJlX2J5dGVzID0g
aG9zdC0+Y3dfc2l6ZSAtIGhvc3QtPmVjY19ieXRlc19odyAtCj4gPiArCQkJICAgIGhvc3QtPmJi
bV9zaXplIC0gaG9zdC0+Y3dfZGF0YTsKPiA+ICsKPiA+ICsJaG9zdC0+Y2ZnMCAmPSB+KFNQQVJF
X1NJWkVfQllURVNfTUFTSyB8IFVEX1NJWkVfQllURVNfTUFTSyk7Cj4gPiArCWhvc3QtPmNmZzAg
fD0gaG9zdC0+c3BhcmVfYnl0ZXMgPDwgU1BBUkVfU0laRV9CWVRFUyB8Cj4gPiArCQkgICAgICBo
b3N0LT5jd19kYXRhIDw8IFVEX1NJWkVfQllURVM7Cj4gPiArCj4gPiArCWhvc3QtPmVjY19iY2hf
Y2ZnICY9IH5FQ0NfTlVNX0RBVEFfQllURVNfTUFTSzsKPiA+ICsJaG9zdC0+ZWNjX2JjaF9jZmcg
fD0gaG9zdC0+Y3dfZGF0YSA8PCBFQ0NfTlVNX0RBVEFfQllURVM7Cj4gPiArCWhvc3QtPmVjY19i
dWZfY2ZnID0gKGhvc3QtPmN3X2RhdGEgLSAxKSA8PCBOVU1fU1RFUFM7Cj4gPiArfQo+IAo+IFsu
Li5dCj4gCj4gPiArc3RhdGljIGludCBxY29tX25hbmRfaG9zdF9wYXJzZV9ib290X3BhcnRpdGlv
bnMoc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYywKPiA+ICsJCQkJCQlzdHJ1Y3Qg
cWNvbV9uYW5kX2hvc3QgKmhvc3QsCj4gPiArCQkJCQkJc3RydWN0IGRldmljZV9ub2RlICpkbikK
PiA+ICt7Cj4gPiArCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSAmaG9zdC0+Y2hpcDsKPiA+ICsJ
c3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiA+ICsJc3RydWN0IHFj
b21fbmFuZF9ib290X3BhcnRpdGlvbiAqYm9vdF9wYXJ0aXRpb247Cj4gPiArCXN0cnVjdCBkZXZp
Y2UgKmRldiA9IG5hbmRjLT5kZXY7Cj4gPiArCWludCBwYXJ0aXRpb25zX2NvdW50LCBpLCBqLCBy
ZXQ7Cj4gPiArCj4gPiArCWlmICghb2ZfZmluZF9wcm9wZXJ0eShkbiwgInFjb20sYm9vdC1wYXJ0
aXRpb25zIiwgTlVMTCkpCj4gPiArCQlyZXR1cm4gMDsKPiA+ICsKPiA+ICsJcGFydGl0aW9uc19j
b3VudCA9IG9mX3Byb3BlcnR5X2NvdW50X3UzMl9lbGVtcyhkbiwgInFjb20sYm9vdC1wYXJ0aXRp
b25zIik7Cj4gPiArCWlmIChwYXJ0aXRpb25zX2NvdW50IDw9IDApIHsKPiA+ICsJCWRldl9lcnIo
ZGV2LCAiRXJyb3IgcGFyc2luZyBib290IHBhcnRpdGlvblxuIik7Cj4gPiArCQlpZiAocGFydGl0
aW9uc19jb3VudCA9PSAwKQo+ID4gKwkJCXJldHVybiAtRUlOVkFMOwo+ID4gKwkJZWxzZQo+ID4g
KwkJCXJldHVybiBwYXJ0aXRpb25zX2NvdW50Owo+IAo+IAkJcmV0dXJuIHBhcnRpdGlvbnNfY291
bnQgPyBwYXJ0aXRpb25zX2NvdW50IDogLUVJTlZBTDsKPiAKPiBUaGFua3MsCj4gTWFuaQo+IAo+
IC0tIAo+IOCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7g
r40KCi0tIAoJQW5zdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
