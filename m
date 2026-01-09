Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77056D26D8F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 18:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t17RNHBfbHzJgL9W+o+IwVY+G3pZvDNFFWiMfPvijI4=; b=QEP2Xgun/DZqJr
	jTwuh9m9wGny0WyXKQU4czBUaHvZwLlgi4uKuePnWCrz+wgylnT8DfTVDHyPNxAse3S3cHOQNcMSz
	jeCNNZiYK6Qto6OjlNjpI5AkHk+bSsYOClINj4Bwtx5uqk1y+/luzJ0OaQBXUn0LjZ0Babw2u8MCY
	OMq24oxhrdO8RpL2PUpUjIMngsW0CWIybrK6yRfy2wa5PZKtiMFxdZRDdWCcJd0q/c14d0jQP/fmD
	AprBiD2pVtXtOBbJ7BipiGfyT2eGhVgi/BQECbSEwNc3Wx+p3dewZ7bc2fPUA9Jj99j+VHUv9Ynkx
	h1InQmu7BbxbnUyj013A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHbn-00000002uAD-24Ky;
	Fri, 09 Jan 2026 18:53:15 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHbl-00000002u9G-0Ecu
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 18:53:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so7764324a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2026 10:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767984790; x=1768589590; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEO8wbSaGOwwRv5UKfYcgXejOCV3Kmi4mBiob/Mhc5w=;
        b=L/eWwBFgWjtkHawRO2l1Z2IPlrjbugmOPUDmpu/kfMcnR3pfUnwvb+vBiUC96lqw3m
         XIj1+cUI2yHvH2lfP7hGdmdN1CinSWFvIU3sQluyFDHTL5E0fT5DQC9IQy6fzZhts7tf
         GcBGmRRCp2mobX/EdTGQ4zpEctSOpHIA5sPsOeECPvs72j0qKPPz0AlVyuv7Z5oy7UfO
         TMyQHJhZAScnF7ZHsCHVT6UluG43v3eTDXo/V0rWXBKEsaJagF3MUlNgx9/JauNk7Sjn
         ZpGHYIzw3q4JK2ytQuPZO9ql7tv/wwLZf3iSM7QUtysPxUL9vznbmX1p6ebg4Mqsr0xO
         xOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767984790; x=1768589590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PEO8wbSaGOwwRv5UKfYcgXejOCV3Kmi4mBiob/Mhc5w=;
        b=PAq1qiyGZVAWfyfuHyy72xty78PyAFjIYF0Fj3ctpWTTytfLB2oRIUCcUn0Rs7XrnU
         hMw/PPbmaPjrF3PRKZjWIPYJskCQezuwqw6sBQA7YGVML6uP1kwboytykGTsXWhA+5l7
         hgiew3v0X2vmjpsdcFRj20khaeZYDjOtXnWRexxugZlVvz3T8DTc0uhp48rn3Ax7UDTd
         7Rqxwjpq5A2FkWHPbllNLyC8VXs76V5eelIbEz9EsiihXOUs50YDpsJImzFLFwj2YtAh
         Jgpoxt0Km5n9LWDGpXk39ip6xtujag25jcsb+LeLTXSbAMQV4mc4bHbFwhr8rAk3Eivo
         wTMw==
X-Forwarded-Encrypted: i=1; AJvYcCVubYtcfzqmcg6HovpMkOifEvwoTLSOvYdwb6hbyWxXVIIskW4ZBK7UrRH8pGsvamhm3GZD4xT6YoA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxI8H4T8K0pT3y0DvVM4JI70Kqww2lx5VUgTSEdO8Uyleuspcen
	sGWZxE0V7rEAGYDmhvbnioXH/80kSvKTIVo5NSeCvmQVy5nVM8JsP4YWwYc+gzW/boYzN2H4S8/
	2bgJZQhXvxAkTAXkbMI9EEA+VR/wqcNk=
