Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79E6606F3A4
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 06:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=keejqptf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hYMUrc6r53rLCRSfvwY7MCdENpVmc2H0lo9Egd5z+SM=; b=keejqptfz5rtIzyxG6gAmk3IzQ
	PdekKRU+RtQm8O88TZ2fyQLwfwbQM87iVI6M7ZemqAH9xbohktc7GnN/hx6r8+jxu8wFcaJlN02+k
	v2J2+oSIJaiV3mrf/jxiejAoh84YYRAHEOMp0aCy2RuI+KUwGxpSRMGhEo6xG8gjVq6sF1E4nheD+
	3dPHDEhqt3t4fu+8sdRrGKKN9peoGpx+ufirhw9ZeadtGnEZR6zPRck9fUM5wK/Vm24fW0LMIRcA9
	33GHn0gqqhqtEf2ARvQ9vA9zBhvTqNMdNE+3LyOa9rOXlNnUkxkD2GNZvZ2x5nILA1iKUDsGVlYRD
	2UScFi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Gk-00000008XRs-2Ugl;
	Wed, 25 Nov 2026 06:14:14 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Gh-00000008Wvh-0GYM;
	Wed, 25 Nov 2026 06:14:11 +0000
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
Subject: [PATCH v3 12/12] docs: ioctl-number: update DRM entries
Date: Tue, 24 Nov 2026 22:13:39 -0800
Message-ID: <20261125061340.3402300-13-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125061340.3402300-1-rdunlap@infradead.org>
References: <20261125061340.3402300-1-rdunlap@infradead.org>
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VXBkYXRlIHRoZSBsaXN0IG9mIGZpbGVzIHdoZXJlIERSTSBpb2N0bHMgYXJlIGRlZmluZWQuCgpT
aWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KLS0tCnYy
OiBubyBjaGFuZ2UKdjM6IHJlYmFzZQoKW1NpbmNlIGhhdmluZyBtdWx0aXBsZSBtYWludGFpbmVy
cyB0cnlpbmcgdG8gbWVyZ2UgdGhlc2Ugd291bGQKY2F1c2Ugc29tZSBjb25mbGljdHMsIGl0IHdv
dWxkIGJlIG1vcmUgbWFuYWdlYWJsZSBmb3IgSm9uIHRvCnRha2UgYWxsIG9mIHRoZXNlIHRocm91
Z2ggdGhlIGRvY3MtbmV4dCB0cmVlLl0KCkNjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24u
bmV0PgpDYzogU2h1YWggS2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IGxpbnV4
LWRvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+
CkNjOiBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4KQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxp
bnV4LmludGVsLmNvbT4KQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4K
Q2M6IFR2cnRrbyBVcnN1bGluIDx0dXJzdWxpbkB1cnN1bGluLm5ldD4KQ2M6IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50
ZWwuY29tPgpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50
ZWwuY29tPgpDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCgogRG9jdW1lbnRhdGlv
bi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QgfCAgICA1ICsrKystCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgotLS0gbGludXgtbmV4
dC0yMDI2MTEyMy5vcmlnL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1u
dW1iZXIucnN0CisrKyBsaW51eC1uZXh0LTIwMjYxMTIzL0RvY3VtZW50YXRpb24vdXNlcnNwYWNl
LWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0CkBAIC05OCw2ICs5OCw3IEBAIENvZGUgIFNlcSMg
ICAgSW5jbHVkZSBGaWxlCiAweDFiICBhbGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEluZmluaUJhbmQgU3Vic3lzdGVtCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDxodHRwOi8vaW5maW5pYmFuZC5zb3VyY2Vmb3JnZS5uZXQvPgogMHgyMCAgYWxs
ICAgIGRyaXZlcnMvY2Ryb20vY20yMDYuaAorMHgyMCAgMDAtMDEgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91bXIuaAogMHgyMiAgYWxsICAgIHNjc2kvc2cuaAogMHgzRSAgMDAt
MEYgIGxpbnV4L2NvdW50ZXIuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8bWFpbHRvOmxpbnV4LWlpb0B2Z2VyLmtlcm5lbC5vcmc+CiAnIScgICAwMC0xRiAgdWFw
aS9saW51eC9zZWNjb21wLmgKQEAgLTI2OCw3ICsyNjksNyBAQCBDb2RlICBTZXEjICAgIEluY2x1
ZGUgRmlsZQogJ2MnICAgMDggICAgIGRyaXZlcnMvc2NzaS9jaC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKICdjJyAgIDgwLTlGICBhcmNoL3MzOTAv
aW5jbHVkZS9hc20vY2hzYy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3Qh
CiAnYycgICBBMC1BRiAgYXJjaC94ODYvaW5jbHVkZS9hc20vbXNyLmggY29uZmxpY3QhCi0nZCcg
ICAwMC1GRiAgbGludXgvY2hhci9kcm0vZHJtLmggICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbmZsaWN0IQorJ2QnICAgMDAtRkYgIGRybS9kcm0uaCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKICdkJyAgIDAyLTQw
ICBwY21jaWEvZHMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uZmxpY3QhCiAnZCcgICBGMC1GRiAgbGludXgvZGlnaTEuaAogJ2UnICAgYWxsICAgIGxp
bnV4L2RpZ2kxLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25mbGljdCEKQEAgLTI5Miw2ICsyOTMsOCBAQCBDb2RlICBTZXEjICAgIEluY2x1ZGUgRmlsZQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8bWFpbHRvOnphcG1hbkBpbnRlcmxhbi5uZXQ+CiAnaCcgICAwMC0xRiAg
bGludXgvaHBldC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbmZsaWN0IQogJ2gnICAgODAtOEYgIGZzL2hmc3BsdXMvaW9jdGwuYworJ2knICAgMDAtMDIg
IGRybS9pOTE1X2RybS5oCisnaScgICAwMC0wNCAgZHJtL3hlX2RybS5oCiAnaScgICAwMC0zRiAg
bGludXgvaTJvLWRldi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbmZsaWN0IQogJ2knICAgMEItMUYgIGxpbnV4L2lwbWkuaCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKICdpJyAgIDgwLThGICBsaW51eC9p
OGsuaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
