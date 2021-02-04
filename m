Return-Path: <SRS0=OCz7=HG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEA3C433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 08:53:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA7064D9D
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 08:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA7064D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mboHYYFQu3X6yBmv3eW+LhZx2Cq3g7yUnhyN19zYNbc=; b=Eu5LcyahboXzCKGTE+Znbjsep
	ygy64qMFECZMicqmLa/GdLGV9JxGAPj5G/+O4qIZeU9sv/iBlMsGQ/qZlsvhDKF3E9chd2Qv4J21k
	shDSY7nYeCtRXH3qlxkfYdbPghZuhDPYpQFT1qMSW5qDTeVCiHnFpIO5sYnb8D9GaHCynqRfHWezO
	c4h+e5wsWqg4t9KXscq/eNOKrSLk3bkjstopNbzaByaFurnNBU0nL7qbNz3VjHmo36etWNeDeat4F
	Gn+T7VrOQla9C3ndONgY593g1DZLfKdJCnZ+uKyabw+6SwoW1snZGcUTkaRyunOthw4FV2uVcso2X
	TCIAXbdtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7aNP-0005WJ-ID; Thu, 04 Feb 2021 08:52:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7aNM-0005VM-Kj
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2021 08:52:33 +0000
Received: by mail-pl1-x62a.google.com with SMTP id g3so1408139plp.2
 for <linux-mtd@lists.infradead.org>; Thu, 04 Feb 2021 00:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3GYc3j0LV6uWWeY9tuYUCxyV+hFD6RVupRGibO/7f98=;
 b=LU9+t/+6TpnqCyJxyc5la5O0NK5DxLuzM20lcBxz3KoUXOFtQWBOhjAxqOnFVJkYmN
 Sos2ltry4CR1JQXRQW5+8O/RdCKzotTxq02FqCNEusjCkhWDIgiNuWiNTOBsXDn5o1vR
 XaA0PGHtDR4WoiQoE5DLS4UW4SuWqbyx4pb+n9vtPyibKFZE5sd8ElCXrM844vetV64M
 2QPmwVpHzHQqNcIBl7mY7V5p9sfch8UDQogFW8VgSZVXCLey8IejjxIf9g8QIfKWIFqg
 he0p3DSGOjjmM4u37MBY6w1uk74723A0/+4ME9qwZ7Ga87YSz7ELn3dYqFoCxu5uU1Gd
 pXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3GYc3j0LV6uWWeY9tuYUCxyV+hFD6RVupRGibO/7f98=;
 b=Mn4yIIYSn+oX1P0u2ZrQAnFBAvenL7hjcS7U7ay8uaR1bjMDU6rMFtOBDeB6V55JU6
 Of03UAoF5gHXPngFctmkBv2RDADddk8XO59muiwystNC6RVYNfqr54S3dDXAEQrRkWXn
 d18Hbk5ZZP+gA1vkFhjXVB4dCAd0PaYPX0NB/ozHaW0mljZSSk5y1DqjmX47JY7eUaLF
 Kb3BKFo9SKPwVeTTSR8sfVXmWqyXKKDtoUy23BpBviI4PSfejincURiWdFigvxqlZf6d
 N4qJMV7NsnWMPZWHmsBF4ZQGEKZDj6/hMhqU37Va1SO38tM7//xgnnZkfNBhLYxoSqZE
 wQAQ==
X-Gm-Message-State: AOAM530TPOLFzObVZLIgBbqoZpm5ysdBoYEWrnohZDysQjtzvOrl3mN9
 1S5DTeLR13dkxj/0y8KPWL9h
X-Google-Smtp-Source: ABdhPJwFRfv+E9t3nw8/umSWCNIlyd5aUrs4h9KN7me07HwrpyiQgKNxbD0cp5qXBcb73+tmScx2xw==
X-Received: by 2002:a17:90a:5a86:: with SMTP id
 n6mr7711124pji.65.1612428750089; 
 Thu, 04 Feb 2021 00:52:30 -0800 (PST)
Received: from thinkpad ([2409:4072:502:e1e4:2c42:3883:f540:5b9c])
 by smtp.gmail.com with ESMTPSA id y26sm5604528pgk.42.2021.02.04.00.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 00:52:29 -0800 (PST)
Date: Thu, 4 Feb 2021 14:22:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210204085221.GB8235@thinkpad>
References: <20210202041614.GA840@work> <20210202091459.0c41a769@xps13>
 <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
 <20210203110522.12f2b326@xps13>
 <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
 <20210203111914.1c2f68f6@collabora.com>
 <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
 <20210203122422.6963b0ed@collabora.com>
 <F55F9D7B-0542-448E-A711-D1035E467ACA@linaro.org>
 <20210204091336.1406ca3b@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204091336.1406ca3b@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_035232_824746_959ED068 
X-CRM114-Status: GOOD (  22.15  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 04, 2021 at 09:13:36AM +0100, Miquel Raynal wrote:
> Hi Manivannan,
> 
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Wed,
> 03 Feb 2021 17:11:31 +0530:
> 
> > On 3 February 2021 4:54:22 PM IST, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > >On Wed, 03 Feb 2021 16:22:42 +0530
> > >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > >  
> > >> On 3 February 2021 3:49:14 PM IST, Boris Brezillon  
> > ><boris.brezillon@collabora.com> wrote:  
> > >> >On Wed, 03 Feb 2021 15:42:02 +0530
> > >> >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > >> >    
> > >> >> >> 
> > >> >> >> I got more information from the vendor, Telit. The access to  
> > >the    
> > >> >3rd      
> > >> >> >partition is protected by Trustzone and any access in non  
> > >privileged  
> > >> >> >mode (where Linux kernel runs) causes kernel panic and the device
> > >> >> >reboots.     
> > >> >
> > >> >Out of curiosity, is it a per-CS-line thing or is this section
> > >> >protected on all CS?
> > >> >    
> > >> 
> > >> Sorry, I didn't get your question.   
> > >
> > >The qcom controller can handle several chips, each connected through a
> > >different CS (chip-select) line, right? I'm wondering if the firmware
> > >running in secure mode has the ability to block access for a specific
> > >CS line or if all CS lines have the same constraint. That will impact
> > >the way you describe it in your DT (in one case the secure-region
> > >property should be under the controller node, in the other case it
> > >should be under the NAND chip node).  
> > 
> > Right. I believe the implementation is common to all NAND chips so the property should be in the controller node. 
> 
> Looks weird: do you mean that each of the chips will have a secure area?

I way I said is, the "secure-region" property will be present in the controller
node and not in the NAND chip node since this is not related to the device
functionality.

But for referencing the NAND device, the property can have the phandle as below:

secure-region = <&nand0 0xffff>;

Thanks,
Mani

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
