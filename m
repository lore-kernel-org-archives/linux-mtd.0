Return-Path: <SRS0=LI9S=HF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C64C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 10:12:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCE5064F59
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 10:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCE5064F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lmbI0toqIjlJJN+akNjoQ8KWzrE8chnlI7rTWVNGs04=; b=WtZALB1SDdeiB/izfF6CrY8Io
	ZK4etvTS674aNmYN+eNU3EaMfJU4BmkB8Ln1CW8ZHW++y0HjxGF+OARFumUiTNAWv7vsFdkaArMxG
	6kEOCmo8k9/afWKPHpLPS0+16fF6Xtxop6G2c0ZgnCnn2PqUgOsUNVLbLB+aP7JnUGvebLvyaLbnd
	VHxw1VjYH+veQ6RcNRgjQKLaVBAFKH7nT020ZEpRMDy6SgGY7yDqbyJ6hvj4bvqfJbbnoGl9T5+OE
	TcnKyrc1+Q/AWTG5Lk5EexHSZ+7sWtx3JOAOmttZNuo9B8/QbYvNz7VMol3aDtnmlz1pKlWBVNjoV
	5Q3Ul5Q4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7F8x-0001EH-Nq; Wed, 03 Feb 2021 10:12:15 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7F8v-0001Di-Di
 for linux-mtd@lists.infradead.org; Wed, 03 Feb 2021 10:12:14 +0000
Received: by mail-pg1-x52b.google.com with SMTP id o16so17013575pgg.5
 for <linux-mtd@lists.infradead.org>; Wed, 03 Feb 2021 02:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=Jj5P/+FGKB+Gx/8nToaLLeEz9vFqyWcYXQiDNxG9J9c=;
 b=m5IL6Z7rCQYN/Fj8ZKWDB8gQoOgWX6QRwxPqBgNFcyGr45TD20iVxc0EqHk+JbBscm
 Oe3G0AgcSOHjcjkUlQY8AShMbWE4/wPzGpASS3wssxEzKBzN75giqDQZBLPIP+evMnG+
 a0zU7aInwHO2DJBPZexzCRonTzRqlDHz/GBcCYTFkoMDyWVek4PzMtqmMcsm4h8nPgPe
 Cl3qR203m5WUtsxLGV7hswqtoeycf3HrnMBHYPD/g3IQcSUFIznuNyb2KERjxNZFxYXU
 idO5YBEKAXLpsaoJYDS5A3qyI9YWmo0FeJZXhkX6mreOX9O/TvpN34RL7vz4OSa5wRjm
 qRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=Jj5P/+FGKB+Gx/8nToaLLeEz9vFqyWcYXQiDNxG9J9c=;
 b=ULJQIxMQNvjfYQxnkg3JQjIBU1ogjzqManB3haq57nXPSr4+UIOFjlOqScg9WDoMNh
 1pCoXr7dzD7D8iSgJGPktEVgRniSPvKkI3HI9sLqELmjD4wwq2PCp/aOrECtUCVPV4o+
 /V2Sv+vVVog7pbasUD3UpA6JwbqAJWy3EDHj+4cg1Nqs9SUHnooKjEuIyhGB+r9EuDx1
 +5ASrPqmnLIw6wdlbARayFQ19RwBj7jrO7JJPW4w4mn85JcHQTMr6nP/atAxKkRZZevn
 6C+96H6i4T92pZq7B5zS+dZ6UYQK49OMDaC6Jx9Zfz+aNBMCgxbBBajz86bb3G+MbuSe
 fH9w==
X-Gm-Message-State: AOAM530kZjxDLL2E5/Bc93KfB4JY0qOIq3Q+8vqzGWZMl6OTxYTwir0Q
 S6cjXLxdYjSNmUoWw9GUbaGz
