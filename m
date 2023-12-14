Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3CAC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 21:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6cCftfnEOau51GRVg+e5wEjgK0xGfpj2N3XXw+c7I4=; b=cqhE18ffHEv0Kl
	tHMkg7krnpZ3H3MCrzk0gRZTA2mROA9vAro1LFoiY4ysWjVOF4xoaPz3O2D/Z0TyWsnetot7v5GW4
	M+aX4r4O+HOJeVxCn8VM57JitB6XXLEdipCtbL3pp+YLNGs4lFKYGu706kUepDbp55+0jgROcSZ2g
	EZziJoQqDzlefZupPneQ0obj8vQmhlm67zhk/8msdJlISCk1MzmdWT9lbrv2PDlisT7fMIKRty+n+
	pdWtD+EqlvEwF8JNEWqaiKL+psHGy3NOatq91D7sLZ34xRSMK7vpIfVMnhhoeZGOQ6llaJIXQadeM
	Wj0cm+ZCy0Mn16X40+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDtEu-001LX9-04;
	Thu, 14 Dec 2023 21:27:28 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDtEr-001LVp-1c
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 21:27:26 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a22fb5f71d9so217892666b.0
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 13:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702589244; x=1703194044; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQLR3TCzDnjOcoUY0UAy1UbsLgGNkBs2xj+zMAJuyhY=;
        b=hFVTuvXPp0s6ZOkfqTw09O1HgxI9yz1A8bIFhsNNEIP9p0EHgl+nhhmnQmz/DYpWT6
         ayYBqKhI2cw3/gGjYVw+x7kVtlknvJCyjaGD1oqaLLE9hXlSJ5fgpt+4IsJWyH8mhIHV
         tcZxKn/y2jserkSvv2tBDVLJrzYoIMePomW0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702589244; x=1703194044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQLR3TCzDnjOcoUY0UAy1UbsLgGNkBs2xj+zMAJuyhY=;
        b=oGImQrFRkiqNpAKWlONSZXpZVI5SkEooy8zN+ED6+BFuCed3KI2UDd3f40O4MDKCzF
         mnqVfvDnZ4V8nRoHiLmo6Bbx5JV//Oz8mGkCOMqQKOChv3F2gKyiR0g22keEZjhGfE1T
         lWHeKd40MhijB1MSy448n0kcGi9rhciDDH5gswLGphEm1JrQZsxIqYuiZZCAYxLTNgou
         FBwiVr8SyonCZ9BfS/o5P3+vcAfRe2e0otv63X+ReHHqWeW+55j8G6+tcDCIcJZRk9YM
         y4Gvf2mcdzRuVFbTa34Fs/Tt8G/bPtYsCNS3pUhzpf1vNruz0HX8UFCubKKmlna1ak0Z
         9NSg==
X-Gm-Message-State: AOJu0YwT1OefBk3ht7uYSoeAebQI/DNNQIcuj3vIu6xPNoB4P/ioXGus
	OeMrxtguupE9YlW8/fyBWjOlLPYj7bM7U7Obt3FRig==
X-Google-Smtp-Source: AGHT+IE7OYOAzIzBqNAvCTayftZvK3DtzN2NEMkheGR79bvEI3MFe4Unl3+AfpaA2BHcjVdb51pzpP/lBxzBQ/Ebrqw=
X-Received: by 2002:a17:906:782:b0:a1d:2f59:81a4 with SMTP id
 l2-20020a170906078200b00a1d2f5981a4mr10882943ejc.62.1702589243759; Thu, 14
 Dec 2023 13:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20231214153620.23998-1-zajec5@gmail.com>
In-Reply-To: <20231214153620.23998-1-zajec5@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 14 Dec 2023 14:27:12 -0700
Message-ID: <CAPnjgZ31AAauR876W1RmU4JPzKUD8XAMCZrJDumE+Dr4miqABQ@mail.gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: nvmem: u-boot, env: add any-name MAC
 cells compatible
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, u-boot@lists.denx.de, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_132725_580912_B6547CAB 
X-CRM114-Status: GOOD (  10.78  )
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

