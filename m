Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9790606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 22:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wnVU8w+H;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TedXizmB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MiSiLAUSmE/F7q7h6lWr/lb4vsKJPqQ8/agP9GoJnMk=; b=wnVU8w+HLiJ1O2Dz2bj/qD9ZBJ
	JSez20CoEXNWYfHlMPbrYyHKJWUDKUki5Jd3+iC35P6z2U68LR6m7C4shZRoDr+MhHBoO8Ue2yl73
	82pUMKB8B0pStBaXZrVElkCh9gtwC+4WY21ky2Zz7PKN2LPwNNvtiJxqSrdszZnD/PlefDOIwZzIJ
	pTD+IXQjIGZ7SXA2tgj0qqrlNU9Jq9O4zsWgfegF7cnvDj+sKvVkks+Fi7+48JT7m14WZRblqosWU
	dWUkyOnDRIw7QcHdjMlmDic58YKkrweGcaStTBwaWFu5Lrif9z/9fGodMdnQ9igsejkrHix3i7OCy
	DUCVoSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMBqB-000000080qN-1WET;
	Wed, 28 Oct 2026 22:09:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMBq8-000000080pz-3VlK
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 22:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793225385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5xHrk121VJ6jsiOiBImMpaem11Ex15L22vqkzMRx+Y=;
	b=TedXizmB7pROzC9yt8Z7ACZA27xmpwy51y1aiuneppXqSiGKuR4aEsoOr5xdk5Ne2ImeGL
	TD0uumQBds8lae5xyjeYMpYLNeI0EGFYWRwMn0ARRw517Vnw/+0vjBkglsRXZYrpE3z08j
	IwWw0vrVGXZU3PtiX9cbWcUB9LBKFA4=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-pOJmS4-pPF-yfjypuCvmfA-1; Wed, 28 Oct 2026 18:09:43 -0400
X-MC-Unique: pOJmS4-pPF-yfjypuCvmfA-1
X-Mimecast-MFC-AGG-ID: pOJmS4-pPF-yfjypuCvmfA_1793225383
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67906c453b8so313567d50.1
        for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 15:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225383; x=1793830183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5xHrk121VJ6jsiOiBImMpaem11Ex15L22vqkzMRx+Y=;
        b=D63dBwuu8C13i0fFdhSkdRx1CucFEABnsocNUoz3Hr0+ja4IkiIBKdqPy8DXItuKXF
         y/KUhp19zS0EwwUzQX4gf5G3zwpWlYs/t/zhbLa1oGu0DbSxNlcxGBv7PI8QLdRdUJAE
         ATe2f5P2v4sSLTxE1Wnd952H3j9Z9jkiIsCLrDuMgp5gEZSitU4vWeeyp9KwTJ+nZGlY
         PyT4zw1c/GzfYNFHnHZqHIpR/XkzbESpWPY6nQu1ZO8gi6TJ8DgCLCU/vUwCcRrwfEhm
         PMAmaaRBMOF7n6dvlJ0zBe1LQ4q872g2w1e8tWIUPvv6JutmKuE4XGl0yPiIW5P+zkOp
         xDPA==
X-Forwarded-Encrypted: i=1; AKwUvBy2EzxTK6azvWqcPSBsS3xq2Pyb9A7d8zYLxTBXylAvM//bmAwanziK9Truaxf+6KNM7YuiPs9U8AM=@lists.infradead.org
X-Gm-Message-State: AFq9FYJvdwGOWB6LsYaqMVVmhJFv8mPSvcYFDFg8ay8mPUzKMyKcXDId
	5TpDc4LB7LQkU+mnQEhmx/lSu8ZcGx+ydJESJgZHcBMuW14q5roXIphNEmP+Fz5epCDiS/CTdvL
	TPq+WjZi/tPb/A3oklnd3ZMg4JnqoAUmmDryfzeflw+bwmd6XSN4sys8ctLkbNgrmI94O0zEi01
	0+gMOPUesuTUdWILgQ+t0dFYLAiv4SJdudn5XNDljSNg==
X-Gm-Gg: AYBFou1oq7VsF3DqZYqenFyFNtyUeLuQg/ihxAYS2W5JxvY8bp1EGujyR3AZzrRDFSi
	ZxhAyCKHkwoojoItUTLiy4gWOG44n1cuTpJ40rpyJen7tKnbi0H5Fr/RCqemIMZZ9FqSVEhQOKW
	WMgK4W+2F7CP2n7l6mGbgaZTySuB5AmlYGDGhbQXi+h4SSGgHBEic/Eo4WvStHPIrUaKMluNcUF
	2U/t0vZ9nE+MRT0+7awSiimdLmpsXe7ruw1fiWruk/x/w==
