Return-Path: <SRS0=argm=FP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67960C4361B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 03:12:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F40D23E51
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 03:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F40D23E51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QuX09TJaYjmMsrP1OXj1NN8r1Be8vPw19PXReh+Gha4=; b=ttbNZMN29lI+I0uhvasLbyynq
	hSQGseCVlTF1K/yUa8CgbSPQe5Ba0jblU3Gn4JUuVQluWzMzP0QCEd3Q3i9AbtlsjnFFc9TZTasPE
	8g1t/gO7ZK2iaK8xHf5CunwBYw8yuJbfxSEUO7LHzgrVgEr9phWaSNHsXjsZ47oKsuBzqTf3WwyKW
	wQ9q9+JMAHBZ2UUCE4mR55b/cUV7b8zyGL/9U4iqHMHU/pGYY7MYJqGDLrt4TWtaPhM0lSc7xf1E+
	p/9z0Kb/A4CUWVz8d4JS3k2KWeUEtlvTRCGQiN2NylqxTongRbdGll5oyW5hH/ObeoFEX9jAmHhDj
	6+8rc4vYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knYpZ-0001HA-HN; Fri, 11 Dec 2020 03:10:53 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knYpX-0001GH-F3
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2020 03:10:52 +0000
Received: by mail-oi1-f195.google.com with SMTP id q25so8291540oij.10
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2020 19:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tu067TpaB9PCMyvvrsvX5fcmi9Ir5wjw+1Sw+k4PlDM=;
 b=PAWfNBOwQvzGe8+fuPfKsBUbb3B/lwbGXh/PbQGur65+v61m9NNF1+cDWrLLw7LhCf
 co+PicPQtH5gSIgpSdLtMXkxefX1stWbdr5vpw+LiMdvQl4/K+5zlTUH4SETZjPBlAbG
 vmWTKVivYBP3tPkFZaXBJ1ov4ZUAMx7HsNzkCWJp376bfXqP0hVsvBAKYx96wSJPc1C2
 28MbeSYSZAB8Lz3DyT+YwfS8ZkV4gNGWvq96Artohwww15l1tVA/OTeM+ql8YUgxapNl
 rbsRW6s7kFVNLCVwLJk4uYBzgGcZXd8p8EWUCLQjXW4/Vyl2DtGvy7NPvhqiSCtYixXl
 OSeQ==
X-Gm-Message-State: AOAM531O2eYHWXzMJxmhdFCn5j+yQkxQMWZz6GuQKe84sFEmt38IqGM2
 jG2agMnngkZQY+s3o3AaIQ==
X-Google-Smtp-Source: ABdhPJz404yyWZCLnZ4Y4Y4ugQeU+Af7ANyg/ZU7p0kKnrLfiv+qFcECo4jhUAQPk7gqzbgT8JDXyA==
X-Received: by 2002:aca:470e:: with SMTP id u14mr7602980oia.172.1607656250804; 
 Thu, 10 Dec 2020 19:10:50 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 109sm1565698otj.12.2020.12.10.19.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:10:49 -0800 (PST)
Received: (nullmailer pid 3553226 invoked by uid 1000);
 Fri, 11 Dec 2020 03:10:48 -0000
Date: Thu, 10 Dec 2020 21:10:48 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 0/4] Add support for Qcom SMEM based NAND parser
Message-ID: <20201211031048.GA3552046@robh.at.kernel.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
 <20201210040942.GD6466@thinkpad> <20201210222447.63f5dbcf@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210222447.63f5dbcf@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_221051_557267_0B1A32C4 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 10:24:47PM +0100, Miquel Raynal wrote:
> Hi Manivannan,
> 
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Thu,
> 10 Dec 2020 09:39:42 +0530:
> 
> > Hi,
> > 
> > On Thu, Nov 19, 2020 at 12:43:04PM +0530, Manivannan Sadhasivam wrote:
> > > Hello,
> > > 
> > > This series adds support for parsing the partitions defined in Shared
> > > Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
> > > Current parser only supports V3 and V4 of the partition tables.
> > > 
> > > This series has been tested on SDX55 MTP board which has an onboard NAND
> > > device.
> > >   
> > 
> > Any update on this series?
> 
> Patches lgtm, I think Rob's Ack is still missing, let's wait for his
> review.

Perhaps answer my reply on Dec 7.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
