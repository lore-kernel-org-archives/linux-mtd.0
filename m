Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC82C4727F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 09:25:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D622520754
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 09:25:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LmOSp2rj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ym157Fcq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D622520754
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W4Pkhi5pFMNSIpMrcATBSO4hj2KczpgDxomdLPzki0A=; b=LmOSp2rjjKQIbCzuELO2ymaVf
	83eb4ArH/4YmAOtKgIhUCj4ndozu7gOJ8Ae0zIl0UIqggO/boWnuqACHkP0Y+IAJ7NSTB+mqo//Rq
	l9Nqa0M+V8TXX8ho7JXrI7B6E9/hXTujDLR17xJe4mpyO33tc6rRa7peOhV6luNG/QrT+APFjdVdt
	Kha5aHw/SOowDB0OobV+ZGGvQflofS53VXZtjxwzvisJdOSMuWMt719Q0zziiVEIWuu0CC0oanTUH
	S8JwOoiwHYrCRJCmEb6Q00NlUpMJxVGGGvUsxxrU1ZPrjqfe/YdOcY6EggPtd9iN7+t+5+Ai6h0hE
	+1iNg6D4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNYL6-00033T-NZ; Wed, 30 Sep 2020 09:23:57 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNYHZ-0001YY-JM
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 09:20:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U9KFQZ036969;
 Wed, 30 Sep 2020 04:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601457615;
 bh=KjQI0q/X3CQA+SID/iPdGho7blBrhggLc2qPiTDB8OU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Ym157FcqdT15Etyk5rUOoI/muQYSVb0m3AfN4/AYSk45yzDIdUHKMA9pU6cdehxNa
 Yd8ZguXLZeStj9eRdmNB4671W5dFYumSedMMQ695ZuM67DL2uddyziV6g8tfeFQZqY
 4RJm/UAf/EORjJBdH0T4e/xM2ema1MWJV+6s4srY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U9KFkW108162
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 04:20:15 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 04:20:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 04:20:15 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U9KDVl053420;
 Wed, 30 Sep 2020 04:20:14 -0500
Subject: Re: [PATCH v2] mtd: spi-nor: Do not proceed with spi_nor_sr_unlock if
 WP
To: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>,
 <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>
References: <25c209e2-f48e-f4aa-4043-1f259e26a7f1@nokia.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <182366fd-dc09-7433-c38c-8ff5bbf31c35@ti.com>
Date: Wed, 30 Sep 2020 14:50:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <25c209e2-f48e-f4aa-4043-1f259e26a7f1@nokia.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_052018_026596_39DB939B 
X-CRM114-Status: GOOD (  22.61  )
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
Cc: "Sverdlin, Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/17/20 1:01 PM, Matija Glavinic Pecotic wrote:
> In case Status register 1:SR_SRWD was set (either by software or write
> protect pin), sr_unlock fails on spi_nor_write_sr_and_check in 8-bit
> mode due to fact that written value will not match read value.
> 
> Problem was observed with n25q128a11 device having protection enabled
> by W# pin. Failures lead to device probe failure.
> 
> Problem was uncovered by 82de6a6fb67e16 ("mtd: spi-nor: Fix the writing
> of the Status Register on micron flashes"). Commit selected 8-bit mode
> for micron devices. In 16-bit mode, CR content is verified, while in
> 8-bit SR is checked for sanity.
> 
> Signed-off-by: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
> ---
> v2: Fix whitespaces added by mail client
> 
>  drivers/mtd/spi-nor/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65eff4c..4c3acc0 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1777,6 +1777,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  
>  	status_old = nor->bouncebuf[0];
>  
> +	/* If SR is write protected, we cannot unlock */
> +	if (status_old & SR_SRWD)
> +		return 0;
> +

With this, MEMUNLOCK ioctl would succeed with no errors but would fail
to modify lock bits when  SR_SRWD is set. This would give user a wrong
impression that region has been unlocked as there is no error code
that's being returned (thus breaks ABI).

Also, how would one unlock the flash once SR_SRWD is set? For example:

(1) hardware WP# is deasserted
(2) program flash
(3) Set block protection bits and SR_SRWD
(4) hardware WP# is asserted
(5) flash protection range can no longer be changed, until WP# is
    deasserted

Now to make flash writeable again:

(1) hardware WP# is deasserted
(2) Unlock the protection flash bits and SR_SRWD

But (2) would always fail due to above check, right?


Alternatively, spi_nor_init() can be modified to be non fatal when
spi_nor_unlock_all() returns non zero value (but retain the dev_dbg()).
Also add a comment inline.

>  	/* If nothing in our range is locked, we don't need to do anything */
>  	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
>  		return 0;
> 

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
