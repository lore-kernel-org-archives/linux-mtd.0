Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D187C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07C3rYO3dW/gHblplnOcJQNw3dT6zwMgSRR+5iQImKw=; b=hAmmqxssybZ5Jv
	yLqzFLwZNLFXExTfg+1LZ6wdn4YRdydOZUt/r18lQOW6lxiLC0yGXu16MkhZ4PmorPmMQHHMurc3n
	2thp0vBcxV5w9ozasNdb/wwCkplcc5/WLelOu21WdecE6khXXqA4lTSYsdovQlzwBzNLJy77TPOz6
	oVZikot6lzJ5mKrb+boU5hp4ijQqyPMuDNIvKXKQznlesSFjCbGkqVFFtawMtNT3zQ+Z6f7r2db0H
	7sYn4WMpvCClZKDfbC1qBnwLDiG+gxvo+8wB8Kt5Z0//PwBTmpEV4pPUiCbP6o8MKwzdVWBQU6g1S
	EFK6YRqZnZRhiFePGXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMpqZ-00DsGW-HU; Wed, 23 Feb 2022 11:30:15 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpqW-00DsFk-0q
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 11:30:13 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NBU6l0119499;
 Wed, 23 Feb 2022 05:30:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645615806;
 bh=8iJFbuoO/1UTlyrGebm94tvMfHSgMwxLXJIsLPvUJOU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bKYjk+cDLv/VzLu5Yd4T/ISZYnkQhp/ZMu38B4s9ls486So0h9Rl+zpz76Kq4CoGo
 rewbWvoqnKbYED/Z0mGGbIp8yYI1SO09oa4bJVD9Vg7FFdXQSWwxvNzFd+FUB82zoa
 BZ7cn4Us6AQvC/I2vX+gFf5MNWngy22rJdUYyPLE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NBU5XS115414
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 05:30:06 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 05:30:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 05:30:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NBU4CM050742;
 Wed, 23 Feb 2022 05:30:04 -0600
Date: Wed, 23 Feb 2022 17:00:03 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v4 00/32] mtd: spi-nor: move vendor specific code into
 vendor modules
Message-ID: <20220223113003.cuf7e6kgvjwsukzy@ti.com>
References: <20220221120809.1531502-1-michael@walle.cc>
 <d45daacc-8372-9b2d-019e-5d383db4fa57@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d45daacc-8372-9b2d-019e-5d383db4fa57@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_033012_240201_2DA4CFF9 
X-CRM114-Status: UNSURE (   9.84  )
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

On 22/02/22 08:59AM, Tudor.Ambarus@microchip.com wrote:
> I would like some tested-by tags if possible. At least with a micron and a spansion flash.
> I think I have a micron and a spansion somewhere, I'll try to do a short test too.

I still have some patches left to review in this series. But in the 
meantime, I have tested it on a Micron and Spansion flash. Ran through a 
few Erase/Program/Read cycles.

Tested-by: Pratyush Yadav <p.yadav@ti.com> # on mt35xu512aba, s28hs512t

> 
> Cheers,
> ta

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
