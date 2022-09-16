Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B5DECAAD8
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Sep 2022 11:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfG7Sl0ptQP0DuDSSJM7CxCACJu++iQe8COlQ8PrKJg=; b=Obcp7rBvpoMJSB
	gQ8xzv24EhS6P7QPRynVqM6wH4ocQL8kBGs/XMpgWAVkn58nH+rRyQCw9WWE/U1rLHYXYrnRFxPIt
	5ha9h1UP3S4Daf7eNHUcWzeG/coZ18itd/S8/DgIyp1/PZMOoZrnwJf0XhV7+AaV46HxESo5bCseO
	9SBI7rj4TcbDzvm9UfvpUk2eYvF1zXePytI4hz4DF6wwaOfwZYdj74RB9DcyqnymTXVBZYvbBveJn
	/9Ec2Qjz6bdtGchiMgg7QVPRRqicb+V9uUV+3ZGkqDrXF/NX+bj29DBwzievH0/kBj03iRFbSYSX5
	SMmwNvpMK94D2s2RDsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9qt-00CryZ-4Z; Fri, 16 Sep 2022 11:49:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9qp-00Crtz-Md
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2022 11:49:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id r5-20020a1c4405000000b003b494ffc00bso1016196wma.0
        for <linux-mtd@lists.infradead.org>; Fri, 16 Sep 2022 04:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date;
        bh=ZNy2G5TiScnj5f0egZW9OhMmUoJRuGBqKdbzcY0u1Og=;
        b=P2V/UQQsYHRCWSwq3IueIa8FVD66HGy7WnkISZ/Fm3Uivkb76K0eq3mzLLq+rC0/Z7
         B4C3xoPWjz9Lf3a9eoFqm3U6TpN9TUKATs+UQvspNSYQbAqlh/3HgigVdsWmYq+bi9Ca
         7eusJGMJmSOmhFdZhpKk2na3gew6EWmXLJu8KYRZgcu8lu3OVuTnearr5dTQhjo1Inhl
         sUv1rWUFlq/woNLow97/SKqGrFH6+lCdntI+vPCNj6e2Vg1SPYDSyVKS2M+o79IC25aE
         OZTfGf5EQbcD3r5vely11d63k8W+5zpWBVdfElH/CkPwFaJRZEC6eoXSz6cEnqCVG2e1
         3jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=ZNy2G5TiScnj5f0egZW9OhMmUoJRuGBqKdbzcY0u1Og=;
        b=Uf/idrqvcmI5zp4r1ajb+MVmLm48oxhCB5AfA+OgTZL7fR/h3kGvwJbkWq0qknN67e
         +xMZBGcj50WsMxce3n7MWXHQt6unw2DxxWo/uNlphSlzbBKulGuWKrs4DXDxSAdlvbcU
         ZLejHeiurjaqkC783ItIHMhb/JjaCrAWa61iz3mvedKVPmaV7e6n3umSpb2f1d3WpJSD
         jRA+8OeQ6S+vmlw2menmxuqZMpyfOecJ+KjtaDuvw8UUvdca9UVGcah7gXTfBg/mUO8z
         S2nxab5mO5sSO6Sf4ehrZ+WZIDUQtqrCo3aZgxloozf6SKGGqQJ4mFoisrWlcogmWGm6
         EICQ==
X-Gm-Message-State: ACrzQf0my4wftk2GrEKNma743Wu9p9fdI67k0wpM9UQZmt7IhfywJ0OL
	KEJTXZ+HfrYJHbiJDSUWvE0=
X-Google-Smtp-Source: AMsMyM5IsJCvsYqqs4wWRuv42Uuf87f0rQivT6vUEx3MJEMF7WZdOPqtTNiglh4jXKy23mUvCrMyag==
X-Received: by 2002:a05:600c:500c:b0:3b4:92e4:c77c with SMTP id n12-20020a05600c500c00b003b492e4c77cmr3085815wmr.41.1663328979505;
        Fri, 16 Sep 2022 04:49:39 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-134.ip85.fastwebnet.it. [93.42.70.134])
        by smtp.gmail.com with ESMTPSA id v26-20020adfa1da000000b00228c483128dsm5785768wrv.90.2022.09.16.04.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 04:49:38 -0700 (PDT)
Message-ID: <632462d2.df0a0220.44eb3.d76a@mx.google.com>
X-Google-Original-Message-ID: <YyP3cC6MLaqh060M@Ansuel-xps.>
Date: Fri, 16 Sep 2022 06:11:28 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: handle error pointer from
 adm prep_slave_sg
References: <20220916001038.11147-1-ansuelsmth@gmail.com>
 <4dcb0e76-b965-42da-b637-751d2f8e1c51@www.fastmail.com>
 <632455db.df0a0220.9684.aafc@mx.google.com>
 <c243fd70-782c-4663-b08d-99f44ae55fc3@www.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c243fd70-782c-4663-b08d-99f44ae55fc3@www.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_044943_760544_A8852DA1 
X-CRM114-Status: GOOD (  17.56  )
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

On Fri, Sep 16, 2022 at 01:45:17PM +0200, Arnd Bergmann wrote:
> On Fri, Sep 16, 2022, at 5:11 AM, Christian Marangi wrote:
> > On Fri, Sep 16, 2022 at 11:01:11AM +0200, Arnd Bergmann wrote:
> >
> > Thanks for the review and the clarification!
> > (Also extra point the fixes tag will match the driver)
> 
> Regarding the fixes tag, how did you actually get to my patch?
> While it's possible that it caused the regression, it did not
> introduce the ERR_PTR() usage that was already there in
> 5c9f8c2dbdbe ("dmaengine: qcom: Add ADM driver").
> 
> Maybe there is another bug that needs to be addressed in this
> driver?
> 
>       Arnd

Don't know if you received the other fix, but 03de6b273805 broke
ipq806x. I already sent a fix for that but since it was added extra
check for crci, it seems logical that 03de6b273805 should have also
updated the nandc driver to handle the new pointer error. This was not
done so I added that fixes tag.

Tell me if the logic was wrong...

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
