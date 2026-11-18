Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF61C606A320
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 19:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h7jhRYNC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTQ1Fs7d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qNdeoUfAErCwOwrJ5nh8YRD+dKUQ13NjS8qY5eafdd0=; b=h7jhRYNCUJqYXJpjAN3RSp4V9/
	gqzwRVuG1GHIIEHeYs1LW5roGPpyQr13EQMj+SBemuYqMEbnz8dp4py+sVo/D0VU1MKIcj1xr3YBf
	W7trfC+O2PkT9xssyB+K2347sV+3sAxQNWeoloR7juKX8PsbWR21pARce4U8MORG4VtlbqDqrbbw5
	RYEJpNcFs7DDIUGEPCjRoHwu53QUmTArSvmI2zBjmfjaldfB8wmGSf/RTXzr+Z/cJlBPnZXfy+ocp
	5+LFPnrPien2rMb7/6xthsaFqepthYTeDwnMiSQRbOHSAQvT5im8mJNf9Ci1L7p6Ye5xdGcQfSU97
	MuRCcDXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl4B-0000000A5WE-2ThK;
	Wed, 18 Nov 2026 19:11:35 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl47-0000000A5VI-0eal
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 19:11:34 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-99071945aa7so688379241.3
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 11:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795029090; cv=none;
        d=google.com; s=arc-20260327;
        b=Y3RjWBJAO8oBNBC43+XSrY5oayTKqcBxg7GnUfiCtMIg7ihrOk2E4Mbnr+t54Ni3mL
         jxu4mTBKP9Qw2Ug/FSMdMxaILW87PxEEgTNbjMEituxE8PBXLHauA2KS994AoGlPXLlb
         dUmaKNVDw13xYZuYt4tLjRJWNgGPpGr9eZ2Fd5pvKI+j6mIivzBY4+pOMXTwZLDFvIwh
         GsmI/pawZN6tz9+Cj6yVQ+yhKuLK/eebl5v7uNlDa0Og7AHXuFlC7pd/ufIqMhqabXy8
         2/k1Nxj2qDO0B85rtE91OcLAzGTVNWwQ3NhTcVOJt8HKYIROVum9puUbzGFot5FMw8NG
         6cNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LXEkYGgvMWa5pDFl9sPPUTFtCXHqqa1pcN02A0ROHOE=;
        fh=swgcKIOR8PkUYZi/JqthYXc6A2Eb5u8nQl8nrhcfp1Y=;
        b=CytH5Le0qO0kC5Z6nIq5JFkMVHa7sJyTRoqEq5EemY+NhAnXjp0p6mM3NmJxFU5Vwj
         xHw4LhB4nPltj3gxN5oBqCgut7jVvS+q6pwpkQtB9ZPKtit2LfFg2YqbGG9apZJgWfAu
         5oJNYuDK21A1+gGemM3cWSK/QE1++9JXAgihs8hM7Z/1+Tk10a7KulqwuK8xaefL+hLw
         ls8D2x8AFsrHy1H+FABXronR8tNukpqfvNbzP/AttlYDFCia2/MY+0J2VmctcdqwbYVi
         IyT9l4PoD/ArqSPkbS4MZM9dJWVoV5x/ATuNIM7PIAcrihGQYoCPI+1zPVVW/kmquVDf
         Zwsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029090; x=1795633890; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LXEkYGgvMWa5pDFl9sPPUTFtCXHqqa1pcN02A0ROHOE=;
        b=lTQ1Fs7du9ELSzOMv8aWiCNpBL2imkopTtAGg0zdzhx1QG3/EreZurOT7oqgZQINus
         EhdlZFbgeB3zaMK3i46UWnx/XoZgsHm6m9KufNxxW6Au5knCh+Qd+e6aGV60Lb1yZ9nB
         ewMBK9TyXs2/H33JkNS2sxaUz3fELGJtD/RJQKqoeC4L/Lo5QMkVdxdMndhSgNWd1LBs
         0uX1ogLh/vc9fZv4PQmMF9+JHQMqzw8YxomOeniMaw1v/xO69X5+8fNE69m7FUI/DFZB
         KPrkmtlah5SLQTHm1V3vRv02Hs3Xb611Q2aMGiXPLjFgS+TDpvab0tkHqcyUV7IRt2qF
         iwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029090; x=1795633890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LXEkYGgvMWa5pDFl9sPPUTFtCXHqqa1pcN02A0ROHOE=;
        b=ycZh6nC3IX23i5B33ZCxf4i+NEB7EUjpvb+qAVyoEYOfpM6kLFgTPEHjcvGjNyykwB
         6B8mpv2IoqLS3Am1p7BdgyFMt3XR1gX/oZCu83kvlHw5VYCplzND3sHsZzwsjBFtnHlJ
         LMa/5sT7hms/EFtYi8PPYdHrNYOw9GK5lrCs8NKAxECLiW5vbJzKKZcMuXrIcXf/fe87
         d1pN68r+hjULvJLz3Hg7hy5nLbBqG7DbDfsDfGotsOVKCXfcDKVkeOQLkks1Cl8vGDz9
         bCSCiD3TqS3PpuNxLH6i+jLIhv1oRNu1Rzagz5QwgrEdzgnDuMgWZaxYhEDK00SkUmZv
         69vg==
