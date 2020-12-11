Return-Path: <SRS0=argm=FP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DBCC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 03:37:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A0E23E55
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 03:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A0E23E55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oSlMd8/Qqjf/jYvYneqWpYMEEZtsEGOj5TkFRIi3v6I=; b=p/eHUhiZm6uV/EPADF0ULt4Nx
	1oDGOaEhhJw+J5own8qYUg9ThBmwo+q+X59hrAVYpMmYi8h1703vovrnmzLunTCAdsJAtA1f0wim3
	7T4RiZV6coKp5OIBeaGMS44VIk/9ByVoStA6lVCrQpha6NOnXge5jH9A/fneLE8mHJPcH06d6d41T
	C7SqSuN7UqkoVUBUMajr6QgX8zF7UvYrfiKFjBKxWD2fORJD7FHonx0hEtOP9sRqQRrwGZiwofdjK
	HQYckK0+lt2ibFYFg8kI+75w8a2+gQBWpOPYk+Dm7r66k+7JHEWgIl00L5zWxh765mkw1wMilj+Le
	yzSxjgvAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZEk-0005yc-U8; Fri, 11 Dec 2020 03:36:54 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZEi-0005wu-Gw
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2020 03:36:53 +0000
Received: by mail-pg1-x544.google.com with SMTP id c12so5749571pgm.4
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2020 19:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0kXG097tjTZOeXf28qBfkphbrgBF+6yR+K3YV68E8e4=;
 b=Sx4a1EREH3oE+dvkx0O1/Zb5T5N3E94woXcu1YfbISqOfqiF88E7RKpzEiz3DOxRYG
 nJmJtJGx9CcsmpewVZg5vk8hH3m218mUoCCHLMRHr1iiLx5rlIpWAT1YM22rNf54nSxW
 tKxEv1Rn64m9v2knpvmhJab/yKSEPtTWmkJwSPq8gysqid4+8shWlC1cnxYD2jY2vJcZ
 rdzKHx20ZAqhkx8AfgY9uAys3y2KwsCpQXx2Kn5hrxY3CiTb6TjkWVo1NFjBDtSwT1JG
 o4sQRl+f7puM7UuCFsbke9zyM5D3RemUg68fu/83s3dLykJWkeSbesdmSGnHgEicaBUJ
 aXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0kXG097tjTZOeXf28qBfkphbrgBF+6yR+K3YV68E8e4=;
 b=HIEUI7pw1im9t5Cfht1H2+BpHGW4z3/NxrPmZkoOaeSuW+RY9i26FGQDIr+maTeudC
 ZbtqJwRgaQAPj5EgLls8Kk+GatpEFtuCxOfAoL08Yhq18jwbkQyG4uim/WG2gldbAKer
 LO6Uf12ONtvZtvHXmdJP4+JTYULnRzFsunfFmferrQpT3R80anfwwPPN4mxC1CTe9d+C
 NHL2Z0GAKDuS+QDQefd3IxlfdMZkE7KpUs1L88hPI7tPxfdNRnmMM6QyZekpMznqQffF
 xP1RLvDOCf/QqciMEJCMQwNBV/abdQKEEcDmHqV/F2I514oCFg4FSy2uKw+wWMm6+Ujn
 JOSg==
X-Gm-Message-State: AOAM533SErDf1KMmsbjFqsw6enCueW5gmzBvXxLu6CcNsmhsRnsR77Pl
 iqWgxlsz3MRkluuIY8Ebr77R
X-Google-Smtp-Source: ABdhPJyypndPLLXiivE66gKjwk0SbMbdFhGFl9Dz8GZ9VdGE006UX6d4yjE1u9cfmH1LymD6X98AhQ==
X-Received: by 2002:a62:7857:0:b029:19d:fe6a:3069 with SMTP id
 t84-20020a6278570000b029019dfe6a3069mr9745917pfc.3.1607657808979; 
 Thu, 10 Dec 2020 19:36:48 -0800 (PST)
Received: from work ([103.59.133.81])
 by smtp.gmail.com with ESMTPSA id l23sm7846056pgm.22.2020.12.10.19.36.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Dec 2020 19:36:48 -0800 (PST)
Date: Fri, 11 Dec 2020 09:06:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/4] Add support for Qcom SMEM based NAND parser
Message-ID: <20201211033642.GB4222@work>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
 <20201210040942.GD6466@thinkpad> <20201210222447.63f5dbcf@xps13>
 <20201211031048.GA3552046@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211031048.GA3552046@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_223652_616782_359BE407 
X-CRM114-Status: GOOD (  19.12  )
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
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 09:10:48PM -0600, Rob Herring wrote:
> On Thu, Dec 10, 2020 at 10:24:47PM +0100, Miquel Raynal wrote:
> > Hi Manivannan,
> > 
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Thu,
> > 10 Dec 2020 09:39:42 +0530:
> > 
> > > Hi,
> > > 
> > > On Thu, Nov 19, 2020 at 12:43:04PM +0530, Manivannan Sadhasivam wrote:
> > > > Hello,
> > > > 
> > > > This series adds support for parsing the partitions defined in Shared
> > > > Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
> > > > Current parser only supports V3 and V4 of the partition tables.
> > > > 
> > > > This series has been tested on SDX55 MTP board which has an onboard NAND
> > > > device.
> > > >   
> > > 
> > > Any update on this series?
> > 
> > Patches lgtm, I think Rob's Ack is still missing, let's wait for his
> > review.
> 
> Perhaps answer my reply on Dec 7.
> 

Sorry missed that... Just replied.

Thanks,
Mani

> Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
