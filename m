Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47903C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:50:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D012054F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:50:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="icCAQyh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D012054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Y0wDiiAsh0TIFu8W8kLMGaM0L50eCjpf1r1hZa02PM=; b=icCAQyh+cuMutj
	aitisiXe0NbegqbRPxsuU9j19mmBDNgY+fBJtOOQPcoMRjbTNyWg9cfHgPGJ8vCvbhaDdWFLBrEdN
	i1dXz4O1rcLcZHeDjJkMisUGclc1biYARSndTHwXJWLmqTemeBMm3SDU+o6YaxhIaEUb38qEeL474
	Jfo3GSBV/7rD34xC5hjtIifWOZYtPNqTd6DoSbgyNKZS0ilOhCZdzn4ryAzkaYSt3XMYF7fbT+eA4
	nyJS3rp/QcqP2vQAOpx2ajcuxDOF1dAWbBzL7b9lz9NUVSYYrYMjWCD3YbttcitqvrvQY+KnZwoiG
	w7vNKRdBFJU0O2QCTxIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNxfx-0004JQ-3I; Tue, 07 May 2019 10:50:21 +0000
Received: from mail-ua1-f68.google.com ([209.85.222.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNxfu-0004J1-8z
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 10:50:19 +0000
Received: by mail-ua1-f68.google.com with SMTP id s30so5828205uas.8
 for <linux-mtd@lists.infradead.org>; Tue, 07 May 2019 03:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kNxVsetn9Dj/BNVG2Uz5GICb2mQyYf1NM57GDJwqiK0=;
 b=oEpUH9wZx2OPzGxE7p1l6rT5xV7UHAGwlUBDbrqVgl3CwwpEzj7qi/ZQdpfvqXv4fr
 qsHOiKwq2wJ/A1fMsfy3BzQGi2C9iJJD6WcUAsia3shkrAgyAh23mNJut7BLyXViYyzg
 EormfGf3X1ms9O9xH1MD770P+eWg75rmK3uCpsuJgUPDKiW+GPuS7wkr169isa94tx78
 A0dpGpGyC4HkOyeOy2vynF8/Tl3w+HTh+i85d3W6byhwnIkdXadjcFOpNJKn1RXa48dT
 gHn2CxMIcYp66zyzJuCIpccopYpfnRyG6HWN8+ie/3BptP1GbJtpEoH477SHBbmvzUjj
 1Gvw==
X-Gm-Message-State: APjAAAXBxh7PQjjh2xG/ihnGFNvdZDPlb1h778sIQ3WEX+z0Oa9bjTPT
 GbjsPlAlDPAYm4wv76yMjaEiDBv+oqhGvP3+yIo=
X-Google-Smtp-Source: APXvYqzlZ1OPBUDMtdv41HUU+60+lDZDrbO5LgbiR9zkVPVGIns8fa9SYLiYmisL3BKMF5uUXv3NAe7kR3a+QBFQWAM=
X-Received: by 2002:ab0:d89:: with SMTP id i9mr15669045uak.96.1557226216978;
 Tue, 07 May 2019 03:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
In-Reply-To: <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 May 2019 12:50:05 +0200
Message-ID: <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_035018_331361_32A47A47 
X-CRM114-Status: GOOD (  17.04  )
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jonas Bonn <jonas@norrbonn.se>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgpPbiBUdWUsIE1heSA3LCAyMDE5IGF0IDEyOjQyIFBNIDxUdWRvci5BbWJhcnVz
QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+IE9uIDA1LzA3LzIwMTkgMTI6NTMgUE0sIEdlZXJ0IFV5
dHRlcmhvZXZlbiB3cm90ZToKPiA+IE9uIFdlZCwgTWFyIDIwLCAyMDE5IGF0IDg6MTYgQU0gSm9u
YXMgQm9ubiA8am9uYXNAbm9ycmJvbm4uc2U+IHdyb3RlOgo+ID4+IEJvdGggdGhlIEJQWzAtMl0g
Yml0cyBhbmQgdGhlIFRCUFJPVCBiaXQgYXJlIHN1cHBvcnRlZCBvbiB0aGlzIGNoaXAuCj4gPj4g
VGVzdGVkIGFuZCB2ZXJpZmllZCBvbiBhIEN5cHJlc3MgczI1Zmw1MTJzLgo+ID4+Cj4gPj4gU2ln
bmVkLW9mZi1ieTogSm9uYXMgQm9ubiA8am9uYXNAbm9ycmJvbm4uc2U+Cj4gPgo+ID4gVGhpcyBp
cyBub3cgY29tbWl0IGRjYjRiMjJlZWFmNDRmOTEgKCJzcGktbm9yOiBzMjVmbDUxMnMgc3VwcG9y
dHMgcmVnaW9uCj4gPiBsb2NraW5nIikgaW4gbXRkL25leHQuCj4gPgo+ID4+IC0tLSBhL2RyaXZl
cnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCj4gPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGktbm9yLmMKPiA+PiBAQCAtMTg5OCw3ICsxODk4LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBm
bGFzaF9pbmZvIHNwaV9ub3JfaWRzW10gPSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAg
U1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LAo+ID4+
ICAgICAgICAgeyAiczI1ZmwyNTZzMCIsIElORk8oMHgwMTAyMTksIDB4NGQwMCwgMjU2ICogMTAy
NCwgMTI4LCBVU0VfQ0xTUikgfSwKPiA+PiAgICAgICAgIHsgInMyNWZsMjU2czEiLCBJTkZPKDB4
MDEwMjE5LCAweDRkMDEsICA2NCAqIDEwMjQsIDUxMiwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElf
Tk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LAo+ID4+IC0gICAgICAgeyAiczI1Zmw1MTJzIiwg
IElORk82KDB4MDEwMjIwLCAweDRkMDA4MCwgMjU2ICogMTAyNCwgMjU2LCBTUElfTk9SX0RVQUxf
UkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sCj4gPj4gKyAgICAgICB7ICJz
MjVmbDUxMnMiLCAgSU5GTzYoMHgwMTAyMjAsIDB4NGQwMDgwLCAyNTYgKiAxMDI0LCAyNTYsCj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FV
QURfUkVBRCB8Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgU1BJX05PUl9IQVNfTE9DSyB8
IFNQSV9OT1JfSEFTX1RCIHwgVVNFX0NMU1IpIH0sCj4gPgo+ID4gU2V0dGluZyBTUElfTk9SX0hB
U19MT0NLIGNhdXNlcyB0aGUgUVNQSSBGTEFTSCBvbiByOGE3NzkxL2tvZWxzY2ggdG8gZmFpbAo+
ID4gcHJvYmluZy4KPiA+Cj4gPiBCZWZvcmUvYWZ0ZXI6Cj4gPgo+ID4gICAgIC1tMjVwODAgc3Bp
MC4wOiBzMjVmbDUxMnMgKDY1NTM2IEtieXRlcykKPiA+ICAgICAtMyBmaXhlZC1wYXJ0aXRpb25z
IHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSBzcGkwLjAKPiA+ICAgICAtQ3JlYXRpbmcg
MyBNVEQgcGFydGl0aW9ucyBvbiAic3BpMC4wIjoKPiA+ICAgICAtMHgwMDAwMDAwMDAwMDAtMHgw
MDAwMDAwODAwMDAgOiAibG9hZGVyIgo+ID4gICAgIC0weDAwMDAwMDA4MDAwMC0weDAwMDAwMDYw
MDAwMCA6ICJ1c2VyIgo+ID4gICAgIC0weDAwMDAwMDYwMDAwMC0weDAwMDAwNDAwMDAwMCA6ICJm
bGFzaCIKPiA+ICAgICArbTI1cDgwIHNwaTAuMDogRXJhc2UgRXJyb3Igb2NjdXJyZWQKPiA+ICAg
ICArbTI1cDgwIHNwaTAuMDogRXJhc2UgRXJyb3Igb2NjdXJyZWQKPiA+ICAgICArbTI1cDgwIHNw
aTAuMDogdGltZW91dCB3aGlsZSB3cml0aW5nIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIKPiA+ICAg
ICArbTI1cDgwIHNwaTAuMDogcXVhZCBtb2RlIG5vdCBzdXBwb3J0ZWQKPiA+ICAgICArbTI1cDgw
OiBwcm9iZSBvZiBzcGkwLjAgZmFpbGVkIHdpdGggZXJyb3IgLTUKPiA+Cj4gPiBGTEFTSCBjaGlw
IGlzIFNQQU5TSU9OIEZMNTEyU0FJRkcxIDMxMVFRMDYzIEEgwqkxMSBTUEFOU0lPTgo+ID4gSkVE
RUMgaWQgYnl0ZXM6IDAxIDAyIDIwIDRkIDAwIDgwCj4KPiBUaGF0J3MgY3VyaW91cy4gRGlkIHlv
dSByZXZlcnQgdGhpcyBwYXRjaCBhbmQgcHJvYmUgd2FzIG9rPyBBcmUgeW91IHN1cmUgaXQgaXMK
ClllcywgYSByZXZlcnQgZml4ZXMgdGhlIHRoZSBwcm9iZS4KSSBoYWQgdHJpZWQgYWxsIGNvbWJp
bmF0aW9ucyBvZiB0aGUgMiBuZXdseSBzZXQgZmxhZ3MsIGFuZCBvbmx5ClNQSV9OT1JfSEFTX0xP
Q0sgaXMgYSBwcm9ibGVtLgoKPiBub3QgcmVsYXRlZCB0byB0aGUgcmVjZW50IGNoYW5nZXMgb24g
c3BpLXJzcGkuYz8KClRoZXNlIGNoYW5nZXMgYWZmZWN0IFFTUEkgdHJhbnNmZXJzIG9ubHkuCgpH
cntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
