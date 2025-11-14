Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BF8CE7A8B
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdvUB1Gbto9cWcdkf2UVVwDxSi2hTtYYvUqnZeOVSrU=; b=MixNBQUQn9hNEA
	qHADt0MqLZLtWqHALVwmzHqCkQH6Oo+8kIYN//rZHfhF9U9me+VzimRR3IV+Q29QIXs6bFUzpQBzB
	ZJVUXnwfLPyEqPGwpc0sdF9pJVGAfdZt/WanZAYBBuIXLrC9ygc1lj1OnKsrxPxZF5rluJRHb5N7i
	ZZ8ztetAW8zWYt4KiNnoi5IKTahUQXGW4rKmvfQW+mJs2nT4tSTTSoodpc1ohOKPHnkztlzgkhk9n
	x2VbJ24H65PrZEoqaqb3MhmCBztvcYC5vNoXvX41tIHwDNLeoLNd6k6l9xT1gn4S3qPTibQ7KRvaj
	Lo8nAF1pvYwER2xQHQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpXq-0000000Bq3a-434T;
	Fri, 14 Nov 2025 08:52:38 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpXo-0000000Bq2y-06Mv
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 08:52:37 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3437c093ef5so1688867a91.0
        for <linux-mtd@lists.infradead.org>; Fri, 14 Nov 2025 00:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763110355; x=1763715155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnnEYE+yQ8I3RIpj8JDmL7nizJ705zFf+GEnbfelK00=;
        b=AbJdKs/+0eBsoQQ9X6FeO0XHdWBJmPp+xcoWgRbWTMcHoCpEQIps0Z5lBxiZamIHRh
         i9gPRyP0d4+gTEFy8vu4IbK0LDEvRvCFAK0kwm3dNHUuP0JYFegF35EEOb0m89NwH1Zl
         M10ZlgGIBloReYUfWTqbzc2cifKzk99RIpo+xFKgCUERvVaFehgcwmdA/ffsqtiSzDIW
         R+8i4sW1tnUj1AwteXlyFKCoZC2q/8hNrB7K0ZdZyT9EzFcdO6mcMZN3/SX9LqjOdEEQ
         mVGINaulfzjrF9MG/YAx6XaKFcy2BaoKRcFAjRw2y20YlbcRS1sb0ZbBGWV0FB9qlnbH
         UvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763110355; x=1763715155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CnnEYE+yQ8I3RIpj8JDmL7nizJ705zFf+GEnbfelK00=;
        b=BOydhVyeU51jH7Uf3t1yL1CJZoUviAWrwyRYYdrwNDbh/ZKy4/v/5s7x8c2Hq2vkrJ
         gsEwoELYAb6K5S5YVDT8Bd5idR4I7g2JCtKPqIIA3xvbW67WXUbGtThiGCKg/yLp6dXo
         tqbl679mmrb47FAapnGu6NplUOg2Gf0n45A7Kpp/vV0RsGnbxzpzRIvmA+f1zFaKToLd
         FWCa12+PggqwTpmfEPFTaSfmrWo9eHzDm427gwAf+fIpM597hPD3LR5unsv5Bf+pwyrw
         2yoPtRLrMc78QfA9Ze16+C68BLpnMxOeEj/nvUJXozcxm47bqQKXSo0hc9ApQfNOMhyg
         uIrg==
X-Forwarded-Encrypted: i=1; AJvYcCUn2L8FapPsFyArwT4ZwmjZQFqin93zR8TAZSJC/ZmisDfddJwWwdQQpPeX5JJYZ9i8RPYoh+x8TjY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwM2fn4h1HxSfkcC6vA4N3gIeLHN05lI3IvOKiwVzhcU/WFMnZU
	4pvcI8gcypReuz6jbxHcrbKgVhBQPRQtxE3XXaiZOBWxriu07dO3AGl+T6uZ+XrsY+3m5uqEKdG
	jNh4bELgb000HL8gjrCFGageUzHc8bNI=
X-Gm-Gg: ASbGncvn19nn+s2RA5OhzC3eNhViLzSI+y7qUKE9hUPf74kRutdjIf5froswvry3rD3
	3GtFkW9bcc6bIzIhzvIN7Lmh7ijWDfefkRpcjyDntcVTgn5HgKH4rBf/w3X5h2k8bGkDRn4U4ck
	M/2j61H38ccOyirJLPlrpaZ2fHHoUrafv6k7agORwqZbhzLjyRrkz8X/Al20/UIoRl5Z1rvJHqS
	ZOTfeRvufpI3xYFj7mH5HxMK0K7SfnIE+fYiRgqz2wMpO4d9W541SbW5ToHO1NhnbO+XSk=
X-Google-Smtp-Source: AGHT+IEE5eXBCuBlRoJGO0RkOhLZp/MnZWFuM4jIf52P4w0Nv35raGbNULVA+bE7mke74uqxGU47dEtORcjTuEoAdMw=
X-Received: by 2002:a17:90b:3dc7:b0:32b:baaa:21b0 with SMTP id
 98e67ed59e1d1-343f9e90610mr2569627a91.6.1763110355007; Fri, 14 Nov 2025
 00:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20251114024452.2927429-1-linchengming884@gmail.com>
 <20251114024452.2927429-2-linchengming884@gmail.com> <87qzu1f218.fsf@bootlin.com>
