Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08AAC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bamZESfhWnV8uu7jQPazQbRzTjFCMrZ0tyYAfEp8G8=; b=YD3DA/jgCLv3I8
	HVJH6fYKcANmiDAnbmSD9XkGJbq1Cju+U6BH3+HHapeXg1A6wPKNbNvQCTsouFrq7bT/RWufdtQcD
	jJrWpa4dhWIludbSMiGJn3IQ97VBT59yuxW1BW4NkawFmncZ0vyxm8fMZ9x27nNNtPZ32KGJCdHPU
	fEI6fFmUX5hr8gXRq6zMqqRU1Jq+POd15DPgJOkxCra/JpUZLf5ERtVaTPa9LKl6blZ44WzRAoavK
	EevWGNaa3s7snN7btmoPs41aFrHppaIfEVH13J3BNKNT18NwliRgAQRVoMXp8CbJMqBdmP8XBnCJD
	LkVCs9qbU4UD/QEKNFRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0pgV-005KPD-17; Mon, 13 Jun 2022 19:25:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0pgS-005KMR-EJ
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2022 19:25:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id o16so8353421wra.4
        for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2022 12:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=P8UEDHDMT+jpQAXSUmhS5cnDmYTJqZrHS8auMDkB9iM=;
        b=S1sqEUWptAMoNsL/yZl9X9liiQgbDSLBMK1KkPHulgqqQnYj7jDHIUdfDSG42r6P9p
         kzOLpvQ0N2CVfDlTb+IqemtVyiTJOD7iZaE0mzCaDdqWnEoydjpxqhpMR+ZEYOYN2rjS
         5MANGV2gGUT+ARXhNV9G4YAWhuDkG+egcnvDcAs+KWj/0IV8tssuoH7vuby+7ujFGbcl
         hX9QRVGjS+amsgARu8kxWYe8ApJ4Y0lbtlc5Z6NFw5ZnSq1uZiTkgCiYVhZ1m/tSsJzH
         rcfC9uAZWa/9KPdNOe/dLgIp4yLgPSKqmw+IRtuOWmxVs/8KpVqO2nWfCsQyEv195TSg
         pTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=P8UEDHDMT+jpQAXSUmhS5cnDmYTJqZrHS8auMDkB9iM=;
        b=ugzkk+rdX627nkQaW77zPiZ7NjuhUQ7/Gc+RkjXfpbZejfipJM/JBXyOfZ7CLGmfCe
         PYLybicXB1KHxV8Kx6Nn7Q1LD4fbtVEX5VcMbARGCQgkUbrQCR7pEHbwQwws4hSTuFph
         /fDkJCWI9eYyy9vry1oFwY2ayjdlZ7Z3CkCRgMc5mDCk9XUur6xO5Kll4m1WJkrg/qtZ
         3vFEw3slXlkeTInHXrX8dBCcwSpFWlLbgJm8tzltYCJEBMb4KUPoNYlc4QhG8KFOZ3m1
         RBKcd1PWrRMgpAGvYHw/wbQS/z3p8XawfsQ3B+txnzwP7yOG/cM8cNSxlNZJG/+9XPew
         UjqQ==
X-Gm-Message-State: AJIora+ze7sRNCYcfqBftKut3DR/MzsD6ovqhA1WWZ1yqIlmnVKpkpv5
	17SSqmFjfurqNrknfH1RXHo=
X-Google-Smtp-Source: AGRyM1slSf3w814vQAIijwzMlXdNSr5rvAEgtNAg31xiBcBaLcqPq/W4p4cZy7cnhYm/OEWTOpEJWQ==
X-Received: by 2002:a05:6000:1f8b:b0:219:bee5:6b77 with SMTP id bw11-20020a0560001f8b00b00219bee56b77mr1244672wrb.658.1655148301948;
        Mon, 13 Jun 2022 12:25:01 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id a4-20020adff7c4000000b0021033caa332sm9669422wrq.42.2022.06.13.12.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 12:25:01 -0700 (PDT)
