Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20933C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Dec 2021 16:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRS9aOCbX/IwYWG1QFzhdh2Pwgy225DOMMNQet+8JSQ=; b=NN4fLslR88NH/v
	VMX0L4PXc8YbxXCF/Ra9bZ7T7X835G8SmFXJ41psKc511UC6qC267euc8GOBFEtGqeSCrUcH2emI6
	Wyk7foCeIka8UByGedvZ9kltuwO94Pvep/5qbENYE07FQccEBg0B9/wnwEQng7wbLBq2eDya9iUGx
	1Iihj8MSvieJuPEfFxLEydDU9k1excCqvL3D5h2sldxBIC7qU5sxrB4eX9xI4DMxNAZyNUKI8bG6Q
	D2IoQAnRB55kUpUu+c7CFk7AkE76ypt1ErUQmxDO14VzYDJbf+4Yr/jbEzYMHLSulh0F0LMtbwDfS
	aCCAQR1s6wy5IwWPGaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muzvX-00Dats-1N; Wed, 08 Dec 2021 16:36:19 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muzvS-00DasG-TD
 for linux-mtd@lists.infradead.org; Wed, 08 Dec 2021 16:36:16 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B8GZwTu049909;
 Wed, 8 Dec 2021 10:35:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638981358;
 bh=tw3OwjdRj9vPXb5r6L5qlp2b1Rq60gScqhejarKuboQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=phbfquo7sSUEfHU3aehyPafiMJo3S0rXoxXzAtxBVx3QZ0HamrR/0CUim9lktODSN
 s1eGtSrDum7rCKBfDsfn8S5h+wdpPkNhICmhgtoj9HikZfKwTu3xsYPL1EPdm3a/1g
 Z0mHyVdb4CyP8pZXtM2Ojfscbd/ejU9F/4zG3MNA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B8GZwZI066212
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 8 Dec 2021 10:35:58 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Dec 2021 10:35:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Dec 2021 10:35:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B8GZw1I075184;
 Wed, 8 Dec 2021 10:35:58 -0600
Date: Wed, 8 Dec 2021 10:35:58 -0600
From: Nishanth Menon <nm@ti.com>
To: Roger Quadros <rogerq@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <kishon@ti.com>, <tony@atomide.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/4] mtd: nand: omap2: Add support for NAND Controller on
 AM64 SoC
Message-ID: <20211208163558.5pvs7j7cmwwpmzrk@trickily>
References: <20211123103609.14063-1-rogerq@kernel.org>
 <20211123103609.14063-5-rogerq@kernel.org>
 <20211124131552.6b9bc506@xps13>
 <e52141a6-96fc-97d6-95d7-3e26276fbac3@kernel.org>
 <20211126104231.7cc43149@xps13>
 <917ac002-9d4b-237d-94f3-bcd05f481f39@kernel.org>
 <20211129043633.myxmgp6idbrqvx5p@unlisted>
 <e36c46e2-1d0d-4dac-e9a0-3a0cbdd023fa@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e36c46e2-1d0d-4dac-e9a0-3a0cbdd023fa@kernel.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_083615_118807_4FE6FC43 
X-CRM114-Status: UNSURE (   9.97  )
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

On 16:45-20211208, Roger Quadros wrote:
[..]

> Did I understand correctly that we can use a different compatible for older SoC
> in the overlay? e.g. ti,am642-es1.0 ?

If that is what we would desire. There are a few SR1.0 (not ES1.0)
examples for previous devices in [1]

NOTE: the dts in k.org will always point to the latest production SRx.y
device that has been released to market (aka products going to market).
previous pre-production SR support tends to be with overlays for various
quirks.

> 
> If so then I can get rid of soc_device_match and use compatibles matching only in this patch.

As appropriate for the subsystem.


[1] https://git.ti.com/cgit/ti-linux-kernel/ti-upstream-tools/tree/arch/arm64/boot/dts/ti

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
