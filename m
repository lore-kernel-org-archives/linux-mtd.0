Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E883DC36010
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Apr 2025 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhIgpqp/U0s4UAx7/GKgUPPDnfsyX1WR9jmcLRx/OlQ=; b=hQeCQMklAAnZSo
	aSVOCmaKUy+g7Vg/0O91UwEcjwm/a3F7eoK61cJrTWgiCVmHkKcTZ//R0Q8oM8QoDb/xmyrE1j5zL
	7A65prYg4mqZsGxLC29wmWNlmfetLhnjazDREU96qHpdrVxHHEOqQvwBtuUEeTMPOdP27Ny2Jbwa/
	tWflWrkRpDP1ngMzMwjn/Vx+ymxE4ytKjB2yGx56eOnLlHB1xwcFFCSfu3IfHf+JBz9GbGZ8bvo3r
	hSrE4UzRBGcE4xytuLnBe3HLGWS1JUKto/ZtgIajtXvZMu8Vumn4EsDovQDcBtO/MW7qBqDlagnin
	IOg4jEZhI1P+at5GcwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hgl-0000000Bw9O-33Hr;
	Fri, 04 Apr 2025 14:06:31 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hWS-0000000BuDs-3sZw
	for linux-mtd@lists.infradead.org;
	Fri, 04 Apr 2025 13:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743774921; x=1744379721; i=markus.elfring@web.de;
	bh=smOHgZ1jrknZ2SI6I6l99hZdhE+VTOKSmGELBfZP5pQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n2DUmX1j+4I67JMhxiAGpb9AlGQaFT0XDKzInmmSgHuYgOBOFvdq4Y1LrURKeNSk
	 kYfIDQ8wb0MRWUYS7ZCNV5w++GEXC3KOJcJuNEy1yg5VESwvZfVO7IEX2Qo7gpIop
	 dUO2B03I8phU7PvZbvTc8C+S15fKFEvTaoTZhxP3CFsDSxbADWI56Y5Mg6desoBrF
	 7TUo0p0gx9wu8aoLiF56QnujG0i/rMQZqfyO+A9f2NfRM8rSi8KKfdAcSPGCh5L2c
	 qn5dLKKI2giJrjs/bZrVO+pEbY3In8Q1OOD03D6lv7cBD5wBxK5TkQFK2mQ4Dx3/6
	 B6/ADA9E3krmyb0Fhg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.27]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhFlm-1tVEaJ1uRm-00oidw; Fri, 04
 Apr 2025 15:55:21 +0200
Message-ID: <c5129cee-d15a-4e93-9bff-eff4f33041ac@web.de>
Date: Fri, 4 Apr 2025 15:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-mtd@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250403134731.2054-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: bcm47xxnflash: Add error handling for
 bcm47xxnflash_ops_bcm4706_ctl_cmd().
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250403134731.2054-1-vulab@iscas.ac.cn>
X-Provags-ID: V03:K1:xNLrT97GepapjcRDk2MmyzZtlV0J1eidpCqLFuHxKV3/OL6hcJ3
 JOCWm+qBL9ZvGolY4rSwm47QCHatbdpz3SIzzFYOywaJbMgzPIIR5vcNrfpiB8uFR0KD+S5
 Fds5gpGlkQO1iRczqkNlL3qQbXuiqZg8NoZXlwLbNcGFA8P/qVzT+oa+vHzb1vomjoqEBkB
 N/CJSPCBp3tfqMz9biUnQ==
