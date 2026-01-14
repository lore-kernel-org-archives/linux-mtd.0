Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BAAD31A3A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTLbupXJBLsVo59kGcWeH5IlrXN3g0CDDI4W5QMSmdA=; b=X64PghOlIONW1H
	cMbYNzjYfTLSimEUEZIjPEDx8SRMTvUVgj3WSg36z9D1Y3jLgGwlT6xIiN7T88Rz6TnC7EdLdbVV4
	FXog5V+VO2Xykz3rx8CuiJcCWM+Ybsz56GzUx/RVQWb1T9ZrwAV1Y5ZyRBJwC3HrccETu37qHU3dU
	W8pwRiJZp39WtPsp2163DXlvkYh28jjcn5JUQTJJ5JSyuYbjHdqU0Rdqq99RwdLbX3/3WpjcJ5lqV
	kvFRJSaDvZ2j/3K3mBuVbVC3XbNcTsPiOkhIyGfEl+JR9qHpVu/QrQl3dqLxFr+vPpZEO11pgjtzF
	Hh/rQbwlGno2gyC98qkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxGh-00000008aCc-0TRs;
	Wed, 14 Jan 2026 09:34:23 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxGe-00000008aBX-28Dc
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 09:34:21 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b87693c981fso55412566b.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2026 01:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768383257; x=1768988057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV5qgJhr5qbvOPleJHxrmxwzjsLTEkwpqcVKyAw90ng=;
        b=SKhlB5+YUMXmuw3qCgeHW7Clb0KHzPdsn5NaPT3Vv/rXVxbxTDq0UQFmFin4znjtH6
         yaXc3aQX7wzn91e5J8RPN/Mz8+F7WhYO+Zd4qLLxy1g3NUztkNdoyQLqQwdAIz1qebq+
         GE1fAxJnXOK7/J8N3Lu7nmJjk+h7RAAXXjA2aKxn2QSV8WeavMO2RyAQqxdAiIoeU2P1
         5yLHY1NxXn8rmce3NrIMv1Fc40cS0stOA06CRZRAJ3WfAaWu82/wIgvCbrlZQP6huaf1
         qB5l9nT4NnaDGq4R3z8X9H1tB8zqL7VEqPNL16+slBP0orfL3USp9zxp5Sc2Tbayq0+s
         uPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383257; x=1768988057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cV5qgJhr5qbvOPleJHxrmxwzjsLTEkwpqcVKyAw90ng=;
        b=e3BihUlxybVhFnOcf9cyCp/XGoHQr3M3HZilYzbFLqRHYa2GRnZz19Brpt+jLcV/5T
         iExlNqYq/iiyZbD0ZNI1tYfIe2sPqf092ZZ/YYw3iGRqbcUIV38pyd9t+DUAKmyFQOYi
         +8R2Vc/UMC1W1fwUVeODhBrTOauclZTIgLDZ8UtF4pYLUp3cS6/7W5JCmkmxYmA89UJV
         ixvWB4LfjrCXY1JAgfNvPZ68rzg57zV/dEpncT7vTNJO7cC178c0ViydN37y/eFyGdne
         /8VCB4g3iEoooaO//fnRoPgiNklG2rdTE81FVBPmpDM8wIquBHu2A6B6v5bwH2l7v6mG
         J9ig==
X-Forwarded-Encrypted: i=1; AJvYcCXt0k/Fvx0tKlFK3cNS+V8ZU5GUTapnQPDnpjYxQ1lgQLSD3zFVES/RwHGVw02WkLXzww1+VzbGDpI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9ZZ1GjzLE4VHmOLfVeTSDPTwQNsCusmy0iQMcAvFkRB/eQ4Mz
	BF62wRDN1beQ5g+sikyK6xH1un8gL67gcO6rlTlyawKWGptoIiUxxFWmlOK6c1toHaFePmZCHoi
	FXZ2PvrND8nk4I6xdBi/hLxfuNOnIMoY=
