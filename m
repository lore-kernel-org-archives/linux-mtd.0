Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC74A606A32C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 19:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z3Kx1jHi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZG3mFBn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e9s3cQ4St75KeQbKxbssWxXGsVMPR4jiL4EYW/7JPoE=; b=Z3Kx1jHiGo47Xb29k5RMZksUy9
	yzMiSTgsqc+tFYpT3vByGRAkEfMsnRiQ8oOJ4YukMuK2fGopxbmKSS0qBED6TiINnm9QUMPexgbXf
	0jEor8N6IRtpyrs7ZQqtisXjnLYkpPsve4RzkjZaiOl2Rb44Kke0QjtkWEkYu7CrCjNR6P3noH0wn
	+peH4SbXMqgXxeT7cTVDuR+cLyDcJVcYKLvty9m1JhXuAE/GgBVSNhsQP1jl9nLbLo4CdlqdFOvju
	CSZ7L9WrnG2PWDXg5/IzfScvWno3a/szmcGWHDPKj2aupfs3/7H0yQ45NgYUlRVx6Fh+T7NinENic
	KRk19RhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTllu-0000000AAd5-11Mn;
	Wed, 18 Nov 2026 19:56:46 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlls-0000000AAce-13Cp
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 19:56:45 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-9905d61449cso416749241.0
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 11:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795031802; cv=none;
        d=google.com; s=arc-20260327;
        b=VWla82x6XV35HRKYl2Db+wSUtO6H2N/haWbvuuTR5wWOvPSKzqngiQG9jVRh9WHW95
         ZKzO+FAuJxDHNliruiX93O2vAoN6up0tBDxY9yYbHsS0VAZzWwEjk7w0vXSAE3mqDxEK
         81pAvC0gHMgJdco+mstZT1lPSW3tZRGeSINwatL0ZLBMyAX+ifu462c5SgtJYzA/UtKg
         HqVOs6m8SNP9SlBLtziPP9qaxk2gLVCU9H+nxVUQhHbzTN/ZICQbWODeJ924rXzl7CTM
         VMjLwPY841hcksxdhrEKfLlB2lME1x7i1V9Uj9pSQLa39djTTA0J7zieZhhX6+ZlGA1l
         OSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NtPU/MbG9+73eNJHJ559zS+z0t6I21eZG5LokkgEKJU=;
        fh=h/Ju4gSOteXgfYbbpftp4pjXSFOB4xhowwVptyB8gMs=;
        b=VszY/XMTf1ANV706sDyJ02LobJ3uL9UjNQgheTs3A0pEtli/4aDOBbwwoskEB2f9Hb
         J48LvkcGHcGCQRR/bUO8jMSBpdHYE/HQWulJs6eEOpQjg/WgvA0Ystc3k5m+y1O1Ah75
         xiJLA5IWOBxP1ebd1/6mcnZBTJmA2sfBogWzRA5BjEerp8/vc8GmGD81KudOuylPPieg
         mHV36YHarkS1/eALaZXDq1+wDdLbzVDxU2xRpDhhz/mNcRwHF7ex3YptSHp+1Ga8sTlo
         6cBTGB/aqL9FBFhx3Ukn3EhdfgToAMd2dHCpYEwa+TiRKHlBaL/QnAl+e269yBMYSTaL
         gdIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795031802; x=1795636602; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NtPU/MbG9+73eNJHJ559zS+z0t6I21eZG5LokkgEKJU=;
        b=IZG3mFBnnven1r4Jfy0zLHOq/Jxre6dmU1zJwbxwZZkSVJc9/waz9OfsZkV91HaRCi
         u+DSy8+sP/RujJZ7S91+cizgvHQTGrnDS03suHa6zJ7BK6RCm15qQJK1qzJAptdZbZT7
         SKzt9/AK5MufgEkCTZYdemOkpMjYBzfTu0QHXDAaDxfWcSr/c4bJs95vMIbiJgvt1qUs
         MJ0YYV0PaAfpKZwwohHOUZPSQ2t6gyXqY7YX3dxP4YHjZr2m+WLeOUptj16bzd/lPjWF
         acKtt0WNTOvhY6ZrYFMIDLK8LYVVUGT1QmrbuKu0lB5sCmCmJn/1IpX73I/yspb6W56J
         zNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031802; x=1795636602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtPU/MbG9+73eNJHJ559zS+z0t6I21eZG5LokkgEKJU=;
        b=jaZDN9a/3pDzhO+ZCBuHrwQfjQqaRDh0uVVzYlouXK4EbN3ivWCRNj3SUVjoa6Uzy1
         ghoThXjYOvu2K7mvSp5P1wnK5Fp5XneN3NuJyT9AiwvpHJhp1XRb7ckA0O8zhoV8fh4i
         wN4ThuGX4yX3Z4+PE4JXSEv8UIvnXmOSmnJTDDJQDGb5CjiUEw9jq9zX0xVBm9IWjToV
         Zr/rPU40GULrRxOge2+2ze6ibe9BixVfR6voc3jeEBrnEEayD6w4KWbS7PWG5Wug6NlU
         Wzd1ntR2o5GAqlCHU25UWNLC6L/fh/P7u2qlBGbozw5ogESrXffgaxHr6yj9l7okntxc
         dtZw==
