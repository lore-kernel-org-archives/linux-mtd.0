Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D161BC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:01:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C8A260240
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C8A260240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZqhiBMrlPwAcB6P/+D8CdeDUYNTkUH2BKpIplBiVm3o=; b=qIGqkBOSIdqlEToSu60HsDEtI
	y6v3ND1PZfmwIyE7uhrtfq1gfyQA8gREiPjuRCb/vc9DXisZotj8Qyo52FsgmBEzGiTSbmYL/m1Li
	YH/dGw7eAx7wXjvtgzLETDEOTaTTWFBA0AutArNW09A3bp43n6m2tyxyKfbM5TJlQLwhiqwl23KzL
	7b9Sv57DgeCWguPaqWjdm1TYtG+LGkefKN2PCpUejlL4OjjbxjPvqjeknL0LxjH7LrfdFYFd8WJ4E
	3eQ3H2Nl6i310qkML/U0xWQ7Cz/2FTnNepwueAgoAGqi2EqHkl2HdlzWnH4r0VpmqJwQDCzDY4aZw
	9SMkkoAqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSz4-005Gae-Cf; Wed, 03 Mar 2021 15:00:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSBe-0054Rr-Sg
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=4oqm/8q5NM5LJ2woJXWQzlpCOA85F8dPXYwlBYkvDfo=; b=ps/bQTDwwqEdsiY6J006wcUf9v
 rlqGKPEd6ouo/EA4OMHZn5hvHz9ArEe6qJrQ4yYvaze4TbB2bOCESku0bELsjDLrBq5pDBzkuCgU5
 aZYOEQUwrnpqBREH5iTOkt8N2IiFxrTk+KOqrWMwoJH2HEwmMuZOZADGIIU6sovgFRDslpost+P9D
 4uT/GtmmeMsQw/5rSFINUzwDv5699lvvArcp39Flq8oJkoTnOiRuSETivw/jz4yBdA5SeORqKEpPD
 73k2gWtEkTMfUqaWrDOR+sjV09OU4f1xJrYdpwVWU5GqfBZtcEu5DdwBOA7vPOCHFgfk/swGll5w8
 Yk7Gd/3A==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7wu-00HSBr-5h
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:32:43 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 94CF71BF208;
 Tue,  2 Mar 2021 16:32:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 f.fainelli@gmail.com, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nand: brcmnand: fix OOB R/W with Hamming ECC
Date: Tue,  2 Mar 2021 17:32:12 +0100
Message-Id: <20210302163212.23060-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224080210.23686-1-noltari@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 095b4dabff2a929cefd330110c5c578956213188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163243_236002_80F8B1E7 
X-CRM114-Status: UNSURE (   7.43  )
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

T24gV2VkLCAyMDIxLTAyLTI0IGF0IDA4OjAyOjEwIFVUQywgPT91dGYtOD9xPz1DMz04MWx2YXJv
X0Zlcm49QzM9QTFuZGV6X1JvamFzPz0gd3JvdGU6Cj4gSGFtbWluZyBFQ0MgZG9lc24ndCBjb3Zl
ciB0aGUgT09CIGRhdGEsIHNvIHJlYWRpbmcgb3Igd3JpdGluZyBPT0Igc2hhbGwKPiBhbHdheXMg
YmUgZG9uZSB3aXRob3V0IEVDQyBlbmFibGVkLgo+IFRoaXMgaXMgYSBwcm9ibGVtIHdoZW4gYWRk
aW5nIEpGRlMyIGNsZWFubWFya2VycyB0byBlcmFzZWQgYmxvY2tzLiBJZiBKRkZTMgo+IGNsZW5t
YXJrZXJzIGFyZSBhZGRlZCB0byB0aGUgT09CIHdpdGggRUNDIGVuYWJsZWQsIE9PQiBieXRlcyB3
aWxsIGJlIGNoYW5nZWQKPiBmcm9tIGZmIGZmIGZmIHRvIDAwIDAwIDAwLCByZXBvcnRpbmcgaW5j
b3JyZWN0IEVDQyBlcnJvcnMuCj4gCj4gRml4ZXM6IDI3YzViMTdjZDFiMSAoIm10ZDogbmFuZDog
YWRkIE5BTkQgZHJpdmVyICJsaWJyYXJ5IiBmb3IgQnJvYWRjb20gU1RCIE5BTkQgY29udHJvbGxl
ciIpCj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdt
YWlsLmNvbT4KPiBBY2tlZC1ieTogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFp
bC5jb20+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
