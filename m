Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4681AC47074
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 22:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzajoHjDPhPw7DJW79uAjj52OZwToEl7BHWm6IdNAUE=; b=Zn6cVJXPOO00Ia
	No0o+6sAoQNzyde69CbQSrJuXTRHM4OCXJaf6CQdXeuj0OVySu0jYEZj4J1RYiEomhjTjrZDukf9z
	o6/cBpholJog/wVfpGy0+6FUsI0fzPt/Kd3mbnNc+9l8eRyuIp+iVrNLh0hrcRjsnHbijqR7BG8Uc
	xjaouGI/M6/qH1NM8W8RWZWumwLamtqMRjgcZS+eBd/2r4chvtLuaryENyjPKovQuaFT9mVQ8DEJO
	DUyqdQbHhf7e7kb1fJe+E8fxk1J8xnLCdPxv5Q8gBkBsHxcBM1exkwYoE9lxhxUySu0EPc96gRzUn
	lltbr9RzO+AWKKKTAtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKn15-009BVm-0W;
	Tue, 02 Jan 2024 22:13:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKn12-009BUl-10
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 22:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704233619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBOv2jm2vjkJK88t9NbUPVCUIzSLH16o/dGCZ37tOWs=;
	b=BkAT+W1mPZO9S52NyfkMri6lMaWXmov2EnwHKdP7an4kCAbSyJIxK6CbzXRMmdt1BkfTMX
	WeFa1nqpABFwXx/Ab7OCjwPiEWKocBfO2+h0j2jsjlkfOwBXk64lu3ULGXND9NbVsISZxn
	2PqSbKKvQKWJHg91soAaplMbixaYAyA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-ivuA21MiMpuwq-P-4XCZ5w-1; Tue, 02 Jan 2024 17:11:56 -0500
X-MC-Unique: ivuA21MiMpuwq-P-4XCZ5w-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-5eb6dba1796so135280567b3.1
        for <linux-mtd@lists.infradead.org>; Tue, 02 Jan 2024 14:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704233516; x=1704838316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBOv2jm2vjkJK88t9NbUPVCUIzSLH16o/dGCZ37tOWs=;
        b=JpHoO5Q/ck3hkRhTu6oGHk+T9MHmRkOlAd5vU5lc8yDPw9+Z2t0zNnzbKAVGORDMv+
         cWLVWIfS7GMdWh50yMjsaFB5SsgVy/e9l8f4ZK/oPp11Wh/FVdjK6Apt2f7CeRDVVmG1
         6Pl2RPkMGHtH3soe4fpHpUfBIdpcHASGvTOKCW0jtWaFPcX68723a8LHhUJPCxF+0+bL
         GZkn3sDQ6ynff7iPFu6z9a87yLItckTZl7TMIWXiwdaGQf5CE3UfaznJIyIhfL/H7l0H
         Lz8gonwB5HoW5PnXyu3NjlUYQ2a4HMfA50zqT9k1Oum+ixEE3FOMfjiHnpP2pgsnMgWQ
         NB+w==
X-Gm-Message-State: AOJu0YyQCudkv5vesLNeeP62Aea6qitUHCP6wGj/zCW8+wxRP9KpBNYl
	aowpvEQaMHkNfa+9cr12MVN/7BG9MvLd0X5vZGvTrTD6HDVjxvW+0ZH2zFrkWbeoRtmrhMak568
	xlqugThxK1cn/Vimslxx++tVNKYbY9gHnE4tZ5vnbQrfw5WJ1VQ==
X-Received: by 2002:a0d:e615:0:b0:5e7:5246:8f7b with SMTP id p21-20020a0de615000000b005e752468f7bmr10650774ywe.79.1704233516168;
        Tue, 02 Jan 2024 14:11:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnz4shpbyeonHylop6FDEDEEVcbaCqR7iBp2aclsXjzz7g8rllaGLNWxCJxvlxS1qvAvVXIZDM72VDn9UiZCA=
X-Received: by 2002:a0d:e615:0:b0:5e7:5246:8f7b with SMTP id
 p21-20020a0de615000000b005e752468f7bmr10650769ywe.79.1704233515934; Tue, 02
 Jan 2024 14:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20231228075545.362768-1-hch@lst.de> <20231228075545.362768-4-hch@lst.de>
In-Reply-To: <20231228075545.362768-4-hch@lst.de>
From: John Pittman <jpittman@redhat.com>
Date: Tue, 2 Jan 2024 17:11:19 -0500
Message-ID: <CA+RJvhwg3YXAzSk81nMGw=_3OMo6P=XcXBUFUAXSBcyXH6gkDg@mail.gmail.com>
Subject: Re: [PATCH 3/9] block: default the discard granularity to sector size
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Josef Bacik <josef@toxicpanda.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Coly Li <colyli@suse.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-bcache@vger.kernel.org, 
	linux-mtd@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_141340_443106_094A4751 
