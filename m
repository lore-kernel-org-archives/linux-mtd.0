Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B264F513E9
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2026 02:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdLAqCyGqxQTObLnx8NOhVuVHF3JoWSBx0cAEzWn62E=; b=zJjx0/hkDhPMMX
	Slsk/3wIFsSlG8jNPLZ3VUt5UUYB+IoSbd5l9XhIXkguuvA61evQo9jtE+zzYGlfMFD2YmW3c7lyV
	fILP99RUZnJzBVjZe3YpGkhVf2Sk1qXloGh093MfK+0Pry/QxoAriQ4wSU4EcwpE9g6QZGKtqGf+T
	rTCl5AbEcu5NeoTemCuzS+S+3ER3mKIe9qub3X4mZXYG9BA8otC5RO2LFUmW27gYhG6ndT7zPojIA
	YTe/kSP19nn7eIcD17QnAtGPLhMw9zbAJtE60lIsEJQEvPVqey4DcPw2+z8asrwLKy8uKsJ/w76jt
	DB9hhbuPbiu+NY1GitDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLGh-00000002uhF-18Ve;
	Fri, 06 Mar 2026 02:50:23 +0000
Received: from mail-oi1-x261.google.com ([2607:f8b0:4864:20::261])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLGd-00000002ugt-3kPs
	for linux-mtd@lists.infradead.org;
	Fri, 06 Mar 2026 02:50:21 +0000
Received: by mail-oi1-x261.google.com with SMTP id 5614622812f47-45effa36208so5884327b6e.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 18:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772765419; x=1773370219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lkrKAfHLZDdprz5o7cI37Z9Id8d/uDgJJKWLIlo9M0=;
        b=q/O2qRX/UWjS6u2fx/ESOnTokAZQMsVem1aI5FoUX98fe7qjPGh9THitqpiRj2Dcn/
         BxFpbVzPrY+bzAAyAInEv7SaGLQ6UnyGd6tucg/un0MzCQN2pf5KPCl4K7EeuKLqNsa2
         BtEmtikqwGJA09hZK72hnqsfpeGdjxrPMQMwnvxfVqNPLZBfmaA2MmnxGBn//wIGdsWa
         ydCUsHT781ds8E9LQTe2tXqdOzIZA+rzOfVCHiQYLiOLLrMGCMw8JmPb28VhHrU82GHF
         KZ/HZ0nv7b9dMhAzye5aFHLrRY1c1tfi1uY9qzOY0NmpH7eKvb2RQwpH0AtiGhJket6n
         KENQ==
X-Forwarded-Encrypted: i=2; AJvYcCUxGeh0KWZTAjiFOVNeab+UD/CdRY9qHZEFwqeREHhIkHSDEWCeiLcBc6no7Woj9on4xrRuHpSPvzQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyfA1D8VbmbWDR/JSEK0ahuApzm6g3z4kY0deHl9AewlO0X4rUo
	/9GOeeBoCEBDJPC2SQq8ucXhhAHqi4ZkL2T8ZgRu9x9oTblByHwqG1GjwvWibtAP0/GD7U+xhOy
	SKBb9opbtjzblff+zzCxP1KHnLdbMQVEq2RZJaL55GDF7oWforRHLLqR2wNWFYxJ/Jmdt7h0A3M
	F1ACmtL6N2E/Z8dkliPSxas6igNKS9bfc7EqT/EiiXRkvA6Pr1OQlbGPW7rbFlNYEwdTyYqCTrs
	7t0Zfgq9SCkAIo4vjbfPg==
X-Gm-Gg: ATEYQzz7kS85TCxPN/RAdkiePB+XkIiY+oT8kPaZ6I6jONBCDiWabskTi7gpTMkqVMa
	jpZkPg0bv2cyo7/1Q+G6Pu5RGUFwU5GeuHP5xokVd5zP/d16sfwj4q4Hn5ZQt3v64BOK9Ax035T
	OS+0l1T638FZddYcKCg1mRiBvrmRXPnN5rgifsFFSQNaVPf3od/uuBlSsTHvjrsDMDadRHq9Jp1
	s7ABqqbdNv62czgEHMdBEXmhGLXS1906ACb01nPpEvAikrwg7yh5JqKqVTJZ9/IKOQh3ONCJkT0
	ydW2Md9jaJW4G4/F0q4+XamT/itwmBwVM85yrhqT0Ov9ivHP1ASYA7VngvAih3Ny9UwAIkFtZfy
	DYrbUVNVMp5E9Zg8zAIXlui5YW5EOBOpbsLVkiAZWLMtJ+3yhiqYvAFLWVc76QJtj3njc1U7HbP
	GYGWFvl/O0D3OeP8x+Wu7ReVXcxH38m21i+HwEhzTiHqwGMcHqT7xdTAr1Bw4V
