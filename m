Return-Path: <SRS0=Xhow=5B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D29C0044D
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 09:47:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F129620658
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 09:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OGovQmEV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Wei65B6J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F129620658
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkbIFBty8gIYSmm04Rbv9pTnaV/kKVzMiV0zABdXZ28=; b=OGovQmEVsP2WYm
	jVxvTCkrVUZ+fhh6cUKrP74reZwC7N8hKYx/z1O8JNSCiiq5X5W9TYrZqMB2Mngpf8rDUtbot6lV/
	OVkYC5r6YXtwBDwhOJz0VQmVgu0ChBaCOwN6XBZvQwbwWNOUfFbIZFXp65eQQxiBlgEOPVqAjZX3x
	bqlOFTfw+kZHv+UVQcTwUuLvzZuncVHQRMZaOKEyk+7Y+kNyGniWS2vuxEFUDMJpPvpJisgZ9qiwS
	sDj19I9ldYB9xfjggSo7sM1rkekpFymJUe0ZpeuJrHZNXLKO+0rav/y4yQi+iTzp1yU+dYu1F5Pe3
	eKs/9gcG29dN/Sryu3Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDmKY-0003ko-6u; Mon, 16 Mar 2020 09:46:42 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDmKU-0003kE-M1; Mon, 16 Mar 2020 09:46:40 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02G9kWvG006458;
 Mon, 16 Mar 2020 04:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584351992;
 bh=67NfKjZCXz4JoWiD6fJ1v0YbK4GPD37mM9rvW/43LPw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Wei65B6JNh6HBmDkCjtnGulWnvu///dAGsrOvOF165b9GRGrqMMFp3Oe/NK0J9ZBU
 XX552222gziFCBqf4eaxapMykFfKxqWQpgTw7KkVbKf8c7i8moA6f5nvgdPIve9Mes
 hn0yFENE7hYuvx8w89jmHNNmWvTkcKfy1SnMFh3o=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02G9kWxk006969
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Mar 2020 04:46:32 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 04:46:32 -0500
Received: from localhost.localdomain (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 04:46:32 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 02G9kQfZ051982;
 Mon, 16 Mar 2020 04:46:29 -0500
Subject: Re: [PATCH v2 00/25] mtd: spi-nor: Move manufacturer/SFDP code out
To: <Tudor.Ambarus@microchip.com>, <bbrezillon@kernel.org>
References: <20200313194130.342251-1-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <28989bb7-9fe5-e4da-33c1-c3ad3442f9e2@ti.com>
Date: Mon, 16 Mar 2020 15:17:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200313194130.342251-1-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_024638_824561_EF1A6621 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 14/03/20 1:12 am, Tudor.Ambarus@microchip.com wrote:
> Boris Brezillon (21):
>   mtd: spi-nor: Stop prefixing generic functions with a manufacturer
>     name
>   mtd: spi-nor: Prepare core / manufacturer code split
>   mtd: spi-nor: Expose stuctures and functions to manufacturer drivers
>   mtd: spi-nor: Add the concept of SPI NOR manufacturer driver


>   mtd: spi-nor: Move Atmel bits out of core.c
>   mtd: spi-nor: Move Eon bits out of core.c
>   mtd: spi-nor: Move ESMT bits out of core.c
>   mtd: spi-nor: Move Everspin bits out of core.c
>   mtd: spi-nor: Move Fujitsu bits out of core.c
>   mtd: spi-nor: Move GigaDevice bits out of core.c
>   mtd: spi-nor: Move Intel bits out of core.c
>   mtd: spi-nor: Move ISSI bits out of core.c
>   mtd: spi-nor: Move Macronix bits out of core.c
>   mtd: spi-nor: Move Micron/ST bits out of core.c
>   mtd: spi-nor: Move Spansion bits out of core.c
>   mtd: spi-nor: Move SST bits out of core.c
>   mtd: spi-nor: Move Winbond bits out of core.c
>   mtd: spi-nor: Move Catalyst bits out of core.c
>   mtd: spi-nor: Move Xilinx bits out of core.c
>   mtd: spi-nor: Move XMC bits out of core.c


I skimmed through patches 7 to 22 and did not see any issues. No
objections from me.

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
