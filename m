Return-Path: <SRS0=P3/5=NW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4746BC432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 08:59:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0725D604D7
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 08:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0725D604D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e54Yyx24R7abb6obkhEJ7S1FSgiGoKHpOOd58+FDZtY=; b=ttHZ7llH37PRFXiKjqR+yyaf0b
	wUxwf2C7scHt5odo4IxpsFGlhOktQRtqd8f9gAlPWOKPze1cr09S1R4u8zTXLi6rf/AEa4j+7otMl
	Hr/cnr1oXfifSp981YJirSyN2m4SKsTN313Img8j7vtJ59iB6O3fdyw0hnFh2LpfT2SV83FJRV9qN
	vrYlpArjePNTFzYAgRg5JWkzDeb6kN2OmYNg8dlsJjrPmWcGuYCN/ix+f8oxLOH2uB/6T+Nk7Vt3D
	o0ZTSz60Nn7u8mKN+TwLUIn+epXKDqky15aR5bUeZ833mIJQUHfLm8i7L1gInaokJ4bdduEC5VI2I
	YGFLBcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKzbj-001rQz-0D; Tue, 31 Aug 2021 08:59:03 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKzbd-001rP5-Cu
 for linux-mtd@lists.infradead.org; Tue, 31 Aug 2021 08:59:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630400336; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=872jpT5jHze6g6lhPt8zyPTtyQ+QBI5L9Uk7NxSX3oQ=;
 b=m4MbGA+2NtcJyiEjfrknkVk58BpnVnqtjfrNmNBt+L+yPlyGHZdDcioH4Arm7NFXM4mUFrq7
 eHZDZSG/S4vnUkgzl0m4hdiUvkLmfFcCEzKuT6u7OoWmofb04oshGwDVZFxcBktwN19DWlOM
 xlaxZ92yjm+/aTuZA33XdvipS3U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 612def4ef61b2f864bce83eb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Aug 2021 08:58:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E154CC43617; Tue, 31 Aug 2021 08:58:53 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 22542C4338F;
 Tue, 31 Aug 2021 08:58:53 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 31 Aug 2021 14:28:53 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Update code word value for raw read
In-Reply-To: <20210830095607.6be588fe@xps13>
References: <1629973862-7248-1-git-send-email-mdalam@codeaurora.org>
 <20210830095607.6be588fe@xps13>
Message-ID: <08fc4c79c5dbbf40780fb64d37276eb6@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_015857_546564_24ED11FD 
X-CRM114-Status: GOOD (  17.80  )
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

