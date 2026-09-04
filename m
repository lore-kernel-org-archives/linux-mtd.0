Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C83C79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 16:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SD3MznkD6yBcdTg1ums6pXEJqBdCWWrFJx6C6yTczhc=; b=JSaf8GjX/r3HcU
	AXZEcoo8XWf0gD9DhsIMwM1/xB6TYBkC/8WTY3HjnRlV82Gn2ZcHQmxcZZv0YuF4fVmHh1S9lHil7
	vdAu70smE8fPenMpzkpV0CWEyQTtExmce/eupK8qd3zTDUUk4pX1IzXZEep7OpRvl+Ii4CmHZq87S
	iPoj1QZAyLG4vePfW2LYL9niNel6NLv2wFLzVS/HCDru9bKiZmuMlsl3mkivRF9KKToLv/3ZlAOUW
	pnFXzQHpr4NG8LxmOTH5Pu/FCzejNy4ATFdtOswQzwk0H81XjqzLt31fhdUplBNXTsNUEcPcR19nJ
	eQ3p7iEtbmHX3oPCjHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XA1-00000002nrS-24nQ;
	Fri, 04 Sep 2026 16:53:05 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2X9x-00000002nqJ-3ovL
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 16:53:03 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-97cc72fe0f3so1542774241.1
        for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2026 09:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788540780; cv=none;
        d=google.com; s=arc-20260327;
        b=KbqmMeblhibcN+U8vbzNrScVckV5aCpU2uxhdRPwYDvMERo0OyIdDuv74GOBEj+bs6
         psVAMHCBQPXp7P47x+W/9mptqbfj9in5bGnqlEi7nZS2Hx17uj7YbbxJyU24Go2OBbDy
         RbMvaLdxFjyCpvrwpd0tvfovLNmTL13DHa2YFONKXCCOYsEW+iqmyjWRXuhEts9Y9zBm
         W8l+LWB7mTsCsf9Jq9Fqi6NBo+ImpZFrwMRTfhKFg+1DRALRihOZ4ubMpos8hAKWm+gg
         rSWORn/xTekiz+i/c7DxUQmuH8CL8Pa5ndWardUaZtGBhTM/UK98hDjkQtnZlbWbULO/
         0Ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        fh=hYYvU+tQZ2wJ1unEakhLgXtZS7z5FTjDLdCJt5Qrs3o=;
        b=FC4sIIJrpU7/Z6naqUG6k0INAFOR0azsGA3t7mHg8nKJTVdo08iDwYoq0k19F9dvFG
         fFCBlEQCCzS5rnlRsxTFrgq902ODkB/WPJrp0IHRn47fPOKzOZB3QQSqGi9+JiQfkTUZ
         MaxTCcclXioc0CSpjfVK07yxhjKujrvgew2Jwjt5+/qOtZ4CUg5b6ifn0PeG1CpUp604
         nVcZS7HCb/BfEQcKaNdBE006fiLV/IJiiONNxiv+8OxXGr15xmY8G5gbLDQNZ90hA9IN
         cik4jVm/khsSxtTQbw01v6NeEsMQOpz2+PGrXbefz+X+ksXTVumvdq4o05r3kC+cuTfB
         PKog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788540780; x=1789145580; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        b=spfIwYV5jt54i+wI3gH7r9S2tYaRwMVGhke+FQXWx5D0iWaCXUqBmMdm5zH0qpiE0d
         9ukYhY93qPMxgOzSrKlettpig50dFQ8n5wqUwQqQWf/9i+JK8394aHfcozOhhQwQ6vs6
         K1g591HTI0bfmn5ftsGnxZ3qKsDHDIojtKDP6ZfISsH5v0gTpyvBqG23PDfDUaVR2jf+
         JQfEQIT0llj0xtk/uRwCWZvpSHuGWIMGlKrAf4GHE63hMGioJfmjCz+Yk+YjDRK/UE0d
         TLjm30MWacZ10yd4RxiD5YIDZjGf+lokUk6zdbcOrf/pDZG8gkxC5U6uz4Pn9svla7Uq
         /1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540780; x=1789145580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        b=acoPku5HCdaeKCbgPNY+y+1V9TrdryJDEGrOKMaF1d4E2Kxo/D2RUoMVF2FtpUAuYU
         CR6QkbFHNyyrg3EF+uMcFtpy/oP+VXxsTHBP7KYmluln0Ui0MURh9Yv0c0vjqk28qsZw
         DVasBTRZoU7RMhsXmSDmUjEPdLaDwmXK5+tUhxSWHaIDnx2Vk58+nCh/8kqdXcHPwH9b
         pTOi5wW9JBRM1izwSBdvTt7M7RBUWK27jo28HiOQWS1y/rBxXSH4QLQk3qtG1Qpzfzco
         o5I8au55xuJf0AKkVOm1adz3U7kbHpoDn2NFEIa/03mFRz34civ/l10EZOPUmUwVAq5p
         GuTw==
