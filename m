Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F35FD4660F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 18:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zoflp7GOr8vPsOUNhj6jDV2RShL39uXTWTrCvjsFyqU=; b=irNUq2MpI4hL+6
	bWPTvcQqi8Ycp93/Dy8zyj8ZPKxBTumD3MrGGMX99DSDsPkdtDdjdhOX7+WnjiVq+dI/foGULoSV7
	eDYBdf0esIjs60urdi0DWMkGUT5tHKjDHaNibye7wumAmWe82YEm8u8vqA6BeCwyfdtutPuW53BE5
	wkG9uWkuz3X0A/mIocDd6Z5GZsk5A1bXHpv/Txi2wBxn0U2RAevKdczkuCpObEcEBSqU8f5QFbxmA
	662F/H1++LSHrxBHJDORwFtm/ZQ4MnOEaqXBsvJcbqzZ51AYhvXiiuN9O6tkNwsZI8PciyZegaFRR
	SqqNe5TcvuI+7A3RdLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSUX-0000000D0Mf-3kTW;
	Thu, 15 Jan 2026 18:54:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSUI-0000000D0JP-3NPP
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 18:54:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so770018f8f.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 10:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768503269; x=1769108069; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=;
        b=UZ5ZO0g4aQQ9NrwK/9uGGvzsNASTnbuLBlrnH7TDlmWn0iry5jyxzuCa21mcEb8oNM
         s6dl7x+ji5CymaR3paPsWIpmkQARwUtui/2XcmAscDytQAwqnKC8ZMfnTiLbc5CbJsGn
         YJ60QsTZ3JgUwJZaNuBQ0KR5M4xJJgIAEb0/0Ox3JRvfuZMPCMbtHotc+vEPYpAdm02F
         /mgCDadiomjhkOh8a2B1mlTd1Mk6blwcx0XRuOmjx9KFMiH+DdBQc4rt5dXVnHL+LRK9
         D7tBEfNF5TRQaEwL7fNzfXASmd8Gq+RzhTEOtwBuU/TszqX874V/hL8BxmYpv/Z3BFKw
         +BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503269; x=1769108069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=;
        b=c2XBdqD/SEJRFbPBSPZwhJDiGP85WKe7R0Mcb3BguG19yHZm57R4VHucUyv5lNFE4l
         X+78SzTp4HcNJhVYjDU0btf8TLNiS9PPDApdfBy1OSrepOaqBsSIZdf5RfO+JXNJSeCY
         5Vq85e3vdhaJp28RN1fLrUapXHHVnqEp5Ga4pR7tYpH4VHFf18h4CBSbnV7Yzgpzgeju
         SbzAQbKu8e0kdhUnpR572cVsVNDPDwA1Kk+xiU6mCBWTwONPK8kuPpnScw73gby5PIeF
         jNFO/7rNQO7LtEMdfOQc3hnvsi3un9uvXXvqyWGsSxvx9MAYeYr6IoGzQOWsOCGdt1BD
         rP3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQoc0SgsORqH3dl+CLA5GshTExt94ro6yCSz+IAKWymno90NqD4GqqNxJSZGMyxT1ghgaleCcCPEg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAjsS5ClZweh29qVDsuxx7GWMC/AE0efQSRqd0iUXcM8vAEYED
	Wm9RdyZ52nazK3p4NrZ2O1p5vUoxE0yZX5Dmm3qUsGaQ80Pjmb1ysttTnfDIFdpy/3XylIjU3ck
	dB2LwaBgmP/JN6/IpZ2nzJq6uzkYxqrw=
X-Gm-Gg: AY/fxX5ZT83rdrfj8LJfDM0Sm5wldhx186OZsm+hVUnVlEkUrRLUzuVOuSVxEbCwyJi
	1kdCDm6P/ijY0/1HCOQ5hUd/Csp264M3ZXXys3ToOqST0zQc79Ra76H4WWl7kj9RAOg5s//plbQ
	JF1/eEWWxb/oQMdMf4lGOB9tCZagBGrFRAWs446RV3VSH29NNM8048Q2EC53JsCToIb6fxAlp6+
	X/dgSTehn7ZR8zP2nn2QDrpRkVqWTWwDxEhw9k7f2NCNyyfPADO66q0EZLXcxyttBKli4Tu3Cup
	sFR4hNOPc1fsMl5xa2I69YI3C0hBpA==
