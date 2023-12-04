Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0288C4167B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Dec 2023 18:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xe0FI0LN72QUhkJKjsG4MIp/7AOuM7245clXFs6c2Kc=; b=JwYj2HH3DS8Ecv
	Sy83xaVkVG6RdusCIGnDPnUFIQdREneSYmbrtffuWKlk7PW90sZsLExePAg5ZaMhWDaJZW9SLjPi4
	eDeDWyvv0WKei9Ge0+V/CeKxAz1+jJOC20Jq5oWpJQqTITnkOBb97hhg9dSSTa3NKIGUYGYT4oBY+
	mjFs1Dtcy5Mbu3V8BOfLY1XK07aNw6BG1tPOOqQ/dgQp5reiqe45HsShDhG0ZqGf3acAOqvn0BkWZ
	02NfIAIcYTxEJ5y6yN22Nps7j6aFsDJmTUFQ1Yb2hTyXc6qYZfzNspe2DVsrENFkEMPI6iBh1oGx2
	05XElUILNbvLxs9W0eKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rADwb-005Lw7-31;
	Mon, 04 Dec 2023 18:45:25 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rADwX-005Lv6-0X
	for linux-mtd@lists.infradead.org;
	Mon, 04 Dec 2023 18:45:22 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3b84e328327so2593631b6e.2
        for <linux-mtd@lists.infradead.org>; Mon, 04 Dec 2023 10:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1701715519; x=1702320319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZQ2TYb9IvGJ9cJr0Sfjf9Y5gXn8ZReq66mxvm84R40=;
        b=Mzc6Z5rX1CU6AtjaAs8Ywly2Kyh+OoEFGYtnojWEc76AzoRQYpR2gDNWPfvFNg366W
         LhlKphrVmhinfILYZSytl5wKEBmMjEPXBvf6EOKysyS1UqeFC/SVzgVjl+g5kIrUEncb
         LTGC6PwjoqUPjP9ryB7IIhljh3zhAnG0S8C/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701715519; x=1702320319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZQ2TYb9IvGJ9cJr0Sfjf9Y5gXn8ZReq66mxvm84R40=;
        b=QJJobE32+2KH0spnSzfEwKgRbZPhTVFJmdwfoDQ4ImE9f3xjif4+nwefi+GznOniAq
         23TbLXVZIWZaTiBee2zdm1tMo9OFLRLgM7LNDd8HgICNk77QkdvqLDJj8OdhkelX41Tg
         LRENWi4n6StTS9VltM77koWx8RtaGSLkr6MvOaE78rtsQVeA9gGbINTs+B1pR0F8Rmqv
         NnTTQnwhs4cTzxnPC5Vgof8YIteJsMWm9WVYzZK+xZovVmq4gRKYYMETKIcK/3Q/BsUW
         VHxr9fxhEINPM8RVXvGc2pBTuoPX7D54hxElgIvVYIAzeGKktdkfbhSOwyUPN88Zvbkw
         1IHw==
X-Gm-Message-State: AOJu0YzWYeHjiECaG1332Nm8MUOZ1WttufVHUHKy1aWLNG/SGxag4u2b
	9ft8GQkpKgxCuTSAjxo1/L2APsqgYJtmnGL+JU/MuA==
X-Google-Smtp-Source: AGHT+IHnbjrHO/ytUXfYlUiWXD4cslbd6bGpOtuhb7cSU5/xPC+ebHkZEh7zchNGOtBpv91aNZ+NztI10PyBIEXukxk=
X-Received: by 2002:a05:6808:ec8:b0:3b8:3442:8d99 with SMTP id
 q8-20020a0568080ec800b003b834428d99mr5951310oiv.20.1701715519556; Mon, 04 Dec
 2023 10:45:19 -0800 (PST)
MIME-Version: 1.0
References: <77e2f422-2a17-4235-808c-133073aefcda@moroto.mountain>
In-Reply-To: <77e2f422-2a17-4235-808c-133073aefcda@moroto.mountain>
From: David Regan <dregan@broadcom.com>
Date: Mon, 4 Dec 2023 10:45:08 -0800
Message-ID: <CAA_RMS6HDigG_42qtj1v+VOci3493n0yiQBamg8LTdoB1HYqRw@mail.gmail.com>
Subject: Re: [bug report] mtd: rawnand: brcmnand: exec_op implementation
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dregan@broadcom.com, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_104521_204781_6633225A 
X-CRM114-Status: GOOD (  11.72  )
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

T24gU3VuLCBEZWMgMywgMjAyMyBhdCAxMTo0MeKAr1BNIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBIZWxsbyBEYXZpZCBSZWdhbiwKPgo+IFRoZSBw
YXRjaCAzY2M0NzE4ZmE2NDQ6ICJtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBleGVjX29wCj4gaW1w
bGVtZW50YXRpb24iIGZyb20gTm92IDI0LCAyMDIzIChsaW51eC1uZXh0KSwgbGVhZHMgdG8gdGhl
Cj4gZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOgo+Cj4gZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYzoxNzAxIGJyY21uYW5kX3N0YXR1cygpIHdh
cm46IHNpZ25lZG5lc3MgYnVnIHJldHVybmluZyAnKC0xMTApJwo+IGRyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmM6MTcxMCBicmNtbmFuZF9yZXNldCgpIHdhcm46IHNpZ25l
ZG5lc3MgYnVnIHJldHVybmluZyAnKC0xMTApJwo+Cj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYwo+ICAgICAxNjkzIHN0YXRpYyB1OCBicmNtbmFuZF9zdGF0dXMoc3Ry
dWN0IGJyY21uYW5kX2hvc3QgKmhvc3QpCj4gICAgIDE2OTQgewo+ICAgICAxNjk1ICAgICAgICAg
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZob3N0LT5jaGlwOwo+ICAgICAxNjk2ICAgICAgICAg
c3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiAgICAgMTY5Nwo+ICAg
ICAxNjk4ICAgICAgICAgYnJjbW5hbmRfc2V0X2NtZF9hZGRyKG10ZCwgMCk7Cj4gICAgIDE2OTkg
ICAgICAgICBicmNtbmFuZF9zZW5kX2NtZChob3N0LCBDTURfU1RBVFVTX1JFQUQpOwo+ICAgICAx
NzAwCj4gLS0+IDE3MDEgICAgICAgICByZXR1cm4gYnJjbW5hbmRfd2FpdGZ1bmMoY2hpcCk7Cj4K
PiBicmNtbmFuZF93YWl0ZnVuYygpIHJldHVybnMgbmVnYXRpdmUgZXJyb3IgY29kZXMgYnV0IHdl
IHRydW5jYXRlIGl0IHRvCj4gYSB1OC4KPgo+ICAgICAxNzAyIH0KCkhpIERhbiwgdGhhbmsgeW91
IGZvciBjYXRjaGluZyB0aGlzLiBJIGhhdmUgdG8gbWFrZSBzb21lIGNoYW5nZXMgdG8KdGhpcyBm
aWxlIGFuZCB3aWxsIGFkZCBpbiBhIGZpeCBmb3IgdGhpcyBpc3N1ZS4KCj4KPiByZWdhcmRzLAo+
IGRhbiBjYXJwZW50ZXIKCi1EYXZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
