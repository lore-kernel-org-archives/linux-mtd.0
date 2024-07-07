Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A511AC30653
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jul 2024 08:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSFPPSVxEOCPRY6qIgAMkCFUhvBlMvOdjoVntZRKGdk=; b=BRdk4UcYmZ+L0U
	kcbbr8hA6F2PSC9l1kAD+gPgZPnWNaWNeHmh3i9gjTsG7h2SK9+3SSkFDZTgigRxoddGMAeHgSOo4
	WFJ73Ryzt0aDI6ekpH7x0Sz84pKclMDYSr4aWhA2yVyLrEvUOguftQUgdXRUXxttZMkCaAh9TnPCC
	asCQez/+xRVhVdettN5b+aiKTeicpJboxF+ms7tSmKrGgRlVk8Ph82JQp0b6bTmmVKJ4ms+hxJS3+
	PLZImsInxf1SKBXodc/FNIaNTh/+98Qm/cwj32iYa+cQhKLmXdymBOv2CA2HShftxf0Uah/ypn7Lc
	M5Zhtlgv8eQjWR8s+3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQN0T-00000001WME-1IaK;
	Sun, 07 Jul 2024 08:12:25 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQN0P-00000001WLg-3bje
	for linux-mtd@lists.infradead.org;
	Sun, 07 Jul 2024 08:12:23 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5c66f5659edso285354eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 07 Jul 2024 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720339940; x=1720944740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFpie4PTNsoMWbDRDvwqxE8zyMFGx2b17ygGgwi8cRE=;
        b=TKidvnk9gEDgFNk6HTb9hTyfyKG1jfd7FKJosXIjA5LiMDUMAGa6qt/PLMSCnmzT/M
         smFk8XlWx/yF0l6wf278+5cygSzK9n7iIWAwZZstFPfTms6TTpeUfymyVacw3ph0c+fX
         Eu3qkaEgb+DpGfgYFCJmfAYn3pqWWKnCkzxfpV16ILAt0ybbx28m6UxR2foLlVZ0njok
         48hTaWQ7fayzGB7OuCh5eby5YBt9KyHS0hxVNA9hrYvbP+HJFHNFtQ15XtlGsot5av5h
         pIFVuLNKqZXbzqnHqAxpOUMm+iPjcIEAW6do1NT6E8JtrRrL315xrVcCqG9nlefwYKuk
         Tn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720339940; x=1720944740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFpie4PTNsoMWbDRDvwqxE8zyMFGx2b17ygGgwi8cRE=;
        b=dBKW66K1pqungEXWI97p9EiNqiNM/SN/niyUz0NpQjeGsXnwz2+xeuu4NZA4J6Pj7U
         PfHJ1Bgzr6GkREUERVPpPPdmdqSkaym74Ktm1pzwNEaxjHYu//pJLvC0pH1SRpaGjSCv
         K3D/FoMvu18T7lOoCbDo2XZYIWE4JCpaTgjWRGu3zTX/jeymypf2k3A1Grp1KgIXnD1k
         vKf1rDIonJ7aRafGwb2eoYYWaW9OofR5yLSerlvoyWXK3oLkbahmu7CpULAHFWRAkzZo
         KJkjT58dUiw0MOQziQ8V+bzQ+XdKpbd9CblHCCDiKJxoAecetBZ2HPI6xFn14t+DuaC6
         Cc1w==
X-Forwarded-Encrypted: i=1; AJvYcCVsDrNEMQ/YUwbdjAjlJFF4vAS4UNruvG7AU+WxSKbFc57Xh5+E2KsmyhJ+Xdk5on19pHaAvEgyH+KFETw9iXaKZSpApubeoPgcojtbEA==
X-Gm-Message-State: AOJu0Ywl7bv8JRvwlYJlio/mQb1yImb1QDa29JWGQrI75m3A2/vaoUrJ
	W7eUlS/1pI8pKzOYVImUbflmsj4dXChceI3vQmmjbQiqHu4NLPIi+WWm5Fzq7/4fH+6bTUN2+MB
	FOiJQcSi76vd1zH6OVaFVfmE0oc8=
