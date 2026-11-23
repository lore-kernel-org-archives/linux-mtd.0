Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7A3606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gmfJs6Eg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZD02+jRM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F6Ut1j+HMxYvlkgp67rSNku533SsM2KCQBcLe4OrDgU=; b=gmfJs6Eg9mB0djJun8UKYBk3rg
	8eUGofbJ/bVwIcvZpaufNF/nwGC9c8NnVn5O/xV7l2Pc+4grIQGv2sAcfcn0DhOTJgPTMGm3khwWd
	JFljAuqVrxysCpeg9CT3tetXIzlgceOU3S2p2QnRiRtJ+n0HQHCsnTpRcEcha9Q/L9VNDbFzWa8Vm
	YRHTDagfUa+nTOL/QkCYyUiOiH6Fa84WzlesWJc2bmsp4avUFFKEQJJAuz9SewZoiavHqJx/jg6kw
	RnYKjvFrbkicqYpFdTRd968xvbHjJ+oJqpbc/r4ELzvXQBwwNpYEi6DTjxJZ5RmdxcArJiYAv+vu2
	/n9vWK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPWg-00000002aHa-0b7s;
	Mon, 23 Nov 2026 08:35:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPWS-00000002aFw-3Gbs
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 08:35:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7D8381A17A6;
	Mon, 23 Nov 2026 08:35:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AC775FAEB;
	Mon, 23 Nov 2026 08:35:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 067B511E68650;
	Mon, 23 Nov 2026 09:35:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795422928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6VBgDnomgsT/WToI4JbYyMbeq2ZWp2kduZ9UTH4TxiM=;
	b=ZD02+jRMt1cJitlX0lUomMUhvpOzrXxpsSUYt+WQC5Nk2cw/KjOTaXH38aEPnnz5iAph/2
	6jfbD3q7zdws7Ck9TIN/+B1GN2E7Mhkk2zhPxTMw2DLNTOllAG9vYOroawy1sU8pOw+ClU
	K1kL7Sn0skISpOpeKvb6b+6mn2yL0MHo8XaA9d+V4mvCUpGVmlMpqo6CQcht0GXn0qvoZY
	hNqs9cCwurpie22F7Z9QA0Jepzx4hC5R7i5/EyZpSNK+zfzm+RF0bkqovDfVThghNSYqRh
	9+2YQWgD0CS2EpYyuMYuoh/9H8D9lDR/w6Gx/k3lV8cSl4zc8dWnBjqpdGmN+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] mtdchar: kvmalloc() for large read/write buffers?
In-Reply-To: <20261123033212.1660477-1-leeonion.muyu@gmail.com> (Ping Li's
	message of "Mon, 23 Nov 2026 11:32:12 +0800")
References: <875wxtf8uy.fsf@bootlin.com>
	<20261123033212.1660477-1-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 23 Nov 2026 09:35:26 +0100
