Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D24C44506
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qmkNbK/nHNutLOirACvwWD9eUCjS1qjG4+oH+VekvQ=; b=13fLNxsTW2LxX/
	+GnixPJEiwqX66OwGCKte4g21nNaJmAl46aSX1epfh+Lre8tOUTGu7Hz5nuU23X2vez9GXSPEFQPD
	My/nlBC7dMotkAEqK7aLcr4KH9jsoCrYjYjsqJ4pSRIrXkum9kChaRGujUIE9J55IqJtyvVxMvHAD
	l9UUNQ1banNZgMcreBkkL6LBBLehNbimovnAxfQXBoUxc3KmroCp5Lcwk/kITzs+pE0MXYvLJwmY+
	PaPXSaqDnFOQHZ97+zv3AoIYz5aZA95kbign1dyTVY/vjqpCXZxDwpScPIS9uLB4j5d70u0WsXjDj
	gzuJxDuRIwPE2TbgsDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidR9-00000005x0O-0Xvi;
	Wed, 21 Jan 2026 19:00:15 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidR4-00000005wzx-1Z9E
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 19:00:12 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-65814266b08so272341a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 21 Jan 2026 11:00:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769022008; cv=none;
        d=google.com; s=arc-20240605;
        b=gNRMn/FJ2gXzooZSxm53bOSnOeJmPyzJ1BSf/+yriBj2SNX7Pas3rq6zL43BARCL3d
         XnFTVeFgPIz6zst8RYVcrempvSYdf2+Sa2+n+34Yioeu/QiDH79K2VFnxwpLC7pl6ZUL
         UhfU742412zOSpdQiBn24y4FTaHsvBM0ZzVhkICNCcBsC6u6DsA4ZAqBSmwzZkyEPZx2
         0XikDVcXERtnuKjTguE7Tq2CoyWogMTcSiNziuHxD4xahY6cbPVNl+W5YWqXLVO1OU+K
         0Mz7AsFF3q47cerzs4BEc2/xPQUGn/r4upzmHANY0AFB+MjstEI/ew4dHMlj7MoQvh2T
         oDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P50vKKEGRcti/ilk0zXXEyTeAkMnj2pLP0nOzx4jcho=;
        fh=qWxx1JOJA1ju1C/boi+7Rylqi9+x8X+JC57oZsMPTNY=;
        b=j/wJGj1jD/W0VwWqqdZJqKaFdOcFvrHQKnDBAmf19uucztqrSkYKVEbjR0CCC2r9CB
         KQ/Y6Yd06hz+WmNhWpsM0iw0FzF2TXC5QvvTNzXSIkPvKQDuZu2PO0BKEaZHacdX8C7l
         qrS8vmeKZhFdJXaRMWYY5tfEYIYCJ+4t0YCXpAqaBpjoHrZiUsdJhm+APEdYQt/jm8jQ
         yvz4D6eZHltHeVfiCzpTCKhkBmJZgWlyvTVGYJqFCZ7jpskDiQNaObwtjjUVDHCtHFVr
         HBOxsgiTppSwnmaCGZc386tRT5pfpEH+8JuL51aTlXJMUVCTdGlygBqAHl13OMBUsThJ
         mKaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769022008; x=1769626808; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P50vKKEGRcti/ilk0zXXEyTeAkMnj2pLP0nOzx4jcho=;
        b=JTzCRZIQuZgOrRvE8iD1r2FHhniEY3LHPLkXe/+uVIMSu3xAP4X7zjOkKfnormD49j
         KX/APNTCxFF9VPcHAuGdypvN5agrmKOvcicD0briEUffjLuY2TO48Em4WazzfJrNr3d0
         8oh6ErLnd0rztP1QMk3wU1upElTyAQnRqpiMFJ7HcvmDpFKO4IZ8negruDE0BTsnSdar
         kGJo5tbO1ixaxv1pKxMq4At9BUlR/pw4AM2/ggex3tyReX32lrVMTWV4OO8GGdM2xWzu
         ZeXwXx8WqzEk1DTaH2Q+1tAsxPHoRb4HbCKlnA4Lg3yaAgWjx5qc8fjOF058C+A1XX8v
         76oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769022008; x=1769626808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P50vKKEGRcti/ilk0zXXEyTeAkMnj2pLP0nOzx4jcho=;
        b=NoNyx6/KRJH2jmlycAbWQlYDIrg4oNnzgkVF3DIIHaYKjBL6QvVQkSGUdgUIw+PeXf
         n3Ua8APzOGt5iDgDatXuqfQ286/JOqtXLKCcwkq/DUjIBIR2PbXI0XCNSBf3i9Xbxavi
         d4Y4ITUi4PN14IA9AH13YW6mMALFOmyxWMyKjuLHG6HjxRGQ84WIruPOUnDeUhc3ZTLS
         scBumbL6bdMvNJIkCiY6DF+mxXtpBNn3/k+wGv9dvI6w/iVYanbilmgb9sGyVzcYs6X/
         sqghKLWMTjv2i4EVkg+j1IvbFtunN22+N9X/BGc5dXCrh5g67u2eLomIgE8Ed6n7BXbT
         1nhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiEL6rbnz2g1TkGYLiuogYbeKJPJsPOchV//tb7bQfBAIf/T7wJ4O/UVaq5WFz7m5647mamQs0at0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnfo/2996Hu0v6sP5tXD9dq77yIRvYHA3HoprARz0vwJlJwBi0
	A095wH6DpECixoM1qhO8ngxBlHxF9odqbxMJgNqelDkNvTj5/J/DV4m3us0EzRKlvlg8BEjyQDX
	7/+Y9l57i/6lPvtf48qshEWd5QqaHMFc=
