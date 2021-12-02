Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6642FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 00:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1ifnrbPoWn/MBb46Isv/OMrTQFoA1RHVzYEd+azBvw=; b=BkqtofqGTjoPD5
	RsM040ABstglBEXzwYR67adPIqWvHHO0lEmflXL+a4/Lpo550Ne0TXVkrJTcci9v8iuXqEdM7Tv4E
	3Wna8mwhUHeF6eElf/Jg+zdNGRecm0SZlfUSTkX/ncvjTew3DpUGwX2s7AiGAOxZju99qRy07JuBf
	t3nFsRlb5Bs5/tTjhc5qkNJAu6WHhxQEAGdiDc8rghcSlbFUQzwnSx6095f4PDO40omBB0LhzqCsh
	NOqAHXEpTzZO+A8l/81qgci4NssdP7J6Bu+NmZoyLDNJmVIunGsOSkeZyNOcJUDDFH8+Ve/zhhUJS
	LA7yJ7QqcNKxAYfIljAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msZaI-00AO1i-TG; Thu, 02 Dec 2021 00:04:22 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msZaF-00ANzY-TC
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 00:04:21 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso37633456otj.1
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 16:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E8m5H1RjODYZOhcIY/5HbLIJ8TZJPXHrLEoJIdbP730=;
 b=LHZfI1LBYxI1jOJbcHJM+BkiCOJwD4drgPru1J/QU0NUxklSeFB8ZHXv1n80kQOjsd
 yoR0m1QeiGUdmqD5fpYOxp9GlyweRg5ajZlT1hSjASd2k57pkzFHKZVgl8wqKd2Lm+l8
 LCQ9U2QsOMsdBXIsrIS3Cm4GUcVYR36ebVJUQLG493zIAR1H9ueN8MenIiUHrBZb9nOZ
 3+NxFgngGbTVO/4AmC6+MU+e7FQwPDiK3nkkGSMM+Qbh9q+8r+WC7imY0pmz3GH1FvGd
 v4+5lRJXVIcQdtLme4Z9F11dSlYacDt5wTJVNtcKq3pOZiVLIG0HNwIBAPRYzya2HREX
 GPew==
X-Gm-Message-State: AOAM531lXTZAcrmIlS7SMGP45KiP4rw5aGC5uz2smjbXWqmHcRWQgayq
 SDIluflYq/GoqZuRKGISzQ==
X-Google-Smtp-Source: ABdhPJzykshZ3giZeAWDq/K9p7fhw01EHwjy9zgTWnMXk6d5kPQA4sI+Q/+IGbOe5wf/CozpMmwaWw==
X-Received: by 2002:a05:6830:2707:: with SMTP id
 j7mr8464722otu.354.1638403452524; 
 Wed, 01 Dec 2021 16:04:12 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e14sm616444oow.3.2021.12.01.16.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 16:04:11 -0800 (PST)
Received: (nullmailer pid 3265276 invoked by uid 1000);
 Thu, 02 Dec 2021 00:04:10 -0000
Date: Wed, 1 Dec 2021 18:04:10 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 4/5] spi: dt-bindings: Describe stacked/parallel
 memories modes
Message-ID: <YagNemH3SYHQJBTs@robh.at.kernel.org>
References: <20211126163450.394861-1-miquel.raynal@bootlin.com>
 <20211126163450.394861-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126163450.394861-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_160419_968027_AF89C397 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

On Fri, Nov 26, 2021 at 05:34:49PM +0100, Miquel Raynal wrote:
> Describe two new memories modes:
> - A stacked mode when the bus is common but the address space extended
>   with an additinals wires.
> - A parallel mode with parallel busses accessing parallel flashes where
>   the data is spread.

I don't quite understand why this is in spi-controller.yaml.

Also, please see this series[1].

Rob

[1] https://lore.kernel.org/all/20211109181911.2251-1-p.yadav@ti.com/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
