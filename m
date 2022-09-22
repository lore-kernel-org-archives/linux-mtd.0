Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5808DC6FA82
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 16:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NM/X51+0LT5Anx5tu3c6fAvjgUx+WkHDRyRojGzlsM4=; b=hM1OrBB7jgfYqM
	1OmZipdD2FFCc04FVGQN/Mf5xzxEw2o3PIv+pFHeTU03c43qgdhU+UJRiT6hJUqA0t36/e0PS/Dxu
	n4cHYF6ZgDIh2rEvn4n6gYfX0xuQZzlc8jdAM0CLmF1GTYCzGalnAVxE1xVwp2OfmJWxn9rT/ibdw
	V8QWG+WCSOAb3CYL41wjCq6SwXn8qPcfTzXLDBWysgIf/kk7zhF221+vSl3luy+hFX8lEPh7KTr2U
	XT0FdPDO1dySOBl3gN/9Rf/cKLkbshbV6bex1CurBu8yIw+LGUb/vX7GyLdRB/tHOQzLN5AWlzqbi
	fmsbDG3iqCXX9l7NbxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obPMG-00Gt2J-86; Thu, 22 Sep 2022 16:47:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obPLx-00GssW-0T
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 16:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663865226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/KVF8wlMIYYYkXZAgHKxBCJz3kD4oYad/vUQV6+HZU4=;
	b=YbiAQbfrwOsyDmJU/BcTBYdPS0msxu3dRTCK8LTJi1/yUoyfq9/xeLpyCMwonmeyEF5ZeY
	WwQaapZOrydj2RmXk0apCg/ANRhgY96ZAR2c4A8C0b9mXJ09+wCezIwhC1s23LSb0j01vG
	tokbiKDb1DYDviMC06P0Md/pHDa9kew=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-253-v6nWV1R-O9ep9CECageTXA-1; Thu, 22 Sep 2022 12:45:19 -0400
X-MC-Unique: v6nWV1R-O9ep9CECageTXA-1
Received: by mail-io1-f70.google.com with SMTP id l84-20020a6b3e57000000b006a3fe90910cso1014603ioa.16
        for <linux-mtd@lists.infradead.org>; Thu, 22 Sep 2022 09:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/KVF8wlMIYYYkXZAgHKxBCJz3kD4oYad/vUQV6+HZU4=;
        b=yXWFMmYpGkNM+fdLe09TeZi/CvAUye4UkflkdUXygAhSPru4OljtwlzHufXNSrghla
         2PZDhNV/ueLysHi4v5BWby7qAF2llmBYgvGFvUmH06S+ISCrk3wdWRS6/t3n7Y9qZVvs
         NEo3ZSI4pgkcYabBhRKA1iOj1Jgy9014+hDKK+6eGhYnnhnniULE4xD/f/yIZcRG2ZBZ
         4uQhRxYRLCmmBi8hJKi+RC8LbVvo28TEJ2D+M+GbEp+4A1GKwf41CueFqVArybMFunC3
         QJDWcanCNEE9angntf/YippGSdk50EIdZY9/BN/UhYI+aHCkgwmjt+eUJLB5xSffd9Jk
         6xQQ==
X-Gm-Message-State: ACrzQf12mrZ7YehsXYGDwnX+hTyTd973hVtovx6ogFah2mLQhtvnwYQp
	2fX0ked1T2SYjh1Oo7ZlPKtpGCpqvDG2pyQs9/4HsY7NV9+0HBBgjSvxTJwUJG+Hhwo+sZpi44K
	abHVBuY+bOVYd3V9FkW4aVJUaEg==
X-Received: by 2002:a05:6638:3586:b0:35a:92b3:c0fa with SMTP id v6-20020a056638358600b0035a92b3c0famr2542160jal.229.1663865118483;
        Thu, 22 Sep 2022 09:45:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7fMJGOpdEzGJe0UAsf1lKQrOriH9U23fP8LlL9MxhYnH0f3BvMy2NnMsWwB+KVRRMOlLisgg==
X-Received: by 2002:a05:6638:3586:b0:35a:92b3:c0fa with SMTP id v6-20020a056638358600b0035a92b3c0famr2542149jal.229.1663865118144;
        Thu, 22 Sep 2022 09:45:18 -0700 (PDT)
Received: from x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id c43-20020a023f6b000000b0034a036a9a1fsm2419534jaf.48.2022.09.22.09.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 09:45:17 -0700 (PDT)
Date: Thu, 22 Sep 2022 12:45:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: Boot fail with UBIFS_FS=y on Qualcomm msm8974/msm8226
Message-ID: <YyyRHPNhGzknCPAY@x1>
References: <2845511.e9J7NaK4W3@g550jk>
MIME-Version: 1.0
In-Reply-To: <2845511.e9J7NaK4W3@g550jk>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_094709_163168_FEC0210F 
X-CRM114-Status: GOOD (  21.79  )
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

On Thu, Sep 22, 2022 at 05:55:51PM +0200, Luca Weiss wrote:
> sometime last year (June 2021?) I first noticed that with arm32 qcom_defconfig 
> under some circumstances I get weird boot failures on msm8974-fairphone-fp2, 
> and lately also seeing similar with apq8026-lg-lenok.
> 
> In short, with CONFIG_UBIFS_FS=y there's nothing from serial console, nothing 
> from earlycon, just nothing on serial at all. As soon as I disable this config 
> option and rebuild it boots up fine again.
> 
> At some point I also got this from fp2 logs, after I changed something in the 
> boot procedure (maybe fastboot boot instead of fastboot flash? I don't recall)
> 
> > Error: invalid dtb and unrecognized/unsupported machine ID
> >   r1=0x00000000, r2=0x00000000
> > Available machine support:
> > 
> > ID (hex)        NAME
> > ffffffff        Generic DT based system
> > 
> > Please check your kernel config and/or bootloader.
> 
> With CONFIG_UBIFS_FS=m and loading the module at runtime seems to work fine (at 
> least nothing visibly broke) although I didn't try mounting anything with that 
> file system.
> 
> Does anyone maybe have an idea what might cause this and/or how to debug this? 
> While just disabling UBIFS_FS in my config solves the issue I feel like this 
> should be resolved, because I also sometimes forget that I have to disable 
> this from qcom_defconfig and then wonder why my boards aren't booting.

Hey Luca,

I encountered a similar type of issue when I worked on the Nexus 5
phone. It's been awhile but from what I recall the issue was that the
generated Android boot image was too big, and it could cause the
"invalid dtb" error since the DTB is appended to the end of the kernel.
I have in my notes that I worked around the issue by enabling
CONFIG_MEDIA_SUPPORT_FILTER. Or you could just trying disabling
CONFIG_MEDIA_SUPPORT.

Brian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
