Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA93C982C9
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jan 2026 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87oy2GD1lDX4AKDKhKNot0E9LIUIFg9K1JHWq6G0b2Q=; b=T/rOfhI8Vf+enN
	hov9CqkUV7DRDwCI77IA6AgyK8bhpTwyxFWZ4To5lAkwthXFE55cpGVqzq2R0YFMmOk/I4Az+pobd
	cr0zax/6GuAyOcEIfmgOKGjyrDERVp6rKh7jNUmWJXSvaRF+vQvyDsr75Vo/8ncQ17IolfsE2dna4
	dXv6iZ5ipzg8I3wT34W7Z4XvXkkuRo1RolNYlrmwjg9L/wi/w7ti+pKe1l6mocmnGqeIqVXxjmyXP
	jKc/jZVa4oPBOX6O9GLJKDwTY+0oAVZWj3fhi7SvQEk1ogms59cULFZbgGXIXL+Ieew14p4E/JGpA
	Pc5CGoDOew4zc451bK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgl6R-0000000EHZS-1usj;
	Fri, 16 Jan 2026 14:47:07 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgl6P-0000000EHZ5-2ZUw
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jan 2026 14:47:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so497673466b.2
        for <linux-mtd@lists.infradead.org>; Fri, 16 Jan 2026 06:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768574823; cv=none;
        d=google.com; s=arc-20240605;
        b=XB3bPvwvuw0Hb9QHgJWE6+rF+qLWax5OFlhWM+cEgyt3Bd3A3gq6aKEXyWZEu0afL0
         ZwQrl0c/BK8tddCERRDhN8jcJ78I3C+cEysR2SNDbgdg2G+REpRYHRDe7HCOHu+YGiO7
         MYQbI7Um+NG6KRq0dahxZNE7lIk0Ec2L6dNwcE1HoPYtpJp79XmPCyC7YuayVKnTaZsy
         +9dJXqFcWAYTa3SbLk0Qk+gA+A75hmLMu1qj25eriwoFqeBzohTrIa1/2v/4Kw43J6Dq
         5uy6y9OE5rAjRy3aVCVUR7QHSqVqRgzSUQSFXOmPSnLjX1h5Wau6NoNkjRNjnphP5sfh
         RNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=;
        fh=hdNmIc0hEb1KcYtLjQ97mNXs4746iWMn+7PNbbrhb8A=;
        b=Bh+AH1+6AAeW0SZGXH+dQw6xO5gEcTnXzLrgsiwZIS8Cb/taF1bkvSwpK79aLoFbao
         80TRJmT1bOpAWP6VITGYpD6i3Nj4KCGLZEq+EuDfJI82aIACFhZ531LWZohSr7ocwXgJ
         w76uPMFt975p+oZgrBIS6BwuFuVnUUV5kHQWWS/vEWp+ig0L4wjYV5RgN5Hhsoi4mIf3
         /g1PQzlu743LJ/vCfNHD4FreXM00sjNk/co5t8gtP3sZNMq0Ymsv4yNxWBcUF6UDKLP1
         PBVRu9ZDQO96R+HVAhvmpkDRCmGxltNnhbecGd7d5dZORd6/P1MNEX1XE10yKVlr7S+d
         S4Aw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768574823; x=1769179623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=;
        b=Kd3wcxQFJfy50T38eHKvRm2d5AENkVTWMS3P1W44yNsqYy+VNl6tSHKjeSy/WjHvHe
         PlyKVNptRTHeJc1MuVMFb+LcuINzhrOav3Odu+gy85eZM+IyZkz7Z0MZvug9APBGcZe6
         7gkPmTwc5cyjZyCdaTsy8qHoUDcxMszW/VxUdB9RH3NjYDv6uRMmYMBmkOTACOPetQUJ
         b1HhcHdCKk5IWiWqwYAEwG56e0aN5/G1++OIxbYR7DdR+LxkRCFUxkxai82CQtoL+oJu
         XSAhNMD29FAMSj9lBLeHrq1cGKFBpfxNlZCuHQRIiq8cKIrhOuPugKvbj7YJYapnpdZ7
         ReSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768574823; x=1769179623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=;
        b=o6uN56uXh3pKWdbhUotddeJFlOLH2bU3ALEczFWFkA6jD0QlVIcgeVSkVMhxGWkE4S
         bvpT5ResAnOwvTpJEMdNWl3k49CyZgHz2b4kbCyJOSALjcoMsGvEEJMPiDu+crfTIKTC
         nbJAT0PpotBXmKt9mQ7IV86oJEmO+tViQDh3Va1kJm/Mq0DsaX8xpnsS6ZaZG1uk9LaO
         7DtbZCedp2GakvIEvlXP86pH3Uar7g+iJS4+r2Yhc32+E2VbQ9Kr/ygKShr9fCoWyLId
         Kr47cLbOg3afEYXcWSX57b+G0DkRadhRxPXqWNBq/eDDxRCveY/XwxohzmcwLXHcuUss
         QZmg==
