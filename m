Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E2CC76196
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Apr 2023 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PMfVg26qwnzybQj+4qqJNjY6whSfEWS0UMMRgqivgo=; b=w9oyVTJmjsTmIp
	qOgyCS+wrpyJOa8O1J8pVeXIwunKZknPcQda98ykEHwuYJK1awbRPnnWOC48dpufMWKfyxmmpEAeG
	Dam4+7yigc+jVWzvLBFKbEFh6UQEKTBki/ojRr2k/dmd5PEFdMkRRJYbMWFbRXCmM5MTN+ZzTKAO5
	/j7+LWgGKIMa7osTX3V6vqbMqVIYkWV9JnNG8BXMsW0E5fgzp/d1Ih7EbBrRuIoTFGwfysViJr6k/
	KgK2eACgqCKpIFEyqqWUPi5Y3QP42BSzU+p91uLPjqam4YL2vBOSi5C/21hIW50cH7uqCM4xAsPCj
	LA58mCQY3/AJsXhqfdUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEGA-0008no-2n;
	Tue, 11 Apr 2023 13:42:10 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEG7-0008mR-10
	for linux-mtd@lists.infradead.org;
	Tue, 11 Apr 2023 13:42:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1DC8220018;
	Tue, 11 Apr 2023 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681220517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X7KgLgdH7cjz5drRb45WItsgeAVPeS+LVOF20gs6vrY=;
	b=bcJvA/OeOjZij8rqCIpNuk5SC2T/doK0e3fzWVx8ulahJBd9TLgybmVIdfBSNkoNZk2QwZ
	MwZtsGcaTN023bHSRm84f8Oo5Xssvbfu/v6eQYzoBOcTEOTvZcFkAPr1iwrJVV8g9mgHf2
	o/ObrhGsdveVjBAI+nU0jg3JVS64eUJ9tHCXtupLZdSE1ihj/EcJ++sSWiwucbWBI2IC3c
	W4Wzr4osoVD+9n0BlwT+awExRdz1dVXY+7vKyXUWBUHi0yn3XmR4SAkvQYnMPgnqxKw+Ja
	SxcSC4t3V2UVQkuCg6M5WyeZ89vcHtc2aWPrTzcQ7WE0Az5VYA0ZsIuID0toNg==
Date: Tue, 11 Apr 2023 15:41:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Kyungmin Park
 <kyungmin.park@samsung.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH RESEND] mtd: onenand: omap2: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <20230411154155.7416fd2d@xps-13>
In-Reply-To: <20230407190453.66efdf9d@endymion.delvare>
References: <20230407190453.66efdf9d@endymion.delvare>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_064207_637724_985BB787 
X-CRM114-Status: GOOD (  22.88  )
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

