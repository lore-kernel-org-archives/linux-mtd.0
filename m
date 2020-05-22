Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCDBC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 11:18:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4AAE206B6
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 11:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a63UbLCf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4AAE206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2YzJn+i1JHTw/IS9lybBYoCFMuWJC84axfISHjlfqQ=; b=a63UbLCf2QrxK+
	yw/NfjYhsEDNZvgj9OMI9GGrAY3DZqssftuiQg81/+1QFk+ehVUFdGQskJD0ehaDGYX58sGO6hxHa
	ZWd1Be0qWz4CsdAhaABNWleAxkvIMhgZg4guxGigus/u83hcdoNdPY7/GFhaXiCavnSiUMA38u+I5
	wIk9BcaEtrMRjgh0WwJs5lUQzi5vcC1tl1iFgaqxo4r3c4Bbh+eHslSH97HN2iY1DN9LZjRWwFY7q
	Lzcf4CA4/+pxiwXdpRyK0ZPsbo3QP5bFHbQP8YmGyvQHfiI70myi6Kee3zyD01FXe5k0vm01QuZhm
	snQAMwrqLHSWhFDCeBaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc5hH-0005Sj-8w; Fri, 22 May 2020 11:18:39 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc5h3-0005JP-G9; Fri, 22 May 2020 11:18:27 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 70860200002;
 Fri, 22 May 2020 11:18:19 +0000 (UTC)
Date: Fri, 22 May 2020 13:18:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 1/3] ARM: pxa: remove Compulab pxa2xx boards
Message-ID: <20200522131818.3adbac78@xps13>
In-Reply-To: <20200521211016.3ad62148@collabora.com>
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
 <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
 <20200521071213.GI1118872@kernel.org>
 <CAK8P3a2XdG_u6_o2NbQDTb5dbdzByBkUXZNM6nZ3wz0c-LFT5w@mail.gmail.com>
 <20200521190158.GL1118872@kernel.org>
 <20200521211016.3ad62148@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_041825_672038_7ECABF68 
