Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2805C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jun 2022 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EoIVShak2Wx8fdl7kYupF0IwhD6Y3LORJPIfV+7+3rc=; b=RxKRVcS/uwv0DC
	/wCo8QV2nCnguV6+EAW1rLDHjs6XpzS1/WRB6B8ksExcwdOZSof+nF3YWiLxbJZSzevVpFmK7S5jn
	nFGGHBtXFywauPVfCQXj2OVFvreJ9Kt6gZZvIzZuTyaRI6H2+RZ6HZQ2Fhe5PQJ/+nYNYtOHRDYJH
	AcRPUUZKTrDMrYIzyEXHlDxNIqeLyTSNJDKrWqNgbsAUFHbaqIXjmi/0RqfqJDKltBD7kQXpC/zDv
	ahkW1tYT22XTQczk3nF/rO55/BqzJGzYuQ7fJW+0nUA0Pe+J7zUFPBsTJGUndjqvWmfhPcQJHHmfP
	AYBxf/+KEDDXPWRVpHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o00Lo-00Cw64-NG; Sat, 11 Jun 2022 12:36:24 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o00Ll-00Cw4z-9d
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2022 12:36:23 +0000
Received: by mail-ej1-x62d.google.com with SMTP id s12so2759230ejx.3
        for <linux-mtd@lists.infradead.org>; Sat, 11 Jun 2022 05:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=s6zJcQ6MWJjScHncLECLbULVJG3wMw6JMMgNEzHWwPA=;
        b=jH5gJehQ0Ic7zGGCSl7G+fBDnjGGWYjvooWJfOPs7lZYEQZvt6wcCbMCtTBOx8EZbm
         Lq6yREypKnLnb+O+zyLcuIQ0petbG2J8n/8Vz0NPJA7uKECe8zyJM2e7sA8pXCMoMJyd
         Spxc5dgE46JcvvcHBN4aXk6Y6HvklZyjM7mRsCxsfo36wss2HI+ItnA0Zu4QmMbxOwP8
         Ree1gbyW6iorC8eW4Vx5U3WlLGfW6+grJhznaciuarOX2239gthT65WEX/FJt5qOh6Gi
         TzJTLxUHH4EQEmcrsnylGXbeLFHQAyY5a8M2mYtMMhdhu80Y+t7hR+jDNICLdc4TGqLs
         ajtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=s6zJcQ6MWJjScHncLECLbULVJG3wMw6JMMgNEzHWwPA=;
        b=MXFIhVkIc0yh6xS86EPM6gu/gZ2GBz4xM57cup9hxslIHT24DJv8K1I1EaM7uIHGT/
         3jPn+twv1lNfQOlzp0mfkTSh8BGfDfRbrhCbdAsIdG0qrczJsde89fK6FvPp+T5XD1b1
         xUzpF3tmTptB2BhkwuSMmW6xPG+w/0YpQU5lPoMnF7rLDYsN3GY/4OCtSpWVM/GU4AaF
         LarhuTEl29djIKPxfWdZPmDr+42qSq/4NwdhELO0TgzEy/fx1GIJqv8ACdDpCtW4Xq6x
         16Ed7pcMiQ9JmK/BogXzeaWOp02OB8ciHHnPX83fvjbOK3tVIRfjCwRstfkuz3bq2Iba
         q3gA==
X-Gm-Message-State: AOAM530s4G1nY5lzhyc9AcTNBC85wrHRDBzcZ3XkCQY97StdmETXiMi5
	//e+qDUvpdvS9HgyTQZ9NTs=
X-Google-Smtp-Source: ABdhPJw+ZMlaDY9HCYByk7VYXIXSMW2C3bI8xHOcdaFZzap279AZHY19Wvo7vjsbKG2gRijkWEsIkw==
X-Received: by 2002:a17:907:c1d:b0:70f:469a:3d73 with SMTP id ga29-20020a1709070c1d00b0070f469a3d73mr37097805ejc.248.1654950977724;
        Sat, 11 Jun 2022 05:36:17 -0700 (PDT)
