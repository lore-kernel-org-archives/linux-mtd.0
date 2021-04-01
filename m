Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81460C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 16:04:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1822061366
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 16:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1822061366
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+ovV8iHWaR6HzVbeLTMhvXR/SDetiO4zZNpijVVDLVs=; b=VJywXIfAIKr7kktAY6515VI8h
	wQs+NXPMoGnjyd8NAQxBxq3JkdMbIPfIfk4IvJWxS9QLP3qGAbMischNq/Q2GCuSe5hVeagIR2m6L
	HioATPHVgb+1H+J9V34AkhJNULdN8BICb7MBaR2rLaXVrlsPv9Xkqgxkp4/aLyTpTVGCL4PtGahRx
	957rOZDFssDVu0X2JiGwzdJtlgodV0kjuQajsVAFwJJO3gqHjfg0ohPLAsYMfo9GrkanQUcUKsNe4
	dBIByC3exou8T/q9xv+05QQNzRNRUeS7TwfJeYoBG3NZ+bIF4WXxtaPs4BVYnE2h/AkMsziL4lcgr
	1GoO3NT8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRznZ-00A9DK-P8; Thu, 01 Apr 2021 16:03:57 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzaz-00A5SU-5y
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 15:51:41 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 45ACE1F4687C;
 Thu,  1 Apr 2021 16:50:55 +0100 (BST)
Date: Thu, 1 Apr 2021 17:50:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v8 3/3] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210401175052.1ff2bad2@collabora.com>
In-Reply-To: <20210401101812.GE14052@work>
References: <20210323073930.89754-1-manivannan.sadhasivam@linaro.org>
 <20210323073930.89754-4-manivannan.sadhasivam@linaro.org>
 <20210323175715.38b4740a@xps13> <20210401101812.GE14052@work>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_165057_919041_E7617801 
X-CRM114-Status: GOOD (  11.45  )
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

On Thu, 1 Apr 2021 15:48:12 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

>  static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
>  {
> +       struct mtd_info *mtd = nand_to_mtd(chip);
> +       int last_page = ((mtd->erasesize - mtd->writesize) >>
> +                        chip->page_shift) & chip->pagemask;
>         int ret;
>  
>         if (chip->options & NAND_NO_BBM_QUIRK)
>                 return 0;
>  
>         /* Check if the region is secured */
> -       ret = nand_check_secure_region(chip, ofs, 0);
> +       ret = nand_check_secure_region(chip, ofs, last_page);

or just:

	ret = nand_check_secure_region(chip, ofs, mtd->erasesize);


>         if (ret)
>                 return ret;
> 
> > 		*/
> > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
