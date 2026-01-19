Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E298BD29C46
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VgB9awMP9hRRz8cf1iXRgtWIWUaXzGUJLdIKChQHUo=; b=AlZzv6E6Ysw+mH
	S+nteyAss4Isqd3XS+pqIF0K6BTXZwAOG8522Mv1pdYSVxNhdt7aVSHXMmTgf7krGy96Xrxjzd1nK
	Ra+ANXd2dqIx88Q4S1D4u+5z2pE/SIQFrkTHAw0j01FHn1ys4/1ZBZzEML6CDRgtF0W2mLwt47Qp9
	x0iadEhRm9Z6Wt9MbDunnB5Zbmsq3HRiWAX5hMHRqMu6rO8M94XoTDaqNs7gdaEhxRewFNO/JaIQP
	n1ORrF9tIY2SNZ8JE68swvwCQ9H9itipA4LSadqLFE6OKtNfgxdCHaqC4E41ov87K67shF34xrEiC
	uYPjkyoXvjBVuX9SRZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsLp-00000002XDQ-2HAe;
	Mon, 19 Jan 2026 16:43:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsLo-00000002XCq-3ANL
	for linux-mtd@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=; b=VgrCXpwxzYYyfbUWDZadypLNAi
	o02yYNyfjyD6/wBQueqEgqyWXeKAYCq1FgFepKkGb9wnsluyHArSTqP/DAWEF0sXQzwdMhS4RnnPt
	JEasppcfFs/XT1IZsUwqFIk/koB5vY81zhnL/GT5EXGj1cuJNZPKgiCqbMYe49oIG2f1Vafg/2qJB
	HmAhH99uTBUc6XeAxL8UBg8pLhcCislNE3TZNWrvQEbgpvwQia6rB735LLC/5zBLBZLN5qFcm7oaA
	JKaJE3xr/P4w8CJ9vFmsoasjMbQ/Vp/MG3a2aDG/bSf6dS5hVO8omTq8rJu/tQrOoF3nscH+UU21q
	mvEx325g==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsLl-0000000CYZq-1F0Z
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:43:35 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso9321440a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2026 08:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768841011; x=1769445811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=;
        b=NeIAgRX3CIfw/9zPnCcGfnVz/t5hA/Ulf/T8XkRaZAU2ChI7/jcJ0EebfIGf2701y1
         GgfPE1hhHjBV60JxSswMV9yHf4nJ+3jP1yHwl+s6ipVC2AP7OUjzWP5imSpdsnpAvhVu
         at2Vry9a+dgPE9XPRbxEgnEDEE3Wx7TEaapzcT4qlv3b2Sp6FgBMTxTzKXpqNfrApgap
         zx1dec9TopdkroovfN89op0OvdxD1deNIzi6n6WPUOUzfln9w5XQB1nD8pg2U4wTN+oG
         urYm4GkUpawzUjYH21qgFNNUQrymuVCkETM7utzsJ/faYuVeMCKk6yVUs4BbVvuPmet2
         fU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841012; x=1769445812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=;
        b=JkHgIN6Fa1su/YwW+/0YHGzHBu/AibuYNONV9QlI3TJNWGbVJ9z8h9432q5IvuhOgj
         teNJo8OFeqQh4/ZAxmNDOpz/cbq5c1dbKCbNsG9sVdXebY66V83cyoeSVRmlslbgE6nS
         DdeMjtw4oG/3RSQxOhGCtjuAkEMjSNBX3+d0ScEFWDCRmqVLvwwgN10KHDyTHgNDUUO/
         54sT3JXmqqoz4G4v2rDvdY27FRijTzaG/x14l5mZoHBms4CXV4gm5TrNZa4e76+4kNbE
         mhMvU0E3H2EGz0S5xdvbxmE2y1Whwa6J9P0GEgRRSBHCna7DLObNrXi/xgi45lIZ7vFn
         GmRw==
X-Forwarded-Encrypted: i=1; AJvYcCXPJ26gQrXP7iK1OwLkQhVGDD4AtX02A65OpmQaO9G2ALAHwbYFwmvFybEf4c2BBxyppzJCGcCzP+o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNhqy9CPoppBek3QzXFWcbhjnu9TwGEGYO9gpCd8tgUXskr1kk
	uk0NHN8H+w7VMozONrNfLkGWTzeBWp+AwIdjwzDgOJjNjSuiCPpZTcvbwgChbTicCXSsmm2zRFg
	dXQ0y8nwsr0yxLdk6p0rQZHQ5qzpWPj0=