Received: from Ansuel-xps. (host-87-3-249-65.retail.telecomitalia.it. [87.3.249.65])
        by smtp.gmail.com with ESMTPSA id ke21-20020a17090798f500b006fee7b5dff2sm985155ejc.143.2022.06.11.05.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 05:36:17 -0700 (PDT)
Message-ID: <62a48c41.1c69fb81.8b0d2.1fe6@mx.google.com>
X-Google-Original-Message-ID: <YqSMPwjM/l/oLGvk@Ansuel-xps.>
Date: Sat, 11 Jun 2022 14:36:15 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	=?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: partitions: Support label only
 partition
References: <20220606151417.19227-1-ansuelsmth@gmail.com>
 <20220606151417.19227-2-ansuelsmth@gmail.com>
 <20220609183252.GA4072951-robh@kernel.org>
 <62a250c4.1c69fb81.addd2.0eae@mx.google.com>
 <20220610170205.GD1787330-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610170205.GD1787330-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_053621_398664_BE5AC2AE 
X-CRM114-Status: GOOD (  38.09  )
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTE6MDI6MDVBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMDk6NTc6NTJQTSArMDIwMCwgQW5zdWVsIFNt
aXRoIHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMTI6MzI6NTJQTSAtMDYwMCwg
Um9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSnVuIDA2LCAyMDIyIGF0IDA1OjE0OjE1
UE0gKzAyMDAsIEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+ID4gPiBEb2N1bWVudCBuZXcgcGFydGl0
aW9uIG5vZGVzIHRoYXQgZGVjbGFyZSBvbmx5IHRoZSBsYWJlbCBpbnN0ZWFkIG9mIHRoZQo+ID4g
PiA+IHJlZyB1c2VkIHRvIHByb3ZpZGUgYW4gT0Ygbm9kZSBmb3IgcGFydGl0aW9uIHJlZ2lzdHJl
ZCBhdCBydW50aW1lIGJ5Cj4gPiA+ID4gcGFyc2Vycy4gVGhpcyBpcyByZXF1aXJlZCBmb3IgbnZt
ZW0gc3lzdGVtIHRvIGRlY2xhcmUgYW5kIGRldGVjdAo+ID4gPiA+IG52bWVtLWNlbGxzLgo+ID4g
PiA+IAo+ID4gPiA+IFdpdGggdGhlc2Ugc3BlY2lhbCBwYXJ0aXRpb25zLCB0aGUgcmVnIC8gb2Zm
c2V0IGlzIG5vdCByZXF1aXJlZC4KPiA+ID4gPiBUaGUgbGFiZWwgYmluZGluZyBpcyB1c2VkIHRv
IG1hdGNoIHRoZSBwYXJ0aXRpb24gYWxsb2NhdGVkIGJ5IHRoZQo+ID4gPiA+IHBhcnNlciBhdCBy
dW50aW1lIGFuZCB0aGUgcGFyc2VyIHdpbGwgcHJvdmlkZSByZWcgYW5kIG9mZnNldCBvZiB0aGUg
bXRkLgo+ID4gPiA+IAo+ID4gPiA+IE5WTUVNIHdpbGwgdXNlIHRoZSBkYXRhIGZyb20gdGhlIHBh
cnNlciBhbmQgcHJvdmlkZSB0aGUgTlZNRU0gY2VsbHMKPiA+ID4gPiBkZWNsYXJlZCBpbiB0aGUg
RFRTLCAiY29ubmVjdGluZyIgdGhlIGR5bmFtaWMgcGFydGl0aW9uIHdpdGggYQo+ID4gPiA+IHN0
YXRpYyBkZWNsYXJhdGlvbiBvZiBjZWxscyBpbiB0aGVtLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gPiA+ID4gLS0t
Cj4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbCAgICAg
ICB8IDE2ICsrKysrKysrKysrKysrLS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24u
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9w
YXJ0aXRpb24ueWFtbAo+ID4gPiA+IGluZGV4IGUxYWMwODA2NDQyNS4uYmZmNmZiOTgwZTZiIDEw
MDY0NAo+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+ID4gPiA+IEBA
IC0xMSw2ICsxMSwxMyBAQCBkZXNjcmlwdGlvbjogfAo+ID4gPiA+ICAgIHJlbGF0aXZlIG9mZnNl
dCBhbmQgc2l6ZSBzcGVjaWZpZWQuIERlcGVuZGluZyBvbiBwYXJ0aXRpb24gZnVuY3Rpb24gZXh0
cmEKPiA+ID4gPiAgICBwcm9wZXJ0aWVzIGNhbiBiZSB1c2VkLgo+ID4gPiA+ICAKPiA+ID4gPiAr
ICBBIHBhcnRpdGlvbiBtYXkgYmUgZHluYW1pY2FsbHkgYWxsb2NhdGVkIGJ5IGEgc3BlY2lmaWMg
cGFyc2VyIGF0IHJ1bnRpbWUuCj4gPiA+ID4gKyAgSW4gdGhpcyBzcGVjaWZpYyBjYXNlLCB0aGUg
bGFiZWwgaXMgcmVxdWlyZWQgaW5zdGVhZCBvZiB0aGUgcmVnLgo+ID4gPiA+ICsgIFRoaXMgaXMg
dXNlZCB0byBhc3NpZ24gYW4gT0Ygbm9kZSB0byB0aGUgZHluYW1pY2NhbGx5IGFsbG9jYXRlZCBw
YXJ0aXRpb24KPiA+ID4gPiArICBzbyB0aGF0IHN1YnN5c3RlbSBsaWtlIE5WTUVNIGNhbiBwcm92
aWRlIGFuIE9GIG5vZGUgYW5kIGRlY2xhcmUgTlZNRU0gY2VsbHMuCj4gPiA+ID4gKyAgVGhlIE9G
IG5vZGUgd2lsbCBiZSBhc3NpZ25lZCBvbmx5IGlmIHRoZSBwYXJ0aXRpb24gbGFiZWwgZGVjbGFy
ZWQgbWF0Y2ggdGhlCj4gPiA+ID4gKyAgb25lIGFzc2lnbmVkIGJ5IHRoZSBwYXJzZXIgYXQgcnVu
dGltZS4KPiA+ID4gPiArCj4gPiA+ID4gIG1haW50YWluZXJzOgo+ID4gPiA+ICAgIC0gUmFmYcWC
IE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4gPiA+ICAKPiA+ID4gPiBAQCAtMjIsNiAr
MjksOCBAQCBwcm9wZXJ0aWVzOgo+ID4gPiA+ICAgIGxhYmVsOgo+ID4gPiA+ICAgICAgZGVzY3Jp
cHRpb246IFRoZSBsYWJlbCAvIG5hbWUgZm9yIHRoaXMgcGFydGl0aW9uLiBJZiBvbWl0dGVkLCB0
aGUgbGFiZWwKPiA+ID4gPiAgICAgICAgaXMgdGFrZW4gZnJvbSB0aGUgbm9kZSBuYW1lIChleGNs
dWRpbmcgdGhlIHVuaXQgYWRkcmVzcykuCj4gPiA+ID4gKyAgICAgIFdpdGggZHluYW1pY2FsbHkg
YWxsb2NhdGVkIHBhcnRpdGlvbiB0aGUgbGFiZWwgaXMgcmVxdWlyZWQgYW5kIHdvbid0Cj4gPiA+
ID4gKyAgICAgIGZhbGxiYWNrIHRvIHRoZSBub2RlIG5hbWUuCj4gPiA+IAo+ID4gPiBHZW5lcmFs
bHksIGxhYmVsIGlzIG5ldmVyIHJlcXVpcmVkIGJlaW5nIHNvbWV0aGluZyBmb3IgaHVtYW5zIHJh
dGhlciAKPiA+ID4gdGhhbiB0aGUgcy93IHRvIGNvbnN1bWUuIEkgZG9uJ3Qgc2VlIGFueSByZWFz
b24gd2h5IHdlIGNhbid0IHN0aWxsIHVzZSAKPiA+ID4gdGhlIG5vZGUgbmFtZSAod2l0aCAncGFy
dGl0aW9uLScgc3RyaXBwZWQgb2ZmKS4KPiA+ID4gCj4gPiAKPiA+IEhvdyB0byBlbmZvcmNlIHRo
ZSB1c2Ugb2YgJ3BhcnRpdGlvbi0nPyBTaG91bGQgdGhlIGRyaXZlciB0aGVuIGNoZWNrIHRoZQo+
ID4gbm9kZSBuYW1lIGFuZCByZWplY3QgYW55IHdyb25nIG5vZGUgbmFtZSAoYW5kIHJldHVybiBl
cnJvcik/Cj4gCj4gVGhlIHNjaGVtYSBjYW4gZG8gaXQgZWl0aGVyIGluIHRoZSBwYXJlbnQgKG9m
IHBhcnRpdGlvbiBub2Rlcykgc2NoZW1hIG9yIAo+IHdpdGggJG5vZGVuYW1lICdwcm9wZXJ0eScu
Cj4gCj4gJG5vZGVuYW1lOgo+ICAgb25lT2Y6Cj4gICAgIC0gcGF0dGVybjogJ14uKkAuKiQnCj4g
ICAgIC0gcGF0dGVybjogJ15wYXJ0aXRpb24tLiokJwo+IAo+IG9yOgo+IAo+IGlmOgo+ICAgbm90
Ogo+ICAgICByZXF1aXJlZDoKPiAgICAgICAtIHJlZwo+IHRoZW46Cj4gICBwcm9wZXJ0aWVzOgo+
ICAgICAkbm9kZW5hbWU6Cj4gICAgICAgcGF0dGVybjogJ15wYXJ0aXRpb24tLiokJwo+IAo+IAo+
IFRoZSBsYXR0ZXIgaXMgYSBiaXQgY2xlYXJlciBvbiB0aGUgaW50ZW50IEkgdGhpbmsuCj4gCj4g
PiA+IElmIHRoZSBwdXJwb3NlIGlzIHRvIGRlZmluZSB3aGF0IHRoZSBwYXJ0aXRpb24gY29udGFp
bnMsIHRoZW4gCj4gPiA+ICdjb21wYXRpYmxlJyBpcyB0aGUgcmlnaHQgdGhpbmcgZm9yIHRoYXQu
Cj4gPiA+Cj4gPiAKPiA+IEludHJvZHVjaW5nIGEgY29tcGF0aWJsZSBtZWFucyBjcmVhdGluZyBh
bm90aGVyIHNjaGVtZSBJIHRoaW5rIG9yIHdlIGNhbgo+ID4gYWRkIHRoYXQgc3BlY2lhbCBjb21w
YXRpYmxlIGluIHRoZSBwYXJ0aXRpb24gc2NoZW1lPwo+IAo+IEl0IHdvdWxkIGJlIGFub3RoZXIg
c2NoZW1hLiBZb3UgY291bGQgbWFrZSAnY29tcGF0aWJsZScgcmVxdWlyZWQgaGVyZSAKPiBwZXJo
YXBzLCBidXQgbWF5YmUgdGhlcmUncyBhIHVzZSBmb3IgYW4gZW1wdHkgbm9kZT8KPiAKPiBSb2IK
ClRoaW5rIEkgd2lsbCBqdXN0IGFkZCB0aGUgJG5vZGVuYW1lIHByb3BlcnRpZXMganVzdCB0byBu
b3cgY29tcGxpY2F0ZQp0aGluZ3Mgd2l0aCBhbm90aGVyIHNjaGVtZS4KCi0tIAoJQW5zdWVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
