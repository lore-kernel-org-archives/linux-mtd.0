Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699C2CCA470
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Sep 2025 13:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwVHk5ZLNJj18bo+ml5GJP+kqT4NK+3TM2vaoLIM87c=; b=kAlu3oobjj06qF
	GbJiK79c4nlXLT68BKAlUWY0pwOKzMjhaxxhL9cZW+5WHwDcLrRMQccxy9UJHuBDSMziKZ4pMqmeB
	UdBOSSQGNY/TRIvIvI5lIH0NU1WHX+CXiQnPgPTgr0OIntzE/MTrqayu9mk3vQKsm8qUrgXMbIBlM
	v5edIWTA7o89RgsI7o8HyeA9eXTLOqSUesinJDMGKOthonkp9oQnz9CdZtszarCg+rfzabqMlMPa0
	8p5H7r+doatPMJFv0yU/OgQrflHaUxFIoOZ/72nYHKdEYNd0KbrW5lDCGq6KB0yqlL6DwktOejX5B
	XKV3ycyt8a2n7vo0CUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aD0-00000005NGI-2C7L;
	Tue, 30 Sep 2025 13:15:58 +0000
Received: from smtp16.bhosted.nl ([2a02:9e0:8000::27])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aCx-00000005NF4-3b3f
	for linux-mtd@lists.infradead.org;
	Tue, 30 Sep 2025 13:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-transfer-encoding:content-type:cc:to:subject:message-id:date:from:
	 in-reply-to:references:mime-version:from;
	bh=UyCxDrrZzUT8zGZfo+Gzk8tgmUCGTYZ7qS0TdC3wFDE=;
	b=Ldg81QLwQ0rvqH+tgxMdbODuP3nlmjnc/SAk5R64rjJrk2sZjq7LejtlqnpUregLhKeKjlyJwP11X
	 kGb5wMaL/qB8XGjyxHbBK7NCqmW9ou/35yGCLRoxUPHLUonIfKQ+Ra5mAI+26Y1fwZPa9vmTxHmuTX
	 y3T6J+azHzHm518R8QC7KjeIQDtlzyx0bo2DJIsecZAob3AtkVjSEt4b4YW2DCQaPUwXEYwVQA6/og
	 gPBEsA1TVn6D09qAACQrElgs7fNVfVqTupBPXtvI3GRtYBCLvQ/IMSoP0vGSGjPG3rPqRVUOixWHJF
	 gMpi6Fzd2nO8Got61Cs6uZLIxc6A74A==
X-MSG-ID: 960cf7e9-9dff-11f0-8594-005056817704
X-Forwarded-Encrypted: i=1; AJvYcCV5fsQhIP5/fm6NzNDjHBItxIcKWRonYe/wXFF0M0QeQhIJDzkRD91XkJi5SUkSB7dBjf96KLvOw6Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFX8dHnDcpSNmhhzhHfyODahwScUW5YLSMHa+zP6g+WNIQqC+f
	giFzlBh+Y0mImhactY0+P1RoJAxapJcvO9ZBH+JnL6DhyIuZ/cLvQHsVmo9ulaoZmSV7vy8W2/T
	JgorqNd9PJZRk741qkOPj54H83ULcs98=
X-Google-Smtp-Source: AGHT+IEZpmUSSznZa3rcjquI8wBv8ZJiyiwjBQHfDOTQ+O92mufKmzERFkvjrfpPB/2t9FApR7bP0UgDW1B1GrDHyyM=
X-Received: by 2002:a05:690e:586:b0:62a:b545:54b4 with SMTP id
 956f58d0204a3-6361a822839mr17586176d50.26.1759238150375; Tue, 30 Sep 2025
 06:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com> <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org> <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net> <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
 <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
 <DD10QMSJVZ2K.26U45JAXV5EY7@kernel.org> <CAAyq3SYyqi-oR8T039Zd0uaF6UieX3SdF9UF2kxOG6+yJqAEUg@mail.gmail.com>
 <mafs01pnoceum.fsf@kernel.org>
