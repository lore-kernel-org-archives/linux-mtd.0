Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519D7C48260
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Feb 2024 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ALYNrGAHOpuQ6baHmb5WzLo48qN8WFq+BuPmtQnfrw=; b=P54EE+/ZEKKKPi
	8693C3Y0yZC8c+8VnSXufbP86xmmYaw5H4/09qhtq0B+PlhaeYCStQ7zNOuAf9bNa+RZqvp5n5/3c
	/XmwPJDNkJyCBWZZX7kFSH0xUhYGdktUkF81xg4yVBhppVyaepNIvaSujN/5q90BPbR4sDP2dbddJ
	Lx4SXgskpxulFUHFzJFwJjT9nP+VZiyJJKTkMyKUzeK/9JaGVMtxIkPRERr+XgaqmMhJtLdUW/KDD
	gBzUi7JFGbCEB4rnNUk1KGPBaEJAGA/1E8FOEwjALSLSIenE61nLg+O41IFiVEfjm751dsGc6Q7lB
	5Lm7QEFYfPLXNznr9yYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rasyj-00000001Q6R-0FE9;
	Fri, 16 Feb 2024 07:49:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rasyf-00000001Q5b-2PzK
	for linux-mtd@lists.infradead.org;
	Fri, 16 Feb 2024 07:49:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-563e330351dso478775a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 23:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1708069782; x=1708674582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKtrR0GptUvN+scEUpBPwjTH5qrhKCgtCeXIuRBm1rE=;
        b=WtwMs9CeI1VoyQPBdFe9g2mLD5ct+qnZKWvydkS6kp7MN3pOtPynFAcCWS2v+MG+gf
         H9h4brEBbYZb8JXFz60LFpIUKwfdSzT6ADE/nSuszHoItnYCBbDFwhUwNoSz28n2JeBh
         sobljQ3LkqAPKSxC2kggiV7ATW9u6WF/wsIy5yU5NQ64ARj05LM5JxkvOBoNqVqTcf0N
         3XodMyg7n7dQbR9xSt82JF+1C3Z5yLhkzLN7AO1X/V4PgkD8lHkRo868XOWmdwp3qdPm
         4HsPwR7v4sQdY6vg3eJR9JJil1Y5HiBbTP76GcZPbBAUhpeuPnCMysRVuB9eBDGc2mdJ
         3zWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708069782; x=1708674582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKtrR0GptUvN+scEUpBPwjTH5qrhKCgtCeXIuRBm1rE=;
        b=jjYila6UiUSGgLsxoL9P8giz2J59VAy7+VZ/c9CgiaklayuPd1l49mxev43SRGNk8T
         O8xH6FZNDSqP2nfeyeaDB2OBjvFCUtuoNHKZNnUq0iKP5/DnR0gi6rZrwoBscTwv8PEN
         lWbQVtyjwwv4IhNQaF1H07SB6dXnm1QsE9mm+SCUbKpuAZ76tgNIZ/srHAWh/m4brwL+
         siioH9Z5abKSPvn587uT0k9NZq9RqsZEuxPlrU7BCKaARuCLv58jYOm2Khp+jU85CCEX
         xJIcAKzxrScLkxfndBwq3yGnhU9b/VhtSnLoPDRFnPzAUMEv5vaafl/d6juxzfqJ82/k
         t5eA==
X-Forwarded-Encrypted: i=1; AJvYcCVe8PLbfsRIKCt4AQ1NyxYtHogz/aMsScCZZgqo6aTgXKWWsTlgKCbskIo3cTh7Z3bFOJip7rMVCPhozGXkSwCTUsqZV+AqJQ//iIENyA==
X-Gm-Message-State: AOJu0YxFjmIaHjU2feV9o0UY+m21li0IZYpFNe5k9m/H5GsC5DKzJkMd
	GMbBhzP0xNt+treGj0TyMZINnvzhb7mAm82yVkDCf7XOKQZyePUiClEWVcNrzNGXSUlzYS65o4N
	Rr7c0dPR8Y6TFwrRA4mfHvvLfp3Acb2LB8W/VNw==
X-Google-Smtp-Source: AGHT+IEz+DOqbldxdx8VWXCWP6/6fTdJY+pnjm4uq4NWwzDh2gUwnQ0y3y2rNodnC/dPtB2uhZ02GJwHr8oI/OyBPSQ=
X-Received: by 2002:a05:6402:3593:b0:563:fc1d:4568 with SMTP id
 y19-20020a056402359300b00563fc1d4568mr440920edc.10.1708069782007; Thu, 15 Feb
 2024 23:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-9-hch@lst.de>
