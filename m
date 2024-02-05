Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B4CC4828D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugdapNpqBxRPfq0lkl9+zd6rW90zxpLMelNltupRFTE=; b=LGEZvRWt4Z06U2
	8V67qro4TZUz3Rl0xwKCSYUaShJIFo6UvprHi7Q9fdS7gTAJbFear4FIehs2Sgdzhnk/7rWEDbGVH
	ZXoQStDMVtCXJ70V/8YiPAuT96usfDNqX2FW8wBIkF4mS4OTf8Hee+6ucAO2WKIywyk4769k38ife
	MHxHR+/oETUG/FQNlxWVkKY1bPwclQr4eF+3Piwk6ckagHHLA+eJShUHWACntInypxS8Fm8ZrgHzp
	lC9Yp40NpLSH3bn6YC5hFxkhv4j95Y+cZED7ZkgGhYE3Grq27WUR6rmC4jZgh15bqNoXSsLxJZi1u
	T6aPXVO0IkGMv+Y7Hdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0JA-00000003g3H-0Vrv;
	Mon, 05 Feb 2024 14:50:52 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0J6-00000003g03-2XCZ
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 14:50:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFD2B40014;
	Mon,  5 Feb 2024 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707144643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvT/GWiXuIsGbYnUVwWTujkFZCfsuu7xNTiRILQO4ho=;
	b=gzrkoLuV+KHRXUgaI9cv0hdYXd/jbTkEyDwkuc9otKaIThRwpk9b+IQWa9DbKoza5RYUC9
	OjpFNs3jvZM6DtHEw7e/cmXSeoV89Ef87UQlWpvmOg5Di/Fakb4YfuVLz0s2OQsLqryyop
	RNWV4krRZ6ie6yoNAsOAzVECqfXXNqfm+JET/xx2q56Cq3c2/LhFFubYgto0cpsbXpBM1/
	9itBgGiMtgbnl6iCu3lOJKXMByRGBwD5xB49oseXmi4DiWrRloryxGPDMO4+N25A3VfMAH
	izaexojdnvTxQUxMNV7JYfzxtk3DuqJxyb0bPZwsUHQAsyFk8kbJ3/ONgW7ZNA==
Date: Mon, 5 Feb 2024 15:50:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, LKML
 <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: Re: [PATCH 0/3] mtd: ssfdc: Adjustments for ssfdcr_add_mtd()
Message-ID: <20240205155041.1edfc38b@xps-13>
In-Reply-To: <74183091-4c8d-4c92-b3f9-cebaacb41efd@web.de>
References: <74183091-4c8d-4c92-b3f9-cebaacb41efd@web.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_065048_835362_8675F5F0 
X-CRM114-Status: GOOD (  10.35  )
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

SGkgTWFya3VzLAoKTWFya3VzLkVsZnJpbmdAd2ViLmRlIHdyb3RlIG9uIFdlZCwgMjcgRGVjIDIw
MjMgMTU6NDM6MDYgKzAxMDA6Cgo+IEZyb206IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJz
LnNvdXJjZWZvcmdlLm5ldD4KPiBEYXRlOiBXZWQsIDI3IERlYyAyMDIzIDE1OjM4OjQyICswMTAw
Cj4gCj4gQSBmZXcgdXBkYXRlIHN1Z2dlc3Rpb25zIHdlcmUgdGFrZW4gaW50byBhY2NvdW50Cj4g
ZnJvbSBzdGF0aWMgc291cmNlIGNvZGUgYW5hbHlzaXMuCj4gCj4gTWFya3VzIEVsZnJpbmcgKDMp
Ogo+ICAgT25lIGZ1bmN0aW9uIGNhbGwgbGVzcyBhZnRlciBlcnJvciBkZXRlY3Rpb24KPiAgIEZp
eCBpbmRlbnRhdGlvbgo+ICAgSW1wcm92ZSBhIHNpemUgZGV0ZXJtaW5hdGlvbgo+IAo+ICBkcml2
ZXJzL210ZC9zc2ZkYy5jIHwgNyArKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gLS0KPiAyLjQzLjAKPiAKClNlcmllcyBhcHBsaWVk
IG9uIHRvcCBvZiBtdGQvbmV4dC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
