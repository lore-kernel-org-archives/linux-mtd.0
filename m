Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9687ED37E44
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWKJTKlZxWZ+1atzoo+uhwpNDwrdds1sh07kTiC9I8Y=; b=JQQXjVAi76sC46
	qCwpc7m+XMdM9261B1BmGciBD23LHVM0fNho2pdTJtzhEZlJzzlgMpeA5e1mPK4qfbTq7R4HD9e9t
	Zz4a7FPa+Od/UrQWlIBMnX4Leq5TY8NTUWX6w/Gj7ZyNbCn/EP5/VwCBMnfWFL929iwSUVkUnW84s
	j8/d9PVEWOU6niLgBQmfS6PGwn45EaRQKlwMyC8pz15rV2/zZGVt8XBKskjd03QAbViGhbV3vPJUR
	uVLYLPGTeW+l6N0YhhGg8WJmZGny7bLiEqtUTsCIANIs6Otx6LdtOGaR1OMQ2stZSeOtpYEZ5h7k5
	72M947g4zAQfSPsSk2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2lN-00000009gaH-0a1P;
	Wed, 14 Jan 2026 15:26:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2lL-00000009gZX-21wz
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 15:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DA7E6000A;
	Wed, 14 Jan 2026 15:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C84C4CEF7;
	Wed, 14 Jan 2026 15:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768404382;
	bh=TJ8HYpqwvKEu5WPBUCmrbZTfwhtmNo45dUDkhLnlTis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UuxL49UpINmE3bPn9I7g1qy3O1U7lEuEQBs6NY4FtevlZRrg+jir4TUf2JL5Et6S/
	 Wo3Rq7erhsD0wDrAjS0fAwtu2sdM1Ly6eiM6YJ56Efjw7Aqq9ho5u2uVmIb6CLm0qm
	 DbkRjtkwVuzFS/3LLXXupO+XD87WN1YxMglF8PVz6z7zZF37PIEsEJLTAjeNY90c2+
	 Is57pvmqsqoUYUcAtHG3VWlWJm+iZsfwi7Dpki4E16iuG5isE531rPd5Kr9GSqblBC
	 cmcig5bet6G0LrdDdcPVQ26rluu7tPoRJcI1jAeMRFhOX4YrFqzlg3FxIBJw/nlkLZ
	 OyWqiHYjHhBJQ==
Date: Wed, 14 Jan 2026 16:26:03 +0100
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, 
	Amir Goldstein <amir73il@gmail.com>, Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Anders Larsen <al@alarsen.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>, 
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, 
	Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
	Dave Kleikamp <shaggy@kernel.org>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Alexander Aring <alex.aring@gmail.com>, Andreas Gruenbacher <agruenba@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, 
	Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, 
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, 
	Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, linux-mm@kvack.org, gfs2@lists.linux.dev, 
	linux-doc@vger.kernel.org, v9fs@lists.linux.dev, ceph-devel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
Message-ID: <20260114-blamabel-hanfernte-ea1345885b46@brauner>
References: <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org>
 <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMDg6NDE6MTZBTSAtMDUwMCwgSmVmZiBMYXl0b24gd3Jv
