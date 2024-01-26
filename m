Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A6DC47DDF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jan 2024 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElnLCyxXOUgY9pyMw14oy7jdQaFU+Dqwf68qbZOV1BY=; b=idN7tn8d4/Hqb9
	RmS0buPrkRwJc/oezfagdxG0frr953lP0R64HxPsGaEpjr2jn9qTNyoOz7UeVFq/vpX0ZvFLcePbn
	+KolCfBEArZ+jmtBKEvmbbaktsxPdE+YTxQDSk9BdmhpAk/1Z2QZ1vK0cXPZS5hsVrruUNUlYD5yM
	CzizEAyD+Ny8vnfzP9k9oVkSkU63zfHlxSqqZv8AhMqJkXUxzd7ESEmQ/3iiFjHxqg6wr3G/cGtTn
	Zla+c4UX4AuvX7tjWmet5aykk168Jw4/G4ZlDnUo6IyYA+cGKCmtkz+6ZG9hvrRRpKxUM7+S6Z9GG
	p/pVybVJhMHy5Ii1DHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTK5R-00000003x63-1M06;
	Fri, 26 Jan 2024 11:09:29 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTK5M-00000003x4J-35UV
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jan 2024 11:09:27 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0867F100002;
	Fri, 26 Jan 2024 14:09:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0867F100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1706267356;
	bh=QC+fwRjPGpDJM4kIQo3FgE8G06XlaXmNPf2j/Q+wUFs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=KoxSaK4J83fjCXCOf38cxfBa7Nyhs/6j4cI+yrQnu8Qs/ehAa5hQfartScrq4C6xh
	 EKVq+XkvNdOi6ylmuJMA1PaKZXygOd1lkqxiga+Ncl6L/OlmhXRridrPAfQeqzc5xW
	 2iS+xeWhJ9lN0aSGueNMRuSGF4Hi0fqF2wJA1vLuftSkmEpXJ6FzScHaAcwshQZDry
	 Qlv/q12+Q2eQ9zJlzgCuI2SxQh/DeQPAl6Not9Aw/neZcH/gHDDay06kFNqkD9Hejz
	 gTt1kOxwtSZZ+Jx2cVfCMw3vv3uGEjRyClLfUx2OUlye5o9pOprjHdApPaV7UnBz6Z
	 Xibli0Qajcm6g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 26 Jan 2024 14:09:15 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:09:14 +0300
Date: Fri, 26 Jan 2024 14:09:13 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Ezra Buehler <ezra@easyb.ch>
CC: <linux-mtd@lists.infradead.org>, Chuanhong Guo <gch981213@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Martin Kurbanov
	<mmkurbanov@sberdevices.ru>, Md Sadre Alam <quic_mdalam@quicinc.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Sridharan S N <quic_sridsn@quicinc.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] mtd: spinand: Resolve GigaDevice/ESMT ID clash
Message-ID: <20240126110831.5ol6jl2kb7uhlq6d@CAB-WSD-L081021>
References: <20240125200108.24374-1-ezra@easyb.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125200108.24374-1-ezra@easyb.ch>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182960 [Jan 26 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/01/26 07:16:00 #23429590
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_030925_507597_4E160E33 
X-CRM114-Status: GOOD (  17.38  )
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

Hello Ezra!

Thank you for the patch series!

We will test it on the our side with ESMT flash and back to you soon.

On Thu, Jan 25, 2024 at 10:01:06PM +0200, Ezra Buehler wrote:
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> Since commit aa08bf187f32 ("mtd: spinand: esmt: add support for
> F50D2G41KA") the MT7688-based GARDENA smart Gateway no longer boots.
> This is due to an ID clash resulting in the ESMT driver being used
> together with our GigaDevice GD5F1GQ5UEYIG.
> 
> The following patches resolve the issue for our board. However, I do not
> have any ESMT NAND flash chips to further test my changes with.
> 
> Ezra Buehler (2):
>   mtd: spinand: Add support for 5-byte IDs
>   mtd: spinand: esmt: Extend IDs to 5 bytes
> 
>  drivers/mtd/nand/spi/esmt.c | 9 ++++++---
>  include/linux/mtd/spinand.h | 2 +-
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 

-- 
Thank you,
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
