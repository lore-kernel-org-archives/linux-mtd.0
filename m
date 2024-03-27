Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B841CC47DD9
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 14:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2b0ffo4jAbRUgnxualyurTL4mMqKRPYur6+IyZ06Qc=; b=B/NeQ8VJFPoCZ2
	HcI5iQXJLOy84JaWjddxGZv+PsAKy4EAAldV1drUU1DYt5/BMPtpbmOXDHQILPtXXr67+3Ne9zrHV
	hpCadUG/s1Ji/VajCsM1Keg/5s5l9IVg6CyodNmoKzE4G1q73guzfSennNSjy+CoCc6q34kiwLqoa
	UIr+Yh6nVLdiTPrW3lQTIjzP9Yq4RE+T2tNO1N6iKN9OrEeoSfthxTOdLLEsh4e1dS/f18ufJPG9G
	k+PqIsq1HkMz6eGYp5p5xScYlaBDdaqkN5LS3uZNPrxtGGeHyhSrepgeXD1SYZG/QhgDon9CQcjW6
	EH2FDqSgfQg0NK4WTpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUTZ-00000009YDK-18zU;
	Wed, 27 Mar 2024 14:42:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUTW-00000009Y9e-0tE6
	for linux-mtd@lists.infradead.org;
	Wed, 27 Mar 2024 14:41:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33fd12a06fdso4916451f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2024 07:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711550511; x=1712155311; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OUrGaFOTm3HIgbVg/3+q83JkWLVUBaXqcSW9xQP09cY=;
        b=I4JMcs2gTLVyIVqlHxTeg7injRpbXPP7Xzh+AqC0L9EgtxGrC14db6yf8coW+jeRkJ
         iP4LNv4KGlVihD/YetLxCldrULBcIUPLKbLeopySC87wpQvPBM6wEF87lud3sX+ozsfn
         2e+B/sYFcWsDo0HuyEupwnBTevFyI4jPQDWs2iV+aaIJ+UiDhK60OpuhDw2vZNTizpQx
         WTXfLy3iHCYgxzD0YLLtgioIVm29mhEbMh2TTWWyhzKedr2kC9zuspiSL6bQVT+8Y5kM
         0A6Lf7F3WeBgCz5VPr9GTvzpk+ySHGDeI54AOrmg20a88uoN7E1N7O1SRZ1ihpmm0bmC
         /Bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550511; x=1712155311;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUrGaFOTm3HIgbVg/3+q83JkWLVUBaXqcSW9xQP09cY=;
        b=wV7Bnx4VQJmXmLbwRshlNeidahJI3RlFrPDzyP3gy3kAoibKbGBfrvHhjAwN18nKz3
         MtGaTmKGenxm29xzf/Y4q8aA1GOhx676rkKKrcbuMdLNimZPtqK+X4/tGQs29kkdhVqI
         w1bIs+o3VhM8iCZeTv2vOhF1A3QayOo3Q5Hj/ZG2a7P7piK1htax2u+aSUzXcyV0+gDg
         PcfPd/Za41av9nuPBujWv0sTLI7OP9T5jLhhmETEcG/vdMZfPJvyyv3OZ0bAySO5mjD9
         kqFFyfRQ6nXPEYNCZw8RVsh+77XtELp7T+XSE9/snIAOASK+8LRch05dVRfjY/71jqwv
         QhIw==
X-Forwarded-Encrypted: i=1; AJvYcCXQzsSLGFNraZHHuaXP54WinkwOwdOgVeSNY8PwlZVmqaWBx3a3AUB1frwHluPoF7SRmgm5mww1p2hqvRdF4CUyyuSj7XZN8fFK20Vo8A==
X-Gm-Message-State: AOJu0YxOMvSVfSNgWxBfA7c2eFjuM7x157+Oea/CM433uZ0BFH52lUMA
	hxQbz9NYDX1F9RwVqmp+l149jq/Oop6/BmziG62DjIkW0N3WBp2y
X-Google-Smtp-Source: AGHT+IH3hhBbBOaJyytCArqO8u63fzWZ9+iCxdRQaBCRR2VKg2JV+sT8K3SotUOm+F1TlR488dD7JA==
X-Received: by 2002:adf:b31c:0:b0:341:bf39:9f8 with SMTP id j28-20020adfb31c000000b00341bf3909f8mr139952wrd.6.1711550511199;
        Wed, 27 Mar 2024 07:41:51 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-247-253-192.retail.telecomitalia.it. [95.247.253.192])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d5910000000b003418364032asm15087444wrd.112.2024.03.27.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:41:50 -0700 (PDT)
Message-ID: <6604302e.5d0a0220.bdb64.4077@mx.google.com>
X-Google-Original-Message-ID: <ZgQwK7kh_MUDUbQb@Ansuel-XPS.>
Date: Wed, 27 Mar 2024 15:41:47 +0100
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
 <20240326073947.GA9565@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326073947.GA9565@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_074158_277554_5E2A8904 
X-CRM114-Status: GOOD (  28.67  )
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

On Tue, Mar 26, 2024 at 01:09:47PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Mar 26, 2024 at 12:55:19PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Mar 25, 2024 at 11:30:47AM +0100, Christian Marangi wrote:
> > > misc_cmd_type in exec_op have multiple problems. With commit a82990c8a409
> > > ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path") it was
> > > reworked and generalized but actually broke the handling of the
> > > ERASE_BLOCK command.
> > > 
> > > Additional logic was added to the erase command cycle without clear
> > > explaination causing the erase command to be broken on testing it on
> > > a ipq806x nandc.
> > > 
> > > Fix the erase command by reverting the additional logic and only adding
> > > the NAND_DEV0_CFG0 additional call (required for erase command).
> > > 
> > > Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > > Changes v2:
> > > - Split this and rework commit description and title
> > > 
> > >  drivers/mtd/nand/raw/qcom_nandc.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> > > index b079605c84d3..19d76e345a49 100644
> > > --- a/drivers/mtd/nand/raw/qcom_nandc.c
> > > +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> > > @@ -2830,9 +2830,8 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
> > >  	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
> > >  
> > >  	write_reg_dma(nandc, NAND_FLASH_CMD, instrs, NAND_BAM_NEXT_SGL);
> > > -	(q_op.cmd_reg == OP_BLOCK_ERASE) ? write_reg_dma(nandc, NAND_DEV0_CFG0,
> > > -	2, NAND_BAM_NEXT_SGL) : read_reg_dma(nandc,
> > > -	NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
> > > +	if (q_op.cmd_reg == OP_BLOCK_ERASE)
> > > +		write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
> > 
> > So this only avoids the call to, 'read_reg_dma(nandc, NAND_FLASH_STATUS, 1,
> > NAND_BAM_NEXT_SGL)' if q_op.cmd_reg != OP_BLOCK_ERASE. But for q_op.cmd_reg ==
> > OP_BLOCK_ERASE, the result is the same.
> > 
> > I'm wondering how it results in fixing the OP_BLOCK_ERASE command.
> > 
> 
> Perhaps you are trying to fix the OP_RESET_DEVICE command altogether?
>

Well with this only patch correct working of nandc on ipq806x is
restored. I'm still very confused how since the misc command currently
works only with the PROGRAM_PAGE and the BLOCK_ERASE (from ERASE1 and
ERASE2)

Still the extra read was added with no explaination and I couldn't find
this command cycle in any of the previous legacy function and the one
introduced after the parser rework.

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
