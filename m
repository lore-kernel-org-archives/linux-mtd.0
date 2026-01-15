Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0173D4661C
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 19:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjjPEwCIZHpK5TMLBRiU3shjnvMhXrXEUQDBt6rVg0k=; b=ETmsi886vJku4v
	VzrNjBRPVmF2/W5dmF+bgaOe1uzNhKzqTuj7kAFD3ezxp39ShLOvzMaQwTIErp+xhlzg6YJLCBUaC
	sn88ehNXypyDp6YN7RjU7UfoYLsm4wDOMPcUf3+pPvFxc3rmHtUev5AwaPl5XqstOtmu7a+UAMtl3
	bLrbvCU7yZtm509VdS12EiZEItbXFXSrENx0ZVb5UWnRlY5mvAvG++aB5oxcDONekGaDj1W9x+pwq
	xZKlOy+YJk+5a31WjbLy+BtgZ4Bj3Pv3xFJh3KlsjItSAmjt/pfYzXQSeK3yKsRZNVT6FmeRGTUgF
	PqktwM4C/5w4KOhHjfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTJn-0000000D65y-1eFD;
	Thu, 15 Jan 2026 19:47:43 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTJl-0000000D65D-1GMX
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 19:47:42 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso2825327a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 11:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768506459; x=1769111259; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/OO8RKyY0YoEvp6ZTLVXNCVFpOv1g0hFAjXGWT4AHc=;
        b=BKZQhfnQW41OEuDu2Y0dApr4pORWHemD5Co96vRqe1UQawlPEZSNcmpyy82JWNa2gl
         eWn1Wv1nwNUg3BEQd2LvgNPe1sfucEeecFy2Cvg0K9S1wzw7WnpGXa38i1oW4kFFf0lc
         fcRQffTK3483HjorObGfZtvgADDjZfKf3ydUvQ2FzAXihhigaUNNGvon3rW7U/CyQfAk
         LIAN4zOntTPnwImi9LD0jnF0EWP46S+yS0kYrWHkcejvubUIqIJnq8S8GWngYwEk32aj
         aoKXfWmuiMN8ijvUrhTNU7Vz8/IOybC6uGRvw+Q6QqORuRkrfE54hd+qH1Wcx6WguMFm
         i4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506459; x=1769111259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/OO8RKyY0YoEvp6ZTLVXNCVFpOv1g0hFAjXGWT4AHc=;
        b=n30gdGhS5/nytOELXwTWhOgmhUeHSwy840IIKu5Zv6PziBrD6nn3sdtkSDQBTrX8Un
         gBYGmWxf2lsC2vEs01vQfQlENiJY4AOJzXWqiV+SzeHXVUC+yAwilEhIYnoeNKOwsKEe
         2IJL5B7YQ3zQegqC70rTTO6wXxD6Ay8v8yIctJc7uLANct6EM01Cb44XQLShGZEzS4wo
         ggFjr+nIEkFEluQIEYiy9Hw99ZqNShdaaVi0gynOdlvDymCBICIuStub05c2Qo9hmO5L
         PbKxC/ltxjlP6/bLvxRDlDf917p6z/jz/8Qt+cp2H9etToWKjVmu0IpGczJ28Rr9huou
         aNEg==
X-Forwarded-Encrypted: i=1; AJvYcCUg+ftMlTze2jx1tV58eYIZ+uQNGeE4qOA3n60zGIeAnauiD7Jfle3U6CoxAyzxCNdsn1J5Xc9O4Zw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1RY0hZiS/ppupEK6WwXj5/D7uD3mFZYIK12X8nzPb/YCVAHcW
	VtfRtovXRPAY2zRIDadL0V9KUb1Gu0NC4dPXCZSJ38EYOe+fG90Mg8MaMdJkTziuaS1IOkYJM+x
	+6bpd3YAoo6qbKml1O8/0W9nIEO0irsE=
X-Gm-Gg: AY/fxX6Frjwliuyq+5k7tqkJygA64/E/RGuS4pIsixGbI9WkLQL6Xia/9lpkOujzoOX
	6MulxVDb1ItCszA04D+irmuydaPowMHM57sD2bAuKWJLM5uF02gkMS0mLEnjSQ9P3uGXhLBMRCb
	hdDLw/RKw8AGU0pUV1d7tcpkIUkYLgxMUbmjmeukiv3NM/ZVVvHH51SepxpuYQLAE1t7GfR/6jC
	P3KB9PLd4SdT4Yd3HPHRP1B0wGwo84ipfWKq4l1zTtv6X6au6vG2wXUoepfUiW7qE1fSg66FKHG
	l3TbKV+pXMqld87fG3DY+BA4zdXMuQ==
X-Received: by 2002:a05:6402:268e:b0:64b:7231:da3d with SMTP id
 4fb4d7f45d1cf-654b955cf01mr167575a12.9.1768506459177; Thu, 15 Jan 2026
 11:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com> <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
 <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
