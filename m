Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26B0CA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 14:00:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751F6214B2
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 14:00:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jG8hPmv2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gi6vvKlZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 751F6214B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUC2CTihM29N/XYU4RkRhGDdYQoczRtabpVdAvYVJJA=; b=jG8hPmv2Ve48SD
	NiNzLWPmJP3Jqy2z5kKcXIPLWMsru2krNaAVpF+NIFJeK7uWcswPVif/JLrkblYixTGTQqNTPb645
	4imZ/w4skFkCwJ7G31geaekaP9BFA2G4BwrPYHy1tWiT6lZy6Gm8Q7WXEZSVUXcntQij47+iKkpgI
	wITSdSJ8HFxYVGCbEOLAdDPNfun4R9eY4cnBo0hXU7cazPUseg35t5HaA/ImFeE8TqWxKc9mpRcw/
	H0I0bTPhSYLJhsL1rciPUMNEM8tkD5RdA9oM+S51wc6zg13pK+OepB46KJrlseo2o756RXNo/pL6I
	/VAHS2C9bxqRIcPUB3yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPS2w-0002tf-Fn; Tue, 29 Oct 2019 14:00:30 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPS2f-0002YP-8u; Tue, 29 Oct 2019 14:00:15 +0000
Received: by mail-pg1-x543.google.com with SMTP id r1so9629970pgj.12;
 Tue, 29 Oct 2019 07:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3RWz9l3/B7SltQRtqxThazj72fG6HLPCrRBSHamwG2Y=;
 b=gi6vvKlZNFvT2TfBgGbjsE0fNq7TOPfVljNx5UiQBpHr53URR+V1J4LJgv3Zh00tUR
 2VJgWOGXtIhFvYiDZB0bCUTNEMfbclaL7v/Ca/Rl7FOH34LPgAU7BBL6fuxAnGAEwavE
 n7O1KSsQufR0DXWwEpfFZMF/yq4pIWE5iwz5gFtm8EdiCRQmRXIN+eyl24ufo4o8VPqW
 ZZEl2C2Sr3fOXS4AChtJ7SwEI+J6RK8qizGITJ9dPNlzX3fMOSrKIBIz5PUUlFkrp3Wz
 NEjjVVfEe+EfNvi0utyx+i6B4rTFVAJ+eEFT0VPASxlZTciv62Exr7hAViUAvAjoQvr4
 eulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3RWz9l3/B7SltQRtqxThazj72fG6HLPCrRBSHamwG2Y=;
 b=XjWCYNYQZkXfDOIGqXddChhV3LRtFMqQgzpob0UeOCJIJ+WXtA5FmhBMv4CWKqIEjY
 /xMa/FpT912UYNG89W06UYTmrFPwSW0QAcaebkSXmUT/qd5wO92NNDdmVOO4EpG16yX6
 MiEGxtggxxkmASiciNVgB+s/P+BKfDsV4O1WdcsttraKTzM7zoUEMj9w+XWby9VbH0JM
 8Zl1/5oDQqwvDITFk/0qUafgmvOIwG1ZOKEIegES9ijCkcQiL149tQGWq1GcHNsAauUi
 34hjuXY8iAKFppB3yoQwpDqZ5vR2kBYCQ+XUNu52kW86aXqpqIoJgZIiljcs9Fp7VNuU
 baZg==
X-Gm-Message-State: APjAAAXBg8It7YmpCOaT9Cez/1yCMKQ8koNQOiKU6urS29mWg6C5rXkX
 OuDQHFgdeVAfjKRv+ye/yHM=
X-Google-Smtp-Source: APXvYqzMgIYYjOPJnIWQ0ODCJG9vYNsNP7C4LA+We6RWcFKY4ibzXz4QdblaFYdr8tYTJSlg5hrLIw==
X-Received: by 2002:a65:4247:: with SMTP id d7mr27474764pgq.107.1572357611059; 
 Tue, 29 Oct 2019 07:00:11 -0700 (PDT)
Received: from saurav ([117.232.226.35])
 by smtp.gmail.com with ESMTPSA id y129sm15557518pgb.28.2019.10.29.07.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 07:00:10 -0700 (PDT)
Date: Tue, 29 Oct 2019 19:30:02 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] mtd: devices: phram.c: Fix use true/false for bool type
Message-ID: <20191029140002.GB4943@saurav>
References: <20191029032142.GA6758@saurav>
 <20191029091433.GG25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029091433.GG25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_070013_343220_E4FCCE10 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 joern@lazybastard.org, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 saurav.girepunje@hotmail.com, tglx@linutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 29, 2019 at 09:14:33AM +0000, Russell King - ARM Linux admin wrote:
> On Tue, Oct 29, 2019 at 08:51:42AM +0530, Saurav Girepunje wrote:
> > Return type for security_extensions_enabled() is bool
> > so use true/false.
> 
> This doesn't seem to bear any resemblence to the subject line.
> 
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > ---
> >  arch/arm/mm/nommu.c         |  2 +-
> >  drivers/mtd/devices/phram.c | 11 +++++------
> >  2 files changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm/mm/nommu.c b/arch/arm/mm/nommu.c
> > index 24ecf8d30a1e..1fed74f93c66 100644
> > --- a/arch/arm/mm/nommu.c
> > +++ b/arch/arm/mm/nommu.c
> > @@ -56,7 +56,7 @@ static inline bool security_extensions_enabled(void)
> >  	if ((read_cpuid_id() & 0x000f0000) == 0x000f0000)
> >  		return cpuid_feature_extract(CPUID_EXT_PFR1, 4) ||
> >  			cpuid_feature_extract(CPUID_EXT_PFR1, 20);
> > -	return 0;
> > +	return true;
> 
> This isn't explained in the commit.  You explain why it should return
> true or false, but you don't explain why converting this from returning
> 0, aka false, to returning true is necessary.
> 
> >  }
> >  
> >  unsigned long setup_vectors_base(void)
> > diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> > index 86ae13b756b5..931e5c2481b5 100644
> > --- a/drivers/mtd/devices/phram.c
> > +++ b/drivers/mtd/devices/phram.c
> > @@ -239,27 +239,26 @@ static int phram_setup(const char *val)
> >  
> >  	ret = parse_name(&name, token[0]);
> >  	if (ret)
> > -		goto exit;
> > +		return ret;
> >  
> >  	ret = parse_num64(&start, token[1]);
> >  	if (ret) {
> > +		kfree(name);
> >  		parse_err("illegal start address\n");
> > -		goto parse_err;
> >  	}
> >  
> >  	ret = parse_num64(&len, token[2]);
> >  	if (ret) {
> > +		kfree(name);
> >  		parse_err("illegal device length\n");
> > -		goto parse_err;
> >  	}
> >  
> >  	ret = register_device(name, start, len);
> >  	if (!ret)
> >  		pr_info("%s device: %#llx at %#llx\n", name, len, start);
> > +	else
> > +		kfree(name);
> >  
> > -parse_err:
> > -	kfree(name);
> > -exit:
> >  	return ret;
> >  }
> 
> At least this partially matches the subject line but it looks unrelated
> to the other changes.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up
Please igonre this patch. Suppose to send for only one file nommu.c. I have seperated and submitted the patch for chnages in file phram.c and nommu.c. Thanks for review ... :-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
