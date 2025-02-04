Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83845C02194
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 02:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=doLiveVz2yLnS9o6VbqT0f3kZ1H8L3pZq0l9KRFmpr4=; b=EghM5CUIewHZMM
	8EM4rfkB5eYJKsLHU+ZDkKnbQnZSdI1HJAhwUhGDyNOIDjKYEQez0Jp8d8Agzs4ofwW03G7Hpp9zD
	oWXDr6QrGm+2onGxCpQHp4hqiAoJ9aLUZ0xGOC9HLQTWzIkeo0coyV9xWmP+E9kWxIunsHNcLT3je
	10CFpS7cTHR6Wgtq7ypskJmiwVK80Nu/6+CR+TweqpAInqPT6ApV2V6mTDIiKUWWffNSkJVrnRL/1
	j8XIyMF1PJ7s7BP8+TZeKGqWBzx1Ssma5Cc9morCDRZViq1dpSvpmnoF2c5PXmkL+KZKyDnChdrnL
	O7qHh/eIhzs2EsGLDMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf8oj-0000000H7O2-25Ff;
	Tue, 04 Feb 2025 02:37:37 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf8oh-0000000H7N0-0HSn
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 02:37:36 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-46fa7678ef3so48277721cf.1
        for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2025 18:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738636654; x=1739241454; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFTT1x9qPUOcycVAyXc65sG+TUIzEOUVU4ygZcgKGVI=;
        b=m2TMy3r6+l6tdEN5WfRZlZB1aIDGF+voqkleachXGZgpPKQdmFkfsRuH/yfkrK/aDg
         P3CsqrKQiDg27xVhHfWAjmPHWmu5hbvNQ2Cb2X1N6zmJST5npi59KnpTEnbgIqGRQFIm
         mNVFvuu+h3KN4rbT5mkZWOBIqpcoR0PNeVts4En4Mh84QJWL/ljVHJnRQGCGxWGLecSl
         VZQoTb0HEqZEMg1qEptTCJ5IAmCs+a4wu2gWmfgA5IhMIw0rQpCqyP7ZTYp9dmbsE9O/
         qhAxY2jkeyXX2escEQOolg4jjVy1oomhU8zVxKW3RiwPhFu3r3kjyBZKzWRbImjifLnN
         0Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738636654; x=1739241454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFTT1x9qPUOcycVAyXc65sG+TUIzEOUVU4ygZcgKGVI=;
        b=cNdqZDnF4Nes0yEWu0hoxGuJwujhulUu4Cc95lIUVHsebfI7jPqANm7uCS8hPZ36TB
         x9INk7RdsO6ZcSUFbW38CoCEbHZh39qQYfnCAKPa6VzAUCUNdylJDUXTXXHqQyM6GnKl
         VSyAOuZ9JsYAWq+uFywFeXnzMcOeOg+riyWE/0iTCREuAdwXNT+LCm4Lj+27t0XgrXoK
         SKsBzqP77HNOhnFWx/1o6HiPTeYrdNXwqqKD5DB3HM0KhL3+uIRTDc7jk/k9IqFNgyOd
         upunJwV66c46EHypK7CCrJGu2TLAa8TmQrs2ivr+/MJHUsb4kg32YzC/qUAYhEYhw28J
         /pTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUVpCi1/4szxOnNXCmmahU+Eo6PDTMegQ7CFICa0dbVHC0lccq2FpX4dfCIOYhQz1ScB1Uj0ZDjn8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwY9bc/CB2n4jLqEb7gZioW7IreQQKvLCGuthp9sVBz94CsR8av
	EG9bZjiRx5wA4sOhYSmAHvrRR2JLzluHvbuO4MubVsHJVB9EpltJxcLffSUxyBiq6VEISjT1Pfu
	nM0HdewWvYulJtd48t2CJU/zLt70=
X-Gm-Gg: ASbGnctSfNotnVdLnQh5lEP+I+ZoDwRzscGycxVmyGFPYO8tvir00g5jypDe6VGbc3O
	KDyNmnVkRPggI+bl2l31sJA37wmum9zAZBvYOUbKkVc2P7q4fo4VvfCeINwjutENREwr3S4L4
X-Google-Smtp-Source: AGHT+IEqyV1oLh7+tRRmVcNhrW2tv9h9wmB5y5P1fx3eysiSgNvA+mtv7mTxUoVPWeywWQmF2n6glRQpG7mEOqz/dgE=
X-Received: by 2002:a05:622a:59ca:b0:46c:870f:f621 with SMTP id
 d75a77b69052e-46fd0ace15amr337077271cf.26.1738636654140; Mon, 03 Feb 2025
 18:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20250202205456.40790-1-jiashengjiangcool@gmail.com>
 <87tt9bxwc0.fsf@bootlin.com> <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
In-Reply-To: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Mon, 3 Feb 2025 21:37:23 -0500
X-Gm-Features: AWEUYZnxZ-pA-NrdUSrYdnNNkeDv2I90-xB7KJXZnxTPiDBkaK5AQdw7WyDUgr8
Message-ID: <CANeGvZUBPFUs+T_h-LDVxvVPHogerw0=n14=F-tdCmqwkeAQJQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add check for kcalloc()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at, vigneshr@ti.com, 
	gmpy.liaowx@gmail.com, kees@kernel.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_183735_107043_96DCEABF 
X-CRM114-Status: GOOD (  25.35  )
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

