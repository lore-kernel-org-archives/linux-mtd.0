Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C002C4361B
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 18:11:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B0B23B54
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 18:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B0B23B54
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9pJMZ1qwU7juJAF6QZ4jKcpLIs3jMs5G68zbsNLkLg=; b=YGPxmkOmgj/bf0yi2oZjsem/tT
	Y9kLk0F7T7CqtQ+I6zV5Bn4ayvQmzbfkaYWxDldJJ8r4WcO7q8Ay0Wrn8PaK73HRSMTR/FWvUI/6S
	0Z1VJ53ETw3rKJ2Ckn0aFe4ithM9h900BkHYvm48jjmHOq1dfcnCbJNzJJj7zjsyZRO/Z3FFfP42M
	i4wvft+GNsRhtHsU3DlaGFzC07vhLhvxsAw83mue3UHUnQWaz/gix5DC+hfQ7GN0VdPvxHMrjTold
	vp8ZKQc5H65jVs3bTOcVgEmdPcJRzrpSzG781JdYe9tTgOHqieTPeNsiOYCb8RJ650EZp0+ZBmyfa
	HDMSTeqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmhS1-0000LA-Ch; Tue, 08 Dec 2020 18:11:01 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmhRy-0000KJ-9L
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 18:10:59 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8IAsIO060952;
 Tue, 8 Dec 2020 12:10:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607451054;
 bh=KukNEevA95t01KvHxeKqUpiG0yj/87OEttzDlhLnfr0=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=PKZxcP+91fPhvIxMRdbBkUtI4nXDQzONgYsz8byNZB3dB+0NAb1KEHlTOUGkXYakv
 8qpzWjAbYUGrHTxtNkSDml9JYmGMD7a0VGII0YEx2MkTP0gyTZDjPeF1LN05xA3AVC
 vCc/B8EK65qDnf+WNRW0TLr9rtieCum6MKk4TIBc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8IAs7A103397
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 12:10:54 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 12:10:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 12:10:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8IArMI058897;
 Tue, 8 Dec 2020 12:10:53 -0600
Date: Tue, 8 Dec 2020 23:40:52 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] UBI: Do not zero out EC and VID on ECC-ed NOR
 flashes
Message-ID: <20201208181050.z747aiiccoxj6xqz@ti.com>
References: <20201201102711.8727-1-p.yadav@ti.com>
 <20201201102711.8727-2-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201102711.8727-2-p.yadav@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_131058_405434_6DFA0D68 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Richard,

On 01/12/20 03:57PM, Pratyush Yadav wrote:
> For NOR flashes EC and VID are zeroed out before an erase is issued to
> make sure UBI does not mistakenly treat the PEB as used and associate it
> with an LEB.
> 
> But on some flashes, like the Cypress Semper S28 SPI NOR flash family,
> multi-pass page programming is not allowed on the default ECC scheme.
> This means zeroing out these magic numbers will result in the flash
> throwing a page programming error.
> 
> Do not zero out EC and VID for such flashes. A writesize > 1 is an
> indication of an ECC-ed flash.

Patches 2/3 and 3/3 have been picked up in the spi-nor tree. Can you 
please pick this patch up?

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
