Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589D6C001B0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jun 2023 21:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r25s53rrV0JuoswTIvoSkZa7FxMqmJPtfsR5UMc1jX8=; b=pKgz+biW/SSVpS
	K1mcGncWZk7xSknJfFpzBknnUJu/Lb9whHJpSS8Yre5mswV1xSvdX4WbH/eEIORMRAKqJhpH/aFOt
	eJ80G1hUmPcXa+qmxJXVPIIxmi3Fp4UeCe8c5JkVC+RDkWhisfGNQ199v5t6wPhHY4OB5OY9hQp7F
	fLCB4SFuAODYgcn5F4GpuY+I/paoVtPhUfxp+hlAI5oz8Gteu607qpMvxxjjLTZ25O710T5zWaMZV
	35I7g1TgDtEnKhQh6iEOC+yEU14kcGFTVna3DimWq7mpHcJab5mjVWagjnrsafyShXR5xtckibZqh
	2usWzRwbWyfejwJ2Kmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCny0-004cF1-1n;
	Fri, 23 Jun 2023 21:05:16 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnxx-004cDX-2g
	for linux-mtd@lists.infradead.org;
	Fri, 23 Jun 2023 21:05:15 +0000
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-780c242d200so38484239f.2
        for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2023 14:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687554311; x=1690146311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SiArTIqkTQiivMX6twZ1Y95R//RLGOPceqIb86Vytg=;
        b=GTjg5LQz5iOm7oktRP5C13wq74m/fOzk967Ndh/MeBOoz9b9+7Jd+4kCbjrhqqK7gH
         BeMVX2FLinU+x8P5I6+uSU8aAm1kqP54v+uM9iWG/Q/3aKILO9fA3e1+4puvZwJxDw9p
         ToXbFRhvlUDJe+hNEBk88XfFIhHZwWXTP/sYm+7pPhbWXJAODN5UtqqH5vV2f2U7WVhB
         9eUpe19zmIp1/co92uQC5ffTToQVb8GjiuOCkl+5iKoVRgpQI7rv4u0y0jyWdtxVTqQr
         MMIpUOOu3npd4IGgnTmXX1sPWhRuEkUGBa7T3l62AQZMJn0O1yHbjMY7mBZeBph2OBBh
         y+1w==
X-Gm-Message-State: AC+VfDwetvsgfcMMzYAf8LywdqD1LZhDsECJHjTOW2RZTVyCREXO+95T
	uES82LjyVINwqdFnhV3Mqg==
X-Google-Smtp-Source: ACHHUZ6R2oZ6mgR8qPufCNhbjCc9hi4jOmCJ3fACUXeDEHKg6jtUn8RZjMENy+GV+m5hP+nC64EZ6A==
X-Received: by 2002:a6b:5913:0:b0:783:3943:581d with SMTP id n19-20020a6b5913000000b007833943581dmr449984iob.13.1687554310916;
        Fri, 23 Jun 2023 14:05:10 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id x22-20020a029716000000b004090c67f155sm4071jai.91.2023.06.23.14.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 14:05:10 -0700 (PDT)
Received: (nullmailer pid 1121568 invoked by uid 1000);
	Fri, 23 Jun 2023 21:05:08 -0000
Date: Fri, 23 Jun 2023 15:05:08 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Maxime Ripard <mripard@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] dt-bindings: mtd: Fix nand-controller.yaml license
Message-ID: <20230623210508.GA1096125-robh@kernel.org>
References: <20230622212415.3583886-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622212415.3583886-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_140513_868429_7670D6EE 
X-CRM114-Status: GOOD (  11.30  )
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

On Thu, Jun 22, 2023 at 11:24:15PM +0200, Miquel Raynal wrote:
> Binding files should be dual licensed, this file was writtent with the
> idea in mind of following the rules, but the SPDX tag did not reflect
> that correctly. Fix the tag so we are sure this file is licensed
> correctly.

Yes, we do want dual license, but things converted from txt bindings 
need those authors' permission as the txt bindings are all implicitly 
GPLv2. That didn't happen here, so we kept the default implicit license. 
Looks like this case is all Bootlin authors for significant parts of the 
original txt binding, so you should be good on that part (assuming your 
employer agrees). Maxime did the schema, so need his permission too.

Note I have blanket permission on dual licensing from several companies 
for DT files. It would be nice to get the same from Bootlin.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
