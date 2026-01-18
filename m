Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C73C9830C
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Jan 2026 23:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-id:Date:References:
	In-reply-to:Subject:Cc:To:From:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DrcSRY539uubZLsKxbVVGWBGDJvuasmEIvJPDbMbV0=; b=iE8b7W+wfAj3BT
	QU0wyrPHenJ9BnPYoLzOUQZU+3xW1i4JhSLc5QUksNZFEJXVj8z2kSfw31lGO3334HtV810Rs1WLR
	sMtOHE+zmrtaGDMlnF3B6Dd0ZQZsi89WUc6+bbLGqvqn3thsN1noWLwpjFOUa6Pj8wgl5YbjbpzVO
	ctDs4j3G8Vxq2p705MGKE2Eg4OvQ+S4I02HQjHKVv6kokQBqs6yuwdH7o9j/yovNp7tubnYbPTejS
	adxCh3840rQb0Fi5d6x1lcHVhs93nj72Qt/ZQlLLXNVlC6g0GHpmaAoFl4T209vwzKnEq4wTxrgfc
	LIwX8TVBlgt+DPJk+O3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhc7T-000000019EW-3PDc;
	Sun, 18 Jan 2026 23:23:43 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhc7Q-000000019Db-3Pai
	for linux-mtd@lists.infradead.org;
	Sun, 18 Jan 2026 23:23:42 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 044C21380091;
	Sun, 18 Jan 2026 18:23:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 18 Jan 2026 18:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1768778616; x=1768785816; bh=cLWfoPH86LevLJ5dEarcfR/PsriG4IfSU/3
	wyLJz+qM=; b=Dmw+pxT+mC6s44HDc9ViDXhGQeEmMpmNYRhtbA86QNG09PG/Ljt
	hV85ad3/pbmWWoao3arxAaxDpjTC5inzso+nDbFp9L/ocC8FvAlBD0K6BSqaNtKf
	C3km6dpzlK9Qvfbi4RlAOZVQRcgXUx6BbC4NNZXExiSaEBKuKkrscbvke30TKEj0
	X3c26YUO2IvjIKJetsMrJSw+w98guonRsqk3c5wy7tRYCBiBKWCThYgKRu77I56g
	W/jQbAZlq9qtSmpdQFd+C0/rLGEaY2+/6NIHoLbGsxK4GkDCFlahWHWTEoSSJrS/
	k5ZW9JDwUgtzyYMplQwMaStWlBzRHOxECQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768778616; x=
	1768785816; bh=cLWfoPH86LevLJ5dEarcfR/PsriG4IfSU/3wyLJz+qM=; b=I
	GTmerXNj37QbHVnwq2oYiiWRj3dNMRiwAfGv/vxfYmuPEFFfJjUyW8ruiPn+ZUTw
	y96Ysjc5jkE+PfgCaUfHrNzF77vJ+CHZGj8ZZyFQniCqqNBHAWqccBt7S/bU1BV3
	Xnstc4VvhfH6RZxhRpoHiUxWSmJT21A47932/vgOnE5bxUOTfBJmpqxFnE86OITm
	uIg7MLSy3DGOcBFTzEd5fbzcCQYBFRkQDDO9qGFEXh5IfaJ//ctGtwtYx+/A3prw
	KJ8U8PGheh+G3smkjCFKvnDL2ddcVu2iicAyBab5Q6myVEkn0CxZuzyjCejBBwJF
	S/bm6s4tkRpP23BkNvcHg==
X-ME-Sender: <xms:dGttaT6YTMF6Fa6OlzcaAnM6fKqB4-4u0PRgZNSqPeyFmRns3uNnWw>
    <xme:dGttaZPm2B1Iaa5cFSjo7JQ9nDmVsbYtDSTRFdNHBicQ-lkECLbL66rkbZK2MZehf
    _rCs8HRq47ygqgxsOGTs2CMA0vWt7_AzG555MqfdnDHw6XZXQ>
X-ME-Received: <xmr:dGttaV5f0odFoTqo9Cm-3bXwUWdDQe8OS_nESoDmZC33EUUTmsf8jTlPE6SJiNhWOG4bTHrmA205RC8BAhr3cbUxrYEQhQL_108cgTPUPoLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeeitddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
    rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
    epvdeuteelkeejkeevteetvedtkeegleduieeftdeftefgtddtleejgfelgfevffeinecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnvghilhgssehofihnmhgrihhlrdhnvghtpdhnsggp
    rhgtphhtthhopeejfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhirhhose
    iivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehguhhotghhuhhnhhgr
    ihesvhhivhhordgtohhmpdhrtghpthhtoheplhhinhhugidqgihfshesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhunhhiohhnfhhssehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhhilhhfshesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnfhhssehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgvgihtgeesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dGttaek4FCMZRAxWF6ejfvNQASS42yuMJmNL6Qr_VSzT2alP2kiMEQ>
    <xmx:dGttacMnrF3MIVkqtagaBM_OFbr4viUT9Quj4YPA_rDrR6FZMQe15g>
    <xmx:dGttaRUgcJhZGcX_B2l09umj3yAF-qAbVHXccqpyubd6rn2m6D7nYA>
    <xmx:dGttaVutjkDk_cSqIw9p5HdrWWt8-J_WTU_-yJ8LgZsJLx3q9gD8ew>
    <xmx:eGttab3JlD-dDEAYvGFUDpoqKXPgn7EN1IPurNldS43-2K0UKJSizYjm>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Jan 2026 18:23:15 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
