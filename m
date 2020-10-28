Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67821C388F7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 18:25:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C2C247FF
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 18:25:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JiPdAxfm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="KjIlxDqq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C2C247FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jJAvsQ/u/4RcZFdte+A5Xh2gP5PAMyIsDoNrxjjq0EA=; b=JiPdAxfmFf/BXfWQ2FL9cVCxc
	okRBUjDDq0j4aCWE9RZXT/kY7An9+W360RDoK66xZLX6wpoKb5aNvuiiwzV+DLnn0lVDwCi51YuRQ
	M0qOm7Wy7cBoSLm+VtmRLdh7Qt7Xe8GKBl2Zb1GewlKdil6ZXazxpGVgMBkKJ0tUoTBqwDDOvDlIq
	f+PQkEsi+Gn/UrQPDTPCyhH7y93BOD32BrFSN1vTVvR7OPEYFQLwhsOEQTDLF1g2zQ4LhjA38LFw6
	J9Qq61PjAxUfn0WICEmqjl95Kay2X77zckwFIlSAnQHmar7A6L/Vh9jeoeLYSdqjyMf8XZHEeBnxG
	YMi82B8vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXq7a-0002G6-WA; Wed, 28 Oct 2020 18:24:31 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXq7W-0002FQ-KR
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 18:24:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603909465; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lvCzBP89PUcXDLkZrLQas8tpiINggPlX3IHCAMSWkpI=;
 b=KjIlxDqqYSn8q8Dfc7kCUsJDza2ZyI7FE/qa9c+DPcDOya8L2bKDRpGPzleCB75kE4Ljo1pb
 GQZ0x7LSNHPTmc8QVIt966rimskMr4e81EMSt6/7B0AN1aRu94kOmM0KUpuSMkEPJKj3EwFT
 LNFejWWtZqYEw2gTZp+FMDxKovE=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f99b75844ab0dcc4543635a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Oct 2020 18:24:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D279EC433C9; Wed, 28 Oct 2020 18:24:24 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0F22FC433CB;
 Wed, 28 Oct 2020 18:24:23 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 28 Oct 2020 23:54:23 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/5] mtd: rawnand: qcom: Add support for QSPI nand
