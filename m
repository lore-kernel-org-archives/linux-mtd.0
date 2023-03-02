Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B1CC6FA8E
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 05:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fys00RmDy/I3RAqOc3kWKy0W7+Q0+6vN1Rr5I0+s6jU=; b=oPJv5f8sRe5/rU
	RTnHeJO4MyBrupOmDXzkPXwrSFnMF4AhZx+5p0phi/Tz/4jY2ei5bT1KHYMQSJd4Pixe3m18V8SvM
	V4M/DA14yywremxUAA5LPXYF3bosttoT3XxNx1Qvq7ZEAhc9tSq6gESSUn8P5hTQXaeITCkGhuSPB
	wNQIDJU2joFcSkh/5fson3l/NrjGAjZnNfJ5k1gJhH9pgKS8i9geBHwow6YuDMAw7M5wSteClkk7m
	yjRVcrxyk+MKxwG1ZLY/CXUAjOvTUMlkix+vqivp8f9i8tC6Am6EtPQFCBZL3eXLeB82S2f71/xb8
	vKqktbRjik8bRumHUS6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXbn4-000vGi-EU; Thu, 02 Mar 2023 05:47:42 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXbn1-000vG8-8N
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 05:47:40 +0000
Received: by mail-ed1-x52a.google.com with SMTP id x3so179569edb.10
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 21:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677736056;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AsvJmlYKHKHdzSIIiRk6fxEhrJuDO6mu2zGIT1TDaes=;
        b=Rnzllh5/tEg91oLRldJQFK6MzOZlKjYMKJ6p+L30bLQTlzg+VesZy4la/qwh9g+9nk
         7e7O86KbXA0qD3INpZs9xaL1A9KbHmF3QssoV9a+Gc5eDLnKNr4pdCKe2+HdWJtO/pYa
         VQaa+AERR877EfjYw1jGqrU8hRKHv9nAKOVKIgj4oReOF3gSLaoaOfkHB4VaQuc7qdB8
         8aXJZPfB3NcAkWAqV76rNSDqCe1hcjytN1cEybm+j+1Csr0LZsvo7Z6qGy/VrYEUPIiO
         1GI91Ns+D40Iu3HJEQA8Gzga2flq6EG3PRIYTxTBqsp/IWRnbW3myz+WrDhrcjt8dZAf
         +50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677736056;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsvJmlYKHKHdzSIIiRk6fxEhrJuDO6mu2zGIT1TDaes=;
        b=dZQjG6DIyjWYDKyHLn8E70bLDX+tscmEsimtjuGHBe4SwQjv6ncD9U4Kqx3xWmWOJ/
         48LrRRuVyzD/CRIZzzbJLNNY9dSB9tyc4L7Z1cZ25fWr6G8GQvRP5E9Bd9rzh6EJ1GLo
         JFakzC+HIh1oRXk4/YfM26Gtk5GlPkcbXRnLj+DCclh+J+IIXfKgzJA9IPSnYLHaZIa0
         1MFAPkLAOO6MFb1/2KgNf/PlHhFGtMIWzs8SkA2/pvxueNwnf/WyZ3PdCl3JXAnJMOVY
         VLHGEpAomoEoLNyrc4udwwzYaptRdyIDnuKUwBRWdkqAks2n/TFkb7t7u5Cse7A/vMgq
         M0UQ==
X-Gm-Message-State: AO0yUKUt1tgj+eJEBnDv1SoT9sQ+lBilbNT2QTSuzvfbEzoFBX62fLT2
	/BciSZuk+n1T5yiOADRYRFA58Q==
X-Google-Smtp-Source: AK7set99YYtEeWbyoMxpbh7gjW0nbvtvE6WqujRi/LCnIEmkTuSZFz1GCXUNJejbpLmSW5o0K6/s3w==
X-Received: by 2002:a17:906:4910:b0:8b1:3b95:cf3f with SMTP id b16-20020a170906491000b008b13b95cf3fmr8041532ejq.70.1677736056071;
        Wed, 01 Mar 2023 21:47:36 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id m5-20020a170906234500b008d9c518a318sm6808491eja.142.2023.03.01.21.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 21:47:35 -0800 (PST)
