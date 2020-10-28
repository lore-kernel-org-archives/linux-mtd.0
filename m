Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5D0C388F7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 12:50:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77ACE24734
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 12:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EuGeM4vP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fWtuOUuq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77ACE24734
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y9QMvjNmCB9+GFR+h6UJx3i937yrauEAFY6ju7K50Us=; b=EuGeM4vP3Pa9tlE/tE+h3dOPj
	J5FS6GrAw1WpZaoGnvQWzIDca1PjkE30H9NjOP0J2yZj3a9v+euQ1kdJpyPacimDhW/wwQV6Ok3dn
	FmdsXi4WehT420Umut5INdwJ1K5sDK3qjMF8U9kxDaOsPBBBT+eVUNmPzy6Qy/XB1U0f4z6rY4HU6
	QECYPnPpcxoUeVf69wiHFx8Xs+zT/Sd1+HF+qSVE/rh9ri4zfz+I7xSX7MxRA7rybjLjXpk7D2bnF
	NFIGm0CjqSbtAdCTB1uBU53EQQ1pljX2Q8cXECKc0KQ67PNGYQW/KabC0JZYrtLbVj+vUX8BogjqB
	GxNRoOo5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXktS-0004s8-GS; Wed, 28 Oct 2020 12:49:34 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXktO-0004rN-QZ
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 12:49:32 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SCnNwE082440;
 Wed, 28 Oct 2020 07:49:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603889363;
 bh=cVYMUJFuKCZV0NDQtaS9JCEpzTQEwMkt4PYY9fuDFRo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fWtuOUuqdOANXVb4TvpriU3jMR8ufU8Ym/e54voTOee91+91+pBzuMV6AykJI1xLA
 iMu+bg46UVxaYzP5QHlTp0430fm+KWEg5Kc2ZaPA9KJgHGNBhZjXc3RhrAzZ6Hlmdl
 ajwCoYqSkTLRFBNWFit4RiDiu3nnUHOoeM010mGY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SCnNx4064380
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Oct 2020 07:49:23 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 07:49:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 07:49:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SCnMpu034022;
 Wed, 28 Oct 2020 07:49:23 -0500
Date: Wed, 28 Oct 2020 18:19:22 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v16 00/15] mtd: spi-nor: add xSPI Octal DTR support
Message-ID: <20201028124920.pot77v4phkqiswhr@ti.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
 <d0d702c1-761b-1480-c74d-135193b33c26@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0d702c1-761b-1480-c74d-135193b33c26@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_084931_023791_9448DCA4 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Tudor,

On 28/10/20 07:53AM, Tudor.Ambarus@microchip.com wrote:
> Hi, Pratyush,
> 
> On 10/5/20 6:31 PM, Pratyush Yadav wrote:
> > Tested on Micron MT35X and S28HS flashes for Octal DTR. 
> 
> Do these flashes define the "Command Sequences to Change to
> Octal DDR (8D-8D-8D) mode" table? Can't we use that table
> instead of defining our own octal dtr enable functions?

The Micron flash does not have this table. The Cypress flash does. The 
problem is that one of the samples of the Cypress flash I tested on had 
incorrect data in that table which meant the sequence would fail. The 
newer samples of the flash have the correct data.

I don't know how many of those faulty flashes are out there in the wild. 
IMO, to be on the safe side spi_nor_cypress_octal_dtr_enable() needs to 
be implemented. So from the point of view of this series there is no 
need to parse the Octal DDR enable table.
 
> I see that Mason used this table for a macronix flash:
> https://patchwork.ozlabs.org/project/linux-mtd/patch/1590737775-4798-4-git-send-email-masonccyang@mxic.com.tw/
> https://patchwork.ozlabs.org/project/linux-mtd/patch/1590737775-4798-8-git-send-email-masonccyang@mxic.com.tw/
> 
> Cheers,
> ta

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
