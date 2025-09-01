Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00D2CA0FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZZqCuCqvzRaSVui3MOzZ9fNP9TtAWZV3sX9zAK7/q4=; b=G11rL30gryABJ3
	5FLKipJxProoVX8QJ2RoyPU11v0mADxZnIReYG1Lmsn3r9iZErsdilXdr8MasptTTTN2XAPV+Fcy3
	a977aonXsG3lDxMJSePtyt1AhDjqdRz9iSVxnc43gKMm4eeLsOUi6hFs1lh4Sy3JXojrFa4zBqsOE
	CmUw82GYaESBdQfPTZ6oKWtHXsH9jwPn1n4kqYhcUAfG5Ret8tbxPdmfPEXuFKMAVTTVxEO7HoGTX
	X3dWBwHbVNE8k2zq6zb4qE4eqTA9gKUvFwTBi3wqijjMISRhYfdNPJ0M/C3tNhxyxQKVhp8yhXB0b
	rYXY2Qg8fpJ9SaUAHbdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8Kh-0000000DSSl-2Twu;
	Mon, 01 Sep 2025 17:28:43 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5Ga-0000000CoPN-1esI
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 14:12:17 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4b32c1fdcb4so16385051cf.1
        for <linux-mtd@lists.infradead.org>; Mon, 01 Sep 2025 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756735935; x=1757340735; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ypREcLEKQuyuV78ZOZQX5xuyP6sjl5/wVdGdfGcQlPQ=;
        b=ZR2f57828JTwHc+yXres8l5whVLOHuxqNdrHiKNUUz+EWQumJVfG5CUeyDLp17kJrA
         tvtSpoBeowodZjyNCGtVcqgUInaKyuHtrdDgKUp65Q6znBm6npf5KUhY+l4oyrffdz4a
         ZZwmqu9IqEwknD5YFyb0iwT2oyoNOcZoGqEwj6V8/sDHw/gBo+c2kQfjAvEYbHx/4wy+
         1fX+I7KJyclxkRlIzCET59qNdLU6Jb0F1YZWG1HKllalRkDNgqmaESzQHYy/x2gdr3bs
         8OLjpNq7bxAOhsuo26gFDBEgk5uAim/ht+PKFoOFlfmSWdYmeHme7E8XbfuDt9QGjFcb
         mvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756735935; x=1757340735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypREcLEKQuyuV78ZOZQX5xuyP6sjl5/wVdGdfGcQlPQ=;
        b=SqWhlDS3aO/vODk3FlCJDFhFL5Wz9L9oEZ6Hw/ihovjZBfgNDHkx37vK6tY5JS1Rzq
         nIVhytcu/p2tbvSYRtA0KcoxgTFR8rlVU06D/eGsp94BdgghR/8AScwqo03bok04ybzF
         dbpQNTe8xtj4vseFrH9dQvgP6bLsEEq8KxyOKnJU5b/L0/3pyFvrwpHC+reqAjJvH8us
         fXGClgQV+y7aeYIRxc6RsQDKkVuXrJMNQkkNgdU012SzM88dhMp+G0XDolxTtYgAYyMk
         SxIOwZQeKnqeUfndN2y5fwrMaedRZyVZz8ZQwl0d6cGoluSWwmUjwlo0WPVjm027Sczw
         axSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1qrxkFvVcEIQx/hxGwHP+nI2zMvVznMMSk/7ELbFjAeSIErYkkjpinW5Nj0Ir4ftZgyapOdq8PCA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIhzARlm5QeoJrFugcLDK9teZczKh+lEda/S0ABqp96p3D7vEz
	fWfyZzD4VirH4I8FMaeJ811uVML1gPtSF40iUzigNpRC21LwW5yLd+AY