X-Gm-Message-State: AFuF++mUUDQy6MHgTsfkPb22bAGB2sL/+dr9PGSpAs5H1I8OZbk01EhF
	dTkYD2atRflRN0uzY7HYDKxpH0oftdBH4twGiz+DwNhRzPVQSxRukUt0b/JHvl1rbAEK8ZbiVio
	CNJJ5mM3WaFkNAqiSkEF4rZ6zfF/l0hMOT4Ow
X-Gm-Gg: AYBFou2X5OokFPxd0gif+bBUYWql4rv34+TFpW6ysstmb5iEAIw0onqa7xdFhjEt/w1
	NV9brYFwoj8mHnT2FQuCpQyX2ENhosIqnkcW0KxDdHm1mKSzgTTpIudbjbbtFmfqhDYDn4Xtr/P
	1AdAnfTrTlo3cjep8xNY7/WGrExX1Pj541Wjl2AyTaypUVN0PJOc6tfmrhFJrVJ+ZupEDPX0Uxl
	ctfFTaSIKckoyMaAcM6WsFo/AZ+YEOKQesqbDY24p6Z4wzEem2SFflSc/shXltvXPmuD9NeGfy5
	ZohoZ+/PWE4I+ZCA7gO4W8nSARqSK3uC9yQX8y7nlFtbXWgnS6vGODrCrsTjWj+B2O2PP92ustz
	VIiERtEIV7+r7hvWrFDqenZIgtgGF5NwE7DHJN0O6eKid40eAaECQ9morXBrZGTxT/4UrjSERXL
	uOx58ZI3ywzBd+xYh+j3jE+mcO8zJA5Vopy+LobQ==
X-Received: by 2002:a05:6102:4b01:b0:786:a11e:484d with SMTP id
 ada2fe7eead31-78a4a86b686mr1500572137.6.1788540780511; Fri, 04 Sep 2026
 09:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260811060651.227431-1-james.hilliard1@gmail.com> <87ecf911jr.fsf@bootlin.com>
In-Reply-To: <87ecf911jr.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 12:52:49 -0400
X-Gm-Features: AcwNN1VzoX6Wx03j6h-GsWo7X9YwKmv-DqDt9ZWJFHiKu2jY-uxo82M8zbL9kdI
Message-ID: <CADvTj4p3kFN+4NeeouXscPrnHTWKbauVcYXnh2uW1OGHUL_sbQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: sunxi: reject invalid ECC step sizes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	stable@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Richard Genoud <richard.genoud@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_095301_961187_CE5FBB59 
X-CRM114-Status: GOOD (  26.15  )
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

