Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1560D26D97
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jan 2026 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16CHE40nDVDNvM1ZRF1P6tUid56O/Of0J/TCS0tyazI=; b=hkdeZOmcfHgH8V
	W0TWEvIC4vyeLsBhKHNDFHlnMqy5wLmRITcgz8nMzbX3FZ9PKhABq40CFMvd5tk+3qsZ6AYWUvSlb
	r1/69kzBt3jm0R3rOMIMgv72sVOpcZoblbOe1kb5r3Lh+WJwohQhVlZctqpfL5BAFxI2lmBptni/D
	Lb8MgjDuhG9CjKVpph26EQTt7a09jC8/14xMjYzxzj5x0MxhPNF8ha1Mu6+huI6BR9c0TSFPB92qi
	XC28YTjtifZilyESmJkBypNV0qj7ZJXoh9648XqFOo9MW4X3KQxM7McMWW8m6AcbIBf/M0Ouq+LLA
	4pKrdWQUKZ8AbmZegmAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEYN-000000056kz-23ec;
	Mon, 12 Jan 2026 09:49:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEYL-000000056ks-0Vrm
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jan 2026 09:49:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 217D86013A;
	Mon, 12 Jan 2026 09:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD38C116D0;
	Mon, 12 Jan 2026 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768211375;
	bh=m8zAICgnxs6xkW3AmfrwI3a0ispTdY6AQGss0vAXdME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kovjAz4KC5mAD7YrC6t2czYMjBWRcZIetUzNRdlwl4Z1rGgyp9glYOLbnOZypWAbx
	 YcmUJCp6E8w+KmTy2i5WzHpX9fHwe2RpJgFtTNA95cnxyqlkjOQ7JUeU62APvVqkZH
	 Y3/3WTlqh+tsw7Ls6NjRbDo/fUnqsYd/eTTthVLhPJ/V7Q9k3YIeMunOn+RktLYgES
	 ul3EQIBMmxhQ+r6sMjogrCPwB0I4vKTgz3PxtAbmBEyff/p4uJORPrLFe5LDSB0Hni
	 RZIrOX4UDngsOGqfziwhf24VBmArYe5xbo5TLnA7nB4zBdXfiNr6kFAgXt4Ej7biQ5
	 RxoAJIZnapRSw==
Date: Mon, 12 Jan 2026 10:49:16 +0100
From: Christian Brauner <brauner@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
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
	Chuck Lever <chuck.lever@oracle.com>, Alexander Aring <alex.aring@gmail.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Eric Van Hensbergen <ericvh@kernel.org>, 
	Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, 
	Christian Schoenebeck <linux_oss@crudebyte.com>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
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
Message-ID: <20260112-gemeldet-gelitten-7d48bae7ef3f@brauner>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
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

