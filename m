Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6A9D4662E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 21:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lwu6PjkPBQ3YHA/T0ShKA4hb+GnSLGFsRAuyiDF+qxs=; b=Imkr9aeHwqXne1BZvpMPcEt8rR
	ik1HxpL0Ishyz3oH8ZJlwynITvrEHjwHPEMq1qXVW65M4D+VgIIpdf9qH2O5SZxew/7feEcOnPSYI
	Rne95v+YXx/OysVii+Xu7r28U+K3GRpTEDAvykLOhKf2Tdrf0YQGXSdGHrvBPh1LsvYVQfXgwkPfo
	kYjky7fxKAdxnYtQ+16gGvB9gYJ+p04gLW8qPkb1sviTMnzM0xAy16HyFXx4zXz84JVLfPJFBakSn
	Av48VYCyM3T7fOpJ8MTY1ynbS56R4o0vRhjh1/0FupT1cRI2fWRkzhYQDFKdFZMxrpzTlCtJAnWRd
	g0Bml3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgV2a-0000000DE4k-3yPu;
	Thu, 15 Jan 2026 21:38:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgV2X-0000000DE4E-1wTt
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 21:38:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7705144490;
	Thu, 15 Jan 2026 21:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10309C4AF0B;
	Thu, 15 Jan 2026 21:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768513080;
	bh=0fqCmxD4yKmMSe6/QFTJtZ3ssoTn2Cuf5H+QMDU346c=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=cNYvRCtAFr3nio6ZJmSXonm+4Nbnqg0ooZICNUqxoP7XTHZvA1sq5emt+58bZli1v
	 oJkAFDqsC8s9exFsPnwjrufRoIKYcNVLkronVW7KfwhObFyoMdVkQc5HZF/9RGxbhF
	 F8t+tIqxHXmQeBkIAg74UokUULOqKsZjdX1zKlQqnLNffUaBGWeNAgAEVlrJmM1boN
	 LUW1r4fLYT+64uz3Pbcw+N6aibwePtoH6t9exvd7VQjlJQQfeBnIAca7oYTbPKx1xL
	 5lZKkhqKesuIWnoeYbXAqAZWFIhec2xBYGvSLr8p1N4f33jTCoUrpWPHuga5OksBPp
	 OM0ntrYikD9aw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id F1990F4006D;
	Thu, 15 Jan 2026 16:37:57 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Thu, 15 Jan 2026 16:37:58 -0500
X-ME-Sender: <xms:NV5pafcNmSFQIrTUccBn8Az-kRf21swc3EUsgXiRuArMqrmkgSAOag>
    <xme:NV5paQCw-b3hO3NIG8gXajpY4N_T9w2owcI72ATnDXD-wEPGkb_1VwQQ44qF5W9Sb
    ycL-FXfJ-_J1d0wNMhW4e2tIJ1IW7TLmfEPTlqwXsxG-MEXb98h5wU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdejudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfvehhuhgt
    khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpeegheduieeiveevheelheelueeghffhtddtheelhfdutddtheeileetkeelvedtjeen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheptghhuhgtkhhlvghvvghrodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdduieefgeelleelheelqdefvdelkeeggedvfedqtggvlh
    eppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthho
    peehtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgvihhlsegsrhhofihnrd
    hnrghmvgdprhgtphhtthhopegrughilhhgvghrrdhkvghrnhgvlhesughilhhgvghrrdgt
    rgdprhgtphhtthhopehslhgrvhgrseguuhgsvgihkhhordgtohhmpdhrtghpthhtohepjh
    hlsggvtgesvghvihhlphhlrghnrdhorhhgpdhrtghpthhtohepmhgrrhhksehfrghshhgv
    hhdrtghomhdprhgtphhtthhopegtlhhmsehfsgdrtghomhdprhgtphhtthhopegurghvih
    gusehfrhhomhhorhgsihhtrdgtohhmpdhrtghpthhtoheprghmihhrjeefihhlsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepihgurhihohhmohhvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:NV5paY71nyiHdxo8pzq2FPJ9wXP4gwvmybtteXjfGQDHBXmjGzMpkg>
    <xmx:NV5paf2q85cEvYskTRa6REbYfWFmhv1wT9xJbgW0M4zwirU4htMbuQ>
    <xmx:NV5paRIn4Ky98h162YQ0v5KUSHllZyM6UcKPFtRPRap3WHWdtGOYVw>
    <xmx:NV5pad_yPpJ8jq6536MO88REqfP8PL0dMv2ASaMKib8OBSJTuLx8og>
    <xmx:NV5paYQD3sBPEihbrDG1vMHuPz-F3Rw0TEVa9JsrMb-OENl5ypTH7YFK>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B4F44780070; Thu, 15 Jan 2026 16:37:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A7-j_yKLHrMN
