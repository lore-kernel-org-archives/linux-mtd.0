Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7F6C2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 14:34:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F5E92087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 14:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ojBDvpQ8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lehKZzcT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F5E92087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Z4iRRm/Ye5uaz7ksucce2d0TbvUuGDQe3pmone7m6A=; b=ojBDvpQ8sKL9LAWPeA3tvU3On
	aVtFNC5W8mmcYVivRZuA11svODpu/qoOT8mmmqnfiPCjUVo+YoxvxTfnSGRrXx2OSN6TGZiV71LLq
	ML+Jq4/t2AxAmPFKieJQYjkq/1+PuPbVLARzFpbz+1ZvBloYGdfq/ibg5CmJrjSEuMfHBCxLy1OOz
	C7U72dvzCzdKwVqfOgnJgPNw0GzSWtXz1CHP1wRu9zPnYWT8pASliWg4np151+jEdXKFg5PXHZR4b
	k5JHGTCfCDtOTQ/n4R4QV61mx3TdHiy6CQ1LalNUPmDY8MS/tEgWLJkfaza4MGcXlOj8R6nfmu9VA
	KQ2PjTh6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb2nh-0005N1-A9; Fri, 06 Nov 2020 14:33:13 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb2ne-0005MA-PX
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 14:33:11 +0000
Received: by mail-wr1-x441.google.com with SMTP id w14so1529677wrs.9
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 06:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DyXfDDWSKwU8s+VIA5hQfPeuUhLrKjIyJ35kol6OQUw=;
 b=lehKZzcTDVaoI0brWupnB6wN/qt2ttOEp1rS+RgjR1ypgpVb6yQSS0va6bulWe9XS7
 49dYfYmOtXqSXUoC6m1qZQXzzOH2LXgk7vvKkpDtIq8GWgAlJTxsGPe5+7Q4H4zJhgT2
 6U9lKG92h/MhuszreEY+6XBYNoAivhPmsyv+5MCbKi4oVH7Uvfm8gjYiWYaGptUy6RIg
 UrEg4dFKmYf7AfsEe/q81H2ef+eELFpkInuUwY1IfSj1p4CwkjRLSKYYrle4xyyYvOOQ
 zvROXxZTgAuWXRyqLo+hvKDIj/OBe0oXWwx63uQRTCKBxKi6jkx7Wc0wFVezM0ZYGVuu
 a3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DyXfDDWSKwU8s+VIA5hQfPeuUhLrKjIyJ35kol6OQUw=;
 b=et6LveJ9WBLgyiKCvmLM8k6uAtoTJyb419lumlVz9HmqkCbmxcIKh3s4lknZOrVqYf
 65AT2nOon876bCHNAKEwzV6CJh2Zsp9afLofDvGW6jMjqXP7fjACPrEX+sIGk6+21f/N
 bQVXtWNKQt3gNlJBy1Wzmf9cDDRHSb3GQIt40DicKi/tUNC5Lv5S0DyKSppQHnfmlzrh
 fd0kT//7nP3AW6gqRsX034HLqGWRMceRxuaN1a0aHwlcfQY2ppaxx/C3tJuJwl2MWyJK
 pYCJHBOPYLEkihlsBXrM+u+h1rvaqrVfPN4dXmwwe5c/H2Vs2R149toGu5OvV34c80os
 DXeg==
X-Gm-Message-State: AOAM530/wMnv0NNNcJ5NOBwKkwiaMHJGrcyXPt+rBz3aA5JVNMzezKZo
 v01+m87vPABYn1ue4VIYf+lichA61ky5TNc3
X-Google-Smtp-Source: ABdhPJwAEZ/j1smm7cvrpAIEJEB1BLq1MOwT4y7JoEF3M4exGNSO232kghjhVfLgpyA8EzWic1p5gQ==
X-Received: by 2002:adf:fdc7:: with SMTP id i7mr3253347wrs.198.1604673189626; 
 Fri, 06 Nov 2020 06:33:09 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id y10sm2348316wru.94.2020.11.06.06.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 06:33:08 -0800 (PST)
