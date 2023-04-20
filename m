Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D6CC77B72
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Apr 2023 04:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZufJpJr1yjM6LCQVFkGikJ8C23zrl3N8Kzf1hhQp5g=; b=yxpbEKwWd8FqUSXEZYxYXs61O8
	8+rO6NJ5W7/AFdSx9ItqC+4gWwm6Uc9P2SDwKwC2qUYa62t8Lx5pYIm6bv3nWmqpvRN6/oKJNHK+/
	88ADa4kzNX5WNiMNa0qyvq/guUa2BOvLGBk774sUrFVEFH3olLZdZN5H8YBt8jnF9/epOkMWzaUCE
	/UH8aC2yVNNu5BFouyzekhD5nvdPrB1aZEhAvJboFIqg0Vs3Dp65QDRXaKxqI8GEsm4lz1InTakqG
	IMIo0VcYiEhMAfpgHjqDVynt3OEct7uixFLyJ8Z3leYjpMDl03UN20hkl65y4NBI1AYFTPWIPkOAs
	9Dn3md/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppMEk-0072tt-2F;
	Thu, 20 Apr 2023 04:49:38 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppMEi-0072sT-0C
	for linux-mtd@lists.infradead.org;
	Thu, 20 Apr 2023 04:49:38 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Q24t53Py4z8xD1;
	Thu, 20 Apr 2023 12:48:29 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 12:49:21 +0800
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
To: Richard Weinberger <richard@nod.at>, Yu Hao <yhao016@ucr.edu>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com>
 <CA+UBctDsHRpkLG5ppdiuV8Msn4Dx-ZJ2xDrxfa48VMb7ZE+xBA@mail.gmail.com>
 <687864524.118195.1681799447034.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ff419c45-7d76-0219-a598-f6f4d081e29c@huawei.com>