X-Gm-Gg: ASbGnctsvb8++uSN7Gyl2N/iY4jpjDgO+7dE1Am/F3jtSYDXDD2c+dkyngJlFATcFeW
	URL/L6UQXDHjXaFe+KLncqWTWsdx9aPhNHSAlN8JqpJZCJ9/+otoQqHlBQjhkd65Qg0Oxb6LlDM
	NUlAlO3uWOSyfpqhMppA4nS7fcWafjmZsbgsEFjXzNUlhrVevBZjfYyZ6e3XoRofuNRd1cgCuIT
	2k08GdTEAoXbrzTWiXW/gk6IO4lQMDl7zxOW51AgGG8M+F9bvDfoClrLapS1hAEzVT44SJ56oKs
	ksd/FVUYZAOSO00fYMQGRMby7OnsgOfcXntrB4SXG0HNcAHu4Jnupn8WMJVi6fIvHI11aaRMvUE
	6EoyHamt6bfrXTriJ1eM01tUDbay5D5DvzvyVYFhTUWgfJZOXDklproMBk4xFAuk=
X-Google-Smtp-Source: AGHT+IF1yttvl4L2tr4zX6Joq9/P8wD3ZTZcShoXHQ51APk0j4wyc9+vVRT6vBgFrke+F29FPjCn2Q==
X-Received: by 2002:a05:622a:5e0b:b0:4b2:e14c:d901 with SMTP id d75a77b69052e-4b324feec41mr41569451cf.20.1756735935022;
        Mon, 01 Sep 2025 07:12:15 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b30b6abc60sm63333301cf.37.2025.09.01.07.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 07:12:14 -0700 (PDT)
Message-ID: <ba1336ce-cc0d-4dcf-99ff-1934cb02372a@gmail.com>
Date: Mon, 1 Sep 2025 16:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250831-mtd-validate-ooboffs-v1-1-d3fdce7a8698@gmail.com>
 <874itmpcrs.fsf@bootlin.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <874itmpcrs.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_071216_432866_DEB0BF75 
X-CRM114-Status: GOOD (  12.38  )
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

SGkgTWlxdWVsLAoKMjAyNS4gMDkuIDAxLiAxNDozOSBrZWx0ZXrDqXNzZWwsIE1pcXVlbCBSYXlu
YWwgw61ydGE6CgouLi4KCj4+IFRoaXMgYmVoYXZpb3VyIGlzIG1vcmUgYWNjdXJhdGUgdGhhbiB0
aGUgY3VycmVudCBvbmUgd2hlcmUgbW9zdCB0ZXN0cwo+PiBhcmUgaW5kaWNhdGluZyBzdWNjZXNz
ZnVsIHdyaXRpbmcgb2YgT09CIGRhdGEgZXZlbiB0aGF0IGluIGZhY3Qgbm90aGluZwo+PiBnZXRz
IHdyaXR0ZW4gaW50byB0aGUgZGV2aWNlLCB3aGljaCBpcyBxdWl0ZSBtaXNsZWFkaW5nLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBHYWJvciBKdWhvcyA8ajRnOHk3QGdtYWlsLmNvbT4KPiAKPiBUaGFu
a3MgYSBsb3QgZm9yIHRoaXMgY29udHJpYnV0aW9uLCBJJ20gcmVhZHkgdG8gdGFrZSBpdC4gSnVz
dCBvbmUKPiBxdWVzdGlvbiwgZG8geW91IGNvbnNpZGVyIGl0IHNob3VsZCBiZSBiYWNrcG9ydGVk
PyBJIHdvdWxkIHRlbmQgdG8KPiBhbnN3ZXIgeWVzIHRvIHRoaXMgcXVlc3Rpb24sIHdoaWNoIHdv
dWxkIGludm9sdmUgeW91IHNlbmRpbmcgYSB2MiB3aXRoOgo+IAo+ICAgICAgICBGaXhlczoKPiAg
ICAgICAgQ2M6IHN0YWJsZS4uLgo+IAo+IE90aGVyd2lzZSBJIGNhbiB0YWtlIGl0IGFzLWlzIGlm
IHlvdSBjb252aW5jZSBtZSBpdCBpcyBub3Qgc28gcmVsZXZhbnQKPiA6LSkKCkkgY2FuJ3QgY29u
dmluY2UgZXZlbiBteXNlbGYgYWJvdXQgdGhhdCwgc28gd2lsbCBzZW5kIGEgdjIuIDopCgpSZWdh
cmRzLApHYWJvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
