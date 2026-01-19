Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4ECD29C46
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJBcJabF81jSHYAUAXbZIu/YwwZXu08YuZW/Gg5+iaw=; b=4NUpEw+bnSc319
	X9gySz3gF/LiOmGUbO8yZ/Ths9+pC4D/0RaMLBgo3qdcbX+KG9f9VhAbef63tZ1VZHdZ62auEH8nl
	y/hgqQgQf93sht/FoZakExKjqONOI99Z3kcOHvxJUKIe+Sgmwhy4E63ToHCgoPxfMkXt0gVWpvOMH
	s5ZsUjDTTsSVkaAuErel6YcGf6KNlv6N14hcTalLi7CxK5fkeizYcIJw+wDsorPFCEOTEtYuuGAFd
	kGvJu3aSr6guItFX8W6p1BflXRQnseK+eIE7R2P4H4UmO/tqx+ub8k3aq/4pRn3yv7RWAZwQM3Wmh
	haud27OUSVLsim/oaqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsJs-00000002Wly-3Q7b;
	Mon, 19 Jan 2026 16:41:36 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsJo-00000002WlM-0qkH
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:41:33 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso6947608a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2026 08:41:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768840890; cv=none;
        d=google.com; s=arc-20240605;
        b=LTzOG+xEVRd3P8HefOcopHaHpjWGGSnrBhMllfWZeEnlkHTLP/ebWF8bVRupf/seVW
         bTwy1bdOH8Gvg6f3jFa57Fp+EJg7KAKWh6TdsWDdhh+xD9tYe+4S6G2+wAWseWM1Xcp9
         KvtveExkLZj50Yp34p15Olf/SZCGHYrHW5LSmgV7MfYQl4qcswZDWC03eEWjVV4W4bdK
         Th2BVp3k8hTcWBdSWB1cj50zU5CsaD4DokTlLKEVk7wC/0XYvl8IMeBUZMQEK24GZ9fX
         cGa/iIflzSul3HN1o0yoOIvHU0VzVixedtzWozVMk8AWiuXT01Z237Z21l8cMGvcfY7D
         st6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=;
        fh=2PN+7tPmFHj5vYpo5id0P1GK8csGQd4DCo83DzF88sE=;
        b=En9I+1L4hAeNWuB2fsgzFrzkpyrowWjoxMbkC2ywlE3IBx/dtQ8TZxKYTssOVT04d6
         MxMLqYqkpsTT42iUx8gjSRJsni3Ljpt80Ic6b13p5uIoYtJFFtWhvBaI9g/qOYlXUcAq
         JX/pXZ4wRoj3f2fnby98FuohZ0Al1XZrH572gjx0A6/DqzJoyXjXljRyOKd/+CM6pevw
         +OsKNbSgoGvVhXHUz2YQonpqG77AZlm0hETJYANAL+G2KasLz73IbSff9Aii53TczhTy
         zzF6/Tb/+IIS2vqNgqKomhwE1g2q5p2+R2R1xiyZ1SnjcAE/WdhaaiABRxWbkXGAHHan
         G2mA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840890; x=1769445690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=;
        b=MLXYnEsRUe07dXq5q0sQg2H3dTDqnCR3pPsXF2304ReUACBQ6zRs/+vZpez/HEp2TP
         x4Y4YWrXHxfiEj0+1z4OfK50Z5pHL2lE5KQvxEpxz/EuRkTQx8TT69F/8hvpFXpgTzp7
         H+LTCe5cy3gwNmc2dALZ6AspB92W8Lk05JduqIhdjh+h5JJ13kqiMZRoR4P7MZIE4TG0
         P9zPuReTVMXCgYEyNqJ5nnArG0H7PCdKfDnM8RMHz282ceFlmt3jGvuAJyQpyoByAXKc
         l+XGmrhSefERi8dHPWmql3PR5dJ9av+fWN6Yw1bbaseXER1klIS6EihMKU0AEn//HTbM
         EvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840890; x=1769445690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=;
        b=s1kyoaOePasqhCmXvfo1oSHv+WR5v9yFl1JIT7q1tk21JwZW61J7RuE3OjGPC/7zlR
         Swe60zJB+c09Dvv0DWjviUimazuWO9fDoG60gz5r3uOvO4X6+4Pv85kcShCz43Vk2r0W
         vBawP7UOIXs/yO6TMICUiK8q7nsxmy7S9AEKEg3etxC8gTznvX4ktRkulGSU+RAHBVqO
         6Ie7RZocJOoG8msed0e2iVIEN1yo7ywBkJWi8Lr/enlfl0efnfYlaxKbYY19Trrr/wt2
         60BmRDpe+sAvCSZsE9lJous5xQMr6VH2cgQ6GBhg4djLob+Um6ZbLNGKQw9jwkEDGPGM
         Asiw==
