Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADE0C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 19:44:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC5064E61
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 19:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC5064E61
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5uG2vzzScaiDPRSeKGDzBS9sVi3+tlNN50Ct+XBOZCE=; b=CnNcY1yru2SwtZfbnycCxogWH
	mK0RjkDafXigw5dTdzlfP7wcZffjEmP15G01huAyJcCWSVBa4tNjyF1vi8cY8lYapOW2SRVfPGjYb
	O98bAjsyGnvX5+j3jBblcKhrbrbzXMgIELeQIJRAo+WD89Yk3FUSH3AN/aHGhQvjZom+HcT0/ghio
	Ftyf1Wf+Ror/6Y2WkOr54y4toD6yN7pJLDdirwJ1/cHaDjcTMfpoU7fkAO1ae1uqfpN0ei1ozhSN8
	EOZDMG3WJFcWSRFsFXrD9vglWOGCOtdEQnnv+IHt+AANZbDnVD8IQOR4YZ0YB31+ZLypAGvGSDprl
	l1L/VE9Qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEdb3-0006my-GY; Tue, 23 Feb 2021 19:43:49 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEdb1-0006mI-2n
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 19:43:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614109426; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UUUvxOLTBmHAHH+xUk4kZ6Io2hSw2giUyQETFXr1tWc=;
 b=WZaELNv6QRv5QIXgKn87BZqaKxCAbkfzm6mcGDLy30MLWVRh8dsKPXr1yxz2ypKPdvcVjPUK
 4SrStLvFdcAeI/QCH3Tq8ClkEt5dwZeXO+F28o6RfBCh/i1sjUEQ/2zU5eFwFnxlJsrRO/oQ
 9uhYTSd9zagKd087RKYS1sZ+spo=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60355aefba08663830803145 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Feb 2021 19:43:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 18A7AC43461; Tue, 23 Feb 2021 19:43:43 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34D58C433CA;
 Tue, 23 Feb 2021 19:43:42 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 24 Feb 2021 01:13:42 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: update last code word register
In-Reply-To: <20210223173449.1a55df1e@xps13>
References: <1614024267-12529-1-git-send-email-mdalam@codeaurora.org>
 <20210223173449.1a55df1e@xps13>
