Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8024BD37E39
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uGGTBsi8D2V4WU5GxYOhwmzuVGe7sdONgNV3qjDebL8=; b=iGsQvTOoKnw957n/XpmI6TUEf+
	96tzCrtJmZcUIFGr5Yqf/bwQZqW7Pn0MGZJMrLtnZtSOJnVAH1Ul2TghlIVn2dfzxH/WTkDTsPtzc
	KkWLUvjFkby7u6r9N+ETMPE9fUVkUsj43FUZ63FchNKgmiPBfrkEwiu63kFJURKtFmMBVurBflnK+
	5oszupa8ekXrm4BrDaaUsddEIOlnZ1EJGQWjxTD+JgU4tfftBpF9BzfG+xDhEtlVcyDz37jWpqTGf
	O1ZLVdOuGjbVjCQyforlrieUEOCNqzi3GtWhrJ9g901VFMejs/QOAZMb1KnkWZeL2clYEa7rKEcVl
	7abuvaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2FA-00000009aNu-3V11;
	Wed, 14 Jan 2026 14:53:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2F8-00000009aMJ-1qiR
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 14:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2BBC443F1;
	Wed, 14 Jan 2026 14:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57505C4AF0B;
	Wed, 14 Jan 2026 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768402384;
	bh=xKp2mRX639Xrl1hAH25cMUgzI8E+8kaOkrWTmDZ9gJI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=DZ4y7792kI2/4eE5VVTlEy1lwDXzIzeNr2iEGyaqqLMYTsvcSbwt8Bo54fNz4FJrn
	 0CjwDI0jj4BZuie48fZ7X8+pogo2m9xuuz5ZkTKqUIWIWMb2aIahe3YDQ1OihTAsyY
	 /kSWP/W66gnEfc8gA/3bKKHjBBbzoJWIQmXxEVECLl86oIEVeZwN3rPLewdZXpBLNQ
	 4fSATB6J5Q9DEK8WPOow5IHJKdW2q5kckZv1zfwvc/Rackn2AgyYEGYSEHyTHq4m0k
	 xzDo6EcWHnQhpPR7xCjV8fvC1tdohxaCsjAOcYPGoYZ1/+HzD4MzDToJBxFdCh/tru
	 OSjQsEWq0CzTg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 336F2F4006C;
	Wed, 14 Jan 2026 09:53:02 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 14 Jan 2026 09:53:02 -0500
X-ME-Sender: <xms:zq1naTL1verRbjv_OWxa5Qc-mm-FLSmJA57qMcDcmimTH1ZvOzAH8Q>
    <xme:zq1naR8m09634GxEfslbvAHAt_pWKVnj5KMHoclqQy7tbEop4pkDoeOLzOlsxhgNB
    mfBJSAWYD5Pvqo039VVHWSbWWy3lMiNKfBSo92wfzMrsG2olMOvAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdefgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfvehhuhgt
    khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpefghfeguedtieeiveeugfevtdejfedukeevgfeggfeugfetgfeltdetueelleelteen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhutg
    hklhgvvhgvrhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeifeegleel
    leehledqfedvleekgeegvdefqdgtvghlpeepkhgvrhhnvghlrdhorhhgsehfrghsthhmrg
    hilhdrtghomhdpnhgspghrtghpthhtohephedtpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrlhesrghlrghrshgvnhdrnhgvthdprhgtphhtthhopegrshhmrgguvghush
    estghouggvfihrvggtkhdrohhrghdprhgtphhtthhopehlihhnuhigpghoshhssegtrhhu
    uggvsgihthgvrdgtohhmpdhrtghpthhtoheprgguihhlghgvrhdrkhgvrhhnvghlseguih
    hlghgvrhdrtggrpdhrtghpthhtohepshhlrghvrgesughusggvhihkohdrtghomhdprhgt
    phhtthhopehjlhgsvggtsegvvhhilhhplhgrnhdrohhrghdprhgtphhtthhopehmrghrkh
    esfhgrshhhvghhrdgtohhmpdhrtghpthhtoheptghlmhesfhgsrdgtohhmpdhrtghpthht
    ohepnhhitghosehflhhugihnihgtrdhnvght
