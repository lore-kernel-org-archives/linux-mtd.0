Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707C7D4660B
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bG3kSdBei3eC4c1rZw9URJ4YcpONAf0CM2/Mzfy/IU=; b=LDcYKqCV8C+/tx
	MIC4QVtLl6xjjcwtM2YOp3l7OYHCr+wytvOIxepch48Ycje+13iFJRD+mKNGeRWhAJrK77aGbL8e2
	WJIzkRI+4l2krs24AXkB4mFgsAUFhfwE4yRQ8QyYqQx2F1tZQ/9BxMImWMDqGTPbifSLitH8g+Z4e
	eJDvbNZnu7oU294x6zVXdzW9upb/thvUkWQXGybWtXoDlnSXeHRCdRXqe/RR/eLOFXkkJwg8U3/Bf
	Y9ET4HEzukdUE4Un271RPhyTBTKeAhJ9hUBA/DwPdjhJdZyJR1YkFUcHSL7tm/adluVBX2hbhqrYF
	mEz5Thrv4skxrf9HkMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRup-0000000CwfA-3FMy;
	Thu, 15 Jan 2026 18:17:51 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRun-0000000CweR-0xl8
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 18:17:50 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64ba9a00b5aso1741337a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 10:17:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768501067; cv=none;
        d=google.com; s=arc-20240605;
        b=d8WEjg/9oTSWzWVQktoKj6+rV+rzAL8lCZSI8kh94F7zvDuEAseR6W1kGP+LaL3oq8
         RvLnQ1W6LnzhngdWwE6pyhRVFfkb5r7e8FRnb/kpRjvXSYzTwn9RcpSMg558uOtO2pgJ
         DX0vuIRD2e0su65HjZGNTpiwfL4gJmZ65+lYiwaCmvHH+DjGkxwBmODGtr5/P06ucnaJ
         vzWnLQgJYMOallnWBKYa1fJf5Dtc5Cl1wTyhETO+u6uAYwbNajexmHbrFJq0fy0i05BV
         +Dn1GbdCRZ4O4iVWqF8c6j3e9GaSAb7rl/mElKthwi3RzCiGRfDnv3R3XIJo9hJBtHe4
         v9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
        fh=qO9wbA2fdhMa9DPSuadWTR7UsjbvUzp0U78Saljfd8A=;
        b=jwRZq2/egWiqozFiUXj7k3dHXytO4Y2yqVQUFBzXZ6WA6ScU5rFsfMPZ97vxRyY8KU
         UgyPqH6XvD+HpjlJMwkEgH0R2M0OQptugL4In8CyG2mqGW4QpS+t6Pj98IzrhSr+VUPp
         ZbiFuTKMOSixrr/Vx1pCGyVgo7I6tmcGwkhr3bHvONJ+LO7N3mcGLp66+TlzKJhw0d+A
         cabeqN5QQ2soGrIDG4xNfO7vZuro8URLweWUPNVeMBBsI3srteUCKvwgetmXCoRqdA5h
         Zt72FWB5yN3ox2W2Kl4L9tqrK43N3BOb8sI0iWzGzb//Yz/SZ6Ub0MrjKG6vlJj071I+
         Na9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768501067; x=1769105867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
        b=J+jZTuvyea3UrBjh8ezyPzI5satJH++6sz0KIcYC1jQMNDT7t+lUx0ssq0FM84B+Zf
         JkoDts4Id4yyYNF/OAP8ET/CKWH4jccAxq6IgixIHuseSaBuq7CPs/0tPkyhS0mKjLgj
         DlauA3JDEIdlJlci9C0d6bTNNkxm65vxst8n1/bzd5qrx8k23pgkf++a5GYnmNw3j1H5
         JMSK2ytLMLCAIA3FCLIwhQa/9ElnSiiLFsQKheBHRdWOURDGHwiw//8e4VFj2jOOWvID
         BG6s/NrlKdS7oGfEJU0qMUiulPd2LWA2SSAX3ubKwcA4sc8P2yTbd8GMOSAIY58BI/Mk
         p4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768501067; x=1769105867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
        b=RJiZMJN31GH3ay2dL/sfmZ9m5iTjxNOa4qxPsz2jDKSSUR3tt3FjMsiP1EVtrgcO0Z
         5NprNBf3DhzulBxhpgZLhxQbrISEuATrE2a86TwhcnKfdpLII0G4+vZCZ+0v2DpLlsak
         NUs6XuezXauKLmh3DeES40FBJSKiVTiE/V+qVZYU4hp5ADHtF7obox0X15nI+HA8MJBF
         eIyOC9yfUwIJ8H3P6OEkKfEcGORcqhYVfuqCb/Ng+GWInkV9oIWzEZygvkSZESekNDqO
         uEyzAhl0DavHlsg/e0FTuvsRXcihL7qeL3CFXvUMEyELMP8pNdavAVXensZKZELuhia6
         pZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCVh/amGCGrG0wZ67Ov9zqYlPgQUcM6F3x6Ya0uvwLaWk2CZeb5kOX0YOnRs0VtdwHOue+2fByZ7pjI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPfeA2BgSFGY5YiziBaRaCu5QJXxovgPC1VTaqtu7PAOdnsWBj
	PCKZlO/5d9vhHVSAhpqmkvj9KbIffU0SqHZctv6RnXToshSgtI8r9Ns13cOtLK3H9cJD11Tol6w
	F0/yPAp0Iqb9BUFaDzpN4zNx7sqVyrek=
