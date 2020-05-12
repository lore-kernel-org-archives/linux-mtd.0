Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C92C54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:12:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDBC12075E
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IrjPyfJP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6oC0ck1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDBC12075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHRhWHdh9ucmGI971paDvDYisAkcZx0ii3Ir7qtmBLM=; b=IrjPyfJPlOVb9Z
	B8VKOKwY4LxJbeuX//ja1U8vyMT2UWxKNVE3O2vhZ0gzGpdpceixi7TXOuBkwuHlvXwQPaO9byBRe
	gOYiqyWbasI50xyO3plIr6Cw3BBKu3FJ4FA8VJUFsjOQI2yK/9hLcjETJn12ru3tbb1lAB82uopUs
	5laTXlAE6fu/JcxxWu2QiyPVRdTCqgg5/xGkSnwKUtwyvHHamquDMFa7e+/0O6oycEgCkLDZWSY6j
	aHh7+iggmiz0psb+RSwsANyqHDPUo23c6cAUwxD9H093bzsS4ShgdTeePHJPNigKEgIqhrt1uWm2r
	t1NXbbbvDwbHBnz0XFLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYP5O-0007Hw-Pl; Tue, 12 May 2020 07:12:18 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYP5M-0007HG-K1
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 07:12:18 +0000
Received: by mail-wm1-x342.google.com with SMTP id e26so20501945wmk.5
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 00:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Pno9i7+IGC6ncAgSbnR2o7fvAJ+JWlp/1VRSmEok2Yw=;
 b=L6oC0ck1GXRkFvQwjkjuyakZ7R2BTTCSR0WyvgfJyjinrndC3FkuHzhxBBS7sEkB38
 d7g+D9wM6VAZ37CcRBBO17HSRHmx38VtG4xG4TXYxdNait6v39e6s2OasB4ClOMYsENZ
 CzKiF8/tQOHmApnCN9GLN3ZdncmL5EokgvhlGy/HLF6Sy2uJmprEsDFI4n5CjSBUPBn1
 sV2WCOjIMeohEnYlkJTf/ys6cw8rsWoZcyyazOftC/uSFkE7revwbFfJybwILjFDBbnM
 Vc25WUF5ie10c7ZK8mTVsfQhf1uiN2BNUJoH9bE5qq++9FT9LPYenwyw8kGwR7D/t0u6
 ccEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Pno9i7+IGC6ncAgSbnR2o7fvAJ+JWlp/1VRSmEok2Yw=;
 b=RDrGPI0g0PZ0V0f9tJc3U0KE/yU4ybAytjJx8U3zrnCXiLP0shckZMp/ileGr1Lbbx
 Xh9W4LRgn86Zd7EDxoifFaYekRLrGBDbJDpBzka/Fy+36hTF6UWU+i6OEgqBbU+7YhZ8
 4Mxxnu4XLtzqSbRJXKqJmQJpWP4tZntrsUzAmqCsu5tLEeBYnAszaa9eSlwVztILiXeL
 IygE/EV0h9eEkm22dcatI3wh27TsqsDhyP3S8/e3uai8aUKcwQoP5FBNleuv9/nGZiqB
 nxzQOX0LkJobPZ5LJ8lbBJXeYY2nZol3VcsYYa0+gbvp1vUr15tbsA5VehPpejkOwN/S
 O9+Q==
X-Gm-Message-State: AGi0PuaBAuyDoJn4DILKkayX+ZXtLdxgShwT6uKsUNflrglTiyY5KFPM
 dRoZmcwc+6P9uUotTAxt/vk=
X-Google-Smtp-Source: APiQypKqL2rnVh8By9cXsbO/XdQ3RA0DE9rNJHbugYnnyv953wCCWk7UPhM+SjiWIRiHq+kRn9EGhA==
X-Received: by 2002:a1c:9c0a:: with SMTP id f10mr35725886wme.139.1589267535101; 
 Tue, 12 May 2020 00:12:15 -0700 (PDT)