Date: Thu, 15 Jan 2026 16:37:27 -0500
From: "Chuck Lever" <cel@kernel.org>
To: "Dave Chinner" <david@fromorbit.com>
Cc: "Amir Goldstein" <amir73il@gmail.com>,
 "Jeff Layton" <jlayton@kernel.org>,
 "Christian Brauner" <brauner@kernel.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Chuck Lever" <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>,
 "Olga Kornievskaia" <okorniev@redhat.com>,
 "Dai Ngo" <Dai.Ngo@oracle.com>, "Tom Talpey" <tom@talpey.com>,
 "Hugh Dickins" <hughd@google.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Theodore Tso" <tytso@mit.edu>,
 "Andreas Dilger" <adilger.kernel@dilger.ca>, "Jan Kara" <jack@suse.com>,
 "Gao Xiang" <xiang@kernel.org>, "Chao Yu" <chao@kernel.org>,
 "Yue Hu" <zbestahu@gmail.com>, "Jeffle Xu" <jefflexu@linux.alibaba.com>,
 "Sandeep Dhavale" <dhavale@google.com>,
 "Hongbo Li" <lihongbo22@huawei.com>, "Chunhai Guo" <guochunhai@vivo.com>,
 "Carlos Maiolino" <cem@kernel.org>, "Ilya Dryomov" <idryomov@gmail.com>,
 "Alex Markuze" <amarkuze@redhat.com>,
 "Viacheslav Dubeyko" <slava@dubeyko.com>, "Chris Mason" <clm@fb.com>,
 "David Sterba" <dsterba@suse.com>,
 "Luis de Bethencourt" <luisbg@kernel.org>,
 "Salah Triki" <salah.triki@gmail.com>,
 "Phillip Lougher" <phillip@squashfs.org.uk>,
 "Steve French" <sfrench@samba.org>, "Paulo Alcantara" <pc@manguebit.org>,
 "Ronnie Sahlberg" <ronniesahlberg@gmail.com>,
 "Shyam Prasad N" <sprasad@microsoft.com>,
 "Bharath SM" <bharathsm@microsoft.com>,
 "Miklos Szeredi" <miklos@szeredi.hu>,
 "Mike Marshall" <hubcap@omnibond.com>,
 "Martin Brandenburg" <martin@omnibond.com>,
 "Mark Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>,
 "Joseph Qi" <joseph.qi@linux.alibaba.com>,
 "Konstantin Komarov" <almaz.alexandrovich@paragon-software.com>,
 "Ryusuke Konishi" <konishi.ryusuke@gmail.com>,
 "Trond Myklebust" <trondmy@kernel.org>,
 "Anna Schumaker" <anna@kernel.org>, "Dave Kleikamp" <shaggy@kernel.org>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Richard Weinberger" <richard@nod.at>, "Jan Kara" <jack@suse.cz>,
 "Andreas Gruenbacher" <agruenba@redhat.com>,
 "OGAWA Hirofumi" <hirofumi@mail.parknet.co.jp>,
 "Jaegeuk Kim" <jaegeuk@kernel.org>,
 "Christoph Hellwig" <hch@infradead.org>, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, devel@lists.orangefs.org,
 ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev,
 linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, gfs2@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net
Message-Id: <06dcc4b6-7457-4094-a1c6-586ce518020f@app.fastmail.com>
In-Reply-To: <aWlXfBImnC_jhTw4@dread.disaster.area>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
 <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
 <aWlXfBImnC_jhTw4@dread.disaster.area>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to nfsd export
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_133801_548146_022F3660 
X-CRM114-Status: GOOD (  24.32  )
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

