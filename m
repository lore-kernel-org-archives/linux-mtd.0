Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F507C6379F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 09:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zz1F6Q8qfrNFq4RU4fA34FJzzx248q2O/bpaPK0yquI=; b=A8Oz0uMy5mgjmZ
	jmyZajZzcbEokVpw2LbqTznYRadEQk+rMgykiiRs4IBHfJBkTu1NTO8+MZJdr6+Wb8rU7P+jM9QL+
	9MxffpJN9OzZ+UZGeiMzTWgpcWgI1/3esJtxyrzs82C1NiyUaVIS/DfubZdah001xa+b2Ffh5o7/g
	0UVq26zbX9KXqfFEQHDvLAiJgUL3VUhTibLiBakNP78IAI3Ysn96AN4mI6SNKyb6WsZMoydnXVGra
	UkfZ/cm44nq8l4YxSsXSriYjxiYzRImyaGUkYoFmY740182Ptsz2BYLgHcEJidSRbXSCaXLgm6eGL
	L0hQTAhwRlQPMhiHvRCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQPR-002pKX-Fb; Mon, 30 Jan 2023 09:25:05 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQOk-002oxM-VA; Mon, 30 Jan 2023 09:24:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E901C40003;
	Mon, 30 Jan 2023 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675070654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0TuPdf8fRkY/wdrnRAp1povjvstbHbqdy2BCWI+oz9I=;
	b=hAojLtKxBrWI+/kZN9TP7+vqZsAJSx7PmUJJ5d0LXcczpjw+tcYhs9G0spZypKKRWHNx8c
	TfSbENIBek943d/t62CHIDuyM2yIoJt5odiuMgEmpmlA8pnwLgAFfGnWb0zSu+QRHJxXgc
	eGA9jX2JkKsuJOgfXIcp7J4kf0+WxSl3oBFem5mvaz9pvNKuZ7nl6nJt+cNJAnmDzRnRvg
	fYCf9DjERqzi2VnPq8b/oOFNro3tUIzFyoLaNgzFmlejCZ/uGCLCnBgNfeL7KHTTxy4+0Z
	DF5KFFPPbLkH8KOYVDCTDq03rQ/lZfRY9w7LZf/BHMqQynpd5t9RHwvAPmAhhw==
Date: Mon, 30 Jan 2023 10:24:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut
 <marex@denx.de>, Lubomir Rintel <lkundrak@v3.sk>, -
 <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: reference MC peripheral properties
 in relevant devices
Message-ID: <20230130102406.20d2293e@xps-13>
In-Reply-To: <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
	<20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_012423_187340_DEABEE6E 
X-CRM114-Status: UNSURE (   7.41  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIEZy
aSwgMjcgSmFuIDIwMjMgMTA6MzI6MTYgKzAxMDA6Cgo+IFNldmVyYWwgZGV2aWNlcyBjYW4gYmUg
YXR0YWNoZWQgdG8gbWVtb3J5IGNvbnRyb2xsZXJzIChvciBtZW1vcnktbWFwcGVkCj4gYnVzZXMp
LCB0aHVzIHRoZXkgY2FuIGNvbWUgd2l0aCBhZGRpdGlvbmFsIGNvbnRyb2xsZXItc3BlY2lmaWMK
PiBwcm9wZXJ0aWVzLCBlLmcuIGRldmljZXMgd2lyZWQgdW5kZXIgSW50ZWwgSVhQNFhYIGJ1czog
Y2ZpLWZsYXNoLAo+IGludGVsLGl4cDR4eC1jb21wYWN0LWZsYXNoLCBOUzgyNTAgc2VyaWFsIGFu
ZCBNQVg2MzY5IHdhdGNoZG9nLgo+IAo+IFJlZmVyZW5jaW5nIE1lbW9yeSBDb250cm9sbGVyIG9y
IElYUDRYWCBidXMgcGVyaXBoZXJhbCBwcm9wZXJ0aWVzIGZpeGVzCj4gZmV3IGR0YnNfY2hlY2sg
d2FybmluZ3MgbGlrZToKPiAKPiAgIGludGVsLWl4cDQyeC1nYXRld29ya3MtZ3cyMzQ4LmR0Yjog
aWRlQDEsMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQKPiAgICAgKCdp
bnRlbCxpeHA0eHgtZWItYWhiLXNwbGl0LXRyYW5zZmVycycsICdpbnRlbCxpeHA0eHgtZWItYnl0
ZS1hY2Nlc3MnLCAuLi4gJyB3ZXJlIHVuZXhwZWN0ZWQpCj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKUmV2aWV3
ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
