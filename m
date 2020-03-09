Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B281DC10F29
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 14:04:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A29F20848
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 14:04:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z1B6/GY9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A29F20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QitkEJrtSMKcZnSSJBIPqS7+qyHo2l1thiF9GBfWFxg=; b=Z1B6/GY9S7bHNT
	odppfqUFNfDIXSyZR15Z1Y1Z584yFmBzNao4RNYxbokoS7dJloGB6UUp8dl3uM9ORHO03X+EJBzRV
	dqItxpfX2PzYLS1s/cqe31cBfSvj2ioaP1YIb6i77eLJQmONMyuFAeJAOHByKkKPehDbG4hRRCc5a
	Mb0YtDRtnyNUfpxa0EPHKRORUzTH5a/lCMobrtFAY0/eZJ2Z5u+uliuJ1uc0qSb6zDoPKxYleOdnz
	fd9OWmQ52nnRvdbtQMYt2CzXjgokpJtqtJs5RDsEi6d+6gjeojJZEk0SFbZcODZwXp+dBVWzMnHOn
	jfCBQPzmljtYhrNHuFHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBJ1H-00047C-Jd; Mon, 09 Mar 2020 14:04:35 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBJ1B-00046V-5C
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 14:04:34 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0C5BE40002;
 Mon,  9 Mar 2020 14:04:24 +0000 (UTC)
Date: Mon, 9 Mar 2020 15:04:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: fix calculating partition end address
Message-ID: <20200309150424.4b75af66@xps13>
In-Reply-To: <20200309074445.23524-1-zajec5@gmail.com>
References: <20200309074445.23524-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_070432_705889_8A78893F 
X-CRM114-Status: GOOD (  16.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFmYcWCLAoKUmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21haWwuY29tPiB3cm90ZSBvbiBN
b24sICA5IE1hciAyMDIwIDA4OjQ0OjQ1CiswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kg
PHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gVGhpcyBmaXhlcyBjaGVjayBmb3IgcGFydGl0aW9ucyB0
aGF0IGRvbid0IHN0YXJ0IGF0IGJlZ2lubmluZyBvZiB0aGVpcgo+IHBhcmVudHMuIE1pc3Npbmcg
cGFydGl0aW9uJ3Mgb2Zmc2V0IGluIGZvcm11bGEgY291bGQgcmVzdWx0IGluIGZvcmNpbmcKPiBy
ZWFkLW9ubHkgaW5jb3JyZWN0bHkuCj4gCj4gRml4ZXM6IDY3NTBmNjFhMTNhMCAoIm10ZDogaW1w
cm92ZSBjYWxjdWxhdGluZyBwYXJ0aXRpb24gYm91bmRhcmllcyB3aGVuIGNoZWNraW5nIGZvciBh
bGlnbm1lbnQiKQo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRkcGFydC5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbXRkcGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCj4gaW5kZXggNzMyOGMw
NjZjNWJhLi5jNjgzYjQzMmNjNWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkcGFydC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCj4gQEAgLTUyNCw3ICs1MjQsNyBAQCBzdGF0
aWMgc3RydWN0IG10ZF9wYXJ0ICphbGxvY2F0ZV9wYXJ0aXRpb24oc3RydWN0IG10ZF9pbmZvICpw
YXJlbnQsCj4gIAkJCXBhcnQtPm5hbWUpOwo+ICAJfQo+ICAKPiAtCXRtcCA9IHBhcnRfYWJzb2x1
dGVfb2Zmc2V0KHBhcmVudCkgKyBzbGF2ZS0+bXRkLnNpemU7Cj4gKwl0bXAgPSBwYXJ0X2Fic29s
dXRlX29mZnNldChwYXJlbnQpICsgc2xhdmUtPm9mZnNldCArIHNsYXZlLT5tdGQuc2l6ZTsKCkkg
dGhpbmsgeW91IGFyZSBkb2luZyB0aGUgY2hhbmdlIGF0IHRoZSB3cm9uZyBwbGFjZSwgaWYgeW91
IHdhbnQgdG8KY2hlY2sgd2hlcmUgdGhlIHBhcnRpdGlvbiAqc3RhcnRzKiB5b3Ugc2hvdWxkIGRv
IGl0IGEgZmV3IGxpbmVzIGFib3ZlLgpCdXQgSSB0aGluayB0aGUgY2hlY2sgc2hvdWxkIGJlIGhl
cmUgYXMgd2VsbCwgcHJvYmFibHkuCgpBbnl3YXksIEkganVzdCBhcHBsaWVkIG9uIG15IGxvY2Fs
IHRyZWUgYSBwYXRjaCByZXdyaXRpbmcgYSBiaXQgdGhlCnBhcnRpdGlvbmluZyBzY2hlbWUsIGNv
dWxkIHlvdSBwbGVhc2UgcmViYXNlIG9uIHRvcCBvZiB0b2RheSdzCm10ZC9uZXh0IGFuZCByZXNl
bmQgdGhpcyBwYXRjaCB1cGRhdGVkPwoKSGVyZSBpcyB0aGUgY2hhbmdlIHRoYXQgSSd2ZSBkb25l
IGF0IHRoaXMgcGxhY2U6CgktICAgICAgIHRtcCA9IHBhcnRfYWJzb2x1dGVfb2Zmc2V0KHBhcmVu
dCkgKyBzbGF2ZS0+bXRkLnNpemU7CgkrICAgICAgIHRtcCA9IG10ZF9nZXRfbWFzdGVyX29mcyhj
aGlsZCwgMCkgKyBjaGlsZC0+c2l6ZTsKClRoYW5rcyEKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
