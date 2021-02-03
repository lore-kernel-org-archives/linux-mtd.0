Return-Path: <SRS0=LI9S=HF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED27C433E9
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 09:59:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CDF164DD4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 09:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CDF164DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=otCoVfIy5Zw+3/biDuohKQxew0MBmzKg2ZRJ86X+SKI=; b=g+HnVg6FJCheM5+wNAhXubZNJ
	dq6TCuwFejjqNiCk7Cx8+sq+2vRibLeMsu6EdRwoBAixWwXf0JE81scX/75u2nT54k29Oe1Aoij7L
	Rg+3/oDab1nPrLlGuP1D/jJO8LMOJ3Ja1P0/vkB81FltneblsGq7N8RayeJuxwxdG1+VywbH2Lhf1
	/mmC2ChMJtsDBVvuy88TWOequZvG5YYwme/ZRN2ylaJh9zmjYef8NyQH4Sa0ZFMXbQKnIhIQedcrd
	gBvYQED1o3u2GnU4kyU6Nlkb45fJi9KYuJUk7aUEv9nFKktfHt1q2/UN5ZxO1/yFbG8uNPMktcWzh
	LkOEpOGBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Evo-0007kc-9M; Wed, 03 Feb 2021 09:58:40 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Evl-0007jF-1R
 for linux-mtd@lists.infradead.org; Wed, 03 Feb 2021 09:58:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id 8so8803384plc.10
 for <linux-mtd@lists.infradead.org>; Wed, 03 Feb 2021 01:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=tR+G7Q6qy+w2gVQ0L8qty7WAI5dbfh28qP7V9Bl0sVM=;
 b=h6Wm4+Nvi2OFd2L/+MLZDH+2nEqhNf74r80EBIgLSv0ms6w+bmxwA5TeJ9ggtJTROH
 V51XdUWFDwjMav+l5l9BtYvrxXWUB84sXqg8SvFGzmNq7+KTGcsSXt6ENtaJO/okd7Bo
 jB9Uw+TgBymeuyjYIWMTlPsP2QD0RGPq8qrXhV5Jp74qeBCdN0w5nNN1+4yLjJjZOatq
 jEhlTQKbfWbkKi+u4JmWzjaDvGp7OYREq+3xPZ+se2cwcodBOQKQwFDTBl8vqzx7j2nH
 4LUI+63oZl0OA4p2owNWAQualpjsjkHQ+ur3tZTzEzxiuurDm75GTRVGt43TMHlXxJyv
 3msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=tR+G7Q6qy+w2gVQ0L8qty7WAI5dbfh28qP7V9Bl0sVM=;
 b=Q1BlrC2CewLW23FdXYqt3zwZdLpsUtiWQM5EUBCxbpoxVHf4GvMvz5k7B2Gb9cZp4L
 R4lTbSr09bSWngBx2TdQ72HTOZubVl+4URTilBxebWllli9VB9vVmzoazMkbAHZilgYY
 1kXiZjhLoYHad1VGPIrA4IUXFxeuY+5M+gsqDmBNoLGEN9rrN+/M5Y92h3T8qDmECe/O
 MUKsoDg1qydbZ5q6xFGGM+VsA0lBoGEPmqlsFLji39oB0O784GuXGZc+DvsHG47FAHdE
 hcJWrB5SuNlQ6R/+fihnX4hgJi5sqjVWR3MVLpNb7eVQGg99RvgjxRuB2mJx9YmBQz7u
 ydvg==
X-Gm-Message-State: AOAM532XYRpsc/11YkD8Lm3/LTVGLjTYJSa15/e72UkTyqlt05XIB8Ar
 L1tdo147AATz52qjysyuHLzR
X-Google-Smtp-Source: ABdhPJyJnj/p+vUxeLJVxxvYCzer11toJefI++DZ8naeSh+0UEIWEUfHodTEVNS3228qK1N99sRZvg==
X-Received: by 2002:a17:90b:4ac8:: with SMTP id
 mh8mr2530284pjb.38.1612346307909; 
 Wed, 03 Feb 2021 01:58:27 -0800 (PST)
Received: from ?IPv6:2409:4072:619f:ff99:700b:51f3:e28:b00?
 ([2409:4072:619f:ff99:700b:51f3:e28:b00])
 by smtp.gmail.com with ESMTPSA id x184sm1941480pfb.199.2021.02.03.01.58.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 01:58:26 -0800 (PST)
Date: Wed, 03 Feb 2021 15:28:20 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20210202091459.0c41a769@xps13>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
 <20210201151824.5a9dca4a@xps13> <20210202041614.GA840@work>
 <20210202091459.0c41a769@xps13>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
