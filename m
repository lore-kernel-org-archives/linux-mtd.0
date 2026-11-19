Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945D60A2613
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 05:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gluUEiio
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=B+eg0rYZd7611VHnRvPIu5qKC0C6ufypPYF5MiLDd78=; b=gluUEiioKIhD3M0mvA2CCAW/uO
	dZwK3LVseXw3HEKG+XSGN8AmoY1+QdQ+fa7UVLLuBlEoZIeLioueXimOlQYuVuxLukVr3porgOSAg
	1+WSliZTmbystaLysGrlfwWpKFx4PTLd1j7xFOvVB3BR3iDfdyAxsqIH4tJH0PgTh3SWsL1w4LSMU
	azrnJyPI8y4hygpPkRPYpuwXZd+fheFsSq534/bpMYsTSNKmguf0YCXPwx0ekObuoPUpXn2d1nB7J
	yH3ePYCv7DzqykBN+9aJJdJ8rFAOxdAzvXgEqApfil1XwHGSmqubeo9H45OqfVMtfIRhAL/rYxldI
	LcFpxOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTunt-0000000AuhH-3J55;
	Thu, 19 Nov 2026 05:35:25 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTunn-0000000Aufu-0t5B;
	Thu, 19 Nov 2026 05:35:19 +0000
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
Subject: [PATCH v2 00/12 RESEND] docs: ioctl-number: update entries
Date: Wed, 18 Nov 2026 21:35:01 -0800
Message-ID: <20261119053514.255348-1-rdunlap@infradead.org>
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
ZXJhdGVkIG1haWxpbmcgbGlzdHMKCihSRVNFTkQ6IEkgdHJpZWQgdXNpbmcgLS1zdXBwcmVzcy1j
Yz1hdXRvIGJ1dCB0aGVuIG5vIG9uZSB3YXMgQ2MtZWQuCkkgd2FudGVkIHRvIHVzZSBvbmx5IHRo
ZSBleHBsaWNpdCBDYzpzIGluIGVhY2ggZW1haWwgaW5zdGVhZApvZiBzZW5kaW5nIGFsbCBwYXRj
aGVzIHRvIGV2ZXJ5b25lLikKCkNjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PgpD
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
czNAZ21haWwuY29tPgpDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+
CkNjOiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGtlcm5lbC5vcmc+CkNjOiBKYWt1YiBLaWNpbnNr
aSA8a3ViYUBrZXJuZWwub3JnPgpDYzogUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPgpD
YzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZwpDYzogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRl
PgpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCkNjOiBNUFQtRnVzaW9uTGludXgucGRsQGJyb2FkY29tLmNvbQpDYzogIkph
bWVzIEUuSi4gQm90dG9tbGV5IiA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNv
bT4KQ2M6ICJNYXJ0aW4gSy4gUGV0ZXJzZW4iIDxta3BAa2VybmVsLm9yZz4KQ2M6IGxpbnV4LXNj
c2lAdmdlci5rZXJuZWwub3JnCkNjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgpDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KQ2M6IFZpZ25l
c2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6
aGloYW8xQGh1YXdlaS5jb20+CkNjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzog
TmVpbGwgS2Fwcm9uIDxua2Fwcm9uQGdvb2dsZS5jb20+CkNjOiBBbmRyZXkgS29ub3ZhbG92IDxh
bmRyZXlrbnZsQGdtYWlsLmNvbT4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+CkNjOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnCkNjOiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IEhh
bnMgZGUgR29lZGUgPGhhbnNnQGtlcm5lbC5vcmc+CkNjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPgpDYzogIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgpDYzogRXVn
ZW5pbyBQw6lyZXogPGVwZXJlem1hQHJlZGhhdC5jb20+CkNjOiBTZWFuIENocmlzdG9waGVyc29u
IDxzZWFuamNAZ29vZ2xlLmNvbT4KQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5j
b20+CkNjOiBrdm1Admdlci5rZXJuZWwub3JnCkNjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC5kZXYKQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBsaW51eC1mc2RldmVsQHZnZXIu
a2VybmVsLm9yZwpDYzogIlRoZW9kb3JlIFRzJ28iIDx0eXRzb0BtaXQuZWR1PgpDYzogbGludXgt
ZXh0NEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IE1pa2UgTWFyc2hhbGwgPGh1YmNhcEBvbW5pYm9uZC5j
b20+CkNjOiBkZXZlbEBsaXN0cy5vcmFuZ2Vmcy5vcmcKQ2M6IFBhdWxvIEFsY2FudGFyYSA8cGNA
bWFuZ3VlYml0Lm9yZz4KQ2M6IE5hbWphZSBKZW9uIDxsaW5raW5qZW9uQGtlcm5lbC5vcmc+CkNj
OiBsaW51eC1jaWZzQHZnZXIua2VybmVsLm9yZwpDYzogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2Vy
bmVsLm9yZz4KQ2M6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KQ2M6IGxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0CkNjOiBGbG9yaWFuIEZhaW5lbGxpIDxmbG9yaWFuLmZh
aW5lbGxpQGJyb2FkY29tLmNvbT4KQ2M6IEJyb2FkY29tIGludGVybmFsIGtlcm5lbCByZXZpZXcg
bGlzdCA8YmNtLWtlcm5lbC1mZWVkYmFjay1saXN0QGJyb2FkY29tLmNvbT4KQ2M6IFR6dW5nLUJp
IFNoaWggPHR6dW5nYmlAa2VybmVsLm9yZz4KQ2M6IEJlbnNvbiBMZXVuZyA8YmxldW5nQGNocm9t
aXVtLm9yZz4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+CkNjOiBTaW1vbmEg
VmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT4KQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNv
bT4KQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KQ2M6IFR2cnRrbyBV
cnN1bGluIDx0dXJzdWxpbkB1cnN1bGluLm5ldD4KQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgpDYzog
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgpDYzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
