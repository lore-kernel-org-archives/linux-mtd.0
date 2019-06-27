Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29941C48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 14:56:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEEDE20663
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 14:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GlHWEZdk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEEDE20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPDIyjp1l7OBtPSn3iMDtehZ92pGHDPS+35RpBVY1fc=; b=GlHWEZdkwfJTPy
	Mz3wb5WUymuQkP46S/eTMEF0/ZlZ6LVO+2WA0L7HufZZIV+B3QEBhfq8DXP7TtvKX5wwUB+TFR5W7
	mT+JzfTKx9ptHRFroHQlh9FFk+zT+UIuv+XgHoaSmmxYyVLjcZ+l5zjT1Vw0r2hGRDj/wtt+osO78
	eTjW8uM1zonF5dFiBgLWwzc6GrDCzPIMrGJidhhDbdf0w0fSpkT0kwHlBF+p83aMkhcWmgUT03etY
	kXr8UDevVCGJiMKsd55rQNEG++OpE91ToFJtZzSN6fB9a2g2Lq3io+h7hWGtieTe0BdSnTfWGUGG9
	7i5OJgiidF3pZmTGUPbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgVp4-0007oZ-GS; Thu, 27 Jun 2019 14:56:26 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgVp2-0007nQ-IH
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 14:56:26 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1884A240014;
 Thu, 27 Jun 2019 14:56:14 +0000 (UTC)
Date: Thu, 27 Jun 2019 16:56:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: nand: raw: brcmnand: Refactored code to
 introduce helper functions
Message-ID: <20190627165613.0bbe4304@xps13>
In-Reply-To: <1559659013-34502-1-git-send-email-kdasu.kdev@gmail.com>
References: <1559659013-34502-1-git-send-email-kdasu.kdev@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_075624_768391_8DF05525 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gVHVl
LCAgNCBKdW4gMjAxOSAxMDozNjoyOQotMDQwMDoKCj4gUmVmYWN0b3JlZCBOQU5EIEVDQyBhbmQg
Q01EIGFkZHJlc3MgY29uZmlndXJhdGlvbiBjb2RlIHRvIHVzZSBoZWxwZXIKPiBmdW5jdGlvbnMu
Cj4gCgpJJ2xsIHRha2UgdGhpcyBzZXJpZXMgYW5kIGVkaXQgbXlzZWxmIHRoZSBjb21taXQgdGl0
bGUgYnV0IGZvciBuZXh0IHRpbWUKcGxlYXNlIGNoYW5nZSB0aGUgc3ViamVjdCB0byAibXRkOiBy
YXduYW5kOiIgOykKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
