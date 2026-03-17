Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FEFFB5EBA
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 04:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEQIMd0bzh25SXEGt+I9X9mZQLcKvZLT9/6hX+lMdW8=; b=RI2nCEjPOBWD+g
	Nkc8Z90DDKcmQ2ZrY4yUl02hiF6NWeeQbA+idcME/ldy2DkwAZL1QsZKikvkGiRrV0X6CGn4Eag1G
	c5x566QaEkICNxTaFbsMSrozXEqZtAmOjEryqClI2VoVsGLn1HDdTdjpW2QsKbmBB//ULKLoYWZfu
	eTt4p2FHrUt2r7KluYPBw3PIy+zwUgNiMwO8ExuTw0p2gzGHbr2Vrc4zxmLPp9/Jd9lzWTcRKiP83
	pmVih11wNV4XqCbElg6K87nHaTLGzlesO5hUHtqZ/p9CRiiuuJ6ecyr/9W+4JXL96dVZSYu4LEAde
	JI3202Km5KYQ3TqzQUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2M4y-00000005OYo-2c04;
	Tue, 17 Mar 2026 04:30:52 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2M4v-00000005OXc-2U0z
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 04:30:51 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-50906a98ffeso374351cf.0
        for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2026 21:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773721848; cv=none;
        d=google.com; s=arc-20240605;
        b=XoDcYpPWGKOsWZv9z2rfqWUaQbDjiQP6FUYzU6G/uio3W1Lo46PwNyilJt3w3G36/B
         K+retAImSP69FCphKVjHAi9NBK3cOp7llipoA75vjK2RKWh2k2AJOu8EK7XzWAY+j4gC
         23Gt0zaf7TMnNPChHqfxrhH9uAeS/GTv0pMX8pDGNLyJSU6Ga3oZn5pIPAErtQ7Oxt0I
         CSbXJx0cXNG3tIpz9aOj5k4AivL33PKgEJwr0muaBHsPD7IGduUWuOUeniMSGJX/VOaK
         2z7jhnAr2rVLFJdRYMIGqS+1bzQWWqHAuktWsin+J1XJLW3D5QQr72KSZ5JXOpEDdyXz
         Tz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        fh=Vn21dUVCZWM1ZjI5OGxRxdzaoxU3uxJhQxsxmVsFGlA=;
        b=U/91mlaucJFqkogkU/WWnOL/iXkypUPhsHwRfh2t3x/ga3/9CyM0epyiMiexbHNOH6
         EfWYOQjbmqXrNJZATrxk51JyuA79ykT7n5GHuD6C0CY9aRN9H9FzRAnWlY0gqQicSVlh
         QLtGrZMsH7j6gPeA7iuG2nASXOzAu8FjnPQlu0hCquhBhryjgaQ+dR1CuHZCynEKzFay
         nRZ9Z1iA2RERXrN/R07xrbtVjexSZhlTG2RYtzUNF+jIzhyNL0zUbUm/6McTNNeT9RQ4
         2sDew6ITH3TThVpwICfC+i+gadiA4CkHYV53mmMy6fPzYa98OgvP7ViZmqbu2odWWjAm
         yLKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773721848; x=1774326648; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        b=aJjzFqjszdWvuQqoiH/QKc4bxJOfrMh9llQv7+fFN9fcdQyKCm7SN5eYhKybSvW6fa
         fDt2j4A1k5sQblrFbPirwGrof6RcGsD/qH5irZfyXe2hno/k8l8Qe1HvsXQ7bTkO+MgN
         9Jes2mMqpnB5alymUOh/JrqJn9IwjMcJwHT2fcHc7cTNOF7w7xgtpL0rqLL4NnShsKyY
         itjTTsP99TBHiiwkWJPLjGsZSq5oVVmqTij+RrNP8UIEnNzDGMHGAdBhNV3Z9ioQ8GAq
         Dys85XLSBLs+wTAp6CYg7bIg1W1/w+/Gm/VFh4Pa7Z2ps424gfBDRWDRBuojvrWhgcdg
         Q2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773721848; x=1774326648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        b=qvZJaH2MPdCUUzcMJHvGqhcZp89nY6IMhlcDd0hhNPApuzdSodHovjxSkRJ+syuye5
         UvRA/3MDqyhvJrqNpOYAVy7EYQ3QEghJjTDF0wHNIWJf9ratHSHb3tky1VXX9bwRcWhp
         p66Wwecxw6OKp7RGoEJMQVftJ9MrMhoNouCsYdWGE1pn9rrPSCP7MLFmsgJ55v4J56vM
         qZ9oYuWi8y4aaaRTZFugakZVckXIUe9uPnpjSZwxUkpiSEuz5DNKgFGmge5cVD9PZqNS
         ILP9GK0D/EvrgMFE3TSgtL4EcwdQS0uMj4K1/bIyRqnoTslYeGJUoKkbHR06RRfhldtC
         LPxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaLnIDZ6ybtX7MhgeHq7O/P4qH5A2/75VzWx1rY7YXtYCdXeM4v6Vk8E5Nvbou/sjoxUyRW8NWoQM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Hz1kGd421bu9supRDVjtr7xPi4sB0fBcZxYtCwJhfSyNxLUo
	FXPmv2Z63wMJhUga1LI/QUezZKo+XXP0cLLAegTBQurboQqCYzm0qqtHlnnzgT7yE73wrMmASJo
	b2XgUufH6c21sgf9AOkxVi6SOk74OD+V1dNYtWxrJ
