Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB22FC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yb4P+Be+ESeJFP13+URveCF1KasrW++jdlnZqxmxX2M=; b=kUXsD7/Y5OGmMY
	Xv4JK2bEaB05xW+N2rOdrusoDt1ultV8cFCd1OU9CrU7rLAmarG3PTFbZLYdYK971bnS9P6QVbbdO
	w/PFIm4/Q7qgR5ngf6VBUqreLGN468E50o7eaPuhm50i/Q+Bhx0kcnZyoF0t4EIEQXwiZR0LJdTrX
	3KaCGeVIZk2kYRlprxx59fbnX/PhZQ/oWBoQF4Kk3s1U6pjqGzSi/wOE0BL9zI3I6DCf8N7WvqrTg
	2BDGnfei6X/72uPF7wW0eHsZaWoK9qunfbk5v71dFr3u8otBAoeypDzrHWlCMpxmzEP+KW2lOR/uB
	tPBGkJK1Emuvn84qtkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMptR-00Dt4D-RW; Wed, 23 Feb 2022 11:33:13 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMptO-00Dt1H-6H
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 11:33:11 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NBX5HP049950;
 Wed, 23 Feb 2022 05:33:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645615985;
 bh=Aezzoo6pZ5NzmYT+D2UloYyGtir9OeBkPwDbVKZR2gM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bPIYOmtXlAjdUSfWXHypD5xo4CiqRGsWSgbQBVD9JrQOT7nJjRHWS1OcKX1vh1dyS
 uWqilF3ExfZA/2JW2oZICU8ex1f5FoFQQEeiDKZilrN1NaFlKoicn1+vbUwoK+xzSC
 ei6rA02anR8swldB2AQQW1TZSnfO848fMNlBShRM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NBX5Un015318
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 05:33:05 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 05:33:05 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 05:33:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NBX4lI046878;
 Wed, 23 Feb 2022 05:33:04 -0600
Date: Wed, 23 Feb 2022 17:03:03 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v4 01/32] mtd: spi-nor: atmel: unify function names
Message-ID: <20220223113303.4cashhkp624yo5sg@ti.com>
References: <20220221120809.1531502-1-michael@walle.cc>
 <20220221120809.1531502-2-michael@walle.cc>
 <20220222072314.tk4bw5sngwnk6zwr@ti.com>
 <338bfd692a372450d1210a333994c31e@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <338bfd692a372450d1210a333994c31e@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_033310_298045_FBCF93C1 
X-CRM114-Status: GOOD (  10.93  )
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

On 22/02/22 08:26AM, Michael Walle wrote:
> Am 2022-02-22 08:23, schrieb Pratyush Yadav:
> > On 21/02/22 01:07PM, Michael Walle wrote:
> > > To avoid name clashes unify all the function and static object names
> > > and
> > > use one of the following prefixes which should be sufficiently unique:
> > >  - <vendor>_nor_
> > >  - <flash_family>_nor_
> > >  - <flash_part>_
> > 
> > Shouldn't this be "<flash_part>_nor_"?
> 
> No, a part name is already unique and its the same "style" as spi nand
> is doing it.

Okay. Fine by me.

I have not went and checked every single function changed. I trust you 
to get them right.

Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
