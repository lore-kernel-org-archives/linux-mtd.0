Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6745BC0015E
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 19:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiEfB9BJ6dP5mh7OLmWneoI/jvkAetzvF30ez5c2wCg=; b=Iuk/kCbauXAg8j
	AWKoelXG1NHoBMx5nFjAlepenw/tNaFzL+XkEslzcaW06L1irTcXkZEydu6ZgbHGhpmtnWsgrh8q3
	1LCkKQoK6QOUDIQhUwUv9SeUilLIkeYy12tJCyIEfrYy7/yR95fqDmFJGlDQY+gP8rlhe3aN32VVc
	kkRW83F38uU8u/lG67VX7AuqORWHXNErO00SiYz8QNDrEFqTmQ1C0PtPD+tXWtPGl5ZK7q6gDgbUV
	VmnzSZDpapntHATxl9jSNaUxWcDRfhMgy4QQ/Fp9q27cRVaCw94Hd2Yr1QquAlWhwUBvY8DY7amnn
	ULCIiNUACtniwgOIRMeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qToUw-005gHO-0G;
	Wed, 09 Aug 2023 19:05:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qToUs-005gF4-2c;
	Wed, 09 Aug 2023 19:05:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E99E6446B;
	Wed,  9 Aug 2023 19:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5CFC433C8;
	Wed,  9 Aug 2023 19:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691607929;
	bh=4GKDaia1VeW/OijfJXE9UHIufNesebWNQDy9LU2whYI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gEyeaJZ4RUWChIryvRrKWbHk6CbM8eHu0rqtHvzvba6SSDpBpPtag+D6BMw4GFw2n
	 hFXK4OEbm0L9R1B4K8eNiaiBDtquinDOVTFyiDIMSP6pKYqwvVgkMBHyc14BMMGMP8
	 zAV3KdTeX3lKcSKjE5oKnAjO29eKsnCAgTvUvEsF/+3xUpWxGZvbyls48Ed9vXaSwV
	 DcuV4QvGf703nsP6BpmM4kVysUgEr6LDinf8/zizcxdQ20sie+EHfzuPrXj/APOCtH
	 91Mo4Dg4M0l0SApVPB8n1GBtVl5sn3TKwCbUSa9ZQiDyJiArJw0iRB7MWozIYejid0
	 q+2d4Xd9I1nbw==
Message-ID: <cbc98eb171d6ccacb24213af7d0ae91094d39780.camel@kernel.org>
Subject: Re: [PATCH v7 08/13] fs: drop the timespec64 argument from
 update_time
From: Jeff Layton <jlayton@kernel.org>
To: Mike Marshall <hubcap@omnibond.com>, Christian Brauner
 <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Eric Van Hensbergen
 <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique
 Martinet <asmadeus@codewreck.org>, Christian Schoenebeck
 <linux_oss@crudebyte.com>,  David Howells <dhowells@redhat.com>, Marc
 Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li
 <xiubli@redhat.com>,  Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, Gao
 Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,  Yue Hu
 <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara
 <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger
 <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA
 Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos Szeredi <miklos@szeredi.hu>,
 Bob Peterson <rpeterso@redhat.com>, Andreas Gruenbacher
 <agruenba@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tejun Heo <tj@kernel.org>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh
 <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>, Martin Brandenburg <martin@omnibond.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, Paulo
 Alcantara <pc@manguebit.com>,  Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, Richard Weinberger
 <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>,  Hugh Dickins
 <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, Amir
 Goldstein <amir73il@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Benjamin Coddington <bcodding@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,  v9fs@lists.linux.dev,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org,  linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org,  linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,  linux-nfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 devel@lists.orangefs.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-mtd@lists.infradead.org, 
 linux-mm@kvack.org, linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org
Date: Wed, 09 Aug 2023 15:05:21 -0400
In-Reply-To: <CAOg9mST=WFAjEwS9eNi_huoUpBvPy3R3fbFVTLUeFZAv6BJEEQ@mail.gmail.com>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
	 <20230807-mgctime-v7-8-d1dec143a704@kernel.org>
	 <20230809-segeln-pflaumen-460b81bd2d3a@brauner>
	 <CAOg9mST=WFAjEwS9eNi_huoUpBvPy3R3fbFVTLUeFZAv6BJEEQ@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_120530_935676_0350FA3E 
X-CRM114-Status: GOOD (  18.71  )
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

