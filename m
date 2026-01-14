Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878BED37E25
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 13:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9D9wiGhUJxwYeI/bQt3tugBV/3ia62R2eROEFNt9BU=; b=BCb51pZmx5viWo
	gMbgkuhylQtIK5EuOSe8qbyRExtGluKiiZxq2dxJ0VsKka84zGty/PP3eOfcWiX+IqVs1zsHAnesW
	dtFfR7CIlY8bx0xywWx3x5Y1yBIvma64K+MKrjZz8NOFGlMrQXuh2HYJWatql6GLREJDCkooHyEPP
	XaLzWwmWzyI9YAHNC93RfOlneppXYbLSUqtkc1mJyOi+V8PiAxYTBNQP/MAgPOWIU0sDRCS3SmGaa
	k52Z7UwA6BJtwQnqsByUrDbeK5GEzVyI5qGpBbTlW4ZtSJ8eF96BQbvYh6kXDpWbg4wuuKqCe7SB8
	TQS40N90yDUXfuYFMvrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0Zm-00000009GpO-3SUM;
	Wed, 14 Jan 2026 13:06:18 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0Zb-00000009Gnt-0ut4;
	Wed, 14 Jan 2026 13:06:07 +0000
Date: Wed, 14 Jan 2026 05:06:07 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>,
	Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>,
	Nicolas Pitre <nico@fluxnic.net>, Anders Larsen <al@alarsen.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Dave Kleikamp <shaggy@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Carlos Maiolino <cem@kernel.org>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>, Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, gfs2@lists.linux.dev, linux-doc@vger.kernel.org,
	v9fs@lists.linux.dev, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
