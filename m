Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015F7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 19:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmnykwwrrXhM2QuLnAcfkloalcuiVSzH6Pn6cYO2R+4=; b=sQCl6QCKD9deEN
	Z9DI/udjD0IvqlnoWVuMbGDX+WjwjtEwLFUe4eCc7CWq1TkCNRSuAMdath/61DPeWj5EdV9+nLxgO
	rQr+lcXjD2FrJRRpV93nKnk0yHg25wAwuzB4cSWgfBlL3x3wCWIh3IeOh7KlVOVQ7e0SewPmKvmDp
	RzM8Z+4xvoe63i4lRyrkYTucVMY/Kgd4pii+7DJSQZmGaot3tNGqjkU8cHnplrMchYb3RHklFA/Dn
	vftZ2yNnjWg8JY5UjIg/lhkxK3nV81S1kLgwlD28rOH0je12h0isnYGxOmBRhez22FABwqSdMoz1+
	u7gZX+j7ZOaDPOjeGUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK39K-004Dda-8v; Tue, 15 Feb 2022 19:06:06 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK39H-004DaP-6z
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 19:06:04 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FJ60PL050269;
 Tue, 15 Feb 2022 13:06:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644951960;
 bh=tsaW/C9jOXtVadmod9DVs+eOJxFja8YfXKVq8diX3lw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=PiO0xJ/YAPvGHYLYeh+4UDIvjDAHqHku0mTsTcB+J1ocIoeyUOqPfztqLq3zEEGJC
 eo6B51g9ver5UvU7GXSAY45DA0jg78WqZ9tx6p5uCXWfu3nK0ikDNXvXaA8pL/iYrO
 Do0uM+ZnKqAQBZ9l+2YD51ZfFhOcyc8J42jZJ+T4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FJ60i5030392
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 13:06:00 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 13:06:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 13:06:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FJ5xOJ057123;
 Tue, 15 Feb 2022 13:05:59 -0600
Date: Wed, 16 Feb 2022 00:35:59 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH v1 06/14] mtd: spi-nor: xilinx: correct the debug message
Message-ID: <20220215190559.meso74vynxnbuwz7@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-7-michael@walle.cc>
 <e3712b8b-9830-5be1-3a31-97daa44f477f@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3712b8b-9830-5be1-3a31-97daa44f477f@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_110603_336613_990E3D42 
X-CRM114-Status: UNSURE (   9.99  )
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

On 10/02/22 03:11AM, Tudor.Ambarus@microchip.com wrote:
> On 2/2/22 16:58, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > We are reading the status register, there is no XRDSR register.
> 
> don't use the commit message as a continuation of the subject. Tell in the
> commit message what you're doing and why it is worth taking it.
> 
> with that fixed:
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
