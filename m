Return-Path: <SRS0=ujMC=FW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BBCC4361B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Dec 2020 14:16:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FA1023AAA
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Dec 2020 14:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FA1023AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZIxKNI3BHkrhftOOniNhf5AmbzbismjStKg3kz1KzNE=; b=hZsD0XFvxf0e7bSqfL1a5FvSN
	EHz0G8iPW4qgscvk1sT4MWnZash+Ewc+UxARHfr2GNgm3qzbM/Q0s6ty9L3lgSVMJxmDNzepKZNJC
	xCzJ6q36wGUyLtpKy+UzqNbHnSg592UZObxYY2tI2jZaeWV44zYQFplWaBk/85jUb9rWRkK13I9G4
	HyIphNAL2FBCI3GeOW7wrWL+TO7cV5UptTFyl1++lPTgNtHKCtKYj962WNbPgFxwzb/hUO56tXyXu
	Cbb6N3hKm/Jr+TTmQBgqAJ7/gSPXVKv+fvpiy67vCZs+o5UQ4Teap3x/8bszlMzTLiBZbltzl0nco
	PnDcmbJzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqGY8-0001n6-6J; Fri, 18 Dec 2020 14:16:04 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqGY1-0001mQ-9K
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2020 14:15:58 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BIEFpSF091620;
 Fri, 18 Dec 2020 08:15:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608300951;
 bh=DwkWsrszvMiOb0nL+AJTXiIMeG3qwYFNPypoohDjmBM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=VzidrxPLx6gfI/Qmz3CYdCjimJ+1lzhleusL0O2SrwEQ7Hl7IYPi9Ib2sbyP9r5XD
 l8DvOfP7CfnqYiY3wVDJBxWXkkJbqsz1izeDt+Mmb9RHUqtVA0TTIHuxphye1A8V2j
 ofvAICBbrvQUasQ4DbpGv3Lg+Pnj+6355q+b5xb0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BIEFp2E002848
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 08:15:51 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Dec 2020 08:15:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Dec 2020 08:15:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BIEFoHU092617;
 Fri, 18 Dec 2020 08:15:51 -0600
Date: Fri, 18 Dec 2020 19:45:50 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Fix SMPT parsing when 4BAIT table is
 before SMPT
Message-ID: <20201218141550.f2ik6lw65ly4lca5@ti.com>
References: <20201212115817.5122-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201212115817.5122-1-vigneshr@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_091557_428186_53CD1543 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh,

On 12/12/20 05:28PM, Vignesh Raghavendra wrote:
> If 4BAIT table appears before SMPT then, nor->addr_width is set to 4 before
> SMPT table is parsed. This causes SMPT parser code to use addr_width of 4
> for reading current sector map configuration in spi_nor_get_map_in_use()
> if SMPT_CMD_ADDRESS_LEN reads SMPT_CMD_ADDRESS_LEN_USE_CURRENT (see
> spi_nor_smpt_addr_width()). Instead code should be using the value
> presented by BFPT_DWORD1_ADDRESS_BYTES field. On S28HS family of devices
> this bug leads to selection of invalid sector mapping thus causing erase
> and write failures.
> 
> Fix this by parsing 4BAIT address table at the very end after all other
> parameter tables are parsed.

I'm not convinced this is the best way to go about this. What if we have 
another table tomorrow that introduces some other side effect? Will we 
special-case all those as well? IMO a better way of going about this 
would be to make these parsers not affect the current state of the 
flash, but instead store that information as a possible future state of 
the flash. Then we can use that to finally decide what we want to do in 
spi_nor_set_addr_width(). In fact, that information is already stored 
via SNOR_F_HAS_4BAIT (though I'm not too opposed to adding a 
nor->params->addr_width).

I see this as a cleaner alternative to your approach. We do need to be 
careful about any obscure bugs here like with [0] though.

[0] https://lore.kernel.org/linux-mtd/20201006132346.12652-1-bert@biot.com/

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
