Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BF4C77B78
	for <linux-mtd@archiver.kernel.org>; Thu,  4 May 2023 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wwgEE0KVA7RCtzfPa3enm+PGyAlf1ATWdv6sbVAwgE=; b=EMUQU8CVkSkeJm
	Rfr4saS1oP5KNrkbT3LZ4RUVx8SE06ngubtf72vCS6v8WGPyv7ca9ce7EqicBO67mJo/v8X8xD/Zl
	DxvzkOu51BFkgQPtqs5k7NR7g5eoIDWpkc1Rr5oY6dvzt7dh5IcvgBYJFGqt7/D0jRG5VUpxNqqk3
	W9zGt9qaC9rCk0Nsf+ROxSyE/IC2EjxBlobZbAWcd9Yt0nNLP7m9EPADCN6uEfQijsyFkz+70hXd8
	k5/3nZ7KwQu6/WmyBWPK3fD37ALpeNyq37/VQPO1REDdklNmL+sT/RyTpAlBP0vL2A2Yvy57jxDVX
	66vRngpmgbTiNiKznPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puXOT-007iEy-1o;
	Thu, 04 May 2023 11:45:05 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puXOP-007iDL-01;
	Thu, 04 May 2023 11:45:02 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C79E05FD07;
	Thu,  4 May 2023 14:44:58 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683200698;
	bh=zlx3A3BVx/dl0hS9R9OXckSekBXp6h6Ujph1fV5k0tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=jXx2fpdkhyn/mJuvKMaINlyC/LhvExZ4EM1l1dt+B6nLwzH5IsUEpGxMkjabWGTHv
	 4cSxI5R4AKfBoEP4DUdqcw7fkUr4QLXF3RJhbyylmSo3KhiEskfQNgBZQjNURXFIUA
	 BePFIBb+Na/3OWAL45/tY/nDqWRIDcgJieZCLAjMDubVzKlY58mcKdCT+cTg2l+pi/
	 WmXkE++daVHyBt3Io/LaNrcdhXZoSP87MarXz+8zFEQdhcsFscKo1CUuI1J+dTkR7s
	 +J06ls8zC8o2WJJj1MOdb1qvB9xICJnuT7PQn4GQWHJYSORrj5G/4vUb46+fAbLyeV
	 YQxxhQ6KgvUIw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  4 May 2023 14:44:58 +0300 (MSK)
Message-ID: <213a4f8d-b660-8644-87ad-3791d95cafc2@sberdevices.ru>
Date: Thu, 4 May 2023 14:40:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
To: Richard Weinberger <richard.weinberger@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, yonghui.yu <yonghui.yu@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
 <e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
 <20230418152505.72fc16da@xps-13>
 <15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
 <ee10bdeb-416c-70f0-d323-7107fe0746e8@amlogic.com>
 <5e4b395e-bf9d-0123-a0f2-2b378d950b29@sberdevices.ru>
 <fda1ae91-4bf8-6945-bd0d-b6dabc9cb4bd@sberdevices.ru>
 <a5010dcf-a8ce-f144-949c-687548cefce7@amlogic.com>
 <cf27b6b4-a75b-c5a6-32ea-ac20a2984192@sberdevices.ru>
 <20230502115913.78012d98@xps-13>
 <2274b432-d1a9-b3cf-4f7b-08c4a4c580b5@sberdevices.ru>
 <20230502132745.14349770@xps-13>
 <2b2f5cb4-84f7-65f6-13b2-42f965503023@sberdevices.ru>
 <20230502141703.29f0bc30@xps-13>
 <91cb8e19-e782-b847-8d2b-22580c371c34@sberdevices.ru>
 <20230502150553.65fdeb7f@xps-13>
 <8996d53c-54ff-6a37-e08b-95cae0629703@sberdevices.ru>
 <20230503100342.63215058@xps-13>
 <CAFLxGvwfi2RH3y2M6n0vqUHarp6DwR-wT7oBto3raA7oC3nJvg@mail.gmail.com>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <CAFLxGvwfi2RH3y2M6n0vqUHarp6DwR-wT7oBto3raA7oC3nJvg@mail.gmail.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/04 08:37:00 #21217417
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_044501_398242_287CCFE2 
X-CRM114-Status: GOOD (  15.01  )
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

