Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B29CC5475B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ko/TNexGc4XMuX7Bx+nBLhRhxwLbGyD20wF5FEl2d9s=; b=AbFSkSgeJKA5fPiEDwGSTR7krw
	HM58Us7fTAu1cnvVG7qsfvnLMXt3Et4wHNIzVZ9l7XOB+UaGh9SOQ0cV2tbXo3RUtMz5Ukj8gLj5X
	lSUySjwXbX7VRy+q7R4QdUSMKjMRTUd8nglMNj++ovkwlwlKoWIxfDED4g8Vo3vLncsXakykqu//V
	BRz8qqEGnV7Gcb3tSzZ84QKPkUxu5LQCIqSJUCUo+RLKSbOhTKo29F/Q7RCN1F2WnzLTt64DngzMD
	KH+yjdcAJ+y/RQ5GVxe/heFEQhHW3/+FMpjv4DHrYIiYX/WczTLsPv5m63oMmAHOsxH1WyzRTpQa1
	3C0dgarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjfCp-00000001Wdc-10f8;
	Mon, 11 Mar 2024 12:56:39 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjfCk-00000001WcW-1BLo
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 12:56:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CEA126450941;
	Mon, 11 Mar 2024 13:56:28 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id PXZWRRISZQ8B; Mon, 11 Mar 2024 13:56:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1F4376450948;
	Mon, 11 Mar 2024 13:56:28 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aRa4meSvKNMG; Mon, 11 Mar 2024 13:56:28 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id EB0836450941;
	Mon, 11 Mar 2024 13:56:27 +0100 (CET)
Date: Mon, 11 Mar 2024 13:56:27 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Christian Heusel <christian@heusel.eu>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>
Message-ID: <1349276201.40757.1710161787719.JavaMail.zimbra@nod.at>
In-Reply-To: <b4oa6jak7f4hiaqcqpmasclaylqdhdzgne75a6nol6z33d4o7z@3soexkn4smz4>
References: <20240211003907.167891-1-christian@heusel.eu> <b4oa6jak7f4hiaqcqpmasclaylqdhdzgne75a6nol6z33d4o7z@3soexkn4smz4>
Subject: Re: [PATCH] jffs2: print symbolic error name instead of error code
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: print symbolic error name instead of error code
Thread-Index: W9U2fKy9ORNwIjN+anjPvwswt4VI2w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_055634_515827_FB3DED55 
X-CRM114-Status: GOOD (  10.64  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNocmlzdGlhbiBIZXVzZWwi
IDxjaHJpc3RpYW5AaGV1c2VsLmV1Pgo+IEFuOiAiRGF2aWQgV29vZGhvdXNlIiA8ZHdtdzJAaW5m
cmFkZWFkLm9yZz4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAibGludXgtbXRkIiA8bGlu
dXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LAo+ICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnPgo+IENDOiAia2VybmVsLWphbml0b3JzIiA8a2VybmVsLWphbml0
b3JzQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogTW9udGFnLCAxMS4gTcOkcnogMjAyNCAx
Mzo0Nzo0MAo+IEJldHJlZmY6IFJlOiBbUEFUQ0hdIGpmZnMyOiBwcmludCBzeW1ib2xpYyBlcnJv
ciBuYW1lIGluc3RlYWQgb2YgZXJyb3IgY29kZQoKPiBPbiAyNC8wMi8xMSAwMTozOUFNLCBDaHJp
c3RpYW4gSGV1c2VsIHdyb3RlOgo+PiBVdGlsaXplIHRoZSAlcGUgcHJpbnQgc3BlY2lmaWVyIHRv
IGdldCB0aGUgc3ltYm9saWMgZXJyb3IgbmFtZSBhcyBhCj4+IHN0cmluZyAoaS5lICItRU5PTUVN
IikgaW4gdGhlIGxvZyBtZXNzYWdlIGluc3RlYWQgb2YgdGhlIGVycm9yIGNvZGUgdG8KPj4gaW5j
cmVhc2UgaXRzIHJlYWRhYmxpbGl0eS4KPj4gCj4+IFRoaXMgY2hhbmdlIHdhcyBzdWdnZXN0ZWQg
aW4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzkyOTcyNDc2LTBiMWYtNGQwYS05OTUx
LWFmM2ZjOGJjNmU2NUBzdXN3YS5tb3VudGFpbi8KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBIZXVzZWwgPGNocmlzdGlhbkBoZXVzZWwuZXU+Cj4+IC0tLQo+PiAgZnMvamZmczIvYmFj
a2dyb3VuZC5jIHwgNCArKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2ZzL2pmZnMyL2JhY2tncm91bmQuYyBi
L2ZzL2pmZnMyL2JhY2tncm91bmQuYwo+PiBpbmRleCA2ZGE5MmVjYWY2NmQuLmJiMGVlMWE1OWU3
MSAxMDA2NDQKPj4gLS0tIGEvZnMvamZmczIvYmFja2dyb3VuZC5jCj4+ICsrKyBiL2ZzL2pmZnMy
L2JhY2tncm91bmQuYwo+PiBAQCAtNDQsOCArNDQsOCBAQCBpbnQgamZmczJfc3RhcnRfZ2FyYmFn
ZV9jb2xsZWN0X3RocmVhZChzdHJ1Y3QgamZmczJfc2JfaW5mbwo+PiAqYykKPj4gCj4+ICAJdHNr
ID0ga3RocmVhZF9ydW4oamZmczJfZ2FyYmFnZV9jb2xsZWN0X3RocmVhZCwgYywgImpmZnMyX2dj
ZF9tdGQlZCIsCj4+ICAJYy0+bXRkLT5pbmRleCk7Cj4+ICAJaWYgKElTX0VSUih0c2spKSB7Cj4+
IC0JCXByX3dhcm4oImZvcmsgZmFpbGVkIGZvciBKRkZTMiBnYXJiYWdlIGNvbGxlY3QgdGhyZWFk
OiAlbGRcbiIsCj4+IC0JCQktUFRSX0VSUih0c2spKTsKPj4gKwkJcHJfd2FybigiZm9yayBmYWls
ZWQgZm9yIEpGRlMyIGdhcmJhZ2UgY29sbGVjdCB0aHJlYWQ6ICVwZVxuIiwKPj4gKwkJCXRzayk7
Cj4+ICAJCWNvbXBsZXRlKCZjLT5nY190aHJlYWRfZXhpdCk7Cj4+ICAJCXJldCA9IFBUUl9FUlIo
dHNrKTsKPj4gIAl9IGVsc2Ugewo+PiAtLQo+PiAyLjQzLjEKPiAKPiBGcmllbmRseSBwaW5nIG9u
IHRoZSBhYm92ZSBwYXRjaCwgc2luY2UgaXQncyBub3cgYSBtb250aCBhZnRlciBzZW5kaW5nCj4g
aXQgOikKClRoYW5rcyBmb3IgdGhlIHBpbmcuIFlvdXIgcGF0Y2ggbG9va3MgZ29vZC4gSSdsbCBx
dWV1ZSBpdC4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
