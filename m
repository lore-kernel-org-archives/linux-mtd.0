Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8213C60A382F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EHC8bDY3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gCNzPhLgCc4LVR9zrTyfPSUk+nmHYcczB30slKgi54I=; b=EHC8bDY3KvVOMMiubTw5fRsdOK
	zRs2eytQlVoFXSabV0oYw73Xl2lHMxWIl5V5sHyHem9NyZnEe/liR+QabyIC5mj7c9WXFi2zBfrhh
	c6lgGvvUeUhVZGa2ecytteO5EK/H+5kmSbSOiqTkJ5Yoq/S3nNmPnHN2tFzrCMMJhHaBVLh3VGtQo
	FWN9DXByWyw9wswxptL4Wyqfxb74Y/pwPUUBp2wttkFGYHBIHNx1p+uioHvnqlYK1KO0Wij6uS3U2
	qoILl7PNEfmLGLdXojE2huxA31gsTCa0p8pTR4L3ByPvFK7dY2WYADyCGI+HCYhRamZjw3JAXQWP2
	3Vk8bTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6GN-00000008WxG-2LKt;
	Wed, 25 Nov 2026 06:13:51 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6GF-00000008Wvh-2FgZ;
	Wed, 25 Nov 2026 06:13:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	linux-mm@kvack.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev,
	Chas Williams <3chas3@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	MPT-FusionLinux.pdl@broadcom.com,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	Neill Kapron <nkapron@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	"Theodore Ts'o" <tytso@mit.edu>,
	linux-ext4@vger.kernel.org,
	Mike Marshall <hubcap@omnibond.com>,
	devel@lists.orangefs.org,
	Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	linux-cifs@vger.kernel.org,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	intel-gfx@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3 00/12] docs: ioctl-number: update entries
