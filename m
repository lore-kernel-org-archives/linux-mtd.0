Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CCBC433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 11:21:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F2D820674
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 11:21:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p7Bu5dmC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qUsk6a2X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F2D820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i7EeHBoOqtoSycxNjl52ipFDPpBQOU+8twfTe2fJBV4=; b=p7Bu5dmC9Xj0oOs6rM1tMznOV
	p2Drll3lGwZaIuKCtDroCfxvUSMYu0K7MROsnjf6PHlaKOAVWi+uNNCq10dnNrAdo5wkxapuswd5Y
	IGAAlCndcetYIWYwj1CYjq4l8sx4MMOmldTbuS67XivIWt31vXM96hpWbGokJcz5PEop2biOiYTBb
	dfojsJLTHJH8itO2T+k12buWcmiMFyJkeSIEUsL7KlCJ5vGhzl0tUsz38M3TpXIOM9HNtpnPAcdOV
	p4NVvJZDLSc4WaZ3M/R8MDfAFuXo8hkScHkx5BIUAPzTTQ585U8OLwTC+xwDt00fRbec+dABhKFJY
	ljvjdiwpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrJjP-0004ls-Kd; Fri, 03 Jul 2020 11:19:47 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrJjJ-0004l2-CW
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 11:19:42 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 063BJQhh049547;
 Fri, 3 Jul 2020 06:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593775166;
 bh=cSAR5kJ3rKr7UE9rtJGfa3hEQjiXTEBzdVBVazDPsaM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=qUsk6a2XbJ5sZ8DgaoYR5xHWbWKXsjm5NMuAcX7K+DJ4ZDSSsI4Wjf0ZzDN42RLiQ
 mCtc9U6HmeB32lhNnAJ4lY6ZEBFo5bJxLSJXiA0lbYzFpostHeNXfqflpI7th3TiOi
 G0MVjnsx8/zEy5bzJBXpfEEc2tURYoG0ws4jFDUI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063BJQJL010080;
 Fri, 3 Jul 2020 06:19:26 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 3 Jul
 2020 06:19:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 3 Jul 2020 06:19:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063BJPDQ090174;
 Fri, 3 Jul 2020 06:19:25 -0500
Date: Fri, 3 Jul 2020 16:49:24 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
Message-ID: <20200703111924.tyrvzbbgd7ak53qf@ti.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <193b32f7-f56d-4f78-5353-b5d47cbf71d6@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <193b32f7-f56d-4f78-5353-b5d47cbf71d6@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_071941_535647_2F674152 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 me@yadavpratyush.com, john.garry@huawei.com, linuxarm@huawei.com,
 yangyicong@hisilicon.com, alexander.sverdlin@nokia.com,
 miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/07/20 11:02AM, Tudor.Ambarus@microchip.com wrote:
> On 6/16/20 4:02 PM, Yicong Yang wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > If the flash's quad mode is enabled, it'll remain in the quad mode when
> > it's removed. If we drive the flash next time in SPI/Dual mode, then
> > problem occurs as the flash's quad enable bit is not cleared.
> 
> Please describe the problems that occur. When QE bit is one the flash
> operates in Standard/Dual/Quad SPI modes. WP# and RESET#/HOLD# are
> affected as they change their functionality to IO2 and IO3 when QE
> is 1. Is there anything else?

IIUC if we do anything that introduces a state on the flash, we want to 
clear that state up on restore. That's what we (will) do for 8D mode and 
for 4-byte addressing mode. Does that not apply here?

> While I find the intention good, there might be some problems here:
> 1/ w25q jvm variants come with QE "fixed" to 1. This probably means
> that QE is not writable, and a writing of QE to zero will be ignored,
> but we have to check.

In that case they shouldn't have a quad_enable() hook, no?

> 2/S25FS128S: CR1NV[1] can set the default power-on state for the
> CR1V[1] to 1, i.e. QE to be set to 1 at power-on by default. The
> logic here complicates a bit, and maybe we'll have to amend the
> patch.
> 
> > 
> > Disable the quad mode in spi_nor_restore(), the flash will leave
> > quad mode when remove. This will make sure the flash always enter the
> > correct mode when loaded.
> s/correct/ Standard/Dual SPI
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
