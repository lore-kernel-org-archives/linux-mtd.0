Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30F4C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:51:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A48120728
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:51:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XYUys+MC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ol+eJ+Jb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A48120728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hvvR4bgUKH3LN3IiYy22nk6Zl/ZuNrq8O9qF1tiJHc=; b=XYUys+MCHSUi10
	tR1aLPsYMP5MUbzOZcisEJvN9LOR/77f97pYRFnJnRJOpt+99dxpxPrr2xIk+1SpXbfk90PgY7b5i
	X+lpyEtw2vYm2/r+5pnpyxmj5/88GRJk+PRcCNTSCQuVr9cA9QNT/1Xm9Rf+6fc8eUAPtyfTMMKdl
	HreIyK9bzgffzXeQgDGfw9tKbestGUlbuKCKx2OfhIHyDomnyXOyreEJfO42Z+3u1eys43482dNhj
	gMlwNZhxt2uwGDCyfFXsK9qTpfx1Z62Q1A6SyT3Fxr+Gne+r1crOTmAXb3DOOAY6TDRjC8BGTey2U
	kkDgqVyH7xO0nfGiEYvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8qP-0004Ch-H4; Mon, 27 Apr 2020 18:51:05 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8qI-00043i-T0
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:51:00 +0000
Received: by mail-ot1-x342.google.com with SMTP id m18so28040537otq.9
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2020 11:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z1hz0Z/0NCV38DY2leFObwqh/KPFxfFyYcHe4Xnp7o0=;
 b=Ol+eJ+JbIiKuUvuXlRCCH03C25BdK+SOXXfTY9I4zRbftGLjn6PpPp9FndsSyQcNWq
 K2CEqCgfXI66nGUh1Cp2NyohPuknyMS+VYS8zDV31XpR/6xt066NMRFkgfdCb/RoQg92
 Qxl1LCkwi1vD2aLZl5m/lniwYmZHUH23umCYUv+KM/4tKbbfDw/GNznoKUGPodwpzdjK
 wJg1gz1pwTvIOnGf0fWk/2RfD9ViCJ/SGWSQgkjXRVmV0CgumqZh3MuvZCWu+b6YanFy
 QZFCJOFc6Nxmkos21lhG3lJI/Ndn4EKwJmWKQFFmzRhRzHrh8uuiqqFC3ChT0sVho1CQ
 rdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z1hz0Z/0NCV38DY2leFObwqh/KPFxfFyYcHe4Xnp7o0=;
 b=gBT2w9EPivgDMGajbvF8U2AzYx4pwczmq7XqvoxLtFgggkMCAIVwii8BYX1BIVEAt1
 +FMwAX1sJBk7Gr8p36CFzIRFvO/RTIXiJztirZkCzv2Uahbdzm4O7/HIa8djlwITxVm/
 OuVJgBANhxJsdHsZ68gUKi4bS5TWjwXGHQN1fs8itL12a5keD4jRqzE69Y4PmXO2ztZT
 0iu+spvapZe1gzgXi9prqA3nm+q4rn7SIafk3gDiKWRlPdnLr3jf7V4d0rtHxFfZO21x
 CYQqB+IpRYprIMWbaYSZ8HvTZQW7L09BJF3wzytKKo1NSkCRAjbCYiyghdZ8CJYy+lS+
 mTNA==
X-Gm-Message-State: AGi0PuZHHZvBaxgcwerCQEQBzDujfezq7LTA1hhpaaiDOFsi3otWPaGv
 FOz74a/Wr8dBY+Py2Gzso4u2APcHwzck2fEzeC4=
X-Google-Smtp-Source: APiQypKSCdfjTCFrR2PTf6YAQ16Zte1yoeNF/Qntpc+ByiEf8Pa8bQjn2a7nsqfq+GVTxd6P+qOHXvQvRmnS20tm2gc=
X-Received: by 2002:a9d:1429:: with SMTP id h38mr19860916oth.285.1588013457456; 
 Mon, 27 Apr 2020 11:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com> <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com> <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com> <20200330092722.2ff41863@xps13>
 <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
 <20200401094148.1786d48a@xps13> <20200427111623.5f93842d@collabora.com>
 <20200427114954.4fc0e8fc@collabora.com> <20200427164138.05076f3a@xps13>
 <CAP6exYJbpmxQztCOHum-k_CqmCDrJewZaYWk-Bsxy2dsYibbaQ@mail.gmail.com>
