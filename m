Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA0FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jun 2022 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FpqGes1qBKrPHDl8oisElABcZQBy2Gu9FvDe2p1pAfk=; b=4skIo7bIrfrWKHozAI2VEcDtyH
	z6fqVem/mCBn0QNbZfjknZdotBlZThfp+/U8xR3djS8X1t+Mlgt28ACx2sAdwKFaErcH9J6xRFdf8
	i65FG9U3ChcKIy7udTfskG8K308AQG5fSRXjbT09NiCvDnWbznnC3MX7b1eUJnaNQwE4mdCdQ3KpH
	9YjCo/UtSbB7zblgQHk7MArWK9Laj4oZzjJIQhu3pENTKeBEwc073mURaIa5tFLIZepL4719BUCCj
	qTSVzJ5vZNAx9IG6dCELJtVfVywGsSfJEIQ1Sn9alyzRNNLtIX+bQNDL9WUWN638He8Bg6w3ev4m4
	L+QlMC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2B0E-007dDZ-Oe; Fri, 17 Jun 2022 12:23:06 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2B0A-007dBT-Su
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2022 12:23:04 +0000
Received: from [192.168.1.103] (31.173.83.238) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Fri, 17 Jun
 2022 15:22:41 +0300
Subject: Re: [PATCH v2] mtd: hyperbus: rpc-if: Fix RPM imbalance in probe
 error path
To: Geert Uytterhoeven <geert+renesas@glider.be>, Vignesh Raghavendra
	<vigneshr@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <f3070e1af480cb252ae183d479a593dbbf947685.1655457790.git.geert+renesas@glider.be>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <f3c26e1b-e2fb-100a-5354-723b69da2bd7@omp.ru>
Date: Fri, 17 Jun 2022 15:22:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f3070e1af480cb252ae183d479a593dbbf947685.1655457790.git.geert+renesas@glider.be>
Content-Language: en-US
X-Originating-IP: [31.173.83.238]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 06/17/2022 12:05:45
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 171205 [Jun 17 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 490 490 64947c9fe6ec4170c45683de1592f92a9c3bac07
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.83.238 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: 	127.0.0.199:7.1.2;31.173.83.238:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.83.238
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/17/2022 12:08:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/17/2022 10:12:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_052302_983528_00F81719 
X-CRM114-Status: UNSURE (   7.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 6/17/22 12:26 PM, Geert Uytterhoeven wrote:

> If rpcif_hw_init() fails, Runtime PM is left enabled.
> 
> Fixes: b04cc0d912eb80d3 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
