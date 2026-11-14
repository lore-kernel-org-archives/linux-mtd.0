Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720F3606BB3B
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 20:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4coJ+KW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ypqxVetrPtYsc16f24OQeFfM9/UIW2Y4q2tCgeE0QFM=; b=4coJ+KW8y9kqz+MHL4dklQAqwt
	+FDv0EZmNHfe3pRA1TZT9Ah4rh/WNiq0MAGWwUDl6x0KFPWrGCptUcDAxZ+Du/toKwsuUhWPfXfWV
	kMOeT/2wrBh+zBI4pyHx9xKYyiUCeTcLKzXbUBA2WppeO8QrVe5JaOPFti7VlFzlIseIjRAHymp+s
	l3d/uouSxu72jfIHU7YiNG5b2craDHB66TBlf2PDtKS+FIPAFvi4dIDyC8Gb8oQ7Ef1AZK0SX34Yd
	4jvZlM18OJGLrAcB29CNhmjspVeSMTP7uEuKykuM+ZmQvYQ3g1LhYi5uLuagTokxtA3ZZZGwMEqSl
	skrvWuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKLD-0000000GilP-2pEQ;
	Sat, 14 Nov 2026 20:27:15 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKKt-0000000Giga-2fmk;
	Sat, 14 Nov 2026 20:26:55 +0000
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
	linux-atm-general@lists.sourceforge.net,
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
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
Subject: [PATCH 00/12] docs: ioctl-number: update entries
Date: Sat, 14 Nov 2026 12:26:38 -0800
Message-ID: <20261114202653.3113381-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.0
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
eHQgdHJlZS5dCgogW1BBVENIIDAxLzEyXSBkb2NzOiBpb2N0bC1udW1iZXI6IHVwZGF0ZSBNTSBl
bnRyaWVzCiBbUEFUQ0ggMDIvMTJdIGRvY3M6IGlvY3RsLW51bWJlcjogdXBkYXRlIHNvdW5kIGVu
dHJpZXMKIFtQQVRDSCAwMy8xMl0gZG9jczogaW9jdGwtbnVtYmVyOiB1cGRhdGUgYmxvY2sgZW50
cmllcwogW1BBVENIIDA0LzEyXSBkb2NzOiBpb2N0bC1udW1iZXI6IHVwZGF0ZSBuZXR3b3JraW5n
IGVudHJpZXMKIFtQQVRDSCAwNS8xMl0gZG9jczogaW9jdGwtbnVtYmVyOiB1cGRhdGUgdmlkZW8v
ZmJkZXYgZW50cmllcwogW1BBVENIIDA2LzEyXSBkb2NzOiBpb2N0bC1udW1iZXI6IHVwZGF0ZSBT
Q1NJIGVudHJpZXMKIFtQQVRDSCAwNy8xMl0gZG9jczogaW9jdGwtbnVtYmVyOiB1cGRhdGUgTVRE
IGVudHJpZXMKIFtQQVRDSCAwOC8xMl0gZG9jczogaW9jdGwtbnVtYmVyOiB1cGRhdGUgVVNCIGVu
dHJpZXMKIFtQQVRDSCAwOS8xMl0gZG9jczogaW9jdGwtbnVtYmVyOiB1cGRhdGUgdmlydHVhbGl6
YXRpb24gZW50cmllcwogW1BBVENIIDEwLzEyXSBkb2NzOiBpb2N0bC1udW1iZXI6IHVwZGF0ZSBG
UyBlbnRyaWVzCiBbUEFUQ0ggMTEvMTJdIGRvY3M6IGlvY3RsLW51bWJlcjogdXBkYXRlIHBsYXRm
b3JtIGVudHJpZXMKIFtQQVRDSCAxMi8xMl0gZG9jczogaW9jdGwtbnVtYmVyOiB1cGRhdGUgRFJN
IGVudHJpZXMKCiBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVy
LnJzdCB8ICAgOTEgKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCsp
LCAxOSBkZWxldGlvbnMoLSkKCkNjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PgpD
YzogU2h1YWggS2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IGxpbnV4LWRvY0B2
Z2VyLmtlcm5lbC5vcmcKQ2M6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBrZXJuZWwub3JnPgpD
YzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEphc29uIEd1
bnRob3JwZSA8amdnQG52aWRpYS5jb20+CkNjOiBMZW9uIFJvbWFub3Zza3kgPGxlb25yb0Budmlk
aWEuY29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4
QHBlcmV4LmN6PgpDYzogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmNvbT4KQ2M6IGxpbnV4LXNv
dW5kQHZnZXIua2VybmVsLm9yZwpDYzogSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgpDYzog
bGludXgtYmxvY2tAdmdlci5rZXJuZWwub3JnCkNjOiBNYXJjZWwgSG9sdG1hbm4gPG1hcmNlbEBo
b2x0bWFubi5vcmc+CkNjOiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IDxsdWl6LmRlbnR6QGdtYWls
LmNvbT4KQ2M6IGxpbnV4LWJsdWV0b290aEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IFdpbGxlbSBkZSBC
cnVpam4gPHdpbGxlbWRlYnJ1aWpuLmtlcm5lbEBnbWFpbC5jb20+CkNjOiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ2lvQGdtYWlsLmNvbT4KQ2M6IERhdmlkIEhlaWRlbGJlcmcgPGRhdmlkQGl4aXQuY3o+
CkNjOiBvZS1saW51eC1uZmNAbGlzdHMubGludXguZGV2CkNjOiBDaGFzIFdpbGxpYW1zIDwzY2hh
czNAZ21haWwuY29tPgpDYzogbGludXgtYXRtLWdlbmVyYWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
CkNjOiAiRGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KQ2M6IEVyaWMgRHVt
YXpldCA8ZWR1bWF6ZXRAa2VybmVsLm9yZz4KQ2M6IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5l
bC5vcmc+CkNjOiBQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+CkNjOiBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnCkNjOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+CkNjOiBsaW51eC1m
YmRldkB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IE1QVC1GdXNpb25MaW51eC5wZGxAYnJvYWRjb20uY29tCkNjOiAiSmFtZXMgRS5KLiBCb3R0
b21sZXkiIDxKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPgpDYzogIk1hcnRp
biBLLiBQZXRlcnNlbiIgPG1rcEBrZXJuZWwub3JnPgpDYzogbGludXgtc2NzaUB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CkNjOiBS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgpDYzogVmlnbmVzaCBSYWdoYXZlbmRy
YSA8dmlnbmVzaHJAdGkuY29tPgpDYzogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4KQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBOZWlsbCBLYXByb24g
PG5rYXByb25AZ29vZ2xlLmNvbT4KQ2M6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ21h
aWwuY29tPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KQ2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcKQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpDYzogSGFucyBkZSBHb2VkZSA8
aGFuc2dAa2VybmVsLm9yZz4KQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CkNjOiAi
TWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+CkNjOiBFdWdlbmlvIFDDqXJleiA8
ZXBlcmV6bWFAcmVkaGF0LmNvbT4KQ2M6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29n
bGUuY29tPgpDYzogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KQ2M6IGt2bUB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LmRldgpDYzogSmFu
IEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwub3JnCkNj
OiAiVGhlb2RvcmUgVHMnbyIgPHR5dHNvQG1pdC5lZHU+CkNjOiBsaW51eC1leHQ0QHZnZXIua2Vy
bmVsLm9yZwpDYzogTWlrZSBNYXJzaGFsbCA8aHViY2FwQG9tbmlib25kLmNvbT4KQ2M6IGRldmVs
QGxpc3RzLm9yYW5nZWZzLm9yZwpDYzogUGF1bG8gQWxjYW50YXJhIDxwY0BtYW5ndWViaXQub3Jn
PgpDYzogTmFtamFlIEplb24gPGxpbmtpbmplb25Aa2VybmVsLm9yZz4KQ2M6IGxpbnV4LWNpZnNA
dmdlci5rZXJuZWwub3JnCkNjOiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgpDYzog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgpDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKQ2M6IEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRj
b20uY29tPgpDYzogQnJvYWRjb20gaW50ZXJuYWwga2VybmVsIHJldmlldyBsaXN0IDxiY20ta2Vy
bmVsLWZlZWRiYWNrLWxpc3RAYnJvYWRjb20uY29tPgpDYzogbGludXgtcnBpLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
Q2M6IFR6dW5nLUJpIFNoaWggPHR6dW5nYmlAa2VybmVsLm9yZz4KQ2M6IEJlbnNvbiBMZXVuZyA8
YmxldW5nQGNocm9taXVtLm9yZz4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+
CkNjOiBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4KQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxp
bnV4LmludGVsLmNvbT4KQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4K
Q2M6IFR2cnRrbyBVcnN1bGluIDx0dXJzdWxpbkB1cnN1bGluLm5ldD4KQ2M6IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50
ZWwuY29tPgpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50
ZWwuY29tPgpDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
