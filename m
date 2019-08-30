Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75549C3A59F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 01:24:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4861221897
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 01:24:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fdHuoul/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=omnibond-com.20150623.gappssmtp.com header.i=@omnibond-com.20150623.gappssmtp.com header.b="rsF3TnYv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4861221897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E67u2sSkq4H/rXUKp3bpHCZrakodVPkhKhSgZq3zA5A=; b=fdHuoul/wrAcfy
	S1VuojLBP5b+xPS4TqoEOOuRNjlHCg0lm/VwlYPrhMpaop3iehEMs/HY5IdCkSGgNas3xIjjQELqP
	sxKevJfh0xIzcTrBqkNGDyOJajkHARALv+OYILPCAJh4X5TPkNBAOCegtbP22mhRaNch3Lrwg8NTn
	HmuN1p3/SYHdO+Uyr2QboQVPKewR6UVO60bisef35kenwUdAzLbsVwxX3UGhJjT/YTHdj6b5Z7GkY
	cXo3n0cRu8GmZYd9O6nmmxCMj9RVgfSrxum4vMYSDl4uJDVzXpXV/E0LZN4OouOMYnvsY8xAeVMLD
	62IQ4nOL4PGHyaQO815Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Veo-0006Kj-8Q; Fri, 30 Aug 2019 01:24:54 +0000
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3Vel-0006K5-79
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 01:24:52 +0000
Received: by mail-yw1-xc42.google.com with SMTP id u141so1847228ywe.4
 for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2019 18:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4TfZVE6zvYYuoOuB/Rxqa+Mlm3vtxZPY12krCFPSTtI=;
 b=rsF3TnYvnJjkhMrqd8jgi2b1fWfnS720m/snkWNYBAl3jogwp2mEsqA8h0meBBMFCG
 mupgLKrOXopsTT3mx+lDcAZLHUPbfCw/vXrZaEIvlfIiq4H0dj/IKCul0NWP4fpGLsu4
 48Lini1zfDu9D/EL0CeWiI8kZAXrgg08x+hcJWXhpsmSN701z4+zSsQ5V2A/N+PZ/ko+
 cAveXQxi5GTfOnxm/M0L2QMcpa0QpEp0UoezlsX6vklrx1noOLsykTvVpPGdg1yASetm
 NGCTD4uF7gFM2G4DP0Fj0jWpPyOxMpJF0KkXFU1tGtaTorkpzYDBwzJA49OyfPjy95xt
 U/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4TfZVE6zvYYuoOuB/Rxqa+Mlm3vtxZPY12krCFPSTtI=;
 b=YPOIZz/+R9hEDZx83bqJyjjnVZK86RDQcWPCXk2n7oUJOL0CoyiR5d0uKI3fiSXYx4
 L4luHuSEfGOhm9znrrsBqNtLgfGcQDKwlGqmkpl5ut1GHOPv1rIfMHGCx26sVUEGZ+gI
 hX1jDN6UTublilb0jk+IWFgxmTUZaIGiMNVb5eTKDxoHNXIdF8s3NC3BSO+tmjn/Xo3L
 nppkL7D/xqpvi59suz7ya2UE70cMLjZPOjY8tTdbVo6GN6HEvGFijN8db1WAys5R1wRs
 PwUi/De8S19aZxg1PYhN80vgzha+Nz4AV7bur3lBVWl7PADnxI4D5jJbDiClrNyY/b8Z
 3aXA==
X-Gm-Message-State: APjAAAV0vaCuVYmInPYhKu2HMKqtz8IPDWKSzsfauQPSaAqRaJ8UPY21
 n8nxzleYMHPPBQZ5zLkzbamYzviblYBgwD+NYLFVWA==
X-Google-Smtp-Source: APXvYqwS/gBw6GYqWJhwCNBmHR6+W2ONQRTVjMY8ZXLyRIgVZbf1blJaiiDec2a/U/ArNO35ME5xZuocZ9cXu0GpPKQ=
X-Received: by 2002:a0d:d596:: with SMTP id x144mr9018446ywd.69.1567128290041; 
 Thu, 29 Aug 2019 18:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190827150544.151031-1-salyzyn@android.com>
 <20190828142423.GA1955@infradead.org>
 <5dd09a38-fffb-36f2-505b-be2ddf6bb750@android.com>
In-Reply-To: <5dd09a38-fffb-36f2-505b-be2ddf6bb750@android.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 29 Aug 2019 21:24:38 -0400
Message-ID: <CAOg9mSTCC4Z3RpEyppC50B+pnSBbV0sr-F7hbsM-B+z3c-AZVA@mail.gmail.com>
Subject: Re: [PATCH v8] Add flags option to get xattr method paired to
 __vfs_getxattr
