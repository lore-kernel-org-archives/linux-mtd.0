Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F23C54E4B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 09:44:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 448AC207DD
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 09:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fngPSby1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hmgf4bF3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 448AC207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mVL5n8SPuVy6vSPLpg9Ex3xOl69WMEltTLo0oW8W18=; b=fngPSby1MfFzCA
	Aza5SMnOYeqKbovx5VZgPNupStKroV+MPxY14HlVcfnSMUkPRT/f8gNpUAmsjRVcpYez4CJmrsEQU
	69IWH1m0QAz2AG6ChKkGunliMNGsRSUdBVy6D06RW5FKHZ1OqdFk3M7N4o6cmbk97EI9ulpO4HS33
	yjobecNK0Ld0mzE9G8SDvF0xhL83uhp/kdWpQDpDwfX4AmjH/L4OItuNo2DmhI0ztH8ztDAAWzX2C
	AEs6pbk24h6DtgVeB2gm2IktMx7jXjx71Pe75sFs40zLeUs5jWUz0mjYFuB+QjXXdYHPdGZHD6NXr
	7wpDR0zMxN55dO61oW7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY4yy-00041i-M3; Mon, 11 May 2020 09:44:20 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY4yv-00041A-Kv; Mon, 11 May 2020 09:44:19 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04B9i1TG078513;
 Mon, 11 May 2020 04:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589190241;
 bh=byFyzQdwQhDM3dT5bOyJ2WghB41M52QlHFMI+0b6a0I=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hmgf4bF3g5JuARgRipO90N1PvW0GwD8QNTHDuyyXUDlNeHfIhIWTM5Yg3hUr2a3L1
 q07eUpscFLogOsbMvNc/eJXct8Ojitroy8pSAuFjzbUwA2g0KKj4kXlvl2/dZwwf+j
 py8opZGiTzJ3Y7mEwFYKPcp8TOWIcmLU3/N1OCRI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04B9i1AJ059978
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 May 2020 04:44:01 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 11
 May 2020 04:44:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 11 May 2020 04:44:01 -0500
Received: from [10.250.234.195] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04B9htxe073284;
 Mon, 11 May 2020 04:43:56 -0500
Subject: Re: [PATCH v4 00/16] mtd: spi-nor: add xSPI Octal DTR support
To: <Tudor.Ambarus@microchip.com>, <p.yadav@ti.com>,
 <boris.brezillon@collabora.com>
References: <20200424184410.8578-1-p.yadav@ti.com>
 <3649933.zuh8VGJVCz@192.168.0.120>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <7462190d-7459-7756-a32e-fb08e18d2ee2@ti.com>
Date: Mon, 11 May 2020 15:13:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3649933.zuh8VGJVCz@192.168.0.120>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_024417_806996_6973F0C5 
X-CRM114-Status: GOOD (  20.24  )
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
Cc: alexandre.belloni@bootlin.com, richard@nod.at, nsekhar@ti.com,
 Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org,
 Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/05/20 2:30 pm, Tudor.Ambarus@microchip.com wrote:
> Hi, Pratyush, Boris,
> 
> On Friday, April 24, 2020 9:43:54 PM EEST Pratyush Yadav wrote:
>> This series adds support for octal DTR flashes in the spi-nor framework,
> 
> I'm still learning about this, but I can give you my 2 cents as of now, to 
> open the discussion. Enabling 2-2-2, 4-4-4, and 8-8-8 modes is dangerous 
> because the flash may not recover from unexpected resets. 

Unfortunately, xSPI compliant flashes need to support 1S-1S-1S and
8D-8D-8D (or 4S-4D-4D) mode only. So we have to start supporting
state-full modes

> Entering one of these modes can be:
> 1/ volatile selectable, the device return to the 1-1-1 protocol after the next 
> power-on. I guess this is conditioned by the optional RESET pin, but I'll have 
> to check. Also the flash can return to the 1-1-1 mode using the software reset 
> or through writing to its Configuration Register, without power-on or power-
> off.

Right, I guess switching to octal mode be made conditional based upon
SNOR_F_BROKEN_RESET?

> 2/ non-volatile selectable in which RESET# and software reset are useless, the 
> flash defaults to the mode selected in the non volatile Configuration Register 
> bits. The only way to get back to 1-1-1 is to write to the Configuration 
> Register.
> 

In addition to reset issue, supporting flash that boot up in Octal DDR
mode (due to non-volatile setting) is still pretty difficult. Commands
like Read ID and READ SFDP (that are used for flash discovery at
runtime) follow different protocols across different vendors in Octal
DDR mode. So its almost impossible to support such flashes w/o a hint
about device type from DT (or somewhere else).
I would really stick to option 1 for now until someone makes a
compelling case to support option 2.


> Not recovering from unexpected resets is unacceptable. One should always 
> prefer option 1/ and condition the entering in 2-2-2, 4-4-4 and 8-8-8 with the 
> presence of the optional RESET pin.
> 
> For the unfortunate flashes that support just option 2/, we should not enter 
> these modes on our own, just by discovering the capabilities from the SFDP 
> tables or by the flags in the flash_info struct. The best we can do for them 
> is to move the responsibility to the user. Maybe to add a Kconfig option that 
> is disabled by default with which we condition the entering in 2-2-2, 4-4-4 or 
> 8-8-8 modes. Once entered in one of these modes, if an unexpected reset comes, 
> you most likely are doomed, because early stage bootloaders may not work in 
> these modes and you'll not be able to boot the board. Assuming that one uses 
> other environment to boot the board, we should at least make sure that the 
> flash works in linux after an unexpected reset. We should try to determine in 
> which mode we are at init, so maybe an extension of the default_init hook is 
> needed. But all this looks like a BIG compromise, I'm not yet sure if we 
> should adress 2/. Thoughts?
> 


Agree, lets not worry about option 2 for now...

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
