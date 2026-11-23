Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194A7606A336
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 20:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oOnGnKAk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AnKPlzgt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7L9qi1Sf3iD7ZQniMh3KBt0ElDV22ooVtNW2SnbsTIY=; b=oOnGnKAkLGITbkvPUYIQITZEr+
	HaWbaeUr0FLeQgNl3a4E817Lk3TcDu0WJ4T9+XajwfuQrWUEdkGMqKVoY2CFoq2I3IWQOisURaTzv
	Ze/pVEgR/3aJO3MVJSCBukOeqgAqoaIMamI80++qryI+N0/hlH/cZDKiny2+nDzeurbcHfCHVBjmy
	ltscgRegghztfvLpjs3qSpdC9IGAaSF86wakJubGXluA28ZaVKO5KLcEMNhD4e6maARbioynWPFar
	zQGY64wuAn/L+sf4u7VlCkduNeUJ/OuF7s2gzcfMK7LYa6/zHmMIUiKHPJdJiIh+u7cdj9mOeMELU
	+ikhT1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVapF-00000004sEC-0aJq;
	Mon, 23 Nov 2026 20:39:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVapD-00000004sE6-0ZrD
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 20:39:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B36DA4171E;
	Mon, 23 Nov 2026 20:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD5B1F000C6;
	Mon, 23 Nov 2026 20:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795466382;
	bh=ozLU9mjX12D6E3fJKocwLOV914WeU6DXymjPpMvo/gI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AnKPlzgtnLq70ZoOJD2LZX9NxNyD4+yWH1E7YEOLS+gcoULAVD5RYer0UyKuJp50p
	 X2Hr7OfIuM0hE0FoKz74dhukHtAyMdRIbkFPrqVgdABeLp+gmkwSST9TAFslLX7Jrm
	 +q4D58RsIa5/BZzn4PoXq/zZJCE/M5JNnyzQC0uTujAamoSUumUZasTPa7afPrDG+w
	 VvcvQYjXXwS7gczIukbu6iICOSP9qaLVJxmrIvj1ZwuP2A1ExpCHY7SVBs5lWlYrdu
	 USQBOe0RjNWHC0DDKiQkI/4Z58Pp5G39p74ls/GgAntDG/QtQKI5iBJse0t9mlSqza
	 hwi2kXb/B7FCg==
Message-ID: <sashiko-outbox-230010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: Add Cortina CS7542 controller
 support
To: "Fil Dunsky" <filipp.dunsky@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com>
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
 <20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com>
