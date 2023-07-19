Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB903EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 08:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzcH/ObzsNYG+E63hAuWWudS92kXh7/YWjdpS36RS48=; b=gHi1asCWuI47kX/nIzzpUTMK+w
	8kjMZj/3hASOsRwCA/0iUiYRGV3AL94hFFAkbDj5I2VLOvfWTsm1C7M3RqX4mpKcdtw+YNrppMjil
	Hgr8O5HAaiTdvhTxIOHakg4M8FK1lnDq4Sho/v8fCJowVS7fpj1Mn2mX1lanD8uluoxKp9rZe4HH+
	j9xYUXXe5sLIWaS+1Z4rbIdqnqNktTuXlSmu5WfjbkYSylqznBHBBJVvKDTEPTvPgKwC65jXFC0BN
	LrwOIQWCmes++wF42WoBj/d5bdCDubGMY4hC2fv2ARlrqodaO86kWoqNyiZNugm52klvjxVp0TdoP
	gAdIyYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2he-006PXS-2h;
	Wed, 19 Jul 2023 08:38:34 +0000
Received: from 2.mo582.mail-out.ovh.net ([46.105.76.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2hb-006PST-1Y
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 08:38:33 +0000
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.1.59])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 14CB425348
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 08:38:18 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-2qd8k (unknown [10.110.208.152])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A7FE01FEA7;
	Wed, 19 Jul 2023 08:38:17 +0000 (UTC)
Received: from RCM-web8.webmail.mail.ovh.net ([151.80.29.22])
	by ghost-submission-6684bf9d7b-2qd8k with ESMTPSA
	id JR7mJ/mgt2TWOwAAhZ2Npw
	(envelope-from <rafal@milecki.pl>); Wed, 19 Jul 2023 08:38:17 +0000
MIME-Version: 1.0
Date: Wed, 19 Jul 2023 10:38:17 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Brian
 Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] mtd: rawnand: brcmnand: propagate init error
 -EPROBE_DEFER up
In-Reply-To: <20230719102438.73f8f353@xps-13>
References: <20230718163331.9116-1-zajec5@gmail.com>
 <20230719102438.73f8f353@xps-13>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9769f0bbe69dade81747a532ba81105f@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 11599583792017615706
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrgeeigddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjedvlefguedthfefleehgeeftdeludeluedvgfeffeevhfevtdehteejteefheegnecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipdduhedurdektddrvdelrddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_013831_665687_9F528189 
X-CRM114-Status: GOOD (  12.62  )
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

T24gMjAyMy0wNy0xOSAxMDoyNCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBSYWZhxYIsCj4g
Cj4gemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDE4IEp1bCAyMDIzIDE4OjMzOjMxICsw
MjAwOgo+IAo+PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+IAo+
PiBNVEQgc3Vic3lzdGVtIG1heSByZXR1cm4gLUVQUk9CRV9ERUZFUiBpZiBzb21ldGhpbmcgaXNu
J3QgcmVhZHkgeWV0Lgo+PiBJdCdzIGltcG9ydGFudCB0byBwYXNzIHRoYXQgZXJyb3IgdXAgc28g
ZGV2aWNlIHdpbGwgZ2V0IHByb2JlZCBsYXRlci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gLS0tCj4+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMiArKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMgCj4+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5h
bmQuYwo+PiBpbmRleCAzOTY2MWUyM2Q3ZDQuLmNjYTJiMTUzYWUyNiAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+PiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4+IEBAIC0zMjQ1LDYgKzMyNDUsOCBA
QCBpbnQgYnJjbW5hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgCj4+IHN0
cnVjdCBicmNtbmFuZF9zb2MgKnNvYykKPj4gCj4+ICAJCQlyZXQgPSBicmNtbmFuZF9pbml0X2Nz
KGhvc3QsIE5VTEwpOwo+PiAgCQkJaWYgKHJldCkgewo+PiArCQkJCWlmIChyZXQgPT0gLUVQUk9C
RV9ERUZFUikKPj4gKwkJCQkJZ290byBlcnI7Cj4gCj4gRG9uJ3Qgd2UgbmVlZCBhbiBvZl9ub2Rl
X3B1dChjaGlsZCkgaGVyZT8KCkdvb2QgY2F0Y2ghCgoKPj4gIAkJCQlkZXZtX2tmcmVlKGRldiwg
aG9zdCk7Cj4+ICAJCQkJY29udGludWU7IC8qIFRyeSBhbGwgY2hpcC1zZWxlY3RzICovCj4+ICAJ
CQl9Cj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
