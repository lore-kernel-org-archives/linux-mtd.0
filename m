Return-Path: <SRS0=6BKG=HN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E668C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 19:31:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B31C64E42
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 19:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B31C64E42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vZtCvA1j4lSaFixlLeo+lZyJtgtYn7parcniDn7auh8=; b=iuLDiV+rtvZ3IBEXGa2m/84OM
	gcZCbDuDRh6Q0qUse6BZXjI83bU+xqj+2Pul62RKzJ7iJ6BhJL5hSYMgu2v5jO2/vnAX2XGZoghiS
	XEVumNsz26TzGmXqpHvvkNjdB9VuBwzwTFL2PFz+pk78pB4dukzXSQsPkGONuwOj30cbt2Ber4+N1
	srnnijYLwZoLwGRzQG3Rq+2Lko0cIXeHB1uXOp/g3LO7DlRG33YuR5b/m7vi0iXngsVhVq30Ndoh+
	pZ1p7Jxny2SypS3LDAEB7OiZwgFrcGCk7R6KjdROhRCsj6AMQFtn9atmBPoT2CctMU9Sv5aQLAks6
	7zT1vhH0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAHg7-00021p-1N; Thu, 11 Feb 2021 19:31:03 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAHg3-00020h-Lz
 for linux-mtd@lists.infradead.org; Thu, 11 Feb 2021 19:31:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613071859; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XGJQvy9vglXLQ+epQAjyXyaHaGPS9ccTR8kWxCegrDQ=;
 b=AFzr8BfeK97U3jqayr9rjVsEQ2iYjbsDANNS4WhUhhWzas/D7+hYUF9BGwXg3whW6c1fEEbq
 1iLID0EADsQPTmlcJGAja5yp4D1Jy0iD9fk6HEsWTIk21daS1ezvaSwSDHwyojjYwHFnKhwv
 2CEiFpZ14Qd8wSAK3ry43/YFSmo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 602585e9830f898bac6fb30f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 19:30:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 12ACCC43462; Thu, 11 Feb 2021 19:30:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CEADC433CA;
 Thu, 11 Feb 2021 19:30:47 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 12 Feb 2021 01:00:47 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH V4] mtd: rawnand: qcom: update last code word register
In-Reply-To: <20210211150759.506f3463@xps13>
References: <1611869959-5109-1-git-send-email-mdalam@codeaurora.org>
 <20210210090144.GE19226@work> <20210211150759.506f3463@xps13>
