Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BD3104891E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Feb 2026 23:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=veboqQk/os/kqC0jzzB6j7i7SkiS5kTlaxk0I3z1OwA=; b=BJwPEpc/5qcQru
	GGOaMNF9/FeqZT7K7Jef7JlwQ/dCToMfYelzHjEbOTJuQSR+HRzh6Iq0HFa2Sw9vna7fC8gY9Vi++
	EfDo2e7E0QcIVs42L1GBl3itwO3HXhU5YvBJDKIXB8pkuHMZc90zn1gHop441g26x1s6fuqCdRwJv
	nOtr4lYJmmJzm3zya6hSo8/vJSk+lbM3FjtsD9uG4cNO8QclHpXWqcDciDbzwDs74X95VRM39n3Sc
	UvQ7UyA/zNBjbLwJly8AOHPKz4V4g4xoVQ9PvnnGPPF7OAkJ0J04vZRGsxhIpWac7QhvqpihJJgd4
	tDioEDHhRAa3cyxP5FYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6qQ-00000009FQA-2ZSl;
	Fri, 27 Feb 2026 23:02:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6qM-00000009FPq-422y
	for linux-mtd@lists.infradead.org;
	Fri, 27 Feb 2026 23:02:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 174076132B;
	Fri, 27 Feb 2026 23:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994A6C116C6;
	Fri, 27 Feb 2026 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772233317;
	bh=28Aa1hjG1G4KSehZS4U+2cawa4luZRnfRxEZ8i65f4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+JSyRXiPcJ4nUHz5cbZUIWySO57SIl1p9+okGz+lx9b6gOCvcs82sCSPOytGJfYp
	 i2aKaHR4y6UIPftnGIM+Su/xC1KPWSB3DACCWmp58pGknHOENaJ1WT/ACcrCyFE5fs
	 npfn7jxAAg7vBTQXAMx6X8M7gf2buE+1Ra6s0nGfw1hxZP1EshoskvX6fhYFDD8OAf
	 L0Wx3hWBNFGKetfYs9UOJFMm6dT2Bxpzke+aPilUtJDx0K93m33wcpP0aHwjWukDvs
	 eVIcQqgmKgAucRfPJPXdR+NNckETy5EPm5UoNe9VnSZJ4d7lN9hCMXesyjPfbJVtQx
	 85ypmXfD58Z6A==
Date: Fri, 27 Feb 2026 17:01:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Akhila YS <akhilayalmati@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: mtd: st,spear600-smi:
 #address/size-cells is mandatory
Message-ID: <177223331638.922595.7344216125056033708.robh@kernel.org>
References: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
 <20260225-perso-fix-spear600-smi-yaml-v1-2-8ef3d205ab3a@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225-perso-fix-spear600-smi-yaml-v1-2-8ef3d205ab3a@bootlin.com>
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


On Wed, 25 Feb 2026 17:24:44 +0100, Miquel Raynal wrote:
> These properties must be set because they overwrite the default values,
> especially #size-cells which is 0 for most controllers and is 'const: 1'
> here.
> 
> Fixes: 68cd8ef48452 ("dt-bindings: mtd: st,spear600-smi: convert to DT schema")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
