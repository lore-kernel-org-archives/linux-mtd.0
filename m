Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38F7C7EE26
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXYB9JJJMui86vYqKSrJZyVX8+1Pset/GlGeJ5bykr8=; b=qJmabZ5P+9Zoyd
	vj7SAnf9c7yHcDI+S+C5cTEoMb/BIXNKg4LG0o1QHNrzXa1S+eZp/JmmlDcGkAvAPaHp3J24C4XeR
	9lKW9hoQOtbN6IPnY4w8Nnli1ZJaHdY2O1TX/1IpwTkjyGPZX2DZpfKYcNN9HVlvY6NY3kkLK2eA5
	KPHmMbBLuyYEsQ4b2rH+KCX0j/U+jepXMb1qAeG0nXxYBRQveNquXzmrTav+HigJ6y/bkI7vkUG5v
	sXI0elQez1/PeEVtwOnbhF/bHDWdTdaEagVFJz+Q4HTyoO1dMiHm0VYZU1PVOAXSTdxnnDs4KnQVg
	O9Wblefm4jxmVss+gjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1WmH-00B79j-2V;
	Tue, 23 May 2023 18:30:33 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1WmD-00B78N-15
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 18:30:30 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-96f44435d92so118662766b.0
        for <linux-mtd@lists.infradead.org>; Tue, 23 May 2023 11:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684866625; x=1687458625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfbS4pJKMPIQHwf0r8ONmf3iSeCg8srHtIH+ip6lF6w=;
        b=NfLp2BsMRIHllk8FFFjdV9KDwf4RCMgP9a2BwqfYCVl0mh2iHR4+6KpSGJdnKJf5Hp
         d6c9rjQnJsP1a2FBSxi07cGVetZTYEmrFmtvRrfrOzACNQs9j410iF3ZrxlKMSLw9vpz
         04covnx8a+VQgqwGFWWgTae97NpecE9NXZs9Ibo0VBUVkMW/B6pHpK3GhwYzViwVlhJO
         83Zl0RRBldAyfodLcwBdVJXzNdrGOLg3MIBhgYwt3CD1toy4ZjXmMEVIKlFmIB2nEi4+
         T3CXj2GzZpA0zHeQ4HiiQ1mx3jOPzw2fgoKp4GtEvKdq2CZ00Sz1t0NqHMHeFyiSeWLZ
         6aAA==
X-Gm-Message-State: AC+VfDxS1ZQ38ab8VFg94ohKMb3R/XiN4xwa9zqHfoDdLvxtBaRVi910
	/Pr7d8QFrUAlCevLk6gRQUwy8WdbtyWPYZl8XYfVuLPr
X-Google-Smtp-Source: ACHHUZ66A+UCP5ILB6WJL7gRZr76fIg5QdK7B+g3Ms7DfUP8/uUNDY//3EMNEWFb62fc2+afiPxc0qNLsKcnm/cWsh8=
X-Received: by 2002:a17:906:77d8:b0:959:37cc:190e with SMTP id
 m24-20020a17090677d800b0095937cc190emr13117908ejn.3.1684866625139; Tue, 23
 May 2023 11:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230523074535.249802-1-hch@lst.de> <20230523074535.249802-4-hch@lst.de>
In-Reply-To: <20230523074535.249802-4-hch@lst.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 23 May 2023 20:30:13 +0200
Message-ID: <CAJZ5v0i2eXi+UEqm0W2eiadjUw5AHT-c1OHTQkemacfL0-jo2A@mail.gmail.com>
Subject: Re: [PATCH 03/24] PM: hibernate: remove the global snapshot_test variable
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Mike Snitzer <snitzer@kernel.org>, 
	Joern Engel <joern@lazybastard.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_113029_392077_D3F8335A 
X-CRM114-Status: GOOD (  20.52  )
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