X-Received: by 2002:a05:6808:50a8:b0:45a:5584:b8ec with SMTP id 5614622812f47-466dcb2cbf0mr566498b6e.32.1772765418779;
        Thu, 05 Mar 2026 18:50:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-416e686c880sm54375fac.17.2026.03.05.18.50.18
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 18:50:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7962f1424d2so139992597b3.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 18:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772765418; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5lX/JB2I1mo8IjmV1cCtzw/ycoxlT/vrF/bSp2RaYuy7XaXRiuQHoRmgA2VfEe5JV
         WQRkBKv/Ceaz2bTEHQAA7C1yrHxQWWgemQeKwS+lfEoEzoPi4Hxnx1U9ycu2Zk21z3E0
         7ZBdfdj7HkWKEnD0NxVSbK4Vr3rA57Juf2vmsgEof0ZeGU+Qj7X68lnJWS5H/sDRHNn/
         T82tJzTI5Bk+kaWNCtSn+vjf1QncoMh5/DoAPlf80j0SWsoHJ8Qzk/CzBrBJviDwHX/D
         pbwK+DCibmUxXNGLX94+oNuQth4TXscG9lbD3DZ2brkdPN9tbSHCSZ/xORNF70QCmtWF
         xnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1lkrKAfHLZDdprz5o7cI37Z9Id8d/uDgJJKWLIlo9M0=;
        fh=3KhDRYexFtGftf2+6lADfeGPyDz2MoXIB9Xk4D+wad4=;
        b=dAyWtqwzfsnrC7oS32UxyW4aNHnOESIRecbXgbyvDSVVzfUH14Nf/XlVRqLElszSHh
         rcL8E2kHwL0WuLe7O3o0N9a6vmWe8urj/VqVI6kwTUAzJEl7+GC8urmsKwerqIMCOg4k
         PDHvqZBI6Cus3QGioXMImLc3Za0E93y+aBfsUou0IQZ/2mzSD6Ohk72BKMqe2p1CQuev
         rb5BefywXXp549sXDHASY4ToVcIFQi21D9PhTcYREiZFiVwuyN2V4Ci6dzRzHhAQ8D8T
         vp5W44R78TUU6pp8j9Gj/Z62XXQsyKETuQOfogfVBmRXxM6ioSrQqEtL0wwdf556uySa
         cvuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772765418; x=1773370218; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lkrKAfHLZDdprz5o7cI37Z9Id8d/uDgJJKWLIlo9M0=;
        b=NFZ7Yue+p77pbSCWjnVcbI5sgnCgOZna29epii3fZdGxthX9R7cL7Si/7001QeaWwC
         kBqN19rHWf7KXZxl3luXMX4o5GICbDTRQDInJCRpqmE0ZnaCMJeVSJ7AU5/VyMda+OOy
         65U8Szj2fHJENQP2l7+IJRrwc0ZoK779sUla0=
X-Forwarded-Encrypted: i=1; AJvYcCUeVoORQzdXtbqe+dhJ1MNTRL+FQ+u5FTYnKxQZDOL5pAPLNgtOHmoJRF26k/+BIk82Lht8OL0kgw0=@lists.infradead.org
X-Received: by 2002:a05:690e:1c1c:b0:64a:d6fe:5e18 with SMTP id 956f58d0204a3-64d143088a4mr633265d50.64.1772765417747;
        Thu, 05 Mar 2026 18:50:17 -0800 (PST)
X-Received: by 2002:a05:690e:1c1c:b0:64a:d6fe:5e18 with SMTP id
 956f58d0204a3-64d143088a4mr633249d50.64.1772765417151; Thu, 05 Mar 2026
 18:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20260305202157.3571334-1-kamal.dasu@broadcom.com>
