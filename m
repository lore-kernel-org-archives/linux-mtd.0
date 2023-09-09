Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54458EEB580
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Sep 2023 06:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5vlSXhUweNRXOqrBusyrkJBUVb6krAqBncwJzQucCo=; b=erpgMwLaY/dCcu
	ujNcybaE4DmGfht47apGCxr+asfdD2DLFdO+xrxbfhejgpY/OmcdL6+OM1MxJll0upmLjo0vEVM4r
	qklHIUoplA1mOBegGom23aupX17eYIxaK8aSSER7oKNmFbbuDwHe4PM/RfDsoTvTZ9sNDwX3Dj6AN
	Hf6IXJvw208peE/RnfVbp10bfL5sUDOGp2zT2qYjk3Ab8A5aMF86Z/mocjUgc4Y7LjFBHLK7nbuSE
	wl14E6s9FuIVzHvl+EUtMrVQBO5eG5hbe8vhArTYEXubzeyluiHhSNLY7xI2t+TynkKzxwyCE82jm
	7nCELVAtBuoocp0JwNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qer4S-00F4bS-2f;
	Sat, 09 Sep 2023 06:03:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qer4O-00F4aD-2U
	for linux-mtd@lists.infradead.org;
	Sat, 09 Sep 2023 06:03:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6CD18CE1C38;
	Sat,  9 Sep 2023 06:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26224C433C8;
	Sat,  9 Sep 2023 06:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694239420;
	bh=D/qZHs6VWJY9qqhwtf08OymHikqt+nVKX982NNZ2RYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDfp+svWZoK6H4kUONHktO5Vuy10qGZnfuBbt0xcd+yzd/PChcz/gy69qUP29zkmX
	 VNHrADeiip9Y3oTvVwFUM8ZeIhFMViVXePZiY72V69QTIC3EzDpoq2WFS3/x4MpO4n
	 bVnkL/M4TIPRZrf1qPkFj8Sx4zH6MNfx4922ukYeBd90JWflq59qePzk3roA9cCEK5
	 OVxRl+oCAbAGbg4EkMUGJBEMP7n51NvprNKMPCnt0w6ar9XoCm9IkKlwBBjJt+LS3O
	 cxRU6tGFfTwjXbBG1iggysEzPwBIY9H/BkIP9ooncdb8Z/PDhXBNCkzMjBpIimNjHd
	 1CXLvKWP5tq1A==
Date: Sat, 9 Sep 2023 11:33:27 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com,
	quic_charante@quicinc.com, quic_kaushalk@quicinc.com
Subject: Re: [PATCH] mtd: nand: qcom: Fix the node for nand unmap resource
Message-ID: <20230909060327.GA5847@thinkpad>
References: <20230907092854.11408-1-quic_bibekkum@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230907092854.11408-1-quic_bibekkum@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_230349_012673_644699F7 
X-CRM114-Status: GOOD (  16.30  )
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

T24gVGh1LCBTZXAgMDcsIDIwMjMgYXQgMDI6NTg6NTRQTSArMDUzMCwgQmliZWsgS3VtYXIgUGF0
cm8gd3JvdGU6Cj4gV2hpbGUgdW5tYXBwaW5nIHRoZSBuYW5kIHJlc291cmNlIGluIGNhc2Ugb2Yg
ZXJyX2NvcmVfY2xrCj4gdGhlIGRldiBub2RlIGJlaW5nIHBhc3NlZCBpcyByZXNfc3RhcnQgaW5z
dGVhZCBvZiBuYW5kLT5kbWFfYmFzZQo+ICh3aGVyZSB0aGUgaW92YSByZXR1cm5lZCBmcm9tIG1h
cCBvcGVyYXRpb24gaXMgc3RvcmVkKSBjYXVzaW5nCj4gZmFpbHVyZSBpbiB1bm1hcCBvcGVyYXRp
b24uIEhlbmNlIG1vZGlmeWluZyB0aGUgdW5tYXAgb3BlcmF0aW9uCj4gdG8gcGFzcyB0aGUgbmFu
ZC0+YmFzZV9kbWEgaW5zdGVhZCBvZiByZXNfc3RhcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmli
ZWsgS3VtYXIgUGF0cm8gPHF1aWNfYmliZWtrdW1AcXVpY2luYy5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
Ywo+IGluZGV4IGY1ODMwMjI3NTVhMi4uZTA4NWEwZjU4OGViIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3Fjb21fbmFuZGMuYwo+IEBAIC0zMzIyLDcgKzMzMjIsNyBAQCBzdGF0aWMgaW50IHFjb21fbmFu
ZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgZXJyX2Fvbl9jbGs6Cj4g
IAljbGtfZGlzYWJsZV91bnByZXBhcmUobmFuZGMtPmNvcmVfY2xrKTsKPiAgZXJyX2NvcmVfY2xr
Ogo+IC0JZG1hX3VubWFwX3Jlc291cmNlKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShy
ZXMpLAo+ICsJZG1hX3VubWFwX3Jlc291cmNlKGRldiwgbmFuZGMtPmJhc2VfZG1hLCByZXNvdXJj
ZV9zaXplKHJlcyksCj4gIAkJCSAgIERNQV9CSURJUkVDVElPTkFMLCAwKTsKPiAgCWRldl9lcnIo
JnBkZXYtPmRldiwgIkRFQlVHOiBwcm9iZSBmYWlsZWQgZm9yIG5hbmRjIG1vZHVsZVxuIik7CgpU
aGlzIGVycm9yIGluZGljYXRlcyB0aGF0IHlvdSBhcmUgc2VuZGluZyB0aGUgcGF0Y2ggYWdhaW5z
dCBkb3duc3RyZWFtIHRyZWUuClRoYXQncyBub3QgYXBwcm9wcmlhdGUuIFBsZWFzZSBzZW5kIHlv
dXIgcGF0Y2hlcyBhZ2FpbnN0IG1haW5saW5lL210ZC1uZXh0Cmluc3RlYWQgYW5kIGFsc28gdmFs
aWRhdGUgcHJvcGVybHkuCgotIE1hbmkKCj4gIAlyZXR1cm4gcmV0Owo+IC0tIAo+IDIuMTcuMQo+
IAoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7g
r40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
