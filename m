Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BF2C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9mnfELvWH7VMwA45BbzJFS3Bmd4jF9rhUiTmIy85Xc=; b=DpIOYzKvI2xQgI
	c4NGvZGorcsCwZWOGY/Jxtn1e49meH8sgF5Vv7xn2mxP/umwUHhw0WeOt7saRvQWclg8N0R+emytp
	qgblGLdy7S73mfN1m7mU1QlCeXHbz8RlSAn7pDacVUaivIXsktM5/Vp6F3j//3LIF4j/Hvd8cqGKN
	VsZD8Rr5eQqdS6NXcsrT1RMrGILgkT0+xqqRebH4ygIZp089hdsLzuXGHt6DbBPQWqTO4tC9/hxSy
	++y26QBUGizrzpIlgNo/VqMQO1lDRQvlRBsEdog64Sbr3uTmZth3ZAZ4b2UIFBLv5/axbzlwGDSBR
	YNko7Ho9FlNyddTJwcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDiz8-006gjG-95; Tue, 19 Jul 2022 08:53:42 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDiyw-006gQa-1f; Tue, 19 Jul 2022 08:53:31 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26J8rKuU061520;
	Tue, 19 Jul 2022 03:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658220800;
	bh=QW/UxzdGUCCglOm1zn3HugndNhiwjnUklPDBq6bESTU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Yqlvw47bwRrAGqp7XgWNU4JNYCo7tsrkQcT2tp4SXhFQeHm9HFRDS5v0i9ffQU8jn
	 V59AfPX0QPBnE3PtDm5zmxp9RBEi3ZH3y+ZAyNfqE9rJ5YlJkNLF7/an4A58ya9Q5q
	 CWNwvD0aSL26ms9Zaxxwefx1qvdaIAVwuiyXJLW0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26J8rKEN118547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Jul 2022 03:53:20 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 03:53:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 03:53:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26J8rJJu056807;
	Tue, 19 Jul 2022 03:53:19 -0500
Date: Tue, 19 Jul 2022 14:23:18 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Biju Das <biju.das.jz@bp.renesas.com>,
        Tudor Ambarus
	<tudor.ambarus@microchip.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea
	<claudiu.beznea@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju
 Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Message-ID: <20220719085318.4y4262vnoszgnjz5@ti.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
 <fed53ac13bea15d9d9dbeca40983c823@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fed53ac13bea15d9d9dbeca40983c823@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_015330_190150_61923ED4 
X-CRM114-Status: UNSURE (   8.31  )
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

On 15/07/22 01:55PM, Michael Walle wrote:
> Am 2022-07-15 12:57, schrieb Biju Das:
> > Add support for Renesas AT25QL128A serial nor flash.
> > Details of flash chip can be found here [1]
> > 
> > [1] https://www.dialog-semiconductor.com/sites/default/files/2022-04/DS-AT25QL128A-129F-022022.pdf
> > 
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Thanks!
> 
> Reviewed-by: Michael Walle <michael@walle.cc>

Our purely SFDP based parser seems to be working well.

Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
