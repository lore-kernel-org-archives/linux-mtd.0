Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E900C369DC
	for <linux-mtd@archiver.kernel.org>; Wed,  7 May 2025 05:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+Q+oNkCpG9L2vpKdhGXzZMo0qZmr0n2REqqRYcESFk=; b=LMqODDRtbAxAK/
	NjSm0Edy3hjFzGRAkfOAEXl3olMswExYX6CQjgI+VA6Hs2X0+zbmSuSN8D/nfCt3bXWjjUHoJbJpD
	unTpVi9sz/UmjtUwba0J3FS81QcO1V+JN+AM/sRrV5P8VXdyIvJ1RgEfOoJlLcbdTy9rBV2sWCE17
	iHI2wGUcNUsCArrk8O/3PIdHX1k7IsXGpMVN9Tc78V1V3iJzyT/3+5YTdQs7Sd5ywJo673kQlqaX/
	A4wqJO6RRe3dW1cvp4BQkV+S8R/0oh+ETbSt+SkDJETtXYgn6FGUah4NRECX5ag82ZoNqbdcDBA9D
	euD90ZhmxDTzwFVJSnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWuP-0000000EDZB-3TQr;
	Wed, 07 May 2025 05:01:29 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUO5-0000000Dtgb-3lZf
	for linux-mtd@lists.infradead.org;
	Wed, 07 May 2025 02:19:59 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so6194765e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 06 May 2025 19:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746584396; x=1747189196; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3dHw7mgAZZaKFqI8wqICcNj5nSVnoaIaacPp8z1E6o=;
        b=UB9bTF3RMsWRxKDRM1m5RvowAWqZv+DQcPPRN7BGYZj3E7VVEmKE0NRziOwu1rBwqK
         4TEq4N2tFrnx4rq5Ekqh777UZmL6SgOsL3XSk8tK4th/tf7MUlefrRr7MAlTPi+bZwJq
         zWFw5EC172DSJ4c6PlvMQK83Kx4Qu/Xryr7rzesdRDLc53m9XAcgUvgyUhNVs6dt/FOH
         190IEr80JLZz3WemnGwZxVzmWaqOmyjNlvZuxdS7i0D10CNWoVJtpYeHvJDj9mGWNcVr
         Bl50LsQTxvNt0fQ2qphUcmKIpW199ivXGBB7b9dkv1ZQN4Sl2IsXx2HR4veVUyibabIZ
         6iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746584396; x=1747189196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3dHw7mgAZZaKFqI8wqICcNj5nSVnoaIaacPp8z1E6o=;
        b=m1Ysxik5lyt/fw4WxEu6UW5F6cSZXT+kCvQnXIHgoivImm2WM4qr0cA2oDjRZfY6Qv
         uQi9ZgR8RHcIKSfwvOXRZvM2bzXV3u1YYKx3MMuERNnCVU3zLVezbMjSlDHQot6w8ezq
         zM10k6l61+syN3xCP22KWT2Ca6vyEWvq/2NyZ47KUICS08OxLfDr/MnGBpSKxtyNdfrS
         ZGSN7dy6Gz0KLUSOV9tM+3jqljwfPQvpaP1YvzPG7zecI3wpU8nAIFxkr7q/qNNZZ9nJ
         +JDJCCEEFV3xRWQxtzFu9ayjpM9BaJb8qu/NjIRgTLefJDFyqir262WEHkJZW4HKSg3+
         Nd9g==
X-Forwarded-Encrypted: i=1; AJvYcCXuc1w5EyI7E3HO8HXIHM2q7Akh+//WzZviNKsnVvXdgHwEZeaKLDNVaCv1Y+yJLR5WiodZT/DMXk8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvw6Jx0OXLUkT9JpozeNfHJjmBDkRZ9sFiloUvv2wCqepNtguL
	XkQvbqHTGxpNDR9+sv8XgtNzFme9sr5SHXkMt3Uz0WG8SwOSVK33F7Ry7/Y85sga9t/+YeEvMcG
	clbN7o7fPY4quNX7yZSpOe1JZxvU=
X-Gm-Gg: ASbGnctZEpOYSR8mzQgcLxHeUz+0AKb+aTxiOElRhyXxVx1Zu+Pw9nbp1NHrflRxyY5
	K7ZvFYXQuOrzcd+CVNvoDaLNwhnTu4XTF2CqQSht8hR2ZsjG85vCGPOBQ8avFp2CVW+ArsM1eVB
	nEWZ1ZsFJiMKYw5rV27iqtgRI=
X-Google-Smtp-Source: AGHT+IEHHSrM8lUGjXyC29XgpCoALFPav9UBwvGwJSEF9oEir0MtBc94KvC6Bdeq3rGHG/CFZD3Kt7jc8rEFpB3+fZs=
X-Received: by 2002:a05:6512:20d8:b0:54b:117b:952e with SMTP id
 2adb3069b0e04-54fb95ba664mr432780e87.55.1746584395709; Tue, 06 May 2025
 19:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <aBR535RZZT-sa6QZ@stanley.mountain> <20250502160408.GC15945@pendragon.ideasonboard.com>