UI-OutboundReport: notjunk:1;M01:P0:FYWytivLFOA=;gfmiZmrhN5wUp4f4FVhce6oxUE3
 aW1tzpm7csfJ2df5n0KYbbCIi+m5fpkZAzCQRJQucc+aqBqvbuD0qBXfz3jlfMSmNV2uIw9gG
 utPktisfm1Mbp6TZT9ZrWd4rvX/KV250Lvjd1If8BtrFjUoCNQ2GyWgZVCb7FD3A+mLOkN4QM
 xU9YmozSnDT372CzDY7XwLekhSYgwerwsTG3bDWhjYNdFU/QiFqqNKr3CITtnOHRIQ7rUzdIM
 esjdSxIXo1L+Kr+R6AsOh5wDJDqNQxBx8Pt/KmTpEjhgOLwFFBhyNkkFpBp4YpyeVUf/AHBH0
 MHAe/ZV3B9354tMc392WPPorcnEiCOQwX4lBjO0RkusnQEMkf5YMj/7KPxnIP2R0NYISJWRy0
 TeOr+AeDCF7wPj7a75bZfHsfPkvmAA8sULD+Y7VfQLDfYYmlvNJvjxUeoYXCNXuM7SeaHWb5Z
 +c0sJIP5Gd6frK9Ig1X8lZHKUPTsPr2Q5t7zSAcAbXiXhr/45wGNogFB3NhPqERQxL6eQvPyL
 2IClRpXS5cjfaIXeevysE7RTtsuRWKSaV57wVANBvWKR2WWjwHzu5jEP7jx0fTMHQna8rMdfC
 xZZN/rCfAlbKXHL8Z0ebtAWvV+Cf9pgMAF+qCa5PNzRlm+upnlbBP5AoELaQBKdLO6o4h94LT
 spanzlGS4v5bEIC94dUzqUzEGeGwiQ1lWoLplwkgXouCDJBqyU8MU12EUxyf5PTnxAb0sXxCK
 3hrzLCpqkHHys7emFn+ChSI71IltKcG3lESZjBRrhAk7y4TMbBUnCA0R3By+VBT4jRSoL78w4
 wC1F+jRo9GaPpAvq3pmmtCEAlqyDIk5SFO5LFCZP/4xyHKrC6iixOxLJB6MeG3IaGhGVcEXwK
 ap6MNxUjCfkuor0ZUB9ul7Xbjg5iQOrBDnke/qGKF54cCtAW8Nj41ZvALBVKceIDLUm6L3IfU
 j3Nd6HBJjAzEQ6uNkA5cKAGlembEbo27DwIV92rCoZnRIq2sG8QRTBSpg5ZgZOI97P2cS01y2
 ByU77tDDmKcH933cSJh08JX3XO9zqQffA018CApt545z4yjJGrI3yRLMyfO549uOAswGiyaBl
 iDobTRoZ76rO51LjjSzzfaPcZ03Fkeh/xjXDqB2slrLddyAzflcFmKB2AP7QwJq0pHfJ1sp6Y
 /nyFVzgF+L+KPBwtkP1daOxYkGvze+qDKGiz66YIDXpT+Y7e8nhmsCVGYIeASzG/gF0zZb1Rt
 dzhUHZU6KeiIN8hqNlFKxFtOagZqdUJyROkm+Si6hRD9XNE9iCDO1ufv4V2lfcMZAp4vMksSr
 Hg0dsQaS85y7Hf1RLie+E+hvf61lhcxUjvC72wZFq6JGl5g5rStgs1+OHkTd0fLofKcdmH/BL
 WiIZhfBiZaTTdP5kYBy89Y7kk85o3vkqOr4A7JzpAtdNz+ezcfC/uQr7a+6qUwtq0QsscLDeG
 RctMop0AU0/cf1umJ/+xNAPPcosbvn5AP/ao+2iOjOutvXavJzhBCo4bJ+zaHKMQoZhpi0g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_065553_336394_1A9F300B 
X-CRM114-Status: UNSURE (   4.06  )
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

4oCmCj4gQWRkIGVycm9yIGxvZyB0byB0aGUgYmNtNDd4eG5mbGFzaF9vcHNfYmNtNDcwNl9jdGxf
Y21kKCkgdG8gcHJldmVudAo+IHNlbGVudCBmYWlsdXJlLgoKICBzaWxlbnQ/CgoKWW91IG1heSBv
bWl0IGEgZG90IGF0IHRoZSBlbmQgb2Ygc3VtbWFyeSBwaHJhc2VzLgpodHRwczovL3dlYi5naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aD12Ni4xNCNu
NjY1CgpSZWdhcmRzLApNYXJrdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
