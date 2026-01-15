Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9D2D47CA3
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jan 2026 00:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmarYN2hmn6903u9UaPkk49JvRxUaOBJVwO11nDun5A=; b=SvIlz/jR3nupve
	kCd2Ca1k6vGMzzpx4BjswfgYSkioJU4Ga24KHXWzsfMGCL1286FSUDQzCVJthyUl7QLLEhxWicEIy
	VRVEIJrObTTWhwHSJM8R6BuipDAtGYOJkRo7EiF8ayfFuPOaG9vupKjd4jrWJoEdhIFdBioefT39L
	vP8cym5QJ3lTsLaMUXyLu7xmcRR5D+2/N3fB+ChvN39J+ydqnt/7MuJLSCqn+2LxG5YTLjTAPYN1u
	+Ufg59qpXT+14lC/XmJRL32G5LXMQq6/l03tb3jCZd7RAmGqAlT0MPsNB78XHh+zXS4w70eSrb7S1
	ora9GnJXecluKDI767lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXXf-0000000DMDo-0muw;
	Fri, 16 Jan 2026 00:18:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXXe-0000000DMDi-0kvh
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Jan 2026 00:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LuYXJTx9p8g5I9PbL+x4hBzLoIE63ueUkinqkyb6yNs=; b=brXNjtm/qFOy/s4ECi1cAnKd5W
	/1Cy0RR5EoiGcoVv6riuXMSFrUup5ZMG63s7RaD4puTWsmBpLnb6xffK0rOl4bPKL1dS+Uw7D6x6h
	kmir/m4U8XdVr+a2KzdlxHCsSWRqjty+LkrHnPOB9B7eu4E6DQjkvPm2Ye5Q/NW82HJQeCfS8RFDY
	g1tmXluIYr8C65/2m4nzPU1uE8kq3XL+KOw3rPVo8mneBlgUPMzsAxrTMf6sxGR5NzB8nOE2h1LSH
	/+AZlmliIjuzZzfQ6ph72lZKiX3t705dDIg5u+GXYeB4YPW1z/GoyKp/0k4AJNJK6P5UtPUWh9cS+
	IOganhOQ==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXXa-00000007pxg-2WQo
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jan 2026 00:18:16 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so2472395a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 16:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768522693; x=1769127493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuYXJTx9p8g5I9PbL+x4hBzLoIE63ueUkinqkyb6yNs=;
        b=JagaMJUi/VAfQlsrcoMKkw1aDcynFIPxNnEiyEH4o+6vV0qptwp7/Ftk7ru4FbfWCd
         HND032AP3WfSLM7YfKQrWSlOFZEkhGruOVzyVzTLCJ95QKo9k+HdXGeTKdrSzs6H6520
         9YTogQQUoGC48WCR4SlO7aR70+j67fmGzMzlGGyPhEPhL9dp778Z3rlnikplEsTUcltt
         fyD0061fsXluvUUacVc8RZ5kpCsPNQOC81Aw24JsDIW7IFPhB2nFQcT3eMWfwKwqFRLN
         ib2jIVPUeqZcbZvS6dJxGIBlSyJiwyhX9ZfkRKelU7U+KweVF5j2yO+pgJN4MG4TJPhA
         b4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768522693; x=1769127493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LuYXJTx9p8g5I9PbL+x4hBzLoIE63ueUkinqkyb6yNs=;
        b=ewnPH2vMslxlEGKARhn5ZCeJKFVZz8sfVPsghXNizhyuTps2/2RO9jW+gKkYZztXm9
         oeIUhXgZ9AZg4eI44swCKmJfcYUpcPIh8YgwK1OLTOTZN3Ex+kXv69RLjGcFqfAp9YYT
         UrLFXIrtOJS+SouGOGnRsbh7ShPorOfIe0bZRsxCT3zmlSqM6Gslx4boo8R13H9mRAIy
         AsS5gzJX8clIJBtMrhsUBE3pxXEZmZPe4vI1mSTtdjsXq+Ia2NmH4/x7dnQggQv+pxkQ
         iIJIzK2IfEOyrU71pInCJ1qnJWIVu78ADGDZNyA17XgNrfvuB1GN+XIQLEw7XvnlXIMb
         aUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+cuUEWTXmeCzhpuRLMbEGlQnRtPqC84y5i0CB7gmuhDnTG+ODjNyGwABTcD49DHoogPjzQaR9Qa8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlrP2jnuYTxmXXSquP9rCS3Ar3IcgJMEydDaQ4pyo4XB+EARb6
	2rh6qT0cFD8UlM6KEiJPUbGLdw3ubSXk4Sj0R4BXYxVLlpqztD4EMqlgOdx0Tw==