X-Forwarded-Encrypted: i=1; AJvYcCXoRIBUkUAWYXD/8b+5rnoNVh9U91nmgnilOboZRbYebXmps79Ph7UyoqHjn7eO+/i7Bd2XW20nxF0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyXGYzWWZI6gX3Xppono0BR5NbY3inZg18JGGhC2hqcEsjHzpP
	OpviIIZY+za1sZBpY6xhf0ZgtDARX8yIunnPCiaBw8OrsQZiMgaAKEGiTzd25kE/zyAjcbjDjLj
	nqYov56/CLvlmK2jniXbpSLdspuQn+Qw=
X-Gm-Gg: AZuq6aJ05pUiiKPGFkrEMxO2ZWjkLt1u/M1c/5MTGCjLf/7w/0Vs6KlvNJAyod0RGgq
	1efktsHEvwaGhy/dgUGbFBAnUZ5EtTVRUuSLvzo929qPqSqKzejjKzyDvAhd7txW8zzrEbjFGgk
	6xPTAgEQi4zooydhIhzCFOcDY/mMnKZJZtCcgvaDJnUlX5mMdV426txmeVv4Cp3hOGGQkiB2Yx7
	Av8/WaK2cr2zlPI1ipZDkJk6fPHJToXww5JOepJeE5Vyiqd1ZWVL6bhtGLztQT8el19L+jkZK5Y
	ujkRTaDUTjKgkRA9J60C2QXEpmb/Kg==
X-Received: by 2002:a05:6402:518b:b0:64e:f6e1:e517 with SMTP id
 4fb4d7f45d1cf-65452cd98e9mr9387079a12.32.1768840889299; Mon, 19 Jan 2026
 08:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org> <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 19 Jan 2026 17:41:16 +0100
X-Gm-Features: AZwV_QgHvJ6NvIXON-eIYvnT5PkMvN0FHfW-0LujoZ3K-fhpCrZ1N6375iX4_4Y
Message-ID: <CAOQ4uxjX8EcG5XssJ91u8Kn0gY9Rb0qCwnte_7j6Q6knvZ1shw@mail.gmail.com>
Subject: Re: [PATCH v2 02/31] exportfs: add new EXPORT_OP_STABLE_HANDLES flag
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
	Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	David Laight <david.laight.linux@gmail.com>, Dave Chinner <david@fromorbit.com>, 
	Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-ext4@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-unionfs@vger.kernel.org, devel@lists.orangefs.org, 
	ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_084132_289384_43DC8E3B 
