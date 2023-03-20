Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9EEC6FD1D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWL52Py+LfcUlhyaBovSKIPga6yOkjv8LTMDqtPmaGE=; b=W7Msekf0Zbest3
	LB+VJsoJlNFDy1VTt8zpykje8YvdHIA4rVg4i2whDbOQEjFMPGmNaUl9/lmYBnoPssk8X2rgzcVpb
	kjq70vzk5BiXo0IUyRNkr3DhcMktwuMJxNmAYljyaYitrv3wDDNvZIG7tgXlTdto/cposHDNfKMhd
	Oo4NB0uUKihaj+K1Y3mC58YaaVbJbqa67kNs0NEw6ZIdSgarrebSpwZQ5CCKMEvEbBB4Jwh/7mAK1
	w1wMpjdIDDO7jhPNAr3WyuYCJ7MEtzBnUnBtpRhOz5OsnlSAYvbGj6dEc+9p70Vf0ZzZhyUvGo9Bk
	tttDI6qKxuliip6jkS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDLO-008lPQ-39;
	Mon, 20 Mar 2023 11:06:26 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDLL-008lO3-2i
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 11:06:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 84C291C0010;
	Mon, 20 Mar 2023 11:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679310380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jnf6YNJZ4lrIopI+c00VZYbei+sGldqE2ELFqoR6GI=;
	b=KKJ8impLh9rkiKnFP4Slm2UQVrk+OkM54Aoj6z2UmqlNxq+YvXDC2plT8G8nR5NTlFJLmL
	wteBn9NnlTRuLIV/B3AgM8DIT5fyBjInwjGrHWWLWSbxJnMdq7sB+lwgpRCtc+HzONtq8q
	fAxzXeAnTndi1xpIZ8+mgsZqUglEHingoQyMan/hmmyZVxrRIOfZ/zRQi7N8/V37ZmCjZ2
	AH2ZhB6c22iYQEl6XbOZz4LrvWVn6IVOsyY/EM3Z/1RJQqjTxsWpswJc5YXJp8bZn2hRdW
	msh6xpT73m5XZAOMp68ozWzU44zBQ/5B1kOAKEpjmtlZ5qUeBfrjJ/MjckpKdQ==
Date: Mon, 20 Mar 2023 12:06:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1p?=
 =?UTF-8?B?xYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: core: print error code if registering NVMEM fails
Message-ID: <20230320120617.6b9e2a4d@xps-13>
In-Reply-To: <20230317074736.28944-1-zajec5@gmail.com>
References: <20230317074736.28944-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_040624_015498_732CE55F 
X-CRM114-Status: GOOD (  15.10  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDE3IE1hciAyMDIzIDA4
OjQ3OjM2ICswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gSXQncyBhIGNvbW1vbiBwcmFjdGljZSB0aGF0IGhlbHBzIGRlYnVnZ2luZyBwcm9ibGVt
cy4KClRvdGFsbHkgYWdyZWUuIEkgYWN0dWFsbHkgc2VudCBhIHBhdGNoIHRvIGF2b2lkIHRoZSBl
cnJvciBtZXNzYWdlCnVwb24gRVBST0JFX0RFRkVSIHdoaWNoIGhhcyB0aGUgc2lkZSBlZmZlY3Qg
b2YgcHJpbnRpbmcgdGhlIGVycm9yCih0aGFua3MgdG8gdGhlIHVzZSBvZiBkZXZfZXJyX3Byb2Jl
KCkpOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjMwMzA3MTkyNTA2LjQz
OTUzMi0xLW1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20vCgo+IFNpZ25lZC1vZmYtYnk6IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRkY29y
ZS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210
ZC9tdGRjb3JlLmMKPiBpbmRleCA4M2EyMjU2NmE4Y2UuLjgzMDNjZTYyYzc1MSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMK
PiBAQCAtNTM5LDcgKzUzOSw4IEBAIHN0YXRpYyBpbnQgbXRkX252bWVtX2FkZChzdHJ1Y3QgbXRk
X2luZm8gKm10ZCkKPiAgCQlpZiAoUFRSX0VSUihtdGQtPm52bWVtKSA9PSAtRU9QTk9UU1VQUCkg
ewo+ICAJCQltdGQtPm52bWVtID0gTlVMTDsKPiAgCQl9IGVsc2Ugewo+IC0JCQlkZXZfZXJyKCZt
dGQtPmRldiwgIkZhaWxlZCB0byByZWdpc3RlciBOVk1FTSBkZXZpY2VcbiIpOwo+ICsJCQlkZXZf
ZXJyKCZtdGQtPmRldiwgIkZhaWxlZCB0byByZWdpc3RlciBOVk1FTSBkZXZpY2U6ICVsZFxuIiwK
PiArCQkJCVBUUl9FUlIobXRkLT5udm1lbSkpOwo+ICAJCQlyZXR1cm4gUFRSX0VSUihtdGQtPm52
bWVtKTsKPiAgCQl9Cj4gIAl9CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
