Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D69C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 07:08:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751466103E
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 07:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 751466103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dR3g08V45WQnkOWVepDDBIOgabNOpFGGGm6GXw/k4ig=; b=xTVd8X8lJdNUAM5RtvcQ9QPfaf
	JAIPpIZvnydHOtKK13T2mOjsNclRvFo1InEGw1+TverAd8RZAXJogI1m0UKs8mq5TOrY7jRaaSTHg
	zjbTVFzZF8j5k1nvVtxv+u2ou3t4CqOab4mgttWKRM59msBR5Ih6pwGhP8FudKFB8nX9EEZU01nsg
	cCiRy13XQZAP96b4qxvRfFC1Gie96ZjWgVuwgepGuBi/FayNTAv2/iZX/1qg/ThCSC+fuWDMTqLMC
	1XISMK10d6wJSW9YIvkkMULU14kJbAKYvFnC4p5QMmca41aK+xOK5nDDjR5LyW2Oa0fNdhljvL6vr
	yzNA7otg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNVCZ-002f3V-CW; Tue, 07 Sep 2021 07:07:27 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNVCU-002f0x-Ny
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 07:07:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630998444; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6Xh+4WrtgpRuYe7a5VffIuD9Uyie8k3UdTu61v/dacM=;
 b=RPSaXVPmOjTqUecqww4vhzQ3v2s6KpgozpAFi5Tnf6PwEWF7eaNBm0d4hoPBQ7AC/R3FWm3s
 wuLYlPyLynKeYbpgzfZ+o2rOE1PjMuNyIbYFoGqh208O9WJGocln69DnqzTD+9EpXKibE0z8
 WVUcBBhTsqQ+vJN7xeaf4MA3MRE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61370fa340d2129ac15e8240 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Sep 2021 07:07:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 95272C4361A; Tue,  7 Sep 2021 07:07:15 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A8767C43460;
 Tue,  7 Sep 2021 07:07:14 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 07 Sep 2021 12:37:14 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org, stable@kernel.org
Subject: Re: [PATCH V5] mtd: rawnand: qcom: Update code word value for raw read
In-Reply-To: <20210907084844.1ad92ef1@xps13>
References: <1630996771-29866-1-git-send-email-mdalam@codeaurora.org>
 <20210907084844.1ad92ef1@xps13>
