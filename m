Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677DEC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jun 2022 17:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJZOjI9pAYS51TAElfS00pFjWCdPQU7XpevrhSBBrZI=; b=edxopev5MOuv/q
	kmy3dIX3xWRqgMhbpIyIuHoVtswNKEc2DGuBaOPSglgBGXHKnmc+qF4QCHAkBNr2spbLCWLJ5fPzn
	Aof1EkncwhV6uvuTDdCHSjq/2hGurvjo2Gdb3FfEH0gR5stxQfspXYMVOgtLLVdCtPw1EoJVOWaFG
	KfIHbuyRl8OR3GsYXTqxZOuxhVpGJao7BL10h1dC5CBHn6p/RrXtvdW1oSQnJ6FANo2RptOGs+sV7
	iRfJb4khsyR1x9VeoxJDXO6wc/RlLSrTTAl8pYpa23Goa9yn1qq8Ap/tQXM0HRFsx1TZ+qnIiI7iS
	fBJME7Cz9HLfYDCaqYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzi1X-0092gU-8R; Fri, 10 Jun 2022 17:02:15 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzi1S-0092fP-No
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2022 17:02:12 +0000
Received: by mail-il1-f169.google.com with SMTP id a15so21333682ilq.12
        for <linux-mtd@lists.infradead.org>; Fri, 10 Jun 2022 10:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=y6f2xzPn3BL2e4yPTDV44UTfpV1wb6g7eo8omcTZKD4=;
        b=EJRZEAqSkjhKaWzg3iUQFRYX8eg8DFmqv9MDi+BIF6N4ax4eQXBBiaEFKn+KftTBhB
         gI6GbT9KXEQmqzAeIa3kP9Ibud80xjF9N6USz7b9S5ARL6qabmliQqg/4+uprEgEssjA
         hS3CWSv+8Sv8gWmRGX7Hro3JWI3OBETw4AxQxl7aXY4wEGWtnOpzm4QkUaO2QpZoklOp
         hyjXBEPfDfc5SYnO/LbqKpVmCces/qg5BIpSwvtyaXQpKFIHneL9RK6IvbHaCMummCEB
         23muOajnTGr25DMlZ56B7gOxBlS5XG+TH+C4MT7nazU3lVlvfkI70Bqli2AkyymGiblY
         vFLw==
X-Gm-Message-State: AOAM532SGR2z/bjBFohFJcWwZu+s5wVvoCAtu5/aOHk8PmQi3h3ds5t+
	xfIYwuQkSjGS5tR21Q9kXA==
X-Google-Smtp-Source: ABdhPJw+XPd0bd3oGjagUw5zF7qz6ZKYI7Ie8iQMRFZvqZmV3pOmg6DZH+nBZJ9xjqp+OawbOcdh9A==
X-Received: by 2002:a05:6e02:158a:b0:2d3:f198:9f39 with SMTP id m10-20020a056e02158a00b002d3f1989f39mr21493390ilu.206.1654880527064;
        Fri, 10 Jun 2022 10:02:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y14-20020a927d0e000000b002d53be43069sm6885624ilc.64.2022.06.10.10.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 10:02:06 -0700 (PDT)
Received: (nullmailer pid 1832170 invoked by uid 1000);
	Fri, 10 Jun 2022 17:02:05 -0000
Date: Fri, 10 Jun 2022 11:02:05 -0600
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jens Axboe <axboe@kernel.dk>, =?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: partitions: Support label only
 partition
Message-ID: <20220610170205.GD1787330-robh@kernel.org>
References: <20220606151417.19227-1-ansuelsmth@gmail.com>
 <20220606151417.19227-2-ansuelsmth@gmail.com>
 <20220609183252.GA4072951-robh@kernel.org>
 <62a250c4.1c69fb81.addd2.0eae@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62a250c4.1c69fb81.addd2.0eae@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_100210_844979_C30C0F3A 
X-CRM114-Status: GOOD (  34.96  )
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

