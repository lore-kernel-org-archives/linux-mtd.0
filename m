Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F709606A89F
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Nov 2026 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dUrXvfmq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ETF5Z0WA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bLlhJayHc5ScpLWCw2bqwMebHBS27AUdUVFrF+DAbgM=; b=dUrXvfmqZPGiOmMueFv/icrSFm
	cgI7uaXgFZUT+E38HLLMAzcqK/wmTt6XDQXKoGfIQwRM5XyddltnYqdSB82Ay0pF4dknd/MwIfqfa
	HTaRIqniN28kBlr0WqKs7BSmFHyHb7nnykvXhelrnFLzd2UdYM4YxCaEAItqBYWyblIefq7/fEDtd
	fN3B/vQyhbRHUgOp6HaMPyoE7lCx4sLd/dGseycJHdyjpAsWflEvlkhxu6bMM5rUUoGb8qzEqm3kQ
	pUEF7tZjNkWLjiIvcb6A+/fcpPnN9JZYEmRp0ZeInBYLXtcDBF5IhOxTOxNRwJVT5cDqxAIIdOdpK
	jtwcPyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgpa-00000000Qvr-0i8r;
	Sun, 15 Nov 2026 20:28:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgpZ-00000000QvY-14eQ
	for linux-mtd@lists.infradead.org;
	Sun, 15 Nov 2026 20:28:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 034B441AB6;
	Sun, 15 Nov 2026 20:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DCB1F000C4;
	Sun, 15 Nov 2026 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774484;
	bh=iL9gs0hHi938yh2WI7Rig0yplwSjqvzkRGjQ5uPboKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ETF5Z0WAqh95BGpkVJKfpqGcs9JI8RAoRt4nI+73Jvpwec+3LLtpvx5oLIOpOfGsT
	 GOEPDW9rPmVNyvWKj75N4qe/uuqYO9Ct+c+rkqTJy8JuSRXz8Cd8ame+5r1JLvG/3A
	 reDElin5T7+X5Y7q3072wbnRv3MkRD1vWKJ66eWwdYKSqePxhpqdkT13QWNUnnpmGY
	 uWWkItczjTLp6aObld3Ovht8ffOQ/ZvRuyPp7S9k0+Fw6T0VXIdNJKdR58ItUCYtae
	 UkRrFmwjS4VMsil7spiRSB/64XxcHyS+/KBT36lH7fuE9R+NdOThy0hIAK8YBBEQQ1
	 KRVyv4dQidmtA==
Message-ID: <sashiko-outbox-215810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/12] docs: ioctl-number: update FS entries
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
In-Reply-To: <20261114202653.3113381-11-rdunlap@infradead.org>
References: <20261114202653.3113381-1-rdunlap@infradead.org>
 <20261114202653.3113381-11-rdunlap@infradead.org>
Date: Sun, 15 Nov 2026 20:27:54 +0000
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
OiBleHQ0IDAwLTJGIGlvY3RsIHJhbmdlIHBvaW50cyB0bwogIGZzL2V4dDQvZXh0NC5oIGluc3Rl
YWQgb2YgdWFwaS9saW51eC9leHQ0LmgKLS0KCmNvbW1pdCA5MDcyYTgxOTlkMmJlMDg1ZGM1YWIy
NTY3MzkyMTgwZmFmODEwYzZkCkF1dGhvcjogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVh
ZC5vcmc+Cgpkb2NzOiBpb2N0bC1udW1iZXI6IHVwZGF0ZSBGUyBlbnRyaWVzCgpUaGlzIGNvbW1p
dCB1cGRhdGVzIHRoZSBoZWFkZXIgZmlsZSBwYXRocyBhbmQgc2VxdWVuY2UgbnVtYmVyIHJhbmdl
cyBmb3IKZmlsZXN5c3RlbSBpb2N0bHMgaW4gRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lv
Y3RsL2lvY3RsLW51bWJlci5yc3QuCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3VzZXJz
cGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdCBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNl
LWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0Cj4gaW5kZXggODdlNTQ3YmU5ZTJhYy4uYWJjODli
NjI4OGJhMyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwv
aW9jdGwtbnVtYmVyLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0
bC9pb2N0bC1udW1iZXIucnN0CgpbIC4uLiBdCgo+IEBAIC0yNzUsNyArMjc2LDcgQEAgQ29kZSAg
U2VxIyAgICBJbmNsdWRlIEZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBDb21tZW50cwo+ICAnZicgICAwMC0xRiAgbGludXgvZXh0Ml9mcy5oICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQo+ICAnZicgICAwMC0x
RiAgbGludXgvZXh0M19mcy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbmZsaWN0IQo+ICAnZicgICAwMC0wRiAgZnMvamZzL2pmc19kaW5vZGUuaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQo+IC0nZicgICAwMC0wRiAg
ZnMvZXh0NC9leHQ0LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbmZsaWN0IQo+ICsnZicgICAwMC0yRiAgZnMvZXh0NC9leHQ0LmggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQoKW1NldmVyaXR5OiBMb3ddClNo
b3VsZCB0aGlzIGVudHJ5IHBvaW50IHRvIHVhcGkvbGludXgvZXh0NC5oIChvciBib3RoIGhlYWRl
cnMpIGluc3RlYWQgb2YKb25seSBmcy9leHQ0L2V4dDQuaD8KCkNvbW1pdCA1MTlmZTFiYWU3ZTIg
KCJleHQ0OiBBZGQgYSB1YXBpIGhlYWRlciBmb3IgZXh0NCB1c2Vyc3BhY2UgQVBJcyIpCm1vdmVk
IHRoZSBFWFQ0X0lPQ18qIGRlZmluaXRpb25zIHNwYW5uaW5nIDB4MDMgdGhyb3VnaCAweDJFIGlu
dG8KaW5jbHVkZS91YXBpL2xpbnV4L2V4dDQuaCwgbGVhdmluZyBvbmx5IHRoZSBjb21wYXQgRVhU
NF9JT0MzMl8qIGRlZmluaXRpb25zCigweDAzIHRocm91Z2ggMHgwOCkgaW4gZnMvZXh0NC9leHQ0
LmguCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYxMTE0MjAyNjUzLjMxMTMzODEtMS1yZHVubGFwQGluZnJhZGVhZC5vcmc/cGFydD0x
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
