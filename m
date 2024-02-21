Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43B2C54764
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6BsJhdfXjorUWXkB4FaZ4AmFAOuJTW346yqFZQLwQc=; b=JVS4D6EoLZGkJy
	zrOn0KD6+NOTz3qB+w92oRbwBozsWXvP1mH9QrzOsTqGrv3nRVcud+vHMmVKy6l7rgu8BvBFtC1Ty
	Rj8btWtCM4ZUy08yfdJtuvsPIXpbwJ7tTEQslyJ1/njW+ygVuC/puohcg9CFWTc8JLzJ1/RTUf9Hz
	/3fQ3y6j9KRd8+d6n++t+NkQ/rssJCBrBCBVCcmqunxLbqn1yBU0MnNVc1WUDJv4qilQYGrArBRbz
	ZB+pSaYaBZdBMWUEelfyGmwdG4cjjIrrhf+fseBnAw+NkNTyUSbArLOoU1fToT+rDTxrFcbfSL1kS
	SCihSC3DSChUKsO6nxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcj39-00000000I1j-3zT2;
	Wed, 21 Feb 2024 09:37:59 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcj36-00000000Hzl-1iVQ
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 09:37:57 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607f94d0b7cso54252247b3.3
        for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2024 01:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508273; x=1709113073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTOc5ufmZ/JRdQx/6tbCljAs5aqBkOn4kOQdynUVTFs=;
        b=vn74kzB5px9C/aYfczKAZR6o7zPUf3TGFJderI1l/Y9AB5PlzCLRi2r+F/Op+W4JZB
         BkQk2UqON3Sy3VAF1cZM8ollw9skHHyoX79kOUdKukUptsuZM74jxF0PgpSh+9DU4s0e
         FFl0VrUL0QgruaRvYci/fRlj7Q95STkmVbNI10kl3J7/GqxDBScdE/wuBG79LkHCiAEY
         0mX1tfui85+5niVmM5LSBEmxCrzNpeLOD9EzQdkp5yg/acXNun/WtpZP0FlelHPjp1Fn
         /LGy1qT/DCffe+E9Rm4ZscnNBYb4qs31OaQUwBFYQ1Q9SSZhA+sANsv5ARfGKMcfSx2Q
         thFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWizxI11w6oYHe88uzERNQIQQrrUY4ltewf1o5K9WG9cu4Hgaqu6I6kpO6BqHzMRVLBqQFVjWxFv/NzZlfyLI+Q2zHMeFe8Sk38MiZ1UQ==
X-Gm-Message-State: AOJu0YxSzxX+tApjwBRuH4uRcwCALB+15grgXdjnzno35aXTsiOdkQ14
	UI7HDsulljn1SwVhyBj2AMG0jmdGlzpL4IKkml+h4q18CU/VgwKbrxnOIpITWP4=
X-Google-Smtp-Source: AGHT+IHkgeYqho0VVB8op3oCgB9c2wmvicChF4k82MnBP11rT6rl5M/fE9uq327wBEdbBZdY56Tk+Q==
X-Received: by 2002:a81:9a43:0:b0:607:775c:a54e with SMTP id r64-20020a819a43000000b00607775ca54emr16382232ywg.33.1708508273329;
        Wed, 21 Feb 2024 01:37:53 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id i126-20020a0df884000000b00607c2ab443dsm2510883ywf.130.2024.02.21.01.37.52
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 01:37:52 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc71031680so5177771276.2
        for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2024 01:37:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmKx1bmDF5Ha/1bpZ2w0NHCM8gGFZkJ7VmA2Ti4Y2jmNNu3Qe/9sy54ceWSRFX/HVRQdPVBEcjWbe3K1wAN/pMJVv65aw1sWgJw4ZkHg==
X-Received: by 2002:a25:accb:0:b0:dc7:3165:2db1 with SMTP id
 x11-20020a25accb000000b00dc731652db1mr15173023ybd.49.1708508272053; Wed, 21
 Feb 2024 01:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
 <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com> <20240221054424.GA12033@lst.de>
