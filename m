Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2A8C2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 09:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bJPDVscqCKznhjlmbD1BMd2C5YHQ8T0CjwzVXyklxIM=; b=ncM/Tsh+frHS4XVYV5tPWyDTH/
	0vXlg191aLps4n0bAooZxLGjm57BsTYkchzr3NsVjdAOZstCTqR+Nr0l+QzVsPoLKKXVGEXhVga/v
	KZZZUzsNeEQ6FVIvlDIrcjGA95ko2RprZAKPcTfRhHtJHUTokaJUxw55a9QfP5oTtjrnEuJayeLVE
	vTRy2AFTBJWT7f/4zKing2q+r5VCc9rQczBJROTUfI4F0fhndO7IMFRK7/HYVs558vtUP0RZLGLGb
	Q7ql83sMQMdCOGjUoLHVTCzmCHcpnKIz7yDhMcDPzJa2xAM594SQpdPoNee0N96CpmEnnwPkyp6IN
	Cx+zX9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCeIN-00ArNR-Go; Wed, 26 Jan 2022 09:08:51 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCeIK-00ArKF-4b
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 09:08:49 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CD33060F6B7A;
 Wed, 26 Jan 2022 10:08:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dIlqLNVsVTqD; Wed, 26 Jan 2022 10:08:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5043362DA600;
 Wed, 26 Jan 2022 10:08:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EiNRw8Th-YAu; Wed, 26 Jan 2022 10:08:43 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2A48A62DA5F6;
 Wed, 26 Jan 2022 10:08:43 +0100 (CET)
Date: Wed, 26 Jan 2022 10:08:43 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: David Decotigny <decot+git@google.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 David Decotigny <ddecotig@google.com>
Message-ID: <1788102040.295765.1643188123063.JavaMail.zimbra@nod.at>
In-Reply-To: <20220126085735.575625-1-decot+git@google.com>
References: <20220126085735.575625-1-decot+git@google.com>
Subject: Re: [PATCH RFC v1 1/1] mtd_blkdevs: avoid soft lockups with some
 mtd/spi devices
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF96 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd_blkdevs: avoid soft lockups with some mtd/spi devices
Thread-Index: 7VNwHvC77lwvVOD8Pm7M1mqeog4vaw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_010848_383619_226D1239 
X-CRM114-Status: UNSURE (   7.71  )
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

RGF2aWQsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiRGF2aWQgRGVj
b3RpZ255IiA8ZGVjb3QrZ2l0QGdvb2dsZS5jb20+Cj4gQW46ICJsaW51eC1rZXJuZWwiIDxsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+IENDOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIlZpZ25lc2gg
UmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+ICJsaW51eC1tdGQiIDxsaW51eC1tdGRA
bGlzdHMuaW5mcmFkZWFkLm9yZz4sICJEYXZpZCBEZWNvdGlnbnkiIDxkZGVjb3RpZ0Bnb29nbGUu
Y29tPgo+IEdlc2VuZGV0OiBNaXR0d29jaCwgMjYuIEphbnVhciAyMDIyIDA5OjU3OjM1Cj4gQmV0
cmVmZjogW1BBVENIIFJGQyB2MSAxLzFdIG10ZF9ibGtkZXZzOiBhdm9pZCBzb2Z0IGxvY2t1cHMg
d2l0aCBzb21lIG10ZC9zcGkgZGV2aWNlcwoKPiBGcm9tOiBEYXZpZCBEZWNvdGlnbnkgPGRkZWNv
dGlnQGdvb2dsZS5jb20+Cj4gCj4gV2l0aCBzb21lIHNwaSBkZXZpY2VzLCB0aGUgaGVhdnkgY3B1
IHVzYWdlIGR1ZSB0byBwb2xsaW5nIHRoZSBzcGkKPiByZWdpc3RlcnMgbWF5IGxlYWQgdG8gbmV0
ZGV2IHRpbWVvdXRzLCBSQ1UgY29tcGxhaW50cywgZXRjLiBUaGlzIGNhbgo+IGJlIGFjdXRlIGlu
IHRoZSBhYnNlbmNlIG9mIENPTkZJR19QUkVFTVBULiBUaGlzIHBhdGNoIGFsbG93cyB0byBnaXZl
Cj4gZW5vdWdoIGJyZWF0aGluZyByb29tIHRvIGF2b2lkIHRob3NlIGZhbHNlIHBvc2l0aXZlcy4K
CmlzIHRoZSBwcm9ibGVtIHJlYWwgb3Igbm90PyBGcm9tIHlvdXIgZGVzY3JpcHRpb24gaXQgaXMg
bm90IGNsZWFyIHRvIG1lLgpQbGVhc2UgaW5jbHVkZSBsb2NrZGVwIHNwbGF0cyBhbmQvb3IgaHVu
Zy10YXNrIGxvZ3MgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKSSBoYXZlIG5vIHByb2JsZW0gd2l0
aCBhZGRpbmcgYSBjb25kX3Jlc2NoZWQoKSBidXQgZmlyc3Qgd2UgbmVlZCB0bwp1bmRlcnN0YW5k
IHRoZSBpc3N1ZSBhIGxpdHRsZSBiZXR0ZXIuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