Message-ID: <aWeUv2UUJ_NdgozS@infradead.org>
References: <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMTA6MzQ6MDRBTSArMDEwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgNzoyOOKAr0FNIENocmlzdG9waCBIZWxs
d2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBKYW4gMTMsIDIw
MjYgYXQgMTI6MDY6NDJQTSAtMDUwMCwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiA+IEZhaXIgcG9p
bnQsIGJ1dCBpdCdzIG5vdCB0aGF0IGhhcmQgdG8gY29uY2VpdmUgb2YgYSBzaXR1YXRpb24gd2hl
cmUKPiA+ID4gc29tZW9uZSBpbmFkdmVydGFudGx5IGV4cG9ydHMgY2dyb3VwZnMgb3Igc29tZSBz
aW1pbGFyIGZpbGVzeXN0ZW06Cj4gPgo+ID4gU3VyZS4gIEJ1dCBob3cgaXMgdGhpcyB3b3JzZSB0
aGFuIGFjY2lkZW50YWxseSBleHBvcnRpbmcgcHJpdmF0ZSBkYXRhCj4gPiBvciBhbnkgb3RoZXIg
bWlzY29uZmlndXJhdGlvbj8KPiA+Cj4gCj4gTXkgUE9WIGlzIHRoYXQgaXQgaXMgbGVzcyBhYm91
dCBzZWN1cml0eSAoYXMgeW91ciBxdWVzdGlvbiBpbXBsaWVzKSwgYW5kCj4gbW9yZSBhYm91dCBj
b3JyZWN0bmVzcy4KCkkgd2FzIGp1c3QgcmVwbHlpbmcgdG8gSmVmZi4KCj4gVGhlIHNwZWNpYWwg
dGhpbmcgYWJvdXQgTkZTIGV4cG9ydCwgYXMgb3Bwb3NlZCB0bywgc2F5LCBrc21iZCwgaXMKPiBv
cGVuIGJ5IGZpbGUgaGFuZGxlLCBJT1csIHRoZSBleHBvcnRfb3BlcmF0aW9ucy4KPiAKPiBJIHBl
cmNlaXZlIHRoaXMgYXMgYSB2ZXJ5IHN0cmFuZ2UgYW5kIHVuZGVzaXJlZCBzaXR1YXRpb24gd2hl
biBORlMKPiBmaWxlIGhhbmRsZXMgZG8gbm90IGJlaGF2ZSBhcyBwZXJzaXN0ZW50IGZpbGUgaGFu
ZGxlcy4KClRoYXQgaXMgbm90IGp1c3QgdmVyeSBzdHJhbmdlLCBidXQgYWN0dWFsbHkgYnJva2Vu
IChkaXNjb3VudGluZyB0aGUKb2JzY3VyZSB2b2xhdGlsZSBmaWxlIGhhbmRsZXMgZmVhdHVyZXMg
bm90IGltcGxlbWVudGVkIGluIExpbnV4IE5GUwphbmQgTkZTRCkuICBBbmQgdGhlIGV4cG9ydCBv
cHMgYWx3YXlzIHdvcmtlZCB1bmRlciB0aGUgYXNzdW1wdGlvbgp0aGF0IHRoZXNlIGZpbGUgaGFu
ZGxlcyBhcmUgaW5kZWVkIHBlcnNpc3RlbnQuICBJZiB0aGV5J3JlIG5vdCB3ZQpkbyBoYXZlIGEg
cHJvYmxlbS4KCj4gCj4gY2dyb3VwZnMsIHBpZGZzLCBuc2ZzLCBhbGwgZ2FpbmVkIG9wZW5fYnlf
aGFuZGxlX2F0KCkgY2FwYWJpbGl0eSBmb3IKPiBhIGtub3duIHJlYXNvbiwgd2hpY2ggd2FzIE5P
VCBORlMgZXhwb3J0Lgo+IAo+IElmIHRoZSBhdXRob3Igb2Ygb3Blbl9ieV9oYW5kbGVfYXQoKSBz
dXBwb3J0IChpLmUuIGJyYXVuZXIpIGRvZXMgbm90Cj4gd2lzaCB0byBpbXBseSB0aGF0IHRob3Nl
IGZzIHNob3VsZCBiZSBleHBvcnRlZCB0byBORlMsIHdoeSBvYmplY3Q/CgpCZWNhdXNlICJ3YW50
IHRvIGV4cG9ydCIgaXMgYSBzdHVwaWQgY2F0ZWdvcnkuCgpPVE9IICJORlMgZXhwb3J0aW5nIGRv
ZXNuJ3QgYWN0dWFsbHkgcHJvcGVybHkgd29yayBiZWNhdXNlIHNvbWVvbmUKb3ZlcmxvYWRlZCBl
eHBvcnRfb3BzIHdpdGggZGlmZmVyZW50IHNlbWFudGljcyIgaXMgYSB2YWxpZCBjYXRlZ29yeS4K
Cj4gV2UgY291bGQgaGF2ZSB0aGUgb3B0LWluL291dCBvZiBORlMgZXhwb3J0IGZpeGVzIHBlciBF
WFBPUlRfT1BfCj4gZmxhZ3MgYW5kIHdlIGNvdWxkIGV2ZW4gdGhpbmsgb2YgYWxsb3dpbmcgYWRt
aW4gdG8gbWFrZSB0aGlzIGRlY2lzaW9uCj4gcGVyIHZmc21vdW50IChlLmcuIGZvciBjZ3JvdXBm
cykuCj4gCj4gSW4gYW55IGNhc2UsIEkgZmFpbCB0byBzZWUgaG93IG9iamVjdGluZyB0byB0aGUg
cG9zc2liaWxpdHkgb2YgTkZTIGV4cG9ydAo+IG9wdC1vdXQgc2VydmVzIGFueW9uZS4KCllvdSdy
ZSBzdGlsbCB0aGluayBvZiBpdCB0aGUgd3Jvbmcgd2F5LiAgSWYgd2UgZG8gaGF2ZSBmaWxlIHN5
c3RlbXMKdGhhdCBicmVhayB0aGUgb3JpZ2luYWwgZXhwb3J0ZnMgc2VtYW50aWNzIHdlIG5lZWQg
dG8gZml4IHRoYXQsIGFuZApzb21ldGhpbmcgbGlrZSBhICJzdGFibGUgaGFuZGxlcyIgZmxhZyB3
aWxsIHdvcmsgd2VsbCBmb3IgdGhhdC4gIEJ1dAphIHRvdGFsbHkgYXJiaXRyYXJ5ICJpcyBleHBv
cnRhYmxlIiBmbGFnIGlzIHRvdGFsIG5vbnNlbnNlLgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
