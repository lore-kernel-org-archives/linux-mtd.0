Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F12D4661B
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 19:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7BM8Ek5wrSgU+QAaLAEXOU9fessZ5vHD6VHbK3chsg=; b=ysfYyWqjVMaENw
	KWKB69ZY+bN8h2xq/o5X4cTVxIFcu//mi5G/2ED8zob1CUzdwWZ5nApfa+YhJDweTlIJYBQNi5FE3
	WcNKmY8yvAiOMxugunzs2wrdjs/5AKkywCBe+VP11nOk57/h+VEOkfbzI4o5RYAfWzeG/2KhG9BRH
	0Za8dllWvSeHf04NyHNqhIoIFO0uC81J6Fytvn04J472KfLtTfEx/j3nnik44/wbtMaiLT8PeTcrf
	91DoNEoB/vpVypfm+XgKBFcF/lPt/0NQkDNLJFfm7YRmJiHMepd8RaDGPc2E2QVjdEkRShS+y665l
	EabLzEzJDKgIUn6xcvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSnZ-0000000D1rN-1gE6;
	Thu, 15 Jan 2026 19:14:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSnX-0000000D1qW-1CqJ
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 19:14:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so7306695e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 11:14:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768504461; cv=none;
        d=google.com; s=arc-20240605;
        b=U2LOuWqQr7fXT0dsy9QP0K+5kBpDmqHMwm708rqz7A0IK6bMGw5gyT5cTCkctjkJSX
         DUAzE8Gv9Ks4m85k7bfhWNDSuJXOk+EERDsTTX2OYZAfU55mdJHpKCLfqIIwtUsZ6p2y
         qXccy5+MffeZ9kok8RPiVJjVcF5s9Md8zuzBSbhSut50E1It32SChlIni3x6D/+hSo7r
         dCgBjRh6ATWyiAsLn0Yxy8jkp4IoE6/hdr5isrfSSmTj994hxDimqr4SX+EPuvxAVbvO
         OKlRgcH/IwbIEgQ+yIksaZkSnJk/iVHOVVKBKzJUEvWbXjXHEq3PI/NaYxrfAOJ+S/u1
         ZANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=;
        fh=9WYpXmaBgiCLrghunp4h/MMxOMHQl/I8gXy3X0Uro/Q=;
        b=jlq8LaVduEddBarZhFQK7LEO9NkEUYhgbIUodnbMx7pKhdBEAfOEz78/UIcr9xFuQw
         waqRcSzrwYP1+3ZHuXBhdhG5TDAhvr5XXC2bAOaxcwpDJRW5iCLlNXGxkhZ0nzuq+I7b
         Azek6bcncQkasBxAljULzLPh9uV9EF7E9p+mWgEJ+3UuJj/GPx/E8G/AtlPltZVzQ8h9
         CLJ/WPrxZW5HISVfBs35ls+UPtUva2ctMjyB2EofkuWwg2Ppm2Ef3o+H8fl2ydguhsy+
         dsvY+AzlRBfuUHaOTwKabS8zsVTaEgeeVKqooEhZWpUfOolh7sqyUXHRKjF4kg1GMRJC
         536w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504461; x=1769109261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=;
        b=NjQvS9s03NaTaIthzcFNmDxW4k4ggVBgRhzHoWZiQ7AMn3DZC7e50plOaNkWGMloXW
         fBdXmAhVZOWWxbFtVpWClao8S8eAa1xCGnJyaB6mpapUPxoNSZEe6GIHO9XqgAi6DY85
         Jq5nDWlZjzfjKknhzW4SIEKDNWN+e/zyELUtOtP9r8DR51yFrNgcpmjZZ326NNEoyS+6
         RIlhLufBXmQhGRSNRiiShfAPa0fqO/ITxB95vxcSTOi9SCOj0fg3Mya3EJ/DPOUXpHbT
         GPs6xC3/Ycwdwc2vKtwI3Z9/l9pXHj05PivvWb/WrM4tRZCzpSD+xOnTLPYDGYTFU0fA
         5/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504461; x=1769109261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=;
        b=ELWJtAVqSdux1y+2H3J7r1CnNyAdKDZiVgtG/BOADKhNB9vAl2DSnB8DXkcfyiePm7
         Y1iF1qvta9okTARzA6g0e4mLq6b0bcmjFFYZMeWPLnPNUIvpaLoo+ep4i+JN8r92cbP/
         41QftUCgVW+aimgc4UsdpRFz16blKYG91yIqv9s8u53YG5mmKkhKtJOrfmV8cz0W7Eww
         HV5fXCgln/5/YV1X4xyUg4ybOdB6oLaDWz+cPML4/VYEVjUj6P39lT24GKRc1yLxQYhV
         gxqtcxf+GIi1ZPBGBbHrnUhkhH7XlxENh/BVYjSdScRZGffG2tsR8Y2T2xwF/WFTmIOB
         uXCw==
