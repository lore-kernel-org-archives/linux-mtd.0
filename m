Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FC510706ED
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 16:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wY8hkHmvD4M9fqea9KYyAdap42uuoySH118IliDUjJ4=; b=xB+0kd3VZ+Vlio
	sWzM3dl2tk4XapgOIQhAcJusSL/1jdixv/tlZh1D4TODSRZWFT8ga0SVRGnzvsFZdLEWZwQvGQJo8
	VvUipVzfLEBi1PlxH1P4+8kiaP2C0wDhuTIdMfTr5kEAp0BpuidgD5WMR3f8dVKVuxtuS85sGZwzZ
	OVOLba5Zcue4u3Tc2D+dNPiQte4xxVXP4sGv8OiYp/akgti85bps+YtiKoCQXoPfuSUtzQjlCsfEP
	YVGEwCOi3DOEBtW1FMV+AfQ2xmDLCGNuMxUxkVt7Bp1iw3oRafMy+YtwiAE16LldR6zurzh6/EdHX
	17+YD/roCqW3HtYLhORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tLl-00000008sUA-03HZ;
	Wed, 18 Mar 2026 16:02:25 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tLf-00000008sSv-336J
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 16:02:20 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-509069a7a7fso645201cf.0
        for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2026 09:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849738; cv=none;
        d=google.com; s=arc-20240605;
        b=Wd0zADtCDyrVwDf7gGuAmUijeLm6geFM6F1mRv8d+Ryyo0+z+Fw1TlsqkdTnjeu53q
         irJrfWfcLn8O+MfmlV1Vwr7KxGFzhvE2Kn2SE3mLJJYlzkCmlUPxCRnHmO+yW9Yn8EfU
         DYeM8647mpGlIy7ojge962xCATt2Qg/dcG2CTRMjk4qZXPS39ZSFaoX0KGeBUmP0Cmlt
         mTi4xdnpdqy8qayIltFZ2awr60JhHon/PfWKU8w4OmCKd9wHH0zvnoHjS45WRUJWPIl1
         LTKfIOafmuvrYvjaMMwRKUvuQ9hYM56Rr13l6SmlIKBq91mdoAR8jeNFMElpByFiromX
         LaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        fh=snuTwjBDjLYtgpPvbaCQAPNm9HnW3m7MeFrGG2GWmVA=;
        b=PQQr3CApyHm6jFBdSjDlXRtjVLs3Rsy37qvHt8fmPI533i81mnAo7g0DEASwfQLg+H
         jF64QbtRsltrpql+ZAmUQx/y/gph6rCwD+O7vt/LHChR2w6LGOcA/oMW8FvBE3akDzvC
         C+IDoK/kmpzX5zSmJHFExDDfe9E8nv3ay4Fi6nwizcKhW0jje4/t5pGWvn5NcCsxEQd2
         NRCDx7nRkjJeUgU/7M6Z09oLl1IFFeVLhe+RMrW9yhhtmPZB5h7qTotpNkSPCnD3vbec
         J0smoNrn1Ota2rBVP7zYStl6WYbMlZ7Z9FEPClgw2sgZUcRT4TErGbLAP8sbPaJww8Ij
         woYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773849738; x=1774454538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        b=PHaZwHbz52RjFajr4pmKQ1kqoN/1pDQMuq/RFtT9dsotyb6gsWDdb7hBaebvomfWNo
         6Mp3tLQ7XgX5s+7C22Xlu2OTC4fXetbuRyApIatiOvSFWymBKpeXYsOO2+u9yyKhHgmv
         k+fX2pV/lvE1ljt/pwZI96nVQ4nrosdI7U1vUjFCXjFrPw48IuyW59UCJloIsRCZfTC+
         FcD/f1h9M0GjPpLm8Hd/YYFq4GLw9O+hgPFc4k7AuFvqTfFLAmTL5St0bsCoSWvfpgeF
         nNlbxLcXRzh/P2mQI+YhykmDkhNi0sIh+kn84pGi8EzN+dcWsL2jGrqjfWD2fT1Ba2Qm
         KGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849738; x=1774454538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        b=EIz0u9AJDebDXKMJ8qatql0gnQOVOqmL95sqDmQdgs6GK3lZMLWvIE7R/uET6aUbOp
         UGZhGLoIdGY4vIWHgUlaBmzTz1imZoc1zeJ+qjWwr7uKwkVM0xmR+LUWyh15sFlCaell
         iw4Qvn5qKR1WpmgpWzwSCmHjdLR1hXiGG/8F/BQ5y3nP1yG58zLAy5JudQD2kczodxKd
         H9seCiWA1GhLgoYuXVamJv2f3B0IgdFtVgr7GAvpmT3IFHOAaW6NKZx8jnKetvHwm5yo
         CkpPZIvteeexnZ8wa59hUl0v0KKGd1za6TiUW6KriXUxQ4GZuUC6tTYBl+lY22Q5nNyl
         xNOw==
