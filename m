Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA7FC48BC3
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 22:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TJK11KPFwY/sC2+8/ZBoXr8hnrwh2ZFdbYxGBJmZy0=; b=AvNHXyZnNlnKGz
	ZLmYM1TMknyqP3mS1TZF4cEL/qpjkAJMXaGfpdlRIT1PO0tYQzJ3r9/p2M2BPMqMLTEhWhctHzWHb
	UeZTFGxrNORwmkr6cx09NXdCMdEAHqZHHMS8Hybc3JRIKaAdEd1QeJuq4CjCPZ75RCvmc8TJnGirr
	TW53s0DFocR5fPcjlcDE43WaU65C5G38FhS94tVcFsuVjhe80j0n30iViNLW/7bQLROsiAHr/XFgD
	6MkI68JpUbifr/q9jgGaXXXuk0beX+17icZAWIkyXVxVRHMXDkDiQLRN1QUS44FNTdc+iuqYWmRPP
	iS0MRxnoyh3DT549Envg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcYO1-0000000GKex-1Y5u;
	Tue, 20 Feb 2024 22:14:49 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcYNz-0000000GKeE-13Rq
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 22:14:48 +0000
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so5324610276.0
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 14:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708467285; x=1709072085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0sB+Uiin6bmBbq+Qb6Q+WVmjY3s6JQXioTdgYqZKu0=;
        b=uqbEtUXCe0R0C2f6XduDVfQGxjkFCyhNqC24kanNMc9t+q8wDfZ0RGqlaBQPZ0U3rx
         oLJNAt7GBtA1+bvRcmE/i9NoKyNmZiqstU8BLZmxYkdeiPT1uzj3LG+F5EgVfJ3na/+V
         Qx0PDdpr3xZ8UZzZG98LroGXhYnf4UT6xetlDuJryrJxwvP0/uYu3diT39wOfxcCxXP/
         LFWHcGl8lCoOKUGLAFctspZu8oEVr5CoJ9XhtUvFMKWGLlsE5EYZoPygMczLew+Uqmpd
         18My3Cotz5VHF06E25PbJWOnCfzkpEuMYiOBLcpwDDo5MUWedfjdYwhtNPSxx2/7p7ch
         9I7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxw4I8Iww/XLBw5F334kUeoEgQjHR/MxD46mRW4PLYqSo7uZPRKBvZCJRJMAyeAi1OtPQHsa7H7GsSnx9bVuekq1A4OsywAU84Y5iA1g==
X-Gm-Message-State: AOJu0YzSJ+DE6CYxoPzcTQm+DIq2/wnlwRutOXVj6m5Y+Ercf1eJzKV6
	JM74QATcV2tixNypJwg57yEZybgU9Uc2GqhqVlp4oLLx+aRAE+0VqrPd5ivDElg=
X-Google-Smtp-Source: AGHT+IHZMOmE3qH02p7hVGY+r6VHEqlYNWgHHKsNokZCnDvc+PKldM+ZpoM8Gq+aWJc67kQ9ehRLig==
X-Received: by 2002:a25:ac43:0:b0:dcd:aa92:ecae with SMTP id r3-20020a25ac43000000b00dcdaa92ecaemr12403173ybd.63.1708467284984;
        Tue, 20 Feb 2024 14:14:44 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id x5-20020a259a05000000b00db41482d349sm2055531ybn.57.2024.02.20.14.14.44
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 14:14:44 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607dec82853so55496467b3.3
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 14:14:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIUh2ztx7qC4br/alK/teS1sWJpp2W5/b+8YFkTQ2+YiX6yyvvmGbHmWs/JYwKxwhU3+PuVSiKr6WmJyxZ3FfBKDdKOst0uHgRchh3Dg==
X-Received: by 2002:a0d:cb8c:0:b0:608:7bb8:9fb6 with SMTP id
 n134-20020a0dcb8c000000b006087bb89fb6mr417604ywd.32.1708467284625; Tue, 20
 Feb 2024 14:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
 <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
