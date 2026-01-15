Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4298ED4661D
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 19:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rcr5OxFCrOYfV5mJwiMv8DI01nvT1ghQvWUfW69sw0=; b=2cUOW4jU2qF0pq
	BxQUhaup8nn1VmFKS4YyXi5daZsMrddpYEfW2Z6iWflgejnkEIcZQag/GrG5TCAbYpyyJ+gKkfxr5
	6Z85VenTe4M2wj7zUVjv+bip1nwmW50WO0mYKE1K5lllpgJVR4vSht0whG/DSP0yrf3utm+KlCA6j
	QUuGS4ONqhStDMlHNK0FTeLrCkQozyB+QUmTDNcUMNQcsah6ldCLNXrT7MWA4ZZIJx/wYaM/hJptv
	Ik6p8w97SY20uvB0puexvf7O7z5iRlh6B46wQoYJORwtJ4kNh7/rAP7/p/d3BmM29s366DgqMDGHJ
	jWSOG5wgyhP5Pw2ZOelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgT9w-0000000D4xx-0ODD;
	Thu, 15 Jan 2026 19:37:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgT9u-0000000D4wl-2RYo
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Jan 2026 19:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EZT+o0VjsIJqvL4Ye1+Mojw1LAugYAMc89Qw5GYzSAw=; b=glyxLyPOlWEWlfmrSMXmYpVmqU
	OL1IlPOOneWJ5QuE8zbrePt3RgROLa/yxbkZXozfOzftKb8NcCfoxodkm1mAAjSx0n9Rkgc9ChDY2
	IRJz4MQphkE+A/+W3Tiko8S+04ilschL1HzGFwSFSbVJnPZQf9k3Ss6gRHCX56TFR4BcCwVbtnqlD
	q6EDK8cEqfcqh0NZQ9VR+7FEHHq/sFreqgTLuMGMl9o0A7W1qZkHZFDoz1oKdy3eN07taLAXNicoe
	XuQ6/pL0W/spAcbD0C4xjDdxffNu/zzr0lUHaTNmfWnvntNblULj/lbG1k5OSFszDlmG9TNGgaDqT
	Z6f3Opfg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgT9r-00000007W4V-1Msi
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 19:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B2A14443E;
	Thu, 15 Jan 2026 19:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB8DC116D0;
	Thu, 15 Jan 2026 19:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768505845;
	bh=WJfdSxntdjCGN+SFF94mp89xagtZVsc8ko5YpfyHmzo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HFbrkaxb1G2AMG3MzNBQW/L4EalwCCXCDDxxDQ0j51u/B6PgVvK4NDRP+gGsVfnpe
	 VyaIgHktK2ed+mNcElWfMOvW8ETWuYtZ5BFV7xemUUxHpfR8cVtiKroue7/9G/qCGd
	 rt85fYelVNLihiQeGcg1jxPrf/3yQwBY4s+8zZk5LgZv0Ho8j42Klxvmo6vU2q3pOQ
	 ev3GcW+Npw86laMA3/1Ho9Pk9tnCRdwq68XKqMY+ib2uyFDvs9SuOLSNploZHBt1DR
	 d0vpBTEHYbunJ8ienXua5qZh3TfRauncM885fsO/Gz1dFmAlUhHctfiqlwv2dV0p89
	 QAbmFxgjt0yHA==
Message-ID: <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
Date: Thu, 15 Jan 2026 14:37:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
To: Amir Goldstein <amir73il@gmail.com>
Cc: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>,
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Theodore Tso <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>,
 Chunhai Guo <guochunhai@vivo.com>, Carlos Maiolino <cem@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, Luis de Bethencourt <luisbg@kernel.org>,
 Salah Triki <salah.triki@gmail.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>,
 Paulo Alcantara <pc@manguebit.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Bharath SM
 <bharathsm@microsoft.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev,
 ntfs3@lists.linux.dev, linux-nilfs@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 gfs2@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
From: Chuck Lever <cel@kernel.org>
Content-Language: en-US
Organization: kernel.org
In-Reply-To: <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_193727_759791_5B6BFF9B 
X-CRM114-Status: GOOD (  20.60  )
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

