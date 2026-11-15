Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A5A606A881
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Nov 2026 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sE6Il05B;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImwEBJaq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LPLiVb9d839GZUrQRCX7MEDY490MNfaabx0TpNUXKLg=; b=sE6Il05BETz4sOrwYmsMSPM1bX
	IC4+N4WFrQ+GZKKaVJ6Q4tirNQxJe2aUFMvrxHD5NqiC6y+tVeccwjLq0SR6zWltkNVRI999HqSJ8
	3r8cu0OeahSW1KQ5TuISonc4FNVUHfx9rsd92/5JEykaWoyYjqQ9SFn0eBhriLHcaovQUNxc2m7rE
	hSNXNWSf+v17OuSpL5BDRFUOik/g39BTg2ydCfb6ZLe6cQghkzPdRdGREPHpnIR5sJT2yPH18rWnk
	EZmlaoaWVLUvDjtYnZjWV06v5ukCcyfN1r7Jsd7hbmw1qlzMXysauhWU+8m0O/yb9kmBEOTy0psHG
	gu9Ykqyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgpO-00000000Qqn-0Eky;
	Sun, 15 Nov 2026 20:27:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgpN-00000000QqN-1f18
	for linux-mtd@lists.infradead.org;
	Sun, 15 Nov 2026 20:27:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B313C41AB6;
	Sun, 15 Nov 2026 20:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4081F000C6;
	Sun, 15 Nov 2026 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774472;
	bh=VdczhNN3rVTkdzSKO/1FEF2ObIEkmXp6tYC01E0w0n0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ImwEBJaq0nehyC/JF9/iqbjz5qT+awTRS1rhu59kzLmGMo98Mvzh4P4MxHjn3QEhd
	 LdruBaWqwycsIv9VzmTkygHkWfaHareFtghbZyuL728hNd+MhXMD1btY8h5c5JgNTA
	 F3f+HW+jOq2DAS+9cBjKYIqx/caWoQhZgT3lwtzPSlDGSljTPoOw4VoK3PwtvM2sy0
	 Jt/bs3s21iolxS8OtIFa1DXW89RWjNpR5VoGh40DxeLKfozQXUEhwhUhLyFiUHn9cQ
	 4Nc4NypjRd3VCQqb43rzmgdLn24tDFN2pZW14vSWhtim/Oa3QBHVPBQA7hCv0vA5Xk
	 RQuCq+oeh2NOw==
Message-ID: <sashiko-outbox-215807@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/12] docs: ioctl-number: update MTD entries
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
In-Reply-To: <20261114202653.3113381-8-rdunlap@infradead.org>
References: <20261114202653.3113381-1-rdunlap@infradead.org>
 <20261114202653.3113381-8-rdunlap@infradead.org>
Date: Sun, 15 Nov 2026 20:27:49 +0000
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
OiBtaXNzaW5nIHVwZGF0ZSBvZiAnTycgcmFuZ2UgZm9yCiAgbXRkL3ViaS11c2VyLmggdG8gMDAt
MDgKLS0KCmNvbW1pdCBjY2YxYjc3YjQ2NDg0ZDU1ZmJjN2VlMDJkOTNhNzFlYmFiMTZmMDEwCkF1
dGhvcjogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cgpkb2NzOiBpb2N0bC1u
dW1iZXI6IHVwZGF0ZSBNVEQgZW50cmllcwoKVGhpcyBjb21taXQgdXBkYXRlcyB0aGUgc2VxdWVu
Y2UgbnVtYmVyIHJhbmdlcyBhbmQgZmlsZSBlbnRyaWVzIGZvciBNVEQKYW5kIFVCSSBpb2N0bHMg
aW4gRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QuCgo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVt
YmVyLnJzdCBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIu
cnN0Cj4gaW5kZXggZDQ3ZjgxNzMzNTY2Ni4uMWZmNGZkNGJmOWI1YyAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0CgpbIC4u
LiBdCgo+IEBAIC0zMDYsNyArMzA2LDcgQEAgQ29kZSAgU2VxIyAgICBJbmNsdWRlIEZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDb21tZW50cwo+ICAnbicg
ICBFMC1GRiAgbGludXgvbWF0cm94ZmIuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG1hdHJveGZiCj4gICduJyAgIEY4LUZBICB2aWRlby9zaXNmYi5oICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2lzZmIKPiAgJ28nICAgMDAtMUYg
IGZzL29jZnMyL29jZnMyX2ZzLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBPQ0ZTMgo+IC0nbycgICAwMC0wMyAgbXRkL3ViaS11c2VyLmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0ISAoT0NGUzIgYW5kIFVCSSBvdmVybGFw
cykKPiArJ28nICAgMDAtMDYgIG10ZC91YmktdXNlci5oICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEgKE9DRlMyIGFuZCBVQkkgb3ZlcmxhcCkKCltT
ZXZlcml0eTogTG93XQpTaG91bGQgdGhlICdPJyBlbnRyeSBmb3IgbXRkL3ViaS11c2VyLmggYWxz
byBiZSB1cGRhdGVkIGZyb20gMDAtMDYgdG8KMDAtMDg/ICBpbmNsdWRlL3VhcGkvbXRkL3ViaS11
c2VyLmggZGVmaW5lcyBVQklfVk9MX0lPQ19NQUdJQyAoJ08nKQppb2N0bHMgdXAgdG8gOCAoVUJJ
X0lPQ1ZPTENSQkxLIGF0IDcgYW5kIFVCSV9JT0NWT0xSTUJMSyBhdCA4KS4KCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTQyMDI2
NTMuMzExMzM4MS0xLXJkdW5sYXBAaW5mcmFkZWFkLm9yZz9wYXJ0PTcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
