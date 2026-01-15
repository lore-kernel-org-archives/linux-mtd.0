Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1904ED4660B
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 18:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kmd3OfiBMKxo0ow+jQIYSF2OPtuhpN0IlSRGqyW8cJU=; b=cP5Pn0/BfqAS0Gjb+d3SGgAOzX
	tMmWKmmEc5HS+ScdFCzHU3iNYMF9BCeZS5UaYq1ALVnbPdz3Xma/gPkayClolziuc0NkdpiKvKWp0
	4vRsXZwlybCjkKho802dO+C5/SQ5INK4pl2qwi3nHS8nX5SY08kNUaL2nTTYUY7JJ8llsVd8hO4m5
	lpNU29JsE4ys+cL9NH0nV5Z4dGCnSJPjORtzAVTc13Kde8ByMf3neNwA6IB08iKAad9zChu1C6Kbn
	lzfrquW/KxaVCw2WWd+pkqpHF5U3gewKUsp/R3GoxiGC/09c3gxbR+4bavAIjv5UgKI2bKGTc9ZZN
	Yvh1Mjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS92-0000000Cyr4-2p0B;
	Thu, 15 Jan 2026 18:32:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS8z-0000000CyqU-2X6Y
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 18:32:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 454DC4451E;
	Thu, 15 Jan 2026 18:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A66C2BC87;
	Thu, 15 Jan 2026 18:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768501948;
	bh=mu/jwyuzs1woV3EsPbDGdDC5dwANFYIHrH4NaGlTLGQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=JNemC1yyTQKx5E4pIkzvytUyGES2tmVjzNLWcONSrxdEfLh3HlZ+29IPzV++/rV8O
	 /HufzuRETrrLBI4IgK1mEivYdYvao6frYVSEUn2AXXy3guy4u8MrpbYCuAu8C1ruaK
	 BwomDAPfPK9evxM9sjnY973CQhs3rFOvwwrsPWD1GN0t9LaV4/M6zqIS22ZYwvDiXt
	 7eIxB9z5Cz2MzTOm3tABDloqGJc8wnEFa7XSr1cniiaRjwx+2QKA2jRZ2Mj8DV7eWp
	 x1iKOENqOdKyNjx+zUz63w8fofWQL/VEVXD5wSR9ScT7i3QHOaACZWezQRR4LuAx+z
	 TU3CqTeesgqIQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4BF17F40069;
	Thu, 15 Jan 2026 13:32:25 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Thu, 15 Jan 2026 13:32:25 -0500
X-ME-Sender: <xms:uTJpaST2S_BQmvIoVXUTG3Uv00CIkT_f-EbDQ1KH8vIlVQcwDXypQQ>
    <xme:uTJpaSn5OoyclbrYS_ARTUh6TEP2VOjUGj53_LG2lxkjeVICq65KK1J-vKaQ4Q1LV
    V04RbrQdCpqL5Mvp67L_2A99E7e0MjEKZHGQg6du4B2aAO0ZSdxuww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeijeekucetufdoteggodetrf
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
    hhdrtghomhdprhgtphhtthhopegtlhhmsehfsgdrtghomhdprhgtphhtthhopegrmhhirh
    ejfehilhesghhmrghilhdrtghomhdprhgtphhtthhopehiughrhihomhhovhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehkohhnihhshhhirdhrhihushhukhgvsehgmhgrihhlrd
    gtohhm
X-ME-Proxy: <xmx:uTJpaX8XlASeI3-hQVJmMxlK8TxdmBSwTtFsbhSoxL3UV4Wvip7VrA>
    <xmx:uTJpaZqkkN3176e2LvdCG3veTiN-GTqcScuGt9t_e1DrtMHWJT3eyA>
    <xmx:uTJpaet8tZs4QdmQ9KbY-CWNsY3QfKFOvT9QPuO68BSRBM5oq_7Zeg>
    <xmx:uTJpaUR2QUA-L1hS5UnoJ8HhY1Uu2p18HC8n7POL1S450zS9m_Kiew>
    <xmx:uTJpaYWzGNFQ6fy0VRVsd1um1FRTenoVzHGzsRuwWHvuFBVbXXDnMbke>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 155C8780070; Thu, 15 Jan 2026 13:32:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A7-j_yKLHrMN