CgpPbiBUaHUsIEphbiAxNSwgMjAyNiwgYXQgNDowOSBQTSwgRGF2ZSBDaGlubmVyIHdyb3RlOgo+
IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDAyOjM3OjA5UE0gLTA1MDAsIENodWNrIExldmVyIHdy
b3RlOgo+PiBPbiAxLzE1LzI2IDI6MTQgUE0sIEFtaXIgR29sZHN0ZWluIHdyb3RlOgo+PiA+IE9u
IFRodSwgSmFuIDE1LCAyMDI2IGF0IDc6MzLigK9QTSBDaHVjayBMZXZlciA8Y2VsQGtlcm5lbC5v
cmc+IHdyb3RlOgo+PiA+Pgo+PiA+Pgo+PiA+Pgo+PiA+PiBPbiBUaHUsIEphbiAxNSwgMjAyNiwg
YXQgMToxNyBQTSwgQW1pciBHb2xkc3RlaW4gd3JvdGU6Cj4+ID4+PiBPbiBUaHUsIEphbiAxNSwg
MjAyNiBhdCA2OjQ44oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4gd3JvdGU6
Cj4+ID4+Pj4KPj4gPj4+PiBJbiByZWNlbnQgeWVhcnMsIGEgbnVtYmVyIG9mIGZpbGVzeXN0ZW1z
IHRoYXQgY2FuJ3QgcHJlc2VudCBzdGFibGUKPj4gPj4+PiBmaWxlaGFuZGxlcyBoYXZlIGdyb3du
IHN0cnVjdCBleHBvcnRfb3BlcmF0aW9ucy4gVGhleSd2ZSBtb3N0bHkgZG9uZQo+PiA+Pj4+IHRo
aXMgZm9yIGxvY2FsIHVzZS1jYXNlcyAoZW5hYmxpbmcgb3Blbl9ieV9oYW5kbGVfYXQoKSBhbmQg
dGhlIGxpa2UpLgo+PiA+Pj4+IFVuZm9ydHVuYXRlbHksIGhhdmluZyBleHBvcnRfb3BlcmF0aW9u
cyBpcyBnZW5lcmFsbHkgc3VmZmljaWVudCB0byBtYWtlCj4+ID4+Pj4gYSBmaWxlc3lzdGVtIGJl
IGNvbnNpZGVyZWQgZXhwb3J0YWJsZSB2aWEgbmZzZCwgYnV0IHRoYXQgcmVxdWlyZXMgdGhhdAo+
PiA+Pj4+IHRoZSBzZXJ2ZXIgcHJlc2VudCBzdGFibGUgZmlsZWhhbmRsZXMuCj4+ID4+Pgo+PiA+
Pj4gV2hlcmUgZG9lcyB0aGUgdGVybSAic3RhYmxlIGZpbGUgaGFuZGxlcyIgY29tZSBmcm9tPyBh
bmQgd2hhdCBkb2VzIGl0IG1lYW4/Cj4+ID4+PiBXaHkgbm90ICJwZXJzaXN0ZW50IGhhbmRsZXMi
LCB3aGljaCBpcyBkZXNjcmliZWQgaW4gTkZTIGFuZCBTTUIgc3BlY3M/Cj4+ID4+Pgo+PiA+Pj4g
Tm90IHRvIG1lbnRpb24gdGhhdCBFWFBPUlRfT1BfUEVSU0lTVEVOVF9IQU5ETEVTIHdhcyBBY2tl
ZAo+PiA+Pj4gYnkgYm90aCBDaHJpc3RvcGggYW5kIENocmlzdGlhbjoKPj4gPj4+Cj4+ID4+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIwMjYwMTE1LXJ1bmRnYW5nLWxl
aWhnYWJlLTEyMDE4ZTkzYzAwY0BicmF1bmVyLwo+PiA+Pj4KPj4gPj4+IEFtIEkgbWlzc2luZyBh
bnl0aGluZz8KPj4gPj4KPj4gPj4gUEVSU0lTVEVOVCBnZW5lcmFsbHkgaW1wbGllcyB0aGF0IHRo
ZSBmaWxlIGhhbmRsZSBpcyBzYXZlZCBvbgo+PiA+PiBwZXJzaXN0ZW50IHN0b3JhZ2UuIFRoaXMg
aXMgbm90IHRydWUgb2YgdG1wZnMuCj4+ID4gCj4+ID4gVGhhdCdzIG9uZSB3YXkgb2YgaW50ZXJw
cmV0aW5nICJwZXJzaXN0ZW50Ii4KPj4gPiBBbm90aGVyIHdheSBpcyAiY29udGludWluZyB0byBl
eGlzdCBvciBvY2N1ciBvdmVyIGEgcHJvbG9uZ2VkIHBlcmlvZC4iCj4+ID4gd2hpY2ggd29ya3Mg
d2VsbCBmb3IgdG1wZnMgdGhhdCBpcyBtb3VudGVkIGZvciBhIGxvbmcgdGltZS4KPj4gCj4+IEkg
dGhpbmsgd2UgY2FuIGJlIGEgbG90IG1vcmUgcHJlY2lzZSBhYm91dCB0aGUgZ3VhcmFudGVlOiBU
aGUgZmlsZQo+PiBoYW5kbGUgZG9lcyBub3QgY2hhbmdlIGZvciB0aGUgbGlmZSBvZiB0aGUgaW5v
ZGUgaXQgcmVwcmVzZW50cy4gSXQKPgo+IDxwZWRhbnRpYyBtb2RlIGVuZ2FnZWQ+Cj4KPiBGaWxl
IGhhbmRsZXMgbW9zdCBkZWZpbml0ZWx5IGNoYW5nZSBvdmVyIHRoZSBsaWZlIG9mIGEgL3BoeXNp
Y2FsLwo+IGlub2RlLiBVbmxpbmtpbmcgYSBmaWxlIGRvZXMgbm90IHJlcXVpcmUgZW5kaW5nIHRo
ZSBsaWZlIG9mIHRoZQo+IHBoeXNpY2FsIG9iamVjdCB0aGF0IHByb3ZpZGVzIHRoZSBwZXJzaXN0
ZW50IGRhdGEgc3RvcmUgZm9yIHRoZQo+IGZpbGUuCj4KPiBlLmcuIFhGUyBkeW5hbWljYWxseSBh
bGxvY2F0ZXMgcGh5c2ljYWwgaW5vZGVzIG1pZ2h0IGluIGEgbGlmZSBjeWNsZQo+IHRoYXQgbG9v
a3Mgc29tZXdoYXQgbGlmZSB0aGlzOgo+Cj4gCWFsbG9jYXRlIHBoeXNpY2FsIGlub2RlCj4gCWlu
c2VydCByZWNvcmQgaW50byBhbGxvY2F0ZWQgaW5vZGUgaW5kZXgKPiAJbWFyayBpbm9kZSBhcyBm
cmVlCj4KPiAJd2hpbGUgKGRvbid0IG5lZWQgdG8gZnJlZSBwaHlzaWNhbCBpbm9kZSkgewo+IAkJ
Li4uCj4gCQlhbGxvY2F0ZSBpbm9kZSBmb3IgYSBuZXcgZmlsZQo+IAkJdXBkYXRlIHBlcnNpc3Rl
bnQgaW5vZGUgbWV0YWRhdGEgdG8gZ2VuZXJhdGUgbmV3IGZpbGVoYW5kbGUKPiAJCW1hcmsgaW5v
ZGUgaW4gdXNlCj4gCQkuLi4KPiAJCXVubGluayBmaWxlCj4gCQltYXJrIGlub2RlIGZyZWUKPiAJ
fQo+Cj4gCXJlbW92ZSBpbm9kZSBmcm9tIGFsbG9jYXRlZCBpbm9kZSBpbmRleAo+IAlmcmVlIHBo
eXNpY2FsIGlub2RlCj4KPiBpLmUuIGEgZnJlZSBpbm9kZSBpcyBzdGlsbCBhbiAtYWxsb2NhdGVk
LCBpbmRleGVkIGlub2RlLSBpbiB0aGUKPiBmaWxlc3lzdGVtLCBhbmQgdW50aWwgd2UgcGh5c2lj
YWxseSByZW1vdmUgaXQgZnJvbSB0aGUgZmlsZXN5c3RlbQo+IHRoZSBpbm9kZSBsaWZlIGN5Y2xl
IGhhcyBub3QgZW5kZWQuCj4KPiBJT1dzLCB0aGUgcGh5c2ljYWwgKHBlcnNpc3RlbnQpIGlub2Rl
IGxpZmV0aW1lIGNhbiBzcGFuIHRoZSBsaWZldGltZQo+IG9mIC1tYW55LSBmaWxlcy4gSG93ZXZl
ciwgdGhlIGZpbGVzeXN0ZW0gZ3VhcmFudGVlcyB0aGF0IHRoZSBoYW5kbGUKPiBnZW5lcmF0ZWQg
Zm9yIHRoYXQgaW5vZGUgaXMgZGlmZmVyZW50IGZvciBlYWNoIGZpbGUgaXQgcmVwcmVzZW50cwo+
IG92ZXIgdGhlIHdob2xlIGlub2RlIGxpZmUgdGltZS4KPgo+IEhlbmNlIEkgdGhpbmsgdGhhdCBm
aWxlIGhhbmRsZSBzdGFiaWxpdHkvcGVyc2lzdGVuY2UgbmVlZHMgdG8gYmUKPiBkZWZpbmVkIGlu
IHRlcm1zIG9mIC1maWxlIGxpZmV0aW1lcy0sIG5vdCB0aGUgbGlmZXRpbWVzIG9mIHRoZQo+IGZp
bGVzeXN0ZW0gb2JqZWN0cyBpbXBsZW1lbnQgdGhlIGZpbGUncyBwZXJzaXN0ZW50IGRhdGEgc3Rv
cmUuCgpGYWlyIGVub3VnaCwgImlub2RlIiBpcyB0aGUgd3JvbmcgdGVybSB0byB1c2UgaGVyZS4K
CgotLSAKQ2h1Y2sgTGV2ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