Date: Fri, 6 Nov 2020 14:33:07 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 00/23] Rid W=1 warnings in MTD
Message-ID: <20201106143307.GK2063125@dell>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201106133247.GI2063125@dell> <20201106144420.13c18b97@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106144420.13c18b97@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_093310_843296_6CE2D4DA 
X-CRM114-Status: GOOD (  17.90  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwNiBOb3YgMjAyMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKCj4gSGkgTGVlLAo+IAo+
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3RlIG9uIEZyaSwgNiBOb3YgMjAy
MCAxMzozMjo0Nwo+ICswMDAwOgo+IAo+ID4gPiBUaGlzIHNldCBpcyBwYXJ0IG9mIGEgbGFyZ2Vy
IGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+ID4gPiBrZXJuZWwgYnVpbGRzLCB3
aGljaCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJpZGRsZWQgd2l0aAo+ID4gPiBuaWdn
bHkgbGl0dGxlIHdhcm5pbmdzLgo+ID4gPiAKPiA+ID4gTGVlIEpvbmVzICgyMyk6Cj4gPiA+ICAg
bXRkOiBtdGRwYXJ0OiBGaXggbWlzZG9jdW1lbnRlZCBmdW5jdGlvbiBwYXJhbWV0ZXIgJ210ZCcK
PiA+ID4gICBtdGQ6IGRldmljZXM6IHBocmFtOiBGaWxlIGhlYWRlcnMgYXJlIG5vdCBnb29kIGNh
bmRpZGF0ZXMgZm9yCj4gPiA+ICAgICBrZXJuZWwtZG9jCj4gPiA+ICAgbXRkOiBuYW5kOiBvbmVu
YW5kOiBvbmVuYW5kX2Jhc2U6IEZpeCBleHBlY3RlZCBrZXJuZWwtZG9jIGZvcm1hdHRpbmcKPiA+
ID4gICBtdGQ6IGRldmljZXM6IGRvY2czOiBGaXgga2VybmVsLWRvYyAnYmFkIGxpbmUnIGFuZCAn
ZXhjZXNzaXZlIGRvYycKPiA+ID4gICAgIGlzc3Vlcwo+ID4gPiAgIG10ZDogbXRkY29yZTogRml4
IG1pc3NwZWxsZWQgZnVuY3Rpb24gcGFyYW1ldGVyICdzZWN0aW9uJwo+ID4gPiAgIG10ZDogbmFu
ZDogb25lbmFuZDogb25lbmFuZF9iYnQ6IEZpeCBleHBlY3RlZCBrZXJuZWwtZG9jIGZvcm1hdHRp
bmcKPiA+ID4gICBtdGQ6IHNwaS1ub3I6IGNvbnRyb2xsZXJzOiBoaXNpLXNmYzogRGVtb3RlIG5v
bi1jb25mb3JtYW50IGtlcm5lbC1kb2MKPiA+ID4gICBtdGQ6IHViaTogYnVpbGQ6IERvY3VtZW50
ICd1YmlfbnVtJyBpbiBzdHJ1Y3QgbXRkX2Rldl9wYXJhbQo+ID4gPiAgIG10ZDogbmFuZDogc3Bp
OiB0b3NoaWJhOiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYyBoZWFkZXIKPiA+ID4g
ICBtdGQ6IHViaToga2FwaTogQ29ycmVjdCBkb2N1bWVudGF0aW9uIGZvciAndWJpX2xlYl9yZWFk
X3NnJ3MgJ3NnbCcKPiA+ID4gICAgIHBhcmFtZXRlcgo+ID4gPiAgIG10ZDogdWJpOiBlYmE6IEZp
eCBhIGNvdXBsZSBvZiBtaXNkb2N1bWVudGF0aW9uIGlzc3Vlcwo+ID4gPiAgIG10ZDogdWJpOiB3
bDogRml4IGEgY291cGxlIG9mIGtlcm5lbC1kb2MgaXNzdWVzCj4gPiA+ICAgbXRkOiBuYW5kOiBy
YXc6IGJyY21uYW5kOiBicmNtbmFuZDogRGVtb3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MK
PiA+ID4gICAgIGhlYWRlcnMKPiA+ID4gICBtdGQ6IHViaTogZ2x1ZWJpOiBGaXggbWlzbmFtZWQg
ZnVuY3Rpb24gcGFyYW1ldGVyIGRvY3VtZW50YXRpb24KPiA+ID4gICBtdGQ6IG5hbmQ6IHJhdzog
ZGlza29uY2hpcDogTWFya2luZyB1bnVzZWQgdmFyaWFibGVzIGFzCj4gPiA+ICAgICBfX2Fsd2F5
c191bnVzZWQKPiA+ID4gICBtdGQ6IG5hbmQ6IHJhdzogY2FmZV9uYW5kOiBSZW1vdmUgc3VwZXJm
bHVvdXMgcGFyYW0gZG9jIGFuZCBhZGQKPiA+ID4gICAgIGFub3RoZXIKPiA+ID4gICBtdGQ6IG5h
bmQ6IHJhdzogczNjMjQxMDogQWRkIGRvY3VtZW50YXRpb24gZm9yIDIgbWlzc2luZyBzdHJ1Y3QK
PiA+ID4gICAgIG1lbWJlcnMKPiA+ID4gICBtdGQ6IG5hbmQ6IHJhdzogb21hcF9lbG06IEZpbmlz
aCBoYWxmIHBvcHVsYXRlZCBmdW5jdGlvbiBoZWFkZXIsCj4gPiA+ICAgICBkZW1vdGUgZW1wdHkg
b25lcwo+ID4gPiAgIG10ZDogbmFuZDogcmF3OiBvbWFwMjogRml4IGEgYnVuY2ggb2Yga2VybmVs
LWRvYyBtaXNkZW1lYW5vdXJzCj4gPiA+ICAgbXRkOiBuYW5kOiByYXc6IHN1bnhpX25hbmQ6IERv
Y3VtZW50ICdzdW54aV9uZmMncyAnY2FwcycgbWVtYmVyCj4gPiA+ICAgbXRkOiBuYW5kOiByYXc6
IGFyYXNhbi1uYW5kLWNvbnRyb2xsZXI6IERvY3VtZW50ICdhbmZjX29wJ3MgJ2J1ZicKPiA+ID4g
ICAgIG1lbWJlcgo+ID4gPiAgIG10ZDogbmFuZDogb25lbmFuZDogb25lbmFuZF9iYXNlOiBGaXgg
c29tZSBrZXJuZWwtZG9jIG1pc2RlbWVhbm91cnMKPiA+ID4gICBtdGQ6IGRldmljZXM6IHBvd2Vy
bnZfZmxhc2g6IEFkZCBmdW5jdGlvbiBuYW1lcyB0byBoZWFkZXJzIGFuZCBmaXgKPiA+ID4gICAg
ICdkZXYnICAKPiA+IAo+ID4gTWF5IEkgYXNrOyB3aGF0IGlzIHRoZSBwbGFuIGZvciB0aGVzZSBw
YXRjaGVzIHBsZWFzZT8KPiA+IAo+ID4gRG8geW91IHBsYW4gb24gdGFraW5nIHRoZSBvbmVzIHRo
YXQgZG8gbm90IHJlcXVpcmUgcmUtd29yaywgcmF0aGVyCj4gPiB0aGFuIGZpeGluZyB1cCBhbmQg
cmUtc3VibWl0dGluZyB0aGUgd2hvbGUgc2V0LiAgSXQgd291bGQgY2VydGFpbmx5Cj4gPiBzYXZl
IGEgbG90IG9mIG1haWxpbmcgbGlzdCBjaHVybiBpZiB0aGF0IHdlcmUgdGhlIGNhc2UuCj4gPiAK
PiA+IEVpdGhlciB3YXksIGxldCBtZSBrbm93IGFuZCBJIHdpbGwgYWJpZGUgYnkgeW91ciBkZWNp
c2lvbi4KPiA+IAo+IAo+IEkgd291bGQgcHJlZmVyIHJlY2VpdmluZyBhIHYyIHdpdGggYWxsIHRo
ZSBwYXRjaGVzIGlmIHlvdSBkb24ndCBtaW5kLgoKTm8gcHJvYmxlbS4gIEp1c3Qgc28gbG9uZyBh
cyBJIGtub3cuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVh
ZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