SGkgUmFmYcWCLAoKT24gVGh1LCAxNCBEZWMgMjAyMyBhdCAwODozNiwgUmFmYcWCIE1pxYJlY2tp
IDx6YWplYzVAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFm
YWxAbWlsZWNraS5wbD4KPgo+IFNvIGZhciB3ZSBoYWQgYSBwcm9wZXJ0eSBmb3IgImV0aGFkZHIi
IE5WTUVNIGNlbGwgY29udGFpbmluZyBiYXNlCj4gRXRoZXJuZXQgTUFDIGFkZHJlc3MuIFRoZSBw
cm9ibGVtIGlzIHZlbmRvcnMgb2Z0ZW4gcGljayBub24tc3RhbmRhcmQKPiBuYW1lcyBmb3Igc3Rv
cmluZyBNQUMocykgKG90aGVyIHRoYW4gImV0aGFkZHIiKS4gQSBmZXcgbmFtZXMgd2VyZQo+IG5v
dGljZWQgb3ZlciB5ZWFyczoKPiAxLiAid2FuYWRkciIgKEVkaW1heCwgRUxFQ09NLCBFbkdlbml1
cywgSS1PIERBVEEsIFNpdGVjb20pCj4gMi4gImV0MW1hY2FkZHIiIChBU1VTKQo+IDMuICJldGgx
YWRkciIgKEJ1ZmZhbG8pCj4gNC4gImF0aGFkZHIiIChFbkdlbml1cykKPiA1LiAiYmFzZU1BQyIg
KE5ldGdlYXIpCj4gNi4gIm1hYyIgKE5ldGdlYXIpCj4gNy4gIm1hY19hZGRyIiAoTW94YSkKPiBh
bmQgbW9yZSAoIkhXX0xBTl9NQUMiLCAiSFdfV0FOX01BQyIsICJJTklDX01BQ19BRERSIiwgIkxB
Tl9NQUNfQUREUiIsCj4gIlJBRElPQUREUjAiLCAiUkFESU9BRERSMSIsICJXQU5fTUFDX0FERFIi
LCAibGFuMV9tYWNfYWRkciIsICJ3YW5tYWMiLAo+ICJ3bWFjMSIsICJ3bWFjMiIpLgo+Cj4gSXQg
ZG9lc24ndCBtYWtlIHNlbnNlIHRvIGFkZCBwcm9wZXJ0eSBmb3IgZXZlcnkgcG9zc2libGUgTUFD
IGNlbGwgbmFtZS4KPiBJbnN0ZWFkIGFsbG93IHNwZWNpZnlpbmcgY2VsbHMgd2l0aCAibWFjIiBj
b21wYXRpYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgo+IC0tLQo+IExpc3Qgb2YgZGV2aWNlcyBhbmQgdGhlaXIgVS1Cb290IE1BQyB2YXJp
YWJsZXM6Cj4gYWxwaGFuZXR3b3Jrcyxhc2w1NjAyNikgd2FubWFjCj4gYXN1cyxydC1hYzY1cCkg
ZXQxbWFjYWRkcgo+IGFzdXMscnQtYWM4NXApIGV0MW1hY2FkZHIKPiBiZWxraW4sZjlrMTEwOXYx
KSBIV19XQU5fTUFDICsgSFdfTEFOX01BQwo+IGJ1ZmZhbG8sbHMyMjBkZSkgZXRoMWFkZHIKPiBi
dWZmYWxvLGxzNDIxZGUpIGV0aDFhZGRyCj4gY2hlY2twb2ludCxsLTUwKSBsYW4xX21hY19hZGRy
Cj4gZG92YWRvLHRpbnktYWMpIElOSUNfTUFDX0FERFIKPiBkb3ZhZG8sdGlueS1hYykgTEFOX01B
Q19BRERSICsgV0FOX01BQ19BRERSCj4gZWRpbWF4LHJhMjFzKSB3YW5hZGRyCj4gZWRpbWF4LHJn
MjFzKSB3YW5hZGRyCj4gZWxlY29tLHdyYy0yNTMzZ2hiay1pKSB3YW5hZGRyCj4gZWxlY29tLHdy
Yy0yNTMzZ2hiazItdCkgd2FuYWRkcgo+IGVuZ2VuaXVzLGVjYjEyMDApIGF0aGFkZHIKPiBlbmdl
bml1cyxlY2IxNzUwKSBhdGhhZGRyCj4gZW5nZW5pdXMsZXBnNTAwMCkgd2FuYWRkcgo+IGVuZ2Vu
aXVzLGVwZzYwMCkgd2FuYWRkcgo+IGVuZ2VuaXVzLGVzcjEyMDApIHdhbmFkZHIKPiBlbmdlbml1
cyxlc3IxNzUwKSB3YW5hZGRyCj4gZW5nZW5pdXMsZXNyNjAwKSB3YW5hZGRyCj4gZW5nZW5pdXMs
ZXNyNjAwaCkgd2FuYWRkcgo+IGVuZ2VuaXVzLGVzcjkwMCkgd2FuYWRkcgo+IGVudGVyYXN5cyx3
cy1hcDM3MDVpKSBSQURJT0FERFIwICsgUkFESU9BRERSMQo+IGlvZGF0YSx3bi1hYzExNjdkZ3Ip
IHdhbmFkZHIKPiBpb2RhdGEsd24tYWMxMTY3Z3IpIHdhbmFkZHIKPiBpb2RhdGEsd24tYWMxNjAw
ZGdyKSB3YW5hZGRyCj4gaW9kYXRhLHduLWFjMTYwMGRncjIpIHdhbmFkZHIKPiBpb2RhdGEsd24t
YWM3MzNncjMpIHdhbmFkZHIKPiBpb2RhdGEsd24tYWczMDBkZ3IpIHdhbmFkZHIKPiBpb2RhdGEs
d25wcjI2MDBnKSB3YW5hZGRyCj4gbW94YSxhd2stMTEzN2MpIG1hY19hZGRyCj4gbmV0Z2Vhcix3
YXgyMjApIG1hYwo+IG5ldGdlYXIsd25kYXA2MjApIGJhc2VNQUMKPiBuZXRnZWFyLHduZGFwNjYw
KSBiYXNlTUFDCj4gb2NlZG8scGFuZGEpIHdtYWMxICsgd21hYzIKPiBzaXRlY29tLHdsci03MTAw
KSB3YW5hZGRyCj4gc2l0ZWNvbSx3bHItODEwMCkgd2FuYWRkcgo+Cj4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbCB8IDMzICsrKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKPgoKQXJlIHRoZXNlIHVwc3RyZWFt
IFUtQm9vdHMsIG9yIGp1c3QgdmVuZG9yIGZvcmtzPwoKUmVnYXJkcywKU2ltb24KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