X-Gm-Gg: AY/fxX5PzTrfDR3PuSmvEHPEdY/0oDRj3KLe/wjM2uAi7l0CrcBtPnNrDCWueOT4E8R
	BL8EvplznVEk6CRjUiX1jbOQHh4qnHnkLfO87K9yPpZlreLJgFznKE/NVIUrY6WvrGCqE14FpYE
	CFSgt9vnjmC9TbfvWxLVUkO6BE/sLVinu2834qQNmZjvMkoE0RdiYhv5eH1qJrrklABH3Ak8Kk4
	C4Zzsug/vX3KGt+d+HG9KmFV2cw1GnNWGgYsmngk6czVO7qnVTMqbAUc8UCgQka/R1IKYLkjZKA
	WiM4bAYqvqh5c/m9yVz06F40dnxvQhL9qvAFa6LO
X-Google-Smtp-Source: AGHT+IFY7MBbUL67We039/hTqFQidfYCDXoLMKl5hH4eJeY3RDGzxdromP5L0kMZXOGuaChoBhGE8PO55vilYs9+TsQ=
X-Received: by 2002:a05:6402:278f:b0:64b:4333:1ece with SMTP id
 4fb4d7f45d1cf-65097e88af5mr10672063a12.34.1767984790069; Fri, 09 Jan 2026
 10:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4> <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
In-Reply-To: <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 9 Jan 2026 19:52:57 +0100
X-Gm-Features: AQt7F2pw3gC6snSxmHIFjd46zJk7oZ4nEXaveS8flAw1hsLI4KglAqmZVf1WWIg
Message-ID: <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
To: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Christoph Hellwig <hch@infradead.org>, Anders Larsen <al@alarsen.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>, 
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
	Miklos Szeredi <miklos@szeredi.hu>, Phillip Lougher <phillip@squashfs.org.uk>, 
	Carlos Maiolino <cem@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
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
X-CRM114-CacheID: sfid-20260109_105313_161936_1D0766E5 
X-CRM114-Status: GOOD (  35.54  )
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

