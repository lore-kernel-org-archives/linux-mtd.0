Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E729DEDE99E
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 09:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ySQpIhb9tTn8HdhUP870BF5ZeBPgCAL1ZrFL/qYtyU=; b=hfX4FS0pQMoffc
	cuQt+jxM10L+/C7i4mr+rNgHRPH8cU0rKIyY08B5ag8pDJdf+THm0+7Yh2MRSLGVBg5c4bSKX9kF+
	L+sOLDl/ja+yN3+rlvV9fjwBYBgdsSsxEMTqkKExfv3mJEHEUUINpZfpf2P5kC+hHNrXkkpWSZ7i8
	CBIGwVdRdPLhLGbYCrZyldL+TvHa7UWJEX8FkrkEaN6idsjY7mgV6heSAMBHRIokWhBjnQeFYWTmB
	m58+6TjXkzMYv9g0x9ERuEies7RfNaM7RtxUwcP23ZjX0RdcoiEw6xHC4+BZoF0Aqx+dm9YNJtILE
	ZLeQE028hx51zvt3hReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiOW-007oTL-0h;
	Thu, 14 Sep 2023 09:12:16 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiOR-007oRo-0I
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 09:12:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95BA820014;
	Thu, 14 Sep 2023 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694682724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZUp78CbCWiQi+n4QkbM3H0gqDpSMC7eDQTX0Zn+ubA=;
	b=Nc1JEMpXO0JTeV4oPE/a/KDzC94mrVPVHINRSwwSBa/3uVDS83V3jsyc0lLKJAeTNGSTy/
	RtY7rxiv4hNjNBRUXghWtFJYbuSFJMizensSetIcfsWmHgIzeTb6jem6dNGSbDqlwHkNJn
	M+T+ydLsd9Wje1h4oSzmN9Y3LV5juesSdKPVdVhUYIYO+WxRB9RsxsY2JZM6SmhDcHWPa5
	h4Q/fDCUdnsFwzbBX2Ofa6Gf0Ed1ZSm5JGdysn+yNhS31myoMolWcRDzgE6VQXXlKB1gFV
	pCxtI6Q3S58unaesZ1BtHX/npC2hugHv57OwvddxzI0YmIEzTdWmF/3m8U4vYQ==
Date: Thu, 14 Sep 2023 11:12:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, MTD Maling
 List <linux-mtd@lists.infradead.org>, linux-spi
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Walle <michael@walle.cc>
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash
 type
Message-ID: <20230914111200.6e6832ca@xps-13>
In-Reply-To: <CAMuHMdX8Vg2M2K3U_sbAtVk+6VDvL+GNYtbs5FTTRZzRvVGPCQ@mail.gmail.com>
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
	<CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
	<TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
	<502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org>
	<CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
	<20230914105937.4af00bf2@xps-13>
	<CAMuHMdX8Vg2M2K3U_sbAtVk+6VDvL+GNYtbs5FTTRZzRvVGPCQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_021211_415496_7AC1BE95 
X-CRM114-Status: GOOD (  37.83  )
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

