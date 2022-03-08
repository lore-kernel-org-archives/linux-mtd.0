Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DD5C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Mar 2022 01:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9JzKrg18DqDPmaF8gCJo8Cd8t1EXhhmqTi416eGL84=; b=vNspWAhvEVDZFf
	uieYLjUsyiOjEtInWk4nbQ7GG0wxJCl5R/YQ9InrfmtPLIL1jO2W9o3RrmKMRu+hlnvQTDFbWatvL
	nqGYjcBxH+4ZOh38xNQ5GQURQGM/LX9Pao2Yjri1+FelRK2xEkjpCQzS1LxYevzlv9jEwUfb3mFGS
	s59xJb3dPLXXouJL8NFou3Dc95w34SeObXFPj54w244P8mDVsC3kalbZyfHdgmiFRpwKy7pkItBUK
	ZKHddGJ7jmpbLTcWszLIZmZwKRdkiDw/QbYCM7xpcYV1AO8BMjhywZXpu/462nLFtO52j2h4kvDxG
	36wiRk75AMvNdELWTiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nROhX-002KIc-Bb; Tue, 08 Mar 2022 01:31:47 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nROhU-002KHK-FH
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2022 01:31:46 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id 127so7356215vsd.2
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2022 17:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EHe5exU6WyiiHZZKMzip/0kvgNRT/vCL4TtPXUk9M+E=;
 b=DaHOocbMvlOvDoeDlncUrzHANnuqYr5toPwnA80bXZ1HiTZupxoMwXbyIgQaosvUrq
 nifov7rIgPZZhoBjcPEgiPx3z4BrTbnMKDjmsTxmrzl8y700OHRR3Abxk8V1svosDRmB
 Fbcd3f296Vv+XZhLvnZSWo9mK4ogGMNJh6nr7ASCg4Gv+mzJC/9tj0bB1D/8LSAIXAlV
 rOIqF8pvlJGXlW9ZnAUAkFYJv4RonDfmafhEhSOvXvEzfOXmipMikuH0ok4jN870N3Jo
 gTOrILVlu5hDBLlXwPNbA5pisYhplyhZE3y009kEn9XsLED4ovaB3oe18/xiS8wZl88T
 63nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EHe5exU6WyiiHZZKMzip/0kvgNRT/vCL4TtPXUk9M+E=;
 b=fazJehHmFrGFxtOt3hfFjYFfoX8OvdnExLAOr7p7miuRbKIobR8B1wtxQbqYDcH7ue
 K689GnHnf1K2tLTITKyVg+/79ADr6Rg2/0M/9VPmqm0WaLGnLIYNlbSsRj3w3a/CxHZN
 8AeaaG7WvohfaLf7qeErE+5jxiy0Xwr6vP+Q+z/WQzf//Cno/5Lfc6o3Kjxzj5Kgd/dy
 E0ksxBXOwR3RIqngnCV5GygiwhXhWysn1mKEvO1f1+NmmyAKTkBVZH1ebh/bbawc7XDf
 W3rf74iwYVNeWWhMmPxPRHNs4AEh5+snZ9gLBJiED8q0rQm2tYyf3oGFKO10ybUc00qt
 90EA==
X-Gm-Message-State: AOAM533w5OWIcHEVqRelVWv/rpIEoXgUtIahOJEXHP/qGRRdZBf1QYy+
 i0ekOuHMBwNfaPf2UJUVLB/z3wonE7ffHLeWZE4=
X-Google-Smtp-Source: ABdhPJyG8DC8zjhnFr0/zaZigfc5Py8l5DqGWlPmcfgTAeGDDUIFJR2hLJXuGckS/sVa2S5ec5pRynmiKz7j8SAnxnA=
X-Received: by 2002:a67:e0cc:0:b0:31b:d7bf:8403 with SMTP id
 m12-20020a67e0cc000000b0031bd7bf8403mr5587882vsl.61.1646703103097; Mon, 07
 Mar 2022 17:31:43 -0800 (PST)
MIME-Version: 1.0
References: <7bc0ee19-2943-3503-046e-130de73a2cdf@gmail.com>
In-Reply-To: <7bc0ee19-2943-3503-046e-130de73a2cdf@gmail.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Tue, 8 Mar 2022 04:31:53 +0300
Message-ID: <CAHNKnsT3p06jU_FV4Rf7Wvud_YOZZb4gP313Z-iGE0tae3PDPA@mail.gmail.com>
Subject: Re: ubifs: handling dirty data (writing back) + power cuts
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_173144_549476_AC74DF81 
X-CRM114-Status: GOOD (  19.61  )
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