X-CRM114-Status: GOOD (  19.43  )
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

SGkgQ2hyaXN0b3BoLCBpcyB0aGVyZSBhIHJlYXNvbiB5b3UgdXNlZCA1MTIgaW5zdGVhZCBvZiBT
RUNUT1JfU0laRQpmcm9tIGluY2x1ZGUvbGludXgvYmxrX3R5cGVzLmg/ICBUaGFua3MhCgpPbiBU
aHUsIERlYyAyOCwgMjAyMyBhdCAyOjU24oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+IHdyb3RlOgo+Cj4gQ3VycmVudCB0aGUgZGlzY2FyZCBncmFudWxhcml0eSBkZWZhdWx0cyB0
byAwIGFuZCBtdXN0IGJlIGluaXRpYWxpemVkIGJ5Cj4gYW55IGRyaXZlciB0aGF0IHdhbnRzIHRv
IHN1cHBvcnQgZGlzY2FyZC4gIERlZmF1bHQgdG8gdGhlIHNlY3RvciBzaXplCj4gaW5zdGVhZCwg
d2hpY2ggaXMgdGhlIHNtYWxsZXN0IHBvc3NpYmxlIHZhbHVlLCBhbmQgYSB2ZXJ5IHVzZWZ1bCBk
ZWZhdWx0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIGJsb2NrL2Jsay1zZXR0aW5ncy5jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYmxvY2sv
YmxrLXNldHRpbmdzLmMgYi9ibG9jay9ibGstc2V0dGluZ3MuYwo+IGluZGV4IGJhNmUwZTk3MTE4
YzA4Li5kOTkzZDIwZGFiM2M2ZCAxMDA2NDQKPiAtLS0gYS9ibG9jay9ibGstc2V0dGluZ3MuYwo+
ICsrKyBiL2Jsb2NrL2Jsay1zZXR0aW5ncy5jCj4gQEAgLTQ4LDcgKzQ4LDcgQEAgdm9pZCBibGtf
c2V0X2RlZmF1bHRfbGltaXRzKHN0cnVjdCBxdWV1ZV9saW1pdHMgKmxpbSkKPiAgICAgICAgIGxp
bS0+bWF4X2Rpc2NhcmRfc2VjdG9ycyA9IDA7Cj4gICAgICAgICBsaW0tPm1heF9od19kaXNjYXJk
X3NlY3RvcnMgPSAwOwo+ICAgICAgICAgbGltLT5tYXhfc2VjdXJlX2VyYXNlX3NlY3RvcnMgPSAw
Owo+IC0gICAgICAgbGltLT5kaXNjYXJkX2dyYW51bGFyaXR5ID0gMDsKPiArICAgICAgIGxpbS0+
ZGlzY2FyZF9ncmFudWxhcml0eSA9IDUxMjsKPiAgICAgICAgIGxpbS0+ZGlzY2FyZF9hbGlnbm1l
bnQgPSAwOwo+ICAgICAgICAgbGltLT5kaXNjYXJkX21pc2FsaWduZWQgPSAwOwo+ICAgICAgICAg
bGltLT5sb2dpY2FsX2Jsb2NrX3NpemUgPSBsaW0tPnBoeXNpY2FsX2Jsb2NrX3NpemUgPSBsaW0t
PmlvX21pbiA9IDUxMjsKPiBAQCAtMzA5LDYgKzMwOSw5IEBAIHZvaWQgYmxrX3F1ZXVlX2xvZ2lj
YWxfYmxvY2tfc2l6ZShzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSwgdW5zaWduZWQgaW50IHNpemUp
Cj4KPiAgICAgICAgIGxpbWl0cy0+bG9naWNhbF9ibG9ja19zaXplID0gc2l6ZTsKPgo+ICsgICAg
ICAgaWYgKGxpbWl0cy0+ZGlzY2FyZF9ncmFudWxhcml0eSA8IGxpbWl0cy0+bG9naWNhbF9ibG9j
a19zaXplKQo+ICsgICAgICAgICAgICAgICBsaW1pdHMtPmRpc2NhcmRfZ3JhbnVsYXJpdHkgPSBs
aW1pdHMtPmxvZ2ljYWxfYmxvY2tfc2l6ZTsKPiArCj4gICAgICAgICBpZiAobGltaXRzLT5waHlz
aWNhbF9ibG9ja19zaXplIDwgc2l6ZSkKPiAgICAgICAgICAgICAgICAgbGltaXRzLT5waHlzaWNh
bF9ibG9ja19zaXplID0gc2l6ZTsKPgo+IC0tCj4gMi4zOS4yCj4KPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
