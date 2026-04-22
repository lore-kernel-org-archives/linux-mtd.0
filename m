Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BD0F94CDF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2026 08:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sp1ATDnGhDBur/zvryAWo1geHiLMn7jkGUk5JL/2o4w=; b=UDVe/LFmZVDnbb
	iJdzVhk61aUP7R1bjrg7sR8dXwQLh2DMf5yuEXy/79hJH2ehHDhwHYtGNKwWUF0dCoooM7lYdVAVA
	FdPi6xT270on0BI3O1LajcVefjR+PNAxZtrXukHAHVJiwFycpdL8l6C4TwGpajbz1yJyT55rtBpyO
	+1M1pXgGVZReqw/eTwniXS88r2n9s7KM0BElD9PWDssJVNUndJvMjyZ2pwpqSY5wjk87qnd0Q/WV8
	6I0zNh/b1qD03gHBS78KYA/iiFzX/11myUkz50nlFe5YiPNcILQ/2B8eKXjXegbGbHBzQphOqYgZn
	otXQQ4w57KyVwCmUVt+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFSk7-00000009lfD-3cAM;
	Wed, 22 Apr 2026 08:15:31 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFSk6-00000009leo-13Px
	for linux-mtd@lists.infradead.org;
	Wed, 22 Apr 2026 08:15:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3614826eca4so4704601a91.1
        for <linux-mtd@lists.infradead.org>; Wed, 22 Apr 2026 01:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776845729; cv=none;
        d=google.com; s=arc-20240605;
        b=hrG8KjCTUxowMvWsN76yzznOkr0NdE5FTByrBXENVYxk/N5X2U/sV+N4U5woVI0YLt
         jdJOYsvWBd/Az9HElKBFgmR1X4+tB0jwcDOmvZ25IoFL0pFmIbt18oVOD2Y9KTbOnwS/
         FT7KRcguEHg1s1GZP4/UDYQ0Phw9nA9viF7V2ODpPhGqjDEjY/QFQetFllQQ+goIIwY9
         fD5CAvETFfGAgOowKMpUN1jsW9LVvinNbhgg28/FJmbvLFN3lB+2xfpmDeEmQdnZjjhe
         TBLaOmYcd2I5oVn6JhxQDMQ9mqoLRUqR9XpDMJ90L08oFFDk5+eWSjA0clqXRuqdnWAj
         xYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d9Svqf7nagVQGDYJm+292ujdtORxRBGZ1VO5yq6bktQ=;
        fh=W9K5O0DKlN8Oq/j/TI59w9g9zAY2pmBgz5caL3SKAOw=;
        b=Oby9QPX2Xk5ER47a56shSAhnnwxnu4qx96QrTzJPbTSwaiyaGRV462c6voHr22WSBM
         XnSuDPqQ9GTzFmySapFgkx8mqLFCXtOvUAsuu75/2Tfd/PQmkFqUnHvYiegJab38bYqp
         wYT3j7ssH1N+LfzvR0CM9Cfku3774xzWFVeJE8+2KEk1faxsLmol36R6DU9dGG2dOSJE
         aEfblikP9tfH9tUykJjuaSutf3aiiWWJLEI2JE/EKZtMHj/1qVhuZAsY+1KgSKwW3VrM
         hzWzeau75hNbTj/ky8j9h5DRIwYyCkW1Dmoez6BtOydhm/DxeTDSO4j70O2dWvbm/V95
         sBZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776845729; x=1777450529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9Svqf7nagVQGDYJm+292ujdtORxRBGZ1VO5yq6bktQ=;
        b=YQPMeA0j5aAkS3XgOpTTqomvgR+nGLNORiNHrj5O++IdA7ENtFIPz1kxbIF1ZdpIM/
         PxaCn2KuPhjlWy5pUsfL0VOq6aJD4qsBlQo8tIvhd1tG33xZxOwcW1lbpvecSjhp1Sxt
         RKcoBFoHS5QNmYm7JWNTyYBmHVe8AVskKSOiwPi/TD5FAtx4c4AslvscPV1ZZCZMDIkz
         hwcC4mwCkUXuETum4uR/U4c+PVO9sxf4Ze4D3v8OFoGbC7uvSJHWbJvgTI6scm1blz9k
         5owq0z4o6+a2YyY/lbDPGmBKwsYZPksOclKav6VbQl+pph0Jn/Oy5XwZSAJHbDDBnFr3
         6g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845729; x=1777450529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9Svqf7nagVQGDYJm+292ujdtORxRBGZ1VO5yq6bktQ=;
        b=bo74pebUE4pSpoFiK+3jj47tqDorpyBlXsk7/CAKMhYhQ5EHC1ADoEKWUBG57532CY
         bnztMujnbL1bdLXz70PRf27hU5uOieI2WOonwNJCahS3lz/kiW53a239spIulrjvvDOU
         UwBmNmddcsuR8vE1z0KPFgSwZDJXEj0XjcfMw7v9HNbkLYFmAOc5+xcHlzlClMNSV9dO
         T1zTiaydy4OZGjzz/qebP+YY86D4lgyzb1k9DrIVFNfz709rA6JWpLZv7m9LJT/lpy20
         4KNbh68zFqSnhCi6/ygX7a3AYJ6f9PdLRjASRTy+iqC+LbHOXweQsi3IGxqcFYU9DLtg
         CAMw==