To: Mark Salyzyn <salyzyn@android.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_182451_255859_1690FF6F 
X-CRM114-Status: GOOD (  18.09  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>, Christoph Hellwig <hch@infradead.org>,
 devel@lists.orangefs.org, Eric Van Hensbergen <ericvh@gmail.com>,
 Joel Becker <jlbec@evilplan.org>, Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
 selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Chris Mason <clm@fb.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Gao Xiang <gaoxiang25@huawei.com>, Eric Paris <eparis@parisplace.org>,
 ceph-devel <ceph-devel@vger.kernel.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, samba-technical@lists.samba.org,
 linux-xfs@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-erofs@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, devel@driverdev.osuosl.org,
 "J. Bruce Fields" <bfields@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 cluster-devel@redhat.com, Steve French <sfrench@samba.org>,
 V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Bharath Vedartham <linux.bhar@gmail.com>, Jann Horn <jannh@google.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
 linux-unionfs@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SSBhZGRlZCB0aGlzIHBhdGNoIHNlcmllcyBvbiB0b3Agb2YgTGludXggNS4zLXJjNiBhbmQgcmFu
IHhmc3Rlc3RzCm9uIG9yYW5nZWZzIHdpdGggbm8gcmVncmVzc2lvbnMuCgpBY2tlZC1ieTogTWlr
ZSBNYXJzaGFsbCA8aHViY2FwQG9tbmlib25kLmNvbT4KCi1NaWtlCgpPbiBXZWQsIEF1ZyAyOCwg
MjAxOSBhdCAxMDo0MCBBTSBNYXJrIFNhbHl6eW4gPHNhbHl6eW5AYW5kcm9pZC5jb20+IHdyb3Rl
Ogo+Cj4gT24gOC8yOC8xOSA3OjI0IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+IE9u
IFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDA4OjA1OjE1QU0gLTA3MDAsIE1hcmsgU2FseXp5biB3cm90
ZToKPiA+PiBSZXBsYWNlIGFyZ3VtZW50cyBmb3IgZ2V0IGFuZCBzZXQgeGF0dHIgbWV0aG9kcywg
YW5kIF9fdmZzX2dldHhhdHRyCj4gPj4gYW5kIF9fdmZzX3NldGF4dHIgZnVuY3Rpb25zIHdpdGgg
YSByZWZlcmVuY2UgdG8gdGhlIGZvbGxvd2luZyBub3cKPiA+PiBjb21tb24gYXJndW1lbnQgc3Ry
dWN0dXJlOgo+ID4gWWlrZXMuICBUaGF0IGxvb2tzIGxpa2UgYSBtZXNzLiAgV2h5IGNhbid0IHdl
IHBhc3MgYSBrZXJuZWwtb25seQo+ID4gZmxhZyBpbiB0aGUgZXhpc3RpbmcgZmxhZ3MgZmllbGQg
Zm9yIOKCiz5zZXQgYW5kIGFkZCBhIGZsYWdzIGZpZWxkCj4gPiB0byAtPmdldD8gIFBhc3Npbmcg
bWV0aG9kcyBieSBzdHJ1Y3R1cmUgYWx3YXlzIHRlbmRzIHRvIGJlIGEgbWVzcy4KPgo+IFRoaXMg
d2FzIGEgcmVzcG9uc2UgdG8gR3JlZ0tIQCBjcml0aWNpc20sIGFuIGVhcmxpZXIgcGF0Y2ggc2V0
IGp1c3QKPiBhZGRlZCBhIGZsYWcgYXMgeW91IHN0YXRlZCB0byBnZXQgbWV0aG9kLCB1bnRpbCBj
b21wbGFpbnRzIG9mIGFuCj4gZXhjZXNzaXZlbHkgbG9uZyBhcmd1bWVudCBsaXN0IGFuZCBmcmFn
aWxpdHkgdG8gYWRkIG9yIGNoYW5nZSBtb3JlCj4gYXJndW1lbnRzLgo+Cj4gU28gbWFueSB3YXlz
IGhhdmUgYmVlbiB0cmllZCB0byBza2luIHRoaXMgY2F0IC4uLiB0aGUgcmlzayB3YXMgdGFrZW4g
dG8KPiBwbGVhc2Ugc29tZSwgYW5kIHdlIG5vdyBoYXZlIGh1bmRyZWRzIG9mIHN0YWtlaG9sZGVy
cywgd2hlbiB0aGUgZmlyc3QKPiBwYXRjaCBzZXQgd2FzIGxlc3MgdGhhbiBhIGRvemVuLiBBIHJl
Y2lwZSBmb3IgZmFpbHVyZT8KPgo+IC0tIE1hcmsKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