X-CRM114-Status: GOOD (  26.71  )
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgNToyN+KAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQXQgb25lIHRpbWUsIG5mc2QgY291bGQgdGFrZSB0aGUgcHJl
c2VuY2Ugb2Ygc3RydWN0IGV4cG9ydF9vcGVyYXRpb25zIHRvCj4gYmUgYW4gaW5kaWNhdG9yIHRo
YXQgYSBmaWxlc3lzdGVtIHdhcyBleHBvcnRhYmxlIHZpYSBORlMuIFNpbmNlIHRoZW4sIGEKPiBs
b3Qgb2YgZmlsZXN5c3RlbXMgaGF2ZSBncm93biBleHBvcnQgb3BlcmF0aW9ucyBpbiBvcmRlciB0
byBwcm92aWRlCj4gZmlsZWhhbmRsZSBzdXBwb3J0LiBTb21lIG9mIHRob3NlIChlLmcuIGtlcm5m
cywgcGlkZnMsIGFuZCBuc2ZzKSBhcmUgbm90Cj4gc3VpdGFibGUgZm9yIGV4cG9ydCB2aWEgTkZT
IHNpbmNlIHRoZXkgbGFjayBmaWxlaGFuZGxlcyB0aGF0IGFyZQo+IHN0YWJsZSBhY3Jvc3MgcmVi
b290Lgo+Cj4gQWRkIGEgbmV3IEVYUE9SVF9PUF9TVEFCTEVfSEFORExFUyBmbGFnIHRoYXQgaW5k
aWNhdGVzIHRoYXQgdGhlCj4gZmlsZXN5c3RlbSBzdXBwb3J0cyBwZXJpc2lzdGVudCBmaWxlaGFu
ZGxlcywKCnBlcnNpc3RlbnQgc3RpbGwgaGVyZT8KIi4uLmFyZSBzdGFibGUgYWNyb3NzIHRoZSBs
aWZldGltZSBvZiBhIGZpbGUiPwoKPiBhIHJlcXVpcmVtZW50IGZvciBuZnMKPiBleHBvcnQuIFdo
aWxlIGluIHRoZXJlLCBzd2l0Y2ggdG8gdGhlIEJJVCgpIG1hY3JvIGZvciBkZWZpbmluZyB0aGVz
ZQo+IGZsYWdzLgoKTWF5YmUgeW91IHdhbnQgdG8gbW92ZSB0aGF0IGNsZWFudXAgdG8gcGF0Y2gg
MSBhbG9uZyB3aXRoIHRoZQpleHBvcnQucnN0IHN5bmM/IG5vdCBhIG11c3QuCgo+Cj4gRm9yIG5v
dywgdGhlIGZsYWcgaXMgbm90IGNoZWNrZWQgYW55d2hlcmUuIFRoYXQgd2lsbCBjb21lIGxhdGVy
IGFmdGVyCj4gd2UndmUgYWRkZWQgaXQgdG8gdGhlIGV4aXN0aW5nIGZpbGVzeXN0ZW1zIHRoYXQg
bmVlZCB0byByZW1haW4KPiBleHBvcnRhYmxlLgo+Cj4gUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxq
YWNrQHN1c2UuY3o+Cj4gU2lnbmVkLW9mZi1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVs
Lm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9uZnMvZXhwb3J0aW5nLnJz
dCB8ICA3ICsrKysrKysKPiAgaW5jbHVkZS9saW51eC9leHBvcnRmcy5oICAgICAgICAgICAgICAg
ICAgICB8IDE2ICsrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZmls
ZXN5c3RlbXMvbmZzL2V4cG9ydGluZy5yc3QgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL25m
cy9leHBvcnRpbmcucnN0Cj4gaW5kZXggMDU4M2EwNTE2YjFlM2EzZTZhMTBhZjk1ZmY4ODUwNmNm
MDJmN2RmNC4uMGMyOWVlNDRlMzQ4NGNlZjg0ZDJkM2Q0NzgxOWFjZjE3MmQyNzVhMyAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL25mcy9leHBvcnRpbmcucnN0Cj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9uZnMvZXhwb3J0aW5nLnJzdAo+IEBAIC0yNDQs
MyArMjQ0LDEwIEBAIGZvbGxvd2luZyBmbGFncyBhcmUgZGVmaW5lZDoKPiAgICAgIG5mc2QuIEEg
Y2FzZSBpbiBwb2ludCBpcyByZWV4cG9ydCBvZiBORlMgaXRzZWxmLCB3aGljaCBjYW4ndCBiZSBk
b25lCj4gICAgICBzYWZlbHkgd2l0aG91dCBjb29yZGluYXRpbmcgdGhlIGdyYWNlIHBlcmlvZCBo
YW5kbGluZy4gT3RoZXIgY2x1c3RlcmVkCj4gICAgICBhbmQgbmV0d29ya2VkIGZpbGVzeXN0ZW1z
IGNhbiBiZSBwcm9ibGVtYXRpYyBoZXJlIGFzIHdlbGwuCj4gKwo+ICsgIEVYUE9SVF9PUF9TVEFC
TEVfSEFORExFUyAtIFRoaXMgZmlsZXN5c3RlbSBwcm92aWRlcyBmaWxlaGFuZGxlcyB0aGF0IGFy
ZQo+ICsgICAgc3RhYmxlIGFjcm9zcyB0aGUgbGlmZXRpbWUgb2YgYSBmaWxlLiBUaGlzIGlzIGEg
aGFyZCByZXF1aXJlbWVudCBmb3IgZXhwb3J0Cj4gKyAgICB2aWEgbmZzZC4gQW55IGZpbGVzeXN0
ZW0gdGhhdCBpcyBlbGlnaWJsZSB0byBiZSBleHBvcnRlZCB2aWEgbmZzZCBtdXN0Cj4gKyAgICBp
bmRpY2F0ZSB0aGlzIGd1YXJhbnRlZSBieSBzZXR0aW5nIHRoaXMgZmxhZy4gTW9zdCBkaXNrLWJh
c2VkIGZpbGVzeXN0ZW1zCj4gKyAgICBjYW4gZG8gdGhpcyBuYXR1cmFsbHkuIFBzZXVkb2ZpbGVz
eXN0ZW1zIHRoYXQgYXJlIGZvciBsb2NhbCByZXBvcnRpbmcgYW5kCj4gKyAgICBjb250cm9sIChl
LmcuIGtlcm5mcywgcGlkZnMsIG5zZnMpIHVzdWFsbHkgY2FuJ3Qgc3VwcG9ydCB0aGlzLgo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2V4cG9ydGZzLmggYi9pbmNsdWRlL2xpbnV4L2V4cG9y
dGZzLmgKPiBpbmRleCBmMGNmMjcxNGVjNTJkZDk0MmI4ZjFjNDU1YTI1NzAyYmQ3ZTQxMmIzLi5j
NGUwZjA4MzI5MGU3ZTM0MTM0MmNmMGI0NWI1OGZkZGRhM2FmNjVlIDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvZXhwb3J0ZnMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZXhwb3J0ZnMuaAo+
IEBAIC0zLDYgKzMsNyBAQAo+ICAjZGVmaW5lIExJTlVYX0VYUE9SVEZTX0ggMQo+Cj4gICNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgo+ICsjaW5jbHVkZSA8bGludXgvYml0cy5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGF0aC5oPgo+Cj4gIHN0cnVjdCBkZW50cnk7Cj4gQEAgLTI3NywxNSArMjc4LDE2
IEBAIHN0cnVjdCBleHBvcnRfb3BlcmF0aW9ucyB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgbnJfaW9tYXBzLCBzdHJ1Y3QgaWF0dHIgKmlhdHRyKTsKPiAgICAgICAgIGludCAo
KnBlcm1pc3Npb24pKHN0cnVjdCBoYW5kbGVfdG9fcGF0aF9jdHggKmN0eCwgdW5zaWduZWQgaW50
IG9mbGFncyk7Cj4gICAgICAgICBzdHJ1Y3QgZmlsZSAqICgqb3BlbikoY29uc3Qgc3RydWN0IHBh
dGggKnBhdGgsIHVuc2lnbmVkIGludCBvZmxhZ3MpOwo+IC0jZGVmaW5lICAgICAgICBFWFBPUlRf
T1BfTk9XQ0MgICAgICAgICAgICAgICAgICgweDEpIC8qIGRvbid0IGNvbGxlY3QgdjMgd2NjIGRh
dGEgKi8KPiAtI2RlZmluZSAgICAgICAgRVhQT1JUX09QX05PU1VCVFJFRUNISyAgICAgICAgICAo
MHgyKSAvKiBubyBzdWJ0cmVlIGNoZWNraW5nICovCj4gLSNkZWZpbmUgICAgICAgIEVYUE9SVF9P
UF9DTE9TRV9CRUZPUkVfVU5MSU5LICAgKDB4NCkgLyogY2xvc2UgZmlsZXMgYmVmb3JlIHVubGlu
ayAqLwo+IC0jZGVmaW5lIEVYUE9SVF9PUF9SRU1PVEVfRlMgICAgICAgICAgICAoMHg4KSAvKiBG
aWxlc3lzdGVtIGlzIHJlbW90ZSAqLwo+IC0jZGVmaW5lIEVYUE9SVF9PUF9OT0FUT01JQ19BVFRS
ICAgICAgICAgICAgICAgICgweDEwKSAvKiBGaWxlc3lzdGVtIGNhbm5vdCBzdXBwbHkKPiArI2Rl
ZmluZSBFWFBPUlRfT1BfTk9XQ0MgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCkgLyogZG9u
J3QgY29sbGVjdCB2MyB3Y2MgZGF0YSAqLwo+ICsjZGVmaW5lIEVYUE9SVF9PUF9OT1NVQlRSRUVD
SEsgICAgICAgICBCSVQoMSkgLyogbm8gc3VidHJlZSBjaGVja2luZyAqLwo+ICsjZGVmaW5lIEVY
UE9SVF9PUF9DTE9TRV9CRUZPUkVfVU5MSU5LICBCSVQoMikgLyogY2xvc2UgZmlsZXMgYmVmb3Jl
IHVubGluayAqLwo+ICsjZGVmaW5lIEVYUE9SVF9PUF9SRU1PVEVfRlMgICAgICAgICAgICBCSVQo
MykgLyogRmlsZXN5c3RlbSBpcyByZW1vdGUgKi8KPiArI2RlZmluZSBFWFBPUlRfT1BfTk9BVE9N
SUNfQVRUUiAgICAgICAgICAgICAgICBCSVQoNCkgLyogRmlsZXN5c3RlbSBjYW5ub3Qgc3VwcGx5
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhdG9t
aWMgYXR0cmlidXRlIHVwZGF0ZXMKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqLwo+IC0jZGVmaW5lIEVYUE9SVF9PUF9GTFVTSF9PTl9DTE9TRSAgICAg
ICAoMHgyMCkgLyogZnMgZmx1c2hlcyBmaWxlIGRhdGEgb24gY2xvc2UgKi8KPiAtI2RlZmluZSBF
WFBPUlRfT1BfTk9MT0NLUyAgICAgICAgICAgICAgKDB4NDApIC8qIG5vIGZpbGUgbG9ja2luZyBz
dXBwb3J0ICovCj4gKyNkZWZpbmUgRVhQT1JUX09QX0ZMVVNIX09OX0NMT1NFICAgICAgIEJJVCg1
KSAvKiBmcyBmbHVzaGVzIGZpbGUgZGF0YSBvbiBjbG9zZSAqLwo+ICsjZGVmaW5lIEVYUE9SVF9P
UF9OT0xPQ0tTICAgICAgICAgICAgICBCSVQoNikgLyogbm8gZmlsZSBsb2NraW5nIHN1cHBvcnQg
Ki8KPiArI2RlZmluZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgICAgICAgQklUKDcpIC8qIGZo
cyBhcmUgc3RhYmxlIGFjcm9zcyByZWJvb3QgKi8KPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgICBm
bGFnczsKPiAgfTsKPgo+Cj4gLS0KPiAyLjUyLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
