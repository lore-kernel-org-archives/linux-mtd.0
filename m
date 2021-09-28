Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5C0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 12:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F51A610CC
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 12:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F51A610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGPVsNyoMxBZ/hmvPLOAl6JN1T/Eqo6Y2ThTo0Mu7WY=; b=JvCPDgtNlcqCZB
	awcUt6gI9o+G4RnGKvUlKkN904rpdh98INysWgtLIzsnJ4ZH4iwEkyddvG5uCLozpO402Q5A9SkmA
	E+KDSSiLj4jUFbHg94pJiUWU8G5zyjCrZ8SLs3PeCK2Qr9MCRuct2zhlfabH1hIGwDU4GPTMwpg3M
	sZwWy+kFrYHT1kBmqgjc+SLe954uJQ0/kIQs5o3lmWylrYic1DFG3KuBmJQSlawmDhDWagzcw+A9a
	2uova09aBA6ZsmA8h587XG7Tx00pPfa5USfScdJxJOXbZPF+V1h8NP6Brx1uNn2ItUr2i+MeRO/Eq
	H2Fb1qylf4IUcGEbjvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVCXJ-007DQ3-7W; Tue, 28 Sep 2021 12:48:41 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVCXD-007DNz-Cs
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 12:48:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0A9DDFF803;
 Tue, 28 Sep 2021 12:48:32 +0000 (UTC)
Date: Tue, 28 Sep 2021 14:48:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mdalam@codeaurora.org
Cc: mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH 2/3] mtd: rawnand: qcom: Add sg list to handle status
 pipe request
Message-ID: <20210928144832.02e86fe1@xps13>
In-Reply-To: <07b52169db478045d409def2b5f55b01@codeaurora.org>
References: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
 <1631699851-12172-3-git-send-email-mdalam@codeaurora.org>
 <07b52169db478045d409def2b5f55b01@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_054835_614076_8F76DA46 
X-CRM114-Status: GOOD (  10.61  )
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

SGVsbG8sCgptZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gVHVlLCAyOCBTZXAgMjAyMSAx
Nzo1MDowNiArMDUzMDoKCj4gT24gMjAyMS0wOS0xNSAxNToyNywgTWQgU2FkcmUgQWxhbSB3cm90
ZToKPiA+IEZyb20gUVBJQyBWMi4wIG9ud2FyZHMgdGhlcmUgaXMgc2VwYXJhdGUgcGlwZSB0byBy
ZWFkIHN0YXR1cwo+ID4gZm9yIGVhY2ggY29kZSB3b3JkIHdoaWxlIHJlYWRpbmcgaW4gZW5oYW5j
ZWQgbW9kZS4KCldoYXQgaXMgZW5oYW5jZWQgbW9kZT8KCj4gcGFnZSBzY29wZSByZWFkIGFuZCBt
dWx0aSBwYWdlIHJlYWQuCgpUaGlzIGlzIG5vdCBhIGNvcnJlY3Qgc2VudGVuY2UuCgo+ID4gVGhp
cyBzZ2wgbGlzdCB3aWxsIGJlIHVzZSB0byBoYW5kbGUgdGhlIHJlcXVlc3QgdmlhIHN0YXR1cyBw
aXBlCgogICAgICAgICBeXl4gICAgICAgICAgICAgIHVzZWQgICAgICAgICAgICAgICAgICAgICAg
ICAgIHRoZQoKUGxlYXNlIHVzZSBwbGFpbiBlbmdsaXNoIGluIHRoZSBjb21taXQgZGVzY3JpcHRp
b24uCgo+ID4gZHVyaW5nIHBhZ2Ugc2NvcGUgYW5kIG11bHRpIHBhZ2UgcmVhZC4KCldoYXQgaXMg
cGFnZSBzY29wZT8KCj4gPiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29k
ZWF1cm9yYS5vcmc+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
