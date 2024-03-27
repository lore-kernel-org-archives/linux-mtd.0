Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109ABC54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKUVy5lW0h4S7waccJ0WJ4W67h7aZXz8NjN4PIbVer4=; b=2w5B1Pzbl52eQ1
	mojEVjTpXwhK6xe5ix7y7SfHrHAZWzSZ9jbfTlvI+ufz/9JbmjpkdYaqJLzLXWgS0g/qv7N2XzrIB
	0QfmscvcNvOq1aXPPLTvQA3e7gqbg7utW8mu88aZrYf0NlXiZO8CgBKvMfde7if9m2U4AyeldZd5X
	+SdEHjTATCwIqhtfMbxeHtXv0L1Dx9Mg71TpRnLtWd8VeF7lM4BOblVS/Rb1q5HyYLHfVUyoL52Iw
	XbA8/vgysu6uof5CHhCYigtT3QquALPktxFpJ9q4pYz6Kl+fu31gjmoyMKpmiQEP7H+gLgBXMGhNg
	jk/OQRHS3Pisl/slmOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWK1-0000000A7U2-1Rtz;
	Wed, 27 Mar 2024 16:40:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWJx-0000000A7TR-17l0
	for linux-mtd@lists.infradead.org;
	Wed, 27 Mar 2024 16:40:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-414925ba716so8567645e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2024 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711557611; x=1712162411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vlQkpxaGQW3p984RRGKWywyzWKD0TWHivq5zfU3FFHY=;
        b=TUFaIBkTIXwJi1nQvdKBb3p9Jj9KtwMeWkeaminQ3YVkSN8j3iPOKmcFWPNKSLa4V2
         U3/TwPHJB9rlik6M4LBiMUpMonE5Ax7npwC7Ep78C7DCGkWyL00h36jfIvM0G+304qS/
         LSFigTX76R3alcR9RRbSoZpHiRTERdwbKQGZ6ztZGLRs6rjsHLT/WAVCJGECxGgaJRVq
         o4E2HIIW3I7x80GT8fK+qAsVfbvBCfGCE+rJwH5hDg+X0SKGPJ/jcMrhKhaxT3sJrmyA
         enpy/GwWjMJU5u0ATlzp5QHc2s26XcBRf/1VWJ92psfnf2Q74J/jDG4ZkOHqeLRi6jT2
         JTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711557611; x=1712162411;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlQkpxaGQW3p984RRGKWywyzWKD0TWHivq5zfU3FFHY=;
        b=DcDiP/xdZiSsHbP41nVps/4yGo+cQV/hvsGBbq8PldC/fjgI0BQa2U4Dl1Wkdo5bo+
         32Hzkc6d7QcQC1Lrkc8LDjP0vUdn0P5CqiEnOvVBuMTnMDExykZTKG3bwMREWAG0UrTK
         jro+aQecO0oVi2TnXsHbh3hVEPHX3tYO8/VjSvMgQ1K2sfaxZJE0Xc9vqhkS1Rp4hu15
         QstNm+NcYktXCcvq8EMg5BwvfHzDMa24j5/dmh10K3NvJUj4wIyDHQ+rmmwE6iGynAgl
         kYxnmV3yfZx+JfW1WCUgO1zhyIjf3jwgLn4xcpf2p4q5czvwuA7WM81tK+Yze4K76ISq
         yOAw==
X-Forwarded-Encrypted: i=1; AJvYcCWkklauhCSq7E6nneq8OLhu6WCZNoUNCQAaFtH9p2UFJV8TnNgQOSPlxy8/2bn4JutebUbPViJta66sg19BTUNof7oeSj0QbbqTDBjnvg==
X-Gm-Message-State: AOJu0YxxHMu2SZMSo66r041IEL78O9TUWahSiTt6dGSPaqSBLmctEytb
	0TrdNaLj40InL0fYGOk/qCAFtEQqH1GBpGCn59Jtpfl4mKc392ghRwLtDTBW
X-Google-Smtp-Source: AGHT+IGlxMmgSl6wOcskjtwSMRobLESUDTi3KLNM9ekBedCGEFAVz8OWGEvAAhpMa74zmpbd08FWtw==
X-Received: by 2002:a05:600c:4ed0:b0:414:8894:213d with SMTP id g16-20020a05600c4ed000b004148894213dmr382271wmq.35.1711557611033;
        Wed, 27 Mar 2024 09:40:11 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-247-253-192.retail.telecomitalia.it. [95.247.253.192])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c191300b00414924f307csm2630583wmq.26.2024.03.27.09.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:40:10 -0700 (PDT)
Message-ID: <66044bea.050a0220.dee16.c250@mx.google.com>
X-Google-Original-Message-ID: <ZgQ5RmS3eWaiVdwB@Ansuel-XPS.>
Date: Wed, 27 Mar 2024 16:20:58 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix broken erase in
 misc_cmd_type in exec_op
References: <20240325103053.24408-1-ansuelsmth@gmail.com>
 <20240326072512.GA8436@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326072512.GA8436@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_094013_336814_55BD69D4 
X-CRM114-Status: GOOD (  25.76  )
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

On Tue, Mar 26, 2024 at 12:55:12PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 25, 2024 at 11:30:47AM +0100, Christian Marangi wrote:
> > misc_cmd_type in exec_op have multiple problems. With commit a82990c8a409
> > ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path") it was
> > reworked and generalized but actually broke the handling of the
> > ERASE_BLOCK command.
> > 
> > Additional logic was added to the erase command cycle without clear
> > explaination causing the erase command to be broken on testing it on
> > a ipq806x nandc.
> > 
> > Fix the erase command by reverting the additional logic and only adding
> > the NAND_DEV0_CFG0 additional call (required for erase command).
> > 
> > Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v2:
> > - Split this and rework commit description and title
> > 
> >  drivers/mtd/nand/raw/qcom_nandc.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> > index b079605c84d3..19d76e345a49 100644
> > --- a/drivers/mtd/nand/raw/qcom_nandc.c
> > +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> > @@ -2830,9 +2830,8 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
> >  	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
> >  
> >  	write_reg_dma(nandc, NAND_FLASH_CMD, instrs, NAND_BAM_NEXT_SGL);
> > -	(q_op.cmd_reg == OP_BLOCK_ERASE) ? write_reg_dma(nandc, NAND_DEV0_CFG0,
> > -	2, NAND_BAM_NEXT_SGL) : read_reg_dma(nandc,
> > -	NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
> > +	if (q_op.cmd_reg == OP_BLOCK_ERASE)
> > +		write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
> 
> So this only avoids the call to, 'read_reg_dma(nandc, NAND_FLASH_STATUS, 1,
> NAND_BAM_NEXT_SGL)' if q_op.cmd_reg != OP_BLOCK_ERASE. But for q_op.cmd_reg ==
> OP_BLOCK_ERASE, the result is the same.
> 
> I'm wondering how it results in fixing the OP_BLOCK_ERASE command.
> 
> Can you share the actual issue that you are seeing? Like error logs etc...
>

Issue is that nandc goes to ADM timeout as soon as a BLOCK_ERASE is
called. BLOCK_ERASE operation match also another operation from MTD
read. (parser also maps to other stuff)

I will be away from the testing board for 7-10 days so I can't provide
logs currently.

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
