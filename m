Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C101FC433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 09:06:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56EFE64F33
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 09:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56EFE64F33
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vkwHJ10a/0GvxWAuggEpNzCMEqWi2O1dXQwMm9pJeXU=; b=rBPFyC55JCSMSX3s/4xgzXJzJ
	ufyCdGnLE/z9+YbmaJHkjHQwvKMVQZWd+I1yzaW/4MMFZQ1HDtzC3G4S3VXfrR8Iq9kwngMJnzGId
	45RereENT3JYluzc0X/O1HBFeOHgQq7FqlNgsWkvDa2oyMEHtozt5KqvWeDMVdjCWFTP05JJFyM0B
	ZB4wn3Z0mxIDGMOoDw7AOCQrtW+Zop3cbZIvtT3/g3QDXdfmpbF7kcwwtVEx49rXlmavQOAXmeTis
	RUaifjKv+AukIWbORPzePQoledN9gepfE387zg855JSCAx/+HEkYe3MM4pcfu6W/WspgqOBIiCAuJ
	uVUvPTUAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMS7C-002oy7-Gc; Wed, 17 Mar 2021 09:05:19 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMS76-002own-HE
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 09:05:16 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12H958gd031480;
 Wed, 17 Mar 2021 04:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615971908;
 bh=CFJ2+PiQFeamPdSmnwEFhov7N4y6g4MKwY4Bys1qRy8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=d0Xw+e0yE60NtlZf2yx0zPj25LqHxiIJyGRMVezXFVQti0sx4ED/kAwdGPCE8aD+t
 qnMx4FwJCaKRcoq+5qpdei8DqHEJ4eAhamnShFX/l8bGegcBwx2iedqQrTHMwRS9y2
 lqBRPRYXwTZoBlqBNokZ0HRfChHCQpz1nuGXuJcg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12H9589H118204
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Mar 2021 04:05:08 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 17
 Mar 2021 04:05:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 17 Mar 2021 04:05:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12H957XS105253;
 Wed, 17 Mar 2021 04:05:08 -0500
Date: Wed, 17 Mar 2021 14:35:06 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <vigneshr@ti.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection
 logic out of the core
Message-ID: <20210317090504.ra3vm76xexhaqg2l@ti.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
 <963232a4-9100-ebca-927c-7f5a1e947fbe@ti.com>
 <9889bae0-8eba-7cbc-d9bb-04e038bd28c8@microchip.com>
 <6016b725-a779-1d2c-9884-099c58f53557@ti.com>
 <45d00a12-cb79-774e-f8e8-d65602629a90@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45d00a12-cb79-774e-f8e8-d65602629a90@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_090514_384490_DDDB3541 
X-CRM114-Status: GOOD (  18.71  )
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

On 17/03/21 06:09AM, Tudor.Ambarus@microchip.com wrote:
> On 3/15/21 8:23 AM, Vignesh Raghavendra wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 3/9/21 12:58 PM, Tudor.Ambarus@microchip.com wrote:
> >> On 3/8/21 7:28 PM, Vignesh Raghavendra wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> On 3/6/21 3:20 PM, Tudor Ambarus wrote:
> >>>> It makes the core file a bit smaller and provides better separation
> >>>> between the Software Write Protection features and the core logic.
> >>>> All the next generic software write protection features (e.g. Individual
> >>>> Block Protection) will reside in swp.c.
> >>>>
> >>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>>> ---
> >>>>  drivers/mtd/spi-nor/Makefile |   2 +-
> >>>>  drivers/mtd/spi-nor/core.c   | 407 +---------------------------------
> >>>>  drivers/mtd/spi-nor/core.h   |   4 +
> >>>>  drivers/mtd/spi-nor/swp.c    | 419 +++++++++++++++++++++++++++++++++++
> >>>
> >>> Hmmm, name swp.c does not seem intuitive to me. How about expanding it a
> >>> bit:
> >>>
> >>> soft-wr-protect.c or software-write-protect.c ?
> 
> Having in mind that we have the SWP configs, I think I prefer swp.c.
> But let's see what majority thinks, we'll do as majority prefers.
> Michael, Pratyush?

I don't have much of an opinion on this tbh. But I usually prefer short 
names so I'd go with swp.c here. Maybe also add a comment at the top of 
the file mentioning the full name "Software Write Protection logic" or 
something similar for clarification.

> 
> >>>
> >>
> 
> cut
> 
> > 
> > I am not a fan of renaming Kconfig options as it breaks make
> > olddefconfig flow which many developers rely on.
> > 
> 
> I'm fine keeping them as they are for now. If someone else screams we will
> reconsider.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