In-Reply-To: <CAP6exYJbpmxQztCOHum-k_CqmCDrJewZaYWk-Bsxy2dsYibbaQ@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 27 Apr 2020 11:50:46 -0700
Message-ID: <CAP6exYKtHVZrs=v+g+XU0Rx9qvFZ+xj9St7=ZZV+JLHSQy0BaA@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_115058_945075_93796899 
X-CRM114-Status: GOOD (  45.29  )
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
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SSB3aWxsIGFkZCB0aGF0IHRoZSBzeW50YXggbG9va3MgbGVzcyBuaWNlIHRvIG1lIHRoYW4gdGhl
IFtdIG5vdGF0aW9uCmJ1dCBzdGlsbCAuLi4gaXQgc2hvdWxkIHdvcmsuCgpPbiBNb24sIEFwciAy
NywgMjAyMCBhdCAxMTo0OCBBTSByb24gbWlubmljaCA8cm1pbm5pY2hAZ21haWwuY29tPiB3cm90
ZToKPgo+IEknbSBmaW5lIHdpdGggdGhhdC4gSSBoYXZlIG5vdCBoYWQgYSBjaGFuY2UgdG8gdGVz
dCBpdCBidXQgaXQgc2hvdWxkIGJlIGZpbmUuCj4KPiBPbiBNb24sIEFwciAyNywgMjAyMCBhdCA3
OjQxIEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+
ID4KPiA+IEhpIFJvbiwKPiA+Cj4gPiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBj
b2xsYWJvcmEuY29tPiB3cm90ZSBvbiBNb24sIDI3IEFwcgo+ID4gMjAyMCAxMTo0OTo1NCArMDIw
MDoKPiA+Cj4gPiA+IE9uIE1vbiwgMjcgQXByIDIwMjAgMTE6MTY6MjMgKzAyMDAKPiA+ID4gQm9y
aXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gPiA+
Cj4gPiA+ID4gSGkgYWxsLAo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCAxIEFwciAyMDIwIDA5OjQx
OjQ4ICswMjAwCj4gPiA+ID4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+IEhpIHJvbiwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBy
b24gbWlubmljaCA8cm1pbm5pY2hAZ21haWwuY29tPiB3cm90ZSBvbiBNb24sIDMwIE1hciAyMDIw
IDA4OjUzOjIyCj4gPiA+ID4gPiAtMDcwMDoKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIE1vbiwg
TWFyIDMwLCAyMDIwIGF0IDEyOjI3IEFNIE1pcXVlbCBSYXluYWwKPiA+ID4gPiA+ID4gPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFdv
dWxkIGl0IGJlIGhhcmQgdG8gc3VwcG9ydCBhbiBleHRyYSAnOicgYWZ0ZXIgdGhlIE1URCBkZXZp
Y2UgbmFtZT8KPiA+ID4gPiA+ID4gPiBUaGlzIHdheSB3b3VsZCB3b3VsZCBhbGxvdyBhbnl0aGlu
ZyBpbnNpZGUgdGhlIG9wdGlvbmFsICcoJyAnKScgYnV0Cj4gPiA+ID4gPiA+ID4gd291bGQga2Vl
cCB0aGUgdHJhaWxpbmcgJzonLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gdG9UYXk6Cj4g
PiA+ID4gPiA+ID4gICAgICAgICBtdGRwYXJ0cz1uYW1lOnBhcnQxLHBhcnQyCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBTbzoKPiA+ID4gPiA+ID4gPiAgICAgICAgIG10ZHBhcnRzPSgwMDAw
OjAwOjFmLjUpOjI1MTY1ODI0KEJJT1MpLC0oc3F1YXNoZnMpCj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IEkgdGhvdWdodCBhYm91dCB0aGF0ICc6JyB0b28uIEl0IGRvZXMgYWRk
IGEgYml0IG1vcmUgdG8gdGhlIGNvZGUsIGFuZAo+ID4gPiA+ID4gPiBhIGJpdCBtb3JlIGluIHRo
ZSB3YXkgb2YgZXJyb3IgY2FzZXMuIEkgYWx3YXlzIHdvcnJ5LCB3aGVuIGNvZGUgaXMKPiA+ID4g
PiA+ID4gZ29pbmcgaW50byBmbGFzaCwKPiA+ID4gPiA+ID4gYWJvdXQgZXJyb3JzIHdoZXJlIHNv
bWV0aGluZyBsb29rcyBjbG9zZSB0byByaWdodCBidXQgaXMgd3JvbmcuIChzYXlzCj4gPiA+ID4g
PiA+IHRoZSBwZXJzb24gd2hvIGp1c3QgdHlwZWQgaXQgaW5zdGVhZCBvZiBpcyBhIGZldyB0aW1l
cyA6LSkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gV2hhdCBpZiB3ZSBkaWQgdGhpczoKPiA+ID4g
PiA+ID4gbXRkcGFydHM9WzAwMDA6MDA6MWYuNV0yNTE2NTgyNChCSU9TKSwtKHNxdWFzaGZzKQo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJcyB0aGUgIl0iICdlbm91Z2ggZGlmZmVyZW50JyB0aGF0
IHdlIGRvIG5vdCBuZWVkIHRoZSAnOic/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkga2luZCBv
ZiBsaWtlIHRoZSBbXSBiZXR0ZXIgYW55d2F5IGFzIGl0IG1ha2VzIHRoZSBtdGRpZCBzdGFuZCBv
dXQgYQo+ID4gPiA+ID4gPiBiaXQgbW9yZSBmcm9tIHRoZSBwYXJ0IG5hbWVzPyBCdXQgaXMgaXQg
ZW5vdWdoIHRoYXQgd2UgZG9uJ3QgbmVlZCB0aGUKPiA+ID4gPiA+ID4gJzonPyBXb3VsZCB5b3Ug
c3RpbGwgcHJlZmVyIHRoZSAoKSBhcyBvcHBvc2VkIHRvIHRoZSBbXT8KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBJIGxpa2UgdGhlIFtdIGFzIHdlbGwsIG1heWJlIG1vcmUgdGhhbiAoKSBiZWNhdXNlIGF0
IGxlYXN0IGl0IGRvZXMgbm90Cj4gPiA+ID4gPiBjb25mbGljdCB3aXRoIHRoZSBwYXJ0aXRpb24g
bmFtZXMuIEJ1dCBJIHJlYWxseSBwcmVmZXIga2VlcGluZyB0aGUgOiBpZgo+ID4gPiA+ID4gdGhl
IGNvZGUgaXMgc3RpbGwgcmVhZGFibGUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSXQgaXMgbXVjaCBl
YXNpZXIgdG8gZXhwbGFpbiB0byBwZW9wbGUgOiAiaWYgeW91IGhhdmUgYSA6IGluIHRoZSBuYW1l
LAo+ID4gPiA+ID4gZW5jbG9zZSBpdCB3aXRoIFtdIi4KPiA+ID4gPgo+ID4gPiA+IFNvcnJ5IHRv
IGNoaW1lIGluIHNvIGxhdGUgaW4gdGhlIGRpc2N1c3Npb24sIGJ1dCBJIHdvbmRlciBpZiBhbnkg
b2YKPiA+ID4gPiB0aGF0IGlzIG5lY2Vzc2FyeS4gQ2FuJ3Qgd2UganVzdCBzcGxpdCB0aGUgc3Ry
aW5nIHBlciBkZXZpY2UgKHNwbGl0Cj4gPiA+ID4gc3RyaW5ncyBldmVyeSB0aW1lIHdlIHNlZSBh
ICc7JyksIGFuZCB0aGVuIGZpbmQgdGhlIGxhc3QgJzonIGluIGVhY2ggb2YKPiA+ID4gPiB0aG9z
ZSBzdHJpbmdzIGFuZCBjb25zaWRlciBldmVyeXRoaW5nIGJlZm9yZSB0aGF0IGxhc3QgJzonIHRv
IGJlIHRoZSBNVEQKPiA+ID4gPiBuYW1lLiBUaGF0IHNob3VsZCB3b3JrIGV2ZW4gaWYgdGhlIE1U
RCBuYW1lIGNvbnRhaW5zIG9uZSBvciBtb3JlICc6Jy4KPiA+ID4gPgo+ID4gPiA+IERvbid0IGdl
dCBtZSB3cm9uZywgSSdtIHBlcmZlY3RseSBmaW5lIHdpdGggaW50ZWwgZW5jbG9zaW5nIHRoZSBQ
Q0kKPiA+ID4gPiBhZGRyZXNzIGluIFtdIHRvIG1ha2UgaXQgY2xlYXJlciwgYnV0IEkgc2VlIHRo
YXQgb3RoZXIgZHJpdmVycyB1c2UgJzonCj4gPiA+ID4gaW4gdGhlaXIgTVREIGRldmljZSBuYW1l
cyAodGhlIGF0bWVsIHJhdyBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIHRvIG5hbWUKPiA+ID4gPiBv
bmUpLCBzbyBJIHRoaW5rIGl0J2QgYmUgZ29vZCB0byBtYWtlIHRoZSBtdGQgcGFydCBwYXJzaW5n
IHJvYnVzdCB0bwo+ID4gPiA+IHRoaXMgdXNlIGNhc2UuCj4gPiA+Cj4gPiA+IEkganVzdCBnYXZl
IGl0IGEgdHJ5IGFuZCB0aGUgZm9sbG93aW5nIHBhdGNoIHNob3VsZCBzb2x2ZSB0aGUgcHJvYmxl
bQo+ID4gPiAob25seSBjb21waWxlLXRlc3RlZCkuIEFzIEkgc2FpZCBwcmV2aW91c2x5LCBpdCBk
b2Vzbid0IHByZXZlbnQgeW91IGZyb20KPiA+ID4gZW5jbG9zaW5nIHRoZSBQQ0kgYWRkcmVzcyBp
biBbXSBpZiB5b3UgdGhpbmsgaXQncyBjbGVhcmVyLCBidXQgSSB0aGluawo+ID4gPiB0aGUgcHJv
YmxlbSBzaG91bGQgYmUgYWRkcmVzc2VkIGluIHRoZSBjbWRsaW5lIHBhcnNlciBhbnl3YXkuCj4g
PiA+Cj4gPiA+IC0tLT44LS0tCj4gPiA+IEZyb20gMDhiMzA1OTdkZDczZWZkOWM0YzhkMTkwNmFi
MDJhOTU0MDg3NTQxOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+ID4gRnJvbTogQm9yaXMg
QnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+ID4gRGF0ZTogTW9u
LCAyNyBBcHIgMjAyMCAxMTo0NDo1MCArMDIwMAo+ID4gPiBTdWJqZWN0OiBbUEFUQ0hdIG10ZDog
cGFyc2VyOiBjbWRsaW5lOiBTdXBwb3J0IE1URCBuYW1lcyBjb250YWluaW5nIG9uZSBvcgo+ID4g
PiAgbW9yZSBjb2xvbnMKPiA+ID4KPiA+ID4gTG9va3MgbGlrZSBzb21lIGRyaXZlcnMgZGVmaW5l
IE1URCBuYW1lcyB3aXRoIGEgY29sb24gaW4gaXQsIHRodXMKPiA+ID4gbWFraW5nIG10ZHBhcnQ9
IHBhcnNpbmcgaW1wb3NzaWJsZS4gTGV0J3MgZml4IHRoZSBwYXJzZXIgdG8gZ3JhY2VmdWxseQo+
ID4gPiBoYW5kbGUgdGhhdCBjYXNlOiB0aGUgbGFzdCAnOicgaW4gYSBwYXJ0aXRpb24gZGVmaW5p
dGlvbiBzZXF1ZW5jZSBpcwo+ID4gPiBjb25zaWRlcmVkIGluc3RlYWQgb2YgdGhlIGZpcnN0IG9u
ZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6
aWxsb25AY29sbGFib3JhLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL210ZC9wYXJzZXJz
L2NtZGxpbmVwYXJ0LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKy0tLQo+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL2NtZGxpbmVwYXJ0LmMgYi9kcml2ZXJzL210
ZC9wYXJzZXJzL2NtZGxpbmVwYXJ0LmMKPiA+ID4gaW5kZXggYzg2ZjJkYjhjODgyLi4wNjI1YjI1
NjIwY2EgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvY21kbGluZXBhcnQu
Ywo+ID4gPiArKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2NtZGxpbmVwYXJ0LmMKPiA+ID4gQEAg
LTIxOCwxMiArMjE4LDI5IEBAIHN0YXRpYyBpbnQgbXRkcGFydF9zZXR1cF9yZWFsKGNoYXIgKnMp
Cj4gPiA+ICAgICAgICAgICAgICAgc3RydWN0IGNtZGxpbmVfbXRkX3BhcnRpdGlvbiAqdGhpc19t
dGQ7Cj4gPiA+ICAgICAgICAgICAgICAgc3RydWN0IG10ZF9wYXJ0aXRpb24gKnBhcnRzOwo+ID4g
PiAgICAgICAgICAgICAgIGludCBtdGRfaWRfbGVuLCBudW1fcGFydHM7Cj4gPiA+IC0gICAgICAg
ICAgICAgY2hhciAqcCwgKm10ZF9pZDsKPiA+ID4gKyAgICAgICAgICAgICBjaGFyICpwLCAqbXRk
X2lkLCAqc2VtaWNvbDsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgIC8qCj4gPiA+ICsgICAg
ICAgICAgICAgICogUmVwbGFjZSB0aGUgZmlyc3QgJzsnIGJ5IGEgTlVMTCBjaGFyIHNvIHN0cnJj
aHIgY2FuIHdvcmsKPiA+ID4gKyAgICAgICAgICAgICAgKiBwcm9wZXJseS4KPiA+ID4gKyAgICAg
ICAgICAgICAgKi8KPiA+ID4gKyAgICAgICAgICAgICBzZW1pY29sID0gc3RyY2hyKHMsICc7Jyk7
Cj4gPiA+ICsgICAgICAgICAgICAgaWYgKHNlbWljb2wpCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAqc2VtaWNvbCA9ICdcMCc7Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICAgbXRkX2lkID0g
czsKPiA+ID4KPiA+ID4gLSAgICAgICAgICAgICAvKiBmZXRjaCA8bXRkLWlkPiAqLwo+ID4gPiAt
ICAgICAgICAgICAgIHAgPSBzdHJjaHIocywgJzonKTsKPiA+ID4gKyAgICAgICAgICAgICAvKgo+
ID4gPiArICAgICAgICAgICAgICAqIGZldGNoIDxtdGQtaWQ+LiBXZSB1c2Ugc3RycmNociB0byBp
Z25vcmUgYWxsICc6JyB0aGF0IGNvdWxkCj4gPiA+ICsgICAgICAgICAgICAgICogYmUgcHJlc2Vu
dCBpbiB0aGUgTVREIG5hbWUsIG9ubHkgdGhlIGxhc3Qgb25lIGlzIGludGVycHJldGVkCj4gPiA+
ICsgICAgICAgICAgICAgICogYXMgYW4gPG10ZC1pZD4vPHBhcnQtZGVmaW5pdGlvbj4gc2VwYXJh
dG9yLgo+ID4gPiArICAgICAgICAgICAgICAqLwo+ID4gPiArICAgICAgICAgICAgIHAgPSBzdHJy
Y2hyKHMsICc6Jyk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAvKiBSZXN0b3JlIHRoZSAn
Oycgbm93LiAqLwo+ID4gPiArICAgICAgICAgICAgIGlmIChzZW1pY29sKQo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgKnNlbWljb2wgPSAnOyc7Cj4gPiA+ICsKPiA+ID4gICAgICAgICAgICAg
ICBpZiAoIXApIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHByX2Vycigibm8gbXRkLWlk
XG4iKTsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4KPiA+
IFRoaXMgaXMgYWxzbyB0aGUgYXBwcm9hY2ggSSBsaWtlIHRoZSBtb3N0LiBJdCBhdm9pZHMgbW9k
aWZ5aW5nIHRoZQo+ID4gc3ludGF4IG9uIHRoZSBjbWRsaW5lIChubyBjaGFuZ2UgaW4gQm9vdGxv
YWRlcnMgbmVlZGVkKSBhbmQgd2UgZG9uJ3QKPiA+IGhhdmUgdG8gY2hhbmdlIHRoZSBwYXJzZXIg
b2YgYSBkcml2ZXIgZXZlcnkgdGltZSBhIGNvbG9uIGlzIGluIHRoZQo+ID4gbmFtZS4KPiA+Cj4g
PiBJIHdvdWxkIGxpa2UgdG8gZHJvcCAibXRkOiBwYXJzZXJzOiBzdXBwb3J0ICdbXScgZmlyIHVk
IHViIG10ZHBhcnRzIiBhcwo+ID4gd2VsbGUgYXMgIm10ZDogc3BpLW5vcjogY29udHJvbGxlcnM6
IGludGVsLXNwaTogQWRkIHN1cHBvcnQgZm9yIGNvbW1hbmQKPiA+IGxpbmUgcGFydGl0aW9ucyIs
IHdoYXQgZG8geW91IHRoaW5rPwo+ID4KPiA+Cj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
