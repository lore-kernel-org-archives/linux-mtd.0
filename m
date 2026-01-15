Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34287D4661C
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 19:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LClyCpuaeKAFb8LhL6+2czKAOAwdJ7sgj1NyPhOpCbg=; b=nOHRja23n6wssW
	TLA7qJcuHI8DOSfb40B8zKu3bOFnoWpOXgYETFQpuJmxg6Te25Ul1VzEBR+W+H8pAyWYOIo9utokI
	69SLGVGtpkzyPxO9aDK9RdWWxtfBK7l3iOfFh2CDVixnGGWAIlT0iTJKdUhWx2GQHS/ZjCPv0CRxW
	O9dN9clxIoC4XB35hAjuc5eS9qTAkf8ybdrVit3cdbpCwJjrV4jQE3ooXOpNaCAkd5MSdEPo2TU2C
	ehKhzgJuTtBwdg9pcmEFvzbBCLQQm7F59EHVAhF11xeh5bx9b1pz4iuhbWqRsJWIKN8Or00s8H9D/
	9Y8L7kXMUZhGM8GwJ0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSzX-0000000D4Ak-37Ik;
	Thu, 15 Jan 2026 19:26:47 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSzV-0000000D49i-1ZJT
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 19:26:46 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so1975766a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 11:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768505203; x=1769110003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=;
        b=j1TygUXDgHPfLriU8KNe3qYNzNWNVqZyYi2sLH8L7hSmIHW5fBbrF3dyxvedSZV5q6
         +QxaEI9Ut6Gg7NCgz4FSEt0CxLaqeoCG+jcpEh5ogorW8SoGq9pxlztH5fbThflQl/Gg
         noQoqWHS/jibxcyNvyhD47UT1CIFe9Uf/0b2DaI0074UY0BY4dZrCTTjbOFtF5YDr1dg
         RQSkuuRl5d4gmzLuoSN1Yoi4Mwq8WsQXjNhZB+euwuBgr0v/4O3XU3+bRnElQYqivMVD
         VRrLSuTRD2tcNxwuV3vWxKB99yEYI1H3m68ldmjRqP1ThmRECZpNPYHh5KRRYOOchVFn
         u9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768505203; x=1769110003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=;
        b=uGtMuFtRB6AGYLy+UqybcUhEMBK9q2FA1fp/vRlUvS984z3YcczWb5u+Ql+uULAegb
         Q6q+RMUC68aELiq92k1Flh56K+7saACE6zV3FK49wJG4v9l4nqD2mXwA19t/15g4SlZ5
         2UhT3wZjPN44GjnWh51IFKNtpRCmK4jPDXVoUgSlupnj47nppZzQ7m2M8ZF90+yF/4gj
         Lfi3Hhffll95309AAjbSh7cy1dkHxEdwprYAe0k4KRD5/5rSKFgJz36UkFXyj0o+BG1I
         kgoamAQzNIPyX/OlH70VT4QAti1yG8UIgmGxdWR4/laAo8qolco1SvVJyBSCAOEb6xj5
         c85w==
X-Forwarded-Encrypted: i=1; AJvYcCXA0Qz2MgtTeEUnbZx9hQfAl5WWjjBLdIIVL/qzM4h7SClJtcrUuRCpPNyTsycp3ShEqyxSqWwfbb4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTml8V0guj3L2ER8OaxoGGbwDc3IIvgjASvzmzHFl5YO3QBCeW
	4h5nr9uDclMOcsGzFtEAoUPWZOzwLuS20lIaUYPRN1IXrLBg1+IwNrY8vvBxCMP7aHIUIE2Nd1X
	/HIt0RULImvY9+DOagwLHD/OSPlEGa7g=
X-Gm-Gg: AY/fxX6Huww1tFcyQykMRbmx5+jv9nTc5iMs/ZZONucOebdGUp9W9cHDw0ux9PH0OoN
	WGOzNX5g6YxydRjQO3c/OYZAdH6zefEjYEh4Ach0IsZvP9mB+QUJThMiPEk54GJs7XwcLOStld9
	4JrrZz4mMyqT8cOUC3mLIM+/jBAT4hnlUoKAHvffw1r+QHG6px8WusyjZ2lATI9PGpqe/8RSBgG
	v8cJawvfB5upWKgpam7THrYlOVXZTMgpLUJtFGfHySH4hNh363ow1fvZIRiAmXdua0lKKGHtO/u
	UFSfHH3f0R/ICKVbp6PJABhcmMPTKw==
X-Received: by 2002:a05:6402:4402:b0:64b:4540:6edb with SMTP id
 4fb4d7f45d1cf-65452ad0f58mr442903a12.22.1768505202965; Thu, 15 Jan 2026
 11:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org> <20260115-exportfs-nfsd-v1-15-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-15-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:26:31 +0100
X-Gm-Features: AZwV_QgHlhd5AJtx9A_oESS7w6U6eCWyUuqrhH3MyU474xj2Kq62KuhGZ4o-aoc
Message-ID: <CAOQ4uxiTE+8r+F-e91cg9wZY-fjZfSHHOeLk3RWb+2JQQZvbvA@mail.gmail.com>
Subject: Re: [PATCH 15/29] smb/client: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>, 
	Carlos Maiolino <cem@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
	Andreas Gruenbacher <agruenba@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-xfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org, 
	devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_112645_426856_FB3E74DE 
X-CRM114-Status: GOOD (  15.44  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OeKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWRkIHRoZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgZmxh
ZyB0byBjaWZzIGV4cG9ydCBvcGVyYXRpb25zIHRvIGluZGljYXRlCj4gdGhhdCB0aGlzIGZpbGVz
eXN0ZW0gY2FuIGJlIGV4cG9ydGVkIHZpYSBORlMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExh
eXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9zbWIvY2xpZW50L2V4cG9ydC5j
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L2ZzL3NtYi9jbGllbnQvZXhwb3J0LmMgYi9mcy9zbWIvY2xpZW50L2V4cG9ydC5jCj4gaW5kZXgg
ZDYwNmU4Y2JjYjdkYjJiNDAyNjY3NWJkOWNiYzI2NDgzNDY4NzgwNy4uYzFjMjNlMjFiZmU2MTBm
MWI1YmY4ZDBlZWE2NGFiNDllMmM2ZWUzYSAxMDA2NDQKPiAtLS0gYS9mcy9zbWIvY2xpZW50L2V4
cG9ydC5jCj4gKysrIGIvZnMvc21iL2NsaWVudC9leHBvcnQuYwo+IEBAIC00Nyw2ICs0Nyw3IEBA
IGNvbnN0IHN0cnVjdCBleHBvcnRfb3BlcmF0aW9ucyBjaWZzX2V4cG9ydF9vcHMgPSB7Cj4gICAq
IEZvbGxvd2luZyBleHBvcnQgb3BlcmF0aW9ucyBhcmUgbWFuZGF0b3J5IGZvciBORlMgZXhwb3J0
IHN1cHBvcnQ6Cj4gICAqICAgICAuZmhfdG9fZGVudHJ5ID0KPiAgICovCj4gKyAgICAgICAuZmxh
Z3MgPSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMsCgpLaW5kIG9mIG9kZCB0byBoYXZlIHRoaXMg
aGVyZSBhZnRlciB0aGUgY29tbWVudCBvdXQgb2YgTkZTIGV4cG9ydC4KTWF5YmUgYWRkIGl0IGlu
c2lkZSB0aGUgY29tbWVudC4uLgoKVGhhbmtzLApBbWlyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