X-Gm-Gg: AY/fxX6a3ff8gYI16fFicj1xRdA0JYZyAmWtd7lu5qiuSy9x8pG6q7R8yY/oXn+JNCp
	7BhLuRFdcweTEHecIvxfUZxdovzX4lqf3sO4JthVufa/S4fDvUA37k3y/PPTPXY/Ofxt0Hu9A7E
	fnO0puTtm8cASImUejLYNyFnQyJbZtaOEdMq+d0MJtjXz2pP2u6BqCwHtIOAQ2t9JpP4EgKKRWl
	tyJ1ZQikSueUO6bJfs/mx6lKnshg4SWKbBT5sz2oAX2x84eAs7ewHVn0oMHe8AlnykWdC17B9oe
	CabnbH9BacAQf3LGM/t40PdoEsNESQ==
X-Received: by 2002:a05:6402:510f:b0:64b:7eba:39ed with SMTP id
 4fb4d7f45d1cf-654525ccad4mr346097a12.13.1768501066374; Thu, 15 Jan 2026
 10:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 19:17:35 +0100
X-Gm-Features: AZwV_QjhT3ZtgvkbHJB7796GEklGCbcNDL5CeRwrn_YYeN3X8FqPO-3_iRnRORw
Message-ID: <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
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
X-CRM114-CacheID: sfid-20260115_101749_289911_82FAE14B 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OOKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSW4gcmVjZW50IHllYXJzLCBhIG51bWJlciBvZiBmaWxlc3lz
dGVtcyB0aGF0IGNhbid0IHByZXNlbnQgc3RhYmxlCj4gZmlsZWhhbmRsZXMgaGF2ZSBncm93biBz
dHJ1Y3QgZXhwb3J0X29wZXJhdGlvbnMuIFRoZXkndmUgbW9zdGx5IGRvbmUKPiB0aGlzIGZvciBs
b2NhbCB1c2UtY2FzZXMgKGVuYWJsaW5nIG9wZW5fYnlfaGFuZGxlX2F0KCkgYW5kIHRoZSBsaWtl
KS4KPiBVbmZvcnR1bmF0ZWx5LCBoYXZpbmcgZXhwb3J0X29wZXJhdGlvbnMgaXMgZ2VuZXJhbGx5
IHN1ZmZpY2llbnQgdG8gbWFrZQo+IGEgZmlsZXN5c3RlbSBiZSBjb25zaWRlcmVkIGV4cG9ydGFi
bGUgdmlhIG5mc2QsIGJ1dCB0aGF0IHJlcXVpcmVzIHRoYXQKPiB0aGUgc2VydmVyIHByZXNlbnQg
c3RhYmxlIGZpbGVoYW5kbGVzLgoKV2hlcmUgZG9lcyB0aGUgdGVybSAic3RhYmxlIGZpbGUgaGFu
ZGxlcyIgY29tZSBmcm9tPyBhbmQgd2hhdCBkb2VzIGl0IG1lYW4/CldoeSBub3QgInBlcnNpc3Rl
bnQgaGFuZGxlcyIsIHdoaWNoIGlzIGRlc2NyaWJlZCBpbiBORlMgYW5kIFNNQiBzcGVjcz8KCk5v
dCB0byBtZW50aW9uIHRoYXQgRVhQT1JUX09QX1BFUlNJU1RFTlRfSEFORExFUyB3YXMgQWNrZWQK
YnkgYm90aCBDaHJpc3RvcGggYW5kIENocmlzdGlhbjoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWZzZGV2ZWwvMjAyNjAxMTUtcnVuZGdhbmctbGVpaGdhYmUtMTIwMThlOTNjMDBjQGJy
YXVuZXIvCgpBbSBJIG1pc3NpbmcgYW55dGhpbmc/CgpUaGFua3MsCkFtaXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
