Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32DFD37E39
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbqZAuBusilzCJIMByfuVZ9qFsb+iNj8budxOPK6Pw8=; b=t9gsF87Kl+A6BA
	Ly0UiyxoaLl2SDNIadB5jhMHqHtwaR+7SRdZuddrUdmrXO/4h7Ir42j32hnlBfVBmA1syCvbbR0hv
	SD0ADZRfLCePZzZpAbWBQr3pQy5kD6AVBAF3Szib175H5uCWbGPcn2VRpjXmkQyJWa+YsGiNdccQP
	PVZCS7w4TPtF+JgZgTyWgWXdB55K0Ix+Lb6RvG4K1v2GofYKUl3PlPotAa2AsGT0ujJTcHTSiXt/W
	TR6UeMzEsNafpNUSHdSmvI6O6XjqyBIGMTxV4sStgoIW6/mbwXpnPWma8I4mrNXMytfswafc9xA0m
	6roCzYT9x72+tbd2dK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg16T-00000009MKQ-3vJO;
	Wed, 14 Jan 2026 13:40:05 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg16R-00000009MJa-1MDK
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 13:40:04 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so5174289f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2026 05:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768398001; x=1769002801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wmwTmp5IFzHOcZYUSrwZ2WCFgEOIoQQbhD/zBC9MXc=;
        b=W3UiJ31zO6B35LTqlahcw8wFA+5AGEizfaF0HRXKLCU2AG6tUWwX15ScdGgnx3f3qH
         JeaYwLnwJdl7+O9IcTyy77JG+2Vn66NiQG8cAnJMAV6MilsEJIT0WzoictHRuTXKNbXT
         ZQSYWBLc9+HMLrlcaHg9cD3YqmZlk02W9o4PnYOriDqqohxsc/gPkYabTLxtcnzx73nS
         ZNliY534XvVNXYZ9QFJqRkxY6Jam9vFUxfisRHNoT+L1kWlwczfyHQBxqXonIowp/zj0
         96ruBwngUiaevqbTHAZ5ZH16r/Eo2PiBxtyy9ki7qtMq3S1dfQM5BxDOiwfJWhtYsUKO
         ZIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398001; x=1769002801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5wmwTmp5IFzHOcZYUSrwZ2WCFgEOIoQQbhD/zBC9MXc=;
        b=vOJz15fYRl1MCLcwvdkislgHHLdulb7dvppH/oEX5k/Kxjqv9PcouiqCfO/Ia8q6jQ
         bLnR1x2LJEno3asSHyoOGms7KNiqZTPsMUjN1WXVSD+vhdCbu7eOMI0oxWYBOdhxAhxq
         UjAXJ60xLQK0fyz+5o/SgtBAcb75eUv9YjNcbU4Xb9Ln7rW9S2UZxaX5EGm5pN9bo9/j
         XyZGh72hP/7JfffhY+4KPc9TYCTZ5y/dRceH92sIFBO/zQ4OQKF7BCWR/VMI7uZucSK0
         f5UreV4Zq6v8gwWErINiK4jxsS2hxqtReUXGkJyQsao7Zq75MTJ/C490Yep5dpt/4ywX
         YkWg==
X-Forwarded-Encrypted: i=1; AJvYcCX6+EDk1fTumcZufQ7U1LSApPGCQTCs8gCUWH2IL8q86EaUVXboQKHtGWMXGj8CLAmJHoo7xknwyys=@lists.infradead.org
X-Gm-Message-State: AOJu0YyfiHEUv6RoK26V553n1Ete0RuqDJFp+GJqECrx0BA2Hn4QUAX/
	7HRN9WAgIiiM2dnUJ595qcw7p307UIxDj+thE+SvrBxvRu8xWAtJ+YT2
X-Gm-Gg: AY/fxX5xRuF+rOFTuas9tqf0B1QGoD0AuGOuvq5y987q0kQ4b0LddwaerKrH4nONLJ9
	lTaY4ItXDoZzsTXBUQDN9k6q/AEmhOkpnc0NshVq6NdJahIy1fvyJ1py8XtEGr6UibbAFTa4XWP
	kokDIQf1z/mW9IMai3qNiYcCCO8GIkBMGlK5ieIZedvg2GGpi9dii95SA3G0zQJia18KAwNFz/P
	78K2NLCWy0ApBK5mYzk9CZDW+CW7BNpeb3VMubeA32/Ii/CgqeeVZO5r42OG4gcBImsMTR+9fX4
	h01S2ZxoC0hpBI0cINjg2Twc4xdqm4P06cO3z6TydM8mZ/cPOlzL2A4e5svNhXLdVuaXnKm+QIw
	HhEtCiKKUCx5oA73Qn3mErfWkiRNlcJumYseC09twgHoj35GoN+vFSyZhEHY2OfpkL1ZIOF+Cn9
	xYt5NgV5qFtOtkXdjTPw1r8wYQKGEpUaRmIK9e7eXYZiYbpAXfTHaM
