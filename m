Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D4EF30298
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 02:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hBOj0UuNykck5MdF6j6b3A2h/dUN7T0nxCi/lOhxKY=; b=4RnyjODxtPiup/
	WOAraezsBMIbDJLRsw6s6mU5cUMmyuCm8G+3PdFaXO6H9yCs/6w3c6LaLzp+wleCZFOVUTYiinUWn
	JOZsNcORujSxTyxZbE7CmkDMexazT1FBZZgF2xK8FfeLkrUUJS13D2ixIlMnecgbD0rLdk0LUwC0j
	m4KhzhWA0aJk8hfsSlok1zBvtMWgaLUSmD6h5wx5ifbM1cOWM8JyzhanVrgPDd1RAMBwUR5qKsw5O
	ENf4IVpN4Xkv+9qudz9Xia29ZiajtOwDi9VwrELVRkh+X2rz+Pe9xz0MgCmyinNJepdpCDz5qNxXF
	FreqwqNNkyPrQ+kID51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xlb-00000003DpP-07Uw;
	Mon, 16 Mar 2026 02:33:15 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xlS-00000003DnO-3hI8
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 02:33:09 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-509062d829dso708981cf.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Mar 2026 19:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773628385; cv=none;
        d=google.com; s=arc-20240605;
        b=BzkMEj+20TtKKYsRZn2NPH0nFbsDb7yZaNuZk3e23ePpUkcIYS1H91e6+F6nGbsHJF
         TvQix+cfRk9shKfezNJ+QuCqEPVsXRlnbSFpWzUYS+Qug90N2XcLYhVYWZEQH3ZTeViB
         475kH3xKQ1J8XNaMn0XlvZP1U2kLeWzTD0avOZxxDWjv9UzQ7OWKlnt4rwi+hc2Zpcs9
         hKlG/9wM5/Kc4Bg4MeybQgY/WlWoG8IvuXBQkoJkJ6z+WhOZAWXgiC3q9G0wrjbRGJk5
         z5/zMEMUrHtCIXerenx79CU6KTBD+wKpyP45kqL1fCdR9FAcxQD/S0sKUl3pgj/Vv5Oy
         GbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        fh=mNDJ1G5h7mjnA2r5Cn4cudPEEjBoBKRzBGQAVDQUITE=;
        b=JQAk7SZlOf7ysWIq/UZOFYnx1KQg/gYRn9kZ4/wFQO1u8RfF8Gj/DcsHNIOc3sCTdM
         Jvyk8QHwIuMhFU1HKOZ9tObfhnG9RG95ZzgXtyXKRXR+VLarnBKAeQgIRrezW+vvzwrA
         HbsmNTOwyCgu2r+nkgGD/vGZ6DinhWBADy9kp2XbZwvM5FaRjI3maGrwga/6X30J6JHg
         tBHAYBBNKKEx+WNkkM+PkbhvUukQLBxpNKe5kFu3t5DVHgS2smTKI7scGg4SPWnaT0S3
         LGwFEtZ8cCZwgPlX455hKgTGoqfkCMDAo7TaKvOCpr3rxZJ+JCg2oy2wwhhva/eecLR8
         hi8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773628385; x=1774233185; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        b=WjFG1mFpMyPO6FQRg2zm7N4FxZPHCcLo5kSJz1LBamNr3qCv2+YtafgwowazDu1tn5
         u6XbmKeundTIcz6BwMTn0+rfaNBQ8xFjugg3ites1ameXOsgZiwykF5eVWoEdrPdDI6D
         F7zWP3kBOUPE4sbL206RXWjrFecH2CTwBtQ9+7nUVSWNcPvrN4R7xFOyNVxNU0FohXiH
         pb4bfW75ThrdZzjKQIUa9rIJ8kJ8gT0U66l43usWVgez0UnlCT8NedWB4hQtBjGEHGqE
         HDtREN0r5WrHyEDOHk0p1eAHFE/4a69y1wcef/vq8ePNMK75SIo3l3XI1ukJP3k5iDlb
         DLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628385; x=1774233185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        b=QcJ/F010+OBM/zVDZPBg9hk9CpLhaDISJvmA8oZZ+MrWQIYX4I/GGCmrIBe8xRBHSr
         kV1NijkB+BmTcNrUgrsPCa5voiEbCGCXajHMr2A5K5msJyniNzeqSeDnFijCOFUJ2HDL
         aczrUvG9Tbas35wsxK6SY1eI8HN4w7V6VzU2ivqKhcvfCUR7BtKWzAre9008grlXNt8/
         UAgSAuOFcaVLpnf5+aBrwPCNv+2S9+wdqkiiQYeg7YIk8POGRKnb0/sg3JTbvUsAkcop
         G280Rdl9VBLvkQnnE4m7+2LlkZh0e5BZkueFGaUJvX6dyg+B2cEeYwla7hCc/DpvyqXJ
         ChcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh1pnfzYhMMx2+bYMF2T5jW2wBA+Kh9HINQKazKN28dy8O3iI3YtYFaowO66XqoUJMvebVlghEYW4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGOyjyPRbLPmI9rdlXD5Gbt5Sp5O3iyvdoRgdVcCvWiCaBe1go
	TBGG2RlIekYf0KEEYEm6TAF6agrKCL1za/butZwtQJIoij7c1jPGCnYO2ZgnE09Pbb4dXmIczpM
	g+06cmPXTdUcNotH/ZSvuSJwV+5Xe8EKGl8v5CyM9