SGkgSmVhbiwKCmpkZWx2YXJlQHN1c2UuZGUgd3JvdGUgb24gRnJpLCA3IEFwciAyMDIzIDE5OjA0
OjUzICswMjAwOgoKPiBTaW5jZSBjb21taXQgMDE2NmRjMTFiZTkxICgib2Y6IG1ha2UgQ09ORklH
X09GIHVzZXIgc2VsZWN0YWJsZSIpLCBpdAo+IGlzIHBvc3NpYmxlIHRvIHRlc3QtYnVpbGQgYW55
IGRyaXZlciB3aGljaCBkZXBlbmRzIG9uIE9GIG9uIGFueQo+IGFyY2hpdGVjdHVyZSBieSBleHBs
aWNpdGx5IHNlbGVjdGluZyBPRi4gVGhlcmVmb3JlIGRlcGVuZGluZyBvbgo+IENPTVBJTEVfVEVT
VCBhcyBhbiBhbHRlcm5hdGl2ZSBpcyBubyBsb25nZXIgbmVlZGVkLgo+IAo+IEl0IGlzIGFjdHVh
bGx5IGJldHRlciB0byBhbHdheXMgYnVpbGQgc3VjaCBkcml2ZXJzIHdpdGggT0YgZW5hYmxlZCwK
PiBzbyB0aGF0IHRoZSB0ZXN0IGJ1aWxkcyBhcmUgY2xvc2VyIHRvIGhvdyBlYWNoIGRyaXZlciB3
aWxsIGFjdHVhbGx5IGJlCj4gYnVpbHQgb24gaXRzIGludGVuZGVkIHRhcmdldC4gQnVpbGRpbmcg
dGhlbSB3aXRob3V0IE9GIG1heSBub3QgdGVzdAo+IG11Y2ggYXMgdGhlIGNvbXBpbGVyIHdpbGwg
b3B0aW1pemUgb3V0IHBvdGVudGlhbGx5IGxhcmdlIHBhcnRzIG9mIHRoZQo+IGNvZGUuIEluIHRo
ZSB3b3JzdCBjYXNlLCB0aGlzIGNvdWxkIGV2ZW4gcG9wIGZhbHNlIHBvc2l0aXZlIHdhcm5pbmdz
Lgo+IERyb3BwaW5nIENPTVBJTEVfVEVTVCBoZXJlIGltcHJvdmVzIHRoZSBxdWFsaXR5IG9mIG91
ciB0ZXN0aW5nIGFuZAo+IGF2b2lkcyB3YXN0aW5nIHRpbWUgb24gbm9uLWV4aXN0ZW50IGlzc3Vl
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuZGU+Cj4g
Q2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Cj4gQ2M6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJl
cmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hy
QHRpLmNvbT4KPiAtLS0KPiBFdmVuIHRob3VnaCB0aGlzIHdhcyBzdXBwb3NlZGx5IGFjY2VwdGVk
IGEgZmV3IG1vbnRocyBhZ28gYWxyZWFkeSwgSQo+IGNhbid0IGZpbmQgdGhpcyBjb21taXQsIG5l
aXRoZXIgdXBzdHJlYW0gbm9yIGluIHRoZSBuYW5kL25leHQsCj4gdGhlcmVmb3JlIHJlc2VuZGlu
Zy4KCkkgaGF2ZSBubyBpZGVhIHdoYXQgSSBkaWQgd3JvbmcgYnV0IEkgZGVmaW5pdGVseSBtZXNz
ZWQgdXAsIEkgY2FuJ3QKZmluZCB0aGlzIHBhdGNoIHdoaWxlIGl0IGlzIG1hcmtlZCBBY2NlcHRl
ZCBpbiBwYXRjaHdvcmsgYW5kIEkgYWN0dWFsbHkKYW5zd2VyZWQgdGhhdCBJIGFwcGxpZWQgaXQu
IEl0IGlzIGVzcGVjaWFsbHkgc3RyYW5nZSBzaW5jZSBpdHMKY291c2luIGFwcGx5aW5nIHRvIHJh
dyBOQU5EIHdhcyBjb3JyZWN0bHkgdGFrZW4uIFNvcnJ5IGZvciB0aGUgbWVzcywKSSdsbCByZWFs
bHkgdGFrZSBpdCB0aGlzIHRpbWUuCgo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvS2Nv
bmZpZyB8ICAgIDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gLS0tIGxpbnV4LTYuMi5vcmlnL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9L
Y29uZmlnCj4gKysrIGxpbnV4LTYuMi9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvS2NvbmZpZwo+
IEBAIC0yNSw3ICsyNSw3IEBAIGNvbmZpZyBNVERfT05FTkFORF9HRU5FUklDCj4gIGNvbmZpZyBN
VERfT05FTkFORF9PTUFQMgo+ICAJdHJpc3RhdGUgIk9uZU5BTkQgb24gT01BUDIvT01BUDMgc3Vw
cG9ydCIKPiAgCWRlcGVuZHMgb24gQVJDSF9PTUFQMiB8fCBBUkNIX09NQVAzIHx8IChDT01QSUxF
X1RFU1QgJiYgQVJNKQo+IC0JZGVwZW5kcyBvbiBPRiB8fCBDT01QSUxFX1RFU1QKPiArCWRlcGVu
ZHMgb24gT0YKPiAgCWRlcGVuZHMgb24gT01BUF9HUE1DCj4gIAloZWxwCj4gIAkgIFN1cHBvcnQg
Zm9yIGEgT25lTkFORCBmbGFzaCBkZXZpY2UgY29ubmVjdGVkIHRvIGFuIE9NQVAyL09NQVAzIFNv
Qwo+IAo+IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