Date: Tue, 24 Nov 2026 22:13:27 -0800
Message-ID: <20261125061340.3402300-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VXBkYXRlIGZpbGUgbmFtZXMgdGhhdCBkZWZpbmUgaW9jdGxzIGFuZCB1cGRhdGUgdGhlIHJhbmdl
IG9mCmlvY3RsIGZ1bmN0aW9uIG51bWJlcnMgdGhhdCBhcmUgdXNlZCB3aGVyZSB0aGV5IGhhdmUg
Y2hhbmdlZC4KCltTaW5jZSBoYXZpbmcgbXVsdGlwbGUgbWFpbnRhaW5lcnMgdHJ5aW5nIHRvIG1l
cmdlIHRoZXNlIHdvdWxkCmNhdXNlIHNvbWUgY29uZmxpY3RzLCBpdCB3b3VsZCBiZSBtb3JlIG1h
bmFnZWFibGUgZm9yIEpvbiB0bwp0YWtlIGFsbCBvZiB0aGVzZSB0aHJvdWdoIHRoZSBkb2NzLW5l
eHQgdHJlZS5dCgogW1BBVENIIDAxLzEyIHYyXSBkb2NzOiBpb2N0bC1udW1iZXI6IHVwZGF0ZSBN
TSBlbnRyaWVzCiBbUEFUQ0ggMDIvMTIgdjJdIGRvY3M6IGlvY3RsLW51bWJlcjogdXBkYXRlIHNv
dW5kIGVudHJpZXMKIFtQQVRDSCAwMy8xMiB2Ml0gZG9jczogaW9jdGwtbnVtYmVyOiB1cGRhdGUg
YmxvY2sgZW50cmllcwogW1BBVENIIDA0LzEyIHYyXSBkb2NzOiBpb2N0bC1udW1iZXI6IHVwZGF0
ZSBuZXR3b3JraW5nIGVudHJpZXMKIFtQQVRDSCAwNS8xMiB2Ml0gZG9jczogaW9jdGwtbnVtYmVy
OiB1cGRhdGUgdmlkZW8vZmJkZXYgZW50cmllcwogW1BBVENIIDA2LzEyIHYyXSBkb2NzOiBpb2N0
bC1udW1iZXI6IHVwZGF0ZSBTQ1NJIGVudHJpZXMKIFtQQVRDSCAwNy8xMiB2Ml0gZG9jczogaW9j
dGwtbnVtYmVyOiB1cGRhdGUgTVREIGVudHJpZXMKIFtQQVRDSCAwOC8xMiB2Ml0gZG9jczogaW9j
dGwtbnVtYmVyOiB1cGRhdGUgVVNCIGVudHJpZXMKIFtQQVRDSCAwOS8xMiB2Ml0gZG9jczogaW9j
dGwtbnVtYmVyOiB1cGRhdGUgdmlydHVhbGl6YXRpb24gZW50cmllcwogW1BBVENIIDEwLzEyIHYy
XSBkb2NzOiBpb2N0bC1udW1iZXI6IHVwZGF0ZSBGUyBlbnRyaWVzCiBbUEFUQ0ggMTEvMTIgdjJd
IGRvY3M6IGlvY3RsLW51bWJlcjogdXBkYXRlIHBsYXRmb3JtIGVudHJpZXMKIFtQQVRDSCAxMi8x
MiB2Ml0gZG9jczogaW9jdGwtbnVtYmVyOiB1cGRhdGUgRFJNIGVudHJpZXMKCiBEb2N1bWVudGF0
aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdCB8ICAgOTEgKysrKysrKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCnYy
IGNoYW5nZXM6Ci0gYWRkcmVzcyBzYXNoaWtvIHJldmlldyBjb21tZW50cwotIGRyb3AgYWRkaXRp
b24gb2YgYXJjaC94ODYva3ZtL3g4Ni5jIChTZWFuIENocmlzdG9waGVyc29uKQotIGRyb3AgbW9k
ZXJhdGVkIG1haWxpbmcgbGlzdHMKdjMgY2hhbmdlczoKLSB1cGRhdGUgdGhlIHNjYXJsZXR0MiBz
b3VuZCBkcml2ZXIgaW9jdGwgcmFuZ2UgKHNhc2hpa28pCi0gcmViYXNlIGFsbCBwYXRjaGVzIGlu
IHRoZSBzZXJpZXMKCgpDYzogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4KQ2M6IFNo
dWFoIEtoYW4gPHNraGFuQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBsaW51eC1kb2NAdmdlci5r
ZXJuZWwub3JnCkNjOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAa2VybmVsLm9yZz4KQ2M6IEFu
ZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0BudmlkaWEuY29tPgpDYzogTGVvbiBSb21hbm92c2t5IDxsZW9ucm9AbnZpZGlhLmNv
bT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJl
eC5jej4KQ2M6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5jb20+CkNjOiBsaW51eC1zb3VuZEB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KQ2M6IGxpbnV4
LWJsb2NrQHZnZXIua2VybmVsLm9yZwpDYzogTWFyY2VsIEhvbHRtYW5uIDxtYXJjZWxAaG9sdG1h
bm4ub3JnPgpDYzogTHVpeiBBdWd1c3RvIHZvbiBEZW50eiA8bHVpei5kZW50ekBnbWFpbC5jb20+
CkNjOiBsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnCkNjOiBXaWxsZW0gZGUgQnJ1aWpu
IDx3aWxsZW1kZWJydWlqbi5rZXJuZWxAZ21haWwuY29tPgpDYzogSmFzb24gV2FuZyA8amFzb3dh
bmdpb0BnbWFpbC5jb20+CkNjOiBEYXZpZCBIZWlkZWxiZXJnIDxkYXZpZEBpeGl0LmN6PgpDYzog
b2UtbGludXgtbmZjQGxpc3RzLmxpbnV4LmRldgpDYzogQ2hhcyBXaWxsaWFtcyA8M2NoYXMzQGdt
YWlsLmNvbT4KQ2M6ICJEYXZpZCBTLiBNaWxsZXIiIDxkYXZlbUBkYXZlbWxvZnQubmV0PgpDYzog
RXJpYyBEdW1hemV0IDxlZHVtYXpldEBrZXJuZWwub3JnPgpDYzogSmFrdWIgS2ljaW5za2kgPGt1
YmFAa2VybmVsLm9yZz4KQ2M6IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNvbT4KQ2M6IG5l
dGRldkB2Z2VyLmtlcm5lbC5vcmcKQ2M6IEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT4KQ2M6
IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogTVBULUZ1c2lvbkxpbnV4LnBkbEBicm9hZGNvbS5jb20KQ2M6ICJKYW1lcyBF
LkouIEJvdHRvbWxleSIgPEphbWVzLkJvdHRvbWxleUBIYW5zZW5QYXJ0bmVyc2hpcC5jb20+CkNj
OiAiTWFydGluIEsuIFBldGVyc2VuIiA8bWtwQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1zY3NpQHZn
ZXIua2VybmVsLm9yZwpDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4KQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+CkNjOiBWaWduZXNoIFJh
Z2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+CkNjOiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFv
MUBodWF3ZWkuY29tPgpDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IE5laWxs
IEthcHJvbiA8bmthcHJvbkBnb29nbGUuY29tPgpDYzogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5
a252bEBnbWFpbC5jb20+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPgpDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZwpDYzogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNjOiBIYW5zIGRl
IEdvZWRlIDxoYW5zZ0BrZXJuZWwub3JnPgpDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4KQ2M6ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNvbT4KQ2M6IEV1Z2VuaW8g
UMOpcmV6IDxlcGVyZXptYUByZWRoYXQuY29tPgpDYzogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+CkNjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpD
Yzoga3ZtQHZnZXIua2VybmVsLm9yZwpDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXguZGV2
CkNjOiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpDYzogbGludXgtZnNkZXZlbEB2Z2VyLmtlcm5l
bC5vcmcKQ2M6ICJUaGVvZG9yZSBUcydvIiA8dHl0c29AbWl0LmVkdT4KQ2M6IGxpbnV4LWV4dDRA
dmdlci5rZXJuZWwub3JnCkNjOiBNaWtlIE1hcnNoYWxsIDxodWJjYXBAb21uaWJvbmQuY29tPgpD
YzogZGV2ZWxAbGlzdHMub3JhbmdlZnMub3JnCkNjOiBQYXVsbyBBbGNhbnRhcmEgPHBjQG1hbmd1
ZWJpdC5vcmc+CkNjOiBOYW1qYWUgSmVvbiA8bGlua2luamVvbkBrZXJuZWwub3JnPgpDYzogbGlu
dXgtY2lmc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5v
cmc+CkNjOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApDYzogRmxvcmlhbiBGYWluZWxsaSA8Zmxvcmlhbi5mYWluZWxs
aUBicm9hZGNvbS5jb20+CkNjOiBCcm9hZGNvbSBpbnRlcm5hbCBrZXJuZWwgcmV2aWV3IGxpc3Qg
PGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBicm9hZGNvbS5jb20+CkNjOiBUenVuZy1CaSBTaGlo
IDx0enVuZ2JpQGtlcm5lbC5vcmc+CkNjOiBCZW5zb24gTGV1bmcgPGJsZXVuZ0BjaHJvbWl1bS5v
cmc+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgpDYzogU2ltb25hIFZldHRl
ciA8c2ltb25hQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+
CkNjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CkNj
OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+CkNjOiBUdnJ0a28gVXJzdWxp
biA8dHVyc3VsaW5AdXJzdWxpbi5uZXQ+CkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KQ2M6IFRob21h
cyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4KQ2M6IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
