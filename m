Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D246BF30296
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 00:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYSj7zY+AQxoehFzOJ/45iEgeUx0X8aic4S7JjRM6As=; b=QWzdQxp3KH9yfZ
	pU9BgNMHEPt1deXFnojM1K/SWLZHhrr4deBGwjyia8Spysmf1rTq+vzjHuHY+I2Tmaz1j0a7T9zjW
	p63Qo1l6ja791BuQvCg7a8E4cNzgyvjLp+98YGkScilTtaF/8Dp4l7eCnWu42QBqYZsN1Vd9HHaSn
	Ktk2rQYNiItHSeOagNsK/mVlxiWavsxa2W0c3ITcrReO+W9Oabzb44Wd5eEGydJW15OzjaEEwtW9F
	pCtn1UkBNVHleFgkTAhSlGjGXaKRuxerCJ8RBlf61o/75U5MFq27Xra16ZBVhewTiCBpnQPqHxK/R
	oenQ+G4Nzde/TZKJ7YcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1w3q-000000033GK-11qw;
	Mon, 16 Mar 2026 00:43:58 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1w3n-000000033F9-0Jby
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 00:43:57 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-509069a7a7fso778391cf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Mar 2026 17:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773621834; cv=none;
        d=google.com; s=arc-20240605;
        b=Rz+t5qAbjsDp5kBQzMLjHfer00a2aupnhkJIP9FobLTggQFnzSjvkkAFEVG43SIPHS
         c9m/3d6hD7gfLh9LWe2gEwdOUrQ7s3zjjMWc+sNWyMZOc3yIe91X27zgua9BcSD3moWG
         w+KfSFXYJgc4htiqI071rLGL4JB/eQwzfixNDE1R2ypk9Tb2x7NmHr5zLFyG01Sa+MX+
         35a+VV5xa8GBWAVBUEx198rUwBiN4kxe3rCEubRUWnhs1uA/GhUJdDeFf/tWLv8SR5no
         GlHApRNqQ4f4gNWVSHCTjbd2bVaraWlCOb7NCv2QI1CfOivtxtsiGrc5vGWGt2tqhuTH
         zPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        fh=gwpjaeW5u8v2gBBMOX+mqMT6Z76eFZa30GLl1B/wrxs=;
        b=fTHhCgjuBs9FOrEXHwqG2Cm80kJivotL41rO/1HoVI98T31ZvsHx1+l4dVF5isC6Y7
         Uj9bVYmjzvi2XXjvVCGPIGtniRT00b+s4SFtukxa4U0NwqIWGxKy4Ca9ADW9MpUSv8ll
         U8e9zVSWZb3t3T8JQrQwJ4mmjzsiqcxpFDiBXdXeWD6k+g7r295kT/ZJAjifoN9hFLwk
         NsugA6ExAiDEXeEYZBX0528quJCnk9zWmPBdkEbg6obqjedwYU1rdNeuif58QVazwaRE
         axKu8MAIkehMnPhnvnvfPMLSj7YTorbqrfX6pFRuKxhSaSMRHhGLb9glE/NWpNZjMYj5
         Dkzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773621834; x=1774226634; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        b=CWnQW5GgkSnZ9XgXp9Hvve3dzMDV97qo3wV0GIdlEqlvbBozoSzHLCA1QrvYL/Ei++
         dTK3cfgAhnoz7DDivHx2IVKvoZQzP5Nz25zh2qpAvOeLxeMgCWqzSdZHp/SxPUnRU5HC
         laJPeazqqymw13M6hOfiQ0b4mA/jn2arL6OKmYzULQOwgQSLS9cXCio1nXSzFWnZO7O3
         a52t/s3JCMDnp5NkhfShU0GTtPO0h7k23hgVYrBXkIeSWsrjtS9QAZNGTdSPHc85fDQ9
         YBpyMi9hu/fjD2kAXJ4R3A1dnLg80s+5RblMQZMkNGA2BGxIpY4jJo1PNUHSiqCKeHFu
         9iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773621834; x=1774226634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        b=f2W7isG836ToKVob1C6Sk97gslbGe8TsXqETZ4BcgsixqnCeu2oSmGy+wizNRCH7tZ
         D6dwOFQim+z94QAnYpZqRlo8/SxoAhifuAS1OH7Dui1WaZgdd457d8hdeWISpX3RhUV3
         vLQwFOOlntAPMaR2nNvSBX7967nZocf5DXIep+Ysngep1HwGq479rWwaYcXmXPRynHyX
         kMIntrAhpt9x/UwDJpNPLuYVlxm8t7j4bo1crIfAHcpzYrEkr9OUZrju4Ap1MWN3aVFT
         mPu2S5UFyQ8nBdmSJKitQT3jNXj6xVoY7p/bRyujgQKnV1tBdLUsiXj2HxaE9/X2wR/t
         9G2w==
