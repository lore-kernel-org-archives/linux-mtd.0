Return-Path: <SRS0=cCt4=KS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2027C4707A
	for <linux-mtd@archiver.kernel.org>; Sun, 23 May 2021 17:45:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5515A611ED
	for <linux-mtd@archiver.kernel.org>; Sun, 23 May 2021 17:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5515A611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DP+1Q0TmwzV3GSCbVQNviZGQtPardykaFgtzWCP3dQ=; b=Y+Ti/DKCqm2mFspov6eqLFuVgZ
	FDLzTIE+rwRsWYb3hf7w/rSm0d4kZ3ooDE8dw9xPWi3DADhzQdkby0+rZBGvNuSM7Jg5hmj+fhUdw
	VKhtdtfPk0ZWxZEj23qrWipfXqbHWFOrO+xTBf3l2Zom4+Bs889duOIfDx6I1ilwBivv79epPO0As
	5Go0iqjIkf2kCHXbtwS82eEFvoa04aw+IJ3vXOtisuxguvnkPlUv8DjJe0P1jeUV7RDERLPCk+Rfq
	fLVQ7mglC11tXB4Y9WkC1bJzQ1TFmnctZRWfX67Wg7pdlMKAHt0yORLzAiP1eNnQY7ZY74K1BVptE
	41/6CY/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lks9U-004gqj-91; Sun, 23 May 2021 17:44:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lks9Q-004gqW-Ec
 for linux-mtd@desiato.infradead.org; Sun, 23 May 2021 17:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=bAOofUd5Xk0ovcFEXs4lhlouv/j+7UhO+vvsi7Z76pM=; b=Cv0fmGyRiqclp9KefRHHf2TN5m
 JoQFQpEqQ83RKieAb0sEZbCqMBKUVDXKKlp9VsTaFS3TSz4n8TizMNc6nDd3/1DPc7WOWzLUVlyey
 VcfKsJxZYrb+ZCZpyac7jRUrkeV8wEpGNCzwd8/XAb5SKp7x68HGnPJNWJLBRzABQmLRhUr8C9Y8e
 l3XULQUnT/712M16UZOuzj9esPmAeW+0LEDU2pWcj+m/d0pnFe6d2wB42gXB7DcZ1QMN4OFYR3Hrw
 Q72fOh8ILh5GE4DWf0/CGWW5Sz9KGVFHOQmcK/VF1bKDuly4km/v/Fus15a3QLQZVSftnqxfHmjL3
 1YnotfDQ==;
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lks9N-000WYS-Iw
 for linux-mtd@lists.infradead.org; Sun, 23 May 2021 17:44:31 +0000
Received: from [192.168.16.66] (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id 0C510464730;
 Sun, 23 May 2021 17:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1621791867; bh=r90inEtjWd9AjzY5mLdqb1g/jrp5nd0OK1t03R2zr1M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=DWC3igPN4m9tG/hWAMwhYXra7xLIrJE3w4T6RUnDm5mVmPm027GGiA2vi8McWge7D
 wnFq/E9Ib/oHHSL79sShU3e1PhAiov9S2vcupr9ckm3SOwO6CGf29FPhdEoQFphC7c
 jNZMTUaA3JIuuhRRW9QHdU+QBeKJHkSEkGZMviLEHJsPELRUhZmdPRhowzLI/7Jb2/
 55U4riTZpYkVJyt3q6BfR6HdMgZeGwsr0D3y+dkK+O9jZ8IdxNNxc3PX+Vl4wUyZvc
 og8wrQz4BUb2JReFprJv2MCyn4GjjZ3hdQgNw3kqZGaYS8UWb3zzuj/pKktKQ7Bp0q
 AmuBiyQ7DRliw==
Subject: Re: [PATCH 1/2] mtd: nand: raw: gpmi: new bch geometry settings
To: Han Xu <han.xu@nxp.com>, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
References: <20210522205136.19465-1-han.xu@nxp.com>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <13c975bc-b37b-8708-9ac7-acdc62ef7108@geanix.com>
Date: Sun, 23 May 2021 19:44:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210522205136.19465-1-han.xu@nxp.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_104429_813894_3D351FF3 
X-CRM114-Status: GOOD (  24.05  )
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

On 22/05/2021 22.51, Han Xu wrote:
> The code change updates the gpmi driver bch geometry settings, the NAND
> chips required minimum ecc strength and step size will be the default
> value. It also proposes a new way to set bch geometry for large oob NAND
> and provides an option to keep the legacy bch geometry setting for
> backward compatibility.

This will break all existing devicetree's. (this happened to us with the same style already merged u-boot patch)

> 
> - For the legacy bch geometry settings
> The driver uses legacy bch geometry settings if explicitly enabled it in
> DT with fsl, legacy-bch-geometry flag, or the NAND chips are too old
> that do NOT provide any required ecc info.

NAND's are providing the minimum required ecc, the now legacy method
actually gives more ecc bits and quite cheap when using hw ecc.

> 
> The legacy_set_geometry() sets the data chunk size(step_size) larger
> than oob size to make sure BBM locates in data chunk, then set the
> maximum ecc stength oob can hold. It always use unbalanced ECC layout,
> which ecc0 will cover both meta and data0 chunk.
> 
> This algorithm can NOT provide strong enough ecc for some NAND chips,
> such as some 8K+744 MLC NAND. We still leave it here just for backward
> compatibility and als for some quite old version NAND chips support. It
> should be en/disabled in both u-boot and kernel at the same time.
> 
> - For the large oob bch geometry settings
> This type of setting will be used for NAND chips, which oob size is
> larger than 1024B OR NAND required step size is small than oob size,
> the general idea is,
> 
>     1.Try all ECC strength from the minimum value required by NAND chip
>       to the maximum one that works, any ECC makes the BBM locate in
>       data chunk can be eligible.
> 
>     2.If none of them works, using separate ECC for meta, which will add
>       one extra ecc with the same ECC strength as other data chunks.
>       This extra ECC can guarantee BBM located in data chunk, also we
>       need to check if oob can afford it.
> 
> - For all other common cases
> set the bch geometry by chip required strength and step size, which uses
> the minimum ecc strength chip required.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

One further point, u-boot older than v2020.04 will not be aligned with the way ecc bits is
calculated with this patch applied(without the legacy option set).

It's quite a mess :/
I would recommend to use the legacy mode as default, and add the new style as "modern" option.
(Also in u-boot)

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
