Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD32DC47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 14:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72596613CA
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 14:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72596613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kHGY3cO0U18DcFmBfqwxyssDZm2SUUL/tsO8+3A3IXo=; b=VX/RI0CvY5FK86DdTHq156UUIN
	u4poBYxlNoiBXWQo/oO55gTIMJKfsbFOBxsWqKV5g8IvGhy0yOeX6Ls95UMBjehTqrzBkJGP/f+Ev
	0sGoQRlge7vhoulK1kDvjp79Gd9ngOuH7BKuMPlx8X2Sb6UhIUNX9krn0md2daIHl7vg5Ze2yW7hY
	3vGPZDtRMUO9K3kwgg8dxmO2Ywjf7qaXFfJFo4Mhb+9x/SvAnin7k1rl7OfON40+MtwJxiLGNhgKJ
	hT5tOwixGiUKwY4S7KUNv47nI7ObsU4GhBxjyzXT3qnYA/VaeeCvSbtVODcDe5cNkTayPmZ7uSyw7
	uItx8S7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmGdP-006ZIT-Nk; Thu, 27 May 2021 14:05:16 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmGR1-006S4T-9w
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 13:52:30 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RDqMJ5090178;
 Thu, 27 May 2021 08:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622123542;
 bh=XTZmP9tEveqM8Auq+PNXMuEcTQxDTgVtmt0dNu3wGBc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=CputvJPEvDuAuhaIuhYdBlnRuBiNQWbxki8bHDZU+99KiXwYmXhgJ3MKMCn0xOiAN
 K1FceqvxwWRXFYeOvZh2s6i174TiJv/GMwiR8zEM3nriwtSMklQGCkFbzNlF/snwEi
 GiQm2rPpVIeDvH3DQgj7Hq8tawWN8CD31PLF0KN4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RDqMVA047756
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 May 2021 08:52:22 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 08:52:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 08:52:22 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RDqJDg124767;
 Thu, 27 May 2021 08:52:20 -0500
Subject: Re: [PATCH] spi-nor: sfdp: Allow configuring unknown flashes using
 SFDP
To: Petr Malat <oss@malat.biz>, Pratyush Yadav <p.yadav@ti.com>
CC: <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
References: <20210520160701.28176-1-oss@malat.biz>
 <20210521095503.qw3aivg4zklupwcj@ti.com>
 <20210521115350.GA7908@ntb.petris.klfree.czf>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <64dd1df6-0ace-702b-f205-a7c7d4d12697@ti.com>
Date: Thu, 27 May 2021 19:22:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210521115350.GA7908@ntb.petris.klfree.czf>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_065227_479087_015001AF 
X-CRM114-Status: GOOD (  22.94  )
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



On 5/21/21 5:23 PM, Petr Malat wrote:
> Hi!
> On Fri, May 21, 2021 at 03:25:05PM +0530, Pratyush Yadav wrote:
>> On 20/05/21 06:07PM, Petr Malat wrote:
>>> This change allows adding a support for flashes with correct SFDP
>>> without recompilation of the kernel by setting sfdp-compatible property
>>> in their node. Alternatively, sfdp_compatible module option can be used
>>> to list JEDEC IDs of flashes, whose SFDP can be trusted. Star "*" can
>>> be used to match all JEDEC IDs.
>>
>> I have skimmed through the patch. Before I look at it more closely, I 
>> want to understand the use case for this patch. Why would you not want 
>> to recompile the kernel when adding support for new hardware? Do you 
>> want the ability to support flashes on devices that have already been 
>> deployed in the field? Is it something that comes up frequently?
> In my case the kernel is loaded from a USB mass storage device, which
> can be preproduced and on stock (with the kernel already on it). With
> my patch I can change the flash vendor without the need of updating
> the image on already existing USB mass storage devices.
> 
> The patch is also useful for people who use distribution kernel as they
> will not have to wait until (and if) the distribution updates it.

Don't need separate DT property or cmdline argument. There is no way to
know if the SFDP tables are 100% valid when kernel is working with a
"generic flash".
Flashes are often replaced with newer revisions of the part that may/may
not have valid SFDP tables.

So just rely on SFDP, when no valid entry is found in the manufacturer's
flash_info[] while printing out a warning to user that this is just best
effort support.

Regards
Vignesh



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