To: Miquel Raynal <miquel.raynal@bootlin.com>
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_045837_175306_4CEA6349 
X-CRM114-Status: GOOD (  26.08  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLCAKCk9uIDIgRmVicnVhcnkgMjAyMSAxOjQ0OjU5IFBNIElTVCwgTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj5IaSBNYW5pdmFubmFuLAo+
Cj5NYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3Jn
PiB3cm90ZSBvbiBUdWUsCj4yIEZlYiAyMDIxIDA5OjQ2OjE0ICswNTMwOgo+Cj4+IEhpLAo+PiAK
Pj4gT24gTW9uLCBGZWIgMDEsIDIwMjEgYXQgMDM6MTg6MjRQTSArMDEwMCwgTWlxdWVsIFJheW5h
bCB3cm90ZToKPj4gPiBIaSBNYW5pdmFubmFuLAo+PiA+IAo+PiA+IE1hbml2YW5uYW4gU2FkaGFz
aXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uCj5TYXQsCj4+
ID4gMzAgSmFuIDIwMjEgMDk6MjQ6MTIgKzA1MzA6Cj4+ID4gICAKPj4gPiA+IFRoZSBiYnQgcG9p
bnRlciB3aWxsIGJlIHVuYXZhaWxhYmxlIHdoZW4gTkFORF9TS0lQX0JCVFNDQU4gb3B0aW9uCj5p
cwo+PiA+ID4gc2V0IGZvciBhIE5BTkQgY2hpcC4gVGhlIGludGVudGlvbiBpcyB0byBza2lwIHNj
YW5uaW5nIGZvciB0aGUKPmJhZAo+PiA+ID4gYmxvY2tzIGR1cmluZyBib290IHRpbWUuICAKPj4g
PiAKPj4gPiBJIGRvbid0IGhhdmUgdGhlIHNhbWUgdW5kZXJzdGFuZGluZzogdGhpcyBmbGFnIHNr
aXBzIHRoZSBiYWQgYmxvY2sKPj4gPiB0YWJsZSBzY2FuLCBub3QgdGhlIGJhZCBibG9jayBzY2Fu
LiBXZSBkbyB3YW50IHRvIHNjYW4gYWxsIHRoZQo+ZGV2aWNlcwo+PiA+IGluIG9yZGVyIHRvIGNv
bnN0cnVjdCBhIFJBTSBiYXNlZCB0YWJsZS4KPj4gPiAgIAo+PiA+ID4gSG93ZXZlciwgdGhlIE1U
RCBjb3JlIHdpbGwgY2FsbAo+PiA+ID4gX2Jsb2NrX2lzcmVzZXJ2ZWQoKSBhbmQgX2Jsb2NrX2lz
YmFkKCkgY2FsbGJhY2tzIHVuY29uZGl0aW9uYWxseQo+Zm9yCj4+ID4gPiB0aGUgcmF3bmFuZCBk
ZXZpY2VzIGR1ZSB0byB0aGUgY2FsbGJhY2tzIGFsd2F5cyBwcmVzZW50IHdoaWxlCj5jb2xsZWN0
aW5nCj4+ID4gPiB0aGUgZWNjIHN0YXRzLgo+PiA+ID4gCj4+ID4gPiBUaGUgX2Jsb2NrX2lzcmVz
ZXJ2ZWQoKSBjYWxsYmFjayBmb3IgcmF3bmFuZCB3aWxsIGJhaWwgb3V0IGlmIGJidAo+PiA+ID4g
cG9pbnRlciBpcyBub3QgYXZhaWxhYmxlLiBCdXQgX2Jsb2NrX2lzYmFkKCkgd2lsbCBjb250aW51
ZQo+d2l0aG91dAo+PiA+ID4gY2hlY2tpbmcgZm9yIGl0LiBTbyB0aGlzIGNvbnRyYWRpY3RzIHdp
dGggdGhlIE5BTkRfU0tJUF9CQlRTQ0FOCj5vcHRpb24KPj4gPiA+IHNpbmNlIHRoZSBiYWQgYmxv
Y2sgY2hlY2sgd2lsbCBoYXBwZW4gYW55d2F5cyAoaWUuLCBub3QgbXVjaAo+ZGlmZmVyZW5jZQo+
PiA+ID4gYmV0d2VlbiBzY2FubmluZyBmb3IgYmFkIGJsb2NrcyBhbmQgY2hlY2tpbmcgZWFjaCBi
bG9jayBmb3IgYmFkCj5vbmVzKS4KPj4gPiA+IAo+PiA+ID4gSGVuY2UsIGRvIG5vdCBjaGVjayBm
b3IgdGhlIGJhZCBibG9jayBpZiBiYnQgcG9pbnRlciBpcwo+dW5hdmFpbGFibGUuICAKPj4gPiAK
Pj4gPiBOb3QgY2hlY2tpbmcgZm9yIGJhZCBibG9ja3MgYXQgYWxsIGZlZWxzIGluc2FuZS4gSSBk
b24ndCByZWFsbHkgZ2V0Cj50aGUKPj4gPiBzY29wZSBhbmQgZ29hbCBvZiBzdWNoIGNoYW5nZT8K
Pj4gPiAgIAo+PiAKPj4gVGhlIGlzc3VlIEkgZW5jb3VudGVyZWQgaXMsIG9uIHRoZSBUZWxpdCBG
Tjk4MCBkZXZpY2Ugb25lIG9mIHRoZQo+PiBwYXJ0aXRpb24gc2VlbXMgdG8gYmUgcHJvdGVjdGVk
LiBTbyB0cnlpbmcgdG8gcmVhZCB0aGUgYmFkIGJsb2NrcyBpbgo+PiB0aGF0IHBhcnRpdGlvbiBt
YWtlcyB0aGUgZGV2aWNlIHRvIHJlYm9vdCBkdXJpbmcgYm9vdC4KPgo+b19PCj4KPlJlYWRpbmcg
YSBwcm90ZWN0ZWQgYmxvY2sgbWFrZXMgdGhlIGRldmljZSB0byByZWJvb3Q/Cj4KPldoYXQgaXMg
dGhlIGV4YWN0IGRldmljZT8gQ2FuIHlvdSBzaGFyZSB0aGUgZGF0YXNoZWV0PyBJcyB0aGlzIGJl
aGF2aW9yCj5leHBlY3RlZD8gQmVjYXVzZSBpdCBzZWVtcyByZWFsbHkgYnJva2VuIHRvIG1lLCBh
IHJlYWQgc2hvdWxkIG5vdAo+dHJpZ2dlciAqYW55dGhpbmcqIHRoYXQgYmFkLgo+CgpJIGdvdCBt
b3JlIGluZm9ybWF0aW9uIGZyb20gdGhlIHZlbmRvciwgVGVsaXQuIFRoZSBhY2Nlc3MgdG8gdGhl
IDNyZCBwYXJ0aXRpb24gaXMgcHJvdGVjdGVkIGJ5IFRydXN0em9uZSBhbmQgYW55IGFjY2VzcyBp
biBub24gcHJpdmlsZWdlZCBtb2RlICh3aGVyZSBMaW51eCBrZXJuZWwgcnVucykgY2F1c2VzIGtl
cm5lbCBwYW5pYyBhbmQgdGhlIGRldmljZSByZWJvb3RzLiAKCj4+IFRoZXJlIHNlZW1zIHRvIGJl
IG5vIGZsYWcgcGFzc2VkIGJ5IHRoZSBwYXJzZXIgZm9yIHRoaXMgcGFydGl0aW9uLiBTbwo+PiB0
aGUgb25seSB3YXkgSSBjb3VsZCBsZXQgdGhlIGRldmljZSB0byBib290IGlzIHRvIGNvbXBsZXRl
bHkgc2tpcCB0aGUKPj4gYmFkIGJsb2NrIGNoZWNrLgo+Cj5XZSBkbyBoYXZlIGEgImxvY2siIHBy
b3BlcnR5IHdoaWNoIGluZm9ybXMgdGhlIGhvc3QgdG8gZmlyc3QgdW5sb2NrIHRoZQo+ZGV2aWNl
LCB3b3VsZCB0aGlzIGhlbHA/IElzIHRoaXMgbG9ja2luZyByZXZlcnNpYmxlPwo+Cj4+IEFGQUlL
LCBNVEQgY29yZSBvbmx5IHN1cHBvcnRzIGNoZWNraW5nIGZvciB0aGUgcmVzZXJ2ZWQgYmxvY2tz
IHRvIGJlCj4+IHVzZWQgZm9yIEJCTSBhbmQgdGhlcmUgaXMgbm8gd2F5IHRvIGNoZWNrIGZvciBh
IHJlc2VydmVkIHBhcnRpdGlvbgo+bGlrZQo+PiB0aGlzLgo+Cj5JdCBzb3VuZHMgbGlrZSBhIGNo
aXAgc3BlY2lmaWNpdHkvYnVnLCB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIGFkZCBhCj5zcGVjaWZp
YyB2ZW5kb3IgaW1wbGVtZW50YXRpb24gZm9yIHRoYXQ/Cj4KClNvIGxvb2tzIGxpa2UgdGhpcyBp
cyBhIHZlbmRvciBxdWlyayBidXQgdGhpcyBjYXNlIG1pZ2h0IGFyaXNlIGluIGZ1dHVyZSBmb3Ig
b3RoZXIgcGxhdGZvcm1zIGFzIHdlbGwuIAoKVGhhbmtzLCAKTWFuaQoKPj4gSSBhZ3JlZSB0aGF0
IHNraXBwaW5nIGJhZCBibG9jayBjaGVjayBpcyBub3QgYSBzYW5lIHdheSBidXQgSSBkb24ndAo+
a25vdwo+PiBhbnkgb3RoZXIgd2F5IHRvIGhhbmRsZSB0aGlzIHByb2JsZW0uCj4+IAo+PiBUaGFu
a3MsCj4+IE1hbmkKPj4gCj4KPlRoYW5rcywKPk1pcXXDqGwKCi0tIApTZW50IGZyb20gbXkgQW5k
cm9pZCBkZXZpY2Ugd2l0aCBLLTkgTWFpbC4gUGxlYXNlIGV4Y3VzZSBteSBicmV2aXR5LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