Date: Thu, 15 Jan 2026 13:31:54 -0500
From: "Chuck Lever" <cel@kernel.org>
To: "Amir Goldstein" <amir73il@gmail.com>, "Jeff Layton" <jlayton@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>,
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
Message-Id: <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
In-Reply-To: <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to nfsd export
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_103229_695988_01041CED 
X-CRM114-Status: GOOD (  10.31  )
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

CgpPbiBUaHUsIEphbiAxNSwgMjAyNiwgYXQgMToxNyBQTSwgQW1pciBHb2xkc3RlaW4gd3JvdGU6
Cj4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OOKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9u
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBJbiByZWNlbnQgeWVhcnMsIGEgbnVtYmVyIG9mIGZp
bGVzeXN0ZW1zIHRoYXQgY2FuJ3QgcHJlc2VudCBzdGFibGUKPj4gZmlsZWhhbmRsZXMgaGF2ZSBn
cm93biBzdHJ1Y3QgZXhwb3J0X29wZXJhdGlvbnMuIFRoZXkndmUgbW9zdGx5IGRvbmUKPj4gdGhp
cyBmb3IgbG9jYWwgdXNlLWNhc2VzIChlbmFibGluZyBvcGVuX2J5X2hhbmRsZV9hdCgpIGFuZCB0
aGUgbGlrZSkuCj4+IFVuZm9ydHVuYXRlbHksIGhhdmluZyBleHBvcnRfb3BlcmF0aW9ucyBpcyBn
ZW5lcmFsbHkgc3VmZmljaWVudCB0byBtYWtlCj4+IGEgZmlsZXN5c3RlbSBiZSBjb25zaWRlcmVk
IGV4cG9ydGFibGUgdmlhIG5mc2QsIGJ1dCB0aGF0IHJlcXVpcmVzIHRoYXQKPj4gdGhlIHNlcnZl
ciBwcmVzZW50IHN0YWJsZSBmaWxlaGFuZGxlcy4KPgo+IFdoZXJlIGRvZXMgdGhlIHRlcm0gInN0
YWJsZSBmaWxlIGhhbmRsZXMiIGNvbWUgZnJvbT8gYW5kIHdoYXQgZG9lcyBpdCBtZWFuPwo+IFdo
eSBub3QgInBlcnNpc3RlbnQgaGFuZGxlcyIsIHdoaWNoIGlzIGRlc2NyaWJlZCBpbiBORlMgYW5k
IFNNQiBzcGVjcz8KPgo+IE5vdCB0byBtZW50aW9uIHRoYXQgRVhQT1JUX09QX1BFUlNJU1RFTlRf
SEFORExFUyB3YXMgQWNrZWQKPiBieSBib3RoIENocmlzdG9waCBhbmQgQ2hyaXN0aWFuOgo+Cj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZnNkZXZlbC8yMDI2MDExNS1ydW5kZ2FuZy1s
ZWloZ2FiZS0xMjAxOGU5M2MwMGNAYnJhdW5lci8KPgo+IEFtIEkgbWlzc2luZyBhbnl0aGluZz8K
ClBFUlNJU1RFTlQgZ2VuZXJhbGx5IGltcGxpZXMgdGhhdCB0aGUgZmlsZSBoYW5kbGUgaXMgc2F2
ZWQgb24KcGVyc2lzdGVudCBzdG9yYWdlLiBUaGlzIGlzIG5vdCB0cnVlIG9mIHRtcGZzLgoKVGhl
IHVzZSBvZiAic3RhYmxlIiBtZWFucyB0aGF0IHRoZSBmaWxlIGhhbmRsZSBpcyBzdGFibGUgZm9y
CnRoZSBsaWZlIG9mIHRoZSBmaWxlLiBUaGlzIC9pcy8gdHJ1ZSBvZiB0bXBmcy4KCi0tIApDaHVj
ayBMZXZlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
