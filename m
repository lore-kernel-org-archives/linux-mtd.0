Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DB1C77B73
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Apr 2023 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CnbML1TyaWG6ZW/S6qyrAayMV6R8LneuuaJTQcxs/8=; b=kgZTPu+50o8amd
	Fph+oQBedDlTdT3WL6mDWvsUnS/M/zmXw701ORiy9J0rwM8YYKZ4wePFT06FljSPaZ3jClpZUGHde
	IiVAewN4/+sqEfj1gSfOIsfwsAsP0L4/Py9EaZY6H7qLsH51NpVKvcrjCdqhwq7PY7WMaqBkfan1N
	71QbrRmJpmAGnyiTnYNuODokKxAWUs0VBtAqEPzA2czbNuZvi9zEAiUOmuzGkQCs5ZDbw0j8hWwFm
	+aNW6xg6xbL0l9+w4ISfbi4c4/hDngfWmqlUNdnGREhZt12PD7REZST91QYwmybtLVMHRnZfW/10F
	yGnipTyjtTWnviLF0X6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppY4a-008dj7-0f;
	Thu, 20 Apr 2023 17:27:56 +0000
Received: from mx2.ucr.edu ([138.23.62.3])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppY4W-008di0-2d
	for linux-mtd@lists.infradead.org;
	Thu, 20 Apr 2023 17:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1682011673; x=1713547673;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc:content-transfer-encoding;
  bh=m0FRJv82Zu1t4DuQsvNt8pTR3GIZGjnpBIZPnMMIx84=;
  b=R4UD4sqUXnvYRAOjuP5ZEGbO+B5h2nzVHAaXY5Dqk9ETN8DnhyQPSDFM
   sWAx3HJbBx4UA7nJ0n2yXsqgGPkeZPMGDN/ikpvHC2q18lVJta9pPDBNc
   PfmfYVHd1gaeMsa6D6sujyy4NDMWnhuWHyZ9b5DZFMDMvelE3ZjlwXRUi
   mCEEkG3Gz/H0xhvhNdkhmxAU9/R2SyPaXL+mEemR7Seh/WzqRE8v7KKZ+
   XezGtZ1pSQOu9B0MeKvhHo1ue8BbG27Im823W+7XKzZVNtuSJU4HOgC+9
   F5gV9krKUNBrgBB8TJnv04wGekR+haOYjIoNwESVvXpAzzffmJN4Voqcn
   A==;
Received: from mail-wm1-f72.google.com ([209.85.128.72])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Apr 2023 10:27:46 -0700
Received: by mail-wm1-f72.google.com with SMTP id p17-20020a05600c1d9100b003f178430c87so670753wms.9
        for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2023 10:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1682011663; x=1684603663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prvqaHMzKrn9ZWtMPIRK+7YzVsgpCm9+YP37nwvlG5A=;
        b=d7/Jv556EmH3rd6PUv3RPTf3yuNhvrJJt4q3g/YdqN9fLQo0X7DMY/d3JPgA0GOVMq
         fANtzSR05UqLofG2RfR4fzlLZ+OwDH3odceGC/K57pTWH5/V3t+XjMyEj/f7YyCbXSjm
         xrOWHPR4Zca3cSFnSSUam4ahzA5gIwwu0m3ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011663; x=1684603663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prvqaHMzKrn9ZWtMPIRK+7YzVsgpCm9+YP37nwvlG5A=;
        b=f80iKnjlfI6RcEZHvG9ROMberlScXib/QNQMZWeEQZH3KljR9KLK3Lz2v8OX+ugiwG
         C4m3tQ7VcAwBgapsUqJb5s5tQNFBxTlRT1zMcELssi89Bum3bR9F/Zbg790ETGFIyOq3
         GYHs+hPlr5KpRWo9K08lVhswWrIbKe9NeeJJNoJuKIyUqNXg82wzaOCugfVkSGmLTF9a
         spqXJkh6oKcA+O9KBr6TfPmh2li/2QF8uvKdnIyoBrv4ICiDXjGiqBYYCbrES6OiwRPs
         409rPoX9aRR+4I+YkKpc1X98dXJ6pNsuml1oSM1tBYFZ6FHYHvAAOPUuzlSUfhBmjhGC
         CeaQ==
X-Gm-Message-State: AAQBX9dd/fyy2WUjX3Iaoq4mvRKAlp0ZwcS4CRLhoYi5z2QNGyEYoPbN
	+3rRXiLpeWq6gT0hKz/jvPsxOvvWINd3E9L2XC73pjnvnajmwWaMWDXUh01X4PR8Brrk2FpG/n0
	SbNs7KkUA9sKNFBNrCFxBvHy7wLbyN7ABsTuypkXvZGwz98gOk34SUA==