X-Gm-Gg: AY/fxX7FkuO7clmuG1xTkiFhTOwssgSeAwJdQUqtqxe7olwmwYnDd1MriQIBoX2hEeX
	N1CLoEFPtBdAj1nv1JEPvA2a21JAajXknI3r3jEPgkbdnUKgWB4CcS7c3OLgc5w4v0nzgYeB4tx
	Gq+1tCIX6O+O2yMdNfcgJf+JKF8d/mEcI7Om/VJJUXzOiF3ADCs1El+jYGkYzzY++e+bOauhtxP
	MF8biBgqClHrU3RNHNuezvjBd1Nnti5Cp1qI2n1BZocvB8fNIxi70cGwnIgZHgeiRrIpP+cAjM+
	1ILyDL8JaMUyF0zJ+k1NeojQK1VhuGGActMvnQJpRjPajrKDBCqfPP6+VQ/kZ5u4y4z/sAzVIVf
	GzFl+HjPsQHw/E3jyQYwZge1hARev4IA07eamzWLJchOOVqNJsHif1H1g5ai0EHEqPtqPNObhG7
	8yDB9yI/hGVIhnIWMHFdQl1oPJetxGAtjO4W4Mxx0v9UKvFlejhsH9
X-Received: by 2002:a05:600d:8445:10b0:480:1a22:fce8 with SMTP id 5b1f17b1804b1-4801e3494acmr11682565e9.26.1768516821247;
        Thu, 15 Jan 2026 14:40:21 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dad0sm1443737f8f.27.2026.01.15.14.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 14:40:20 -0800 (PST)
Date: Thu, 15 Jan 2026 22:40:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Chuck Lever" <cel@kernel.org>
Cc: "Dave Chinner" <david@fromorbit.com>, "Amir Goldstein"
 <amir73il@gmail.com>, "Jeff Layton" <jlayton@kernel.org>, "Christian
 Brauner" <brauner@kernel.org>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Chuck Lever" <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, "Olga
 Kornievskaia" <okorniev@redhat.com>, "Dai Ngo" <Dai.Ngo@oracle.com>, "Tom
 Talpey" <tom@talpey.com>, "Hugh Dickins" <hughd@google.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Theodore Tso" <tytso@mit.edu>, "Andreas
 Dilger" <adilger.kernel@dilger.ca>, "Jan Kara" <jack@suse.com>, "Gao Xiang"
 <xiang@kernel.org>, "Chao Yu" <chao@kernel.org>, "Yue Hu"
 <zbestahu@gmail.com>, "Jeffle Xu" <jefflexu@linux.alibaba.com>, "Sandeep
 Dhavale" <dhavale@google.com>, "Hongbo Li" <lihongbo22@huawei.com>,
 "Chunhai Guo" <guochunhai@vivo.com>, "Carlos Maiolino" <cem@kernel.org>,
 "Ilya Dryomov" <idryomov@gmail.com>, "Alex Markuze" <amarkuze@redhat.com>,
 "Viacheslav Dubeyko" <slava@dubeyko.com>, "Chris Mason" <clm@fb.com>,
 "David Sterba" <dsterba@suse.com>, "Luis de Bethencourt"
 <luisbg@kernel.org>, "Salah Triki" <salah.triki@gmail.com>, "Phillip
 Lougher" <phillip@squashfs.org.uk>, "Steve French" <sfrench@samba.org>,
 "Paulo Alcantara" <pc@manguebit.org>, "Ronnie Sahlberg"
 <ronniesahlberg@gmail.com>, "Shyam Prasad N" <sprasad@microsoft.com>,
 "Bharath SM" <bharathsm@microsoft.com>, "Miklos Szeredi"
 <miklos@szeredi.hu>, "Mike Marshall" <hubcap@omnibond.com>, "Martin
 Brandenburg" <martin@omnibond.com>, "Mark Fasheh" <mark@fasheh.com>, "Joel
 Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>,
 "Konstantin Komarov" <almaz.alexandrovich@paragon-software.com>, "Ryusuke
 Konishi" <konishi.ryusuke@gmail.com>, "Trond Myklebust"
 <trondmy@kernel.org>, "Anna Schumaker" <anna@kernel.org>, "Dave Kleikamp"
 <shaggy@kernel.org>, "David Woodhouse" <dwmw2@infradead.org>, "Richard
 Weinberger" <richard@nod.at>, "Jan Kara" <jack@suse.cz>, "Andreas
 Gruenbacher" <agruenba@redhat.com>, "OGAWA Hirofumi"
 <hirofumi@mail.parknet.co.jp>, "Jaegeuk Kim" <jaegeuk@kernel.org>,
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
Message-ID: <20260115224018.2988ca25@pumpkin>
In-Reply-To: <06dcc4b6-7457-4094-a1c6-586ce518020f@app.fastmail.com>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
	<CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
	<d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
	<CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
	<4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
	<aWlXfBImnC_jhTw4@dread.disaster.area>
	<06dcc4b6-7457-4094-a1c6-586ce518020f@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_001815_217011_2DFCF9B2 