T24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjU34oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIwMjYtMDEtMDggYXQgMTg6NDAgKzAxMDAsIEph
biBLYXJhIHdyb3RlOgo+ID4gT24gVGh1IDA4LTAxLTI2IDEyOjEyOjU1LCBKZWZmIExheXRvbiB3
cm90ZToKPiA+ID4gWWVzdGVyZGF5LCBJIHNlbnQgcGF0Y2hlcyB0byBmaXggaG93IGRpcmVjdG9y
eSBkZWxlZ2F0aW9uIHN1cHBvcnQgaXMKPiA+ID4gaGFuZGxlZCBvbiBmaWxlc3lzdGVtcyB3aGVy
ZSB0aGUgc2hvdWxkIGJlIGRpc2FibGVkIFsxXS4gVGhhdCBzZXQgaXMKPiA+ID4gYXBwcm9wcmlh
dGUgZm9yIHY2LjE5LiBGb3IgdjcuMCwgSSB3YW50IHRvIG1ha2UgbGVhc2Ugc3VwcG9ydCBiZSBt
b3JlCj4gPiA+IG9wdC1pbiwgcmF0aGVyIHRoYW4gb3B0LW91dDoKPiA+ID4KPiA+ID4gRm9yIGhp
c3RvcmljYWwgcmVhc29ucywgd2hlbiAtPnNldGxlYXNlKCkgZmlsZV9vcGVyYXRpb24gaXMgc2V0
IHRvIE5VTEwsCj4gPiA+IHRoZSBkZWZhdWx0IGlzIHRvIHVzZSB0aGUga2VybmVsLWludGVybmFs
IGxlYXNlIGltcGxlbWVudGF0aW9uLiBUaGlzCj4gPiA+IG1lYW5zIHRoYXQgaWYgeW91IHdhbnQg
dG8gZGlzYWJsZSB0aGVtLCB5b3UgbmVlZCB0byBleHBsaWNpdGx5IHNldCB0aGUKPiA+ID4gLT5z
ZXRsZWFzZSgpIGZpbGVfb3BlcmF0aW9uIHRvIHNpbXBsZV9ub3NldGxlYXNlKCkgb3IgdGhlIGVx
dWl2YWxlbnQuCj4gPiA+Cj4gPiA+IFRoaXMgaGFzIGNhdXNlZCBhIG51bWJlciBvZiBwcm9ibGVt
cyBvdmVyIHRoZSB5ZWFycyBhcyBzb21lIGZpbGVzeXN0ZW1zCj4gPiA+IGhhdmUgaW5hZHZlcnRh
bnRseSBhbGxvd2VkIGxlYXNlcyB0byBiZSBhY3F1aXJlZCBzaW1wbHkgYnkgaGF2aW5nIGxlZnQK
PiA+ID4gaXQgc2V0IHRvIE5VTEwuIEl0IHdvdWxkIGJlIGJldHRlciBpZiBmaWxlc3lzdGVtcyBo
YWQgdG8gb3B0LWluIHRvIGxlYXNlCj4gPiA+IHN1cHBvcnQsIHBhcnRpY3VsYXJseSB3aXRoIHRo
ZSBhZHZlbnQgb2YgZGlyZWN0b3J5IGRlbGVnYXRpb25zLgo+ID4gPgo+ID4gPiBUaGlzIHNlcmll
cyBoYXMgc2V0cyB0aGUgLT5zZXRsZWFzZSgpIG9wZXJhdGlvbiBpbiBhIHBpbGUgb2YgZXhpc3Rp
bmcKPiA+ID4gbG9jYWwgZmlsZXN5c3RlbXMgdG8gZ2VuZXJpY19zZXRsZWFzZSgpIGFuZCB0aGVu
IGNoYW5nZXMKPiA+ID4ga2VybmVsX3NldGxlYXNlKCkgdG8gcmV0dXJuIC1FSU5WQUwgd2hlbiB0
aGUgc2V0bGVhc2UoKSBvcGVyYXRpb24gaXMgbm90Cj4gPiA+IHNldC4KPiA+ID4KPiA+ID4gV2l0
aCB0aGlzIGNoYW5nZSwgbmV3IGZpbGVzeXN0ZW1zIHdpbGwgbmVlZCB0byBleHBsaWNpdGx5IHNl
dCB0aGUKPiA+ID4gLT5zZXRsZWFzZSgpIG9wZXJhdGlvbnMgaW4gb3JkZXIgdG8gcHJvdmlkZSBs
ZWFzZSBhbmQgZGVsZWdhdGlvbgo+ID4gPiBzdXBwb3J0Lgo+ID4gPgo+ID4gPiBJIG1haW5seSBm
b2N1c2VkIG9uIGZpbGVzeXN0ZW1zIHRoYXQgYXJlIE5GUyBleHBvcnRhYmxlLCBzaW5jZSBORlMg
YW5kCj4gPiA+IFNNQiBhcmUgdGhlIG1haW4gdXNlcnMgb2YgZmlsZSBsZWFzZXMsIGFuZCB0aGV5
IHRlbmQgdG8gZW5kIHVwIGV4cG9ydGluZwo+ID4gPiB0aGUgc2FtZSBmaWxlc3lzdGVtIHR5cGVz
LiBMZXQgbWUga25vdyBpZiBJJ3ZlIG1pc3NlZCBhbnkuCj4gPgo+ID4gU28sIHdoYXQgYWJvdXQg
a2VybmZzIGFuZCBmdXNlPyBUaGV5IHNlZW0gdG8gYmUgZXhwb3J0YWJsZSBhbmQgZG9uJ3QgaGF2
ZQo+ID4gLnNldGxlYXNlIHNldC4uLgo+ID4KPgo+IFllcywgRlVTRSBuZWVkcyB0aGlzIHRvby4g
SSdsbCBhZGQgYSBwYXRjaCBmb3IgdGhhdC4KPgo+IEFzIGZhciBhcyBrZXJuZnMgZ29lczogQUlV
SSwgdGhhdCdzIGJhc2ljYWxseSB3aGF0IHN5c2ZzIGFuZCByZXNjdHJsCj4gYXJlIGJ1aWx0IG9u
LiBEbyB3ZSByZWFsbHkgZXhwZWN0IHBlb3BsZSB0byBzZXQgbGVhc2VzIHRoZXJlPwo+Cj4gSSBn
dWVzcyBpdCdzIHRlY2huaWNhbGx5IGEgcmVncmVzc2lvbiBzaW5jZSB5b3UgY291bGQgc2V0IHRo
ZW0gb24gdGhvc2UKPiBzb3J0cyBvZiBmaWxlcyBlYXJsaWVyLCBidXQgcGVvcGxlIGRvbid0IHVz
dWFsbHkgZXhwb3J0IGtlcm5mcyBiYXNlZAo+IGZpbGVzeXN0ZW1zIHZpYSBORlMgb3IgU01CLCBh
bmQgdGhhdCBzZWVtcyBsaWtlIHNvbWV0aGluZyB0aGF0IGNvdWxkIGJlCj4gdXNlZCB0byBtYWtl
IG1pc2NoaWVmLgo+Cj4gQUZBSUNULCBrZXJuZnNfZXhwb3J0X29wcyBpcyBtb3N0bHkgdG8gc3Vw
cG9ydCBvcGVuX2J5X2hhbmRsZV9hdCgpLiBTZWUKPiBjb21taXQgYWE4MTg4MjUzNDc0ICgia2Vy
bmZzOiBhZGQgZXhwb3J0ZnMgb3BlcmF0aW9ucyIpLgo+Cj4gT25lIGlkZWE6IHdlIGNvdWxkIGFk
ZCBhIHdyYXBwZXIgYXJvdW5kIGdlbmVyaWNfc2V0bGVhc2UoKSBmb3IKPiBmaWxlc3lzdGVtcyBs
aWtlIHRoaXMgdGhhdCB3aWxsIGRvIGEgV0FSTl9PTkNFKCkgYW5kIHRoZW4gY2FsbAo+IGdlbmVy
aWNfc2V0bGVhc2UoKS4gVGhhdCB3b3VsZCBrZWVwIGxlYXNlcyB3b3JraW5nIG9uIHRoZW0gYnV0
IHdlIG1pZ2h0Cj4gZ2V0IHNvbWUgcmVwb3J0cyB0aGF0IHdvdWxkIHRlbGwgdXMgd2hvJ3Mgc2V0
dGluZyBsZWFzZXMgb24gdGhlc2UgZmlsZXMKPiBhbmQgd2h5LgoKSU1PLCB5b3UgYXJlIGJlaW5n
IHRvbyBjYXV0aW91cywgYnV0IHdoYXRldmVyLgoKSXQgaXMgbm90IGFjY3VyYXRlIHRoYXQga2Vy
bmZzIGZpbGVzeXN0ZW1zIGFyZSBORlMgZXhwb3J0YWJsZSBpbiBnZW5lcmFsLgpPbmx5IGNncm91
cGZzIGhhcyBLRVJORlNfUk9PVF9TVVBQT1JUX0VYUE9SVE9QLgoKSWYgYW55IGFwcGxpY2F0aW9u
IGlzIHVzaW5nIGxlYXNlcyBvbiBjZ3JvdXAgZmlsZXMsIGl0IG11c3QgYmUgc29tZQp2ZXJ5IGFk
dmFuY2VkIHJ1bnRpbWUgKGkuZS4gc3lzdGVtZCksIHNvIHdlIHNob3VsZCBrbm93IGFib3V0IHRo
ZQpyZWdyZXNzaW9uIHNvb25lciByYXRoZXIgdGhhbiBsYXRlci4KClRoZXJlIGFyZSBhbHNvIHRo
ZSByZWNlbnRseSBhZGRlZCBuc2ZzIGFuZCBwaWRmcyBleHBvcnRfb3BlcmF0aW9ucy4KCkkgaGF2
ZSBhIHJlY29sbGVjdGlvbiBhYm91dCB3YW50aW5nIHRvIGJlIGV4cGxpY2l0IGFib3V0IG5vdCBh
bGxvd2luZwp0aG9zZSB0byBiZSBleHBvcnRhYmxlIHRvIE5GUyAobnNmcyBzcGVjaWZpY2FsbHkp
LCBidXQgSSBjYW4ndCBzZWUgd2hlcmUKYW5kIGlmIHRoYXQgcmVzdHJpY3Rpb24gd2FzIGRvbmUu
CgpDaHJpc3RpYW4/IERvIHlvdSByZW1lbWJlcj8KClRoYW5rcywKQW1pci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
