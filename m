Return-Path: <SRS0=de6p=NP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01137C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 07:17:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2CC161373
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 07:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2CC161373
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGKuWZ/LgL3Axy56vf1vtZacW5Az7zhctewsE+3T2dA=; b=whLG2CdBj7kpXG
	CXEStNn1u64baElslqaxF/tKeP4o+NSbz438HrkAb3poVE0opc3vq2ODejUf36IQJilxKO46kEciv
	yW4laDZJT3XBwIy0aUAcT9BsvYINFVf/Q+7wF+oqnsWdGn40VnI8aK0tOeVFIyhOsQsYoAETDJ1Qp
	Qfm+YaXgxBkxHnzu+9YQ3qY/DoXmcPoU1Sz9DV4gxxPqoCvj5WQhssQJAitXuNgv/U32E4hgCKyf+
	inK7hfwaCeme69YID0Dur1WVBlcylkUMg4IbuKXo4pzeqCTpR360UKQSKMy+FaKJqKPvKTSJsD9L8
	nol7An8HQcPvftBO88sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIQfS-0020p9-4x; Tue, 24 Aug 2021 07:16:18 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIQfL-0020iJ-1Z
 for linux-mtd@lists.infradead.org; Tue, 24 Aug 2021 07:16:16 +0000
Received: by mail-qk1-x731.google.com with SMTP id e14so22098855qkg.3
 for <linux-mtd@lists.infradead.org>; Tue, 24 Aug 2021 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nO6QiAuYOKzYLFYQBkUMt83uxXuhMKn+vcrDe8N7Myw=;
 b=NQCYPJsFE+cz8oLZHaLKvY1hapGUvckIn/W+LHhbvL5Fp1vemWnh1xrf3aQDcJ5eOe
 yv91HjjzPxo7qNua6HdCAyiRs6bl+HUJpQnjqmC++f08jJUMbHYq4e7UnwPuodVKG6fB
 5TuhgxQfUyHCgptMWAYv1pCsxxNXZmqDLzbSWhX52I3xajobS4nm/aBf+D96fTP2SCJd
 e+bQ9k+dTFT++1xCNvr+4yzWquIP0xF60rMfmmb0Asn7h0CjUo7E7CLy0JbSUVgBHUqy
 9tlZcnsEz19hWmpduZjuq2LNsNfd+nNkqBRAh7biLIG6cpPmIoK1UkdI4JDQoh8IoXjY
 MsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nO6QiAuYOKzYLFYQBkUMt83uxXuhMKn+vcrDe8N7Myw=;
 b=lYUirGg6fTHGDZE9PfnHU37EcbG/7oW3fp7LSZFRtLzCRtMikBP/9ieP3J+0c+C0fE
 VrV2jI0sv5AxheUI0mv7zSsdiC8UufqzHbZDw3n/BxKVBhe4CsYEDIfPLUYuY46GhaH2
 4LVxUWrOqEplrwLRGqIjBbFpkjKnEXslO/6ZWXeVTy+owx5XJCsgcHxmxYtyTO/HAEhz
 OJlolb8lhDjJNGbwjiGHjWM/GgdM1Av3lpjFKJxhYSJIhGF6gYdKeI7sfrRQG2fbJsmM
 lNik+q1J09Eyg9rSG1OJ7ddNmGnX9keZP0iy3FbD1s0S0lsGwcZb/YfEmuDoWhxEgFjn
 KXPA==
X-Gm-Message-State: AOAM531g0HU88yJq/hAsQnaMQiyc+m7wyWDRBXh2ldDxB398TtEx8RiP
 4MBvAU9VbEfCNhQXiTOau35hR8r15BPeoYtmkUM4i3W7w/A1zw==
X-Google-Smtp-Source: ABdhPJz1r887+fiHyImSLRfbYswX0aTfUiZbEql2lYXW6rOZPN0K63Xp580mRKNZSBrtbO4LPH+VibGz8+k96mxl12s=
X-Received: by 2002:a05:620a:1655:: with SMTP id
 c21mr26076061qko.187.1629789360322; 
 Tue, 24 Aug 2021 00:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210808072643.GA5084@ubuntu> <20210816093126.442f74a1@xps13>
 <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
 <20210819100334.6af2d86e@xps13>
 <CAE9cyGSF2vTCptSZd3uMFaZPD=as=PwZY14S+zDhzjWCmsfmpQ@mail.gmail.com>
 <20210823172413.0bc4ab3a@xps13>