X-CRM114-Status: GOOD (  32.80  )
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

T24gVGh1LCAxNSBKYW4gMjAyNiAxNjozNzoyNyAtMDUwMAoiQ2h1Y2sgTGV2ZXIiIDxjZWxAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgSmFuIDE1LCAyMDI2LCBhdCA0OjA5IFBNLCBEYXZl
IENoaW5uZXIgd3JvdGU6Cj4gPiBPbiBUaHUsIEphbiAxNSwgMjAyNiBhdCAwMjozNzowOVBNIC0w
NTAwLCBDaHVjayBMZXZlciB3cm90ZTogIAo+ID4+IE9uIDEvMTUvMjYgMjoxNCBQTSwgQW1pciBH
b2xkc3RlaW4gd3JvdGU6ICAKPiA+PiA+IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDc6MzLigK9Q
TSBDaHVjayBMZXZlciA8Y2VsQGtlcm5lbC5vcmc+IHdyb3RlOiAgCj4gPj4gPj4KPiA+PiA+Pgo+
ID4+ID4+Cj4gPj4gPj4gT24gVGh1LCBKYW4gMTUsIDIwMjYsIGF0IDE6MTcgUE0sIEFtaXIgR29s
ZHN0ZWluIHdyb3RlOiAgCj4gPj4gPj4+IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDY6NDjigK9Q
TSBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPiB3cm90ZTogIAo+ID4+ID4+Pj4KPiA+
PiA+Pj4+IEluIHJlY2VudCB5ZWFycywgYSBudW1iZXIgb2YgZmlsZXN5c3RlbXMgdGhhdCBjYW4n
dCBwcmVzZW50IHN0YWJsZQo+ID4+ID4+Pj4gZmlsZWhhbmRsZXMgaGF2ZSBncm93biBzdHJ1Y3Qg
ZXhwb3J0X29wZXJhdGlvbnMuIFRoZXkndmUgbW9zdGx5IGRvbmUKPiA+PiA+Pj4+IHRoaXMgZm9y
IGxvY2FsIHVzZS1jYXNlcyAoZW5hYmxpbmcgb3Blbl9ieV9oYW5kbGVfYXQoKSBhbmQgdGhlIGxp
a2UpLgo+ID4+ID4+Pj4gVW5mb3J0dW5hdGVseSwgaGF2aW5nIGV4cG9ydF9vcGVyYXRpb25zIGlz
IGdlbmVyYWxseSBzdWZmaWNpZW50IHRvIG1ha2UKPiA+PiA+Pj4+IGEgZmlsZXN5c3RlbSBiZSBj
b25zaWRlcmVkIGV4cG9ydGFibGUgdmlhIG5mc2QsIGJ1dCB0aGF0IHJlcXVpcmVzIHRoYXQKPiA+
PiA+Pj4+IHRoZSBzZXJ2ZXIgcHJlc2VudCBzdGFibGUgZmlsZWhhbmRsZXMuICAKPiA+PiA+Pj4K
PiA+PiA+Pj4gV2hlcmUgZG9lcyB0aGUgdGVybSAic3RhYmxlIGZpbGUgaGFuZGxlcyIgY29tZSBm
cm9tPyBhbmQgd2hhdCBkb2VzIGl0IG1lYW4/Cj4gPj4gPj4+IFdoeSBub3QgInBlcnNpc3RlbnQg
aGFuZGxlcyIsIHdoaWNoIGlzIGRlc2NyaWJlZCBpbiBORlMgYW5kIFNNQiBzcGVjcz8KPiA+PiA+
Pj4KPiA+PiA+Pj4gTm90IHRvIG1lbnRpb24gdGhhdCBFWFBPUlRfT1BfUEVSU0lTVEVOVF9IQU5E
TEVTIHdhcyBBY2tlZAo+ID4+ID4+PiBieSBib3RoIENocmlzdG9waCBhbmQgQ2hyaXN0aWFuOgo+
ID4+ID4+Pgo+ID4+ID4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIw
MjYwMTE1LXJ1bmRnYW5nLWxlaWhnYWJlLTEyMDE4ZTkzYzAwY0BicmF1bmVyLwo+ID4+ID4+Pgo+
ID4+ID4+PiBBbSBJIG1pc3NpbmcgYW55dGhpbmc/ICAKPiA+PiA+Pgo+ID4+ID4+IFBFUlNJU1RF
TlQgZ2VuZXJhbGx5IGltcGxpZXMgdGhhdCB0aGUgZmlsZSBoYW5kbGUgaXMgc2F2ZWQgb24KPiA+
PiA+PiBwZXJzaXN0ZW50IHN0b3JhZ2UuIFRoaXMgaXMgbm90IHRydWUgb2YgdG1wZnMuICAKPiA+
PiA+IAo+ID4+ID4gVGhhdCdzIG9uZSB3YXkgb2YgaW50ZXJwcmV0aW5nICJwZXJzaXN0ZW50Ii4K
PiA+PiA+IEFub3RoZXIgd2F5IGlzICJjb250aW51aW5nIHRvIGV4aXN0IG9yIG9jY3VyIG92ZXIg
YSBwcm9sb25nZWQgcGVyaW9kLiIKPiA+PiA+IHdoaWNoIHdvcmtzIHdlbGwgZm9yIHRtcGZzIHRo
YXQgaXMgbW91bnRlZCBmb3IgYSBsb25nIHRpbWUuICAKPiA+PiAKPiA+PiBJIHRoaW5rIHdlIGNh
biBiZSBhIGxvdCBtb3JlIHByZWNpc2UgYWJvdXQgdGhlIGd1YXJhbnRlZTogVGhlIGZpbGUKPiA+
PiBoYW5kbGUgZG9lcyBub3QgY2hhbmdlIGZvciB0aGUgbGlmZSBvZiB0aGUgaW5vZGUgaXQgcmVw
cmVzZW50cy4gSXQgIAo+ID4KPiA+IDxwZWRhbnRpYyBtb2RlIGVuZ2FnZWQ+Cj4gPgo+ID4gRmls
ZSBoYW5kbGVzIG1vc3QgZGVmaW5pdGVseSBjaGFuZ2Ugb3ZlciB0aGUgbGlmZSBvZiBhIC9waHlz
aWNhbC8KPiA+IGlub2RlLiBVbmxpbmtpbmcgYSBmaWxlIGRvZXMgbm90IHJlcXVpcmUgZW5kaW5n
IHRoZSBsaWZlIG9mIHRoZQo+ID4gcGh5c2ljYWwgb2JqZWN0IHRoYXQgcHJvdmlkZXMgdGhlIHBl
cnNpc3RlbnQgZGF0YSBzdG9yZSBmb3IgdGhlCj4gPiBmaWxlLgo+ID4KPiA+IGUuZy4gWEZTIGR5
bmFtaWNhbGx5IGFsbG9jYXRlcyBwaHlzaWNhbCBpbm9kZXMgbWlnaHQgaW4gYSBsaWZlIGN5Y2xl
Cj4gPiB0aGF0IGxvb2tzIHNvbWV3aGF0IGxpZmUgdGhpczoKPiA+Cj4gPiAJYWxsb2NhdGUgcGh5
c2ljYWwgaW5vZGUKPiA+IAlpbnNlcnQgcmVjb3JkIGludG8gYWxsb2NhdGVkIGlub2RlIGluZGV4
Cj4gPiAJbWFyayBpbm9kZSBhcyBmcmVlCj4gPgo+ID4gCXdoaWxlIChkb24ndCBuZWVkIHRvIGZy
ZWUgcGh5c2ljYWwgaW5vZGUpIHsKPiA+IAkJLi4uCj4gPiAJCWFsbG9jYXRlIGlub2RlIGZvciBh
IG5ldyBmaWxlCj4gPiAJCXVwZGF0ZSBwZXJzaXN0ZW50IGlub2RlIG1ldGFkYXRhIHRvIGdlbmVy
YXRlIG5ldyBmaWxlaGFuZGxlCj4gPiAJCW1hcmsgaW5vZGUgaW4gdXNlCj4gPiAJCS4uLgo+ID4g
CQl1bmxpbmsgZmlsZQo+ID4gCQltYXJrIGlub2RlIGZyZWUKPiA+IAl9Cj4gPgo+ID4gCXJlbW92
ZSBpbm9kZSBmcm9tIGFsbG9jYXRlZCBpbm9kZSBpbmRleAo+ID4gCWZyZWUgcGh5c2ljYWwgaW5v
ZGUKPiA+Cj4gPiBpLmUuIGEgZnJlZSBpbm9kZSBpcyBzdGlsbCBhbiAtYWxsb2NhdGVkLCBpbmRl
eGVkIGlub2RlLSBpbiB0aGUKPiA+IGZpbGVzeXN0ZW0sIGFuZCB1bnRpbCB3ZSBwaHlzaWNhbGx5
IHJlbW92ZSBpdCBmcm9tIHRoZSBmaWxlc3lzdGVtCj4gPiB0aGUgaW5vZGUgbGlmZSBjeWNsZSBo
YXMgbm90IGVuZGVkLgo+ID4KPiA+IElPV3MsIHRoZSBwaHlzaWNhbCAocGVyc2lzdGVudCkgaW5v
ZGUgbGlmZXRpbWUgY2FuIHNwYW4gdGhlIGxpZmV0aW1lCj4gPiBvZiAtbWFueS0gZmlsZXMuIEhv
d2V2ZXIsIHRoZSBmaWxlc3lzdGVtIGd1YXJhbnRlZXMgdGhhdCB0aGUgaGFuZGxlCj4gPiBnZW5l
cmF0ZWQgZm9yIHRoYXQgaW5vZGUgaXMgZGlmZmVyZW50IGZvciBlYWNoIGZpbGUgaXQgcmVwcmVz
ZW50cwo+ID4gb3ZlciB0aGUgd2hvbGUgaW5vZGUgbGlmZSB0aW1lLgo+ID4KPiA+IEhlbmNlIEkg
dGhpbmsgdGhhdCBmaWxlIGhhbmRsZSBzdGFiaWxpdHkvcGVyc2lzdGVuY2UgbmVlZHMgdG8gYmUK
PiA+IGRlZmluZWQgaW4gdGVybXMgb2YgLWZpbGUgbGlmZXRpbWVzLSwgbm90IHRoZSBsaWZldGlt
ZXMgb2YgdGhlCj4gPiBmaWxlc3lzdGVtIG9iamVjdHMgaW1wbGVtZW50IHRoZSBmaWxlJ3MgcGVy
c2lzdGVudCBkYXRhIHN0b3JlLiAgCj4gCj4gRmFpciBlbm91Z2gsICJpbm9kZSIgaXMgdGhlIHdy
b25nIHRlcm0gdG8gdXNlIGhlcmUuCgpVc3VhbGx5IHRoZXJlIGlzICdnZW5lcmF0aW9uIG51bWJl
cicgY2hhbmdlcyB3aGVuIHRoZSBpbm9kZSBpcyB1c2VkIGZvcgphIG5ldyBmaWxlLgpJSVJDIHRo
ZSBvcmlnaW5hbCBuZnMgZmlsZSBoYW5kbGUgd2FzIHRoZSBtYWpvci9taW5vciBmb3IgdGhlIGRp
c2sgcGFydGl0aW9uLAp0aGUgaW5kZXggaW50byB0aGUgJ29uLWRpc2sgaW5vZGUgdGFibGUnICh0
aGUgaW5vZGUgbnVtYmVyKSBhbmQgdGhlCidnZW5lcmF0aW9uIG51bWJlcicgKGJ1dCBJJ20gc3Vy
ZSB0aGUgbGVuZ3RoIHdhcyBhIHBvd2VyIG9mIDIuLi4pLgoKSXQncyBub3Qgc3VycHJpc2luZyBV
bml4IHVzZXMgaW5vZGUgbnVtYmVyIGFuZCBmaWxlIGhhbmRsZXMuCksmUiB3b3VsZCBoYXZlIHVz
ZWQgUlNNLTExL00gd2hlcmUgJ2ZpbGUgZGlyZWN0b3J5IGxvb2t1cCcgd2FzIGEgdXNlcnNwYWNl
Cm9wZXJhdGlvbiBhbmQgdGhlIGtlcm5lbCBvbmx5IHN1cHBvcnRlZCAnb3BlbiBieSBmaWxlIGhh
bmRsZScuCkFsdGhvdWdoIHRoYXQgZ290IGxvc3QgYmV0d2VlbiB0aGVyZSBhbmQgbnRmcy4KKFdp
bmRvd3MgSU8gaXMgZGVmaW5pdGVseSBiYXNlZCBvbiBSU00tMTEvTSB0aG91Z2guKQoKCURhdmlk
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