X-Forwarded-Encrypted: i=1; AL+hErGzIXuDuHlMUMh6BU2+ghycKHH4rSIHXp339wPtVcXTc06WTZXbvw5KE55jV/D8L2VVeU8POzbvth0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/8+zaLZQay7AIn/zEjHqluckyhMaW1kKlwg+tTqLU/u5TyvybW
	cHns7K1B41i4h7/WxQ6LOnadHK74hFz9LaTONjsP3e3J2cr5l+DCJrM4nGPBxhccrqB4sgOBZZ2
	4aclx7oDSRw8lbOnhnvtuiyDW28ZMZPQ=
X-Gm-Gg: AYBFou0xS2ul2/DxMe6YvEYCg33fwPu9bJn2UKDOghn4InpCb4SYmwJ8e3azmEDvLIa
	6S9sjo8QbU/DKBbHzADOqhGcyHQXwhdv9NBhxRKwf81aPbyXQ1zmSRZI8wmPj1fJeuvwIYmCvsR
	ck2+oQGzgVCr8Begdz81up6PXJMkkCaedkfeT3PhjH0PPpoENNq72UaGVHFHSUrYeTB9LdqOrFE
	+06fvYJZo94tv8uknPQ72b+l0HKgUZEB1lJ5ZV7ArA2KrP0vIkgpIZbMDwT2Sy7yxv+DEt/B8lB
	lY8UlChs3EtvRoyJQTd+mMobDOPwri4wdv+ok0WTthZ9ud0UxbeAqp3D/idg3X9N7uakJofbpHT
	A7QVq3i8rPjxuzKbShI2jvRmbwYv1ewoZ3SnEjd0idJyQe5nCzsNiitmQlrYhyT+NLmaaC9/9Qm
	FbQWkRNEoBsEkhDefKIK6hxRf5CkAb376RP1Y/CIEVzvdVM4+orQ7qWQy6zVCZx+np+3Dtgc4se
	my35vV/KJKo7UYIqCuQRmYW9EKh7A==
X-Received: by 2002:a05:6102:4485:b0:7d2:cc5a:f0bd with SMTP id
 ada2fe7eead31-7d6ba40e444mr1449924137.19.1795031802357; Wed, 18 Nov 2026
 11:56:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-submit-rawnand-bbt-read-error-v1-v1-1-2ff0abffaf2e@gmail.com>
 <87a4n6jw82.fsf@bootlin.com>
