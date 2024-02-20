Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BD2C48BC3
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fa1JBsSbQUGshdIP+jzKt6N9JDWnfkl2SEN2EpT5/Q=; b=hDevwwkfKNG5AF
	xSi6/+2TyRnutkCwmC0GYgzzTpDAgNiPLB3we1B0GMShl4Ot34EbSHE+dTU3odQKjNDpA95iGtggG
	PkmMyNPI3GbdVL6b5MahG5RX2By54hYQJJifVzprJb2iPjNjUesSPnChfY80y/DbOffwA1kHd8bqM
	FSH3B3aIqBxBSUVgke83xW0SPUHZIHwj1gcDCzgbuNRUekTlddh6IO5AXibQ/1Plc+hkln/EXNwEQ
	ve2RbMOmL4aRj+wI8waqhCQhzuX2Tbt7DzVFJVSkO1+DdKpdx7lh74HTGMyHVsix6ZHicEyc6CCaG
	GD2vj6pfcSGG6316Hcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcO9M-0000000EPeB-3Kjf;
	Tue, 20 Feb 2024 11:19:00 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcO9J-0000000EPdY-39Ji
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 11:18:59 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3bba50cd318so4067189b6e.0
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 03:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708427936; x=1709032736; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnXxqyxgAOCE9B1gsdMTfmeu8SJJIbR4o3Oy9m1fJBo=;
        b=ZdLtu3wWFwfGjIL30TA3JEy+9elVbznFPjpSAByBag8xZTCcqXtBGcsxw93h1Qu8Na
         MmbywboP6VCroJTnZSiF5umlAR8Ld7AZCNH+DLsZcs97HIhDFvXglf4i82P7KJdfMYzG
         2Vm0IdT8GdCwjyS4fewCM/RP6vouR0/QFrTeiABBVrrB8XztYUG0Yhf9yk9YIyLbYx63
         x8eorEsWUU4K9CXCgzMicm1LXgRJuMMKoHIZ+1r7znO8oldpi9Cg6cYdNK9ReYoAVtWF
         VOMVYLj0QMKFDJ62mRfU2n4xLExiRcLj/FseRs/+fVe9htQczm0LEsco1kJsdhXzXqud
         kSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708427936; x=1709032736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnXxqyxgAOCE9B1gsdMTfmeu8SJJIbR4o3Oy9m1fJBo=;
        b=qR4H2ixcGqVIjW6fxaZ9qX8CW6mM49DPKZExzvQxK7BnYJ+oAByBtumncBAzClY3SX
         SpwLcCgZZ2S49k93042YAPkQK/MzgXiR9viLw2Hf3XPdAXRwawwmo+4KhLI0m67VvrDc
         aIe02JZciwO2GDGy+z2jtRF5eIH+xcVqr/1f1ZT8grb4he5+ouOj8U8d4I0MTOoshGxj
         nUv6wO6HGZqLfGJMwG8qXDcDhAiYqM12aTKrRX/sADJ0yMEvCPkVtQGAt1dEYo7pmB85
         iWGBuVdwTA2r314d46aG/19o+BiLndopZU1Z4pX8WvnP8cZVzBT9b0i2UJz8TNS1Uvaz
         H6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCX12TeHRlH+ocl5LCTNa/MlUjcFGKXaBX/0X7ttiBlyCrXz2ckhY2UoQv8AM25pBe3lNzDAY1vA92knxe8/q8E4DG6qUsVRWlzoAhtrnQ==
X-Gm-Message-State: AOJu0YzGZoo5ZS9/jMnMeU2bO3dHUev2WVZgLyC8XM2+WVemKKdHMzRq
	riG/GkZFbgUTYmMa3IBhAAs5EJfbBzIA/FSCizUkkrEYwgM0NHPSIXWJzkz4ZiCrpQkHg99M5sL
	98eoPUrZYZYlBYs1kUQo2LfPutns=
X-Google-Smtp-Source: AGHT+IFqXfo9MqRRXkJHVGd1zP5btF8tonhuNN58hdV1sWRe6/06+YeQrZc/xVd+r5scxRDkntVJIrsGV3fU9rwHZzE=
X-Received: by 2002:a05:6808:201a:b0:3c1:5fa3:ab8 with SMTP id
 q26-20020a056808201a00b003c15fa30ab8mr4610653oiw.39.1708427936094; Tue, 20
 Feb 2024 03:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-8-hch@lst.de>