SGVsbG8gUmFmYcWCLAoKT24gRnJpLCBGZWIgMjUsIDIwMjIgYXQgNToyNiBQTSBSYWZhxYIgTWnF
gmVja2kgPHphamVjNUBnbWFpbC5jb20+IHdyb3RlOgo+IG15IHN5c3RlbSBpcyBzZXR1cCBhcyBm
b2xsb3dzOgo+Cj4gIyBtb3VudCB8IGdyZXAgdWJpZnMKPiAvZGV2L3ViaTBfMSBvbiAvbW91bnQv
dWJpZnMgdHlwZSB1YmlmcyAocncsbm9hdGltZSxhc3NlcnQ9cmVhZC1vbmx5LHViaT0wLHZvbD0x
KQo+Cj4gIyBjYXQgL3Byb2Mvc3lzL3ZtL2RpcnR5X3dyaXRlYmFja19jZW50aXNlY3MKPiA1MDAK
PiAjIGNhdCAvcHJvYy9zeXMvdm0vZGlydHlfZXhwaXJlX2NlbnRpc2Vjcwo+IDMwMDAKPgo+ICg1
IHMgYW5kIDMwIHMgcmVzcGVjdGl2ZWx5KSBhbmQgSSdtIGN1cnJlbnRseSBkZWJ1Z2dpbmcgc29t
ZSBkYXRhIGlzc3Vlcwo+IHJlbGF0ZWQgdG8gcG93ZXIgY3V0cy4KPgo+Cj4gTXkgYWN0dWFsIHBy
b2JsZW0gaXMgcmVsYXRlZCB0byB1YmlmcyBiZWhhdmlvdXIgZm9yIHBvd2VyIGN1dHMgaGFwcGVu
aW5nCj4gYmV0d2VlbiA1IGFuZCAzNSBzZWNvbmRzIGFmdGVyIHNhdmluZyBhIGZpbGU6Cj4gZGF0
ZSA+IC9tb3VudC91Ymlmcy90ZXN0LnR4dCAmJiBzbGVlcCAxNSAmJiBlY2hvIENVVCBQT1dFUiAq
Tk9XKgo+Cj4gT24gdGhlIG5leHQgYm9vdCB0ZXN0LnR4dCBleGlzdHMgYnV0IGl0J3MgRU1QVFkg
KGZpbGUgc2l6ZSAwKS4KPgo+IEZvciBuZXdseSBjcmVhdGVkIGZpbGVzIGFib3ZlIGJlaGF2aW91
ciBpcyBub3QgdGhlIHdvcnN0IG9uZSAtIGhvd2V2ZXIKPiBJJ2QgZXhwZWN0IHN1Y2ggZmlsZSB0
byBub3QgZXhpc3QgYXQgYWxsLgo+Cj4gVGhlIGJpZ2dlc3QgcHJvYmxlbSBpcyB3aGVuIGRlYWxp
bmcgd2l0aCBleGlzdGluZyBmaWxlcy4gSW4gc3VjaCBjYXNlCj4gcG93ZXIgY3V0IG1lYW5zIGxv
b3NpbmcgaXQgY29tcGxldGVseS4gSSBkb24ndCBnZXQgKm9sZCogY29udGVudCBub3IKPiAqbmV3
KiBjb250ZW50Lgo+Cj4KPiBJIG5vdGljZWQgdGhpcyBiZWhhdmlvdXIgd2l0aCBrZXJuZWwgNS4x
MCBhbmQgYWxzbyByZXByb2R1Y2VkIGl0IHdpdGgKPiA1LjQsIDQuMTQgYW5kIDQuNC4KPgo+IElz
IHRoaXMgYSBidWcgb3Igc29tZSBxdWlya3kgZmVhdHVyZT8gQ2FuIEkgZG8gYW55dGhpbmcgdG8g
YXZvaWQgc3VjaAo+IHNpdHVhdGlvbnMgZXhjZXB0IG1vZGlmeWluZyBhbGwgdXNlciBzcGFjZSB0
byBjYWxsIGZzeW5jKCkgd2hlbiBuZWVkZWQ/CgpJIGV4cGVyaWVuY2VkIGEgc2ltaWxhciBpc3N1
ZSB3aXRoIEYyRlMgb24gYSB4ODYgYm9hcmQgb24gZmlyc3QgYm9vdAphZnRlciBzeXN1cGdyYWRl
LiBJZiB0aGUgcG93ZXIgbG9zcyBoYXBwZW5zIHdpdGhpbiBzb21lIHRpbWUgd2luZG93LAp0aGVu
IGFsbCBvbGQgY29uZmlndXJhdGlvbiBmaWxlcyB0aGF0IHdlcmUgZXh0cmFjdGVkIGZyb20gdGhl
CnN5c3VwZ3JhZGUudGFyIGFyY2hpdmUgYmVjb21lIGVtcHR5LiBXaGljaCBlZmZlY3RpdmVseSBt
YWtlcyB0aGUKZGV2aWNlIGluYWNjZXNzaWJsZSB2aWEgdGhlIG5ldHdvcmsuCgpUaGUgYmVzdCB0
aGluZyBJIGNvdWxkIGNvbWUgdXAgd2l0aCBpbiB0aGF0IHNpdHVhdGlvbiBpcyB0byBzeW5jIEZT
Cmp1c3QgYWZ0ZXIgdGhlIHN5c3VwZ3JhZGUudGFyIGFyY2hpdmUgZXh0cmFjdGlvbiwgc2VlIDg4
MGMxZjAzMzYKKCJiYXNlLWZpbGVzOiBwcmV2ZW50IGlzc3VlcyB3LyBvdmVybGF5IG9uIHBvd2Vy
bG9zcyBhZnRlcgpzeXN1cGdyYWRlIikuIEFuZCBhY2NvcmRpbmcgdG8gdGhlIGRvY3VtZW50YXRp
b24gUmljaGFyZCBwb2ludGVkIG91dCwKdGhpcyBpcyB0aGUgb25seSBzb2x1dGlvbiBmcm9tIHRo
ZSBmaWxlc3lzdGVtIGRldmVsb3BlcnMgcG9pbnQgb2YgdmlldwotIGh0dHA6Ly93d3cubGludXgt
bXRkLmluZnJhZGVhZC5vcmcvZG9jL3ViaWZzLmh0bWwjTF9zeW5jX2V4Y2VwdGlvbnMKCi0tClNl
cmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