X-Gm-Gg: AZuq6aLUOFWrRHfv993diBP+mD+8uWlOOoL6x7zSspQeaa7/LFZdeSrLjDNhlUfDk4l
	Jf918MFwyw5sQg9he9hnVryrRipFutOzB2LcK4GUtsNNfI3yX6ys6Oc2Juw5X0Mtt/ndvepSCMD
	zigxEzjPqh5OImkc1aaBuN8SdKK4HBMRz/Xq/XozInJUgcNGHnTGuowdv3LNijRnZzP8Qg2tIew
	NHehj1XuQLqKt4kDEZoqu3NWNQWTvoNUkRj2WQOVMR5T08iM431su4BSdoB6Qa/CSvwTrYgnmho
	fqa0WYE+VWz3YOy5/wGePKN0VQRUdAWF7o1XTO8y
X-Received: by 2002:a05:6402:5106:b0:64c:584c:556c with SMTP id
 4fb4d7f45d1cf-654bb6192admr8530585a12.30.1768841011353; Mon, 19 Jan 2026
 08:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org> <20260119-exportfs-nfsd-v2-27-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-27-d93368f903bd@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 19 Jan 2026 17:43:19 +0100
X-Gm-Features: AZwV_QgQ6YFmczFqASwqjyOa509PoCTPsOB-sET1G173IBHOd4X5kFjH9N6z5MI
Message-ID: <CAOQ4uxjyTdf21G1Y=_5Eox58drVPA0gAMeSQZxh=T36_yzssNw@mail.gmail.com>
Subject: Re: [PATCH v2 27/31] fuse: add EXPORT_OP_STABLE_HANDLES flag to
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
	Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	David Laight <david.laight.linux@gmail.com>, Dave Chinner <david@fromorbit.com>, 
	Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-ext4@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-unionfs@vger.kernel.org, devel@lists.orangefs.org, 
	ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_164334_248871_5BE31AD2 
X-CRM114-Status: GOOD (  15.73  )
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgNTozMOKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWRkIHRoZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgZmxh
ZyB0byBmdXNlIGV4cG9ydCBvcGVyYXRpb25zIHRvIGluZGljYXRlCj4gdGhhdCB0aGlzIGZpbGVz
eXN0ZW0gY2FuIGJlIGV4cG9ydGVkIHZpYSBORlMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExh
eXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogQW1pciBHb2xkc3RlaW4gPGFt
aXI3M2lsQGdtYWlsLmNvbT4KCj4gLS0tCj4gIGZzL2Z1c2UvaW5vZGUuYyB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9mcy9mdXNlL2lub2Rl
LmMgYi9mcy9mdXNlL2lub2RlLmMKPiBpbmRleCA4MTllNTBkNjY2MjI0YTYyMDFjZmM3ZjQ1MGUw
YmQzN2JmZTMyODEwLi5kZjkyNDE0ZTkwM2IyMDBmZWRiOWRjNzc3YjkxM2RhZTFlMmQwNzQxIDEw
MDY0NAo+IC0tLSBhL2ZzL2Z1c2UvaW5vZGUuYwo+ICsrKyBiL2ZzL2Z1c2UvaW5vZGUuYwo+IEBA
IC0xMjE1LDYgKzEyMTUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGV4cG9ydF9vcGVyYXRpb25z
IGZ1c2VfZXhwb3J0X29wZXJhdGlvbnMgPSB7Cj4gICAgICAgICAuZmhfdG9fcGFyZW50ICAgPSBm
dXNlX2ZoX3RvX3BhcmVudCwKPiAgICAgICAgIC5lbmNvZGVfZmggICAgICA9IGZ1c2VfZW5jb2Rl
X2ZoLAo+ICAgICAgICAgLmdldF9wYXJlbnQgICAgID0gZnVzZV9nZXRfcGFyZW50LAo+ICsgICAg
ICAgLmZsYWdzICAgICAgICAgID0gRVhQT1JUX09QX1NUQUJMRV9IQU5ETEVTLAo+ICB9Owo+Cj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VwZXJfb3BlcmF0aW9ucyBmdXNlX3N1cGVyX29wZXJhdGlv
bnMgPSB7Cj4KPiAtLQo+IDIuNTIuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
