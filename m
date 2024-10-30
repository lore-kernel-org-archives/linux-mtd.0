Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E686D5CCA5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnRqM8KxRh34tXxaw5uB/HD30shAvjhyQWoLCxmLTw4=; b=FoSVxKKiY55k8/
	Oald3qIOvqPzzb7ptiKmqkXecopst62ZeTFyC4Y9cnDIgRLVmP3laX/RtsjJcJEkYkgEKPyWLk/0d
	Rfknt2C+Kz6zGw0VHYiFx9F7UlFMlVOR8qEE77WcMqqA4QikerpeJ59rr8fZt1yXTehhMhGUCs/Cs
	PtgfFrEn9n8notNKlD+vTjIbkXHktMr8lFsnDHV89UT3m19A/5k0pgc96c1gLfCWM2mfIi0l+QrrZ
	oY7kuKj8tZkyNnfJ+sPoNVMuelbu6SPlilRKIF3UECgyCh3TQkCDrWo0EZFd8C+kx21bNpEv0X5Vb
	63wEdKINyrnEGmBH9Wew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t680u-00000000Lvm-0fMG;
	Wed, 30 Oct 2024 12:41:28 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67yv-00000000Lf2-0e6c
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 12:39:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAD87FF807;
	Wed, 30 Oct 2024 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730291963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhyPbAq58zDiCBw+D6bNpgM3r5/2NHM3HBjd+pUlFJA=;
	b=bcAFvYMCOgJmIyfQ6Od4D2NGh+yjgIYJBJxQUg3qQ+o60UW1DOpKVDktiyak3n+VQmdnsa
	EJVpA5uzPUgwZ/aiFVUuPY5y568dqlVkwqY4MND5o9cSwedrlU4yZBBeiy2VzqXnxSd15L
	pYNcEs7l8n7rOxbLUHeIM6ZfHwPwn8igcGwixykhVoxiYeeBLSTzanW+379WNS5zIhXq3k
	xXiou0bBC7aVj/1q85EW1Yhacm5WyLlHhaosYG9CmkclLmr6Sd3i4LKiRTh1z0kozvMEsA
	lKJ3MVYa+bpSUoJZkkxLdBPUfrQ5V3XE4CqDYgk3/EHjeCSmGwvGH2BkWKljtQ==
Message-ID: <fdf3d305-d6a9-47bb-b474-92da43b8d557@bootlin.com>
Date: Wed, 30 Oct 2024 13:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Implement setup_inteface() in the DaVinci NAND
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20241030104717.88688-1-bastien.curutchet@bootlin.com>
 <f1078ec6-209c-41bb-9a72-ee6e045231b4@kernel.org>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <f1078ec6-209c-41bb-9a72-ee6e045231b4@kernel.org>
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_053925_359617_50559450 
X-CRM114-Status: GOOD (  18.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On 10/30/24 12:17 PM, Krzysztof Kozlowski wrote:
> On 30/10/2024 11:47, Bastien Curutchet wrote:
>> Hi all,
>>
>> This patch series aims to implement the setup_interface() operation in
>> the DaVinci NAND controller to enable the use of all ONFI modes and
>> improve the NAND access speed.
>>
> 
> Your changelog is supposed to explain also merging dependencies. Within
> patchset or external.

I'm not sure I understand what you mean here. Do you mean that I need to 
explicitly state that the patches in the 
drivers/mtd/nand/raw/davinci_nand.c depend on the ones in 
drivers/memory/ti-aemif.c ?

There isn't any external dependency on this patch series. The ONFI modes 
are already managed by the NAND core driver (in 
drivers/mtd/nand/raw/nand_base.c). If a NAND controller wants to benefit 
from all the ONFI modes, it needs to implement the setup_interface() 
operation; otherwise it can only use the mode 0 which is the slowest.

> 
>> This NAND controller is present in the DaVinci (OMAP L138) and Keystone2
>> SoCs and functions as a 'child' of the AEMIF controller. So its timings
>> are set by the AEMIF controller itself from device-tree properties.
>> Implementing the setup_interface() callback implies being able to update
>> dynamically these timings, so the first two patches of the series modify
>> the AEMIF driver to provide its 'children' a way to modify their chip
>> select timing configuration. To do so, I add a ti-aemif.h header, I'm not
>> sure whether this header should be located in include/memory or in
>> include/linux/memory. I put it in include/memory because the folder
>> already exists while include/linux/memory doesn't.
> 
> All Linux headers go to include/linux/, so this one should as well.
> 

Ok thank you, I'll move it there in V2.


Best regards,
Bastien

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
