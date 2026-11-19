Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9869606E32B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 05:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SZUeBbWa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pd44Fq4ZhJhAXIQkqORvcTD71RJHnXacdz5POveU4zE=; b=SZUeBbWag5z8f/TEAbbQOgCDKd
	3r47uwuDuXAgKRHrMPUUewMjnYO+PzfSCkuQOaJgZS8ZXqv9FyPBrtES93ibmhgUSXVm6FthPGVbk
	4+uOmxMMheMCgiTasUWEeSEysu0I2vNROKed73fJI/mGtmUVv643vdf7MQ1PbWpPUShL1gDDpemZ8
	IW516MuqDIxW10rkEvn2IrxIMBDQmgqdo+95VbcifxFPPOiswk6adEXYfrau8UC3r4VQZ+QawOP3c
	XB5LLckIJxe9DkRrZou64KB7piBFiSfoVALV1Q7W/moWlhovV31saa0JCePD/LUAIpsjTpAYgAMGe
	rTWnbIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuoD-0000000Av31-2S7G;
	Thu, 19 Nov 2026 05:35:45 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuoB-0000000Aufu-26GP;
	Thu, 19 Nov 2026 05:35:43 +0000
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
Subject: [PATCH v2 09/12] docs: ioctl-number: update virtualization entries
Date: Wed, 18 Nov 2026 21:35:10 -0800
Message-ID: <20261119053514.255348-10-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119053514.255348-1-rdunlap@infradead.org>
References: <20261119053514.255348-1-rdunlap@infradead.org>
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
eSBsaW5lIGFib3ZlOwogICAgU2VhbiBDaHJpc3RvcGhlcnNvbikKCltTaW5jZSBoYXZpbmcgbXVs
dGlwbGUgbWFpbnRhaW5lcnMgdHJ5aW5nIHRvIG1lcmdlIHRoZXNlIHdvdWxkCmNhdXNlIHNvbWUg
Y29uZmxpY3RzLCBpdCB3b3VsZCBiZSBtb3JlIG1hbmFnZWFibGUgZm9yIEpvbiB0bwp0YWtlIGFs
bCBvZiB0aGVzZSB0aHJvdWdoIHRoZSBkb2NzLW5leHQgdHJlZS5dCgpDYzogSm9uYXRoYW4gQ29y
YmV0IDxjb3JiZXRAbHduLm5ldD4KQ2M6IFNodWFoIEtoYW4gPHNraGFuQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CkNjOiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnCkNjOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IEhhbnMgZGUgR29l
ZGUgPGhhbnNnQGtlcm5lbC5vcmc+CkNjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpD
YzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6ICJN
aWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNvbT4KQ2M6IEphc29uIFdhbmcgPGphc293
YW5naW9AZ21haWwuY29tPgpDYzogRXVnZW5pbyBQw6lyZXogPGVwZXJlem1hQHJlZGhhdC5jb20+
CkNjOiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KQ2M6IFBhb2xvIEJv
bnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNjOiBrdm1Admdlci5rZXJuZWwub3JnCkNjOiB2
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC5kZXYKCiBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1h
cGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdCB8ICAgIDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCi0tLSBsaW51eC1uZXh0LTIwMjYxMTE2Lm9yaWcvRG9jdW1lbnRhdGlv
bi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QKKysrIGxpbnV4LW5leHQtMjAy
NjExMTYvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QK
QEAgLTE5OCw2ICsxOTgsNyBAQCBDb2RlICBTZXEjICAgIEluY2x1ZGUgRmlsZQogJ00nICAgMDEt
MDMgIGRyaXZlcnMvc2NzaS9tZWdhcmFpZC9tZWdhcmFpZF9zYXMuaAogJ00nICAgMDAtMDMgIGRy
aXZlcnMvdmlkZW8vZmJkZXYvbWI4NjJ4eC9tYjg2Mnh4ZmIuaAogJ00nICAgMDAtMEYgIGRyaXZl
cnMvdmlkZW8vZnNsLWRpdS1mYi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25m
bGljdCEKKydNJyAgIDAxLTAzICB4ZW4vaW50ZXJmYWNlL3hlbi1tY2EuaCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCiAnTicgICAwMC0xRiAgZHJpdmVycy91c2Iv
c2Nhbm5lci5oCiAnTicgICA0MC03RiAgdWFwaS9saW51eC9udm1lX2lvY3RsLmgKICdOJyAgIDgw
LTgzICB1YXBpL2xpbnV4L250c3luYy5oIGFuZCB1YXBpL2xpbnV4L252bWVfaW9jdGwuaCAgICAg
ICAgICAgY29uZmxpY3QhCkBAIC0yMzgsNiArMjM5LDcgQEAgQ29kZSAgU2VxIyAgICBJbmNsdWRl
IEZpbGUKICdVJyAgIDY0ICAgICBkcml2ZXJzL3VzYi9taXNjL3VzYnRlc3QuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCiAnVicgICBhbGwgICAgbGludXgvdnQuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQog
J1YnICAgYWxsICAgIGxpbnV4L3ZpZGVvZGV2Mi5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25mbGljdCEKKydWJyAgIDAwLTFGICBsaW51eC92Ym94Z3Vlc3QuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCiAnVicgICBD
MCAgICAgbGludXgvaXZ0dmZiLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbmZsaWN0IQogJ1YnICAgQzAgICAgIGxpbnV4L2l2dHYuaCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKICdWJyAgIEMwICAgICBt
ZWRpYS9zaTQ3MTMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uZmxpY3QhCkBAIC0zNTYsNiArMzU4LDcgQEAgQ29kZSAgU2VxIyAgICBJbmNsdWRlIEZpbGUK
ICd8JyAgIDgwLTlGICBzYW1wbGVzLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQW55IHNhbXBsZSBhbmQgZXhhbXBsZSBkcml2ZXJzCiAweDgwICAwMC0x
RiAgbGludXgvZmIuaAogMHg4MSAgMDAtMUYgIGxpbnV4L3ZkdXNlLmgKKyAgICAgICAgICAgICBk
cml2ZXJzL3ZkcGEvdmRwYV91c2VyL3ZkdXNlX2Rldi5jCiAweDg5ICAwMC0wNyAgYXNtLWdlbmVy
aWMvc29ja2lvcy5oCiAweDg5ICAwNi0wNyAgbGludXgvc29ja2lvcy5oCiAweDg5ICAwQi1ERiAg
bGludXgvc29ja2lvcy5oCkBAIC0zOTksNiArNDAyLDggQEAgQ29kZSAgU2VxIyAgICBJbmNsdWRl
IEZpbGUKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPG1haWx0bzprdm1Admdlci5rZXJuZWwub3JnPgogMHhBRSAg
MjAtM0YgIGxpbnV4L25pdHJvX2VuY2xhdmVzLmggICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBOaXRybyBFbmNsYXZlcwogMHhBRiAgMDAtMUYgIGxpbnV4L2ZzbF9oeXBlcnZpc29y
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGcmVlc2NhbGUgaHlwZXJ2aXNv
cgorMHhBRiAgMDAtOEYgIGxpbnV4L3Zob3N0LmggICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25mbGljdCEKKzB4QUYgIDMxLTMyICBkcml2ZXJzL3Zob3N0L3Rl
c3QuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCiAweEIw
ICBhbGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFJBVElPIGRldmljZXMgaW4gZGV2ZWxvcG1lbnQ6CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxt
YWlsdG86dmdvQHJhdGlvLmRlPgogMHhCMSAgMDAtMUYgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQUFBvWAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