X-Gm-Gg: ATEYQzyQzDaGqafqjArR+SCX0k2vg2N5wMqQSxjMYIJf2auyUM/aw/8tOSLjCRXPbtn
	LCrswAgoO0gc3rBa/UcgzfKA/QOOO75K9bGLhP9Z0Ab1nC5dFlhjavCmPs+ODVHNNIzCIFmLri2
	ndhQZZmqoCw5J/ZFsCS/wXzxKex/vpJ8zh6jbhj1j9O8NM7b0HD7tX+DsuPDV4AM5ZiTPP1AYNG
	YFfcnyOUizu9pbWxD4cqwDPXdG7iZJufzTfSzSr+mfcYI7ICxyLJUtsX+RV2kmgJfv0XQXX365E
	8Rq+7A==
X-Received: by 2002:a05:622a:1b92:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50998c190femr8741161cf.2.1773721847648; Mon, 16 Mar 2026
 21:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
In-Reply-To: <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:30:36 -0700
X-Gm-Features: AaiRm50ZCLTl3QDNivnPnY48qRQMsgXcmE9SOEgt_D7vDyjlZ8af9f8bQZf6tcw
Message-ID: <CAJuCfpFdKjix2fEdZ7iSrd_nk4-5e7EUNAoCEgUc5snKzq-3Cg@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] misc: open-dice: replace deprecated mmap hook
 with mmap_prepare
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_213049_637574_922AFEE1 
X-CRM114-Status: GOOD (  22.76  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxM+KAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIGZfb3AtPm1tYXAgaW50ZXJmYWNlIGlz
IGRlcHJlY2F0ZWQsIHNvIHVwZGF0ZSBkcml2ZXIgdG8gdXNlIGl0cwo+IHN1Y2Nlc3NvciwgbW1h
cF9wcmVwYXJlLgo+Cj4gVGhlIGRyaXZlciBwcmV2aW91c2x5IHVzZWQgdm1faW9tYXBfbWVtb3J5
KCksIHNvIHRoaXMgY2hhbmdlIHJlcGxhY2VzIGl0Cj4gd2l0aCBpdHMgbW1hcF9wcmVwYXJlIGVx
dWl2YWxlbnQsIG1tYXBfYWN0aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6
IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJz
L21pc2Mvb3Blbi1kaWNlLmMgfCAxOSArKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWlzYy9vcGVuLWRpY2UuYyBiL2RyaXZlcnMvbWlzYy9vcGVuLWRpY2UuYwo+IGluZGV4
IDI0YzI5ZTBmMDBlZi4uNDUwNjBmYjRlYTI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWlzYy9v
cGVuLWRpY2UuYwo+ICsrKyBiL2RyaXZlcnMvbWlzYy9vcGVuLWRpY2UuYwo+IEBAIC04NiwyOSAr
ODYsMzIgQEAgc3RhdGljIHNzaXplX3Qgb3Blbl9kaWNlX3dyaXRlKHN0cnVjdCBmaWxlICpmaWxw
LCBjb25zdCBjaGFyIF9fdXNlciAqcHRyLAo+ICAvKgo+ICAgKiBDcmVhdGVzIGEgbWFwcGluZyBv
ZiB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbiBpbiB1c2VyIGFkZHJlc3Mgc3BhY2UuCj4gICAq
Lwo+IC1zdGF0aWMgaW50IG9wZW5fZGljZV9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiArc3RhdGljIGludCBvcGVuX2RpY2VfbW1hcF9wcmVwYXJl
KHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiArICAgICAgIHN0cnVjdCBmaWxlICpm
aWxwID0gZGVzYy0+ZmlsZTsKPiAgICAgICAgIHN0cnVjdCBvcGVuX2RpY2VfZHJ2ZGF0YSAqZHJ2
ZGF0YSA9IHRvX29wZW5fZGljZV9kcnZkYXRhKGZpbHApOwo+Cj4gLSAgICAgICBpZiAodm1hLT52
bV9mbGFncyAmIFZNX01BWVNIQVJFKSB7Cj4gKyAgICAgICBpZiAodm1hX2Rlc2NfdGVzdChkZXNj
LCBWTUFfTUFZU0hBUkVfQklUKSkgewo+ICAgICAgICAgICAgICAgICAvKiBEbyBub3QgYWxsb3cg
dXNlcnNwYWNlIHRvIG1vZGlmeSB0aGUgdW5kZXJseWluZyBkYXRhLiAqLwo+IC0gICAgICAgICAg
ICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZNX1dSSVRFKQo+ICsgICAgICAgICAgICAgICBpZiAo
dm1hX2Rlc2NfdGVzdChkZXNjLCBWTUFfV1JJVEVfQklUKSkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVQRVJNOwo+ICAgICAgICAgICAgICAgICAvKiBFbnN1cmUgdXNlcnNwYWNl
IGNhbm5vdCBhY3F1aXJlIFZNX1dSSVRFIGxhdGVyLiAqLwo+IC0gICAgICAgICAgICAgICB2bV9m
bGFnc19jbGVhcih2bWEsIFZNX01BWVdSSVRFKTsKPiArICAgICAgICAgICAgICAgdm1hX2Rlc2Nf
Y2xlYXJfZmxhZ3MoZGVzYywgVk1BX01BWVdSSVRFX0JJVCk7Cj4gICAgICAgICB9Cj4KPiAgICAg
ICAgIC8qIENyZWF0ZSB3cml0ZS1jb21iaW5lIG1hcHBpbmcgc28gYWxsIGNsaWVudHMgb2JzZXJ2
ZSBhIHdpcGUuICovCj4gLSAgICAgICB2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF93cml0ZWNv
bWJpbmUodm1hLT52bV9wYWdlX3Byb3QpOwo+IC0gICAgICAgdm1fZmxhZ3Nfc2V0KHZtYSwgVk1f
RE9OVENPUFkgfCBWTV9ET05URFVNUCk7Cj4gLSAgICAgICByZXR1cm4gdm1faW9tYXBfbWVtb3J5
KHZtYSwgZHJ2ZGF0YS0+cm1lbS0+YmFzZSwgZHJ2ZGF0YS0+cm1lbS0+c2l6ZSk7Cj4gKyAgICAg
ICBkZXNjLT5wYWdlX3Byb3QgPSBwZ3Byb3Rfd3JpdGVjb21iaW5lKGRlc2MtPnBhZ2VfcHJvdCk7
Cj4gKyAgICAgICB2bWFfZGVzY19zZXRfZmxhZ3MoZGVzYywgVk1BX0RPTlRDT1BZX0JJVCwgVk1B
X0RPTlREVU1QX0JJVCk7Cj4gKyAgICAgICBtbWFwX2FjdGlvbl9zaW1wbGVfaW9yZW1hcChkZXNj
LCBkcnZkYXRhLT5ybWVtLT5iYXNlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZHJ2ZGF0YS0+cm1lbS0+c2l6ZSk7Cj4gKyAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIG9wZW5fZGljZV9mb3BzID0gewo+ICAg
ICAgICAgLm93bmVyID0gVEhJU19NT0RVTEUsCj4gICAgICAgICAucmVhZCA9IG9wZW5fZGljZV9y
ZWFkLAo+ICAgICAgICAgLndyaXRlID0gb3Blbl9kaWNlX3dyaXRlLAo+IC0gICAgICAgLm1tYXAg
PSBvcGVuX2RpY2VfbW1hcCwKPiArICAgICAgIC5tbWFwX3ByZXBhcmUgPSBvcGVuX2RpY2VfbW1h
cF9wcmVwYXJlLAo+ICB9Owo+Cj4gIHN0YXRpYyBpbnQgX19pbml0IG9wZW5fZGljZV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+IC0tCj4gMi41My4wCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