X-Forwarded-Encrypted: i=1; AJvYcCW4wLOpdPP+vdJZdv7kruZkeg0+/Oa1wBKaPwBM2zYttD9Ee80oEGtaZCZfUZFUQk0PDL3IOv78Tk8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzL1z6ZsbyH9npWsazTPF3VaSV0gdN2pC71T2wDYvoWAVbSXm8i
	RNbSNfFPwDPQuq8KopeqmoumVAu3Ae0tuifpb/oEeUNuq/dkYa2pSMINxnCCNiR26nniiSj99iX
	3w339qbYPIhe9MmVcSisXH/AR+X77pFg=
X-Gm-Gg: AY/fxX6i1Iqcyv1uiTVjH+ZuuYdD2iaBvKJIg325AZh9Mbt9xDC9rcuIV3i0cWeUcQK
	dgp0lk38iCm3fYDKfIC8vybig5P77Gn85Rh3yfdBP0P1AIn7U4hPDSMYFKoJ6ZVQ7Vvu1B8xCfL
	24mqmG0gNiOKNvHgpu1H9LPcPH1R+d0fdg1maMVwepY4BitUdTEkDght6iQiwFwztmh+0pEX9wX
	tY9faeaoaE2+vx6o+zz/okSfc+bovhI3u+qk8wUZm3kws68E57+jewXjeS/NWM6EG6IGKkQosMi
	JttUK5LrLf6CiPWDbgbLsuFChZ9pdA==
X-Received: by 2002:a05:600c:5487:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-4801e30d482mr9929055e9.13.1768504460920; Thu, 15 Jan 2026
 11:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com> <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
