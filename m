Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF52D4661C
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 19:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkRjdF2cedIR4HbcyoFUqcYtujTQR6AGO6doG+A5Ls0=; b=aCaeLzDdqSDauq
	DddEpfw0/2Eo5nYiYQaUu/XT2SGBo93o/amHJmbdGSYGsVnOPA+Y0EXdVCIROAOFKaqBhJy9Ltpn0
	UwsFRRNmIG3Rnr+frAULPL88MyrgNYNEDdXBpBcAvZBLg1FsYKeIQ6CuRoSYYPd0TYp7tN4p/dVx+
	VJ9iWlrGQ3bKC7QiX8ZRgtk4Q1EH6WFdgyw65rusS0DDBKltOtCGkWErltTvtPNTICeVszBKmyZL6
	SXoDRmGkDrL7w+lqaLcDLeR+RVW+CyGYOfuHA6Hil+DopCFkZRjeh+AgDJqSffhJelhA13AcJEeOx
	NLoEe5OqcuSfih15oRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSwQ-0000000D3yV-0UOL;
	Thu, 15 Jan 2026 19:23:34 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSwN-0000000D3xe-0yPj
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 19:23:32 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-64daeb28c56so2277884a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 11:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768505009; x=1769109809; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HpNW/ml4xLa7Q+ZYoOd6NCigBelaQL2RtJ0aaDh9mI=;
        b=cmlJ68y/Q+xyW4qgUkpQ3CthxdDEqznqlV46vi4nVcL6F7/oUTX+RrMiRXhHoINxkK
         o8k/Z6SD/V8ODDe4+AQVho228hrxHDg4IoadfOvcY2s6VQ82P76rkOgnxfYqQnh9mA7K
         uaOsKoUxi9X9FgcMgBVRfqISZ/uqg2UVmtzxSFQRP7GBKAfUVSIinOne/gpKMZmbrP4H
         rK9nmXaCmAdyqNQz7zX3B+fhoFTDGaFuspYanjSHLFV35E3N9hgZCEdJuhbda1fBIKYI
         K201SGbtue/UWdWHZHqUlUdjAWM2BxLsMYo7WiI2Gue6vJ97LU+O3KHiTD06R8Az6xHC
         6XBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768505009; x=1769109809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1HpNW/ml4xLa7Q+ZYoOd6NCigBelaQL2RtJ0aaDh9mI=;
        b=iDDjODGJPjdy5gem0Eo7OmCUIsevVe3AJIB32/18bKPTuUgLBdfsvYtsVmO4mbcHCX
         wnAOX7pWTDFNc6YUI0uNrn8F4e15lNA+FSHfHNt5cggyWR4UTr3qsnwI5QWyWYh66Dr5
         A1Z2+5hpRLlRQ7Pt8qzJfIgBBh4zBXtyOv7Ti+uw4TZkxaDPumLIyY8MfgH5Puwkh7FM
         xfUzXCCmisg9Ug/uPcg+QH7guVDLXDqc/7wn45O/k8EdjDEASwZMSHylHx2e+iSpgvZb
         L8++aaBjb8RVTucstppEfirZlYeLFHoX0Z0GYiKOSbmrQgEFyjdETes6wpnZYLgCDUmi
         myQA==
X-Forwarded-Encrypted: i=1; AJvYcCUBOLkavelZvfXNDRflnC+vApJCQ4CZbo2htTFdyovEJL+dKHNlieaF9Tod95iHO/czYf58TrIkFhc=@lists.infradead.org
X-Gm-Message-State: AOJu0YySIkoX+liH8pH2ypg53HvsnUZOzEYgfJSQjEjd8ABQVSrk5//Z
	pQv/BZlWtPRW5F8r5FTtQg6B7jNwmE2C2VvdyBA7WcHxYRqtg2f/rqFQYzEnB9/198/QXZGzrig
	dKuo+cCmY8tuGtwepIQkt53JGPFh4PnQ=
X-Gm-Gg: AY/fxX4XXM+NflY5Er8rwPJyQ0OUbTurwq6lNGdfCxY/zascE+hHTAx29/eecHVwumt
	LSjXTOwuah9DZZS2+inahizFFKj/ynlCf1OLdVYM44LITYWHvMVIjNpIWvz2Iri62c75dsxatVV
	XEiN1bMRpl53cS3ormmw+cRAUrmlK68ponbaFVPfCLW7UqIGh3X4XnauwpffYMDjSne9bCAkXww
	X+/s/2Pw2sNgmn/D9I+g7HKC+bNBon06gLWxN95kLcCqi1biLa1IzNeem/upbRJ9q03yMKTwkze
	UIK9lelmcTB7/Oo233dQZ0O6ASTHhQ==
