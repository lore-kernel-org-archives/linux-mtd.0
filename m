Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A17C77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 18:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+24YcCXiREwT5R0IC8Hjj4sLrc3ufbusiQsN6tYggQY=; b=kEaKr7dAFsst3c
	XM1P5oLiZ6Btn/cwD910pKLzfhDR5V/q8cU2DOCxYk8bZxE5l75vd+gp2pIvjYiAG35dLvrPJkg9d
	5ERQXwtYE7Pvc5TgYMxWiPi+lFX3qDd3Mk9JXvwImHFUWb37OWzX/WZy4HZcWvQLy7auNwZ0fYmSl
	Y3JtPknlpK3sws8/MxuI5sGv/8d7DIyfjbp6Vy3eiy7qSOkYrcVMdfs4vBT8GRMMgizdPCXfTBCmG
	COhdbdjAxueqkFBPeZAPdUp6YHiNyIHYX4cJSzaC//9ckdH9DReNKmoP7kfj1THfLJlKUQ+iJUFjo
	984bcazfRM0V6KA3eKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1WhP-00B6Nb-0g;
	Tue, 23 May 2023 18:25:31 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1WhN-00B6Mh-0i
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 18:25:30 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-96ffba243b1so62148266b.0
        for <linux-mtd@lists.infradead.org>; Tue, 23 May 2023 11:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684866318; x=1687458318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNBtaQFevQ/ylnGP2LIVhsaLMMYO1oXGQ/WUEPR0bCM=;
        b=aLfamjy4p5BmfltejqEC+Q3eH4Y151Eum9X4bCwPGYw8bSYvUE0eHWuk+YuM7d7Ik6
         FaqwwnOnWcJiO4ph+9w8CLaaaVYzeXprhiUDyOVSIwaba+ou9b3rPY01ncaFEJb7bY0Z
         9aA5qms0NTwJmm10YIY9k0Ths6N914rud0HG+CJPHs9ZCriYHAdmdeG32DQx52KyJ8yy
         RkSoDvIh9ThRp+02M1gIlZsXkIuBvUuw8KQoV18f/wCvOQro/3rO+MhwIFrRJSTevbfg
         LX5IEmHFCZ1vLw+/X4Mu54AwByGWGMkz8W5sAmbpzcS5coEts0/8xbf1tz+fyukj6r/b
         eaIw==
X-Gm-Message-State: AC+VfDw559CIS0Dnmdthp4Rgn3kboJKOYRhHalJSTlZybzcCruT8t1IG
	yHI1aAB/vQrg18hCDhcuuaj5FZpUhxe3nbh/Rx8=
X-Google-Smtp-Source: ACHHUZ6gJY/Um7fOx7eNZKmYsbI52dpazWi4mSyNnBLr8xAnhL3tvrxqwLCwiKib75/UOF7I96GahuJGbNIY2CxoOCM=
X-Received: by 2002:a17:906:778b:b0:96f:56ab:c6a5 with SMTP id
 s11-20020a170906778b00b0096f56abc6a5mr11986106ejm.3.1684866318116; Tue, 23
 May 2023 11:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230523074535.249802-1-hch@lst.de> <20230523074535.249802-3-hch@lst.de>
In-Reply-To: <20230523074535.249802-3-hch@lst.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 23 May 2023 20:25:06 +0200
Message-ID: <CAJZ5v0j2N7Cdih0B66-w3ig=2E=MHNt=71mdT5O3OUmq_jsULQ@mail.gmail.com>
Subject: Re: [PATCH 02/24] PM: hibernate: factor out a helper to find the
 resume device
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Mike Snitzer <snitzer@kernel.org>, 
	Joern Engel <joern@lazybastard.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_112529_277972_E910CA27 