T24gMjAyMS0wOC0zMCAxMzoyNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbwo+IAo+IE1k
IFNhZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4gd3JvdGUgb24gVGh1LCAyNiBBdWcg
MjAyMQo+IDE2OjAxOjAyICswNTMwOgo+IAo+PiBGcm9tIFFQSUMgVjIgb253YXJkcyB0aGVyZSBp
cyBhIHNlcGFyYXRlIHJlZ2lzdGVyIHRvIHJlYWQKPj4gbGFzdCBjb2RlIHdvcmQgIlFQSUNfTkFO
RF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiIuCj4+IAo+PiBxY29tX25hbmRjX3JlYWRfY3dfcmF3
KCkgaXMgdXNlZCB0byByZWFkIG9ubHkgb25lIGNvZGUgd29yZAo+PiBhdCBhIHRpbWUuIElmIHdl
IHdpbGwgY29uZmlndXJlIG51bWJlciBvZiBjb2RlIHdvcmRzIHRvIDEgaW4KPj4gaW4gUVBJQ19O
QU5EX0RFVjBfQ0ZHMCByZWdpc3RlciB0aGVuIFFQSUMgY29udHJvbGxlciB0aGlua3MKPj4gaXRz
IHJlYWRpbmcgdGhlIGxhc3QgY29kZSB3b3JkLCBzaW5jZSBmcm9tIFFQSUMgVjIgb253YXJkcwo+
PiB3ZSBhcmUgaGF2aW5nIHNlcGFyYXRlIHJlZ2lzdGVyIHRvIHJlYWQgdGhlIGxhc3QgY29kZSB3
b3JkLAo+PiB3ZSBoYXZlIHRvIGNvbmZpZ3VyZSAiUVBJQ19OQU5EX1JFQURfTE9DQVRJT05fTEFT
VF9DV19uIgo+PiByZWdpc3RlciB0byBmZXRjaCBkYXRhIGZyb20gY29udHJvbGxlciBidWZmZXIg
dG8gc3lzdGVtCj4+IG1lbW9yeS4KPiAKPiBGaXhlcy9DYzogc3RhYmxlIHRhZ3MgYXJlIG1pc3Np
bmc/CgogICBVcGRhdGVkIGluIFYyIHBhdGNoCj4gCj4+IFNpZ25lZC1vZmYtYnk6IE1kIFNhZHJl
IEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4KPj4gLS0tCj4+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9xY29tX25hbmRjLmMgfCA4ICsrKysrKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYyAKPj4gYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25h
bmRjLmMKPj4gaW5kZXggZWYwYmFkZS4uMDRlNmY3YiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fj
b21fbmFuZGMuYwo+PiBAQCAtMTY3NiwxMyArMTY3NiwxNyBAQCBxY29tX25hbmRjX3JlYWRfY3df
cmF3KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCAKPj4gc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPj4g
IAlzdHJ1Y3QgbmFuZF9lY2NfY3RybCAqZWNjID0gJmNoaXAtPmVjYzsKPj4gIAlpbnQgZGF0YV9z
aXplMSwgZGF0YV9zaXplMiwgb29iX3NpemUxLCBvb2Jfc2l6ZTI7Cj4+ICAJaW50IHJldCwgcmVn
X29mZiA9IEZMQVNIX0JVRl9BQ0MsIHJlYWRfbG9jID0gMDsKPj4gKwlpbnQgcmF3X2N3ID0gY3c7
Cj4+IAo+PiAgCW5hbmRfcmVhZF9wYWdlX29wKGNoaXAsIHBhZ2UsIDAsIE5VTEwsIDApOwo+PiAg
CWhvc3QtPnVzZV9lY2MgPSBmYWxzZTsKPj4gCj4+ICsJaWYgKG5hbmRjLT5wcm9wcy0+cXBpY192
MikKPj4gKwkJcmF3X2N3ID0gZWNjLT5zdGVwcyAtIDE7Cj4+ICsKPj4gIAljbGVhcl9iYW1fdHJh
bnNhY3Rpb24obmFuZGMpOwo+PiAgCXNldF9hZGRyZXNzKGhvc3QsIGhvc3QtPmN3X3NpemUgKiBj
dywgcGFnZSk7Cj4+IC0JdXBkYXRlX3J3X3JlZ3MoaG9zdCwgMSwgdHJ1ZSwgY3cpOwo+PiArCXVw
ZGF0ZV9yd19yZWdzKGhvc3QsIDEsIHRydWUsIHJhd19jdyk7Cj4+ICAJY29uZmlnX25hbmRfcGFn
ZV9yZWFkKGNoaXApOwo+PiAKPj4gIAlkYXRhX3NpemUxID0gbXRkLT53cml0ZXNpemUgLSBob3N0
LT5jd19zaXplICogKGVjYy0+c3RlcHMgLSAxKTsKPj4gQEAgLTE3MTEsNyArMTcxNSw3IEBAIHFj
b21fbmFuZGNfcmVhZF9jd19yYXcoc3RydWN0IG10ZF9pbmZvICptdGQsIAo+PiBzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwLAo+PiAgCQluYW5kY19zZXRfcmVhZF9sb2MoY2hpcCwgY3csIDMsIHJlYWRf
bG9jLCBvb2Jfc2l6ZTIsIDEpOwo+PiAgCX0KPj4gCj4+IC0JY29uZmlnX25hbmRfY3dfcmVhZChj
aGlwLCBmYWxzZSwgY3cpOwo+PiArCWNvbmZpZ19uYW5kX2N3X3JlYWQoY2hpcCwgZmFsc2UsIHJh
d19jdyk7Cj4+IAo+PiAgCXJlYWRfZGF0YV9kbWEobmFuZGMsIHJlZ19vZmYsIGRhdGFfYnVmLCBk
YXRhX3NpemUxLCAwKTsKPj4gIAlyZWdfb2ZmICs9IGRhdGFfc2l6ZTE7Cj4gCj4gVGhhbmtzLAo+
IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
