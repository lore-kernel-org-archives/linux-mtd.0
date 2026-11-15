Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8BD606A88B
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Nov 2026 20:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y9aEpzIz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R9K+GxFc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Va7p+Gqz58ptaifzLRog6atwJjdUZ8gp81Hx1yT6fc=; b=y9aEpzIzRxMtVVDW5jEYL/9tR4
	EHFFkmEP2VOs1tOZsbFvGgXoWQmV7zjAb8PulAsRB9+8cUITpUmUxdeUGhPbdwbOKeMubaKVK2TA0
	O2Whf2lkCfbJ8bbMh/VbG0SDi3NBu/9yPBC3gRLqmiKGusCixOsbWUXeNtPWt+9SuD224H+HidmJX
	f5nnyfw0zQaG+/rcBQfOxEx+bzn8BJqYq6NH8ni1y8a+U6OAud4kSF9PdPo3WtF7zU/y41Y31Bg2F
	yu+Av6XN7j/COEGbRMk56DBMMwXTMDYlnv/o4KQjf979GXUhrFUI1y2VxoecUjHKbIuc+el1zsqTR
	Y3siMOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgpF-00000000QoZ-3fbo;
	Sun, 15 Nov 2026 20:27:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgpE-00000000QoM-1yGW
	for linux-mtd@lists.infradead.org;
	Sun, 15 Nov 2026 20:27:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E5C0624DD;
	Sun, 15 Nov 2026 20:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A52E1F000C4;
	Sun, 15 Nov 2026 20:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774462;
	bh=22XwY66KnSOtO1/d/kMDoLBAuqZ542YRW7O2pDyTx1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R9K+GxFcxklLWxKNOJ5lRWC5zIQSWncnMMkh8TmdSlBzjVeCIYok3BI+LiZIT9Js/
	 wuRlKxXZ9tfeGHjVjLVPj4KVIC2OmTkytp5uIluoKYZYWdSYEniQPIj5QQyxgVWJ8a
	 /bOuIKw1JSpNOZ6GUsOkWzb/fPu5wkio1MAqhuM/AxZd79rmeJLPB6eZ+PNX5oxePa
	 I4OAq3pr+5s5YjD2xmNd79jVJ5yHrBZtLZEQ00vdL+E1kl4UHJOq+coEs+/Uz0nYt6
	 lORfbphZZ9QOpkOn8tneNfDGO1qbDVyF4Aocafhn88MzuNMXyI5Q4SQtGN+PraJ4cu
	 KIB9IJPamEnFA==
Message-ID: <sashiko-outbox-215802@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/12] docs: ioctl-number: update sound entries
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
In-Reply-To: <20261114202653.3113381-3-rdunlap@infradead.org>
References: <20261114202653.3113381-1-rdunlap@infradead.org>
 <20261114202653.3113381-3-rdunlap@infradead.org>