Date: Mon, 23 Nov 2026 20:39:41 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5kOiBj
czc1Mng6IG1pc3NpbmcgTkZfQUNDRVNTX0VYVEFERFIgaW4KICBjczc1MnhfbmFuZF9waW8oKQot
LQoKY29tbWl0IDhkMDgyNjRiN2E0YzA5ZGEyNTFkYjUwNDc0YWU1OTFlZTFlMDcxN2MKQXV0aG9y
OiBGaWwgRHVuc2t5IDxmaWxpcHAuZHVuc2t5QGdtYWlsLmNvbT4KCm10ZDogcmF3bmFuZDogQWRk
IENvcnRpbmEgQ1M3NTQyIGNvbnRyb2xsZXIgc3VwcG9ydAoKVGhpcyBjb21taXQgYWRkcyBhIHJh
dyBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIGZvciB0aGUgQ29ydGluYSBTeXN0ZW1zCkNTNzU0MiB1
c2luZyBwcm9ncmFtbWVkIEkvTywgdGhlIG5hdGl2ZSBjb21tYW5kIHNlcXVlbmNlciwgYW5kIGhh
cmR3YXJlCkhhbW1pbmcgRUNDLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
Y3M3NTJ4X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NzNzUyeF9uYW5kLmMKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmE3Y2VjZDc0N2YyZTQKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvY3M3NTJ4X25hbmQuYwoK
WyAuLi4gXQoKPiArc3RhdGljIHZvaWQgY3M3NTJ4X3NldHVwX3BhZ2VfcmVncyhzdHJ1Y3QgY3M3
NTJ4X25hbmRfaG9zdCAqaCwgaW50IHBhZ2UsCj4gKwkJCQkgICBib29sIHdyaXRlLCBib29sIG9v
Yl9yZXF1aXJlZCkKPiArewo+ICsJc3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZoLT5jaGlwOwo+
ICsJc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiArCXUzMiBjbWQs
IGFkZHIxLCBhZGRyMiwgY250Owo+ICsKPiArCWNudCA9IE5GX0NOVF9EQVRBKG10ZC0+d3JpdGVz
aXplIC0gMSk7Cj4gKwljbnQgfD0gTkZfQ05UX09PQihvb2JfcmVxdWlyZWQgPyBtdGQtPm9vYnNp
emUgLSAxIDogTkNOVF9FTVBUWV9PT0IpOwo+ICsKPiArCWNudCB8PSBORl9DTlRfQ01EKE5DTlRf
Q01EXzIpOwo+ICsJY21kID0gd3JpdGUgPyBta19uZl9jb21tYW5kKE5BTkRfQ01EX1NFUUlOLCBO
QU5EX0NNRF9QQUdFUFJPRywgMCkgOgo+ICsJCSAgICAgIG1rX25mX2NvbW1hbmQoTkFORF9DTURf
UkVBRDAsIE5BTkRfQ01EX1JFQURTVEFSVCwgMCk7Cj4gKwljbnQgfD0gTkZfQ05UX0FERFIobWtf
bmZfYWRkcihjaGlwLCBwYWdlLCAmYWRkcjEsICZhZGRyMiwgMCkpOwo+ICsKPiArCWZsX3dyaXRl
bChoLCBGTEFTSF9ORl9DT1VOVCwgY250KTsKPiArCWZsX3dyaXRlbChoLCBGTEFTSF9ORl9DT01N
QU5ELCBjbWQpOwo+ICsJZmxfd3JpdGVsKGgsIEZMQVNIX05GX0FERFJFU1NfMSwgYWRkcjEpOwo+
ICsJZmxfd3JpdGVsKGgsIEZMQVNIX05GX0FERFJFU1NfMiwgYWRkcjIpOwo+ICsJZmxfd3JpdGVs
KGgsIEZMQVNIX05GX0FDQ0VTUywKPiArCQkgIE5GX0FDQ0VTU19XSURUSDMyIHwKPiArCQkgIE5G
X0FDQ0VTU19FWFRBRERSKCgodTY0KXBhZ2UgPDwgY2hpcC0+cGFnZV9zaGlmdCkgPj4gMjcpKTsK
PiArfQoKWyAuLi4gXQoKPiArc3RhdGljIGludCBjczc1MnhfbmFuZF9waW8oc3RydWN0IGNzNzUy
eF9uYW5kX2hvc3QgKmgsCj4gKwkJCSAgIGNvbnN0IHN0cnVjdCBjczc1MnhfbmFuZF9vcCAqcCwg
dTggKmJ1ZiwKPiArCQkJICB1bnNpZ25lZCBpbnQgbGVuLCBib29sIHdyaXRlKQo+ICt7Cj4gKwl1
MzIgdmFsdWU7Cj4gKwl1bnNpZ25lZCBpbnQgaSwgc3RlcCA9IHdyaXRlICYmIGxlbiA/IHNpemVv
Zih1MzIpIDogMTsKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gY2hlY2tfZmxhc2hfY3RybF9z
dGF0dXMoaCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwlyZXNldF9lY2NfYmNo
X3JlZ2lzdGVycyhoKTsKPiArCWZsX3dyaXRlbChoLCBGTEFTSF9ORl9DT1VOVCwKPiArCQkgIE5G
X0NOVF9PT0IoTkNOVF9FTVBUWV9PT0IpIHwKPiArCQkgIE5GX0NOVF9EQVRBKGxlbiA/IGxlbiAt
IDEgOiBOQ05UX0VNUFRZX0RBVEEpIHwKPiArCQkgIE5GX0NOVF9BRERSKHAtPm5hZGRycyA/IHAt
Pm5hZGRycyAtIDEgOiBOQ05UX0VNUFRZX0FERFIpIHwKPiArCQkgIE5GX0NOVF9DTUQocC0+bmNt
ZHMgLSAxKSk7Cj4gKwlmbF93cml0ZWwoaCwgRkxBU0hfTkZfQ09NTUFORCwgcC0+Y29tbWFuZCk7
Cj4gKwlmbF93cml0ZWwoaCwgRkxBU0hfTkZfQUREUkVTU18xLCBsb3dlcl8zMl9iaXRzKHAtPmFk
ZHJlc3MpKTsKPiArCWZsX3dyaXRlbChoLCBGTEFTSF9ORl9BRERSRVNTXzIsIHVwcGVyXzMyX2Jp
dHMocC0+YWRkcmVzcykpOwo+ICsJZmxfd3JpdGVsKGgsIEZMQVNIX05GX0FDQ0VTUywgd3JpdGUg
JiYgbGVuID8gTkZfQUNDRVNTX1dJRFRIMzIgOiBORl9BQ0NFU1NfV0lEVEg4KTsKCltTZXZlcml0
eTogTWVkaXVtXQpTaG91bGQgY3M3NTJ4X25hbmRfcGlvKCkgYWxzbyBzZXQgTkZfQUNDRVNTX0VY
VEFERFIoKSBpbiBGTEFTSF9ORl9BQ0NFU1MgZm9yCnJvdy1hZGRyZXNzZWQgb3BlcmF0aW9ucz8K
CldoaWxlIGNzNzUyeF9zZXR1cF9wYWdlX3JlZ3MoKSBzZXRzIE5GX0FDQ0VTU19FWFRBRERSKCkg
dG8gc2VsZWN0IHRoZQoxMjggTWlCIGJhbmsgZm9yIGZ1bGwtcGFnZSBQSU8gdHJhbnNmZXJzLCBj
czc1MnhfbmFuZF9waW8oKSBsZWF2ZXMKTkZfQUNDRVNTX0VYVEFERFIgYXQgMC4gUm93LWFkZHJl
c3NlZCB0cmFuc2FjdGlvbnMgZXhlY3V0ZWQgdGhyb3VnaApjczc1MnhfbmFuZF9leGVjX29wKCks
IHN1Y2ggYXMgYmxvY2sgZXJhc2VzLCBPT0IgcmVhZHMgYW5kIHdyaXRlcywgYW5kIGJhZApibG9j
ayB0YWJsZSBzY2Fucywgd2lsbCBub3QgcHJvZ3JhbSB0aGUgYmFuayBpbmRleCBmb3Igb2Zmc2V0
cyBhdCBvciBhYm92ZQoxMjggTWlCLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEyMy1iNC1jczc1NDItbmFuZC12Mi0wLTlkOWYw
ODYwODUzNEBnbWFpbC5jb20/cGFydD0yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