X-CRM114-Status: GOOD (  19.87  )
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3
cm90ZSBvbiBUaHUsIDIxIE1heQoyMDIwIDIxOjEwOjE2ICswMjAwOgoKPiBPbiBUaHUsIDIxIE1h
eSAyMDIwIDIyOjAxOjU4ICswMzAwCj4gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3
cm90ZToKPiAKPiA+IE9uIFRodSwgTWF5IDIxLCAyMDIwIGF0IDA5OjI2OjEwQU0gKzAyMDAsIEFy
bmQgQmVyZ21hbm4gd3JvdGU6ICAKPiA+ID4gT24gVGh1LCBNYXkgMjEsIDIwMjAgYXQgOToxMiBB
TSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyb3RlOiAgICAKPiA+ID4gPgo+ID4g
PiA+IE9uIFdlZCwgTWF5IDIwLCAyMDIwIGF0IDA1OjIxOjUxUE0gKzAyMDAsIEFybmQgQmVyZ21h
bm4gd3JvdGU6ICAgIAo+ID4gPiA+ID4gT24gV2VkLCBNYXkgMjAsIDIwMjAgYXQgMTI6MjEgUE0g
Um9iZXJ0IEphcnptaWsgPHJvYmVydC5qYXJ6bWlrQGZyZWUuZnI+IHdyb3RlOiAgICAKPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gQXMgdGhlc2UgYm9hcmRzIGhhdmUgbm8gbW9yZSB1c2VycyBub3Ig
dGVzdGVycywgYW5kIHBhdGNoaW5nIHRoZW0gaGFzCj4gPiA+ID4gPiA+IGJlY29tZSBhIGJ1cmRl
biwgYmUgdGhhdCBiZWNhdXNlIG9mIHRoZSBQQ0kgcGFydCBvciB0aGUgTVREIE5BTkQKPiA+ID4g
PiA+ID4gc3VwcG9ydCwgbGV0J3MgcmVtb3ZlIHRoZW0uCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IFRoZSBjbS14MzAwIHdpbGwgZm9yIG5vdyByZW1haW4gYW5kIHJlcHJlc2VudCBDb21wdWxhYiBi
b2FyZHMgYXQgaXRzCj4gPiA+ID4gPiA+IGJlc3QgaW4gdGhlIFBYQSBkZXBhcnRtZW50LiAgICAK
PiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgdGhpcyBzZXJpZXMgbWlzc2VkIHRoZSBjbS14MjcwIE5B
TkQgZHJpdmVyLCBzbyB0aGlzIGNvdWxkIGJlCj4gPiA+ID4gUEFUQ0ggNC8zIChub3QgZXZlbiBj
b21waWxlIHRlc3RlZCkuCj4gPiA+ID4KPiA+ID4gPiBGcm9tIDU2YTExOTg3ZjgyZWY4YjMyYjI1
ZGZjMTdiODQ5ZjliYmJmMDNlNGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiA+ID4gRnJv
bTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gPiA+IERhdGU6IFRodSwg
MjEgTWF5IDIwMjAgMTA6MDk6NDcgKzAzMDAKPiA+ID4gPiBTdWJqZWN0OiBbUEFUQ0hdIG10ZDog
cmF3bmFuZDogcmVtb3ZlIENNLVgyNzAgTkFORCBkcml2ZXIKPiA+ID4gPgo+ID4gPiA+IFRoZSBj
bS14MjcwIGJvYXJkIGhhdmUgYmVlbiByZW1vdmVkIGFuZCB0aGVyZXMgaXMgbm8gcG9pbnQgdG8g
a2VlcCB0aGlzCj4gPiA+ID4gZHJpdmVyLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
TWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPiAgICAKPiA+ID4gCj4gPiA+IFRoYW5r
cyEgUmVtb3ZpbmcgdGhhdCBkcml2ZXIgd2FzIGFjdHVhbGx5IGhvdyB0aGUgZGlzY3Vzc2lvbiBz
dGFydGVkLAo+ID4gPiBzbyB3ZSBkZWZpbml0ZWx5IHdhbnQgdG8gZG8gdGhhdC4gQm9yaXMgZWFy
bGllciBwYXRjaCAibXRkOiByYXduYW5kOiBHZXQKPiA+ID4gcmlkIG9mIHRoZSBjbXgyNzAgZHJp
dmVyIiBkaWQgaXQgYnkgY2hhbmdpbmcgdGhlIGJvYXJkIGZpbGUsIG5vdyB5b3VyCj4gPiA+IHBh
dGNoIGlzIHRoZSByaWdodCB0aGluZyB0byBkbywgYW5kIHdlIHNob3VsZCByZW1lbWJlciB0byBk
byB0aGUgc2FtZQo+ID4gPiBmb3IgbWJ4ZmIuICAgIAo+ID4gCj4gPiBBcm5kLCB3aWxsIHlvdSBw
aWNrIHRoaXMgdG8gdGhlIFNvQyB0cmVlIG9yIHNob3VsZCBJIHJlc2VuZD8gIAo+IAo+IEFjdHVh
bGx5IEkgc2VudCBhIHYyIHJlbW92aW5nIG9ubHkgdGhlIE1URCBkcml2ZXIuIFlvdSBzaG91bGQg
cHJvYmFibHkKPiBzeW5jIHdpdGggTWlxdWVsIHRvIG1ha2Ugc3VyZSB0aGUgc2FtZSBwYXRjaCBp
cyBub3QgYXBwbGllZCB0d2ljZS4KCkFjdHVhbGx5IEkgd2FzIGFib3V0IHRoZSBtZXJnZSB0aGlz
IHBhdGNoIGluIHRoZSBNVEQgdHJlZSBiZWNhdXNlIEkKaGF2ZSBhIGJpZyBjbGVhbnVwIHNlcmll
cyB3aGljaCBkZXBlbmRzIG9uIGl0LiBBcm5kIGNvdWxkIHlvdSBjb25maXJtCnRoYXQgaXQncyBv
a2F5IGZvciB5b3U/CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
