Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192DBD232C5
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 05:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqD8womm2XA7JAS3U0P5cTqJDuZtCNYgaxeS4TwZ27g=; b=IcSpxIS9eL8O2Z
	T+fNepybV1eQZ4vCSHNaIfIInu6B891iSVCI1qUGFSG/Eb6fh5FYDNiWyxqdtPDuSlScxrlYmruLx
	yUdUSutC09FpPDXz3XAAKYW4wcZwstyM+3u611QNGAPBe2TNk2oJgmklCTYyJdEhnKWQbSd2jI4am
	fM7E8nfd79ewFGniJh4SzhWUcrpsLdgLQli2zC6zlaC/eUSqoqAEtI+T1NB8ZljPavWUJUpPXw3lf
	3eHKhfg9AiOZc/n66xg/u6zozebRYj4Lc2U8QI80avBL6SuX7FaWnjAgTmF1anQNNklXS/pnOpU4n
	AsMdMcTVuqJtwi4uRomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve510-00000001QX2-0Aa5;
	Fri, 09 Jan 2026 05:26:26 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve50w-00000001QW1-3lUd
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 05:26:24 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-38305f05717so16612641fa.1
        for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2026 21:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767936380; x=1768541180; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEF8CAf2dAOD+neWtLdI+w7NxCIZ2WohswMXxqPrdck=;
        b=EC1fY/sGkacTG/cRMv+XydjR5w5pmHwuWoLXdSAWVr3YHotaPC/XsnccXX1If0yewz
         vgguXBs3zoNEFcKEur2e4YeUz2izKaUAFcIndTT0HW99CPumO7g4l7eLTy1/aqvB3Fkb
         scyrweM2fI8Pld2rz3LsbzFEubthVxfouc2DoP1T0nQC8Iuvsanl4U/g75MyqACnhmZr
         R/P2MwotQh3qzYwm13MlsOlFGY9LvuJEA51ZPX9vyRO+Dz0sH6ar52DVoJ06enIsPM3w
         pTVeQ9a8yxg0LnlDEI6HyrLvrPP4r62+86+gklJSEdZ3qWcPlwQgeCRk0+mz4G/HmTSM
         xUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767936380; x=1768541180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EEF8CAf2dAOD+neWtLdI+w7NxCIZ2WohswMXxqPrdck=;
        b=ue2jiB1MDvyzCKJ9gFg0clCQ17/aeHoFMrNCDP8Co7IlfZKIRAXi/gQ7deSWl2sy+h
         fJY5TybphH+o8RPE+UQaY/IDAYulg98a5ebaraYT4yVvRQCX9RGUoNW9ftlTaM4/lrsB
         OSJk/J/bdIG+pVVpLBeeucp/v/Q627QxXz5LQO/xXnKqHaqAm/l6+v+MGJA+iajtjQoy
         edSB/6eQZ4r2LR1fQsYjsS4hdnT+xCasosjwMz7qFYsB08PAmfYeqF62dkZxhBuXDVZy
         dsWEcuoNpv0N9HFu4Pzw5T0dY374KneURiQ+nofPbKcTAQEj7DZvySrwG1uTgQCZm2qa
         aS/A==
X-Forwarded-Encrypted: i=1; AJvYcCW6uIX5TMV9GJZc2lEbHatymBNqAr8I2fWy00QoFU02kC/altL/EkUUR8zh4f8a0a0yOzlAo5DRgik=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjW7byUKU77yD/AKkwq9p0GIs4LVsC/kYX61vYBSX7v8fY8Dl6
	Mt3dscmyOeQLNgxwySoRoM75hNftzsGN7BzgZutC4KLQ1UWHbt26B5ve748quNuncUbmsNfbroV
	piPWhQKa4wvImRscOtEAFwKZHKIrbNNI=