Message-ID: <d351bff49b8438186f849214bb133abd@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_000724_715694_27851DEA 
X-CRM114-Status: GOOD (  17.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wOS0wNyAxMjoxOCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBtZGFsYW1AY29kZWF1
cm9yYS5vcmcgd3JvdGUgb24gVHVlLCAgNyBTZXAgMjAyMSAxMjowOTozMSArMDUzMDoKPiAKPj4g
RnJvbSBRUElDIFYyIG9ud2FyZHMgdGhlcmUgaXMgYSBzZXBhcmF0ZSByZWdpc3RlciB0byByZWFk
Cj4+IGxhc3QgY29kZSB3b3JkICJRUElDX05BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXX24iLgo+
PiAKPj4gcWNvbV9uYW5kY19yZWFkX2N3X3JhdygpIGlzIHVzZWQgdG8gcmVhZCBvbmx5IG9uZSBj
b2RlIHdvcmQKPj4gYXQgYSB0aW1lLiBJZiB3ZSB3aWxsIGNvbmZpZ3VyZSBudW1iZXIgb2YgY29k
ZSB3b3JkcyB0byAxIGluCj4+IGluIFFQSUNfTkFORF9ERVYwX0NGRzAgcmVnaXN0ZXIgdGhlbiBR
UElDIGNvbnRyb2xsZXIgdGhpbmtzCj4+IGl0cyByZWFkaW5nIHRoZSBsYXN0IGNvZGUgd29yZCwg
c2luY2UgZnJvbSBRUElDIFYyIG9ud2FyZHMKPj4gd2UgYXJlIGhhdmluZyBzZXBhcmF0ZSByZWdp
c3RlciB0byByZWFkIHRoZSBsYXN0IGNvZGUgd29yZCwKPj4gd2UgaGF2ZSB0byBjb25maWd1cmUg
IlFQSUNfTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiIKPj4gcmVnaXN0ZXIgdG8gZmV0Y2gg
ZGF0YSBmcm9tIGNvbnRyb2xsZXIgYnVmZmVyIHRvIHN5c3RlbQo+PiBtZW1vcnkuCj4+IAo+PiBG
aXhlczogNTAzZWU1YWFkNDMwNTRhMjZjZmQ1Y2M1OTJhMzEyNzBjMDU1MzljZCAoIm10ZDogcmF3
bmFuZDogcWNvbTogCj4+IHVwZGF0ZSBsYXN0IGNvZGUgd29yZCByZWdpc3RlciIpCj4gCj4gU3Rp
bGwgd3JvbmcuIEl0J3MgMTIgZGlnaXRzLCBhcyByZXBvcnRlZCBieSBNYW5pdmFubmFuLgoKICAg
VXBkYXRlZCBpbiBwYXRjaCBWNi4KPiAKPj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnCj4+IFNpZ25l
ZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4KPj4gLS0tCj4+
IENoYW5nZXMgaW4gVjU6Cj4+IAo+PiAgKiBJbmNvcnBvcmF0ZWQgImhhc2ggY29tbWl0IiBjb21t
ZW50IGZyb20gTWFuaS4KPj4gICogVXBkYXRlZCBjb21taXQgaGFzaAo+PiAKPj4gQ2hhbmdlcyBp
biBWNDoKPj4gCj4+ICAqIEluY29ycG9yYXRlZCAiQ2hhbmdlIGxvZyIgY29tbWVudCBmcm9tIE1p
cXXDqGwKPj4gICogVXBkYXRlZCBjaGFuZ2UgbG9nCj4+IAo+PiBDaGFuZ2VzIGluIFYzOgo+PiAK
Pj4gICogSW5jb3Jwb3JhdGVkICJGaXhlcyB0YWdzIGFyZSBtaXNzaW5nIiBjb21tZW50IGZyb20g
TWlxdcOobAo+PiAgKiBBZGRlZCBGaXhlcyB0YWcgRml4ZXM6NTAzZWU1YWEgKCJtdGQ6IHJhd25h
bmQ6IHFjb206IHVwZGF0ZSBsYXN0IAo+PiBjb2RlIHdvcmQgcmVnaXN0ZXIiKQo+PiAKPj4gCj4+
IENoYW5nZXMgaW4gVjI6Cj4+IAo+PiAgKiBJbmNvcnBvcmF0ZWQgInN0YWJsZSB0YWdzIGFyZSBt
aXNzaW5nIiBjb21tZW50IGZyb20gTWlxdcOobAo+PiAgKiBBZGRlZCBzdGFibGUgdGFncyBDYzpz
dGFibGVAa2VybmVsLm9yZwo+PiAKPj4gCj4+IAo+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jIHwgOCArKysrKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9xY29tX25hbmRjLmMgCj4+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+
IGluZGV4IGVmMGJhZGUuLjA0ZTZmN2IgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3Fjb21fbmFuZGMuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMKPj4gQEAgLTE2NzYsMTMgKzE2NzYsMTcgQEAgcWNvbV9uYW5kY19yZWFkX2N3X3JhdyhzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwgCj4+IHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4+ICAJc3RydWN0
IG5hbmRfZWNjX2N0cmwgKmVjYyA9ICZjaGlwLT5lY2M7Cj4+ICAJaW50IGRhdGFfc2l6ZTEsIGRh
dGFfc2l6ZTIsIG9vYl9zaXplMSwgb29iX3NpemUyOwo+PiAgCWludCByZXQsIHJlZ19vZmYgPSBG
TEFTSF9CVUZfQUNDLCByZWFkX2xvYyA9IDA7Cj4+ICsJaW50IHJhd19jdyA9IGN3Owo+PiAKPj4g
IAluYW5kX3JlYWRfcGFnZV9vcChjaGlwLCBwYWdlLCAwLCBOVUxMLCAwKTsKPj4gIAlob3N0LT51
c2VfZWNjID0gZmFsc2U7Cj4+IAo+PiArCWlmIChuYW5kYy0+cHJvcHMtPnFwaWNfdjIpCj4+ICsJ
CXJhd19jdyA9IGVjYy0+c3RlcHMgLSAxOwo+PiArCj4+ICAJY2xlYXJfYmFtX3RyYW5zYWN0aW9u
KG5hbmRjKTsKPj4gIAlzZXRfYWRkcmVzcyhob3N0LCBob3N0LT5jd19zaXplICogY3csIHBhZ2Up
Owo+PiAtCXVwZGF0ZV9yd19yZWdzKGhvc3QsIDEsIHRydWUsIGN3KTsKPj4gKwl1cGRhdGVfcndf
cmVncyhob3N0LCAxLCB0cnVlLCByYXdfY3cpOwo+PiAgCWNvbmZpZ19uYW5kX3BhZ2VfcmVhZChj
aGlwKTsKPj4gCj4+ICAJZGF0YV9zaXplMSA9IG10ZC0+d3JpdGVzaXplIC0gaG9zdC0+Y3dfc2l6
ZSAqIChlY2MtPnN0ZXBzIC0gMSk7Cj4+IEBAIC0xNzExLDcgKzE3MTUsNyBAQCBxY29tX25hbmRj
X3JlYWRfY3dfcmF3KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCAKPj4gc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCwKPj4gIAkJbmFuZGNfc2V0X3JlYWRfbG9jKGNoaXAsIGN3LCAzLCByZWFkX2xvYywgb29i
X3NpemUyLCAxKTsKPj4gIAl9Cj4+IAo+PiAtCWNvbmZpZ19uYW5kX2N3X3JlYWQoY2hpcCwgZmFs
c2UsIGN3KTsKPj4gKwljb25maWdfbmFuZF9jd19yZWFkKGNoaXAsIGZhbHNlLCByYXdfY3cpOwo+
PiAKPj4gIAlyZWFkX2RhdGFfZG1hKG5hbmRjLCByZWdfb2ZmLCBkYXRhX2J1ZiwgZGF0YV9zaXpl
MSwgMCk7Cj4+ICAJcmVnX29mZiArPSBkYXRhX3NpemUxOwo+IAo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