X-CRM114-Status: GOOD (  24.27  )
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
bHN0LmRlPiB3cm90ZToKPgo+IFNwbGl0IHRoZSBsb2dpYyB0byBmaW5kIHRoZSByZXN1bWUgZGV2
aWNlIG91dCBzb2Z0d2FyZV9yZXN1bWUgYW5kIGludG8KPiBhIHNlcGFyYXRlIGhlbHBlciB0byBz
dGFydCB1bndpbmRpZyB0aGUgY29udm9sdXRlZCBnb3RvIGxvZ2ljLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpBY2tlZC1ieTogUmFmYWVsIEouIFd5
c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPgoKPiAtLS0KPiAga2VybmVsL3Bvd2VyL2hpYmVybmF0
ZS5jIHwgNzIgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEva2VybmVsL3Bvd2VyL2hpYmVybmF0ZS5jIGIva2VybmVsL3Bvd2VyL2hpYmVybmF0ZS5j
Cj4gaW5kZXggMzBkMTI3NGYwM2Y2MjUuLjA3Mjc5NTA2MzY2MjU1IDEwMDY0NAo+IC0tLSBhL2tl
cm5lbC9wb3dlci9oaWJlcm5hdGUuYwo+ICsrKyBiL2tlcm5lbC9wb3dlci9oaWJlcm5hdGUuYwo+
IEBAIC05MTAsNiArOTEwLDQxIEBAIGludCBoaWJlcm5hdGVfcXVpZXRfZXhlYyhpbnQgKCpmdW5j
KSh2b2lkICpkYXRhKSwgdm9pZCAqZGF0YSkKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChoaWJl
cm5hdGVfcXVpZXRfZXhlYyk7Cj4KPiArc3RhdGljIGludCBmaW5kX3Jlc3VtZV9kZXZpY2Uodm9p
ZCkKPiArewo+ICsgICAgICAgaWYgKCFzdHJsZW4ocmVzdW1lX2ZpbGUpKQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gLUVOT0VOVDsKPiArCj4gKyAgICAgICBwbV9wcl9kYmcoIkNoZWNraW5nIGhp
YmVybmF0aW9uIGltYWdlIHBhcnRpdGlvbiAlc1xuIiwgcmVzdW1lX2ZpbGUpOwo+ICsKPiArICAg
ICAgIGlmIChyZXN1bWVfZGVsYXkpIHsKPiArICAgICAgICAgICAgICAgcHJfaW5mbygiV2FpdGlu
ZyAlZHNlYyBiZWZvcmUgcmVhZGluZyByZXN1bWUgZGV2aWNlIC4uLlxuIiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXN1bWVfZGVsYXkpOwo+ICsgICAgICAgICAgICAgICBzc2xlZXAocmVz
dW1lX2RlbGF5KTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICAvKiBDaGVjayBpZiB0aGUgZGV2
aWNlIGlzIHRoZXJlICovCj4gKyAgICAgICBzd3N1c3BfcmVzdW1lX2RldmljZSA9IG5hbWVfdG9f
ZGV2X3QocmVzdW1lX2ZpbGUpOwo+ICsgICAgICAgaWYgKHN3c3VzcF9yZXN1bWVfZGV2aWNlKQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICog
U29tZSBkZXZpY2UgZGlzY292ZXJ5IG1pZ2h0IHN0aWxsIGJlIGluIHByb2dyZXNzOyB3ZSBuZWVk
IHRvIHdhaXQgZm9yCj4gKyAgICAgICAgKiB0aGlzIHRvIGZpbmlzaC4KPiArICAgICAgICAqLwo+
ICsgICAgICAgd2FpdF9mb3JfZGV2aWNlX3Byb2JlKCk7Cj4gKyAgICAgICBpZiAocmVzdW1lX3dh
aXQpIHsKPiArICAgICAgICAgICAgICAgd2hpbGUgKCEoc3dzdXNwX3Jlc3VtZV9kZXZpY2UgPSBu
YW1lX3RvX2Rldl90KHJlc3VtZV9maWxlKSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXNs
ZWVwKDEwKTsKPiArICAgICAgICAgICAgICAgYXN5bmNfc3luY2hyb25pemVfZnVsbCgpOwo+ICsg
ICAgICAgfQo+ICsKPiArICAgICAgIHN3c3VzcF9yZXN1bWVfZGV2aWNlID0gbmFtZV90b19kZXZf
dChyZXN1bWVfZmlsZSk7Cj4gKyAgICAgICBpZiAoIXN3c3VzcF9yZXN1bWVfZGV2aWNlKQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4g
Kwo+ICAvKioKPiAgICogc29mdHdhcmVfcmVzdW1lIC0gUmVzdW1lIGZyb20gYSBzYXZlZCBoaWJl
cm5hdGlvbiBpbWFnZS4KPiAgICoKPiBAQCAtOTQ5LDQ1ICs5ODQsMTIgQEAgc3RhdGljIGludCBz
b2Z0d2FyZV9yZXN1bWUodm9pZCkKPgo+ICAgICAgICAgc25hcHNob3RfdGVzdCA9IGZhbHNlOwo+
Cj4gLSAgICAgICBpZiAoc3dzdXNwX3Jlc3VtZV9kZXZpY2UpCj4gLSAgICAgICAgICAgICAgIGdv
dG8gQ2hlY2tfaW1hZ2U7Cj4gLQo+IC0gICAgICAgaWYgKCFzdHJsZW4ocmVzdW1lX2ZpbGUpKSB7
Cj4gLSAgICAgICAgICAgICAgIGVycm9yID0gLUVOT0VOVDsKPiAtICAgICAgICAgICAgICAgZ290
byBVbmxvY2s7Cj4gLSAgICAgICB9Cj4gLQo+IC0gICAgICAgcG1fcHJfZGJnKCJDaGVja2luZyBo
aWJlcm5hdGlvbiBpbWFnZSBwYXJ0aXRpb24gJXNcbiIsIHJlc3VtZV9maWxlKTsKPiAtCj4gLSAg
ICAgICBpZiAocmVzdW1lX2RlbGF5KSB7Cj4gLSAgICAgICAgICAgICAgIHByX2luZm8oIldhaXRp
bmcgJWRzZWMgYmVmb3JlIHJlYWRpbmcgcmVzdW1lIGRldmljZSAuLi5cbiIsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgcmVzdW1lX2RlbGF5KTsKPiAtICAgICAgICAgICAgICAgc3NsZWVwKHJl
c3VtZV9kZWxheSk7Cj4gLSAgICAgICB9Cj4gLQo+IC0gICAgICAgLyogQ2hlY2sgaWYgdGhlIGRl
dmljZSBpcyB0aGVyZSAqLwo+IC0gICAgICAgc3dzdXNwX3Jlc3VtZV9kZXZpY2UgPSBuYW1lX3Rv
X2Rldl90KHJlc3VtZV9maWxlKTsKPiAgICAgICAgIGlmICghc3dzdXNwX3Jlc3VtZV9kZXZpY2Up
IHsKPiAtICAgICAgICAgICAgICAgLyoKPiAtICAgICAgICAgICAgICAgICogU29tZSBkZXZpY2Ug
ZGlzY292ZXJ5IG1pZ2h0IHN0aWxsIGJlIGluIHByb2dyZXNzOyB3ZSBuZWVkCj4gLSAgICAgICAg
ICAgICAgICAqIHRvIHdhaXQgZm9yIHRoaXMgdG8gZmluaXNoLgo+IC0gICAgICAgICAgICAgICAg
Ki8KPiAtICAgICAgICAgICAgICAgd2FpdF9mb3JfZGV2aWNlX3Byb2JlKCk7Cj4gLQo+IC0gICAg
ICAgICAgICAgICBpZiAocmVzdW1lX3dhaXQpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICB3
aGlsZSAoKHN3c3VzcF9yZXN1bWVfZGV2aWNlID0gbmFtZV90b19kZXZfdChyZXN1bWVfZmlsZSkp
ID09IDApCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtc2xlZXAoMTApOwo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGFzeW5jX3N5bmNocm9uaXplX2Z1bGwoKTsKPiAtICAgICAg
ICAgICAgICAgfQo+IC0KPiAtICAgICAgICAgICAgICAgc3dzdXNwX3Jlc3VtZV9kZXZpY2UgPSBu
YW1lX3RvX2Rldl90KHJlc3VtZV9maWxlKTsKPiAtICAgICAgICAgICAgICAgaWYgKCFzd3N1c3Bf
cmVzdW1lX2RldmljZSkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIGVycm9yID0gLUVOT0RF
VjsKPiArICAgICAgICAgICAgICAgZXJyb3IgPSBmaW5kX3Jlc3VtZV9kZXZpY2UoKTsKPiArICAg
ICAgICAgICAgICAgaWYgKGVycm9yKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gVW5s
b2NrOwo+IC0gICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4KPiAtIENoZWNrX2ltYWdlOgo+
ICAgICAgICAgcG1fcHJfZGJnKCJIaWJlcm5hdGlvbiBpbWFnZSBwYXJ0aXRpb24gJWQ6JWQgcHJl
c2VudFxuIiwKPiAgICAgICAgICAgICAgICAgTUFKT1Ioc3dzdXNwX3Jlc3VtZV9kZXZpY2UpLCBN
SU5PUihzd3N1c3BfcmVzdW1lX2RldmljZSkpOwo+Cj4gLS0KPiAyLjM5LjIKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