X-Forwarded-Encrypted: i=1; AJvYcCUOdg85ChCoJZowv6DfdK3TS0smS3uyyeDe03/CgF2CVVpa2vNbp6QCQzoDJ4rFZKBujZdY4AmeHLw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/d6zSWyYjJ0uLGjMrL3GlP48610tnsxZPUhklQalveOSOycOc
	N+w2t0hns9Yau9wdAZ0tWlsAAaq4PHSusbYI5/i+BDYAJDEqoBm2z+y2Z0/YwUfXdh8hQTfXqo3
	Pb2zeCOk6+/o1Wdp2cNquXy91wH+o4Xx7n3xigZWi
X-Gm-Gg: ATEYQzyJmXshdIbYGYByQ6yaNws8reAIci3GWAI9bGmDhgSlGH6fV/Pj4IF+JdDv0Og
	apeSPradErmeqeGSA3x4bzYNfNL3QxZ/w4e8NLGWtqPU4EeklYevAKRhCeBpkJaW1VxclZJha9P
	9vru6IU1MAVoGAsN/mEttDqJ2PotOqMnU69IQVrDzbuWTt4V3lgI4BHuA2m8s3LGY0EnBcALxI3
	g2s0gQzC9QjrT7DaPhcPkjjqKSyy5sn/PT3IqWljz8uoLEJw9KiYMf8dJ+OTGYwxO5/frDyvsQc
	ykPzBao+9UE7wtwGe8jgDeNj29TynAAgLzOrBmEL7uTbLSzB
X-Received: by 2002:ac8:5d4e:0:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-50b1462cacfmr16816931cf.0.1773849737454; Wed, 18 Mar 2026
 09:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
In-Reply-To: <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Mar 2026 09:02:04 -0700
X-Gm-Features: AaiRm52kf0p9Fxu6EolM9nhc_2BIDOLEzyHhrKwtGPKlzkXo42y6XvhNDeOCJ6g
Message-ID: <CAJuCfpFd-d-E24d5-G6=dSYDpyHkwS=aXzGd6+SzyMkgssyPAw@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] mm: on remap assert that input range within the
 proposed VMA
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
X-CRM114-CacheID: sfid-20260318_090219_769576_7173C503 
X-CRM114-Status: GOOD (  17.94  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxNOKAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gTm93IHdlIGhhdmUgcmFuZ2VfaW5fdm1hX2Rl
c2MoKSwgdXBkYXRlIHJlbWFwX3Bmbl9yYW5nZV9wcmVwYXJlKCkgdG8gY2hlY2sKPiB3aGV0aGVy
IHRoZSBpbnB1dCByYW5nZSBpbiBjb250YWluZWQgd2l0aGluIHRoZSBzcGVjaWZpZWQgVk1BLCBz
byB3ZSBjYW4KCnMvaW4gY29udGFpbmVkL2lzIGNvbnRhaW5lZAoKPiBmYWlsIGF0IHByZXBhcmUg
dGltZSBpZiBhbiBpbnZhbGlkIHJhbmdlIGlzIHNwZWNpZmllZC4KPgo+IFRoaXMgY292ZXJzIHRo
ZSBJL08gcmVtYXAgbW1hcCBhY3Rpb25zIGFsc28gd2hpY2ggdWx0aW1hdGVseSBjYWxsIGludG8g
dGhpcwo+IGZ1bmN0aW9uLCBhbmQgb3RoZXIgbW1hcCBhY3Rpb24gdHlwZXMgZWl0aGVyIGFscmVh
ZHkgc3BhbiB0aGUgZnVsbCBWTUEgb3IKPiBjaGVjayB0aGlzIGFscmVhZHkuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPgoKUmV2aWV3
ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBt
bS9tZW1vcnkuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9tbS9tZW1vcnkuYyBiL21tL21lbW9yeS5jCj4gaW5kZXggODQ5ZDVkOWVl
YjgzLi5kZTBkZDE3NzU5ZTIgMTAwNjQ0Cj4gLS0tIGEvbW0vbWVtb3J5LmMKPiArKysgYi9tbS9t
ZW1vcnkuYwo+IEBAIC0zMTQyLDYgKzMxNDIsOSBAQCBpbnQgcmVtYXBfcGZuX3JhbmdlX3ByZXBh
cmUoc3RydWN0IHZtX2FyZWFfZGVzYyAqZGVzYykKPiAgICAgICAgIGNvbnN0IGJvb2wgaXNfY293
ID0gdm1hX2Rlc2NfaXNfY293X21hcHBpbmcoZGVzYyk7Cj4gICAgICAgICBpbnQgZXJyOwo+Cj4g
KyAgICAgICBpZiAoIXJhbmdlX2luX3ZtYV9kZXNjKGRlc2MsIHN0YXJ0LCBlbmQpKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiArCj4gICAgICAgICBlcnIgPSBnZXRfcmVtYXBf
cGdvZmYoaXNfY293LCBzdGFydCwgZW5kLCBkZXNjLT5zdGFydCwgZGVzYy0+ZW5kLCBwZm4sCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRlc2MtPnBnb2ZmKTsKPiAgICAgICAgIGlm
IChlcnIpCj4gLS0KPiAyLjUzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
