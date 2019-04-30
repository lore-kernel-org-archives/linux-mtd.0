Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6694AC43219
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 06:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3547420835
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 06:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="svDyovQb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3547420835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CeIWeSU5AaK/7XNgi8SYdNCMlGi75KuVSIvRk7GyijU=; b=svDyovQb1t7pUJ
	/Ny0bu3HhlQKo69DC2YlqL+LW1En72hUtQ9trZZGqnP9BcDmFmIoJMSpGvw7rV3dPD/Oz45z+8mqL
	EPRpxoNcln8tXSCYeVqXq6F2REyz2vkL6sCw8+JvAf5YJTKFvRiH3CSiR83W5Icc1NhZ3/0qpmj+n
	fnOu1R7u+fVjJrZakUZhtD+Qr/Bdz+Axamkco8/hK7Ifd/84LylQ+gVFTxTBIOZFR2bhJhx6CM7Uz
	plgorHcDL5ncAPlxzloGLHncR7qCTIeR2vzHtIbuK1nBNg+Ehrdc17CadKYPvhaAtADv364YZtorj
	4hwKgz29SK2f+VTbTmHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLMIR-0000tZ-Aq; Tue, 30 Apr 2019 06:31:19 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLMIN-0000tB-GY
 for linux-mtd@lists.infradead.org; Tue, 30 Apr 2019 06:31:17 +0000
X-Originating-IP: 81.185.165.117
Received: from xps13 (117.165.185.81.rev.sfr.net [81.185.165.117])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 46E011C0003;
 Tue, 30 Apr 2019 06:31:01 +0000 (UTC)
Date: Tue, 30 Apr 2019 08:30:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [PATCH 1/4] mtd: rawnand: Turn the ONFI support to generic
Message-ID: <20190430083059.629e0bf1@xps13>
In-Reply-To: <MN2PR08MB5951BDBAC83D3D04B3B122A5B85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <MN2PR08MB5951BDBAC83D3D04B3B122A5B85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_233115_704476_71C72730 
X-CRM114-Status: GOOD (  10.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmFtdXJ0aHksCgpTb3JyeSBmb3IgdGhlIGxvbmcgZGVsYXkgSSB3YXMgYSBiaXQgb3Zl
cmxvYWRlZC4KCiJTaGl2YW11cnRoeSBTaGFzdHJpIChzc2hpdmFtdXJ0aHkpIiA8c3NoaXZhbXVy
dGh5QG1pY3Jvbi5jb20+IHdyb3RlIG9uClR1ZSwgMjYgTWFyIDIwMTkgMTA6NTE6NDcgKzAwMDA6
Cgo+IEZpeCBoZWFkZXJzIHRvIG1ha2Ugd2F5IGZvciBhZGRpbmcgaGVscGVyIGZ1bmN0aW9ucy4K
PiAKPiBBZGQgb25maSBoZWxwZXIgc3RydWN0dXJlLgo+IAo+IEFkZCBoZWxwZXIgZnVuY3Rpb25z
IGluIHJhdyBOQU5EIGNvcmUsIHdoaWNoIGxhdGVyIHdpbGwgYmUgdXNlZCBkdXJpbmcKPiBPTkZJ
IGRldGVjdGlvbi4KPiAKCkFzIHlvdSBhcmUgdG91Y2hpbmcgdGhlIGNvcmUsIEkgbmVlZCB0byBp
ZGVudGlmeSBjbGVhcmx5IGVhY2ggY2hhbmdlCnlvdSBtYWtlOyB0eXBpY2FsbHkgaW4gdGhpcyBj
b21taXQgeW91IGRvIHNldmVyYWwgZGlmZmVyZW50IGNoYW5nZXMuClBsZWFzZSBzcGxpdCB0aGlz
IHBhdGNoIGluIHNtYWxsIG1lYW5pbmdmdWwgcGVhY2VzLgoKPiBTaWduZWQtb2ZmLWJ5OiBTaGl2
YW11cnRoeSBTaGFzdHJpIDxzc2hpdmFtdXJ0aHlAbWljcm9uLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvaW50ZXJuYWxzLmggfCAgIDYgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9iYXNlLmMgfCAyMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYyB8IDIxNSArKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvbXRkL25hbmQuaCAgICAgICAgIHwgIDMwICsrKysK
PiAgaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oICAgICAgfCAgIDUgKwo+ICA1IGZpbGVzIGNo
YW5nZWQsIDI4OSBpbnNlcnRpb25zKCspLCAyMDMgZGVsZXRpb25zKC0pCj4gCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