T24gMS8xNS8yNiAyOjE0IFBNLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiBPbiBUaHUsIEphbiAx
NSwgMjAyNiBhdCA3OjMy4oCvUE0gQ2h1Y2sgTGV2ZXIgPGNlbEBrZXJuZWwub3JnPiB3cm90ZToK
Pj4KPj4KPj4KPj4gT24gVGh1LCBKYW4gMTUsIDIwMjYsIGF0IDE6MTcgUE0sIEFtaXIgR29sZHN0
ZWluIHdyb3RlOgo+Pj4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OOKAr1BNIEplZmYgTGF5
dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gSW4gcmVjZW50IHllYXJz
LCBhIG51bWJlciBvZiBmaWxlc3lzdGVtcyB0aGF0IGNhbid0IHByZXNlbnQgc3RhYmxlCj4+Pj4g
ZmlsZWhhbmRsZXMgaGF2ZSBncm93biBzdHJ1Y3QgZXhwb3J0X29wZXJhdGlvbnMuIFRoZXkndmUg
bW9zdGx5IGRvbmUKPj4+PiB0aGlzIGZvciBsb2NhbCB1c2UtY2FzZXMgKGVuYWJsaW5nIG9wZW5f
YnlfaGFuZGxlX2F0KCkgYW5kIHRoZSBsaWtlKS4KPj4+PiBVbmZvcnR1bmF0ZWx5LCBoYXZpbmcg
ZXhwb3J0X29wZXJhdGlvbnMgaXMgZ2VuZXJhbGx5IHN1ZmZpY2llbnQgdG8gbWFrZQo+Pj4+IGEg
ZmlsZXN5c3RlbSBiZSBjb25zaWRlcmVkIGV4cG9ydGFibGUgdmlhIG5mc2QsIGJ1dCB0aGF0IHJl
cXVpcmVzIHRoYXQKPj4+PiB0aGUgc2VydmVyIHByZXNlbnQgc3RhYmxlIGZpbGVoYW5kbGVzLgo+
Pj4KPj4+IFdoZXJlIGRvZXMgdGhlIHRlcm0gInN0YWJsZSBmaWxlIGhhbmRsZXMiIGNvbWUgZnJv
bT8gYW5kIHdoYXQgZG9lcyBpdCBtZWFuPwo+Pj4gV2h5IG5vdCAicGVyc2lzdGVudCBoYW5kbGVz
Iiwgd2hpY2ggaXMgZGVzY3JpYmVkIGluIE5GUyBhbmQgU01CIHNwZWNzPwo+Pj4KPj4+IE5vdCB0
byBtZW50aW9uIHRoYXQgRVhQT1JUX09QX1BFUlNJU1RFTlRfSEFORExFUyB3YXMgQWNrZWQKPj4+
IGJ5IGJvdGggQ2hyaXN0b3BoIGFuZCBDaHJpc3RpYW46Cj4+Pgo+Pj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtZnNkZXZlbC8yMDI2MDExNS1ydW5kZ2FuZy1sZWloZ2FiZS0xMjAxOGU5
M2MwMGNAYnJhdW5lci8KPj4+Cj4+PiBBbSBJIG1pc3NpbmcgYW55dGhpbmc/Cj4+Cj4+IFBFUlNJ
U1RFTlQgZ2VuZXJhbGx5IGltcGxpZXMgdGhhdCB0aGUgZmlsZSBoYW5kbGUgaXMgc2F2ZWQgb24K
Pj4gcGVyc2lzdGVudCBzdG9yYWdlLiBUaGlzIGlzIG5vdCB0cnVlIG9mIHRtcGZzLgo+IAo+IFRo
YXQncyBvbmUgd2F5IG9mIGludGVycHJldGluZyAicGVyc2lzdGVudCIuCj4gQW5vdGhlciB3YXkg
aXMgImNvbnRpbnVpbmcgdG8gZXhpc3Qgb3Igb2NjdXIgb3ZlciBhIHByb2xvbmdlZCBwZXJpb2Qu
Igo+IHdoaWNoIHdvcmtzIHdlbGwgZm9yIHRtcGZzIHRoYXQgaXMgbW91bnRlZCBmb3IgYSBsb25n
IHRpbWUuCgpJIHRoaW5rIHdlIGNhbiBiZSBhIGxvdCBtb3JlIHByZWNpc2UgYWJvdXQgdGhlIGd1
YXJhbnRlZTogVGhlIGZpbGUKaGFuZGxlIGRvZXMgbm90IGNoYW5nZSBmb3IgdGhlIGxpZmUgb2Yg
dGhlIGlub2RlIGl0IHJlcHJlc2VudHMuIEl0CmhhcyBub3RoaW5nIHRvIGRvIHdpdGggd2hldGhl
ciB0aGUgZmlsZSBzeXN0ZW0gaXMgbW91bnRlZC4KCgo+IEJ1dCBJIGFtIGNvbmZ1c2VkLCBiZWNh
dXNlIEkgd2VudCBsb29raW5nIGZvciB3aGVyZSBKZWZmIHNhaWQgdGhhdAo+IHlvdSBzdWdnZXN0
ZWQgc3RhYmxlIGZpbGUgaGFuZGxlcyBhbmQgdGhpcyBpcyB3aGF0IEkgZm91bmQgdGhhdCB5b3Ug
d3JvdGU6Cj4gCj4gInRtcGZzIGZpbGVoYW5kbGVzIGFsaWduIHF1aXRlIHdlbGwgd2l0aCB0aGUg
dHJhZGl0aW9uYWwgZGVmaW5pdGlvbgo+ICBvZiBwZXJzaXN0ZW50IGZpbGVoYW5kbGVzLiB0bXBm
cyBmaWxlaGFuZGxlcyBsaXZlIGFzIGxvbmcgYXMgdG1wZnMgZmlsZXMgZG8sCj4gIGFuZCB0aGF0
IGlzIGFsbCB0aGF0IGlzIHJlcXVpcmVkIHRvIGJlIGNvbnNpZGVyZWQgInBlcnNpc3RlbnQiLgoK
SSBjaGFuZ2VkIG15IG1pbmQgYWJvdXQgdGhlIG5hbWUsIGFuZCBJIGxldCBKZWZmIGtub3cgdGhh
dCBwcml2YXRlbHkKd2hlbiBoZSBhc2tlZCBtZSB0byBsb29rIGF0IHRoZXNlIHBhdGNoZXMgdGhp
cyBtb3JuaW5nLgoKCj4+IFRoZSB1c2Ugb2YgInN0YWJsZSIgbWVhbnMgdGhhdCB0aGUgZmlsZSBo
YW5kbGUgaXMgc3RhYmxlIGZvcgo+PiB0aGUgbGlmZSBvZiB0aGUgZmlsZS4gVGhpcyAvaXMvIHRy
dWUgb2YgdG1wZnMuCj4gCj4gSSBjYW4gbGl2ZSB3aXRoIFNUQUJMRV9IQU5ETEVTIEkgZG9uJ3Qg
bWluZCBhcyBtdWNoLAo+IEkgdW5kZXJzdGFuZCB3aGF0IGl0IG1lYW5zLCBidXQgdGhlIGRlZmlu
aXRpb24gYWJvdmUgaXMgaW52ZW50ZWQsCj4gd2hlcmVhcyB0aGUgdGVybSBwZXJzaXN0ZW50IGhh
bmRsZXMgaXMgd2VsbCBrbm93biBhbmQgd2VsbCBkZWZpbmVkLgoKQW5vdGhlciByZWFzb24gbm90
IHRvIGFkb3B0IHRoZSBzYW1lIHRlcm1pbm9sb2d5IGFzIE5GUyBpcyB0aGF0CnNvbWVvbmUgbWln
aHQgY29tZSBhbG9uZyBhbmQgaW1wbGVtZW50IE5GU3Y0J3MgVk9MQVRJTEUgZmlsZQpoYW5kbGVz
IGluIExpbnV4LCBhbmQgdGhlbiBzYXkgIk9LLCAvbm93LyBjYW4gd2UgZXhwb3J0IGNncm91cGZz
PyIKQW5kIHRoZW4gTGludXggd2lsbCBiZSBzdHVjayB3aXRoIG92ZXJsb2FkZWQgdGVybWlub2xv
Z3kgYW5kIHdlJ2xsCnN0aWxsIHdhbnQgdG8gc2F5ICJOTywgTkZTIGRvZXNuJ3Qgc3VwcG9ydCBj
Z3JvdXBmcyIuCgpKdXN0IGEgcmFuZG9tIHRob3VnaHQuCgoKLS0gCkNodWNrIExldmVyCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
