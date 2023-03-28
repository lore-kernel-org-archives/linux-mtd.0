Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF10CC76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYEdzxRRI5QBtwZK7n98505b4LEo9/DUVTTqloeM79o=; b=wW6iuRkkacDPVD
	UPxAa4ZnANJnz6DWu0OZGcAhdmpP/YZBdfxXB1e+bek5oBmPXkTvu5dwL9R2yGFK0q5DHlMeph52E
	ZXmJ6EvllZWZrTIB6T/AgDBsciz6vsMcu9f3WDxUaSo5N11EXetUib0cfA4idifEFHbKGHGbmc+9G
	Y7/07RVpDtVp6sCXJJLSDN7s4ZugIMfJN60MjWmWfB5H9QJSpyDrFEL0uzc8+/lDiKXUf5/RF/88l
	nGCBRB8Jp4C8MRVjOiT+MqfftR+4k70z+0ZNOQGNCrkb9G3n5hb4D298eMVwzqAI+z9KZMV27LavX
	vELi62o3A2BwplJJJucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph92h-00EUhN-2R;
	Tue, 28 Mar 2023 13:07:15 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph92b-00EUfi-2f
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 13:07:14 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 7EE3A5FD14;
	Tue, 28 Mar 2023 16:06:59 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680008819;
	bh=5rDfZC8d79blVeGeWpEEZesfjJmirAJLjs3jHC7svIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=CKz8G7ntT/IDl4V17xoe7K5oRh5pQHZZOXaACv0B3yrhmXE87VuXtR3z5qhar9XuO
	 Lv0W3HgEzNelk9ZQLg3Lv2oGKq0+VH1xBrlLKGL02x7wpT8+JzWCM3nFD4X4NMq0vc
	 v8iqCXkKtX1L5+AzvcIhfPQfLtDnCkrHXaPIVLrQazW5uRqv2iFERwOhoYJJEUuONy
	 CmanQVulOCsVYWkFfAVE6jvIuYYX6SlF7bqeyPywlkaXRuIk0GmTrKSYwXqspLywBj
	 0RnXyCmmzKmulsOE1urqdqpdWfWbAzNMXxGGaIBkUksEIUh7USCcoi+0jyhUhjwF8z
	 ih3m20ummXwlg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 28 Mar 2023 16:06:57 +0300 (MSK)
Message-ID: <0c18b3b7-b890-e029-2f67-d0b7df545ad4@sberdevices.ru>
Date: Tue, 28 Mar 2023 16:06:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] mtd: spinand: add support for ESMT F50x1G41LB
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, Chuanhong Guo
	<gch981213@gmail.com>, Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, Felix
 Matouschek <felix@matouschek.org>, <kernel@kempniu.pl>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@sberdevices.ru>
References: <20230322151625.791131-1-mmkurbanov@sberdevices.ru>
 <20230328145639.1aef44e2@xps-13>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
In-Reply-To: <20230328145639.1aef44e2@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/28 06:38:00 #21021220
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_060710_401630_27AB9AD1 
X-CRM114-Status: UNSURE (   9.54  )
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

Hello Miquel,

On 28.03.2023 15:56, Miquel Raynal wrote:
> I was about to merge this patch but it turns out there are conflicts in
> the tree. Can you please rebase on top of nand/next and send a v4?

Ack

-- 
Best Regards,
Martin Kurbanov

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