In-Reply-To: <20210823172413.0bc4ab3a@xps13>
From: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Date: Tue, 24 Aug 2021 09:15:49 +0200
Message-ID: <CAE9cyGTKFcMuxePo2SgxkBe_cWvP5nZ_SDcnuUtwaE5o9oVq3g@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_001611_109004_00643352 
X-CRM114-Status: GOOD (  23.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCkFtIE1vLiwgMjMuIEF1Zy4gMjAyMSB1bSAxNzoyNCBVaHIgc2NocmllYiBN
aXF1ZWwgUmF5bmFsCjxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPgo+IEhpIEtlc3RyZWws
Cj4KPiBLZXN0cmVsIHNldmVudHlmb3VyIDxrZXN0cmVsc2V2ZW50eWZvdXJAZ21haWwuY29tPiB3
cm90ZSBvbiBNb24sIDIzIEF1Zwo+IDIwMjEgMTM6MTk6NDMgKzAyMDA6Cj4KPiA+IEhpIE1pcXXD
qGwsCj4gPgo+ID4gQW0gRG8uLCAxOS4gQXVnLiAyMDIxIHVtIDEwOjAzIFVociBzY2hyaWViIE1p
cXVlbCBSYXluYWwKPiA+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKLi4uCj4gPgo+ID4g
dGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlLgo+ID4gSWYgSSByZW1vdmUgdGhlIG5hbmQtZWNj
LXh4eCBwcm9wZXJ0aWVzIGluIHRoZSBkZXZpY2UgdHJlZSwgdGhlIGRldmljZSB3aXRoCj4gPiB0
aGUgVG9zaGliYSBOQU5EIGNoaXAgaXMgd29ya2luZy4gSG93ZXZlciwgdGhlIGRldmljZSB3aXRo
IHRoZSBNaWNyb24KPiA+IE5BTkQgZmFpbHMgd2l0aCBOTyBFQ0MgZnVuY3Rpb25zIHN1cHBsaWVk
OyBoYXJkd2FyZSBFQ0Mgbm90IHBvc3NpYmxlLAo+ID4gc2VlbXMgdG8gYmUgYXQgbGluZSA1MzY3
IG9yIGVxdWl2YWxlbnQuCj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jI0w1MzY3Cj4gPgo+ID4g
SXQgbG9va3MgbGlrZSB0aGUgbWljcm9uIG5hbmQgZHJpdmVyIHN1cHBvcnRzIG9uIGRpZSBvbmx5
IGlmIGl0cwo+ID4gc3BlY2lmaWVkIGludCB0aGUKPiA+IERldmljZSB0cmVlOgo+ID4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX21pY3Jvbi5jI0w1MTEKPiA+IFRoZSBNaWNyb24gTkFORCBkcml2ZXIgcHJvYmFi
bHkgbmVlZHMgdG8gc2V0IHRoZSBFQ0MgdHlwZSB0byBPTiBESUUgaWYgdGhlCj4gPiB2YXJpYWJs
ZSBvbmRpZSBjb250YWlucyB0aGUgc3VwcG9ydGVkIGF0dHJpYnV0ZT8hCj4KPiBZb3UncmUgcmln
aHQgYnV0IEkgZG9uJ3Qgc2VlIGFueSBlYXN5IHVwc3RyZWFtLWFibGUgc29sdXRpb24gaGVyZS4K
PiBDaGFuZ2luZyB0aGUgYmVoYXZpb3IgaW4gdGhlIFh3YXkgZHJpdmVyIHdvdWxkIGNlcnRhaW5s
eSBicmVhayB1c2VycywKPiBjaGFuZ2luZyB0aGUgYmVoYXZpb3IgaW4gdGhlIE1pY3JvbiBkcml2
ZXIgd291bGQgY2VydGFpbmx5IGJyZWFrIGV2ZW4KPiBtb3JlIHVzZXJzLiBUaGUgcm9vdCBjYXVz
ZSBiZWluZyBhbiBhYnNlbmNlIG9mIHByb3BlciBkZXNjcmlwdGlvbiAodGhlCj4gaW50ZWdyYXRp
b24gY2hhbmdlZCkuIEhvbmVzdGx5IEkgZmVlbCBzdHVjaywgbWF5YmUgeW91IGNhbiB0cnkgdG8K
PiByZWdpc3RlciB5b3VyIGRldmljZSwgaWYgaXQgZmFpbHMsIGNoYW5nZSB0aGUgaW50ZWdyYXRp
b24gaW4gdGhlIGRyaXZlcgo+ICh0byBhbiBvbmRpZSBlY2MgZW5naW5lKSB0aGVuIHJldHJ5Pwo+
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCkRvIHlvdSB0aGluayBhZGRpbmcgc29tZXRoaW5nIGxpa2Ug
YmVsb3cgYXQgdGhlIGZvbGxvd2luZyBsb2NhdGlvbgpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jI0wy
MjMKd291bGQgYmUgdXBzdHJlYW1hYmxlICh3aXRoIG9yIHdpdGhvdXQgZGV2aWNlIHRyZWUgcHJv
cGVydHk/KT8KCiAgICAgICAgZXJyID0gbmFuZF9zY2FuKCZkYXRhLT5jaGlwLCAxKTsKICAgICAg
ICBpZiAoZXJyIC8qICYmIG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImxhbnRpcSxyZXRyeS1v
bi1kaWUiKSAqLykgewogICAgICAgICAgICAgICAgZGF0YS0+Y2hpcC5lY2MuZW5naW5lX3R5cGUg
PSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9ESUU7CiAgICAgICAgICAgICAgICBlcnIgPSBuYW5k
X3NjYW4oJmRhdGEtPmNoaXAsIDEpOwogICAgICAgICAgICAgICAgaWYgKGVycikgcmV0dXJuIGVy
cjsKICAgICAgICB9CgpJdCBzdGlsbCB0aHJvd3MgdGhlIGtlcm5lbCB3YXJuaW5nIG9uIGZpcnN0
IHRyeSwgYnV0IHRoZSBzZWNvbmQgdHJ5IHRoZW4gd29ya3MuCgpUaGFua3MgRGFuaWVsLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