X-Received: by 2002:a5d:53c9:0:b0:432:5bf9:cf2e with SMTP id ffacd0b85a97d-4342c3ef274mr2643750f8f.13.1768398001040;
        Wed, 14 Jan 2026 05:40:01 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm50238105f8f.29.2026.01.14.05.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:40:00 -0800 (PST)
Date: Wed, 14 Jan 2026 13:39:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jeff Layton <jlayton@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Chuck Lever
 <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>, Luis de Bethencourt
 <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, Nicolas Pitre
 <nico@fluxnic.net>, Anders Larsen <al@alarsen.net>, Alexander Viro
 <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Chris Mason
 <clm@fb.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue
 Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep
 Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, Chunhai
 Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, "Theodore Ts'o"
 <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim
 <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, David
 Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave
 Kleikamp <shaggy@kernel.org>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Phillip Lougher
 <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew
 Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Alexander Aring <alex.aring@gmail.com>, Andreas Gruenbacher
 <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "Matthew Wilcox
 (Oracle)" <willy@infradead.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet
 <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Trond
 Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Steve
 French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, Ronnie
 Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, Bharath SM
 <bharathsm@microsoft.com>, Hans de Goede <hansg@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, gfs2@lists.linux.dev, linux-doc@vger.kernel.org,
 v9fs@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
Message-ID: <20260114133955.0a9f5cd3@pumpkin>
In-Reply-To: <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
	<m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
	<8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
	<CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
	<ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
	<cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
	<ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
	<20260113-mondlicht-raven-82fc4eb70e9d@brauner>
	<aWZcoyQLvbJKUxDU@infradead.org>
	<ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
	<aWc3mwBNs8LNFN4W@infradead.org>
	<CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_054003_396282_FD0F42C1 
X-CRM114-Status: GOOD (  21.28  )
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

