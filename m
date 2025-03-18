Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F79DC28B28
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXgEdI/AAG7LMrg8Hoq80zhD8ZMBbgejIgZWPY2iB6c=; b=zyB8w1Qu3rHoZX
	2UBtfdgOD6ewcj9I9AklV9z8tixq3M8GTux2c5okULnd37NillxILDhK+KRGLgR9/S996mjVawX/k
	YSijaFxQIeFwNhLBt7XuexugwzHvBWbD1r4zwNAqzixzTGwb/3xDLDCb/AVovcdCXvs9cnoN5F35E
	GqulRPPQVEaKVb6votrAZw358QjyITyx1E87wMpP8nsddpf7L0tqjyU1bV3jJnVhQmoIixLHPPxn9
	aOLplxfnLWhHZm6CUgdttpIAGA7mBmaIjZY1TweCJSz3hPKgdjKBt5ek8BKtjZtsUIXvbKGYIFKUI
	sGarlDUvWjQP79AVSj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVkw-00000005pzn-08pF;
	Tue, 18 Mar 2025 12:09:14 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVfX-00000005oyw-2n80
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 12:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742299404; x=1742904204; i=markus.elfring@web.de;
	bh=ZmW+vLInL4TVw3R6aLHnH+2nNOzUGxFUKwW2uHXTgP0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=L7Wg0P2djKNFAD+O3Q4ZHqvrvUPLNcIejMj0ZeqsYJMtm/Fc8us2LOJ7r015w35M
	 KdNfqQfvp1fTspYyTtwT+KP6RQA8rTLVJDtcfsJXEb8KR4on6ypnyvuw3rfBZQIrn
	 ZZFgkyqM469cpFP9dEzwK98LbWBvifBSnKiIwmA2lnppZZR7/cXKnT6GOjUjdnvvk
	 pkCpToHBCYWJlIiQ8QyBB0+LvXeZ0joFIr/aIQabV5b7Xfd6txQRelnrHqbHF8rXB
	 EHWu9pA7XAKt3s59KS22C/rDb0Sg0twPoTV3gjX409P9MdJM/1gypkelckwdCp6oQ
	 C9fZYMYJ5TknFGmV3w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.69]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mi4yz-1tGn8P2vqb-00gpfH; Tue, 18
 Mar 2025 13:03:24 +0100
Message-ID: <bf19c4f4-5ed5-4210-b123-92f79d27d6e7@web.de>
Date: Tue, 18 Mar 2025 13:03:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mtd: cfi_cmdset_0001: Fix exception handling in
 cfi_intelext_setup()
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 cocci@inria.fr, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <3675f707-bff0-3caf-29a2-b99e5b9c6554@web.de>
 <d7b2c8ac-e052-4b93-964b-4cc58a459ba0@web.de> <87o6xyab2r.fsf@bootlin.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <87o6xyab2r.fsf@bootlin.com>
X-Provags-ID: V03:K1:MPLm0VzdlVlkA1TXNIOswRWGxRtA2+1bMmklnR4aPrxPWMr3Kf1
 CZZtRDu4IfbAjT2N0xiw4T3bz4HqMQ9Kb4smmMzg8HfiFF+vpjS4qscsSbgrEL8hwb6sfu/
 GNL09pdf3gx4eH2m3b+TYvjv0Jhnhbse3LC0KyibcyQ3BezfHu9NpP0HYz5xAeb8TljbnTZ
 dStNLKYXTiPBMcwTjHnyQ==
