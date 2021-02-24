Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8892CC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 04:40:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25B1564E79
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 04:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25B1564E79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SUWx30kc8fs1zhmtpHVv28U9j+gMSl2smeHiOlcbC4A=; b=nTE9CvP/6SRG8kF34CH7Tj6J0
	AKnnqsyZbkHpxSejDoY8ZHOLQ5Ghj+jxrc1rAes7Edw/V0IIbvaK8cjG+XzTYWSJ0VX8SOfu9gs/X
	gZ1wsDkTjtx6zkWRaYfy4KbrddVrnH4se24CpxBo7DRKONvkLVfSVjxVZBF3cwRkHZ/+v15e1kJnW
	tgMCc2j+o+9tO6oGX73knRvFF3Qgxo/iK7qJx65QwHyFiOmc8iCC/ScPaTPGzDD9OtiZEKj33BKz5
	dcKWAuouvD4pJ8uvRCbG5HHsYJ/h/QAOerp1/i+JiuIyUISFk4nq2QnrbnLPOZjA+fzJsC511JBuW
	ef3IwxrDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEly3-00051H-Jh; Wed, 24 Feb 2021 04:40:07 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lElxz-00050t-5f
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 04:40:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614141603; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+B0mH6apvUdJkS+cEEk0LUEvE5wfHcYOXZMmbJjRkb0=;
 b=rI/3fg3sOwT9ZhCkfbQlp5ZlunSEwNSgyG7iJiTnZX3F4y24Ub8h3W9Dc9XSVgcsJegFs4OV
 reQTAZVf4pGda7hg9Xpe5iXy3dXsaqdCKRIslybXNvBXoHBSbFBD/G4Ib9wOzS43VXgBxKuc
 wGK3eXegeVohWvYKPfUy9PIeHaY=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6035d895090a7742874b9e10 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 04:39:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3EC71C43462; Wed, 24 Feb 2021 04:39:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A7DCC433C6;
 Wed, 24 Feb 2021 04:39:48 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 24 Feb 2021 10:09:48 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: update last code word register
In-Reply-To: <a5650f33b493b987d45525ea57fdfd8a@codeaurora.org>
References: <1614024267-12529-1-git-send-email-mdalam@codeaurora.org>
 <20210223173449.1a55df1e@xps13>
 <a5650f33b493b987d45525ea57fdfd8a@codeaurora.org>
Message-ID: <38da9d1d4a96f1b42ba0b194da265e6b@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_234004_080326_7E43645F 
X-CRM114-Status: GOOD (  24.97  )
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
Cc: mani@kernel.org, linux-kernel@vger.kernel.org,
 mdalam=codeaurora.org@codeaurora.org, linux-mtd@lists.infradead.org,
 boris.brezillon@collabora.com, sricharan@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMi0yNCAwMToxMywgbWRhbGFtQGNvZGVhdXJvcmEub3JnIHdyb3RlOgo+IE9uIDIw
