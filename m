Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148F4D232C1
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 22:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wn23Lluu+7wzlhcKDCt2a11ok+qGc/59KpSrK1EF3qo=; b=dmsw3zTTAzlFZ7
	x/ZcX/WUbg4gxtdpTfsSFMCaksoNUCD48LzNk95BSdGzi/crXFSMWBDPW9/VWNMTjKJ7WwmMLip4W
	vcDfvCHyqiB4uhE5aDruAknpsaW6B3EI4InVsnIziimMr4HER9akloi9blUpQw9gfgnzOT/CzwoFC
	ZPzDZnBXaHTwA+qKq34rkJM2ULzgSkkU2pOtZ5y4S5hPi5+IILfxqd2C1aZJuSEz88TXi0mpucyoJ
	/iHo+tQRkWYtMgevxK/z7EVkRr+7PDNvC+4p76BYDrFEarEfbgyVlEE8v2wP9WtFqb+U/iUaLmMdy
	UNu6F5Q3DhfwRso5WSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdymu-00000000xUw-1QYZ;
	Thu, 08 Jan 2026 22:47:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdymr-00000000xUN-2qjl
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 22:47:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7067644467
	for <linux-mtd@lists.infradead.org>; Thu,  8 Jan 2026 22:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AC2C2BC9E
	for <linux-mtd@lists.infradead.org>; Thu,  8 Jan 2026 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767912444;
	bh=bpLucB2OVlqnpdSgR5fVsT/9lEifzVxq4+Kg3z371KE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kNZ/y6ld9T/Ac6XqHUpuWQ8PCKoHqDZK4KRIN0fR0qhZUAZgmdbhls/DOYhiAGX7z
	 lKJXMbj5kAIa3yPHcJzWdDqHLZWZUws36K4s8WUtTHBy0kZ1G+0Jbjoh7BgoGMTVB0
	 EHN+7t2qxXK5Wg9JwteHTuHVEx86cGwPSYmACkxAaR6cPMp9ZisNCP6MINj41SffBs
	 rGpQYrIDRH61Pi646aQVZ+ZmxyNbNF5rChS8TKq0svn+ns7GoUEV1FIGJpWNhiL7jz
	 wNVHZ83G97Pf5PZFUJN8TAkCmyWsi/CmvHe4Mf70Y4ziokGk5SSSZrPhqGGZMeQCS4
	 YWE8KQUzoe6Nw==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7ce5d6627dso762117866b.2
        for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2026 14:47:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU37apz8+9llAaaqpPY7D5jpEyR4UT1EL1cdALTAgV2Hj6yqn/+Kaebi/5BMGwMcF3dGhGjtbZGQqM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRGxHawi8gdRb5JPL5iohbAdd5/Mr8Zwk4TZUjVjh7kXGPviw1
	Vm1va2eCYNEBZwxoK8YyWFyGDCqAVG57oYer33aJ681707MQawmIfxSroBN42o4kcgWpr3ZUhV/
	KfbUJKNix3tkCKMvEpwGHhKr1OIMArno=
X-Google-Smtp-Source: AGHT+IHRRvrZk+LJHsAd5/mP4TyTtkU5XrZgqXx3MfUuP0vWFtvlehE6tE5BFAh0/XFz8o1ILqvfmo203M6g5zkxlKk=
X-Received: by 2002:a17:907:c1e:b0:b72:c261:3ad2 with SMTP id
 a640c23a62f3a-b84451dab67mr854015966b.50.1767912442100; Thu, 08 Jan 2026
 14:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org> <20260108-setlease-6-20-v1-7-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-7-ea4dec9b67fa@kernel.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 9 Jan 2026 07:47:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-JTE+233AwpvrXTsbfrbY+U_pvyUTQQSwz0mXh43jt=A@mail.gmail.com>
X-Gm-Features: AQt7F2q41Fu16p_9dWtEjvrFao8uwKCSAe9mKCbLxMeS3Ih2bsPKkzatUTosKic
Message-ID: <CAKYAXd-JTE+233AwpvrXTsbfrbY+U_pvyUTQQSwz0mXh43jt=A@mail.gmail.com>
Subject: Re: [PATCH 07/24] exfat: add setlease file operation
To: Jeff Layton <jlayton@kernel.org>
Cc: Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, 
	Anders Larsen <al@alarsen.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>, 
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, 
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <chuck.lever@oracle.com>, 
	Alexander Aring <alex.aring@gmail.com>, Andreas Gruenbacher <agruenba@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, 
	Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, 
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Steve French <sfrench@samba.org>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	Bharath SM <bharathsm@microsoft.com>, Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, 
	ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org, 
	gfs2@lists.linux.dev, linux-doc@vger.kernel.org, v9fs@lists.linux.dev, 
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_144725_774268_C3D101FC 
X-CRM114-Status: GOOD (  11.04  )
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

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCAyOjE04oCvQU0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBZGQgdGhlIHNldGxlYXNlIGZpbGVfb3BlcmF0aW9uIHRvIGV4
ZmF0X2ZpbGVfb3BlcmF0aW9ucyBhbmQKPiBleGZhdF9kaXJfb3BlcmF0aW9ucywgcG9pbnRpbmcg
dG8gZ2VuZXJpY19zZXRsZWFzZS4gIEEgZnV0dXJlIHBhdGNoCj4gd2lsbCBjaGFuZ2UgdGhlIGRl
ZmF1bHQgYmVoYXZpb3IgdG8gcmVqZWN0IGxlYXNlIGF0dGVtcHRzIHdpdGggLUVJTlZBTAo+IHdo
ZW4gdGhlcmUgaXMgbm8gc2V0bGVhc2UgZmlsZSBvcGVyYXRpb24gZGVmaW5lZC4gQWRkIGdlbmVy
aWNfc2V0bGVhc2UKPiB0byByZXRhaW4gdGhlIGFiaWxpdHkgdG8gc2V0IGxlYXNlcyBvbiB0aGlz
IGZpbGVzeXN0ZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJu
ZWwub3JnPgpBY2tlZC1ieTogTmFtamFlIEplb24gPGxpbmtpbmplb25Aa2VybmVsLm9yZz4KVGhh
bmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
