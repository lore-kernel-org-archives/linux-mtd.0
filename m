Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75529CE79CF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBwfmLcITtboSt6SVxDFN9Y1gWwDR+s2O6aQyXxgn+A=; b=padbEeC1LkA2Gj
	a0hQmqjqPzAkpeGCcEzMMUnytHkFW+FwIyRCfwKMinQUD5ZjbpAQgsnSKprfFHl/vdglpX95Xy840
	dNIDk4JxnRPYUJ87ojMa6RKdk2rpEkyBaIfwr7DHG7ecg0sz4hQrs6rWqpK7C1W7bQMgmVNNrHozR
	Bp7AN4gOs3yn2NkWWY0cqLBXjxPNDaGrQIofzNhLr8RK4BtbA3UNxOsL+5yF5fSC8jFpAPAQbL5i8
	nszGlMb56QI6D2F0tuotubAURAF0uLp7xasPBsRSJXs9ofn19dZA09Y4qakw8gKHInECD3k9Yw/jG
	e5SM39XV2wluPl+yM7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiweK-0035Rw-1Z;
	Wed, 20 Sep 2023 12:49:48 +0000
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiweH-0035Qd-0F;
	Wed, 20 Sep 2023 12:49:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1695214142; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KK4wxmcg11bDhbWnUFC83uZ811y/mpb0I1TmJbK4Xk4jnQh4eSC/Y+vtwGlPKLxw9f
    ZQJV08gwelI0hs7Nko3i2MdGYFFoM9tT1tP4c6kr2+FD/bMZ5Us4S1IamSJP7z2u2Tni
    VGrvJR9cFI9cNWYNVXlV4wEMgQPoFUsGO26ode4TY1Iyrfpxra0unC1MrVpv8ibEB9+j
    zFGTjBklu569rK9lelqLmPbUbCvydW08SWCBN0VIPOuJD6DxdrrJwE7b+oQvIZvbb2gB
    gvGEBEb/Y1uiuRnorDANT4ornmti5i01W1zbKwyhST0ousOicmaYHuksmnMxb6uUQJSc
    GcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1695214142;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=zlon1NnZN5jZFLvNv3xx2YjDrrfzc/zzmMPbj7gP0jk=;
    b=d2z+l5GTzEzeupyyKoEO/+801nRO2I8xrBbgDMbJ0FszbQsZ7OWKerKKY869DbFMSr
    DA55dD3c8Iy22q32azarKo9LmVUAE/wwLMEkbofjeQtY2NHv5KyEQ5lCwDIcZj6/Dssl
    rR06w99QqJPCaVp01TF7Yn083P4ftn6AoEorFHVtk+giqDT7I9UeWxfbrgljCBX0K9NB
    27KHTBXszEyKAusPHW96Eg39CS+TryRIAsU+dqtvvDkSuODIRZZtwIQ1GsA7NETvfjHn
    VcnTxIDslnv+v3qX0yKYPfHAa3QFZGq2mRblvL54+mqYfwy9M1pc+w1udoTKxkxma9Q+
    sJBw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1695214142;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=zlon1NnZN5jZFLvNv3xx2YjDrrfzc/zzmMPbj7gP0jk=;
    b=O12Jm8BsjyLsoq3xcyYi16mtuh91ZCa5znbPcUnLqZstPIUAkcvAVtfQJ5y2yLTnkG
    Bbd1Vjx8o91hiawH0LIwFIUvSMwyAjpO+JZjkt3g+Qpq83IYi33H61+PZsHsDjUPV+gY
    5VkfMVdagu9bFaEq9tpHPC8aYSffOTVdZHc9t/Mr9BI62tRv6l/vCIVCxLdoBqlXpQ01
    P1/x918UXZr3OP5PUsCgWe+NPzvAlgR7TOhOMxOk5E0RnLfQmpNp6vkh2VWa4G4mfKF1
    8rEFhafAogS/DwPxgDZRaiLuEskuztanzAxVYeOjpAoKDywwLsnNuTQKZWxS/0d3sF8x
    RUJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1695214142;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=zlon1NnZN5jZFLvNv3xx2YjDrrfzc/zzmMPbj7gP0jk=;
    b=muQUVTl0scIb2+N29B0TOhmsUwAw8Fpx6zlqzw9owQDn3QGFXl2h7ouqcgMeKa+h7z
    NeiR9RifaRHNd7IhFiCQ==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpPHj6eWWaUQFt689wZebbvySt9BLA=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.8.2 AUTH)
    with ESMTPSA id m03934z8KCmwmFD
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 20 Sep 2023 14:48:58 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: Xi Ruoyao <xry111@linuxfromscratch.org>, bug-gnulib@gnu.org, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos Szeredi <miklos@szeredi.hu>, Bo b Peterson <rpeterso@redhat.com>, Andreas Gruenbacher <agruenba@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, Amir Goldstein <l@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>, Benjamin Coddington <bcodding@redhat.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com, linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-mtd@lists.infradead.org, linux-mm@kvack.org, linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v7 12/13] ext4: switch to multigrain timestamps
Date: Wed, 20 Sep 2023 14:48:57 +0200
Message-ID: <5317021.Rkz2Fa4CmG@nimes>
In-Reply-To: <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org> <20230920101731.ym6pahcvkl57guto@quack3> <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_054945_261348_752D895B 
X-CRM114-Status: GOOD (  15.27  )
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