MjEtMDItMjMgMjI6MDQsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhlbGxvLAo+PiAKPj4gTWQg
U2FkcmUgQWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPiB3cm90ZSBvbiBUdWUsIDIzIEZlYiAy
MDIxCj4+IDAxOjM0OjI3ICswNTMwOgo+PiAKPj4+IEZyb20gUVBJQyB2ZXJzaW9uIDIuMCBvbndh
cmRzIG5ldyByZWdpc3RlciBnb3QgYWRkZWQgdG8gcmVhZCBsYXN0Cj4+IAo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYSBuZXcKPj4gCj4+PiBjb2Rld29yZC4gVGhpcyBjaGFuZ2Ug
d2lsbCBhZGQgdGhlIFJFQURfTE9DQVRJT05fTEFTVF9DV19uIHJlZ2lzdGVyLgo+PiAKPj4gICAg
ICAgICAgICAgQWRkIHN1cHBvcnQgZm9yIHRoaXMgUkVBRF9MT0NBVElPTl9MQVNUX0NXX24gcmVn
aXN0ZXIuCj4+IAo+Pj4gCj4+PiBGb3IgZmlyc3QgdGhyZWUgY29kZSB3b3JkIFJFQURfTE9DQVRJ
T05fbiByZWdpc3RlciB3aWxsIGJlCj4+PiB1c2UuRm9yIGxhc3QgY29kZSB3b3JkIFJFQURfTE9D
QVRJT05fTEFTVF9DV19uIHJlZ2lzdGVyIHdpbGwgYmUKPj4+IHVzZS4KPj4gCj4+ICIKPj4gSW4g
dGhlIGNhc2Ugb2YgUVBJQyB2MiwgY29kZXdvcmRzIDAsIDEgYW5kIDIgd2lsbCBiZSBhY2Nlc3Nl
ZCB0aHJvdWdoCj4+IFJFQURfTE9DQVRJT05fbiwgd2hpbGUgY29kZXdvcmQgMyB3aWxsIGJlIGFj
Y2Vzc2VkIHRocm91Z2gKPj4gUkVBRF9MT0NBVElPTl9MQVNUX0NXX24uCj4+ICIKPj4gCj4+IFdo
ZW4gSSByZWFkIG15IG93biBzZW50ZW5jZSwgSSBmZWVsIHRoYXQgdGhlcmUgaXMgc29tZXRoaW5n
IHdyb25nLgo+PiBJZiB0aGVyZSBhcmUgb25seSA0IGNvZGV3b3JkcywgSSBndWVzcyBhIFFQSUMg
djIgaXMgYWJsZSB0byB1c2UKPj4gUkVBRF9MT0NBVElPTl8zIG9yIFJFQURfTE9DQVRJT05fTEFT
VF9DV18wIGludGVyY2hhbmdlYWJseS4gSXNuJ3QgaXQ/Cj4+IAo+PiBJIGd1ZXNzIHRoZSBwb2lu
dCBvZiBoYXZpbmcgdGhlc2UgImxhc3RfY3dfbiIgcmVnaXN0ZXJzIGlzIHRvIHN1cHBvcnQKPj4g
dXAgdG8gOCBjb2Rld29yZHMsIGFtIEkgd3Jvbmc/IElmIHRoaXMgdGhlIGNhc2UsIHRoZSBjdXJy
ZW50IHBhdGNoCj4+IGNvbXBsZXRlbHkgZmFpbHMgZG9pbmcgdGhhdCBJIGRvbid0IGdldCB0aGUg
cG9pbnQgb2Ygc3VjaCBjaGFuZ2UuCj4gCj4gVGhpcyByZWdpc3RlciBpcyBvbmx5IHVzZSB0byBy
ZWFkIGxhc3QgY29kZSB3b3JkLgo+IAo+IEkgaGF2ZSBhZGRyZXNzIGFsbCB0aGUgY29tbWVudHMg
ZnJvbSBhbGwgdGhlIHByZXZpb3VzIHN1YiBzZXF1ZW50Cj4gcGF0Y2hlcyBhbmQgcHVzaGVkCj4g
YWxsIHBhdGNoZXMgaW4gb25seSBvbmUgc2VyaWVzLgo+IAo+IFBsZWFzZSBjaGVjay4KCiAgVGhl
IHJlZ2lzdGVycyBSRUFEX0xPQ0FUSU9OICYgUkVBRF9MT0NBVElPTl9MQVNUIGFyZSBub3QgYXNz
b2NpYXRlZCAKd2l0aCBudW1iZXIgb2YgY29kZSB3b3Jkcy4KICBUaGVzZSB0d28gcmVnaXN0ZXJz
IGFyZSB1c2VkIHRvIGFjY2VzcyB0aGUgbG9jYXRpb24gaW5zaWRlIGEgY29kZSB3b3JkLiAKU28g
d2hldGhlciB3ZSBhcmUgaGF2aW5nIDQgY29kZSB3b3JkcwogIG9yIDggY29kZSB3b3JkcyBpdCBk
b2Vzbid0IG1hdHRlci4gSWYgd2Ugd2FudGVkIGFjY2VzcyB0aGUgbG9jYXRpb24gCndpdGhpbiBu
b3JtYWwgY29kZSB3b3JkIHdlIGhhdmUgdG8KICB1c2UgUkVBRF9MT0NBVElPTiByZWdpc3RlciBh
bmQgaWYgd2Ugd2FudGVkIHRvIGFjY2VzcyBsb2NhdGlvbiBpbiBsYXN0IApjb2RlIHdvcmQgdGhl
biB3ZSBoYXZlIHRvIHVzZQogIFJFQURfTE9DQVRJT05fTEFTVC4KPiAKPj4gCj4+PiBTaWduZWQt
b2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+Cj4+PiAtLS0KPj4g
Cj4+IFsuLi5dCj4+IAo+Pj4gIC8qIGhlbHBlciB0byBjb25maWd1cmUgYWRkcmVzcyByZWdpc3Rl
ciB2YWx1ZXMgKi8KPj4+IEBAIC03MDAsOCArNzI3LDkgQEAgc3RhdGljIHZvaWQgc2V0X2FkZHJl
c3Moc3RydWN0IHFjb21fbmFuZF9ob3N0IAo+Pj4gKmhvc3QsIHUxNiBjb2x1bW4sIGludCBwYWdl
KQo+Pj4gICAqCj4+PiAgICogQG51bV9jdzoJCW51bWJlciBvZiBzdGVwcyBmb3IgdGhlIHJlYWQv
d3JpdGUgb3BlcmF0aW9uCj4+PiAgICogQHJlYWQ6CQlyZWFkIG9yIHdyaXRlIG9wZXJhdGlvbgo+
Pj4gKyAqIEBjdwk6CQl3aGljaCBjb2RlIHdvcmQKPj4+ICAgKi8KPj4+IC1zdGF0aWMgdm9pZCB1
cGRhdGVfcndfcmVncyhzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgKmhvc3QsIGludCBudW1fY3csIAo+
Pj4gYm9vbCByZWFkKQo+Pj4gK3N0YXRpYyB2b2lkIHVwZGF0ZV9yd19yZWdzKHN0cnVjdCBxY29t
X25hbmRfaG9zdCAqaG9zdCwgaW50IG51bV9jdywgCj4+PiBib29sIHJlYWQsIGludCBjdykKPj4+
ICB7Cj4+PiAgCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSAmaG9zdC0+Y2hpcDsKPj4+ICAJc3Ry
dWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYyA9IAo+Pj4gZ2V0X3Fjb21fbmFuZF9jb250
cm9sbGVyKGNoaXApOwo+Pj4gQEAgLTc0MCw3ICs3NjgsNyBAQCBzdGF0aWMgdm9pZCB1cGRhdGVf
cndfcmVncyhzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgCj4+PiAqaG9zdCwgaW50IG51bV9jdywgYm9v
bCByZWFkKQo+Pj4gIAluYW5kY19zZXRfcmVnKG5hbmRjLCBOQU5EX0VYRUNfQ01ELCAxKTsKPj4+
IAo+Pj4gIAlpZiAocmVhZCkKPj4+IC0JCW5hbmRjX3NldF9yZWFkX2xvYyhjaGlwLCAwLCAwLCAw
LCBob3N0LT51c2VfZWNjID8KPj4+ICsJCW5hbmRjX3NldF9yZWFkX2xvYyhjaGlwLCBjdywgMCwg
MCwgaG9zdC0+dXNlX2VjYyA/Cj4+PiAgCQkJCSAgIGhvc3QtPmN3X2RhdGEgOiBob3N0LT5jd19z
aXplLCAxKTsKPj4+ICB9Cj4+PiAKPj4+IEBAIC0xMTExLDE4ICsxMTM5LDM0IEBAIHN0YXRpYyB2
b2lkIGNvbmZpZ19uYW5kX3BhZ2VfcmVhZChzdHJ1Y3QgCj4+PiBuYW5kX2NoaXAgKmNoaXApCj4+
PiAgCQkgICAgICBOQU5EX0VSQVNFRF9DV19TRVQgfCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4+PiAg
fQo+Pj4gCj4+PiArLyogaGVscGVyIHRvIGNoZWNrIHdoaWNoIGxvY2F0aW9uIHJlZ2lzdGVyIHNo
b3VsZCBiZSB1c2UgZm9yIHRoaXMKPj4gCj4+ICAgICAvKgo+PiAgICAgICogQ2hlY2sgd2hpY2gg
bG9jYXRpb24uLi4KPj4gCj4+PiArICogY29kZSB3b3JkLiBOQU5EX1JFQURfTE9DQVRJT04gb3Ig
TkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1cKPj4+ICsgKi8KPj4+ICtzdGF0aWMgYm9vbCBjb25m
aWdfbG9jX2xhc3RfcmVnKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBjdykKPj4+ICt7Cj4+
PiArCXN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMgPSAKPj4+IGdldF9xY29tX25h
bmRfY29udHJvbGxlcihjaGlwKTsKPj4+ICsJc3RydWN0IG5hbmRfZWNjX2N0cmwgKmVjYyA9ICZj
aGlwLT5lY2M7Cj4+PiArCj4+PiArCWlmIChuYW5kYy0+cHJvcHMtPnFwaWNfdjIgJiYgcWNvbV9u
YW5kY19pc19sYXN0X2N3KGVjYywgY3cpKQo+Pj4gKwkJcmV0dXJuIHRydWU7Cj4+IAo+PiBOb3Qg
c3VyZSB0aGlzIGlzIHJlYWxseSB1c2VmdWwsIGl0J3MgcHJvYmFibHkgYmV0dGVyIHRvIGRyb3Ag
dGhpcwo+PiBoZWxwZXIgYW5kIGp1c3QgdXNlLi4uCj4+IAo+Pj4gKwo+Pj4gKwlyZXR1cm4gZmFs
c2U7Cj4+PiArfQo+Pj4gIC8qCj4+PiAgICogSGVscGVyIHRvIHByZXBhcmUgRE1BIGRlc2NyaXB0
b3JzIGZvciBjb25maWd1cmluZyByZWdpc3RlcnMKPj4+ICAgKiBiZWZvcmUgcmVhZGluZyBlYWNo
IGNvZGV3b3JkIGluIE5BTkQgcGFnZS4KPj4+ICAgKi8KPj4+ICBzdGF0aWMgdm9pZAo+Pj4gLWNv
bmZpZ19uYW5kX2N3X3JlYWQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgYm9vbCB1c2VfZWNjKQo+
Pj4gK2NvbmZpZ19uYW5kX2N3X3JlYWQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgYm9vbCB1c2Vf
ZWNjLCBpbnQgY3cpCj4+PiAgewo+Pj4gIAlzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5h
bmRjID0gCj4+PiBnZXRfcWNvbV9uYW5kX2NvbnRyb2xsZXIoY2hpcCk7Cj4+PiArCWludCByZWcg
PSBOQU5EX1JFQURfTE9DQVRJT05fMDsKPj4+ICsKPj4+ICsJaWYgKGNvbmZpZ19sb2NfbGFzdF9y
ZWcoY2hpcCwgY3cpKQo+PiAKPj4gLi4uICAgICBpZiAobmFuZGMtPnByb3BzLT5xcGljX3YyICYm
IHFjb21fbmFuZGNfaXNfbGFzdGN3KCkpIGhlcmUuCj4+IAo+Pj4gKwkJcmVnID0gTkFORF9SRUFE
X0xPQ0FUSU9OX0xBU1RfQ1dfMDsKPj4+IAo+Pj4gIAlpZiAobmFuZGMtPnByb3BzLT5pc19iYW0p
Cj4+PiAtCQl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX1JFQURfTE9DQVRJT05fMCwgNCwKPj4+
IC0JCQkgICAgICBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4+PiArCQl3cml0ZV9yZWdfZG1hKG5hbmRj
LCByZWcsIDQsIE5BTkRfQkFNX05FWFRfU0dMKTsKPj4+IAo+Pj4gIAl3cml0ZV9yZWdfZG1hKG5h
bmRjLCBOQU5EX0ZMQVNIX0NNRCwgMSwgTkFORF9CQU1fTkVYVF9TR0wpOwo+Pj4gIAl3cml0ZV9y
ZWdfZG1hKG5hbmRjLCBOQU5EX0VYRUNfQ01ELCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4+PiBA
QCAtMTE0MiwxMiArMTE4NiwxMiBAQCBjb25maWdfbmFuZF9jd19yZWFkKHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsIAo+Pj4gYm9vbCB1c2VfZWNjKQo+PiAKPj4gVGhhbmtzLAo+PiBNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