In-Reply-To: <20250502160408.GC15945@pendragon.ideasonboard.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Wed, 7 May 2025 10:19:18 +0800
X-Gm-Features: ATxdqUF2q4OqYQGMItnm4chuLq1HIZNkbYYaj1fKHzu44gfS5dx8BLdSbU8WwtQ
Message-ID: <CAJhJPsWTeimkQGzdtT+dAdO1d6KhjW7myvgQeuNj85_qCdNG7w@mail.gmail.com>
Subject: Re: [bug report] mtd: rawnand: Add Loongson-1 NAND Controller Driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-mips@vger.kernel.org, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_191957_938162_D70E34C1 
X-CRM114-Status: GOOD (  20.40  )
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

T24gU2F0LCBNYXkgMywgMjAyNSBhdCAxMjowNOKAr0FNIExhdXJlbnQgUGluY2hhcnQKPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAwMiwg
MjAyNSBhdCAxMDo1MzowM0FNICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+ID4gSGVsbG8g
S2VndWFuZyBaaGFuZywKPiA+Cj4gPiBDb21taXQgZDJkMTBlZGUwNGIxICgibXRkOiByYXduYW5k
OiBBZGQgTG9vbmdzb24tMSBOQU5EIENvbnRyb2xsZXIKPiA+IERyaXZlciIpIGZyb20gTWFyIDIw
LCAyMDI1IChsaW51eC1uZXh0KSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZwo+ID4gU21hdGNoIHN0
YXRpYyBjaGVja2VyIHdhcm5pbmc6Cj4gPgo+ID4gICAgICAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
bG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jOjczMCBsczF4X25hbmRfY2hpcF9pbml0KCkKPiA+
ICAgICAgIHdhcm46IGluY29uc2lzdGVudCByZWZjb3VudGluZyAnY2hpcF9ucC0+a29iai5rcmVm
LnJlZmNvdW50LnJlZnMuY291bnRlcic6Cj4gPgo+ID4gZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9v
bmdzb24xLW5hbmQtY29udHJvbGxlci5jCj4gPiAgICAgNjkwIHN0YXRpYyBpbnQgbHMxeF9uYW5k
X2NoaXBfaW5pdChzdHJ1Y3QgbHMxeF9uYW5kX2hvc3QgKmhvc3QpCj4gPiAgICAgNjkxIHsKPiA+
ICAgICA2OTIgICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBob3N0LT5kZXY7Cj4gPiAgICAg
NjkzICAgICAgICAgaW50IG5jaGlwcyA9IG9mX2dldF9jaGlsZF9jb3VudChkZXYtPm9mX25vZGUp
Owo+ID4gICAgIDY5NCAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpcF9ucDsKPiA+ICAg
ICA2OTUgICAgICAgICBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gJmhvc3QtPmNoaXA7Cj4gPiAg
ICAgNjk2ICAgICAgICAgc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsK
PiA+ICAgICA2OTcgICAgICAgICBpbnQgcmV0Owo+ID4gICAgIDY5OAo+ID4gICAgIDY5OSAgICAg
ICAgIGlmIChuY2hpcHMgIT0gMSkKPiA+ICAgICA3MDAgICAgICAgICAgICAgICAgIHJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgIkN1cnJlbnRseSBvbmUgTkFORCBjaGlwIHN1cHBv
cnRlZFxuIik7Cj4gPiAgICAgNzAxCj4gPiAgICAgNzAyICAgICAgICAgY2hpcF9ucCA9IG9mX2dl
dF9uZXh0X2NoaWxkKGRldi0+b2Zfbm9kZSwgTlVMTCk7Cj4gPgo+ID4KPiA+IFRoZSBvZl9nZXRf
bmV4dF9jaGlsZCgpIGZ1bmN0aW9uIGRyb3BzIHRoZSByZWZlcmVuY2Ugb24gdGhlIGN1cnJlbnQK
PiA+IGNoaWxkLiAgVGhhdCdzIHByb2JhYmx5IG5vdCB3aGF0IHdlIHdhbnQgdG8gaGFwcGVuLiAg
VGhpcyBpcyBzaW1pbGFyIHRvCj4gPiBhIGRpc2N1c3Npb24gd2Ugd2VyZSBoYXZpbmcgZWFybGll
ciBhYm91dCBvZl9maW5kX25vZGVfYnlfbmFtZSgpLgo+Cj4gVGhlIGN1cnJlbnQgY2hpbGQgaGVy
ZSBpcyBOVUxMLCBzbyBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYW4gaXNzdWUuCj4KPiA+IFRoZW4g
aXQgdGFrZXMgYSByZWZlcmVuY2UgdG8gdGhlIG5ldyBjaGlsZC4KPgo+ICpUaGF0KiBjYXVzZXMg
aXNzdWVzIHRoYXQgeW91IG91dGxpbmVkIGJlbG93Lgo+Cj4gPgo+ID4gICAgIDcwMyAgICAgICAg
IGlmICghY2hpcF9ucCkKPiA+ICAgICA3MDQgICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJy
X3Byb2JlKGRldiwgLUVOT0RFViwgImZhaWxlZCB0byBnZXQgY2hpbGQgbm9kZSBmb3IgTkFORCBj
aGlwXG4iKTsKPiA+ICAgICA3MDUKPiA+ICAgICA3MDYgICAgICAgICBjaGlwLT5jb250cm9sbGVy
ID0gJmhvc3QtPmNvbnRyb2xsZXI7Cj4gPiAgICAgNzA3ICAgICAgICAgY2hpcC0+b3B0aW9ucyA9
IE5BTkRfTk9fU1VCUEFHRV9XUklURSB8IE5BTkRfVVNFU19ETUEgfCBOQU5EX0JST0tFTl9YRDsK
PiA+ICAgICA3MDggICAgICAgICBjaGlwLT5idWZfYWxpZ24gPSAxNjsKPiA+ICAgICA3MDkgICAg
ICAgICBuYW5kX3NldF9jb250cm9sbGVyX2RhdGEoY2hpcCwgaG9zdCk7Cj4gPiAgICAgNzEwICAg
ICAgICAgbmFuZF9zZXRfZmxhc2hfbm9kZShjaGlwLCBjaGlwX25wKTsKb2Zfbm9kZV9wdXQoY2hp
cF9ucCk7CgpCeSBhZGRpbmcgdGhlIGxpbmUgYWJvdmUsIGFsbCBvdGhlciBvZl9ub2RlX3B1dChj
aGlwX25wKSBjYWxscyBjYW4gYmUgcmVtb3ZlZC4KVGhhbmtzIGZvciByZXZpZXdpbmchCgo+ID4g
ICAgIDcxMSAgICAgICAgIGlmICghbXRkLT5uYW1lKQo+ID4gICAgIDcxMiAgICAgICAgICAgICAg
ICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLCAiTWlzc2luZyBNVEQgbGFiZWxc
biIpOwo+ID4KPiA+IG9mX25vZGVfcHV0KGNoaXBfbnApIGJlZm9yZSByZXR1cm5pbmcuCj4gPgo+
ID4gICAgIDcxMwo+ID4gICAgIDcxNCAgICAgICAgIG10ZC0+ZGV2LnBhcmVudCA9IGRldjsKPiA+
ICAgICA3MTUgICAgICAgICBtdGQtPm93bmVyID0gVEhJU19NT0RVTEU7Cj4gPiAgICAgNzE2Cj4g
PiAgICAgNzE3ICAgICAgICAgcmV0ID0gbmFuZF9zY2FuKGNoaXAsIDEpOwo+ID4gICAgIDcxOCAg
ICAgICAgIGlmIChyZXQpIHsKPiA+ICAgICA3MTkgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0
KGNoaXBfbnApOwo+ID4gICAgIDcyMCAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCByZXQsICJmYWlsZWQgdG8gc2NhbiBOQU5EIGNoaXBcbiIpOwo+ID4gICAgIDcyMSAg
ICAgICAgIH0KPiA+ICAgICA3MjIKPiA+ICAgICA3MjMgICAgICAgICByZXQgPSBtdGRfZGV2aWNl
X3JlZ2lzdGVyKG10ZCwgTlVMTCwgMCk7Cj4gPiAgICAgNzI0ICAgICAgICAgaWYgKHJldCkgewo+
ID4gICAgIDcyNSAgICAgICAgICAgICAgICAgbmFuZF9jbGVhbnVwKGNoaXApOwo+ID4gICAgIDcy
NiAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoY2hpcF9ucCk7Cj4gPiAgICAgNzI3ICAgICAg
ICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byByZWdp
c3RlciBNVEQgZGV2aWNlXG4iKTsKPiA+ICAgICA3MjggICAgICAgICB9Cj4gPiAgICAgNzI5Cj4g
Pgo+ID4gSSB0aGluayB3ZSB3YW50IHRvIGNhbGwgb2Zfbm9kZV9wdXQoY2hpcF9ucCkgYmVmb3Jl
IHJldHVybmluZyBvbiB0aGUKPiA+IHN1Y2Nlc3MgcGF0aCBhcyB3ZWxsPwo+Cj4gSSB3b3VsZCBp
bnN0ZWFkIGRlY2xhcmUgdGhlIGNoaXBfbnAgdmFyaWFibGUgYXMKPgo+ICAgICAgICAgc3RydWN0
IGRldmljZV9ub2RlICpjaGlwX25wIF9fZnJlZShvZl9ub2RlX3B1dCkgPSBOVUxMOwo+Cj4gYW5k
IGRyb3AgYWxsIHRoZSBvZl9ub2RlX3B1dChjaGlwX25wKSBjYWxscy4KPgo+ID4gLS0+IDczMCAg
ICAgICAgIHJldHVybiAwOwo+ID4gICAgIDczMSB9Cj4KPiAtLQo+IFJlZ2FyZHMsCj4KPiBMYXVy
ZW50IFBpbmNoYXJ0CgoKCi0tCkJlc3QgcmVnYXJkcywKCktlZ3VhbmcgWmhhbmcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