Message-ID: <8ee51f7c-b911-b4cc-5c48-c22cae0b6891@linaro.org>
Date: Thu, 2 Mar 2023 07:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/8] mtd: spi-nor: sfdp: Add support for SCCR map for
 multi-chip device
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
 <5ffa62bf55f2e6e3fee5104e4c53e2b1caa8c8cc.1675835253.git.Takahiro.Kuwano@infineon.com>
 <1bac4c22-03af-3455-21b0-2b23a39a7c12@linaro.org>
In-Reply-To: <1bac4c22-03af-3455-21b0-2b23a39a7c12@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_214739_340056_8AEC7BE2 
X-CRM114-Status: GOOD (  26.40  )
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

CgpPbiAwMi4wMy4yMDIzIDA3OjQxLCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IAo+IAo+IE9uIDA4
LjAyLjIwMjMgMDc6NTMsIHRrdXc1ODQ5MjRAZ21haWwuY29tIHdyb3RlOgo+PiBGcm9tOiBUYWth
aGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+Cj4+Cj4+IFNDQ1IgbWFw
IGZvciBtdWx0aS1jaGlwIGRldmljZXMgY29udGFpbnMgdGhlIG51bWJlciBvZiBhZGRpdGlvbmFs
IGRpY2UgaW4KPj4gdGhlIGRldmljZSBhbmQgcmVnaXN0ZXIgb2Zmc2V0IHZhbHVlcyBmb3IgZWFj
aCBhZGRpdGlvbmFsIGRpY2UuCj4+Cj4+IHNwaV9ub3JfcGFyc2Vfc2Njcl9tYygpIGlzIGFkZGVk
IHRvIGRldGVybWluZSB0aGUgbnVtYmVyIG9mIGRpY2UgYW5kCj4+IHZvbGF0aWxlIHJlZ2lzdGVy
IG9mZnNldCBmb3IgZWFjaCBkaWUuIFRoZSB2b2xhdGlsZSByZWdpc3RlciBvZmZzZXQgdGFibGUK
Pj4gbWF5IGFscmVhZHkgYmUgYWxsb2NhdGVkIGFuZCBjb250YWlucyBvZmZzZXQgdmFsdWUgZm9y
IGRpZS0wIHZpYSBTQ0NSIG1hcAo+PiBwYXJzZS4gU28sIHdlIHNob3VsZCB1c2UgZGV2bV9rcmVh
bGxvYygpIHRvIGV4cGFuZCB0aGUgdGFibGUgd2l0aAo+PiBwcmVzZXJ2aW5nIGRpZS0wIG9mZnNl
dC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9A
aW5maW5lb24uY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMgfCA2
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgNjQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3Bp
LW5vci9zZmRwLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwo+PiBpbmRleCBlNWI1Nzc2
ZDgxNzIuLmI3YzA4ZmU4NjIzOSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9z
ZmRwLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMKPj4gQEAgLTI2LDYgKzI2
LDExIEBACj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICog
U3RhdHVzLCBDb250cm9sIGFuZCBDb25maWd1cmF0aW9uCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogUmVnaXN0ZXIgTWFwLgo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiArI2RlZmluZSBTRkRQX1NDQ1Jf
TUFQX01DX0lEwqDCoMKgIDB4ZmY4OMKgwqDCoCAvKgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIFN0YXR1cywgQ29udHJvbCBhbmQgQ29uZmlndXJhdGlvbgo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFJlZ2lzdGVyIE1h
cCBPZmZzZXRzIGZvciBNdWx0aS1DaGlwCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogU1BJIE1lbW9yeSBEZXZpY2VzLgo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiDCoCAjZGVmaW5lIFNGRFBfU0lHTkFUVVJFwqDC
oMKgwqDCoMKgwqAgMHg1MDQ0NDY1M1UKPj4gQEAgLTEyNTIsNiArMTI1Nyw2MSBAQCBzdGF0aWMg
aW50IHNwaV9ub3JfcGFyc2Vfc2NjcihzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+PiDCoMKgwqDCoMKg
IHJldHVybiByZXQ7Cj4+IMKgIH0KPj4gKy8qKgo+PiArICogc3BpX25vcl9wYXJzZV9zY2NyX21j
KCkgLSBQYXJzZSB0aGUgU3RhdHVzLCBDb250cm9sIGFuZCBDb25maWd1cmF0aW9uCj4+ICsgKsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUmVnaXN0
ZXIgTWFwIE9mZnNldHMgZm9yIE11bHRpLUNoaXAgU1BJIAo+PiBNZW1vcnkKPj4gKyAqwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEZXZpY2VzLgo+
PiArICogQG5vcjrCoMKgwqDCoMKgwqDCoCBwb2ludGVyIHRvIGEgJ3N0cnVjdCBzcGlfbm9yJwo+
PiArICogQHNjY3JfbWNfaGVhZGVyOsKgwqDCoCBwb2ludGVyIHRvIHRoZSAnc3RydWN0IHNmZHBf
cGFyYW1ldGVyX2hlYWRlcicgCj4+IGRlc2NyaWJpbmcKPj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB0aGUgU0NDUiBNYXAgb2Zmc2V0cyB0YWJsZSBsZW5ndGggYW5kIHZlcnNpb24uCj4+ICsg
Kgo+PiArICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIC1lcnJubyBvdGhlcndpc2UuCj4+ICsgKi8K
Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9wYXJzZV9zY2NyX21jKHN0cnVjdCBzcGlfbm9yICpub3Is
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc2ZkcF9w
YXJhbWV0ZXJfaGVhZGVyICpzY2NyX21jX2hlYWRlcikKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qg
c3BpX25vcl9mbGFzaF9wYXJhbWV0ZXIgKnBhcmFtcyA9IG5vci0+cGFyYW1zOwo+PiArwqDCoMKg
IHUzMiAqZHdvcmRzLCBhZGRyOwo+PiArwqDCoMKgIHNpemVfdCBsZW47Cj4+ICvCoMKgwqAgaW50
IHJldDsKPj4gK8KgwqDCoCB1OCBpOwo+PiArCj4+ICvCoMKgwqAgbGVuID0gc2Njcl9tY19oZWFk
ZXItPmxlbmd0aCAqIHNpemVvZigqZHdvcmRzKTsKPj4gK8KgwqDCoCBkd29yZHMgPSBrbWFsbG9j
KGxlbiwgR0ZQX0tFUk5FTCk7Cj4+ICvCoMKgwqAgaWYgKCFkd29yZHMpCj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gLUVOT01FTTsKPj4gKwo+PiArwqDCoMKgIGFkZHIgPSBTRkRQX1BBUkFNX0hF
QURFUl9QVFAoc2Njcl9tY19oZWFkZXIpOwo+PiArwqDCoMKgIHJldCA9IHNwaV9ub3JfcmVhZF9z
ZmRwKG5vciwgYWRkciwgbGVuLCBkd29yZHMpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKg
wqDCoMKgwqDCoCBnb3RvIG91dDsKPj4gKwo+PiArwqDCoMKgIGxlMzJfdG9fY3B1X2FycmF5KGR3
b3Jkcywgc2Njcl9tY19oZWFkZXItPmxlbmd0aCk7Cj4+ICsKPj4gK8KgwqDCoCAvKgo+PiArwqDC
oMKgwqAgKiBQYWlyIG9mIERPV1JEcyAodm9sYXRpbGUgYW5kIG5vbi12b2xhdGlsZSByZWdpc3Rl
ciBvZmZzZXRzKSBwZXIKPj4gK8KgwqDCoMKgICogYWRkaXRpb25hbCBkaWUuIEhlbmNlLCBsZW5n
dGggPSAyICogKG51bWJlciBvZiBhZGRpdGlvbmFsIGRpY2UpLgo+PiArwqDCoMKgwqAgKi8KPj4g
K8KgwqDCoCBwYXJhbXMtPm51bV9vZl9kaWNlICs9IHNjY3JfbWNfaGVhZGVyLT5sZW5ndGggLyAy
Owo+PiArCj4+ICvCoMKgwqAgLyogQWRkcmVzcyBvZmZzZXQgZm9yIHZvbGF0aWxlIHJlZ2lzdGVy
cyBvZiBhZGRpdGlvbmFsIGRpY2UgKi8KPj4gK8KgwqDCoCBwYXJhbXMtPnZyZWdfb2Zmc2V0ID0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2bV9rcmVhbGxvYyhub3ItPmRldiwgcGFyYW1z
LT52cmVnX29mZnNldCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwYXJhbXMtPm51bV9vZl9kaWNlICogc2l6ZW9mKCpkd29yZHMpLAo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+PiArwqDCoMKg
IGlmICghcGFyYW1zLT52cmVnX29mZnNldCkgewo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVO
T01FTTsKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+PiArwqDCoMKgIH0KPj4gKwo+PiAr
wqDCoMKgIGZvciAoaSA9IDE7IGkgPCBwYXJhbXMtPm51bV9vZl9kaWNlOyBpKyspCj4gCj4gaGVy
ZSB5b3UgbGltaXQgdGhlIG51bWJlciBvZiBkaWNlcyB0byAyNTYsIHdoaWxlIHRoZSBqZXNkMjE2
IHNheXMgImFueQo+IG51bWJlciBmcm9tIDIgYW5kIHVwIG1heSBiZSB1c2VkIi4gV2hpbGUgSSBh
Z3JlZSB0aGF0IGhhdmluZyAyNTYgZGljZXMKPiBpcyBpbXByb2JhYmxlIHdlJ2xsIGhhdmUgdG8g
ZGVjaWRlIHdoZXRoZXI6Cj4gMS8ga2VlcCB1c2luZyB1OCBmb3IgdGhlIG51bWJlciBvZiBkaWNl
cywgdGh1cyBsaW1pdGluZyB0aGVtIHRvIDI1NiwKPiBhc3N1bWluZyB0aGF0IHRoZSB0YWJsZSBs
ZW5ndGggaXMgd3JvbmcuIEluIHRoaXMgY2FzZSB5b3UnbGwgaGF2ZSB0bwo+IGNoZWNrIHNjY3Jf
bWNfaGVhZGVyLT5sZW5ndGggYW5kIHJldHVybiBhbiBlcnJvciBmb3Igbm8tb2YtZGljZXMgPiAy
NTYKPiAyLyB1c2UgdW5zaWduZWQgaW50IGZvciB0aGUgbnVtYmVyIG9mIGRpY2VzIGFuZCBob3Bl
IHlvdSdsbCBnZXQgYW4KPiBFTk9NRU0gc29vbmVyIG9yIGxhdGVyCj4gCj4+ICvCoMKgwqDCoMKg
wqDCoCBwYXJhbXMtPnZyZWdfb2Zmc2V0W2ldID0gZHdvcmRzWyhpIC0gMSkgKiAyXTsKPiAKPiB1
c2UgU0ZEUF9EV09SRCgpIHBsZWFzZQo+PiArCj4+ICtvdXQ6Cj4+ICvCoMKgwqAga2ZyZWUoZHdv
cmRzKTsKPj4gK8KgwqDCoCByZXR1cm4gcmV0Owo+PiArfQo+PiArCj4+IMKgIC8qKgo+PiDCoMKg
ICogc3BpX25vcl9wb3N0X3NmZHBfZml4dXBzKCkgLSBVcGRhdGVzIHRoZSBmbGFzaCdzIHBhcmFt
ZXRlcnMgYW5kIAo+PiBzZXR0aW5ncwo+PiDCoMKgICogYWZ0ZXIgU0ZEUCBoYXMgYmVlbiBwYXJz
ZWQuIENhbGxlZCBvbmx5IGZvciBmbGFzaGVzIHRoYXQgZGVmaW5lIAo+PiBKRVNEMjE2IFNGRFAK
Pj4gQEAgLTE0NjEsNiArMTUyMSwxMCBAQCBpbnQgc3BpX25vcl9wYXJzZV9zZmRwKHN0cnVjdCBz
cGlfbm9yICpub3IpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IHNwaV9ub3Jf
cGFyc2Vfc2Njcihub3IsIHBhcmFtX2hlYWRlcik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBTRkRQX1NDQ1JfTUFQX01DX0lEOgo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBzcGlfbm9yX3BhcnNlX3NjY3JfbWMobm9y
LCBwYXJhbV9oZWFkZXIpOwoKd2hhdCBoYXBwZW5zIGlmIHlvdSBnZXQgYW4gZXJyb3IgaGVyZT8g
V2lsbCB0aGUgZmxhc2ggd29yayBmaW5lIGp1c3QgZm9yCnRoZSBmaXJzdCBkaWNlIG9yIGl0IHdp
bGwgbm90IHdvcmsgYXQgYWxsPwoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+
ICsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
