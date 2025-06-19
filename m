Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C32BC7115D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipQBbzIqeGR4/WrzHg2MVcZabF5ZQEQtS8izOLyuNM0=; b=xxUrgdDDZeiINL
	9/0SN/DTDaQyISs2mEVcxjrvFjjiJasOXMM2NC3CMr4zP63cX/dCL5ttRV8DvUR8bUGL3YD1e0Fga
	vQJnt3W3HXxASHd9zsDBY9lfjgvAGzZVghJEVZbk784s0bAmTu8jzH6QHoVE1Hr1tWoov6PdXyy66
	vWyGjIIJRdZtXaCLgO4/SX+5pEP7HqjHx/S9bd7wVWx5NkBDfdfaKYpB+ryt1Q/bIkqLdq1U4BJ9Q
	eFKYVdvzFwp33627jyi4u0CDk+/Gx8qZHpr2m5kGcRyRLf+17f1i4QbxOsXomxpW67jZ98lLJ4Z+x
	RUT37rkwtuXqITjtq8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKDZ-0000000E0a1-3jwp;
	Thu, 19 Jun 2025 18:42:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJN6-0000000Do61-1hbM;
	Thu, 19 Jun 2025 17:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YvO5fzYLvhWnXwDLeu0osljtoe46Ll4TNlde5gM445I=; b=qPzBgSE18GECzxPD/Jej04d5D7
	oPOwnwW1jBfWw0/AJ0OvVqGHfSDkBoxemXuq5eNmgnbYT7tSRtZnEHDpvvgtUv9FkfVxblTXfgxhA
	iWaK9ZSaCTHWmAPJ6UB9LKJ7eCnfkfbNG0n+EhhO1HL0LgE+JPkfwnMYh2/44CJS1oGzuY2nJo4u4
	0WhqwFXEYog+IT/Hsg7fj6HI0QO0q3u1osQS4+Y1B6jYB8CydQVjog1cUcPiDkkpqo4Oj5UeHpwwv
	YmW3iTVwtuyKI/UFTh2i3IuqiWmGitYYja2pheMdv3sjwtZXBKO2oVC3IGRThZaV1KyPWtOsC8Rc4
	IPg+iqdg==;
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJN4-00000004W0a-08p6;
	Thu, 19 Jun 2025 17:48:19 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32b855b468bso9819991fa.3;
        Thu, 19 Jun 2025 10:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750355295; x=1750960095; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvO5fzYLvhWnXwDLeu0osljtoe46Ll4TNlde5gM445I=;
        b=XLkQnt767jWaN5tHHjii6D+7mWMvi3+cn126Qv1l7/qy8gXvzkBT3StuYVii2E9BKU
         mEZEaU87IGQh9lVBOXr1rvaZC2mmYqEwYdONbSLuPs1s10Mt9Q2+NLDD8YO1adLgLsEh
         UKWqplPNLox9IW0I40eEsP/OiK2RusI6nZDOlRrZrhizgAcAJA2Z1nRYsRov2tuz/UgK
         hG4a1AhJcj9lcZVxVpUfzBG3gsGmI99EF0OVVrh1CjIhUFbJSRydHURSq1zcHw4hMpzY
         s+WNubyWiJBUWYJh6vyX6CuIHOpvlOrtlPlf/zjZrrPNXfepU59R7PWX5UdKqUZ+1Nvz
         zyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750355295; x=1750960095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvO5fzYLvhWnXwDLeu0osljtoe46Ll4TNlde5gM445I=;
        b=YQZXeqdhRGAs+CRwY1xmVue3oFOZrJyl/f3Qg6QA2CF4ZptSWCFtgy6L9fL7HoAZnT
         DBgfbx6413y2Vwb8JQ7ugJYjzpTjI+4Ukkx8TLOFnmUGXr7cjgMcxVWW5mhYTolcFaOs
         tJBwUAlxITz24loWt3V9q3GcFCwtwz6uGZ3e8M4UVxgUV23Y/0hDxVP4MbiR+NNTEeDJ
         H9dzbDiBhXWLv3ShQRr/All1QmFEEb2ttT3M550g2HJMz8+IRzpeVq56uisXRIzBwgT1
         kUImdfV6Qb/PciJukjWU9hsEJkx+DVyteve9xa1GBakafwnZjbhtQPD1EZOoUvbjoUjB
         8TXA==