X-Google-Smtp-Source: ABdhPJz/JdTHb2LWEEGIyYASRUhlaQG7crk7c3TVHaxEj38YS7W8P72bn162d6OF16rO8b9q0C/ZyQ==
X-Received: by 2002:a62:1dd7:0:b029:1be:ef0d:9507 with SMTP id
 d206-20020a621dd70000b02901beef0d9507mr2424246pfd.62.1612347131212; 
 Wed, 03 Feb 2021 02:12:11 -0800 (PST)
Received: from ?IPv6:2409:4072:619f:ff99:700b:51f3:e28:b00?
 ([2409:4072:619f:ff99:700b:51f3:e28:b00])
 by smtp.gmail.com with ESMTPSA id dw23sm1688325pjb.3.2021.02.03.02.12.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 02:12:10 -0800 (PST)
Date: Wed, 03 Feb 2021 15:42:02 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20210203110522.12f2b326@xps13>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
 <20210201151824.5a9dca4a@xps13> <20210202041614.GA840@work>
 <20210202091459.0c41a769@xps13>
 <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
 <20210203110522.12f2b326@xps13>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
To: Miquel Raynal <miquel.raynal@bootlin.com>
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_051213_500090_31A2CA8D 
X-CRM114-Status: GOOD (  24.41  )
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

