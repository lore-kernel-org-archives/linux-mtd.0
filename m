Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD9AC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 14:23:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A2B6126A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 14:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5A2B6126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0qMY3Bdjgy9CMJMtZioZVleO+uojDw/rKq1AntlzOY=; b=meq7Pgy2Dy8yLm
	hyJ/sUlul0QwplBvRI0KnKdJer2iKMcTdZ2hM622/bQDijURCM4hRNr+VKnPW+/N4eAQSQOH8RP6U
	sDoq33JQ62WNxEM4f5/Xl59QTBMn1+mGVCmGuy7RDhq0Jb0bl/rv0mSQB0dPNpNdfRytFIHwmx+HS
	lsAWDzxlMXB6ImoGz6JRdVS/+bbJeU9e1MqDlqmLhI5OcteH+TyVksvjpzUuk0nN/XJSistVla8El
	mGXFP22CdcJ5q3K86h4z+hLgGVGAatQ6+eZ03ErqjcWTQ/USG2rPU1eZpZ5EgdG7BAcie1xXp/lJV
	oyCZDEoQ3BFvjL50eJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVwxk-00EgLz-0k; Thu, 30 Sep 2021 14:23:04 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVwxX-00EgKh-V4
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 14:22:53 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A3CAF1F44DAD;
 Thu, 30 Sep 2021 15:22:49 +0100 (BST)
Date: Thu, 30 Sep 2021 16:22:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Boris
 Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: add MEMREAD ioctl
Message-ID: <20210930162246.61359ea7@collabora.com>
In-Reply-To: <YVXBf0v0AQ5+G9dt@larwa.hq.kempniu.pl>
References: <20210920070221.10173-1-kernel@kempniu.pl>
 <20210928155859.433844cb@xps13>
 <20210928162402.6bb64fcf@collabora.com>
 <20210928163519.08cd1138@xps13>
 <YVTBoAnQKYLNpOPc@larwa.hq.kempniu.pl>
 <20210930085133.13b5a228@collabora.com>
 <20210930104721.03dc45bb@xps13>
 <YVXBf0v0AQ5+G9dt@larwa.hq.kempniu.pl>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_072252_150270_9F844C61 
X-CRM114-Status: UNSURE (   9.48  )
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

T24gVGh1LCAzMCBTZXAgMjAyMSAxNTo1NDowNyArMDIwMApNaWNoYcWCIEvEmXBpZcWEIDxrZXJu
ZWxAa2VtcG5pdS5wbD4gd3JvdGU6Cgo+IEJvcmlzLCBJIHRoaW5rIGEgU3VnZ2VzdGVkLWJ5IHRh
ZyBjcmVkaXRpbmcgeW91IGlzIGluIG9yZGVyIGZvciBib3RoIHRoZQo+IHVuYm91bmRlZCBtYWxs
b2MgaXNzdWUgYW5kIHRoZSBNRU1SRUFEIGlvY3RsLCBidXQgc3VibWl0dGluZy1wYXRjaGVzLnJz
dAo+IHNheXMgSSBzaG91bGQgbm90IGFkZCB0aGlzIHRhZyB3aXRob3V0IHlvdXIgcGVybWlzc2lv
bi4gIFNvLCBhcmUgeW91Cj4gb2theSB3aXRoIG1lIGFkZGluZyBpdD8KClN1cmUsIG5vIHByb2Js
ZW0uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
