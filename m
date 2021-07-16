Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D4FC12002
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 16:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A45B61374
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 16:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A45B61374
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VHO5kCUu27y9KMVbzUuLft6QiLtApI2AmaIoM+WPAyk=; b=IsC2BGvuXcAjQKxfdCNnFC3y9N
	1IVqA1MBHPJwHq9yY62oQ3Biw2RBV7fRouNLJS5oKas3W2N7IIwLOehaw18vKNVIFZOpb9j1ZehWH
	ifgsP99W34HO2wTSRizW/VUo49Ci1roTcskEFaKsxQCct5KQBm0HRH/qZsml3XMngg75FY8lV4e6/
	pNTifm5Y834XoygaWZ/U0SgbSn1ELsqvc9zA+vfncoc8+KDCkgyY/q5VJD8dvnwlBDBy5+n5lYpID
	yUMa41/ObqR9yje/o9/QD2dBnVivANIqHBBlp5+ZZgWGDxTmLed0v7pqfMoE8yhGT7HfKe+67cxtC
	Ewbz/ajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Qg4-004rJi-6m; Fri, 16 Jul 2021 16:27:04 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Qg1-004rI6-3g
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 16:27:02 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C7A836169BB0;
 Fri, 16 Jul 2021 18:26:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id r4aiC90VSn-V; Fri, 16 Jul 2021 18:26:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4CE52616B593;
 Fri, 16 Jul 2021 18:26:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id iZzCNoafkg8f; Fri, 16 Jul 2021 18:26:57 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1F0216169BB0;
 Fri, 16 Jul 2021 18:26:57 +0200 (CEST)
Date: Fri, 16 Jul 2021 18:26:56 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Greg KH <greg@kroah.com>
Cc: Pintu Agarwal <pintu.ping@gmail.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
Message-ID: <568938486.33366.1626452816917.JavaMail.zimbra@nod.at>
In-Reply-To: <YPGojf7hX//Wn5su@kroah.com>
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <YPGojf7hX//Wn5su@kroah.com>
Subject: Re: MTD: How to get actual image size from MTD partition
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: How to get actual image size from MTD partition
Thread-Index: EX+isZbzvbtTKORywh51Mf2FxgrK+w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_092701_344905_0C0F2C8D 
X-CRM114-Status: UNSURE (   7.30  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkdyZWcgS0giIDxncmVnQGty
b2FoLmNvbT4KPiBBbjogIlBpbnR1IEFnYXJ3YWwiIDxwaW50dS5waW5nQGdtYWlsLmNvbT4KPiBD
QzogImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAibGludXgt
bXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgtZnNkZXZlbCIKPiA8
bGludXgtZnNkZXZlbEB2Z2VyLmtlcm5lbC5vcmc+LCAiUGhpbGxpcCBMb3VnaGVyIiA8cGhpbGxp
cEBzcXVhc2hmcy5vcmcudWs+LCAiU2VhbiBOeWVramFlciIgPHNlYW5AZ2Vhbml4LmNvbT4sCj4g
Iktlcm5lbG5ld2JpZXMiIDxrZXJuZWxuZXdiaWVzQGtlcm5lbG5ld2JpZXMub3JnPiwgInJpY2hh
cmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBHZXNlbmRldDogRnJlaXRhZywgMTYuIEp1bGkgMjAyMSAx
Nzo0MTowMQo+IEJldHJlZmY6IFJlOiBNVEQ6IEhvdyB0byBnZXQgYWN0dWFsIGltYWdlIHNpemUg
ZnJvbSBNVEQgcGFydGl0aW9uCgo+IE9uIEZyaSwgSnVsIDE2LCAyMDIxIGF0IDEyOjEyOjQxUE0g
KzA1MzAsIFBpbnR1IEFnYXJ3YWwgd3JvdGU6Cj4+IEhpLAo+PiAKPj4gT3VyIEFSTTMyIExpbnV4
IGVtYmVkZGVkIHN5c3RlbSBjb25zaXN0cyBvZiB0aGVzZToKPj4gKiBMaW51eCBLZXJuZWw6IDQu
MTQKPj4gKiBQcm9jZXNzb3I6IFF1YWxjb21tIEFybTMyIENvcnRleC1BNwo+PiAqIFN0b3JhZ2U6
IE5BTkQgNTEyTUIKPj4gKiBQbGF0Zm9ybTogU2ltcGxlIGJ1c3lib3gKPj4gKiBGaWxlc3lzdGVt
OiBVQklGUywgU3F1YXNoZnMKPj4gKiBDb25zaXN0cyBvZiBuYW5kIHJhdyBwYXJ0aXRpb25zLCBz
cXVhc2hmcyB1Ymkgdm9sdW1lcy4KPj4gCj4+IE15IHJlcXVpcmVtZW50Ogo+PiBUbyBmaW5kIHRo
ZSBjaGVja3N1bSBvZiBhIHJlYWwgaW1hZ2UgaW4gcnVudGltZSB3aGljaCBpcyBmbGFzaGVkIGlu
IGFuCj4+IE1URCBwYXJ0aXRpb24uCj4gCj4gVHJ5IHVzaW5nIHRoZSBkbS12ZXJpdHkgbW9kdWxl
IGZvciBlbnN1cmluZyB0aGF0IGEgYmxvY2sgZGV2aWNlIHJlYWxseQo+IGlzIHByb3Blcmx5IHNp
Z25lZCBiZWZvcmUgbW91bnRpbmcgaXQuICBUaGF0J3Mgd2hhdCBpdCB3YXMgZGVzaWduZWQgZm9y
Cj4gYW5kIGlzIGluZGVwZW5kZW50IG9mIHRoZSBibG9jayBkZXZpY2UgdHlwZS4KCk1URHMgYXJl
IG5vdCBibG9jayBkZXZpY2VzLiA6LSkKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
