Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E0FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 19:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJBy9rnoOxHx7Ro2qKl2MAzz14pmw+RXXSpWnkyMG7I=; b=Zven85KuYmKm0d
	njPL5jekg2pF95s/wIgQibRuMH2SSmCqJ8dphoITrESnyJJXqGnZUn9J5459JrfPb1wUikhhE+o0f
	PX0LoEVGpHPoc1Z0kQMw5BZNtIZyLzGFCVh2XNWEV+7M8xSCY0EGIflkys+oUg6dEZ4G/zNKIgfIy
	N8/CNdCbsjDgOSpJtv5BGKJMgDnedwx22DOIorR8VmwyRmHZDv/G/0Qlc18dVondCZalEbbAeIp68
	HJokvf8MFQT7W2HBPpPzhV33ZwKukF+Iph0SiYaByJ8mGpI04QUXqLmf7WcZM2ondmYdXHFHMqAMO
	lEkXsNZcnA8NzQVY5jmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbotb-002NIT-DW; Tue, 05 Apr 2022 19:31:19 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbotY-002NH0-Jl
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2022 19:31:18 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 235JVDpB035657;
 Tue, 5 Apr 2022 14:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1649187074;
 bh=6S4oBgr084pJY5AjWt0SE218ar7kVDqYu4XZa5mwyyo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Ae8KIXXmxWXu6l+Go3Ow0EnTuWC2CugQgQ/jRblMkKcYe5EyR5cRLo7T9ve2wHmYv
 Oxv5TSP/pMblriRFbArE5tBDInYMSRBzAiFxWVNTUtMdg4cqw0T2oYSEPtjPQNuhnv
 lfEnRKFQnRiGXoVi7CRNdgTjRgPRl1Pv2rMQOFqk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 235JVDOl031228
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Apr 2022 14:31:13 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 14:31:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 14:31:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 235JVBE2105678;
 Tue, 5 Apr 2022 14:31:12 -0500
Date: Wed, 6 Apr 2022 01:01:11 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 4/4] mtd: spi-nor: sfdp: Keep SFDP definitions private
Message-ID: <20220405193111.pnekaivbsj7hronp@ti.com>
References: <20220309144215.179449-1-tudor.ambarus@microchip.com>
 <20220309144215.179449-5-tudor.ambarus@microchip.com>
 <20220401200133.gyyvoe7xdbsww7cv@ti.com>
 <ed093fa5-b514-b0a6-166f-ecf117582b0b@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed093fa5-b514-b0a6-166f-ecf117582b0b@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_123116_792468_8A7EF1E0 
X-CRM114-Status: GOOD (  16.81  )
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

On 04/04/22 06:19AM, Tudor.Ambarus@microchip.com wrote:
> On 4/1/22 23:01, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 09/03/22 04:42PM, Tudor Ambarus wrote:
> >> Keep the SFDP definitions private and expose just the definitions that are
> >> required by the core and manufacturer drivers.
> > 
> > I am not so sure about this. Since the post_bfpt hook passes in the bfpt
> > table to flash drivers, they might end up wanting to use these for some
> > checks like issi.c does for DWORD 1. They would have to move them back
> > to sfdp.h for that, which just causes extra churn, and also puts some
> > BFPT related defines in sfdp.h and some in sfdp.c.
> > 
> 
> That's correct, but I think exposing just the public defines in sfdp.h is
> the path to follow. We should keep private all the definitions that we can
> private in sfdp.c and expose publicly in sfdp.h just the ones that are shared.
> Flash collisions, and implicitly the need of public SFDP definitions, should be
> an exception, so I expect sfdp.h to be short in size.

I disagree. I think we should keep everything in the same place. And 
since we need to expose this to manufacturer drivers, that place is 
sfdp.h. Who is going to cast the tiebreaking vote here? ;-)

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
