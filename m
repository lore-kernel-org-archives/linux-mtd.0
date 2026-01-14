Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D215AD37E3A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/XqxclMlJotSNkzZTochL5RxvMb84PLa7LJnLJyFJc=; b=SwBIlVtiFevv4E
	SWTxwKXSQ2bp2My/35AGLHobwtRaI/fZYylNr7fie7z11IYF93YBkKbE9gh77Fp4jFwq2oqJKHcg8
	UgIDLZ90I/NywEb3O2yLxlzjaTfxNDAg7h3tu0GyG3E/ZxH1Yjl710p29O80azN/6Bx+xGdHFHeIq
	q26wllYdGTKdGfPuLvfrMZod9F5aaOxACCMf83j1U7HMCRRyp/Pl4MyUzpp62t4gU+6dCz3Zuiqox
	2pIXo1JvOxIXUyhEwRkXt5m0h/uoFqDK6OzXPLFNn/m0HdHxENS8FzTqxTCulZ+7LWDSAxTS4ra1A
	k72/a+AcKgVP7kARL+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1dr-00000009TcF-3xtk;
	Wed, 14 Jan 2026 14:14:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1dq-00000009Tbd-29wM
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 Jan 2026 14:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LXI/JsxBbKF9LcEy7WQN83dkdhDN53l6d1BjVlfpBx8=; b=WybduUq/Cg2N9VUj8ok51SKukc
	TteE/lhmVi0GedGNyK8A6ToolBt7hX3UUKrtcFLtcn9iLVSvBz9OMW32v4XSRpyUdooNzduVuVaEu
	vLRlpOm2Jet740qDUBv/BVb4LjXKrM8xw8zCO/3ywA52iqrqYFJtUozXKNU5s+At8DGzt/bu0SDXM
	LS4h7ARe9R/lNFM2EQLVtVn5/VQYkQwEDCKbI3+araH87zwXJBjBzESeKF6O5KVET3AIdW0EFxO7e
	8ftve4uw4ObnDO7hQwawV+hfyrxolVm8C/KiyM/bqB8N6fgt/1Oktoq/NskMp6qmI3Q8QK6KJCLZt
	UvaNbm4g==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1dk-00000005095-2df2
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 14:14:31 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso13498772a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2026 06:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768400067; x=1769004867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXI/JsxBbKF9LcEy7WQN83dkdhDN53l6d1BjVlfpBx8=;
        b=nS5xXK7zocab7JlR1zv+MdgoCGIcCQOyGWXl7AOl9BB9JnSMH1l/7A8c5JhnmAW9Xw
         Dwc6/WRtYUfhLzoKpE86HNRZYXliUa04IfLUZKz8yPaE7X05SpFEodHP2Dyo1u+xp5gM
         WA7yGnXPoWksG2tdmb+uyYBKrT2sAEvk8ycXm89CBNNCaTP992wQodly3AzPVVl3i5T6
         KCwc0q2w5JeOUSsWNxGL42dbpNP8nKi/QECz6aecC9WECcUOyuMtYZjCXRnbFu8yxbZH
         Z8CQrJAA16hvDl1qM6CY5ud3Ple7k2bjFHHEnf8/IwQqbwDIWpheOW1LWIJ11SxTMpWa
         K49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400067; x=1769004867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LXI/JsxBbKF9LcEy7WQN83dkdhDN53l6d1BjVlfpBx8=;
        b=qfYQ3nO6smOlu32tjt2KzyL8b/08hn2Ream/5mg0p+BqI/FCMYC3w1mke49aT6gI4K
         o+dVgm9uRoPO+YRIdTgcYgceAIHH1d5XxH4CLVGxL33PqNf7qlR1VImIjrN5XGw1Col0
         2V+puKO6XJPHgum73tbNe1YD/4KTbsXXnfvEr7NnjMsHnlC62mjOt3/NnvrMtXzJLFWD
         NnSLjs2bsE8vhpDeCMD1tZnjAWlbSH2skGQWj+zvgPHFb4XCuLqae7pB7hobJ09MNjGY
         i+ckbN4BjjXZvA04L1MvdUiUo02jZGCN8m7iXwE1k33h9atDkKhQnH9UaQ5TbfnGug3g
         vhFg==
X-Forwarded-Encrypted: i=1; AJvYcCWv4VobIjeXKOjgGT1IeYOUAvxQc6FYQfu4kY8U+i956uL+AOes5G6hSLYNbb+AlwR8Vqra+QX9oSY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhqt1/vb2GOWjVbDDf+OvJenNMCjFdjdrMtVxlACPO0BlewdKx
	2LZSJ41JK4KrioGRi/zHTV04s9i/wqrIw2bf8g9vBBh0EjiTMHBcyOLGQ70UYWBU2GQJz6jgdJz
	BnUeBj82ldXcc5B6NbA+bfjKTqZFTcRA=
