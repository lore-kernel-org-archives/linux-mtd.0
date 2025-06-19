Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B2AC77B7C
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 19:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReF2mR542MHIhkZJwc6p0VDImKZq0aEWAo0DUNfAH/Q=; b=uEszQjna5eJL6J
	0nShRfq6FZyvTkBUtnprl77ZX8uDDIPRpmN9mSjrGE5JcQsyyhrZP629glSrC48hkqP3Th/E5jAgh
	uV5f3Vd6CXPsneXkpYLw42mHhgzY1Od7kfsrE/S6ZLR+Zof+59pBpH1yNXsx9STQ2IJerRUSJJUhS
	6M++y42UFtGTaURqOyN2yxU969jB0S6D0mSAUpGP2WCOsuwZxWZ3mM9t3Jp6N1HE4Rr7YvrWZWEar
	ekHoA05sUoi9jv+IZNLuAMgzJFbvFHiodTJSfwgWKjDeHhfKjX+b+hlcoU8xMMWgtDIMvYiWefzYs
	rAUpL5AYCeY21uNdRg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLHC-0000000E8f0-1YqR;
	Thu, 19 Jun 2025 19:50:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIrI-0000000Dl25-1fxK
	for linux-mtd@bombadil.infradead.org;
	Thu, 19 Jun 2025 17:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SHKo8qXm+tt/TWv/ujXaaZqRW8HDmht1JJF3FPlOj1Y=; b=CYyQjeJCXdpIFIjWdi5N9vMO5W
	B6wAW3dsNtzZbJyGTkw85iLFbTDSaJIiasf87HvxoIzkJpbnK27kzlzS2Difvbm+dSOCdf6hMZhrw
	LHQJVpomcEiXybCYlZYwIP8P/mLUb67Cwv6LA4pecHaTxS39IQym9ilHW3I7uswptdtUeKXVb12mw
	vSiaQTIVnmVTkRBMNoWPzNd4FfrH3xMjL80XPdApWUFHDtoPpKQ8DXAaDyGsISlJJKpfEk0twye3E
	O+Q/ifgsiIX2WckdzE/23eYjRFgHkP1ByZ6HoDdf6IIqWvAl3qcRLYnYZfM8GeszFPLtkL7XOVas/
	CNBTf/vg==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIrC-00000004Uo2-3lFY
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 17:15:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07C254441E;
	Thu, 19 Jun 2025 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750353320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHKo8qXm+tt/TWv/ujXaaZqRW8HDmht1JJF3FPlOj1Y=;
	b=pQGRxxspT3wKhuDZgD3MAN466JZi8AZFANK4tfI9ZpH2OZrkiqUkq7hXCX/oaqExSRmXsY
	QHBhqaWIrHOcbIKhw6U6+Xozp3HVkbC5fqc/Z/uTphdlq346NwEpUSgScb6zqce0crUkb0
	sy5Z6Un9HjJdbRnZyXtbu1LWSLP+oqgt/Y4SfJ2BGxaVUIMxYxwoPKy9Kg3LyGpm2IfP0b
	mHjBtHFu3qIBMr5azrhEDShLlxCFG/mhcNgn7ZjUXz9j+U3BUGUnf/zx4M1IG9azwBM885
	W7DubsMzltvejSziWvg/CaVxfare6bXO1OnLQKAKeDG4TSgl+Pb4n97DMR3Lfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yuesong Li <liyuesong@vivo.com>
Cc: opensource.kernel@vivo.com
In-Reply-To: <20250618124948.2822345-1-liyuesong@vivo.com>
References: <20250618124948.2822345-1-liyuesong@vivo.com>
Subject: Re: [PATCH v1] mtd: nand: brcmnand: replace manual string choices
 with standard helpers
Message-Id: <175035331888.438483.5742721112237943921.b4-ty@bootlin.com>
Date: Thu, 19 Jun 2025 19:15:18 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeitdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrdduuddtrdduudejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduudejpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihihuhgvshhonhhgsehvihhvohdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgp
 dhrtghpthhtoheptghomhhpuhhtvghrshhfohhrphgvrggtvgesghhmrghilhdrtghomhdprhgtphhtthhopehkrghmrghlrdgurghsuhessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrth
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_181523_071902_AB6A4693 
X-CRM114-Status: UNSURE (   5.44  )
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

T24gV2VkLCAxOCBKdW4gMjAyNSAyMDo0OTo0NyArMDgwMCwgWXVlc29uZyBMaSB3cm90ZToKPiBV
c2Uga2VybmVsIHByb3ZpZGVkIHN0YW5kYXJkIGhlbHBlciBmdW5jdGlvbiB0byByZXBsYWNlIGhh
cmQtY29kZWQKPiBzdHJpbmdzCj4gCj4gCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoK
WzEvMV0gbXRkOiBuYW5kOiBicmNtbmFuZDogcmVwbGFjZSBtYW51YWwgc3RyaW5nIGNob2ljZXMg
d2l0aCBzdGFuZGFyZCBoZWxwZXJzCiAgICAgIGNvbW1pdDogNGI1NTMyZDQ1ODFkMGUwNjM5MDIz
MjY4ZWViMDhmMWEzMWE0MDJkMwoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRk
L2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0
IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
