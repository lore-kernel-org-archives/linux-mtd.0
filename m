Return-Path: <SRS0=a/jC=IW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5292DC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Mar 2021 17:52:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5DE761A1D
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Mar 2021 17:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5DE761A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+PU001Iym1f+8aZ/9IC89s13+74FEKTHMz1gyJBk/wM=; b=kdpHrfWA4sSvPrS39B/qJe+cU
	4bQvmLAN+oyAFfLZyL+KF/xXnqliSomqjQUgSJ4NtyyjBiNAUj6lqMNwxM/hd7N2fdD9WW1PDSeec
	7S8jI6CKunPrrmWzraHKBmZc+ltFiUdO/KvtcdSf2K9yRbuhS/3E2tgJkZfnBUehkm875OpRghDoN
	7LCFD2mRhCLOufANUb438yACi3yo96J/vxY6+V1QxeQ9R3AD1pMCUXntZSY8rXoT/0Q5vEM5JZ7C8
	xHM+7dJikojBB4G+xw7f4SSxSlHnhzPRnKGm6uHVqiKMTa5X2ARnbgRvpca7Xlxxj+GebV5IzDs0l
	oTjCG6lbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP7fj-00Hapb-Bq; Wed, 24 Mar 2021 17:51:59 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP7fe-00Hap8-VP
 for linux-mtd@lists.infradead.org; Wed, 24 Mar 2021 17:51:56 +0000
Received: by mail-io1-f48.google.com with SMTP id r193so22411898ior.9
 for <linux-mtd@lists.infradead.org>; Wed, 24 Mar 2021 10:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=17TKIF0QgDUzTxJGnuM465tbTrl6KEfcXDq37nKfdvc=;
 b=Xb/6Qt/y/bFtt3b1ISOLV/P8DuJKzaFzPNMQXMGW2ysm9h/EcvjLg4yhy6/xyeT6MJ
 g7NPFeSrJXy5nGsESsH+xvqOMwpmkyo7SLpl8z9zJJl35YE2NoduP5LNXmDla3eadkoO
 MTcXTrzLbSfRGUCH3FNSrOcs09VirrZb6BmskDF87iK60htRoPJgA0V3i9rPf0yOZu6M
 sFh4HHk0do67hl7Gv7u1a3JlxGUZC80yoQLa83EGnknEKNYMsLbHlqWdoebC0l7jURiK
 Wm5tBlLqqAfMp/Ow0kupFkNUqKpA0pHu7EfeB7ThPI7IG5EEdt8elU6GHZ/AlbCFyMzi
 1S5g==
X-Gm-Message-State: AOAM532niibE2LdaBCZKoHiRO1zPgz70kvpj8ntD+A0Adg6V1IdAmZnh
 daPRtzLk1dJuVTGIhzEdRA==
X-Google-Smtp-Source: ABdhPJx7hPRAeDLMlQ3t6S4EyGJIm+TvC3ilVZW8FSTOnuKiHnkj+ZxNsVYm6pnIJjby7DwcY3TeQA==
X-Received: by 2002:a02:a90f:: with SMTP id n15mr4000419jam.110.1616608312821; 
 Wed, 24 Mar 2021 10:51:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id v17sm1361275ios.46.2021.03.24.10.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:51:52 -0700 (PDT)
Received: (nullmailer pid 3326340 invoked by uid 1000);
 Wed, 24 Mar 2021 17:51:49 -0000
Date: Wed, 24 Mar 2021 11:51:49 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Pratyush Yadav <p.yadav@ti.com>, Kuldeep Singh <kuldeep.singh@nxp.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: spi: Convert Freescale DSPI to json schema
Message-ID: <20210324175149.GA3320002@robh.at.kernel.org>
References: <20210315121518.3710171-1-kuldeep.singh@nxp.com>
 <20210315183051.ugvmz4zqrvuo6iqq@ti.com>
 <067c42f3726578ebe60d201a141dfdb6@walle.cc>
 <20210316180655.6oidvffum7yuwknr@ti.com>
 <97410b24785492f9e80999dd7a1ffdea@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97410b24785492f9e80999dd7a1ffdea@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_175155_101193_E5E0A606 
X-CRM114-Status: GOOD (  12.47  )
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

On Tue, Mar 16, 2021 at 07:22:56PM +0100, Michael Walle wrote:
> Am 2021-03-16 19:06, schrieb Pratyush Yadav:
> > On 16/03/21 06:45PM, Michael Walle wrote:
> > > Am 2021-03-15 19:30, schrieb Pratyush Yadav:
> > > 
> > > ..
> > > > > +patternProperties:
> > > > > +  "@[0-9a-f]+":
> > > 
> > > Shouldn't this be "^.*@[0-9a-f]+$"?
> > 
> > The pattern has to match _anywhere_ in the string so both should match
> > the flash node. Your pattern is more "strict" or "precise". See the note
> > at [0].
> 
> I know, but specifying the whole line is widely used in the bindings.

It should be '@[0-9a-f]+$' which is equivalent to Michael's suggestion.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