Date: Thu, 20 Apr 2023 12:49:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <687864524.118195.1681799447034.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_214936_283868_89158AE1 
X-CRM114-Status: UNSURE (   8.97  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkKPiBZdSBIYW8sCj4gCj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246
ICJZdSBIYW8iIDx5aGFvMDE2QHVjci5lZHU+Cj4+PiB1Ymk6IG10ZDAgaXMgYWxyZWFkeSBhdHRh
Y2hlZCB0byB1YmkwCj4+PiB1Ymk3OiBhdHRhY2hpbmcgbXRkMTQ3Cj4+PiBkaXZpZGUgZXJyb3I6
IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBLQVNBTgo+Pj4gQ1BVOiAwIFBJRDogMjAwMjMgQ29tbTog
c3l6LWV4ZWN1dG9yLjAgTm90IHRhaW50ZWQgNi4yLjAgIzYKPj4+IEhhcmR3YXJlIG5hbWU6IFFF
TVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TCj4+PiAxLjEzLjAtMXVi
dW50dTEuMSAwNC8wMS8yMDE0Cj4+PiBSSVA6IDAwMTA6bXRkX2Rpdl9ieV9lYiBpbmNsdWRlL2xp
bnV4L210ZC9tdGQuaDo1ODAgW2lubGluZV0KPj4+IFJJUDogMDAxMDppb19pbml0IGRyaXZlcnMv
bXRkL3ViaS9idWlsZC5jOjYyMCBbaW5saW5lXQo+Pj4gUklQOiAwMDEwOnViaV9hdHRhY2hfbXRk
X2RldisweDc3Zi8weDJmZTAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmM6OTU1Cj4+PiBDb2RlOiBm
YyBmZiBkZiA0OCBjMSBlYSAwMyAwZiBiNiAxNCAwMiA0YyA4OSBmMCA4MyBlMCAwNyA4MyBjMCAw
MyAzOAo+Pj4gZDAgN2MgMDggODQgZDIgMGYgODUgMWYgMjUgMDAgMDAgNDEgOGIgNGMgMjQgMTAg
NDggODkgZDggMzEgZDIgPDQ4PiBmNwo+Pj4gZjEgNDggODkgYzMgZTggYjYgZjMgMWIgZmMgNDgg
OGQgODUgNDAgMTcgMDAgMDAgNDggODkgYzIgNDgKPj4+IFJTUDogMDAxODpmZmZmYzkwMDBiZTBm
ZDMwIEVGTEFHUzogMDAwMTAyNDYKPj4+IFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IDAwMDAw
MDAwMDAwMDAwMDAgUkNYOiAwMDAwMDAwMDAwMDAwMDAwCj4+PiBSRFg6IDAwMDAwMDAwMDAwMDAw
MDAgUlNJOiBmZmZmODg4MDQ3YTQ5ZDQwIFJESTogMDAwMDAwMDAwMDAwMDAwMgo+Pj4gUkJQOiBm
ZmZmODg4MDI0ZTFjMDAwIFIwODogMDAwMDAwMDAwMDAwMDAxNiBSMDk6IGZmZmZmNTIwMDE3YzFm
NDcKPj4+IFIxMDogZmZmZmM5MDAwYmUwZmEzNyBSMTE6IGZmZmZmNTIwMDE3YzFmNDYgUjEyOiBm
ZmZmODg4MDY1NDVhMDAwCj4+PiBSMTM6IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiBmZmZmODg4MDY1
NDVhMDEwIFIxNTogMDAwMDAwMDAwMDAwMDAwNwo+Pj4gRlM6ICAwMDAwN2ZkNDVlODVjNzAwKDAw
MDApIEdTOmZmZmY4ODgwMmNhMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+Pj4g
Q1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo+Pj4gQ1Iy
OiAwMDAwN2Y2NGFlZWY1M2E0IENSMzogMDAwMDAwMDA0ZjM5YTAwMCBDUjQ6IDAwMDAwMDAwMDAz
NTBlZjAKPj4+IENhbGwgVHJhY2U6Cj4+PiAgIDxUQVNLPgo+Pj4gICBjdHJsX2NkZXZfaW9jdGwr
MHgzMDMvMHgzYTAgZHJpdmVycy9tdGQvdWJpL2NkZXYuYzoxMDQzCj4gCj4gV2hhdCBraW5kIG9m
IE1URCB5b3UgYXR0YWNoaW5nPwo+IEhhcyBpdCBlcmFzZXNpemUgMD8KPiAKClllcywgSSBhZ3Jl
ZSB3aXRoIFJpY2hhcmQncyBwb2ludCwgSSBndWVzcyBVQkkgZ290IGFuIG10ZCBkZXZpY2Ugd2l0
aCAKemVybyBlcmFzZXNpemUuCgoKICA1Njggc3RhdGljIGlubGluZSB1aW50MzJfdCBtdGRfZGl2
X2J5X2ViKHVpbnQ2NF90IHN6LCBzdHJ1Y3QgbXRkX2luZm8gCiptdGQpCiAgNTY5IHsKICA1NzAg
ICAgICAgICBpZiAobXRkLT5lcmFzZXNpemVfc2hpZnQpICAgICAgIC8vIGVyYXNlc2l6ZV9zaGlm
dCBpcyAwCiAgNTcxICAgICAgICAgICAgICAgICByZXR1cm4gc3ogPj4gbXRkLT5lcmFzZXNpemVf
c2hpZnQ7CiAgNTcyICAgICAgICAgZG9fZGl2KHN6LCBtdGQtPmVyYXNlc2l6ZSk7ICAgIC8vIGVy
YXNlc2l6ZSBpcyAwIHRvbwogIDU3MyAgICAgICAgIHJldHVybiBzejsKICA1NzQgfQoKWXUgSGFv
LCBob3cgZG8geW91IGZpbmQgdGhlIHByb2JsZW0sIGJ5IHN5emthbGxlcj8gQ2FuIHlvdSBwcm92
aWRlIHRoZSAKcmVwcm9kdWNpbmcgcHJvZ3JhbSBvciByZXByb2R1Y2luZyBsb2c/CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
