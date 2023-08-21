Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B185EE4996
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 17:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OluXH7mo0pvmeQb/Ya9FZ6gTKANxEJJc2/xQnuDWjeg=; b=p4za8UUFXm/yHD
	1qnw9Wt/EVtz1lbKDg9Jm7qQIFXF9uBRacYEfs57G+7qjGC6iTDivqeZHQLyNt+fHw9v2WV9UtH/b
	7K3pODMouy6GE3vOuLI5NTBZ7vD+2K8xRfBj95mIkQoAZg2Y2RGl7dcyyEDCSZim1gIQEi8jmAfn7
	2y1bqaqBCElaqQC9aWoOByvoWM+nKJOyF9ukKK7N4NQU3MWjm0/xMixr872bHKITWO4zOQ9l3IviO
	FEjh7Z58w34djdW/TLiMI7Ze+e6sY6piKYJOSiNlkYIDWvCJEOZXoro5HaeOAFP3ZKxb4bcctt5Bp
	8o5gknbqvbCv7TbUdlOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8pr-00ESNj-0D;
	Mon, 21 Aug 2023 17:37:03 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8pm-00ESK7-13
	for linux-mtd@lists.infradead.org;
	Mon, 21 Aug 2023 17:37:00 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8F4C8100004;
	Mon, 21 Aug 2023 20:36:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8F4C8100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692639400;
	bh=tOU6u/lBwzWqXy+hZ7sPHDoc+oO2eRFw8MLRn7e+5mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=B+geS4OU0dMadcoikssL3blFww0rXpe5wUGLa+5iNAHkQsFbVE3B6jr6WeX9llHyP
	 RKnj+zEKe9CUiUqdeg6n8LCo6u+OPfPiFqivNmL5c/mDTV3tOH3W5N6Bq9EcVegptP
	 4YGpJXe/1WkXPUGPAT/Ye+PW/Kjebw6s/EuDUPIpWyX7HCGxZo4eNXHoCC/3KAWEtr
	 ZE05cV9FdXclEg6lctnFubRAaGUWIkK3ln3ytJ3NADuUM6zadWr0MUr04G+LAPvHjj
	 23D9m4NAWzK4IWC9vllKK2cQYsHwTc6CYg6FWU/PO4wVzjkoj2qz5V4+5MtSsor8vH
	 4iaqnuv5U98uA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 21 Aug 2023 20:36:40 +0300 (MSK)
Received: from [192.168.1.146] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 21 Aug 2023 20:36:37 +0300
Message-ID: <28c91187-1fcc-9ea1-90d5-c95e10378479@sberdevices.ru>
Date: Mon, 21 Aug 2023 20:36:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1] mtd: spinand: micron: correct parameters
To: Miquel Raynal <miquel.raynal@bootlin.com>, Frieder Schrempf
	<frieder.schrempf@kontron.de>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <kernel@sberdevices.ru>
References: <20230815161024.810729-1-mmkurbanov@sberdevices.ru>
 <0f54b3dd-1fce-4f81-8652-d50fe1bb3873@kontron.de>
 <b619ef58-06c3-c61a-bb0f-ba243a4a2ade@sberdevices.ru>
 <53a4fe26-3a6a-47ce-8532-be60da674aca@kontron.de>
 <20230817095354.3df2f7f9@xps-13>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
In-Reply-To: <20230817095354.3df2f7f9@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179363 [Aug 21 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 526 526 7a6a9b19f6b9b3921b5701490f189af0e0cd5310, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/21 15:01:00 #21666375
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_103658_761002_DE9B6B6C 
X-CRM114-Status: GOOD (  23.76  )
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

On 17.08.2023 10:53, Miquel Raynal wrote:
> It's not the first time we face this issue and the first approach we
> used was to "fix" the OOB layout to include all free bytes (not only
> protected bytes), which had the nice side-effect of allowing to write
> the cleanmarker in an ECC-free area and allow that chip to be used with
> JFFS2. This is indeed not a proper solution and I agree we should have
> a system-wide solution.
> 
>> Also I wonder if JFFS2 should instead write the cleanmarker with ECC
>> being turned of explicitly.
> The real question is, why would you still want to use JFFS2 on
> SPI-NAND? UBI is meant for that. JFFS2 was designed with NORs in mind,
> it can be used on small NAND chips because UBI is a bit glutton wrt,
> but I doubt we still have "small" SPI-NANDs on the market which require
> JFFS2 anymore. Do we?

Unfortunately, we cannot use UBI because we have a small flash SPI-NAND
and we need a small partition.

> Anyhow, if people want JFFS2 on NANDs, I agree we should maybe change
> how JFFS2 works and force raw accesses when it comes to writing the
> cleanmarker, because there is no knowledge of what is ECC protected or
> not in the current OOB layouts. I however have no idea of the possible
> side-effects, I've never looked into JFFS2 so deeply.

Then I can prepare a patchset that will disable cleanamarkers on the
compile time.
And today I will send the second version of this patch without fixes
to the OOB area.

-- 
Best Regards,
Martin Kurbanov

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
