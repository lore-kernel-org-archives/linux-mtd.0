Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732D2606A88B
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d9ADtz3S;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p2YtwhwH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=gRfipp3S1KrTP71UmLeQDU2+W5CEYglMaXukvqjvMao=; b=d9ADtz3SF2oLOUs02xXa3pXKK1
	O/xVrMWVYnglWax5Pw/yXdd8+ZKIUsxzmmG72Nr9LFf986Rh2CnT+TtC2wHSz0pzPdgz+3v6hF6tk
	qd7tp68ArgIyQkuJm1sxcWvTaklW4Gf0wfMXsdvYkQ0ev+QG8kxcgFmSGUE13glXShVIKfWFmrUxI
	zohRj+J42gsXe+NLlsaaZ6qiYMocoBBk6e3eO9QYHn7mZ+VoIZGOelEyEiXFSVzVQz5nUeawWNopP
	K3GINYy8AlKZpDzzXbaMpQJ/2fpc3hDyhyRzt/388oBLZtM/x4ZqK4CvFt3IC1YLSCNVL5O4nawRo
	okFR60sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxf9-00000002otx-24H3;
	Mon, 16 Nov 2026 14:26:27 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxf7-00000002osi-2GBi
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 14:26:26 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so4609545b3a.2
        for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2026 06:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839184; x=1795443984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Julx96UTlwUpy/yEEb6XKUMDaihQ6nHqBxqUTRWWoDs=;
        b=p2YtwhwHSYI2yxeyHZ0Es+z9KddAlQJOIOJgGqMtMutH7/ZsNZtKRxL82m62BaXGfb
         N6TQHLf19MDKvM+h4WX8+97ssnueNOq0xnmiHlMZl/IhdkFZo4WUGF9B+d5VO11HI82X
         +bHI0Csbe+/REsyyX9vjN6yPA4YUYnxpLtxrRoIgvmSk8K1UCVJadv++mqer+mrtzd6o
         69mQNHIgg7J9ECgZ4Uoo5vk6GEY6NsxMgG0J6t2vo1QMgwrVH5mzfrNXoqTXptn4E782
         qCKDh5UPjU1sdZISNYvkoBD7ncIsm2vNlamV+L+IoWpux4IBnyqSwJ8V5caj/ltwQRLv
         S0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839184; x=1795443984;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Julx96UTlwUpy/yEEb6XKUMDaihQ6nHqBxqUTRWWoDs=;
        b=PZhRo3xwFfej6YTKBtzrTyW4Z215KmTpURHmsrWE8s9Ukdq5ctE7FwuICx29QxBmSb
         yGnC0+MP/t2Q2HSwrIhlJM8LZ09RV+yZW0PBts7WZzIcnahp/JcvuHrXSjArEKoieIyA
         8x+swGZp6fdTY9jncQQ6eP2k5ovZqMUg15p/wn14er3d40MCLLmEb1Y6YOmjmAHjwAdq
         NY717d4deMUySez6IYZ8qlX54OyOj2Qe42G5zZfspZqavW8h9vRXvRVUYav/lTW3wNW3
         DiDLmcVWtTpzb++r3itveyNPEPAMkLHh6fVeBfhT2AFtc5/VFDlHTW+Sb/Dpyt3fenrN
         odNg==
X-Forwarded-Encrypted: i=1; AL+hErEyllzwOfy97N1ygFmEKRhFhtf05KXcySDKumESww6n3tpbJkSOx/ICtUs//q2fjjZrwH8EbISPdQ0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/8BfCTK4oprTIuRsa3SEcQSmezY3NgEvrkdDoOjMKKWKMQcgv7
	fojYelLr/7tKAndBrTkTD7D1LzorJuOn/S1wSf+IOnd8pfvTh1D+0TXeVmngabqsylP8G3CWB78
	LikePOw==
