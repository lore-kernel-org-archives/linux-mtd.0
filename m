Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D9DC76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 21:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PhO9yUB25UgGbRhIS7I1OCUL4UlHIGY7gWKUlWKT4n4=; b=obXo3p4FJ4/XGA
	JE/cyfDGdcCgSfwaD7kHmkUOYyHTTrK5LwH9+w/7YQKso/AmA+gzQNa/ABu7KaqrIeVywsv5MNMCn
	wUkC/7CNposwGhbDqCzG4/ZRYh7No1cY5P6FFTiErpPCt0JYs8JqiBPDJqIIEnqej12mMBJ6oMW/o
	W34fDhrmmtrSvBQEXKBzMHIu1AUUqOJFQUsfc5uqP4KUVXn8Yj4fAS/lQzH5pSAESa3n5Mgg3+yTW
	aXydgAzk6xFgAgF/SKNIH5VTzvyH8q25dd8a4J/NtczW4OZblimeBvz976ZoDEtjlXctLuiVd3Ptq
	F7kqd//DVdGA6GoIJAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piiiF-00BKa8-2K;
	Sat, 01 Apr 2023 21:24:39 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piiiC-00BKZY-0S
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 21:24:37 +0000
Received: by mail-ed1-x52d.google.com with SMTP id eg48so103054782edb.13
        for <linux-mtd@lists.infradead.org>; Sat, 01 Apr 2023 14:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680384274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSlpJZtoGH0EyjUwJvI+skGsiEpOoUN/Da4ZuwjaaB8=;
        b=e8GHKc18zPzavGkBCN37UNORGQtUtDXjj3c7lPwqDePjrPTkVnkkNy47ktIg1BzWSZ
         hhata/O9rQWK/EYnA63/O327mFX4bRhlgz74/JFIoO6inHUIZVfgvIMezfMogx8MvarW
         16cgXOwyIMK5kcS7S96a7VtWsenUNRnxyZje3M9eH7rSCwlNwEC79mifs4wEsyk6YbEe
         uwzgXmWm2wWGOFW20s1o08d06leblLW59O/6TXP/MOMG57bCzawCd1ho96xlCdIIoAAx
         ImVJdz/CrWpOhh3MHE5/JI2fS/RZ3HGBHRZjxiyE6jptiRftxSFz8TKMU45jBCrmG0+N
         +K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680384274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSlpJZtoGH0EyjUwJvI+skGsiEpOoUN/Da4ZuwjaaB8=;
        b=MwEBABeI1QFMIjc/vdRTbITpzeJAriJ5RyAQVrrYtYdqJR1oDgWZFLOfGWRLYGc/8C
         94rhCuMVsHNiDNqbd4Oq29IUqo3bXW0yD+PVb+OBdFG5bUGDsxXxaFJ7FPtAYaLlo5gU
         gi/wrkXkiFiCYL+1Cq6OCwlEamNdjXnLTaW+uj5+0O2qhnhPg1Z1+zt2c8NCZ2HRVogU
         5ADZz1Hkq8uw+xOjNsYFMVZjwzU2+0+aVoyTX0VX5z6xgtn4LoGflFZsP7G5pcgyPopf
         rm4d25ydwI+4uLg2Zz+XWIMlTNZHUKinL1I2W0wRJW/vh2TqYJ7Bf+fjRdIFuV9s1ohs
         M38g==
X-Gm-Message-State: AAQBX9dc9W49cGuRG6wSQuA10UUrpioUu5aqQmAeaP9itAl376NYW+el
	Og3wVjPxRBusgHvn6zffY4q1zTx5LHJnI3N0xjc=
X-Google-Smtp-Source: AKy350bUxlqE3npQu4QGQ80mpyqDm4EGdMMCc0hFf1QkoErpEM4X/r8KskWgg/z84t3kDmY5PwXgsRc0/Wyae4q4CcE=
X-Received: by 2002:a17:906:cf89:b0:932:4577:6705 with SMTP id
 um9-20020a170906cf8900b0093245776705mr16643031ejb.6.1680384273933; Sat, 01
 Apr 2023 14:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de> <20230401161938.2503204-22-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230401161938.2503204-22-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 1 Apr 2023 23:24:23 +0200
Message-ID: <CAFBinCBdNdjrQcLp1t6FNmpGn6-_PeKOefiqnk2=-gxS4bVxCA@mail.gmail.com>
Subject: Re: [PATCH 21/49] mtd: rawnand: intel: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Yang Yingliang <yangyingliang@huawei.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_142436_200424_5744E164 
X-CRM114-Status: GOOD (  12.33  )
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

T24gU2F0LCBBcHIgMSwgMjAyMyBhdCA2OjE54oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUaGUgLnJlbW92ZSgpIGNhbGxi
YWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGljaCBtYWtlcwo+IG1h
bnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJv
ciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1
ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3Vs
dHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhCj4gcXVlc3Qg
dG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3Rl
cCBvZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4KPiBUcml2aWFsbHkgY29udmVydCB0
aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2Fs
bGJhY2sgdG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpBY2tlZC1i
eTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
