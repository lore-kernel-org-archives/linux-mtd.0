Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC64D46607
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 18:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bETBsSfSezvfdI5BK31IlFh/krueMO0rJmgYyeyT01I=; b=pbIHgzDNpwO7rr
	f+glBUhKFA6VuIMn7yqIhdJt8nwOsJFWZS19wxWUwZAJpmtD5B1me+Ypc+sYny2lb/CBXZcUyiCu3
	ZbYfGkWbdCh4WoAV7PTVFuJ8lmYF43Ejn8rBOX954I7Y8HVXjkURv/njqTBY2QTkGAHd4Nvygj6Hr
	4OjkOU72EeGf14EDhiIJOCpYSXs0ZUFwnlpPXyO0Fo7lxpmRaBOczZuYDld36E/f3JZuSQU4qTMfh
	tXSbwonW6SwJh1EtENfhGvxaGXJIyf/s0pnVz3UOfChjnHfM1kq/M0dF750RNW4dpJIeBmPJQ+PAt
	GygQG0zI4ivLajYU2ZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRz2-0000000Cx6E-1adn;
	Thu, 15 Jan 2026 18:22:12 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRz0-0000000Cx5k-12Tc
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 18:22:11 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so1907074a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 10:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768501328; x=1769106128; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7IY8l2+i1WeuEXvkGd5lYKI5+uHV9G4YufUEOTseco=;
        b=NKfkPfezPpZcAAbcctztyymtmSvc4DnaMbWOl4LfK1bJinWPslT5w6cpQ2qQmON5pK
         s1RMay8aEwEpUDIw8BHyhVnQl1NkNghkGc/Bkr2OIbiKAD4kcKGVFfnvTdtEQp5rzOVe
         aRf8nLjwZKFyMXlItkUdcCY+jy/kgh/9/SylWzZnMVR6APiqSsup2ueFmggvzH89flBK
         6ZZwVg5Rl1BPpMgT2MNOhtZnNsfxATgu+ThhG2gYLGnGg0n0quTrfKzRbk7Bf6+puawd
         M9/xbtGsg4nYhLaunoyF39JN4KlPBB6luBILQ2jpN5BdWq4Ke9EndrXN818MS0Z1i87/
         F7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768501328; x=1769106128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d7IY8l2+i1WeuEXvkGd5lYKI5+uHV9G4YufUEOTseco=;
        b=bOV1SM4l9GBiKKNiXQOiihwmskePXa2FtjBJtWjBQqURd4lX/pKesP7/HvrTLWkBZD
         2loS0oD1QYCELlrFbC3BVhPd47NeKOePv6KhyBt1mjm3q+Tu4D3DGZB15hj0l2gZ4TsZ
         8M9PpTYAuNS2vyKAeJu2F3Q6+EMCQPWYD3dPBYgH3x53CBV+omM9FL+mi79dz8vlB034
         +dUZ1fZiOKv0JdDi0Nbfe7RHlFf1ZsQz0uxRXejVXRumckYRh2bTvrwSNfv4+o6U9RVI
         wQHrvWvZj9ldNEPcUsDCUq1aDeEseIFVEu/m+OdfONSsZSyzkPxW5Ton5Z9ZkLbDupnZ
         ZPRw==
X-Forwarded-Encrypted: i=1; AJvYcCUFGC3NY7lSAOEhp3CI3ddjat6ozZUeOCQgQhtUXt94wWrEvOTgLE91+D5j9L/roS2NGuzQHMqfF/0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxps7wuz+vw4ZnWh+NOhAjTpIlS9plpXt84R5ptxGtsQ1EipBpQ
	2APD/1z0u2dJ+hSgEt31k9yO8KpR1kDQFF8o+9/Tekzlr2QJSwFUr7friz2VhrBwZZxJ1CyBLMJ
	Qt8AvY6ihZ/wMOLv/Osl25Eehb+Y8MkU=
X-Gm-Gg: AY/fxX7Mti4gA+h6CqJ65xah+HUNw9weaYG9+Hz74F9kOar/eCOXw5jzq3rSSim6/wA
	SqQ+pEOJRGgOb9QQxccKYHMZBgWadTYK5qBFOYAfjvLfZjPEvnTxhThZCFZ3JKLd78vLLM276hV
	ptMFGVOIWCi0Bc6xkP0bIQWK6wW4oif2UJ1CAkyjtNlUGeXSEl+TFKtN2w7agH64So5PmeJmMFO
	agLXQRYkmgMzJMR9FIf6wWqhf1ZhRNTPtRiam+dM32Jn+o+poMSRK/IFe+V2yDmy/8ne1/TDhPW
	VmQM9TfkES+l6d3NjaQx6/GQEu8CTA==