Message-ID: <fe43b382fd48d7fb494dd66a4b5ac80a@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_143059_985487_C15D3967 
X-CRM114-Status: GOOD (  27.16  )
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
Cc: vigneshr@ti.com, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 sricharan@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMi0xMSAxOTozNywgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAKPiBN
YW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPiB3
cm90ZSBvbiBXZWQsCj4gMTAgRmViIDIwMjEgMTQ6MzE6NDQgKzA1MzA6Cj4gCj4+IE9uIEZyaSwg
SmFuIDI5LCAyMDIxIGF0IDAzOjA5OjE5QU0gKzA1MzAsIE1kIFNhZHJlIEFsYW0gd3JvdGU6Cj4+
ID4gRnJvbSBRUElDIHZlcnNpb24gMi4wIG9ud2FyZHMgbmV3IHJlZ2lzdGVyIGdvdCBhZGRlZCB0
bwo+PiA+IHJlYWQgbGFzdCBjb2Rld29yZC4gVGhpcyBjaGFuZ2Ugd2lsbCBhZGQgdGhlIFJFQURf
TE9DQVRJT05fTEFTVF9DV19uCj4+ID4gcmVnaXN0ZXIuCj4+ID4KPj4gPiBGb3IgZmlyc3QgdGhy
ZWUgY29kZSB3b3JkIFJFQURfTE9DQVRJT05fbiByZWdpc3RlciB3aWxsIGJlCj4+ID4gdXNlLkZv
ciBsYXN0IGNvZGUgd29yZCBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiByZWdpc3RlciB3aWxsIGJl
Cj4+ID4gdXNlLgo+IAo+IFNvcnJ5IGZvciB0aGUgbGF0ZSBub3RpY2UsIEkgdGhpbmsgdGhlIHBh
dGNoIGlzIGZpbmUgYnV0IGlmIHlvdSBkb24ndAo+IG1pbmQgSSB3b3VsZCBsaWtlIHRvIHByb3Bv
c2UgYSBzbWFsbCBjaGFuZ2UgdGhhdCBzaG91bGQgc2ltcGxpZnkgeW91cgo+IHBhdGNoIGEgbG90
LCBzZWUgYmVsb3cuCj4gCj4+ID4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxt
ZGFsYW1AY29kZWF1cm9yYS5vcmc+Cj4+IAo+PiBSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4KPj4gCj4+IFRoYW5rcywK
Pj4gTWFuaQo+PiAKPj4gPiAtLS0KPj4gPiBbVjRdCj4+ID4gICogTW9kaWZpZWQgY29uZGl0aW9u
IGZvciBuYW5kY19zZXRfcmVhZF9sb2NfbGFzdCgpIGluIHFjb21fbmFuZGNfcmVhZF9jd19yYXco
KS4KPj4gPiAgKiBBZGRlZCBvbmUgYWRkaXRpb25hbCBhcmd1bWVudCAibGFzdF9jdyIgdG8gdGhl
IGZ1bmN0aW9uIGNvbmZpZ19uYW5kX2N3X3JlYWQoKQo+PiA+ICAgIHRvIGhhbmRsZSBsYXN0IGNv
ZGUgd29yZCBjb25kaXRpb24uCj4+ID4gICogQ2hhbmdlZCB0b3RhbCBudW1iZXIgb2YgbGFzdCBj
b2RlIHdvcmQgcmVnaXN0ZXIgIk5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXXzAiIHRvIDQKPj4g
PiAgICB3aGlsZSBkb2luZyBjb2RlIHdvcmQgY29uZmlndXJhdGlvbi4KPj4gPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgMTEwICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCAyNiBk
ZWxldGlvbnMoLSkKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9x
Y29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPj4gPiBpbmRl
eCA2NjdlNGJmLi45NDg0YmU4IDEwMDY0NAo+PiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3Fjb21fbmFuZGMuYwo+PiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
Ywo+PiA+IEBAIC00OCw2ICs0OCwxMCBAQAo+PiA+ICAjZGVmaW5lCU5BTkRfUkVBRF9MT0NBVElP
Tl8xCQkweGYyNAo+PiA+ICAjZGVmaW5lCU5BTkRfUkVBRF9MT0NBVElPTl8yCQkweGYyOAo+PiA+
ICAjZGVmaW5lCU5BTkRfUkVBRF9MT0NBVElPTl8zCQkweGYyYwo+PiA+ICsjZGVmaW5lCU5BTkRf
UkVBRF9MT0NBVElPTl9MQVNUX0NXXzAJMHhmNDAKPj4gPiArI2RlZmluZQlOQU5EX1JFQURfTE9D
QVRJT05fTEFTVF9DV18xCTB4ZjQ0Cj4+ID4gKyNkZWZpbmUJTkFORF9SRUFEX0xPQ0FUSU9OX0xB
U1RfQ1dfMgkweGY0OAo+PiA+ICsjZGVmaW5lCU5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXXzMJ
MHhmNGMKPj4gPgo+PiA+ICAvKiBkdW1teSByZWdpc3RlciBvZmZzZXRzLCB1c2VkIGJ5IHdyaXRl
X3JlZ19kbWEgKi8KPj4gPiAgI2RlZmluZQlOQU5EX0RFVl9DTUQxX1JFU1RPUkUJCTB4ZGVhZAo+
PiA+IEBAIC0xODcsNiArMTkxLDEyIEBAIG5hbmRjX3NldF9yZWcobmFuZGMsIE5BTkRfUkVBRF9M
T0NBVElPTl8jI3JlZywJCQlcCj4+ID4gIAkgICAgICAoKHNpemUpIDw8IFJFQURfTE9DQVRJT05f
U0laRSkgfAkJCVwKPj4gPiAgCSAgICAgICgoaXNfbGFzdCkgPDwgUkVBRF9MT0NBVElPTl9MQVNU
KSkKPj4gPgo+PiA+ICsjZGVmaW5lIG5hbmRjX3NldF9yZWFkX2xvY19sYXN0KG5hbmRjLCByZWcs
IG9mZnNldCwgc2l6ZSwgaXNfbGFzdCkJXAo+PiA+ICtuYW5kY19zZXRfcmVnKG5hbmRjLCBOQU5E
X1JFQURfTE9DQVRJT05fTEFTVF9DV18jI3JlZywJCQlcCj4+ID4gKwkgICAgICAoKG9mZnNldCkg
PDwgUkVBRF9MT0NBVElPTl9PRkZTRVQpIHwJCVwKPj4gPiArCSAgICAgICgoc2l6ZSkgPDwgUkVB
RF9MT0NBVElPTl9TSVpFKSB8CQkJXAo+PiA+ICsJICAgICAgKChpc19sYXN0KSA8PCBSRUFEX0xP
Q0FUSU9OX0xBU1QpKQo+PiA+ICsKPiAKPiBZb3UgY291bGQgcmVuYW1lIHRoZSBtYWNybyBuYW5k
Y19zZXRfcmVhZF9sb2MoKSBpbnRvCj4gbmFuZGNfc2V0X3JlYWRfbG9jX2ZpcnN0KCkgb3IgYW55
dGhpbmcgZWxzZSB0aGF0IG1ha2Ugc2Vuc2UsIHRoZW4gaGF2ZQo+IGEgaGVscGVyIHdoaWNoIGRv
ZXM6Cj4gCj4gbmFuZGNfc2V0X3JlYWRfbG9jKCkKPiB7Cj4gCWlmIChjb25kaXRpb24gZm9yIGZp
cnN0KQo+IAkJcmV0dXJuIG5hbmRjX3NldF9yZWFkX2xvY19maXJzdCgpOwo+IAllbHNlCj4gCQly
ZXR1cm4gbmFuZGNfc2V0X3JlYWRfbG9jX2xhc3QoKTsKPiB9Cj4gCgogICBZZXMgdGhpcyBpcyBt
b3JlIHByZWNpc2Ugd2F5ICYgc2ltcGxpZnkgdGhlIHBhdGNoIGEgbG90LgogICBCdXQgZm9yIHRo
aXMgaSBoYXZlIHRvIGNoYW5nZSB0aGVzZSB0d28gbWFjcm8gYXMgYSBmdW5jdGlvbi4KCiAgIG5h
bmRjX3NldF9yZWFkX2xvYygpICYgbmFuZGNfc2V0X3JlYWRfbG9jX2xhc3QoKS4KCiAgIFNpbmNl
IGZvciBsYXN0IGNvZGUgd29yZCByZWdpc3RlciB3ZSBhcmUgdXNpbmcgVG9rZW4gUGFzdGluZyAK
T3BlcmF0b3IjIy4KCiAgIFNvIGlmIGkgYW0gaW1wbGVtZW50aW5nIGxpa2UgdGhlIGJlbG93LgoK
ICAgLyogaGVscGVyIHRvIGNvbmZpZ3VyZSBsb2NhdGlvbiByZWdpc3RlciB2YWx1ZXMgKi8KICAg
c3RhdGljIHZvaWQgbmFuZGNfc2V0X3JlYWRfbG9jKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxl
ciAqbmFuZGMsIGludCAKcmVnLAogICAgICAgICAgICAgICAgICAgaW50IG9mZnNldCwgaW50IHNp
emUsIGludCBpc19sYXN0LCBib29sIGxhc3RfY3cpCiAgIHsKICAgICAgICAgICBpZiAobGFzdF9j
dykKICAgICAgICAgICAgICAgICAgIHJldHVybiBuYW5kY19zZXRfcmVhZF9sb2NfbGFzdChuYW5k
YywgcmVnLCBvZmZzZXQsIApzaXplLCBpc19sYXN0KTsKICAgICAgICAgICBlbHNlCiAgICAgICAg
ICAgICAgICAgICByZXR1cm4gbmFuZGNfc2V0X3JlYWRfbG9jX2ZpcnN0KG5hbmRjLCByZWcsIG9m
ZnNldCwgCnNpemUsIGlzX2xhc3QpOwogIH0KCiAgIFNvIGhlcmUgZm9yIG1hY3JvIGV4cGFuc2lv
biByZWcgc2hvdWxkIGJlIGEgdmFsdWUgbm90IGEgdmFyaWFibGUgZWxzZSAKaXQgd2lsbCBiZSBl
eHBlbmRlZCBsaWtlCiAgIE5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXX3JlZyBpbnN0ZWFkIG9m
IApOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18wLDEsMiwzIGV0Yy4KCiAgdGhlIGNhbGwgZm9y
IG5hbmRjX3NldF9yZWFkX2xvYygpIGFzIG5hbmRjX3NldF9yZWFkX2xvYyhuYW5kYywgMCwgCnJl
YWRfbG9jLCBkYXRhX3NpemUxLCAwLCB0cnVlKTsgLS0tPiBmb3IgbGFzdCBjb2RlIHdvcmQuCiAg
bmFuZGNfc2V0X3JlYWRfbG9jKG5hbmRjLCAwLCByZWFkX2xvYywgZGF0YV9zaXplMSwgMCwgZmFs
c2UpOyAtLS0+IGZvciAKZmlyc3QgdGhyZWUgY29kZSB3cm9kLgoKCiAgU28gaXMgdGhpcyBvayBm
b3IgeW91IHRvIGNvbnZlcnQgdGhlc2UgdHdvIG1hY3JvIGludG8gZnVuY3Rpb24gPwoKPiBBbmQg
aW4gdGhlIHJlc3Qgb2YgeW91ciBwYXRjaCB5b3Ugd29uJ3QgaGF2ZSB0byB0b3VjaCBhbnl0aGlu
ZyBlbHNlLgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
