Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C518CD29DEC
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jan 2026 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DU/NzhEH4tm3TNnJIc8fY5WYgPJRautplPm0NC5l7gU=; b=sSI+BsaqvNEHie
	Yr2heX4IDSK+4GgHYPU1sfVAyjC6fzdG+xGr7xmeojE791zKU5iN9W+q0RNP6W0I2ZgshPjObpQHM
	1IO0lv0cfchAkRJuKb0Q9N+cjRUUakdMJ+5BgelCjKecckZwaBi9d26OPyQvrCnKQUWoCP8GAUa16
	vXmKNo9uF3+ETimXxlTTRu99C68EJrpO/rjEETx2EMFE+/5t4tDDwkvzP7yXwJGCZbFxf0uRLUz1r
	wd7+qgECqWx4f+r90QHLqIQBJbStwLaMQZ8sdqYfv4PF9JocwEoZcnrhRl4weTcvtx8o2QjL8tgbl
	Z3K4SW8L4SdTSTHMRDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaAh-00000006mXf-2m4x;
	Tue, 13 Jan 2026 08:54:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaAd-00000006mXF-1o4P
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jan 2026 08:54:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B157432B5;
	Tue, 13 Jan 2026 08:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A24BC116C6;
	Tue, 13 Jan 2026 08:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768294474;
	bh=8pJH5EMsw2Zf/vnxVI5TNW+Tn1VjYrvuVd/4u81hQjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMqw4jfOdED4XJIXekFPVJQafNNTl6ZiZA++QmJZRBiaMMpeaGnJz3p4o2lTbIKwN
	 ZGKZS5HpYR0+N1ii5xC8s/TyQQtV2NHGSS3n0xjeitfnyVlfkGYGF3WN3Zn7pEUn7y
	 amB5o/YtgvPlamLE3g3COpvYgjvxdfsKYBT2hFD400U3g9OGS1J+dMj0yVSbLkyPHq
	 +GkCBtTzjYLjVlnxILoQmVvBvvr3BKnDX0iaKwspCd8aN5JnS4IRKaSF02TomWn63P
	 ouok9TX1G4ku4VsaA4mPbFNSkRS1iOdM6roW82YC7GjR5YxocE6Li41axUo0cFM9rz
	 CEFrc/zUFpOyw==