X-Gm-Gg: AY/fxX5gvaJbkfNbPalS0KQsl907qn6DPnIrhbEE91xzkJlYFNpTUFH777MPwQjZQyO
	KWInbMVLIbrZrl36e2lAee2enIPgVCcZPd+BK+b6wnAjqRkW1fbninYCFv9joDtMYaSpbryToBg
	by/bvH4ASt0n+gUyGP8MMHSoVFayXlC3W8qwzDYUtIOq8EK/BTiYZYrPCmJ9P9B5tsF1AwPIYyV
	Lxm2FXpEN+kGfAeTrHIXQi8sYGtkpqs/30tvzA6fSw9pFgJcSvJmo5a5mV5+14+VN6tqDuhfUpI
	lLga4DEV00RkEAQ5ewmxti8q46D7NTOFghQ9ipl4
X-Received: by 2002:a17:906:6a02:b0:b87:25a6:a906 with SMTP id
 a640c23a62f3a-b87677e0680mr108491266b.46.1768383255915; Wed, 14 Jan 2026
 01:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com> <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner> <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org> <aWc3mwBNs8LNFN4W@infradead.org>
In-Reply-To: <aWc3mwBNs8LNFN4W@infradead.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 14 Jan 2026 10:34:04 +0100
X-Gm-Features: AZwV_QjTKvsgUAM6BTw2rpBHAs0ymZXhE-dNbh6dt2ll27JlZs1InITXkkYC5Xs
Message-ID: <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
To: Christoph Hellwig <hch@infradead.org>
Cc: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Anders Larsen <al@alarsen.net>, 
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
	Yuezhang Mo <yuezhang.mo@sony.com>, Alexander Aring <alex.aring@gmail.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Eric Van Hensbergen <ericvh@kernel.org>, 
	Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, 
	Christian Schoenebeck <linux_oss@crudebyte.com>, Xiubo Li <xiubli@redhat.com>, 
	Ilya Dryomov <idryomov@gmail.com>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, 
	Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20260114_013420_573006_4EA5DD85 