X-Received: by 2002:a05:6402:2812:b0:64b:3f56:55c9 with SMTP id
 4fb4d7f45d1cf-65452cca336mr319308a12.26.1768501327990; Thu, 15 Jan 2026
 10:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org> <20260115-exportfs-nfsd-v1-16-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-16-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 19:21:56 +0100
X-Gm-Features: AZwV_Qjyapjv6JnFBHXmI5sSMthIqKsr1O8J34VK_oMMrDctP8UVkm6G-xvI8HQ
Message-ID: <CAOQ4uxhnxipJcjznEoa_D2R91NDZRgT_TTouGA4PGJO-7R9spw@mail.gmail.com>
Subject: Re: [PATCH 16/29] ovl: add EXPORT_OP_STABLE_HANDLES flag to export operations
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
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
X-CRM114-CacheID: sfid-20260115_102210_302491_C1076978 
X-CRM114-Status: GOOD (  15.04  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OeKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWRkIHRoZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgZmxh
ZyB0byBvdmVybGF5ZnMgZXhwb3J0IG9wZXJhdGlvbnMgdG8gaW5kaWNhdGUKPiB0aGF0IHRoaXMg
ZmlsZXN5c3RlbSBjYW4gYmUgZXhwb3J0ZWQgdmlhIE5GUy4KPgo+IFNpZ25lZC1vZmYtYnk6IEpl
ZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGZzL292ZXJsYXlmcy9leHBv
cnQuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2ZzL292ZXJsYXlmcy9leHBvcnQuYyBiL2ZzL292ZXJsYXlmcy9leHBvcnQuYwo+IGlu
ZGV4IDgzZjgwZmRiMTU2NzQ5ZTY1YTRlYTBhYjcwOGNiZmYzMzhkYWNkYWQuLjE3YzkyYTIyODEy
MGUxODAzMTM1Y2MyYjRmZTQxODBmNWUzNDNmODggMTAwNjQ0Cj4gLS0tIGEvZnMvb3ZlcmxheWZz
L2V4cG9ydC5jCj4gKysrIGIvZnMvb3ZlcmxheWZzL2V4cG9ydC5jCj4gQEAgLTg2NSw5ICs4NjUs
MTEgQEAgY29uc3Qgc3RydWN0IGV4cG9ydF9vcGVyYXRpb25zIG92bF9leHBvcnRfb3BlcmF0aW9u
cyA9IHsKPiAgICAgICAgIC5maF90b19wYXJlbnQgICA9IG92bF9maF90b19wYXJlbnQsCj4gICAg
ICAgICAuZ2V0X25hbWUgICAgICAgPSBvdmxfZ2V0X25hbWUsCj4gICAgICAgICAuZ2V0X3BhcmVu
dCAgICAgPSBvdmxfZ2V0X3BhcmVudCwKPiArICAgICAgIC5mbGFncyAgICAgICAgICA9IEVYUE9S
VF9PUF9TVEFCTEVfSEFORExFUywKPiAgfTsKPgo+ICAvKiBlbmNvZGVfZmgoKSBlbmNvZGVzIG5v
bi1kZWNvZGFibGUgZmlsZSBoYW5kbGVzIHdpdGggbmZzX2V4cG9ydD1vZmYgKi8KPiAgY29uc3Qg
c3RydWN0IGV4cG9ydF9vcGVyYXRpb25zIG92bF9leHBvcnRfZmlkX29wZXJhdGlvbnMgPSB7Cj4g
ICAgICAgICAuZW5jb2RlX2ZoICAgICAgPSBvdmxfZW5jb2RlX2ZoLAo+ICsgICAgICAgLmZsYWdz
ICAgICAgICAgID0gRVhQT1JUX09QX1NUQUJMRV9IQU5ETEVTLAo+ICB9Owo+CgpBY3R1YWxseSwg
c2VlIGNvbW1lbnQgYWJvdmU6Ci8qIGVuY29kZV9maCgpIGVuY29kZXMgbm9uLWRlY29kYWJsZSBm
aWxlIGhhbmRsZXMgd2l0aCBuZnNfZXhwb3J0PW9mZiAqLwoKVGhhdCdzIHRoZSB2YXJpYW50IG9m
IGV4cG9ydF9vcHMgd2hlbiBvdmVybGF5ZnMgY2Fubm90IGJlIG5mcyBleHBvcnRlZApiZWNhdXNl
IGl0cyBlbmNvZGVkIGZpbGUgaGFuZGxlcyBjYW4gY2hhbmdlIGFmdGVyIGNvcHl1cCtyZWJvb3Qu
CgpUaGFua3MsCkFtaXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
