Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D351C6FD1D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5jhJD2BT2dbU5Bz7YshAqplWFA2PLaa+h4zLTPN208=; b=uVfQu2YXRvFgQF
	dTeF51vm4tZ9Kc46q98Im7cXlMNc8V/huYqi8aTjZvstQxhsDN5S6sAyRJb5RkDYtt4k2qVC2gNAS
	zhYuUJGoQKiPKVlOTYOxzCB22VbtQPyXwF0oQhovin/fo58/AGBgLmCSFn/wHYqr3tgbK1SqH+7be
	QDAAqhO8OgtC59nHOOUg3H4iS3sWbwMfG566gZZ9qQw2ESVMn0LMWr6d/lSK6gwsCp6ndJQG7jFCz
	+d3a2S8ZYazi6Kpilv9z0W/yZD0qwda8MILUtjTbsNrD7CNhYAaEMMpL97ccchy2vAl4TcFwzrRO+
	UWcO59RbaWILIwY3F7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDjA-008pCC-0S;
	Mon, 20 Mar 2023 11:31:00 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDj5-008pBS-0x;
	Mon, 20 Mar 2023 11:30:57 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A71C05FD11;
	Mon, 20 Mar 2023 14:30:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679311851;
	bh=mhNTaHeLzsk1HXgLUGJbb0lrEbiczjFN7BA22rqS9Dk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=nV4woBe+8aZHrSnq/vzub1yq/dvrl60wWv1cdQO1RWciCybeDaIp2F+EWM2fPb8ND
	 YCjfyC4Lwt+pM/+mRaKBs51MiMHxkwWssQKZlGJpg36xpFWlGrO5r7b5DNe3BWTmsR
	 NU9lLuY5hFCQY/mkhjGzJRXjWtBe68DEBJRCfH2Q4HnNxNGyZOXDT/24uphhlwYJ3n
	 k08z4kOFWidVwvxjpOWUmxZh3DUkuqUXnWOFL3STHh3wKjDbPwsl9YLohPYd5b8vN6
	 NVS05h6oEGYUKfFLE1Bl2x6aI0ttBrDz79MdDb5TwQE+gfmwdR2IAScXQSwN/0HB0d
	 51njr403RXOtA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 20 Mar 2023 14:30:49 +0300 (MSK)
Date: Mon, 20 Mar 2023 14:30:48 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Arseniy Krasnov
	<avkrasnov@sberdevices.ru>, Liang Yang <liang.yang@amlogic.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>, <oxffffaa@gmail.com>
Subject: Re: [RFC PATCH v1] mtd: rawnand: meson: invalidate cache on polling
 ECC bit
Message-ID: <20230320113048.3mry647oq33zfmag@CAB-WSD-L081021>
References: <d4ef0bd6-816e-f6fa-9385-f05f775f0ae2@sberdevices.ru>
 <20f7f1f8-e8f8-b3e1-251e-27db71ab6840@sberdevices.ru>
 <20230313121808.27170d1b@xps-13>
 <dc46c06f-6b36-3c1c-bf96-2ef37e29dfdb@linaro.org>
 <20230320104314.i2stk665xbrleb53@CAB-WSD-L081021>
 <20230320115558.49c5a062@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320115558.49c5a062@xps-13>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/20 09:56:00 #20977321
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_043055_883124_CA06FB52 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gTWlxdcOobCwKCk9uIE1vbiwgTWFyIDIwLCAyMDIzIGF0IDExOjU1OjU4QU0gKzAxMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgRG1pdHJ5LAo+IAo+IGRkcm9rb3NvdkBzYmVyZGV2
aWNlcy5ydSB3cm90ZSBvbiBNb24sIDIwIE1hciAyMDIzIDEzOjQzOjE0ICswMzAwOgo+IAo+ID4g
SGVsbG8gZ3V5cyEKPiA+IAo+ID4gV2FzIGl0IGFwcGxpZWQgdG8gc29tZSBuYW5kICdwcmVwYXJl
LWZvci1tZXJnZScgcmVsZWFzZSBicmFuY2g/Cj4gCj4gTm90IHlldCwgSSdsbCBhcHBseSBpdCB0
aGlzIHdlZWsgaW4gbXRkL2ZpeGVzLCB5b3UnbGwgYmUgbm90aWNlZC4KPiAKPiBUaGFua3MsCj4g
TWlxdcOobAo+IAoKVGhhbmsgeW91IGZvciBjbGFyaWZpY2F0aW9uIQoKWy4uLl0KCi0tIApUaGFu
ayB5b3UsCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
