Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCB8C43600
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 08:09:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257A06121E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 08:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257A06121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gw3xLS68tlK1WFFhy97k6hH4v4yRRH93d6F/L5d3TY0=; b=FBte4F/q23Kr/b
	G5lDM8TNOCMJK1ZRW5iyeNJhDCCtFTyM/5pngg6SyS4mHG55quh6bDoKrYjM/UuM0FJOO8lxpSa5/
	BMNgJOiAyG1ffBDtXu/zPP/c18WszeYATTIRCPakP2PwEHtYVtCX7uVu7Aqty1FGO/CRlHh3mvMp/
	Y51nhZRGQrWTEAGBkItVkcHshOXWTKORzorma6V66E1As5fG9DbX+2Fj2QyFUgyUIP+2hsacpG/hm
	7myWR6Xx4kuwwWHq4ITkkFrO0ffiCjWL0bZenAFTbUV5wp670Izl1nMobVP2Mg7os6fAgup8oQYMs
	KyvyCuL8eCb7pbM7gnvw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVrc1-0063vD-QF; Mon, 12 Apr 2021 08:08:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrbz-0063v0-GC
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 08:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=OatTzAJEMCSdnD8k0v5XCykpJ12KhEl3zpfl7IJdodA=; b=gMAYXfv5aFrnxrW86X3sRw0Bgc
 x2tNzsZjkr25r2N04ZLbjSrd5Jmtb8CXOpUCFnmX7/V0VwKTSdzsDGS6FGCuRVE/Z485DsxfM2gMh
 etMaB8IooJYqYe1gWZjGc13plepo+zM04QP4ZUTSz/U8kFtaSndUuDExoyjuYWmd8CiFvMebR/Gh9
 8Hguzl7OdXSUIrI3huHq6PgiscU/RN7gjtTFaG9KxjXnFRYEEfIA4YCnf6GsJP71SeX+jlmeVfZac
 eC4pJyX78FY9HRqCPrI/HCkYFdA9sHvtv72xRORZYP/7tHP2jUcVs0MWI8gAPgw/xsgxMV02jNIU9
 d0fFrg1g==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrbw-005xRT-7v
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 08:07:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D6A096122D57;
 Mon, 12 Apr 2021 10:07:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AMg6jjZY1Bim; Mon, 12 Apr 2021 10:07:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6CEF26122D50;
 Mon, 12 Apr 2021 10:07:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5zmW236u4eej; Mon, 12 Apr 2021 10:07:52 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3A0CD6122D7F;
 Mon, 12 Apr 2021 10:07:52 +0200 (CEST)
Date: Mon, 12 Apr 2021 10:07:52 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: "tiantao (H)" <tiantao6@huawei.com>
Cc: Tian Tao <tiantao6@hisilicon.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <754065655.172978.1618214872038.JavaMail.zimbra@nod.at>
In-Reply-To: <049f8110-5777-db77-d374-275d1ceee81d@huawei.com>
References: <1618209872-20034-1-git-send-email-tiantao6@hisilicon.com>
 <614928182.172774.1618210140227.JavaMail.zimbra@nod.at>
 <049f8110-5777-db77-d374-275d1ceee81d@huawei.com>
