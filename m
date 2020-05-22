Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB2CC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 04:04:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9AFC207FB
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 04:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fY7kVHdE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9AFC207FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RI+XP43HB+QPLsPDhKXdJNWt80D4nyPMFwhNnJ9fCo8=; b=fY7kVHdEwq8pK5
	SrTrHLGj7x1yNASfDE3wYF0BWqeJHy0Q2d1ZdJqRVifCzjoB+n93ZVOP2XPRJhaLRkKho0b3WvnxD
	wjzizg1RH6mBDNnAE7DKTrz5ogOZ2LBRNqbhuwuLKK52jQDUX24gT5T3+D2AdQRrWuGaR+bASF3T3
	BulaU9wCN5NwfoJ3Q5CL4PBLPmOXHrL4bFHdVOO46Mh1OlyYk6mL7moOCsqeISmHt5NdNS0UyigGD
	T2QzpqWbSGFJwewyoP1rGU8ydGy9uigYV0eez+lONQmiiMBZP7a8Q2DRBdkGHjd+Px/L7KSpl9oJa
	1VkfdYquAvadIuDXnnlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbyum-0001PR-C8; Fri, 22 May 2020 04:04:08 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbyui-0001Ov-Tb
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 04:04:06 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49StCN27cLz1rwDm;
 Fri, 22 May 2020 06:04:00 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49StCN1PjGz1qrjS;
 Fri, 22 May 2020 06:04:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id D06siCSwMQla; Fri, 22 May 2020 06:03:59 +0200 (CEST)
X-Auth-Info: lStS/r9R9aZu8kjfXH32jl79uee4G6SRppIoHCfyvM0=
Received: from [192.168.1.106] (unknown [79.120.249.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 22 May 2020 06:03:58 +0200 (CEST)
Subject: Re: Issue with 'ubi part' ubi_io_read: error -74 (ECC error)
To: Jupiter <jupiter.hce@gmail.com>
References: <CAA=hcWQ8ZjjdzdTVtBas42L0_qbhJhayqogz_Gg5wgtDBVo+hg@mail.gmail.com>
 <CAFLxGvxp3+JuaEatmMg_tvMFonSVC-pwhiB_ikf6i_edAGPewA@mail.gmail.com>
 <CAA=hcWQDX3bPddO3TVo1Pn51tHGcPoywEHJwRsVBqy98AWqzEQ@mail.gmail.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <bc9f663c-4336-814e-4567-eeace4f36480@denx.de>
Date: Fri, 22 May 2020 06:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAA=hcWQDX3bPddO3TVo1Pn51tHGcPoywEHJwRsVBqy98AWqzEQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_210405_101761_9EAD7A42 
X-CRM114-Status: GOOD (  15.54  )
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
Reply-To: hs@denx.de
Cc: Richard Weinberger <richard.weinberger@gmail.com>, u-boot@lists.denx.de,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Jupiter,

Am 19.05.2020 um 14:06 schrieb Jupiter:
> Thanks Richard for the response.
> 
> On 5/19/20, Richard Weinberger <richard.weinberger@gmail.com> wrote:
>> Neither UBI nor UBIFS care about ECC. The MTD stack does.
>> If you write something in Linux you cannot read back in u-boot a common
>> problem is that u-boot and Linux use different MTD settings (layout,
>> ECC, etc...).
> 
> That is exactly the problem I have, the MTD layout in both Linux and
> u-boot is the same:
> 
> # mtdinfo
> Count of MTD devices:           3
> Present MTD devices:            mtd0, mtd1, mtd2
> Sysfs interface supported:      yes
> 
> Are there any ways or tools in Linux to change MTD settings (most
> likely the ECC or DTB) to the same setting in u-boot? I do have mtd
> and fw_setenv in Linux.

No for U-Boot (as I am aware of). You need to fix the DTS or may if
older U-Boot your code.

May you need to add in your U-Boot DTS gpmi node the property:

fsl,legacy-bch-geometry;

?

see commit:

51cdf83eea - mtd: gpmi: provide the option to use legacy bch geometry

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