In-Reply-To: <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:14:09 +0100
X-Gm-Features: AZwV_QgZJLcC_-bQ-_VIrtnGFnLgmiVjy_ytBB44u2cGVyBOwKNqVyWt_Jfm7Ds
Message-ID: <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260115_111423_351676_0372971F 
X-CRM114-Status: GOOD (  19.63  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNzozMuKAr1BNIENodWNrIExldmVyIDxjZWxAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gVGh1LCBKYW4gMTUsIDIwMjYsIGF0IDE6MTcgUE0sIEFt
aXIgR29sZHN0ZWluIHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OOKAr1BN
IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gSW4gcmVj
ZW50IHllYXJzLCBhIG51bWJlciBvZiBmaWxlc3lzdGVtcyB0aGF0IGNhbid0IHByZXNlbnQgc3Rh
YmxlCj4gPj4gZmlsZWhhbmRsZXMgaGF2ZSBncm93biBzdHJ1Y3QgZXhwb3J0X29wZXJhdGlvbnMu
IFRoZXkndmUgbW9zdGx5IGRvbmUKPiA+PiB0aGlzIGZvciBsb2NhbCB1c2UtY2FzZXMgKGVuYWJs
aW5nIG9wZW5fYnlfaGFuZGxlX2F0KCkgYW5kIHRoZSBsaWtlKS4KPiA+PiBVbmZvcnR1bmF0ZWx5
LCBoYXZpbmcgZXhwb3J0X29wZXJhdGlvbnMgaXMgZ2VuZXJhbGx5IHN1ZmZpY2llbnQgdG8gbWFr
ZQo+ID4+IGEgZmlsZXN5c3RlbSBiZSBjb25zaWRlcmVkIGV4cG9ydGFibGUgdmlhIG5mc2QsIGJ1
dCB0aGF0IHJlcXVpcmVzIHRoYXQKPiA+PiB0aGUgc2VydmVyIHByZXNlbnQgc3RhYmxlIGZpbGVo
YW5kbGVzLgo+ID4KPiA+IFdoZXJlIGRvZXMgdGhlIHRlcm0gInN0YWJsZSBmaWxlIGhhbmRsZXMi
IGNvbWUgZnJvbT8gYW5kIHdoYXQgZG9lcyBpdCBtZWFuPwo+ID4gV2h5IG5vdCAicGVyc2lzdGVu
dCBoYW5kbGVzIiwgd2hpY2ggaXMgZGVzY3JpYmVkIGluIE5GUyBhbmQgU01CIHNwZWNzPwo+ID4K
PiA+IE5vdCB0byBtZW50aW9uIHRoYXQgRVhQT1JUX09QX1BFUlNJU1RFTlRfSEFORExFUyB3YXMg
QWNrZWQKPiA+IGJ5IGJvdGggQ2hyaXN0b3BoIGFuZCBDaHJpc3RpYW46Cj4gPgo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZnNkZXZlbC8yMDI2MDExNS1ydW5kZ2FuZy1sZWloZ2Fi
ZS0xMjAxOGU5M2MwMGNAYnJhdW5lci8KPiA+Cj4gPiBBbSBJIG1pc3NpbmcgYW55dGhpbmc/Cj4K
PiBQRVJTSVNURU5UIGdlbmVyYWxseSBpbXBsaWVzIHRoYXQgdGhlIGZpbGUgaGFuZGxlIGlzIHNh
dmVkIG9uCj4gcGVyc2lzdGVudCBzdG9yYWdlLiBUaGlzIGlzIG5vdCB0cnVlIG9mIHRtcGZzLgoK
VGhhdCdzIG9uZSB3YXkgb2YgaW50ZXJwcmV0aW5nICJwZXJzaXN0ZW50Ii4KQW5vdGhlciB3YXkg
aXMgImNvbnRpbnVpbmcgdG8gZXhpc3Qgb3Igb2NjdXIgb3ZlciBhIHByb2xvbmdlZCBwZXJpb2Qu
Igp3aGljaCB3b3JrcyB3ZWxsIGZvciB0bXBmcyB0aGF0IGlzIG1vdW50ZWQgZm9yIGEgbG9uZyB0
aW1lLgoKQnV0IEkgYW0gY29uZnVzZWQsIGJlY2F1c2UgSSB3ZW50IGxvb2tpbmcgZm9yIHdoZXJl
IEplZmYgc2FpZCB0aGF0CnlvdSBzdWdnZXN0ZWQgc3RhYmxlIGZpbGUgaGFuZGxlcyBhbmQgdGhp
cyBpcyB3aGF0IEkgZm91bmQgdGhhdCB5b3Ugd3JvdGU6CgoidG1wZnMgZmlsZWhhbmRsZXMgYWxp
Z24gcXVpdGUgd2VsbCB3aXRoIHRoZSB0cmFkaXRpb25hbCBkZWZpbml0aW9uCiBvZiBwZXJzaXN0
ZW50IGZpbGVoYW5kbGVzLiB0bXBmcyBmaWxlaGFuZGxlcyBsaXZlIGFzIGxvbmcgYXMgdG1wZnMg
ZmlsZXMgZG8sCiBhbmQgdGhhdCBpcyBhbGwgdGhhdCBpcyByZXF1aXJlZCB0byBiZSBjb25zaWRl
cmVkICJwZXJzaXN0ZW50Ii4KCj4KPiBUaGUgdXNlIG9mICJzdGFibGUiIG1lYW5zIHRoYXQgdGhl
IGZpbGUgaGFuZGxlIGlzIHN0YWJsZSBmb3IKPiB0aGUgbGlmZSBvZiB0aGUgZmlsZS4gVGhpcyAv
aXMvIHRydWUgb2YgdG1wZnMuCgpJIGNhbiBsaXZlIHdpdGggU1RBQkxFX0hBTkRMRVMgSSBkb24n
dCBtaW5kIGFzIG11Y2gsCkkgdW5kZXJzdGFuZCB3aGF0IGl0IG1lYW5zLCBidXQgdGhlIGRlZmlu
aXRpb24gYWJvdmUgaXMgaW52ZW50ZWQsCndoZXJlYXMgdGhlIHRlcm0gcGVyc2lzdGVudCBoYW5k
bGVzIGlzIHdlbGwga25vd24gYW5kIHdlbGwgZGVmaW5lZC4KClRoYW5rcywKQW1pci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
