Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8099C77B71
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 06:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BDt4DyieU9BR6Brx4oNKnsjpg5IKqyyGz1AQAPG9itw=; b=DLwABfJfpYGH6Zc7FKr0r5YY4Y
	kJGY1xYCjOP7zCtK5hxTzrjxbjxHz+6fR5fuIfMRdV+i1VPefiedD6BMHfpaH+r6mvntdSLvJ8I9a
	qUMb7Kp6/cWt9rrDJ51+CjnoZviNj+3m/x+YrMYWeNK9aI45VwQBmjADNx7Fpquy65Jr92j7qwp0f
	tS1+HpckI1HmzMGrHLTlTbJCETFvrzP2YTus6uzL2LIh1hMmjf/viYqH4iFtwadCq0//A+b+OHVic
	XT5A62r8QXqE4clvrgK0ZNh7a2/JC7nattYOu1E0bXR3tdJlD6V4XqxQs0mcsMAaVGy/D/56GAI8z
	uVP3Cecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poerf-000zeP-24;
	Tue, 18 Apr 2023 06:30:55 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poerc-000zda-0F
	for linux-mtd@lists.infradead.org;
	Tue, 18 Apr 2023 06:30:54 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 96AFB64551DF;
	Tue, 18 Apr 2023 08:30:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id CZCQMMmRb5xL; Tue, 18 Apr 2023 08:30:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3B1826431C28;
	Tue, 18 Apr 2023 08:30:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hc7I4qRsRMGG; Tue, 18 Apr 2023 08:30:47 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 216AA64551DF;
	Tue, 18 Apr 2023 08:30:47 +0200 (CEST)
Date: Tue, 18 Apr 2023 08:30:47 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Yu Hao <yhao016@ucr.edu>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <687864524.118195.1681799447034.JavaMail.zimbra@nod.at>
In-Reply-To: <CA+UBctDsHRpkLG5ppdiuV8Msn4Dx-ZJ2xDrxfa48VMb7ZE+xBA@mail.gmail.com>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com> <CA+UBctDsHRpkLG5ppdiuV8Msn4Dx-ZJ2xDrxfa48VMb7ZE+xBA@mail.gmail.com>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: divide error in ubi_attach_mtd_dev
Thread-Index: k4bIGdcIRmBd/MSU/l20Gs+2lMcsjQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_233052_281664_7742B16E 
X-CRM114-Status: UNSURE (   3.88  )
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

WXUgSGFvLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIll1IEhhbyIg
PHloYW8wMTZAdWNyLmVkdT4KPj4gdWJpOiBtdGQwIGlzIGFscmVhZHkgYXR0YWNoZWQgdG8gdWJp
MAo+PiB1Ymk3OiBhdHRhY2hpbmcgbXRkMTQ3Cj4+IGRpdmlkZSBlcnJvcjogMDAwMCBbIzFdIFBS
RUVNUFQgU01QIEtBU0FOCj4+IENQVTogMCBQSUQ6IDIwMDIzIENvbW06IHN5ei1leGVjdXRvci4w
IE5vdCB0YWludGVkIDYuMi4wICM2Cj4+IEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMg
KGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TCj4+IDEuMTMuMC0xdWJ1bnR1MS4xIDA0LzAxLzIw
MTQKPj4gUklQOiAwMDEwOm10ZF9kaXZfYnlfZWIgaW5jbHVkZS9saW51eC9tdGQvbXRkLmg6NTgw
IFtpbmxpbmVdCj4+IFJJUDogMDAxMDppb19pbml0IGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jOjYy
MCBbaW5saW5lXQo+PiBSSVA6IDAwMTA6dWJpX2F0dGFjaF9tdGRfZGV2KzB4NzdmLzB4MmZlMCBk
cml2ZXJzL210ZC91YmkvYnVpbGQuYzo5NTUKPj4gQ29kZTogZmMgZmYgZGYgNDggYzEgZWEgMDMg
MGYgYjYgMTQgMDIgNGMgODkgZjAgODMgZTAgMDcgODMgYzAgMDMgMzgKPj4gZDAgN2MgMDggODQg
ZDIgMGYgODUgMWYgMjUgMDAgMDAgNDEgOGIgNGMgMjQgMTAgNDggODkgZDggMzEgZDIgPDQ4PiBm
Nwo+PiBmMSA0OCA4OSBjMyBlOCBiNiBmMyAxYiBmYyA0OCA4ZCA4NSA0MCAxNyAwMCAwMCA0OCA4
OSBjMiA0OAo+PiBSU1A6IDAwMTg6ZmZmZmM5MDAwYmUwZmQzMCBFRkxBR1M6IDAwMDEwMjQ2Cj4+
IFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNYOiAwMDAwMDAw
MDAwMDAwMDAwCj4+IFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IGZmZmY4ODgwNDdhNDlkNDAg
UkRJOiAwMDAwMDAwMDAwMDAwMDAyCj4+IFJCUDogZmZmZjg4ODAyNGUxYzAwMCBSMDg6IDAwMDAw
MDAwMDAwMDAwMTYgUjA5OiBmZmZmZjUyMDAxN2MxZjQ3Cj4+IFIxMDogZmZmZmM5MDAwYmUwZmEz
NyBSMTE6IGZmZmZmNTIwMDE3YzFmNDYgUjEyOiBmZmZmODg4MDY1NDVhMDAwCj4+IFIxMzogMDAw
MDAwMDAwMDAwMDAwMCBSMTQ6IGZmZmY4ODgwNjU0NWEwMTAgUjE1OiAwMDAwMDAwMDAwMDAwMDA3
Cj4+IEZTOiAgMDAwMDdmZDQ1ZTg1YzcwMCgwMDAwKSBHUzpmZmZmODg4MDJjYTAwMDAwKDAwMDAp
IGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPj4gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENS
MDogMDAwMDAwMDA4MDA1MDAzMwo+PiBDUjI6IDAwMDA3ZjY0YWVlZjUzYTQgQ1IzOiAwMDAwMDAw
MDRmMzlhMDAwIENSNDogMDAwMDAwMDAwMDM1MGVmMAo+PiBDYWxsIFRyYWNlOgo+PiAgPFRBU0s+
Cj4+ICBjdHJsX2NkZXZfaW9jdGwrMHgzMDMvMHgzYTAgZHJpdmVycy9tdGQvdWJpL2NkZXYuYzox
MDQzCgpXaGF0IGtpbmQgb2YgTVREIHlvdSBhdHRhY2hpbmc/CkhhcyBpdCBlcmFzZXNpemUgMD8K
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