dGU6Cj4gT24gV2VkLCAyMDI2LTAxLTE0IGF0IDA1OjA2IC0wODAwLCBDaHJpc3RvcGggSGVsbHdp
ZyB3cm90ZToKPiA+IE9uIFdlZCwgSmFuIDE0LCAyMDI2IGF0IDEwOjM0OjA0QU0gKzAxMDAsIEFt
aXIgR29sZHN0ZWluIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCA3OjI44oCv
QU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+ID4gPiAK
PiA+ID4gPiBPbiBUdWUsIEphbiAxMywgMjAyNiBhdCAxMjowNjo0MlBNIC0wNTAwLCBKZWZmIExh
eXRvbiB3cm90ZToKPiA+ID4gPiA+IEZhaXIgcG9pbnQsIGJ1dCBpdCdzIG5vdCB0aGF0IGhhcmQg
dG8gY29uY2VpdmUgb2YgYSBzaXR1YXRpb24gd2hlcmUKPiA+ID4gPiA+IHNvbWVvbmUgaW5hZHZl
cnRhbnRseSBleHBvcnRzIGNncm91cGZzIG9yIHNvbWUgc2ltaWxhciBmaWxlc3lzdGVtOgo+ID4g
PiA+IAo+ID4gPiA+IFN1cmUuICBCdXQgaG93IGlzIHRoaXMgd29yc2UgdGhhbiBhY2NpZGVudGFs
bHkgZXhwb3J0aW5nIHByaXZhdGUgZGF0YQo+ID4gPiA+IG9yIGFueSBvdGhlciBtaXNjb25maWd1
cmF0aW9uPwo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gTXkgUE9WIGlzIHRoYXQgaXQgaXMgbGVzcyBh
Ym91dCBzZWN1cml0eSAoYXMgeW91ciBxdWVzdGlvbiBpbXBsaWVzKSwgYW5kCj4gPiA+IG1vcmUg
YWJvdXQgY29ycmVjdG5lc3MuCj4gPiAKPiA+IEkgd2FzIGp1c3QgcmVwbHlpbmcgdG8gSmVmZi4K
PiA+IAo+ID4gPiBUaGUgc3BlY2lhbCB0aGluZyBhYm91dCBORlMgZXhwb3J0LCBhcyBvcHBvc2Vk
IHRvLCBzYXksIGtzbWJkLCBpcwo+ID4gPiBvcGVuIGJ5IGZpbGUgaGFuZGxlLCBJT1csIHRoZSBl
eHBvcnRfb3BlcmF0aW9ucy4KPiA+ID4gCj4gPiA+IEkgcGVyY2VpdmUgdGhpcyBhcyBhIHZlcnkg
c3RyYW5nZSBhbmQgdW5kZXNpcmVkIHNpdHVhdGlvbiB3aGVuIE5GUwo+ID4gPiBmaWxlIGhhbmRs
ZXMgZG8gbm90IGJlaGF2ZSBhcyBwZXJzaXN0ZW50IGZpbGUgaGFuZGxlcy4KPiA+IAo+ID4gVGhh
dCBpcyBub3QganVzdCB2ZXJ5IHN0cmFuZ2UsIGJ1dCBhY3R1YWxseSBicm9rZW4gKGRpc2NvdW50
aW5nIHRoZQo+ID4gb2JzY3VyZSB2b2xhdGlsZSBmaWxlIGhhbmRsZXMgZmVhdHVyZXMgbm90IGlt
cGxlbWVudGVkIGluIExpbnV4IE5GUwo+ID4gYW5kIE5GU0QpLiAgQW5kIHRoZSBleHBvcnQgb3Bz
IGFsd2F5cyB3b3JrZWQgdW5kZXIgdGhlIGFzc3VtcHRpb24KPiA+IHRoYXQgdGhlc2UgZmlsZSBo
YW5kbGVzIGFyZSBpbmRlZWQgcGVyc2lzdGVudC4gIElmIHRoZXkncmUgbm90IHdlCj4gPiBkbyBo
YXZlIGEgcHJvYmxlbS4KPiA+IAo+ID4gPiAKPiA+ID4gY2dyb3VwZnMsIHBpZGZzLCBuc2ZzLCBh
bGwgZ2FpbmVkIG9wZW5fYnlfaGFuZGxlX2F0KCkgY2FwYWJpbGl0eSBmb3IKPiA+ID4gYSBrbm93
biByZWFzb24sIHdoaWNoIHdhcyBOT1QgTkZTIGV4cG9ydC4KPiA+ID4gCj4gPiA+IElmIHRoZSBh
dXRob3Igb2Ygb3Blbl9ieV9oYW5kbGVfYXQoKSBzdXBwb3J0IChpLmUuIGJyYXVuZXIpIGRvZXMg
bm90Cj4gPiA+IHdpc2ggdG8gaW1wbHkgdGhhdCB0aG9zZSBmcyBzaG91bGQgYmUgZXhwb3J0ZWQg
dG8gTkZTLCB3aHkgb2JqZWN0Pwo+ID4gCj4gPiBCZWNhdXNlICJ3YW50IHRvIGV4cG9ydCIgaXMg
YSBzdHVwaWQgY2F0ZWdvcnkuCj4gPiAKPiA+IE9UT0ggIk5GUyBleHBvcnRpbmcgZG9lc24ndCBh
Y3R1YWxseSBwcm9wZXJseSB3b3JrIGJlY2F1c2Ugc29tZW9uZQo+ID4gb3ZlcmxvYWRlZCBleHBv
cnRfb3BzIHdpdGggZGlmZmVyZW50IHNlbWFudGljcyIgaXMgYSB2YWxpZCBjYXRlZ29yeS4KPiA+
IAo+IAo+IGNncm91cGZzIGRlZmluaXRlbHkgZG9lc24ndCBiZWhhdmUgYXMgZXhwZWN0ZWQgd2hl
biBleHBvcnRlZCB2aWEgTkZTLgo+IFRoZSBmaWxlcyBhcmVuJ3QgcmVhZGFibGUsIGF0IGxlYXN0
LiBJJ2QgYWxzbyBiZSBzdXJwcmlzZWQgaWYgdGhlCj4gZmlsZWhhbmRsZXMgd2VyZSBzdGFibGUg
YWNyb3NzIGEgcmVib290LCB3aGljaCBpcyBzb3J0IG9mIG5lY2Vzc2FyeSBmb3IKClRoZXkgYXJl
bid0IGFuZCBpdCdzIG5vdCBkZXNpcmFibGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