X-Forwarded-Encrypted: i=1; AJvYcCV9NNWLUbcBBtdilog8c7h2x2STkZXcvS3D6lj3J/mUVFIHvgkfb9cRCc4VuBAUYk9z+POOuG5RoyI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGgabTRriNeTIhJSXqu+L3D303hDctV8acdcn4S9jykFNNspMw
	o3Z8l1coQt22YxSAofZlTFrWXeukFttGTI2fyYnhcC1y3Z5hUCS0dab3z0+SqG/IeNxSABWRbaR
	D+KDcrtUg1hTFT4nfRb0jqyYao3dUJwQ=
X-Gm-Gg: AY/fxX4hVVfzUQU6oKl5/t+WyuevuSoxvihfoCOqGSLtO0EV19TmelJdI0op09TsEbh
	IQZLR8GnN9COHlT+uJSJOFEp7yFO7EPETKE0/ZjmAZ2ITeRbDOTOVSuCHNXieIV/9Q71hXFG8V0
	zW8eEUPPTxbd8u8rnTaeJ5HbEU9ECHL2XiMcWrEPbMdyHOl2xMAb02amllt/n/ntNl9TJ6naLwX
	j3Lqvh2Ka3WKjT9fSmqU/f6VXj76xaOr0QzZ70uglMSlYDsiajjzuAKrWUbiDv58IJ3J4xwbg4B
	OC6ZHcllCZo2Uos+i8mWwbTScI4ncQ==
X-Received: by 2002:a17:906:7305:b0:b72:a899:169f with SMTP id
 a640c23a62f3a-b8792d6cf8amr335795366b.4.1768574823087; Fri, 16 Jan 2026
 06:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org> <CAOQ4uxg304=s1Uoeayy3rm1e154Nf7ScOgseJHThw4uQjKwk0A@mail.gmail.com>
 <8e4c3df4828351c677186bf018061f2b1fd1b48e.camel@kernel.org>
