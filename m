Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A548606A885
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Nov 2026 20:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QXVocCt+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQQaKT6Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YG1OyVHxnvgbwJIORqgc9DN46KX5uWbu5VzUb0yfVcM=; b=QXVocCt+jD67GHnSWWEnZE413o
	BldIbANX9OqsRAPMm8vCONFBg/lLs1b8GUN5Eol2EzoJn1tVdyq6OtsBvVEcZAqGcplfSnPZOMRXa
	vrwx9hmGvnxvFWPugZhzetMzdmFpZbouxPBUbyZ9xEaegSDV53QW2MXtWtkIHCyR8EIqCz9S2i8lG
	Pb/DFqxCb5c2i3Z8DMQlfGlh9M8uP/3ekkgnJr51G+qiQalsAb2L8WvXl+5Yc5OtKXYfEnGzMhEUH
	otPc+0hGIO6btn+iMpfnHgV4UlbLd5pt2wroRvpHc5P3PGi8awR17mi6u0f0mL0FYTAB1I6bNZJ/Q
	dprjQ1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgpJ-00000000Qpb-40ND;
	Sun, 15 Nov 2026 20:27:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgpI-00000000Qp0-0kg7
	for linux-mtd@lists.infradead.org;
	Sun, 15 Nov 2026 20:27:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 559EF41E74;
	Sun, 15 Nov 2026 20:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAB51F000C4;
	Sun, 15 Nov 2026 20:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774467;
	bh=8gu33mrYXMzWB1guqs3vj2T3i7/kLEK1yfs/DV8sZmU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eQQaKT6QNia4M5fkN9vM/bS1Y/kK95Wo46QLhfi33KjcOH3lSRaIkcpl/SLpHMFrw
	 X11TMh2ra+V6g5NZEdBHr2So5k+ffsdxljUpW2UMZowoER6RAEkHJt0oc6nNYZHgio
	 OIZh2f8aULqySK74+IyVCP0a7rZpkLLcMDZn9Cs+JVVmYWVBaCNkzBO5O2JsN4cT2b
	 mVuRyIGfepUrdagbltdNOutkz4F+8m7mXRld5fg+/MwG9xiVPu3FYKoDZVNxB8e5pF
	 oUjJpYPMxLdqf3ESWBNQ2Z+E6J37XbR7aZTaJuq3dUdBkvCUkgV+gArRjgwg7l8a7a
	 ZyoDGdiR4Rfag==
Message-ID: <sashiko-outbox-215804@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/12] docs: ioctl-number: update networking entries
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
 Brost" <matthew.brost@intel.com>, =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261114202653.3113381-5-rdunlap@infradead.org>
References: <20261114202653.3113381-1-rdunlap@infradead.org>
 <20261114202653.3113381-5-rdunlap@infradead.org>