Message-ID: <a5650f33b493b987d45525ea57fdfd8a@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_144347_219571_02A55903 
X-CRM114-Status: GOOD (  26.69  )
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
Cc: sricharan@codeaurora.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, mani@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMi0yMyAyMjowNCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAKPiBN
ZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIFR1ZSwgMjMgRmVi
IDIwMjEKPiAwMTozNDoyNyArMDUzMDoKPiAKPj4gRnJvbSBRUElDIHZlcnNpb24gMi4wIG9ud2Fy
ZHMgbmV3IHJlZ2lzdGVyIGdvdCBhZGRlZCB0byByZWFkIGxhc3QKPiAKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYSBuZXcKPiAKPj4gY29kZXdvcmQuIFRoaXMgY2hhbmdlIHdpbGwg
YWRkIHRoZSBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiByZWdpc3Rlci4KPiAKPiAgICAgICAgICAg
ICBBZGQgc3VwcG9ydCBmb3IgdGhpcyBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiByZWdpc3Rlci4K
PiAKPj4gCj4+IEZvciBmaXJzdCB0aHJlZSBjb2RlIHdvcmQgUkVBRF9MT0NBVElPTl9uIHJlZ2lz
dGVyIHdpbGwgYmUKPj4gdXNlLkZvciBsYXN0IGNvZGUgd29yZCBSRUFEX0xPQ0FUSU9OX0xBU1Rf
Q1dfbiByZWdpc3RlciB3aWxsIGJlCj4+IHVzZS4KPiAKPiAiCj4gSW4gdGhlIGNhc2Ugb2YgUVBJ
QyB2MiwgY29kZXdvcmRzIDAsIDEgYW5kIDIgd2lsbCBiZSBhY2Nlc3NlZCB0aHJvdWdoCj4gUkVB
RF9MT0NBVElPTl9uLCB3aGlsZSBjb2Rld29yZCAzIHdpbGwgYmUgYWNjZXNzZWQgdGhyb3VnaAo+
IFJFQURfTE9DQVRJT05fTEFTVF9DV19uLgo+ICIKPiAKPiBXaGVuIEkgcmVhZCBteSBvd24gc2Vu
dGVuY2UsIEkgZmVlbCB0aGF0IHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZy4KPiBJZiB0aGVyZSBh
cmUgb25seSA0IGNvZGV3b3JkcywgSSBndWVzcyBhIFFQSUMgdjIgaXMgYWJsZSB0byB1c2UKPiBS
RUFEX0xPQ0FUSU9OXzMgb3IgUkVBRF9MT0NBVElPTl9MQVNUX0NXXzAgaW50ZXJjaGFuZ2VhYmx5
LiBJc24ndCBpdD8KPiAKPiBJIGd1ZXNzIHRoZSBwb2ludCBvZiBoYXZpbmcgdGhlc2UgImxhc3Rf
Y3dfbiIgcmVnaXN0ZXJzIGlzIHRvIHN1cHBvcnQKPiB1cCB0byA4IGNvZGV3b3JkcywgYW0gSSB3
cm9uZz8gSWYgdGhpcyB0aGUgY2FzZSwgdGhlIGN1cnJlbnQgcGF0Y2gKPiBjb21wbGV0ZWx5IGZh
aWxzIGRvaW5nIHRoYXQgSSBkb24ndCBnZXQgdGhlIHBvaW50IG9mIHN1Y2ggY2hhbmdlLgoKVGhp
cyByZWdpc3RlciBpcyBvbmx5IHVzZSB0byByZWFkIGxhc3QgY29kZSB3b3JkLgoKSSBoYXZlIGFk
ZHJlc3MgYWxsIHRoZSBjb21tZW50cyBmcm9tIGFsbCB0aGUgcHJldmlvdXMgc3ViIHNlcXVlbnQg
CnBhdGNoZXMgYW5kIHB1c2hlZAphbGwgcGF0Y2hlcyBpbiBvbmx5IG9uZSBzZXJpZXMuCgpQbGVh
c2UgY2hlY2suCgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29k
ZWF1cm9yYS5vcmc+Cj4+IC0tLQo+IAo+IFsuLi5dCj4gCj4+ICAvKiBoZWxwZXIgdG8gY29uZmln
dXJlIGFkZHJlc3MgcmVnaXN0ZXIgdmFsdWVzICovCj4+IEBAIC03MDAsOCArNzI3LDkgQEAgc3Rh
dGljIHZvaWQgc2V0X2FkZHJlc3Moc3RydWN0IHFjb21fbmFuZF9ob3N0IAo+PiAqaG9zdCwgdTE2
IGNvbHVtbiwgaW50IHBhZ2UpCj4+ICAgKgo+PiAgICogQG51bV9jdzoJCW51bWJlciBvZiBzdGVw
cyBmb3IgdGhlIHJlYWQvd3JpdGUgb3BlcmF0aW9uCj4+ICAgKiBAcmVhZDoJCXJlYWQgb3Igd3Jp
dGUgb3BlcmF0aW9uCj4+ICsgKiBAY3cJOgkJd2hpY2ggY29kZSB3b3JkCj4+ICAgKi8KPj4gLXN0
YXRpYyB2b2lkIHVwZGF0ZV9yd19yZWdzKHN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCwgaW50
IG51bV9jdywgCj4+IGJvb2wgcmVhZCkKPj4gK3N0YXRpYyB2b2lkIHVwZGF0ZV9yd19yZWdzKHN0
cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCwgaW50IG51bV9jdywgCj4+IGJvb2wgcmVhZCwgaW50
IGN3KQo+PiAgewo+PiAgCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSAmaG9zdC0+Y2hpcDsKPj4g
IAlzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjID0gZ2V0X3Fjb21fbmFuZF9jb250
cm9sbGVyKGNoaXApOwo+PiBAQCAtNzQwLDcgKzc2OCw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9y
d19yZWdzKHN0cnVjdCBxY29tX25hbmRfaG9zdCAKPj4gKmhvc3QsIGludCBudW1fY3csIGJvb2wg
cmVhZCkKPj4gIAluYW5kY19zZXRfcmVnKG5hbmRjLCBOQU5EX0VYRUNfQ01ELCAxKTsKPj4gCj4+
ICAJaWYgKHJlYWQpCj4+IC0JCW5hbmRjX3NldF9yZWFkX2xvYyhjaGlwLCAwLCAwLCAwLCBob3N0
LT51c2VfZWNjID8KPj4gKwkJbmFuZGNfc2V0X3JlYWRfbG9jKGNoaXAsIGN3LCAwLCAwLCBob3N0
LT51c2VfZWNjID8KPj4gIAkJCQkgICBob3N0LT5jd19kYXRhIDogaG9zdC0+Y3dfc2l6ZSwgMSk7
Cj4+ICB9Cj4+IAo+PiBAQCAtMTExMSwxOCArMTEzOSwzNCBAQCBzdGF0aWMgdm9pZCBjb25maWdf
bmFuZF9wYWdlX3JlYWQoc3RydWN0IAo+PiBuYW5kX2NoaXAgKmNoaXApCj4+ICAJCSAgICAgIE5B
TkRfRVJBU0VEX0NXX1NFVCB8IE5BTkRfQkFNX05FWFRfU0dMKTsKPj4gIH0KPj4gCj4+ICsvKiBo
ZWxwZXIgdG8gY2hlY2sgd2hpY2ggbG9jYXRpb24gcmVnaXN0ZXIgc2hvdWxkIGJlIHVzZSBmb3Ig
dGhpcwo+IAo+ICAgICAvKgo+ICAgICAgKiBDaGVjayB3aGljaCBsb2NhdGlvbi4uLgo+IAo+PiAr
ICogY29kZSB3b3JkLiBOQU5EX1JFQURfTE9DQVRJT04gb3IgTkFORF9SRUFEX0xPQ0FUSU9OX0xB
U1RfQ1cKPj4gKyAqLwo+PiArc3RhdGljIGJvb2wgY29uZmlnX2xvY19sYXN0X3JlZyhzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLCBpbnQgY3cpCj4+ICt7Cj4+ICsJc3RydWN0IHFjb21fbmFuZF9jb250
cm9sbGVyICpuYW5kYyA9IGdldF9xY29tX25hbmRfY29udHJvbGxlcihjaGlwKTsKPj4gKwlzdHJ1
Y3QgbmFuZF9lY2NfY3RybCAqZWNjID0gJmNoaXAtPmVjYzsKPj4gKwo+PiArCWlmIChuYW5kYy0+
cHJvcHMtPnFwaWNfdjIgJiYgcWNvbV9uYW5kY19pc19sYXN0X2N3KGVjYywgY3cpKQo+PiArCQly
ZXR1cm4gdHJ1ZTsKPiAKPiBOb3Qgc3VyZSB0aGlzIGlzIHJlYWxseSB1c2VmdWwsIGl0J3MgcHJv
YmFibHkgYmV0dGVyIHRvIGRyb3AgdGhpcwo+IGhlbHBlciBhbmQganVzdCB1c2UuLi4KPiAKPj4g
Kwo+PiArCXJldHVybiBmYWxzZTsKPj4gK30KPj4gIC8qCj4+ICAgKiBIZWxwZXIgdG8gcHJlcGFy
ZSBETUEgZGVzY3JpcHRvcnMgZm9yIGNvbmZpZ3VyaW5nIHJlZ2lzdGVycwo+PiAgICogYmVmb3Jl
IHJlYWRpbmcgZWFjaCBjb2Rld29yZCBpbiBOQU5EIHBhZ2UuCj4+ICAgKi8KPj4gIHN0YXRpYyB2
b2lkCj4+IC1jb25maWdfbmFuZF9jd19yZWFkKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGJvb2wg
dXNlX2VjYykKPj4gK2NvbmZpZ19uYW5kX2N3X3JlYWQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
Ym9vbCB1c2VfZWNjLCBpbnQgY3cpCj4+ICB7Cj4+ICAJc3RydWN0IHFjb21fbmFuZF9jb250cm9s
bGVyICpuYW5kYyA9IGdldF9xY29tX25hbmRfY29udHJvbGxlcihjaGlwKTsKPj4gKwlpbnQgcmVn
ID0gTkFORF9SRUFEX0xPQ0FUSU9OXzA7Cj4+ICsKPj4gKwlpZiAoY29uZmlnX2xvY19sYXN0X3Jl
ZyhjaGlwLCBjdykpCj4gCj4gLi4uICAgICBpZiAobmFuZGMtPnByb3BzLT5xcGljX3YyICYmIHFj
b21fbmFuZGNfaXNfbGFzdGN3KCkpIGhlcmUuCj4gCj4+ICsJCXJlZyA9IE5BTkRfUkVBRF9MT0NB
VElPTl9MQVNUX0NXXzA7Cj4+IAo+PiAgCWlmIChuYW5kYy0+cHJvcHMtPmlzX2JhbSkKPj4gLQkJ
d3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9SRUFEX0xPQ0FUSU9OXzAsIDQsCj4+IC0JCQkgICAg
ICBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4+ICsJCXdyaXRlX3JlZ19kbWEobmFuZGMsIHJlZywgNCwg
TkFORF9CQU1fTkVYVF9TR0wpOwo+PiAKPj4gIAl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0ZM
QVNIX0NNRCwgMSwgTkFORF9CQU1fTkVYVF9TR0wpOwo+PiAgCXdyaXRlX3JlZ19kbWEobmFuZGMs
IE5BTkRfRVhFQ19DTUQsIDEsIE5BTkRfQkFNX05FWFRfU0dMKTsKPj4gQEAgLTExNDIsMTIgKzEx
ODYsMTIgQEAgY29uZmlnX25hbmRfY3dfcmVhZChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCAKPj4g
Ym9vbCB1c2VfZWNjKQo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