X-Gm-Gg: AY/fxX6ZeICwsIznxJGR4Kn/tDuLL9z+17Z7U4+WPSDpBvGMIkFuP+z8B4CoaNJuryC
	NrplJOBK9+p2zhRvowW+cVKAnHvCiHsW7qgVXvXOIGbRrBCMihAuGXV7t2tSMrgOWzEFJi0irjR
	V29YwNjG4Baz3n/fa42iWRWyKWxleX3aXzIq5xinRk2HJRmkBdb3b7lfKSbAZgeyWh+bd8z5Lew
	rme2XdW5E+iSWhTV+J1Lyw/4lcChH+YwxkCyZ2i/Ces3KoED9eT5ncucC8n6D+HuCedlWhdMzRW
	FjXXzBKLnqtJ8K8wG1whkfhgfKdOqg==
X-Received: by 2002:a05:6402:210c:b0:64b:42a6:3946 with SMTP id
 4fb4d7f45d1cf-653ec10b2c1mr2391600a12.7.1768400066360; Wed, 14 Jan 2026
 06:14:26 -0800 (PST)
MIME-Version: 1.0
References: <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com> <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner> <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org> <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org> <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
In-Reply-To: <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 14 Jan 2026 15:14:13 +0100
X-Gm-Features: AZwV_QgcgdaBnds1gv_V4-TD2P8OEmx8uWYCKQoKmrAoITMmwNZxXsYhEeLI48A
Message-ID: <CAOQ4uxhDwR7dteLaqURX+9CooGM1hA7PL6KnVmSwX11ZdKxZTA@mail.gmail.com>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
To: Jeff Layton <jlayton@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Christian Brauner <brauner@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260114_141428_843055_7CBE7DF4 
X-CRM114-Status: GOOD (  36.52  )
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMjo0MeKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAyMDI2LTAxLTE0IGF0IDA1OjA2IC0wODAwLCBD
aHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+IE9uIFdlZCwgSmFuIDE0LCAyMDI2IGF0IDEwOjM0
OjA0QU0gKzAxMDAsIEFtaXIgR29sZHN0ZWluIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEphbiAxNCwg
MjAyNiBhdCA3OjI44oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiB3
cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgSmFuIDEzLCAyMDI2IGF0IDEyOjA2OjQyUE0g
LTA1MDAsIEplZmYgTGF5dG9uIHdyb3RlOgo+ID4gPiA+ID4gRmFpciBwb2ludCwgYnV0IGl0J3Mg
bm90IHRoYXQgaGFyZCB0byBjb25jZWl2ZSBvZiBhIHNpdHVhdGlvbiB3aGVyZQo+ID4gPiA+ID4g
c29tZW9uZSBpbmFkdmVydGFudGx5IGV4cG9ydHMgY2dyb3VwZnMgb3Igc29tZSBzaW1pbGFyIGZp
bGVzeXN0ZW06Cj4gPiA+ID4KPiA+ID4gPiBTdXJlLiAgQnV0IGhvdyBpcyB0aGlzIHdvcnNlIHRo
YW4gYWNjaWRlbnRhbGx5IGV4cG9ydGluZyBwcml2YXRlIGRhdGEKPiA+ID4gPiBvciBhbnkgb3Ro
ZXIgbWlzY29uZmlndXJhdGlvbj8KPiA+ID4gPgo+ID4gPgo+ID4gPiBNeSBQT1YgaXMgdGhhdCBp
dCBpcyBsZXNzIGFib3V0IHNlY3VyaXR5IChhcyB5b3VyIHF1ZXN0aW9uIGltcGxpZXMpLCBhbmQK
PiA+ID4gbW9yZSBhYm91dCBjb3JyZWN0bmVzcy4KPiA+Cj4gPiBJIHdhcyBqdXN0IHJlcGx5aW5n
IHRvIEplZmYuCj4gPgo+ID4gPiBUaGUgc3BlY2lhbCB0aGluZyBhYm91dCBORlMgZXhwb3J0LCBh
cyBvcHBvc2VkIHRvLCBzYXksIGtzbWJkLCBpcwo+ID4gPiBvcGVuIGJ5IGZpbGUgaGFuZGxlLCBJ
T1csIHRoZSBleHBvcnRfb3BlcmF0aW9ucy4KPiA+ID4KPiA+ID4gSSBwZXJjZWl2ZSB0aGlzIGFz
IGEgdmVyeSBzdHJhbmdlIGFuZCB1bmRlc2lyZWQgc2l0dWF0aW9uIHdoZW4gTkZTCj4gPiA+IGZp
bGUgaGFuZGxlcyBkbyBub3QgYmVoYXZlIGFzIHBlcnNpc3RlbnQgZmlsZSBoYW5kbGVzLgo+ID4K
PiA+IFRoYXQgaXMgbm90IGp1c3QgdmVyeSBzdHJhbmdlLCBidXQgYWN0dWFsbHkgYnJva2VuIChk
aXNjb3VudGluZyB0aGUKPiA+IG9ic2N1cmUgdm9sYXRpbGUgZmlsZSBoYW5kbGVzIGZlYXR1cmVz
IG5vdCBpbXBsZW1lbnRlZCBpbiBMaW51eCBORlMKPiA+IGFuZCBORlNEKS4gIEFuZCB0aGUgZXhw
b3J0IG9wcyBhbHdheXMgd29ya2VkIHVuZGVyIHRoZSBhc3N1bXB0aW9uCj4gPiB0aGF0IHRoZXNl
IGZpbGUgaGFuZGxlcyBhcmUgaW5kZWVkIHBlcnNpc3RlbnQuICBJZiB0aGV5J3JlIG5vdCB3ZQo+
ID4gZG8gaGF2ZSBhIHByb2JsZW0uCj4gPgo+ID4gPgo+ID4gPiBjZ3JvdXBmcywgcGlkZnMsIG5z
ZnMsIGFsbCBnYWluZWQgb3Blbl9ieV9oYW5kbGVfYXQoKSBjYXBhYmlsaXR5IGZvcgo+ID4gPiBh
IGtub3duIHJlYXNvbiwgd2hpY2ggd2FzIE5PVCBORlMgZXhwb3J0Lgo+ID4gPgo+ID4gPiBJZiB0
aGUgYXV0aG9yIG9mIG9wZW5fYnlfaGFuZGxlX2F0KCkgc3VwcG9ydCAoaS5lLiBicmF1bmVyKSBk
b2VzIG5vdAo+ID4gPiB3aXNoIHRvIGltcGx5IHRoYXQgdGhvc2UgZnMgc2hvdWxkIGJlIGV4cG9y
dGVkIHRvIE5GUywgd2h5IG9iamVjdD8KPiA+Cj4gPiBCZWNhdXNlICJ3YW50IHRvIGV4cG9ydCIg
aXMgYSBzdHVwaWQgY2F0ZWdvcnkuCj4gPgo+ID4gT1RPSCAiTkZTIGV4cG9ydGluZyBkb2Vzbid0
IGFjdHVhbGx5IHByb3Blcmx5IHdvcmsgYmVjYXVzZSBzb21lb25lCj4gPiBvdmVybG9hZGVkIGV4
cG9ydF9vcHMgd2l0aCBkaWZmZXJlbnQgc2VtYW50aWNzIiBpcyBhIHZhbGlkIGNhdGVnb3J5Lgo+
ID4KPgo+IGNncm91cGZzIGRlZmluaXRlbHkgZG9lc24ndCBiZWhhdmUgYXMgZXhwZWN0ZWQgd2hl
biBleHBvcnRlZCB2aWEgTkZTLgo+IFRoZSBmaWxlcyBhcmVuJ3QgcmVhZGFibGUsIGF0IGxlYXN0
LiBJJ2QgYWxzbyBiZSBzdXJwcmlzZWQgaWYgdGhlCj4gZmlsZWhhbmRsZXMgd2VyZSBzdGFibGUg
YWNyb3NzIGEgcmVib290LCB3aGljaCBpcyBzb3J0IG9mIG5lY2Vzc2FyeSBmb3IKPiBwcm9wZXIg
b3BlcmF0aW9uLiBJIGRpZG4ndCB0ZXN0IHdyaXRpbmcsIGJ1dCB3aG8ga25vd3Mgd2hldGhlciB0
aGF0Cj4gbWlnaHQgYWxzbyBqdXN0IG5vdCB3b3JrLCBjcmFzaCB0aGUgYm94LCBvciBkbyBzb21l
dGhpbmcgZWxzZSBlbnRpcmVseS4KPgo+IEkgaW1hZ2luZSB0aGlzIGlzIHRoZSBjYXNlIGZvciBh
bGwgc29ydHMgb2YgZmlsZXN5c3RlbXMgbGlrZSAvcHJvYywKPiAvc3lzLCBldGMuIFRob3NlIGFy
ZW4ndCBleHBvcnRhYmxlIHRvZGF5ICh0byBteSBrbm93bGVkZ2UpLCBidXQgd2UncmUKPiBncm93
aW5nIGV4cG9ydF9vcGVyYXRpb25zIGFjcm9zcyBhIHdpZGUgcmFuZ2Ugb2YgZnMncyB0aGVzZSBk
YXlzLgo+Cj4gSSdkIHByZWZlciB0aGF0IHdlIHJlcXVpcmUgc29tZW9uZSB0byB0YWtlIHRoZSBk
ZWxpYmVyYXRlIHN0ZXAgdG8gc2F5Cj4gInllcywgYWxsb3cgbmZzZCB0byBhY2Nlc3MgdGhpcyB0
eXBlIG9mIGZpbGVzeXN0ZW0iLgo+Cj4gPiA+IFdlIGNvdWxkIGhhdmUgdGhlIG9wdC1pbi9vdXQg
b2YgTkZTIGV4cG9ydCBmaXhlcyBwZXIgRVhQT1JUX09QXwo+ID4gPiBmbGFncyBhbmQgd2UgY291
bGQgZXZlbiB0aGluayBvZiBhbGxvd2luZyBhZG1pbiB0byBtYWtlIHRoaXMgZGVjaXNpb24KPiA+
ID4gcGVyIHZmc21vdW50IChlLmcuIGZvciBjZ3JvdXBmcykuCj4gPiA+Cj4gPiA+IEluIGFueSBj
YXNlLCBJIGZhaWwgdG8gc2VlIGhvdyBvYmplY3RpbmcgdG8gdGhlIHBvc3NpYmlsaXR5IG9mIE5G
UyBleHBvcnQKPiA+ID4gb3B0LW91dCBzZXJ2ZXMgYW55b25lLgo+ID4KPiA+IFlvdSdyZSBzdGls
bCB0aGluayBvZiBpdCB0aGUgd3Jvbmcgd2F5LiAgSWYgd2UgZG8gaGF2ZSBmaWxlIHN5c3RlbXMK
PiA+IHRoYXQgYnJlYWsgdGhlIG9yaWdpbmFsIGV4cG9ydGZzIHNlbWFudGljcyB3ZSBuZWVkIHRv
IGZpeCB0aGF0LCBhbmQKPiA+IHNvbWV0aGluZyBsaWtlIGEgInN0YWJsZSBoYW5kbGVzIiBmbGFn
IHdpbGwgd29yayB3ZWxsIGZvciB0aGF0LiAgQnV0Cj4gPiBhIHRvdGFsbHkgYXJiaXRyYXJ5ICJp
cyBleHBvcnRhYmxlIiBmbGFnIGlzIHRvdGFsIG5vbnNlbnNlLgo+CgpWZXJ5IHdlbGwgdGhlbi4K
SG93IGFib3V0IEVYUE9SVF9PUF9QRVJTSVNURU5UX0hBTkRMRVM/CgpUaGlzIHRlcm1pbm9sb2d5
IGlzIGZyb20gdGhlIE5GUyBwcm90b2NvbCBzcGVjIGFuZCBpdCBpcyBhbHNvIHVzZWQKdG8gZGVz
Y3JpYmUgdGhlIHNhbWUgdHJhaXQgaW4gU01CIHByb3RvY29sLgoKPiBUaGUgcHJvYmxlbSB0aGVy
ZSBpcyB0aGF0IHdlIHZlcnkgbXVjaCBkbyB3YW50IHRvIGtlZXAgdG1wZnMKPiBleHBvcnRhYmxl
LCBidXQgaXQgZG9lc24ndCBoYXZlIHN0YWJsZSBoYW5kbGVzIChwZXItc2UpLgoKVGhpbmtpbmcg
b3V0IGxvdWQgLQpJdCB3b3VsZCBiZSBtaXNndWlkZWQgdG8gZGVjbGFyZSB0bXBmcyBhcwpFWFBP
UlRfT1BfUEVSU0lTVEVOVF9IQU5ETEVTCmFuZCByZWdyZXNzaW5nIGV4cG9ydHMgb2YgdG1wZnMg
d2lsbCBzdXJlbHkgbm90IGdvIHVubm90aWNlZC4KCkhvdyBhYm91dCBhZGRpbmcgYW4gZXhwb3J0
ZnMgb3B0aW9uICJwZXJzaXN0ZW50X2hhbmRsZXMiLAp1c2UgaXQgYXMgZGVmYXVsdCBJRkYgbmVp
dGhlciBvcHRpb25zIGZzaWQ9LCB1dWlkPSBhcmUgdXNlZCwKc28gdGhhdCBhdCBsZWFzdCB3aGVu
IGV4cG9ydGluZyB0bXBmcywgZXhwb3J0ZnMgLXYgd2lsbCBzaG93CiJub19wZXJzaXN0ZW50X2hh
bmRsZXMiIGV4cGxpY2l0bHk/CgpUaGFua3MsCkFtaXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