X-Received: by 2002:a05:690e:1918:b0:679:ad2f:3fbf with SMTP id 956f58d0204a3-67a8d0047a5mr704867d50.8.1793225382841;
        Wed, 28 Oct 2026 15:09:42 -0700 (PDT)
X-Received: by 2002:a05:690e:1918:b0:679:ad2f:3fbf with SMTP id
 956f58d0204a3-67a8d0047a5mr704846d50.8.1793225382297; Wed, 28 Oct 2026
 15:09:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <20261012-work-fs-sb_rdonly-v1-21-60743a3dc326@kernel.org>
 <CAHc6FU6z4kX5R3Og8m0dYOHsjFcw+4Btvfe87AGPxy_EWs0E7A@mail.gmail.com> <20261028-zurschaustellen-okkupieren-inkompatibel-d11525ce88b8@brauner>
In-Reply-To: <20261028-zurschaustellen-okkupieren-inkompatibel-d11525ce88b8@brauner>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 28 Oct 2026 23:09:31 +0100
X-Gm-Features: AclHuK9MzobLdiG2EG9M5KT_ibZzYxdrTghiXff6ZlesOE7YSK8Ag_RtXekxyZI
Message-ID: <CAHc6FU6VSAWQ4RJTO_eLnpqN5qvrShbJeT+ADwiA6ohpq8dO4Q@mail.gmail.com>
Subject: Re: [PATCH RFC 21/28] gfs2: don't set SB_RDONLY on withdraw
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ntfs@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kEpTSNeGgNJKrZjyV9h3U-9Zj5FKJU2UEgMk5p_HM0U_1793225383
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_150948_954965_6270CFB1 
X-CRM114-Status: GOOD (  12.84  )
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgMjgsIDIwMjYgYXQgNTowMuKAr1BNIENocmlzdGlhbiBCcmF1bmVyIDxicmF1
bmVyQGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIEZyaSwgT2N0IDE2LCAyMDI2IGF0IDAyOjAxOjAw
QU0gKzAyMDAsIEFuZHJlYXMgR3J1ZW5iYWNoZXIgd3JvdGU6Cj4gPiBBY2NvcmRpbmcgdG8gY29t
bWl0IGQ1NjQwNTNmMDc0NiAoIkdGUzI6IENsZWFuIHVwIGZyZWV6ZSBjb2RlIiksIHRoZQo+ID4g
aWRlYSBvZiB0aGUgZnJlZXplIHN5c2ZzIGZpbGUgd2FzIHRvIG1ha2UgaXQgYmVoYXZlIGxpa2Ug
dGhlIEZJRlJFRVpFCj4gPiAvIEZJVEhBVyBpb2N0bHMuIFRoaXMgaXNuJ3Qgd2hhdCB0aGUgY29k
ZSBpcyBkb2luZyBhdCBhbGwuCj4KPiBUaGF0J3MgYSBwcmUtZXhpc3RpbmcgYW5kIHNlcGFyYXRl
IGZyb20gdGhpcyBzZXJpZXMuIGZyZWV6ZV9zdG9yZSgpIGNhbGxzCj4gZnJlZXplX3N1cGVyKCkg
YW5kIHRoYXdfc3VwZXIoKSBkaXJlY3RseSB3aXRoIEZSRUVaRV9IT0xERVJfVVNFUlNQQUNFIGFu
ZCBuZXZlcgo+IGdvZXMgdGhyb3VnaCBnZnMyX2ZyZWV6ZV9zdXBlcigpIGFuZCBnZnMyX3RoYXdf
c3VwZXIoKS4gU28gaXQgbmV2ZXIgdGFrZXMgdGhlCj4gZnJlZXplIGdsb2NrLiBJIGRvbid0IHRo
aW5rIHRoYXQncyBmb3IgdGhpcyBzZXJpZXMgdG8gZml4LgoKSSBtYWlubHkgd2FudGVkIHRvIHBv
aW50IG91dCB0aGF0IHRoaXMgYmVoYXZpb3IgaXNuJ3QgaW50ZW50aW9uYWwuCgpUaGFua3MsCkFu
ZHJlYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