X-ME-Proxy: <xmx:zq1naR4y4iRWBYp2xNnePgUOv-GP1DKdFBDtDf2IC92YRobPvv4XvQ>
    <xmx:zq1nabUvbFcuW5qmkDCHdiOne_rDLza_EAZnBtIjXTs4zRVj0oLKWg>
    <xmx:zq1naXWzKUDfqjQXjvlbqUXobr95Hj_DLjvdFTe0pPxUPWiy4igVFQ>
    <xmx:zq1naQSTIJTSkNqnVd_7fRCRq8sinXvVVU9WAT0_5jXT_tt716hBhQ>
    <xmx:zq1naeeXm4Q-EAh1xMCT3MnzrdKd7lPZzpjsKoHgYV0ycvEqIoQrdgKM>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F2C75780070; Wed, 14 Jan 2026 09:53:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ArEQL-Tet5yZ
Date: Wed, 14 Jan 2026 09:52:34 -0500
From: "Chuck Lever" <cel@kernel.org>
To: "Amir Goldstein" <amir73il@gmail.com>, "Jeff Layton" <jlayton@kernel.org>
Cc: "Christoph Hellwig" <hch@infradead.org>,
 "Christian Brauner" <brauner@kernel.org>,
 "Chuck Lever" <chuck.lever@oracle.com>, "Jan Kara" <jack@suse.cz>,
 "Luis de Bethencourt" <luisbg@kernel.org>,
 "Salah Triki" <salah.triki@gmail.com>,
 "Nicolas Pitre" <nico@fluxnic.net>, "Anders Larsen" <al@alarsen.net>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "David Sterba" <dsterba@suse.com>, "Chris Mason" <clm@fb.com>,
 "Gao Xiang" <xiang@kernel.org>, "Chao Yu" <chao@kernel.org>,
 "Yue Hu" <zbestahu@gmail.com>, "Jeffle Xu" <jefflexu@linux.alibaba.com>,
 "Sandeep Dhavale" <dhavale@google.com>,
 "Hongbo Li" <lihongbo22@huawei.com>, "Chunhai Guo" <guochunhai@vivo.com>,
 "Jan Kara" <jack@suse.com>, "Theodore Tso" <tytso@mit.edu>,
 "Andreas Dilger" <adilger.kernel@dilger.ca>,
 "Jaegeuk Kim" <jaegeuk@kernel.org>,
 "OGAWA Hirofumi" <hirofumi@mail.parknet.co.jp>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Dave Kleikamp" <shaggy@kernel.org>,
 "Ryusuke Konishi" <konishi.ryusuke@gmail.com>,
 "Viacheslav Dubeyko" <slava@dubeyko.com>,
 "Konstantin Komarov" <almaz.alexandrovich@paragon-software.com>,
 "Mark Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>,
 "Joseph Qi" <joseph.qi@linux.alibaba.com>,
 "Mike Marshall" <hubcap@omnibond.com>,
 "Martin Brandenburg" <martin@omnibond.com>,
 "Miklos Szeredi" <miklos@szeredi.hu>,
 "Phillip Lougher" <phillip@squashfs.org.uk>,
 "Carlos Maiolino" <cem@kernel.org>, "Hugh Dickins" <hughd@google.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Namjae Jeon" <linkinjeon@kernel.org>,
 "Sungjong Seo" <sj1557.seo@samsung.com>,
 "Yuezhang Mo" <yuezhang.mo@sony.com>,
 "Alexander Aring" <alex.aring@gmail.com>,
 "Andreas Gruenbacher" <agruenba@redhat.com>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 "Eric Van Hensbergen" <ericvh@kernel.org>,
 "Latchesar Ionkov" <lucho@ionkov.net>,
 "Dominique Martinet" <asmadeus@codewreck.org>,
 "Christian Schoenebeck" <linux_oss@crudebyte.com>,
 "Xiubo Li" <xiubli@redhat.com>, "Ilya Dryomov" <idryomov@gmail.com>,
 "Trond Myklebust" <trondmy@kernel.org>,
 "Anna Schumaker" <anna@kernel.org>, "Steve French" <sfrench@samba.org>,
 "Paulo Alcantara" <pc@manguebit.org>,
 "Ronnie Sahlberg" <ronniesahlberg@gmail.com>,
 "Shyam Prasad N" <sprasad@microsoft.com>, "Tom Talpey" <tom@talpey.com>,
 "Bharath SM" <bharathsm@microsoft.com>,
 "Hans de Goede" <hansg@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, gfs2@lists.linux.dev,
 linux-doc@vger.kernel.org, v9fs@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Message-Id: <5a1730f3-30ff-403c-a460-09a81f9616c5@app.fastmail.com>