In-Reply-To: <20260305202157.3571334-1-kamal.dasu@broadcom.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Thu, 5 Mar 2026 18:50:06 -0800
X-Gm-Features: AaiRm53mBOpgdWekZkdYBsE-G5dz1MJ8N1DYDs0ppeVYw10wFjsTBvUhdoTQNbI
Message-ID: <CAHi4H7FxYtpaHNRDD_E3T+T5tduy17XQt=LR-XqF-pGPCH2Y4Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: skip DMA during panic write
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_185019_947630_D5956B5B 
X-CRM114-Status: GOOD (  19.31  )
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

T24gVGh1LCBNYXIgNSwgMjAyNiBhdCAxMjoyM+KAr1BNIEthbWFsIERhc3UgPGthbWFsLmRhc3VA
YnJvYWRjb20uY29tPiB3cm90ZToKPgo+IFdoZW4gb29wc19wYW5pY193cml0ZSBpcyBzZXQsIHRo
ZSBkcml2ZXIgZGlzYWJsZXMgaW50ZXJydXB0cyBhbmQKPiBzd2l0Y2hlcyB0byBQSU8gcG9sbGlu
ZyBtb2RlIGJ1dCBzdGlsbCBmYWxscyB0aHJvdWdoIGludG8gdGhlIERNQQo+IHBhdGguIERNQSBj
YW5ub3QgYmUgdXNlZCByZWxpYWJseSBpbiBwYW5pYyBjb250ZXh0LCBzbyBtYWtlIHRoZQo+IERN
QSBwYXRoIGFuIGVsc2UgYnJhbmNoIHRvIGVuc3VyZSBvbmx5IFBJTyBpcyB1c2VkIGR1cmluZyBw
YW5pYwo+IHdyaXRlcy4KPgo+IEZpeGVzOiBjMWFjMmRjMzRiNTEgKCJtdGQ6IHJhd25hbmQ6IGJy
Y21uYW5kOiBXaGVuIG9vcHMgaW4gcHJvZ3Jlc3MgdXNlIHBpbyBhbmQgaW50ZXJydXB0IHBvbGxp
bmciKQo+IFNpZ25lZC1vZmYtYnk6IEthbWFsIERhc3UgPGthbWFsLmRhc3VAYnJvYWRjb20uY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgNiAr
Ky0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IGluZGV4IDA0Mjdk
NzZmNDVkMC4uNWI5ZGFkZDU0MDVlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2JyY21uYW5kL2JyY21uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFu
ZC9icmNtbmFuZC5jCj4gQEAgLTIzNTAsMTQgKzIzNTAsMTIgQEAgc3RhdGljIGludCBicmNtbmFu
ZF93cml0ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBjdHJsLT5tYXhfb29iOyBpICs9IDQpCj4gICAgICAgICAg
ICAgICAgIG9vYl9yZWdfd3JpdGUoY3RybCwgaSwgMHhmZmZmZmZmZik7Cj4KPiAtICAgICAgIGlm
IChtdGQtPm9vcHNfcGFuaWNfd3JpdGUpCj4gKyAgICAgICBpZiAobXRkLT5vb3BzX3BhbmljX3dy
aXRlKSB7Cj4gICAgICAgICAgICAgICAgIC8qIHN3aXRjaCB0byBpbnRlcnJ1cHQgcG9sbGluZyBh
bmQgUElPIG1vZGUgKi8KPiAgICAgICAgICAgICAgICAgZGlzYWJsZV9jdHJsX2lycXMoY3RybCk7
Cj4gLQo+IC0gICAgICAgaWYgKHVzZV9kbWEoY3RybCkgJiYgKGhhc19lZHUoY3RybCkgfHwgIW9v
YikgJiYgZmxhc2hfZG1hX2J1Zl9vayhidWYpKSB7Cj4gKyAgICAgICB9IGVsc2UgaWYgKHVzZV9k
bWEoY3RybCkgJiYgKGhhc19lZHUoY3RybCkgfHwgIW9vYikgJiYgZmxhc2hfZG1hX2J1Zl9vayhi
dWYpKSB7Cj4gICAgICAgICAgICAgICAgIGlmIChjdHJsLT5kbWFfdHJhbnMoaG9zdCwgYWRkciwg
KHUzMiAqKWJ1Ziwgb29iLCBtdGQtPndyaXRlc2l6ZSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBDTURfUFJPR1JBTV9QQUdFKSkKPiAtCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0ID0gLUVJTzsKPgo+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiAtLQo+IDIu
MzQuMQo+CgpSZXZpZXdlZC1ieTogV2lsbGlhbSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNv
bS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
