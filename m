Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6B7CA101F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Sep 2025 08:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWv1RlN2hOOi5SawoPT26zJFjHKL1qixFJLNZTNv78g=; b=wrqmJO13vGLgo8
	EMpYBFvASVlLI3FFuFDhMg20Ygie85R62k4emsFos4onzO6U4routtG8XnzCDVaT8p6zCi6Ca4g1Y
	RF3qzRjocG8a8th6QfZTajrIvbWzcDT+chTxLXVB3YpuxzfK0ZezhtBJ4I8cDb8ekbyDaQdnJFukZ
	8vUmuhBr+6HeZQrfSjoAuE1nZAbS6YJsSI01osznnjxuiklF83i7HCUeOaE6fIQz4koZyJjPa02J/
	qO5WjZ7rv6h/gHLTb5Up6R/iYfdUQ7/Y5F1767owq4K4fzlF8CNyHtAYVBf0TJc3d/O3cYQ0bt2V4
	VdFpjdtenfOb620/Zgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwz3W-00000007tkr-1OD2;
	Fri, 12 Sep 2025 08:22:54 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwz3U-00000007tk2-0i9k
	for linux-mtd@lists.infradead.org;
	Fri, 12 Sep 2025 08:22:53 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-32b5d8bea85so1322512a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 12 Sep 2025 01:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757665371; x=1758270171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyDD7Jo0W4AdFRNe1yLtzRhoLlETra5gZPYENiy92+w=;
        b=c90pctFZ2d3PJjkezhWDBxQnrMccpkAd/IonmNA8NBF8tOLpqx9rXgh/bu1zOG3zVQ
         Jbka31PYRHjyua+A9WO7bI7jJJ9g21tYB8M0QviDb9wbhVNNM2gL3TLcIKUwKKrp5vOV
         6YG/y1wDpB1Tq91Z3MCf/CbqCsucppdtQO39sv1LR/327/9Wa2iByVwRn5SXcLaIu2IM
         bamfrxXZrXJ0XV7Wv2CZeMXg0lYe/9JURlMf0gUEZ2zgSkSRm6tJZTwIVrH4xljKjUwt
         rSqu4eTKSseBCLHYejHEQbzg7EhiK/Fq5rNpiHpfK0mzdbUeDhzNpuxDL09FqrT4K4Y/
         1K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665371; x=1758270171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyDD7Jo0W4AdFRNe1yLtzRhoLlETra5gZPYENiy92+w=;
        b=f9SBbQiIp8cWlnQRwDkoQI3vT7Ika3ONJ4cFc+DjcaPW18H4RhOxqU7hsqnN1ZFpkO
         Upf3o9ci0KTugkxZTuEXTiJZP3S4mXlUwiEhL/y/BSs6JWDJIW2/2rLg/Hu9Vf5kD3gN
         Bewhhm5L+Pdmlecyr7hH9nCEHOD7EamyJXlANT1+Vl8rRij+hL8WXazSUa/kXi04A3Se
         CLtKpKyqN5OQN4xt55+NzSHpNBW3ClYvuuA4EZBLXSosQnb9DeMLKAx37/XlWzS7EOk5
         DT22JHmmK6wkSSB5VzEW+b0Y8s1tdbCmdZFuLqHUPqUZfNR0OkA42lZYzo8uKQc8Br4K
         PO9w==
X-Forwarded-Encrypted: i=1; AJvYcCUT5EmIWqfU4njIvgVb6k7kzFBQdrRohc7iM6RHZWex4anqJNh3X5riR+VhI3Ia8RP+kI/4f7KBJ7E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYvds3trg08d/TLPFO+xyDcCQsmEXofz6P1mmOd4MiL8a7I2Kh
	+n6zNxs4DpNusfsMMU40zWwrnxSW+WvoysOdR2gfsJROO30IeptN9q1MJQV96PFCbTDarKd3fCa
	wRrgELfDhbaqUZGqUmQPcQoLudM+j6CU=
X-Gm-Gg: ASbGncsgHrDrLtjqd6Zu4J1PgsLeDttDJZhMSZ7+P8TVw2mXlYfdr+drnMj0nzFHwpt
	BKxOeLD7ssaEP9yPb6nqf1CSeMUJUM0RKwtr/hC1wEjNJocoLbqp+e3lu9veUB3SjZINTqI9Zop
	a5uYAqWu+8F65tQMVRjSfGDQvOJ7+ZHi+uzM0BuwDKr82dpPaYlJAucWVygy9WeYgXwja6ZVsOs
	R0vHp1jQXhMvO8BuAqJf4TOS+kp453OhMykZZbxnHuHrXAmPCxRFeoAzi/UCykIFnQ4gHV6dr4C
	iQxJlPSO8DaEui6m
