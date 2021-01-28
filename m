Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18117C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 11:56:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 627EB64DCE
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 11:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 627EB64DCE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lll1byoSYgwWOrRGvm5ek5qJH5jfgJdknW9Qk+dbBbY=; b=LPL2OxUykdN7gb5rSDOgClsE5
	n63gWX9hUc8sEzTClA0kwG9TSorPpgKPyj8mMGqEQZydklskI0RvMsvjilSJxk6AchnhZlYlyNp6O
	b1nsVFwka2/Jr0WBq0BR69Sds5Klbz7IpHiz/s+/O4M8SDxEAXav7E4SR97ixfU7y0gccQMBEMQbS
	HQDz6CGpBjMCNbixEIcH4xu/UkNFkO+W2G+8yKqK7v+hFXOQKezIRpwVlF/ZNgnztx44wTpofHRtF
	Dn/vxMP6t47miXE1oeIuvLNH9tKm+sSUKiYKPIsGv/KY5zn+gXe9Q6TbuhDyIgxeoI3AkRWRzjLRL
	nMJEXWpgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l55tO-0005nu-Pi; Thu, 28 Jan 2021 11:55:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l55tL-0005mu-G8
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 11:55:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id a1so5114719wrq.6
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2021 03:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wl0IbxmvfWIoLhrbJ0uON/dyE9NTQhrnVzuADD12Lfg=;
 b=hlR+v4beiHgTJLDJ5MF+ynTtYflKKaQZxC+DyOUtSii26riTwI80ePQ1G6ofnC1FrT
 lgLmeHnZ2mZ387oRyNW4xBvfhn+akuT4AdnZwImXQj6Ozlkv7amopmqmN4ygSxiVES9O
 zuqdSOtDxRY6jKKHtrMQPXa54xuezW0p48dcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wl0IbxmvfWIoLhrbJ0uON/dyE9NTQhrnVzuADD12Lfg=;
 b=Om24bykFHIRcYi7Nl9Cx6tEkzZKFzu2ldAgNbFzBh1nogRDuNPkcFVcdN2RIt6rD+E
 bjyb3RkJXyC396cRwr75TWDMXg6jh8kB2tYXCeCog9GVFicMfS6UMyRY76vL2ixm+Xz0
 Tj2NcsD2/t3oiNwffcdvE6FgAvSa3N5EiHOOFYgrWrILFCNYtvUmWVFrOxXKX/18BPjy
 Zr6rs6fk1V/Vwij9FeA+SmAeoVSoyKE7E5tprPse9Ch1sjexln6RyDgeQa9TcIhEmHKe
 HVeIv5PUDduimUxulgzTOT+nBIYeZbpDJ2nau/Aunf0LSDIB3Ped4BuLbuo02nbUOKs+
 m31Q==
X-Gm-Message-State: AOAM532A3fG1ycrzbawxFH4LLtB7CgzatLQ8iL7ZxpIt1fZOPeroe7K1
 rPviNOaLDpVs1B/1o3L/GY9X/H3MgnUIPAzVnfzdSg==
X-Google-Smtp-Source: ABdhPJwYxFYlYiq5GBxZhs9lboMLXtXVcoC9ZhJLFvLq3c2FzPf4Da0+Be8nyHIYCwhdOrcCcTBRp8ucPPxnKxU+en0=
X-Received: by 2002:a5d:654f:: with SMTP id z15mr15844992wrv.46.1611834913246; 
 Thu, 28 Jan 2021 03:55:13 -0800 (PST)
MIME-Version: 1.0
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <781dd4e6-a694-c3e1-ee13-9c5c51598623@kernel.org>
 <53cb8db7-bcf8-ee7c-84ee-59a14a04aad9@kernel.org>
 <20190730103822.7576645d@xps13>
 <0a6afd79-d5ca-24da-a62c-11146a3522f6@kernel.org>
 <20190731082823.6284f5a9@collabora.com>
 <e47b1de2-501a-9a1f-e980-48d2c396811a@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
 <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
 <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
 <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
 <20210128112627.1429b02a@xps13>
 <CAOf5uwk9J8sKV8OvSvsMUJtZMSo0wFp=-eZ7NRp6Rp0ZTauMMw@mail.gmail.com>