X-Received: by 2002:a05:6000:2313:b0:432:5c43:76 with SMTP id
 ffacd0b85a97d-43569bc17ebmr434376f8f.39.1768503268480; Thu, 15 Jan 2026
 10:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org> <20260115-exportfs-nfsd-v1-26-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-26-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 19:54:17 +0100
X-Gm-Features: AZwV_QgNgqINU2MW0ct-_EKOImgQ1uAwJfq7nKBHPoIgHpyzlMCSNbXGV-6zTEg
Message-ID: <CAOQ4uxh4VaVL9PD7-_Op9Xs-z5Qrx8g6x2x5FccujQX-Cw9RqQ@mail.gmail.com>
Subject: Re: [PATCH 26/29] fuse: add EXPORT_OP_STABLE_HANDLES flag to export operations
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
X-CRM114-CacheID: sfid-20260115_105431_638377_26C8F098 
X-CRM114-Status: GOOD (  16.97  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo1MOKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWRkIHRoZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgZmxh
ZyB0byBmdXNlIGV4cG9ydCBvcGVyYXRpb25zIHRvIGluZGljYXRlCj4gdGhhdCB0aGlzIGZpbGVz
eXN0ZW0gY2FuIGJlIGV4cG9ydGVkIHZpYSBORlMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExh
eXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mdXNlL2lub2RlLmMgfCAyICsr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9mcy9m
dXNlL2lub2RlLmMgYi9mcy9mdXNlL2lub2RlLmMKPiBpbmRleCA4MTllNTBkNjY2MjI0YTYyMDFj
ZmM3ZjQ1MGUwYmQzN2JmZTMyODEwLi4xNjUyYTk4ZGI2MzlmZDc1ZTgyMDFiNjgxYTI5YzY4YjRl
YWIwOTNjIDEwMDY0NAo+IC0tLSBhL2ZzL2Z1c2UvaW5vZGUuYwo+ICsrKyBiL2ZzL2Z1c2UvaW5v
ZGUuYwo+IEBAIC0xMjA4LDYgKzEyMDgsNyBAQCBzdGF0aWMgc3RydWN0IGRlbnRyeSAqZnVzZV9n
ZXRfcGFyZW50KHN0cnVjdCBkZW50cnkgKmNoaWxkKQo+ICAvKiBvbmx5IGZvciBmaWQgZW5jb2Rp
bmc7IG5vIHN1cHBvcnQgZm9yIGZpbGUgaGFuZGxlICovCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZXhwb3J0X29wZXJhdGlvbnMgZnVzZV9leHBvcnRfZmlkX29wZXJhdGlvbnMgPSB7Cj4gICAgICAg
ICAuZW5jb2RlX2ZoICAgICAgPSBmdXNlX2VuY29kZV9maCwKPiArICAgICAgIC5mbGFncyAgICAg
ICAgICA9IEVYUE9SVF9PUF9TVEFCTEVfSEFORExFUywKPiAgfTsKClRoZXNlIGFyZSB1c2VkIHdo
ZW4gdGhlIHNlcnZlciBkZWNsYXJlcyBGVVNFX05PX0VYUE9SVF9TVVBQT1JUCnNvIGRvIG5vdCBv
cHQgaW4gZm9yIE5GUyBleHBvcnQuCgpUaGUgc2FkIHRoaW5nIHcuci50IEZVU0UgaXMgdGhhdCBp
biBtb3N0IGxpa2VsaWhvb2Qgc2VydmVyIGRvZXMgbm90IHByb3ZpZGUKcGVyc2lzdGVudCBoYW5k
bGVzIGFsc28gd2hlbiBpdCBkb2VzIG5vdCBkZWNsYXJlIEZVU0VfTk9fRVhQT1JUX1NVUFBPUlQK
YnV0IHdlIGFyZSBzdHVjayB3aXRoIHRoYXQuCgpUaGFua3MsCkFtaXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
