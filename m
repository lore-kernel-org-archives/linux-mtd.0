Return-Path: <SRS0=11H7=KC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82666C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 13:57:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED136141B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 13:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED136141B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w5UvZQTHneoKLCALrP4n8TOKuKrnJg2J7P7G40in+BY=; b=ffrfKdJ53SftRIalv7UUssToX
	Rw+Bb+kUybDtkp1uxccXfW2xtzdmmygXTxZQI4fIfZsa6rhLPwnL6LhHuymLJh1Hr15YKoe77CqWr
	HMv7UxZolJ3oksqHwuTA3HrHlbtMZGZTVjf2R84W5buEH1rkYv6SWo2K9gBLGiZYZUt59OrX0pPAA
	jJtEEdp7BN0A8uw9E+Ct9bRsP6cYi5MHi87mEgZcf4OetD3797DK8BtxPxn5bG9idmN4AP87xuez3
	VhBzFLgBybpss4oNiJ9JqhxoefsNwzub4K6LQ3IT1OpoSvSsqRjQj7HQG9HWIbmILbuHw2dY6p3ey
	yTEi5PWRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf0yF-007E6N-S9; Fri, 07 May 2021 13:56:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0yD-007E6I-4D
 for linux-mtd@desiato.infradead.org; Fri, 07 May 2021 13:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f37/TL3HEr+S3ewgNxXgMI9KuXAOPNHmxT2K4OR6Jvc=; b=NfetYGG26gOChi33DLYhDFHOUI
 7rV6Gs7+sUXAFFHXqCmiImPkvwcX/o5zpxFU3bow3NwtV5FATzHuKrd9QdD5DqMrTJZCqTf/6zegl
 pRWrsW8mMQwc+Ijf+nm7ashJ3Y1yUPq0D/+eactT2aFIX071k6SMiKSMYZNbkKbzGiQ8XSqXBGeyu
 MamYVtbrK9xpgWxkA072QS0U1OICbC3Td29D1bSEwuhed5Z5qXpfmTL7fIv5eD6gm1h9IcjjplXvW
 SRIKvBC1gS/Ot1cECu7sfmcDZHo756Ma2QeZ2T9HRnMOLLXDHymE65hQ3c2SxyUBhOVWFPdaL2qhJ
 /FWlpUlQ==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0yA-006u2Q-3X
 for linux-mtd@lists.infradead.org; Fri, 07 May 2021 13:56:43 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 147DuZQ5113652;
 Fri, 7 May 2021 08:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620395795;
 bh=f37/TL3HEr+S3ewgNxXgMI9KuXAOPNHmxT2K4OR6Jvc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=aSU23RdLK0xVAhC/u1TH99n/i5e+FjWLxGBJWUYXqnW8rjh4h9AO0evYzGhTckf6E
 9kfnrXwCvBYYKjCI4csXMnHO9fjH2h/VjU/9qOpbsAuUJyKiq6Sia0yN9iEosw6Thu
 TJEbaOOyMVcF6a6S64gKhT9XbuHu4u24e6t3OY0E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 147DuZBJ051614
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 May 2021 08:56:35 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 7 May
 2021 08:56:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 7 May 2021 08:56:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 147DuYSA102637;
 Fri, 7 May 2021 08:56:34 -0500
Date: Fri, 7 May 2021 19:26:33 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 4/6] spi: spi-mem: reject partial cycle transfers in
 8D-8D-8D mode
Message-ID: <20210507135631.maue7gorfzsv4qpk@ti.com>
References: <20210506191829.8271-1-p.yadav@ti.com>
 <20210506191829.8271-5-p.yadav@ti.com>
 <20210507125533.GA6383@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210507125533.GA6383@sirena.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_065642_293227_E02D6D4A 
X-CRM114-Status: GOOD (  19.44  )
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

On 07/05/21 01:55PM, Mark Brown wrote:
> On Fri, May 07, 2021 at 12:48:27AM +0530, Pratyush Yadav wrote:
> > In 8D-8D-8D mode two bytes are transferred per cycle. So an odd number
> > of bytes cannot be transferred because it would leave a residual half
> > cycle at the end. Consider such a transfer invalid and reject it.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > 
> > ---
> > This patch should go through the SPI tree but I have included it in this
> > series because if it goes in before patches 1-3, Micron MT35XU and
> > Cypress S28HS flashes will stop working correctly.
> 
> It seems like this should probably even go in as a fix even if nothing
> is broken with mainline right now, it's the sort of thing some out of
> tree patch could easily trigger.  Unless anyone objects I'll do that.

If it does get backported to stable branches, patches 1-3 would have to 
go in _before_ this one. Otherwise it will break the two 8D-8D-8D 
flashes: Micron MT35XU512ABA and Cypress S28HS512T. Without patch 1 
8D-8D-8D mode will not be selected correctly on these two flashes. The 
supports_op() will reject it because of 1 data byte. This is a 
relatively safe patch for backporting to a stable branch.

Patches 2 and 3 are a slightly different matter. They add an extra 
register write. But most controllers I've come across don't support 
1-byte writes in 8D mode. It is likely that they are sending 
bogus/undefined values in the second byte and deasserting CS only after 
the cycle is done. So they should _in theory_ change undefined behaviour 
to defined behaviour.

Still, they introduce an extra register write. I'm not sure how 
risk-tolerant you want to be for stable backports. I will leave the 
judgement to you or Tudor or Vignesh.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
