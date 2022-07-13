Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB07C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jul 2022 12:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:From:
	Date:Subject:To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K3rpYmAg3uNNFPWK44TVu0NZum6xxIcLWtkdlF99w7o=; b=rT+pgQGrqTUQ17
	qMLw0Mm/GAwMLJ1AZWKV8yT9krlLQeuXRYVnnQcbm4R0xrULQIWsg/GvZWduODCSVMSFPvGm/osSx
	hG2LbdE1sJlVms3REFdia9puusPBJhLLSPDNG5EfbsNJ3YFsCZJVyYDJQ9TkqEDZjWTVrXJXxGqHb
	zfZHYVYyu+cvSKBLYQWQuL+NVV5nKzaDXwNGLmg4evPDyuKP99fybPRTzD6MGpDEiW/D3yA5thtXA
	oywsn5IBLhpiZRj0YfOJTQOQlUuHnv7EU8OMTZxNUkYp6Uhd20f6HrSyS3pbPkQpTM4GwYRUTXLy5
	HYOPHrI9U2/P60xSEyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBbLC-003Sda-PL; Wed, 13 Jul 2022 12:19:42 +0000
Received: from [62.210.166.44] (helo=platform.vmzinc.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBbL6-003Sa6-BG
	for linux-mtd@lists.infradead.org; Wed, 13 Jul 2022 12:19:41 +0000
Received: from www-data by platform.vmzinc.com with local (Exim 4.80)
	(envelope-from <contact@vmzinc.com>)
	id 1oBafJ-0004NK-Az
	for linux-mtd@lists.infradead.org; Wed, 13 Jul 2022 13:36:25 +0200
To: linux-mtd@lists.infradead.org
Subject: =?utf-8?B?S29udG9kZXRhbGplciBmb3Ig0J/QvtC30LTRgNCw0LLQu9GP0LXQvCDQktCw?=  =?utf-8?B?0YEg0YEg0J/QvtCx0LXQtNC+0Lkg0LIg0JPQvtGB0JvQvtGC0L4hINCe0YI=?=  =?utf-8?B?0LrRgNGL0YLRjCDQktCw0Ygg0LLRi9C40LPRgNGL0YjQvdGL0Lkg0LHQuNC7?=  =?utf-8?B?0LXRgjogaHR0cHM6Ly90aW55dXJsLmNvbS8yaGszYmpueQ==?=  =?utf-8?B?IGhvcyBWTVpJTkM=?=
X-PHP-Originating-Script: 1001:phpmailer.php
Date: Wed, 13 Jul 2022 13:36:25 +0200
From: "Vmzinc.com" <contact@vmzinc.com>
Message-ID: <77b25751bc04cd12f763bc1554e0ccb6@www.vmzinc.no>
X-Priority: 3
X-Mailer: PHPMailer 5.2.1 (http://code.google.com/a/apache-extras.org/p/phpmailer/)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_051936_532278_D3206F65 
X-CRM114-Status: UNSURE (  -0.22  )
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
Reply-To: "Vmzinc.com" <contact@vmzinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVqINCf0L7Qt9C00YDQsNCy0LvRj9C10Lwg0JLQsNGBINGBINCf0L7QsdC10LTQvtC5INCyINCT
0L7RgdCb0L7RgtC+ISDQntGC0LrRgNGL0YLRjCDQktCw0Ygg0LLRi9C40LPRgNGL0YjQvdGL0Lkg
0LHQuNC70LXRgjogaHR0cHM6Ly90aW55dXJsLmNvbS8yaGszYmpueSwKClRhayBmb3IgZGluIHJl
Z2lzdHJlcmluZyBww6UgVk1aSU5DLiBEaW4ga29udG8gZXIgb3ByZXR0ZXQgb2cgc2thbCBha3Rp
dmVyZXMgaW5kZW4gZHUga2FuIGJydWdlIGRlbi4KRm9yIGF0IGFrdGl2ZXJlIGtvbnRvZW4gc2th
bCBkdSBrbGlra2UgcMOlIGRldCBmw7hsZ2VuZGUgbGluayBlbGxlciBrb3BpZXJlLWluZHPDpnR0
ZSBkZXQgaSBkaW4gYnJvd3NlcjoKaHR0cHM6Ly93d3cudm16aW5jLm5vL2NvbXBvbmVudC91c2Vy
cy8/dGFzaz1yZWdpc3RyYXRpb24uYWN0aXZhdGUmdG9rZW49YmQyMDE2YjNjN2Y0YjI2YzQ4MmVm
N2ZjMTA1YmNiYTUgCgpFZnRlciBha3RpdmVyaW5nIGthbiBkdSBsb2dnZSBww6UgaHR0cHM6Ly93
d3cudm16aW5jLm5vLyBtZWQgZGV0IGbDuGxnZW5kZSBicnVnZXJuYXZuIG9nIGFkZ2FuZ3Nrb2Rl
OgoKQnJ1Z2VybmF2bjogYWRrYXB1bmt0YWwxOTgxCkFkZ2FuZ3Nrb2RlOiAxa3ZyVUU1Nm1KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