In-Reply-To: <CAOQ4uxhDwR7dteLaqURX+9CooGM1hA7PL6KnVmSwX11ZdKxZTA@mail.gmail.com>
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
 <aWeUv2UUJ_NdgozS@infradead.org>
 <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
 <CAOQ4uxhDwR7dteLaqURX+9CooGM1hA7PL6KnVmSwX11ZdKxZTA@mail.gmail.com>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to lease
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_065306_521417_A132BC0E 
X-CRM114-Status: GOOD (  14.05  )
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

CgpPbiBXZWQsIEphbiAxNCwgMjAyNiwgYXQgOToxNCBBTSwgQW1pciBHb2xkc3RlaW4gd3JvdGU6
Cj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMjo0MeKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9u
QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBWZXJ5IHdlbGwgdGhlbi4KPiBIb3cgYWJvdXQgRVhQT1JU
X09QX1BFUlNJU1RFTlRfSEFORExFUz8KPgo+IFRoaXMgdGVybWlub2xvZ3kgaXMgZnJvbSB0aGUg
TkZTIHByb3RvY29sIHNwZWMgYW5kIGl0IGlzIGFsc28gdXNlZAo+IHRvIGRlc2NyaWJlIHRoZSBz
YW1lIHRyYWl0IGluIFNNQiBwcm90b2NvbC4KPgo+PiBUaGUgcHJvYmxlbSB0aGVyZSBpcyB0aGF0
IHdlIHZlcnkgbXVjaCBkbyB3YW50IHRvIGtlZXAgdG1wZnMKPj4gZXhwb3J0YWJsZSwgYnV0IGl0
IGRvZXNuJ3QgaGF2ZSBzdGFibGUgaGFuZGxlcyAocGVyLXNlKS4KPgo+IFRoaW5raW5nIG91dCBs
b3VkIC0KPiBJdCB3b3VsZCBiZSBtaXNndWlkZWQgdG8gZGVjbGFyZSB0bXBmcyBhcwo+IEVYUE9S
VF9PUF9QRVJTSVNURU5UX0hBTkRMRVMKPiBhbmQgcmVncmVzc2luZyBleHBvcnRzIG9mIHRtcGZz
IHdpbGwgc3VyZWx5IG5vdCBnbyB1bm5vdGljZWQuCj4KPiBIb3cgYWJvdXQgYWRkaW5nIGFuIGV4
cG9ydGZzIG9wdGlvbiAicGVyc2lzdGVudF9oYW5kbGVzIiwKPiB1c2UgaXQgYXMgZGVmYXVsdCBJ
RkYgbmVpdGhlciBvcHRpb25zIGZzaWQ9LCB1dWlkPSBhcmUgdXNlZCwKPiBzbyB0aGF0IGF0IGxl
YXN0IHdoZW4gZXhwb3J0aW5nIHRtcGZzLCBleHBvcnRmcyAtdiB3aWxsIHNob3cKPiAibm9fcGVy
c2lzdGVudF9oYW5kbGVzIiBleHBsaWNpdGx5PwoKSSB0aGluayB3ZSBuZWVkIHRvIGJlIGNhcmVm
dWwuIHRtcGZzIGZpbGVoYW5kbGVzIGFsaWduIHF1aXRlCndlbGwgd2l0aCB0aGUgdHJhZGl0aW9u
YWwgZGVmaW5pdGlvbiBvZiBwZXJzaXN0ZW50IGZpbGVoYW5kbGVzLgp0bXBmcyBmaWxlaGFuZGxl
cyBsaXZlIGFzIGxvbmcgYXMgdG1wZnMgZmlsZXMgZG8sIGFuZCB0aGF0IGlzCmFsbCB0aGF0IGlz
IHJlcXVpcmVkIHRvIGJlIGNvbnNpZGVyZWQgInBlcnNpc3RlbnQiLgoKCi0tIApDaHVjayBMZXZl
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
