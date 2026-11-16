Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55551606A32A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 22:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T34tD7hP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OK0ibvIN6bRyUVpch0SQw1YdmxKo/6yAHv1Bh1N4Q0A=; b=T34tD7hPUpooXmGcHfjIba4xGt
	1rHHkm9aLFNP1cjp4OFpdTjL358GujRZuG7H9d01WN/YBDlXjT9Ak2p5GewFZ258nWoY3yt7CqbIU
	sJRGfAR/FjzZ2zAySTqDP4sH+Ml5rk7Kkj8G7ktI1CYl//0Bmih6RV0cOO8+Yx7CsTQoruj5VELcv
	DFg8abbXD82W/qZzs0TkIh2NgShiwGLhJWnp6+Ihq+KCGs28Smcx3fQ980rn0MbrIP5mDb1pBdv4p
	Uek3t6zt8CwZ5X+ans0zEnojlM6L0jvOY0SUxFp2KUa0jxxPVJRqlxK3q+oVfnlcZqtWLssNB7AAx
	KBGQ+uvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT54j-000000042cT-0hf6;
	Mon, 16 Nov 2026 22:21:21 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT54Y-000000042c2-2GpG;
	Mon, 16 Nov 2026 22:21:10 +0000
Message-ID: <65bab646-fbf6-4da0-b833-2314d568a845@infradead.org>
Date: Mon, 16 Nov 2026 14:21:07 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] docs: ioctl-number: update virtualization entries
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, linux-mm@kvack.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowangio@gmail.com>, David Heidelberg <david@ixit.cz>,
 oe-linux-nfc@lists.linux.dev, Chas Williams <3chas3@gmail.com>,
 linux-atm-general@lists.sourceforge.net,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 MPT-FusionLinux.pdl@broadcom.com,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org,
 Neill Kapron <nkapron@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, virtualization@lists.linux.dev, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org, Theodore Ts'o
 <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Mike Marshall <hubcap@omnibond.com>, devel@lists.orangefs.org,
 Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261114202653.3113381-1-rdunlap@infradead.org>
 <20261114202653.3113381-10-rdunlap@infradead.org>
 <avsSjioXqbCOn834@seanjc-mac.roam.internal>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <avsSjioXqbCOn834@seanjc-mac.roam.internal>
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
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMS8xNi8yNiA2OjI2IEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+IE9uIFNh
dCwgTm92IDE0LCAyMDI2LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+IFVwZGF0ZSB0aGUgbGlzdCBv
ZiBmaWxlcyB3aGVyZSB2aXJ0dWFsaXphdGlvbiBpb2N0bHMgYXJlIGRlZmluZWQuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+PiAtLS0K
Pj4gW1NpbmNlIGhhdmluZyBtdWx0aXBsZSBtYWludGFpbmVycyB0cnlpbmcgdG8gbWVyZ2UgdGhl
c2Ugd291bGQKPj4gY2F1c2Ugc29tZSBjb25mbGljdHMsIGl0IHdvdWxkIGJlIG1vcmUgbWFuYWdl
YWJsZSBmb3IgSm9uIHRvCj4+IHRha2UgYWxsIG9mIHRoZXNlIHRocm91Z2ggdGhlIGRvY3MtbmV4
dCB0cmVlLl0KPj4KPj4gQ2M6IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+Cj4+IENj
OiBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPgo+PiBDYzogbGludXgtZG9j
QHZnZXIua2VybmVsLm9yZwo+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+
PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+PiBDYzog
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+IENjOiBIYW5zIGRlIEdvZWRlIDxoYW5z
Z0BrZXJuZWwub3JnPgo+PiBDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4gQ2M6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4+IENjOiAi
TWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+Cj4+IENjOiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ2lvQGdtYWlsLmNvbT4KPj4gQ2M6IEV1Z2VuaW8gUMOpcmV6IDxlcGVyZXptYUByZWRo
YXQuY29tPgo+PiBDYzogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4+
IENjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+PiBDYzoga3ZtQHZnZXIu
a2VybmVsLm9yZwo+PiBDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXguZGV2Cj4+Cj4+ICBE
b2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdCB8ICAgIDYg
KysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IC0tLSBsaW51
eC1uZXh0LTIwMjYxMTEzLm9yaWcvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lv
Y3RsLW51bWJlci5yc3QKPj4gKysrIGxpbnV4LW5leHQtMjAyNjExMTMvRG9jdW1lbnRhdGlvbi91
c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QKPj4gQEAgLTIwMCw2ICsyMDAsNyBA
QCBDb2RlICBTZXEjICAgIEluY2x1ZGUgRmlsZQo+PiAgJ00nICAgMDEtMDMgIGRyaXZlcnMvc2Nz
aS9tZWdhcmFpZC9tZWdhcmFpZF9zYXMuaAo+PiAgJ00nICAgMDAtMDMgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvbWI4NjJ4eC9tYjg2Mnh4ZmIuaAo+PiAgJ00nICAgMDAtMEYgIGRyaXZlcnMvdmlkZW8v
ZnNsLWRpdS1mYi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKPj4g
KydNJyAgIDAxLTAzICB4ZW4vaW50ZXJmYWNlL3hlbi1tY2EuaCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uZmxpY3QhCj4+ICAnTicgICAwMC0xRiAgZHJpdmVycy91c2Ivc2Nh
bm5lci5oCj4+ICAnTicgICA0MC03RiAgdWFwaS9saW51eC9udm1lX2lvY3RsLmgKPj4gICdOJyAg
IDgwLTgzICB1YXBpL2xpbnV4L250c3luYy5oIGFuZCB1YXBpL2xpbnV4L252bWVfaW9jdGwuaCAg
ICAgICAgICAgY29uZmxpY3QhCj4+IEBAIC0yMzksNiArMjQwLDcgQEAgQ29kZSAgU2VxIyAgICBJ
bmNsdWRlIEZpbGUKPj4gICdVJyAgIDY0ICAgICBkcml2ZXJzL3VzYi9taXNjL3VzYnRlc3QuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCj4+ICAnVicgICBhbGwgICAg
bGludXgvdnQuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbmZsaWN0IQo+PiAgJ1YnICAgYWxsICAgIGxpbnV4L3ZpZGVvZGV2Mi5oICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKPj4gKydWJyAgIDAwLTFGICBs
aW51eC92Ym94Z3Vlc3QuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uZmxpY3QhCj4+ICAnVicgICBDMCAgICAgbGludXgvaXZ0dmZiLmggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQo+PiAgJ1YnICAgQzAgICAgIGxp
bnV4L2l2dHYuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25mbGljdCEKPj4gICdWJyAgIEMwICAgICBtZWRpYS9zaTQ3MTMuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCj4+IEBAIC0zNTcsNiArMzU5LDcg
QEAgQ29kZSAgU2VxIyAgICBJbmNsdWRlIEZpbGUKPj4gICd8JyAgIDgwLTlGICBzYW1wbGVzLyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQW55IHNhbXBs
ZSBhbmQgZXhhbXBsZSBkcml2ZXJzCj4+ICAweDgwICAwMC0xRiAgbGludXgvZmIuaAo+PiAgMHg4
MSAgMDAtMUYgIGxpbnV4L3ZkdXNlLmgKPj4gKyAgICAgICAgICAgICBkcml2ZXJzL3ZkcGEvdmRw
YV91c2VyL3ZkdXNlX2Rldi5jCj4+ICAweDg5ICAwMC0wNyAgYXNtLWdlbmVyaWMvc29ja2lvcy5o
Cj4+ICAweDg5ICAwNi0wNyAgbGludXgvc29ja2lvcy5oCj4+ICAweDg5ICAwQi1ERiAgbGludXgv
c29ja2lvcy5oCj4+IEBAIC0zOTgsOCArNDAxLDExIEBAIENvZGUgIFNlcSMgICAgSW5jbHVkZSBG
aWxlCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDxtYWlsdG86a3ZtQHZnZXIua2VybmVsLm9yZz4KPj4gIDB4
QUUgIDQwLUZGICBsaW51eC9rdm0uaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgS2VybmVsLWJhc2VkIFZpcnR1YWwgTWFjaGluZQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8bWFpbHRvOmt2bUB2Z2VyLmtlcm5lbC5vcmc+Cj4+ICsweEFFICBDNiAgICAgYXJjaC94ODYv
a3ZtL3g4Ni5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFg4NiBLVk0K
PiAKPiBJJ2QgcmF0aGVyIG9taXQgdGhpcyBlbnRyeS4gIDB4QUUgQzYgaXMgY292ZXJlZCBieSB0
aGUgZW50cnkgYWJvdmUsIGFuZCB0aGUgaG9ycm9yCj4gaW4gYXJjaC94ODYva3ZtL3g4Ni5jIGlz
IHB1cmVseSBhIDMyLWJpdCBjb21wYXRpYmlsaXR5IGFsaWFzIGZvciBhbiBpb2N0bCB0aGF0IGlz
Cj4gZGVmaW5lZCBpbiBrdm0uaCAodGhlIHN0cnVjdHVyZSBwYXlsb2FkIGRlZmluZXMgYW4gcG9p
bnRlciBpbnN0ZWFkIG9mIGEgX191NjQpLgoKT0suCgo+IElmIGl0J3MgYSBzdGlja2luZyBwb2lu
dCwgZS5nLiB0aGlzIHdpbGwgdHJpcCBhdXRvbWF0ZWQgdG9vbGluZyBvdmVyIGFuZCBvdmVyLCB0
aGVuCj4gSSB2b3RlIHRvIG1vdmUgdGhlIHJlbGV2YW50IGRlZmluaXRpb25zIHRvIHVhcGkgaGVh
ZGVycywgZS5nLgoKSSBkb24ndCBrbm93IG9mIGFueXRoaW5nIGxpa2UgdGhhdC4KCi0tIAp+UmFu
ZHkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