T24gRnJpLCBTZXAgNCwgMjAyNiBhdCA5OjI14oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS8wOC8yMDI2IGF0IDAwOjA2OjQ4IC0w
NiwgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4g
PiBFQ0MgbWF4aW1pemF0aW9uIGZvcmNlcyBhIDEwMjQtYnl0ZSBFQ0Mgc3RlcCBhbmQgZGl2aWRl
cyB0aGUKPiA+IGF2YWlsYWJsZSBPT0IgYnl0ZXMgYnkgdGhlIG51bWJlciBvZiBzdGVwcy4gQSBO
QU5EIHdpdGggYSBzbWFsbGVyCj4gPiBwYWdlIHRoZXJlZm9yZSBwcm9kdWNlcyB6ZXJvIHN0ZXBz
IGFuZCBhIGRpdmlzaW9uIGJ5IHplcm8uCj4KPiBObywgc3RlcHMgY2Fubm90IGJlIDwgMS4gSWYg
dGhleSBhcmUsIGl0J3MgYSBidWcgdGhhdCBtdXN0IGJlIGZpeGVkLgoKVGhlIHplcm8gc3RlcCBj
b3VudCBpcyBjcmVhdGVkIGJ5IHRoZSBTdW54aSBtYXhpbWl6YXRpb24gcGF0aCBpdHNlbGYuCnN1
bnhpX25hbmRfaHdfZWNjX2N0cmxfaW5pdCgpIHVuY29uZGl0aW9uYWxseSBzZXRzIGVjYy0+c2l6
ZSB0byAxMDI0LAppbmNsdWRpbmcgZm9yIGEgNTEyLWJ5dGUtcGFnZSBOQU5ELCBiZWZvcmUgY2Fs
Y3VsYXRpbmcgbnNlY3RvcnMuCgpUaGUgY29udHJvbGxlciBhdHRhY2ggY2FsbGJhY2sgcnVucyBi
ZWZvcmUgbmFuZF9zY2FuX3RhaWwoKSwgc28gdGhpcwpkaXZpc2lvbiBoYXBwZW5zIGJlZm9yZSB0
aGUgZ2VuZXJpYyBFQ0MgaGFuZGxpbmcgY2FuIHJlamVjdCB0aGUKY29uZmlndXJhdGlvbiBvciBm
YWxsIGJhY2sgdG8gc29mdHdhcmUgRUNDLgoKRm9yIHRoaXMgY2FzZSwgd291bGQgeW91IGV4cGVj
dCB0aGUgU3VueGkgbWF4aW1pemF0aW9uIHBhdGggdG8gcmV0YWluIGEKNTEyLWJ5dGUgRUNDIHN0
ZXAgb24gNTEyLWJ5dGUtcGFnZSBOQU5EcywgcmF0aGVyIHRoYW4gc2VsZWN0aW5nIDEwMjQgYW5k
CnRoZW4gdmFsaWRhdGluZyB0aGUgcmVzdWx0aW5nIHN0ZXAgY291bnQ/Cgo+ID4gQW4gZXhwbGlj
aXRseSBjb25maWd1cmVkIEVDQyBzdGVwIHdoaWNoIGlzIGxhcmdlciB0aGFuLCBvciBkb2VzIG5v
dAo+ID4gZGl2aWRlLCB0aGUgcGFnZSBhbHNvIHByb2R1Y2VzIGFuIHVudXNhYmxlIHN0ZXAgY291
bnQgYmVmb3JlIHRoZSBOQU5ECj4gPiBjb3JlIGNhbiBkaWFnbm9zZSB0aGUgY29uZmlndXJhdGlv
bi4KPiA+Cj4gPiBWYWxpZGF0ZSB0aGUgc3RlcCBzaXplIGF0IGJvdGggcG9pbnRzIHdoZXJlIHRo
ZSBkcml2ZXIgZGVyaXZlcyB0aGUKPiA+IG51bWJlciBvZiBzZWN0b3JzIGFuZCByZWplY3QgaW52
YWxpZCBnZW9tZXRyaWVzLgo+ID4KPiA+IEZpeGVzOiA0Nzk2ZDg2NTU5MTUgKCJtdGQ6IG5hbmQ6
IHN1bnhpOiBTdXBwb3J0IEVDQyBtYXhpbWl6YXRpb24iKQo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFu
ZC5jIHwgMTcgKysrKysrKysrKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5j
Cj4gPiBpbmRleCA0NWNjYmNlOTE1NTEuLmFkMzE0YzBlMzBiMiAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvc3VueGlfbmFuZC5jCj4gPiBAQCAtMjAzMiw2ICsyMDMyLDE1IEBAIHN0YXRpYyB2b2lk
IHN1bnhpX25hbmRfZGV0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCkKPiA+ICAgICAg
IHN1bnhpX25hbmQtPnVzZXJfZGF0YV9ieXRlcyA9IE5VTEw7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0
aWMgaW50IHN1bnhpX25mY19lY2Nfc3RlcHMoc3RydWN0IG10ZF9pbmZvICptdGQsIHVuc2lnbmVk
IGludCBzdGVwX3NpemUpCj4gPiArewo+ID4gKyAgICAgaWYgKCFzdGVwX3NpemUgfHwgbXRkLT53
cml0ZXNpemUgPCBzdGVwX3NpemUgfHwKPiA+ICsgICAgICAgICBtdGQtPndyaXRlc2l6ZSAlIHN0
ZXBfc2l6ZSkKPgo+IEkgZG9uJ3QgZ2V0IGl0LCBtdGQtPndyaXRlc2l6ZSA8IHN0ZXBfc2l6ZSBp
cyBjb25jZXB0dWFsbHkKPiBpbXBvc3NpYmxlLiBJZiB0aGF0IGhhcHBlbnMsIGl0IG11c3QgYmUg
Zml4ZWQgZWFybGllciB0aGFuIHRoYXQuCgpBbiBleHBsaWNpdGx5IGNvbmZpZ3VyZWQgc3RlcCBy
ZWFjaGVzIHRoZSBjb250cm9sbGVyIGF0dGFjaCBjYWxsYmFjawphZnRlciB0aGUgTkFORCBnZW9t
ZXRyeSBoYXMgYmVlbiBkZXRlY3RlZCBidXQgYmVmb3JlIG5hbmRfc2Nhbl90YWlsKCkuClRoZSBT
dW54aSBiaW5kaW5nIHBlcm1pdHMgc3RlcCBzaXplcyBvZiA1MTIgYW5kIDEwMjQgd2l0aG91dCBj
b25zdHJhaW5pbmcKdGhlbSBhZ2FpbnN0IHRoZSBkZXRlY3RlZCBwYWdlIHNpemUuCgpDb3VsZCB5
b3UgY2xhcmlmeSB3aGVyZSB5b3UgZXhwZWN0IHRoaXMgaW52YXJpYW50IHRvIGJlIGVzdGFibGlz
aGVkOgppbiB0aGUgcmF3IE5BTkQgY29yZSBiZWZvcmUgLT5hdHRhY2hfY2hpcCgpLCBvciBpbiB0
aGUgU3VueGkgZHJpdmVyIHdoZW4KaXQgc2VsZWN0cyBvciBjb25zdW1lcyB0aGUgRUNDIGNvbmZp
Z3VyYXRpb24/Cgo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsKPiA+ICsg
ICAgIHJldHVybiBtdGQtPndyaXRlc2l6ZSAvIHN0ZXBfc2l6ZTsKPiA+ICt9Cj4gPiArCj4gPiAg
c3RhdGljIGludCBzdW54aV9uZmNfbWF4aW1pemVfdXNlcl9kYXRhKHN0cnVjdCBuYW5kX2NoaXAg
Km5hbmQsIHVpbnQzMl90IG9vYnNpemUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCBlY2NfYnl0ZXMsIGludCBuc2VjdG9ycykKPiA+ICB7Cj4KPiBUaGFua3Ms
Cj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