Date: Sun, 15 Nov 2026 20:27:43 +0000
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
OiBkdXBsaWNhdGUgYm5lcC5oIGVudHJ5IGFuZCBtaXNzaW5nIGNvbmZsaWN0CiAgbWFya2VyCi0t
Cgpjb21taXQgYWNmOTVjNGQ0NmJmODdhYjhmYWIzODI5MTE5OTNmNmU4Mzg2NGFmYwpBdXRob3I6
IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgoKZG9jczogaW9jdGwtbnVtYmVy
OiB1cGRhdGUgbmV0d29ya2luZyBlbnRyaWVzCgpUaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBuZXR3
b3JraW5nIGlvY3RsIGZpbGUgcGF0aHMgYW5kIGZ1bmN0aW9uIG51bWJlcgpyYW5nZXMgaW4gRG9j
dW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QuCgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJz
dCBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0Cj4g
aW5kZXggMmIyZDNmZDMxNzE1OC4uY2Q0ZjBiZjZkYjY2YSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0Cj4gQEAgLTEzMiw2
ICsxMzIsNyBAQCBDb2RlICBTZXEjICAgIEluY2x1ZGUgRmlsZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIENvbW1lbnRzCj4gICdCJyAgIDAwLTBGICBpbmNsdWRl
L2xpbnV4L3BtdS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxp
Y3QhCj4gICdCJyAgIEMwLUZGICBhZHZhbmNlZCBiYnVzICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPG1haWx0bzptYWFzc2VuQHVuaS1mcmVpYnVyZy5kZT4KPiAg
J0InICAgMDAtMEYgIHhlbi94ZW5idXNfZGV2LmggICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25mbGljdCEKPiArJ0InICAgQzgtRDQgIG5ldC9ibHVldG9vdGgvYm5l
cC9ibmVwLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bWFpbHRvOmxpbnV4LWJs
dWV0b290aEB2Z2VyLmtlcm5lbC5vcmc+Cj4gICdDJyAgIGFsbCAgICBsaW51eC9zb3VuZGNhcmQu
aCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCj4gICdD
JyAgIDAwLTY4ICBzb3VuZC9jb21wcmVzc19vZmZsb2FkLmggICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uZmxpY3QhCj4gICdDJyAgIDAxLTJGICBsaW51eC9jYXBpLmggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCj4gQEAgLTE3
Myw3ICsxNzQsNyBAQCBDb2RlICBTZXEjICAgIEluY2x1ZGUgRmlsZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIENvbW1lbnRzCj4gICdIJyAgIEZDICAgICBzb3Vu
ZC9wY2kvYXNpaHBpL2hwaW9zLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
ZmxpY3QhCj4gICdIJyAgIDAwLTBGICB1YXBpL21pc2MvaGFiYW5hbGFicy5oICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCj4gICdIJyAgIEEwICAgICB1YXBpL2xp
bnV4L3VzYi9jZGMtd2RtLmgKPiAtJ0gnICAgQzAtRjAgIG5ldC9ibHVldG9vdGgvaGNpLmggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKPiArJ0gnICAgQzAt
RjAgIG5ldC9ibHVldG9vdGgvaGNpX3NvY2suaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25mbGljdCEKPiAgJ0gnICAgQzAtREYgIG5ldC9ibHVldG9vdGgvaGlkcC9oaWRwLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKPiAgJ0gnICAgQzAtREYg
IG5ldC9ibHVldG9vdGgvY210cC9jbXRwLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25mbGljdCEKPiAgJ0gnICAgQzAtREYgIG5ldC9ibHVldG9vdGgvYm5lcC9ibmVwLmggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKCltTZXZlcml0eTogTG93XQpT
aG91bGQgdGhlICdIJyBDMC1ERiBlbnRyeSBmb3IgbmV0L2JsdWV0b290aC9ibmVwL2JuZXAuaCBi
ZSByZW1vdmVkIG5vdwp0aGF0ICdCJyBDOC1ENCBpcyBhZGRlZCwgYW5kIHNob3VsZCB0aGUgJ0In
IEMwLUZGIGFuZCAnQicgQzgtRDQgZW50cmllcwpiZSBtYXJrZWQgd2l0aCBjb25mbGljdCE/Cgpu
ZXQvYmx1ZXRvb3RoL2JuZXAvYm5lcC5oIG9ubHkgZGVmaW5lcyAnQicgaW9jdGxzIChCTkVQQ09O
TkFERCB0aHJvdWdoCkJORVBHRVRTVVBQRkVBVCwgMjAwLTIxMikgYW5kIG5vbmUgd2l0aCBjb2Rl
ICdIJywgd2hpbGUgJ0InIEM4LUQ0Cm92ZXJsYXBzIHdpdGggdGhlICdCJyBDMC1GRiByYW5nZSBm
b3IgYWR2YW5jZWQgYmJ1cy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hp
a28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTQyMDI2NTMuMzExMzM4MS0xLXJkdW5sYXBAaW5mcmFk
ZWFkLm9yZz9wYXJ0PTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