Message-ID: <87y0akuer5.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_003538_245382_92667E07 
X-CRM114-Status: GOOD (  27.95  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjMvMTEvMjAyNiBhdCAxMTozMjoxMiArMDgsIFBpbmcgTGkgPGxlZW9uaW9uLm11eXVAZ21h
aWwuY29tPiB3cm90ZToKCj4gRnJvbTogbGVlb25pb24ubXV5dUBnbWFpbC5jb20KPgo+IEhpIE1p
cXVlbCwKPgo+IFRoYW5rcyBmb3IgdGhlIHJldmlldyEKPgo+PiBJIHdvdWxkIGJlIGN1cmlvdXMg
dG8ga25vdyBob3cgdGhpcyBnZXRzIGZhc3RlciBhbmQgd2h5Pwo+PiBCZWNhdXNlIHRoZSBwcmVm
ZXJyZWQgcGF0aCBpcyBvYnZpb3VzbHkgdmlhIERNQSAuLi4KPgo+IFRoZSBtb3RpdmF0aW9uIG9u
IG91ciBwbGF0Zm9ybSBpcyBub3QgcGVyLWJ5dGUgQ1BVIGNvc3QgYnV0Cj4gcGVyLXRyYW5zYWN0
aW9uIGNvc3Q6IHRoZSBsb3ctbGV2ZWwgZHJpdmVyIGZvcndhcmRzIHRoZSB3aG9sZQo+IHRyYW5z
ZmVyIHRvIGEgY29udHJvbGxlciBvdmVyIGEgYnVzLCBzbyB0aGUgbGF0ZW5jeSBvZiBlYWNoCj4g
bXRkX3JlYWQoKS9tdGRfd3JpdGUoKSBjYWxsIGRvbWluYXRlcy4gIFdpdGggdGhlIGN1cnJlbnQK
PiBoYWx2aW5nLCBhIGZyYWdtZW50ZWQgMiBNaUIgcmVhZCBzaWxlbnRseSB0dXJucyBpbnRvIGRv
emVucwo+IG9mIHNtYWxsIHRyYW5zYWN0aW9ucywgZWFjaCBwYXlpbmcgYSBmdWxsIHJvdW5kIHRy
aXAuCj4KPiBZb3UgYXJlIHJpZ2h0IHRoYXQgdGhpcyBhcmd1bWVudCBkb2VzIG5vdCBob2xkIGZv
ciBETUEtYm91bmQKPiBkcml2ZXJzOiBmb3IgdGhvc2UgYSBzbWFsbGVyIGttYWxsb2MnZCBidWZm
ZXIgZ2l2ZW4gdG8gdGhlCj4gRE1BIGVuZ2luZSBiZWF0cyBhIHZtYWxsb2MnZCBvbmUgYm91bmNp
bmcgdGhyb3VnaCB0aGUgQ1BVLgo+IFRoYXQgaXMgZXhhY3RseSB3aHkgSSBsaWtlIHlvdXIgc3Vn
Z2VzdGlvbjogYSBwZXItZGV2aWNlCj4gcG9saWN5IGF2b2lkcyBib3RoIGZhaWx1cmUgbW9kZXMg
LS0gRE1BIGRldmljZXMga2VlcAo+IGNvbnRpZ3VvdXMgYnVmZmVycyBhbmQgdGhlaXIgZ3JhY2Vm
dWwgaGFsdmluZyBkZWdyYWRhdGlvbiwKPiB0cmFuc2FjdGlvbi1ib3VuZCBkZXZpY2VzIGtlZXAg
YSBsYXJnZSBidWZmZXIgcmVnYXJkbGVzcyBvZgo+IGZyYWdtZW50YXRpb24uCj4KPiBXaGlsZSBh
dWRpdGluZyBJIG5vdGljZWQgdGhhdCB0aGUgZnNtYy9pbnRlbC9yODUyIGV4cG9zdXJlCj4gcHJl
ZGF0ZXMgdGhpcyBSRkM6IHNpbmNlIHRoZSBNRU1SRUFEL01FTVdSSVRFIGNvbnZlcnNpb24KPiAo
ODMyMDhlMTA2YThlOCksIGEgdm1hbGxvYydkIGlvY3RsIGJ1ZmZlciBjYW4gYWxyZWFkeSByZWFj
aAo+IHRoZWlyIGRtYV9tYXBfc2luZ2xlKCkgdW5kZXIgZnJhZ21lbnRhdGlvbiwgYmVjYXVzZSBu
b25lIG9mCj4gdGhlbSBkZWNsYXJlcyBOQU5EX1VTRVNfRE1BLCB3aGljaCBpcyB3aGF0IGFjdGl2
YXRlcwo+IG5hbmRfYmFzZSdzIHZpcnRfYWRkcl92YWxpZCgpIGJvdW5jZS4gIEkgd291bGQgbGlr
ZSB0byBzZW5kCj4gdGhlc2UgdGhyZWUgb25lLWxpbmUgZml4ZXMgYXMgYW4gaW5kZXBlbmRlbnQg
c2VyaWVzIHJpZ2h0Cj4gYXdheSwgYXMgdGhleSBmaXggYSBwcmUtZXhpc3RpbmcgaXNzdWUgcmVn
YXJkbGVzcyBvZiB0aGUKPiBkaXJlY3Rpb24gdGFrZW4gaGVyZS4gIE9ubHkgcG93ZXJudl9mbGFz
aCAod2hpY2ggaW1wbGVtZW50cwo+IHBsYWluIF9yZWFkL193cml0ZSBhbmQgaXMgdW5yZWFjaGFi
bGUgZnJvbSB0aGUgaW9jdGxzKSBpcwo+IG5ld2x5IGV4cG9zZWQgYnkgdGhlIHByb3Bvc2VkIGNv
bnZlcnNpb24sIHNvIGl0IHdvdWxkIGNvbWUKPiBhcyBhIHByZXJlcXVpc2l0ZSBvZiB0aGUgc2Vy
aWVzLgo+Cj4gVGhlIHBsYW4gSSB3b3VsZCB0aGVuIGZvbGxvdzoKPgo+IDEuIEF1ZGl0IGFsbCBt
dGQtPl9yZWFkL193cml0ZSBpbXBsZW1lbnRhdGlvbnMgZm9yIGRpcmVjdAo+ICAgIF9fcGEoKS9k
bWFfbWFwX3NpbmdsZSgpIHVzZSBvZiB0aGUgZGF0YSBidWZmZXIuCj4gMi4gSW50cm9kdWNlIG10
ZC0+ZXhwZWN0c19kbWFfYnVmcyBhbmQgdGhlIGFsbG9jYXRpb24KPiAgICBoZWxwZXIsIHdpdGgg
cG93ZXJudl9mbGFzaCBkZWNsYXJpbmcgaXQuCj4gMy4gQ29udmVydCBtdGRjaGFyX3JlYWQoKS9t
dGRjaGFyX3dyaXRlKCkgdG8gdGhlIGhlbHBlci4KPiA0LiBQcm92aWRlIG51bWJlcnMgZnJvbSBv
dXIgcGxhdGZvcm0sIGluY2x1ZGluZyB0aGUKPiAgICBETUEtYm91bmQgY291bnRlci1leGFtcGxl
LgoKRmluZS4KCj4gVGhyZWUgcXVlc3Rpb25zIGJlZm9yZSBJIHN0YXJ0Ogo+Cj4gLSBTaGFsbCBJ
IHdhaXQgZm9yIFJpY2hhcmQncyBvcGluaW9uIGZpcnN0LCBvciBkb2VzIHRoaXMKPiAgIHBsYW4g
YWxyZWFkeSBsb29rIHJlYXNvbmFibGUgZW5vdWdoIHRvIGRyYWZ0IGEgc2VyaWVzPwoKSSBndWVz
cyB5b3UgY2FuIHByb2NlZWQsIGJ1dCBSaWNoYXJkJ3Mgb3BpbmlvbiBpcyBpbmRlZWQgdmVyeSB3
ZWxjb21lLgoKPiAtIEZvciBleHBlY3RzX2RtYV9idWZzPWZhbHNlIGRldmljZXMsIGlzIHBsYWlu
IGt2bWFsbG9jKCkKPiAgIGFjY2VwdGFibGUgKHNpbmdsZSBrbWFsbG9jIGF0dGVtcHQsIHRoZW4g
dm1hbGxvYyksIG9yCj4gICBzaG91bGQgdGhlIGhhbHZpbmcgc3RheSBmb3IgdGhvc2UgdG9vPyAg
U2FzaGlrbydzCj4gICBOT01NVS9sb3ctbWVtb3J5IHBvaW50IHN1Z2dlc3RzIGtlZXBpbmcgaXQg
YXMgYQo+ICAgbGFzdC1yZXNvcnQgZmFsbGJhY2suCgpXZSBzaG91bGQga2VlcCB0b2RheSdzIGRl
ZmF1bHQsIGlmIHRoZXJlIGlzIG9uZS4gSSBkb24ndCBsaWtlIGt2bWFsbG9jCmluIHRoaXMgY2Fz
ZSBiZWNhdXNlIGl0IG1heSBoaWRlIGJ1Z3MuCgo+IC0gT25lIG1vcmUgcXVlc3Rpb24gb24gdGhl
IGZsYWcgcG9sYXJpdHkuICBXaXRoIGEgZmFsc2UKPiAgIGRlZmF1bHQgKERNQSBkcml2ZXJzIGRl
Y2xhcmUgdHJ1ZSksIGEgZm9yZ2V0ZnVsIERNQQo+ICAgZHJpdmVyIHdvdWxkIHNpbGVudGx5IHJl
Y2VpdmUgdm1hbGxvYydkIGJ1ZmZlcnMgLS0gdGhlCj4gICBleGFjdCBmc21jIGNsYXNzIG9mIGJ1
ZyBhdCB0aGUgTVREIGxheWVyLiAgQSB0cnVlCj4gICBkZWZhdWx0ICh2bWFsbG9jLXNhZmUgZHJp
dmVycyBkZWNsYXJlIGZhbHNlKSBrZWVwcyB0aGUKPiAgIGZhaWx1cmUgbW9kZSBiZW5pZ24gYXQg
dGhlIGNvc3Qgb2YgaGF2aW5nIG5vIGluLXRyZWUKPiAgICJmYWxzZSIgdXNlcnMgaW5pdGlhbGx5
LiAgSSBzbGlnaHRseSBsZWFuIHRvd2FyZCB0aGUKPiAgIHNhZmUgZGVmYXVsdCwgYnV0IEkgY2Fu
IHNlZSB0aGUgZGVhZC1jb2RlIGNvbmNlcm4uCj4gICBXaGljaCBwb2xhcml0eSB3b3VsZCB5b3Ug
cHJlZmVyPwoKV2Ugd291bGQgbm90IGhhdmUgMCB1c2VycywgYmVjYXVzZSB0aGVyZSBhcmUgcGxl
bnR5IGRyaXZlcnMgYWxyZWFkeQpkb2luZyBib3VuY2UgYnVmZmVyaW5nIHdoaWNoIHdvdWxkIHRo
ZXJlZm9yZSBuZWVkIHRvIGJlIGNvbnZlcnRlZCB0bwpleHBlY3RzX2RtYV9idWZzID0gdHJ1ZS4K
CkkgdGhpbmsgdGhlIGRlZmF1bHQgdG9kYXkgaXMgdGhhdCB0aGUgZHJpdmVycyBtYXkgZXhwZWN0
IERNQS1hYmxlCmJ1ZmZlcnMgYW5kIHRoZSBzdWJzeXN0ZW1zIGVuZm9yY2UgdGhpcyBieSBib3Vu
Y2luZyB0aGUgZGF0YSwKbm8/CgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