SGkgQ2hyaXN0b3BoZSwKCk9uIE1vbiwgRmViIDMsIDIwMjUgYXQgMTowNOKAr1BNIENocmlzdG9w
aGUgSkFJTExFVAo8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+IHdyb3RlOgo+Cj4gTGUg
MDMvMDIvMjAyNSDDoCAwOTozMiwgTWlxdWVsIFJheW5hbCBhIMOpY3JpdCA6Cj4gPiBPbiAwMi8w
Mi8yMDI1IGF0IDIwOjU0OjU2IEdNVCwgSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5namlhbmdjb29s
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4+IEFkZCBhIGNoZWNrIGZvciBrY2FsbG9jKCkgYW5k
IHByaW50IGFuIGVycm9yIG1lc3NhZ2UgaWYgaXQgZmFpbHMuCj4gPgo+ID4gQ2hlY2tpbmcsIHll
cywgYnV0IGxvZ2dpbmcsIG5vLiBJSVJDIHRoZSBjb3JlIGRvZXMgaXQgYWxyZWFkeSBpZiByZXF1
aXJlZC4KPiA+Cj4gPj4gRml4ZXM6IDc4YzA4MjQ3YjlkMyAoIm10ZDogU3VwcG9ydCBrbXNnIGR1
bXBlciBiYXNlZCBvbiBwc3RvcmUvYmxrIikKPiA+Cj4gPiBDYzogc3RhYmxlIGlzIG1pc3NpbmcK
PiA+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5namlhbmdjb29s
QGdtYWlsLmNvbT4KPiA+PiAtLS0KPiA+PiAgIGRyaXZlcnMvbXRkL210ZHBzdG9yZS5jIHwgNSAr
KysrKwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZHBzdG9yZS5jIGIvZHJpdmVycy9tdGQvbXRkcHN0b3Jl
LmMKPiA+PiBpbmRleCA3YWM4YWM5MDEzMDYuLjM2ODk5NzE1NWMwNyAxMDA2NDQKPiA+PiAtLS0g
YS9kcml2ZXJzL210ZC9tdGRwc3RvcmUuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBzdG9y
ZS5jCj4gPj4gQEAgLTQyMyw2ICs0MjMsMTEgQEAgc3RhdGljIHZvaWQgbXRkcHN0b3JlX25vdGlm
eV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPj4gICAgICBsb25nY250ID0gQklUU19UT19M
T05HUyhkaXZfdTY0KG10ZC0+c2l6ZSwgbXRkLT5lcmFzZXNpemUpKTsKPiA+PiAgICAgIGN4dC0+
YmFkbWFwID0ga2NhbGxvYyhsb25nY250LCBzaXplb2YobG9uZyksIEdGUF9LRVJORUwpOwo+ID4+
Cj4gPj4gKyAgICBpZiAoIWN4dC0+cm1tYXAgfHwgIWN4dC0+dXNlZG1hcCB8fCAhY3h0LT5iYWRt
YXApIHsKPiA+PiArICAgICAgICAgICAgZGV2X2VycigmbXRkLT5kZXYsICJmYWlsZWQgdG8gYWxs
b2NhdGUgbWVtb3J5IGZvciBtYXBcbiIpOwo+ID4+ICsgICAgICAgICAgICByZXR1cm47Cj4gPj4g
KyAgICB9Cj4gPj4gKwo+ID4+ICAgICAgLyoganVzdCBzdXBwb3J0IGRtZXNnIHJpZ2h0IG5vdyAq
Lwo+ID4+ICAgICAgY3h0LT5kZXYuZmxhZ3MgPSBQU1RPUkVfRkxBR1NfRE1FU0c7Cj4gPj4gICAg
ICBjeHQtPmRldi56b25lLnJlYWQgPSBtdGRwc3RvcmVfcmVhZDsKPiA+Cj4gPiBXaGF0IGlmIHJl
Z2lzdGVyX3BzdG9yZV9kZXZpY2UoKSBmYWlscz8gWW91ciBvbmx5IHBhcnRpYWxseSBmaXhpbmcg
dGhlCj4gPiBwcm9ibGVtIGlmIHlvdSBkb24ndCBoYW5kbGUgdGhlIGZyZWUoKXMgdGhlcmUgYXMg
d2VsbC4KPgo+IC4uLiBhbmQgaWYgYW4gYWxsb2NhdGlvbiBmYWlscyBhYm92ZSwgdGhlbiBzb21l
IGtmcmVlKCkgYWxzbyBuZWVkcyB0byBiZQo+IGNhbGxlZC4KPgoKVGhhbmtzLCBJIGhhdmUgYWRk
IGtmcmVlKCkgdG8gZGVhbCB3aXRoIGVhY2ggYWxsb2NhdGlvbiBpbiBteSB2Mi4KCj4gQW5kLCB1
bnJlbGF0ZWQgdG8geW91ciBwYXRjaCwgdGhlc2Uga2NhbGxvYygpL2tmcmVlKCkgY291bGQgYmUg
c29tZQo+IGJpdG1hcF96YWxsb2MoKS9iaXRtYXBfZnJlZSgpLiAoYnV0IGknbSBub3Qgc3VyZSBp
dCByZWFsbHkgd29ydGggdGhlIGVmZm9ydCkKCkkgdGhpbmsgaXQgd29ya3Mgd2VsbCBjdXJyZW50
bHksIHNvIGl0IG1heSBub3QgYmUgbmVjZXNzYXJ5IHRvIGRvIHRoZQpyZXBsYWNlbWVudHMuCgo+
Cj4gQ0oKPgo+ID4KPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwKPiA+Cj4gPgo+CgotSmlhc2hlbmcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
