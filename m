Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FF6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 21:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NxqkxiuBv0Lrgk87SEPAZjzrsaZVA5tXBQmD2oUiE8=; b=k5rS24+oo/ttF7
	tXSyZZXcNf4CKYxNsQSfJAmpjEQAtZbz1fSvekV6x1nNpxZ2g7i6mdJYagftzgO0C8hLBVhmTPt/2
	KKxU8qCNHBZCYLX+PXyzZicuq1ozS+rIOdBW9eT48mG7fIMHDyHNPvDeNIwaVhpUaK+MdX01SEpPB
	tOLLwmwaYCF8LwXObMOIFxsrGGedWKRlqdn2K+qA1SQGFEHzg9FRd1W2MZ4chvXjQ43RFXDpOpTFr
	1vt60NjISIcJp/Bslabj2P/vi6O039JsbR53royY6HIjcBtyt0NP1GehhhYmap+aYXASDdbl8pjjt
	Ei7DZvpGh9KFFLWIOiFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLV9-005s53-Dz; Mon, 06 Dec 2021 21:26:23 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLQz-005qI0-VZ
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 21:22:07 +0000
Received: by mail-oi1-f173.google.com with SMTP id m6so23902178oim.2
 for <linux-mtd@lists.infradead.org>; Mon, 06 Dec 2021 13:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MtzbU8c0o9gJTrJwZtxJGMONYkckI9EfUgoa5uU3qFA=;
 b=uxZS67ls5b403ZJPX3ENoS5BN6HHYRTt5MvKnkV/xkBQFI9WyVFU6tYAm+dr8Sriwq
 VVYPe/xIUHkiGUAgPWHVp12tE4YHfQKMdFVMWMXzoood96K3ryCOlMydkGx9tVD6hDrL
 i91CHC8xPd/oe2X7pYBtALE89XhcEFwqNYL1u90Bxx48UFoUyMKbzvmQMG+24pOgd826
 qzpLu0mC4zm2uQtAcf3jgWotKdvU7rVMCjPEoROUOCUZDTGCGHC42cKPnhzUUDUdBi0E
 sPEPgUrznVFyYeOGTFKPHuaCNN2p1Y2dE2QC1WT1BKpO6UxmOWZU6g3ViXn0jBfm8i/o
 /wLQ==
X-Gm-Message-State: AOAM533Jbpsr1gsAxWej9MSOnH4U+ba41IN4vY0jQ2BqpRTBeq06dFSs
 3zvnHJRM1xDhMPX3T4v6xG7WFqPXpg==
X-Google-Smtp-Source: ABdhPJx+6qLHMV08kPKLLwEC00L0H/b5sMt6rFhfrItlQan9KP9JMfFD/XZlvj0GkVxmJHAGdNzU5g==
X-Received: by 2002:aca:1c02:: with SMTP id c2mr1234161oic.53.1638825724466;
 Mon, 06 Dec 2021 13:22:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o19sm2980347oiw.22.2021.12.06.13.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:22:03 -0800 (PST)
Received: (nullmailer pid 2606265 invoked by uid 1000);
 Mon, 06 Dec 2021 21:22:02 -0000
Date: Mon, 6 Dec 2021 15:22:02 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v3 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Message-ID: <Ya5++vUkIKXtE1ja@robh.at.kernel.org>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
 <20211206095921.33302-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206095921.33302-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_132206_052203_ED2456A2 
X-CRM114-Status: GOOD (  10.85  )
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

On Mon, Dec 06, 2021 at 10:59:20AM +0100, Miquel Raynal wrote:
> Describe two new memories modes:
> - A stacked mode when the bus is common but the address space extended
>   with an additinals wires.
> - A parallel mode with parallel busses accessing parallel flashes where
>   the data is spread.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/spi/spi-peripheral-props.yaml    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
