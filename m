Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BF9C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zto/3wzol0bdX0zOlXH/Nfyx4Xok6ThgMr2+46gtQXY=; b=R6OFnWo7fCsyGO
	/8OU1jM2KHTrh/0oZn0rcM1o5QU5GZKhZwQs8Sl8ENCpfH/KYnHuFYLNA6v6qRRIg96ZqfiLS9gFw
	ZRrJSJm5/e55UIbqhjU5Ks//5MQbPTgbt4xQlCubajM2S0zsLAwOToq4lTHUrtBBgTYYc633Xt9I0
	jCiRvYK9U3tBxv6N96ewxbx+GjtRqXfdBcJ1LWYhTQzk7QCsJNngrJ4J6AKb3IzgDN7uDvbIUIztp
	kOn2IC/W4xqMe7XiXA9BAUlwCS5pyBRYqUc70nYirOBRug0EjJisbVdmOfOF7FqjGB/7i/Drq4L05
	vB0cwcmuCf7pd5jVbPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQ7C-007YoI-Q2; Tue, 22 Nov 2022 10:02:55 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQ75-007Yca-TI
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2022 10:02:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B3E27240005;
	Tue, 22 Nov 2022 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669111363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WmyFTJevytlulznh6ayTXhdY+HEVUzYjYVjdJQwaGpA=;
	b=kS1KYIO/K9Qw33D72feMPlykFfp1HxvQj1V26Lb6RRxOCB9idxMwB+em7Z8mwV2QWDqqjw
	zEjaffLJqRaO4qaW1SDdRYf6VTfSm/gQ2P2ENT116NbcBkoI9VXRZZnq8jXFp1b4ZG7M2n
	H9baSI2sLX9o002cd4iavRrgVaOkdvCSsHaT7Hz2YFCDokKCOb181N7wBszHJkOFYnSwME
	s+c5pat0v+obwM/BzYdpSaPPdkXMjEMz+KwOg3znPsGKl6g9ul/lQR0nA7t5NrrMLuNi+I
	pYYWhvqAIulnfOKBPIOC3G/ukgSzqY+kiUDhWLu65y4xQiqqNzsiFT0jP3Jmvg==
Date: Tue, 22 Nov 2022 11:02:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <ye.xingchen@zte.com.cn>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <chi.minghao@zte.com.cn>
Subject: Re: [PATCH] mtd: rawnand: orion: use  
 devm_platform_get_and_ioremap_resource()
Message-ID: <20221122110226.3cdac73a@xps-13>
In-Reply-To: <202211220933274886024@zte.com.cn>
References: <202211220933274886024@zte.com.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_020248_161180_725F004A 
X-CRM114-Status: GOOD (  14.45  )
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

SGVsbG8sCgp5ZS54aW5nY2hlbkB6dGUuY29tLmNuIHdyb3RlIG9uIFR1ZSwgMjIgTm92IDIwMjIg
MDk6MzM6MjcgKzA4MDAgKENTVCk6Cgo+IEZyb206IE1pbmdoYW8gQ2hpIDxjaGkubWluZ2hhb0B6
dGUuY29tLmNuPgo+IAoKRG91YmxlIHNwYWNlIGluIHRoZSBzdWJqZWN0Cgo+IENvbnZlcnQgcGxh
dGZvcm1fZ2V0X3Jlc291cmNlKCksIGRldm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIGEgc2luZ2xl
Cj4gY2FsbCB0byBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgpLCBhcyB0
aGlzIGlzIGV4YWN0bHkKPiB3aGF0IHRoaXMgZnVuY3Rpb24gZG9lcy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNaW5naGFvIENoaSA8Y2hpLm1pbmdoYW9AenRlLmNvbS5jbj4KPiAtLS0KPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvb3Jpb25fbmFuZC5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvb3Jpb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb3Jpb25fbmFu
ZC5jCj4gaW5kZXggMWJmZWNmNTAyMjE2Li4wMGJkN2JlNzZlMDcgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvb3Jpb25fbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvb3Jpb25fbmFuZC5jCj4gQEAgLTEwMiw3ICsxMDIsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBv
cmlvbl9uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlzdHJ1Y3Qg
bXRkX2luZm8gKm10ZDsKPiAgCXN0cnVjdCBuYW5kX2NoaXAgKm5jOwo+ICAJc3RydWN0IG9yaW9u
X25hbmRfZGF0YSAqYm9hcmQ7Cj4gLQlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKPiAgCXZvaWQgX19p
b21lbSAqaW9fYmFzZTsKPiAgCWludCByZXQgPSAwOwo+ICAJdTMyIHZhbCA9IDA7Cj4gQEAgLTEx
OSw4ICsxMTgsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBvcmlvbl9uYW5kX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlpbmZvLT5jb250cm9sbGVyLm9wcyA9ICZvcmlvbl9u
YW5kX29wczsKPiAgCW5jLT5jb250cm9sbGVyID0gJmluZm8tPmNvbnRyb2xsZXI7Cj4gCj4gLQly
ZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwo+IC0J
aW9fYmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOwo+ICsJaW9f
YmFzZSA9IGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsIE5V
TEwpOwoKSWYgd2Ugbm8gbG9uZ2VyIHVzZSByZXMsIHdoeSBub3QganVzdCBkZXZtX3BsYXRmb3Jt
X2lvcmVtYXBfcmVzb3VyY2UoKSA/Cgo+IAo+ICAJaWYgKElTX0VSUihpb19iYXNlKSkKPiAgCQly
ZXR1cm4gUFRSX0VSUihpb19iYXNlKTsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