In-Reply-To: <20201028104835.3dc31745@xps13>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <20201028104835.3dc31745@xps13>
Message-ID: <10db598eed716d7759bc0125b6977cf1@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_142426_841030_7FE065DD 
X-CRM114-Status: GOOD (  19.40  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, sricharan@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0xMC0yOCAxNToxOCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAKPiBN
ZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIFNhdCwgMTAgT2N0
IDIwMjAKPiAxMTowMTozNyArMDUzMDoKPiAKPj4gUVBJQyAyLjAgc3VwcG9ydHMgU2VyaWFsIE5B
TkQgc3VwcG9ydCBpbiBhZGRpdGlvbiB0byBhbGwgZmVhdHVyZXMgYW5kCj4+IGNvbW1hbmRzIGlu
IFFQSUMgMS4wIGZvciBwYXJhbGxlbCBOQU5ELiBQYXJhbGxlbCBhbmQgU2VyaWFsIE5BTkQgCj4+
IGNhbm5vdAo+PiBvcGVyYXRlIHNpbXVsdGFuZW91c2x5LiBRU1BJIG5hbmQgZGV2aWNlcyB3aWxs
IGNvbm5lY3QgdG8gUVBJQyAKPj4gSU9fTUFDUk8KPj4gYmxvY2sgb2YgUVBJQyBjb250cm9sbGVy
LiBUaGVyZSBpcyBhIHNlcGFyYXRlIElPX01BQ1JPIGNsb2NrIGZvciAKPj4gSU9fTUFDUk8KPj4g
YmxvY2suIERlZmF1bHQgSU9fTUFDUk8gYmxvY2sgZGl2aWRlIHRoZSBpbnB1dCBjbG9jayBieSA0
LiBzbyBpZiAKPj4gSU9fTUFDUk8KPj4gaW5wdXQgY2xvY2sgaXMgMzIwTUh6IHRoZW4gb24gYnVz
IGl0IHdpbGwgYmUgODBNSHosIHNvIFFTUEkgbmFuZCAKPj4gZGV2aWNlCj4+IHNob3VsZCBhbHNv
IHN1cHBvcnQgdGhpcyBmcmVxdWVuY3kuCj4+IAo+PiBRUElDIHByb3ZpZGVzIDQgZGF0YSBwaW5z
IHRvIFFTUEkgbmFuZC4gSW4gc3RhbmRhcmQgU1BJIG1vZGUgKHgxIG1vZGUpIAo+PiBkYXRhCj4+
IHRyYW5zZmVyIHdpbGwgb2NjdXIgb24gb25seSAyIHBpbnMgb25lIHBpbiBmb3IgU2VyaWFsIGRh
dGEgaW4gYW5kIG9uZSAKPj4gZm9yCj4+IHNlcmlhbCBkYXRhIG91dC4gSW4gUVVBRCBTUEkgbW9k
ZSAoeDQgbW9kZSkgZGF0YSB0cmFuc2ZlciB3aWxsIG9jY3VyIAo+PiBhdCBhbGwKPj4gdGhlIGZv
dXIgZGF0YSBsaW5lcy4gUVBJQyBjb250cm9sbGVyIHN1cHBvcnRzIGNvbW1hbmQgZm9yIHgxIG1v
ZGUgYW5kIAo+PiB4NCBtb2RlLgo+PiAKPj4gTWQgU2FkcmUgQWxhbSAoNSk6Cj4+ICAgZHQtYmlu
ZGluZ3M6IHFjb21fbmFuZGM6IElQUTUwMTggUVBJQyBOQU5EIGRvY3VtZW50YXRpb24KPj4gICBt
dGQ6IHJhd25hbmQ6IHFjb206IEFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHFzcGkgbmFuZAo+PiAg
IG10ZDogcmF3bmFuZDogcWNvbTogUmVhZCBRUElDIHZlcnNpb24KPj4gICBtdGQ6IHJhd25hbmQ6
IHFjb206IEVuYWJsZSBzdXBwb3J0IGZvciBlcmFzZSxyZWFkICYgd3JpdGUgZm9yIHNlcmlhbAo+
PiAgICAgbmFuZC4KPj4gICBtdGQ6IHJhd25hbmQ6IHFjb206IEFkZCBzdXBwb3J0IGZvciBzZXJp
YWwgdHJhaW5pbmcuCj4+IAo+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb21fbmFu
ZGMudHh0ICAgICAgICAgfCAgIDMgKwo+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMu
YyAgICAgICAgICAgICAgICAgICAgfCAgMTMgKwo+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jICAgICAgICAgICAgICAgICAgfCA1MDIgCj4+ICsrKysrKysrKysrKysrKysrKysr
LQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0OTQgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0p
Cj4+IAo+IAo+IEknbSBzb3JyeSBidXQgdGhpcyBzZXJpZXMgY2xlYXJseSBicmVha3MgdGhlIGN1
cnJlbnQgbGF5ZXJpbmcuIEkgY2Fubm90Cj4gYXV0aG9yaXplIFNQSS1OQU5EIGNvZGUgdG8gZmFs
bCBpbnRvIHRoZSByYXcgTkFORCBzdWJzeXN0ZW0uCj4gCgpJIGFtIGFncmVlIHdpdGggeW91LCB3
ZSBzaG91bGQgbm90IGFkZCBTUEktTkFORCBjaGFuZ2VzIGluc2lkZQpyYXcgTkFORCBzdWJzeXN0
ZW0uCgo+IEFzIGJvdGggdHlwb2xvZ2llcyBjYW5ub3QgYmUgdXNlZCBhdCB0aGUgc2FtZSB0aW1l
LCBJIGd1ZXNzIHlvdSBzaG91bGQKPiBoYXZlIGFub3RoZXIgZHJpdmVyIGhhbmRsaW5nIHRoaXMg
ZmVhdHVyZSB1bmRlciB0aGUgc3BpLyBzdWJzeXN0ZW0gKwo+IGEgZmV3IGRlY2xhcmF0aW9ucyBp
biB0aGUgU1BJLU5BTkQgZGV2aWNlcyBsaXN0Lgo+IAoKSW5pdGlhbGx5IEkgd2FzIHN0YXJ0ZWQg
d3JpdGluZyBzZXBhcmF0ZSBkcml2ZXIgdW5kZXIgU1BJLU5BTkQgc3Vic3lzdGVtIAp0aGVuIEkK
cmVhbGl6ZWQgdGhhdCBtb3JlIHRoYW4gODUlIG9mIHJhdy9xY29tX25hbmQuYyBjb2RlIGdldHRp
bmcgZHVwbGljYXRlZC4KClRoYXQncyB3aHkgSSBoYXZlIGFkZGVkIHRoaXMgU1BJLU5BTkQgY2hh
bmdlIGluIHJhdy9xY29tX25hbmQuYyBzaW5jZQptb3JlIHRoYW4gODUlIG9mIGNvZGUgd2lsbCBi
ZSByZXVzZWQuCgpJZiBJIHdpbGwgYWRkIHRoaXMgY2hhbmdlIGluc2lkZSBTUEktTkFORCBzdWJz
eXN0ZW0gdGhlbiBtdWNoIG9mCnJhdy9xY29tX25hbmQuYyBjb2RlIHdpbGwgZ2V0IGR1cGxpY2F0
ZWQuIFdvdWxkIGl0IGJlIG9rID8KCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
