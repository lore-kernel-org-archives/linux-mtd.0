Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA37606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MrnFLlbR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcLS4gK6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZZSdSeiGclVN+fr+8Nas1LrSoANkn3fgXLZ4cs5XGcY=; b=MrnFLlbR1dN3k17s2A8Oc0+iIH
	q+JdBgUu9QETtf1tLYi6doFrk8WNdP6HOC4qBFAaAf/0CqoG5J6939WbERRUplpC/QzkdgSPml4zP
	TSKxn7APLolpAjrjyvYWfcCX801ppUy/4BHZTVmSKYYH6DyybNDzaQPSAU1dBFinWWh9lENZaBLFb
	amMIzTYPos4wJQdXu2+UJmLy6htvXXg2fDIMKRVBWF2Vz0nAmpTn47k86Ss80A9zrBH8dIq3A7Z4Z
	jcMghZBjNZB2SyslQTaMhobaJ5FMdxLwOk3Hi7zZXstlO28gv5JmsxnAhHTcsqkCbkJBqiRFGFICo
	XR2mDEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHia-0000000B0Mu-1wUt;
	Wed, 25 Nov 2026 18:27:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHiX-0000000B0MV-28Qm
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 18:27:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A0586061C;
	Wed, 25 Nov 2026 18:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64DD1F000C0;
	Wed, 25 Nov 2026 18:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631260;
	bh=wDMirRJrf1Hevbb2RQb7Ux8WrGtymI5eyuYh769zW+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcLS4gK6gUvui0t7Lm4APRAWDz6ourODTKFb2qUnrlms7kkARWsDDEOFoLLger7fU
	 c8EDp3xKb/IEyPnjNYpvlGxnDIcxf2M5h/tQPDQBxhQdDF/xJhdSpJxfxdGcCfMeTO
	 2nZvPTGa8J2aaojfrPRZjsPikyb2NiLOFuW0ebm5qmNjFh/C+J+xpqq4Ux0m/Xx52W
	 aaPxBKBGMll5Hzv3NdJAIBTu+OHnxj/wPylCkhtIjQZKWAHS/SvRViliKEQjui0p1l
	 My50XEw7cVas6JFAc+PS0zJNyxBuy7dt6PwwFwdUwTwKO8xZfV10LkDA+QKYqOjyRF
	 VGxwZmJjsDXFA==
Message-ID: <sashiko-outbox-233989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] mtd: rawnand: Add Cortina CS7542 controller
 support
To: "Fil Dunsky" <filipp.dunsky@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261125-b4-cs7542-nand-v3-2-0b6d141c102e@gmail.com>
References: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
 <20261125-b4-cs7542-nand-v3-2-0b6d141c102e@gmail.com>
