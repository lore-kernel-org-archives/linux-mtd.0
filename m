Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55280E77188
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2024 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5nUod2a1/9KwqMTgzM8WqsRpShU43RuGKQB6OjQ5O4=; b=DFF0T1I7dKOPKw
	dD0DefOUgOLQBaG2a/VNtB7Dc2uvuGhBw+yQpLcHXPxq62F0WS7JUAnmw38zQsmmYPN0fW0mODqb8
	o6yScE7d0JgUW4X35NOuTFy/uyvTEYVs9calD508MzvkUdVXqURB5xw5zack4eosU6GFRndST6GIu
	0h6hcMt8iMoNNcZ7CnZNt0ndm3FI/jiLIp5SdrNFGIG4kgsQ5HBLVdKwVOuP66sSD1che11Y2lOTt
	Va3eAABqXAFJissWwJXKOZVK0WD8p9U5eqV0JzfAffqn5/ZdnTaJBBiPciOZRJvrskf+ZI4OGYjM/
	nLrbMuB38Hp2ri3yIo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBRc-00000004pu8-1X5A;
	Mon, 30 Dec 2024 08:48:12 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBQO-00000004piI-1oAS;
	Mon, 30 Dec 2024 08:46:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E2C11C0006;
	Mon, 30 Dec 2024 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735548414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5qCsLO7/DPq0fAwnmdxvog17EUVkdcDvufsuKKDDU44=;
	b=V2WVMabCR3tv3DYkj8ceVupPJhyavl3qhgOPs/I9FnR1jKneit/XiPGS4Oc3CUJ4NxgIDa
	pLsgJlKUNCJfA515f2cbXKr4alkKR+evB+Nhem5PI6cI4VnnEOcC/HAK8JCJ1JdAfzJmTe
	6dgsWTL9OpD5zUqe/8e95WW3QQ4Tp+4lMXZeQE2S90e4/GkcOWocy7y7wQ5JbxsZYJxu3k
	9l1OiSjR1bbhRB8hcCLOCEgC5RZ0vKiojIFwD8vKUgqnyFwFYK6QTPAFa7ivLgOObUwIZw
	2bJ9jpIfno95cevOBvtX5QOOsUSJQh9z8xuE9lsVYdYaV2AwFpnAnxqv/vl/Qg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,  Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Adrian Hunter <adrian.hunter@intel.com>,
  Ulf Hansson <ulf.hansson@linaro.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>,  Alexandre
 Torgue <alexandre.torgue@foss.st.com>,  Jose Abreu <joabreu@synopsys.com>,
  Andrew Lunn <andrew+netdev@lunn.ch>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,  Mark Brown <broonie@kernel.org>,
  linux-arm-kernel@lists.infradead.org,  linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mmc@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-ide@vger.kernel.org,
  netdev@vger.kernel.org,  linux-stm32@st-md-mailman.stormreply.com,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH 3/6] mtd: st_spi_fsm: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
In-Reply-To: <20241229-update_pm_macro-v1-3-c7d4c4856336@gmail.com> (Raphael
	Gallais-Pou's message of "Sun, 29 Dec 2024 00:32:42 +0100")
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
	<20241229-update_pm_macro-v1-3-c7d4c4856336@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 30 Dec 2024 09:46:52 +0100
Message-ID: <877c7ha77n.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_004656_599152_F1A49D37 
X-CRM114-Status: UNSURE (   7.39  )
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

SGVsbG8gUmFwaGFlbCwKCk9uIDI5LzEyLzIwMjQgYXQgMDA6MzI6NDIgKzAxLCBSYXBoYWVsIEdh
bGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+IHdyb3RlOgoKPiBMZXR0aW5nIHRoZSBj
b21waWxlciByZW1vdmUgdGhlc2UgZnVuY3Rpb25zIHdoZW4gdGhlIGtlcm5lbCBpcyBidWlsdAo+
IHdpdGhvdXQgQ09ORklHX1BNX1NMRUVQIHN1cHBvcnQgaXMgc2ltcGxlciBhbmQgbGVzcyBlcnJv
ciBwcm9uZSB0aGFuIHRoZQo+IHVzZSBvZiAjaWZkZWYgYmFzZWQga2VybmVsIGNvbmZpZ3VyYXRp
b24gZ3VhcmRzLgoKSWYgdGhhdCBkb2VzIG5vdCBsZWFkIHRvIGFueSB3YXJuaW5nLCBJJ20gZmlu
ZS4gSG93ZXZlciB0aGlzIGtpbmQgb2YKY2hhbmdlIGlzIGJldHRlciByZWNlaXZlZCBzdWJzeXN0
ZW0td2lkZSB0aGFuIHBsYXRmb3JtLXdpZGUsIGlmIHlvdSBldmVyCndpc2ggdG8gZ28gdGhpcyBy
b3V0ZS4KCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNzE2MTgwMDEw
LjEyNjk4Ny0xLXJnYWxsYWlzcG91QGdtYWlsLmNvbQoKVGhpcyBsaW5rIGhvd2V2ZXIgc2VlbXMg
aXJyZWxldmFudC4KCj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmdhbGxh
aXNwb3VAZ21haWwuY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
