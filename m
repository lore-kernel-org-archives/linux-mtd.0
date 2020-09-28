Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670EFC47423
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 18:21:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 074BB20757
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 18:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbnXONyG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 074BB20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2POaL1f4l57c60+c+J3ynVZZ7pP58g3nWMIA5svkKq8=; b=GbnXONyGT2+yuHH3JzYry71nz
	YyEM2MFOFFClMOpkIWDt9BxZAUWPOALwgaQ64uCbYLX0Z82gX3Ino8wKZt38yk+bpUlL3AZOOMRXD
	/33XhZod2ECrby93cK0YOVj/+QqEYkbPw2gLpjD1oQ/92l83L8n7e3w+DbCjmEtmdgVl0p2en9s03
	7fb8fAc3Mf5McwcwMGvUuwTTWfnKqK6T+O3juMyHY3/DBPeMvGbecAq4D43ZXLikzk8qarQcVacR8
	Qjj8T5Qmk1drOWyaDIwnR7XmgODv+1hmGBYrrhdXlrd4LD51qPDoVXW5Rcfjsf+gkmf6dBQbsEPcf
	oV3F9vHig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMxlr-0006Dy-LD; Mon, 28 Sep 2020 18:21:07 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMxlp-0006DQ-Aq
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 18:21:06 +0000
Received: by mail-ot1-f65.google.com with SMTP id s66so1909689otb.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2020 11:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vKooDXQXUIpYRDAbDVaTwr6L0+fDtdWOYDGwyaosHpA=;
 b=Nc4udOqzg9Uj++/Q2U/GkF5Lvg/MnF0R9UYEse2HyPKPinSP79KVNIC4gzwR8bQZrH
 urqzpxAr0JO3n/IlMqLdoIWTg9itzqPKkKInSKzKdA1u6TZlTei9dl8/YymVkh35l9LZ
 9BW5IIOVsRHXIOg3D78Bt2pPahCYXpqx4RFZgzACNHRCVQbk0MQekcsGr+RNafwyuxRn
 svRfLXZpDilcw5Q1+XPEKn4yUtAlFyEFCYEw9SMn/WaOCZ3wJHsGXibDa6cot5ZfljOH
 pN74BKX5ldQzrMY5G1USuYnk+x7gCbWnDEvkFDA81gTmM1ecCXgkCVHzIQDzVc4b/m+m
 KLMQ==
X-Gm-Message-State: AOAM531BbSByK683uEmlB3kOrd3fTOnQlbpPBm1Nt17wM3Z25HWAVLrt
 I2RiBtnNBZFDn3iRyAm2Dg==
X-Google-Smtp-Source: ABdhPJyHc2IWWZSeBt74rVXKmOdChJyeIbrFaW/mlVDJ4zZHLz307OBl92fSD+O3D5qGKEltxcEyBw==
X-Received: by 2002:a05:6830:22e6:: with SMTP id
 t6mr195945otc.88.1601317263360; 
 Mon, 28 Sep 2020 11:21:03 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g21sm2414166oos.36.2020.09.28.11.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 11:21:02 -0700 (PDT)
Received: (nullmailer pid 3026606 invoked by uid 1000);
 Mon, 28 Sep 2020 18:21:01 -0000
Date: Mon, 28 Sep 2020 13:21:01 -0500
From: Rob Herring <robh@kernel.org>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v14 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Message-ID: <20200928182101.GA3025620@bogus>
References: <20200924084232.41631-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200924084232.41631-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924084232.41631-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_142105_374918_FABB9DF5 
X-CRM114-Status: GOOD (  12.69  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, hauke.mehrtens@intel.com,
 christophe.kerello@st.com, vigneshr@ti.com, arnd@arndb.de,
 devicetree@vger.kernel.org, richard@nod.at, miquel.raynal@bootlin.com,
 brendanhiggins@google.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 tglx@linutronix.de, qi-ming.wu@intel.com, robert.jarzmik@free.fr,
 piotrs@cadence.com, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Sep 2020 16:42:31 +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 99 ++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