Subject: Re: [PATCH] mtd: core: Convert sysfs sprintf/snprintf family to
 sysfs_emit
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: Convert sysfs sprintf/snprintf family to sysfs_emit
Thread-Index: WkjWBa2gRxkbvgEN4MehXcZYzkjRiw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_010756_450559_3326FEDE 
X-CRM114-Status: UNSURE (   6.20  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4gRml4IHRoZSBmb2xsb3dpbmcgY29j
Y2ljaGVjayB3YXJuaW5nOgo+Pj4gZHJpdmVycy9tdGQvbXRkY29yZS5jOjI5Njo4LTE2OiBXQVJO
SU5HOiB1c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPj4+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoz
MDY6OC0xNjogV0FSTklORzogdXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4+PiBkcml2ZXJzL210
ZC9tdGRjb3JlLmM6MjM3OjgtMTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYgb3Igc3ByaW50Zgo+
Pj4gZHJpdmVycy9tdGQvbXRkY29yZS5jOjI3NTo4LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRm
IG9yIHNwcmludGYKPj4+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoyODY6OC0xNjogV0FSTklORzog
dXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4+PiBkcml2ZXJzL210ZC9tdGRjb3JlLmM6MjY0Ojgt
MTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYgb3Igc3ByaW50Zgo+Pj4gZHJpdmVycy9tdGQvbXRk
Y29yZS5jOjIyNzo4LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPj4+IGRy
aXZlcnMvbXRkL210ZGNvcmUuYzoxNjI6OC0xNjogV0FSTklORzogdXNlIHNjbnByaW50ZiBvciBz
cHJpbnRmCj4+PiBkcml2ZXJzL210ZC9tdGRjb3JlLmM6MTQzOjgtMTY6IFdBUk5JTkc6IHVzZSBz
Y25wcmludGYgb3Igc3ByaW50Zgo+Pj4gZHJpdmVycy9tdGQvbXRkY29yZS5jOjIxODo4LTE2OiBX
QVJOSU5HOiB1c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPj4+IGRyaXZlcnMvbXRkL210ZGNvcmUu
YzoyMDg6OC0xNjogV0FSTklORzogdXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4+PiBkcml2ZXJz
L210ZC9tdGRjb3JlLmM6MTk5OjgtMTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYgb3Igc3ByaW50
Zgo+Pj4gZHJpdmVycy9tdGQvbXRkY29yZS5jOjE5MDo4LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJp
bnRmIG9yIHNwcmludGYKPj4+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoxNTI6OC0xNjogV0FSTklO
RzogdXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4+PiBkcml2ZXJzL210ZC9tdGRjb3JlLmM6MTgx
OjgtMTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYgb3Igc3ByaW50Zgo+Pj4gZHJpdmVycy9tdGQv
bXRkY29yZS5jOjEzNDo4LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPj4+
IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoxNzE6OC0xNjogV0FSTklORzogdXNlIHNjbnByaW50ZiBv
ciBzcHJpbnRmCgo+PiBzZWU6IFsKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRk
L0NBRkx4R3Z4QzRLdHZ0VTJyemFfYUd4MlJQT054cjdYeWdVd1hDRHJpWWlDcjhxTjNxZ0BtYWls
LmdtYWlsLmNvbS8KPj4gfAo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvQ0FG
THhHdnhDNEt0dnRVMnJ6YV9hR3gyUlBPTnhyN1h5Z1V3WENEcmlZaUNyOHFOM3FnQG1haWwuZ21h
aWwuY29tLwo+PiBdIFBsZWFzZSBleHBsYWluIHdoeSBhIHBhdGNoIGlzIG5lZWRlZCBhbmQgd2hh
dCBpdCBmaXhlcy4KCj4gVXNpbmcgc3lmc19lbWl0IHdpbGwgYXZvaWQgYnVmZmVyIG92ZXJydW4g
YnkgYXZvaWRpbmcgYnVmIGJlaW5nIG51bGwgb3IgYnVmCj4gYmVpbmcgaW4gdGhlIG1pZGRsZSBv
ZiB0aGUgcGFnZS4KCj4gbm8gZnVuY3Rpb24gY2hhbmdlLgoKQWxsIHRoaXMgbmVlZHMgdG8gZ28g
aW50byB0aGUgY29tbWl0IG1lc3NhZ2UuCkxpa2UgSSBzYWlkLCBwbGVhc2UgZXhwbGFpbiBjaGFu
Z2VzLgoKVGhlIGNvY2NpY2hlY2sgd2FybmluZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgYWxz
byBjbG9zZSB0byB1c2VsZXNzIGJlY2F1c2UKaXQgYWR2aXNlcyB5b3UgdG8gdXNlIHNjbnByaW50
ZiBvciBzcHJpbnRmLCB3aGljaCBpcyBub3Qgd2hhdCB5b3VyIHBhdGNoIGRvZXMuCgpUaGFua3Ms
Ci8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
