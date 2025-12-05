Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FD6D2E037
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Dec 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAD0P237byxcLMoHcCbK/zBY69jI9wdb3w6OE0o0jWc=; b=i7Hp17lisLMwEg
	hJssNft6iGcahBBIeuleQpIi7u0HNHc4e59iLP5C+1x0ZwxrGPUeg2zLPlFnuTspDi5l8miR2p3gO
	HOVf8VDM52iezsVnfGPPnRYHGQYZa1TdyjyowesIYGOnePJ5hGKGMaFwsOz77irnK4mwoqZGhEuIg
	aCQpsYA5W98SSrdrmKM8UYYgwF5e+3TMlubWwAnJostRrdqFps+moSqhu/Kh1m/uXJfj5EsVcVQwg
	XpfLXJuu1E6KdcDFnTnao2yddVExcchXq9odeeK3nUTDdYT6a6cxs1/KrEEk20K54fYpPmPa6f2Wx
	AvWpu3+Ptt8lQowiXhhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRR46-00000009DaI-1Zda;
	Fri, 05 Dec 2025 08:21:22 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRR41-00000009DZ8-0TZl
	for linux-mtd@lists.infradead.org;
	Fri, 05 Dec 2025 08:21:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 23A3EC17870;
	Fri,  5 Dec 2025 08:20:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 895BA60731;
	Fri,  5 Dec 2025 08:21:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1ECE110B605E4;
	Fri,  5 Dec 2025 09:21:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764922872; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TiC+c08+rE6MY77oHwZg26I1MYypYxB3rOGQ5tY/fi0=;
	b=n91jlOKGyiI2K/RQaZsIS5oP7JqpJwA9OkwpKkh7+xmxWb1tH7rxXEmCcLqNjR7KzjEU1Y
	Lc+gy6JYqXldua+RjSVc2/kmVvebdjE/Br/Go+VkkSvycZbEBD30EbDvjkQbVlapzOV2vP
	dk6cn8TmwXQjOT9pkZ+3gFAM1TfucsMxM6CSMqOBUg/64WcXNFEisqI1D9+zSNL5UCGUy9
	yjS/4TNn4JcH0Fl4U/mQvKv/9/PVvkSB4ONyyoLsYEuRZMnkK7frxPN23N0TNlBAL4ojCA
	u1geqEtj5AnKTa3C4Fq8ksWH2g0giNvciWNkcwJQ+bMoG0KVZ6jrhwJJ1DT8xA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
Cc: "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [BUG] MTD: refcount underflow/use-after-free during rapid SPI
 NOR unbind/bind cycles