X-Forwarded-Encrypted: i=1; AJvYcCVp2TtVJs/2uejOwJAPg8WEG04/D3K0HLiRIWJbhZd1Ps9Z0KvsFizLusqCoVtdU7tTo+H4zOmGE2c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4neJrO9ZgFGcTB/hRXf7WpOqacjzadYHulNoAP5cF1EdFepc8
	pWcni03K/VUJ3yFjtzp3qONA3sC9ISDLZq6EginyIp45H7dzWu4TRgwPCG5/diNy4p2LIXsVnap
	Kl+rifvaqt5dh90AwPgtH4abwX1HLvwL+7I11o9nG
X-Gm-Gg: ATEYQzxPVpv3yQHGt7sduUh+H/4sBB9/PJfRI8MiwBlc0WMCss0ei4F5ucQQm1xXP0r
	/BSzrPi4IJ86LZuYpqMJ2IMh+Afw9Haw+UCEqLQHzFBTwwcEj08IFsAWvPppJ6Jd76j6Se1zWPD
	SiYornpuL4y+tsZZz0mJ+ck9RwUsBXoqWtmxYPZitfvAC7s2l4ZpywN6vMd/ZsmDhtsHZoKZs87
	GPFYukP4s+Q6lADuKInUb7lQVEnP/m2CBm+Nfgue1ZfZB7KplSNO3FyjMQR2YlkxEHigpVfoanC
	jGBcIg==
X-Received: by 2002:ac8:590e:0:b0:503:4bc:c925 with SMTP id
 d75a77b69052e-5096aa2ae2cmr17578141cf.13.1773621833001; Sun, 15 Mar 2026
 17:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org> <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