In-Reply-To: <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:47:27 +0100
X-Gm-Features: AZwV_QhMfL4hQaeUnA-dk4TL1Qjc8lTmxpbV_QcnWyLhkyyZFquuhwL6kPGc4Cw
Message-ID: <CAOQ4uxhtorpd6FVsaGO=NdRD72MxeDyabip84ctQYSNufobS8w@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
To: Chuck Lever <cel@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Chuck Lever <chuck.lever@oracle.com>, 
	NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
	Tom Talpey <tom@talpey.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Theodore Tso <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>, 
	Carlos Maiolino <cem@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
	Andreas Gruenbacher <agruenba@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-xfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org, 
	devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_114741_393107_13FC41EC 
X-CRM114-Status: GOOD (  30.02  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgODozN+KAr1BNIENodWNrIExldmVyIDxjZWxAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiAxLzE1LzI2IDI6MTQgUE0sIEFtaXIgR29sZHN0ZWluIHdyb3Rl
Ogo+ID4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNzozMuKAr1BNIENodWNrIExldmVyIDxjZWxA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+Pgo+ID4+Cj4gPj4gT24gVGh1LCBKYW4gMTUsIDIw
MjYsIGF0IDE6MTcgUE0sIEFtaXIgR29sZHN0ZWluIHdyb3RlOgo+ID4+PiBPbiBUaHUsIEphbiAx
NSwgMjAyNiBhdCA2OjQ44oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPj4+Pgo+ID4+Pj4gSW4gcmVjZW50IHllYXJzLCBhIG51bWJlciBvZiBmaWxlc3lzdGVt
cyB0aGF0IGNhbid0IHByZXNlbnQgc3RhYmxlCj4gPj4+PiBmaWxlaGFuZGxlcyBoYXZlIGdyb3du
IHN0cnVjdCBleHBvcnRfb3BlcmF0aW9ucy4gVGhleSd2ZSBtb3N0bHkgZG9uZQo+ID4+Pj4gdGhp
cyBmb3IgbG9jYWwgdXNlLWNhc2VzIChlbmFibGluZyBvcGVuX2J5X2hhbmRsZV9hdCgpIGFuZCB0
aGUgbGlrZSkuCj4gPj4+PiBVbmZvcnR1bmF0ZWx5LCBoYXZpbmcgZXhwb3J0X29wZXJhdGlvbnMg
aXMgZ2VuZXJhbGx5IHN1ZmZpY2llbnQgdG8gbWFrZQo+ID4+Pj4gYSBmaWxlc3lzdGVtIGJlIGNv
bnNpZGVyZWQgZXhwb3J0YWJsZSB2aWEgbmZzZCwgYnV0IHRoYXQgcmVxdWlyZXMgdGhhdAo+ID4+
Pj4gdGhlIHNlcnZlciBwcmVzZW50IHN0YWJsZSBmaWxlaGFuZGxlcy4KPiA+Pj4KPiA+Pj4gV2hl
cmUgZG9lcyB0aGUgdGVybSAic3RhYmxlIGZpbGUgaGFuZGxlcyIgY29tZSBmcm9tPyBhbmQgd2hh
dCBkb2VzIGl0IG1lYW4/Cj4gPj4+IFdoeSBub3QgInBlcnNpc3RlbnQgaGFuZGxlcyIsIHdoaWNo
IGlzIGRlc2NyaWJlZCBpbiBORlMgYW5kIFNNQiBzcGVjcz8KPiA+Pj4KPiA+Pj4gTm90IHRvIG1l
bnRpb24gdGhhdCBFWFBPUlRfT1BfUEVSU0lTVEVOVF9IQU5ETEVTIHdhcyBBY2tlZAo+ID4+PiBi
eSBib3RoIENocmlzdG9waCBhbmQgQ2hyaXN0aWFuOgo+ID4+Pgo+ID4+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIwMjYwMTE1LXJ1bmRnYW5nLWxlaWhnYWJlLTEyMDE4
ZTkzYzAwY0BicmF1bmVyLwo+ID4+Pgo+ID4+PiBBbSBJIG1pc3NpbmcgYW55dGhpbmc/Cj4gPj4K
PiA+PiBQRVJTSVNURU5UIGdlbmVyYWxseSBpbXBsaWVzIHRoYXQgdGhlIGZpbGUgaGFuZGxlIGlz
IHNhdmVkIG9uCj4gPj4gcGVyc2lzdGVudCBzdG9yYWdlLiBUaGlzIGlzIG5vdCB0cnVlIG9mIHRt
cGZzLgo+ID4KPiA+IFRoYXQncyBvbmUgd2F5IG9mIGludGVycHJldGluZyAicGVyc2lzdGVudCIu
Cj4gPiBBbm90aGVyIHdheSBpcyAiY29udGludWluZyB0byBleGlzdCBvciBvY2N1ciBvdmVyIGEg
cHJvbG9uZ2VkIHBlcmlvZC4iCj4gPiB3aGljaCB3b3JrcyB3ZWxsIGZvciB0bXBmcyB0aGF0IGlz
IG1vdW50ZWQgZm9yIGEgbG9uZyB0aW1lLgo+Cj4gSSB0aGluayB3ZSBjYW4gYmUgYSBsb3QgbW9y
ZSBwcmVjaXNlIGFib3V0IHRoZSBndWFyYW50ZWU6IFRoZSBmaWxlCj4gaGFuZGxlIGRvZXMgbm90
IGNoYW5nZSBmb3IgdGhlIGxpZmUgb2YgdGhlIGlub2RlIGl0IHJlcHJlc2VudHMuIEl0Cj4gaGFz
IG5vdGhpbmcgdG8gZG8gd2l0aCB3aGV0aGVyIHRoZSBmaWxlIHN5c3RlbSBpcyBtb3VudGVkLgo+
Cj4KPiA+IEJ1dCBJIGFtIGNvbmZ1c2VkLCBiZWNhdXNlIEkgd2VudCBsb29raW5nIGZvciB3aGVy
ZSBKZWZmIHNhaWQgdGhhdAo+ID4geW91IHN1Z2dlc3RlZCBzdGFibGUgZmlsZSBoYW5kbGVzIGFu
ZCB0aGlzIGlzIHdoYXQgSSBmb3VuZCB0aGF0IHlvdSB3cm90ZToKPiA+Cj4gPiAidG1wZnMgZmls
ZWhhbmRsZXMgYWxpZ24gcXVpdGUgd2VsbCB3aXRoIHRoZSB0cmFkaXRpb25hbCBkZWZpbml0aW9u
Cj4gPiAgb2YgcGVyc2lzdGVudCBmaWxlaGFuZGxlcy4gdG1wZnMgZmlsZWhhbmRsZXMgbGl2ZSBh
cyBsb25nIGFzIHRtcGZzIGZpbGVzIGRvLAo+ID4gIGFuZCB0aGF0IGlzIGFsbCB0aGF0IGlzIHJl
cXVpcmVkIHRvIGJlIGNvbnNpZGVyZWQgInBlcnNpc3RlbnQiLgo+Cj4gSSBjaGFuZ2VkIG15IG1p
bmQgYWJvdXQgdGhlIG5hbWUsIGFuZCBJIGxldCBKZWZmIGtub3cgdGhhdCBwcml2YXRlbHkKPiB3
aGVuIGhlIGFza2VkIG1lIHRvIGxvb2sgYXQgdGhlc2UgcGF0Y2hlcyB0aGlzIG1vcm5pbmcuCj4K
Pgo+ID4+IFRoZSB1c2Ugb2YgInN0YWJsZSIgbWVhbnMgdGhhdCB0aGUgZmlsZSBoYW5kbGUgaXMg
c3RhYmxlIGZvcgo+ID4+IHRoZSBsaWZlIG9mIHRoZSBmaWxlLiBUaGlzIC9pcy8gdHJ1ZSBvZiB0
bXBmcy4KPiA+Cj4gPiBJIGNhbiBsaXZlIHdpdGggU1RBQkxFX0hBTkRMRVMgSSBkb24ndCBtaW5k
IGFzIG11Y2gsCj4gPiBJIHVuZGVyc3RhbmQgd2hhdCBpdCBtZWFucywgYnV0IHRoZSBkZWZpbml0
aW9uIGFib3ZlIGlzIGludmVudGVkLAo+ID4gd2hlcmVhcyB0aGUgdGVybSBwZXJzaXN0ZW50IGhh
bmRsZXMgaXMgd2VsbCBrbm93biBhbmQgd2VsbCBkZWZpbmVkLgo+Cj4gQW5vdGhlciByZWFzb24g
bm90IHRvIGFkb3B0IHRoZSBzYW1lIHRlcm1pbm9sb2d5IGFzIE5GUyBpcyB0aGF0Cj4gc29tZW9u
ZSBtaWdodCBjb21lIGFsb25nIGFuZCBpbXBsZW1lbnQgTkZTdjQncyBWT0xBVElMRSBmaWxlCj4g
aGFuZGxlcyBpbiBMaW51eCwgYW5kIHRoZW4gc2F5ICJPSywgL25vdy8gY2FuIHdlIGV4cG9ydCBj
Z3JvdXBmcz8iCj4gQW5kIHRoZW4gTGludXggd2lsbCBiZSBzdHVjayB3aXRoIG92ZXJsb2FkZWQg
dGVybWlub2xvZ3kgYW5kIHdlJ2xsCj4gc3RpbGwgd2FudCB0byBzYXkgIk5PLCBORlMgZG9lc24n
dCBzdXBwb3J0IGNncm91cGZzIi4KPgo+IEp1c3QgYSByYW5kb20gdGhvdWdodC4KCkdvb2QgYXJn
dW1lbnQuIEknbSBmaW5lIHdpdGggc3RhYmxlIGFzIHdlbGwgOikKClRoYW5rcywKQW1pci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