Date: Tue, 13 Jan 2026 09:54:15 +0100
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Christoph Hellwig <hch@infradead.org>, 
	Anders Larsen <al@alarsen.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
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
Message-ID: <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_005435_535266_AF7A2E3F 
X-CRM114-Status: GOOD (  63.01  )
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMDk6NTA6MjBBTSAtMDUwMCwgSmVmZiBMYXl0b24gd3Jv
dGU6Cj4gT24gTW9uLCAyMDI2LTAxLTEyIGF0IDA5OjMxIC0wNTAwLCBDaHVjayBMZXZlciB3cm90
ZToKPiA+IE9uIDEvMTIvMjYgODozNCBBTSwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiA+IE9uIEZy
aSwgMjAyNi0wMS0wOSBhdCAxOTo1MiArMDEwMCwgQW1pciBHb2xkc3RlaW4gd3JvdGU6Cj4gPiA+
ID4gT24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjU34oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25A
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9uIFRodSwgMjAyNi0wMS0w
OCBhdCAxODo0MCArMDEwMCwgSmFuIEthcmEgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFRodSAwOC0w
MS0yNiAxMjoxMjo1NSwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gWWVzdGVyZGF5
LCBJIHNlbnQgcGF0Y2hlcyB0byBmaXggaG93IGRpcmVjdG9yeSBkZWxlZ2F0aW9uIHN1cHBvcnQg
aXMKPiA+ID4gPiA+ID4gPiBoYW5kbGVkIG9uIGZpbGVzeXN0ZW1zIHdoZXJlIHRoZSBzaG91bGQg
YmUgZGlzYWJsZWQgWzFdLiBUaGF0IHNldCBpcwo+ID4gPiA+ID4gPiA+IGFwcHJvcHJpYXRlIGZv
ciB2Ni4xOS4gRm9yIHY3LjAsIEkgd2FudCB0byBtYWtlIGxlYXNlIHN1cHBvcnQgYmUgbW9yZQo+
ID4gPiA+ID4gPiA+IG9wdC1pbiwgcmF0aGVyIHRoYW4gb3B0LW91dDoKPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiBGb3IgaGlzdG9yaWNhbCByZWFzb25zLCB3aGVuIC0+c2V0bGVhc2UoKSBm
aWxlX29wZXJhdGlvbiBpcyBzZXQgdG8gTlVMTCwKPiA+ID4gPiA+ID4gPiB0aGUgZGVmYXVsdCBp
cyB0byB1c2UgdGhlIGtlcm5lbC1pbnRlcm5hbCBsZWFzZSBpbXBsZW1lbnRhdGlvbi4gVGhpcwo+
ID4gPiA+ID4gPiA+IG1lYW5zIHRoYXQgaWYgeW91IHdhbnQgdG8gZGlzYWJsZSB0aGVtLCB5b3Ug
bmVlZCB0byBleHBsaWNpdGx5IHNldCB0aGUKPiA+ID4gPiA+ID4gPiAtPnNldGxlYXNlKCkgZmls
ZV9vcGVyYXRpb24gdG8gc2ltcGxlX25vc2V0bGVhc2UoKSBvciB0aGUgZXF1aXZhbGVudC4KPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGlzIGhhcyBjYXVzZWQgYSBudW1iZXIgb2YgcHJv
YmxlbXMgb3ZlciB0aGUgeWVhcnMgYXMgc29tZSBmaWxlc3lzdGVtcwo+ID4gPiA+ID4gPiA+IGhh
dmUgaW5hZHZlcnRhbnRseSBhbGxvd2VkIGxlYXNlcyB0byBiZSBhY3F1aXJlZCBzaW1wbHkgYnkg
aGF2aW5nIGxlZnQKPiA+ID4gPiA+ID4gPiBpdCBzZXQgdG8gTlVMTC4gSXQgd291bGQgYmUgYmV0
dGVyIGlmIGZpbGVzeXN0ZW1zIGhhZCB0byBvcHQtaW4gdG8gbGVhc2UKPiA+ID4gPiA+ID4gPiBz
dXBwb3J0LCBwYXJ0aWN1bGFybHkgd2l0aCB0aGUgYWR2ZW50IG9mIGRpcmVjdG9yeSBkZWxlZ2F0
aW9ucy4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGlzIHNlcmllcyBoYXMgc2V0cyB0
aGUgLT5zZXRsZWFzZSgpIG9wZXJhdGlvbiBpbiBhIHBpbGUgb2YgZXhpc3RpbmcKPiA+ID4gPiA+
ID4gPiBsb2NhbCBmaWxlc3lzdGVtcyB0byBnZW5lcmljX3NldGxlYXNlKCkgYW5kIHRoZW4gY2hh
bmdlcwo+ID4gPiA+ID4gPiA+IGtlcm5lbF9zZXRsZWFzZSgpIHRvIHJldHVybiAtRUlOVkFMIHdo
ZW4gdGhlIHNldGxlYXNlKCkgb3BlcmF0aW9uIGlzIG5vdAo+ID4gPiA+ID4gPiA+IHNldC4KPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBXaXRoIHRoaXMgY2hhbmdlLCBuZXcgZmlsZXN5c3Rl
bXMgd2lsbCBuZWVkIHRvIGV4cGxpY2l0bHkgc2V0IHRoZQo+ID4gPiA+ID4gPiA+IC0+c2V0bGVh
c2UoKSBvcGVyYXRpb25zIGluIG9yZGVyIHRvIHByb3ZpZGUgbGVhc2UgYW5kIGRlbGVnYXRpb24K
PiA+ID4gPiA+ID4gPiBzdXBwb3J0Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEkgbWFp
bmx5IGZvY3VzZWQgb24gZmlsZXN5c3RlbXMgdGhhdCBhcmUgTkZTIGV4cG9ydGFibGUsIHNpbmNl
IE5GUyBhbmQKPiA+ID4gPiA+ID4gPiBTTUIgYXJlIHRoZSBtYWluIHVzZXJzIG9mIGZpbGUgbGVh
c2VzLCBhbmQgdGhleSB0ZW5kIHRvIGVuZCB1cCBleHBvcnRpbmcKPiA+ID4gPiA+ID4gPiB0aGUg
c2FtZSBmaWxlc3lzdGVtIHR5cGVzLiBMZXQgbWUga25vdyBpZiBJJ3ZlIG1pc3NlZCBhbnkuCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBTbywgd2hhdCBhYm91dCBrZXJuZnMgYW5kIGZ1c2U/IFRo
ZXkgc2VlbSB0byBiZSBleHBvcnRhYmxlIGFuZCBkb24ndCBoYXZlCj4gPiA+ID4gPiA+IC5zZXRs
ZWFzZSBzZXQuLi4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFllcywgRlVTRSBu
ZWVkcyB0aGlzIHRvby4gSSdsbCBhZGQgYSBwYXRjaCBmb3IgdGhhdC4KPiA+ID4gPiA+IAo+ID4g
PiA+ID4gQXMgZmFyIGFzIGtlcm5mcyBnb2VzOiBBSVVJLCB0aGF0J3MgYmFzaWNhbGx5IHdoYXQg
c3lzZnMgYW5kIHJlc2N0cmwKPiA+ID4gPiA+IGFyZSBidWlsdCBvbi4gRG8gd2UgcmVhbGx5IGV4
cGVjdCBwZW9wbGUgdG8gc2V0IGxlYXNlcyB0aGVyZT8KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSBn
dWVzcyBpdCdzIHRlY2huaWNhbGx5IGEgcmVncmVzc2lvbiBzaW5jZSB5b3UgY291bGQgc2V0IHRo
ZW0gb24gdGhvc2UKPiA+ID4gPiA+IHNvcnRzIG9mIGZpbGVzIGVhcmxpZXIsIGJ1dCBwZW9wbGUg
ZG9uJ3QgdXN1YWxseSBleHBvcnQga2VybmZzIGJhc2VkCj4gPiA+ID4gPiBmaWxlc3lzdGVtcyB2
aWEgTkZTIG9yIFNNQiwgYW5kIHRoYXQgc2VlbXMgbGlrZSBzb21ldGhpbmcgdGhhdCBjb3VsZCBi
ZQo+ID4gPiA+ID4gdXNlZCB0byBtYWtlIG1pc2NoaWVmLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBB
RkFJQ1QsIGtlcm5mc19leHBvcnRfb3BzIGlzIG1vc3RseSB0byBzdXBwb3J0IG9wZW5fYnlfaGFu
ZGxlX2F0KCkuIFNlZQo+ID4gPiA+ID4gY29tbWl0IGFhODE4ODI1MzQ3NCAoImtlcm5mczogYWRk
IGV4cG9ydGZzIG9wZXJhdGlvbnMiKS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gT25lIGlkZWE6IHdl
IGNvdWxkIGFkZCBhIHdyYXBwZXIgYXJvdW5kIGdlbmVyaWNfc2V0bGVhc2UoKSBmb3IKPiA+ID4g
PiA+IGZpbGVzeXN0ZW1zIGxpa2UgdGhpcyB0aGF0IHdpbGwgZG8gYSBXQVJOX09OQ0UoKSBhbmQg
dGhlbiBjYWxsCj4gPiA+ID4gPiBnZW5lcmljX3NldGxlYXNlKCkuIFRoYXQgd291bGQga2VlcCBs
ZWFzZXMgd29ya2luZyBvbiB0aGVtIGJ1dCB3ZSBtaWdodAo+ID4gPiA+ID4gZ2V0IHNvbWUgcmVw
b3J0cyB0aGF0IHdvdWxkIHRlbGwgdXMgd2hvJ3Mgc2V0dGluZyBsZWFzZXMgb24gdGhlc2UgZmls
ZXMKPiA+ID4gPiA+IGFuZCB3aHkuCj4gPiA+ID4gCj4gPiA+ID4gSU1PLCB5b3UgYXJlIGJlaW5n
IHRvbyBjYXV0aW91cywgYnV0IHdoYXRldmVyLgo+ID4gPiA+IAo+ID4gPiA+IEl0IGlzIG5vdCBh
Y2N1cmF0ZSB0aGF0IGtlcm5mcyBmaWxlc3lzdGVtcyBhcmUgTkZTIGV4cG9ydGFibGUgaW4gZ2Vu
ZXJhbC4KPiA+ID4gPiBPbmx5IGNncm91cGZzIGhhcyBLRVJORlNfUk9PVF9TVVBQT1JUX0VYUE9S
VE9QLgo+ID4gPiA+IAo+ID4gPiA+IElmIGFueSBhcHBsaWNhdGlvbiBpcyB1c2luZyBsZWFzZXMg
b24gY2dyb3VwIGZpbGVzLCBpdCBtdXN0IGJlIHNvbWUKPiA+ID4gPiB2ZXJ5IGFkdmFuY2VkIHJ1
bnRpbWUgKGkuZS4gc3lzdGVtZCksIHNvIHdlIHNob3VsZCBrbm93IGFib3V0IHRoZQo+ID4gPiA+
IHJlZ3Jlc3Npb24gc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyLgo+ID4gPiA+IAo+ID4gPiAKPiA+
ID4gSSB0aGluayBzbyB0b28uIEZvciBub3csIEkgdGhpbmsgSSdsbCBub3QgYm90aGVyIHdpdGgg
dGhlIFdBUk5fT05DRSgpLgo+ID4gPiBMZXQncyBqdXN0IGxlYXZlIGtlcm5mcyBvdXQgb2YgdGhl
IHNldCB1bnRpbCBzb21lb25lIHByZXNlbnRzIGEgcmVhbAo+ID4gPiB1c2UtY2FzZS4KPiA+ID4g
Cj4gPiA+ID4gVGhlcmUgYXJlIGFsc28gdGhlIHJlY2VudGx5IGFkZGVkIG5zZnMgYW5kIHBpZGZz
IGV4cG9ydF9vcGVyYXRpb25zLgo+ID4gPiA+IAo+ID4gPiA+IEkgaGF2ZSBhIHJlY29sbGVjdGlv
biBhYm91dCB3YW50aW5nIHRvIGJlIGV4cGxpY2l0IGFib3V0IG5vdCBhbGxvd2luZwo+ID4gPiA+
IHRob3NlIHRvIGJlIGV4cG9ydGFibGUgdG8gTkZTIChuc2ZzIHNwZWNpZmljYWxseSksIGJ1dCBJ
IGNhbid0IHNlZSB3aGVyZQo+ID4gPiA+IGFuZCBpZiB0aGF0IHJlc3RyaWN0aW9uIHdhcyBkb25l
Lgo+ID4gPiA+IAo+ID4gPiA+IENocmlzdGlhbj8gRG8geW91IHJlbWVtYmVyPwo+ID4gPiA+IAo+
ID4gPiAKPiA+ID4gKGNjJ2luZyBDaHVjaykKPiA+ID4gCj4gPiA+IEZXSVcsIHlvdSBjYW4gY3Vy
cmVudGx5IGV4cG9ydCBhbmQgbW91bnQgL3N5cy9mcy9jZ3JvdXAgdmlhIE5GUy4gVGhlCj4gPiA+
IGRpcmVjdG9yeSBkb2Vzbid0IHNob3cgdXAgd2hlbiB5b3UgdHJ5IHRvIGdldCB0byBpdCB2aWEg
TkZTdjQsIGJ1dCB5b3UKPiA+ID4gY2FuIG1vdW50IGl0IHVzaW5nIHYzIGFuZCBSRUFERElSIHdv
cmtzLiBUaGUgZmlsZXMgYXJlIGFsbCBlbXB0eSB3aGVuCj4gPiA+IHlvdSB0cnkgdG8gcmVhZCB0
aGVtLiBJIGRpZG4ndCB0cnkgdG8gZG8gYW55IHdyaXRlcy4KPiA+ID4gCj4gPiA+IFNob3VsZCB3
ZSBhZGQgYSBtZWNoYW5pc20gdG8gcHJldmVudCBleHBvcnRpbmcgdGhlc2Ugc29ydHMgb2YKPiA+
ID4gZmlsZXN5c3RlbXM/Cj4gPiA+IAo+ID4gPiBFdmVuIGJldHRlciB3b3VsZCBiZSB0byBtYWtl
IG5mc2QgZXhwb3J0aW5nIGV4cGxpY2l0bHkgb3B0LWluLiBXaGF0IGlmCj4gPiA+IHdlIHdlcmUg
dG8gYWRkIGEgRVhQT1JUX09QX05GU0QgZmxhZyB0aGF0IGV4cGxpY2l0bHkgYWxsb3dzIGZpbGVz
eXN0ZW1zCj4gPiA+IHRvIG9wdC1pbiB0byBORlMgZXhwb3J0aW5nLCBhbmQgY2hlY2sgZm9yIHRo
YXQgaW4gX19maF92ZXJpZnkoKT8gV2UnZAo+ID4gPiBoYXZlIHRvIGFkZCBpdCB0byBhIGJ1bmNo
IG9mIGV4aXN0aW5nIGZpbGVzeXN0ZW1zLCBidXQgdGhhdCdzIGZhaXJseQo+ID4gPiBzaW1wbGUg
dG8gZG8gd2l0aCBhbiBMTE0uCj4gPiAKPiA+IFdoYXQncyB0aGUgYWN0aXZlIGhhcm0gaW4gZXhw
b3J0aW5nIC9zeXMvZnMvY2dyb3VwID8gSXQgaGFzIHRvIGJlIGRvbmUKPiA+IGV4cGxpY2l0bHkg
dmlhIC9ldGMvZXhwb3J0cywgc28gdGhpcyBpcyB1bmRlciB0aGUgTkZTIHNlcnZlciBhZG1pbidz
Cj4gPiBjb250cm9sLiBJcyBpdCBhbiBhdHRhY2sgc3VyZmFjZT8KPiA+IAo+IAo+IFBvdGVudGlh
bGx5Pwo+IAo+IEkgZG9uJ3Qgc2VlIGFueSBhY3RpdmUgaGFybSB3aXRoIGV4cG9ydGluZyBjZ3Jv
dXBmcy4gSXQgZG9lc24ndCB3b3JrCj4gcmlnaHQgdmlhIG5mc2QsIGJ1dCBpdCdzIG5vdCBjcmFz
aGluZyB0aGUgYm94IG9yIGFueXRoaW5nLgo+IAo+IEF0IG9uZSB0aW1lLCB0aG9zZSB3ZXJlIG9u
bHkgZGVmaW5lZCBieSBmaWxlc3lzdGVtcyB0aGF0IHdhbnRlZCB0bwo+IGFsbG93IE5GUyBleHBv
cnQuIE5vdyB3ZSd2ZSBncm93biB0aGVtIG9uIGZpbGVzeXN0ZW1zIHRoYXQganVzdCB3YW50IHRv
Cj4gcHJvdmlkZSBmaWxlaGFuZGxlcyBmb3Igb3Blbl9ieV9oYW5kbGVfYXQoKSBhbmQgdGhlIGxp
a2UuIG5mc2QgZG9lc24ndAo+IGNhcmUgdGhvdWdoOiBpZiB0aGUgZnMgaGFzIGV4cG9ydCBvcGVy
YXRpb25zLCBpdCdsbCBoYXBwaWx5IHVzZSB0aGVtLgo+IAo+IEhhdmluZyBhbiBleHBsaWNpdCAi
SSB3YW50IHRvIGFsbG93IG5mc2QiIGZsYWcgc2VlIG1zIGxpa2UgaXQgbWlnaHQKPiBzYXZlIHVz
IHNvbWUgaGVhZGFjaGVzIGluIHRoZSBmdXR1cmUgd2hlbiBvdGhlciBmaWxlc3lzdGVtcyBhZGQg
ZXhwb3J0Cj4gb3BzIGZvciB0aGlzIHNvcnQgb2YgZmlsZWhhbmRsZSB1c2UuCgpTbyB3ZSBhcmUg
cmUtaGFzaGluZyBhIGRpc2N1c3Npb24gd2UgaGFkIGEgZmV3IG1vbnRocyBhZ28gKEFtaXIgd2Fz
Cmludm9sdmVkIGF0IGxlYXN0KS4KCkkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBleHBvc2UgY2dy
b3VwZnMgdmlhIE5GUyB0aGF0J3Mgc3VwZXIgd2VpcmQuCkl0J3MgbGlrZSByZW1vdGUgcGFydGlh
bCByZXNvdXJjZSBtYW5hZ2VtZW50IGFuZCBpdCB3b3VsZCBiZSB2ZXJ5CnN0cmFuZ2UgaWYgYSBy
ZW1vdGUgcHJvY2VzcyBzdWRkZW5seSB3b3VsZCBiZSBhYmxlIHRvIG1vdmUgdGhpbmdzIGFyb3Vu
ZAppbiB0aGUgY2dyb3VwIHRyZWUuIFNvIEkgd291bGQgcHJlZmVyIHRvIG5vdCBkbyB0aGlzLgoK
U28gbXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byByZWFsbHkgc2V2ZXIgZmlsZSBoYW5kbGVzIGZy
b20gdGhlIGV4cG9ydAptZWNoYW5pc20gc28gdGhhdCB3ZSBjYW4gYWxsb3cgc3R1ZmYgbGlrZSBw
aWRmcyBhbmQgbnNmcyBhbmQgY2dyb3VwZnMgdG8KdXNlIGZpbGUgaGFuZGxlcyB2aWEgbmFtZV90
b19oYW5kbGVfYXQoKSBhbmQgb3Blbl9ieV9oYW5kbGVfYXQoKSB3aXRob3V0Cm1ha2luZyB0aGVt
IGV4cG9ydGFibGUuCgpTb21laG93IEkgdGhvdWdodCB0aGF0IEFtaXIgaGFkIGFscmVhZHkgZG9u
ZSB0aGF0IHdvcmsgYSB3aGlsZSBhZ28gYnV0Cm1heWJlIGl0IHdhcyByZWFsbHkganVzdCBhYm91
dCBuYW1lX3RvX2hhbmRsZV9hdCgpIGFuZCBub3QgYWxzbwpvcGVuX2J5X2hhbmRsZV9hdCgpLi4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