X-Received: by 2002:a05:600c:288:b0:3f1:75c5:bd56 with SMTP id 8-20020a05600c028800b003f175c5bd56mr2085091wmk.8.1682011663485;
        Thu, 20 Apr 2023 10:27:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZBaqyafrj2kes9Nec8JC/21lZni+HBdg86ODg3DHsVpIWmSpqTEZeXvOZepxdLJoIx2dtZq8drz44GlnaEZ9c=
X-Received: by 2002:a05:600c:288:b0:3f1:75c5:bd56 with SMTP id
 8-20020a05600c028800b003f175c5bd56mr2085079wmk.8.1682011663141; Thu, 20 Apr
 2023 10:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com>
 <CA+UBctDsHRpkLG5ppdiuV8Msn4Dx-ZJ2xDrxfa48VMb7ZE+xBA@mail.gmail.com>
 <687864524.118195.1681799447034.JavaMail.zimbra@nod.at> <ff419c45-7d76-0219-a598-f6f4d081e29c@huawei.com>
In-Reply-To: <ff419c45-7d76-0219-a598-f6f4d081e29c@huawei.com>
From: Yu Hao <yhao016@ucr.edu>
Date: Thu, 20 Apr 2023 10:27:32 -0700
Message-ID: <CA+UBctBVHouL-3rM3zKYLpk01fXFvCpBnU7EpSRVdGW7cEjcJQ@mail.gmail.com>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_102753_034191_774D1492 
X-CRM114-Status: GOOD (  17.62  )
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

