Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505A2606D30C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 06:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NnvRVJNI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E0xBDteIeBEbSE1/wXSsDGpLhaDo1+i60xDor7ZBQ8M=; b=NnvRVJNItiGQuxi63t/P8S0ODx
	k5OgxR0RY2M3dffjq/i0ip2znLrazo9VVzpFnrFdtw4bk6fuaiOpcD8l8QGW2I5jaaCxvGAwP99Mn
	PKZuvrrpXfcM1emriQeeZ6dOasB9oxlZp+7hzeJZGXfxXBNG6uRfP7AMiePhSdEoP06nj7Y6cFeIP
	3TG7LXI4q3LYnCQGLi0gZLeY87pZF0XLENnBrccorHJ2dFkjgCga/jfHLsj2PfjcvjbWTEwxyW9XS
	w1kzgQj0CflbJAAUfuG1Px4wUsxp84ceGeY99pNv2itbWOLf3m13ZSS+NRlM+g9MJXBMFT+4DYvgY
	o0E5+QHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Gc-00000008XF6-441T;
	Wed, 25 Nov 2026 06:14:06 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Gb-00000008Wvh-0C4P;
	Wed, 25 Nov 2026 06:14:05 +0000
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
Subject: [PATCH v3 09/12] docs: ioctl-number: update virtualization entries
Date: Tue, 24 Nov 2026 22:13:36 -0800
Message-ID: <20261125061340.3402300-10-rdunlap@infradead.org>
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