X-Gm-Gg: ATEYQzwVWXlSjPvkc6rVP5SoGpSoiB+BJ2qj8dOoJGYmOPRdVtkYc50/q/xrYcyNhUx
	mGoyr4Q6GI09F5eDDa7elJ5T45ATsmbCYHtEkZsqOJMMBAivxKGUQmxS0RREQNQSJQGSWrxPk4r
	2VEICZd/YCUUYL1S0GUUZfzsu+4lYxAK+IBKqEIsozSB2fZL/4z8gcBlTJJgURTfaaomT9Ut5r4
	BpcYNsT6Z7KTnXFnYFmJcKA6snSkjsIngOCsketxmt2a45PN5WgKKLdVQVU5ytmTjNJ33MmKdeb
	1l14hA==
X-Received: by 2002:a05:622a:60c:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-5096a92ebdbmr823271cf.1.1773628384887; Sun, 15 Mar 2026
 19:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev> <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
In-Reply-To: <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 19:32:54 -0700
X-Gm-Features: AaiRm52_478_pqzpMaMH6nJQtQvcaF-xKuK5uDWZ-u00xGMYRYKMJPl6M-Q1q5E
Message-ID: <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
Subject: Re: [PATCH 05/15] fs: afs: correctly drop reference count on mapping failure
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
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
X-CRM114-CacheID: sfid-20260315_193307_514522_2465E843 
X-CRM114-Status: GOOD (  36.06  )
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

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgNTowMOKAr0FNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMDQ6
MDc6NDNBTSAtMDcwMCwgVXNhbWEgQXJpZiB3cm90ZToKPiA+IE9uIFRodSwgMTIgTWFyIDIwMjYg
MjA6Mjc6MjAgKzAwMDAgIkxvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSIgPGxqc0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Cj4gPiA+IENvbW1pdCA5ZDU0MDNiMTAzNmMgKCJmczogY29udmVydCBtb3N0
IG90aGVyIGdlbmVyaWNfZmlsZV8qbW1hcCgpIHVzZXJzIHRvCj4gPiA+IC5tbWFwX3ByZXBhcmUo
KSIpIHVwZGF0ZWQgQUZTIHRvIHVzZSB0aGUgbW1hcF9wcmVwYXJlIGNhbGxiYWNrIGluIGZhdm91
ciBvZgo+ID4gPiB0aGUgZGVwcmVjYXRlZCBtbWFwIGNhbGxiYWNrLgo+ID4gPgo+ID4gPiBIb3dl
dmVyLCBpdCBkaWQgbm90IGFjY291bnQgZm9yIHRoZSBmYWN0IHRoYXQgbW1hcF9wcmVwYXJlIGNh
biBmYWlsIHRvIG1hcAo+ID4gPiBkdWUgdG8gYW4gb3V0IG9mIG1lbW9yeSBlcnJvciwgYW5kIHRo
dXMgc2hvdWxkIG5vdCBiZSBpbmNyZW1lbnRpbmcgYQo+ID4gPiByZWZlcmVuY2UgY291bnQgb24g
bW1hcF9wcmVwYXJlLgoKVGhpcyBpcyBhIGJpdCBjb25mdXNpbmcuIEkgc2VlIHRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIGRvZXMKYWZzX2FkZF9vcGVuX21tYXAoKSBhbmQgdGhlbiBpZiBnZW5l
cmljX2ZpbGVfbW1hcF9wcmVwYXJlKCkgZmFpbHMgaXQKZG9lcyBhZnNfZHJvcF9vcGVuX21tYXAo
KSwgdGhlcmVmb3JlIHJlZmNvdW50aW5nIHNlZW1zIHRvIGJlIGJhbGFuY2VkLgpJcyB0aGVyZSBy
ZWFsbHkgYSBwcm9ibGVtPwoKPiA+ID4KPiA+ID4gV2l0aCB0aGUgbmV3bHkgYWRkZWQgdm1fb3Bz
LT5tYXBwZWQgY2FsbGJhY2sgYXZhaWxhYmxlLCB3ZSBjYW4gc2ltcGx5IGRlZmVyCj4gPiA+IHRo
aXMgb3BlcmF0aW9uIHRvIHRoYXQgY2FsbGJhY2sgd2hpY2ggaXMgb25seSBpbnZva2VkIG9uY2Ug
dGhlIG1hcHBpbmcgaXMKPiA+ID4gc3VjY2Vzc2Z1bGx5IGluIHBsYWNlIChidXQgbm90IHlldCB2
aXNpYmxlIHRvIHVzZXJzcGFjZSBhcyB0aGUgbW1hcCBhbmQgVk1BCj4gPiA+IHdyaXRlIGxvY2tz
IGFyZSBoZWxkKS4KPiA+ID4KPiA+ID4gVGhlcmVmb3JlIGFkZCBhZnNfbWFwcGVkKCkgdG8gaW1w
bGVtZW50IHRoaXMgY2FsbGJhY2sgZm9yIEFGUy4KPiA+ID4KPiA+ID4gSW4gcHJhY3RpY2UgdGhl
IG1hcHBpbmcgYWxsb2NhdGlvbnMgYXJlICd0b28gc21hbGwgdG8gZmFpbCcgc28gdGhpcyBpcwo+
ID4gPiBzb21ldGhpbmcgdGhhdCByZWFsaXN0aWNhbGx5IHNob3VsZCBuZXZlciBoYXBwZW4gaW4g
cHJhY3RpY2UgKG9yIHdvdWxkIGRvCj4gPiA+IHNvIGluIGEgY2FzZSB3aGVyZSB0aGUgcHJvY2Vz
cyBpcyBhYm91dCB0byBkaWUgYW55d2F5KSwgYnV0IHdlIHNob3VsZCBzdGlsbAo+ID4gPiBoYW5k
bGUgdGhpcy4KCm5pdDogSSB3b3VsZCBkcm9wIHRoZSBhYm92ZSBwYXJhZ3JhcGguIElmIGl0J3Mg
aW1wb3NzaWJsZSB3aHkgYXJlIHlvdQpoYW5kbGluZyBpdD8gSWYgaXQncyB1bmxpa2VseSwgdGhl
biBoYW5kbGluZyBpdCBpcyBldmVuIG1vcmUKaW1wb3J0YW50LgoKPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4KPiA+ID4g
LS0tCj4gPiA+ICBmcy9hZnMvZmlsZS5jIHwgMjAgKysrKysrKysrKysrKysrKy0tLS0KPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvZnMvYWZzL2ZpbGUuYyBiL2ZzL2Fmcy9maWxlLmMKPiA+ID4gaW5k
ZXggZjYwOTM2NmZkMmFjLi42OWVmODZmNWUyNzQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2ZzL2Fmcy9m
aWxlLmMKPiA+ID4gKysrIGIvZnMvYWZzL2ZpbGUuYwo+ID4gPiBAQCAtMjgsNiArMjgsOCBAQCBz
dGF0aWMgc3NpemVfdCBhZnNfZmlsZV9zcGxpY2VfcmVhZChzdHJ1Y3QgZmlsZSAqaW4sIGxvZmZf
dCAqcHBvcywKPiA+ID4gIHN0YXRpYyB2b2lkIGFmc192bV9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqYXJlYSk7Cj4gPiA+ICBzdGF0aWMgdm9pZCBhZnNfdm1fY2xvc2Uoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICphcmVhKTsKPiA+ID4gIHN0YXRpYyB2bV9mYXVsdF90IGFmc192bV9tYXBfcGFn
ZXMoc3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBnb2ZmX3Qgc3RhcnRfcGdvZmYsIHBnb2ZmX3QgZW5k
X3Bnb2ZmKTsKPiA+ID4gK3N0YXRpYyBpbnQgYWZzX21hcHBlZCh1bnNpZ25lZCBsb25nIHN0YXJ0
LCB1bnNpZ25lZCBsb25nIGVuZCwgcGdvZmZfdCBwZ29mZiwKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKip2bV9wcml2YXRlX2RhdGEpOwo+ID4g
Pgo+ID4gPiAgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBhZnNfZmlsZV9vcGVyYXRpb25z
ID0gewo+ID4gPiAgICAgLm9wZW4gICAgICAgICAgID0gYWZzX29wZW4sCj4gPiA+IEBAIC02MSw2
ICs2Myw3IEBAIGNvbnN0IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgYWZzX2ZpbGVf
YW9wcyA9IHsKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29w
ZXJhdGlvbnNfc3RydWN0IGFmc192bV9vcHMgPSB7Cj4gPiA+ICsgICAubWFwcGVkICAgICAgICAg
PSBhZnNfbWFwcGVkLAo+ID4gPiAgICAgLm9wZW4gICAgICAgICAgID0gYWZzX3ZtX29wZW4sCj4g
PiA+ICAgICAuY2xvc2UgICAgICAgICAgPSBhZnNfdm1fY2xvc2UsCj4gPiA+ICAgICAuZmF1bHQg
ICAgICAgICAgPSBmaWxlbWFwX2ZhdWx0LAo+ID4gPiBAQCAtNTAwLDEzICs1MDMsMjIgQEAgc3Rh
dGljIGludCBhZnNfZmlsZV9tbWFwX3ByZXBhcmUoc3RydWN0IHZtX2FyZWFfZGVzYyAqZGVzYykK
PiA+ID4gICAgIGFmc19hZGRfb3Blbl9tbWFwKHZub2RlKTsKPiA+Cj4gPiBJcyB0aGUgYWJvdmUg
YWZzX2FkZF9vcGVuX21tYXAgYW4gYWRkaXRpb25hbCBvbmUsIHdoaWNoIGNvdWxkIGNhdXNlIGEg
cmVmZXJlbmNlCj4gPiBsZWFrPyBEb2VzIHRoZSBhYm92ZSBvbmUgbmVlZCB0byBiZSByZW1vdmVk
IGFuZCBvbmx5IHRoZSBvbmUgaW4gYWZzX21hcHBlZCgpCj4gPiBuZWVkcyB0byBiZSBrZXB0Pwo+
Cj4gQWggeWVhaCBnb29kIHNwb3QsIHdpbGwgZml4IHRoYW5rcyEKPgo+ID4KPiA+ID4KPiA+ID4g
ICAgIHJldCA9IGdlbmVyaWNfZmlsZV9tbWFwX3ByZXBhcmUoZGVzYyk7Cj4gPiA+IC0gICBpZiAo
cmV0ID09IDApCj4gPiA+IC0gICAgICAgICAgIGRlc2MtPnZtX29wcyA9ICZhZnNfdm1fb3BzOwo+
ID4gPiAtICAgZWxzZQo+ID4gPiAtICAgICAgICAgICBhZnNfZHJvcF9vcGVuX21tYXAodm5vZGUp
Owo+ID4gPiArICAgaWYgKHJldCkKPiA+ID4gKyAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4g
Kwo+ID4gPiArICAgZGVzYy0+dm1fb3BzID0gJmFmc192bV9vcHM7Cj4gPiA+ICAgICByZXR1cm4g
cmV0Owo+ID4gPiAgfQo+ID4gPgo+ID4gPiArc3RhdGljIGludCBhZnNfbWFwcGVkKHVuc2lnbmVk
IGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBwZ29mZl90IHBnb2ZmLAo+ID4gPiArICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqKnZtX3ByaXZhdGVf
ZGF0YSkKPiA+ID4gK3sKPiA+ID4gKyAgIHN0cnVjdCBhZnNfdm5vZGUgKnZub2RlID0gQUZTX0ZT
X0koZmlsZV9pbm9kZShmaWxlKSk7Cj4gPiA+ICsKPiA+ID4gKyAgIGFmc19hZGRfb3Blbl9tbWFw
KHZub2RlKTsKPiA+ID4gKyAgIHJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICBzdGF0
aWMgdm9pZCBhZnNfdm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiA+ID4gIHsK
PiA+ID4gICAgIGFmc19hZGRfb3Blbl9tbWFwKEFGU19GU19JKGZpbGVfaW5vZGUodm1hLT52bV9m
aWxlKSkpOwo+ID4gPiAtLQo+ID4gPiAyLjUzLjAKPiA+ID4KPiA+ID4KPgo+IENoZWVycywgTG9y
ZW56bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