X-Forwarded-Encrypted: i=1; AL+hErHMahUp6eHpPWAZdRRYAOrRfoKUa7/YPxA9eacnLJsH6hsDWaudLXRzpjtJTDExzXvgjMorBDjc4Hk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/3xl6vzUpiStmjzjtD5iUntUmYcHsrr8+5BKgjsxh4c7seBSBJ
	n3hsHNZajyupdZQCZPoRzYDV/5FdrzmMMEKJNjMOs71OxL1DsRxZYeguz7QqlbI+jPcB6U5PyvE
	VNyQuczHJ86F6qlfrWz9MdOGkQGhXm4X4yRfqV6c=
X-Gm-Gg: AYBFou2O7OU5ITv6yCu39labZjXqf2gt5A/N2yylHMa5zzNVTalDvtw5uboyZJTE678
	X4IErKhEyg2oGG8u1r/VNyqaURZ4CphuKmBQQH7Mo0QdCuCRkm59FVZ+xB9ZBw7d49s8c3BvvWn
	Lc+gSDNKXg1t+BBL8IOoFgV5grSVeq2dHo0oyBd1kB4xlgjTD00zovFdIXiMn+RANhwUncKrzr+
	nU6UBU3k0gdiTpsx/GA0vDY3PZNQwPXX+sJtQJMQ7LXhH4afwoEbaG3TGkCvWdQOSzR/JQHcTG3
	uWsP8vc3FMb2J2IcjJsqTdnrKKHBkrO4gqIxuLheH1Yw9TDziCx9fZlGjawUX1R1w//ipbbBsQp
	B/QTa3QmqNRzRVn+GPhU954EU2El0yNu/Fo4rMoFOavZtav13ccH/vHyZswT7mZNdi1uHy1EZhh
	+gYgQZnG4F2Hg1886jsnoieB6lz1L01SwjkQPq+KYsEzMpJWx32RV55WltMLhP7HFrxA6QryXTX
	R1HbYMedClTIgbYLEFgTNk/ugQlfA==
X-Received: by 2002:a05:6102:14aa:b0:7d2:d45e:5c93 with SMTP id
 ada2fe7eead31-7d6ba3e9fa3mr1819932137.9.1795029089923; Wed, 18 Nov 2026
 11:11:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
 <87fqwyjwvk.fsf@bootlin.com>
