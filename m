Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99422C54E68
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkTsLjWnChdwai9QymUF9QT2uvXZuWvAKdIu7lRfU6c=; b=RjpYYV/gPp176C
	RcitBh2u5DhoywyCAjCX9e0PJ2njn50olb+qfH3nRsD7zZXjiTbVUxLlX6mdI8jbyPHIs1qiUoLeq
	UBIC0w++NkoZPAXES+7KPM5r3nORvUmlLcfiRIJKj2WRvvTNuqSBsK2bRvp3nxA0muhxzwf2pgCNl
	UQB400px4La3rN7CAh2HGaIuBoQTrWok33kWX15GAzxk6mC1QbiThkxuhfI0pS9VcFglgTyhpKiiI
	gmSqESWFzS5vku9jIKlK9fSCKDquCSDeVnU3EgPBdKTGt9jhtL+epN98UAtXWNdUHZXkzfzQZNqk7
	18bRh2o5c5px2L6eXpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnInN-00000003A4E-1b5g;
	Thu, 21 Mar 2024 13:49:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnInL-00000003A3i-0MAD
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 13:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C3D22CE0E42;
	Thu, 21 Mar 2024 13:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0F8C433C7;
	Thu, 21 Mar 2024 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711028960;
	bh=KXx1OqLAULwK6itNYdQKESUqdlN3IelvAK9/XCk+0Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QfSH0sCHJWrC0Zm7gIFMlUG/67wXwcMg287W1NWjx4xIRms/VFGt2JNm4zsUSMcPh
	 7G8ynAWHQYnZOBXA+dMX8X4BcoDhTtjpjCry7WRKeQlW1lhGVcckn8v15LQOumwBB3
	 90CFXSsIkQKwINN5td+GYaGEGfJbimpmYYKsDyao9gbMcaLix8fnk6Oq7uVukKm+0a
	 HvMDRdz1NTJnw0Izki2/BYV2UCmnxzZIBd3YQkpDqcVO42zeHtCs2IG1NwygXU0dZZ
	 51/feqlB/xRW9Xkg+YKqgOVYm+rEq8/UbSh1jBtcOf8gQ35G7K9SioxkuuWMU35rO1
	 bHI6wwh90eG1g==
Date: Thu, 21 Mar 2024 08:49:17 -0500
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] dt-bindings: mtd: fixed-partition: Add binman
 compatibles
Message-ID: <20240321134917.GA1625959-robh@kernel.org>
References: <20240320052449.175786-1-sjg@chromium.org>
 <20240320052449.175786-2-sjg@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240320052449.175786-2-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_064923_583025_10B23C2C 
X-CRM114-Status: GOOD (  22.85  )
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

On Wed, Mar 20, 2024 at 06:24:49PM +1300, Simon Glass wrote:
> Add two compatibles for binman entries, as a starting point for the
> schema.
> 
> Note that, after discussion on v2, we decided to keep the existing
> meaning of label so as not to require changes to existing userspace
> software when moving to use binman nodes to specify the firmware
> layout.
> 
> Note also that, after discussion on v6, we decided to use the same
> 'fixed-partition' schema for the binman features, so this version
> adds a new 'binman.yaml' file providing the new compatibles to the
> existing partition.yaml binding.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> (no changes since v8)
> 
> Changes in v8:
> - Switch the patch ordering so the partition change comes first
> 
> Changes in v7:
> - Adjust MAINTAINERS entry
> - Put compatible strings into the 'fixed-partition' binding
> 
> Changes in v5:
> - Add mention of why 'binman' is the vendor
> - Drop  'select: false'
> - Tidy up the compatible setings
> - Use 'tfa-bl31' instead of 'atf-bl31'
> 
> Changes in v4:
> - Correct selection of multiple compatible strings
> 
> Changes in v3:
> - Drop fixed-partitions from the example
> - Use compatible instead of label
> 
> Changes in v2:
> - Use plain partition@xxx for the node name
> 
>  .../bindings/mtd/partitions/binman.yaml       | 49 +++++++++++++++++++
>  .../bindings/mtd/partitions/partition.yaml    | 21 ++++++++
>  MAINTAINERS                                   |  5 ++
>  3 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> new file mode 100644
> index 000000000000..83417ad5cee9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/binman.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binman entries
> +
> +description: |
> +  TBD

?

> +
> +maintainers:
> +  - Simon Glass <sjg@chromium.org>
> +
> +allOf:
> +  - $ref: /schemas/mtd/partitions/partition.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - binman,entry # generic binman entry

As-is, 'binman' would need to be added to vendor-prefixes.yaml. 

However, I think just 'binman' would provide just as much information. 
But really, does it provide anything? What would be the difference 
between this and no compatible?

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