X-Forwarded-Encrypted: i=1; AJvYcCV/SOtpRLL41BP40P5Y1he0wxJWuMaUuwoxnhDJKSXa6ju6hkhdZU+7hjRAIkG7NYU/IF0uAAHiYEM=@lists.infradead.org, AJvYcCVFyAxrXiBkKl++56wGCleP0slUPKaZWP/ZXeBCpOTYqCkbh3vw8XN7brybMaWmcHiD/RP8HJYqHuQY@lists.infradead.org, AJvYcCWTDjYv8JsYsJunDbj7Kph/8A1tfqhE2zq5n03PxG4LS1mQ7dIMYAcGYaXh/6L4iRpdMA3RTZyf+G8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwY1lVK3iiGHOIljr2wSG65Nak/vvAoc10XBEZpu2hmOjcaefJ8
	DauDkjxNScR+yQyTKNbs10vpSgL+iy6BVSltrI075QXjI+r7L6nfDn556E/T2sRyqKJcAPRy6kQ
	jk1+8kSvBb26lZncnjD4fIJW5YfhdMKM=
X-Gm-Gg: ASbGncs9LzBYOSokayHrDDKZIWFISCLVi4g8nIIGIcxq8lPM27I/NDWWCMoJX/Iv6AJ
	bVkLb1zwrCKm6XYB+T0Bvvc8XKwUvROIugXWFIVskWRYPQKClztJdMNDqT9GdPoX55IdkmbBHiQ
	LmOGMoMRjzvzuJLZjP1IeEwpWzB0eAfBHJP59QQ8awEyZKDN0/dkkjENhpkx++txLjdXYDjiFGL
	CyjAA==
X-Google-Smtp-Source: AGHT+IGL41V3DbmFvBsWr3jGwFHfcX0duW69mbczpCAOINsa85ECUigYdfUlpWqgF++enxibRnhFFvr8Kxdp2WtP+R0=
X-Received: by 2002:a05:651c:2203:b0:32a:8297:54c9 with SMTP id
 38308e7fff4ca-32b4a3088bbmr63065741fa.8.1750355294494; Thu, 19 Jun 2025
 10:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com> <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 20 Jun 2025 02:47:58 +0900
X-Gm-Features: AX0GCFsRgomy43xV-Lv7Stfld1a1yqIyJ3-ysZ2OVO90S8cEE5UAjZMSvGqxZQ8
Message-ID: <CAKFNMom4NJ91Ov7twQ3AGT7PSqt5vN9ROrNHzfV53GHf=bK6oQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] fs: replace mmap hook with .mmap_prepare for simple mappings
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Jens Axboe <axboe@kernel.dk>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, 
	Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, 
	David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Benjamin LaHaise <bcrl@kvack.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, 
	"Tigran A . Aivazian" <aivazian.tigran@gmail.com>, Kees Cook <kees@kernel.org>, Chris Mason <clm@fb.com>, 
	Josef Bacik <josef@toxicpanda.com>, Xiubo Li <xiubli@redhat.com>, 
	Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
	Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Yuezhang Mo <yuezhang.mo@sony.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Viacheslav Dubeyko <slava@dubeyko.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, 
	Dave Kleikamp <shaggy@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Bob Copeland <me@bobcopeland.com>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Steve French <sfrench@samba.org>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	Bharath SM <bharathsm@microsoft.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Hans de Goede <hdegoede@redhat.com>, Carlos Maiolino <cem@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, 
	Johannes Thumshirn <jth@kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, v9fs@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-aio@kvack.org, linux-unionfs@vger.kernel.org, 
	linux-bcachefs@vger.kernel.org, linux-mm@kvack.org, 
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
	codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-um@lists.infradead.org, 
	linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, 
	linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, linux-karma-devel@lists.sourceforge.net, 
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-xfs@vger.kernel.org, 
	nvdimm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_184818_195911_4AAA6631 