X-Received: from pffm4-n2.prod.google.com ([2002:a05:6a00:c304:20b0:8a0:70d8:a2ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4fc3:b0:89f:b166:bde6
 with SMTP id d2e1a72fcca58-8beb8cc8ad6mr9720424b3a.54.1794839183449; Mon, 16
 Nov 2026 06:26:23 -0800 (PST)
Date: Mon, 16 Nov 2026 06:26:22 -0800
In-Reply-To: <20261114202653.3113381-10-rdunlap@infradead.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114202653.3113381-1-rdunlap@infradead.org> <20261114202653.3113381-10-rdunlap@infradead.org>
Message-ID: <avsSjioXqbCOn834@seanjc-mac.roam.internal>
Subject: Re: [PATCH 09/12] docs: ioctl-number: update virtualization entries
From: Sean Christopherson <seanjc@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>, linux-mm@kvack.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jason Wang <jasowangio@gmail.com>, 
	David Heidelberg <david@ixit.cz>, oe-linux-nfc@lists.linux.dev, 
	Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, MPT-FusionLinux.pdl@broadcom.com, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, 
	Neill Kapron <nkapron@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"Eugenio =?utf-8?B?UMOpcmV6?=" <eperezma@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Mike Marshall <hubcap@omnibond.com>, devel@lists.orangefs.org, 
	Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	linux-f2fs-devel@lists.sourceforge.net, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, intel-xe@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062625_584463_82B0FF4D 
X-CRM114-Status: GOOD (  21.29  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBOb3YgMTQsIDIwMjYsIFJhbmR5IER1bmxhcCB3cm90ZToKPiBVcGRhdGUgdGhlIGxp
c3Qgb2YgZmlsZXMgd2hlcmUgdmlydHVhbGl6YXRpb24gaW9jdGxzIGFyZSBkZWZpbmVkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+IC0t
LQo+IFtTaW5jZSBoYXZpbmcgbXVsdGlwbGUgbWFpbnRhaW5lcnMgdHJ5aW5nIHRvIG1lcmdlIHRo
ZXNlIHdvdWxkCj4gY2F1c2Ugc29tZSBjb25mbGljdHMsIGl0IHdvdWxkIGJlIG1vcmUgbWFuYWdl
YWJsZSBmb3IgSm9uIHRvCj4gdGFrZSBhbGwgb2YgdGhlc2UgdGhyb3VnaCB0aGUgZG9jcy1uZXh0
IHRyZWUuXQo+IAo+IENjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0Pgo+IENjOiBT
aHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBsaW51eC1kb2NAdmdl
ci5rZXJuZWwub3JnCj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDYzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDYzogSGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVs
Lm9yZz4KPiBDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiBDYzogR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogIk1pY2hhZWwgUy4g
VHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgo+IENjOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ2lvQGdt
YWlsLmNvbT4KPiBDYzogRXVnZW5pbyBQw6lyZXogPGVwZXJlem1hQHJlZGhhdC5jb20+Cj4gQ2M6
IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IENjOiBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+IENjOiBrdm1Admdlci5rZXJuZWwub3JnCj4gQ2M6
IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LmRldgo+IAo+ICBEb2N1bWVudGF0aW9uL3VzZXJz
cGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdCB8ICAgIDYgKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiAtLS0gbGludXgtbmV4dC0yMDI2MTExMy5vcmln
L0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0Cj4gKysr
IGxpbnV4LW5leHQtMjAyNjExMTMvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lv
Y3RsLW51bWJlci5yc3QKPiBAQCAtMjAwLDYgKzIwMCw3IEBAIENvZGUgIFNlcSMgICAgSW5jbHVk
ZSBGaWxlCj4gICdNJyAgIDAxLTAzICBkcml2ZXJzL3Njc2kvbWVnYXJhaWQvbWVnYXJhaWRfc2Fz
LmgKPiAgJ00nICAgMDAtMDMgIGRyaXZlcnMvdmlkZW8vZmJkZXYvbWI4NjJ4eC9tYjg2Mnh4ZmIu
aAo+ICAnTScgICAwMC0wRiAgZHJpdmVycy92aWRlby9mc2wtZGl1LWZiLmggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQo+ICsnTScgICAwMS0wMyAgeGVuL2ludGVyZmFj
ZS94ZW4tbWNhLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQo+
ICAnTicgICAwMC0xRiAgZHJpdmVycy91c2Ivc2Nhbm5lci5oCj4gICdOJyAgIDQwLTdGICB1YXBp
L2xpbnV4L252bWVfaW9jdGwuaAo+ICAnTicgICA4MC04MyAgdWFwaS9saW51eC9udHN5bmMuaCBh
bmQgdWFwaS9saW51eC9udm1lX2lvY3RsLmggICAgICAgICAgIGNvbmZsaWN0IQo+IEBAIC0yMzks
NiArMjQwLDcgQEAgQ29kZSAgU2VxIyAgICBJbmNsdWRlIEZpbGUKPiAgJ1UnICAgNjQgICAgIGRy
aXZlcnMvdXNiL21pc2MvdXNidGVzdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25mbGljdCEKPiAgJ1YnICAgYWxsICAgIGxpbnV4L3Z0LmggICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKPiAgJ1YnICAgYWxsICAgIGxpbnV4
L3ZpZGVvZGV2Mi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25m
bGljdCEKPiArJ1YnICAgMDAtMUYgIGxpbnV4L3Zib3hndWVzdC5oICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKPiAgJ1YnICAgQzAgICAgIGxpbnV4L2l2
dHZmYi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGlj
dCEKPiAgJ1YnICAgQzAgICAgIGxpbnV4L2l2dHYuaCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEKPiAgJ1YnICAgQzAgICAgIG1lZGlhL3NpNDcx
My5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCEK
PiBAQCAtMzU3LDYgKzM1OSw3IEBAIENvZGUgIFNlcSMgICAgSW5jbHVkZSBGaWxlCj4gICd8JyAg
IDgwLTlGICBzYW1wbGVzLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQW55IHNhbXBsZSBhbmQgZXhhbXBsZSBkcml2ZXJzCj4gIDB4ODAgIDAwLTFGICBs
aW51eC9mYi5oCj4gIDB4ODEgIDAwLTFGICBsaW51eC92ZHVzZS5oCj4gKyAgICAgICAgICAgICBk
cml2ZXJzL3ZkcGEvdmRwYV91c2VyL3ZkdXNlX2Rldi5jCj4gIDB4ODkgIDAwLTA3ICBhc20tZ2Vu
ZXJpYy9zb2NraW9zLmgKPiAgMHg4OSAgMDYtMDcgIGxpbnV4L3NvY2tpb3MuaAo+ICAweDg5ICAw
Qi1ERiAgbGludXgvc29ja2lvcy5oCj4gQEAgLTM5OCw4ICs0MDEsMTEgQEAgQ29kZSAgU2VxIyAg
ICBJbmNsdWRlIEZpbGUKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bWFpbHRvOmt2bUB2Z2VyLmtlcm5lbC5v
cmc+Cj4gIDB4QUUgIDQwLUZGICBsaW51eC9rdm0uaCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgS2VybmVsLWJhc2VkIFZpcnR1YWwgTWFjaGluZQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDxtYWlsdG86a3ZtQHZnZXIua2VybmVsLm9yZz4KPiArMHhBRSAgQzYgICAgIGFy
Y2gveDg2L2t2bS94ODYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBY
ODYgS1ZNCgpJJ2QgcmF0aGVyIG9taXQgdGhpcyBlbnRyeS4gIDB4QUUgQzYgaXMgY292ZXJlZCBi
eSB0aGUgZW50cnkgYWJvdmUsIGFuZCB0aGUgaG9ycm9yCmluIGFyY2gveDg2L2t2bS94ODYuYyBp
cyBwdXJlbHkgYSAzMi1iaXQgY29tcGF0aWJpbGl0eSBhbGlhcyBmb3IgYW4gaW9jdGwgdGhhdCBp
cwpkZWZpbmVkIGluIGt2bS5oICh0aGUgc3RydWN0dXJlIHBheWxvYWQgZGVmaW5lcyBhbiBwb2lu
dGVyIGluc3RlYWQgb2YgYSBfX3U2NCkuCgpJZiBpdCdzIGEgc3RpY2tpbmcgcG9pbnQsIGUuZy4g
dGhpcyB3aWxsIHRyaXAgYXV0b21hdGVkIHRvb2xpbmcgb3ZlciBhbmQgb3ZlciwgdGhlbgpJIHZv
dGUgdG8gbW92ZSB0aGUgcmVsZXZhbnQgZGVmaW5pdGlvbnMgdG8gdWFwaSBoZWFkZXJzLCBlLmcu
CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gveDg2
L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKaW5kZXggMDBjZTI2NTM5MWUxLi5lMDJlZjdhMzlmN2Mg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKKysrIGIvYXJjaC94
ODYvaW5jbHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMjMwLDYgKzIzMCwxOCBAQCBzdHJ1Y3Qga3Zt
X21zcl9maWx0ZXIgewogCXN0cnVjdCBrdm1fbXNyX2ZpbHRlcl9yYW5nZSByYW5nZXNbS1ZNX01T
Ul9GSUxURVJfTUFYX1JBTkdFU107CiB9OwoKK3N0cnVjdCBrdm1fbXNyX2ZpbHRlcl9yYW5nZV9j
b21wYXQgeworCV9fdTMyIGZsYWdzOworCV9fdTMyIG5tc3JzOworCV9fdTMyIGJhc2U7CisJX191
MzIgYml0bWFwOworfTsKKworc3RydWN0IGt2bV9tc3JfZmlsdGVyX2NvbXBhdCB7CisJX191MzIg
ZmxhZ3M7CisJc3RydWN0IGt2bV9tc3JfZmlsdGVyX3JhbmdlX2NvbXBhdCByYW5nZXNbS1ZNX01T
Ul9GSUxURVJfTUFYX1JBTkdFU107Cit9OworCiBzdHJ1Y3Qga3ZtX2NwdWlkX2VudHJ5IHsKIAlf
X3UzMiBmdW5jdGlvbjsKIAlfX3UzMiBlYXg7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2
LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKaW5kZXggMDc3MWVmYWY5NGM4Li5lZjlmOTJjYmE1ODkg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMK
QEAgLTQyNjAsMjEgKzQyNjAsNiBAQCBpbnQga3ZtX3ZtX2lvY3RsX2VuYWJsZV9jYXAoc3RydWN0
IGt2bSAqa3ZtLAogfQoKICNpZmRlZiBDT05GSUdfS1ZNX0NPTVBBVAotLyogZm9yIEtWTV9YODZf
U0VUX01TUl9GSUxURVIgKi8KLXN0cnVjdCBrdm1fbXNyX2ZpbHRlcl9yYW5nZV9jb21wYXQgewot
CV9fdTMyIGZsYWdzOwotCV9fdTMyIG5tc3JzOwotCV9fdTMyIGJhc2U7Ci0JX191MzIgYml0bWFw
OwotfTsKLQotc3RydWN0IGt2bV9tc3JfZmlsdGVyX2NvbXBhdCB7Ci0JX191MzIgZmxhZ3M7Ci0J
c3RydWN0IGt2bV9tc3JfZmlsdGVyX3JhbmdlX2NvbXBhdCByYW5nZXNbS1ZNX01TUl9GSUxURVJf
TUFYX1JBTkdFU107Ci19OwotCi0jZGVmaW5lIEtWTV9YODZfU0VUX01TUl9GSUxURVJfQ09NUEFU
IF9JT1coS1ZNSU8sIDB4YzYsIHN0cnVjdCBrdm1fbXNyX2ZpbHRlcl9jb21wYXQpCi0KIGxvbmcg
a3ZtX2FyY2hfdm1fY29tcGF0X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBpbnQg
aW9jdGwsCiAJCQkgICAgICB1bnNpZ25lZCBsb25nIGFyZykKIHsKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9saW51eC9rdm0uaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm0uaAppbmRleCA4ZGZm
MmZjMTk3MmUuLjU0ZGJkYWJkMGU5YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2
bS5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm0uaApAQCAtMTQ3Nyw2ICsxNDc3LDcgQEAg
c3RydWN0IGt2bV9lbmNfcmVnaW9uIHsKCiAvKiBBdmFpbGFibGUgd2l0aCBLVk1fQ0FQX1g4Nl9N
U1JfRklMVEVSICovCiAjZGVmaW5lIEtWTV9YODZfU0VUX01TUl9GSUxURVIJX0lPVyhLVk1JTywg
IDB4YzYsIHN0cnVjdCBrdm1fbXNyX2ZpbHRlcikKKyNkZWZpbmUgS1ZNX1g4Nl9TRVRfTVNSX0ZJ
TFRFUl9DT01QQVQgX0lPVyhLVk1JTywgMHhjNiwgc3RydWN0IGt2bV9tc3JfZmlsdGVyX2NvbXBh
dCkKCiAvKiBBdmFpbGFibGUgd2l0aCBLVk1fQ0FQX0RJUlRZX0xPR19SSU5HICovCiAjZGVmaW5l
IEtWTV9SRVNFVF9ESVJUWV9SSU5HUwkJX0lPKEtWTUlPLCAweGM3KQoKPiAgMHhBRSAgMjAtM0Yg
IGxpbnV4L25pdHJvX2VuY2xhdmVzLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBOaXRybyBFbmNsYXZlcwo+ICAweEFGICAwMC0xRiAgbGludXgvZnNsX2h5cGVydmlzb3IuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZyZWVzY2FsZSBoeXBlcnZpc29yCj4g
KzB4QUYgIDAwLThGICBsaW51eC92aG9zdC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uZmxpY3QhCj4gKzB4QUYgIDMxLTMyICBkcml2ZXJzL3Zob3N0L3Rl
c3QuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhCj4gIDB4
QjAgIGFsbCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUkFUSU8gZGV2aWNlcyBpbiBkZXZlbG9wbWVudDoKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8bWFpbHRvOnZnb0ByYXRpby5kZT4KPiAgMHhCMSAgMDAtMUYgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQUFBvWAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