Date: Sun, 15 Nov 2026 20:27:39 +0000
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
NSBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtMb3ddIGRvY3M6IGlvY3RsLW51bWJl
cjogd3JvbmcgY29kZSwgcmFuZ2UsIGFuZCBjb25mbGljdCBtYXJrZXIgZm9yCiAgc2NhcmxldHQy
LmgKLSBbTG93XSBkb2NzOiBpb2N0bC1udW1iZXI6IGluY29tcGxldGUgc2VxdWVuY2UgcmFuZ2Ug
Zm9yIHNvdW5kL3BjbS5oCi0gW0xvd10gZG9jczogaW9jdGwtbnVtYmVyOiBpbmNvbXBsZXRlIHJh
bmdlIGFuZCB0YWIgY2hhciBmb3IKICBzb3VuZC9jb3JlL3BjbV9jb21wYXQuYwotIFtMb3ddIGRv
Y3M6IGlvY3RsLW51bWJlcjogaW5jb21wbGV0ZSBzZXF1ZW5jZSByYW5nZSBmb3IKICBzb3VuZC9j
b3JlL3NlcS9zZXFfY29tcGF0LmMKLSBbTG93XSBkb2NzOiBpb2N0bC1udW1iZXI6IG1pc3Npbmcg
Y29uZmxpY3QhIG1hcmtlciBvbiBzd2l0Y2h0ZWMuYwogIHVuZGVyIGNvZGUgJ1cnCi0tCgpjb21t
aXQgMDMxNmRjMmNkMGY0NzlhMzU0NzE3NThkMjA4ZjQzMzViOGZiYzYxNwpBdXRob3I6IFJhbmR5
IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgoKZG9jczogaW9jdGwtbnVtYmVyOiB1cGRh
dGUgc291bmQgZW50cmllcwoKVGhpcyBjb21taXQgdXBkYXRlcyB0aGUgaW9jdGwtbnVtYmVyIGRv
Y3VtZW50YXRpb24gdGFibGUgd2l0aCBhZGRpdGlvbmFsCnNvdW5kIGhlYWRlciBhbmQgY29tcGF0
IGZpbGVzIGFuZCBhZGp1c3RzIHNlcXVlbmNlIG51bWJlciByYW5nZXMgZm9yIHNvdW5kCmlvY3Rs
cy4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0
bC1udW1iZXIucnN0IGIvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51
bWJlci5yc3QKPiBpbmRleCBlMWQ1NmQ1Y2NjZDE0Li5kYWM2NWY1OWQwNWUyIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0Cj4g
KysrIGIvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QK
PiBAQCAtMTIyLDExICsxMjIsMTQgQEAgQ29kZSAgU2VxIyAgICBJbmNsdWRlIEZpbGUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDb21tZW50cwo+ICAnQScgICAw
MC0wRiAgbGludXgvYWdwZ2FydC5oLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbmZsaWN0IQo+ICAgICAgICAgICAgICAgZHJpdmVycy9jaGFyL2FncC9jb21wYXRf
aW9jdGwuaAo+ICAnQScgICAwMC03RiAgc291bmQvYXNvdW5kLmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQo+ICsnQScgICAyMCAgICAgc291bmQv
cGNtLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZs
aWN0IQoKW1NldmVyaXR5OiBMb3ddClNob3VsZCB0aGUgc2VxdWVuY2UgcmFuZ2UgZm9yIHNvdW5k
L3BjbS5oIGJlIDIwLTI0IGluc3RlYWQgb2YgMjA/ICBJbgppbmNsdWRlL3NvdW5kL3BjbS5oLCBT
TkRSVl9QQ01fSU9DVExfU1RBVFVTX0VYVDY0IGFuZApTTkRSVl9QQ01fSU9DVExfU1RBVFVTX0VY
VDMyIGFsc28gZGVmaW5lIGlvY3RscyB1c2luZyBfSU9XUignQScsIDB4MjQsIC4uLikuCgo+ICsn
QScgICAyMC01MyAgc291bmQvY29yZS9wY21fY29tcGF0LmMJICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbmZsaWN0IQoKW1NldmVyaXR5OiBMb3ddClNob3VsZCB0aGUgc2VxdWVuY2Ug
cmFuZ2UgZm9yIHNvdW5kL2NvcmUvcGNtX2NvbXBhdC5jIHN0YXJ0IGF0IDEwIHJhdGhlcgp0aGFu
IDIwPyAgVGhlIGNvbXBhdCBpb2N0bCBlbnVtIGluIHNvdW5kL2NvcmUvcGNtX2NvbXBhdC5jIHN0
YXJ0cyB3aXRoClNORFJWX1BDTV9JT0NUTF9IV19SRUZJTkUzMiAoX0lPV1IoJ0EnLCAweDEwLCAu
Li4pKSwKU05EUlZfUENNX0lPQ1RMX0hXX1BBUkFNUzMyICgweDExKSwgYW5kIFNORFJWX1BDTV9J
T0NUTF9TV19QQVJBTVMzMiAoMHgxMykuCkFsc28sIHRoZXJlIGlzIGEgbGl0ZXJhbCB0YWIgY2hh
cmFjdGVyIHJpZ2h0IGFmdGVyIHNvdW5kL2NvcmUvcGNtX2NvbXBhdC5jCmluc3RlYWQgb2Ygc3Bh
Y2VzLgoKWyAuLi4gXQoKPiBAQCAtMTYwLDcgKzE2NCw5IEBAIENvZGUgIFNlcSMgICAgSW5jbHVk
ZSBGaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ29tbWVu
dHMKPiAgJ0gnICAgMTAtMUYgIHNvdW5kL2hkYV9od2RlcC5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKPiAgJ0gnICAgNDAtNEYgIHNvdW5kL2hkc3Bt
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEK
PiAgJ0gnICAgNDAtNEYgIHNvdW5kL2hkc3AuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25mbGljdCEKPiArJ0gnICAgNjAtNjMgIHNvdW5kL3NjYXJsZXR0
Mi5oCgpbU2V2ZXJpdHk6IExvd10KU2hvdWxkIHNvdW5kL3NjYXJsZXR0Mi5oIGJlIGxpc3RlZCB1
bmRlciBjb2RlICdTJyB3aXRoIHJhbmdlIDYwLTY0IGFuZCBhCmNvbmZsaWN0ISBtYXJrZXIgaW5z
dGVhZCBvZiAnSCcgNjAtNjM/ICBJbiBpbmNsdWRlL3VhcGkvc291bmQvc2NhcmxldHQyLmgsCmFs
bCBpb2N0bHMgdXNlIGNvZGUgJ1MnIGZyb20gU0NBUkxFVFQyX0lPQ1RMX1BWRVJTSU9OIChfSU9S
KCdTJywgMHg2MCwgaW50KSkKdGhyb3VnaCBTQ0FSTEVUVDJfSU9DVExfR0VUX0VSQVNFX1BST0dS
RVNTIChfSU9SKCdTJywgMHg2NCwgLi4uKSksIHdoaWNoCm92ZXJsYXBzIHdpdGggbGludXgvY2Ry
b20uaCwgc291bmQvYXNlcXVlbmNlci5oLCBhbmQgc291bmQvZmNwLmguCgpbIC4uLiBdCgo+IEBA
IC0yMDQsNiArMjEwLDggQEAgQ29kZSAgU2VxIyAgICBJbmNsdWRlIEZpbGUgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDb21tZW50cwo+ICAnUycgICA4MC04MSAg
c2NzaS9zY3NpX2lvY3RsLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbmZsaWN0IQo+ICAnUycgICA4Mi1GRiAgc2NzaS9zY3NpLmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQo+ICAnUycgICAwMC03RiAgc291
bmQvYXNlcXVlbmNlci5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bmZsaWN0IQo+ICsnUycgICAyMS0yMyAgc291bmQvY29yZS9zZXEvc2VxX2NvbXBhdC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQoKW1NldmVyaXR5OiBMb3ddClNob3Vs
ZCB0aGUgc2VxdWVuY2UgcmFuZ2UgZm9yIHNvdW5kL2NvcmUvc2VxL3NlcV9jb21wYXQuYyBiZSAy
MC01MiBpbnN0ZWFkCm9mIDIxLTIzPyAgVGhhdCBmaWxlIGFsc28gZGVmaW5lcyBTTkRSVl9TRVFf
SU9DVExfQ1JFQVRFX1BPUlQzMgooX0lPV1IoJ1MnLCAweDIwLCAuLi4pKSBhbmQgU05EUlZfU0VR
X0lPQ1RMX1FVRVJZX05FWFRfUE9SVDMyCihfSU9XUignUycsIDB4NTIsIC4uLikpLgoKWyAuLi4g
XQoKPiBAQCAtMjE5LDcgKzIyNyw3IEBAIENvZGUgIFNlcSMgICAgSW5jbHVkZSBGaWxlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ29tbWVudHMKPiAgJ1YnICAg
QzAgICAgIG1lZGlhL3NpNDcxMy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25mbGljdCEKPiAgJ1cnICAgMDAtMUYgIGxpbnV4L3dhdGNoZG9nLmggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKPiAgJ1cnICAgMDAt
MUYgIGxpbnV4L3dhbnJvdXRlci5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25mbGljdCEgKHByZSAzLjkpCj4gLSdXJyAgIDAwLTNGICBzb3VuZC9hc291bmQuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCj4gKydX
JyAgIDAwLTQxICBzb3VuZC9hc291bmQuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uZmxpY3QhCj4gICdXJyAgIDQwLTVGICBkcml2ZXJzL3BjaS9zd2l0Y2gv
c3dpdGNodGVjLmMKCltTZXZlcml0eTogTG93XQpEb2VzIHRoZSBkcml2ZXJzL3BjaS9zd2l0Y2gv
c3dpdGNodGVjLmMgZW50cnkgbm93IG5lZWQgYSBjb25mbGljdCEgbWFya2VyCmFzIHdlbGwsIHNp
bmNlIGV4dGVuZGluZyBzb3VuZC9hc291bmQuaCB0byAwMC00MSBjYXVzZXMgdGhlIHR3byByYW5n
ZXMgdG8Kb3ZlcmxhcCBvbiA0MC00MT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTQyMDI2NTMuMzExMzM4MS0xLXJkdW5sYXBA
aW5mcmFkZWFkLm9yZz9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
