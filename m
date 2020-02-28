Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45132C3F2D0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 09:37:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 189E624672
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 09:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QYEdwlat";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rgJKb74y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 189E624672
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ak37vPkrov0nPsKM1czGRxM1tW0XQMBQUzlj6elaqHY=; b=QYEdwlatls3Jcn
	K2USfIazgumFZXwbmSVu8TmlE1rc2Z6wDL6wfZ0csBR2kkIPMjKCsjWduTAc/AvyOT5/LQzlpoRex
	B8KIvUGkTXVr0M6l9EchJG7tb4eyOHf2sdwBXL6HNpeoKRSNq7ILhy9dxiZ610XSBCisN7qT57PlB
	M9cbCXvbf/+QkYqq0UEp3hXD/HMOHhn6YgXnVXsgbuoAXzuQ4bsaTjhM4orqGpGqJYq2cs/ZMynSg
	PpgpDqJCWfu+GOkDkZx6Jtijgrng08usqI9M6nSAzjQRVPkspM6jE40MR2s0ACGarkCxoaVDQ7z5a
	zHrIB6A6TduGTE/V+vUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7c5B-0000jR-0s; Fri, 28 Feb 2020 09:37:21 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7c57-0000hu-Rn
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 09:37:19 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01S9b0LZ113746;
 Fri, 28 Feb 2020 03:37:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582882620;
 bh=SPh+Agdmc6y0lmp3JNluat2ukjO6mzKkaFasmlrPdpQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=rgJKb74ynq2dLwtsfSpxdsXdaOGvSe9L4xmdd+a3NkHX485BrLUxJvn69jE1xHkOc
 YHl5UH2KhSNFs89dzWm+9i7e1QcOuht2RIfDAElrWfIpjkVw+kUuJdlIr/wSNWk5se
 ZnIWaUcEQSDzIaxoW/Gbir8lcxFJ+dLVRnohg/I0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01S9b0d4120325
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Feb 2020 03:37:00 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 03:36:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 03:37:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01S9axce104882;
 Fri, 28 Feb 2020 03:36:59 -0600
Date: Fri, 28 Feb 2020 15:06:58 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 06/11] mtd: spi-nor: add support for DTR protocol
Message-ID: <20200228093658.zc3uifqg4zruokq3@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-7-p.yadav@ti.com>
 <20200227175841.51435e3f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227175841.51435e3f@collabora.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_013718_012914_D89FFD12 
X-CRM114-Status: GOOD (  25.83  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 27/02/20 05:58PM, Boris Brezillon wrote:
> On Wed, 26 Feb 2020 15:06:58 +0530
> Pratyush Yadav <p.yadav@ti.com> wrote:
> 
> > Double Transfer Rate (DTR) is SPI protocol in which data is transferred
> > on each clock edge as opposed to on each clock cycle. Make
> > framework-level changes to allow supporting flashes in DTR mode.
> > 
> > Right now, mixed DTR modes are not supported. So, for example a mode
> > like 4S-4D-4D will not work. All phases need to be either DTR or STR.
> 
> Didn't go deep into the patch but at first glance you don't seem to
> extend the framework to support stateful modes as I tried to do here
> [1]. That's really something we should address before considering
> supporting xD-xD-xD modes, unless the SPI-NOR only supports one
> stateful mode. If we don't do that first, we might face all sort of
> unpleasant issues:
> 
> * kexec not working correctly because the previous kernel left the NOR
>   in an unknown state
> * suspend/resume not working properly
> * linux not booting properly because the bootloader left the device in
>   its non-default mode
> * ...

Correct. I am working on a follow-up series that takes care of these 
problems. The series will allow spi-nor to detect what mode the flash is 
in and then run the SFPD procedure in that mode (or maybe switch to 
single SPI mode and then go about its business as usual? I haven't 
figured out all the details yet).

So for the context of this series, assume we are handed the flash in 
single SPI mode.
 
> [1]https://patchwork.kernel.org/cover/10638055/

BTW, I took a quick look at this series but I don't see any code that 
tries to detect which mode the flash is in (which is the troublesome 
part [0]). So, for example, if the bootloader leaves the flash in 
8D-8D-8D mode, how would your series handle that situation?

[0] There are multiple problems to take care of when trying to detect 
    which mode a flash is in. We can try reading SFDP in each mode and 
    whichever mode gives us the correct "SFDP" signature is the mode the 
    flash is in. But the problem is that even in xSPI standard Read SFDP 
    command is optional in 8D-8D-8D mode, let alone non-xSPI flashes. 
    Another problem is that the address bytes and dummy cycles for Read 
    SFDP are not the same for every flash. The xSPI standard says 
    address bytes can be 3/4 and dummy cycles can be 8/20. So, for 
    example, Cypress s28hs/s28ht family and Micron Xccela (mt35x) family 
    use 4 address bytes, but the Adesto ATXP032/ATXP032R flashes use 3 
    address bytes.

    Say that a flash supports Read SFDP in 8D-8D-8D mode and we try all 
    the combinations to find out which mode the flash is in, we now have 
    the problem of actually identifying the flash. Unfortunately, the 
    Read ID command is not uniform across flash vendors. The Micron 
    Xccela flashes use 8 dummy cycles and no address bytes for Read ID. 
    The Cypress s28hs/t family uses configurable dummy cycles 
    (defaulting to 3) and needs 4 dummy address bytes all of which are 
    0.

    If we can't find out which flash it is, we can't run its fixup 
    hooks, and might end up running it with incorrect settings. And all 
    this is assuming a flash even has SFDP and has it available in all 
    modes.

    So, the only solution I can now think of is having the flash name in 
    its compatible string in the device tree. This way we can skip all 
    the Read ID ugliness and can have flash-specific hooks to make it 
    easier to detect the mode it is in (though I wonder if it is even 
    possible to detect the mode in a flash that doesn't have SFDP in 
    8D-8D-8D).

    Thoughts? Is there a better way to solve this problem that I didn't 
    think of?

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
