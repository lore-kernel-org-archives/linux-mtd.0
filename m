Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B15EC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Jul 2022 19:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCLY/tzPUXhSMCvax4FA8WuP4LQo62BMafi9cHwWfGg=; b=CJ7vGYbfpwOFJU
	aXx7Vj7yF/22vkktBE3IjMe1HnEaru8PIgUN14qRT/yZY1putjHPuJShLVl84RN3pPSmKM7Wgqoh3
	1+aDuOYn+5+j716EfZFuVtZ53yQ8BLBY1UMuRIsNhRx7MC+abtoE4qmdSJtajiG94mfM5X5a9AZf3
	E1tElt7pIC8pwh/q3Gp2NojzLKlJHoLugMSt3IasvuhvmBdubwq8j54lD2uA0+yO5igU60HWT3de/
	/BOQBNmChlO5QhZnONvITrz9nAzGaiAYUm1EkOBIMmvQ/K6hwrz+9xGquQzuIFG7XYBndk77jDgv9
	OyhWvPtG6f1ne7aPHWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MdV-006gtI-P3; Fri, 01 Jul 2022 19:49:05 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MdS-006gql-PG
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2022 19:49:03 +0000
Received: by mail-io1-f51.google.com with SMTP id p69so3211049iod.10
        for <linux-mtd@lists.infradead.org>; Fri, 01 Jul 2022 12:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vDc42dtA+UoyVWkO+4EamxSh0i4aFOrhi15gsyDqnJg=;
        b=BB1s0zoE8b5v1wIXNOpMVditYfqVnVs5kmsVhYildc8bYZeF5W3pX0/B+pJNeCyq7f
         EaTVyymaVPis0ymD8FjPV00HZAbxO8MBGfAw8N1WJvIR7lIkqj0PVGc2wZ5rbs/d0OIu
         zIXkId501CCrIs4QwARN5nFeD8zgkEssERfq/04xclTbZ+Dwi0uxgIPJa5WGtI5V25KS
         c9is9AXbWd3tApIt0uzJJ0gcncXItZjPmyhNWT5N646E9XERvcl5pHQpBf7bDLf0JOFl
         pKYQvmdcXoqVuhv5uEcPJ63khaSv6MAEk+F3IkdwMonHdVx3IivvsOvZmOAwsOrrSUlv
         TyDQ==
X-Gm-Message-State: AJIora+9ovX316peU2PFObXruQCqHi1gVlBW/t8+QIhoIAJfthatewaB
	lkvlO4ZpUFGM+EhLsxxU+w==
X-Google-Smtp-Source: AGRyM1vPN1mKIV3eAwCq2PzkHKGU8UAPtvVrzwZCRjfaKwWrT79WKespjv7gHQ1hN7Xfrnq5EYueNQ==
X-Received: by 2002:a02:cc0c:0:b0:339:c46a:e5dd with SMTP id n12-20020a02cc0c000000b00339c46ae5ddmr9602444jap.104.1656704939352;
        Fri, 01 Jul 2022 12:48:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id bg13-20020a0566383c4d00b00339edc9d877sm5834212jab.120.2022.07.01.12.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 12:48:59 -0700 (PDT)
Received: (nullmailer pid 1403293 invoked by uid 1000);
	Fri, 01 Jul 2022 19:48:57 -0000
Date: Fri, 1 Jul 2022 13:48:57 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: miquel.raynal@bootlin.com, rtanwar@maxlinear.com, vigneshr@ti.com, tlanger@maxlinear.com, devicetree@vger.kernel.org, richard@nod.at, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/8] dt-bindings: mtd: intel: lgm-nand: Fix maximum
 chip select value
Message-ID: <20220701194857.GA1403235-robh@kernel.org>
References: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
 <20220629213508.1989600-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629213508.1989600-3-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_124902_842360_665102DC 
X-CRM114-Status: GOOD (  12.27  )
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

On Wed, 29 Jun 2022 23:35:02 +0200, Martin Blumenstingl wrote:
> The Intel LGM NAND IP only supports two chip selects: There's only two
> CS and ADDR_SEL register sets. Fix the maximum allowed chip select value
> according to the dt-bindings.
> 
> Fixes: 2f9cea8eae44f5 ("dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