In-Reply-To: <20240215070300.2200308-9-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Fri, 16 Feb 2024 08:49:30 +0100
Message-ID: <CAMGffE=cpyWvxWwdmhyxhgBr7zxvqHS2BQwx-zm2=cm3VjRFxQ@mail.gmail.com>
Subject: Re: [PATCH 08/17] rnbd-clt: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Ming Lei <ming.lei@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_234945_833783_781C8262 
X-CRM114-Status: GOOD (  20.46  )
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
bHN0LmRlPiB3cm90ZToKPgo+IFBhc3MgdGhlIGxpbWl0cyBybmJkLWNsdCBpbXBvc2VzIGRpcmVj
dGx5IHRvIGJsa19tcV9hbGxvY19kaXNrIGluc3RlYWQKPiBvZiBzZXR0aW5nIHRoZW0gb25lIGF0
IGEgdGltZS4KPgo+IFdoaWxlIGF0IGl0IGRvbid0IHNldCBhbiBleHBsaWNpdCBudW1iZXIgb2Yg
ZGlzY2FyZCBzZWdtZW50cywgYXMgMSBpcwo+IHRoZSBkZWZhdWx0ICh3aGljaCBtb3N0IGRyaXZl
cnMgcmVseSBvbikuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4KbGd0bSwgdGh4IQpBY2tlZC1ieTogSmFjayBXYW5nIDxqaW5wdS53YW5nQGlvbm9zLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ibG9jay9ybmJkL3JuYmQtY2x0LmMgfCA2NCArKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9u
cygrKSwgMzkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9ybmJk
L3JuYmQtY2x0LmMgYi9kcml2ZXJzL2Jsb2NrL3JuYmQvcm5iZC1jbHQuYwo+IGluZGV4IGQ1MWJl
NGYyZGY2MWEzLi5iN2ZmZTAzYzYxNjA2ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3Ju
YmQvcm5iZC1jbHQuYwo+ICsrKyBiL2RyaXZlcnMvYmxvY2svcm5iZC9ybmJkLWNsdC5jCj4gQEAg
LTEzMjksNDMgKzEzMjksNiBAQCBzdGF0aWMgdm9pZCBybmJkX2luaXRfbXFfaHdfcXVldWVzKHN0
cnVjdCBybmJkX2NsdF9kZXYgKmRldikKPiAgICAgICAgIH0KPiAgfQo+Cj4gLXN0YXRpYyB2b2lk
IHNldHVwX3JlcXVlc3RfcXVldWUoc3RydWN0IHJuYmRfY2x0X2RldiAqZGV2LAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJuYmRfbXNnX29wZW5fcnNwICpyc3ApCj4g
LXsKPiAtICAgICAgIGJsa19xdWV1ZV9sb2dpY2FsX2Jsb2NrX3NpemUoZGV2LT5xdWV1ZSwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGUxNl90b19jcHUocnNwLT5sb2dp
Y2FsX2Jsb2NrX3NpemUpKTsKPiAtICAgICAgIGJsa19xdWV1ZV9waHlzaWNhbF9ibG9ja19zaXpl
KGRldi0+cXVldWUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZTE2
X3RvX2NwdShyc3AtPnBoeXNpY2FsX2Jsb2NrX3NpemUpKTsKPiAtICAgICAgIGJsa19xdWV1ZV9t
YXhfaHdfc2VjdG9ycyhkZXYtPnF1ZXVlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRldi0+c2Vzcy0+bWF4X2lvX3NpemUgLyBTRUNUT1JfU0laRSk7Cj4gLQo+IC0gICAgICAg
LyoKPiAtICAgICAgICAqIHdlIGRvbid0IHN1cHBvcnQgZGlzY2FyZHMgdG8gImRpc2NvbnRpZ3Vv
dXMiIHNlZ21lbnRzCj4gLSAgICAgICAgKiBpbiBvbiByZXF1ZXN0Cj4gLSAgICAgICAgKi8KPiAt
ICAgICAgIGJsa19xdWV1ZV9tYXhfZGlzY2FyZF9zZWdtZW50cyhkZXYtPnF1ZXVlLCAxKTsKPiAt
Cj4gLSAgICAgICBibGtfcXVldWVfbWF4X2Rpc2NhcmRfc2VjdG9ycyhkZXYtPnF1ZXVlLAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGUzMl90b19jcHUocnNwLT5tYXhf
ZGlzY2FyZF9zZWN0b3JzKSk7Cj4gLSAgICAgICBkZXYtPnF1ZXVlLT5saW1pdHMuZGlzY2FyZF9n
cmFudWxhcml0eSA9Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxl
MzJfdG9fY3B1KHJzcC0+ZGlzY2FyZF9ncmFudWxhcml0eSk7Cj4gLSAgICAgICBkZXYtPnF1ZXVl
LT5saW1pdHMuZGlzY2FyZF9hbGlnbm1lbnQgPQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsZTMyX3RvX2NwdShyc3AtPmRpc2NhcmRfYWxpZ25tZW50KTsKPiAtICAg
ICAgIGlmIChsZTE2X3RvX2NwdShyc3AtPnNlY3VyZV9kaXNjYXJkKSkKPiAtICAgICAgICAgICAg
ICAgYmxrX3F1ZXVlX21heF9zZWN1cmVfZXJhc2Vfc2VjdG9ycyhkZXYtPnF1ZXVlLAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZTMyX3RvX2NwdShyc3AtPm1heF9k
aXNjYXJkX3NlY3RvcnMpKTsKPiAtICAgICAgIGJsa19xdWV1ZV9mbGFnX3NldChRVUVVRV9GTEFH
X1NBTUVfQ09NUCwgZGV2LT5xdWV1ZSk7Cj4gLSAgICAgICBibGtfcXVldWVfZmxhZ19zZXQoUVVF
VUVfRkxBR19TQU1FX0ZPUkNFLCBkZXYtPnF1ZXVlKTsKPiAtICAgICAgIGJsa19xdWV1ZV9tYXhf
c2VnbWVudHMoZGV2LT5xdWV1ZSwgZGV2LT5zZXNzLT5tYXhfc2VnbWVudHMpOwo+IC0gICAgICAg
YmxrX3F1ZXVlX2lvX29wdChkZXYtPnF1ZXVlLCBkZXYtPnNlc3MtPm1heF9pb19zaXplKTsKPiAt
ICAgICAgIGJsa19xdWV1ZV92aXJ0X2JvdW5kYXJ5KGRldi0+cXVldWUsIFNaXzRLIC0gMSk7Cj4g
LSAgICAgICBibGtfcXVldWVfd3JpdGVfY2FjaGUoZGV2LT5xdWV1ZSwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAhIShyc3AtPmNhY2hlX3BvbGljeSAmIFJOQkRfV1JJVEVCQUNLKSwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhIShyc3AtPmNhY2hlX3BvbGljeSAmIFJO
QkRfRlVBKSk7Cj4gLSAgICAgICBibGtfcXVldWVfbWF4X3dyaXRlX3plcm9lc19zZWN0b3JzKGRl
di0+cXVldWUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxl
MzJfdG9fY3B1KHJzcC0+bWF4X3dyaXRlX3plcm9lc19zZWN0b3JzKSk7Cj4gLX0KPiAtCj4gIHN0
YXRpYyBpbnQgcm5iZF9jbHRfc2V0dXBfZ2VuX2Rpc2soc3RydWN0IHJuYmRfY2x0X2RldiAqZGV2
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJuYmRfbXNnX29w
ZW5fcnNwICpyc3AsIGludCBpZHgpCj4gIHsKPiBAQCAtMTQwMywxOCArMTM2Niw0MSBAQCBzdGF0
aWMgaW50IHJuYmRfY2x0X3NldHVwX2dlbl9kaXNrKHN0cnVjdCBybmJkX2NsdF9kZXYgKmRldiwK
PiAgc3RhdGljIGludCBybmJkX2NsaWVudF9zZXR1cF9kZXZpY2Uoc3RydWN0IHJuYmRfY2x0X2Rl
diAqZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBybmJk
X21zZ19vcGVuX3JzcCAqcnNwKQo+ICB7Cj4gKyAgICAgICBzdHJ1Y3QgcXVldWVfbGltaXRzIGxp
bSA9IHsKPiArICAgICAgICAgICAgICAgLmxvZ2ljYWxfYmxvY2tfc2l6ZSAgICAgPSBsZTE2X3Rv
X2NwdShyc3AtPmxvZ2ljYWxfYmxvY2tfc2l6ZSksCj4gKyAgICAgICAgICAgICAgIC5waHlzaWNh
bF9ibG9ja19zaXplICAgID0gbGUxNl90b19jcHUocnNwLT5waHlzaWNhbF9ibG9ja19zaXplKSwK
PiArICAgICAgICAgICAgICAgLmlvX29wdCAgICAgICAgICAgICAgICAgPSBkZXYtPnNlc3MtPm1h
eF9pb19zaXplLAo+ICsgICAgICAgICAgICAgICAubWF4X2h3X3NlY3RvcnMgICAgICAgICA9IGRl
di0+c2Vzcy0+bWF4X2lvX3NpemUgLyBTRUNUT1JfU0laRSwKPiArICAgICAgICAgICAgICAgLm1h
eF9od19kaXNjYXJkX3NlY3RvcnMgPSBsZTMyX3RvX2NwdShyc3AtPm1heF9kaXNjYXJkX3NlY3Rv
cnMpLAo+ICsgICAgICAgICAgICAgICAuZGlzY2FyZF9ncmFudWxhcml0eSAgICA9IGxlMzJfdG9f
Y3B1KHJzcC0+ZGlzY2FyZF9ncmFudWxhcml0eSksCj4gKyAgICAgICAgICAgICAgIC5kaXNjYXJk
X2FsaWdubWVudCAgICAgID0gbGUzMl90b19jcHUocnNwLT5kaXNjYXJkX2FsaWdubWVudCksCj4g
KyAgICAgICAgICAgICAgIC5tYXhfc2VnbWVudHMgICAgICAgICAgID0gZGV2LT5zZXNzLT5tYXhf
c2VnbWVudHMsCj4gKyAgICAgICAgICAgICAgIC52aXJ0X2JvdW5kYXJ5X21hc2sgICAgID0gU1pf
NEsgLSAxLAo+ICsgICAgICAgICAgICAgICAubWF4X3dyaXRlX3plcm9lc19zZWN0b3JzID0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICBsZTMyX3RvX2NwdShyc3AtPm1heF93cml0ZV96ZXJvZXNf
c2VjdG9ycyksCj4gKyAgICAgICB9Owo+ICAgICAgICAgaW50IGlkeCA9IGRldi0+Y2x0X2Rldmlj
ZV9pZDsKPgo+ICAgICAgICAgZGV2LT5zaXplID0gbGU2NF90b19jcHUocnNwLT5uc2VjdG9ycykg
Kgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGxlMTZfdG9fY3B1KHJzcC0+bG9naWNhbF9ibG9j
a19zaXplKTsKPgo+IC0gICAgICAgZGV2LT5nZCA9IGJsa19tcV9hbGxvY19kaXNrKCZkZXYtPnNl
c3MtPnRhZ19zZXQsIE5VTEwsIGRldik7Cj4gKyAgICAgICBpZiAocnNwLT5zZWN1cmVfZGlzY2Fy
ZCkgewo+ICsgICAgICAgICAgICAgICBsaW0ubWF4X3NlY3VyZV9lcmFzZV9zZWN0b3JzID0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICBsZTMyX3RvX2NwdShyc3AtPm1heF9kaXNjYXJkX3NlY3Rv
cnMpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGRldi0+Z2QgPSBibGtfbXFfYWxsb2NfZGlz
aygmZGV2LT5zZXNzLT50YWdfc2V0LCAmbGltLCBkZXYpOwo+ICAgICAgICAgaWYgKElTX0VSUihk
ZXYtPmdkKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoZGV2LT5nZCk7Cj4gICAg
ICAgICBkZXYtPnF1ZXVlID0gZGV2LT5nZC0+cXVldWU7Cj4gICAgICAgICBybmJkX2luaXRfbXFf
aHdfcXVldWVzKGRldik7Cj4KPiAtICAgICAgIHNldHVwX3JlcXVlc3RfcXVldWUoZGV2LCByc3Ap
Owo+ICsgICAgICAgYmxrX3F1ZXVlX2ZsYWdfc2V0KFFVRVVFX0ZMQUdfU0FNRV9DT01QLCBkZXYt
PnF1ZXVlKTsKPiArICAgICAgIGJsa19xdWV1ZV9mbGFnX3NldChRVUVVRV9GTEFHX1NBTUVfRk9S
Q0UsIGRldi0+cXVldWUpOwo+ICsgICAgICAgYmxrX3F1ZXVlX3dyaXRlX2NhY2hlKGRldi0+cXVl
dWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgISEocnNwLT5jYWNoZV9wb2xpY3kg
JiBSTkJEX1dSSVRFQkFDSyksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgISEocnNw
LT5jYWNoZV9wb2xpY3kgJiBSTkJEX0ZVQSkpOwo+ICsKPiAgICAgICAgIHJldHVybiBybmJkX2Ns
dF9zZXR1cF9nZW5fZGlzayhkZXYsIHJzcCwgaWR4KTsKPiAgfQo+Cj4gLS0KPiAyLjM5LjIKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