X-Received: by 2002:a17:907:3e97:b0:b73:7c3e:e17c with SMTP id
 a640c23a62f3a-b879327e30bmr63085666b.44.1768505008810; Thu, 15 Jan 2026
 11:23:28 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org> <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:23:17 +0100
X-Gm-Features: AZwV_Qj21qC7f0_83CWGwxMbCuhLisWPoHuSIOsZGqfnrVByhBJVGvUqJqXdQ-8
Message-ID: <CAOQ4uxg304=s1Uoeayy3rm1e154Nf7ScOgseJHThw4uQjKwk0A@mail.gmail.com>
Subject: Re: [PATCH 29/29] nfsd: only allow filesystems that set EXPORT_OP_STABLE_HANDLES
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
X-CRM114-CacheID: sfid-20260115_112331_291446_18A7EF42 
X-CRM114-Status: GOOD (  15.93  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo1MeKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gU29tZSBmaWxlc3lzdGVtcyBoYXZlIGdyb3duIGV4cG9ydCBv
cGVyYXRpb25zIGluIG9yZGVyIHRvIHByb3ZpZGUKPiBmaWxlaGFuZGxlcyBmb3IgbG9jYWwgdXNh
Z2UuIFNvbWUgb2YgdGhlc2UgZmlsZXN5c3RlbXMgYXJlIHVuc3VpdGFibGUKPiBmb3IgdXNlIHdp
dGggbmZzZCwgc2luY2UgdGhlaXIgZmlsZWhhbmRsZXMgYXJlIG5vdCBwZXJzaXN0ZW50IGFjcm9z
cwo+IHJlYm9vdHMuCj4KPiBJbiBfX2ZoX3ZlcmlmeSwgY2hlY2sgd2hldGhlciBFWFBPUlRfT1Bf
U1RBQkxFX0hBTkRMRVMgaXMgc2V0Cj4gYW5kIHJldHVybiBuZnNlcnJfc3RhbGUgaWYgaXQgaXNu
J3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgo+
IC0tLQo+ICBmcy9uZnNkL25mc2ZoLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL25mc2QvbmZzZmguYyBiL2ZzL25mc2QvbmZz
ZmguYwo+IGluZGV4IGVkODVkZDQzZGExOGU2ZDRjNDY2N2ZmMTRkYzAzNWYyZWFjZmYxZDYuLmRh
OWQ1ZmIyZTY2MTNjMjcwNzE5NWRhMmU4Njc4YjNmY2IzZDQ0NGQgMTAwNjQ0Cj4gLS0tIGEvZnMv
bmZzZC9uZnNmaC5jCj4gKysrIGIvZnMvbmZzZC9uZnNmaC5jCj4gQEAgLTMzNCw2ICszMzQsMTAg
QEAgX19maF92ZXJpZnkoc3RydWN0IHN2Y19ycXN0ICpycXN0cCwKPiAgICAgICAgIGRlbnRyeSA9
IGZocC0+ZmhfZGVudHJ5Owo+ICAgICAgICAgZXhwID0gZmhwLT5maF9leHBvcnQ7Cj4KPiArICAg
ICAgIGVycm9yID0gbmZzZXJyX3N0YWxlOwo+ICsgICAgICAgaWYgKCEoZGVudHJ5LT5kX3NiLT5z
X2V4cG9ydF9vcC0+ZmxhZ3MgJiBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMpKQo+ICsgICAgICAg
ICAgICAgICBnb3RvIG91dDsKPiArCj4gICAgICAgICB0cmFjZV9uZnNkX2ZoX3ZlcmlmeShycXN0
cCwgZmhwLCB0eXBlLCBhY2Nlc3MpOwo+CgpJREdJLiBEb24ndCB5b3Ugd2FudCAgdG8gZGVueSB0
aGUgZXhwb3J0IG9mIHRob3NlIGZzIGluIGNoZWNrX2V4cG9ydCgpPwpCeSB0aGUgc2FtZSBsb2dp
YyB0aGF0IGNoZWNrX2V4cG9ydCgpIGNoZWNrcyBmb3IgY2FuX2RlY29kZV9maCgpCm5vdCBmb3Ig
Y2FuX2VuY29kZV9maCgpLgoKVGhhbmtzLApBbWlyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
