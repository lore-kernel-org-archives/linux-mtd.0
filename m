Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C4DC001B0
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 18:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ky2r5kAXE0gdZeqyic+D4691l8KHBqO1ZtebNEYWz7o=; b=jEqkUHYZXpXXyH
	CKQPkgcFi2EA0z6aUFZbb5RKdb2cccCt+EPs3OGido3F0CMQDwS8EZSm1dVt31HEG7xUte5Smk0ov
	RNMLSwoSn61AmZVt7zfx3IuGEdQ1gDDgdCtItz++OusYs23UglLnRnb2Xa8zKgTzb3ExIXrefIMaV
	Eu7t1kBX6qUtotMJ8tbpS/Sfw1WfVsvoQvxv8nNDAXevNqTlLo+3yQccQR0CM4FiOu902pHgMdR9y
	IZDnV/XuJx3oRyKUy5fU7ytITXvihMEZQENstFgHmAZVGioErgybzZBCO21TN4Ijxzu3l7KQe+TuJ
	e5ETdZnpYBn3XtA/mcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTo4d-005dMP-1T;
	Wed, 09 Aug 2023 18:38:23 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTo4b-005dKL-0p
	for linux-mtd@lists.infradead.org;
	Wed, 09 Aug 2023 18:38:22 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-40feecefa84so256751cf.1
        for <linux-mtd@lists.infradead.org>; Wed, 09 Aug 2023 11:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20221208.gappssmtp.com; s=20221208; t=1691606298; x=1692211098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EcmI8Rpl1R+tuyjPLJAOGmabIt197aKHT+nbD52Q1I=;
        b=BfdYdGlaV7wDLoLR9yjOQKYaMVK5G+sZo2gR8ietMzxK6/hhzrKBhXntyWFMe+Yo8W
         pXAEKi27jKY+o1GSIwlWHKByFh7VJx8vdxyzXfnpCla9dyz3P+vZbtPjJCJ8F75v4t++
         cENDUCMzciHiNczMnx810YrXJp7LJHfpO0BqiOVkILP4ZM1XP/NHiA5CqbEHPLNAnApb
         4blc5R+dkjgksSq2+K5JK9IBlHetg1olYAUJU7H7u688LciEb+01exSGkI+DT+Of4VXY
         kkHfq0UcUl8GdzevovO/osm+1AaLFSn4iK2zXa30egAa3a76m/vMuRq9Hke6KAEMMcTX
         y7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691606298; x=1692211098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EcmI8Rpl1R+tuyjPLJAOGmabIt197aKHT+nbD52Q1I=;
        b=CXmPekoHXXrt68jPgsXkKeaG+HaYDXk1wSs8XArzMa9DeQHXlEYly27gnlGz+4Smmg
         aNnRPCx2m/T2R/MbO30Im3Ybj6KRE6elg3CMMxxNBbK9+nhujHV48J4EwLzjfcjwJgjy
         UL8MsxzpUQ7qekpSHYz7y0GAAQf5i6XnEF0Bin8FhOSBa5lBkVHyJ5k9ZAqE5fd+3f/M
         v/12eqJmZ/EUrwK0tEPSTF54AQIqsRnuGTtKUr3ycJrfYDufTSbOvBypb3yRzTNEhxq8
         eOQPYjJPZElPuO+uCQmdVj20UJtIbxXepDNzlfa0TMvEc4vrgbwNw+eWTn+Mvn2ms2N0
         Cx/A==
X-Gm-Message-State: AOJu0YxB9ZCQ28oRKS5EpL0eQCfYkIHql5a1Y1uNXiXIQWWhi6+d16ZO
	W+QeKmqXkV3lLLdY/bUPrzo1SdcpyGVx6ChRFK5lLA==
X-Google-Smtp-Source: AGHT+IH2sTR1ARtIFCpkS6vqthNwZFelmGu0RmLRp1wcx6mBBfZ3SQAFevZE8DnhGTo57OILWEQYl9skWtT3uKB51ZE=
X-Received: by 2002:ac8:4e47:0:b0:3f9:c207:3123 with SMTP id
 e7-20020ac84e47000000b003f9c2073123mr166690qtw.45.1691606297822; Wed, 09 Aug
 2023 11:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-8-d1dec143a704@kernel.org> <20230809-segeln-pflaumen-460b81bd2d3a@brauner>
