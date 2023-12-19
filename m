Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FA3C46CA2
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 18:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkaNFUwwQEwj/aFzggNDkzJhgUmKasF2P4E/moRDZu4=; b=ObRx44FFaJxHUX
	ANBAbr3TO8P2HMfF+Zxw8cFLFih9oNeHWGrXAe+x0IcPOkqJikc2gCqQxMbUnBqP69vhxUbQv/VlA
	zvhxZHx14/WAGBDGYpKCwTL7fI79dKHtM1cj+yXvqczjETGGMqNbMPKf0iJlXHncI+0wps1x/VJe6
	KY4tSRbQCMJ7gxDJMcyFh8qDMlRUZ9UO9NPd6dQBabOBvf6bZBGrKPDweHfoUfambeKT45ctOPAbi
	dwNxuhp8SBb0DpDqqbJuLMN013tHoeKYHgeR7gRze0Lggj0UXVFh2AkUu7Gw2Xrr3ph60L/sz8MaY
	E/S+FJ0USFQCF3rWIbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFebL-00F9dk-1T;
	Tue, 19 Dec 2023 18:13:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFebJ-00F9ci-2G;
	Tue, 19 Dec 2023 18:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=opCS3OjJTfczhBDIFyic4AXGgg2nmqq2nv66/oBQQH4=; b=QxKQhMVH4rGHWRb/YBtbA2t40R
	MTXWI6gn5D8dSIqbptYIkpyUxBfQMjXIEBZqOC6zy1d4gAE/935IMO7Eb4+FBlGgnLud/KQ9d9ITb
	3pr2OntAcKUM+qHGQ2TMukwvLUg6xV3bsG39S3ncf4bfYQj9KR0z45pYCpBXS17VapN8C3WcZDlgm
	7HRgDzUYgOleweI8Y0SAZ//H7EpfiknFIqEDNjiEPJwt4jxXHKqFaW2CvJPpdV6ERqapC8G5jyAyu
	j9pnrXVMek0PHIO1bO9pth+8KgEa3CTfukmmyQ67gqYzcR5SX6FWAZpOljOLsrzqJPWmvdIS5yIpq
	0jR5ryRw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFebF-00DYX1-2g;
	Tue, 19 Dec 2023 18:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F49D6145E;
	Tue, 19 Dec 2023 18:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB674C433C7;
	Tue, 19 Dec 2023 18:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1703009625;
	bh=rl0oGJRj24LNgiZU8UrAeIcpL4ZoLYNFcJBbQXFfYsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nKQ+NpBhVhYf1S9GOtzOlJIgbXu1I0CRJH20nDeKl9+UdJsWedrb/cVqlF5Ld4onb
	 YRJJoUgJR4kpS2qVJ4J/4oKQeK/yqmdzEtbpIdtWoo1Kbj7KUmWwapz3wZ5O5isUOz
	 Ra49I0QD4ox7bS8G0zBg4I6buHPUKP3t46zHVYA4=
Date: Tue, 19 Dec 2023 19:13:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 3/5] nvmem: u-boot-env: use more nvmem subsystem
 helpers
Message-ID: <2023121929-salami-pessimist-c943@gregkh>
References: <20231219174025.15228-1-zajec5@gmail.com>
 <20231219174025.15228-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231219174025.15228-3-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_181350_066659_18041996 
X-CRM114-Status: UNSURE (   7.06  )
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

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMDY6NDA6MjNQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiAx
LiBVc2UgbnZtZW1fZGV2X3NpemUoKSBhbmQgbnZtZW1fZGV2aWNlX3JlYWQoKSB0byBtYWtlIHRo
aXMgZHJpdmVyIGxlc3MKPiAgICBtdGQgZGVwZW5kZW50Cj4gMi4gVXNlIG52bWVtX2FkZF9vbmVf
Y2VsbCgpIHRvIHNpbXBsaWZ5IGFkZGluZyBOVk1FTSBjZWxscwoKU2hvdWxkbid0IHRoaXMgYmUg
MiBkaWZmZXJlbnQgcGF0Y2hlcz8KCnRoYW5rcywKCmdyZWcgay1oCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
