Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC33BD37E3F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5P9jdB49hKDlFccSk7hOxsCzg7fJW68OBFNc15fu98=; b=lPEvFk0E9CF15v
	ydRlVGBR76Ugk3bknp36XdPHXJfX+eOf+YmQQmdg4eoQBrM8N9x6lw+SqxlGQ0JEyW1GEkhteH6bh
	wbYLjuvcUbaa4QOwlti0b/5dQXNNw4sgEb5hJouzWfMu/MlvRQRXyDNQS7WAnmGyhGwgZOb/DgIlf
	sem0tKqOs21Vgk9/xhxnwZrYcVRkglIajj0+usw23LGxX/shLDqRaLbs/rWfoTYL6Rz3BepI4itG8
	43WNyTkOxc2AkG/Sp1IRX+o4wcKrp0SPkN6t72izPzNmMb4qjfFupNTuoPim6ra2HqWUISJuweUcQ
	DexskgKPDn+IWCP/xltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2fl-00000009exT-2KkH;
	Wed, 14 Jan 2026 15:20:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2fh-00000009evO-3954
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 15:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 353AC443ED;
	Wed, 14 Jan 2026 15:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C66C4CEF7;
	Wed, 14 Jan 2026 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768404032;
	bh=95l5NkW0A/27kpGYcRaUumPREirLPSD0h/i7bikH9bU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqipJ8Fclg/c7qbEuyuUoO5LnexEwFkZgygpoboZW7ULcYAGY34jzrJax6uIrAgGb
	 FUepiZcAjlgA0R6fvdFVWwhV9jk0Bth6JPV5psDXj3fKzojOCwDT/rEZzcVE5OnNcB
	 fkG5ZlQLelxcsKpIOTgMpMe11bGcKCWvNYmxvgnzxn2ZC8L7s2dKJy1mrpvPNu7Z7A
	 UqZxpjIOgw/V7XPIA/1Y2FN9yOrK13WyoEdrmVdFpCQbw6zTva9Pkh2JqEgk58ngiJ
	 5S6BKkDUQrDweGrzgYJLMr/YFieOsQM7bFBSWWwVpgpU92+aZuVuBVHfvvOSCo18FZ
	 sKemGEnojFw5A==