In-Reply-To: <87a4n6jw82.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 12:56:31 -0700
X-Gm-Features: Aa3M54qIZa9sLBcPCUXfBjRmC6549XEA-mD-S_AxKtnIB-qiolOZnXMCHKAHF44
Message-ID: <CADvTj4ovcTPn9NyJcZf+L5nWconfeVLNSbRHy49epVLyeqdmGA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: propagate BBT read transport errors
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_115644_301958_256580CE 
X-CRM114-Status: GOOD (  22.17  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMzowMOKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMDMvMTEvMjAyNiBhdCAyMzowMzozOSAt
MDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+
ID4gY2hlY2tfY3JlYXRlKCkgaGFuZGxlcyB1bmNvcnJlY3RhYmxlIEVDQyBlcnJvcnMgYnkgaW52
YWxpZGF0aW5nIHRoZQo+ID4gYWZmZWN0ZWQgQkJUIGNvcHkgYW5kIGhhbmRsZXMgY29ycmVjdGVk
IGVycm9ycyBieSBzY2hlZHVsaW5nIGEgcmV3cml0ZS4KPiA+IE90aGVyIHJlYWRfYWJzX2JidCgp
IGZhaWx1cmVzIGFyZSBpZ25vcmVkLCBhbGxvd2luZyBpbml0aWFsaXphdGlvbiB0bwo+ID4gc3Vj
Y2VlZCB3aXRoIG1pc3NpbmcgZW50cmllcyBpbiB0aGUgUkFNIHRhYmxlIG9yIHRvIHJld3JpdGUg
YSB0YWJsZSB0aGF0Cj4gPiB3YXMgbm90IGNvbXBsZXRlbHkgcmVhZC4KPiA+Cj4gPiBSZXR1cm4g
bm9uLUVDQyByZWFkIGVycm9ycyBmcm9tIGJvdGggdGhlIHNlbGVjdGVkIHRhYmxlIGFuZCB0aGUg
c2Vjb25kCj4gPiB1bnZlcnNpb25lZCBjb3B5IGJlZm9yZSB1cGRhdGluZyB2ZXJzaW9ucyBvciB3
cml0aW5nIHRhYmxlcy4gQSB0cmFuc3BvcnQKPiA+IGZhaWx1cmUgZG9lcyBub3QgZXN0YWJsaXNo
IHRoYXQgdGhlIHNlbGVjdGVkIHRhYmxlIGlzIGNvcnJ1cHQgb3IgdGhhdCBhbgo+ID4gb2xkZXIg
bWlycm9yIGNvbnRhaW5zIGFsbCBvZiBpdHMgYmFkLWJsb2NrIGluZm9ybWF0aW9uLiBQcmVzZXJ2
ZSB0aGUKPiA+IGV4aXN0aW5nIEVDQy1zcGVjaWZpYyByZWNvdmVyeSBwYXRocy4KPgo+IEJlIGhv
bmVzdCwgeW91IGRpZCBub3QgcmVhZCB0aGF0IGJhY2suIEkgZG9uJ3QgdGhpbmsgb25lIHdvdWxk
IGd1ZXNzIHRoZQo+IGJpZyBwaWN0dXJlIGJ5IHJlYWRpbmcgdGhpcy4gSGVyZSBpcyBhIHByb3Bv
c2FsOgoKSSdtIG5vdCBzZWVpbmcgYW55dGhpbmcgcGFydGljdWxhcmx5IGRpZmZpY3VsdCB0byB1
bmRlcnN0YW5kIGluIHRoZQpvcmlnaW5hbCBleHBsYW5hdGlvbiBteXNlbGYsIGFsdGhvdWdoIG1h
eWJlIEknbSB0b28gYWNjdXN0b21lZCB0bwpyZWFkaW5nIHRoaXMgc3R5bGUgb2YgZXhwbGFuYXRp
b24uCgpBIGxvdCBvZiB0aGVzZSBidWdzIHdlcmUgZGlzY292ZXJlZCB1c2luZyBUTEErIHRlc3Rz
IGJhc2VkIG9uIExMTQp0cmFuc2xhdGlvbnMgb2YgdGhlIGRyaXZlciBsb2dpYyBpbnRvIGZvcm1h
bCBzcGVjaWZpY2F0aW9ucywgYWxvbmcgd2l0aApmYXVsdCBpbmplY3Rpb24gdGVzdHMsIHJhdGhl
ciB0aGFuIHRocm91Z2ggcmVhbC13b3JsZCBoYXJkd2FyZSB0ZXN0aW5nLgoKQmVjYXVzZSBvZiB0
aGlzIGZsb3csIHRoZSBjb21taXQgbWVzc2FnZXMgdGVuZCB0byBmb2xsb3cgYSBzaW1pbGFyCnBh
dHRlcm4gb2YgZmlyc3QgZGVzY3JpYmluZyB0aGUgY29kZS9sb2dpYyByZWxldmFudCB0byB0aGUg
dGVzdApmYWlsdXJlLiBJIGd1ZXNzIHdoZW4gdGhlIHRlc3QgY2FzZSBpdHNlbGYgbWFrZXMgaXQg
Y2xlYXIgdG8gbWUgd2h5CnNvbWV0aGluZyBpcyBhIGJ1ZywgSSB0ZW5kIHRvIG1ha2UgdGhlIGNv
bW1pdCBtZXNzYWdlIG1vcmUgb3IKbGVzcyBleHBsYWluIHRoZSBmYWlsaW5nIHRlc3QgY2FzZSBy
YXRoZXIgdGhhbiB0aGUgYmlnZ2VyIHBpY3R1cmUKaW1wbGljYXRpb25zLgoKSSdsbCB0cnkgYW5k
IGZ1cnRoZXIgYW5hbHl6ZSB0aGUgYnVnIGltcGxpY2F0aW9ucyBiZXlvbmQgdGhlIGltbWVkaWF0
ZQp0ZXN0IGZhaWx1cmVzIGZvciBmdXR1cmUgY29tbWl0cy4gRmlndXJpbmcgb3V0IHRoZSByaWdo
dCBjdXQgb2ZmIHBvaW50IGlzCnNvbWV3aGF0IHRyaWNreSBob3dldmVyLgoKPgo+IGBgYAo+IEVD
QyBmYWlsdXJlcyBoYXZlIGRlZGljYXRlZCByZWNvdmVyeSBwYXRoczogLUVCQURNU0cgaW52YWxp
ZGF0ZXMgdGhlCj4gYWZmZWN0ZWQgY29weSBhbmQgLUVVQ0xFQU4gc2NoZWR1bGVzIGEgc2NydWIu
IEFueSBvdGhlciByZWFkIGVycm9yCj4gKHR5cGljYWxseSBhbiBJL08gZXJyb3IpIHdvdWxkIGJl
IHVuaGFuZGxlZCBhbmQgbGVhdmUgdGhlIFJBTSB0YWJsZQo+IGluY29tcGxldGUuCj4KPiBNYWtl
IHN1cmUgdGhvc2UgZXJyb3JzIGFyZSBwcm9wYWdhdGVkLgo+IGBgYAo+Cj4gVGhhbmtzLAo+IE1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
