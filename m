Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5992BEB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jul 2023 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQXpZI1TlLMiSrXKd1XROLGt97HFa9Q7gsoJ1y8vB+k=; b=XiRDmAkITtolgE
	RGgIaSIZRgAHDoRzKbTTreO5eigaEeoT5XUrgcG9pnZbAQrUOymMN6CZhl7S0nnmuBC/K68w9Vo1+
	rNb0jZAujjLpIMaI4Y3jjFHH6W5g3nD7k0sl6JRCPO9Itbf+xkoG95M0PSbcksTeBVtRgkLnwmpwW
	e9f46hIMkuBVwjmnvDoFwQh9pgkPm4/b3X+Oa0ji8P9Zewz6ijHq1V7kA6TOPEVh/mCBSdw9CjoGw
	DpSsHDrZUAuUTAw1d+bdwNl6Z6qdubW4z7sBD4IrJBkCHV4p633hxt6sTnaanuEGzv4dDcjYicSDZ
	Q2nV5kCvgv+lPh3S4ntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIuY7-00CJw9-09;
	Mon, 10 Jul 2023 17:19:47 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIuY4-00CJv0-0O
	for linux-mtd@lists.infradead.org;
	Mon, 10 Jul 2023 17:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689009567; x=1689614367; i=markus.elfring@web.de;
 bh=ckYuDsSR2aJbMBvzkgr8HRLpagkwYluu+m5PwCeIJqc=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=g4aN1r1j5LGcaEsGZtGPP+wPK7/dXMj0T7BvJgv6+vN0xEyR9lw1KQS1CZy/M9dBXvDEeow
 vGaKtAxLIry/k1JxEoRu8elWaFtPFFm6KRbpmeP4YCicQVBGYUkTl2M/muWp+66wTGP3gNK43
 W53cPZeclhitOdehpXdAbDDgKBjvD5K2wleVnziu3j/rC/eK1bGv4IWOm8QZRZaGL9QKsXqH+
 Vd4YJfTCBeWe0RU6GNJg7T9HnelmCOnSEuazyZVipKlwedTRfGb4KvYUMimW7D3BH4FDsCY0+
 jGbV/EBWEqMPewLYh3K4UQJZ4d98zwDOsfQLF/qtgQjmNEDxrXRg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mty5w-1pyCnL0QxQ-00uY6y; Mon, 10
 Jul 2023 19:19:27 +0200
Message-ID: <93f264ab-336b-8992-6f87-ceaf0434c617@web.de>
Date: Mon, 10 Jul 2023 19:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Yang Rong <yangrong@vivo.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: opensource.kernel@vivo.com, LKML <linux-kernel@vger.kernel.org>,
 Lu Hongfei <luhongfei@vivo.com>
References: <20230710061412.2272-1-yangrong@vivo.com>
Subject: Re: [PATCH v2] mtd: Fix resource leaks in for_each_child_of_node()
 loops
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230710061412.2272-1-yangrong@vivo.com>
X-Provags-ID: V03:K1:0dQV8OFwS3qDMav9CGoYGmCjf9JlEgI7FAXTUF4uMWriVlwoSYq
 w7xupAAZFZk2fAUoTXgSM1GYyUyuwgNVQi2ItGwgTCODeZn3q7LslzSqrtmXjiCzGLBrrvk
 38H5vR9AZJgovgRs8JEUjK5L/bNrMqyzgf+Csc6nr2dHSxy9FdFtDE5qRMr9mOGtD9U+NaU
 zIYYcwztdpXtqQf8c1prw==
UI-OutboundReport: notjunk:1;M01:P0:B3QuVdseAH8=;AnY2LDiMqvBUt4GOtIUG+n0GvAo
 Vx3ozVcVU5VyDwTSHQStL1IBZ114gVWkd6/ei/vZl9XvQoxJ7Tw2vCGAvpIV8vKUs6bRFOQKs
 jyiqQrBR0EilD9iY2f+CAR+/nq2xz3DXHxXA/LC3AL87hptKHzCli2GEtHu0WATO9QuNMp4PC
 RbzQSA1s5Pijgwr+VFNHUgy8MdY8lRfmClTrIf0eDxuRAgRZyIoM2mfrv8S+fpLKTCUB51kc3
 DwA9pmabdzErUsDqq0qYav9g+dIxb9evYHYn8UcXNe6iflBZMsXw2uMkOAHBfbsQkOe7h8KGL
 AOUgNF/1hJquIHQUfjYDmRQ4O+8Z63h2YuFL9ACI8o/bqjyVldqn/NTh7HVJq45sLRpHgFda2
 GiWyfiZ6OyQbcK6habo4Sym1EFdMXOc4bwYUpaxGtdk7K4ng9aCGXDT5eHSFmYArIGSOixd6j
 KKliKn0JGyh+QQ6tIMisAT6wLBtYMTO/h6J+lrww1DLlTwFVcI2IMCv0GxxRtdqm0onRvAFcY
 GGK4DiTRNgp6BjO5YnY8bLYDUagbRKTN4dB/eNG1sh1IGNlPG+JlqgtDve1MlOJg+4Q4hga3V
 AMBzWi2r1JRySPiCa5ATUq4NFe7Rl/s2y27jbICMXvO44hXNEcOgL2LYh2WeUOguhim5BJtpq
 WMhgHcgBJ/X7fLPQCgBqxg3WD6npvQTYvJtm+gopzNYbhIysS+DLbdZ9CJH/jkX/ImPgUxkaU
 J7Zemilrw28hLQssgIEwhezppFCqsd2ItIfagyFHNx0lJMOH7tf+t3HLja//vwpukoVZWTe6S
 VbKPSfVCA/KkEwQ+GL+d/p6kI2nJdhPL+EI6thxRrkZoGkqhAxfdbcjX64g/+MHTqKhs8HdY/
 pMcmVsB5n32jXzRO0ncYfKNTLhOHB87VtRlv4ZaiWAj336rdx4p48q0v0sXj1H5YVj491X5QW
 Bgi3dg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_101944_613274_90001C61 
X-CRM114-Status: UNSURE (   5.69  )
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

V291bGQgYSBzdWJqZWN0IGxpa2Ug4oCcW1BBVENIIHYzXSBtdGQ6IGNvcmU6IEZpeCByZXNvdXJj
ZSBsZWFrIGluIGEgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSgpIGxvb3DigJ0KYmUgbW9yZSBhcHBy
b3ByaWF0ZT8KCgo+IEVuc3VyZSBjaGlsZCBub2RlIHJlZmVyZW5jZXMgYXJlIGRlY3JlbWVudGVk
IHByb3Blcmx5IGluIHRoZSBlcnJvciBwYXRoLgoKSG93IGRvIHlvdSB0aGluayBhYm91dCB0aGUg
Zm9sbG93aW5nIHdvcmRpbmcgdmFyaWFudD8KCiAgRW5zdXJlIGNoaWxkIG5vZGUgcmVmZXJlbmNl
cyBhcmUgcHJvcGVybHkgZGVjcmVtZW50ZWQgaW4gdGhlIGVycm9yIHBhdGgKICBvZiB0aGlzIGZ1
bmN0aW9uIGltcGxlbWVudGF0aW9uLgoKCldvdWxkIHlvdSBsaWtlIHRvIGFkZCB0aGUgdGFnIOKA
nEZpeGVz4oCdIGJlY2F1c2Ugb2YgdGhlIGNvbXBsZXRpb24Kb2YgdGhlIGV4Y2VwdGlvbiBoYW5k
bGluZz8KClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
