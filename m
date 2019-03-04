Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E865DC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 11:55:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B86612070B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 11:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ShXojZAW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6dBmXpl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B86612070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gG6qj6H1gHzYHN8WxDvrn/hGYLDL0lspjYOjRJ6EUv0=; b=ShXojZAWC+l0D/
	XC8utKVb3Mi7/15D6d9tyC6V+ftJXgInR8CJ7Vp3xgKdVmC1rK0sxaTTy7+R+yoER2qic9PlnmE+r
	JNH2JhSpIXKXtiyVu7hV2jjY+Kid14Zx7MFxa6aIR5vvcYTry6Z93LV+zQpJdyaxEXstKlfVD8vli
	1b5rkHvup3EAbsN15H3C5D3ip3yByboanWTlg4sJThv37SsYbkJYCbNP8/+/HtPcpBb0a9cS+qAde
	Laoe0P1Fz0RLrPzuywWxbVAMUqFt4WRJx3hp7jzMm2kme1CWFRm5im6knw5eLoJwg/sqH5KpIfIDk
	DfLVlsjohp7ZrA51b+dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0mC7-0003Wf-Ac; Mon, 04 Mar 2019 11:55:43 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0mC3-0003VM-LP
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 11:55:41 +0000
Received: by mail-pg1-x541.google.com with SMTP id 196so2948176pgf.13
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2019 03:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FUYlJITLsSO2AJ1oYSAubsLbpkmhNstYpe1f+BXbwNI=;
 b=H6dBmXplU8lNctWu6OLo7/6o2KHT7UvxF8miUIg9xfsp4XqNCWuMsWgFxIafFGU5Ef
 JuSpN4j/qp/V1unrjaiFdnuMYA//f7JHi5zB+f0ViGRZXS6hAPg3Pogw9ru2aEkQDMLU
 NE5SkoUT9jmTdh1jYET5yyyaWXvQnkoMtcVW53UkHAB7JT+kLpHYRrv9sS2Q7WNSPoQV
 /QNbM3M/+fyJrzBwmehPRdMinMYUpDrY1FseE3AzXJotssFPZ1fh8LTdfF7EVC7PI1iy
 XSP5IMIap/X4+fc7zeuRspmx4F3L1/KF/I/ObT/fWgP8G8pLj2pkPWalniowlJa43A9H
 AFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FUYlJITLsSO2AJ1oYSAubsLbpkmhNstYpe1f+BXbwNI=;
 b=MnAQADdaNMmjuAo6uUZIWSUFsA7Sl7HA5ZxTawC78g9NkdJCUfHUHammmLvj9Q71Zy
 YKamwNtNIR9znuC009JwNTTbq9rywLYiJYuXNZXEuHZnsXH5MYPdGCwFFCsBLQJhpMph
 BXHrKrYkzDFCbSIoJr9FjsVxndykAr13S6orfaNp41d0ZQl58fKgH46vvl8tq8TH3Jj9
 Lk4S3ieN5Bfm2pJUjURLtegWrgzISsvDc4T6mjzxznZFHMvUntW0L5hF+UdXOD2BcUrq
 8eIm+FpfIKM6q9aK7V9q6OGzRCJZGkaeQ2gr8FpFKIUnZdpm7T0K5cbJ6hr2inkQU9zP
 2otA==
X-Gm-Message-State: APjAAAXY+hvS1tCFSnoP+6QYsNo+DpOBezeG3ZJWv9tTgOBU86Y7S8vs
 wICKLeDCbloTUMs+OBwFyi/Y565TkEkGXSSyZxcz1g==
X-Google-Smtp-Source: APXvYqwmPctffA8fbCrtV1Ue51JgnuMsJaNmLzFXhGhZdkVnUtJPlyB059WXxHEs0nKDBWCFUCSe9YzC9s+4xUAdLJ4=
X-Received: by 2002:a17:902:854b:: with SMTP id
 d11mr19369001plo.224.1551700538711; 
 Mon, 04 Mar 2019 03:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20181221115831.9595-1-emil.lenngren@gmail.com>
 <20190105145845.7a28d8f8@bbrezillon>
 <CAO1O6se_1oPv6SogDkkMaF1K9N7XxtTzeHAruibB8fph+mam=A@mail.gmail.com>
 <20190106091049.01e2e3d9@bbrezillon>
 <CAO1O6scHuaGJsS1wXtEpxi930K57yDBUZggb1Sik9XoZMJA+8A@mail.gmail.com>
 <20190304122348.3824447b@xps13>