SmVmZiBMYXl0b24gd3JvdGU6Cj4gPiBTdXJlbHkgdGhpcyBpcyBhIHNhZmUgY2hvaWNlIGFzIGl0
IG1vdmVzIHRoZSByZXNwb25zaWJpbGl0eSB0byB0aGUgc3lzYWRtaW4KPiA+IGFuZCB0aGUgY2Fz
ZXMgd2hlcmUgZmluZWdyYWluZWQgdGltZXN0YW1wcyBhcmUgcmVxdWlyZWQuIEJ1dCBJIGtpbmQg
b2YKPiA+IHdvbmRlciBob3cgaXMgdGhlIHN5c2FkbWluIGdvaW5nIHRvIGRlY2lkZSB3aGV0aGVy
IG1ndGltZSBpcyBzYWZlIGZvciBoaXMKPiA+IHN5c3RlbSBvciBub3Q/IEJlY2F1c2UgdGhlIHBv
c3NpYmxlIGJyZWFrYWdlIG5lZWRuJ3QgYmUgb2J2aW91cyBhdCB0aGUKPiA+IGZpcnN0IHNpZ2h0
Li4uCj4gCj4gVGhhdCdzIHRoZSBtYWluIHJlYXNvbiBJIHJlYWxseSBkaWRuJ3Qgd2FudCB0byBn
byB3aXRoIGEgbW91bnQgb3B0aW9uLgo+IERvY3VtZW50aW5nIHRoYXQgbWF5IGJlIGRpZmZpY3Vs
dC4KCllvdSBjb3VsZCBkb2N1bWVudCBpdCBsaWtlIHRoaXM6CgogIFRoZSBtZ3RpbWUgb3B0aW9u
IGVuYWJsZXMgbW9yZSBwcmVjaXNlIG1vZGlmaWNhdGlvbiB0aW1lcyAobXRpbWUpCiAgb24gc29t
ZSBmaWxlcywgdG9nZXRoZXIgd2l0aCBhbiBvcHRpbWl6YXRpb24gdGhhdCBsaW1pdHMgdGhlIGFt
b3VudAogIG9mIG1ldGFkYXRhIGNoYW5nZXMuCiAgTm90ZSB0aGF0IHRoaXMgb3B0aW9uIG1heSwg
aW4gc29tZSBjYXNlcywgYWZ0ZXIgd3JpdGluZyB0byBmaWxlIEYxCiAgYW5kIHRoZW4gd3JpdGlu
ZyB0byBmaWxlIEYyLCByZXBvcnQgYSBsb3dlciBtdGltZSBmb3IgRjIgdGhhbiBmb3IgRjIuCiAg
RW5hYmxpbmcgdGhpcyBvcHRpb24gbWF5IGJlIHVzZWZ1bCBvbiBmaWxlIHN5c3RlbXMgc2hhcmVk
IHZpYSBORlMuCiAgVGhlIHNhZmUgY2hvaWNlIGlzIHRvIGRpc2FibGUgdGhpcyBvcHRpb24uCgpG
b3IgbWUgYXMgYSB1c2VyLCB0aGVyZSdzIG5vIG5lZWQgdG8gZ28gaW50byBtb3JlIGRldGFpbHMg
dGhhbiB0aGF0LgoKSXQncyBpbXBvcnRhbnQgdG8gaGF2ZSB0aGlzIG1vdW50IG9wdGlvbiwgZm9y
IHBlb3BsZSB3aG8gd2FudCBtYXhpbXVtCnJlbGlhYmlsaXR5LiBQZXJzb25hbGx5LCBJIGFsd2F5
cyBlbmFibGUgdGhlICdzdHJpY3RhdGltZScgb3B0aW9uIG9uCmFsbCBleHQ0IG1vdW50cywgc2lu
Y2UgJ3JlbGF0aW1lJyBvcHRpbWl6ZXMgdG9vIG11Y2ggZm9yIG15IHVzZS1jYXNlcy4KSWYgSSBm
ZWFyIHdyb25nIHJlc3VsdHMgb2YgIm1ha2UiIHJ1bnMsIEkgd2lsbCBkZWZpbml0ZWx5IG9wdCBm
b3IgdGhlCnNhZmUgY2hvaWNlIHJlZ2FyZGluZyBtZ3RpbWUgYXMgd2VsbCDigJQgc2luY2UgSSBk
b24ndCB3YW50IHRvIHNwZW5kCmhvdXJzIGRlYnVnZ2luZyBiaW5hcmllcyB0aGF0IHdlcmUgYnVp
bHQgaW5jb3JyZWN0bHkgZnJvbSBjb3JyZWN0CnNvdXJjZSBjb2RlLgoKQnJ1bm8KCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
