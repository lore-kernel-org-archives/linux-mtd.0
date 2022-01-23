Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A04CC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtcviI5qD/wuIdIhvhSGnIsaRLNP+I0W8QN/B6GbtHA=; b=NXklNmeByXiXca
	D24kiY5iWGIoLyc6HOsBpSkt7XgWOH7ZUGiSN9xxo9qPeUZtJK5P5L4dq6UtxPiepfdYOFDRGJD6h
	djJzxqG0cjUR3HqaQn4MM4k7/eQF61IyvObq/b8di5Z4+yVk61LaRz+7Qrg7D4o63dAdxb0sxTWql
	o3G3lTBa9bZkdsKjUkbfMR11qp9oYCP8hdXFxof0bo0YII/R4+Wpx9S/HTzye8O3TU6XxRz0Bw4oY
	QqrnJoyL/Ap+lLhtmUS5tX3lCjCgE92AgUM2AEcHoDHkjdwYUQPsfQ7x1oarmB4aq9sg0OW6nJ5A5
	yHbsKoqfGuR2/UD/uvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBf8e-001Bxy-ID; Sun, 23 Jan 2022 15:50:44 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBf0a-00198Y-R8
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:42:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7FAF8FF803;
 Sun, 23 Jan 2022 15:42:21 +0000 (UTC)
Date: Sun, 23 Jan 2022 16:42:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Cai
 Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list), linux-wireless@vger.kernel.org
 (open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)),
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: Re: [PATCH v3 0/9] BCMA support for brcmnand
Message-ID: <20220123164220.58f01b76@xps13>
In-Reply-To: <20220107184614.2670254-1-f.fainelli@gmail.com>
References: <20220107184614.2670254-1-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_074225_229458_95F5684E 
X-CRM114-Status: GOOD (  16.01  )
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

SGkgRmxvcmlhbiwKCmYuZmFpbmVsbGlAZ21haWwuY29tIHdyb3RlIG9uIEZyaSwgIDcgSmFuIDIw
MjIgMTA6NDY6MDUgLTA4MDA6Cgo+IEhpIGFsbCwKPiAKPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRz
IHN1cHBvcnQgZm9yIHRoZSBCUkNNTkFORCBjb250cm9sbGVyIHJldmlzaW9uIDMuNAo+IGVtYmVk
ZGVkIGluIE1JUFMtYmFzZWQgU29DcyBzdWNoIGFzIDUzNTcsIHR5cGljYWxseSBmb3VuZCBpbiB0
aGUgTmV0Z2Vhcgo+IFdOUjM1MDBMIHYyIGFuZCBvdGhlciBraW5kcyBvZiBXaS1GaSByb3V0ZXJz
LiBUaGUgdXBzdHJlYW0gcGxhdGZvcm0gdGhhdAo+IHVzZXMgdGhpcyBjb250cm9sbGVyIGlzIHVu
ZGVyIGFyY2gvbWlwcy9iY200N3h4LyBhbmQgZG9lcyBub3QgdXNlIERldmljZQo+IFRyZWUgKGFu
ZCBwcm9iYWJseSBuZXZlciB3aWxsIGJ5IG5vdykuIEJDTUEgKEJyb2FkY29tIEFNQkEpIGlzIGEg
c3BlY2lhbAo+IGtpbmQgb2YgZGlzY292ZXJhYmxlIG1lbW9yeSBtYXBwZWQgaW50ZXJmYWNlIHdo
aWNoIHJlcXVpcmVzIHRoZSB1c2Ugb2YKPiBzcGVjaWFsIGFjY2Vzc29ycyB0byByZWFkIGZyb20v
d3JpdGUgdG8gdGhlIGhhcmR3YXJlIGJsb2NrLgo+IAo+IFRoZSBpbnRlZ3JhdGlvbiBvZiBicmNt
bmFuZCBpbnRvIHRoYXQgU29DIGlzIGEgYml0IHF1aXJreSBpbiB0aGF0IGV2ZXJ5Cj4gcmVnaXN0
ZXIgb2ZmZXJpbmcgYnl0ZSBsZXZlbCBkYXRhIGFib3V0IHRoZSBmbGFzaCAoT09CLCBkZXZpY2Ug
SUQsIGV0Yy4pCj4gcmVxdWlyZXMgYnl0ZSBzd2FwcGluZy4gVGhlIGNvbW1hbmQgc2hpZnQgc2hv
dWxkIGFsc28gaGF2ZSBiZWVuIDI0LCBidXQKPiBpcyBpbiBmYWN0IDAsIHRvb2sgbWUgYSB3aGls
ZSB0byB1bmRlcnN0YW5kIHdoeSBubyByZWFkcyB3ZXJlIGFjdHVhbGx5Cj4gd29ya2luZyBiZWNh
dXNlIG9mIHRoYXQuCj4gCj4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBMaW51eCA1LjEwLjgy
IGFuZCBMaW51cycgbWFzdGVyIHdpdGggT3BlbldydAo+IGFuZCBjb25maXJtZWQgdGhhdCB0aGUg
c3F1YXNoZnMgKyBqZmZzMiBvdmVybGF5IHRoYXQgT3BlbldydCBjcmVhdGVzIGlzCj4gZW50aXJl
bHkgZnVuY3Rpb25hbCBhbmQgdGhhdCB3cml0dGVuIGRhdGEgaXMgbWFkZSBwZXJzaXN0ZW50LgoK
U2VyaWVzIGFwcGxpZWQgb24gbmFuZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