T24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMDk6NTc6NTJQTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IE9uIFRodSwgSnVuIDA5LCAyMDIyIGF0IDEyOjMyOjUyUE0gLTA2MDAsIFJvYiBIZXJy
aW5nIHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMDYsIDIwMjIgYXQgMDU6MTQ6MTVQTSArMDIwMCwg
QW5zdWVsIFNtaXRoIHdyb3RlOgo+ID4gPiBEb2N1bWVudCBuZXcgcGFydGl0aW9uIG5vZGVzIHRo
YXQgZGVjbGFyZSBvbmx5IHRoZSBsYWJlbCBpbnN0ZWFkIG9mIHRoZQo+ID4gPiByZWcgdXNlZCB0
byBwcm92aWRlIGFuIE9GIG5vZGUgZm9yIHBhcnRpdGlvbiByZWdpc3RyZWQgYXQgcnVudGltZSBi
eQo+ID4gPiBwYXJzZXJzLiBUaGlzIGlzIHJlcXVpcmVkIGZvciBudm1lbSBzeXN0ZW0gdG8gZGVj
bGFyZSBhbmQgZGV0ZWN0Cj4gPiA+IG52bWVtLWNlbGxzLgo+ID4gPiAKPiA+ID4gV2l0aCB0aGVz
ZSBzcGVjaWFsIHBhcnRpdGlvbnMsIHRoZSByZWcgLyBvZmZzZXQgaXMgbm90IHJlcXVpcmVkLgo+
ID4gPiBUaGUgbGFiZWwgYmluZGluZyBpcyB1c2VkIHRvIG1hdGNoIHRoZSBwYXJ0aXRpb24gYWxs
b2NhdGVkIGJ5IHRoZQo+ID4gPiBwYXJzZXIgYXQgcnVudGltZSBhbmQgdGhlIHBhcnNlciB3aWxs
IHByb3ZpZGUgcmVnIGFuZCBvZmZzZXQgb2YgdGhlIG10ZC4KPiA+ID4gCj4gPiA+IE5WTUVNIHdp
bGwgdXNlIHRoZSBkYXRhIGZyb20gdGhlIHBhcnNlciBhbmQgcHJvdmlkZSB0aGUgTlZNRU0gY2Vs
bHMKPiA+ID4gZGVjbGFyZWQgaW4gdGhlIERUUywgImNvbm5lY3RpbmciIHRoZSBkeW5hbWljIHBh
cnRpdGlvbiB3aXRoIGEKPiA+ID4gc3RhdGljIGRlY2xhcmF0aW9uIG9mIGNlbGxzIGluIHRoZW0u
Cj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnN1ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21h
aWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0
aXRpb24ueWFtbCAgICAgICB8IDE2ICsrKysrKysrKysrKysrLS0KPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9w
YXJ0aXRpb24ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFy
dGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+ID4gPiBpbmRleCBlMWFjMDgwNjQ0MjUuLmJmZjZmYjk4
MGU2YiAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+ID4gPiBA
QCAtMTEsNiArMTEsMTMgQEAgZGVzY3JpcHRpb246IHwKPiA+ID4gICAgcmVsYXRpdmUgb2Zmc2V0
IGFuZCBzaXplIHNwZWNpZmllZC4gRGVwZW5kaW5nIG9uIHBhcnRpdGlvbiBmdW5jdGlvbiBleHRy
YQo+ID4gPiAgICBwcm9wZXJ0aWVzIGNhbiBiZSB1c2VkLgo+ID4gPiAgCj4gPiA+ICsgIEEgcGFy
dGl0aW9uIG1heSBiZSBkeW5hbWljYWxseSBhbGxvY2F0ZWQgYnkgYSBzcGVjaWZpYyBwYXJzZXIg
YXQgcnVudGltZS4KPiA+ID4gKyAgSW4gdGhpcyBzcGVjaWZpYyBjYXNlLCB0aGUgbGFiZWwgaXMg
cmVxdWlyZWQgaW5zdGVhZCBvZiB0aGUgcmVnLgo+ID4gPiArICBUaGlzIGlzIHVzZWQgdG8gYXNz
aWduIGFuIE9GIG5vZGUgdG8gdGhlIGR5bmFtaWNjYWxseSBhbGxvY2F0ZWQgcGFydGl0aW9uCj4g
PiA+ICsgIHNvIHRoYXQgc3Vic3lzdGVtIGxpa2UgTlZNRU0gY2FuIHByb3ZpZGUgYW4gT0Ygbm9k
ZSBhbmQgZGVjbGFyZSBOVk1FTSBjZWxscy4KPiA+ID4gKyAgVGhlIE9GIG5vZGUgd2lsbCBiZSBh
c3NpZ25lZCBvbmx5IGlmIHRoZSBwYXJ0aXRpb24gbGFiZWwgZGVjbGFyZWQgbWF0Y2ggdGhlCj4g
PiA+ICsgIG9uZSBhc3NpZ25lZCBieSB0aGUgcGFyc2VyIGF0IHJ1bnRpbWUuCj4gPiA+ICsKPiA+
ID4gIG1haW50YWluZXJzOgo+ID4gPiAgICAtIFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD4KPiA+ID4gIAo+ID4gPiBAQCAtMjIsNiArMjksOCBAQCBwcm9wZXJ0aWVzOgo+ID4gPiAg
ICBsYWJlbDoKPiA+ID4gICAgICBkZXNjcmlwdGlvbjogVGhlIGxhYmVsIC8gbmFtZSBmb3IgdGhp
cyBwYXJ0aXRpb24uIElmIG9taXR0ZWQsIHRoZSBsYWJlbAo+ID4gPiAgICAgICAgaXMgdGFrZW4g
ZnJvbSB0aGUgbm9kZSBuYW1lIChleGNsdWRpbmcgdGhlIHVuaXQgYWRkcmVzcykuCj4gPiA+ICsg
ICAgICBXaXRoIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBwYXJ0aXRpb24gdGhlIGxhYmVsIGlzIHJl
cXVpcmVkIGFuZCB3b24ndAo+ID4gPiArICAgICAgZmFsbGJhY2sgdG8gdGhlIG5vZGUgbmFtZS4K
PiA+IAo+ID4gR2VuZXJhbGx5LCBsYWJlbCBpcyBuZXZlciByZXF1aXJlZCBiZWluZyBzb21ldGhp
bmcgZm9yIGh1bWFucyByYXRoZXIgCj4gPiB0aGFuIHRoZSBzL3cgdG8gY29uc3VtZS4gSSBkb24n
dCBzZWUgYW55IHJlYXNvbiB3aHkgd2UgY2FuJ3Qgc3RpbGwgdXNlIAo+ID4gdGhlIG5vZGUgbmFt
ZSAod2l0aCAncGFydGl0aW9uLScgc3RyaXBwZWQgb2ZmKS4KPiA+IAo+IAo+IEhvdyB0byBlbmZv
cmNlIHRoZSB1c2Ugb2YgJ3BhcnRpdGlvbi0nPyBTaG91bGQgdGhlIGRyaXZlciB0aGVuIGNoZWNr
IHRoZQo+IG5vZGUgbmFtZSBhbmQgcmVqZWN0IGFueSB3cm9uZyBub2RlIG5hbWUgKGFuZCByZXR1
cm4gZXJyb3IpPwoKVGhlIHNjaGVtYSBjYW4gZG8gaXQgZWl0aGVyIGluIHRoZSBwYXJlbnQgKG9m
IHBhcnRpdGlvbiBub2Rlcykgc2NoZW1hIG9yIAp3aXRoICRub2RlbmFtZSAncHJvcGVydHknLgoK
JG5vZGVuYW1lOgogIG9uZU9mOgogICAgLSBwYXR0ZXJuOiAnXi4qQC4qJCcKICAgIC0gcGF0dGVy
bjogJ15wYXJ0aXRpb24tLiokJwoKb3I6CgppZjoKICBub3Q6CiAgICByZXF1aXJlZDoKICAgICAg
LSByZWcKdGhlbjoKICBwcm9wZXJ0aWVzOgogICAgJG5vZGVuYW1lOgogICAgICBwYXR0ZXJuOiAn
XnBhcnRpdGlvbi0uKiQnCgoKVGhlIGxhdHRlciBpcyBhIGJpdCBjbGVhcmVyIG9uIHRoZSBpbnRl
bnQgSSB0aGluay4KCj4gPiBJZiB0aGUgcHVycG9zZSBpcyB0byBkZWZpbmUgd2hhdCB0aGUgcGFy
dGl0aW9uIGNvbnRhaW5zLCB0aGVuIAo+ID4gJ2NvbXBhdGlibGUnIGlzIHRoZSByaWdodCB0aGlu
ZyBmb3IgdGhhdC4KPiA+Cj4gCj4gSW50cm9kdWNpbmcgYSBjb21wYXRpYmxlIG1lYW5zIGNyZWF0
aW5nIGFub3RoZXIgc2NoZW1lIEkgdGhpbmsgb3Igd2UgY2FuCj4gYWRkIHRoYXQgc3BlY2lhbCBj
b21wYXRpYmxlIGluIHRoZSBwYXJ0aXRpb24gc2NoZW1lPwoKSXQgd291bGQgYmUgYW5vdGhlciBz
Y2hlbWEuIFlvdSBjb3VsZCBtYWtlICdjb21wYXRpYmxlJyByZXF1aXJlZCBoZXJlIApwZXJoYXBz
LCBidXQgbWF5YmUgdGhlcmUncyBhIHVzZSBmb3IgYW4gZW1wdHkgbm9kZT8KClJvYgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