X-CRM114-Status: GOOD (  15.49  )
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgNzoyOOKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEphbiAxMywgMjAyNiBhdCAxMjowNjo0
MlBNIC0wNTAwLCBKZWZmIExheXRvbiB3cm90ZToKPiA+IEZhaXIgcG9pbnQsIGJ1dCBpdCdzIG5v
dCB0aGF0IGhhcmQgdG8gY29uY2VpdmUgb2YgYSBzaXR1YXRpb24gd2hlcmUKPiA+IHNvbWVvbmUg
aW5hZHZlcnRhbnRseSBleHBvcnRzIGNncm91cGZzIG9yIHNvbWUgc2ltaWxhciBmaWxlc3lzdGVt
Ogo+Cj4gU3VyZS4gIEJ1dCBob3cgaXMgdGhpcyB3b3JzZSB0aGFuIGFjY2lkZW50YWxseSBleHBv
cnRpbmcgcHJpdmF0ZSBkYXRhCj4gb3IgYW55IG90aGVyIG1pc2NvbmZpZ3VyYXRpb24/Cj4KCk15
IFBPViBpcyB0aGF0IGl0IGlzIGxlc3MgYWJvdXQgc2VjdXJpdHkgKGFzIHlvdXIgcXVlc3Rpb24g
aW1wbGllcyksIGFuZAptb3JlIGFib3V0IGNvcnJlY3RuZXNzLgoKVGhlIHNwZWNpYWwgdGhpbmcg
YWJvdXQgTkZTIGV4cG9ydCwgYXMgb3Bwb3NlZCB0bywgc2F5LCBrc21iZCwgaXMKb3BlbiBieSBm
aWxlIGhhbmRsZSwgSU9XLCB0aGUgZXhwb3J0X29wZXJhdGlvbnMuCgpJIHBlcmNlaXZlIHRoaXMg
YXMgYSB2ZXJ5IHN0cmFuZ2UgYW5kIHVuZGVzaXJlZCBzaXR1YXRpb24gd2hlbiBORlMKZmlsZSBo
YW5kbGVzIGRvIG5vdCBiZWhhdmUgYXMgcGVyc2lzdGVudCBmaWxlIGhhbmRsZXMuCgpGVVNFIHdp
bGwgZ2xhZGx5IG9wZW4gYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBvYmplY3QsIHNvbWV0aW1lcwph
IGRpZmZlcmVudCBvYmplY3QgdHlwZSBmcm9tIGFuIE5GUyBjbGllbnQgcmVxdWVzdCBhZnRlciBz
ZXJ2ZXIgcmVzdGFydC4KCkkgc3VwcG9zZSB0aGF0IHRoZSBzYW1lIGNvdWxkIGhhcHBlbiB3aXRo
IHRtcGZzIGFuZCBwcm9iYWJseSBzb21lCm90aGVyIGZzLgoKVGhpcyBwcm9ibGVtIGlzIG9sZCBh
bmQgd2VsZGVkIGludG8gdGhlIHN5c3RlbSwgYnV0IElNTyBhZGRpbmcgbW9yZQprZXJuZWwgZmls
ZXN5c3RlbXMsIHdoaWNoIGNvbnNjaW91c2x5IGV4cG9ydCBmaWxlIGhhbmRsZXMgdGhhdCBkbyBu
b3QKc3Vydml2ZSBzZXJ2ZXIgcmVib290IGRvZXMgbm90IHNlcnZlIHVzZXJzIGludGVyZXN0cyB3
ZWxsLgoKT25lIGNvdWxkIGNsYWltIHRoYXQgdGhpcyBpcyBhIGJ1ZyB0aGF0IGNhbiBiZSBmaXhl
ZCBieSBhZGRpbmcgYm9vdF9pZAp0byBzYWlkIGZpbGUgaGFuZGxlcywgYnV0IHdoeSBmaXggc29t
ZXRoaW5nIHRoYXQgbm9ib2R5IGFza2VkIGZvcj8KCmNncm91cGZzLCBwaWRmcywgbnNmcywgYWxs
IGdhaW5lZCBvcGVuX2J5X2hhbmRsZV9hdCgpIGNhcGFiaWxpdHkgZm9yCmEga25vd24gcmVhc29u
LCB3aGljaCB3YXMgTk9UIE5GUyBleHBvcnQuCgpJZiB0aGUgYXV0aG9yIG9mIG9wZW5fYnlfaGFu
ZGxlX2F0KCkgc3VwcG9ydCAoaS5lLiBicmF1bmVyKSBkb2VzIG5vdAp3aXNoIHRvIGltcGx5IHRo
YXQgdGhvc2UgZnMgc2hvdWxkIGJlIGV4cG9ydGVkIHRvIE5GUywgd2h5IG9iamVjdD8KCldlIGNv
dWxkIGhhdmUgdGhlIG9wdC1pbi9vdXQgb2YgTkZTIGV4cG9ydCBmaXhlcyBwZXIgRVhQT1JUX09Q
XwpmbGFncyBhbmQgd2UgY291bGQgZXZlbiB0aGluayBvZiBhbGxvd2luZyBhZG1pbiB0byBtYWtl
IHRoaXMgZGVjaXNpb24KcGVyIHZmc21vdW50IChlLmcuIGZvciBjZ3JvdXBmcykuCgpJbiBhbnkg
Y2FzZSwgSSBmYWlsIHRvIHNlZSBob3cgb2JqZWN0aW5nIHRvIHRoZSBwb3NzaWJpbGl0eSBvZiBO
RlMgZXhwb3J0Cm9wdC1vdXQgc2VydmVzIGFueW9uZS4KClRoYW5rcywKQW1pci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
