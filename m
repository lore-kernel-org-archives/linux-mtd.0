Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28701EE49B2
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 11:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9x2S//vV/U7zTygy3VhfIQwj6FumUIX1kZ4qVG23aeU=; b=sHoVxDnrPX9g7/
	JWD4AY5A/qcr1oAOV88E3t92h+Ip3V8/StAKv8vLhCb9mWWRJMiYBdFWSm35ykuRqiLk52fpw3tz3
	oRv6+iLBdYT2cPQLlCz2Kj+WxVGiGZ1rrdgUlEY2dCT51waXwY5RlQWT2t4uUVk3w8WgWssr0OVv7
	RvzK6Q/p1UBAYqZ0DdWKo6UdiCaZcAKYNq+bsdw7w8D3as2nGhdJsBL2ADyDAuBZepffpMuwEQZoE
	9IW8DhUu3ysX2x5rp9Th7U3ZEr7nuWX60p8Ac7p7NYGSMQYxroXX7OUdrvgCWbhV04goQgWHGnKxq
	VxLyzVR9yUKNbCyD5/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYm7q-000RhU-0e;
	Wed, 23 Aug 2023 11:34:14 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYm7m-000RbR-0V
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 11:34:12 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 503B710000A;
	Wed, 23 Aug 2023 14:33:58 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 503B710000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692790438;
	bh=TDpe3788q389R8EkJoQ6JIPa/NOggFKINRwRuJg7hiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=orXMlmKrWDRSfA1/C4rMIK7AAZP/aloBPXvAFlBAlSPtIbkYDdv89LcoqkREISM+L
	 4j6/UtcMucORmCHs1gu+lA/xllXne0d9U3y9fklEth/26J8g2oihAQUAa9DRRs9hLc
	 TgcrItc7qCSNJ9exMVT8IOE6sd+XLIHuk6RZyeChNiIyUjt0Fl0tkwnjcKsBVztgQj
	 DnQPPGKKXZOxM5NSbmAddcaSJGc2UDkazUxNj4V0K3Z2hByHFK50AROWas+VIb1SYl
	 sjTp1UmFZUtxV0b3lH8UAGQjGHbjCxsgqWZtzxT2iXdxfcL70stxpDn75jjjrEyxPn
	 +1aU4NqZ5xGmw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 23 Aug 2023 14:33:58 +0300 (MSK)
Received: from [192.168.1.146] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 23 Aug 2023 14:33:57 +0300
Message-ID: <f873d775-cda9-302d-a651-0113c7c7dc84@sberdevices.ru>
Date: Wed, 23 Aug 2023 14:33:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/2] mtd: spinand: micron: fixing the offset for OOB
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <kernel@sberdevices.ru>
References: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
 <20230822122534.872646-3-mmkurbanov@sberdevices.ru>
 <20230822153556.630e65b9@xps-13>
 <01925ff8-1d19-a729-429a-89866fad319f@sberdevices.ru>
 <20230823104143.760cc5bc@xps-13>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
In-Reply-To: <20230823104143.760cc5bc@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179399 [Aug 23 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/23 04:58:00 #21681850
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_043410_882302_D5C33871 
X-CRM114-Status: GOOD (  15.63  )
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

Hi Miquel,

On 23.08.2023 11:41, Miquel Raynal wrote:
> Hi Martin,
>
> I don't think the four bytes have any "bad block specific" meaning. In
> practice, the datasheet states:
> 
> 	Value programmed for bad block at the first byte of spare
> 	area: 00h
> 
> So only the first byte is used to mark the block bad, the rest is
> probably marked "reserved" for simplicity. I believe we should keep the
> current layout because it would otherwise break users for no real
> reason.

I agree with you that this can break the work of users who use OOB.
However, I believe it would be more appropriate to use an offset of 4,
as the micron chip can use all 4 bytes for additional data about the
bad block. So, there is a non-zero probability of losing OOB data in
the reserved area (2 bytes) when the hardware chip attempts to mark
the block as bad.

-- 
Best Regards,
Martin Kurbanov

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