SGkgTWlxdWVsLCAKCk9uIDMgRmVicnVhcnkgMjAyMSAzOjM1OjIyIFBNIElTVCwgTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj5IaSBNYW5pdmFubmFuLAo+
Cj5NYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3Jn
PiB3cm90ZSBvbiBXZWQsCj4wMyBGZWIgMjAyMSAxNToyODoyMCArMDUzMDoKPgo+PiBIaSBNaXF1
ZWwsIAo+PiAKPj4gT24gMiBGZWJydWFyeSAyMDIxIDE6NDQ6NTkgUE0gSVNULCBNaXF1ZWwgUmF5
bmFsCj48bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4+ID5IaSBNYW5pdmFubmFu
LAo+PiA+Cj4+ID5NYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBs
aW5hcm8ub3JnPiB3cm90ZSBvbgo+VHVlLAo+PiA+MiBGZWIgMjAyMSAwOTo0NjoxNCArMDUzMDoK
Pj4gPiAgCj4+ID4+IEhpLAo+PiA+PiAKPj4gPj4gT24gTW9uLCBGZWIgMDEsIDIwMjEgYXQgMDM6
MTg6MjRQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+PiA+PiA+IEhpIE1hbml2YW5u
YW4sCj4+ID4+ID4gCj4+ID4+ID4gTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNh
ZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGUKPm9uICAKPj4gPlNhdCwgIAo+PiA+PiA+IDMwIEph
biAyMDIxIDA5OjI0OjEyICswNTMwOgo+PiA+PiA+ICAgICAKPj4gPj4gPiA+IFRoZSBiYnQgcG9p
bnRlciB3aWxsIGJlIHVuYXZhaWxhYmxlIHdoZW4gTkFORF9TS0lQX0JCVFNDQU4KPm9wdGlvbiAg
Cj4+ID5pcyAgCj4+ID4+ID4gPiBzZXQgZm9yIGEgTkFORCBjaGlwLiBUaGUgaW50ZW50aW9uIGlz
IHRvIHNraXAgc2Nhbm5pbmcgZm9yIHRoZQo+IAo+PiA+YmFkICAKPj4gPj4gPiA+IGJsb2NrcyBk
dXJpbmcgYm9vdCB0aW1lLiAgICAKPj4gPj4gPiAKPj4gPj4gPiBJIGRvbid0IGhhdmUgdGhlIHNh
bWUgdW5kZXJzdGFuZGluZzogdGhpcyBmbGFnIHNraXBzIHRoZSBiYWQKPmJsb2NrCj4+ID4+ID4g
dGFibGUgc2Nhbiwgbm90IHRoZSBiYWQgYmxvY2sgc2Nhbi4gV2UgZG8gd2FudCB0byBzY2FuIGFs
bCB0aGUgIAo+PiA+ZGV2aWNlcyAgCj4+ID4+ID4gaW4gb3JkZXIgdG8gY29uc3RydWN0IGEgUkFN
IGJhc2VkIHRhYmxlLgo+PiA+PiA+ICAgICAKPj4gPj4gPiA+IEhvd2V2ZXIsIHRoZSBNVEQgY29y
ZSB3aWxsIGNhbGwKPj4gPj4gPiA+IF9ibG9ja19pc3Jlc2VydmVkKCkgYW5kIF9ibG9ja19pc2Jh
ZCgpIGNhbGxiYWNrcwo+dW5jb25kaXRpb25hbGx5ICAKPj4gPmZvciAgCj4+ID4+ID4gPiB0aGUg
cmF3bmFuZCBkZXZpY2VzIGR1ZSB0byB0aGUgY2FsbGJhY2tzIGFsd2F5cyBwcmVzZW50IHdoaWxl
IAo+Cj4+ID5jb2xsZWN0aW5nICAKPj4gPj4gPiA+IHRoZSBlY2Mgc3RhdHMuCj4+ID4+ID4gPiAK
Pj4gPj4gPiA+IFRoZSBfYmxvY2tfaXNyZXNlcnZlZCgpIGNhbGxiYWNrIGZvciByYXduYW5kIHdp
bGwgYmFpbCBvdXQgaWYKPmJidAo+PiA+PiA+ID4gcG9pbnRlciBpcyBub3QgYXZhaWxhYmxlLiBC
dXQgX2Jsb2NrX2lzYmFkKCkgd2lsbCBjb250aW51ZSAgCj4+ID53aXRob3V0ICAKPj4gPj4gPiA+
IGNoZWNraW5nIGZvciBpdC4gU28gdGhpcyBjb250cmFkaWN0cyB3aXRoIHRoZQo+TkFORF9TS0lQ
X0JCVFNDQU4gIAo+PiA+b3B0aW9uICAKPj4gPj4gPiA+IHNpbmNlIHRoZSBiYWQgYmxvY2sgY2hl
Y2sgd2lsbCBoYXBwZW4gYW55d2F5cyAoaWUuLCBub3QgbXVjaCAgCj4+ID5kaWZmZXJlbmNlICAK
Pj4gPj4gPiA+IGJldHdlZW4gc2Nhbm5pbmcgZm9yIGJhZCBibG9ja3MgYW5kIGNoZWNraW5nIGVh
Y2ggYmxvY2sgZm9yCj5iYWQgIAo+PiA+b25lcykuICAKPj4gPj4gPiA+IAo+PiA+PiA+ID4gSGVu
Y2UsIGRvIG5vdCBjaGVjayBmb3IgdGhlIGJhZCBibG9jayBpZiBiYnQgcG9pbnRlciBpcyAgCj4+
ID51bmF2YWlsYWJsZS4gICAgCj4+ID4+ID4gCj4+ID4+ID4gTm90IGNoZWNraW5nIGZvciBiYWQg
YmxvY2tzIGF0IGFsbCBmZWVscyBpbnNhbmUuIEkgZG9uJ3QgcmVhbGx5Cj5nZXQgIAo+PiA+dGhl
ICAKPj4gPj4gPiBzY29wZSBhbmQgZ29hbCBvZiBzdWNoIGNoYW5nZT8KPj4gPj4gPiAgICAgCj4+
ID4+IAo+PiA+PiBUaGUgaXNzdWUgSSBlbmNvdW50ZXJlZCBpcywgb24gdGhlIFRlbGl0IEZOOTgw
IGRldmljZSBvbmUgb2YgdGhlCj4+ID4+IHBhcnRpdGlvbiBzZWVtcyB0byBiZSBwcm90ZWN0ZWQu
IFNvIHRyeWluZyB0byByZWFkIHRoZSBiYWQgYmxvY2tzCj5pbgo+PiA+PiB0aGF0IHBhcnRpdGlv
biBtYWtlcyB0aGUgZGV2aWNlIHRvIHJlYm9vdCBkdXJpbmcgYm9vdC4gIAo+PiA+Cj4+ID5vX08K
Pj4gPgo+PiA+UmVhZGluZyBhIHByb3RlY3RlZCBibG9jayBtYWtlcyB0aGUgZGV2aWNlIHRvIHJl
Ym9vdD8KPj4gPgo+PiA+V2hhdCBpcyB0aGUgZXhhY3QgZGV2aWNlPyBDYW4geW91IHNoYXJlIHRo
ZSBkYXRhc2hlZXQ/IElzIHRoaXMKPmJlaGF2aW9yCj4+ID5leHBlY3RlZD8gQmVjYXVzZSBpdCBz
ZWVtcyByZWFsbHkgYnJva2VuIHRvIG1lLCBhIHJlYWQgc2hvdWxkIG5vdAo+PiA+dHJpZ2dlciAq
YW55dGhpbmcqIHRoYXQgYmFkLgo+PiA+ICAKPj4gCj4+IEkgZ290IG1vcmUgaW5mb3JtYXRpb24g
ZnJvbSB0aGUgdmVuZG9yLCBUZWxpdC4gVGhlIGFjY2VzcyB0byB0aGUgM3JkCj5wYXJ0aXRpb24g
aXMgcHJvdGVjdGVkIGJ5IFRydXN0em9uZSBhbmQgYW55IGFjY2VzcyBpbiBub24gcHJpdmlsZWdl
ZAo+bW9kZSAod2hlcmUgTGludXgga2VybmVsIHJ1bnMpIGNhdXNlcyBrZXJuZWwgcGFuaWMgYW5k
IHRoZSBkZXZpY2UKPnJlYm9vdHMuIAo+Cj5Paywgc28gdGhpcyBpcyBub3QgYSBjaGlwIGZlYXR1
cmUgYnV0IG1vcmUgYSBob3N0IGNvbnN0cmFpbnQuCj4KPkluIHRoaXMgY2FzZSBpdCB3b3VsZCBi
ZSBhIGdvb2QgaWRlYSB0byBhZGQgYSBob3N0IERUIHByb3BlcnR5IHdoaWNoCj5kZXNjcmliZXMg
dGhlIHpvbmUgdG8gYXZvaWQgYWNjZXNzaW5nIGl0LiBTb21ldGhpbmcgbGlrZToKPgo+CXNlY3Vy
ZS1hcmVhL3NlY3VyZS1zZWN0aW9uID0gPHN0YXJ0IGxlbmd0aD47Cj4KPkZyb20gdGhlIGNvcmUg
cGVyc3BlY3RpdmUsIHdlIHNob3VsZCBwYXJzZSB0aGlzIHByb3BlcnR5IGVhcmx5IGVub3VnaAo+
YW5kIHJldHVybiAtRUlPIHdoZW4gdHJ5aW5nIHRvIGFjY2VzcyB0aGlzIGFyZWEuCj4KPkRvZXMg
dGhpcyBzb2x1dGlvbiBzb3VuZCByZWFzb25hYmxlIHRvIHlvdT8KPgoKVGhpcyBzb3VuZHMgZ29v
ZCB0byBtZS4gSSdsbCBnaXZlIGl0IGEgZ28gYW5kIHNoYXJlIHRoZSBwYXRjaCBzb29uLiAKClRo
YW5rcywgCk1hbmkKCj5UaGFua3MsCj5NaXF1w6hsCgotLSAKU2VudCBmcm9tIG15IEFuZHJvaWQg
ZGV2aWNlIHdpdGggSy05IE1haWwuIFBsZWFzZSBleGN1c2UgbXkgYnJldml0eS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