In-Reply-To: <CO6PR11MB5586C35409D4E416C4AE79DFCDDCA@CO6PR11MB5586.namprd11.prod.outlook.com>
	(Guocai He's message of "Fri, 28 Nov 2025 02:24:11 +0000")
References: <CO6PR11MB5586C35409D4E416C4AE79DFCDDCA@CO6PR11MB5586.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 05 Dec 2025 09:21:07 +0100
Message-ID: <87bjkd8hl8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_002117_662762_A5C090CA 
X-CRM114-Status: GOOD (  13.27  )
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

SGVsbG8sCgpPbiAyOC8xMS8yMDI1IGF0IDAyOjI0OjExIEdNVCwgIkhlLCBHdW9jYWkgKENOKSIg
PEd1b2NhaS5IZS5DTkB3aW5kcml2ZXIuY29tPiB3cm90ZToKCj4gSGkgTVREIG1haW50YWluZXJz
LAo+Cj4gSSdtIHJlcG9ydGluZyBhIGtlcm5lbCBidWcgaW4gdGhlIE1URCBzdWJzeXN0ZW0gdGhh
dCBjYXVzZXMgYSByZWZjb3VudAo+IHVuZGVyZmxvdyBhbmQgdXNlLWFmdGVyLWZyZWUgd2Fybmlu
ZyBkdXJpbmcgcmFwaWQgU1BJIE5PUiBkcml2ZXIKPiB1bmJpbmQvYmluZCBvcGVyYXRpb25zLgoK
QWRkaW5nIGFsbCBTUEkgTk9SIGd1cnVzIGluIHRoZSBDYyBsaXN0LgoKVGhhbmtzLApNaXF1w6hs
Cgo+ICMjIEVudmlyb25tZW50Cj4gLSBLZXJuZWwgdmVyc2lvbjogNi42LjExNi15b2N0by1zdGFu
ZGFyZCAjMSAgKDYuMTIgaGF2ZSB0aGUgc2FtZSBpc3N1ZSkKPiAtIEFyY2hpdGVjdHVyZTogU29D
RlBHQSBTdHJhdGl4IDEwIFNvQ0RLIChBUk02NCAgaGF2ZSB0aGUgc2FtZSBpc3N1ZSkKPiAtIERl
dmljZTogU1BJIE5PUiBmbGFzaCAobXQyNXF1MDJnLCAyNjIxNDQgS2J5dGVzKQo+IC0gU1BJIGNv
bnRyb2xsZXI6IGZmOGQyMDAwLnNwaS4wCj4KPiAjIyBSZXByb2R1Y3Rpb24gU3RlcHMKPiAxLiBJ
biBvbmUgU1NIIHNlc3Npb24sIHJ1biBjb250aW51b3VzIHVuYmluZC9iaW5kOgo+ICAgIGBgYGJh
c2gKPiAgICB3aGlsZSA6OyBkbwo+ICAgICAgICBlY2hvIHNwaTAuMCA+L3N5cy9idXMvc3BpL2Rl
dmljZXMvc3BpMC4wL2RyaXZlci91bmJpbmQKPiAgICAgICAgZWNobyBzcGkwLjAgPi9zeXMvYnVz
L3NwaS9kcml2ZXJzL3NwaS1ub3IvYmluZAo+ICAgIGRvbmUKPiAgICBgYGAKPgo+IDIuIEluIGFu
b3RoZXIgU1NIIHNlc3Npb24sIGNvbnRpbnVvdXNseSByZWFkIE1URCBpbmZvOgo+ICAgIGBgYGJh
c2gKPiAgICB3aGlsZSA6OyBkbyBjYXQgL3Byb2MvbXRkOyBkb25lCj4gICAgYGBgCj4KPiAzLiBB
ZnRlciBydW5uaW5nIGZvciBzb21lIHRpbWUsIHRoZSBmb2xsb3dpbmcgY2FsbCB0cmFjZSBhcHBl
YXJzOgo+Cj4gIyMgQ2FsbCBUcmFjZQo+IGBgYAo+IERlbGV0aW5nIE1URCBwYXJ0aXRpb25zIG9u
ICJmZjhkMjAwMC5zcGkuMCI6Cj4gRGVsZXRpbmcgdS1ib290IE1URCBwYXJ0aXRpb24KPiAtLS0t
LS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiByZWZjb3VudF90OiB1bmRlcmZsb3c7
IHVzZS1hZnRlci1mcmVlLgo+IFdBUk5JTkc6IENQVTogMiBQSUQ6IDkyMSBhdCAvbGliL3JlZmNv
dW50LmM6MjggcmVmY291bnRfd2Fybl9zYXR1cmF0ZSsweGY0LzB4MTQ4Cj4gTW9kdWxlcyBsaW5r
ZWQgaW46IHNjaF9mcV9jb2RlbCBvcGVudnN3aXRjaCBuc2ggbmZfY29ubmNvdW50IG5mX25hdCBm
dXNlIG5mbmV0bGluawo+IENQVTogMiBQSUQ6IDkyMSBDb21tOiBzaCBOb3QgdGFpbnRlZCA2LjYu
MTE2LXlvY3RvLXN0YW5kYXJkICMxCj4gSGFyZHdhcmUgbmFtZTogU29DRlBHQSBTdHJhdGl4IDEw
IFNvQ0RLIChEVCkKPiBwc3RhdGU6IDYwMDAwMDA1IChuWkN2IGRhaWYgLVBBTiAtVUFPIC1UQ08g
LURJVCAtU1NCUyBCVFlQRT0tLSkKPiBwYyA6IHJlZmNvdW50X3dhcm5fc2F0dXJhdGUrMHhmNC8w
eDE0OAo+IGxyIDogcmVmY291bnRfd2Fybl9zYXR1cmF0ZSsweGY0LzB4MTQ4Cj4gc3AgOiBmZmZm
ODAwMDgyOWFiYWYwCj4KPiBDYWxsIHRyYWNlOgo+ICByZWZjb3VudF93YXJuX3NhdHVyYXRlKzB4
ZjQvMHgxNDgKPiAgZGVsX210ZF9kZXZpY2UrMHgxMTgvMHgxNDAKPiAgX19kZWxfbXRkX3BhcnRp
dGlvbnMrMHg5NC8weGY4Cj4gIGRlbF9tdGRfcGFydGl0aW9ucysweDUwLzB4ODAKPiAgbXRkX2Rl
dmljZV91bnJlZ2lzdGVyKzB4NTAvMHg5MAo+ICBzcGlfbm9yX3JlbW92ZSsweDJjLzB4NDgKPiAg
c3BpX21lbV9yZW1vdmUrMHgyOC8weDQwCj4gIHNwaV9yZW1vdmUrMHgzOC8weDYwCj4gIGRldmlj
ZV9yZW1vdmUrMHg1NC8weDkwCj4gIGRldmljZV9yZWxlYXNlX2RyaXZlcl9pbnRlcm5hbCsweDFk
NC8weDIzOAo+ICBkZXZpY2VfZHJpdmVyX2RldGFjaCsweDIwLzB4MzgKPiAgdW5iaW5kX3N0b3Jl
KzB4YmMvMHhjOAo+ICBkcnZfYXR0cl9zdG9yZSsweDJjLzB4NDgKPiAgc3lzZnNfa2Zfd3JpdGUr
MHg0Yy8weDY4Cj4gIGtlcm5mc19mb3Bfd3JpdGVfaXRlcisweDEzOC8weDFmMAo+ICB2ZnNfd3Jp
dGUrMHgxYjgvMHgyZTAKPiAga3N5c193cml0ZSsweDdjLzB4MTIwCj4gIF9fYXJtNjRfc3lzX3dy
aXRlKzB4MjQvMHgzOAo+ICBpbnZva2Vfc3lzY2FsbCsweDVjLzB4MTM4Cj4gIGVsMF9zdmNfY29t
bW9uLmNvbnN0cHJvcC4wKzB4NDgvMHhmMAo+ICBkb19lbDBfc3ZjKzB4MjQvMHgzOAo+IGRvX2Vs
MF9zdmMrMHgyNC8weDM4Cj4gIGVsMF9zdmMrMHgzOC8weDEwOAo+ICBlbDB0XzY0X3N5bmNfaGFu
ZGxlcisweDEyMC8weDEzMAo+ICBlbDB0XzY0X3N5bmMrMHgxOTAvMHgxOTgKPiBgYGAKPgo+ICMj
IEFuYWx5c2lzCj4gVGhpcyBhcHBlYXJzIHRvIGJlIGEgcmFjZSBjb25kaXRpb24/IDoKPiAxLiBU
aGUgdW5iaW5kIG9wZXJhdGlvbiB0cmlnZ2VycyBNVEQgcGFydGl0aW9uIGRlbGV0aW9uIHZpYSBk
ZWxfbXRkX2RldmljZSgpCj4gMi4gU2ltdWx0YW5lb3VzbHksIGFub3RoZXIgcHJvY2VzcyByZWFk
aW5nIC9wcm9jL210ZCBob2xkcyByZWZlcmVuY2VzIHRvIHRoZSBNVEQgZGV2aWNlCj4gMy4gVGhl
IHJlZmVyZW5jZSBjb3VudCBnb2VzIG5lZ2F0aXZlLCBpbmRpY2F0aW5nIHRoZSBkZXZpY2Ugd2Fz
IGZyZWVkIHdoaWxlIHN0aWxsIGJlaW5nIGFjY2Vzc2VkCj4KPiAjIyBBZGRpdGlvbmFsIEluZm9y
bWF0aW9uCj4gLSBUaGUgaXNzdWUgaXMgcmVwcm9kdWNpYmxlIHdpdGggdGhlIGFib3ZlIHRlc3Qg
Y2FzZQo+Cj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBuZWVkIGFueSBhZGRpdGlvbmFsIGlu
Zm9ybWF0aW9uIG9yIHRlc3RpbmcuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gR3VvY2FpIEhlCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
