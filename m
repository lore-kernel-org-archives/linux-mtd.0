Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C0EC5AD49
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Jun 2025 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZY8Pm0hkVWUfUSP/s3a5YWP/80CyoUpHDuKzCLFGa4=; b=iCrg+pba93+JTl
	MR2woAntR+bgni2F3Kd7+dbrBxBHF0MI1JOQlZNak79fbi2h5kSoec3A72dT+lC4KrqDcJ/9dBHa7
	JqpfatpKi31puC9o+VPIebL9yrkk4iItn2As85YB9RoWh1N9WmQIMLx2wlc/L++s1zHX3YhBa36bW
	kXmMYoUJAQ3+IjGr22G8vDMHfqX3LARnm66YUPFfDu81A/7o0c+/GLzyrP1m5SbzoEfgTNUGa73Fo
	VpLjTeE5/9uuhqKiFS32T95AN8Ve4IZhZ14CqXXQ75E785AuNxFFvqvkxLHcroKMn+hklxPVAz6xa
	fUFUKcX9I5shilS09OPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNT25-0000000HTzi-400B;
	Fri, 06 Jun 2025 09:06:37 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNT21-0000000HTx2-1hQ0;
	Fri, 06 Jun 2025 09:06:34 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a4bb155edeso23825791cf.2;
        Fri, 06 Jun 2025 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749200792; x=1749805592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iEKTaT2LElUyz6hn/T8Mh2vQ8hFTWoMkAbmwi0/NDg=;
        b=JV6HUnbGX8+VWibr1X3cwNJDNiVlmOsnjnxJPnfxrMqPIJSAfzHaL/7mlqNaay+Lm7
         6ruXRgnC0v7dbPGfMhB4c/IAS/nQGnHJt1QCPuVE4A5j9OhScJOfx80fJF/aMskf1cVp
         A2b590eB428vG4cELmnPAwvrEOUh4HGyi9CIy0zG3y/B8HcB+Kq6NfC6oZtu7a3kzxik
         wkCjnaGe7x8akSRbPH4WB3/+IAUcrUtr4xFGeZ9La4wv2g6Hc6VefteqFiVGCBqBcp7E
         RmG/wd6RiT+QbYReOkP8BHM4oZKZ1uAV6uv1xh65ZDceGuH4Gmp4c3qYio5EFi5CgQPG
         YMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200792; x=1749805592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iEKTaT2LElUyz6hn/T8Mh2vQ8hFTWoMkAbmwi0/NDg=;
        b=V1OGxw6FDVJ71fgxI+NU0374boGEuxonyZUKKI/X2/THw/hXxCMDQ0No4ZXz2hrzRA
         DMLfL7+wsHPgBBDNqpY5C1cxgTLjJfA84G3CL11dbNpDXcs5jPU40uXrAykarwVL1MNu
         Udb4an2D22nGE07d/EJeF1ZRhV2Kj4hMjDGCYTpaFGOtLsyz1Z1OKbakWkhBjNiOuOOg
         hfoRvJajj+HDuOYv3gtOWCgFkNNztWepR53s2+H7htGMdnY8jngqsGqQJamVZP8SJoHk
         wdO0IZbppQp7oOdgrVyD1mgnKvOnwsLCwuV/tppPES8tMn5RyqI9/SlyrsA9nkyDR3wu
         xfkg==
X-Forwarded-Encrypted: i=1; AJvYcCU6wzooxLEy0E813TVKAoNW05+VKVH8Z59FBoUNoVOjCGEGIyKUcVZrq50ssBMxj5Ic1xwYafJfb+4o@lists.infradead.org, AJvYcCW0JdY0D9GLdjdoymtzN7Z+oms0z7gITseEifp0dBV3qWmmxQsw6PHtVltij1cAHqUs2C7ogK7L5GQ/AswBo9hw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9sx+wRe9jB5Nmp8CjHyFHP6WRIE6Uqmhg3mTn/hx6LjBF3Crs
	NWu2vLFS9T+xgmidvG8w7TH1Qf/2AsTASUyJo1K4yxuTaW1oFOoH+ITnDOfNfkuE42k+obthslA
	Y1Voca5dP3KiBYhRLzZmrDovMMKre3WU=