WWVzLiBJdCdzIGluIENocmlzdGlhbidzIHZmcy5jdGltZSBicmFuY2g6CgpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92ZnMvdmZzLmdpdC9sb2cvP2g9dmZz
LmN0aW1lCgpPbiBXZWQsIDIwMjMtMDgtMDkgYXQgMTQ6MzggLTA0MDAsIE1pa2UgTWFyc2hhbGwg
d3JvdGU6Cj4gSSd2ZSBiZWVuIGZvbGxvd2luZyB0aGlzIHBhdGNoIG9uIGZzZGV2ZWwuLi4gaXMg
dGhlcmUgYQo+IHJlbW90ZSBJIGNvdWxkIGZldGNoIHdpdGggYSBicmFuY2ggdGhhdCBoYXMgdGhp
cyBpbiBpdD8KPiAKPiAtTWlrZQo+IAo+IE9uIFdlZCwgQXVnIDksIDIwMjMgYXQgODozMuKAr0FN
IENocmlzdGlhbiBCcmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gCj4gPiBP
biBNb24sIEF1ZyAwNywgMjAyMyBhdCAwMzozODozOVBNIC0wNDAwLCBKZWZmIExheXRvbiB3cm90
ZToKPiA+ID4gTm93IHRoYXQgYWxsIG9mIHRoZSB1cGRhdGVfdGltZSBvcGVyYXRpb25zIGFyZSBw
cmVwYXJlZCBmb3IgaXQsIHdlIGNhbgo+ID4gPiBkcm9wIHRoZSB0aW1lc3BlYzY0IGFyZ3VtZW50
IGZyb20gdGhlIHVwZGF0ZV90aW1lIG9wZXJhdGlvbi4gRG8gdGhhdCBhbmQKPiA+ID4gcmVtb3Zl
IGl0IGZyb20gc29tZSBhc3NvY2lhdGVkIGZ1bmN0aW9ucyBsaWtlIGlub2RlX3VwZGF0ZV90aW1l
IGFuZAo+ID4gPiBpbm9kZV9uZWVkc191cGRhdGVfdGltZS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAg
ZnMvYmFkX2lub2RlLmMgICAgICAgICAgIHwgIDMgKy0tCj4gPiA+ICBmcy9idHJmcy9pbm9kZS5j
ICAgICAgICAgfCAgMyArLS0KPiA+ID4gIGZzL2J0cmZzL3ZvbHVtZXMuYyAgICAgICB8ICA0ICst
LS0KPiA+ID4gIGZzL2ZhdC9mYXQuaCAgICAgICAgICAgICB8ICAzICstLQo+ID4gPiAgZnMvZmF0
L21pc2MuYyAgICAgICAgICAgIHwgIDIgKy0KPiA+ID4gIGZzL2dmczIvaW5vZGUuYyAgICAgICAg
ICB8ICAzICstLQo+ID4gPiAgZnMvaW5vZGUuYyAgICAgICAgICAgICAgIHwgMzAgKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICBmcy9vdmVybGF5ZnMvaW5vZGUuYyAgICAgfCAg
MiArLQo+ID4gPiAgZnMvb3ZlcmxheWZzL292ZXJsYXlmcy5oIHwgIDIgKy0KPiA+ID4gIGZzL3Vi
aWZzL2ZpbGUuYyAgICAgICAgICB8ICAzICstLQo+ID4gPiAgZnMvdWJpZnMvdWJpZnMuaCAgICAg
ICAgIHwgIDIgKy0KPiA+ID4gIGZzL3hmcy94ZnNfaW9wcy5jICAgICAgICB8ICAxIC0KPiA+ID4g
IGluY2x1ZGUvbGludXgvZnMuaCAgICAgICB8ICA0ICsrLS0KPiA+IAo+ID4gVGhpcyB3YXMgbWlz
c2luZyB0aGUgY29udmVyc2lvbiBvZiBmcy9vcmFuZ2VmcyBvcmFuZ2Vmc191cGRhdGVfdGltZSgp
Cj4gPiBjYXVzaW5nIHRoZSBidWlsZCB0byBmYWlsLiBTbyBhdCBzb21lIHBvaW50IGtidWlsZCB3
aWxsIHllbGwgaGVyZS4KPiA+IEZ3aXcsIEkndmUgZml4ZWQgdGhhdCB1cCBpbi10cmVlLgoKQ2hl
ZXJzLAotLSAKSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