Date: Wed, 25 Nov 2026 18:27:39 +0000
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
LQoKY29tbWl0IDEwNTE1MDJiMjUyYzBhMjNlYTQ0YmJmNWZiOWU0MWZjNWFiNjQyNzcKQXV0aG9y
OiBGaWwgRHVuc2t5IDxmaWxpcHAuZHVuc2t5QGdtYWlsLmNvbT4KCm10ZDogcmF3bmFuZDogQWRk
IENvcnRpbmEgQ1M3NTQyIGNvbnRyb2xsZXIgc3VwcG9ydAoKVGhpcyBjb21taXQgYWRkcyBhIHJh
dyBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIGZvciB0aGUgQ29ydGluYSBTeXN0ZW1zCkNTNzU0MiBT
b0MgdXNpbmcgcHJvZ3JhbW1lZCBJL08gYW5kIHRoZSBvbi1ob3N0IEhhbW1pbmcgRUNDIGVuZ2lu
ZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NzNzUyeF9uYW5kLmMgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9jczc1MnhfbmFuZC5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwMDAwLi44MWI1NTExNDg0ZDk3Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NzNzUyeF9uYW5kLmMKPiBAQCAtMCwwICsxLDgxNCBA
QAoKWyAuLi4gXQoKPiArc3RhdGljIHZvaWQgY3M3NTJ4X3NldHVwX3BhZ2VfcmVncyhzdHJ1Y3Qg
Y3M3NTJ4X25hbmRfaG9zdCAqaCwgaW50IHBhZ2UsCj4gKwkJCQkgICBib29sIHdyaXRlLCBib29s
IG9vYl9yZXF1aXJlZCkKPiArewo+ICsJc3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZoLT5jaGlw
Owo+ICsJc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiArCXUzMiBj
bWQsIGFkZHIxLCBhZGRyMiwgY250Owo+ICsKPiArCWNudCA9IE5GX0NOVF9EQVRBKG10ZC0+d3Jp
dGVzaXplIC0gMSk7Cj4gKwljbnQgfD0gTkZfQ05UX09PQihvb2JfcmVxdWlyZWQgPyBtdGQtPm9v
YnNpemUgLSAxIDogTkNOVF9FTVBUWV9PT0IpOwo+ICsKPiArCWNudCB8PSBORl9DTlRfQ01EKE5D
TlRfQ01EXzIpOwo+ICsJY21kID0gd3JpdGUgPyBta19uZl9jb21tYW5kKE5BTkRfQ01EX1NFUUlO
LCBOQU5EX0NNRF9QQUdFUFJPRywgMCkgOgo+ICsJCSAgICAgIG1rX25mX2NvbW1hbmQoTkFORF9D
TURfUkVBRDAsIE5BTkRfQ01EX1JFQURTVEFSVCwgMCk7Cj4gKwljbnQgfD0gTkZfQ05UX0FERFIo
bWtfbmZfYWRkcihjaGlwLCBwYWdlLCAmYWRkcjEsICZhZGRyMiwgMCkpOwo+ICsKPiArCWZsX3dy
aXRlbChoLCBGTEFTSF9ORl9DT1VOVCwgY250KTsKPiArCWZsX3dyaXRlbChoLCBGTEFTSF9ORl9D
T01NQU5ELCBjbWQpOwo+ICsJZmxfd3JpdGVsKGgsIEZMQVNIX05GX0FERFJFU1NfMSwgYWRkcjEp
Owo+ICsJZmxfd3JpdGVsKGgsIEZMQVNIX05GX0FERFJFU1NfMiwgYWRkcjIpOwo+ICsJZmxfd3Jp
dGVsKGgsIEZMQVNIX05GX0FDQ0VTUywKPiArCQkgIE5GX0FDQ0VTU19XSURUSDMyIHwKPiArCQkg
IE5GX0FDQ0VTU19FWFRBRERSKCgodTY0KXBhZ2UgPDwgY2hpcC0+cGFnZV9zaGlmdCkgPj4gMjcp
KTsKPiArfQoKWyAuLi4gXQoKPiArc3RhdGljIGludCBjczc1MnhfbmFuZF9waW8oc3RydWN0IGNz
NzUyeF9uYW5kX2hvc3QgKmgsCj4gKwkJCSAgIGNvbnN0IHN0cnVjdCBjczc1MnhfbmFuZF9vcCAq
cCwgdTggKmJ1ZiwKPiArCQkJICB1bnNpZ25lZCBpbnQgbGVuLCBib29sIHdyaXRlKQo+ICt7Cj4g
Kwl1MzIgdmFsdWU7Cj4gKwl1bnNpZ25lZCBpbnQgaSwgc3RlcCA9IHdyaXRlICYmIGxlbiA/IHNp
emVvZih1MzIpIDogMTsKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gY2hlY2tfZmxhc2hfY3Ry
bF9zdGF0dXMoaCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwlyZXNldF9lY2Nf
YmNoX3JlZ2lzdGVycyhoKTsKPiArCWZsX3dyaXRlbChoLCBGTEFTSF9ORl9DT1VOVCwKPiArCQkg
IE5GX0NOVF9PT0IoTkNOVF9FTVBUWV9PT0IpIHwKPiArCQkgIE5GX0NOVF9EQVRBKGxlbiA/IGxl
biAtIDEgOiBOQ05UX0VNUFRZX0RBVEEpIHwKPiArCQkgIE5GX0NOVF9BRERSKHAtPm5hZGRycyA/
IHAtPm5hZGRycyAtIDEgOiBOQ05UX0VNUFRZX0FERFIpIHwKPiArCQkgIE5GX0NOVF9DTUQocC0+
bmNtZHMgLSAxKSk7Cj4gKwlmbF93cml0ZWwoaCwgRkxBU0hfTkZfQ09NTUFORCwgcC0+Y29tbWFu
ZCk7Cj4gKwlmbF93cml0ZWwoaCwgRkxBU0hfTkZfQUREUkVTU18xLCBsb3dlcl8zMl9iaXRzKHAt
PmFkZHJlc3MpKTsKPiArCWZsX3dyaXRlbChoLCBGTEFTSF9ORl9BRERSRVNTXzIsIHVwcGVyXzMy
X2JpdHMocC0+YWRkcmVzcykpOwo+ICsJZmxfd3JpdGVsKGgsIEZMQVNIX05GX0FDQ0VTUywgd3Jp
dGUgJiYgbGVuID8gTkZfQUNDRVNTX1dJRFRIMzIgOiBORl9BQ0NFU1NfV0lEVEg4KTsKCltTZXZl
cml0eTogTWVkaXVtXQpTaG91bGQgY3M3NTJ4X25hbmRfcGlvKCkgYWxzbyBzZXQgTkZfQUNDRVNT
X0VYVEFERFIoKSBpbiBGTEFTSF9ORl9BQ0NFU1MKZm9yIHJvdy1hZGRyZXNzZWQgb3BlcmF0aW9u
cywgb3IgaXMgTkZfQUNDRVNTX0VYVEFERFIoKSB1bnVzZWQgZm9yCnJlZ2lzdGVyLVBJTyB0cmFu
c2ZlcnM/Cgpjczc1Mnhfc2V0dXBfcGFnZV9yZWdzKCkgc2V0cyBORl9BQ0NFU1NfRVhUQUREUigo
KHU2NClwYWdlIDw8CmNoaXAtPnBhZ2Vfc2hpZnQpID4+IDI3KSB0byBzZWxlY3QgdGhlIDEyOCBN
aUIgYmFuayBmb3IgZnVsbC1wYWdlIFBJTwpyZWFkcyBhbmQgd3JpdGVzLCB3aGVyZWFzIGNzNzUy
eF9uYW5kX3BpbygpIGFsd2F5cyBsZWF2ZXMKTkZfQUNDRVNTX0VYVEFERFIoKSBhdCAwLiAgSWYg
dGhlIGNvbnRyb2xsZXIgdXNlcyBORl9BQ0NFU1NfRVhUQUREUigpCmR1cmluZyByZWdpc3Rlci1Q
SU8gdHJhbnNhY3Rpb25zLCBleGVjX29wIGNvbW1hbmRzIHN1Y2ggYXMgYmxvY2sgZXJhc2VzIG9y
Ck9PQiBhY2Nlc3NlcyBhdCBmbGFzaCBvZmZzZXRzID49IDEyOCBNaUIgd2lsbCB0YXJnZXQgYmFu
ayAwIGluc3RlYWQuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYxMTI1LWI0LWNzNzU0Mi1uYW5kLXYzLTAtMGI2ZDE0MWMxMDJlQGdt
YWlsLmNvbT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