In-Reply-To: <CAOf5uwk9J8sKV8OvSvsMUJtZMSo0wFp=-eZ7NRp6Rp0ZTauMMw@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 28 Jan 2021 12:55:02 +0100
Message-ID: <CAOf5uw=XBFams7=C5N=MCsBmx1E2AtDUH9=3P-YoLTHxSk3beg@mail.gmail.com>
Subject: Re: GPMI iMX6ull timeout on DMA
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_065515_683256_04381EFE 
X-CRM114-Status: GOOD (  25.09  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Greg Ungerer <gerg@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkKCkkgaGF2ZSBhIGNvdXBsZSBvZiBxdWVzdGlvbnMKCk9uIFRodSwgSmFuIDI4LCAyMDIxIGF0
IDExOjM1IEFNIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQo8bWljaGFlbEBhbWFydWxhc29s
dXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBIaQo+Cj4gT24gVGh1LCBKYW4gMjgsIDIwMjEgYXQgMTE6
MjYgQU0gTWlxdWVsIFJheW5hbAo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToK
PiA+Cj4gPiBIaSBNaWNoYWVsLAo+ID4KPiA+IE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSA8
bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGUgb24KPiA+IFRodSwgMjggSmFuIDIw
MjEgMTA6NDU6MjkgKzAxMDA6Cj4gPgo+ID4gPiBIaSBHcmVnCj4gPiA+Cj4gPiA+IE9uIFR1ZSwg
QXVnIDEzLCAyMDE5IGF0IDI6NTAgQU0gR3JlZyBVbmdlcmVyIDxnZXJnQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkgQm9yaXMsCj4gPiA+ID4KPiA+ID4gPiBPbiAxMi84LzE5
IDU6MzEgcG0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+ID4gPiA+IE9uIE1vbiwgMTIgQXVn
IDIwMTkgMTI6NTA6MzYgKzEwMDAKPiA+ID4gPiBbc25pcF0KPiA+ID4gPiA+IEhtLCBDVFJMMSBp
cyBpZGVudGljYWwuIENhbiB5b3UgZHVtcCBhbGwgcmVncyBhdCB0aGUgYmVnaW5uaW5nIGFuZCBh
dAo+ID4gPiA+ID4gdGhlIGVuZCBvZiB0aG9zZSBmdW5jcz8KPiA+ID4gPgo+ID4gPiA+IEhlcmUg
aXMgYSBtb3JlIGNvbXBsZXRlIGR1bXAgb2YgcmVnaXN0ZXJzLiBUcmFjZSBwb2ludHMgYXJlIGF0
Cj4gPiA+ID4gZW50cnkgYW5kIGV4aXQgb2YgdGhlIHJlc3BlY3RpdmUgZnVuY3Rpb25zIGluIHRo
ZSBkaWZmZXJlbnQKPiA+ID4gPiBrZXJuZWwgdmVyc2lvbnMuIFJlZ2lzdGVyIGR1bXBpbmcgY29k
ZSBpcyBpZGVudGljYWwgZm9yIGJvdGguCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IExpbnV4IHZl
cnNpb24gNC4xNi4wIChnZXJnQGdvb2JlcikgKGdjYyB2ZXJzaW9uIDQuOC4zIChHQ0MpKSAjMTAg
VHVlIEF1ZyAxMyAxMDoyNDoyOCBBRVNUIDIwMTkKPiA+ID4gPiAuLi4KPiA+ID4KPiA+ID4gSSBy
YW4gYW4gb3Zlcm5pZ2h0IHJlYm9vdCBwcm9jZXNzIG9uIGxpbnV4LTQuMTkueSB0YWc6IHY0LjE5
LjE2OSBhbmQKPiA+ID4gSSdtIG5vdCBhYmxlIHRvIHJlcHJvZHVjZSB1cCB0byBub3cuCj4gPiA+
Cj4gPiA+IERvIHlvdSBoYXZlIGFuIHVwZGF0ZSBmcm9tIHlvdXIgc2lkZT8KPiA+Cj4gPiBQZXJo
YXBzIHRoaXMgcGF0Y2ggWzFdIHdhcyBiYWNrcG9ydGVkIHRvIHY0LjE5LjE2OSAoSSBkaWRuJ3Qg
Y2hlY2spIGJ1dAo+ID4gaXQgbWlnaHQgaGF2ZSBmaXhlZCB0aGUgRE1BIGlzc3VlIHlvdSB3ZXJl
IHNlZWluZywgYXQgbGVhc3QgaW4gdGhlCj4gPiByZWNlbnQga2VybmVsIHZlcnNpb25zLgo+Cj4g
SXQncyBub3QgdGhlcmUgYW5kIHNob3VsZCBub3QgZ28gYmVjYXVzZSB0aGlzIHBhdGNoIGZpeGVz
IGFub3RoZXIKPiByZWdyZXNzaW9uLiAgQXBwbHkKPiBpdCBtZWFucyBhcHBseSBhbnl3YXkgYm90
aC4KPiBJIHdpbGwgZGVjb2RlIHRoZSByZWdpc3RlcnMgb24gdGhvc2UgdGhyZWFkIGFuZCBjaGVj
ayB0aGUgZGlmZmVyZW5jZQo+CgptYXhjaGlwcyBpcyAyIGZvciBJTVg2IGFuZCBJIHRoaW5rIHRo
YXQgaXMgY29ubmVjdGVkIHRvIE5BTkRfQ0UwX0IgYW5kCk5BTkRfQ0UxX0IsIFdoZW4Kd2UgcHJv
YmUgSSB0aGluayBib3RoIGFyZSBwcm9iZWQuIElzIHRoYXQgcmlnaHQ/CgpNaWNoYWVsCgoKPiBN
aWNoYWUKPgo+ID4KPiA+IFsxXSBtdGQ6IHJhd25hbmQ6IGdwbWk6IEZpeCB0aGUgcmFuZG9tIERN
QSB0aW1lb3V0IGlzc3VlCj4gPgo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobAo+Cj4KPgo+IC0tCj4g
TWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCj4gQW1hcnVsYSBTb2x1dGlvbnMgQlYKPiBDT08g
Q28tRm91bmRlcgo+IENydXF1aXVza2FkZSA0NyBBbXN0ZXJkYW0gMTAxOCBBTSBOTAo+IFQuICsz
MSgwKTg1MTExOTE3Mgo+IE0uICszOSgwKTM0NzkxMzIxNzAKPiBbYGFzXSBodHRwczovL3d3dy5h
bWFydWxhc29sdXRpb25zLmNvbQoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCkFt
YXJ1bGEgU29sdXRpb25zIEJWCkNPTyBDby1Gb3VuZGVyCkNydXF1aXVza2FkZSA0NyBBbXN0ZXJk
YW0gMTAxOCBBTSBOTApULiArMzEoMCk4NTExMTkxNzIKTS4gKzM5KDApMzQ3OTEzMjE3MApbYGFz
XSBodHRwczovL3d3dy5hbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