Date: Wed, 14 Jan 2026 16:20:13 +0100
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
	Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>, Luis de Bethencourt <luisbg@kernel.org>, 
	Salah Triki <salah.triki@gmail.com>, Nicolas Pitre <nico@fluxnic.net>, Anders Larsen <al@alarsen.net>, 
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
Message-ID: <20260114-klarstellen-blamieren-0b7d40182800@brauner>
References: <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWeUv2UUJ_NdgozS@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_072033_858604_65E62122 
X-CRM114-Status: GOOD (  29.72  )
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMDU6MDY6MDdBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMTA6MzQ6MDRBTSArMDEwMCwgQW1p
ciBHb2xkc3RlaW4gd3JvdGU6Cj4gPiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCA3OjI44oCvQU0g
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMTI6MDY6NDJQTSAtMDUwMCwgSmVmZiBMYXl0b24gd3Jv
dGU6Cj4gPiA+ID4gRmFpciBwb2ludCwgYnV0IGl0J3Mgbm90IHRoYXQgaGFyZCB0byBjb25jZWl2
ZSBvZiBhIHNpdHVhdGlvbiB3aGVyZQo+ID4gPiA+IHNvbWVvbmUgaW5hZHZlcnRhbnRseSBleHBv
cnRzIGNncm91cGZzIG9yIHNvbWUgc2ltaWxhciBmaWxlc3lzdGVtOgo+ID4gPgo+ID4gPiBTdXJl
LiAgQnV0IGhvdyBpcyB0aGlzIHdvcnNlIHRoYW4gYWNjaWRlbnRhbGx5IGV4cG9ydGluZyBwcml2
YXRlIGRhdGEKPiA+ID4gb3IgYW55IG90aGVyIG1pc2NvbmZpZ3VyYXRpb24/Cj4gPiA+Cj4gPiAK
PiA+IE15IFBPViBpcyB0aGF0IGl0IGlzIGxlc3MgYWJvdXQgc2VjdXJpdHkgKGFzIHlvdXIgcXVl
c3Rpb24gaW1wbGllcyksIGFuZAo+ID4gbW9yZSBhYm91dCBjb3JyZWN0bmVzcy4KPiAKPiBJIHdh
cyBqdXN0IHJlcGx5aW5nIHRvIEplZmYuCj4gCj4gPiBUaGUgc3BlY2lhbCB0aGluZyBhYm91dCBO
RlMgZXhwb3J0LCBhcyBvcHBvc2VkIHRvLCBzYXksIGtzbWJkLCBpcwo+ID4gb3BlbiBieSBmaWxl
IGhhbmRsZSwgSU9XLCB0aGUgZXhwb3J0X29wZXJhdGlvbnMuCj4gPiAKPiA+IEkgcGVyY2VpdmUg
dGhpcyBhcyBhIHZlcnkgc3RyYW5nZSBhbmQgdW5kZXNpcmVkIHNpdHVhdGlvbiB3aGVuIE5GUwo+
ID4gZmlsZSBoYW5kbGVzIGRvIG5vdCBiZWhhdmUgYXMgcGVyc2lzdGVudCBmaWxlIGhhbmRsZXMu
Cj4gCj4gVGhhdCBpcyBub3QganVzdCB2ZXJ5IHN0cmFuZ2UsIGJ1dCBhY3R1YWxseSBicm9rZW4g
KGRpc2NvdW50aW5nIHRoZQo+IG9ic2N1cmUgdm9sYXRpbGUgZmlsZSBoYW5kbGVzIGZlYXR1cmVz
IG5vdCBpbXBsZW1lbnRlZCBpbiBMaW51eCBORlMKPiBhbmQgTkZTRCkuICBBbmQgdGhlIGV4cG9y
dCBvcHMgYWx3YXlzIHdvcmtlZCB1bmRlciB0aGUgYXNzdW1wdGlvbgo+IHRoYXQgdGhlc2UgZmls
ZSBoYW5kbGVzIGFyZSBpbmRlZWQgcGVyc2lzdGVudC4gIElmIHRoZXkncmUgbm90IHdlCj4gZG8g
aGF2ZSBhIHByb2JsZW0uCj4gCj4gPiAKPiA+IGNncm91cGZzLCBwaWRmcywgbnNmcywgYWxsIGdh
aW5lZCBvcGVuX2J5X2hhbmRsZV9hdCgpIGNhcGFiaWxpdHkgZm9yCj4gPiBhIGtub3duIHJlYXNv
biwgd2hpY2ggd2FzIE5PVCBORlMgZXhwb3J0Lgo+ID4gCj4gPiBJZiB0aGUgYXV0aG9yIG9mIG9w
ZW5fYnlfaGFuZGxlX2F0KCkgc3VwcG9ydCAoaS5lLiBicmF1bmVyKSBkb2VzIG5vdAo+ID4gd2lz
aCB0byBpbXBseSB0aGF0IHRob3NlIGZzIHNob3VsZCBiZSBleHBvcnRlZCB0byBORlMsIHdoeSBv
YmplY3Q/Cj4gCj4gQmVjYXVzZSAid2FudCB0byBleHBvcnQiIGlzIGEgc3R1cGlkIGNhdGVnb3J5
Lgo+IAo+IE9UT0ggIk5GUyBleHBvcnRpbmcgZG9lc24ndCBhY3R1YWxseSBwcm9wZXJseSB3b3Jr
IGJlY2F1c2Ugc29tZW9uZQo+IG92ZXJsb2FkZWQgZXhwb3J0X29wcyB3aXRoIGRpZmZlcmVudCBz
ZW1hbnRpY3MiIGlzIGEgdmFsaWQgY2F0ZWdvcnkuCj4gCj4gPiBXZSBjb3VsZCBoYXZlIHRoZSBv
cHQtaW4vb3V0IG9mIE5GUyBleHBvcnQgZml4ZXMgcGVyIEVYUE9SVF9PUF8KPiA+IGZsYWdzIGFu
ZCB3ZSBjb3VsZCBldmVuIHRoaW5rIG9mIGFsbG93aW5nIGFkbWluIHRvIG1ha2UgdGhpcyBkZWNp
c2lvbgo+ID4gcGVyIHZmc21vdW50IChlLmcuIGZvciBjZ3JvdXBmcykuCj4gPiAKPiA+IEluIGFu
eSBjYXNlLCBJIGZhaWwgdG8gc2VlIGhvdyBvYmplY3RpbmcgdG8gdGhlIHBvc3NpYmlsaXR5IG9m
IE5GUyBleHBvcnQKPiA+IG9wdC1vdXQgc2VydmVzIGFueW9uZS4KPiAKPiBZb3UncmUgc3RpbGwg
dGhpbmsgb2YgaXQgdGhlIHdyb25nIHdheS4gIElmIHdlIGRvIGhhdmUgZmlsZSBzeXN0ZW1zCj4g
dGhhdCBicmVhayB0aGUgb3JpZ2luYWwgZXhwb3J0ZnMgc2VtYW50aWNzIHdlIG5lZWQgdG8gZml4
IHRoYXQsIGFuZAo+IHNvbWV0aGluZyBsaWtlIGEgInN0YWJsZSBoYW5kbGVzIiBmbGFnIHdpbGwg
d29yayB3ZWxsIGZvciB0aGF0LiAgQnV0Cj4gYSB0b3RhbGx5IGFyYml0cmFyeSAiaXMgZXhwb3J0
YWJsZSIgZmxhZyBpcyB0b3RhbCBub25zZW5zZS4KCkZpbGUgaGFuZGxlcyBjYW4gbGVnaXRpbWF0
ZWx5IGJlIGNvbmNlcHR1YWxpemVkIGluZGVwZW5kZW50bHkgb2YKZXhwb3J0aW5nIGEgZmlsZXN5
c3RlbS4gSWYgd2Ugd2FudGVkIHRvIHRlYXIgdGhvc2UgY29uY2VwdHMgYXBhcnQKaW1wbGVtZW50
YXRpb24gd2lzZSB3ZSBjb3VsZC4KCkl0IGlzIGNvbXBsZXRlIG5vbnNlbnNlIHRvIGV4cGVjdCB0
aGUga2VybmVsIHRvIHN1cHBvcnQgZXhwb3J0aW5nIGFueQphcmJpdHJhcnkgaW50ZXJuYWwgZmls
ZXN5c3RlbSBvciB0byBub3Qgc3VwcG9ydCBmaWxlIGhhbmRsZXMgYXQgYWxsLgoKSG93IHRoYXQg
aXMgYWNoaWV2ZWQgaXMgY29tcGxldGVseSBpcnJlbGV2YW50IHRvIHRoYXQgY29yZSBwYXJ0IG9m
IHRoZQphcmd1bWVudC4gVGhlIHBvaW50IEplZmYgYW5kIEFtaXIgYXJlIG1ha2luZyB0aGF0IGl0
IGlzIHNlbnNpYmxlIHRvCmFsbG93IG9uZSB3aXRob3V0IHRoZSBvdGhlci4KCldoZXRoZXIgb3Ig
bm90IHNvbWUgdXNlcnNwYWNlIGNyYXAgYWxsb3dzIHlvdSB0byBhY2hpZXZlIHRoZSBzYW1lIHRo
aW5nCmlzIGVudGlyZWx5IGlycmVsZXZhbnQgYW5kIGRvZXMgbm90IGF0IGFsbCBpbXBseSB3ZSBo
YXZlIHRvIGFsbG93IHRoZQpzYW1lIGNyYXAgaW4gdGhlIGtlcm5lbC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