CgpPbiAwMy4wNS4yMDIzIDIyOjQ4LCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gU29ycnkg
Zm9yIGpvaW5pbmcgdGhlIHBhcnR5IGxhdGUuCj4gCj4gT24gV2VkLCBNYXkgMywgMjAyMyBhdCAx
MDowN+KAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3Rl
Ogo+Pj4gU28gZm9yIG1lIG1haW4gcXVlc3Rpb24gaGVyZSBpczoKPj4+Cj4+PiBIb3cgSkZGUzIg
c2hvdWxkIHdvcmsgd2l0aCBjb250cm9sbGVycyB3aGVyZSB3ZSBjYW4ndCB1cGRhdGUgZGF0YSBh
bmQgT09CCj4+PiBpbmRlcGVuZGVudGx5PyBEcml2ZXIgb2YgdGhpcyBmaWxlc3lzdGVtIGtub3dz
IG5vdGhpbmcgYWJvdXQgdGhpcyBmZWF0dXJlcyBvZgo+Pj4gdGhlIGNvbnRyb2xsZXIuCj4+Pgo+
Pj4gT3IgSkZGUzIgd29ya3MgaW5jb3JyZWN0bHkgaW4gbXkgY2FzZSB3aGVuIGl0IHRyaWVzIHRv
IGNhbGwgd3JpdGUgcGFnZSBjYWxsYmFjawo+Pj4gYWZ0ZXIgY2FsbGluZyB3cml0ZSBPT0IgY2Fs
bGJhY2sgKElJVUMgaXQgaXMgYmV0dGVyIHRvIGFzayBSaWNoYXJkIGFzIFlvdSBtZW50aW9uZWQg
YWJvdmUpLgo+Pj4KPj4+IE9yIG1heSBiZSBpdCBpcyBiZXR0ZXIgdG8gc3VwcHJlc3MgT09CIHdy
aXRlIGNhbGxiYWNrIChvciBzZXQgaXQgdG8gTlVMTCkgaW4gdGhpcwo+Pj4gZHJpdmVyIGFzIGlu
IHZlbmRvcidzIGRyaXZlcj8KPj4KPj4gSSB3b3VsZCBhc3N1bWUgdXNpbmcgdGhlIHVucHJvdGVj
dGVkIGZyZWUgT09CIGJ5dGVzIHRvIHN0b3JlIHRoZQo+PiBjbGVhbm1hcmtlcnMgc2hvdWxkIHdv
cmsuIEJ1dCB0aGF0J3MgYSBiaXQgZnJhZ2lsZSBhbmQgdmVyeSBmaWxlc3lzdGVtCj4+IG9yaWVu
dGVkLiBJIGRvbid0IGxpa2UgdGhpcyBtdWNoLiBCdXQgb24gdGhlIG90aGVyIHNpZGUgSkZGUzIg
aXMKPj4gbGVnYWN5LCB5b3Ugc2hvdWxkIHVzZSBVQkkgKHdoaWNoIGRvZXMgbm90IHBsYXkgd2l0
aCBPT0IgYXJlYXMpIDotKQo+IAo+IFBsZWFzZSBub3RlIHRoYXQgSkZGUzIncyBtYWluIHVzZSBj
YXNlIGlzIE5PUiBmbGFzaC4gU3VwcG9ydCBmb3IgTkFORAo+IGZsYXNoIHdhcyBuZXZlcgo+IGNv
bnNpZGVyZWQgYXMgZnVsbHkgY29tcGxldGUvc3RhYmxlLiBUaGF0J3Mgd2h5IFVCSUZTIChKRkZT
MyBpbiB0aGUKPiB2ZXJ5IGJlZ2lubmluZykKPiB3YXMgaW52ZW50ZWQuCgpIZWxsbyBSaWNoYXJk
IQoKVGhhbmtzIGZvciB0aGlzIGRldGFpbHMhIEJ1dCBJIHRoaW5rIGl0IHdpbGwgYmUgdXNlZnVs
IHRvIG1ha2UgSkZGUzIgd29yayBjb3JyZWN0bHkKb24gdGhpcyBjaGlwIDopIEFueXdheSBpIHRo
aW5rIGl0IGlzIG5vdCByYXJlL2V4b3RpYyBjYXNlIHRvIHVzZSBKRkZTMiBvbiBOQU5ELgoKVGhh
bmtzLCBBcnNlbml5Cgo+IAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
