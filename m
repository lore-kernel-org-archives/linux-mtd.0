Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA27EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUsD58Foa9UBWHkuHEtQFJLQUCM4yJzi9Sz/iiyVJd0=; b=tSr2bwuJgkS/p1
	jQdbCAAffA2qjszO3YRNFSRzKwBsh8scy0WAd/8YHFU1MQQChnUe2TIO3uh/2I5XEfZomBrlYhM6Y
	Snr0308dbZxR51LiWTDMQC54021bzyO8xCB4MmwDjzHwN+fmruUjiYYI72gRIHwQGEdEA02mpBA7R
	vvtdFo+FLP9IE5aWKDXHipkvcqByrLSsDQtTXEZcg0tcUJaT+2WRffsdT9fPi/IMA8owXbWr0IBY6
	CA1yOBFDlcQBGak8WT/mHiB9cwg95k88TNOfxKWMqtwntuj7pDe8cnZT1C9ZNG4tviTcBXz/M7tEr
	Lkcy/YPVBnQb/tbsN/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJajX-000Bn7-1M;
	Wed, 12 Jul 2023 14:22:23 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJajT-000Blj-2w
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:22:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4370EC0004;
	Wed, 12 Jul 2023 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689171736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S9jnw+toN9EeY6OX+EqtUPKBA1qAOSWPjY0T6FQGzUo=;
	b=Sml7oRqc9FZlkoUmkEJGPnsbtSld3wIs8bdyNwNO3A/p6Zm7gkJBa7lHYIzKDTXSzcAARU
	ezXwOKvNUdJ2OsegmyMWUq5uQJp/8JNcPfa2C0a6EWyLPOgAqRZcoHLifgKaQKmP1kPTiR
	A8TcFoz8RlLmzNWYSZdy2odLYy3wOU9WAFZli+wv9NpuZlXnVQjg0Xtgn+Xc1gheECOSwq
	4lytmkfg1bNObDxe0OmV7z2koGH5cgQlQu+wvmetH5o9t8Gl7mTi2Zdug3fdTPVUGfheTq
	Om2IKD9N1Q2cyqygFCsCeQtmnVXY4SnXgF7nWDxctmesF5T+Lh/maatPyz5j8g==
Date: Wed, 12 Jul 2023 16:22:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>, linux-fsdevel
 <linux-fsdevel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-fsdevel@kvack.org, ezequiel@collabora.com, bjorn@mork.no
Subject: Re: MTD: Lots of mtdblock warnings on bootup logs
Message-ID: <20230712162213.79bc889c@xps-13>
In-Reply-To: <CAOuPNLizjBp_8ceKq=RLznXdsHD-+N55RoPh_D7_Mpkg7M-BwQ@mail.gmail.com>
References: <CAOuPNLizjBp_8ceKq=RLznXdsHD-+N55RoPh_D7_Mpkg7M-BwQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_072220_212131_BFAFAB3E 
X-CRM114-Status: GOOD (  20.57  )
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