Received: from macbook-pro-alvaro.lan
 (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id a133sm7978655wme.43.2020.05.12.00.12.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:12:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200512090844.21bcaf22@xps13>
Date: Tue, 12 May 2020 09:12:10 +0200
Message-Id: <5377BB9D-35EB-4531-8E03-A7483D3134E4@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
 <20200512060023.684871-3-noltari@gmail.com> <20200512090844.21bcaf22@xps13>
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_001216_682010_4919B3AF 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: vigneshr@ti.com, kdasu.kdev@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKSSBhbHNvIGhhZCBhIGhhcmQgdGltZSB1bmRlcnN0YW5kaW5nIHlvdXIgZW1h
aWwuCkl0IHdhcyBxdWl0ZSBtaXNsZWFkaW5nLgoKPiBFbCAxMiBtYXkgMjAyMCwgYSBsYXMgOTow
OCwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gZXNjcmliacOzOgo+
IAo+IEhpIMOBbHZhcm8sCj4gCj4gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdt
YWlsLmNvbT4gd3JvdGUgb24gVHVlLCAxMiBNYXkgMjAyMAo+IDA4OjAwOjIzICswMjAwOgo+IAo+
PiBUaGUgY3VycmVudCBjb2RlIGdlbmVyYXRlcyA4IG9vYiBzZWN0aW9uczoKPj4gUzEJMS01Cj4+
IEVDQwk2LTgKPj4gUzIJOS0xNQo+PiBTMwkxNi0yMQo+PiBFQ0MJMjItMjQKPj4gUzQJMjUtMzEK
Pj4gUzUJMzItMzcKPj4gRUNDCTM4LTQwCj4+IFM2CTQxLTQ3Cj4+IFM3CTQ4LTUzCj4+IEVDQwk1
NC01Ngo+PiBTOAk1Ny02Mwo+PiAKPj4gQ2hhbmdlIGl0IGJ5IG1lcmdpbmcgY29udGludW91cyBz
ZWN0aW9uczoKPj4gUzEJMS01Cj4+IEVDQwk2LTgKPj4gUzIJOS0yMQo+PiBFQ0MJMjItMjQKPj4g
UzMJMjUtMzcKPj4gRUNDCTM4LTQwCj4+IFM0CTQxLTUzCj4+IEVDQwk1NC01Ngo+PiBTNQk1Ny02
Mwo+PiAKPj4gRml4ZXM6IGVmNWVlZWE2ZTkxMSAoIm10ZDogbmFuZDogYnJjbTogc3dpdGNoIHRv
IG10ZF9vb2JsYXlvdXRfb3BzIikKPiAKPiBTb3JyeSBmb3IgbGVhZGluZyB5b3UgdGhlIHdyb25n
IHdheSwgYWN0dWFsbHkgdGhpcyBwYXRjaCBkb2VzIG5vdAo+IGRlc2VydmUgYSBGaXhlcyB0YWcu
CgpEbyBJIG5lZWQgdG8gcmVzZW5kIHRoaXMgYWdhaW4/Ckxvb2tzIGxpa2Ugbm8gbWF0dGVyIHdo
YXQgSSBkbyBpdOKAmXMgYWx3YXlzIHdyb25nLi4uCgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiDDgWx2
YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+PiAtLS0KPj4gdjM6IGlu
dmVydCBwYXRjaCBvcmRlcgo+PiB2Mjoga2VlcCBvcmlnaW5hbCBjb21tZW50IGFuZCBmaXggY29y
cmVjdGx5IHNraXAgYnl0ZSA2IGZvciBzbWFsbC1wYWdlIG5hbmQKPj4gCj4+IGRyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAzNyArKysrKysrKysrKystLS0tLS0tLS0t
LS0KPj4gMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+
PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4+IGluZGV4IDFj
MTA3MDExMWViYy4uMGExZDc2ZmRlMzdiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2JyY21uYW5kLmMKPj4gQEAgLTExMDAsMzMgKzExMDAsMzIgQEAgc3RhdGljIGludCBi
cmNtbmFuZF9oYW1taW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQg
c2VjdGlvbiwKPj4gCXN0cnVjdCBicmNtbmFuZF9jZmcgKmNmZyA9ICZob3N0LT5od2NmZzsKPj4g
CWludCBzYXMgPSBjZmctPnNwYXJlX2FyZWFfc2l6ZSA8PCBjZmctPnNlY3Rvcl9zaXplXzFrOwo+
PiAJaW50IHNlY3RvcnMgPSBjZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jfc2l6
ZV8xayk7Cj4+ICsJdTMyIG5leHQ7Cj4+IAo+PiAtCWlmIChzZWN0aW9uID49IHNlY3RvcnMgKiAy
KQo+PiArCWlmIChzZWN0aW9uID4gc2VjdG9ycykKPj4gCQlyZXR1cm4gLUVSQU5HRTsKPj4gCj4+
IC0Jb29icmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAvIDIpICogc2FzOwo+PiArCW5leHQgPSAo
c2VjdGlvbiAqIHNhcyk7Cj4+ICsJaWYgKHNlY3Rpb24gPCBzZWN0b3JzKQo+PiArCQluZXh0ICs9
IDY7Cj4+IAo+PiAtCWlmIChzZWN0aW9uICYgMSkgewo+PiAtCQlvb2JyZWdpb24tPm9mZnNldCAr
PSA5Owo+PiAtCQlvb2JyZWdpb24tPmxlbmd0aCA9IDc7Cj4+ICsJaWYgKHNlY3Rpb24pIHsKPj4g
KwkJb29icmVnaW9uLT5vZmZzZXQgPSAoKHNlY3Rpb24gLSAxKSAqIHNhcykgKyA5Owo+PiAJfSBl
bHNlIHsKPj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA2Owo+PiAtCj4+IC0JCS8qIEZpcnN0IHNl
Y3RvciBvZiBlYWNoIHBhZ2UgbWF5IGhhdmUgQkJJICovCj4+IC0JCWlmICghc2VjdGlvbikgewo+
PiAtCQkJLyoKPj4gLQkJCSAqIFNtYWxsLXBhZ2UgTkFORCB1c2UgYnl0ZSA2IGZvciBCQkkgd2hp
bGUgbGFyZ2UtcGFnZQo+PiAtCQkJICogTkFORCB1c2UgYnl0ZXMgMCBhbmQgMS4KPj4gLQkJCSAq
Lwo+PiAtCQkJaWYgKGNmZy0+cGFnZV9zaXplID4gNTEyKSB7Cj4+IC0JCQkJb29icmVnaW9uLT5v
ZmZzZXQgKz0gMjsKPj4gLQkJCQlvb2JyZWdpb24tPmxlbmd0aCAtPSAyOwo+PiAtCQkJfSBlbHNl
IHsKPj4gLQkJCQlvb2JyZWdpb24tPmxlbmd0aC0tOwo+PiAtCQkJfQo+PiArCQkvKgo+PiArCQkg
KiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPj4g
KwkJICogTkFORCB1c2UgYnl0ZXMgMCBhbmQgMS4KPj4gKwkJICovCj4+ICsJCWlmIChjZmctPnBh
Z2Vfc2l6ZSA+IDUxMikgewo+PiArCQkJb29icmVnaW9uLT5vZmZzZXQgPSAyOwo+PiArCQl9IGVs
c2Ugewo+PiArCQkJb29icmVnaW9uLT5vZmZzZXQgPSAwOwo+PiArCQkJbmV4dC0tOwo+IAo+IFRo
aXMgbmV4dC0tIHNlZW1zIHZlcnkgc3RyYW5nZSwgY2FuIHlvdSBleHBsYWluPwoKSW4gdGhpcyBj
YXNlIG5leHQgd2lsbCBiZSA2ICh3aGljaCBpcyB0aGUgZmlyc3QgRUNDIGJ5dGUpLgpIb3dldmVy
LCBmb3Igc21hbGwgcGFnZSBOQU5EcyBieXRlIDUgaXMgcmVzZXJ2ZWQgZm9yIEJCVCwgc28gd2Ug
d2FudCBuZXh0IHRvIGJlIDUgb25seSBpbiB0aGlzIGNhc2UuCgo+IAo+PiAJCX0KPj4gCX0KPj4g
Cj4+ICsJb29icmVnaW9uLT5sZW5ndGggPSBuZXh0IC0gb29icmVnaW9uLT5vZmZzZXQ7Cj4+ICsK
Pj4gCXJldHVybiAwOwo+PiB9Cj4+IAo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpSZWdhcmRz
LArDgWx2YXJvLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
