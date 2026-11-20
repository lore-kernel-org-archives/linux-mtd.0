Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54B606A335
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 05:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oy/irSER;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eze1Mzwt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c0/FYPdbojramplNHRpODpKnrb6HM+sHidHf+YQSxzo=; b=oy/irSERLiAoQhmDpKPNKVFYJk
	HARy1wbpzMbaxOvAK5cy8UhlyJFkF5j6gVDgwiesMpr5XGQdCLNTMNnAzBl0BXQvRlWkNB5SNeIJd
	TlKPZcpqcztubWuGB2EQUouK/OnPihSIYMYXFtpGMBKvBgyCtIaf0z0BdeFurdpbKNRJJ7QjDwZYv
	/5eruYc7SZMYs2WWLEvaHz4C4zwELygdbnDmzZOHjeg4GriWRNU6gMgAbmq8sx02R7EGBgi+rIN7y
	TZnI30SkujUJSALZSiO4FSXHGGqzS1xqu98eYOpHoVqgZAtvnm4wEmVo5N5O2qKLo7nRwX3FGjFoq
	eEpfxT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHIC-0000000E5Tg-3oSh;
	Fri, 20 Nov 2026 05:36:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHI8-0000000E5Po-10rs
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 05:36:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA1844139C;
	Fri, 20 Nov 2026 05:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EBB1F000CF;
	Fri, 20 Nov 2026 05:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795152967;
	bh=tqyp9zPjjrIezYjpSAwpdJah8XiLFf3uLh8Q8IRH3Y0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eze1Mzwt1W+/jjpdnS4Mc6QQGi7FHo4IRG4Jao3lIte7M/tv9sgiqFgzFJgqdn1Wg
	 CMDoNFUjH0MKHAMwCYD/g6xavaGlisejHwL4hdvtHm5aASz1Z2O5amwKoGDupAO3Pg
	 IdEqIV9EyTe5Ck5P8UoEA4oJnX0znhaLzxBfrxFlP36lsgUFxdOFykApvtM9pKUMjo
	 L3EoiQUfJrOlHG4kOs2MsDsE1XDy8gKBjGRm/AASTcV2+72O/kvXJKm4/bXo2bihfP
	 31CDZ1VR4ONh2hBQe6FEep0/vD70MLSZVOEiI8zDuP09QLwQKmpmLnM8q+MaS+9kRg
	 X1V0IXqJoOkqQ==
Message-ID: <sashiko-outbox-224494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/12] docs: ioctl-number: update sound entries
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "David
 Hildenbrand" <david@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>, "Jason
 Gunthorpe" <jgg@nvidia.com>, "Leon Romanovsky" <leonro@nvidia.com>, linux-mm@kvack.org, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, linux-sound@vger.kernel.org, "Jens
 Axboe" <axboe@kernel.dk>, "Marcel Holtmann" <marcel@holtmann.org>, "Luiz
 Augusto von Dentz" <luiz.dentz@gmail.com>, "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>, "Jason
 Wang" <jasowangio@gmail.com>, "David Heidelberg" <david@ixit.cz>, "Chas
 Williams" <3chas3@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Helge Deller" <deller@gmx.de>, dri-devel@lists.freedesktop.org, MPT-FusionLinux.pdl@broadcom.com, "James
 E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K.
 Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Zhihao
 Cheng" <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Neill
 Kapron" <nkapron@google.com>, "Andrey Konovalov" <andreyknvl@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, "Juergen
 Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Hans
 de Goede" <hansg@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>, "Michael S.
 Tsirkin" <mst@redhat.com>, =?utf-8?b?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, "Sean
 Christopherson" <seanjc@google.com>, "Paolo Bonzini" <pbonzini@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux.dev, "Jan
 Kara" <jack@suse.cz>, =?utf-8?b?VGhlb2RvcmUgVHMnbw==?= <tytso@mit.edu>, linux-ext4@vger.kernel.org, "Mike
 Marshall" <hubcap@omnibond.com>, devel@lists.orangefs.org, "Paulo Alcantara" <pc@manguebit.org>, "Namjae
 Jeon" <linkinjeon@kernel.org>, "Jaegeuk Kim" <jaegeuk@kernel.org>, "Chao Yu" <chao@kernel.org>, "Florian
 Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal kernel review
 list" <bcm-kernel-feedback-list@broadcom.com>, "Tzung-Bi Shih" <tzungbi@kernel.org>, "Benson
 Leung" <bleung@chromium.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>, intel-xe@lists.freedesktop.org, "Takashi
 Sakamoto" <o-takashi@sakamocchi.jp>
