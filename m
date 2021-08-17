Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AF8C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:50:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B2BB60F5E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B2BB60F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvKqW8jmqZVkx59r9M7XG1Doj5Y8B14hs6PA8ZBiSCA=; b=YG3ouHCvWEY/pc
	hyEWqFGp5CRtiZhkWB7C+9DhotqIyCQcQY5oLOvyplOUb79vevgVSCkFTIgqXq51TmxfF1pmlmDTD
	vP8nUcl9PTRxQdCD39JKY5pDTFM8hbD9GHnd1u4vddTD2Yr7ie18Nhr7m/YhIeTyGb1518wtW3Emf
	ZPpgDZd0FS+px/kogOw8fTzJXJBEy/61qZUF0RbtfzR1mRpx3xCZT5/EzVHgtmD/PX5QBbm4XMfaK
	Cj9Xb/uyGvZxV0YZTX0x+3uk3Vq92vvxL93meWiwqZuNjdB9SuNxlKs8leYzG8uF6J1DfVK0uR0hZ
	oruhRZxGJEqZVZd8Ychg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG2HQ-0031Wj-0M; Tue, 17 Aug 2021 16:49:36 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG2H9-0031Qz-Fv
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 16:49:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5921B240008;
 Tue, 17 Aug 2021 16:49:14 +0000 (UTC)
Date: Tue, 17 Aug 2021 18:49:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Ezequiel Garcia <ezequiel@collabora.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 3/3] mtdblock: Warn if the added for a NAND device
Message-ID: <20210817184913.5162b242@xps13>
In-Reply-To: <CAAEAJfDqEu0XtZ_FvVUM31p5PumPmK0x-r8sFWXzENDqf5zj_g@mail.gmail.com>
References: <20210801234509.18774-8-ezequiel@collabora.com>
 <20210806200537.394260-1-miquel.raynal@bootlin.com>
 <CAAEAJfDqEu0XtZ_FvVUM31p5PumPmK0x-r8sFWXzENDqf5zj_g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_094919_708766_6A09B650 
X-CRM114-Status: GOOD (  19.90  )
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

SGkgRXplcXVpZWwsCgpFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQHZhbmd1YXJkaWFzdXIuY29t
LmFyPiB3cm90ZSBvbiBUdWUsIDE3IEF1ZwoyMDIxIDEzOjI3OjU0IC0wMzAwOgoKPiBCb25qb3Vy
IE1pcXVlbCwKPiAKPiBPbiBGcmksIDYgQXVnIDIwMjEgYXQgMTc6MDUsIE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFN1biwgMjAyMS0w
OC0wMSBhdCAyMzo0NTowOSBVVEMsIEV6ZXF1aWVsIEdhcmNpYSB3cm90ZToKPiA+ID4gVGhlcmUg
aXMgYSBzdXJwcmlzaW5nbHkgbGFyZ2UgbnVtYmVyIG9mIHR1dG9yaWFscwo+ID4gPiB0aGF0IHN1
Z2dlc3QgdXNpbmcgbXRkYmxvY2sgdG8gbW91bnQgU3F1YXNoRlMgZmlsZXN5c3RlbXMKPiA+ID4g
b24gZmxhc2ggZGV2aWNlcywgaW5jbHVkaW5nIE5BTkQgZGV2aWNlcy4KPiA+ID4KPiA+ID4gVGhp
cyBhcHByb2FjaCBpcyBzdWJvcHRpbWFsIHRoYW4gdXNpbmcgVUJJLiBJZiB0aGUgZmxhc2ggZGV2
aWNlCj4gPiA+IGlzIE5BTkQsIHRoaXMgaXMgc3BlY2lhbGx5IHRydWUsIGR1ZSB0byB3ZWFyIGxl
dmVsaW5nLCBiaXQtZmxpcHMgYW5kCj4gPiA+IGJhZGJsb2Nrcy4gSW4gdGhpcyBjYXNlIFVCSSBp
cyBzdHJvbmdseSBwcmVmZXJyZWQsIHNvIGJlIG5pY2UgdG8gdXNlcnMKPiA+ID4gYW5kIHByaW50
IGEgd2FybmluZyBzdWdnZXN0aW5nIHRvIGNvbnNpZGVyIFVCSSBibG9jaywgaWYgbXRkYmxvY2sK
PiA+ID4gaXMgYWRkZWQgZm9yIGEgTkFORCBkZXZpY2UuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KPiA+Cj4gPiBBcHBs
aWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210
ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KPiA+Cj4gCj4gQW55IGNoYW5jZSB5b3UgcmVz
cGluIHRoaXMgb25lPwo+IAo+IEl0IGFwcGVhcnMgc29tZWhvdyB0aGlzIG1hZGUgaXRzIHdheSB0
byB0aGUgcGF0Y2g6Cj4gIlVudHJhY2tlZCBmaWxlcyBub3QgbGlzdGVkIiBzb3JyeSBhYm91dCB0
aGF0IC0tIGNvdWxkIHlvdSByZW1vdmUgaXQ/CgpZZWFoIG5vIHByb2JsZW0gYWJvdXQgdGhhdCwg
aXQgaGFwcGVucyA7KQoKPiBXaGlsZSB0aGVyZSwgeW91IGNhbiBmaXggdGhlIHR5cG8gaW4gdGhl
IGNvbW1pdCB0aXRsZToKPiAibXRkYmxvY2s6IFdhcm4gaWYgdGhlIGFkZGVkIGZvciBhIE5BTkQg
ZGV2aWNlIiAtPiAibXRkYmxvY2s6IFdhcm4gaWYKPiBhZGRlZCBmb3IgYSBOQU5EIGRldmljZSIK
CkRvbmUgYXMgd2VsbC4KCkNoZWVycyEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