In-Reply-To: <mafs01pnoceum.fsf@kernel.org>
From: Maarten Zanders <maarten@zanders.be>
Date: Tue, 30 Sep 2025 15:15:39 +0200
X-Gmail-Original-Message-ID: <CAPB_pE+f7QGNaBgWz6OSOmfBAdCoOgnUhCV=KzUR94vWt_pEYA@mail.gmail.com>
X-Gm-Features: AS18NWBAFFJpNfkAj_8jYdQKO9YeMQdBqD1VwzpimmSkxxS4FLynVx0YdFMrp0A
Message-ID: <CAPB_pE+f7QGNaBgWz6OSOmfBAdCoOgnUhCV=KzUR94vWt_pEYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, Michael Walle <mwalle@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, leoyu@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_061556_305018_57903442 
X-CRM114-Status: GOOD (  14.33  )
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

SGkgYWxsLAoKT24gVHVlLCBTZXAgMzAsIDIwMjUgYXQgMjoxOeKAr1BNIFByYXR5dXNoIFlhZGF2
IDxwcmF0eXVzaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+IEkgYWdyZWUgd2l0aCByZXZlcnRpbmcg
dGhpcyBwYXRjaC4gV2hlbiBJIGluaXRpYWxseSB2ZXJpZmllZCBpdCwgdGhlCj4gPiBkZXZpY2Vz
IEkgaGFkIG9uIGhhbmQgYWxsIHN1cHBvcnRlZCBTRkRQLCBzbyBJIGRpZCBub3QgY2F0Y2ggdGhp
cyBpc3N1ZS4KPiA+IEFmdGVyIGNoZWNraW5nIGFnYWluLCBJIGNvbmZpcm0gdGhhdCBzb21lIG9s
ZGVyIGZsYXNoZXMgd2l0aG91dCBTRkRQIGFyZQo+ID4gaW5kZWVkIGFmZmVjdGVkLgo+Cj4gRG8g
eW91IGtub3cgaWYgdGhlc2UgZmxhc2hlcyBhcmUgdXNlZCBpbiBhbnkgZGV2aWNlcyB0aGF0IGFy
ZSBhY3RpdmVseQo+IHVzZWQgYW5kIG1haW50YWluZWQ/IElmIHNvLCB3ZSBzaG91bGQgcmV2ZXJ0
LiBJZiBpdCBpcyBsaWtlbHkgdGhleQo+IGFyZW4ndCBhY3RpdmVseSB1c2VkLCB0aGVuIG1heWJl
IHdlIGp1c3Qga2VlcCB0aGluZ3MgYXMgdGhleSBhcmU/Cj4gRHVubm8uLi4KClRoZSBub24tU0ZE
UCBwYXJ0cyBoYXZlIGJlZW4gb2Jzb2xldGVkIGluIDIwMDktMjAxMCBhY2NvcmRpbmcgdG8KTWFj
cm9uaXgncyBQQ04ncy4gU28gdGhleSdyZSBwcmV0dHkgYW5jaWVudC4KCklmIHdlIGNob29zZSB0
byBrZWVwIHRoZSBwYXRjaCBpbiwgSSB0aGluayB3ZSBzaG91bGQgbWFrZSBpdCBtb3JlCmNvbnNp
c3RlbnQgYW5kIGRyb3Agc3VwcG9ydCBmb3IgdGhlIHNtYWxsZXIgZmxhc2hlcyB3aXRob3V0IFNG
RFAgYXMKd2VsbC4gVGhlIGJlaGF2aW9yIGlzIGRpZmZlcmVudCBpbiB0aGUgc3BpLW5vciBjb3Jl
IGZvciBTRkRQLXBhcnNlZCB2cwpub24tU0ZEUC1wYXJzZWQgY2FzZXMuCkluIHBhcnRpY3VsYXIg
SUQncyAweGMyMjAxNiBhbmQgMHhjMjIwMTcgY291bGQgYmUgaGFuZGxlZCBpbiB0aGUgc2FtZQp3
YXkgSSBiZWxpZXZlPwoKQmVzdCByZWdhcmRzLApNYWFydGVuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
