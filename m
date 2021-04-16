Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E18C43460
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 15:05:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 183BA611AC
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 15:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 183BA611AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=omOe95hGVg3eU66JBkLchNS/Irn0a5LCqjMYfI9PST0=; b=XeJqf3zfhTklHH+u02YHD6xwD
	HGjiJB4C2b9luYxkLSKkE9djuSFco7ZZmfSlgtA8iC/U46XljXUohEAlA+g5lm4od/WBHOdDcmfmT
	WlMTjfi5+T+BUmpKnGl4e+6OkcTuaVT1qUrA/ULu3KFo6bkQE2yJxrkV+5Jrr/tf2KioyGpB5rftH
	+TeQGjX/GYYTJO6yKcxqg9SamPp8cBKJDL8lN+DusZzJLsisU3QdSAP1WT4r5e+8CvqlFxQ0DJgHg
	v+p7OBeyjhi/ovZrgSGOESq3PCAD8rwZWhjuK67chNkXhMqg9o2Fz4GoTnMK5VBWPB4Dwb3FY/x8H
	fldPK3CEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXQ0a-002XxP-3s; Fri, 16 Apr 2021 15:03:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQ0R-002Xv7-NH
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 15:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=ZHbyLVA26aS/KoEjpTPA7BkjNM0XbWK0mzYuh3hBcec=; b=SLxVy85b1aZFm12PjsGt4R5aPB
 OkORUvZSGfnLVTniXRM+Z/yYUiIWCiRgE2j3WfMY9XOEYG/bPc1Y5noVj6fmAxHx8FElojRWKEsrO
 7pV6I/+iMlxVkGfUJ/4VuMm04Qn33kZV+NLPVyy3KOZj5pc/8uPPhZLLSpDBKqWGYcZx73yk75aub
 66VoSnCityG8UVIGy9l3EDZZ1iRIUs38pI4ARo4EGDVYoYT25KK8p2pSzr7PxRBX+qHAFxe/AsAet
 cn/S1U4KdIttmVgDTYfbVJxOomS8fZ/3U68CSepF0A9X5qY7kgK2qMtFZn8EsthhL/Pv5RZNpQUjP
 lJ7VNcZw==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQ0M-009U8k-0A
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 15:03:38 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7BD1E20015;
 Fri, 16 Apr 2021 15:03:31 +0000 (UTC)
Date: Fri, 16 Apr 2021 17:03:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Vivek Unune <npcomplete13@gmail.com>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: parsers: trx: parse "firmware" MTD partitions only
Message-ID: <20210416170330.65c267f4@xps13>
In-Reply-To: <20210413163700.12215-1-zajec5@gmail.com>
References: <20210413163700.12215-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_080334_196124_B0B082C4 
X-CRM114-Status: GOOD (  19.97  )
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

SGkgUmFmYcWCLAoKUmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21haWwuY29tPiB3cm90ZSBvbiBU
dWUsIDEzIEFwciAyMDIxIDE4OjM3OjAwCiswMjAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kg
PHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gUGFyc2luZyBldmVyeSBwYXJ0aXRpb24gd2l0aCAiY29t
cGF0aWJsZSIgc2V0IHRvICJicmNtLHRyeCIgcmVzdWx0cyBpbgo+IHBhcnNpbmcgYm90aDogZmly
bXdhcmUgcGFydGl0aW9uIGFuZCBmYWlsc2FmZSBwYXJ0aXRpb24gb24gZGV2aWNlcyB0aGF0Cj4g
aW1wbGVtZW50IGZhaWxzYWZlIGJvb3RpbmcuIFRoaXMgYWZmZWN0cyBlLmcuIExpbmtzeXMgRUE5
NTAwIHdoaWNoIGhhczoKPiAKPiBwYXJ0aXRpb25AMjAwMDAwIHsKPiAJcmVnID0gPDB4MDIwMDAw
MCAweDAxZDAwMDAwPjsKPiAJY29tcGF0aWJsZSA9ICJsaW5rc3lzLG5zLWZpcm13YXJlIiwgImJy
Y20sdHJ4IjsKPiB9Owo+IAo+IHBhcnRpdGlvbkAxZjAwMDAwIHsKPiAJcmVnID0gPDB4MDFmMDAw
MDAgMHgwMWQwMDAwMD47Cj4gCWNvbXBhdGlibGUgPSAibGlua3N5cyxucy1maXJtd2FyZSIsICJi
cmNtLHRyeCI7Cj4gfTsKPiAKPiBDaGVjayBmb3IgTVREIHBhcnRpdGlvbiBuYW1lICJmaXJtd2Fy
ZSIgYmVmb3JlIHBhcnNpbmcuIFJlY2VudGx5IGFkZGVkCj4gb2ZwYXJ0X2xpbmtzeXNfbnMuYyBj
cmVhdGVzICJmaXJtd2FyZSIgYW5kICJmYWlsc2FmZSIgZGVwZW5kaW5nIG9uCj4gYm9vdGxvYWRl
ciBzZXR1cC4KCkkgZG9uJ3QgbGlrZSB2ZXJ5IG11Y2ggdGhlIG1hdGNoaW5nIGFnYWluc3QgYSBw
YXJ0aXRpb24gbmFtZSwgdGhpcyBpcwphbmQgc2hvdWxkIHByb2JhYmx5IHJlbWFpbiBmcmVlIHRl
eHQuIFdoeSBub3QgbWF0Y2hpbmcgYWdhaW5zdCB0aGUKZW50aXJlIGxpbmtzeXMsbnMtZmlybXdh
cmUgY29tcGF0aWJsZSBpbnN0ZWFkPwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gLS0tCj4gVml2ZWsgaGFzIHJlY2VudGx5IHJlcG9ydGVk
IHRoaXMgcHJvYmxlbSB0byBtZSBhbmQgdGhpcyBpcyBzb2x0dWlvbiBJCj4gY2FtZSB1cCB3aXRo
Lgo+IAo+IE9uZSBhbHRlcm5hdGl2ZSBJIHRob3VnaHQgb2YgY291bGQgYmUgbWFya2luZyAiZmFp
bHNhZmUiIE1URCBwYXJ0aXRpb24KPiBub2RlIGFzIGRpc2FibGVkICh1c2luZyBvZl91cGRhdGVf
cHJvcGVydHkoKSArICJzdGF0dXMiICsgImRpc2FibGVkIikgYW5kCj4gdGhlbiB1c2luZyBvZl9k
ZXZpY2VfaXNfYXZhaWxhYmxlKCkgaW4gdGhlIHBhcnNlcl90cnguYy4KPiAKPiBMZXQgbWUga25v
dyBpZiB5b3UgcHJlZmVyIHRoZSBvdGhlciAob3IgYW55IG90aGVyKSBzb2x1dGlvbiBvdmVyIHRo
aXMKPiBwYXRjaC4KPiAtLS0KPiAgZHJpdmVycy9tdGQvcGFyc2Vycy9wYXJzZXJfdHJ4LmMgfCA0
ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9wYXJzZXJzL3BhcnNlcl90cnguYyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMv
cGFyc2VyX3RyeC5jCj4gaW5kZXggODU0MTE4MjEzNGQ0Li4wMDYzNzkxZTE2NGQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvcGFyc2Vycy9wYXJzZXJfdHJ4LmMKPiArKysgYi9kcml2ZXJzL210
ZC9wYXJzZXJzL3BhcnNlcl90cnguYwo+IEBAIC01OCw2ICs1OCwxMCBAQCBzdGF0aWMgaW50IHBh
cnNlcl90cnhfcGFyc2Uoc3RydWN0IG10ZF9pbmZvICptdGQsCj4gIAl1aW50OF90IGN1cnJfcGFy
dCA9IDAsIGkgPSAwOwo+ICAJaW50IGVycjsKPiAgCj4gKwkvKiBEb24ndCBwYXJzZSBhbnkgZmFp
bHNhZmUgLyBiYWNrdXAgcGFydGl0aW9ucyAqLwo+ICsJaWYgKHN0cmNtcChtdGQtPm5hbWUsICJm
aXJtd2FyZSIpKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiAgCXBhcnRzID0ga2NhbGxvYyhU
UlhfUEFSU0VSX01BWF9QQVJUUywgc2l6ZW9mKHN0cnVjdCBtdGRfcGFydGl0aW9uKSwKPiAgCQkJ
R0ZQX0tFUk5FTCk7Cj4gIAlpZiAoIXBhcnRzKQoKCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
