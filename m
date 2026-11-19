Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F01606A32C
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Csq/EU3P;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=trPf9+9S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TXidqtqR4oTWABINmSJ2mJwq+FjRKEEPMLkcQeDW31k=; b=Csq/EU3PFT6TschoG7yygMX0qt
	zff/09P6UfMHY+oDKpEpK+zPthSzRGAmwMV+johrukHodauYtDTn9G+7Dl/8/NlFyEX3HbjUYV+qR
	ZiNs4GN+3xXvNoj89C0569XaOPblWq8a27xNH/2h5suHmlZgVW9RoVTjvSHGXUElt59OY3g8w0SXa
	ZDqC/2DZVRN+y+RsP73rt8rQvvn+IycT2ZX0GbkwjEIC+hxAG5w4I06iybFip+ukNg0D+Y1ylcI0Z
	PzVQrgsZ9tEN5lwG4+nFHK47gxf0CjF+UzvnK0OrD5tgcGsmEpzTjQJLybEj9b/FysEsmywrAmffU
	ivGNtXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyXw-0000000BPR6-3VqC;
	Thu, 19 Nov 2026 09:35:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyXu-0000000BPQJ-29Yg
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 09:35:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 77472C4CBEE;
	Thu, 19 Nov 2026 09:35:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D57560271;
	Thu, 19 Nov 2026 09:35:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 145C311BC315F;
	Thu, 19 Nov 2026 10:34:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795080902; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CQyK9hhzQUtdCIaKwh8qFL6kiw3hBK7e02jXrxk3Q5M=;
	b=trPf9+9SmvXq7f3i06Ocu8PXp2wkKO6ORNKTA4/AjOKcQKVFePqcO/1BhMn+K4JKXgVetW
	9Yr+85a0u4rw/+pGQPZDRSMsRMDGawEXfnQ9jCtNv2zr3C8ZQd4iUe048cU50ECPRyFurf
	rsmMLyDo3rueQxG7RuwY+EBebjyTZuhqh1PyoyvCDfGRSYoPSTyfx/hwy85QgTWFsAil0Q
	X6TU5TJA2EpRSA3/3QyU7eQBfCRlHqNmOlSA+ByZVazhopQuZSLgxPNhpRVe5QgDh43L/T
	HBMPjxwGs9avJmS68J25IgXRGZqvRkZ+RC3EyDq//xlN7GCwXICCDykv7Bhitw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,  Jonathan Corbet <corbet@lwn.net>,  Shuah
 Khan <skhan@linuxfoundation.org>,  linux-doc@vger.kernel.org,  David
 Hildenbrand <david@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Jason Gunthorpe <jgg@nvidia.com>,  Leon
 Romanovsky <leonro@nvidia.com>,  linux-mm@kvack.org,  Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
  linux-sound@vger.kernel.org,  Jens Axboe <axboe@kernel.dk>,
  linux-block@vger.kernel.org,  Marcel Holtmann <marcel@holtmann.org>,
  Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
  linux-bluetooth@vger.kernel.org,  Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>,  Jason Wang <jasowangio@gmail.com>,
  David Heidelberg <david@ixit.cz>,  oe-linux-nfc@lists.linux.dev,  Chas
 Williams <3chas3@gmail.com>,  "David S. Miller" <davem@davemloft.net>,
  Eric Dumazet <edumazet@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,
  Paolo Abeni <pabeni@redhat.com>,  netdev@vger.kernel.org,  Helge Deller
 <deller@gmx.de>,  linux-fbdev@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  MPT-FusionLinux.pdl@broadcom.com,
  "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,  "Martin
 K. Petersen" <mkp@kernel.org>,  linux-scsi@vger.kernel.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Zhihao Cheng <chengzhihao1@huawei.com>,  linux-mtd@lists.infradead.org,
  Neill Kapron <nkapron@google.com>,  Andrey Konovalov
 <andreyknvl@gmail.com>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org,  Juergen Gross <jgross@suse.com>,  Stefano
 Stabellini <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org,
  Hans de Goede <hansg@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Eugenio =?utf-8?Q?P=C3=A9rez?=
 <eperezma@redhat.com>,  Sean Christopherson <seanjc@google.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  kvm@vger.kernel.org,
  virtualization@lists.linux.dev,  Jan Kara <jack@suse.cz>,
  linux-fsdevel@vger.kernel.org,  "Theodore Ts'o" <tytso@mit.edu>,
  linux-ext4@vger.kernel.org,  Mike Marshall <hubcap@omnibond.com>,
  devel@lists.orangefs.org,  Paulo Alcantara <pc@manguebit.org>,  Namjae
 Jeon <linkinjeon@kernel.org>,  linux-cifs@vger.kernel.org,  Jaegeuk Kim
 <jaegeuk@kernel.org>,  Chao Yu <chao@kernel.org>,
  linux-f2fs-devel@lists.sourceforge.net,  Florian Fainelli
 <florian.fainelli@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Tzung-Bi Shih
 <tzungbi@kernel.org>,  Benson Leung <bleung@chromium.org>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
  amd-gfx@lists.freedesktop.org,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
  Tvrtko Ursulin <tursulin@ursulin.net>,  intel-gfx@lists.freedesktop.org,
  Matthew Brost <matthew.brost@intel.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6?=
 =?utf-8?Q?m?=
 <thomas.hellstrom@linux.intel.com>,  intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 07/12] docs: ioctl-number: update MTD entries
In-Reply-To: <20261119053514.255348-8-rdunlap@infradead.org> (Randy Dunlap's
	message of "Wed, 18 Nov 2026 21:35:08 -0800")
References: <20261119053514.255348-1-rdunlap@infradead.org>
	<20261119053514.255348-8-rdunlap@infradead.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 10:34:37 +0100
Message-ID: <87bj7lf9le.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_013510_704786_45C754C5 
X-CRM114-Status: GOOD (  11.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUmFuZHksCgpPbiAxOC8xMS8yMDI2IGF0IDIxOjM1OjA4IC0wOCwgUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyb3RlOgoKPiBVcGRhdGUgdGhlIGxpc3Qgb2YgZmlsZXMg
d2hlcmUgTVREIGlvY3RscyBhcmUgZGVmaW5lZCBhbmQgdXBkYXRlCj4gdGhlIHJhbmdlcyBvZiBm
dW5jdGlvbiBudW1iZXJzIHRoYXQgYXJlIHVzZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBE
dW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKPiBbU2luY2UgaGF2aW5nIG11bHRpcGxlIG1haW50
YWluZXJzIHRyeWluZyB0byBtZXJnZSB0aGVzZSB3b3VsZAo+IGNhdXNlIHNvbWUgY29uZmxpY3Rz
LCBpdCB3b3VsZCBiZSBtb3JlIG1hbmFnZWFibGUgZm9yIEpvbiB0bwo+IHRha2UgYWxsIG9mIHRo
ZXNlIHRocm91Z2ggdGhlIGRvY3MtbmV4dCB0cmVlLl0KCkFncmVlZC4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