SGkgR2VlcnQsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBUaHUsIDE0IFNlcCAyMDIz
IDExOjA0OjAxICswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gVGh1LCBTZXAgMTQsIDIwMjMg
YXQgMTA6NTnigK9BTSBNaXF1ZWwgUmF5bmFsCj4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
IHdyb3RlOgo+ID4gZ2VlcnRAbGludXgtbTY4ay5vcmcgd3JvdGUgb24gVGh1LCAxNCBTZXAgMjAy
MyAxMDozNDo1MCArMDIwMDogIAo+ID4gPiBPbiBUaHUsIFNlcCAxNCwgMjAyMyBhdCAxMDowOOKA
r0FNIEtyenlzenRvZiBLb3psb3dza2kKPiA+ID4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJv
Lm9yZz4gd3JvdGU6ICAKPiA+ID4gPiBPbiAzMC8wOC8yMDIzIDE3OjE4LCBCaWp1IERhcyB3cm90
ZTogIAo+ID4gPiA+ID4+PiAgICAgICAgICAgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKHJwYy0+
cmVnbWFwLCBSUENJRl9DTU5DUiwgQEAgLTc3NCw2Cj4gPiA+ID4gPj4+ICs3NzYsMTIgQEAgc3Rh
dGljIGludCBycGNpZl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiA+
ID4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gPiA+Pj4gICAgICAgICB9Cj4g
PiA+ID4gPj4+Cj4gPiA+ID4gPj4+ICsgICAgICAgaWYgKHJwYy0+aW5mby0+dHlwZSA9PSBSUENJ
Rl9SWl9HMkwgJiYgIAo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gV291bGRuJ3QgdGhpcyBhcHBseSB0
byBub24tUlovRzJMIHN5c3RlbXMsIHRvbz8gIAo+ID4gPiA+ID4KPiA+ID4gPiA+IEl0IGFwcGxp
ZXMsIGlmIHRoZSBkZXZpY2UgdXNlcyB0aGUgZmxhc2hbMV0gb3IgWzJdIGFuZCBpdCBuZWVkcwo+
ID4gPiA+ID4gNC1iaXQgdHggc3VwcG9ydC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBbMV0gRmlndXJl
IDIwOiBRVUFEIElOUFVUL09VVFBVVCBGQVNUIFJFQUQg4oCTIEVCaC9FQ2gKPiA+ID4gPiA+IGh0
dHBzOi8vbWVkaWEtd3d3Lm1pY3Jvbi5jb20vLS9tZWRpYS9jbGllbnQvZ2xvYmFsL2RvY3VtZW50
cy9wcm9kdWN0cy9kYXRhLXNoZWV0L25vci1mbGFzaC9zZXJpYWwtbm9yL210MjVxL2RpZS1yZXYt
YS9tdDI1cV9xbGtzX3VfNTEyX2FiYV8wLnBkZj9yZXY9M2U1YjJhNTc0ZjdiNDc5MGI2ZTU4ZGFj
ZjRjODg5YjIKPiA+ID4gPiA+Cj4gPiA+ID4gPiBbMl0gc2VjdGlvbiA4LjE0Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gaHR0cHM6Ly93d3cucmVuZXNhcy5jb20vZXUvZW4vZG9jdW1lbnQvZHN0L2F0MjVx
bDEyOGEtZGF0YXNoZWV0P3I9MTYwODU4NiAgCj4gPiA+ID4KPiA+ID4gPiBHZWVydCwKPiA+ID4g
Pgo+ID4gPiA+IERvZXMgaXQgYW5zd2VyIHlvdXIgY29tbWVudCBvciBkbyB5b3UgZXhwZWN0IGhl
cmUgc29tZSBjaGFuZ2VzPyAgCj4gPiA+Cj4gPiA+IFdlbGwsIG5vdyBpdCBoYXMgYmVlbiBjb25m
aXJtZWQgdGhpcyBhcHBsaWVzIHRvIG5vbi1SWi9HMkwgc3lzdGVtcywgdG9vLAo+ID4gPiB0aGUg
Y2hlY2sgZm9yIFJQQ0lGX1JaX0cyTCBzaG91bGQgcHJvYmFibHkgYmUgcmVtb3ZlZC4gIEluIHVw
c3RyZWFtLAo+ID4gPiBvbmx5IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybHssY30t
c21hcmMtc29tLmR0c2kgaGF2ZSBkZXZpY2VzCj4gPiA+IHRoYXQgYXJlIGNvbXBhdGlibGUgd2l0
aCAibWljcm9uLG10MjVxdTUxMmEiLCBidXQgb2J2aW91c2x5IHRoZXkgY2FuCj4gPiA+IGFwcGVh
ciBlbHNld2hlcmUsIHRvby4KPiA+ID4KPiA+ID4gTm93LCB0aGUgcHJlc2VuY2Ugb2YgdGhhdCBj
b21wYXRpYmxlIHZhbHVlIGluIHJ6ZzJseyxjfS1zbWFyYy1zb20uZHRzaQo+ID4gPiBjdXJyZW50
bHkgY2F1c2VzIGEgZHRic19jaGVjayB3YXJuaW5nLCBhcyBpdCBpcyBub3QgZG9jdW1lbnRlZC4K
PiA+ID4gSG93ZXZlciwgdGhlcmUgaGFzIGJlZW4gc29tZSBwdXNoYmFjayBhZ2FpbnN0IGFkZGlu
ZyBtb3JlIGNvbXBhdGlibGUKPiA+ID4gdmFsdWVzLCBjZnIuIG15IHBhdGNoIHRvIGFkZCBtdDI1
cXU1MTJhWzFdLCBhbmQgTWlxdWVsJ3MgY29tbWl0IFsyXS4gIAo+ID4KPiA+IEp1c3QgRllJLCBJ
IHNlbnQgWzJdIGFmdGVyIGFuIHVuc3VjY2Vzc2Z1bCBhdHRlbXB0IHRvIHVwZGF0ZSB0aGF0IGxp
c3QKPiA+IHRvbywgc2VlIFszXS4gVGhlIGlkZWEgaXM6IGlmIHlvdSBkb24ndCBoYXZlIGFueXRo
aW5nIHVzZWZ1bCB0byBhZGQsICAKPiAKPiBPaCwgSSBkaWRuJ3Qga25vdyB0aGF0Lgo+IAo+ID4g
anVzdCB1c2UgdGhlIGdlbmVyaWMgY29tcGF0aWJsZS4gSWYgeW91IG5lZWQgc3BlY2lmaWMgY2hh
bmdlcywgeW91IGNhbgo+ID4gYWRkIGFuIGVudHJ5LiAgCj4gCj4gVGhlIHByb2JsZW0gaXMgdGhh
dCB1c3VhbGx5IHRoZXNlIHRoaW5ncyBhcmUgZGlzY292ZXJlZCB0b28gbGF0ZSwKPiBzbyB0aGUg
b25seSBwcnVkZW50IHdheSBpcyB0byBiZSBwcm9hY3RpdmUsIGFuZCBhbHdheXMgYWRkIHRoZW0u
Cj4gSW5pdGlhbGx5IEkgdGhvdWdodCB0aGF0IHRoZSBkaWZmZXJlbnQgaGFuZGxpbmcgb24gUlov
RzJMIHdhcyBkdWUKPiB0byBhIGRpZmZlcmVuY2UgaW4gdGhlIFJQQy1JRiBibG9jay4gIEJ1dCBu
b3cgd2Uga25vdyBpdCdzIGR1ZSB0byB0aGUKPiB0eXBlIG9mIEZMQVNIIGF0dGFjaGVkLgoKQWN0
dWFsbHkgd2hhdCBJIHNheSBpcyB3cm9uZywgd2UgYXJlIG5vdCBzdXBwb3NlZCB0byB0b3VjaCB0
aGF0IGxpc3QKYW55bW9yZSBhbmQgcHJlZmVyIHRvIGhhbmRsZSB0aGUgaXNzdWVzIGluIHRoZSBk
cml2ZXJzIGJ5CmF1dG8tZGlzY292ZXJ5LiBDYW4ndCB3ZSBkbyB0aGF0IGluIHlvdXIgY2FzZT8K
Cj4gPiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkL2Q4MTY0OTllLWJhYWIt
NjIwMC0wNzgwLTE3YTgyMDViMjUyZUBsaW5hcm8ub3JnLwo+ID4gIAo+ID4gPiBCdXQgdGhlIGlz
c3VlIEJpanUgaXMgc2VlaW5nIHByb3ZlcyB0aGVyZSBpcyBhIG5lZWQgdG8gYWRkIHRoZXNlLgo+
ID4gPgo+ID4gPiBJbiBhZGRpdGlvbiwgSSBoYWQgaG9wZWQgdG8gZ2F0aGVyIHNvbWUgZmVlZGJh
Y2sgb3IgZ3VpZGFuY2UgZnJvbSB0aGUKPiA+ID4gaHlwZXJidXMgYW5kL29yIHNwaSBwZW9wbGUs
IGFzIGlzc3VlcyB3LnIudC4gcGluIHN0YXRlcyB3aWxsIGV2ZW50dWFsbHkKPiA+ID4gcG9wIHVw
IG9uIG90aGVyIHN5c3RlbXMsIHRvbywgYW5kIHRodXMgbWF5IG5lZWQgaGFuZGxpbmcgaW4gdGhl
IGNvcmUsCj4gPiA+IGluc3RlYWQgb2YgaW4gZWFjaCBpbmRpdmlkdWFsIGRldmljZSBkcml2ZXIu
ICBCdXQgb2YgY291cnNlIHRoYXQgY2FuCj4gPiA+IGJlIGRvbmUgbGF0ZXIsIHdoZW4gdGhlIG5l
ZWQgYXJpc2VzLgo+ID4gPgo+ID4gPiBUaGFua3MhCj4gPiA+Cj4gPiA+IFsxXSAiW1BBVENIXSBk
dC1iaW5kaW5nczogbXRkOiBqZWRlYyxzcGktbm9yOiBEb2N1bWVudCBzdXBwb3J0IGZvcgo+ID4g
PiBtb3JlIE1UMjVRVSBwYXJ0cyIKPiA+ID4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8zNjMxODYwNzliNDI2OTg5MTA3M2Y2MjBlM2UyMzUzY2Y3ZDI1NTlhLjE2Njk5ODgyMzguZ2l0
LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlCj4gPiA+IFsyXSA0YjBjYjRlN2FiMmY3NzdjICgiZHQt
YmluZGluZ3M6IG10ZDogc3BpLW5vcjogY2xhcmlmeSB0aGUgbmVlZCBmb3IKPiA+ID4gc3BpLW5v
ciBjb21wYXRpYmxlcyIpLiAgCj4gCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
