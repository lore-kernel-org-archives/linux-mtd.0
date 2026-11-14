Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDAB606FAE0
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FdCvU9Kw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3SZFoLQFwp77/j2wJB0y70fRK21OAOkD92d3RLwj+DI=; b=FdCvU9KwLV9Rozy3OsDvUA++U1
	9hzoJwKf+IavqWVALZxCkFYXGUlQI7ntzKKEzeTMq3h/+W6+xs6dmNyrskiThdd3GgDS5t2CSXaSs
	0uSmD+t7TiycYA1PgjYDcNR6dvHU4oC3dEMHU0H9q0J14M6RXZMd2a4aE+GHu2k4GilpvhJVhzaMB
	EAC/swczPXsSSI1tEB0QLXdi4Ts7rYKZnwxluOXdt0JeHlaNCzysR4YyZ5oMiMNChpcapa7gJJsYq
	UcH1n2gCcOMaYRDj16Y4s84ITokqh8UoKcHMrmJJNr22e8wSq/Av/GTgFA+yCNoFAdN7gm3xNMS6g
	u1Vci7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKLe-0000000GjEv-3Qw8;
	Sat, 14 Nov 2026 20:27:42 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKLD-0000000Giga-0Wfi;
	Sat, 14 Nov 2026 20:27:15 +0000
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
Subject: [PATCH 09/12] docs: ioctl-number: update virtualization entries
Date: Sat, 14 Nov 2026 12:26:47 -0800
Message-ID: <20261114202653.3113381-10-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114202653.3113381-1-rdunlap@infradead.org>
References: <20261114202653.3113381-1-rdunlap@infradead.org>
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
b3JnPgotLS0KW1NpbmNlIGhhdmluZyBtdWx0aXBsZSBtYWludGFpbmVycyB0cnlpbmcgdG8gbWVy
Z2UgdGhlc2Ugd291bGQKY2F1c2Ugc29tZSBjb25mbGljdHMsIGl0IHdvdWxkIGJlIG1vcmUgbWFu
YWdlYWJsZSBmb3IgSm9uIHRvCnRha2UgYWxsIG9mIHRoZXNlIHRocm91Z2ggdGhlIGRvY3MtbmV4
dCB0cmVlLl0KCkNjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PgpDYzogU2h1YWgg
S2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IGxpbnV4LWRvY0B2Z2VyLmtlcm5l
bC5vcmcKQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpDYzogSGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9yZz4KQ2M6IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPgpDYzogIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQu
Y29tPgpDYzogSmFzb24gV2FuZyA8amFzb3dhbmdpb0BnbWFpbC5jb20+CkNjOiBFdWdlbmlvIFDD
qXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4KQ2M6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPgpDYzogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KQ2M6
IGt2bUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LmRldgoK
IERvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0IHwgICAg
NiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCi0tLSBsaW51eC1uZXh0
LTIwMjYxMTEzLm9yaWcvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51
bWJlci5yc3QKKysrIGxpbnV4LW5leHQtMjAyNjExMTMvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2Ut
YXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QKQEAgLTIwMCw2ICsyMDAsNyBAQCBDb2RlICBTZXEj
ICAgIEluY2x1ZGUgRmlsZQogJ00nICAgMDEtMDMgIGRyaXZlcnMvc2NzaS9tZWdhcmFpZC9tZWdh
cmFpZF9zYXMuaAogJ00nICAgMDAtMDMgIGRyaXZlcnMvdmlkZW8vZmJkZXYvbWI4NjJ4eC9tYjg2
Mnh4ZmIuaAogJ00nICAgMDAtMEYgIGRyaXZlcnMvdmlkZW8vZnNsLWRpdS1mYi5oICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKKydNJyAgIDAxLTAzICB4ZW4vaW50ZXJm
YWNlL3hlbi1tY2EuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3Qh
CiAnTicgICAwMC0xRiAgZHJpdmVycy91c2Ivc2Nhbm5lci5oCiAnTicgICA0MC03RiAgdWFwaS9s
aW51eC9udm1lX2lvY3RsLmgKICdOJyAgIDgwLTgzICB1YXBpL2xpbnV4L250c3luYy5oIGFuZCB1
YXBpL2xpbnV4L252bWVfaW9jdGwuaCAgICAgICAgICAgY29uZmxpY3QhCkBAIC0yMzksNiArMjQw
LDcgQEAgQ29kZSAgU2VxIyAgICBJbmNsdWRlIEZpbGUKICdVJyAgIDY0ICAgICBkcml2ZXJzL3Vz
Yi9taXNjL3VzYnRlc3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3Qh
CiAnVicgICBhbGwgICAgbGludXgvdnQuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbmZsaWN0IQogJ1YnICAgYWxsICAgIGxpbnV4L3ZpZGVvZGV2Mi5o
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKKydWJyAg
IDAwLTFGICBsaW51eC92Ym94Z3Vlc3QuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uZmxpY3QhCiAnVicgICBDMCAgICAgbGludXgvaXZ0dmZiLmggICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQogJ1YnICAgQzAgICAg
IGxpbnV4L2l2dHYuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25mbGljdCEKICdWJyAgIEMwICAgICBtZWRpYS9zaTQ3MTMuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCkBAIC0zNTcsNiArMzU5LDcgQEAg
Q29kZSAgU2VxIyAgICBJbmNsdWRlIEZpbGUKICd8JyAgIDgwLTlGICBzYW1wbGVzLyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQW55IHNhbXBsZSBhbmQg
ZXhhbXBsZSBkcml2ZXJzCiAweDgwICAwMC0xRiAgbGludXgvZmIuaAogMHg4MSAgMDAtMUYgIGxp
bnV4L3ZkdXNlLmgKKyAgICAgICAgICAgICBkcml2ZXJzL3ZkcGEvdmRwYV91c2VyL3ZkdXNlX2Rl
di5jCiAweDg5ICAwMC0wNyAgYXNtLWdlbmVyaWMvc29ja2lvcy5oCiAweDg5ICAwNi0wNyAgbGlu
dXgvc29ja2lvcy5oCiAweDg5ICAwQi1ERiAgbGludXgvc29ja2lvcy5oCkBAIC0zOTgsOCArNDAx
LDExIEBAIENvZGUgIFNlcSMgICAgSW5jbHVkZSBGaWxlCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxtYWlsdG86
a3ZtQHZnZXIua2VybmVsLm9yZz4KIDB4QUUgIDQwLUZGICBsaW51eC9rdm0uaCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgS2VybmVsLWJhc2VkIFZpcnR1YWwg
TWFjaGluZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8bWFpbHRvOmt2bUB2Z2VyLmtlcm5lbC5vcmc+CisweEFF
ICBDNiAgICAgYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFg4NiBLVk0KIDB4QUUgIDIwLTNGICBsaW51eC9uaXRyb19lbmNsYXZlcy5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTml0cm8gRW5jbGF2ZXMKIDB4QUYgIDAw
LTFGICBsaW51eC9mc2xfaHlwZXJ2aXNvci5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRnJlZXNjYWxlIGh5cGVydmlzb3IKKzB4QUYgIDAwLThGICBsaW51eC92aG9zdC5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCisweEFG
ICAzMS0zMiAgZHJpdmVycy92aG9zdC90ZXN0LmggICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbmZsaWN0IQogMHhCMCAgYWxsICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSQVRJTyBkZXZpY2VzIGluIGRldmVs
b3BtZW50OgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8bWFpbHRvOnZnb0ByYXRpby5kZT4KIDB4QjEgIDAwLTFG
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUFBQb1gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
