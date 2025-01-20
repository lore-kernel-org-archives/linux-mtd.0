Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B44C02181
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2025 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJ9S921t0KpJAykBd24/T9OahVPYfkau0D/2D3omC8c=; b=ikmz0YcsW0h0PM
	jdjymuMxF7Y/Jb7XWsKvrZYlXnfAGwzOGdxyshxaF8OdMqJIprUqvM9EEGnbv75MX+JVQ7CBlvGx1
	HhOT5O2YmeFtBM/ncxfGjwBLEglP/PsfdM2mvVCTJQ0YBPp6z1I/7+Cf47AMESZDDcXLd1n1yx3+r
	tAmS+hND8M2irbOTSKsnNSbrKkGdM9Tz+2aBiFuf74Hnr59UDrBfvqoSiecwGZMuk02nL9fUwigg1
	ZR+z0JPuWrVlK+U/qg+erpjzaBU+BEOf7aLJheLIravoajCOEeQsayXUpVczpr5gvmosT/x7LX9gF
	NTxi4dl1FFOwLvWXXvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZpey-00000005P4r-148e;
	Mon, 20 Jan 2025 11:09:36 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZpev-00000005P4P-2Zlz
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jan 2025 11:09:34 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso7769289a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2025 03:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737371371; x=1737976171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qaj0KW7RnBiUNuAPOybcuggWXwJyvY8I3ofIIw5iYM=;
        b=Ki7XsGzEmYjzm3fO6+XGRYeCoL8lJ+jR0SFe9+iV5GH9glqxGu5Udj30/hyZNusWk+
         R8j30Hq2CNOIkcM5Ql7HTDnPVqipgUByWVPWWAGvtIyZIkIwEjoKIHJ759DyjK1fsfB4
         ws+Qb/24cTb7RX1XErV3d9te4ZPhSygK+8IG/YvT0eatRDxpdfLDsYHlIyub/fpRbYRu
         o511EnEsYwVeBB8MZu9WNhZM85eXPTMR8UixQ23+g5Hh84gFIjXqvIQ12LmyDYWVTNsb
         Dm5uUa4g02hEdM96VQ5uGhQvmxBnO0rLWu9+Llqaxens3hhTvsbEptVJI+irD2nCURet
         TALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737371371; x=1737976171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qaj0KW7RnBiUNuAPOybcuggWXwJyvY8I3ofIIw5iYM=;
        b=s8vJPgQ2UWvlfY5PWOcO279vNCqGKzrI9qqh9tQWi/arh35YHZakfcJm7TfmnXSHqJ
         yY+xEn4rKYGYQhilog4AR1gb0kyT4JcLcTws35Fcuby3JqIuzqbfdQwhNl4AE2bPlRtT
         uBp0LqdGs8kdJb08YjAIBdCl6nSUnCYAEywPO931evI/vbr08rjZ3oEh4abC80Cgnvhm
         8ghxGyN6bBlpmztAAIGP3Zy1ONllnnn2FHRRVmwXoeSKdVKySMDnNex2qZWhGECs3Oem
         a9eIR475Q/JTT51lb4oinNGHbsG7UacC36XL17z9TngLU7Bw2l/qM7HtsSQNowwxXIVh
         XkvA==
X-Forwarded-Encrypted: i=1; AJvYcCWh0XpMHOV9x5fiOilbeyk+ZwlhfCfOQ6uZGRFPqvyk+mDLSeq6KU17X6zZNicl1cAjFDTNDYHG89Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzO7axm9+ACu7L0AhIs0Ie8bx5vRDQGoYoAIO3kvX+kn+xTJJ/9
	p3EEmceP9AhzZL2YzkNlyovu6Zl4UImaSEhRc3N6DCmSo2sL2JuoHGRgooIG2oTxJTkAMDsj6JJ
	6M7ugXMebq0yOel1im2jxTW3SV+J9Ma9CFjU=
X-Gm-Gg: ASbGncs8IvR2N/itvLxNFinCVX9mCHH3WpeQ0SvpEZoBuhL+kMbOD97wdVa9QjhB0WG
	MRQZbZJtNHnERFRRHbaSDe7VC3zhak0yuCD+EcfBNucQPmvrRkfY2
X-Google-Smtp-Source: AGHT+IFJbnfGgKBEfGXBQCzGxK1VPWjSIL+apN36rihKKImCKA+pklDj58k6rqAyLQg9sn08QrTqFv72g+W3E+zQiGs=
X-Received: by 2002:a05:6402:51c9:b0:5d9:a54:f8b4 with SMTP id
 4fb4d7f45d1cf-5db7d2f88b1mr12834456a12.11.1737371371231; Mon, 20 Jan 2025
 03:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
 <20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com> <87v7ufnc0w.fsf@bootlin.com>
 <CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
 <87plkli9fj.fsf@bootlin.com> <CAJhJPsVhH=8dKmUgmTSHnG8H1_9G3zvovX9hDv_VM6fSUR5oQw@mail.gmail.com>
 <874j1tykgz.fsf@bootlin.com>