UI-OutboundReport: notjunk:1;M01:P0:dgWHoFijdxI=;nNogpUYmWqfRtvqVrL3ZzCSY+ov
 fdNZHYsKx7QloW5WopqUncWZCZvpT64zD7g6jW4Rr8z3ezVgpwOtaykrijwjjs/TSwE5XMsge
 Cvqe8Qz8Vi7+13bQCTrIF3xo37KGM0sc6CuoN8/WPtd5XhaCUzwFJV+qCsUbGCM2sLsg1/ttI
 /9PdRALH7wc5aE9TLH6yow4kVFlXMbHSr9O506Pp+I8kBWH+2nXoGfDG1TTcKuCEjKhcog3cC
 L2C1S9QY7kKdnKdHjKD17wqAsX6V98H1sTTRyPwc7Zi1emq2Cm6ZDDedsGfaT8PqEL10WlVw/
 zgK/I2LoxPYdEW1yqkqb4JYD9iAVf+LOkSoLsS6pbsnnzw1nyp0wiU9IZeLwBpOkl1ZmOSBQm
 bQ3WzozxW001mj4+oemclwY5mmi/kUD4AKVorupai1zkbxpkDWwIG7ElTjTnfvB0pNKSoXEXR
 2vq+5zuWL4vsgLp2oFebCr1tL/DAaTsHjPZ82fPV4QHZBojI73b7xwOCejbdjcqd7stP7QdvK
 kSY6yeCJdKk4ZUiMovMCdZ0101qMil+U3nLynYWhj9VJesc3zrozrMJ/PaJLnUEConlAasujD
 9ySrN6rV9D8NlcTPUV4CGBaeG/7pSWsYSeqtXt3WRe8Gg//iqK7BuhCMttZEqR/upNn1aNNqC
 lurBqqbBO4f/CsqTZEi6ZFQd10OFRjXVPPvndFJPg0a3Gm6vEU7UB0WsGIpuPJWyo3jYcl69E
 P/aDcZjlTEZy6A7STh+jifGrtAgpkwLTzoyqKt4Ju5WPt6Wwksqn4SbtRe6QXK4KESczCDO4T
 VWJiIXmY6n2ixeDbySYfJvoBwJ//rH6PFSbwK9T18v8gIrqc6Z8zqY0oR1K/+PklJqd7YnMJO
 m0rgGd8EHhuaDd5LpXBQIeI22aqj5135lWv4cDLblgfklcJz8VpfRlr22aoVkuZb3tf/06U61
 gzqiXMFhL2MH45Zx+ey80HvbnAHnofRmPhSLt/fUoysIZr6Ndm3BXFko4RuTUNdR/X2CzQLRx
 wUAdw2A6XzteVSrwNjEoP9vv7nHUQWzPXtVi+Ff1YWXhGNihDFW3XB+5zlUOGZBIoJkdn0zNr
 wdaK8/qFzJxpGzemwDGnujRB0fw9jUFStSBtHwvLfSOpNrE4awVmsFzox1imb/lRqWJK+MYKG
 shV+ZeWCxWx/DbRLxIq6G6os754LOYwVXzslOSptOGwM3G4ro3cJWEG2ytxFCAjzHEYGqWfXk
 E4lzHqW6Hh07S/qzClpTqF9QTMIOoS1Dngq++zGHt6QNY965Q5W7Pt0aePyUrU22ILVYRcFZC
 +zhTTJ4bnGUHA8jC20Lq5qzU/8bQjb/lKVZQZCU0PyUeM4tv2czblXi82vRM3HAiHHHjfekJq
 8vGnhp/xZLv78SYmG3fseLT5zarvjZCWOmTm+pGTxlIzZHe3un4DZGnMXCE6Ty9ruBDuc2yqH
 RsvVU/Pkbhfz80C9ye8vVGzRzoFZzwKJqcIqKMiRToEzGBw+b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_050340_069994_9CAB37C8 
X-CRM114-Status: UNSURE (   7.38  )
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

Pj4gVGhlIGxhYmVsIOKAnHNldHVwX2VycuKAnSB3YXMgdXNlZCB0byBqdW1wIHRvIGFub3RoZXIg
cG9pbnRlciBjaGVjayBkZXNwaXRlIG9mCj4+IHRoZSBkZXRhaWwgaW4gdGhlIGltcGxlbWVudGF0
aW9uIG9mIHRoZSBmdW5jdGlvbiDigJxjZmlfaW50ZWxleHRfc2V0dXDigJ0KPj4gdGhhdCBpdCB3
YXMgZGV0ZXJtaW5lZCBhbHJlYWR5IHRoYXQgYSBjb3JyZXNwb25kaW5nIHZhcmlhYmxlIGNvbnRh
aW5lZAo+PiBhIG51bGwgcG9pbnRlciBiZWNhdXNlIG9mIGEgZmFpbGVkIG1lbW9yeSBhbGxvY2F0
aW9uLgo+Cj4gQ2FuIHlvdSBwbGVhc2UgcmVwaHJhc2UgdGhlIGNvbW1pdCBsb2c/IEl0IGlzIHN1
cGVyIGhhcmQgdG8gdW5kZXJzdGFuZC4KV2hpY2ggd29yZGluZyB2YXJpYW50IHdvdWxkIHlvdSBm
aW5kIG5pY2VyIGZvciBwcm92aWRlZCBpbmZvcm1hdGlvbj8KCiogdXNlZCBqdW1wIHRhcmdldHMK
CiogbnVsbCBwb2ludGVyIGFzc2lnbm1lbnRzCgoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
