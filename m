Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20833CE7B1E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F84D2/ggC26GEhX5Ee23Qub0+fKlpoYKWFJThR3fxrY=; b=wtR4CrZcFbx95G
	9EdRxfxOOG4tANskcXdQmFmGFxUSDVl5+0THKgwH7QIOTQA+4xAF5wHRf6N7Ok8o7FpY8oyHmRh4Y
	hGy0MTVl0bx9pQ28cVplTkTvnCeP9Lg60la5k3bLa9GIR4xRHCX9nMHv8vBNyXjh9Feyxu3iEHPyQ
	NBbjdKxJXQpgNoeeMOvpwF9/KGBsXXWzsVcKXSobaOHbsKjAd52sndi7e5h9pidH3MwNbGwDbx9NT
	IPMuuZ8hnTOS5a3oelHiCWpYU96OCebCFwFAk+jG++GPgjL6FYUrGbnurzbAWacTX9hKosevbti6Y
	wA5zrBKSY8nDiLpn+3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaY2-0000000Cg99-2vYB;
	Fri, 06 Sep 2024 15:06:54 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaTy-0000000Ceba-28T4;
	Fri, 06 Sep 2024 15:02:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF69C1C0003;
	Fri,  6 Sep 2024 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4NwCDNbYacNK7slYwJrfHAzDYt4Ot43sYTu2s3f1BI=;
	b=EnpmWgwRxUCAo+2FAFoXoAhJ7OQubPcBPqPcXlifMH+TGXfqBv3qTkPsjTpNwP2mctunYE
	1b7VL+9gSWy/PMEhnMQgHNcVDweXCqdtF15vDc2j8DlSPs9l4PRgpUVFg8nvMnozdOCln/
	iDrgUqU+YIVLFGiuXNsxEm2gm4DGNu5bDmhz1DOGAEuCEVHxLUgogIakvKX+prbOVcsk+Y
	SxQFnwhSwB6+pGzBWxLKrfxpyTbjW2VnINpzr+LCtsdQ+kZhvH1T8Nu247CWLQkn4SqWeK
	HFwZmIc0Xx1JJUhEaJNtMMtrCq7ZKlDzmlz6hQeOncWEXIvNbJKHBoWxoA4hiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v3] mtd: rawnand: atmel: Add message on DMA usage
Date: Fri,  6 Sep 2024 17:02:37 +0200
Message-ID: <20240906150237.734148-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828063707.73869-1-ada@thorsis.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9b3c395096dcfd180877776d492173419a5251d2'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080242_705356_867214E0 
X-CRM114-Status: UNSURE (   5.46  )
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

T24gV2VkLCAyMDI0LTA4LTI4IGF0IDA2OjM3OjA2IFVUQywgQWxleGFuZGVyIERhaGwgd3JvdGU6
Cj4gTGlrZSBmb3Igb3RoZXIgYXRtZWwgZHJpdmVycyAoc2VyaWFsLCBjcnlwdG8sIG1tYywg4oCm
KSwgdG9vLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBEYWhsIDxhZGFAdGhvcnNpcy5j
b20+Cj4gQWNrZWQtYnk6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNv
bT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