In-Reply-To: <874j1tykgz.fsf@bootlin.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 20 Jan 2025 19:08:55 +0800
X-Gm-Features: AbW1kvYiHUFMi3J9u7EmrGEj7HKTebALQhzkmIOMoS-dRqts2ieN7d_omLskrlQ
Message-ID: <CAJhJPsU1eFJ_R1-emENs8T5rrKXUKjvk-cQx9RT2ztTvmOTZug@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_030933_678847_F6D0A57E 
X-CRM114-Status: GOOD (  18.48  )
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

T24gTW9uLCBKYW4gMjAsIDIwMjUgYXQgNDoxMOKAr1BNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4KPiA+PiA+PiBEb24ndCB5b3UgbmVlZCBhIGRt
YV9hZGRyX3QgaGVyZSBpbnN0ZWFkPyBZb3Ugc2hhbGwgcmVtYXAgdGhlIHJlc291cmNlLgo+ID4+
ID4+Cj4gPj4gPiBTb3JyeSwgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kLgo+ID4+ID4gJ2RtYV9i
YXNlJyBpcyBhbHJlYWR5IG9mIHR5cGUgZG1hX2FkZHJfdC4KPiA+Pgo+ID4+IEkgZGlkbid0IGlk
ZW50aWZ5IHdoZXJlIHRoZSBkbWFfYmFzZSB3YXMgcmVtYXBwZWQsIGJ1dCBpZiB0aGF0J3MgYWxy
ZWFkeQo+ID4+IGRvbmUgdGhlbiB3ZSdyZSBnb29kLgo+ID4KPiA+IFBlcmhhcHMgSSBtaXN1bmRl
cnN0YW5kIHRoZSB1c2FnZSBvZiBkbWFfbWFwX3Jlc291cmNlKCkuIGRtYV9iYXNlIGlzCj4gPiB0
aGUgcGh5c2ljYWwgYWRkcmVzcyBhbmQgd2lsbCBiZSB3cml0dGVuIHRvIHRoZSBETUEgY29udHJv
bGxlcgo+ID4gcmVnaXN0ZXIgYXQgbGFzdC4KPgo+IElJVUMsIHllcyBhbmQgbm8uIEl0IGlzIHRo
ZSByZW1hcHBlZCBhZGRyZXNzIG9mIHRoZSBwaHlzaWNhbCBhZGRyZXNzIHlvdQo+IHdhbnQgdG8g
cmVhY2gsIG5vdCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBpdHNlbGYuIFRoZSB0eXBlIGlzIGRtYV9h
ZGRyX3QKPiBhbmQgbm90IHBoeXNfYWRkcl90IGFuZCB5b3UgY2FuIGdldCBhIGRtYSBhZGRyZXNz
IG91dCBvZiBhIHBoeXNpY2FsCj4gYWRkcmVzcyB3aXRoIGEgY2FsbCB0byBkbWFfbWFwX3Jlc291
cmNlKCkuIFRoZSBudW1lcmljYWwgdmFsdWUgbWlnaHQgYmUKPiB0aGUgc2FtZSBpZiB0aGVyZSBp
cyBubyBJTy1NTVUgaW52b2x2ZWQsIGJ1dCB0aGUgZ29vZCBwcmFjdGljZSBpcyB0bwo+IHJlbWFw
IGFueXdheS4KCkdvdCBpdC4gSSB3aWxsIGtlZXAgZG1hX21hcF9yZXNvdXJjZSgpIGFzIGl0IGlz
LCB3aGljaCBpcyBjYWxsZWQgaW4KbHMxeF9uYW5kX3Byb2JlKCkuCgorICAgICAgIHJlcyA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJuYW5kLWRt
YSIpOworICAgICAgIGhvc3QtPmRtYV9iYXNlID0gZG1hX21hcF9yZXNvdXJjZShkZXYsIHJlcy0+
c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgRE1BX0JJRElSRUNUSU9OQUwsIDApOworICAgICAgIGlmIChkbWFfbWFwcGlu
Z19lcnJvcihkZXYsIGhvc3QtPmRtYV9iYXNlKSkKKyAgICAgICAgICAgICAgIHJldHVybiAtRU5Y
SU87Cgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPgoKCi0tIApCZXN0IHJlZ2FyZHMsCgpLZWd1YW5n
IFpoYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