In-Reply-To: <20261119053514.255348-3-rdunlap@infradead.org>
References: <20261119053514.255348-1-rdunlap@infradead.org>
 <20261119053514.255348-3-rdunlap@infradead.org>
Date: Fri, 20 Nov 2026 05:36:04 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gZG9jczogaW9jdGwtbnVtYmVy
OiBpbmNvbXBsZXRlIHNlcXVlbmNlIHJhbmdlIGZvcgogIHNvdW5kL3NjYXJsZXR0Mi5oCi0tCgpj
b21taXQgOTNhNGY2MzVlZDAwMTczNWU5MzlhM2RjNGEyNTI2ZThhZjllOWJkMApBdXRob3I6IFJh
bmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgoKZG9jczogaW9jdGwtbnVtYmVyOiB1
cGRhdGUgc291bmQgZW50cmllcwoKVGhpcyBjb21taXQgdXBkYXRlcyB0aGUgaW9jdGwtbnVtYmVy
IGRvY3VtZW50YXRpb24gdGFibGUgd2l0aCBhZGRpdGlvbmFsCnNvdW5kIHN1YnN5c3RlbSBmaWxl
cyBhbmQgc2VxdWVuY2UgbnVtYmVyIHJhbmdlcy4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0IGIvRG9jdW1lbnRhdGlvbi91
c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QKPiBpbmRleCBlMWQ1NmQ1Y2NjZDE0
Li5mMjlkMmMxN2NhN2I5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFw
aS9pb2N0bC9pb2N0bC1udW1iZXIucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2Ut
YXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QKClsgLi4uIF0KCj4gQEAgLTIwNCw2ICsyMDksOSBA
QCBDb2RlICBTZXEjICAgIEluY2x1ZGUgRmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIENvbW1lbnRzCj4gICdTJyAgIDgwLTgxICBzY3NpL3Njc2lfaW9jdGwu
aCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCj4gICdT
JyAgIDgyLUZGICBzY3NpL3Njc2kuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uZmxpY3QhCj4gICdTJyAgIDAwLTdGICBzb3VuZC9hc2VxdWVuY2VyLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCj4gKydTJyAg
IDIwLTUyICBzb3VuZC9jb3JlL3NlcS9zZXFfY29tcGF0LmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uZmxpY3QhCj4gKydTJyAgIDYwLTYzICBzb3VuZC9zY2FybGV0dDIuaCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCgpbU2V2ZXJpdHk6
IExvd10KU2hvdWxkIHRoZSBzZXF1ZW5jZSByYW5nZSBmb3Igc291bmQvc2NhcmxldHQyLmggYmUg
NjAtNjQ/CmluY2x1ZGUvdWFwaS9zb3VuZC9zY2FybGV0dDIuaCBhbHNvIGRlZmluZXMKU0NBUkxF
VFQyX0lPQ1RMX0dFVF9FUkFTRV9QUk9HUkVTUyB3aXRoIHNlcXVlbmNlIG51bWJlciAweDY0OgoK
aW5jbHVkZS91YXBpL3NvdW5kL3NjYXJsZXR0Mi5oOgojZGVmaW5lIFNDQVJMRVRUMl9JT0NUTF9H
RVRfRVJBU0VfUFJPR1JFU1MgXAoJX0lPUignUycsIDB4NjQsIHN0cnVjdCBzY2FybGV0dDJfZmxh
c2hfc2VnbWVudF9lcmFzZV9wcm9ncmVzcykKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTkwNTM1MTQuMjU1MzQ4LTEtcmR1bmxh
cEBpbmZyYWRlYWQub3JnP3BhcnQ9MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