In-Reply-To: <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 17:43:41 -0700
X-Gm-Features: AaiRm51H9IsCynzRpnxAc6_DrzYXD9cjd8fR558hmylwDQfMj5FrJzUnU5dorNw
Message-ID: <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
Subject: Re: [PATCH 03/15] mm: document vm_operations_struct->open the same as close()
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_174355_128588_49CE58D5 
X-CRM114-Status: GOOD (  21.42  )
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

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgMToyN+KAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRGVzY3JpYmUgd2hlbiB0aGUgb3BlcmF0aW9u
IGlzIGludm9rZWQgYW5kIHRoZSBjb250ZXh0IGluIHdoaWNoIGl0IGlzCj4gaW52b2tlZCwgbWF0
Y2hpbmcgdGhlIGRlc2NyaXB0aW9uIGFscmVhZHkgYWRkZWQgZm9yIHZtX29wLT5jbG9zZSgpLgo+
Cj4gV2hpbGUgd2UncmUgaGVyZSwgdXBkYXRlIGFsbCBvdXRkYXRlZCByZWZlcmVuY2VzIHRvIGFu
ICdhcmVhJyBmaWVsZCBmb3IKPiBWTUFzIHRvIHRoZSBtb3JlIGNvbnNpc3RlbnQgJ3ZtYScuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21tLmggfCAxNSArKysrKysrKysrLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gaW5kZXggY2M1
OTYwYTg0MzgyLi4xMmEwYjRjNjM3MzYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5o
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gQEAgLTc0OCwxNSArNzQ4LDIwIEBAIHN0cnVj
dCB2bV91ZmZkX29wczsKPiAgICogdG8gdGhlIGZ1bmN0aW9ucyBjYWxsZWQgd2hlbiBhIG5vLXBh
Z2Ugb3IgYSB3cC1wYWdlIGV4Y2VwdGlvbiBvY2N1cnMuCj4gICAqLwo+ICBzdHJ1Y3Qgdm1fb3Bl
cmF0aW9uc19zdHJ1Y3Qgewo+IC0gICAgICAgdm9pZCAoKm9wZW4pKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqIGFyZWEpOwo+ICsgICAgICAgLyoqCj4gKyAgICAgICAgKiBAb3BlbjogQ2FsbGVkIHdo
ZW4gYSBWTUEgaXMgcmVtYXBwZWQgb3Igc3BsaXQuIE5vdCBjYWxsZWQgdXBvbiBmaXJzdAo+ICsg
ICAgICAgICogbWFwcGluZyBhIFZNQS4KCkl0J3MgYWxzbyBjYWxsZWQgZnJvbSBkdXBfbW1hcCgp
IHdoaWNoIGlzIHBhcnQgb2YgZm9ya2luZy4KCj4gKyAgICAgICAgKiBDb250ZXh0OiBVc2VyIGNv
bnRleHQuICBNYXkgc2xlZXAuICBDYWxsZXIgaG9sZHMgbW1hcF9sb2NrLgo+ICsgICAgICAgICov
Cj4gKyAgICAgICB2b2lkICgqb3Blbikoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwo+ICAg
ICAgICAgLyoqCj4gICAgICAgICAgKiBAY2xvc2U6IENhbGxlZCB3aGVuIHRoZSBWTUEgaXMgYmVp
bmcgcmVtb3ZlZCBmcm9tIHRoZSBNTS4KPiAgICAgICAgICAqIENvbnRleHQ6IFVzZXIgY29udGV4
dC4gIE1heSBzbGVlcC4gIENhbGxlciBob2xkcyBtbWFwX2xvY2suCj4gICAgICAgICAgKi8KPiAt
ICAgICAgIHZvaWQgKCpjbG9zZSkoc3RydWN0IHZtX2FyZWFfc3RydWN0ICogYXJlYSk7Cj4gKyAg
ICAgICB2b2lkICgqY2xvc2UpKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiAgICAgICAg
IC8qIENhbGxlZCBhbnkgdGltZSBiZWZvcmUgc3BsaXR0aW5nIHRvIGNoZWNrIGlmIGl0J3MgYWxs
b3dlZCAqLwo+IC0gICAgICAgaW50ICgqbWF5X3NwbGl0KShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KmFyZWEsIHVuc2lnbmVkIGxvbmcgYWRkcik7Cj4gLSAgICAgICBpbnQgKCptcmVtYXApKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqYXJlYSk7Cj4gKyAgICAgICBpbnQgKCptYXlfc3BsaXQpKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIpOwo+ICsgICAgICAgaW50
ICgqbXJlbWFwKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gICAgICAgICAvKgo+ICAg
ICAgICAgICogQ2FsbGVkIGJ5IG1wcm90ZWN0KCkgdG8gbWFrZSBkcml2ZXItc3BlY2lmaWMgcGVy
bWlzc2lvbgo+ICAgICAgICAgICogY2hlY2tzIGJlZm9yZSBtcHJvdGVjdCgpIGlzIGZpbmFsaXNl
ZC4gICBUaGUgVk1BIG11c3Qgbm90Cj4gQEAgLTc2OCw3ICs3NzMsNyBAQCBzdHJ1Y3Qgdm1fb3Bl
cmF0aW9uc19zdHJ1Y3Qgewo+ICAgICAgICAgdm1fZmF1bHRfdCAoKmh1Z2VfZmF1bHQpKHN0cnVj
dCB2bV9mYXVsdCAqdm1mLCB1bnNpZ25lZCBpbnQgb3JkZXIpOwo+ICAgICAgICAgdm1fZmF1bHRf
dCAoKm1hcF9wYWdlcykoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgcGdvZmZfdCBzdGFydF9wZ29mZiwgcGdvZmZfdCBlbmRfcGdvZmYpOwo+IC0gICAgICAg
dW5zaWduZWQgbG9uZyAoKnBhZ2VzaXplKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiBhcmVhKTsK
PiArICAgICAgIHVuc2lnbmVkIGxvbmcgKCpwYWdlc2l6ZSkoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpOwo+Cj4gICAgICAgICAvKiBub3RpZmljYXRpb24gdGhhdCBhIHByZXZpb3VzbHkgcmVh
ZC1vbmx5IHBhZ2UgaXMgYWJvdXQgdG8gYmVjb21lCj4gICAgICAgICAgKiB3cml0YWJsZSwgaWYg
YW4gZXJyb3IgaXMgcmV0dXJuZWQgaXQgd2lsbCBjYXVzZSBhIFNJR0JVUyAqLwo+IC0tCj4gMi41
My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
