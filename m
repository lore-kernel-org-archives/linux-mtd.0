Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263DFC61DCB
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Feb 2026 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqS9EeHUjflH0YOEhi5adwetbo/xPVtg4+KdkJ4iT8Q=; b=FN1qfHua8cjlH0
	VYeiNot/B7gp6kGC0uuaxNo4m7+VuMFWMCuAuCBIn5hDLXf68eCawM4W6IC3Y8vS+d4SDXMTPpRQN
	5svJQX5qwfO1JfD4sYLowke3n4Su3yC2aFjiV9flW4LsGtkWUWg60KyJUyPM0v68t7rhw3+mtJHcW
	BDjqc5n36DEGF3rO5guj14iaLJn0wIy4lA+at3iLpEUaQ1BNgTXWEJoxxCHimNrwkBASiOJJCVLuv
	K/KZvAU3lSIBoGpYRm4Fx+ulMTBTHwEbBqVo2hOzl/KQ08BE2KKLo5h731W1p/jFqe2MZ1VFnasrf
	OOT7z32Fof8JZDlGnWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT9-0000000FwgD-2hVG;
	Sat, 21 Feb 2026 09:40:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT6-0000000Fwdx-47IS
	for linux-mtd@lists.infradead.org;
	Sat, 21 Feb 2026 09:40:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48371bb515eso36562285e9.1
        for <linux-mtd@lists.infradead.org>; Sat, 21 Feb 2026 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666807; x=1772271607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OTrcGA+pe/I4LHNfKbWhQqpu2uqCStywvB3RV+xvsk=;
        b=l8/IxdnHTwaAjwFnDewrf/Tg7p1Z4CubhW8CKDuxocuFQw6ZPcBnLqLUNwT2NJIO7I
         m+hlhd5reqAOAq2ZHQFrWgigQKU/iXJfA7JsX5UqENPpE3KYzYtXpwpjMv++gfd30BmQ
         sS7zLl5krvFjAYTmfOmKuLh3rNTcdgUNVgbPNrQZLZLE6BzwSxoqF4R58VLT1keFy5oW
         jQ0IGffS92NKgRg/uLyaFL6U77uAyYFdXNljcRle9yKD8WaD/dTvwBZoZQ0h9ODS7ejB
         0C11V/UVsKKgExotKwKXnFpA/fPoZAB98vtHioeSwkfmoTD8FxjwMOJGhux+85NOHVYo
         jX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666807; x=1772271607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6OTrcGA+pe/I4LHNfKbWhQqpu2uqCStywvB3RV+xvsk=;
        b=C/5CVMxdB0mopNNHNqrc9WkozDR7E1IWYy6ysVldcYlUDwqxsSUMIL1rBYte3pOuLr
         8uwJ5w6RyYV4QEsTY6NJvVXSU2RGcg8Bku0SfbKtSTjNgMxP081Je/nAaME8Vv0pU6BW
         ivZaU6n2d3g+u7q8aBxYZKNLPENrIEMihHm5jeVrKCYQeWf7mELC1PbBcW8faJsIJ47w
         8I9a+q19tDss9cpjdT199tjVb/+asbDzAZy3Acdpm5vV/78/iNAKyU+OH6gugjbURW+y
         ZsRbOaAWXtx5yFikyOYKY5e1d1+dPVSFSYmavzTHrvRozHsokll5euFM7AuiuD53IgaB
         +sLA==
X-Forwarded-Encrypted: i=1; AJvYcCVjVjVmfDr7geUgZzDMQd+us7RXiZcYvSn71CUVxFxEjHhdJU8+Uw7zzHKs3JhLfVUHifdBesAY8OQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlx1F4TPNVlSQi41Q3EDmTOP2DPVKb5wxzx1l/mXFSJprkV07Y
	M5oCz9fWOh7gvW3eU3EkIfPTfCt4xFkFkeZpW385yaZQ2BzGplcHNQbC
