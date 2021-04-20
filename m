Return-Path: <SRS0=BLSt=JR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44241C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 14:09:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF64613B2
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 14:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF64613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jhcyZwGfLRCRjiGsBKOyofZ3btfsKR9fkrKPsbTybtE=; b=nEi9ssgX5DQFFc22EN9F8wAsK
	ttlaqKQhGtcxpOKqt72s3Pkzp5Sw6C8jJGwGBTWe7Fc5KB7y5bqmVagnZy3LNpThpOmNCcz5+3yJY
	8z9s4XS2shgryvcABNuf9jFKKaVWV+X4m/bhHjiWH6nG4lYX97emHrUBO1kVnrVp9k7qef9Ggxbxq
	jpGEV48Vp5AO0YXEKICKV5CWKfA7hZXfkP4rINQa9JbDXAn/9c29RPiaODmroo3YWa42SQT3tQsBv
	hFml24bX/B596+hn4LT6msgnHj1pVb37PLnhytVI7G+BjCduo8nAalsem3gpzXFhbPj70fptEJUxd
	0PNAdmJTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYr2w-00CIm6-79; Tue, 20 Apr 2021 14:08:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYr2t-00CIlt-An
 for linux-mtd@desiato.infradead.org; Tue, 20 Apr 2021 14:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fyaFnlJqNpsxlknmsqUUlJe/44lYYi+AnMDNj4dn7jg=; b=DVzS/clBBfzJxU5gzS7oQaXSBL
 40Zpj2GgT3gk8ziQJj/ssPMI3p2usm/A8C2iJ3NuI4iSx/dKy8sp+Ue13MAskRk24lT39SlX0Lw7x
 UBQRlb42Tzc/urGJ8Gpnoea8LiLaN6T1TiqdVZWgx6JmFnmbzyTbP0Iw76gqhcLrhwU7XvEAD126J
 qcPQg3bl7VLHJbO3oVEJY1JixYar1srg3SdU34p3sOk+LMLwPrTqXAgMIbEWKp9UbLwXPBIUC6Pe/
 Cs/tvg/dodON4kZcApHrCZJK2AGtlYlLoZOPxBLErF+o+e0vbcQuO8PQuY/smMc4hgIs7Nnppbyiv
 sEUi1F5g==;
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYr2q-00CB9c-MT
 for linux-mtd@lists.infradead.org; Tue, 20 Apr 2021 14:08:06 +0000
Received: by mail-oi1-f177.google.com with SMTP id m13so39017332oiw.13
 for <linux-mtd@lists.infradead.org>; Tue, 20 Apr 2021 07:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fyaFnlJqNpsxlknmsqUUlJe/44lYYi+AnMDNj4dn7jg=;
 b=mHbaDDR2Gey+NCB08jptFUEjDF92+wZ8YnJH4j9i6u8E5mUpk6J+VazsHkz2HCjzig
 xW1ZMWYvX4SDJLKoPn1cl39CT/kWzE5LvBDvXvRD/nNHSvxMSZlpLlogBM0sg6iyKb9/
 4nrKdfGjwhCceEf3IUTzFvoOcs+HZHNkk3Ml2yM4IQAdfVvY21PL7lA+0o5AHT2cRlez
 Ks35bUj6BYhfYtOHqHwfu0mScSDjor1PB1tqa+CQz0QSvHyaCgimpnHPqjp5X7XAjG5P
 g9Kbxd9MRNWHo16QxwSX/S3X9nUN+Tn+NNw+ivVywM1OrPkkXr+5MkibwUR7Nev//QD1
 6Zkg==
X-Gm-Message-State: AOAM5314toX4+vXk872z7wnPfbE12eT4eRwav56vfjKLyvTpYYAqT/XJ
 gqgd2vQYFXBQozh0gRArew==
X-Google-Smtp-Source: ABdhPJz6/CknfnN6Q3VBghczUhAjlWM2IZtaX/wH8Dkg8jaU3WB/LzVuy+BrhZfjXxsgCt7cRsn2rw==
X-Received: by 2002:aca:309:: with SMTP id 9mr3191301oid.12.1618927683893;
 Tue, 20 Apr 2021 07:08:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u195sm1659221oif.55.2021.04.20.07.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 07:08:03 -0700 (PDT)
Received: (nullmailer pid 3247646 invoked by uid 1000);
 Tue, 20 Apr 2021 14:08:01 -0000
Date: Tue, 20 Apr 2021 09:08:01 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/5] mtd: core: OTP nvmem provider support
Message-ID: <20210420140801.GA3240688@robh.at.kernel.org>
References: <20210416114928.27758-1-michael@walle.cc>
 <20210416184423.GA3715339@robh.at.kernel.org>
 <9f33229a8fe83b49210289fc93a8554e@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f33229a8fe83b49210289fc93a8554e@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_070804_753831_183F31B9 
X-CRM114-Status: GOOD (  21.53  )
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

On Fri, Apr 16, 2021 at 09:26:03PM +0200, Michael Walle wrote:
> Hi Rob,
> 
> Am 2021-04-16 20:44, schrieb Rob Herring:
> > On Fri, Apr 16, 2021 at 01:49:23PM +0200, Michael Walle wrote:
> > > The goal is to fetch a (base) MAC address from the OTP region of a
> > > SPI NOR
> > > flash.
> > > 
> > > This is the first part, where I try to add the nvmem provider
> > > support to
> > > the MTD core.
> > > 
> > > I'm not sure about the device tree bindings. Consider the following
> > > two
> > > variants:
> > > 
> > > (1)
> > >     flash@0 {
> > >         ..
> > > 
> > >         otp {
> > >             compatible = "mtd-user-otp";
> > 
> > mtd is a linuxism. Why not just 'nvmem-cells' here or as a fallback if
> > we come up with a better name?
> 
> There are two different compatibles: "mtd-user-otp" and "mtd-factory-otp"
> to differentiate what kind of OTP should be used (and both are possible
> at the same time). Thus nvmem-cells alone won't be enough. We could drop
> the "mtd-" prefix though.
> 
> Is there a benefit of having the following?
>   compatible = "user-otp", "nvmem-cells";

Yes. I assume 'user-otp' tells you something about the region and 
'nvmem-cells' tells you that there are child nodes of nvmem data. Of 
course 'user-otp' could imply 'nvmem-cells' as you did. I'm fine with 
either way.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
