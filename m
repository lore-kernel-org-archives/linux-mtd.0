Return-Path: <SRS0=t8q+=FK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239A5C4361B
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Dec 2020 14:12:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB4D72312F
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Dec 2020 14:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB4D72312F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+qvZVD2ObeXEeoc+DsvuBnv2/8lkKQl6sLB9GYGohd0=; b=gKpm2SnOPBhgvNDpKyytQLdzY
	3UlHC3wfqahDFnN7og6RngAIvP5qA5LrFNMMfrEJjIYbUvJjadXFpi/gUt3KearD6igEskjmQAr9Y
	otJCo/eIYPGX2jhLLLaZSBEfcYp11WKp6s8JlZ457iMQQDnEcFVa/weDIUmytWvywuOD2lncs8Btb
	MmKI/oxz3vK7IjgoRxjYPbpUD+6xLnKbGqJ+M1L0Aq1U340DKUANtfacsdjMkp1hNfGuymn2Ed/Nx
	7BO1gLz0+oE5FqJfiRaiAGj3fyH+mPpVhxkODdw4kmTByr+O5MyZGY2dpz9LB9nXohkf2yFSXtkfi
	t7G4s4ncA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klukw-0006Zk-81; Sun, 06 Dec 2020 14:11:18 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klukj-0006Z9-Dz; Sun, 06 Dec 2020 14:11:11 +0000
Received: by mail-ej1-x641.google.com with SMTP id n26so15655909eju.6;
 Sun, 06 Dec 2020 06:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/RgJjBEQoVIkABw7Jb2fNf8DyaI9+NUyzNSN0w5nfXA=;
 b=WdjNSYh1Sto3FtBPYgC78hlN7/WclPuHaq+F5OqhcbFQrGfFrDCcWHl8mg5+K18yZz
 LSxia3ycSp6Fg71qiBfk2SBf9IKrN265yG+GDXrkag8nzNa9AZIGIOUm1WnrGr5eYX9Y
 8OziztcV0yVcdwKBSehcGyql82aDhRAt+mfsuf9ia7zuQNzX5YKPHkddMAqwXTQPK8Q6
 zu82QhPozfh0cMP82GQxtusibLUtpoAgBoPuesN9H01igztfXWDDuRkEI5df0WgYYf+v
 Ri+MIAwCeF7OCQbovDLCc9ZB+ymsHjfpwOHESeQbZa882ZJSSjbHi7Mwf3hlBXPNCvj+
 N7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/RgJjBEQoVIkABw7Jb2fNf8DyaI9+NUyzNSN0w5nfXA=;
 b=qK+I3EVgStPBFoyZqoCHZuvWFJGSmel4wfPuMe+uGpMjHwcMwY02GU3cXOVaNXjGBg
 7K35nOrkDPBkuoBxdQzpIRb3lTxGH/hT4s33vudgw2I3QnRnmo69O4NgxaPDM1Ltqp90
 6p0pbf988kiwXFTgMRKRulUVww4v724vTaG9u9S4mbjpKsUOLEp4e1klz5Js99JiC6fI
 35uy6AwPWAuxHbK2OiYnhLL6/VrFX3DGN90Uls6gMsKtaGLK55WUwIIbCJ1SQ8QUzRzJ
 eRLZIIdsf/Kz9ALsTcVzhYKf16a838WK8u/sZDY2riwWCxr/IjTU08qowXVc0VCor0te
 tvIg==
X-Gm-Message-State: AOAM532qsu6qSFkVNE4nbd1M7nPp3RJpByu2/5IW+Si2jkP/9AjOEJbO
 JBazCPmCZc1uUh/Cxd/iziQ27neeCcGaTA==
X-Google-Smtp-Source: ABdhPJyU1tPKn/+7HnquyPAOFSe0G2xWs6loGWNz+59Qh9fmZk1mbrCYZGzF+/ILnh9Sw0CxJRLw0Q==
X-Received: by 2002:a17:906:e212:: with SMTP id
 gf18mr15408859ejb.551.1607263859782; 
 Sun, 06 Dec 2020 06:10:59 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 q25sm3871452eds.85.2020.12.06.06.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 06:10:59 -0800 (PST)
Subject: Re: [PATCH v15 2/8] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK2928 and others
From: Johan Jonker <jbx6244@gmail.com>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
References: <20201130100031.22083-1-yifeng.zhao@rock-chips.com>
 <20201130100031.22083-3-yifeng.zhao@rock-chips.com>
 <0abf1dbd-13bb-cd92-907c-849f05ea887c@gmail.com>
Message-ID: <259fe1ce-6bcb-3a26-493d-87bbd2eaff5e@gmail.com>
Date: Sun, 6 Dec 2020 15:10:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0abf1dbd-13bb-cd92-907c-849f05ea887c@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_091105_533184_3E926320 
X-CRM114-Status: GOOD (  14.70  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Yifeng,

Meanwhile, could you post a RFC version for Uboot based on this version
plus comments, so people can test the whole process from programming,
booting and kernel?

On 11/30/20 1:49 PM, Johan Jonker wrote:
> Hi,
> 
> Looks good to me.
> Do the maintainers or someone else have any major issues?
> Could Miquel indicate if a version 16 must be send for that 'ret'
> variable alone or is it OK now?
> 
> 
> On 11/30/20 11:00 AM, Yifeng Zhao wrote:
>> This driver supports Rockchip NFC (NAND Flash Controller) found on RK3308,
>> RK2928, RKPX30, RV1108 and other SOCs. The driver has been tested using
>> 8-bit NAND interface on the ARM based RK3308 platform.

[..]

>> +/**
>> + * struct rk_ecc_cnt_status: represent a ecc status data.

represent the ECC status data.

>> + * @err_flag_bit: error flag bit index at register.
>> + * @low: ECC count low bit index at register.
>> + * @low_mask: mask bit.
>> + * @low_bn: ECC count low bit number.
>> + * @high: ECC count high bit index at register.
>> + * @high_mask: mask bit
>> + */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
