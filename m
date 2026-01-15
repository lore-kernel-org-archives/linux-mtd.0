Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A41D4661C
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 19:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJrvBhtADZ8TCIfXlER/ODZ/bXvgHKvtgkQcePzg55E=; b=YnDBVhwYxNdplh
	lWyb2J465SjRKxH7tIjuAfGmZsNYsEcf760Qg36TDCYv3/vDXd85N/w++3aBV3S/Ui85hY8gUAcoq
	j2rXTSKjCli527lqn96Mb33djGcDOHxRZF2b+749uRqAaQyN45VHI3uNt7sJ34MG4CRFeWccs32ts
	sFqGNXgmJwPKq5WStyKFs5Yj0KDWCDtSJ9TwoNBhR2k2UTzh1WI9bWi0sDdw07fGMBLN6pZ7XgZRq
	CFjT0WAun1sUxhoRtBXAYGjXmVCPQbBoaMvRSJX4WZ5WFiuII8/XFH7tYiRW9NqZD+dapLZySkP7B
	iGtiGg0I0ekjmtWuZHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgT4X-0000000D4QZ-2HYe;
	Thu, 15 Jan 2026 19:31:57 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgT4U-0000000D4Pp-1gGt
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 19:31:55 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b871b6e0c70so198311066b.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 11:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768505512; x=1769110312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=;
        b=JwmkD9ADbvoHsaUfkBrtn8oxJb2524U2hjf1r55bwVwBC7soO6lM/0KOx82DboCJDF
         SONWpv8xIVQxXv5rIsI64KBk/z+4EM3lVgjzrRD5hLCuISNHnt29oDSv/3gUXiLZAfxU
         ub9bUkAyegI3SEksSihMGEIRTs3kYOCoYcz0jM4++p+JPMgwteRCIL35a3dt3iPF0SBk
         cL4S48pryIc3StmOfLT6tBF6F+4S8HaSfsKe304khQrOVyhg5Ah+uPrMj88+JFh+JuZE
         SUa+ooea0aSuJPhgCu217pQRoi1sWx7fxkKRrRfnwZ7zdGimR2Qa6vi+GrqLgnE+ObQo
         UM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768505512; x=1769110312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=;
        b=iim6o0H/simaacrc6E+kdrp6oECdXpEzanDIhAylvn5eED/5qyUErH/Ka59dRI4PLZ
         FiWixGL6HWqS4qNSddzbh+SmskkQJFzb5QQqHozJM0uciUvatfprjwIaOTKNiwM9K7D7
         09oGRjPEP41EUwT4eOh9wo9qQPKKOFCoyJ5EgBMTNGI0tFtGX68jnV1McLfI9iD5l01Y
         WkhEC9gSRhSjzWwpbZcjVZyEAecF6lZWnBfM67AgG07pZ3MA3oPOBo9KHXchRDs/9G0r
         Ekb/CawpQHF+M2qVIxIiIHGuZ3jayachU0xkDuDByJv74fgnebvs5xD6V9NbCXYwhpGe
         0zTA==
X-Forwarded-Encrypted: i=1; AJvYcCUtCmuqIDe1f/k5e96AiqtUMC4Y++BegQBli9u0+fICriMoLV+ZYVwwB20uf4oRmMWf2Hd1fxm+hRg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt/0GjctpP2rq37fM+AzCZGxb6Q41MYM5i7h5Ynu+pqBqfTdXs
	MQ61kMlphyKAHkMugtZHi8lUNBiCbTwdxpybYMfNh2Fnahij408bRQpiEEQSBGI8G/SQDIz3YXy
	zvl4yS+ZDuqTR4gcUjtaAK5WjKm4Osb8=
