Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C880FD29C40
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4iCP6TlzjL3bhrwnBlQLWjrGp1akpTQNHYf+Bmfk/g=; b=sPxnH+MCv1R2kk
	9A+FqbvbIERgyxMURfTuy6FiJ82rSMujbm7zGosBW7B3Gb0hyxDeV7JbwH8ldQHqkxWsKGO3AFQRo
	J1HIR37ecQtoNcKItxrnrr8bX8bRsv/vQ6vg1tuB+ORDPzEdLgYix6ybdWLjt7/KAK5zlGh/X24WZ
	uhYnCpBaf6n8gUyH/JLaZSwFvHdE9T6D4Kdn8RtqeNJfeoD7j/3jP3j6L+3U5NfCWeSAPRurEVe8N
	nL8iJkTwLvlAdaDzHDXl2sp9Lgx1ACKqD1HDlQb+wws2MOp/aISrl/53TlaktsJnvkNAZJTiTLTuw
	eYSPvyjS4BhylBpo1NPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsLQ-00000002X7z-0sxn;
	Mon, 19 Jan 2026 16:43:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsLN-00000002X70-29F5
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:43:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so8366840a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2026 08:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840987; x=1769445787; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP488vxzDs37SDvqB3SvtrET0fHZKVUQCP8+UqFkiUw=;
        b=k5/8XRypzI4/Y3RdIPN5mbeCkuRITbW+nMYqhIHF4AL7UQalPU+R16A7dNIqv5sxPd
         fkC07WLJxk4MGNAwDWWq+dqWEQW8HhUfebAmFe/33OUhXL21AuPKRLHgNC8gaqm8KZid
         Om3jOWxIUvLUE6EjP78N9NRoBESYTd85I3ySXvb11mrHvg7Wvl+Krv7rOLEuMy+U2Fj/
         KQh3w8k2YCej4z/qvZSe62zeByB+aQag5YEiWCyGqYx8EukhPh1CK8pm9bqcVpRMCQVk
         5p1aFwRHZfcQHHjJFzRF22KzV2R8s0ofPCMTeFKO0PsztUVD5n0avutkbnSijqTldrRz
         rkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840987; x=1769445787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OP488vxzDs37SDvqB3SvtrET0fHZKVUQCP8+UqFkiUw=;
        b=G7NCuywBMHmPzkruwLBiYVGx/lXJP5q3TDP1VLo9Nw4dtEbXa6ViAd9+MhQpzgwKPS
         UCvNvhCJ+sKtabhNhQ6/aXHt++7iGxy7zoC40ctslQdsWzzMHa4I83O/cLdsGCgaN8in
         YFfceNgSBqXT49KtPBF+s1BcGm9FGyrHakUNEDzPcwoIjdDsTnngV/WFTpy3we5XZrbc
         auWHFg19qT9ulfHxhvxBGbnqSFDqvTKiVZA4ZRgImLplwyCfoZdaZQqGuqc8PgnzeE3F
         zwndEhCmS3ylOt3ri7paJl7mYsa/Ep8/7zXTw8RfsUK7/gN4Mj+nsNedtoKge6jQB4XI
         3Ehw==
X-Forwarded-Encrypted: i=1; AJvYcCVvjHYAUUeYFQfXjakw+ZzEY21cU1mzpsIbUzlIBABk4IVFoGnUCF0fleW5gFjknQ1Oa0wTSRIlgjI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWzydvV2Qlq1KtsjDpWw5RA1pwNYY5Gl7wldQvdO+kUmPCWgU7
	aXev+Ac3uVeY5nhiS04jJrHOHWB1XOg76m0sQAwKJU1ILfN7lkUr/gaMM5MlIQZugWj0RAKbuTx
	ROcCz8wm5Jexf6eCbJ7wkwPQZ5BLvMkA=