X-Google-Smtp-Source: AGHT+IFY+L7sQOal4yf8wQbrG6IrzX1JOhyjrhHWxI/zVy0m7b5kst5TDs2RFEk+QYiIqaMDsAtImgmTAuC96RJpsqA=
X-Received: by 2002:a05:6358:5929:b0:1aa:b7d7:2227 with SMTP id
 e5c5f4694b2df-1aab7d72faemr262383355d.6.1720339939758; Sun, 07 Jul 2024
 01:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <47e0483d-6e3d-43a8-9273-25278a4a74b9@gmail.com> <0c095098-4b3e-481b-b866-29cacb9f165d@milecki.pl>
In-Reply-To: <0c095098-4b3e-481b-b866-29cacb9f165d@milecki.pl>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 7 Jul 2024 10:12:08 +0200
Message-ID: <CAOiHx=nmcf1mRy_i9vUDNtqOZTQ=PFWY8MGEV1FZfgt=GHqj5A@mail.gmail.com>
Subject: Re: [PROBLEM linux-next]
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Mirsad Todorovac <mtodorovac69@gmail.com>, linux-mtd@lists.infradead.org, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_011221_941657_ECD46433 
X-CRM114-Status: GOOD (  18.77  )
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

T24gU3VuLCA3IEp1bCAyMDI0IGF0IDA5OjM4LCBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+IHdyb3RlOgo+Cj4gU29tZSBtb3JlIGRlc2NyaXB0aXZlIHN1YmplY3Qgd291bGQgYmUg
bmljZSA6KQo+Cj4KPiBPbiA3LjA3LjIwMjQgMDI6MTAsIE1pcnNhZCBUb2Rvcm92YWMgd3JvdGU6
Cj4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2FzbS1nZW5lcmljL2J1Zy5oOjIy
LAo+ID4gICAgICAgICAgICAgICAgICAgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5o
Ojg3LAo+ID4gICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvYnVnLmg6NSwK
PiA+ICAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2ZvcnRpZnktc3RyaW5n
Lmg6NiwKPiA+ICAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3N0cmluZy5o
OjM3NCwKPiA+ICAgICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9w
YWdlXzMyLmg6MTgsCj4gPiAgICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVk
ZS9hc20vcGFnZS5oOjE0LAo+ID4gICAgICAgICAgICAgICAgICAgZnJvbSAuL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3Byb2Nlc3Nvci5oOjIwLAo+ID4gICAgICAgICAgICAgICAgICAgZnJvbSAuL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3RpbWV4Lmg6NSwKPiA+ICAgICAgICAgICAgICAgICAgIGZyb20g
Li9pbmNsdWRlL2xpbnV4L3RpbWV4Lmg6NjcsCj4gPiAgICAgICAgICAgICAgICAgICBmcm9tIC4v
aW5jbHVkZS9saW51eC90aW1lMzIuaDoxMywKPiA+ICAgICAgICAgICAgICAgICAgIGZyb20gLi9p
bmNsdWRlL2xpbnV4L3RpbWUuaDo2MCwKPiA+ICAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNs
dWRlL2xpbnV4L3N0YXQuaDoxOSwKPiA+ICAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRl
L2xpbnV4L21vZHVsZS5oOjEzLAo+ID4gICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL210
ZC9tdGRwYXJ0LmM6MTA6Cj4gPiBkcml2ZXJzL210ZC9tdGRwYXJ0LmM6IEluIGZ1bmN0aW9uIOKA
mHBhcnNlX210ZF9wYXJ0aXRpb25z4oCZOgo+ID4gZHJpdmVycy9tdGQvbXRkcGFydC5jOjY5Mzoz
NDogZXJyb3I6IOKAmCVz4oCZIGRpcmVjdGl2ZSBhcmd1bWVudCBpcyBudWxsIFstV2Vycm9yPWZv
cm1hdC1vdmVyZmxvdz1dCj4gPiAgICA2OTMgfCAgICAgICAgICAgICAgICAgICAgICAgICBwcl9k
ZWJ1ZygiJXM6IGdvdCBwYXJzZXIgJXNcbiIsIG1hc3Rlci0+bmFtZSwKPiA+ICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4g
Li9pbmNsdWRlL2xpbnV4L3ByaW50ay5oOjM3NjoyMTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBt
YWNybyDigJhwcl9mbXTigJkKPiA+ICAgIDM3NiB8ICNkZWZpbmUgcHJfZm10KGZtdCkgZm10Cj4g
PiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF5+fgo+ID4gLi9pbmNsdWRlL2xpbnV4L2R5
bmFtaWNfZGVidWcuaDoyNDg6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9fZHlu
YW1pY19mdW5jX2NhbGxfY2xz4oCZCj4gPiAgICAyNDggfCAgICAgICAgIF9fZHluYW1pY19mdW5j
X2NhbGxfY2xzKF9fVU5JUVVFX0lEKGRkZWJ1ZyksIGNscywgZm10LCBmdW5jLCAjI19fVkFfQVJH
U19fKQo+ID4gICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gLi9p
bmNsdWRlL2xpbnV4L2R5bmFtaWNfZGVidWcuaDoyNTA6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvIOKAmF9keW5hbWljX2Z1bmNfY2FsbF9jbHPigJkKPiA+ICAgIDI1MCB8ICAgICAgICAg
X2R5bmFtaWNfZnVuY19jYWxsX2NscyhfRFBSSU5US19DTEFTU19ERkxULCBmbXQsIGZ1bmMsICMj
X19WQV9BUkdTX18pCj4gPiAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
PiA+IC4vaW5jbHVkZS9saW51eC9keW5hbWljX2RlYnVnLmg6MjY5Ojk6IG5vdGU6IGluIGV4cGFu
c2lvbiBvZiBtYWNybyDigJhfZHluYW1pY19mdW5jX2NhbGzigJkKPiA+ICAgIDI2OSB8ICAgICAg
ICAgX2R5bmFtaWNfZnVuY19jYWxsKGZtdCwgX19keW5hbWljX3ByX2RlYnVnLCAgICAgICAgICAg
ICBcCj4gPiAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gLi9pbmNsdWRl
L2xpbnV4L3ByaW50ay5oOjYxMDo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYZHlu
YW1pY19wcl9kZWJ1Z+KAmQo+ID4gICAgNjEwIHwgICAgICAgICBkeW5hbWljX3ByX2RlYnVnKGZt
dCwgIyNfX1ZBX0FSR1NfXykKPiA+ICAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgo+
ID4gZHJpdmVycy9tdGQvbXRkcGFydC5jOjY5MzoyNTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvIOKAmHByX2RlYnVn4oCZCj4gPiAgICA2OTMgfCAgICAgICAgICAgICAgICAgICAgICAgICBw
cl9kZWJ1ZygiJXM6IGdvdCBwYXJzZXIgJXNcbiIsIG1hc3Rlci0+bmFtZSwKPiA+ICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+Cj4gPiBkcml2ZXJzL210ZC9tdGRwYXJ0
LmM6NjkzOjUwOiBub3RlOiBmb3JtYXQgc3RyaW5nIGlzIGRlZmluZWQgaGVyZQo+ID4gICAgNjkz
IHwgICAgICAgICAgICAgICAgICAgICAgICAgcHJfZGVidWcoIiVzOiBnb3QgcGFyc2VyICVzXG4i
LCBtYXN0ZXItPm5hbWUsCj4gPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn4KPiA+Cj4gPiBPZmZlbmRpbmcgY29tbWl0IGlzIDViNjQ0
YWEwMTJmNjcuCj4KPiBBY3R1YWxseSBpdCBnb2VzIGJhY2sgdG8gMjAxNSB0byB0aGUgY29tbWl0
IDhlMmM5OTJiNTlmYyAoIm10ZDogbXRkcGFydDogYWRkIGRlYnVnIHByaW50cyB0byBwYXJ0aXRp
b24gcGFyc2VyLiIpLgo+Cj4KPiA+IFByb3Bvc2VkIG5vbi1pbnRydXNpdmUgZml4IHJlc29sdmVz
IHRoZSB3YXJuaW5nL2Vycm9yLCBidXQgSSBjb3VsZCBub3QgdGVzdCB0aGUgY29kZS4KPiA+IChJ
IGRvbid0IGhhdmUgdGhlIHBoeXNpY2FsIGRldmljZS4pCj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0t
LS0+PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+ID4g
aW5kZXggNjgxMWE3MTQzNDlkLi44MTY2NWQ2N2VkMmQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L210ZC9tdGRwYXJ0LmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+ID4gQEAgLTY5
MSw3ICs2OTEsNyBAQCBpbnQgcGFyc2VfbXRkX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICpt
YXN0ZXIsIGNvbnN0IGNoYXIgKmNvbnN0ICp0eXBlcywKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoIXBhcnNlciAmJiAhcmVxdWVzdF9tb2R1bGUoIiVzIiwgKnR5cGVzKSkKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhcnNlciA9IG10ZF9wYXJ0X3BhcnNlcl9n
ZXQoKnR5cGVzKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBwcl9kZWJ1ZygiJXM6IGdv
dCBwYXJzZXIgJXNcbiIsIG1hc3Rlci0+bmFtZSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFyc2VyID8gcGFyc2VyLT5uYW1lIDogTlVMTCk7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhcnNlciA/IHBhcnNlci0+bmFtZSA6ICIobnVsbCIpKTsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXBhcnNlcikKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IG10ZF9wYXJ0X2RvX3BhcnNlKHBhcnNlciwgbWFzdGVyLCAmcHBhcnRzLCBkYXRhKTsK
PiA+Cj4gPgo+ID4gSG9wZSB0aGlzIGhlbHBzLgo+Cj4gSSdkIHNheSBpdCdzIHNpbXBsZSBlbm91
Z2ggdG8gc2VuZCBwYXRjaCB3aXRob3V0IGFjdHVhbCBodyB0ZXN0aW5nLgoKVGhvdWdoIHRoZSBr
ZXJuZWwncyB2c3ByaW50ZiB3aWxsIGFscmVhZHkgaGFuZGxlIE5VTEwgcG9pbnRlcnMgYW5kCnBy
aW50ICIobnVsbCkiIFsxXSwgc28gSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgYW4gYWN0dWFsIGlt
cHJvdmVtZW50LgoKVGhlIG9ubHkgd2F5IHRoaXMgY2FuIGJlIE5VTEwgdGhvdWdoIGlzIGlmIHRo
ZSByZXF1ZXN0X21vZHVsZSgpCmZhaWxlZCwgc28gbWF5YmUgYSBwcm9wZXIgZXJyb3IgbWVzc2Fn
ZSB3b3VsZCBiZSBiZXR0ZXIgaGVyZSBpbnN0ZWFkCm9mIGFuIG9ic2N1cmUgImdvdCBwYXJzZXIg
KG51bGwpIi4gWW91IGRvbid0IGV2ZW4ga25vdyB3aGljaCB0eXBlCndhc24ndCBhdmFpbGFibGUu
IEUuZy4gcHJfZGVidWcoIiU6IG5vIHBhcnNlciBmb3IgdHlwZSAlcwphdmFpbGFibGVcbiIsIG1h
c3Rlci0+bmFtZSwgKnR5cGVzKS4KClsxXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL2xpYi92c3ByaW50Zi5jI0w2OTYKCkJlc3QgUmVnYXJkcywKSm9uYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