T24gVHVlLCBNYXkgMjMsIDIwMjMgYXQgOTo0NeKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPgo+IFBhc3NpbmcgY2FsbCBkZXBlbmRlbnQgdmFyaWFibGUgaW4gZ2xv
YmFsIHZhcmlhYmxlcyBpcyBhIGh1Z2UKPiBhbnRpcGF0dGVybi4gIEZpeCBpdCB1cC4KPgo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKQWNrZWQtYnk6IFJh
ZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4KCj4gLS0tCj4gIGtlcm5lbC9wb3dl
ci9oaWJlcm5hdGUuYyB8IDE3ICsrKysrKy0tLS0tLS0tLS0tCj4gIGtlcm5lbC9wb3dlci9wb3dl
ci5oICAgICB8ICAzICstLQo+ICBrZXJuZWwvcG93ZXIvc3dhcC5jICAgICAgfCAgMiArLQo+ICAz
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEva2VybmVsL3Bvd2VyL2hpYmVybmF0ZS5jIGIva2VybmVsL3Bvd2VyL2hpYmVybmF0
ZS5jCj4gaW5kZXggMDcyNzk1MDYzNjYyNTUuLjc4Njk2YWEwNGY1Y2EzIDEwMDY0NAo+IC0tLSBh
L2tlcm5lbC9wb3dlci9oaWJlcm5hdGUuYwo+ICsrKyBiL2tlcm5lbC9wb3dlci9oaWJlcm5hdGUu
Ywo+IEBAIC02NCw3ICs2NCw2IEBAIGVudW0gewo+ICBzdGF0aWMgaW50IGhpYmVybmF0aW9uX21v
ZGUgPSBISUJFUk5BVElPTl9TSFVURE9XTjsKPgo+ICBib29sIGZyZWV6ZXJfdGVzdF9kb25lOwo+
IC1ib29sIHNuYXBzaG90X3Rlc3Q7Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9o
aWJlcm5hdGlvbl9vcHMgKmhpYmVybmF0aW9uX29wczsKPgo+IEBAIC02ODQsNyArNjgzLDcgQEAg
c3RhdGljIHZvaWQgcG93ZXJfZG93bih2b2lkKQo+ICAgICAgICAgICAgICAgICBjcHVfcmVsYXgo
KTsKPiAgfQo+Cj4gLXN0YXRpYyBpbnQgbG9hZF9pbWFnZV9hbmRfcmVzdG9yZSh2b2lkKQo+ICtz
dGF0aWMgaW50IGxvYWRfaW1hZ2VfYW5kX3Jlc3RvcmUoYm9vbCBzbmFwc2hvdF90ZXN0KQo+ICB7
Cj4gICAgICAgICBpbnQgZXJyb3I7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7Cj4gQEAg
LTcyMSw2ICs3MjAsNyBAQCBzdGF0aWMgaW50IGxvYWRfaW1hZ2VfYW5kX3Jlc3RvcmUodm9pZCkK
PiAgICovCj4gIGludCBoaWJlcm5hdGUodm9pZCkKPiAgewo+ICsgICAgICAgYm9vbCBzbmFwc2hv
dF90ZXN0ID0gZmFsc2U7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgc2xlZXBfZmxhZ3M7Cj4gICAg
ICAgICBpbnQgZXJyb3I7Cj4KPiBAQCAtNzQ4LDkgKzc0OCw2IEBAIGludCBoaWJlcm5hdGUodm9p
ZCkKPiAgICAgICAgIGlmIChlcnJvcikKPiAgICAgICAgICAgICAgICAgZ290byBFeGl0Owo+Cj4g
LSAgICAgICAvKiBwcm90ZWN0ZWQgYnkgc3lzdGVtX3RyYW5zaXRpb25fbXV0ZXggKi8KPiAtICAg
ICAgIHNuYXBzaG90X3Rlc3QgPSBmYWxzZTsKPiAtCj4gICAgICAgICBsb2NrX2RldmljZV9ob3Rw
bHVnKCk7Cj4gICAgICAgICAvKiBBbGxvY2F0ZSBtZW1vcnkgbWFuYWdlbWVudCBzdHJ1Y3R1cmVz
ICovCj4gICAgICAgICBlcnJvciA9IGNyZWF0ZV9iYXNpY19tZW1vcnlfYml0bWFwcygpOwo+IEBA
IC03OTIsOSArNzg5LDkgQEAgaW50IGhpYmVybmF0ZSh2b2lkKQo+ICAgICAgICAgdW5sb2NrX2Rl
dmljZV9ob3RwbHVnKCk7Cj4gICAgICAgICBpZiAoc25hcHNob3RfdGVzdCkgewo+ICAgICAgICAg
ICAgICAgICBwbV9wcl9kYmcoIkNoZWNraW5nIGhpYmVybmF0aW9uIGltYWdlXG4iKTsKPiAtICAg
ICAgICAgICAgICAgZXJyb3IgPSBzd3N1c3BfY2hlY2soKTsKPiArICAgICAgICAgICAgICAgZXJy
b3IgPSBzd3N1c3BfY2hlY2soc25hcHNob3RfdGVzdCk7Cj4gICAgICAgICAgICAgICAgIGlmICgh
ZXJyb3IpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgZXJyb3IgPSBsb2FkX2ltYWdlX2FuZF9y
ZXN0b3JlKCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyb3IgPSBsb2FkX2ltYWdlX2Fu
ZF9yZXN0b3JlKHNuYXBzaG90X3Rlc3QpOwo+ICAgICAgICAgfQo+ICAgICAgICAgdGhhd19wcm9j
ZXNzZXMoKTsKPgo+IEBAIC05ODIsOCArOTc5LDYgQEAgc3RhdGljIGludCBzb2Z0d2FyZV9yZXN1
bWUodm9pZCkKPiAgICAgICAgICAqLwo+ICAgICAgICAgbXV0ZXhfbG9ja19uZXN0ZWQoJnN5c3Rl
bV90cmFuc2l0aW9uX211dGV4LCBTSU5HTEVfREVQVEhfTkVTVElORyk7Cj4KPiAtICAgICAgIHNu
YXBzaG90X3Rlc3QgPSBmYWxzZTsKPiAtCj4gICAgICAgICBpZiAoIXN3c3VzcF9yZXN1bWVfZGV2
aWNlKSB7Cj4gICAgICAgICAgICAgICAgIGVycm9yID0gZmluZF9yZXN1bWVfZGV2aWNlKCk7Cj4g
ICAgICAgICAgICAgICAgIGlmIChlcnJvcikKPiBAQCAtOTk0LDcgKzk4OSw3IEBAIHN0YXRpYyBp
bnQgc29mdHdhcmVfcmVzdW1lKHZvaWQpCj4gICAgICAgICAgICAgICAgIE1BSk9SKHN3c3VzcF9y
ZXN1bWVfZGV2aWNlKSwgTUlOT1Ioc3dzdXNwX3Jlc3VtZV9kZXZpY2UpKTsKPgo+ICAgICAgICAg
cG1fcHJfZGJnKCJMb29raW5nIGZvciBoaWJlcm5hdGlvbiBpbWFnZS5cbiIpOwo+IC0gICAgICAg
ZXJyb3IgPSBzd3N1c3BfY2hlY2soKTsKPiArICAgICAgIGVycm9yID0gc3dzdXNwX2NoZWNrKGZh
bHNlKTsKPiAgICAgICAgIGlmIChlcnJvcikKPiAgICAgICAgICAgICAgICAgZ290byBVbmxvY2s7
Cj4KPiBAQCAtMTAyMiw3ICsxMDE3LDcgQEAgc3RhdGljIGludCBzb2Z0d2FyZV9yZXN1bWUodm9p
ZCkKPiAgICAgICAgICAgICAgICAgZ290byBDbG9zZV9GaW5pc2g7Cj4gICAgICAgICB9Cj4KPiAt
ICAgICAgIGVycm9yID0gbG9hZF9pbWFnZV9hbmRfcmVzdG9yZSgpOwo+ICsgICAgICAgZXJyb3Ig
PSBsb2FkX2ltYWdlX2FuZF9yZXN0b3JlKGZhbHNlKTsKPiAgICAgICAgIHRoYXdfcHJvY2Vzc2Vz
KCk7Cj4gICBGaW5pc2g6Cj4gICAgICAgICBwbV9ub3RpZmllcl9jYWxsX2NoYWluKFBNX1BPU1Rf
UkVTVE9SRSk7Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9wb3dlci9wb3dlci5oIGIva2VybmVsL3Bv
d2VyL3Bvd2VyLmgKPiBpbmRleCBiODNjOGQ1ZTE4OGRlYy4uOTc4MTg5ZmNhZmQxMjQgMTAwNjQ0
Cj4gLS0tIGEva2VybmVsL3Bvd2VyL3Bvd2VyLmgKPiArKysgYi9rZXJuZWwvcG93ZXIvcG93ZXIu
aAo+IEBAIC01OSw3ICs1OSw2IEBAIGFzbWxpbmthZ2UgaW50IHN3c3VzcF9zYXZlKHZvaWQpOwo+
Cj4gIC8qIGtlcm5lbC9wb3dlci9oaWJlcm5hdGUuYyAqLwo+ICBleHRlcm4gYm9vbCBmcmVlemVy
X3Rlc3RfZG9uZTsKPiAtZXh0ZXJuIGJvb2wgc25hcHNob3RfdGVzdDsKPgo+ICBleHRlcm4gaW50
IGhpYmVybmF0aW9uX3NuYXBzaG90KGludCBwbGF0Zm9ybV9tb2RlKTsKPiAgZXh0ZXJuIGludCBo
aWJlcm5hdGlvbl9yZXN0b3JlKGludCBwbGF0Zm9ybV9tb2RlKTsKPiBAQCAtMTc0LDcgKzE3Myw3
IEBAIGV4dGVybiBpbnQgc3dzdXNwX3N3YXBfaW5fdXNlKHZvaWQpOwo+ICAjZGVmaW5lIFNGX0hX
X1NJRyAgICAgICAgICAgICAgOAo+Cj4gIC8qIGtlcm5lbC9wb3dlci9oaWJlcm5hdGUuYyAqLwo+
IC1leHRlcm4gaW50IHN3c3VzcF9jaGVjayh2b2lkKTsKPiAraW50IHN3c3VzcF9jaGVjayhib29s
IHNuYXBzaG90X3Rlc3QpOwo+ICBleHRlcm4gdm9pZCBzd3N1c3BfZnJlZSh2b2lkKTsKPiAgZXh0
ZXJuIGludCBzd3N1c3BfcmVhZCh1bnNpZ25lZCBpbnQgKmZsYWdzX3ApOwo+ICBleHRlcm4gaW50
IHN3c3VzcF93cml0ZSh1bnNpZ25lZCBpbnQgZmxhZ3MpOwo+IGRpZmYgLS1naXQgYS9rZXJuZWwv
cG93ZXIvc3dhcC5jIGIva2VybmVsL3Bvd2VyL3N3YXAuYwo+IGluZGV4IDkyZTQxZWQyOTJhZGE4
Li5lZmVkMTE1NjhiZmM3MiAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvcG93ZXIvc3dhcC5jCj4gKysr
IGIva2VybmVsL3Bvd2VyL3N3YXAuYwo+IEBAIC0xNTE0LDcgKzE1MTQsNyBAQCBpbnQgc3dzdXNw
X3JlYWQodW5zaWduZWQgaW50ICpmbGFnc19wKQo+ICAgKiAgICAgIHN3c3VzcF9jaGVjayAtIENo
ZWNrIGZvciBzd3N1c3Agc2lnbmF0dXJlIGluIHRoZSByZXN1bWUgZGV2aWNlCj4gICAqLwo+Cj4g
LWludCBzd3N1c3BfY2hlY2sodm9pZCkKPiAraW50IHN3c3VzcF9jaGVjayhib29sIHNuYXBzaG90
X3Rlc3QpCj4gIHsKPiAgICAgICAgIGludCBlcnJvcjsKPiAgICAgICAgIHZvaWQgKmhvbGRlcjsK
PiAtLQo+IDIuMzkuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
