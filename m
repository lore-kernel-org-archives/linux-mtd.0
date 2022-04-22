Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52ADFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Apr 2022 06:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZNaQZQxzsjUkzSzq36tnZvREHMjpfdwh5ZVrRWv6Dg=; b=GHVCdXVR4vMnmW
	mOQhEo6rxeddNBQkgTaE1Iw1oIzksKaaZrBMc7W/b+prlN80QIPvzAepOUklOBfmuh913qz6QXySb
	JC/JcA08yOKUrftLoyY4Ab6TrsNckvaESp+nRKn+jNNejPpOUsA2B9BgUFFDwXQf82FtbXao2Gmdj
	EWrI/rpqw94PelatzMz3qWMS6824Bjpobxu0pN2esXgVEYro3G/2pqOG5r4bwatKHDzSmFl/B32PQ
	TSx31VH7Nqp2okx2jSYN4gEHt2yoUSZfJ9d4qdJGT+P8+LY6lqiSqlMq9Iq7nnQnKqnBG8UphFrgd
	cQalfyN96liQn+dZHR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmwb-00GcMB-Eb; Fri, 22 Apr 2022 06:39:05 +0000
Received: from louie.mork.no ([2001:41c8:51:8a:feff:ff:fe00:e5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmw7-00GcAt-Vo
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2022 06:38:38 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9d:7e00:0:0:0:1])
 (authenticated bits=0)
 by louie.mork.no (8.15.2/8.15.2) with ESMTPSA id 23M6cR0s1127759
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 22 Apr 2022 07:38:29 +0100
Received: from miraculix.mork.no ([IPv6:2a01:799:c9d:7e02:9be5:c549:1a72:4709])
 (authenticated bits=0)
 by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 23M6cRJ9298327
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 22 Apr 2022 08:38:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
 t=1650609507; bh=GQTNc4OifpDBOAF38rSgcaR1+1lv7mq74KVtN6vFgwo=;
 h=From:To:Cc:Subject:References:Date:Message-ID:From;
 b=U7X2z1tgtsFCXaaVrgfD30XoNthhHXBybcP3C+FZOrS3oag2/oAQ6rgZBzx6kzCPv
 s6KX/aTTrfwoQodPKxg0BjyQLKebFIC3iBqI8vVmgVLoJhhQMOVA4vHWTw5JEUUsq0
 vViTg8XtsqUzH247iVtLNr1YG+7YTZ2SvN9w56NA=
Received: (nullmailer pid 964391 invoked by uid 1000);
 Fri, 22 Apr 2022 06:38:27 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: <Tudor.Ambarus@microchip.com>
Cc: <miquel.raynal@bootlin.com>, <ezequiel@vanguardiasur.com.ar>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtdblock: warn if opened on NAND
Organization: m
References: <20220328161108.87757-1-bjorn@mork.no>
 <c98f728f-2fef-6174-714e-0d31ebe4c43c@microchip.com>
 <877d7io0a1.fsf@miraculix.mork.no>
 <d5c1a7f9-5ae3-4c89-9dd8-939ef4e08c72@microchip.com>
Date: Fri, 22 Apr 2022 08:38:27 +0200
In-Reply-To: <d5c1a7f9-5ae3-4c89-9dd8-939ef4e08c72@microchip.com> (Tudor
 Ambarus's message of "Fri, 22 Apr 2022 06:25:19 +0000")
Message-ID: <87wnfhmxlo.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_233836_356306_61C61634 
X-CRM114-Status: UNSURE (   7.76  )
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

PFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgoKPj4gQ29tbWl0IGUwNzQwM2E4
YzZiZSBpcyBiYXNlZCBvbiB0d28gZmFsc2UgYXNzdW1wdGlvbnM6Cj4+IDEpIHRoZSBwcmVzZW5j
ZSBvZiB0aGUgbXRkYmxvY2sgZHJpdmVyIGlzIGEgcHJvYmxlbQo+Cj4gSXQgaXMgYSBwcm9ibGVt
LiBVc2luZyBpdCB3aWxsIHdlYXIgb3V0IHBhcnRzIG9mIHlvdXIgcmF3IGZsYXNoIHJlbGF0aXZl
bHkKPiBmYXN0LgoKVGhlcmUgaXMgYSBzaWduaWZpY2FudCBkaWZmZXJlbmNlIGJldHdlZW4gUFJF
U0VOQ0UgYW5kIFVTSU5HLgoKSSdsbCBqdXN0IHN0b3AgdGhpcyBub3cuIFlvdSdyZSBub3QgYXJn
dWluZyB3aXRoIG1lIGJ1dCB3b2l0aCBzb21lCnN0cmF3IG1hbiB5b3UgY3JlYXRlZC4KCgoKCgpC
asO4cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