X-Forwarded-Encrypted: i=1; AFNElJ/SL4G5e9E1Mhw37OjNgmAcCswSJwdf4PuQ+sLIckqW5gLZboK10/FOvH/jFuIUGZ27PHGFgmCZF0I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfH9SxToorAKVP0NzOvLks72cfG+P0X9xdAWy8Z1cM5GukpUi6
	aOOPG8dOucIh3apxEOmZSC+scDT+qLAIG6yMFsVV68jb7V59bbGOfkswmnQOqueYeq4WgsByYkl
	gBEPEuPV/wtffAkAn9MSZYfb8KROucfc=
X-Gm-Gg: AeBDiesmp0AMetrhGV5a8dmkGw4M+vIXAbpN6zf+jwPWLzmO56DKySj+C82E+lbL+Df
	Zhv3JvjYshHxMNUN7DJe+KQjD16FlU1GaJ7dIDXJshS0a5gT7ho/x3Flk9tZmpiaBfrndTUbls8
	3J4trpIfQ3q660soSm4NdPNNL7zr/qBeezLzKRnqAxGxDdDNlS+eJO0KKJ1s/calZXKLYtskvn3
	Inlpa2txSmL0hs+XTahZs/Xf3YT9Bi/ueRTGF5m1nxdANdHs8yauvhHLbwFfg+Ae+rJs4MlFsrV
	gtonwQqP2MVNCCJegg==
X-Received: by 2002:a17:90b:2fc4:b0:35f:b6d3:da7d with SMTP id
 98e67ed59e1d1-361404635e6mr20506309a91.17.1776845729036; Wed, 22 Apr 2026
 01:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260422070203.698716-1-linchengming884@gmail.com>
 <20260422070203.698716-3-linchengming884@gmail.com> <87a4uv5set.fsf@bootlin.com>
In-Reply-To: <87a4uv5set.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Wed, 22 Apr 2026 16:14:26 +0800
X-Gm-Features: AQROBzCXDwT8wfI3IxhKZWv7FK4oUhFYcEJUA7pBhDvdYOh76PDtet4MkYQV5Ps
Message-ID: <CAAyq3SYZdeWhtAbrp6HuQPLdsHEwvXUAFn2BAiD6YmE9FuZyPQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] mtd: spi-nand: Add support for randomizer
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_011530_295503_729AB317 
X-CRM114-Status: GOOD (  13.65  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjblubQ05pyIMjLml6XpgLHkuIkg5LiL5Y2INDowOOWvq+mBk++8mgo+Cj4gSGkgQ2hlbmcg
TWluZywKPgo+ID4gK3N0YXRpYyBpbnQgc3BpbmFuZF9yYW5kb21pemVyX2luaXQoc3RydWN0IHNw
aW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnAgPSBzcGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2Lm9mX25vZGU7Cj4gPiArICAgICB1MzIg
cmFuZF92YWw7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgaWYgKCFzcGluYW5k
LT5zZXRfcmFuZG9taXplcikKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArCj4gPiAr
ICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgIm5hbmQtcmFuZG9taXplciIsICZy
YW5kX3ZhbCk7Cj4gPiArICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsK
PiA+ICsKPiA+ICsgICAgIHJldHVybiBzcGluYW5kLT5zZXRfcmFuZG9taXplcihzcGluYW5kLCBy
YW5kX3ZhbCA9PSAxKTsKPgo+IFlvdSBkbyBub3QgbmVlZCB0aGUgIj09IDEiIHBhcnQuIHJhbmRf
dmFsIGlzIGNhc3QgaW50byBhIGJvb2xlYW4sIHNvIGFueQo+IG5vbiB6ZXJvIHZhbHVlIHdpbGwg
YmUgdGFrZW4gdW5kZXJzdG9vZCBhcyBhbiAiZW5hYmxlIiBhbmQgemVybyB3aWxsIGJlCj4gdHJl
YXRlZCBhcyAiZGlzYWJsZSIsIHdoaWNoIGlzIGZpbmUuCgpHb3QgaXQsIHRoYW5rcyBmb3IgdGhl
IHRpcC4gSSB3aWxsIGRyb3AgdGhlICI9PSAxIiBwYXJ0IGFuZCByZWx5IG9uIHRoZQppbXBsaWNp
dCBib29sZWFuIGNhc3QgaW4gdGhlIG5leHQgdmVyc2lvbi4KClNpbmNlIHRoZSByZXN0IG9mIHRo
ZSBwYXRjaCBsb29rcyBmaW5lIHRvIHlvdSwgSSB3aWxsIHdhaXQgZm9yIHRoZSBEZXZpY2UKVHJl
ZSBtYWludGFpbmVycycgZmVlZGJhY2sgb24gdGhlIGR0LWJpbmRpbmcgcGF0Y2ggKFBhdGNoIDEv
MykgYmVmb3JlCnNwaW5uaW5nIHYxMCB0byBhdm9pZCBzcGFtbWluZyB0aGUgbGlzdC4KCj4KPiBU
aGUgcmVzdCBsb29rcyBmaW5lLgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcywKQ2hlbmcg
TWluZyBMaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
