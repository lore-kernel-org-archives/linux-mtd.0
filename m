Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC3FC001E0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 15:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wB/RfqY3xQ/AmrsFgalJyiAhlzr0Efe2PbcrWcvD5Y8=; b=W3EwP8qDOkthFd
	XUTmSXI64YJRuLpzeXQ7pUqbJ/6zD3flwJMps/RS0XtnHfewkL9lxYHfrQ/DVDQNqThJz1jc74+D9
	+4L6SYS1zLAPKc05JA9ebze+z4pD6sT0fCBl4umkwWy3uh/ejU0iwDhqVevjpnO6MJKUQNB1GluXW
	1/sen2gdm4PeYlncKDTDLNxW4z9sODiBGnJp1FyUyOoUE4fn2fiMEWyCEQgh6PK2SDi+PQFdX0ohN
	tmSpdwfO7qBPq35R9c2hSnebOQEAExZmvFZaJLnwitmKY0exKOHz0yxWLwdY2gYhVyWDf66tX5FvE
	Ci4vEyw2UrnIsiVarkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIRd-004UMl-27;
	Wed, 16 Aug 2023 15:28:25 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIRY-004UKy-2j
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 15:28:23 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6D4DA100004;
	Wed, 16 Aug 2023 18:28:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6D4DA100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692199692;
	bh=WE0hIh5RLBABYfVTZR+pWZ3G2DbPLavvbNDma5RqYUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=OCAU+WoGGr5mo0/LaK5uScFYuclofAwnb4U5NcZP09BHntYjGIu+wflQrFBroWvHX
	 wJXcFYrNS+P+oYbadIOkI+K1ukx0KDD3WdsxRllCeGkwstPc4fOMHBDonmbQUVJq2Y
	 FVX9BdLrBGSUUx4USXQuqqzzi8PLJsHZpQGb/c/+y6rAeqXkxExUaTiatMonfuswXb
	 wCydyTOKhrCwFcvCAqJZWJqLljy4nmWCWWTMtkOTzoyv48zxHHkDlWcVKeafb+blkF
	 YaIvFDD1+MqmXtKvrpTc4X4hCGweaFQ5n+8suyqCAH7f5S9cKF94F0CyznkhPfL55V
	 jRqXxwJxEaquA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 16 Aug 2023 18:28:12 +0300 (MSK)
Received: from [192.168.1.146] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 16 Aug 2023 18:28:11 +0300
Message-ID: <b619ef58-06c3-c61a-bb0f-ba243a4a2ade@sberdevices.ru>
Date: Wed, 16 Aug 2023 18:28:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1] mtd: spinand: micron: correct parameters
To: Frieder Schrempf <frieder.schrempf@kontron.de>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@sberdevices.ru>
References: <20230815161024.810729-1-mmkurbanov@sberdevices.ru>
 <0f54b3dd-1fce-4f81-8652-d50fe1bb3873@kontron.de>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
In-Reply-To: <0f54b3dd-1fce-4f81-8652-d50fe1bb3873@kontron.de>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179287 [Aug 16 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: MMKurbanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 526 526 7a6a9b19f6b9b3921b5701490f189af0e0cd5310, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/16 12:02:00 #21629266
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_082821_568658_EE8D29DF 
X-CRM114-Status: GOOD (  13.25  )
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

Hi Frieder.

On 16.08.2023 10:21, Frieder Schrempf wrote:
> I'm okay with 1. and with adjusting region->offset to 4. But I don't
> really get why we want to restrict the free oob data to the
> non-ECC-protected area only. Is this specific to Micron? Other SPI NAND
> drivers also spread the free area over both, the ECC-protected and the
> non-protected bytes. Why do it differently here?

We encountered a problem with the JFFS2 file system: JFFS2 marks erased
blocks with a marker to avoid re-erasing them. To do this, it writes
a special marker (cleanmarker) in the free OOB area. And if this OOB
area is protected by ECC, the ECC will be written. However, during
the next write to the main area of the same block, the ECC will be
incorrect because it's necessary to program both the main area and
the OOB area at one programming time, so that the ECC parity code can
be calculated properly. Other SPI NAND flash also susceptible to
this problem.

-- 
Best Regards,
Martin Kurbanov

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
