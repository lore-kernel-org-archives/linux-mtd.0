Return-Path: <SRS0=YvPJ=ZY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9ECC432C0
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2019 16:26:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCEEA20722
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2019 16:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sOwHmKwT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqJ+7zLW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCEEA20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWmGPKN4b0H/WudUIFmEIo5WBfsn0ImdxmUPRs03NpY=; b=sOwHmKwTIDTtw9
	ERWR/X40Y0X5lO9auL0Ewx8G7mZO/K0sGEBaIZLEx3pUmTcDyBtevENeLc542W2w9VAlOQDFm/Ojb
	cPX6pll36HOFRA4N9mPrzuVtFebaq7BQgBflrbVkbjplUHqMdF3CsDtt+7s5z0bp8dbBHLZNAzcZE
	U4iL+UpuVyhxWcT9lqtcbWNu4v8MX4WMwkjVsXERcdxuXbPFkDDPHVzz4ovqy+Jytt9LBBFrcEf/K
	We6WqmVOZG6GEIbBpoPeab+ON9lgrlc7I3u3GvFzMkPT7dRojW4R3XKC1arzqabvd+Z3cueI9ngY9
	hwGgtM0tGJv+kX+NrFDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iboWp-0005DB-Pg; Mon, 02 Dec 2019 16:26:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iboWm-0005Cd-RM
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2019 16:26:26 +0000
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1086C20665
 for <linux-mtd@lists.infradead.org>; Mon,  2 Dec 2019 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575303984;
 bh=yldwc/Z6MA1+VHq1mho9ORxlk97SJEe1yTyihqlVpb8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fqJ+7zLWZAgiTKrSRyHUV5V0bNtcQm1gNjjnXYlpESE9V6ZrADlt0rtVaNv8PboHD
 HVQyUIrqjDxNUMBeTYHrpWC1yR/Z7pxyQHN4y65J+DslZdEAaFekavSMYzuhwEs5Xk
 1CIlE95uCfuP8sRzTtZ4TAjlXdMnDYvgXLGCDIbc=
Received: by mail-qk1-f179.google.com with SMTP id q28so28526qkn.10
 for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2019 08:26:24 -0800 (PST)
X-Gm-Message-State: APjAAAUcUAScXUz/tvuGldo9u8Zuxj983SB44OuA88XZuzWef+9RAB1y
 dfqFaDO53pgkoFlFXWSBTuiFO3TzTgujNM9r5A==
X-Google-Smtp-Source: APXvYqy+Ji9mce4aB8DbJH5nRjKgp1CutJ2doJc952RWmxbZU8ura3b3pvFQQuFPyXDQLffIiY0xb+L15fjEIsfZvxA=
X-Received: by 2002:a37:81c6:: with SMTP id
 c189mr33951032qkd.223.1575303983133; 
 Mon, 02 Dec 2019 08:26:23 -0800 (PST)
MIME-Version: 1.0
References: <20191113171505.26128-1-miquel.raynal@bootlin.com>
 <20191113171505.26128-4-miquel.raynal@bootlin.com>
 <20191118221341.GA30937@bogus> <20191125151523.0766b3b7@xps13>