X-Gm-Gg: AY/fxX7D50ccjawen/tnUWcPNGUNc7m8aBuD2R+yVyjfyJPVs0BA+oM2KBMgJUSARwD
	wbeOn+gGIDRgrBtOIqwKcZ5RsfcDQdc5yfBaYtl8s4uoCR5/COnSD+8BRMp9nWnZfk9P4dRxSah
	ZMf+YHpL6eqdRs0C2uzJB7oPojRmwwyrVJ+nhQnPVRgS/jv+ejxBkw4ijLOMvg9FIJqA6xLd7pI
	W3oDdRrd/oCuC+JAV5ySv9dfU/sEzwqGDNjACiNmiyvkLoq2MmkkTZjQRYvm1r0wPlxkUx7
X-Google-Smtp-Source: AGHT+IFacKbx/HloTRDyL3KNE+dISSFeSIeO5gnLVmi9ry+Gc3uB4ma+c7Q9oZoxnNZINjg1j054MzA1urN4ujLkRdE=
X-Received: by 2002:a05:651c:419b:b0:378:e3f9:2d26 with SMTP id
 38308e7fff4ca-382ff823bdamr21702801fa.39.1767936379607; Thu, 08 Jan 2026
 21:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org> <20260108-setlease-6-20-v1-13-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-13-ea4dec9b67fa@kernel.org>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 9 Jan 2026 14:26:03 +0900
