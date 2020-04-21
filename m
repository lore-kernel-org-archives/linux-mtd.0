Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020C7C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 09:35:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9C47206E9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 09:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z/0ah89K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kn5JrMwu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9C47206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXeuuL/MsbC+Ib8ZrwhpDIZOblhpfUyLELPsw7x5Z68=; b=Z/0ah89KKyHkeS
	Gezmb1d885VVs5AOTcZFZse6Kp26gbDMGKVQVOabAziJL+w9n2+gwfrDSoYZWMYS4P6H8wXFr581z
	9uOkjHTkiIWqDBG3TbiS4RykzEkjSmY5qhCrTRxRdUKGcViBxmgnYl1hypKjg7NrL50MoiFUNHPAy
	+25rPKLwL+BeGyx2m+QvdHW46RtNtU1XrrEwU8rTdrUId8kZQDVVvf2AFTVl8/Iu7ZKQssDvV6QRD
	OTpnjdH8WkLtHjLDZ4JQlUKOQviYN2gTJ9WOjtx2SDcXDwrEjKfGPZzgXofLrS4DGX8C/kOMGpi0+
	DshcroHONZfq+lG4Jbjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQpJR-0001yj-U8; Tue, 21 Apr 2020 09:35:29 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQpJP-0001yO-DX
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 09:35:29 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03L9ZEPN092019;
 Tue, 21 Apr 2020 04:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587461714;
 bh=EeE21hMUOfk3pC387RpavuP6TsxGuhOnVMwPs3H4nSk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kn5JrMwuqadtuMZU6zKFo3/VxCueg+wAfvntp8l6BnvP9ar/ktulDIftrzkIkqRqV
 gIbAhBJyXPaW0lUfjTB40Ix8pZSp3Bal/Alm632UcAe5MjIEMoR8eR5JA1gjitddGH
 OYYDaJLcYt9FTvM/143EFgw3l29320GK002ShqRM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03L9ZEsK034008;
 Tue, 21 Apr 2020 04:35:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 04:35:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 04:35:14 -0500
Received: from [10.250.234.195] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03L9Z9Qf105015;
 Tue, 21 Apr 2020 04:35:10 -0500
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
To: Boris Brezillon <boris.brezillon@collabora.com>, Mason Yang
 <masonccyang@mxic.com.tw>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
 <20200421092328.129308f6@collabora.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <56365995-fe30-534f-9dbc-7307d9b9f846@ti.com>
Date: Tue, 21 Apr 2020 15:05:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421092328.129308f6@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_023527_587009_A10CD899 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: tudor.ambarus@microchip.com, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 21/04/20 12:53 pm, Boris Brezillon wrote:
> +Pratyush who's working on a similar patchet [1].
> 
> Hello Mason,
> 
> On Tue, 21 Apr 2020 14:39:42 +0800
> Mason Yang <masonccyang@mxic.com.tw> wrote:
> 
>> Hello,
>>
>> This is repost of patchset from Boris Brezillon's
>> [RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].
> 
> I only quickly went through the patches you sent and saying it's a
> repost of the RFC is a bit of a lie. You completely ignored the state
> tracking I was trying to do to avoid leaving the flash in 8D mode when
> suspending/resetting the board, and I think that part is crucial. If I
> remember correctly, we already had this discussion so I must say I'm a
> bit disappointed.
> 
> Can you sync with Pratyush? I think his series [1] is better in that it
> tries to restore the flash in single-SPI mode before suspend (it's
> missing the shutdown case, but that can be easily added I think). Of
> course that'd be even better to have proper state tracking at the SPI
> NOR level.
> 

[1] does soft reset on shutdown which should put it to reset default
state of 1S-1S-1S mode (if thats the POR default)

But, there is still one open question now that we are considering
supporting stateful modes:

What to do with flashes that power up in 8D mode either due to factory
defaults or if 8D mode NV bit is set? Do we say SPI NOR framework won't
support such flashes?
Auto discovery of such flashes is quite difficult as different flashes
use different protocols for RDID cmd in 8D mode (address phase may or
may not be present, dummy cycles vary etc) is almost impossible w/o any
hint passed to the driver?


> Regards,
> 
> Boris
> 
> [1]https://lkml.org/lkml/2020/3/13/659
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