X-CRM114-Status: GOOD (  15.99  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgNDo0OOKAr0FNIExvcmVuem8gU3RvYWtlcyB3cm90ZToK
Pgo+IFNpbmNlIGNvbW1pdCBjODRiZjZkZDJiODMgKCJtbTogaW50cm9kdWNlIG5ldyAubW1hcF9w
cmVwYXJlKCkgZmlsZQo+IGNhbGxiYWNrIiksIHRoZSBmX29wLT5tbWFwKCkgaG9vayBoYXMgYmVl
biBkZXByZWNhdGVkIGluIGZhdm91ciBvZgo+IGZfb3AtPm1tYXBfcHJlcGFyZSgpLgo+Cj4gVGhp
cyBjYWxsYmFjayBpcyBpbnZva2VkIGluIHRoZSBtbWFwKCkgbG9naWMgZmFyIGVhcmxpZXIsIHNv
IGVycm9yIGhhbmRsaW5nCj4gY2FuIGJlIHBlcmZvcm1lZCBtb3JlIHNhZmVseSB3aXRob3V0IGNv
bXBsaWNhdGVkIGFuZCBidWctcHJvbmUgc3RhdGUKPiB1bndpbmRpbmcgcmVxdWlyZWQgc2hvdWxk
IGFuIGVycm9yIGFyaXNlLgo+Cj4gVGhpcyBob29rIGFsc28gYXZvaWRzIHBhc3NpbmcgYSBwb2lu
dGVyIHRvIGEgbm90LXlldC1jb3JyZWN0bHktZXN0YWJsaXNoZWQKPiBWTUEgYXZvaWRpbmcgYW55
IGlzc3VlcyB3aXRoIHJlZmVyZW5jaW5nIHRoaXMgZGF0YSBzdHJ1Y3R1cmUuCj4KPiBJdCByYXRo
ZXIgcHJvdmlkZXMgYSBwb2ludGVyIHRvIHRoZSBuZXcgc3RydWN0IHZtX2FyZWFfZGVzYyBkZXNj
cmlwdG9yIHR5cGUKPiB3aGljaCBjb250YWlucyBhbGwgcmVxdWlyZWQgc3RhdGUgYW5kIGFsbG93
cyBlYXN5IHNldHRpbmcgb2YgcmVxdWlyZWQKPiBwYXJhbWV0ZXJzIHdpdGhvdXQgYW55IGNvbnNp
ZGVyYXRpb24gbmVlZGluZyB0byBiZSBwYWlkIHRvIGxvY2tpbmcgb3IKPiByZWZlcmVuY2UgY291
bnRzLgo+Cj4gTm90ZSB0aGF0IG5lc3RlZCBmaWxlc3lzdGVtcyBsaWtlIG92ZXJsYXlmcyBhcmUg
Y29tcGF0aWJsZSB3aXRoIGFuCj4gLm1tYXBfcHJlcGFyZSgpIGNhbGxiYWNrIHNpbmNlIGNvbW1p
dCBiYjY2NmI3YzI3MDcgKCJtbTogYWRkIG1tYXBfcHJlcGFyZSgpCj4gY29tcGF0aWJpbGl0eSBs
YXllciBmb3IgbmVzdGVkIGZpbGUgc3lzdGVtcyIpLgo+Cj4gSW4gdGhpcyBwYXRjaCB3ZSBhcHBs
eSB0aGlzIGNoYW5nZSB0byBmaWxlIHN5c3RlbXMgd2l0aCByZWxhdGl2ZWx5IHNpbXBsZQo+IG1t
YXAoKSBob29rIGxvZ2ljIC0gZXhmYXQsIGNlcGgsIGYyZnMsIGJjYWNoZWZzLCB6b25lZnMsIGJ0
cmZzLCBvY2ZzMiwKPiBvcmFuZ2VmcywgbmlsZnMyLCByb21mcywgcmFtZnMgYW5kIGFpby4KPgo+
IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyA8bG9yZW56by5zdG9ha2VzQG9yYWNsZS5j
b20+CgpGb3IgbmlsZnMyLAoKQWNrZWQtYnk6IFJ5dXN1a2UgS29uaXNoaSA8a29uaXNoaS5yeXVz
dWtlQGdtYWlsLmNvbT4KClRoYW5rcywKUnl1c3VrZSBLb25pc2hpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
