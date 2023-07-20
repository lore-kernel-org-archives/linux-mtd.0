Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B54EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 06:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ud7kNPcWgyoF4qKp1abzSQA7NUeuz1ZC1iL2JL5V/uQ=; b=4mRGDuGYULikP8
	dSKZmBhhOK0SnpJLe1rDKWXYytOqb1usfKdY45cRwWQHqcmFUOIEAIVIrR2u2Go317alhxTPUqAnX
	ZZlzraJah9XtwI8GG6FA6A4jK+gn6V1ZzZC4pcXVLA3nbM28S9UOFwEvFGSMeETM+6fxNAHeFcqIG
	QpkLgAkHE+194RuweEcvf2wHXl2OgRGbITSWSPfOPlKuKDUXEZbwAGoLIp39KIKLhndlt3xq0JHqI
	yhDQ88Quzv+2+BB8Dt7LBoC6xTQU9VVyFeEdU/FB2lkq1yIGFtY6ghWnuICF88kDfzaFyvyJiFqps
	DY0usbNikD/G0j5qzWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMMm4-009t1K-1G;
	Thu, 20 Jul 2023 06:04:28 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMMm0-009szE-1z
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 06:04:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D74F2C0004;
	Thu, 20 Jul 2023 06:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689833057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUFL7/Mm7BPR8kB+przAb0OhEflLuBBseviQ3BJv9XI=;
	b=KLwUNU/HXgYZnteyxoUn5AmohuBdHXzopujfXCbx8cF44Qz8QJTIJGrYik1WRX3aR27zOb
	JtlcjxSq75x4l/MjKwgsYNdnr4bEnhFGgj3l3Hiy3/r+1jNkURLVTCRjjpQkBwjFWUlnt1
	MBy3ltHjeUuOL1+oLq5NnJai9KKIYdArGGrJXMzWHePNpa03aFKj86L+Sw6I5fHi69NWBh
	NKa0Pn4Pasn1VUKcUZ7n29qCtN6jQ2lVhnD/JWLE0prgAvJWG1bTer0gkUa16TcrbQRHJ8
	TGB2/o8DFmVblY79u7kO1qX7XwCIzeJls0LFCpaxm4cca19aXESw87rZwzit4Q==
Date: Thu, 20 Jul 2023 08:04:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Dave Chinner <dchinner@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>, Jan Kara
 <jack@suse.cz>, Damien Le Moal <dlemoal@kernel.org>, Ming Lei
 <ming.lei@redhat.com>, Min Li <min15.li@samsung.com>, Christian Loehle
 <CLoehle@hyperstone.com>, Adrian Hunter <adrian.hunter@intel.com>, Hannes
 Reinecke <hare@suse.de>, Jack Wang <jinpu.wang@ionos.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Yeqi Fu <asuk4.q@gmail.com>, Avri Altman
 <avri.altman@wdc.com>, Hans de Goede <hdegoede@redhat.com>, Ye Bin
 <yebin10@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 4/6] mtd: blkdevs: set GENHD_FL_NO_NVMEM
Message-ID: <20230720080409.734a312f@xps-13>
In-Reply-To: <65171d5da3daba24315ecdfef6727442baae5bbf.1689802933.git.daniel@makrotopia.org>
References: <cover.1689802933.git.daniel@makrotopia.org>
	<65171d5da3daba24315ecdfef6727442baae5bbf.1689802933.git.daniel@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_230425_479928_C9499A6F 
X-CRM114-Status: GOOD (  14.81  )
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

SGkgRGFuaWVsLAoKZGFuaWVsQG1ha3JvdG9waWEub3JnIHdyb3RlIG9uIFdlZCwgMTkgSnVsIDIw
MjMgMjM6MDM6MjQgKzAxMDA6Cgo+IEFzIHRoZSBNVEQgc3Vic3lzdGVtIGFscmVhZHkgYWN0cyBh
cyBhbiBOVk1FTSBwcm92aWRlciwgZW11bGF0ZWQgbXRkYmxvY2sKPiBkZXZpY2VzIHNob3VsZCBu
b3QgYmUgY29uc2lkZXJlZCBOVk1FTSBwcm92aWRlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIEdvbGxlIDxkYW5pZWxAbWFrcm90b3BpYS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL210
ZF9ibGtkZXZzLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMgYi9kcml2ZXJzL210ZC9tdGRf
YmxrZGV2cy5jCj4gaW5kZXggZmYxODYzNmUwODg5Ny4uODJkNWFmYmE2YTI1YSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbXRkX2Js
a2RldnMuYwo+IEBAIC0zNjIsNiArMzYyLDcgQEAgaW50IGFkZF9tdGRfYmxrdHJhbnNfZGV2KHN0
cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICpuZXcpCj4gIAkJZ2QtPmZsYWdzIHw9IEdFTkhEX0ZMX05P
X1BBUlQ7Cj4gIAl9Cj4gIAo+ICsJZ2QtPmZsYWdzIHw9IEdFTkhEX0ZMX05PX05WTUVNOwo+ICAJ
c2V0X2NhcGFjaXR5KGdkLCAoKHU2NCluZXctPnNpemUgKiB0ci0+Ymxrc2l6ZSkgPj4gOSk7Cj4g
IAo+ICAJLyogQ3JlYXRlIHRoZSByZXF1ZXN0IHF1ZXVlICovCgpBY2tlZC1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
