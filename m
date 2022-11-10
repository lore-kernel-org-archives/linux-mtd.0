Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FFAC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDuGo5SVyFDOrRrZm6cZ3S5I7CYFF6I4jsftLpkHD+M=; b=EbPC1DanIbCSzZ
	Z6hQKz8gFWPRieVCsxUGAuQD5WgHYLuiHVH1fcE5v54mk38+fBAI1fIihhKlYb4uGw6bXgPdkAZ49
	eaBcSSVFNf2S/AW3HjOIzh2KYuQwDdOeKpfoRx+0AHgbMAIP8ZZpPqNDdTRSMHZUnMMyDhDcjtwBC
	JJRdGgZXUDQN9djxUll77V75u2nKEwAFsE4wi8WXetjbTPm7+mX4+uw45bhKJT9H15N0qzwYrIlN8
	e6FGc1smuvuMINSAUIG1MZRQV6l4CUCGJsfJeEWfwb+PyuiqR5fFkj346lg/fq2MiOelCJgg9LMFu
	3ZWgU9ZUIOk/4oQmDmgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAtc-007PSK-P3; Thu, 10 Nov 2022 16:59:20 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAtO-007PJk-7c
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 16:59:07 +0000
Received: by mail-ot1-f49.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so1284340otb.1
        for <linux-mtd@lists.infradead.org>; Thu, 10 Nov 2022 08:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu9VOZ0bBSO5GSl6uftNhEUB8IXfetD8C5a9NRdg/mo=;
        b=e7Q5oPwXIswKqhwsE7D5az4GedrOKtk3qS5bxQsyLJRg4VCMBzItJg8RiQw6aawxHz
         FAkmWxL/hmiOLhk/kUFUm6OX0OqGyGbvRtVXDEuSMD7mNelyCg4gTkFxw7Fkg3CPI0iS
         JYff7zk909TRejbApUP1wq9lHHNg916pO/bpajbec/dHWbJe98oVDlgDHd/Qr191DfEV
         NEKLMvfaKjXwBeJ+UrOgXtKlJ0tq9EDgE4xHYjfTyGkO3RQCo0YeodqtY1Nmoj3iF+Ke
         743sM03QBEL9PQXldm5qxyVZsoiIIRyQ4w9m60fRarP9crpVpPCpVjy9K7L9KPDILnGL
         8Iwg==
X-Gm-Message-State: ACrzQf0PEe+6gftqdzNAUwIzEVo8ZNjUx16Y6Q0GDGs8xRdf+jfLCXuo
	a+bnN1euCc0UhhdrQ91/lQ==
X-Google-Smtp-Source: AMsMyM78mWWnsWMVZD6WZragXacIiaUrC3claHPaA6YiV9+7ZSj7JKhpC9nH+jPz0uH4KpyFF+QyPA==
X-Received: by 2002:a9d:7047:0:b0:66c:6bc1:158e with SMTP id x7-20020a9d7047000000b0066c6bc1158emr22811550otj.350.1668099544935;
        Thu, 10 Nov 2022 08:59:04 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u19-20020a056808001300b0035418324b78sm5895937oic.11.2022.11.10.08.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:59:04 -0800 (PST)
Received: (nullmailer pid 526147 invoked by uid 1000);
	Thu, 10 Nov 2022 16:59:06 -0000
Date: Thu, 10 Nov 2022 10:59:06 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/17] dt-bindings: mtd: nvmem-cells: Fix example
Message-ID: <20221110165906.GA241353-robh@kernel.org>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
 <20221104164718.1290859-14-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221104164718.1290859-14-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_085906_297725_64BEA600 
X-CRM114-Status: GOOD (  13.64  )
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

On Fri, Nov 04, 2022 at 05:47:14PM +0100, Miquel Raynal wrote:
> There is no such thing as a "ranges" property within an nvmem-cells
> node. There is no use of it, it is anyway not pictured anywhere that
> this is valid, so drop it from the example.

For a memory mapped device such as parallel NOR flash. It would be 
perfectly fine to translate a nvmem cell 'reg' address to a CPU address. 
If the partitions are not memory mapped, then it's a gray area. Whether 
it makes sense to translate just to just the absolute offset of the 
flash device, maybe or maybe not. At a minimum, 'ranges' just means 
can translate to the parent address space. The Linux DT translate code 
only supports the full translation to CPU addresses, but then it mainly 
just supports creating resources.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
