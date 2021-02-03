Return-Path: <SRS0=LI9S=HF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED70C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 11:42:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A85564DF2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 11:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A85564DF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hk7XRUxl0QyRXx79nHXek9I6F41Ky7tg+qvD05+aF60=; b=cYeFiLBvmZWUnousUEsXFoJhC
	zmp9sANc57R1+5nzloUh3McNFIdVr/b5Jt5ojMUFhvNr2d8ycwEPKnSLrJPTMilD36GXzzl1/SMx2
	CXShDWuxu2Z0PUqho03+jVM+odn8foqxl/KhHlZj9K8qg2oN1rCgncFQXdVevPdQRIKYPtCP0FCYi
	QfqiXR0beNU1JFeHk7H0QVjSLpMLciM/RzgXZoBJMwfVsBiPElr3Oz/JQY8urfjUY1e8r5ZaCnUuy
	XYhjwaoybqjx45lcb2yTlZDqCYLQsHBuv1RPHQQHPbVcEtFNSdLrNY38qSvhLLcMgKRrEOhs8m2UN
	b38zuEo6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7GXb-00054C-Ol; Wed, 03 Feb 2021 11:41:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7GXY-000536-Np
 for linux-mtd@lists.infradead.org; Wed, 03 Feb 2021 11:41:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id d2so4385128pjs.4
 for <linux-mtd@lists.infradead.org>; Wed, 03 Feb 2021 03:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=xR+OMVMVw++6jzb5vqbvGP1RTGBmrEmYExItlXvFh2U=;
 b=Rbdvs9Zl6hyvnUKBtlfOpgCIYmM0pbLg3sBeEC2y9cEMSP2JlqLsPByuxUCLYS1n72
 8pfB5ZGTSuEr/2aouUet362g5g87lB3Ajlcygs6HkvCQQ22niJXJgzL0gsgSwImZJ4f0
 k/rJomkLXBvgGxb6j9DNJRjFEoEHfhCTm5naXiGe0elWS+iMi8hIJ/5+0NtCCqScbSYw
 68YR4CWQ4O74Hs5gQEhNy5lc2+l3XDHrO6QIOC+jWHbM+v0f21GOAsYY5cU1NHBSl3jE
 aia3///KJOa/2jKr2e4xZ15XAIsPZe9ldy8zNg0aKxAjs7b8Ta+vSjRqf2+QRnGGoVrX
 O3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=xR+OMVMVw++6jzb5vqbvGP1RTGBmrEmYExItlXvFh2U=;
 b=aLkXAh2iHuC4u96uQviPSUplfqmUSNrhJxaUhSkcrSmrJDOpLJMzhZLSgiJNBA5NhS
 j95e9CHNmonsLZWYwUby1jx7yLrRX7/Dt2PvLU43sJCDelULlfJumcdJzWBIKp9aDVbW
 ViFGvitxPc1vcEr7+gcoNztTnAAko5dJnIjzGtngAerThchai79BzvBzCKua2BTXTOXP
 SlVRO4yybf2pGxcFxPvMVlbBuPFUXFUytEAQgMxC0ZJnU+P7nxYH/8zN3zjcQouGVM2P
 DG84NpwxZRoiokkl3bp5O8ysvFltP5yzxgwlRFc5YTrrwd2yMC3QDLU2PO6g0jTwuEGI
 KPnw==
X-Gm-Message-State: AOAM532eo/B/RgR0BKgpcDztpxfYVk7tSdFa6wn6f53sgyrRgLjTWzww
 CmAMuRiaPe34akawI2D4PhDO8mO0YWr+
X-Google-Smtp-Source: ABdhPJzrZ6goS6KBHLSdJBCgFpo9ChXrhawqr5yJjo9iJQnx4TN+DQTMIZG9p5QgkpONT3OYlpQWnQ==
X-Received: by 2002:a17:90a:b702:: with SMTP id
 l2mr2820197pjr.13.1612352502679; 
 Wed, 03 Feb 2021 03:41:42 -0800 (PST)
Received: from ?IPv6:2409:4072:619f:ff99:700b:51f3:e28:b00?
 ([2409:4072:619f:ff99:700b:51f3:e28:b00])
 by smtp.gmail.com with ESMTPSA id 199sm2096001pfc.112.2021.02.03.03.41.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 03:41:41 -0800 (PST)
Date: Wed, 03 Feb 2021 17:11:31 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20210203122422.6963b0ed@collabora.com>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
 <20210201151824.5a9dca4a@xps13> <20210202041614.GA840@work>
 <20210202091459.0c41a769@xps13>
 <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
 <20210203110522.12f2b326@xps13>
 <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
 <20210203111914.1c2f68f6@collabora.com>
 <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
 <20210203122422.6963b0ed@collabora.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
To: Boris Brezillon <boris.brezillon@collabora.com>,richard@nod.at
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <F55F9D7B-0542-448E-A711-D1035E467ACA@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_064144_795199_F9AD4C77 
X-CRM114-Status: GOOD (  15.57  )
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
Cc: vigneshr@ti.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3 February 2021 4:54:22 PM IST, Boris Brezillon <boris.brezillon@collabora.com> wrote:
>On Wed, 03 Feb 2021 16:22:42 +0530
>Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
>
>> On 3 February 2021 3:49:14 PM IST, Boris Brezillon
><boris.brezillon@collabora.com> wrote:
>> >On Wed, 03 Feb 2021 15:42:02 +0530
>> >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
>> >  
>> >> >> 
>> >> >> I got more information from the vendor, Telit. The access to
>the  
>> >3rd    
>> >> >partition is protected by Trustzone and any access in non
>privileged
>> >> >mode (where Linux kernel runs) causes kernel panic and the device
>> >> >reboots.   
>> >
>> >Out of curiosity, is it a per-CS-line thing or is this section
>> >protected on all CS?
>> >  
>> 
>> Sorry, I didn't get your question. 
>
>The qcom controller can handle several chips, each connected through a
>different CS (chip-select) line, right? I'm wondering if the firmware
>running in secure mode has the ability to block access for a specific
>CS line or if all CS lines have the same constraint. That will impact
>the way you describe it in your DT (in one case the secure-region
>property should be under the controller node, in the other case it
>should be under the NAND chip node).

Right. I believe the implementation is common to all NAND chips so the property should be in the controller node. 

Thanks, 
Mani

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