In-Reply-To: <20190304122348.3824447b@xps13>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Mon, 4 Mar 2019 12:55:30 +0100
Message-ID: <CAO1O6se_88kxN0qvk_0ULLQ0jWMvqP1C9kq5ukUwzBkyke4wBg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spinand: Wait after erase in spinand_markbad
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_035539_723627_39970DDF 
X-CRM114-Status: GOOD (  34.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpEZW4gbcOlbiA0IG1hcnMgMjAxOSBrbCAxMjoyMyBza3JldiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPgo+IEhpIEVtaWwsCj4KPiBFbWlsIExlbm5ncmVu
IDxlbWlsLmxlbm5ncmVuQGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAxOCBGZWIgMjAxOQo+IDEy
OjI3OjI1ICswMTAwOgo+Cj4gPiBIaSwKPiA+Cj4gPiBEZW4gc8O2biA2IGphbi4gMjAxOSBrbCAw
OToxMSBza3JldiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz46Cj4gPiA+
Cj4gPiA+IE9uIFNhdCwgNSBKYW4gMjAxOSAyMjowMTo0NCAtMDgwMAo+ID4gPiBFbWlsIExlbm5n
cmVuIDxlbWlsLmxlbm5ncmVuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gSGksCj4g
PiA+ID4KPiA+ID4gPiBEZW4gbMO2ciA1IGphbi4gMjAxOSBrbCAwNTo1OSBza3JldiBCb3JpcyBC
cmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz46Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24g
RnJpLCAyMSBEZWMgMjAxOCAxMjo1ODoxNCArMDEwMAo+ID4gPiA+ID4gRW1pbCBMZW5uZ3JlbiA8
ZW1pbC5sZW5uZ3JlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU1BJ
IE5BTkQgZmxhc2hlcyBkb24ndCBhY2NlcHQgbmV3IGNvbW1hbmRzIHdoaWxlIGFuIGVyYXNlIGlz
IG9uZ29pbmcuCj4gPiA+ID4gPiA+IE1ha2Ugc3VyZSB0byB3YWl0IHVudGlsIHRoZSBkZXZpY2Ug
aXMgcmVhZHkgYmVmb3JlIHdyaXRpbmcgdGhlIG1hcmtlci4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gSnVzdCBhcyB3aXRoIHRoZSBlcmFzZSBvcCwgbm8gZXJyb3IgY2hlY2sgaXMgcGVyZm9ybWVk
IHNpbmNlIHdlIHdhbnQKPiA+ID4gPiA+ID4gdG8gY29udGludWUgd3JpdGluZyB0aGUgbWFya2Vy
IGV2ZW4gaWYgdGhlIGVyYXNlIGZhaWxzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBFbWlsIExlbm5ncmVuIDxlbWlsLmxlbm5ncmVuQGdtYWlsLmNvbT4KPiA+ID4gPiA+
ID4gLS0tCj4gPiA+ID4gPiA+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCAyICsrCj4g
PiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+ID4gPiA+ID4gaW5kZXggNDc5YzJmMmNmMS4uYzI3
MjRkMzRlNiAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29y
ZS5jCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4gPiA+
ID4gPiBAQCAtNjg1LDYgKzY4NSw4IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9tYXJrYmFkKHN0cnVj
dCBuYW5kX2RldmljZSAqbmFuZCwgY29uc3Qgc3RydWN0IG5hbmRfcG9zICpwb3MpCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ICAgICAgIHNwaW5hbmRfZXJhc2Vfb3Aoc3BpbmFuZCwgcG9zKTsKPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gKyAgICAgc3BpbmFuZF93YWl0KHNwaW5hbmQsIE5VTEwpOwo+
ID4gPiA+ID4gPiArCj4gPiA+ID4gPgo+ID4gPiA+ID4gQWZ0ZXIgdGhpbmtpbmcgYSBiaXQgbW9y
ZSBhYm91dCBpdCwgSSB0aGluayB3ZSBzaG91bGQgc2ltcGx5IHdyaXRlIHRoZQo+ID4gPiA+ID4g
QkJNIGFuZCBza2lwIHRoZSBlcmFzZSBvcGVyYXRpb24uIE1hcmtpbmcgYSBibG9jayBiYWQgaXMg
anVzdCBhYm91dAo+ID4gPiA+ID4gd3JpdGluZyAwIHRvIHRoZSBmaXJzdCAyIGJ5dGVzIG9mIHRo
ZSBPT0IgYXJlYSwgYW5kIHdlIGRvbid0IG5lZWQgdGhlCj4gPiA+ID4gPiBibG9jayB0byBiZSBl
cmFzZWQgdG8gZG8gdGhhdC4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBJIGNvbXBhcmVkIHdp
dGggdGhlIHJhdyBhbmQgaW1wbGVtZW50YXRpb24gaW4KPiA+ID4gPiBuYW5kX2Jsb2NrX21hcmti
YWRfbG93bGV2ZWwsIGl0IGFsc28gZXJhc2VzIGZpcnN0LCBpZ25vcmluZyBhCj4gPiA+ID4gcG90
ZW50aWFsIGVycm9yLgo+ID4gPgo+ID4gPiBZZXMsIGFuZCBJIHRoaW5rIHRoaXMgaW1wbGVtZW50
YXRpb24gd2FzIGluc3BpcmVkIGJ5IHRoZSByYXduYW5kIG9uZSwKPiA+ID4gYnV0IEknbSBub3Qg
c3VyZSB0aGUgcmF3bmFuZCBpbXBsZW0gaXMgY29ycmVjdC4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+
IE9uIHRoZSBvdGhlciBoYW5kLCBhIGNvbW1vbiBzcGkgZmxhc2ggY2hpcCBNWDM1TEYxR0U0QUIg
c3RhdGVzIGluIHRoZQo+ID4gPiA+IGRhdGFzaGVldCB0aGF0IGl0J3Mgbm90IHJlY29tbWVuZGVk
IHRvIGVyYXNlIGEgYmFkIGJsb2NrLCBidXQgbm8KPiA+ID4gPiByZWFzb24gd2h5Lgo+ID4gPgo+
ID4gPiBCZWNhdXNlIHRoZSBlcmFzZSBtaWdodCBzdWNjZWVkIGFuZCByZXNldCB0aGUgQkJNIHRv
IDB4ZmYsIHRodXMgbWFya2luZwo+ID4gPiB0aGUgYmxvY2sgZ29vZCBldmVuIGlmIGl0J3MgdW5y
ZWxpYWJsZS4KPiA+ID4KPiA+ID4gPiBBdCB0aGUgc2FtZSB0aW1lLCBpdCdzIGdlbmVyYWxseSBk
aXNhbGxvd2VkIHRvIHdyaXRlIHRoZQo+ID4gPiA+IHNhbWUgcGFnZSB0d2ljZS4uLgo+ID4gPgo+
ID4gPiBUaGF0J3Mgb25seSBpZiB5b3UgY2FyZSBhYm91dCB0aGUgZGF0YSB5b3Ugd3JpdGUgdG8g
dGhlIHBhZ2UuIE1hcmtpbmcgYQo+ID4gPiBibG9jayBiYWQgaXMganVzdCBhYm91dCBzZXR0aW5n
IHRoZSBCQk0gdG8gMHgwLCB3aGljaCBzaG91bGQgYWx3YXlzIHdvcmsKPiA+ID4gZXZlbiBpZiB0
aGUgcGFnZSB5b3UncmUgd3JpdGluZyB0byBoYXMgYWxyZWFkeSBiZWVuIHdyaXR0ZW4sIHNpbXBs
eQo+ID4gPiBiZWNhdXNlIGEgMSAtPiAwIGNlbGwgdHJhbnNpdGlvbiBkb2VzIG5vdCByZXF1aXJl
IGFuIGVyYXNlIChvbmx5IGEgMCAtPgo+ID4gPiAxIHRyYW5zaXRpb24gZG9lcykuCj4gPgo+ID4g
U2hvdWxkIHRoZSBCQk0gYmUgd3JpdHRlbiB3aXRoIG9yIHdpdGhvdXQgRUNDPyBOb3cgaXQgdXNl
cyB3aGF0ZXZlcgo+ID4gbW9kZSB3YXMgdXNlZCBpbiB0aGUgbGFzdCBvcGVyYXRpb24uIEFsc28g
Zm9yIHJlYWRpbmcsIEkgc2VlIHRoZQo+ID4gInNwaW5hbmRfaXNiYWQiIGZ1bmN0aW9uIHNldHMg
Lm1vZGUgdG8gTVREX09QU19SQVcgYnV0IHRoYXQgZmllbGQKPiA+IGRvZXNuJ3Qgc2VlbSB0byBi
ZSBpbnNwZWN0ZWQsIGFnYWluIHVzaW5nIHRoZSBzYW1lIEVDQyBtb2RlIGFzIGluIHRoZQo+ID4g
bGFzdCBvcGVyYXRpb24uCj4gPiBJc24ndCBpdCBiZXN0IHRvIHVzZSB0aGUgbm9uLUVDQyBtb2Rl
IGZvciBib3RoIHJlYWRpbmcgYW5kIHdyaXRpbmcgdGhlCj4gPiBCQk0/IElmIHdlIHdvdWxkIHVz
ZSBFQ0MgbW9kZSBhbmQgb3ZlcndyaXRlIHRoZSBwYWdlIHdoZW4gd3JpdGluZyB0aGUKPiA+IEJC
TSBtYXJrZXIsIEkgZ3Vlc3MgdGhlIGNvbnRyb2xsZXIgbmVlZHMgdG8gc3RvcmUgYSBzZWNvbmQg
ZXJyb3IKPiA+IGNvcnJlY3Rpb24gY29kZSAob3ZlcndyaXRpbmcgdGhlIHByZXZpb3VzIG9uZSks
IHdoaWNoIHdpbGwgcHJvYmFibHkKPiA+IGxlYWQgdG8gRUNDIGZhaWx1cmUgaWYgbGF0ZXIgcmVh
ZCBpbiBFQ0MtbW9kZSAoYW5kIHdobyBrbm93cyBpZiBpdAo+ID4gd2lsbCAiY29ycmVjdCIgdGhl
IHplcm8gYml0cyB0byBvbmVzLi4uKS4KPiA+Cj4KPiBJIHN1cHBvc2Ugd3JpdGluZyB0aGUgQkJN
IHdpdGhvdXQgY29ycmVjdGlvbiBpcyB3aGF0IHdlIHdhbnQuCgpJIHdhcyBhbHNvIHRoaW5raW5n
LCBpcyBpdCBhIGdvb2Qgb3IgYmFkIGlkZWEgdG8gbW92ZSB0aGUgQkJNCndyaXRpbmcvcmVhZGlu
ZyB0byBOQU5EIGNvcmU/IEkgbWVhbiwgYXMgSSB1bmRlcnN0YW5kLCBib3RoIHBhcmFsbGVsCm5h
bmQgYW5kIHNwaSBuYW5kIHVzZSB0aGUgc2FtZSBsb2dpYyB0byBoYW5kbGUgdGhlIEJCTSAoYXQg
dGhlCmJlZ2lubmluZyBvZiB0aGUgT09CIGFyZWEpLiBPciBpcyB0aGVyZSBzb21lIHNwZWNpZmlj
IHRyZWF0bWVudCB0aGF0Cm11c3QgYmUgZG9uZSBpbmRpdmlkdWFsbHkgZm9yIHNwaSBhbmQgcGFy
YWxsZWwgZmxhc2ggY2hpcHM/CgpBZnRlciByZWFkaW5nIHRoZSBCQk0gaW5mbyBvZiBzb21lIGRh
dGFzaGVldHMsIGl0IGFwcGVhcnMgdGhlIHZhcmlhbmNlCmxpZXMgYmV0d2VlbiBkaWZmZXJlbnQg
bWFudWZhY3R1cmVycywgbm90IHRoZSB0ZWNobm9sb2d5IHVzZWQKKHBhcmFsbGVsIG9yIHNwaSku
IEZvciBleGFtcGxlLCBUb3NoaWJhIGZpbGxzIGEgd2hvbGUgYmFkIGJsb2NrIHdpdGgKMDBoIGFu
ZCBpbnN0cnVjdHMgdG8gcmVhZCBhbnkgYnl0ZSBpbiBhbnkgcGFnZSBhbmQgY2hlY2sgaWYgaXQK
Y29udGFpbnMgMDBoLiBNYWNyb25peCBvbiB0aGUgb3RoZXIgaGFuZCBpbnN0cnVjdHMgdG8gY2hl
Y2sgdGhlIGZpcnN0CmJ5dGUgb2YgdGhlIE9PQiBhcmVhIGluIHRoZSBmaXJzdCBhbmQgc2Vjb25k
IHBhZ2UgdG8gc2VlIHRoZXkgY29udGFpbgowMGguIFNtYXJ0TWVkaWEgaW5zdHJ1Y3RzIHRvIGNo
ZWNrIHRoZSA2dGggYnl0ZSBvZiB0aGUgT09CIGFyZWEgb2YgdGhlCmZpcnN0IHBhZ2UgYW5kIHNl
ZSBpZiBpdCBjb250YWlucyBhdCBsZWFzdCB0d28gemVybyBiaXRzLgoKL0VtaWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