T24gV2VkLCAxNCBKYW4gMjAyNiAxMDozNDowNCArMDEwMApBbWlyIEdvbGRzdGVpbiA8YW1pcjcz
aWxAZ21haWwuY29tPiB3cm90ZToKCj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgNzoyOOKAr0FN
IENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24g
VHVlLCBKYW4gMTMsIDIwMjYgYXQgMTI6MDY6NDJQTSAtMDUwMCwgSmVmZiBMYXl0b24gd3JvdGU6
ICAKPiA+ID4gRmFpciBwb2ludCwgYnV0IGl0J3Mgbm90IHRoYXQgaGFyZCB0byBjb25jZWl2ZSBv
ZiBhIHNpdHVhdGlvbiB3aGVyZQo+ID4gPiBzb21lb25lIGluYWR2ZXJ0YW50bHkgZXhwb3J0cyBj
Z3JvdXBmcyBvciBzb21lIHNpbWlsYXIgZmlsZXN5c3RlbTogIAo+ID4KPiA+IFN1cmUuICBCdXQg
aG93IGlzIHRoaXMgd29yc2UgdGhhbiBhY2NpZGVudGFsbHkgZXhwb3J0aW5nIHByaXZhdGUgZGF0
YQo+ID4gb3IgYW55IG90aGVyIG1pc2NvbmZpZ3VyYXRpb24/Cj4gPiAgCj4gCj4gTXkgUE9WIGlz
IHRoYXQgaXQgaXMgbGVzcyBhYm91dCBzZWN1cml0eSAoYXMgeW91ciBxdWVzdGlvbiBpbXBsaWVz
KSwgYW5kCj4gbW9yZSBhYm91dCBjb3JyZWN0bmVzcy4KPiAKPiBUaGUgc3BlY2lhbCB0aGluZyBh
Ym91dCBORlMgZXhwb3J0LCBhcyBvcHBvc2VkIHRvLCBzYXksIGtzbWJkLCBpcwo+IG9wZW4gYnkg
ZmlsZSBoYW5kbGUsIElPVywgdGhlIGV4cG9ydF9vcGVyYXRpb25zLgo+IAo+IEkgcGVyY2VpdmUg
dGhpcyBhcyBhIHZlcnkgc3RyYW5nZSBhbmQgdW5kZXNpcmVkIHNpdHVhdGlvbiB3aGVuIE5GUwo+
IGZpbGUgaGFuZGxlcyBkbyBub3QgYmVoYXZlIGFzIHBlcnNpc3RlbnQgZmlsZSBoYW5kbGVzLgo+
IAo+IEZVU0Ugd2lsbCBnbGFkbHkgb3BlbiBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IG9iamVjdCwg
c29tZXRpbWVzCj4gYSBkaWZmZXJlbnQgb2JqZWN0IHR5cGUgZnJvbSBhbiBORlMgY2xpZW50IHJl
cXVlc3QgYWZ0ZXIgc2VydmVyIHJlc3RhcnQuCj4gCj4gSSBzdXBwb3NlIHRoYXQgdGhlIHNhbWUg
Y291bGQgaGFwcGVuIHdpdGggdG1wZnMgYW5kIHByb2JhYmx5IHNvbWUKPiBvdGhlciBmcy4KLi4u
CgpZb3UgcmVhbGx5IHNob3VsZG4ndCBiZSBhbGxvd2VkIHRvIG5mcyBleHBvcnQgYSBmcyB0aGF0
IGRvZXNuJ3QgaGF2ZQpwZXJzaXN0ZW50IGZpbGUgaGFuZGxlcy4KCkV2ZW4gZmlsZSBoYW5kbGVz
IGNvbnRhaW5pbmcgJ3JhbmRvbScgbnVtYmVycyBjYW4gYmUgcHJvYmxlbWF0aWMuClRoZSBkZWZh
dWx0IHVzZWQgdG8gYmUgJ2hhcmQgbW91bnRzJyAobm90IHN1cmUgaXQgaXMgYW55IG1vcmUpIHdo
aWNoCmNhdXNlZCB0aGUgY2xpZW50IChub3QgTGludXggLSB0b28gbG9uZyBhZ28pIHRvIGxvb3Ag
aW4ga2VybmVsCmZvcmV2ZXIgd2FpdGluZyBmb3IgdGhlIHNlcnZlciB0byByZWNvdmVyIHRoZSBm
aWxlc3lzdGVtIGV4cG9ydC4KVGhlIG9ubHkgcmVzb2x1dGlvbiBvbiB0aGF0IHN5c3RlbSB3YXMg
dG8gcmVib290IHRoZSBjbGllbnQuCgpBdCBsZWFzdCBuZnMgY2FuIG5vdyB1c2UgdmFyaWFibGUg
c2l6ZSBmaWxlLWlkcy4KV2hlbiBJIHdhcyBmaXhpbmcgc29tZSBjb2RlIHRoYXQgZXhwb3J0ZWQg
YSBsYXllcmVkIGZzIChJIHByZXR0eQptdWNoIHJld3JvdGUgdGhlIGZzIGF0IHRoZSBzYW1lIHRp
bWUpIEkgZGlkIHJhbmRvbWlzZSB0aGUgZmlsZS1pZHMKc28gdGhleSAoaG9wZWZ1bGx5KSBiZWNh
bWUgaW52YWxpZCBhZnRlciBhIHJlYm9vdCAob25seSBhZnRlciBzdWZmZXJpbmcKc29tZSB2ZXJ5
IGNvcnJ1cHQgZmlsZXN5c3RlbXMhKQpJIGZvdW5kIG5mcyAob3ZlciB1ZHApIGhhZCBzb21lIGlu
dGVyZXN0aW5nICdmZWF0dXJlcyc6Ci0gSWYgeW91IGV4cG9ydCBwYXJ0IG9mIGEgZnMgeW91IGV4
cG9ydCBhbGwgb2YgaXQuCiAgKEVzcGVjaWFsbHkgc2luY2UgdGhpcyBwcmVkYXRlZCB0aGUgcmFu
ZG9taXNhdGlvbiBvZiB0aGUgaW5vZGUKICBnZW5lcmF0aW9uIG51bWJlci4pCi0gSWYgeW91IGdp
dmUgYW55b25lIGFjY2VzcyB5b3UgZ2l2ZSBldmVyeW9uZSBhY2Nlc3MuCi0gSWYgeW91IGdpdmUg
YW55b25lIHdyaXRlIGFjY2VzcyB5b3UgZ2l2ZSBldmVyeW9uZSB3cml0ZSBhY2Nlc3MuClRoZSBs
YXR0ZXIgdHdvIGJlY2F1c2UgdGhlICdtb3VudCcgcHJvdG9jb2wgd2Fzbid0IHJlYWxseSBuZWVk
ZWQKYW5kIHRoZSBzZXJ2ZXIgZGlkbid0IGNhcmUgd2hlcmUgcmVxdWVzdHMgY2FtZSBmcm9tLgoK
CURhdmlkCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