T24gRnJpLCBKYW4gMDksIDIwMjYgYXQgMDc6NTI6NTdQTSArMDEwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjU34oCvUE0gSmVmZiBMYXl0b24gPGps
YXl0b25Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCAyMDI2LTAxLTA4IGF0IDE4
OjQwICswMTAwLCBKYW4gS2FyYSB3cm90ZToKPiA+ID4gT24gVGh1IDA4LTAxLTI2IDEyOjEyOjU1
LCBKZWZmIExheXRvbiB3cm90ZToKPiA+ID4gPiBZZXN0ZXJkYXksIEkgc2VudCBwYXRjaGVzIHRv
IGZpeCBob3cgZGlyZWN0b3J5IGRlbGVnYXRpb24gc3VwcG9ydCBpcwo+ID4gPiA+IGhhbmRsZWQg
b24gZmlsZXN5c3RlbXMgd2hlcmUgdGhlIHNob3VsZCBiZSBkaXNhYmxlZCBbMV0uIFRoYXQgc2V0
IGlzCj4gPiA+ID4gYXBwcm9wcmlhdGUgZm9yIHY2LjE5LiBGb3IgdjcuMCwgSSB3YW50IHRvIG1h
a2UgbGVhc2Ugc3VwcG9ydCBiZSBtb3JlCj4gPiA+ID4gb3B0LWluLCByYXRoZXIgdGhhbiBvcHQt
b3V0Ogo+ID4gPiA+Cj4gPiA+ID4gRm9yIGhpc3RvcmljYWwgcmVhc29ucywgd2hlbiAtPnNldGxl
YXNlKCkgZmlsZV9vcGVyYXRpb24gaXMgc2V0IHRvIE5VTEwsCj4gPiA+ID4gdGhlIGRlZmF1bHQg
aXMgdG8gdXNlIHRoZSBrZXJuZWwtaW50ZXJuYWwgbGVhc2UgaW1wbGVtZW50YXRpb24uIFRoaXMK
PiA+ID4gPiBtZWFucyB0aGF0IGlmIHlvdSB3YW50IHRvIGRpc2FibGUgdGhlbSwgeW91IG5lZWQg
dG8gZXhwbGljaXRseSBzZXQgdGhlCj4gPiA+ID4gLT5zZXRsZWFzZSgpIGZpbGVfb3BlcmF0aW9u
IHRvIHNpbXBsZV9ub3NldGxlYXNlKCkgb3IgdGhlIGVxdWl2YWxlbnQuCj4gPiA+ID4KPiA+ID4g
PiBUaGlzIGhhcyBjYXVzZWQgYSBudW1iZXIgb2YgcHJvYmxlbXMgb3ZlciB0aGUgeWVhcnMgYXMg
c29tZSBmaWxlc3lzdGVtcwo+ID4gPiA+IGhhdmUgaW5hZHZlcnRhbnRseSBhbGxvd2VkIGxlYXNl
cyB0byBiZSBhY3F1aXJlZCBzaW1wbHkgYnkgaGF2aW5nIGxlZnQKPiA+ID4gPiBpdCBzZXQgdG8g
TlVMTC4gSXQgd291bGQgYmUgYmV0dGVyIGlmIGZpbGVzeXN0ZW1zIGhhZCB0byBvcHQtaW4gdG8g
bGVhc2UKPiA+ID4gPiBzdXBwb3J0LCBwYXJ0aWN1bGFybHkgd2l0aCB0aGUgYWR2ZW50IG9mIGRp
cmVjdG9yeSBkZWxlZ2F0aW9ucy4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgc2VyaWVzIGhhcyBzZXRz
IHRoZSAtPnNldGxlYXNlKCkgb3BlcmF0aW9uIGluIGEgcGlsZSBvZiBleGlzdGluZwo+ID4gPiA+
IGxvY2FsIGZpbGVzeXN0ZW1zIHRvIGdlbmVyaWNfc2V0bGVhc2UoKSBhbmQgdGhlbiBjaGFuZ2Vz
Cj4gPiA+ID4ga2VybmVsX3NldGxlYXNlKCkgdG8gcmV0dXJuIC1FSU5WQUwgd2hlbiB0aGUgc2V0
bGVhc2UoKSBvcGVyYXRpb24gaXMgbm90Cj4gPiA+ID4gc2V0Lgo+ID4gPiA+Cj4gPiA+ID4gV2l0
aCB0aGlzIGNoYW5nZSwgbmV3IGZpbGVzeXN0ZW1zIHdpbGwgbmVlZCB0byBleHBsaWNpdGx5IHNl
dCB0aGUKPiA+ID4gPiAtPnNldGxlYXNlKCkgb3BlcmF0aW9ucyBpbiBvcmRlciB0byBwcm92aWRl
IGxlYXNlIGFuZCBkZWxlZ2F0aW9uCj4gPiA+ID4gc3VwcG9ydC4KPiA+ID4gPgo+ID4gPiA+IEkg
bWFpbmx5IGZvY3VzZWQgb24gZmlsZXN5c3RlbXMgdGhhdCBhcmUgTkZTIGV4cG9ydGFibGUsIHNp
bmNlIE5GUyBhbmQKPiA+ID4gPiBTTUIgYXJlIHRoZSBtYWluIHVzZXJzIG9mIGZpbGUgbGVhc2Vz
LCBhbmQgdGhleSB0ZW5kIHRvIGVuZCB1cCBleHBvcnRpbmcKPiA+ID4gPiB0aGUgc2FtZSBmaWxl
c3lzdGVtIHR5cGVzLiBMZXQgbWUga25vdyBpZiBJJ3ZlIG1pc3NlZCBhbnkuCj4gPiA+Cj4gPiA+
IFNvLCB3aGF0IGFib3V0IGtlcm5mcyBhbmQgZnVzZT8gVGhleSBzZWVtIHRvIGJlIGV4cG9ydGFi
bGUgYW5kIGRvbid0IGhhdmUKPiA+ID4gLnNldGxlYXNlIHNldC4uLgo+ID4gPgo+ID4KPiA+IFll
cywgRlVTRSBuZWVkcyB0aGlzIHRvby4gSSdsbCBhZGQgYSBwYXRjaCBmb3IgdGhhdC4KPiA+Cj4g
PiBBcyBmYXIgYXMga2VybmZzIGdvZXM6IEFJVUksIHRoYXQncyBiYXNpY2FsbHkgd2hhdCBzeXNm
cyBhbmQgcmVzY3RybAo+ID4gYXJlIGJ1aWx0IG9uLiBEbyB3ZSByZWFsbHkgZXhwZWN0IHBlb3Bs
ZSB0byBzZXQgbGVhc2VzIHRoZXJlPwo+ID4KPiA+IEkgZ3Vlc3MgaXQncyB0ZWNobmljYWxseSBh
IHJlZ3Jlc3Npb24gc2luY2UgeW91IGNvdWxkIHNldCB0aGVtIG9uIHRob3NlCj4gPiBzb3J0cyBv
ZiBmaWxlcyBlYXJsaWVyLCBidXQgcGVvcGxlIGRvbid0IHVzdWFsbHkgZXhwb3J0IGtlcm5mcyBi
YXNlZAo+ID4gZmlsZXN5c3RlbXMgdmlhIE5GUyBvciBTTUIsIGFuZCB0aGF0IHNlZW1zIGxpa2Ug
c29tZXRoaW5nIHRoYXQgY291bGQgYmUKPiA+IHVzZWQgdG8gbWFrZSBtaXNjaGllZi4KPiA+Cj4g
PiBBRkFJQ1QsIGtlcm5mc19leHBvcnRfb3BzIGlzIG1vc3RseSB0byBzdXBwb3J0IG9wZW5fYnlf
aGFuZGxlX2F0KCkuIFNlZQo+ID4gY29tbWl0IGFhODE4ODI1MzQ3NCAoImtlcm5mczogYWRkIGV4
cG9ydGZzIG9wZXJhdGlvbnMiKS4KPiA+Cj4gPiBPbmUgaWRlYTogd2UgY291bGQgYWRkIGEgd3Jh
cHBlciBhcm91bmQgZ2VuZXJpY19zZXRsZWFzZSgpIGZvcgo+ID4gZmlsZXN5c3RlbXMgbGlrZSB0
aGlzIHRoYXQgd2lsbCBkbyBhIFdBUk5fT05DRSgpIGFuZCB0aGVuIGNhbGwKPiA+IGdlbmVyaWNf
c2V0bGVhc2UoKS4gVGhhdCB3b3VsZCBrZWVwIGxlYXNlcyB3b3JraW5nIG9uIHRoZW0gYnV0IHdl
IG1pZ2h0Cj4gPiBnZXQgc29tZSByZXBvcnRzIHRoYXQgd291bGQgdGVsbCB1cyB3aG8ncyBzZXR0
aW5nIGxlYXNlcyBvbiB0aGVzZSBmaWxlcwo+ID4gYW5kIHdoeS4KPiAKPiBJTU8sIHlvdSBhcmUg
YmVpbmcgdG9vIGNhdXRpb3VzLCBidXQgd2hhdGV2ZXIuCj4gCj4gSXQgaXMgbm90IGFjY3VyYXRl
IHRoYXQga2VybmZzIGZpbGVzeXN0ZW1zIGFyZSBORlMgZXhwb3J0YWJsZSBpbiBnZW5lcmFsLgo+
IE9ubHkgY2dyb3VwZnMgaGFzIEtFUk5GU19ST09UX1NVUFBPUlRfRVhQT1JUT1AuCj4gCj4gSWYg
YW55IGFwcGxpY2F0aW9uIGlzIHVzaW5nIGxlYXNlcyBvbiBjZ3JvdXAgZmlsZXMsIGl0IG11c3Qg
YmUgc29tZQo+IHZlcnkgYWR2YW5jZWQgcnVudGltZSAoaS5lLiBzeXN0ZW1kKSwgc28gd2Ugc2hv
dWxkIGtub3cgYWJvdXQgdGhlCj4gcmVncmVzc2lvbiBzb29uZXIgcmF0aGVyIHRoYW4gbGF0ZXIu
Cj4gCj4gVGhlcmUgYXJlIGFsc28gdGhlIHJlY2VudGx5IGFkZGVkIG5zZnMgYW5kIHBpZGZzIGV4
cG9ydF9vcGVyYXRpb25zLgo+IAo+IEkgaGF2ZSBhIHJlY29sbGVjdGlvbiBhYm91dCB3YW50aW5n
IHRvIGJlIGV4cGxpY2l0IGFib3V0IG5vdCBhbGxvd2luZwo+IHRob3NlIHRvIGJlIGV4cG9ydGFi
bGUgdG8gTkZTIChuc2ZzIHNwZWNpZmljYWxseSksIGJ1dCBJIGNhbid0IHNlZSB3aGVyZQo+IGFu
ZCBpZiB0aGF0IHJlc3RyaWN0aW9uIHdhcyBkb25lLgo+IAo+IENocmlzdGlhbj8gRG8geW91IHJl
bWVtYmVyPwoKSSBkb24ndCB0aGluayBpdCBkb2VzLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
