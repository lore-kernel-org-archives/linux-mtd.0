Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FC0C433E6
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 09:49:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE702083B
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 09:49:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t/dDjNsf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hRMGc087"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE702083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QvN6aeK6yx1gzsD8p3xvvL5tEHOs61pXt/AO8m79zM4=; b=t/dDjNsf4UOqTx3llJMWe3xYT
	XbeSCYdqSILnC4SQBBhWjLfFYvR19HvzA2pf/e8/7YgBbgawEOAXFJ9MZbp7F6oaa4/iHtq0mOmwV
	JIcdj0vG2pvrOyl0EQ603gFeI1EsdPFOYMCSAghe/KrVKo48cSTqUoupiuwIoeY2JsgQ033w92sj5
	XyMobEe7EXbwiaSv1iJZcl8uYjWSmCZ53P29JOBNqUYUjrGjExusY0bZ19fi+BX1g9CflZlEox4Mc
	oLVx6F+ppKPs16tDPK5M3q54svl/THgf9fv4wdoAIyz9OwGjLLLMcH7Blko+tR/qL8SUVlJ0/TR0C
	ob4/kgrpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD2u8-0000vZ-09; Tue, 01 Sep 2020 09:48:40 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD2u5-0000uc-2V
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2020 09:48:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0819mKfJ119867;
 Tue, 1 Sep 2020 04:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598953700;
 bh=QYVnD73wgq1neYN0XgZk1kFwFxidUSPSYIgySI8/Fk4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=hRMGc087jXGxDPlj0/ainyNHroLSxZMmH7sfWAsiL1Lx+TTdtioMag9Fij8z+lBZ6
 7evSWfR+76VIQmY2aigb9CoEmrXo/zZgEgtNDJXa41oSkjbgINyKxIsHrZ9D5B8Kcs
 uaM5K7iauc3fEt0InzxxIMB2EItUrNqMbHxlEmC0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0819mKUs103934
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Sep 2020 04:48:20 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Sep
 2020 04:48:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Sep 2020 04:48:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0819mJWb094322;
 Tue, 1 Sep 2020 04:48:19 -0500
Date: Tue, 1 Sep 2020 15:18:18 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Matthias =?iso-8859-1?Q?Wei=DFer?= <m.weisser.m@gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
Message-ID: <20200901094816.ddw2do2ryjvqvasq@ti.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_054837_253477_2130CDDF 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, me@yadavpratyush.com,
 john.garry@huawei.com, linuxarm@huawei.com,
 Yicong Yang <yangyicong@hisilicon.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 01/09/20 08:16AM, Matthias Wei=DFer wrote:
> Am Di., 16. Juni 2020 um 15:03 Uhr schrieb Yicong Yang
> <yangyicong@hisilicon.com>:
> > If the flash's quad mode is enabled, it'll remain in the quad mode when
> > it's removed. If we drive the flash next time in SPI/Dual mode, then
> > problem occurs as the flash's quad enable bit is not cleared.
> =

> On flash devices with a non-volatile quad enable bit (we use S25FL512S)
> this will wear out the quad enable bit as on every boot the bit is
> set and reset on shutdown. Or do I miss something here?

Yes, I think it will. If you always want the bit enabled (and it being =

non-volatile suggests that is the intended use), why not set =

nor->params->quad_enable() to NULL? That way it won't be touched at all, =

neither on boot nor on shutdown.
 =

> > Disable the quad mode in spi_nor_restore(), the flash will leave
> > quad mode when remove. This will make sure the flash always enter the
> > correct mode when loaded.
> =

> We have a system which relies on an enabled quad mode on boot
> (bootloader uses quad mode without enabling it) so using this patch
> will prevent our device from booting.

Out of curiosity, how does the flash get detected by SPI NOR? It issues =

the Read ID command in 1S-1S-1S mode but the flash is expecting 1S-4S-4S =

commands. Do you have any extra patches applied to make it work?
 =

I tried solving this problem for 8D-8D-8D mode but never really found a =

good solution.

-- =

Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
