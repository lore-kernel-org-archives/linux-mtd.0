Return-Path: <SRS0=9pOF=GL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A760C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jan 2021 13:30:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF75235FF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jan 2021 13:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BF75235FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9h1yYcVk7RltYDjLRUuTem1szzT4PWkOjzRfbLUgE6I=; b=EuFC1itxnnnOoa6ci1PpHBqng
	45Rt+m0p15rJDj5xkYMeGjOdjah/58gr2/d1lZgA4xi45e0utfwhpqtNGTmjuTNPzsOEhxvsW5PVo
	WYT0YpKNM/KqWmlg1fyzAMwLtszCOGm1IDLCWKsOKgvpaB7r/tvPajK0hO2qpiwMdVNIhf0r8ngIK
	hQT4enm0u8XjSjgpSV8W5tLrXa8tXnqtPC/vjricjW8eND+9Wfa7Keb4kkJh0fRfPo1bBle+sc/hw
	W6RghRPDiFse/y/OjRRV0ktFG5P2wxYd/Gg5+s4xSVPTsyHx4oZsTJDpYZrq6enAEEvZ/zd+lLHQR
	wHmFF1TWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxroj-0008R3-Qz; Fri, 08 Jan 2021 13:28:37 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxrog-0008QJ-TY
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2021 13:28:36 +0000
Received: by mail-pj1-x102e.google.com with SMTP id n3so5594624pjm.1
 for <linux-mtd@lists.infradead.org>; Fri, 08 Jan 2021 05:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hA4JZHhjR9oGOhVvmUbpRpmg1xDON6Ii7KmBaagdrio=;
 b=IKIT+Qlfwidb1qCaC0AqxMWUJjjiOElaQFdiIJe7OClT8bNJp6cO+zVQ9w0eGf0PxZ
 NS/z2iTHKWjwl525MkaHsgfhKdsgAQNf/BLPvl397oYuvlFuK6qAS9hHpGm9lLAmggxk
 OGg50VJ17gFPUaqjPbCIpxpv0s7MD6CTAb9BukGhVN1Uv1zbxMd0emUrg9TTOsyQWauw
 oWyoHAzYenROJKfq3NUtCVw2YbbVWRaUld7Q2gETX4xGls8Ew2OPJqRiFmNEHA8enldA
 GAR6Qc/urh1A92heygsAVt9DHyyXGKp4tZ8cRzeRM/x22L/O+3SwtGoyhBelYcuqNPca
 2wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hA4JZHhjR9oGOhVvmUbpRpmg1xDON6Ii7KmBaagdrio=;
 b=nsHZwEq2j5vEXadLsCVeOqNXl+0JEqr0H/mh+g+k2exYmPTcFwmq8P7DcqvkSqVU3G
 HMHK6s5rLPwkpYnxIVpvGzANZQ+FDLEqbFWjgqAMv5VVWf9WItQV1oPCIS72HZ9vo6AA
 a+ZWUVtfK+js93k1ghbQIp2FJGsASZkAeZnyJcNsMcSae7MlX4ALnrQMWMaCgu/xOQjP
 ZZtOyiq7gmJfICNExzNF5b7Fbv/EfwZEClLJ2SqX+0oKoLRLgj8fXz0lGzvCtOca7fX0
 iDxmlfoHySozaltpt+U2v1AJ2nIsmFN4q6qDA7A2FTW5xjZovbKu9aWq9k78qLx+j73F
 S0sA==
X-Gm-Message-State: AOAM5312n0Z4K2N3rMgWRJCUi8BZRcbHWed057UscZ1ksnsEcQpcorZU
 AtWx8GW0TDzzpRw883c//pxf0oJYaGxS
X-Google-Smtp-Source: ABdhPJymP13labxp5qj37slBZ3e/HdVyBjzqk72lm44Qro7SgY/K+nSxDWPE1zFGMFHZAi3A/r/JGg==
X-Received: by 2002:a17:90a:394f:: with SMTP id
 n15mr3771167pjf.121.1610112512414; 
 Fri, 08 Jan 2021 05:28:32 -0800 (PST)
Received: from work ([103.77.37.188])
 by smtp.gmail.com with ESMTPSA id k125sm9904882pga.57.2021.01.08.05.28.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Jan 2021 05:28:31 -0800 (PST)
Date: Fri, 8 Jan 2021 18:58:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] mtd: parsers: Add Qcom SMEM parser
Message-ID: <20210108132828.GA28625@work>
References: <X/hVmWrQqLd09/KJ@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/hVmWrQqLd09/KJ@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_082835_452679_19AA1C3F 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Dan,

On Fri, Jan 08, 2021 at 03:52:41PM +0300, Dan Carpenter wrote:
> Hello Manivannan Sadhasivam,
> 
> The patch 803eb124e1a6: "mtd: parsers: Add Qcom SMEM parser" from Jan
> 4, 2021, leads to the following static checker warning:
> 
> 	drivers/mtd/parsers/qcomsmempart.c:109 parse_qcomsmem_part()
> 	warn: passing zero to 'PTR_ERR'
> 
> drivers/mtd/parsers/qcomsmempart.c
>     68          pr_debug("Parsing partition table info from SMEM\n");
>     69          ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
>     70          if (IS_ERR(ptable)) {
> 
> Can "ptable" be NULL here?
> 

No it won't. It will return valid error ptr in failure cases.

Thanks,
Mani

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