X-Gm-Gg: AZuq6aIgtp9bpANoD7LMl2cY5QgMTf8QRVvGGOAP/62HakQHb1t1AJg3Eru/nDUZWG0
	Xkqpf6Z0FuaktxRtU1bYzh/4F0uIMqivu4dHOIm4tTAL51v/kz7mtVuS6YZoXdc6bGLxHTF/2C8
	01GD7cC2Wr87iPmSyeePzHf7kzb/GoeexSDQIygvEMnv5rVJgfF8jeuFFL1mNyAAJzxqNIUJUA8
	sjQzu4WxzsCcaMXH5GAPu/B7SicfLAIqeZq1d/Nc/sDc6hZpSWU89jsTmeaaNsU2M4X+w93/LJj
	5yD8Yo+hhHe6UzSgrPHd48lmD3x7/A==
X-Received: by 2002:a05:6402:4304:b0:649:b200:afe9 with SMTP id
 4fb4d7f45d1cf-65452cca909mr8384256a12.27.1768840987066; Mon, 19 Jan 2026
 08:43:07 -0800 (PST)
MIME-Version: 1.0
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org> <20260119-exportfs-nfsd-v2-17-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-17-d93368f903bd@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 19 Jan 2026 17:42:54 +0100
X-Gm-Features: AZwV_QiQ9eetgKyRnXUMiKJDXK2vIOYhTLzpDlKP7IN3cG_hSRVA59Z6sNZRsnw
Message-ID: <CAOQ4uxgXovX-rPuAE55D8x4jbNOQdAKJH3O5gpHJDMsT7kNGgw@mail.gmail.com>
Subject: Re: [PATCH v2 17/31] ovl: add EXPORT_OP_STABLE_HANDLES flag to export operations
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
X-CRM114-CacheID: sfid-20260119_084309_607646_CAFEAB93 
X-CRM114-Status: GOOD (  15.74  )
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgNToyOeKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWRkIHRoZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgZmxh
ZyB0byBvdmVybGF5ZnMgZXhwb3J0IG9wZXJhdGlvbnMgdG8KPiBpbmRpY2F0ZSB0aGF0IHRoaXMg
ZmlsZXN5c3RlbSBjYW4gYmUgZXhwb3J0ZWQgdmlhIE5GUy4KPgo+IFNpZ25lZC1vZmYtYnk6IEpl
ZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBBbWlyIEdvbGRzdGVp
biA8YW1pcjczaWxAZ21haWwuY29tPgoKPiAtLS0KPiAgZnMvb3ZlcmxheWZzL2V4cG9ydC5jIHwg
MSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2Zz
L292ZXJsYXlmcy9leHBvcnQuYyBiL2ZzL292ZXJsYXlmcy9leHBvcnQuYwo+IGluZGV4IDgzZjgw
ZmRiMTU2NzQ5ZTY1YTRlYTBhYjcwOGNiZmYzMzhkYWNkYWQuLjE4YzZhZWU5ZGQyM2JiNDUwZGFk
YmU4ZWVmOTM2MGVhMjY4MjQxZmYgMTAwNjQ0Cj4gLS0tIGEvZnMvb3ZlcmxheWZzL2V4cG9ydC5j
Cj4gKysrIGIvZnMvb3ZlcmxheWZzL2V4cG9ydC5jCj4gQEAgLTg2NSw2ICs4NjUsNyBAQCBjb25z
dCBzdHJ1Y3QgZXhwb3J0X29wZXJhdGlvbnMgb3ZsX2V4cG9ydF9vcGVyYXRpb25zID0gewo+ICAg
ICAgICAgLmZoX3RvX3BhcmVudCAgID0gb3ZsX2ZoX3RvX3BhcmVudCwKPiAgICAgICAgIC5nZXRf
bmFtZSAgICAgICA9IG92bF9nZXRfbmFtZSwKPiAgICAgICAgIC5nZXRfcGFyZW50ICAgICA9IG92
bF9nZXRfcGFyZW50LAo+ICsgICAgICAgLmZsYWdzICAgICAgICAgID0gRVhQT1JUX09QX1NUQUJM
RV9IQU5ETEVTLAo+ICB9Owo+Cj4gIC8qIGVuY29kZV9maCgpIGVuY29kZXMgbm9uLWRlY29kYWJs
ZSBmaWxlIGhhbmRsZXMgd2l0aCBuZnNfZXhwb3J0PW9mZiAqLwo+Cj4gLS0KPiAyLjUyLjAKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