Cc: "Amir Goldstein" <amir73il@gmail.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Chuck Lever" <chuck.lever@oracle.com>,
 "Olga Kornievskaia" <okorniev@redhat.com>,
 "Dai Ngo" <Dai.Ngo@oracle.com>, "Tom Talpey" <tom@talpey.com>,
 "Hugh Dickins" <hughd@google.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Theodore Ts'o" <tytso@mit.edu>,
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
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
In-reply-to: <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>,
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>,
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
Date: Mon, 19 Jan 2026 10:23:13 +1100
Message-id: <176877859306.16766.15009835437490907207@noble.neil.brown.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_152340_920143_90EEB11C 
X-CRM114-Status: GOOD (  15.83  )
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
Reply-To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNiBKYW4gMjAyNiwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gT24gVGh1LCAyMDI2LTAx
LTE1IGF0IDE5OjE3ICswMTAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+IE9uIFRodSwgSmFu
IDE1LCAyMDI2IGF0IDY6NDjigK9QTSBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4gCj4gPiA+IEluIHJlY2VudCB5ZWFycywgYSBudW1iZXIgb2YgZmlsZXN5c3Rl
bXMgdGhhdCBjYW4ndCBwcmVzZW50IHN0YWJsZQo+ID4gPiBmaWxlaGFuZGxlcyBoYXZlIGdyb3du
IHN0cnVjdCBleHBvcnRfb3BlcmF0aW9ucy4gVGhleSd2ZSBtb3N0bHkgZG9uZQo+ID4gPiB0aGlz
IGZvciBsb2NhbCB1c2UtY2FzZXMgKGVuYWJsaW5nIG9wZW5fYnlfaGFuZGxlX2F0KCkgYW5kIHRo
ZSBsaWtlKS4KPiA+ID4gVW5mb3J0dW5hdGVseSwgaGF2aW5nIGV4cG9ydF9vcGVyYXRpb25zIGlz
IGdlbmVyYWxseSBzdWZmaWNpZW50IHRvIG1ha2UKPiA+ID4gYSBmaWxlc3lzdGVtIGJlIGNvbnNp
ZGVyZWQgZXhwb3J0YWJsZSB2aWEgbmZzZCwgYnV0IHRoYXQgcmVxdWlyZXMgdGhhdAo+ID4gPiB0
aGUgc2VydmVyIHByZXNlbnQgc3RhYmxlIGZpbGVoYW5kbGVzLgo+ID4gCj4gPiBXaGVyZSBkb2Vz
IHRoZSB0ZXJtICJzdGFibGUgZmlsZSBoYW5kbGVzIiBjb21lIGZyb20/IGFuZCB3aGF0IGRvZXMg
aXQgbWVhbj8KPiA+IFdoeSBub3QgInBlcnNpc3RlbnQgaGFuZGxlcyIsIHdoaWNoIGlzIGRlc2Ny
aWJlZCBpbiBORlMgYW5kIFNNQiBzcGVjcz8KPiA+IAo+ID4gTm90IHRvIG1lbnRpb24gdGhhdCBF
WFBPUlRfT1BfUEVSU0lTVEVOVF9IQU5ETEVTIHdhcyBBY2tlZAo+ID4gYnkgYm90aCBDaHJpc3Rv
cGggYW5kIENocmlzdGlhbjoKPiA+IAo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
ZnNkZXZlbC8yMDI2MDExNS1ydW5kZ2FuZy1sZWloZ2FiZS0xMjAxOGU5M2MwMGNAYnJhdW5lci8K
PiA+IAo+ID4gQW0gSSBtaXNzaW5nIGFueXRoaW5nPwo+ID4gCj4gCj4gVGhpcyB3YXMgQ2h1Y2sn
cyBzdWdnZXN0ZWQgbmFtZS4gSGlzIHBvaW50IHdhcyB0aGF0IFNUQUJMRSBtZWFucyB0aGF0Cj4g
dGhlIEZIJ3MgZG9uJ3QgY2hhbmdlIGR1cmluZyB0aGUgbGlmZXRpbWUgb2YgdGhlIGZpbGUuCj4g
Cj4gSSBkb24ndCBtdWNoIGNhcmUgYWJvdXQgdGhlIGZsYWcgbmFtZSwgc28gaWYgZXZlcnlvbmUg
bGlrZXMgUEVSU0lTVEVOVAo+IGJldHRlciBJJ2xsIHJvbGwgd2l0aCB0aGF0LgoKSSBkb24ndCBs
aWtlIFBFUlNJU1RFTlQuCkknZCByYXRoZXIgY2FsbCBhIHNwYWRlIGEgc3BhZGUuCgogIEVYUE9S
VF9PUF9TVVBQT1JUU19ORlNfRVhQT1JUCm9yCiAgRVhQT1JUX09QX05PVF9ORlNfQ09NUEFUSUJM
RQoKVGhlIGlzc3VlIGhlcmUgaXMgTkZTIGV4cG9ydCBhbmQgaW5kaXJlY3Rpb24gZG9lc24ndCBi
cmluZyBhbnkgYmVuZWZpdHMuCgpOZWlsQnJvd24KCgo+IAo+IEFsc28sIG9uIHRoZSBvdmwgcGF0
Y2g6IHdpbGwgZml4Li4uCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3IQo+IC0tIAo+IEplZmYg
TGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