SGkgUGludHUsCgpwaW50dS5waW5nQGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDEyIEp1bCAyMDIz
IDE5OjI5OjM5ICswNTMwOgoKPiBIaSwKPiAKPiBXZSBhcmUgZ2V0dGluZyBiZWxvdyB3YXJuaW5n
IG1lc3NhZ2VzIGluIGRtZXNnIGxvZ3Mgb24gYSBOQU5EIGRldmljZQo+IGZvciBldmVyeSByYXcg
cGFydGl0aW9uLgo+IEtlcm5lbDogNS4xNSA7IGFybTY0IDsgTkFORCArIHViaSArIHNxdWFzaGZz
Cj4gV2UgaGF2ZSBzb21lIFJBVyBwYXJ0aXRpb25zIGFuZCBvbmUgVUJJIHBhcnRpdGlvbiAod2l0
aCB1Ymlmcy9zcXVhc2hmcyB2b2x1bWVzKS4KPiAKPiBXZSBhcmUgc2VlaW5nIGxhcmdlIG51bWJl
cnMgb2YgdGhlc2UgbG9ncyBvbiB0aGUgc2VyaWFsIGNvbnNvbGUgdGhhdAo+IGltcGFjdCB0aGUg
Ym9vdCB0aW1lLgo+IFsuLi4uXQo+IFsgICAgOS42NjcyNDBdWyAgICBUOV0gQ3JlYXRpbmcgNTgg
TVREIHBhcnRpdGlvbnMgb24gIjFjOTgwMDAubmFuZCI6Cj4gWy4uLi5dCj4gWyAgIDM5Ljk3NTcw
N11bICBUNTE5XSBtdGRibG9jazogTVREIGRldmljZSAndWVmaV9hJyBpcyBOQU5ELCBwbGVhc2UK
PiBjb25zaWRlciB1c2luZyBVQkkgYmxvY2sgZGV2aWNlcyBpbnN0ZWFkLgo+IFsgICAzOS45NzU3
MDddWyAgVDUxOV0gbXRkYmxvY2s6IE1URCBkZXZpY2UgJ3VlZmlfYicgaXMgTkFORCwgcGxlYXNl
Cj4gY29uc2lkZXIgdXNpbmcgVUJJIGJsb2NrIGRldmljZXMgaW5zdGVhZC4KPiBbLi4uLl0KPiAK
PiBUaGlzIHdhcyBhZGRlZCBhcyBwYXJ0IG9mIHRoaXMgY29tbWl0Ogo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0
L2RyaXZlcnMvbXRkL210ZGJsb2NrLmM/aD12NS4xNS4xMjAmaWQ9ZjQxYzk0MThjNTg5OGMwMTYz
NDY3NTE1MDY5NmRhMjkwZmI4Njc5Ngo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0L2RyaXZlcnMvbXRkL210ZGJs
b2NrLmM/aD12NS4xNS4xMjAmaWQ9ZTA3NDAzYThjNmJlMDE4NTdmZjc1MDYwYjJkZjlhMWFhODMy
MGZlNQo+IAo+IEkgdGhpbmsgdGhpcyB3YXJuaW5nIHdhcyBkZWNpZGVkIGFmdGVyIG15IGxhc3Qg
eWVhcidzIGRpc2N1c3Npb24gYWJvdXQKPiBtdGRibG9jayB2cyB1YmlibG9jayBmb3Igc3F1YXNo
ZnMuCj4gCj4gQnV0IHRoZXNlIGFyZSByYXcgTkFORCBwYXJ0aXRpb25zIGFuZCBub3QgbW91bnRl
ZCBieSB1cy4KPiAKPiBXaGF0IGlzIHRoZSBleGFjdCBtZWFuaW5nIG9mIHRoZXNlIHdhcm5pbmdz
ID8KCm10ZGJsb2NrIGlzIGxlZ2FjeSwgdWJpYmxvY2sgaXMgYmV0dGVyIChvbiBOQU5EIGRldmlj
ZXMpLgoKPiBXZSBoYXZlIGJvdGggdGhlc2UgY29uZmlncyBlbmFibGVkOgo+IENPTkZJR19NVERf
QkxPQ0s9eQo+IENPTkZJR19NVERfVUJJX0JMT0NLPXkKPiAKPiBUaHJvdWdoIHRoaXMgd2Fybmlu
ZywgYXJlIHdlIHRlbGxpbmcgdGhhdCBvbmx5IG9uZSBvZiB0aGUgYWJvdmUgY29uZmlnCj4gc2hv
dWxkIGJlIGVuYWJsZWQgPwoKSWYgeW91IGRvbid0IG5lZWQgYm90aCwgdGhlbiB5ZXMuCgo+IEFu
ZCB0aGUgcmVjb21tZW5kYXRpb24gaXMgdG8gdXNlIHViaV9ibG9jayBhbmQgZGlzYWJsZSBtdGRf
YmxvY2sgPwoKWWVzLgoKPiBXZSBhcmUgYWxyZWFkeSB1c2luZyB1YmlibG9jayBmb3IgbW91bnRp
bmcgc3F1YXNoZnMgdm9sdW1lcy4KPiBCdXQgaG93IHRvIGdldCByaWQgb2YgdGhlc2Ugd2Fybmlu
Z3MgZm9yIHJhdyBOQU5EIHBhcnRpdGlvbnMgPwo+IAo+IElzIHRoZXJlIGEgd2F5IHRvIGF2b2lk
IG9yIHdlIGFyZSBtaXNzaW5nIHNvbWV0aGluZyB3aGljaCB3ZSBhcmUgbm90IGF3YXJlIG9mPwo+
IAoKSW4gdGhlb3J5IHRoZSB3YXJuaW5nIHNob3VsZCBvbmx5IGFwcGVhciBpZiB5b3Ugb3BlbiB0
aGUgZGV2aWNlIChJT1csCm9ubHkgaWYgeW91IHVzZSBpdCkuIEZvciB0aGlzIHRvIGhhcHBlbiwg
eW91IG5lZWQ6Cjk2YTMyOTVjMzUxZCAoIm10ZGJsb2NrOiB3YXJuIGlmIG9wZW5lZCBvbiBOQU5E
IikKVGhpcyBjb21taXQgd2FzIG1heWJlIG5vdCBiYWNrcG9ydGVkIHRvIHN0YWJsZSBrZXJuZWxz
LCB5b3UgY2FuIHNlbmQgaXQKdG8gc3RhYmxlQHZnZXIua2VybmVsLm9yZyBpbiBvcmRlciB0byBh
c2sgZm9yIHRoYXQuIEkgYWxzbyBzZWUgdGhhdCB0aGUKbXRkYmxvY2tfcm8gcGF0aCB3YXMgbm90
IGNvcnJlY3RlZCwgbWF5YmUgdGhhdCdzIGFsc28gYSBwcm9ibGVtIGluIHlvdXIKY2FzZT8gU2Ft
ZSwgeW91IGNhbiBhZGFwdCB0aGUgYWJvdmUgcGF0Y2ggYW5kIHNlbmQgaXQgdXBzdHJlYW0uCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
