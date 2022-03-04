Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6EAC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 07:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qdlb8Vl64OZWJOAvvYwH2nMWP5pYxQwkdUvQ1Vey6YI=; b=gttUBx8Go3fb3j
	X23FiAlHsyy7857UaNn/dEYToqbYhxHc0HQ9/S1eclXOrWoQyyU62Mav7/H/gYmWogDroJXqCAl7r
	KE/CtXe8775zDfx/S4tvx6kCL82TaLQb53Bn+nO8w2wd+N3s7wJWg1DXulpPvM2/HuaH6NAiVZ9rd
	XMeyxydNWlvyqFE0uJc2YV7sd6aJ8a1HkG0EHJPEha/H8h6AqhENFo38YyUNn0ylX0FmLHuuLjYH+
	wgB7IdSUzaGO32cC5MDXa0HGGy/QmIEoXyRkHEIEBy6SJKu2SSj6u2jnEDxutnvUjNZ7B55RGwXfk
	f5Wp14AfZxEVaJQHLY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ2p4-008sVZ-Sv; Fri, 04 Mar 2022 07:57:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ2p1-008sUY-8W; Fri, 04 Mar 2022 07:57:56 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso9997190pjj.2; 
 Thu, 03 Mar 2022 23:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=b5JJahJbPSg5PuTw+HrbCqpeRRIjKIFlWzoeU01rKTU=;
 b=DY4pRigayZTq/5rjtD2bjuRYX10CoBCJokMk8l+MP82c190ULI8mFEuacqaLNPAXPD
 g19dQFm0zMVhGKiOsNUY9WJgsc90AJDeeLgEAB5cpBbXEMt6heWnf2gMNbOruuNvF17k
 tXwKAv2lg7nTWKjS4zTcwxp73K/Vbt1z1Gar1VAgmd5Ag6hG/VXjy+dML3IARlgqC2B6
 cGI/FVM8Zba/wkYhqCgAMgtvHPZVw74vWCg4uHmsYZyJaQoCdjis0QGRG8L1OWv6BWMe
 j0uwGPD8wkT83IJ+e+RJJqDuugr6zMJGNHLqy9gJLwrC/UgMPBBtoo1bFd9Z8PQlBUsR
 KiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b5JJahJbPSg5PuTw+HrbCqpeRRIjKIFlWzoeU01rKTU=;
 b=GdtNqaKs4QMGCmoDeggrlWICydjtWQ9Yd2ew0GeEnrrNZtFsBd7V5+86d4CPrKXHYj
 Guf0mRDCHx7DK5It5R94ZNtGL3RuXJ1AGNjeL7lp5KSTUHYDONzMt+C3oVC9tngqesVK
 84H8akzKpXr2tFa9vj/TpKmHtsnilTsedBfbmc0SXfnse/F494+ceuGo/psmr5TV/yuO
 LUEd1G43JpldlnA4N+ho7EEyWmSW9zH/TkOYchtCNFOMG03w6QqZWEO+wLzYyacNRSV6
 6GXpDxwE+4CV/Y8BoGDRTAhKnyt95NtSVyn33ldakWnBs6i5NX3ZTiVKuNR04afrqqHu
 RFGA==
X-Gm-Message-State: AOAM533UKY8TgYcnQxSLyzLDVodPqD8/sa4abCNyMzkrDatUFc9VeLIH
 RZOiK22p3uFv6Z1BauSFgiY=
X-Google-Smtp-Source: ABdhPJxvuPW+GS4d0R4GqvhhYiQKHdTrokQg6qHNRrkq/DtJ47Gkay/NlA31+zVRMc3ZiLuUSflWGA==
X-Received: by 2002:a17:90a:4286:b0:1b8:8ba1:730c with SMTP id
 p6-20020a17090a428600b001b88ba1730cmr9376289pjg.181.1646380673939; 
 Thu, 03 Mar 2022 23:57:53 -0800 (PST)
Received: from taoren-fedora-PC23YAB4 ([98.47.137.113])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056a0002a700b004f357e3e42fsm4936341pfs.36.2022.03.03.23.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 23:57:53 -0800 (PST)
Date: Thu, 3 Mar 2022 23:57:50 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 John Wang <wangzq.jn@gmail.com>, linux-spi@vger.kernel.org,
 linux-mtd <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 00/10] spi: spi-mem: Add driver for Aspeed SMC
 controllers
Message-ID: <YiHGfh/4xZRim6Ka@taoren-fedora-PC23YAB4>
References: <20220302173114.927476-1-clg@kaod.org>
 <CACPK8Xdo=krCNVVs5=jiSnmyiPkNPd9Dxxyx0Tv8eUHKR5J3cQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8Xdo=krCNVVs5=jiSnmyiPkNPd9Dxxyx0Tv8eUHKR5J3cQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_235755_329464_5E18664C 
X-CRM114-Status: GOOD (  18.55  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 03, 2022 at 10:01:20AM +0000, Joel Stanley wrote:
> On Wed, 2 Mar 2022 at 17:31, C=E9dric Le Goater <clg@kaod.org> wrote:
> >
> > Hi,
> >
> > This series adds a new SPI driver using the spi-mem interface for the
> > Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> > SoCs.
> >
> >  * AST2600 Firmware SPI Memory Controller (FMC)
> >  * AST2600 SPI Flash Controller (SPI1 and SPI2)
> =

> I've performed read and write tests on the 2600 controllers, and the
> driver seems stable at the settings you have in the device tree.
> =

> Tested-by: Joel Stanley <joel@jms.id.au>
> =

> I've added Tao and John to cc as they have tested the 2400 and 2500,
> and I'm sure will be able to provide some Tested-by.
> =

> Cheers,
> =

> Joel

I've tested the patch series on ast2400 (wedge100) and ast2500 (cmm) by
reading/writing FMC flash0 and flash1 for several times, and no issues
observed so far.

Tested-by: Tao Ren <rentao.bupt@gmail.com>


Cheers,

Tao

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