In-Reply-To: <20240221054424.GA12033@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Feb 2024 10:37:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVHvgVkZsmbsxkScDq+XzMLTONk3Cwmg2N_Rz_-qqWxw@mail.gmail.com>
Message-ID: <CAMuHMdUVHvgVkZsmbsxkScDq+XzMLTONk3Cwmg2N_Rz_-qqWxw@mail.gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_013756_494968_7C02CF2E 
X-CRM114-Status: GOOD (  30.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoLAoKT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgNjo0NOKAr0FNIENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiBPbiBUdWUsIEZlYiAyMCwgMjAyNCBhdCAx
MTowMTowNVBNICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBPbiBUaHUsIEZl
YiAxNSwgMjAyNCBhdCA5OjE24oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdy
b3RlOgo+ID4gPiBQYXNzIHRoZSBxdWV1ZSBsaW1pdCBzZXQgYXQgaW5pdGlhbGl6YXRpb24gdGlt
ZSBkaXJlY3RseSB0bwo+ID4gPiBibGtfbXFfYWxsb2NfZGlzayBpbnN0ZWFkIG9mIHVwZGF0aW5n
IGl0IHJpZ2h0IGFmdGVyIHRoZSBhbGxvY2F0aW9uLgo+ID4gPgo+ID4gPiBUaGlzIHJlcXVpcmVz
IHJlZmFjdG9yaW5nIHRoZSBjb2RlIGEgYml0IHNvIHRoYXQgd2hhdCB3YXMgbW1jX3NldHVwX3F1
ZXVlCj4gPiA+IGJlZm9yZSBhbHNvIGFsbG9jYXRlcyB0aGUgZ2VuZGlzayBub3cgYW5kIGFjdHVh
bGx5IHNldHMgYWxsIGxpbWl0cy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPgo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGlj
aCBpcyBub3cgY29tbWl0IDYxNmY4NzY2MTc5Mjc3MzIgKCJtbWM6IHBhc3MKPiA+IHF1ZXVlX2xp
bWl0cyB0byBibGtfbXFfYWxsb2NfZGlzayIpIGluIGJsb2NrL2Zvci1uZXh0Lgo+ID4KPiA+IEkg
aGF2ZSBiaXNlY3RlZCB0aGUgZm9sbG93aW5nIGZhaWx1cmUgb24gV2hpdGUtSGF3ayAoYWxzbyBz
ZWVuIG9uCj4gPiBvdGhlciBSLUNhciBHZW4zLzQgc3lzdGVtcykgdG8gdGhpcyBjb21taXQ6Cj4g
Pgo+ID4gICAgIHJlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFjIGVlMTQwMDAwLm1tYzogbW1jMCBi
YXNlIGF0Cj4gPiAweDAwMDAwMDAwZWUxNDAwMDAsIG1heCBjbG9jayByYXRlIDIwMCBNSHoKPiA+
ICAgICBtbWMwOiBuZXcgSFM0MDAgTU1DIGNhcmQgYXQgYWRkcmVzcyAwMDAxCj4gPiAgICAgLS0t
LS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPiAgICAgV0FSTklORzogQ1BVOiAx
IFBJRDogMjAgYXQgYmxvY2svYmxrLXNldHRpbmdzLmM6MjAyCj4gPiBibGtfdmFsaWRhdGVfbGlt
aXRzKzB4MTJjLzB4MWUwCj4KPiBUaGlzIGlzOgo+Cj4gICAgICAgICBpZiAobGltLT52aXJ0X2Jv
dW5kYXJ5X21hc2spIHsKPiAgICAgICAgICAgICAgICAgaWYgKFdBUk5fT05fT05DRShsaW0tPm1h
eF9zZWdtZW50X3NpemUgJiYKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaW0t
Pm1heF9zZWdtZW50X3NpemUgIT0gVUlOVF9NQVgpKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+Cj4gc28gd2UgZW5kIHVwIGhlcmUgd2l0aCBib3RoIGEgdmlydF9i
b3VuZGFyeV9tYXNrIGFuZCBhCj4gbWF4X3NlZ21lbnRfc2l6ZSBzZXQsIHdoaWNoIGlzIHJhdGhl
ciBib2d1cy4gIEkgdGhpbmsgdGhlCj4gcHJvYmxlbSBpcyB0aGUgb3JkZXIgb2YgY2hlY2sgaW4g
dGhlIGNvcmUgYmxrX3ZhbGlkYXRlX2xpbWl0cwo+IHRoYXQgYXJ0aWZpY2lhbGx5IGNhdXNlcyB0
aGlzLiAgQ2FuIHlvdSB0cnkgdGhpcyBwYXRjaD8KClRoYW5rcywgZ29vZCB0aGlua2luZywgYXMg
dGhhdCBmaXhlZCB0aGUgaXNzdWUgZm9yIG1lIQoKVGVzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