In-Reply-To: <20191125151523.0766b3b7@xps13>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Dec 2019 10:26:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJR1OLexi9bArn0ZjNYB+d7eRTYpi4q0-eU93oVcz1AMA@mail.gmail.com>
Message-ID: <CAL_JsqJR1OLexi9bArn0ZjNYB+d7eRTYpi4q0-eU93oVcz1AMA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: mtd: Describe mtd-concat devices
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_082624_930474_9C1C7791 
X-CRM114-Status: GOOD (  27.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgODoxNSBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlIG9uIE1vbiwgMTggTm92IDIwMTkgMTY6MTM6NDEgLTA2MDA6Cj4K
PiA+IE9uIFdlZCwgTm92IDEzLCAyMDE5IGF0IDA2OjE1OjA0UE0gKzAxMDAsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiA+IEZyb206IEJlcm5oYXJkIEZyYXVlbmRpZW5zdCA8a2VybmVsQG5vc3Bh
bS5vYmVsaWtzLmRlPgo+ID4gPgo+ID4gPiBUaGUgbWFpbiB1c2UgY2FzZSB0byBjb25jYXRlbmF0
ZSBNVEQgZGV2aWNlcyBpcyBwcm9iYWJseSBTUEktTk9SCj4gPiA+IGZsYXNoZXMgd2hlcmUgdGhl
IG51bWJlciBvZiBhZGRyZXNzIGJpdHMgaXMgbGltaXRlZCB0byAyNCwgd2hpY2ggY2FuCj4gPiA+
IGFjY2VzcyBhIHJhbmdlIG9mIDE2TWlCLiBCb2FyZCBtYW51ZmFjdHVyZXJzIG1pZ2h0IHdhbnQg
dG8gZG91YmxlIHRoZQo+ID4gPiBTUEkgc3RvcmFnZSBzaXplIGJ5IGFkZGluZyBhIHNlY29uZCBm
bGFzaCBhc3NlcnRlZCB0aGFua3MgdG8gYSBzZWNvbmQKPiA+ID4gY2hpcCBzZWxlY3RzIHdoaWNo
IGVuaGFuY2VzIHRoZSBhZGRyZXNzaW5nIGNhcGFiaWxpdGllcyB0byAyNSBiaXRzLAo+ID4gPiAz
Mk1pQi4gSGF2aW5nIHR3byBkZXZpY2VzIGZvciB0d2ljZSB0aGUgc2l6ZSBpcyBncmVhdCBidXQg
d2l0aG91dCBtb3JlCj4gPiA+IGdsdWUsIHdlIGNhbm5vdCBkZWZpbmUgcGFydGl0aW9uIGJvdW5k
YXJpZXMgc3ByZWFkIGFjcm9zcyB0aGUgdHdvCj4gPiA+IGRldmljZXMuIFRoaXMgaXMgdGhlIGdh
cCBtdGQtY29uY2F0IGludGVuZHMgdG8gYWRkcmVzcy4KPiA+ID4KPiA+ID4gVGhlcmUgYXJlIHR3
byBvcHRpb25zIHRvIGRlc2NyaWJlIGNvbmNhdGVuYXRlZCBkZXZpY2VzOgo+ID4gPiAxLyBPbmUg
Zmxhc2ggY2hpcCBpcyBkZXNjcmliZWQgaW4gdGhlIERUIHdpdGggdHdvIENTOwo+ID4gPiAyLyBU
d28gZmxhc2ggY2hpcHMgYXJlIGRlc2NyaWJlZCBpbiB0aGUgRFQgd2l0aCBvbmUgQ1MgZWFjaCwg
YSB2aXJ0dWFsCj4gPiA+IGRldmljZSBpcyBhbHNvIGNyZWF0ZWQgdG8gZGVzY3JpYmUgdGhlIGNv
bmNhdGVuYXRpb24uCj4gPiA+Cj4gPiA+IFNvbHV0aW9uIDEvIHByZXNlbnRzIGF0IGxlYXN0IDMg
aXNzdWVzOgo+ID4gPiAqIFRoZSBoYXJkd2FyZSBkZXNjcmlwdGlvbiBpcyBhYnVzZWQ7Cj4gPiA+
ICogVGhlIGNvbmNhdGVuYXRpb24gb25seSB3b3JrcyBmb3IgU1BJIGRldmljZXMgKHdoaWxlIGl0
IGNvdWxkIGJlCj4gPiA+ICAgaGVscGZ1bCBmb3IgYW55IE1URCk7Cj4gPiA+ICogSXQgd291bGQg
cmVxdWlyZSBhIGxvdCBvZiByZXdvcmsgaW4gdGhlIFNQSSBjb3JlIGFzIG1vc3Qgb2YgdGhlCj4g
PiA+ICAgbG9naWMgYXNzdW1lcyB0aGVyZSBpcyBhbmQgdGhlcmUgYWx3YXlzIHdpbGwgYmUgb25s
eSBvbmUgQ1MgcGVyCj4gPiA+ICAgY2hpcC4KPiA+Cj4gPiBUaGlzIHNlZW1zIG9rIGlmIGFsbCB0
aGUgZGV2aWNlcyBhcmUgaWRlbnRpY2FsLgo+Cj4gVGhpcyBpcyBub3QgYW4gb3B0aW9uIGZvciBN
YXJrIGFuZCBJIGFncmVlIHdpdGggaGltIGFzIHdlIGFyZSBmYWtpbmcKPiB0aGUgcmVhbGl0eTog
dGhlIHR3byBkZXZpY2VzIHdlIHdhbnQgdG8gdmlydHVhbGx5IGNvbmNhdGVuYXRlIG1heSBiZQo+
IHR3byBwaHlzaWNhbGx5IGRpZmZlcmVudCBkZXZpY2VzLiBCaW5kaW5nIHRoZW0gYXMgb25lIGlz
IGx5aW5nLgo+Cj4gPiA+IFNvbHV0aW9uIDIvIGFsc28gaGFzIGNhdmVhdHM6Cj4gPiA+ICogVGhl
IHZpcnR1YWwgZGV2aWNlIGhhcyBubyBoYXJkd2FyZSByZWFsaXR5Owo+ID4gPiAqIFBvc3NpYmxl
IG9wdGltaXphdGlvbnMgYXQgdGhlIGhhcmR3YXJlIGxldmVsIHdpbGwgYmUgaGFyZCB0byBlbmFi
bGUKPiA+ID4gICBlZmZpY2llbnRseSAoaWUuIGEgY29tbW9uIGRpcmVjdCBtYXBwaW5nIGFic3Ry
YWN0ZWQgYnkgYSBTUEkKPiA+ID4gICBtZW1vcmllcyBvcmllbnRlZCBjb250cm9sbGVyKS4KPiA+
Cj4gPiBTb21ldGhpbmcgbGlrZSB0aGlzIG1heSBiZSBuZWNlc3NhcnkgaWYgZGF0YSBpcyBpbnRl
cmxlYXZlZCByYXRoZXIgdGhhbgo+ID4gY29uY2F0aW5hdGVkLgo+Cj4gVGhpcyBpcyBzb21ldGhp
bmcgdGhhdCBpcyBnb25uYSBoYXBwZW4gdG9vLCBpdCBpcyBjYWxsZWQgImR1YWwKPiBwYXJhbGxl
bCIuCgpUaGVuIGl0IHdvdWxkIGJlIGdvb2QgdG8gdGhpbmsgYWJvdXQgaG93IHRoYXQgc2hvdWxk
IGxvb2suIE1heWJlCnRoZXJlJ3Mgb3ZlcmxhcCBvciBtYXliZSBub3QuCgo+ID4gU29sdXRpb24g
Mwo+ID4gRGVzY3JpYmUgZWFjaCBkZXZpY2UgYW5kIHBhcnRpdGlvbiBzZXBhcmF0ZWx5IGFuZCBh
ZGQgbGluayhzKSBmcm9tIG9uZQo+ID4gcGFydGl0aW9uIHRvIHRoZSBuZXh0Cj4gPgo+ID4gZmxh
c2gwIHsKPiA+ICAgcGFydGl0aW9ucyB7Cj4gPiAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0
aXRpb25zIjsKPiA+ICAgICBjb25jYXQtcGFydGl0aW9uID0gPCZmbGFzaDFfcGFydGl0aW9ucz47
Cj4gPiAgICAgLi4uCj4gPiAgIH07Cj4gPiB9Owo+ID4KPiA+IGZsYXNoMSB7Cj4gPiAgIGZsYXNo
MV9wYXJ0aXRpb246IHBhcnRpdGlvbnMgewo+ID4gICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFy
dGl0aW9ucyI7Cj4gPiAgICAgLi4uCj4gPiAgIH07Cj4gPiB9Owo+Cj4gSSBob25lc3RseSBkb24n
dCBzZWUgaG93IHRoaXMgaXMgZGlmZmVyZW50IGFzIHNvbHV0aW9uIDIvPwoKSXQncyBhIHNpbmds
ZSBuZXcgcHJvcGVydHkgcmF0aGVyIHRoYW4gYSB3aG9sZSBiaW5kaW5nIGZvciBhIHZpcnR1YWwK
ZGV2aWNlLiBJdCdzIGEgbWluaW1hbCBjaGFuZ2UgdG8gdGhlIERULiBJdCB3b3VsZCB3b3JrIHdp
dGggZXhpc3RpbmcKYm9vdGxvYWRlcnMgKGFuZCBvdGhlciBPU3MgYW5kIG9sZGVyIGtlcm5lbHMp
IHdpdGhvdXQgY2hhbmdlIGV4Y2VwdApmb3IgdGhlIG9uZSBjb25jYXRlbmF0ZWQgcGFydGl0aW9u
LgoKPiBJbiBvbmUgY2FzZQo+IHdlIGRlc2NyaWJlIHRoZSBwYXJ0aXRpb24gY29uY2F0ZW5hdGlv
biBpbiBvbmUgc3Vibm9kZSBhcyBhICJsaW5rIiwgaW4KPiB0aGUgb3RoZXIgd2UgY3JlYXRlIGEg
c2VwYXJhdGUgbm9kZSB0byBkZXNjcmliZSB0aGUgbGluay4gQXJlIHlvdQo+IHN0cm9uZ2x5IG9w
cG9zZWQgYXMgc29sdXRpb24gMi8/CgpJJ2QgcHJlZmVyIHRvIG5vdCBoYXZlIHZpcnR1YWwgZGV2
aWNlcyB3aXRob3V0IGdvb2QgcmVhc29uLgoKPiBGcm9tIGEgcHVyZSBjb25jZXB0dWFsIHBvaW50
IG9mIHZpZXcsCj4gaXMgaXQgcmVhbGx5IGRpZmZlcmVudCB0aGFuIDMvPwo+Cj4KPiBUaGFua3Ms
Cj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