X-Gm-Gg: AZuq6aIBbs0eCnio5jwnLMm1WLJ22xxCnUtkmsFh79Hg7TRlL34TMJROuJiKYXcyzDM
	pH+0JD6udoR9yf1EyO0FaUSVN1ArzHvxJuCfKlmHm/HK5Wof8IPgApxIdMPJqr4sRIL+i8key49
	U0AlywxHXdRdkccU0UlEPJOyPK28rhDXoharDZmLJ5nxlLBQJS2KX/arCpxbL+lIPlNg/YR1XX6
	0EhnBbPDePEB7bherR2BruufV0CCEGFjXj7ho4cv9QyDTPxKZWlDhDY6MafXrO8bOIOUJPKbOU4
	i/POeeR0rEfa9kfcanrXmerzwV3x17Wn5eFAEuuznV0Vydbklimm9O9XJNgGCLFzsTYGyttSKOs
	sFe8HucmBdavO9rYpp0WMBv/AO6WWSHow2AqBN8kS/eDfJMl3UHpq4/jxx5onOob+2AF5M643K6
	g4+MYLe2tA6aAE87I3HqmmH9y2yC6ehVi7X8l10czNAhCaxAftgkdAn+6dKBkEHsDNotn/EaBCR
	xxLLduS
X-Received: by 2002:a05:600c:5020:b0:47e:e2ec:995b with SMTP id 5b1f17b1804b1-483a95fb29cmr44815955e9.9.1771666806876;
        Sat, 21 Feb 2026 01:40:06 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31efe02sm135100995e9.10.2026.02.21.01.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:06 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
Date: Sat, 21 Feb 2026 10:21:55 +0100
Message-ID: <1947198.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20260220161011.999642-4-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-4-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_014009_044356_D5A4DCD4 
X-CRM114-Status: GOOD (  25.12  )
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

