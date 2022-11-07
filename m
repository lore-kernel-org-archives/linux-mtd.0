Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA669C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmXxxGq+g5shaIX1umRyhjE6Ge6VwNKhAcnlTKrkALM=; b=zIEh/Tkd/AH5U9
	YWxDq1nXLcAgKTMTqH8lZbmASRtKsVhMbGMRbqw7vkoBajc9nqoyp79XUkl/MiQplc6xRITgnjGwU
	EVUFlgP8r2hQReSptvq+YSsEZMxu9o/0oYTC1YYqTr55tzgtLhIId8A+FNzfcgs68kgwjQXH4X0gA
	VJKaH31XPB2P+Eh48HXfT/q/6My11JycnrKWHm5pge7bfoMtGI8QzE77GmRqTIfisgNJDMGvWVdyx
	ViSLLnqkRiS1ogORAwuEPqewCBwa4DzHb6MykKE9TFGLh84L2XQJDKCkRstPAT2bdSkLlBdMRb95P
	Q7+ih0piLXJ0gZ7Yga1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os57b-00GFWZ-6E; Mon, 07 Nov 2022 16:37:15 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4ty-00G9Ba-Lc; Mon, 07 Nov 2022 16:23:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 97A2860011;
	Mon,  7 Nov 2022 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MOnSmGFEa4r00L7WXSL6QGydLMdsKXngB2IfSPB5BuU=;
	b=b6FTxnjuaC5M5YphQ0GsPxIt37gsLGPdBl3YsGBCRGNUeA/joJjDG9CfFE9w9R7yNIRDrq
	KksovDYtAKYf6IheJYJduT45qWjCMY3TPJ/E3uHlWzWvKyOmu7W+dMJ1SUPxLyMKeUuxVw
	JnDp10fcfqlah2El/qSPFmYpL0MLayvuMU9fHUH+pAOwhFziWSlxAjfEz0UAyHZnNGJNBO
	5FEkN5FWH8MRWgl48B+kGG3fFZuhUiErPyroJvqmZj2KTHbjiVSwCt/JFZ74YVIcrmOyzK
	g7pHqr8aIKbG22yojce7vgjcPYlNOzVG3as4y2uznyQcuR/ADk2SR+tJZHr9xw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	noreply@ellerman.id.au
Subject: Re: [PATCH 2/2] mtd: rawnand: lpc32xx_slc: Switch to using pm_ptr()
Date: Mon,  7 Nov 2022 17:23:03 +0100
Message-Id: <20221107162303.54160-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027131028.3838303-2-geert@linux-m68k.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bb144c285bd5585be101aaf5464ad8949ba1305d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082310_876052_8D30494A 
X-CRM114-Status: UNSURE (   9.52  )
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

T24gVGh1LCAyMDIyLTEwLTI3IGF0IDEzOjEwOjI4IFVUQywgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOgo+IFRoZSBzd2l0Y2ggdG8gdXNpbmcgdGhlIGdwaW9kIEFQSSByZW1vdmVkIHRoZSBsYXN0
IHVzZXIgb2YKPiBscGMzMnh4X3dwX2Rpc2FibGUoKSBvdXRzaWRlICNpZmRlZiBDT05GSUdfUE0s
IGNhdXNpbmcgYnVpbGQgZmFpbHVyZXMgaWYKPiBDT05GSUdfUE09bjoKPiAKPiAgICAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbHBjMzJ4eF9zbGMuYzozMTg6MTM6IGVycm9yOiDigJhscGMzMnh4X3dw
X2Rpc2FibGXigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0aW9u
XQo+ICAgICAgIDMxOCB8IHN0YXRpYyB2b2lkIGxwYzMyeHhfd3BfZGlzYWJsZShzdHJ1Y3QgbHBj
MzJ4eF9uYW5kX2hvc3QgKmhvc3QpCj4gICAgICAgICAgIHwgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+Cj4gCj4gRml4IHRoaXMgYnkgc3dpdGNoaW5nIGZyb20gI2lmZGVmIENPTkZJR19Q
TSB0byBwbV9wdHIoKSwgaW5jcmVhc2luZwo+IGNvbXBpbGUtY292ZXJhZ2UgYXMgYSBzaWRlLWVm
ZmVjdC4KPiAKPiBSZXBvcnRlZC1ieTogbm9yZXBseUBlbGxlcm1hbi5pZC5hdQo+IEZpeGVzOiA2
YjkyM2RiMjg2N2NiNWUxICgibXRkOiByYXduYW5kOiBscGMzMnh4X3NsYzogc3dpdGNoIHRvIHVz
aW5nIGdwaW9kIEFQSSIpCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQsIHRoYW5rcy4KCk1p
cXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