X-Gm-Gg: ASbGnct5yubcERJGeK5sDSCgZGx5Y+Z3HLRGWvQPBN0+BOFQY8nwkSXK6f6M6YIgQbK
	8zvNAz75rOScdwffhwNENzAbWC86dmPwemhu6LOswX7viMzRTpXFn5E6FjEsdRNRVBgfFJsCfo9
	7rof9cpdJOqLJCgvRxS83mt7cjYu7MScjQSZ7+8xTaisxPtyft7lPxiJYTWtAoMsWRfhE4GgrUy
	DAY
X-Google-Smtp-Source: AGHT+IEAnnzIxtW3T+9hMHK+wBH7ZD7AMKC5gNvjX9nEPuofdL7PSuw1v4ThDP1ou2X6MNg+w1DXRb5CyDe5GpT5zFk=
X-Received: by 2002:a05:622a:90a:b0:491:20d6:75ff with SMTP id
 d75a77b69052e-4a5b9e55b32mr50608161cf.31.1749200791922; Fri, 06 Jun 2025
 02:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
 <20250510-wmt-sflash-v1-1-02a1ac6adf12@gmail.com> <20250514204159.GA2988411-robh@kernel.org>
 <CABjd4Yz3w75PtkRk_edzD5yf6b2xPuf20gopbm8ygddgCBfpkw@mail.gmail.com> <2b520ae5-eb0d-40eb-ba73-cc18759f33b9@kernel.org>
In-Reply-To: <2b520ae5-eb0d-40eb-ba73-cc18759f33b9@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 6 Jun 2025 13:06:22 +0400
X-Gm-Features: AX0GCFtSe5pvb_MWkkzTKnls_WaiQE0eICzI9uRkedvlSrNICRkV_prB9UA_SHY
Message-ID: <CABjd4YxRMfi3ZFQxhB__6U4Rm3KQ7bm6J=wQLWAkpb++61ddEg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add VIA/WonderMedia serial flash controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_020633_441406_9E9CBC3B 
X-CRM114-Status: GOOD (  17.70  )
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