RG5lIHBldGVrLCAyMC4gZmVicnVhciAyMDI2IG9iIDE3OjEwOjA4IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBCQk0gaXMgcGFy
dCBvZiBVU0VSX0RBVEEgc2VjdGlvbiwgc28gd2Ugc2hvdWxkIHJlbW92ZSBpdCB0d2ljZQo+IAo+
IFRoaXMgd2FzIHdvcmtpbmcgb2sgYmVjYXVzZSB3ZSBhcmUgb24gdGhlIHNhZmUgc2l6ZSwgYWR2
ZXJ0aXNpbmcgdGhhdAo+IHRoZXJlIHdhcyAyIGJ5dGVzIGxlc3MgYXZhaWxhYmxlIHRoYW4gcmVh
bGl0eS4KCk1pc3NpbmcgImluIiBiZWZvcmUgInJlYWxpdHkiLgoKPiAKPiBCdXQgd2UgY2FuJ3Qg
Y2hhbmdlIG9sZCBwbGF0Zm9ybXMsIHNpbmNlIGl0IG1heSBsZWFkIHRvIGEgZGlmZmVyZW50IEVD
Qwo+IHN0cmVuZ3RoLCBzbywgaW50cm9kdWNlIGEgbGVnYWN5IGZsYWcgZm9yIG9sZCBwbGF0Zm9y
bXMsIGFuZCBzd2l0Y2ggdGhlCj4gbmV3IHBsYXRmb3JtcyB0byB0aGUgY29ycmVjdCBjb3VudC4K
ClRoZXJlIGFyZW4ndCBhbnkgdXNlcnMgb2YgSDYvSDYxNiBkcml2ZXIsIHJpZ2h0PyBJZiBpdCB3
b3VsZCBiZSwgRUNDIHN0cmVuZ3RoCmNhbid0IGJlIGNoYW5nZWQsIHNpbmNlIGl0IGNhbiBpbXBh
Y3Qgc3lzdGVtcywgd2hpY2ggYWxyZWFkeSB1c2UgaXQuCgpCZXN0IHJlZ2FyZHMsCkplcm5lagoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdlbm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxp
bi5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDIzICsr
KysrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9z
dW54aV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiBpbmRleCA5
YzZlMDYyNWUzNGYuLjk5ZDMwNWJiZGE1MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdW54aV9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5k
LmMKPiBAQCAtMjgxLDYgKzI4MSw4IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHN1bnhpX25hbmRf
Y2hpcCAqdG9fc3VueGlfbmFuZChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+ICAgKiBAaGFzX2Vj
Y19ibG9ja181MTI6CUlmIHRoZSBFQ0MgY2FuIGhhbmRsZSA1MTJCIG9yIG9ubHkgMTAyNEIgY2h1
bmNrcwo+ICAgKiBAaGFzX2VjY19jbGs6CUlmIHRoZSBjb250cm9sbGVyIG5lZWRzIGFuIEVDQyBj
bG9jay4KPiAgICogQGhhc19tYnVzX2NsazoJSWYgdGhlIGNvbnRyb2xsZXIgbmVlZHMgYSBtYnVz
IGNsb2NrLgo+ICsgKiBAbGVnYWN5X21heF9zdHJlbmd0aDpJZiB0aGUgbWF4aW1pemUgc3RyZW5n
dGggZnVuY3Rpb24gd2FzIG9mZiBieSAyIGJ5dGVzCj4gKyAqCQkJTkI6IHRoaXMgc2hvdWxkIG5v
dCBiZSB1c2VkIGluIG5ldyBjb250cm9sbGVycwo+ICAgKiBAcmVnX2lvX2RhdGE6CUkvTyBkYXRh
IHJlZ2lzdGVyCj4gICAqIEByZWdfZWNjX2Vycl9jbnQ6CUVDQyBlcnJvciBjb3VudGVyIHJlZ2lz
dGVyCj4gICAqIEByZWdfdXNlcl9kYXRhOglVc2VyIGRhdGEgcmVnaXN0ZXIKPiBAQCAtMzEwLDYg
KzMxMiw3IEBAIHN0cnVjdCBzdW54aV9uZmNfY2FwcyB7Cj4gIAlib29sIGhhc19lY2NfYmxvY2tf
NTEyOwo+ICAJYm9vbCBoYXNfZWNjX2NsazsKPiAgCWJvb2wgaGFzX21idXNfY2xrOwo+ICsJYm9v
bCBsZWdhY3lfbWF4X3N0cmVuZ3RoOwo+ICAJdW5zaWduZWQgaW50IHJlZ19pb19kYXRhOwo+ICAJ
dW5zaWduZWQgaW50IHJlZ19lY2NfZXJyX2NudDsKPiAgCXVuc2lnbmVkIGludCByZWdfdXNlcl9k
YXRhOwo+IEBAIC0xODExLDEwICsxODE0LDIyIEBAIHN0YXRpYyBpbnQgc3VueGlfbmFuZF9od19l
Y2NfY3RybF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4gIAkJZWNjLT5zaXplID0gMTAy
NDsKPiAgCQluc2VjdG9ycyA9IG10ZC0+d3JpdGVzaXplIC8gZWNjLT5zaXplOwo+ICAKPiAtCQkv
KiBSZXNlcnZlIDIgYnl0ZXMgZm9yIHRoZSBCQk0gKi8KPiAtCQlieXRlcyA9IChtdGQtPm9vYnNp
emUgLSAyKSAvIG5zZWN0b3JzOwo+ICsJCS8qCj4gKwkJICogVGhlIDIgQkJNIGJ5dGVzIHNob3Vs
ZCBub3QgYmUgcmVtb3ZlZCBmcm9tIHRoZSBncmFuZCB0b3RhbCwKPiArCQkgKiBiZWNhdXNlIHRo
ZXkgYXJlIHBhcnQgb2YgdGhlIFVTRVJfREFUQV9TWi4KPiArCQkgKiBCdXQgd2UgY2FuJ3QgbW9k
aWZ5IHRoYXQgZm9yIG9sZGVyIHBsYXRmb3JtIHNpbmNlIGl0IG1heQo+ICsJCSAqIHJlc3VsdCBp
biBhIHN0cm9uZ2VyIEVDQyBhdCB0aGUgZW5kLCBhbmQgYnJlYWsgdGhlCj4gKwkJICogY29tcGF0
aWJpbGl0eS4KPiArCQkgKi8KPiArCQlpZiAobmZjLT5jYXBzLT5sZWdhY3lfbWF4X3N0cmVuZ3Ro
KQo+ICsJCQlieXRlcyA9IChtdGQtPm9vYnNpemUgLSAyKSAvIG5zZWN0b3JzOwo+ICsJCWVsc2UK
PiArCQkJYnl0ZXMgPSBtdGQtPm9vYnNpemUgLyBuc2VjdG9yczsKPiAgCj4gLQkJLyogNCBub24t
RUNDIGJ5dGVzIGFyZSBhZGRlZCBiZWZvcmUgZWFjaCBFQ0MgYnl0ZXMgc2VjdGlvbiAqLwo+ICsJ
CS8qCj4gKwkJICogVVNFUl9EQVRBX1NaIG5vbi1FQ0MgYnl0ZXMgYXJlIGFkZGVkIGJlZm9yZSBl
YWNoIEVDQyBieXRlcwo+ICsJCSAqIHNlY3Rpb24sIHRoZXkgY29udGFpbiB0aGUgMiBCQk0gYnl0
ZXMKPiArCQkgKi8KPiAgCQlieXRlcyAtPSBVU0VSX0RBVEFfU1o7Cj4gIAo+ICAJCS8qIGFuZCBi
eXRlcyBoYXMgdG8gYmUgZXZlbi4gKi8KPiBAQCAtMjM3OSw2ICsyMzk0LDcgQEAgc3RhdGljIGNv
bnN0IHU4IHN1bnhpX3VzZXJfZGF0YV9sZW5faDZbXSA9IHsKPiAgCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc3VueGlfbmZjX2NhcHMgc3VueGlfbmZjX2ExMF9jYXBzID0gewo+ICAJLmhhc19lY2Nf
YmxvY2tfNTEyID0gdHJ1ZSwKPiArCS5sZWdhY3lfbWF4X3N0cmVuZ3RoID0gdHJ1ZSwKPiAgCS5y
ZWdfaW9fZGF0YSA9IE5GQ19SRUdfQTEwX0lPX0RBVEEsCj4gIAkucmVnX2VjY19lcnJfY250ID0g
TkZDX1JFR19BMTBfRUNDX0VSUl9DTlQsCj4gIAkucmVnX3VzZXJfZGF0YSA9IE5GQ19SRUdfQTEw
X1VTRVJfREFUQSwKPiBAQCAtMjQwMCw2ICsyNDE2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBz
dW54aV9uZmNfY2FwcyBzdW54aV9uZmNfYTEwX2NhcHMgPSB7Cj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc3VueGlfbmZjX2NhcHMgc3VueGlfbmZjX2EyM19jYXBzID0gewo+ICAJLmhhc19tZG1hID0g
dHJ1ZSwKPiAgCS5oYXNfZWNjX2Jsb2NrXzUxMiA9IHRydWUsCj4gKwkubGVnYWN5X21heF9zdHJl
bmd0aCA9IHRydWUsCj4gIAkucmVnX2lvX2RhdGEgPSBORkNfUkVHX0EyM19JT19EQVRBLAo+ICAJ
LnJlZ19lY2NfZXJyX2NudCA9IE5GQ19SRUdfQTEwX0VDQ19FUlJfQ05ULAo+ICAJLnJlZ191c2Vy
X2RhdGEgPSBORkNfUkVHX0ExMF9VU0VSX0RBVEEsCj4gCgoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
