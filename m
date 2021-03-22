Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA60C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 09:41:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8719A61864
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 09:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8719A61864
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C4N0gN7BHgsMEWYkoZ8sAA88ot/A01vAEBPU5dMQVg8=; b=bnFZyt5dja+TzpMQI0h5beTq+
	ubqDJ1U9Y0X8aPxhL/pwmdreN92ZP69kgKcsHw+ow4xAbTcqLqTo/D4XCJ2lqobt8Zx4P5uiaZplU
	sqJcDcSsPV6T3wxqsfvfj1a9eVW34ThCwwoGsr1sIC7Rig5j+LB0xp+dLnqcjnf7bhs0aUKgDlsG5
	OEuaUrxEzUS2ChMg9Wzr1R9F9gYuOHLBeo9Eh43Snlq72c+VKqY0OZDimgiSq75mH3i75GyV/BV/N
	vckdaN0X0AjOawb/jhiFaIxK2SAuYJGNcWouh72JuYyPk3qvn9c5msnWWaTPrepYuWaWZai4iruu3
	CBOvHIg8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOH3S-00BH3F-V9; Mon, 22 Mar 2021 09:40:59 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOH3L-00BH2E-Uh
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 09:40:54 +0000
Received: by mail-pj1-x102a.google.com with SMTP id t18so8090704pjs.3
 for <linux-mtd@lists.infradead.org>; Mon, 22 Mar 2021 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ADfJ8XxZaIUTO4Shw2feZhZGB3RwS6NXo/0ZVYfJyEI=;
 b=vuCGKMIjlS5UYwQqxhmr8nPtU1ChMMs+B1J5ZbQQJAJvUGi96AXtA7v8UH2UkJdPqR
 kyXJ+beER2DmMnUfKDrE9VkGyp68GHtOUDb1Ax26rtGr92ZVJFj79oq5Xn8yJLtkqJTf
 1UFshpI3ZPuFpoNsrkOj0SpQyeDf/z4qh3Biu8+B71vrNpRkQqdTJG+4/lCEJVyqS3jN
 dlBKqKJevbrE/8sgOESiZUmU/jTqkmiYV3B4d5UsjPf5VTSN1QZrxELExjKsxbi3HYtN
 vDZzOZyIRiKE/UmclwbDgoxdt5hoNlcHEPyldTSq048iLKvz81kwJfmneW+1IrSZF4Nl
 Ftwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ADfJ8XxZaIUTO4Shw2feZhZGB3RwS6NXo/0ZVYfJyEI=;
 b=dm0vUUfEhIJHG31vp5kb0SVditSgoENPleOXSNH/PMJpmwmBzw0KsuuEMO6ETCV4jc
 I2FO5LkwfD/QDm5AhYJFAEkP6Eei8ZgvzM10ns3ODBr01pz/sfiEIQVeiVyOCjZ/FH7Y
 K4UmxthxT/pnXwtwBUiiWbjqK2k/zLMMOXmMrnyehhR8B0mu/sM4A357oYj7/0h06P8c
 9s6kIL+toXJP7vS/6qiM0Ky52VtpooQcSBJZ2P/vHbB02D4Tqcg6kARY7KMrsn3Rq7c8
 Hm/BvZ2+lJmIa0/50swGL0DvLHrazg4Y7ReIcd1aCiMxATqwhjHuzvxWnT7duGUh92lm
 4VgQ==
X-Gm-Message-State: AOAM5325dYAC/dOnFicTqJtogycmMdSCiBSupBmB9bl0OVih5MRlEq+B
 nf1+qs65OAf9NvU29iMmzoUk
X-Google-Smtp-Source: ABdhPJxXYjtqadurjjAFkFFRifdEFnG3qdB33Q8mykdETZt453Mf2F1NvB7ZmqzgOrmLaz2phIhYtg==
X-Received: by 2002:a17:90a:5284:: with SMTP id
 w4mr12092419pjh.29.1616406050218; 
 Mon, 22 Mar 2021 02:40:50 -0700 (PDT)
Received: from thinkpad ([2409:4072:88e:ef5e:dccf:398f:4151:2e02])
 by smtp.gmail.com with ESMTPSA id l25sm3616113pgu.72.2021.03.22.02.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 02:40:49 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:10:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v7 3/3] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210322094040.GB70634@thinkpad>
References: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
 <20210319150010.32122-4-manivannan.sadhasivam@linaro.org>
 <20210319175659.17c9e8e6@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319175659.17c9e8e6@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_094052_391750_A8DD05F7 
X-CRM114-Status: GOOD (  15.07  )
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

On Fri, Mar 19, 2021 at 05:56:59PM +0100, Boris Brezillon wrote:
> On Fri, 19 Mar 2021 20:30:10 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > @@ -2737,6 +2783,11 @@ static int nand_read_page_swecc(struct nand_chip *chip, uint8_t *buf,
> >  	uint8_t *ecc_code = chip->ecc.code_buf;
> >  	unsigned int max_bitflips = 0;
> >  
> > +	/* Check if the region is secured */
> > +	ret = nand_check_secure_region(chip, ((loff_t)page << chip->page_shift), 0);
> > +	if (ret)
> > +		return ret;
> > +
> 
> I'm lost. Why do you need to do that here if it's already done in
> nand_do_read_{ops,oob}()?
> 

I think that's a mistake. Will remove it.

Thanks,
Mani

> >  	chip->ecc.read_page_raw(chip, buf, 1, page);
> >  
> >  	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