In-Reply-To: <87qzu1f218.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 14 Nov 2025 16:47:46 +0800
X-Gm-Features: AWmQ_bkyJxQjOX2W16x70Z08toCHqsqLSYPnKec0-C-yeKKvna5D9_uoLhkTYvo
Message-ID: <CAAyq3SYtJOZFwSY-UBfd+SwsSBV_1SPBMACCi1JCoCV-khVe6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: ubi: skip programming unused bits in ubi headers
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, chengzhihao1@huawei.com, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_005236_064468_B34D4DCE 
X-CRM114-Status: GOOD (  12.69  )
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
IDIwMjXlubQxMeaciDE05pelIOmAseS6lCDkuIvljYg0OjMx5a+r6YGT77yaCj4KPiBIaSBDaGVu
ZyBNaW5nLAo+Cj4gPiBAQCAtMTE1MCw2ICsxMTUyLDE0IEBAIGludCB1YmlfaW9fd3JpdGVfdmlk
X2hkcihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwKPiA+ICAgICAgICAgICAgICAg
cmV0dXJuIC1FUk9GUzsKPiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICBpZiAodWJpLT52aWRfaGRy
X3NoaWZ0KSB7Cj4gPiArICAgICAgICAgICAgIG1lbXNldCgoY2hhciAqKXAsIDB4RkYsIHViaS0+
dmlkX2hkcl9zaGlmdCk7Cj4gPiArICAgICAgICAgICAgIG1lbXNldCgoY2hhciAqKXAgKyB1Ymkt
PnZpZF9oZHJfc2hpZnQgKyBVQklfVklEX0hEUl9TSVpFLCAweEZGLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgdWJpLT52aWRfaGRyX2Fsc2l6ZSAtICh1YmktPnZpZF9oZHJfc2hpZnQgKyBVQklf
VklEX0hEUl9TSVpFKSk7Cj4gPiArICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICBtZW1z
ZXQoKGNoYXIgKilwICsgVUJJX1ZJRF9IRFJfU0laRSwgMHhGRiwgdWJpLT52aWRfaGRyX2Fsc2l6
ZSAtIFVCSV9WSURfSERSX1NJWkUpOwo+ID4gKyAgICAgfQo+ID4gKwo+Cj4gSXMgaXQgbm90IHBv
c3NpYmxlIHRvIG1lbXNldCgpIHRoZSBidWZmZXIgYmVmb3JlIHdyaXRpbmcgdGhlIFZJRCBoZWFk
ZXI/Cj4gSSBoYXZlbid0IGZvdW5kIHF1aWNrbHkgYSBnb29kIHBsYWNlIHRvIGRvIHRoYXQsIHNv
IGluIGFueSBjYXNlLAoKSWYgd2Ugd2FudCB0byBtZW1zZXQoKSB0aGUgYnVmZmVyIGJlZm9yZSB3
cml0aW5nIHRoZSBWSUQgaGVhZGVyLCBvbmUKcG9zc2libGUgb3B0aW9uIGlzIHRvIG1vZGlmeSB1
YmlfaW5pdF92aWRfYnVmKCkgaW4KZHJpdmVycy9tdGQvdWJpL3ViaS5oLgoKU3BlY2lmaWNhbGx5
LCB3ZSBjb3VsZCByZXBsYWNlIHRoZSBleGlzdGluZwptZW1zZXQoYnVmLCAwLCB1YmktPnZpZF9o
ZHJfYWxzaXplKSBpbnNpZGUgdGhlICJpZiAoYnVmKSIgYmxvY2sgd2l0aAptZW1zZXQoYnVmLCAw
eGZmLCB1YmktPnZpZF9oZHJfYWxzaXplKS4gQWZ0ZXIgdGhlIFZJRCBoZWFkZXIKcG9zaXRpb24g
aGFzIGJlZW4gZGV0ZXJtaW5lZCwgd2UgY2FuIHRoZW4gYXBwbHkgYSBzZWNvbmQgbWVtc2V0KCkg
b24KdmlkaC0+aGRyIHRvIHplcm8taW5pdGlhbGl6ZSBVQklfVklEX0hEUl9TSVpFLiBUaGlzIGFw
cHJvYWNoIHNob3VsZApwcm92aWRlIHRoZSBzYW1lIGVmZmVjdCB3aGlsZSBlbnN1cmluZyB0aGF0
IGFsbCBmaWVsZHMgaW5zaWRlIHRoZSBWSUQKaGVhZGVyIGFyZSBwcm9wZXJseSBpbml0aWFsaXpl
ZCB0byB6ZXJvLgoKRG9lcyB0aGlzIG1ha2Ugc2Vuc2UgdG8geW91PyBJZiB0aGlzIGRpcmVjdGlv
biBpcyBwcmVmZXJhYmxlLCBJIGNhbgpwcmVwYXJlIGEgdjMgcmVmbGVjdGluZyB0aGlzIGNoYW5n
ZSwgYW5kIEkgd2lsbCBhbHNvIHJ1biB1YmktdGVzdHMgdG8KdmVyaWZ5IHRoZSBiZWhhdmlvci4g
VGhhbmtzIQoKPgo+IFJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcywKQ2hlbmcgTWluZyBMaW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