VXBkYXRlIHRoZSBsaXN0IG9mIGZpbGVzIHdoZXJlIHZpcnR1YWxpemF0aW9uIGlvY3RscyBhcmUg
ZGVmaW5lZC4KClNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQu
b3JnPgotLS0KdjI6IGRyb3AgMHhBRSwgQzYsIGFyY2gveDg2L2t2bS94ODYuYyAoY292ZXJlZCBi
eSBsaW5lIGFib3ZlOwogICAgU2VhbiBDaHJpc3RvcGhlcnNvbikKdjM6IHJlYmFzZQoKW1NpbmNl
IGhhdmluZyBtdWx0aXBsZSBtYWludGFpbmVycyB0cnlpbmcgdG8gbWVyZ2UgdGhlc2Ugd291bGQK
Y2F1c2Ugc29tZSBjb25mbGljdHMsIGl0IHdvdWxkIGJlIG1vcmUgbWFuYWdlYWJsZSBmb3IgSm9u
IHRvCnRha2UgYWxsIG9mIHRoZXNlIHRocm91Z2ggdGhlIGRvY3MtbmV4dCB0cmVlLl0KCkNjOiBK
b25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PgpDYzogU2h1YWggS2hhbiA8c2toYW5AbGlu
dXhmb3VuZGF0aW9uLm9yZz4KQ2M6IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpDYzog
SGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9yZz4KQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgpDYzogIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgpDYzogSmFzb24g
V2FuZyA8amFzb3dhbmdpb0BnbWFpbC5jb20+CkNjOiBFdWdlbmlvIFDDqXJleiA8ZXBlcmV6bWFA
cmVkaGF0LmNvbT4KQ2M6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgpD
YzogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KQ2M6IGt2bUB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LmRldgoKIERvY3VtZW50YXRpb24v
dXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0IHwgICAgNSArKysrKwogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKLS0tIGxpbnV4LW5leHQtMjAyNjExMjMub3JpZy9E
b2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdAorKysgbGlu
dXgtbmV4dC0yMDI2MTEyMy9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwt
bnVtYmVyLnJzdApAQCAtMTk4LDYgKzE5OCw3IEBAIENvZGUgIFNlcSMgICAgSW5jbHVkZSBGaWxl
CiAnTScgICAwMS0wMyAgZHJpdmVycy9zY3NpL21lZ2FyYWlkL21lZ2FyYWlkX3Nhcy5oCiAnTScg
ICAwMC0wMyAgZHJpdmVycy92aWRlby9mYmRldi9tYjg2Mnh4L21iODYyeHhmYi5oCiAnTScgICAw
MC0wRiAgZHJpdmVycy92aWRlby9mc2wtZGl1LWZiLmggICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbmZsaWN0IQorJ00nICAgMDEtMDMgIHhlbi9pbnRlcmZhY2UveGVuLW1jYS5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKICdOJyAgIDAwLTFGICBk
cml2ZXJzL3VzYi9zY2FubmVyLmgKICdOJyAgIDQwLTdGICB1YXBpL2xpbnV4L252bWVfaW9jdGwu
aAogJ04nICAgODAtODMgIHVhcGkvbGludXgvbnRzeW5jLmggYW5kIHVhcGkvbGludXgvbnZtZV9p
b2N0bC5oICAgICAgICAgICBjb25mbGljdCEKQEAgLTIzOCw2ICsyMzksNyBAQCBDb2RlICBTZXEj
ICAgIEluY2x1ZGUgRmlsZQogJ1UnICAgNjQgICAgIGRyaXZlcnMvdXNiL21pc2MvdXNidGVzdC5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKICdWJyAgIGFsbCAgICBs
aW51eC92dC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uZmxpY3QhCiAnVicgICBhbGwgICAgbGludXgvdmlkZW9kZXYyLmggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQorJ1YnICAgMDAtMUYgIGxpbnV4L3Zi
b3hndWVzdC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGlj
dCEKICdWJyAgIEMwICAgICBsaW51eC9pdnR2ZmIuaCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCiAnVicgICBDMCAgICAgbGludXgvaXZ0di5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQogJ1Yn
ICAgQzAgICAgIG1lZGlhL3NpNDcxMy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25mbGljdCEKQEAgLTM1Niw2ICszNTgsNyBAQCBDb2RlICBTZXEjICAgIElu
Y2x1ZGUgRmlsZQogJ3wnICAgODAtOUYgIHNhbXBsZXMvICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBBbnkgc2FtcGxlIGFuZCBleGFtcGxlIGRyaXZlcnMK
IDB4ODAgIDAwLTFGICBsaW51eC9mYi5oCiAweDgxICAwMC0xRiAgbGludXgvdmR1c2UuaAorICAg
ICAgICAgICAgIGRyaXZlcnMvdmRwYS92ZHBhX3VzZXIvdmR1c2VfZGV2LmMKIDB4ODkgIDAwLTA3
ICBhc20tZ2VuZXJpYy9zb2NraW9zLmgKIDB4ODkgIDA2LTA3ICBsaW51eC9zb2NraW9zLmgKIDB4
ODkgIDBCLURGICBsaW51eC9zb2NraW9zLmgKQEAgLTM5OSw2ICs0MDIsOCBAQCBDb2RlICBTZXEj
ICAgIEluY2x1ZGUgRmlsZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bWFpbHRvOmt2bUB2Z2VyLmtlcm5lbC5v
cmc+CiAweEFFICAyMC0zRiAgbGludXgvbml0cm9fZW5jbGF2ZXMuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE5pdHJvIEVuY2xhdmVzCiAweEFGICAwMC0xRiAgbGludXgvZnNs
X2h5cGVydmlzb3IuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZyZWVzY2Fs
ZSBoeXBlcnZpc29yCisweEFGICAwMC04RiAgbGludXgvdmhvc3QuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQorMHhBRiAgMzEtMzIgIGRyaXZl
cnMvdmhvc3QvdGVzdC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25m
bGljdCEKIDB4QjAgIGFsbCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUkFUSU8gZGV2aWNlcyBpbiBkZXZlbG9wbWVudDoKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPG1haWx0bzp2Z29AcmF0aW8uZGU+CiAweEIxICAwMC0xRiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBQUG9YCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