T24gRnJpLCBKdW4gNiwgMjAyNSBhdCAxMjoyOeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNS8wNS8yMDI1IDIxOjUwLCBBbGV4ZXkgQ2hh
cmtvdiB3cm90ZToKPiA+Pj4gKwo+ID4+PiArICAiI2FkZHJlc3MtY2VsbHMiOgo+ID4+PiArICAg
IGNvbnN0OiAxCj4gPj4+ICsKPiA+Pj4gKyAgIiNzaXplLWNlbGxzIjoKPiA+Pj4gKyAgICBjb25z
dDogMAo+ID4+Cj4gPj4gVGhpcyBmb2xsb3dzIHRoZSBTUEkgYmluZGluZywgcmlnaHQ/IERyb3Ag
dGhlc2UgMiBhbmQgYWRkIGEgJHJlZiB0bwo+ID4+IHNwaS1jb250cm9sbGVyLnlhbWwuCj4gPgo+
ID4gTmVlZCBzb21lIGFkdmljZSBoZXJlLiBXaGlsZSB0aGlzIGNvbnRyb2xsZXIgc3BlYWtzIFNQ
SSBwcm90b2NvbCB0bwo+ID4gaXRzIGNvbm5lY3RlZCBmbGFzaCBjaGlwcywgaXQncyBhIHNwZWNp
YWwtcHVycG9zZSB0aGluZyB0aGF0IGRvZXNuJ3QKPiA+IGV4cG9zZSBtdWNoIFNQSSBmdW5jdGlv
bmFsaXR5IHRvIHRoZSBvdXRzaWRlIHdvcmxkLCBub3IgY2FuIGl0IGRyaXZlCj4gPiBhbnkgU1BJ
IGRldmljZXMgb3RoZXIgdGhhbiBTUEkgTk9SIGZsYXNoLiBEb2VzIHRoYXQgc3RpbGwgcXVhbGlm
eSBhcwo+ID4gYW4gU1BJIGNvbnRyb2xsZXIgYXMgZmFyIGFzIHRoZSBiaW5kaW5ncyBhcmUgY29u
Y2VybmVkPwo+ID4KPiA+IEhhcHB5IHRvIHJlZmVyZW5jZSB0aGUgc3BpLWNvbnRyb2xsZXIueWFt
bCBiaW5kaW5nIGlmIHNvLgo+Cj4gU1BJIE5PUiBmbGFzaGVzIGFyZSBzdGlsbCBjaGlsZCBkZXZp
Y2VzIG9mIGFuIFNQSSBjb250cm9sbGVyLiBZb3UgY2FuCj4gbG9vayBhdCBvdGhlciBleGFtcGxl
cyAtIGFyZW4ndCB0aGV5IGFsbCB1c2luZyBzcGktY29udHJvbGxlcj8gV2h5IHRoaXMKPiB3b3Vs
ZCBiZSBkaWZmZXJlbnQ/IFVubGVzcyB5b3UgZm91bmQgc29tZSBjYXNlcyB0aGF0IGFyZSBkaWZm
ZXJlbnQsIGJ1dAo+IHRoZW4gd2hpY2ggb25lcz8KCk5vIHN0cm9uZyBvcGluaW9ucyBoZXJlLCBh
bmQgbm8gZXhwZWN0YXRpb24gb2YgYW55IHNwZWNpYWwgdHJlYXRtZW50CjopIEp1c3Qgd2FudGVk
IHRvIGNvbnN1bHQgb24gd2hhdCdzIG1vc3QgYXBwcm9wcmlhdGUuCgpNeSAoc3ViamVjdGl2ZSBh
bmQgcGVyaGFwcyB1bmZvdW5kZWQpIGV4cGVjdGF0aW9uIHdoZW4gc2VlaW5nCnNvbWV0aGluZyBh
ZHZlcnRpc2UgaXRzZWxmIGFzIGFuIFNQSSBjb250cm9sbGVyIHdhcyB0aGF0IGl0IHdvdWxkIGJl
IGEKZ2VuZXJhbCBwdXJwb3NlIFNQSSBtYXN0ZXIsIHRvIHdoaWNoIG9uZSBjYW4gZS5nLiBjb25u
ZWN0IGFuIFNQSQpkcml2ZW4gTENEIHNjcmVlbiBhbmQgZ2V0IGl0IHRvIHdvcmsgd2l0aCBnZW5l
cmljIExpbnV4IFNQSQppbmZyYXN0cnVjdHVyZSAtIHdoaWNoIHdvdWxkIG5vdCBiZSBwb3NzaWJs
ZSB3aXRoIHRoaXMgc2luZ2xlLXB1cnBvc2UKTk9SLW9ubHkgZmxhc2ggY29udHJvbGxlci4gR2l2
ZW4gdGhhdCBJIGRvbid0IGtub3cgaG93IGZsZXhpYmxlIG9yCnJlc3RyaWN0aXZlIG90aGVyIGV4
YW1wbGVzIGFyZSBpbiB0ZXJtcyBvZiBkcml2aW5nIGFyYml0cmFyeSBTUEkKZGV2aWNlcywgSSB0
aG91Z2h0IGl0J3MgYmV0dGVyIHRvIGp1c3QgYXNrLgoKV2hhdCBJJ20gZ2V0dGluZyBmcm9tIHRo
aXMgZXhjaGFuZ2UgaGVyZSBpcyB0aGF0IEknZCBiZXR0ZXIgdXNlIHRoZQpzcGktY29udHJvbGxl
ciBiaW5kaW5nIGFuZCByZXNwZWN0aXZlIG5vZGUgbmFtZXMgcmVnYXJkbGVzcyBvZiB0aGUKZmFj
dCB0aGF0IHRoaXMgY29udHJvbGxlciBjYW5ub3QgZHJpdmUgYXJiaXRyYXJ5IFNQSSBkZXZpY2Vz
IGJleW9uZApOT1IgZmxhc2ggKHdoaWNoLCBhcyBJJ20gZ2V0dGluZywgaXMgaXJyZWxldmFudCBh
ZnRlciBhbGwpLgoKQmVzdCByZWdhcmRzLApBbGV4ZXkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
