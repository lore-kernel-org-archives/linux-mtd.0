Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB3AC4741F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 12:55:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D118520679
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 12:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wVhWQxkQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WKuwA7ws"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D118520679
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ensnU7kqkTUiPKr89OHR9zdLcJwuD2sP96EScyZrC0=; b=wVhWQxkQF3Nor0nuyatFRVR4a
	Av3LT7hcI5m+19Wlk1h9s6mqAH3/DhvOyVFdLDx6nkFvXWWIo6krd7IO4EaEJ700ru4Utz45zVMv5
	yj5ZtnLcde7wO8iyX7VNnachdXe4WnnZ/A9Ipwr3TSblAHL9xstT3A1Ga7UyzU1L21S29Y+Gh+sM4
	Xol6cRZH7Ky1wMh+MQ/G874nGbZEWVPnV9pgOu9SPZCQ3yYOVB18HxiaX7/molXXz4kV7vu3Y6b6D
	FMFPBICigUvOf/qaF6H8l7SUYLRET59JtnluhsiQcc0g8Kq0nqizxsE50osLhDzSRF9R9CWOWzyw8
	pYduj2cWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNF9g-0001pW-Lf; Tue, 29 Sep 2020 12:54:52 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNF9e-0001ox-KF
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 12:54:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08TCse9R110421;
 Tue, 29 Sep 2020 07:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601384080;
 bh=RSyzf4BzQ5d5cDLo5NJTHQRueZGxJivPH++jRF/7jUg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=WKuwA7wsXF2jpnDr3rV9y9iCJMCjoIIkvKD4vjx9HkBUuLf/DlSTUuNQiXDK/1tJx
 L6PLsODR3S4KP5OM8+ASr/9SoIDO9SKvYY/gfKg9r99HYB4PCzDMiqvMxuk1XEoXSX
 qUTCAfBx3S/Pq5ln+qWGO7zGTF83oFVBcv7ayWHo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08TCseQ6081898
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Sep 2020 07:54:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 29
 Sep 2020 07:54:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 29 Sep 2020 07:54:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08TCsdbw103191;
 Tue, 29 Sep 2020 07:54:39 -0500
Date: Tue, 29 Sep 2020 18:24:38 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v13 02/15] mtd: spi-nor: core: add
 spi_nor_{read,write}_reg() helpers
Message-ID: <20200929125436.pxu4omgxajbn6tfj@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-3-p.yadav@ti.com>
 <8632e742-9526-fd80-8980-2792075f194c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8632e742-9526-fd80-8980-2792075f194c@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_085450_718627_FE6E9D82 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29/09/20 11:38AM, Tudor.Ambarus@microchip.com wrote:
> On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> > They are thin wrappers around nor->controller_ops->{read,write}_reg().
> > In a future commit DTR support will be added. These ops can not be
> > supported by the {read,write}_reg() hooks and these helpers will make it
> > easier to reject those calls.
> 
> 2/15 and 3/15 are introducing wrappers for the controller ops. How about
> squashing the commits and using the same naming scheme?
> 
> spi_nor_controller_ops_{read_reg,write_reg,erase}

Ok. Will do. For my information, the patches will still go in this merge 
window, right?

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
