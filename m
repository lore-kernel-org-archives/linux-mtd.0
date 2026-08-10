Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00C1C5AD7B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8fICP4YWYVxdIBE5CiyFTpWD9Vddxl8rDsQovHt21c=; b=zIol2Y1vODkBWm
	IhuQZ/eNCvNG3V8sX7ZzzH0HPSvSK8vsKnRtNX4YW/87fh8fIx5MGO4MGLAjK6CMhN+9PrKs3eOvC
	pTu0U++mtgGT44dvvtvLRuOv7j9HCnJJrW+RYP7rxbV7HMeN68MXRfN/dFBZWT2DDbejKcNkwhueh
	W8Rc3z1HDP7PrAWMT4rk4qCfmeNXw1YmVcyP/oSDSV34rvBJ1hqPfN7Sithp87Y8pYSX1p3tyMOSW
	7MV5GcV15zisl4FsO4zg42Xlk1QT58Xhy93WKU3+3LnVbDMnKBnz682+gyIFpVGHOl8jFGZg6jzWx
	dxCuv7DApTFE/ZhQSNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPJ3-0000000BnPc-342d;
	Mon, 10 Aug 2026 12:40:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPIz-0000000BnO6-3Kyf
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 12:40:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F6BC4E41178;
	Mon, 10 Aug 2026 12:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 131BE6033B;
	Mon, 10 Aug 2026 12:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 781BE11C4A525;
	Mon, 10 Aug 2026 14:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786365633; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GVCufjwBFEQLygR4gzQm68S9YYyK6w05FacHTuX+iU8=;
	b=AXW2B5Wby41oU31q9hYPSlgVRWZSheAys6ZRoWFoMQfTCSnz76qH7hHfFNAAvw8YCwzCqZ
	e28hf51ASvLxeco7epFHk3h3ogsdHP82yTG7LZIpZKbxm5X64fnOC/fha1j3FWcBW4O54E
	B2joqctmZNdNX/IUI32ED89JBkopArVXNdVxMbTvJM403VxU0q/8EvGQTBHwoK4HYyM5he
	TTiFoyaIIZf5CQKEEQp+UoCRZJ0z/WFfuqWMG7aIj4k+UTOzi11XvKD8lD66Pc38hed/1Z
	+yea01Xq+idWWcnnRa/m4kCoWflabCivVetF97ayphAd5t7ICBN0HskZ6SLkCA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: =?utf-8?Q?J=C3=B6rn?= Engel <joern@barelysecure.org>,  syzbot
 <syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com>,
  joern@lazybastard.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  richard@nod.at,
  syzkaller-bugs@googlegroups.com,  vigneshr@ti.com
Subject: Re: [syzbot] [mtd?] divide error in block2mtd_setup2
In-Reply-To: <29397db9-7db4-4969-bb0e-5bb71f0c0303@kylinos.cn> (Pei Xiao's
	message of "Mon, 10 Aug 2026 17:17:50 +0800")
References: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
	<ankxaiwtTltL0xMj@cashel.logfs.org>
	<29397db9-7db4-4969-bb0e-5bb71f0c0303@kylinos.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 10 Aug 2026 14:40:28 +0200
Message-ID: <87se4mqhc3.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_054037_989645_0240D5B9 
X-CRM114-Status: UNSURE (   6.43  )
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

SGkgUGVpLAoKPj4gQmVzdCBndWVzcyB3b3VsZCBiZSB0aGlzOgo+PiAKPj4gCWlmICgobG9uZylz
aXplICUgZXJhc2Vfc2l6ZSkgewo+PiAKPj4gU29tZW9uZSBwYXNzaW5nIGFuIGVyYXNlX3NpemUg
b2YgMCB3b3VsZCBpbmRlZWQgdHJpZ2dlciBhbiBleGNlcHRpb24uCj4+IEZpeCB3b3VsZCBiZSBz
b21ldGhpbmcgbGlrZSB0aGlzOgo+PiAKPj4gLQlpZiAoKGxvbmcpc2l6ZSAlIGVyYXNlX3NpemUp
IHsKPj4gKwlpZiAoIWVyYXNlX3NpemUgfHwgKGxvbmcpc2l6ZSAlIGVyYXNlX3NpemUpIHsKPj4g
Cj4+IEkgaGF2ZW4ndCB0b3VjaGVkIHRoZSBjb2RlIGlzIG5lYXJseSB0d28gZGVjYWRlcy4gIElm
IHNvbWVib2R5IGVsc2UKPj4gZmVlbHMgbGlrZSBzZW5kaW5nIGEgcGF0Y2ggYW5kIGdhdGhlcmlu
ZyBhbGwgdGhlIGdsb3J5LCBwbGVhc2UgYmUgbXkKPj4gZ3Vlc3QhCj4gVGhhbmsgeW91IGZvciB5
b3VyIGNvbnRyaWJ1dGlvbi4gSSBoYXZlIHNlbnQgdGhpcyBwYXRjaCwgYnV0IEkgZm9yZ290IHRv
Cj4gYWRkIHRoZSBTdWdnZXN0ZWQtYnk6IHRhZwoKWW91IGFyZSBpbnZpdGVkIHRvIHNlbmQgYSB2
MiB3aXRoIHRoZSBzYWlkIHRhZyA6KQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