Message-ID: <62a78f0d.1c69fb81.574dd.13b8@mx.google.com>
X-Google-Original-Message-ID: <YqePGfEbLTutoYrN@Ansuel-xps.>
Date: Mon, 13 Jun 2022 21:25:13 +0200
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
X-CRM114-CacheID: sfid-20220613_122508_522484_6FC0E95D 
X-CRM114-Status: GOOD (  41.89  )
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
IFRoZSBsYXR0ZXIgaXMgYSBiaXQgY2xlYXJlciBvbiB0aGUgaW50ZW50IEkgdGhpbmsuCj4KCkhp
LCBJJ20gdGVzdGluZyB0aGlzIGJ1dCBJJ20gaGF2aW5nIHNvbWUgZGlmZmljdWx0aWVzLgpJIHB1
dCB5b3VyIHNlY29uZCBzb2x1dGlvbiBpbiBwYXJ0aXRpb24ueWFtbAoKQnV0IEkgbm90aWNlIHRo
YXQgaWYgZm9yIGV4YW1wbGUgcWNvbSxzbWVtLXBhcnQueWFtbCBoYXZlCgpwYXR0ZXJuUHJvcGVy
dGllczoKICAiXnBhcnRpdGlvbjMtWzAtOWEtel0rJCI6CiAgICAkcmVmOiBwYXJ0aXRpb24ueWFt
bCMKClRoZW4gdGhlICRub2RlbmFtZSBpcyBpZ25vcmVkIChvciBvdmVyd3RpdHRlbj8pLiBDYW4n
dCBmaW5kIGEgY29ycmVjdAp3YXkgdG8gZGVjbGFyZSBhIHBhdHRlcm5Qcm9wZXJ0aWVzIHRoYXQg
cmVmIGFub3RoZXIgc2NoZW1hLgoKSSdtIHRyeWluZyBhbmQgc2VhcmNoaW5nIGEgd2F5IHRvIHJl
ZiB0aGUgcGFydGl0aW9uLnlhbWwgYnV0IEkgY2FuJ3QKZmluZCBhbnl0aGluZy4gQ2FuIHlvdSBo
ZWxwIHdpdGggdGhpcz8gSXQgZG9lcyBzZWVtIHVzZWxzcyBwdXR0aW5nIGEKbGltaXRhdGlvbiBp
biBwYXJ0aXRpb24ueWFtbCBpZiB0aGVuIHNvbWVvbmUgY2FuIGp1c3Qgc2V0IGEgZGlmZmVyZW50
Cm9uZSBpbiB0aGUgcGFyc2VyIERvY3VtZW50YXRpb24uCgo+ID4gPiBJZiB0aGUgcHVycG9zZSBp
cyB0byBkZWZpbmUgd2hhdCB0aGUgcGFydGl0aW9uIGNvbnRhaW5zLCB0aGVuIAo+ID4gPiAnY29t
cGF0aWJsZScgaXMgdGhlIHJpZ2h0IHRoaW5nIGZvciB0aGF0Lgo+ID4gPgo+ID4gCj4gPiBJbnRy
b2R1Y2luZyBhIGNvbXBhdGlibGUgbWVhbnMgY3JlYXRpbmcgYW5vdGhlciBzY2hlbWUgSSB0aGlu
ayBvciB3ZSBjYW4KPiA+IGFkZCB0aGF0IHNwZWNpYWwgY29tcGF0aWJsZSBpbiB0aGUgcGFydGl0
aW9uIHNjaGVtZT8KPiAKPiBJdCB3b3VsZCBiZSBhbm90aGVyIHNjaGVtYS4gWW91IGNvdWxkIG1h
a2UgJ2NvbXBhdGlibGUnIHJlcXVpcmVkIGhlcmUgCj4gcGVyaGFwcywgYnV0IG1heWJlIHRoZXJl
J3MgYSB1c2UgZm9yIGFuIGVtcHR5IG5vZGU/Cj4gCj4gUm9iCgotLSAKCUFuc3VlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