X-Gm-Features: AQt7F2pmUKGJKWpVwxhIrI-U32G4ALuqYGKPCGsBpfUc51GGTfk1sxJMQ_5a6zs
Message-ID: <CAKFNMok9FG=hhzr8YrHYws5z3jTWOf2TXtFWvSfYbNy6+XLHxw@mail.gmail.com>
Subject: Re: [PATCH 13/24] nilfs2: add setlease file operation
To: Jeff Layton <jlayton@kernel.org>
Cc: Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, 
	Anders Larsen <al@alarsen.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>, 
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chuck Lever <chuck.lever@oracle.com>, Alexander Aring <alex.aring@gmail.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Eric Van Hensbergen <ericvh@kernel.org>, 
	Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, 
	Christian Schoenebeck <linux_oss@crudebyte.com>, Xiubo Li <xiubli@redhat.com>, 
	Ilya Dryomov <idryomov@gmail.com>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, 
	Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, 
	ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org, 
	gfs2@lists.linux.dev, linux-doc@vger.kernel.org, v9fs@lists.linux.dev, 
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_212622_990934_0D66450E 
X-CRM114-Status: GOOD (  19.15  )
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

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCAyOjE14oCvQU0gSmVmZiBMYXl0b24gd3JvdGU6Cj4KPiBB
ZGQgdGhlIHNldGxlYXNlIGZpbGVfb3BlcmF0aW9uIHRvIG5pbGZzX2ZpbGVfb3BlcmF0aW9ucyBh
bmQKPiBuaWxmc19kaXJfb3BlcmF0aW9ucywgcG9pbnRpbmcgdG8gZ2VuZXJpY19zZXRsZWFzZS4g
IEEgZnV0dXJlIHBhdGNoCj4gd2lsbCBjaGFuZ2UgdGhlIGRlZmF1bHQgYmVoYXZpb3IgdG8gcmVq
ZWN0IGxlYXNlIGF0dGVtcHRzIHdpdGggLUVJTlZBTAo+IHdoZW4gdGhlcmUgaXMgbm8gc2V0bGVh
c2UgZmlsZSBvcGVyYXRpb24gZGVmaW5lZC4gQWRkIGdlbmVyaWNfc2V0bGVhc2UKPiB0byByZXRh
aW4gdGhlIGFiaWxpdHkgdG8gc2V0IGxlYXNlcyBvbiB0aGlzIGZpbGVzeXN0ZW0uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgoKTG9va3MgZ29vZCwg
VGhhbmtzIQoKQWNrZWQtYnk6IFJ5dXN1a2UgS29uaXNoaSA8a29uaXNoaS5yeXVzdWtlQGdtYWls
LmNvbT4KClJ5dXN1a2UgS29uaXNoaQoKPiAtLS0KPiAgZnMvbmlsZnMyL2Rpci5jICB8IDMgKyst
Cj4gIGZzL25pbGZzMi9maWxlLmMgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvbmlsZnMyL2Rpci5jIGIv
ZnMvbmlsZnMyL2Rpci5jCj4gaW5kZXggNmNhM2Q3NGJlMWUxNmQ1YmM1NzdlMjUyMGYxZTg0MTI4
N2EyNTExZi4uYjI0MzE5OTAzNmRmYTFhYjIyOTllZmFhYTViZGY1ZGEyZDE1OWZmMiAxMDA2NDQK
PiAtLS0gYS9mcy9uaWxmczIvZGlyLmMKPiArKysgYi9mcy9uaWxmczIvZGlyLmMKPiBAQCAtMzAs
NiArMzAsNyBAQAo+ICAgKi8KPgo+ICAjaW5jbHVkZSA8bGludXgvcGFnZW1hcC5oPgo+ICsjaW5j
bHVkZSA8bGludXgvZmlsZWxvY2suaD4KPiAgI2luY2x1ZGUgIm5pbGZzLmgiCj4gICNpbmNsdWRl
ICJwYWdlLmgiCj4KPiBAQCAtNjYxLDUgKzY2Miw1IEBAIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJh
dGlvbnMgbmlsZnNfZGlyX29wZXJhdGlvbnMgPSB7Cj4gICAgICAgICAuY29tcGF0X2lvY3RsICAg
PSBuaWxmc19jb21wYXRfaW9jdGwsCj4gICNlbmRpZiAvKiBDT05GSUdfQ09NUEFUICovCj4gICAg
ICAgICAuZnN5bmMgICAgICAgICAgPSBuaWxmc19zeW5jX2ZpbGUsCj4gLQo+ICsgICAgICAgLnNl
dGxlYXNlICAgICAgID0gZ2VuZXJpY19zZXRsZWFzZSwKPiAgfTsKPiBkaWZmIC0tZ2l0IGEvZnMv
bmlsZnMyL2ZpbGUuYyBiL2ZzL25pbGZzMi9maWxlLmMKPiBpbmRleCAxYjhkNzU0ZGI0NGQ0NGQy
NWRjZDEzZjAwOGQyNjZlYzgzYzc0ZDNmLi5mOTNiNjhjNDg3N2M1ZWQzNjllOTBiNzIzNTE3ZTEx
NzE0MjMzNWRlIDEwMDY0NAo+IC0tLSBhL2ZzL25pbGZzMi9maWxlLmMKPiArKysgYi9mcy9uaWxm
czIvZmlsZS5jCj4gQEAgLTgsNiArOCw3IEBACj4gICAqLwo+Cj4gICNpbmNsdWRlIDxsaW51eC9m
cy5oPgo+ICsjaW5jbHVkZSA8bGludXgvZmlsZWxvY2suaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21t
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC93cml0ZWJhY2suaD4KPiAgI2luY2x1ZGUgIm5pbGZzLmgi
Cj4gQEAgLTE1MCw2ICsxNTEsNyBAQCBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIG5pbGZz
X2ZpbGVfb3BlcmF0aW9ucyA9IHsKPiAgICAgICAgIC5mc3luYyAgICAgICAgICA9IG5pbGZzX3N5
bmNfZmlsZSwKPiAgICAgICAgIC5zcGxpY2VfcmVhZCAgICA9IGZpbGVtYXBfc3BsaWNlX3JlYWQs
Cj4gICAgICAgICAuc3BsaWNlX3dyaXRlICAgPSBpdGVyX2ZpbGVfc3BsaWNlX3dyaXRlLAo+ICsg
ICAgICAgLnNldGxlYXNlICAgICAgID0gZ2VuZXJpY19zZXRsZWFzZSwKPiAgfTsKPgo+ICBjb25z
dCBzdHJ1Y3QgaW5vZGVfb3BlcmF0aW9ucyBuaWxmc19maWxlX2lub2RlX29wZXJhdGlvbnMgPSB7
Cj4KPiAtLQo+IDIuNTIuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