SGksCgpPbiBXZWQsIEFwciAxOSwgMjAyMyBhdCA5OjQ54oCvUE0gWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBIaQo+ID4gWXUgSGFvLAo+ID4KPiA+IC0t
LS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiA+PiBWb246ICJZdSBIYW8iIDx5aGFvMDE2
QHVjci5lZHU+Cj4gPj4+IHViaTogbXRkMCBpcyBhbHJlYWR5IGF0dGFjaGVkIHRvIHViaTAKPiA+
Pj4gdWJpNzogYXR0YWNoaW5nIG10ZDE0Nwo+ID4+PiBkaXZpZGUgZXJyb3I6IDAwMDAgWyMxXSBQ
UkVFTVBUIFNNUCBLQVNBTgo+ID4+PiBDUFU6IDAgUElEOiAyMDAyMyBDb21tOiBzeXotZXhlY3V0
b3IuMCBOb3QgdGFpbnRlZCA2LjIuMCAjNgo+ID4+PiBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5k
YXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUwo+ID4+PiAxLjEzLjAtMXVidW50dTEu
MSAwNC8wMS8yMDE0Cj4gPj4+IFJJUDogMDAxMDptdGRfZGl2X2J5X2ViIGluY2x1ZGUvbGludXgv
bXRkL210ZC5oOjU4MCBbaW5saW5lXQo+ID4+PiBSSVA6IDAwMTA6aW9faW5pdCBkcml2ZXJzL210
ZC91YmkvYnVpbGQuYzo2MjAgW2lubGluZV0KPiA+Pj4gUklQOiAwMDEwOnViaV9hdHRhY2hfbXRk
X2RldisweDc3Zi8weDJmZTAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmM6OTU1Cj4gPj4+IENvZGU6
IGZjIGZmIGRmIDQ4IGMxIGVhIDAzIDBmIGI2IDE0IDAyIDRjIDg5IGYwIDgzIGUwIDA3IDgzIGMw
IDAzIDM4Cj4gPj4+IGQwIDdjIDA4IDg0IGQyIDBmIDg1IDFmIDI1IDAwIDAwIDQxIDhiIDRjIDI0
IDEwIDQ4IDg5IGQ4IDMxIGQyIDw0OD4gZjcKPiA+Pj4gZjEgNDggODkgYzMgZTggYjYgZjMgMWIg
ZmMgNDggOGQgODUgNDAgMTcgMDAgMDAgNDggODkgYzIgNDgKPiA+Pj4gUlNQOiAwMDE4OmZmZmZj
OTAwMGJlMGZkMzAgRUZMQUdTOiAwMDAxMDI0Ngo+ID4+PiBSQVg6IDAwMDAwMDAwMDAwMDAwMDAg
UkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDogMDAwMDAwMDAwMDAwMDAwMAo+ID4+PiBSRFg6IDAw
MDAwMDAwMDAwMDAwMDAgUlNJOiBmZmZmODg4MDQ3YTQ5ZDQwIFJESTogMDAwMDAwMDAwMDAwMDAw
Mgo+ID4+PiBSQlA6IGZmZmY4ODgwMjRlMWMwMDAgUjA4OiAwMDAwMDAwMDAwMDAwMDE2IFIwOTog
ZmZmZmY1MjAwMTdjMWY0Nwo+ID4+PiBSMTA6IGZmZmZjOTAwMGJlMGZhMzcgUjExOiBmZmZmZjUy
MDAxN2MxZjQ2IFIxMjogZmZmZjg4ODA2NTQ1YTAwMAo+ID4+PiBSMTM6IDAwMDAwMDAwMDAwMDAw
MDAgUjE0OiBmZmZmODg4MDY1NDVhMDEwIFIxNTogMDAwMDAwMDAwMDAwMDAwNwo+ID4+PiBGUzog
IDAwMDA3ZmQ0NWU4NWM3MDAoMDAwMCkgR1M6ZmZmZjg4ODAyY2EwMDAwMCgwMDAwKSBrbmxHUzow
MDAwMDAwMDAwMDAwMDAwCj4gPj4+IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAw
MDAwMDAwODAwNTAwMzMKPiA+Pj4gQ1IyOiAwMDAwN2Y2NGFlZWY1M2E0IENSMzogMDAwMDAwMDA0
ZjM5YTAwMCBDUjQ6IDAwMDAwMDAwMDAzNTBlZjAKPiA+Pj4gQ2FsbCBUcmFjZToKPiA+Pj4gICA8
VEFTSz4KPiA+Pj4gICBjdHJsX2NkZXZfaW9jdGwrMHgzMDMvMHgzYTAgZHJpdmVycy9tdGQvdWJp
L2NkZXYuYzoxMDQzCj4gPgo+ID4gV2hhdCBraW5kIG9mIE1URCB5b3UgYXR0YWNoaW5nPwo+ID4g
SGFzIGl0IGVyYXNlc2l6ZSAwPwo+ID4KPgo+IFllcywgSSBhZ3JlZSB3aXRoIFJpY2hhcmQncyBw
b2ludCwgSSBndWVzcyBVQkkgZ290IGFuIG10ZCBkZXZpY2Ugd2l0aAo+IHplcm8gZXJhc2VzaXpl
Lgo+CgpUaGUga2VybmVsIGlzIGluIHFlbXUuIFdlIGZpbmQgdGhhdCB0aGUgYG10ZGAgaXMgZnJv
bQpgbXRkID0gZ2V0X210ZF9kZXZpY2UoTlVMTCwgcmVxLm10ZF9udW0pO2AgaW4gZnVuY3Rpb24g
YGN0cmxfY2Rldl9pb2N0bGAuCiBBbmQgd2UgYXJlIHN0aWxsIHRyeWluZyB0byBmaWd1cmUgb3V0
IHdoYXQgTVREIGlzLgoKPgo+ICAgNTY4IHN0YXRpYyBpbmxpbmUgdWludDMyX3QgbXRkX2Rpdl9i
eV9lYih1aW50NjRfdCBzeiwgc3RydWN0IG10ZF9pbmZvCj4gKm10ZCkKPiAgIDU2OSB7Cj4gICA1
NzAgICAgICAgICBpZiAobXRkLT5lcmFzZXNpemVfc2hpZnQpICAgICAgIC8vIGVyYXNlc2l6ZV9z
aGlmdCBpcyAwCj4gICA1NzEgICAgICAgICAgICAgICAgIHJldHVybiBzeiA+PiBtdGQtPmVyYXNl
c2l6ZV9zaGlmdDsKPiAgIDU3MiAgICAgICAgIGRvX2RpdihzeiwgbXRkLT5lcmFzZXNpemUpOyAg
ICAvLyBlcmFzZXNpemUgaXMgMCB0b28KPiAgIDU3MyAgICAgICAgIHJldHVybiBzejsKPiAgIDU3
NCB9Cj4KPiBZdSBIYW8sIGhvdyBkbyB5b3UgZmluZCB0aGUgcHJvYmxlbSwgYnkgc3l6a2FsbGVy
PyBDYW4geW91IHByb3ZpZGUgdGhlCj4gcmVwcm9kdWNpbmcgcHJvZ3JhbSBvciByZXByb2R1Y2lu
ZyBsb2c/CgpXZSBmaW5kIHRoaXMgYnkgc3l6a2FsbGVyIHdpdGggY3VzdG9taXplZCBzeXNjYWxs
IGRlc2NyaXB0aW9ucy4KVGhlcmUgaXMgbm90IGFueSByZXByb2R1Y2luZyBwcm9ncmFtIG5vdy4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