X-Gm-Gg: AY/fxX7YSozdK2cphGGrtgXjb8LrqKR+BywYOCS7yu9dX8ZSzciVWJGSL2BJECRG0l4
	pSzSxN3ySteobm84pBR1NeFHdlLMSIzR2bBR6E95VOv+mNsw2yB93BSgMZnom/XUHXXJNsDTaVb
	+qKaEfDmIaRLVl50UPktKRdNdVe2amjKJcikGLmFcIbhj7zLWWCUBrcVGaPm6tSgegP0jh9eDn7
	9hvVSDmtLQazOSAkAEb6H+pa8GGxU1v3VzDn4fwE/pMmdwP96V3mBzjvhmm+BUOL1sR3Dzw+sQ3
	RTQehOI0ulm5slsjNJB1xw2N1/O3rg==
X-Received: by 2002:a17:907:3c87:b0:b87:442:e9b6 with SMTP id
 a640c23a62f3a-b879690c54amr11543766b.17.1768505511676; Thu, 15 Jan 2026
 11:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com> <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
In-Reply-To: <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:31:40 +0100
X-Gm-Features: AZwV_QhvHAFd_rX2K5lnQvHY5zGWrCY2L2ECA3-jgjFMNT8gFVUBrqM9bcPeRhY
Message-ID: <CAOQ4uxhnSPoqwws7XW4JU=jjgZJoFgCjcWwbfPaprDCZq=wnKQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260115_113154_488945_9A7115B1 
X-CRM114-Status: GOOD (  25.19  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgODoxNOKAr1BNIEFtaXIgR29sZHN0ZWluIDxhbWlyNzNp
bEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNzozMuKAr1BN
IENodWNrIExldmVyIDxjZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4KPiA+Cj4gPiBPbiBU
aHUsIEphbiAxNSwgMjAyNiwgYXQgMToxNyBQTSwgQW1pciBHb2xkc3RlaW4gd3JvdGU6Cj4gPiA+
IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDY6NDjigK9QTSBKZWZmIExheXRvbiA8amxheXRvbkBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+ID4+Cj4gPiA+PiBJbiByZWNlbnQgeWVhcnMsIGEgbnVtYmVy
IG9mIGZpbGVzeXN0ZW1zIHRoYXQgY2FuJ3QgcHJlc2VudCBzdGFibGUKPiA+ID4+IGZpbGVoYW5k
bGVzIGhhdmUgZ3Jvd24gc3RydWN0IGV4cG9ydF9vcGVyYXRpb25zLiBUaGV5J3ZlIG1vc3RseSBk
b25lCj4gPiA+PiB0aGlzIGZvciBsb2NhbCB1c2UtY2FzZXMgKGVuYWJsaW5nIG9wZW5fYnlfaGFu
ZGxlX2F0KCkgYW5kIHRoZSBsaWtlKS4KPiA+ID4+IFVuZm9ydHVuYXRlbHksIGhhdmluZyBleHBv
cnRfb3BlcmF0aW9ucyBpcyBnZW5lcmFsbHkgc3VmZmljaWVudCB0byBtYWtlCj4gPiA+PiBhIGZp
bGVzeXN0ZW0gYmUgY29uc2lkZXJlZCBleHBvcnRhYmxlIHZpYSBuZnNkLCBidXQgdGhhdCByZXF1
aXJlcyB0aGF0Cj4gPiA+PiB0aGUgc2VydmVyIHByZXNlbnQgc3RhYmxlIGZpbGVoYW5kbGVzLgo+
ID4gPgo+ID4gPiBXaGVyZSBkb2VzIHRoZSB0ZXJtICJzdGFibGUgZmlsZSBoYW5kbGVzIiBjb21l
IGZyb20/IGFuZCB3aGF0IGRvZXMgaXQgbWVhbj8KPiA+ID4gV2h5IG5vdCAicGVyc2lzdGVudCBo
YW5kbGVzIiwgd2hpY2ggaXMgZGVzY3JpYmVkIGluIE5GUyBhbmQgU01CIHNwZWNzPwo+ID4gPgo+
ID4gPiBOb3QgdG8gbWVudGlvbiB0aGF0IEVYUE9SVF9PUF9QRVJTSVNURU5UX0hBTkRMRVMgd2Fz
IEFja2VkCj4gPiA+IGJ5IGJvdGggQ2hyaXN0b3BoIGFuZCBDaHJpc3RpYW46Cj4gPiA+Cj4gPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWZzZGV2ZWwvMjAyNjAxMTUtcnVuZGdhbmct
bGVpaGdhYmUtMTIwMThlOTNjMDBjQGJyYXVuZXIvCj4gPiA+Cj4gPiA+IEFtIEkgbWlzc2luZyBh
bnl0aGluZz8KPiA+Cj4gPiBQRVJTSVNURU5UIGdlbmVyYWxseSBpbXBsaWVzIHRoYXQgdGhlIGZp
bGUgaGFuZGxlIGlzIHNhdmVkIG9uCj4gPiBwZXJzaXN0ZW50IHN0b3JhZ2UuIFRoaXMgaXMgbm90
IHRydWUgb2YgdG1wZnMuCj4KPiBUaGF0J3Mgb25lIHdheSBvZiBpbnRlcnByZXRpbmcgInBlcnNp
c3RlbnQiLgo+IEFub3RoZXIgd2F5IGlzICJjb250aW51aW5nIHRvIGV4aXN0IG9yIG9jY3VyIG92
ZXIgYSBwcm9sb25nZWQgcGVyaW9kLiIKPiB3aGljaCB3b3JrcyB3ZWxsIGZvciB0bXBmcyB0aGF0
IGlzIG1vdW50ZWQgZm9yIGEgbG9uZyB0aW1lLgo+Cj4gQnV0IEkgYW0gY29uZnVzZWQsIGJlY2F1
c2UgSSB3ZW50IGxvb2tpbmcgZm9yIHdoZXJlIEplZmYgc2FpZCB0aGF0Cj4geW91IHN1Z2dlc3Rl
ZCBzdGFibGUgZmlsZSBoYW5kbGVzIGFuZCB0aGlzIGlzIHdoYXQgSSBmb3VuZCB0aGF0IHlvdSB3
cm90ZToKPgo+ICJ0bXBmcyBmaWxlaGFuZGxlcyBhbGlnbiBxdWl0ZSB3ZWxsIHdpdGggdGhlIHRy
YWRpdGlvbmFsIGRlZmluaXRpb24KPiAgb2YgcGVyc2lzdGVudCBmaWxlaGFuZGxlcy4gdG1wZnMg
ZmlsZWhhbmRsZXMgbGl2ZSBhcyBsb25nIGFzIHRtcGZzIGZpbGVzIGRvLAo+ICBhbmQgdGhhdCBp
cyBhbGwgdGhhdCBpcyByZXF1aXJlZCB0byBiZSBjb25zaWRlcmVkICJwZXJzaXN0ZW50Ii4KPgo+
ID4KPiA+IFRoZSB1c2Ugb2YgInN0YWJsZSIgbWVhbnMgdGhhdCB0aGUgZmlsZSBoYW5kbGUgaXMg
c3RhYmxlIGZvcgo+ID4gdGhlIGxpZmUgb2YgdGhlIGZpbGUuIFRoaXMgL2lzLyB0cnVlIG9mIHRt
cGZzLgo+Cj4gSSBjYW4gbGl2ZSB3aXRoIFNUQUJMRV9IQU5ETEVTIEkgZG9uJ3QgbWluZCBhcyBt
dWNoLAo+IEkgdW5kZXJzdGFuZCB3aGF0IGl0IG1lYW5zLCBidXQgdGhlIGRlZmluaXRpb24gYWJv
dmUgaXMgaW52ZW50ZWQsCj4gd2hlcmVhcyB0aGUgdGVybSBwZXJzaXN0ZW50IGhhbmRsZXMgaXMg
d2VsbCBrbm93biBhbmQgd2VsbCBkZWZpbmVkLgo+CgpBbmQgYWxzbyBmb3Jnb3QgdG8gbWVudGlv
biAtIFNUQUJMRSBIQU5ETEVTIGlzIHZlcnkgbGV4aWNvZ3JhcGhpY2FsbHkKY2xvc2UgdG8gU1RB
TEUgSEFORExFUyA6LS8KClRoYW5rcywKQW1pci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
