Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D084CC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Apr 2022 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CNpx5S6eGmpZb/tc6jQahxixrx3Mgf8/9f655BpJ5o=; b=auA+3TzeMQjMhl
	h48Ns+kAOWSna65KZHJ826z75VlvJyImUr+26V3D/pys6C+YIeDsnXg+sIZqAxOR78AJBChCfI3nz
	jLB9Fhev+/nqibxEP6S/dJdrfGFFCrAlata3lSRPPKlYVAbbsmB1TIIUlEMTuTBrY0WAPN9GmIejE
	qv/7+g44U1vEK7EJKuB9ZDsWY93x1B46LB1cqo7LZzk6smWk4kOgSlTY9MebqEM2Pzk+XlK+3H9Il
	txmwovst78u/LKMP3Xo2TxI7B026Y1ljQPblrdv+UcxXJxBJwoeF4CoVKs+kcwd8uiFpF3+PZJ+Jw
	0DC9dqS4LaG5BZxLavmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc4bN-005ysa-LX; Wed, 06 Apr 2022 12:17:33 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc4bK-005yrJ-3H
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2022 12:17:31 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 236CHNtS107207;
 Wed, 6 Apr 2022 07:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1649247443;
 bh=xusxtaIjNVje7kIAPhVOZ5p+5hisSYWMbwUvNtg+Rs4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=BOM0ZDDkKKGjAqOP2Mqp13aY5ZF5LUN6kSdO3CNXayceuP1ldCdlBLK4anw9Yqs7w
 vXLMyPUOodcPQsGrfYfG3KR9N8DSlf+nuI5kITXL4xR/u4fCtlqLdFHBo/3/Tydqp2
 zkyak3B5LbIFWxkKD/TA7yv6EMGMKRH49Mjz095A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 236CHMMG100974
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Apr 2022 07:17:23 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 6
 Apr 2022 07:17:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 6 Apr 2022 07:17:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 236CHLBE113571;
 Wed, 6 Apr 2022 07:17:22 -0500
Date: Wed, 6 Apr 2022 17:47:21 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 4/4] mtd: spi-nor: sfdp: Keep SFDP definitions private
Message-ID: <20220406121721.j6wlbzxher4xhtba@ti.com>
References: <20220309144215.179449-1-tudor.ambarus@microchip.com>
 <20220309144215.179449-5-tudor.ambarus@microchip.com>
 <20220401200133.gyyvoe7xdbsww7cv@ti.com>
 <ed093fa5-b514-b0a6-166f-ecf117582b0b@microchip.com>
 <20220405193111.pnekaivbsj7hronp@ti.com>
 <1fa079c4a0341ffe6ad7bdebd3cb8958@walle.cc>
 <16af88ad-52ea-4ed7-782b-eba28325bf0c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16af88ad-52ea-4ed7-782b-eba28325bf0c@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_051730_340943_3F142645 
X-CRM114-Status: GOOD (  15.66  )
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

On 06/04/22 11:10AM, Tudor.Ambarus@microchip.com wrote:
> On 4/6/22 13:31, Michael Walle wrote:
> > 
> >>> That's correct, but I think exposing just the public defines in sfdp.h
> >>> is
> >>> the path to follow. We should keep private all the definitions that we
> >>> can
> >>> private in sfdp.c and expose publicly in sfdp.h just the ones that are
> >>> shared.
> >>> Flash collisions, and implicitly the need of public SFDP definitions,
> >>> should be
> >>> an exception, so I expect sfdp.h to be short in size.
> >>
> >> I disagree. I think we should keep everything in the same place. And
> >> since we need to expose this to manufacturer drivers, that place is
> >> sfdp.h. Who is going to cast the tiebreaking vote here? ;-)
> > 
> > I'm leaning towards Pratyush opinion unless there is a clear advantage
> > to move the defines.
> 
> Okay. Then we should move all the table definitions to sfdp.h, right?

We don't pass any other table to manufacturer drivers. Only BFPT. So 
those can stay private. But I don't mind either in this case.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