In-Reply-To: <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2024 23:14:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwP747E4YaON9-YmGB6w=Aa6VgACRWX_QmYfTSB5RUKA@mail.gmail.com>
Message-ID: <CAMuHMdXwP747E4YaON9-YmGB6w=Aa6VgACRWX_QmYfTSB5RUKA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240220_141447_317180_E4155AA3 
X-CRM114-Status: GOOD (  24.36  )
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

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMTE6MDHigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4KPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiBPbiBUaHUsIEZlYiAxNSwgMjAyNCBhdCA5OjE2
4oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4gUGFzcyB0aGUg
cXVldWUgbGltaXQgc2V0IGF0IGluaXRpYWxpemF0aW9uIHRpbWUgZGlyZWN0bHkgdG8KPiA+IGJs
a19tcV9hbGxvY19kaXNrIGluc3RlYWQgb2YgdXBkYXRpbmcgaXQgcmlnaHQgYWZ0ZXIgdGhlIGFs
bG9jYXRpb24uCj4gPgo+ID4gVGhpcyByZXF1aXJlcyByZWZhY3RvcmluZyB0aGUgY29kZSBhIGJp
dCBzbyB0aGF0IHdoYXQgd2FzIG1tY19zZXR1cF9xdWV1ZQo+ID4gYmVmb3JlIGFsc28gYWxsb2Nh
dGVzIHRoZSBnZW5kaXNrIG5vdyBhbmQgYWN0dWFsbHkgc2V0cyBhbGwgbGltaXRzLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+Cj4gVGhhbmtz
IGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IDYxNmY4NzY2MTc5Mjc3MzIgKCJt
bWM6IHBhc3MKPiBxdWV1ZV9saW1pdHMgdG8gYmxrX21xX2FsbG9jX2Rpc2siKSBpbiBibG9jay9m
b3ItbmV4dC4KPgo+IEkgaGF2ZSBiaXNlY3RlZCB0aGUgZm9sbG93aW5nIGZhaWx1cmUgb24gV2hp
dGUtSGF3ayAoYWxzbyBzZWVuIG9uCj4gb3RoZXIgUi1DYXIgR2VuMy80IHN5c3RlbXMpIHRvIHRo
aXMgY29tbWl0Ogo+Cj4gICAgIHJlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFjIGVlMTQwMDAwLm1t
YzogbW1jMCBiYXNlIGF0Cj4gMHgwMDAwMDAwMGVlMTQwMDAwLCBtYXggY2xvY2sgcmF0ZSAyMDAg
TUh6Cj4gICAgIG1tYzA6IG5ldyBIUzQwMCBNTUMgY2FyZCBhdCBhZGRyZXNzIDAwMDEKPiAgICAg
LS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gICAgIFdBUk5JTkc6IENQVTog
MSBQSUQ6IDIwIGF0IGJsb2NrL2Jsay1zZXR0aW5ncy5jOjIwMgo+IGJsa192YWxpZGF0ZV9saW1p
dHMrMHgxMmMvMHgxZTAKCkFjdHVhbCBjYXBhY2l0eSBzaG91bGQgYmU6CgptbWMwOiBuZXcgSFM0
MDAgTU1DIGNhcmQgYXQgYWRkcmVzcyAwMDAxCm1tY2JsazA6IG1tYzA6MDAwMSBHMU0xNUwgMjku
NiBHaUIKbW1jYmxrMGJvb3QwOiBtbWMwOjAwMDEgRzFNMTVMIDMxLjUgTWlCCm1tY2JsazBib290
MTogbW1jMDowMDAxIEcxTTE1TCAzMS41IE1pQgptbWNibGswcnBtYjogbW1jMDowMDAxIEcxTTE1
TCA0LjAwIE1pQiwgY2hhcmRldiAoMjQ1OjApCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