X-Gm-Gg: AZuq6aKsXBRJ92Su9C2TIHj+4997CMrlmAHkAdvQv/M94f0W3MVX6z0HcQr24nv8BqL
	9JW5uz6IzhYLuvlgOO288vNq0aWCPE5Pda/xE47Rhlc4T9TJ+qeLfqFR6x3Fy/YVhGolaHjqsRC
	O3hUNKdUoVgGQYF7KzHc7gK2jYbDk/QoPaY7b5bsWbdkoDZYrlx60sOqS4Go8OP7jkojB/VtXY3
	gOkYUqHX73ZvO0p1mJ6dGSuG4jTocsT4IgSsmoBDXUqadpGpWgQTtIx69c5ggbUkJ8ZWShlLS84
	LGe5YbBnkBxGOmYyoqT2TwFTy8M=
X-Received: by 2002:a17:906:6a13:b0:b87:206a:a23b with SMTP id
 a640c23a62f3a-b8792f79852mr1477117366b.34.1769022007470; Wed, 21 Jan 2026
 11:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>
 <aW3SAKIr_QsnEE5Q@infradead.org> <176880736225.16766.4203157325432990313@noble.neil.brown.name>
 <20260119-kanufahren-meerjungfrau-775048806544@brauner> <176885553525.16766.291581709413217562@noble.neil.brown.name>
 <20260120-entmilitarisieren-wanken-afd04b910897@brauner> <176890211061.16766.16354247063052030403@noble.neil.brown.name>
 <20260120-hacken-revision-88209121ac2c@brauner> <a35ac736d9ebc6c92a6e7d61aeb5198234102442.camel@kernel.org>
 <176896790525.16766.11792073987699294594@noble.neil.brown.name> <ccb32c576cc4ebf943d5ec35e3d7ba4ae8892acd.camel@kernel.org>
In-Reply-To: <ccb32c576cc4ebf943d5ec35e3d7ba4ae8892acd.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 21 Jan 2026 19:59:56 +0100
X-Gm-Features: AZwV_Qh050IhjThhArfxNo-53HjJR0uLCcITEQOtntS-75Lw875opD6ONQssxps
Message-ID: <CAOQ4uxg+dC1o+6V7Nvxf8UW3H=0OvsGjEe76LNY6q8ZcpGDDJw@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
To: Jeff Layton <jlayton@kernel.org>
Cc: NeilBrown <neil@brown.name>, Christian Brauner <brauner@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Chuck Lever <chuck.lever@oracle.com>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
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
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-xfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, devel@lists.orangefs.org, 
	ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_110010_446046_B05EF941 
X-CRM114-Status: GOOD (  17.83  )
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

T24gV2VkLCBKYW4gMjEsIDIwMjYgYXQgMTI6NTbigK9QTSBKZWZmIExheXRvbiA8amxheXRvbkBr
ZXJuZWwub3JnPiB3cm90ZToKPgouLi4KPiA+IEJ1dCBpZiB5b3UgcmVhbGx5IHJlYWxseSB3YW50
IHRvIHNldCB0aGlzIG5ldyBmbGFnIG9uIGFsbW9zdCBldmVyeQo+ID4gZXhwb3J0X29wZXJhdGlv
bnMsIGNhbiBJIGFzayB0aGF0IHlvdSBwbGVhc2Ugc2V0IGl0IG9uIEVWRVJZIGV4cG9ydAo+ID4g
b3BlcmF0aW9ucywgdGhlbiBhbGxvdyBtYWludGFpbmVycyB0byByZW1vdmUgaXQgYXMgdGhleSBz
ZWUgZml0Lgo+ID4gSSB0aGluayB0aGF0IGFwcHJvYWNoIHdvdWxkIGJlIG11Y2ggZWFzaWVyIHRv
IHJldmlldy4KPiA+Cj4KPiBXZSBjb3VsZCBwcm9iYWJseSBkbyB0aGF0LCBidXQgSSB0aGluayB0
aGUgbWFpbiBvbmVzIHRoYXQgZXhjbHVkZXMgaXQKPiBhcmUga2VybmZzLCBwaWRmcyBhbmQgbnNm
cy4gb3ZsIGFuZCBmdXNlIGFsc28gaGF2ZSBleHBvcnQgb3BzIGluCj4gY2VydGFpbiBtb2RlcyB0
aGF0IGV4Y2x1ZGUgTkZTIGFjY2Vzcywgc28gdGhlIGZsYWcgd2FzIGxlZnQgb2ZmIG9mCj4gdGhv
c2UgYXMgd2VsbC4KPgoKRm9yIHRoZSByZWNvcmQsIG15IGNvbW1lbnRzIHJlZ2FyZGluZyBmdXNl
X2V4cG9ydF9maWRfb3BlcmF0aW9ucwphbmQgb3ZsX2V4cG9ydF9maWRfb3BlcmF0aW9ucyB2YXJp
YW50cyB3ZXJlIHB1cmVseSBzZW1hbnRpYyAtCml0IGRpZCBub3QgbWFrZSBzZW5zZSB0byBtYXJr
IHRoZW0gYXMgX1NUQUJMRV9IQU5ETEUsIGJ1dAppdCBkb2VzIG5vdCBtYXR0ZXIgaWYgeW91IHNl
dCBhIGZsYWcgb24gdGhvc2Ugb3BzLCBiZWNhdXNlIHRoZXkgZG8Kbm90IGltcGxlbWVudCAtPmZo
X3RvX2RlbnRyeSgpLCBvbiBwdXJwb3NlLCB0aGV5IGFyZSBub3QKZXhwb3J0ZnNfY2FuX2RlY29k
ZV9maCgpIGJ5IGRlc2lnbi4KClRoYW5rcywKQW1pci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