In-Reply-To: <20230809-segeln-pflaumen-460b81bd2d3a@brauner>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 9 Aug 2023 14:38:07 -0400
Message-ID: <CAOg9mST=WFAjEwS9eNi_huoUpBvPy3R3fbFVTLUeFZAv6BJEEQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/13] fs: drop the timespec64 argument from update_time
To: Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, 
	Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, 
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
	Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
	Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, 
	Anna Schumaker <anna@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Martin Brandenburg <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, 
	Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Amir Goldstein <amir73il@gmail.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, Benjamin Coddington <bcodding@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, 
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	cluster-devel@redhat.com, linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-mtd@lists.infradead.org, linux-mm@kvack.org, 
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_113821_509635_810C00AA 
X-CRM114-Status: GOOD (  17.21  )
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

SSd2ZSBiZWVuIGZvbGxvd2luZyB0aGlzIHBhdGNoIG9uIGZzZGV2ZWwuLi4gaXMgdGhlcmUgYQpy
ZW1vdGUgSSBjb3VsZCBmZXRjaCB3aXRoIGEgYnJhbmNoIHRoYXQgaGFzIHRoaXMgaW4gaXQ/Cgot
TWlrZQoKT24gV2VkLCBBdWcgOSwgMjAyMyBhdCA4OjMy4oCvQU0gQ2hyaXN0aWFuIEJyYXVuZXIg
PGJyYXVuZXJAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAwNywgMjAyMyBhdCAw
MzozODozOVBNIC0wNDAwLCBKZWZmIExheXRvbiB3cm90ZToKPiA+IE5vdyB0aGF0IGFsbCBvZiB0
aGUgdXBkYXRlX3RpbWUgb3BlcmF0aW9ucyBhcmUgcHJlcGFyZWQgZm9yIGl0LCB3ZSBjYW4KPiA+
IGRyb3AgdGhlIHRpbWVzcGVjNjQgYXJndW1lbnQgZnJvbSB0aGUgdXBkYXRlX3RpbWUgb3BlcmF0
aW9uLiBEbyB0aGF0IGFuZAo+ID4gcmVtb3ZlIGl0IGZyb20gc29tZSBhc3NvY2lhdGVkIGZ1bmN0
aW9ucyBsaWtlIGlub2RlX3VwZGF0ZV90aW1lIGFuZAo+ID4gaW5vZGVfbmVlZHNfdXBkYXRlX3Rp
bWUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9y
Zz4KPiA+IC0tLQo+ID4gIGZzL2JhZF9pbm9kZS5jICAgICAgICAgICB8ICAzICstLQo+ID4gIGZz
L2J0cmZzL2lub2RlLmMgICAgICAgICB8ICAzICstLQo+ID4gIGZzL2J0cmZzL3ZvbHVtZXMuYyAg
ICAgICB8ICA0ICstLS0KPiA+ICBmcy9mYXQvZmF0LmggICAgICAgICAgICAgfCAgMyArLS0KPiA+
ICBmcy9mYXQvbWlzYy5jICAgICAgICAgICAgfCAgMiArLQo+ID4gIGZzL2dmczIvaW5vZGUuYyAg
ICAgICAgICB8ICAzICstLQo+ID4gIGZzL2lub2RlLmMgICAgICAgICAgICAgICB8IDMwICsrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ID4gIGZzL292ZXJsYXlmcy9pbm9kZS5jICAgICB8
ICAyICstCj4gPiAgZnMvb3ZlcmxheWZzL292ZXJsYXlmcy5oIHwgIDIgKy0KPiA+ICBmcy91Ymlm
cy9maWxlLmMgICAgICAgICAgfCAgMyArLS0KPiA+ICBmcy91Ymlmcy91Ymlmcy5oICAgICAgICAg
fCAgMiArLQo+ID4gIGZzL3hmcy94ZnNfaW9wcy5jICAgICAgICB8ICAxIC0KPiA+ICBpbmNsdWRl
L2xpbnV4L2ZzLmggICAgICAgfCAgNCArKy0tCj4KPiBUaGlzIHdhcyBtaXNzaW5nIHRoZSBjb252
ZXJzaW9uIG9mIGZzL29yYW5nZWZzIG9yYW5nZWZzX3VwZGF0ZV90aW1lKCkKPiBjYXVzaW5nIHRo
ZSBidWlsZCB0byBmYWlsLiBTbyBhdCBzb21lIHBvaW50IGtidWlsZCB3aWxsIHllbGwgaGVyZS4K
PiBGd2l3LCBJJ3ZlIGZpeGVkIHRoYXQgdXAgaW4tdHJlZS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