In-Reply-To: <20240215070300.2200308-8-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Tue, 20 Feb 2024 12:18:44 +0100
Message-ID: <CAOi1vP9K=YYrtuCGF5B41He8D5q2zSmiCHjHezo0Dgu1gKH4+w@mail.gmail.com>
Subject: Re: [PATCH 07/17] rbd: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
	Ming Lei <ming.lei@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_031857_815435_5665CBE0 
X-CRM114-Status: GOOD (  18.97  )
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

T24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgODowM+KAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPgo+IFBhc3MgdGhlIGxpbWl0cyByYmQgaW1wb3NlcyBkaXJlY3RseSB0
byBibGtfbXFfYWxsb2NfZGlzayBpbnN0ZWFkCj4gb2Ygc2V0dGluZyB0aGVtIG9uZSBhdCBhIHRp
bWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAt
LS0KPiAgZHJpdmVycy9ibG9jay9yYmQuYyB8IDI5ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3JiZC5jIGIvZHJpdmVycy9ibG9jay9yYmQu
Ywo+IGluZGV4IDZiNGYxODk4YTcyMmEzLi4yNmZmNWNkMmJmMGFiYyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2Jsb2NrL3JiZC5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9yYmQuYwo+IEBAIC00OTUy
LDYgKzQ5NTIsMTQgQEAgc3RhdGljIGludCByYmRfaW5pdF9kaXNrKHN0cnVjdCByYmRfZGV2aWNl
ICpyYmRfZGV2KQo+ICAgICAgICAgc3RydWN0IHJlcXVlc3RfcXVldWUgKnE7Cj4gICAgICAgICB1
bnNpZ25lZCBpbnQgb2Jqc2V0X2J5dGVzID0KPiAgICAgICAgICAgICByYmRfZGV2LT5sYXlvdXQu
b2JqZWN0X3NpemUgKiByYmRfZGV2LT5sYXlvdXQuc3RyaXBlX2NvdW50Owo+ICsgICAgICAgc3Ry
dWN0IHF1ZXVlX2xpbWl0cyBsaW0gPSB7Cj4gKyAgICAgICAgICAgICAgIC5tYXhfaHdfc2VjdG9y
cyAgICAgICAgID0gb2Jqc2V0X2J5dGVzID4+IFNFQ1RPUl9TSElGVCwKPiArICAgICAgICAgICAg
ICAgLm1heF91c2VyX3NlY3RvcnMgICAgICAgPSBvYmpzZXRfYnl0ZXMgPj4gU0VDVE9SX1NISUZU
LAo+ICsgICAgICAgICAgICAgICAuaW9fbWluICAgICAgICAgICAgICAgICA9IHJiZF9kZXYtPm9w
dHMtPmFsbG9jX3NpemUsCj4gKyAgICAgICAgICAgICAgIC5pb19vcHQgICAgICAgICAgICAgICAg
ID0gcmJkX2Rldi0+b3B0cy0+YWxsb2Nfc2l6ZSwKPiArICAgICAgICAgICAgICAgLm1heF9zZWdt
ZW50cyAgICAgICAgICAgPSBVU0hSVF9NQVgsCj4gKyAgICAgICAgICAgICAgIC5tYXhfc2VnbWVu
dF9zaXplICAgICAgID0gVUlOVF9NQVgsCj4gKyAgICAgICB9Owo+ICAgICAgICAgaW50IGVycjsK
Pgo+ICAgICAgICAgbWVtc2V0KCZyYmRfZGV2LT50YWdfc2V0LCAwLCBzaXplb2YocmJkX2Rldi0+
dGFnX3NldCkpOwo+IEBAIC00OTY2LDcgKzQ5NzQsMTMgQEAgc3RhdGljIGludCByYmRfaW5pdF9k
aXNrKHN0cnVjdCByYmRfZGV2aWNlICpyYmRfZGV2KQo+ICAgICAgICAgaWYgKGVycikKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIGVycjsKPgo+IC0gICAgICAgZGlzayA9IGJsa19tcV9hbGxvY19k
aXNrKCZyYmRfZGV2LT50YWdfc2V0LCBOVUxMLCByYmRfZGV2KTsKPiArICAgICAgIGlmIChyYmRf
ZGV2LT5vcHRzLT50cmltKSB7Cj4gKyAgICAgICAgICAgICAgIGxpbS5kaXNjYXJkX2dyYW51bGFy
aXR5ID0gcmJkX2Rldi0+b3B0cy0+YWxsb2Nfc2l6ZTsKPiArICAgICAgICAgICAgICAgbGltLm1h
eF9od19kaXNjYXJkX3NlY3RvcnMgPSBvYmpzZXRfYnl0ZXMgPj4gU0VDVE9SX1NISUZUOwo+ICsg
ICAgICAgICAgICAgICBsaW0ubWF4X3dyaXRlX3plcm9lc19zZWN0b3JzID0gb2Jqc2V0X2J5dGVz
ID4+IFNFQ1RPUl9TSElGVDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBkaXNrID0gYmxrX21x
X2FsbG9jX2Rpc2soJnJiZF9kZXYtPnRhZ19zZXQsICZsaW0sIHJiZF9kZXYpOwo+ICAgICAgICAg
aWYgKElTX0VSUihkaXNrKSkgewo+ICAgICAgICAgICAgICAgICBlcnIgPSBQVFJfRVJSKGRpc2sp
Owo+ICAgICAgICAgICAgICAgICBnb3RvIG91dF90YWdfc2V0Owo+IEBAIC00OTg3LDE5ICs1MDAx
LDYgQEAgc3RhdGljIGludCByYmRfaW5pdF9kaXNrKHN0cnVjdCByYmRfZGV2aWNlICpyYmRfZGV2
KQo+ICAgICAgICAgYmxrX3F1ZXVlX2ZsYWdfc2V0KFFVRVVFX0ZMQUdfTk9OUk9ULCBxKTsKPiAg
ICAgICAgIC8qIFFVRVVFX0ZMQUdfQUREX1JBTkRPTSBpcyBvZmYgYnkgZGVmYXVsdCBmb3IgYmxr
LW1xICovCj4KPiAtICAgICAgIGJsa19xdWV1ZV9tYXhfaHdfc2VjdG9ycyhxLCBvYmpzZXRfYnl0
ZXMgPj4gU0VDVE9SX1NISUZUKTsKPiAtICAgICAgIHEtPmxpbWl0cy5tYXhfc2VjdG9ycyA9IHF1
ZXVlX21heF9od19zZWN0b3JzKHEpOwo+IC0gICAgICAgYmxrX3F1ZXVlX21heF9zZWdtZW50cyhx
LCBVU0hSVF9NQVgpOwo+IC0gICAgICAgYmxrX3F1ZXVlX21heF9zZWdtZW50X3NpemUocSwgVUlO
VF9NQVgpOwo+IC0gICAgICAgYmxrX3F1ZXVlX2lvX21pbihxLCByYmRfZGV2LT5vcHRzLT5hbGxv
Y19zaXplKTsKPiAtICAgICAgIGJsa19xdWV1ZV9pb19vcHQocSwgcmJkX2Rldi0+b3B0cy0+YWxs
b2Nfc2l6ZSk7Cj4gLQo+IC0gICAgICAgaWYgKHJiZF9kZXYtPm9wdHMtPnRyaW0pIHsKPiAtICAg
ICAgICAgICAgICAgcS0+bGltaXRzLmRpc2NhcmRfZ3JhbnVsYXJpdHkgPSByYmRfZGV2LT5vcHRz
LT5hbGxvY19zaXplOwo+IC0gICAgICAgICAgICAgICBibGtfcXVldWVfbWF4X2Rpc2NhcmRfc2Vj
dG9ycyhxLCBvYmpzZXRfYnl0ZXMgPj4gU0VDVE9SX1NISUZUKTsKPiAtICAgICAgICAgICAgICAg
YmxrX3F1ZXVlX21heF93cml0ZV96ZXJvZXNfc2VjdG9ycyhxLCBvYmpzZXRfYnl0ZXMgPj4gU0VD
VE9SX1NISUZUKTsKPiAtICAgICAgIH0KPiAtCj4gICAgICAgICBpZiAoIWNlcGhfdGVzdF9vcHQo
cmJkX2Rldi0+cmJkX2NsaWVudC0+Y2xpZW50LCBOT0NSQykpCj4gICAgICAgICAgICAgICAgIGJs
a19xdWV1ZV9mbGFnX3NldChRVUVVRV9GTEFHX1NUQUJMRV9XUklURVMsIHEpOwo+Cj4gLS0KPiAy
LjM5LjIKPgoKQWNrZWQtYnk6IElseWEgRHJ5b21vdiA8aWRyeW9tb3ZAZ21haWwuY29tPgoKVGhh
bmtzLAoKICAgICAgICAgICAgICAgIElseWEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