In-Reply-To: <8e4c3df4828351c677186bf018061f2b1fd1b48e.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 16 Jan 2026 15:46:50 +0100
X-Gm-Features: AZwV_QiRcITYtWxbtRpeIxfeQr9ho0AGFQM_8wESdHA53c49E-5t7eaX1T9rC3o
Message-ID: <CAOQ4uxhkZNueydP0tTCAj6tuzKWPTYB7=JR_hb4gaavSKQ8C2w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260116_064705_681408_06860041 
X-CRM114-Status: GOOD (  24.72  )
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

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMTozNuKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAyMDI2LTAxLTE1IGF0IDIwOjIzICswMTAwLCBB
bWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDY6NTHigK9Q
TSBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gU29t
ZSBmaWxlc3lzdGVtcyBoYXZlIGdyb3duIGV4cG9ydCBvcGVyYXRpb25zIGluIG9yZGVyIHRvIHBy
b3ZpZGUKPiA+ID4gZmlsZWhhbmRsZXMgZm9yIGxvY2FsIHVzYWdlLiBTb21lIG9mIHRoZXNlIGZp
bGVzeXN0ZW1zIGFyZSB1bnN1aXRhYmxlCj4gPiA+IGZvciB1c2Ugd2l0aCBuZnNkLCBzaW5jZSB0
aGVpciBmaWxlaGFuZGxlcyBhcmUgbm90IHBlcnNpc3RlbnQgYWNyb3NzCj4gPiA+IHJlYm9vdHMu
Cj4gPiA+Cj4gPiA+IEluIF9fZmhfdmVyaWZ5LCBjaGVjayB3aGV0aGVyIEVYUE9SVF9PUF9TVEFC
TEVfSEFORExFUyBpcyBzZXQKPiA+ID4gYW5kIHJldHVybiBuZnNlcnJfc3RhbGUgaWYgaXQgaXNu
J3QuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5l
bC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgZnMvbmZzZC9uZnNmaC5jIHwgNCArKysrCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9m
cy9uZnNkL25mc2ZoLmMgYi9mcy9uZnNkL25mc2ZoLmMKPiA+ID4gaW5kZXggZWQ4NWRkNDNkYTE4
ZTZkNGM0NjY3ZmYxNGRjMDM1ZjJlYWNmZjFkNi4uZGE5ZDVmYjJlNjYxM2MyNzA3MTk1ZGEyZTg2
NzhiM2ZjYjNkNDQ0ZCAxMDA2NDQKPiA+ID4gLS0tIGEvZnMvbmZzZC9uZnNmaC5jCj4gPiA+ICsr
KyBiL2ZzL25mc2QvbmZzZmguYwo+ID4gPiBAQCAtMzM0LDYgKzMzNCwxMCBAQCBfX2ZoX3Zlcmlm
eShzdHJ1Y3Qgc3ZjX3Jxc3QgKnJxc3RwLAo+ID4gPiAgICAgICAgIGRlbnRyeSA9IGZocC0+Zmhf
ZGVudHJ5Owo+ID4gPiAgICAgICAgIGV4cCA9IGZocC0+ZmhfZXhwb3J0Owo+ID4gPgo+ID4gPiAr
ICAgICAgIGVycm9yID0gbmZzZXJyX3N0YWxlOwo+ID4gPiArICAgICAgIGlmICghKGRlbnRyeS0+
ZF9zYi0+c19leHBvcnRfb3AtPmZsYWdzICYgRVhQT1JUX09QX1NUQUJMRV9IQU5ETEVTKSkKPiA+
ID4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gPiArCj4gPiA+ICAgICAgICAgdHJhY2Vf
bmZzZF9maF92ZXJpZnkocnFzdHAsIGZocCwgdHlwZSwgYWNjZXNzKTsKPiA+ID4KPiA+Cj4gPiBJ
REdJLiBEb24ndCB5b3Ugd2FudCAgdG8gZGVueSB0aGUgZXhwb3J0IG9mIHRob3NlIGZzIGluIGNo
ZWNrX2V4cG9ydCgpPwo+ID4gQnkgdGhlIHNhbWUgbG9naWMgdGhhdCBjaGVja19leHBvcnQoKSBj
aGVja3MgZm9yIGNhbl9kZWNvZGVfZmgoKQo+ID4gbm90IGZvciBjYW5fZW5jb2RlX2ZoKCkuCj4g
Pgo+Cj4gSXQgY2VydGFpbmx5IHdvbid0IGh1cnQgdG8gYWRkIGEgY2hlY2sgZm9yIHRoaXMgdG8g
Y2hlY2tfZXhwb3J0KCksIGFuZAo+IEkndmUgZ29uZSBhaGVhZCBhbmQgZG9uZSBzby4gVG8gYmUg
Y2xlYXIsIGRvaW5nIHRoYXQgd29uJ3QgcHJldmVudCB0aGUKPiBmaWxlc3lzdGVtIGZyb20gYmVp
bmcgZXhwb3J0ZWQsIGJ1dCB5b3Ugd2lsbCBnZXQgYSB3YXJuaW5nIGxpa2UgdGhpcwo+IHdoZW4g
eW91IHRyeToKPgo+ICAgICBleHBvcnRmczogL3N5cy9mcy9jZ3JvdXAgZG9lcyBub3Qgc3VwcG9y
dCBORlMgZXhwb3J0Cj4KPiBUaGF0IGV4cG9ydCB3aWxsIHN0aWxsIHNob3cgdXAgaW4gbW91bnRk
IHRob3VnaCwgc28gdGhpcyBpcyBqdXN0IGEKPiB3YXJuaW5nLiBUcnlpbmcgdG8gbW91bnQgaXQg
dGhvdWdoIHdpbGwgZmFpbC4KPgoKT2gsIEkgZGlkIG5vdCBrbm93LiBXaGF0IGFuIG9kZCB1c2Vy
IGV4cGVyaWVuY2UuCkFueXdheSwgYmV0dGVyIHRoYW4gbm8gd2FybmluZyBhdCBhbGwuCgpUaGFu
a3MsCkFtaXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