X-Google-Smtp-Source: AGHT+IGRRn87hEmlT9BlQUhlxEPbl6k3VycuY/RrB7pBvofYdWVal2EMBRbh3UEM9B13lU5iAXJfH6w5EUP+bGrbUxU=
X-Received: by 2002:a17:90b:2802:b0:327:c583:add with SMTP id
 98e67ed59e1d1-32dd1d3b2b0mr6031421a91.6.1757665371257; Fri, 12 Sep 2025
 01:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250812051949.983040-1-linchengming884@gmail.com>
 <152133202.103367.1754981828821.JavaMail.zimbra@nod.at> <CAAyq3SaEqYiKhbjYwLH0p6F2G=UR-MwZF28AG1xVMoKhznS3Og@mail.gmail.com>
 <608935583.115196.1755171013804.JavaMail.zimbra@nod.at> <CAAyq3SZT67uwggdNX99qEc4bwSkUw2U=sCc6mon064D=f7oH=w@mail.gmail.com>
 <1899901955.27456.1757663848457.JavaMail.zimbra@nod.at> <CAAyq3SZmuTPrEb4i7QR-4Gi6YWsLFGOGm9=a0UvLR5rMLiLxsA@mail.gmail.com>
 <579487457.27484.1757664285819.JavaMail.zimbra@nod.at>
In-Reply-To: <579487457.27484.1757664285819.JavaMail.zimbra@nod.at>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 12 Sep 2025 16:19:46 +0800
X-Gm-Features: Ac12FXwvjQ1mvwEggYpp-IioBQeWdKmzQ1UXyOy3YM8CYGEnfJ-CTCA_VLOcqXU
Message-ID: <CAAyq3Sbv2uMnoqC1-jCfMwzs3pNRrDbT4UNkAtQTBKqYq8MAwA@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: skip programming unused bits in ubi headers
To: Richard Weinberger <richard@nod.at>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Alvin Zhou <alvinzhou@mxic.com.tw>, 
	leoyu <leoyu@mxic.com.tw>, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_012252_211868_2D4B889B 
X-CRM114-Status: GOOD (  12.42  )
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

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IOaWvCAyMDI1
5bm0OeaciDEy5pelIOmAseS6lCDkuIvljYg0OjA05a+r6YGT77yaCj4KPiAtLS0tLSBVcnNwcsO8
bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBWb246ICJDaGVuZyBNaW5nIExpbiIgPGxpbmNoZW5nbWlu
Zzg4NEBnbWFpbC5jb20+Cj4gPj4gVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgYW5zd2VyIQo+ID4+
IFNvLCB5ZXMgbGV0J3MgYXBwbHkgdGhpcyBjaGFuZ2UuCj4gPgo+ID4gU29ycnksIEkgbmVlZCB0
byBhZGp1c3QgdGhlIGNvZGUgYSBiaXQsIHNpbmNlIEkganVzdCBub3RpY2VkIG15Cj4gPiBjb25k
aXRpb24gb24gdmlkX2hkciBzaGlmdCB3YXMgaW5jb3JyZWN0LiBJIHdpbGwgc2VuZCBhIHYyIHZl
cnNpb24uCj4KPiBJIGV4cGVjdGVkIGFueXdheSB0aGF0IHlvdSdsbCBzZW5kIGEgbm9uLVJGQyB2
ZXJzaW9uIG9mIHRoZSBwYXRjaC4gOikKPiBKdXN0IGluIGNhc2UsIHlvdSByYW4gdWJpIHRlc3Rz
IHdpdGggdmFyaW91cyBkaWZmZXJlbnQgbmFuZHM/Cj4gbmFuZHNpbSBjYW4gaGVscC4KPiBFc3Bl
Y2lhbGx5IHdpdGggYW5kIHdpdGhvdXQgc3VicGFnZSBzdXBwb3J0LgoKSSBoYXZlIGFscmVhZHkg
cnVuIHViaS11dGlscyBzdWNoIGFzIHViaWZvcm1hdCwgdWJpYXR0YWNoLAp1Ymlta3ZvbCwgYW5k
IG1vdW50aW5nIFVCSUZTIG9uIE5BTkQgZmxhc2guCgpJIHdpbGwgYWxzbyBydW4gdWJpLXRlc3Rz
IHdpdGggbmFuZHNpbSBvbiBkaWZmZXJlbnQgTkFORHMgYmVmb3JlCnN1Ym1pdHRpbmcgdGhlIGZv
cm1hbCBwYXRjaCwgYW5kIGNvdmVyIGJvdGggY2FzZXMgeW91IG1lbnRpb25lZDogd2l0aAphbmQg
d2l0aG91dCBzdWJwYWdlIHN1cHBvcnQuCgo+Cj4gVGhhbmtzLAo+IC8vcmljaGFyZAoKVGhhbmtz
LApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
