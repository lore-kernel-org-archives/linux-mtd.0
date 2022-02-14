Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCABC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 19:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgYuBCSbEX4lewMdR26qVFHlyk+UuwcdY7Ky7mHwLD4=; b=D/wE93d/x7JWtI
	6WtszHKEfyICXrmWe33vySY1myqqpIn72O3sHPdt3I/fXjJaXLGYkI3nmkgyS2Ta0mXyLKHBkuW+C
	VwBg7YxLSfyAKyp99IvClSBcWaGNe3YDAH94koaD5yekO1CzZVHaKGBxsH7wuJ3BmeHS7g4f17irN
	WNjjrJgWAsGf4FvUA+PvbzGEv93TN03YLIYtL5j1SdfvONwynU1SxTbhoIxUi1RtuavGqpr+hOmLf
	rrnF+ZeM+Wrf2srK1b2pql1eaK9kltdOVx69TSENaghK79pVPQAxECim2QQBBNSdlvaj10sNp5GV/
	81CUtRxfcyYolBUMdtsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJgZr-00Ge6I-OR; Mon, 14 Feb 2022 18:59:59 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJgZn-00Ge5W-Se
 for linux-mtd@lists.infradead.org; Mon, 14 Feb 2022 18:59:58 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21EIxpqg099035;
 Mon, 14 Feb 2022 12:59:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644865191;
 bh=Pz4wP+n3GDnd5dYw+LjYNjLY5RV4YQxdOk9eQvqnJ04=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=MNDzLqntzEgbm5a6KaOg1vVjSfRpGrC5z+5F3pu4eTtQ6wQzESXxGKTAp7R3N5QRv
 uw1I+f/h3UlZl58Xl7gLbi5O6dxprmdCds8U1zbRnzqE9bnbEAjLxLGGD6WFkniOuB
 4vrz4t8xGB1yRy/nJ9W4ZE2yfxpw/a/5t80GoF9I=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21EIxo3R013282
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Feb 2022 12:59:51 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 14
 Feb 2022 12:59:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 14 Feb 2022 12:59:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21EIxnaE103038;
 Mon, 14 Feb 2022 12:59:50 -0600
Date: Tue, 15 Feb 2022 00:29:49 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH v1 11/14] mtd: spi-nor: spansion: slightly rework control
 flow in late_init()
Message-ID: <20220214185949.lp3jjifypaqyjenp@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-12-michael@walle.cc>
 <f004399f-36b0-2099-b2a0-8ab0ecd114b7@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f004399f-36b0-2099-b2a0-8ab0ecd114b7@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_105956_051424_C7C42442 
X-CRM114-Status: UNSURE (   9.52  )
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

On 10/02/22 03:26AM, Tudor.Ambarus@microchip.com wrote:
> On 2/2/22 16:58, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Increase readability of the code. Instead of returning early if the
> > flash size is smaller or equal than 16MiB and then do the fixups for
> > larger flashes, do it within the condition.
> > 
> 
> mm, no, I'm not sure this improves readability, I see the two equivalent.
> The original version has the benefit of no indentation. Pratyush?

I am fine with both to be honest. But Michael's reasoning does make some 
sense to me. So,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