In-Reply-To: <87fqwyjwvk.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 12:11:19 -0700
X-Gm-Features: Aa3M54p2_ByIWbVJYkEEnfzHCTB6JzDSXDEIgLPfoD2Cp1gkQl0pFmaXqwRwPHU
Message-ID: <CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
	"Artem B. Bityuckiy" <dedekind@infradead.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_111131_210120_6EEF260E 
X-CRM114-Status: GOOD (  24.30  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMjo0NeKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMDMvMTEvMjAyNiBhdCAyMjo1MjozOSAt
MDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+
ID4gY3JlYXRlX2JidCgpIHJldHVybnMgYW4gZXJyb3IgaWYgcmVhZGluZyBhIGJhZC1ibG9jayBt
YXJrZXIgZmFpbHMsCj4KPiBUaGlzIHNlbnRlbmNlIGRvZXMgbm90IG1lYW4gYW55dGhpbmcuCj4K
PiA+IGJ1dAo+ID4gY2hlY2tfY3JlYXRlKCkgaWdub3JlcyB0aGF0IHJlc3VsdC4gSXQgY2FuIGFz
c2lnbiB2ZXJzaW9uIDEgdG8gdGhlCj4KPiBUaGF0J3MgYWxzbyB1bmNsZWFyLgoKSXQncyBqdXN0
IHN0YXRpbmcgd2hlcmUgYW4gdW5jaGVja2VkIHJldHVybiBleGlzdHMgYWxvbmcgd2l0aCB0aGUK
cG90ZW50aWFsIGNvbnNlcXVlbmNlcyBvZiBjb250aW51aW5nIHdpdGhvdXQgY2hlY2tpbmcgdGhl
IHJldHVybi4KQXQgbGVhc3QgdGhhdCB3YXMgaG93IEkgcmVhZCBpdC4KCklzIHRoaXMgY29tbWl0
IG1lc3NhZ2UgcGhyYXNpbmcvc3R5bGUgd2VpcmQgb3Igc29tZXRoaW5nPwoKPgo+ID4gaW5jb21w
bGV0ZSBSQU0gdGFibGUgYW5kIHdyaXRlIGl0IHRvIHRoZSBwcmltYXJ5IGFuZCBtaXJyb3IgbG9j
YXRpb25zLgo+ID4gVW5zY2FubmVkIGZhY3RvcnktYmFkIGJsb2NrcyB0aGVuIGFwcGVhciBnb29k
IGluIHRoZSBwZXJzaXN0ZWQgdGFibGVzLgo+Cj4gSGVyZSBpcyBhIHByb3Bvc2FsIHdoaWNoIEkg
YmVsaWV2ZSBtYWtlcyBtb3JlIHNlbnNlOgo+Cj4gbXRkOiByYXduYW5kOiBhYm9ydCBCQlQgY3Jl
YXRpb24gb24gc2NhbiBmYWlsdXJlCj4KPiBjcmVhdGVfYmJ0KCkgY2FuIGZhaWwgb24gYSBub24t
RUNDIE9PQiByZWFkIGVycm9yLCBsZWF2aW5nIHRoZSBSQU0gQkJUCj4gcGFydGlhbGx5IHBvcHVs
YXRlZC4gSXQgaXMgcHJlZmVyYWJsZSB0byBiYWlsIG91dCBlYXJseSByYXRoZXIgdGhhbiBidW1w
Cj4gdGhlIHRhYmxlIHZlcnNpb25zIGFuZCB3cml0ZSBpbmNvbXBsZXRlIHByaW1hcnkgYW5kIG1p
cnJvciB0YWJsZXMsIHdoaWNoCj4gd291bGQgbWFyayB0aGUgdW5zY2FubmVkIGZhY3RvcnktYmFk
IGJsb2NrcyBhcyBnb29kLgoKUGVyc29uYWxseSBJIHRyeSB0byBhdm9pZCB0ZXJtaW5vbG9neSBs
aWtlICJwcmVmZXJhYmxlIiB3aGVuIGRlc2NyaWJpbmcKY29kZSBiZWhhdmlvciB0aGF0J3MgY2xl
YXJseSB3cm9uZywgYXMgInByZWZlcmFibGUiIHRvIG1lIGF0IGxlYXN0IHdlYWtseQppbXBsaWVz
IHRoYXQgdGhlIGNvZGUgaXNzdWUgYmVpbmcgZml4ZWQgY291bGQgYmUgbW9yZSBvZiBhIHN0eWxl
IGlzc3VlCnJhdGhlciB0aGFuIGEgY29ycmVjdG5lc3MgaXNzdWUuCgpUbyBtZSBib3RoIGNvbW1p
dCBtZXNzYWdlcyBzZWVtIHRvIGJlIGVxdWFsbHkgdW5kZXJzdGFuZGFibGUuCgo+Cj4gPiBQcm9w
YWdhdGUgdGhlIHNjYW4gZmFpbHVyZSBiZWZvcmUgY2hhbmdpbmcgdGFibGUgdmVyc2lvbnMgb3Ig
d3JpdGluZwo+ID4gZWl0aGVyIGNvcHkuIEtlZXAgZXhwbGljaXQgTkFORF9CQlRfQ1JFQVRFX0VN
UFRZIGluaXRpYWxpemF0aW9uIHVuY2hhbmdlZC4KPiA+Cj4gPiBGaXhlczogZWVhZGEyNGRhOGJk
ICgiW01URF0gTkFORDogUmVhZCBvbmx5IE9PQiBieXRlcyBkdXJpbmcgYmFkIGJsb2NrIHNjYW4i
KQo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFp
bC5jb20+Cj4KPiBJIHdvdWxkIHByZWZlciBpZiB5b3UgY291bGQgd3JpdGUgeW91ciBvd24gY29t
bWl0IGxvZ3MsIGdpdmluZyB1cyBtb3JlCj4gY29uZmlkZW5jZSBvbiB0aGUgd29yayB0aGF0IGhh
cyBiZWVuIGFza2VkLiBZb3UgY2FuIHVzZSBhbiBMTE0gdG8KPiBpbXByb3ZlL2VuaGFuY2UgaXQg
b2J2aW91c2x5LgoKVG8gYmUgaG9uZXN0IEkndmUgbmV2ZXIgYmVlbiBncmVhdCBhdCB3cml0aW5n
IGNvbW1pdCBtZXNzYWdlcyBpbgpnZW5lcmFsIGFuZCBoYXZlIGdvdHRlbiBhIGxvdCBtb3JlIGNv
bXBsYWludHMgYWJvdXQgY29tbWl0IG1lc3NhZ2VzCm1pc3NpbmcgaW1wb3J0YW50IGRldGFpbHMg
cHJpb3IgdG8gdXNpbmcgTExNJ3MuIEkgY2FuIGJhcmVseSB0ZWxsIHRoZQpkaWZmZXJlbmNlIGJl
dHdlZW4geW91ciBzdWdnZXN0ZWQgY29tbWl0IG1lc3NhZ2UgYW5kIHRoZSBvcmlnaW5hbCwKYm90
aCBzZWVtIG1vcmUgb3IgbGVzcyBlcXVhbGx5IHVuZGVyc3RhbmRhYmxlIHRvIG1lLCBhbHRob3Vn
aCBtYXliZQpJJ20gbWlzc2luZyBzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgb2J2aW91cz8KCkkg
ZGlkIHVzZSB5b3VyIGNvbW1pdCBtZXNzYWdlIHN1Z2dlc3Rpb25zIHRvIHJlZmluZSBteSBjb21t
aXQKbWVzc2FnZSBzdHlsZSBndWlkZWxpbmVzIHNvIGhvcGVmdWxseSB0aGF0IGhlbHBzLgoKPgo+
IFRoYW5rcywKPiBNaXF1w6hsCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
