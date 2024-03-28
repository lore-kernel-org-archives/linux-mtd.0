Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCADC54E64
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5z1ZePk+9C3WvwxuY1wZc74scw8z7Lf6E0yNqa6Em4w=; b=rF+UxZUJXwHjO6
	c9RAs+C7I3RyaJiOMoGmxEjsu05fkC1F0FUcBXrseB/ceIDi8N+zqQLKpnAzAL7LspXfv5kQrJvym
	tsbYsRs2UdUyEOSz2taxg8kP88OtgKyRQHWCMiuOvaf0qKJymxddZRgdybiRe2iagAUFwIgWxDzKH
	f1ohdsxUDI6L6PArGfJb3CqYZjkhYmlR65rI2JX51vOgD7YBs0I6NBGmPC/3KzDSb4GIuGrRfkiJV
	T8JAKjTqoEZD7lVD5bde/SI4/IMUdcn3UVK/dFog/qhEhdir5wp7V5WwmndJSJkDoWg1Uekn6+J2M
	Fodl21hHQhUAV7MZnD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqeI-0000000EJPR-12tF;
	Thu, 28 Mar 2024 14:22:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqeF-0000000EJNq-1RtC
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 14:22:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-415482308f8so3053335e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2024 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711635748; x=1712240548; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5PrHKcuusjOlgc0C0gsGNU0F2oRgSATsr5DXKh5NEGQ=;
        b=Uxevse8CxYukqzROk7+I6KEmRy+Ct5hKXbFH9pLGvDL/JJaNsnK9w71VI1gSX7NKIL
         i6dV1aEsax45kelxGXp3PaNdW8iUJO/RhW3S/Sv2Hw5FSkuzPgPQXQjOhW3azecUZzhV
         tQCPwonUUZKojAUca+JyY6dsugDZSRQQxuju8rNNa8lYKDuuMFutmhnPbT3u0LiKhOPV
         qdDHKQjCxNj2L3JGc6pbDB0vJQjwKDWyX8PItP3YA6Etj6YySCuMGyTUGt7JCVD6vzUK
         U4Gicyko3hDmSJp0n2mMuWGn8RZ7Ns6FOoIZ9l5cTQHxo/Oi6yjtYEYJnrx4qgbuVQwT
         RytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711635748; x=1712240548;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PrHKcuusjOlgc0C0gsGNU0F2oRgSATsr5DXKh5NEGQ=;
        b=s60Og8AUZAHVuDx2maLGHcDvRuILI7bkkYXe5HHNcM0JoLDm8OUtmnV0ZOZlcAc+Ri
         K7QosfdRCY4w6mRPgJNftjYEoOSJo5+pvQ1PoUax5NKd0eB4T2YwzkH6S6b2o1sIk5A7
         N5sXxakeMwaDc+d0WrsB8GUpnKC2y284dJyMycvgcbkDdaMONTZzkAMJINXrUwMb2gLQ
         KPbNnvr5kV+dbQes6GljFbGcWv3ylsC//8LaHYpS1Oqlyu2Z+Jq8G+ANUmtH5nyQLSiB
         0+Ss6E648cunA0F+rks7H4i82CLNsz7DsHAfI/2/YjqZq4u7OcJw5PHOcIRAkS0t3P3z
         mxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgxvgzs1Tgpu1GZh+mHCSsHhjbXwtPM66AFqjrgZYuY/fxbQGOAeL4iQfpOIMWb6WCrEq/WGthUE3cH3pJ8D2mIwWXw2TGUXgVRJZr2A==
X-Gm-Message-State: AOJu0Yxrk/2c15+MVGb+ET9MbyQovOfZBzpug64rOi2dOYllGeIK6l0f
	/da9OvdCBS1ed9O3QCqW6a2R0h3WDr3rpQTZzgFY8mvosQiEAUmt
X-Google-Smtp-Source: AGHT+IHaQzNvk4YWrQWT9WNAAwHe0kQOSE06N9pBtdSp1KGd0h6iK95EAr4dLsZF/PZXUPcYuq9GVw==
X-Received: by 2002:a05:600c:438a:b0:413:f4b5:dcec with SMTP id e10-20020a05600c438a00b00413f4b5dcecmr2085905wmn.40.1711635748283;
        Thu, 28 Mar 2024 07:22:28 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-248-55.retail.telecomitalia.it. [87.1.248.55])
        by smtp.gmail.com with ESMTPSA id k4-20020a05600c1c8400b00414807ef8dfsm2491296wms.5.2024.03.28.07.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 07:22:27 -0700 (PDT)
Message-ID: <66057d23.050a0220.2dbd5.9e0e@mx.google.com>
X-Google-Original-Message-ID: <ZgV9IBJH-ZEmipor@Ansuel-XPS.>
Date: Thu, 28 Mar 2024 15:22:24 +0100
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
 <66044bea.050a0220.dee16.c250@mx.google.com>
 <20240327175131.3c0100c3@xps-13>
 <20240328034732.GA3212@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328034732.GA3212@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_072231_410561_7D58A77B 
X-CRM114-Status: GOOD (  37.67  )
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

On Thu, Mar 28, 2024 at 09:17:32AM +0530, Manivannan Sadhasivam wrote:
> On Wed, Mar 27, 2024 at 05:51:31PM +0100, Miquel Raynal wrote:
> > Hi,
> > 
> > ansuelsmth@gmail.com wrote on Wed, 27 Mar 2024 16:20:58 +0100:
> > 
> > > On Tue, Mar 26, 2024 at 12:55:12PM +0530, Manivannan Sadhasivam wrote:
> > > > On Mon, Mar 25, 2024 at 11:30:47AM +0100, Christian Marangi wrote:  
> > > > > misc_cmd_type in exec_op have multiple problems. With commit a82990c8a409
> > > > > ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path") it was
> > > > > reworked and generalized but actually broke the handling of the
> > > > > ERASE_BLOCK command.
> > > > > 
> > > > > Additional logic was added to the erase command cycle without clear
> > > > > explaination causing the erase command to be broken on testing it on
> > > > > a ipq806x nandc.
> > > > > 
> > > > > Fix the erase command by reverting the additional logic and only adding
> > > > > the NAND_DEV0_CFG0 additional call (required for erase command).
> > > > > 
> > > > > Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > > ---
> > > > > Changes v2:
> > > > > - Split this and rework commit description and title
> > > > > 
> > > > >  drivers/mtd/nand/raw/qcom_nandc.c | 5 ++---
> > > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> > > > > index b079605c84d3..19d76e345a49 100644
> > > > > --- a/drivers/mtd/nand/raw/qcom_nandc.c
> > > > > +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> > > > > @@ -2830,9 +2830,8 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
> > > > >  	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
> > > > >  
> > > > >  	write_reg_dma(nandc, NAND_FLASH_CMD, instrs, NAND_BAM_NEXT_SGL);
> > > > > -	(q_op.cmd_reg == OP_BLOCK_ERASE) ? write_reg_dma(nandc, NAND_DEV0_CFG0,
> > > > > -	2, NAND_BAM_NEXT_SGL) : read_reg_dma(nandc,
> > > > > -	NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
> > > > > +	if (q_op.cmd_reg == OP_BLOCK_ERASE)
> > > > > +		write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);  
> > > > 
> > > > So this only avoids the call to, 'read_reg_dma(nandc, NAND_FLASH_STATUS, 1,
> > > > NAND_BAM_NEXT_SGL)' if q_op.cmd_reg != OP_BLOCK_ERASE. But for q_op.cmd_reg ==
> > > > OP_BLOCK_ERASE, the result is the same.
> > > > 
> > > > I'm wondering how it results in fixing the OP_BLOCK_ERASE command.
> > > > 
> > > > Can you share the actual issue that you are seeing? Like error logs etc...
> > > >  
> > > 
> > > Issue is that nandc goes to ADM timeout as soon as a BLOCK_ERASE is
> > > called. BLOCK_ERASE operation match also another operation from MTD
> > > read. (parser also maps to other stuff)
> > > 
> > > I will be away from the testing board for 7-10 days so I can't provide
> > > logs currently.
> > 
> > So, shall we wait for additional logs from Christian or shall I merge
> > the two-patches series? I'm not sure what's the status anymore.
> > 
> 
> TBH, I don't know how OP_BLOCK_ERASE can fail without this change. But I can
> clearly see the 2 patches required for OP_RESET_DEVICE command. But merging the
> patches as it is doesn't look good to me.
> 
> So I think if Christian can club the two patches into 1 as like v1 and reword
> the commit message and subject to reflect the fact that OP_RESET_DEVICE command
> is being fixed would work for me.
>

Ok will do, very confusing and sorry for not providing additiona log. I
was adding support for ipq806x for 6.6 and notice the regression.

Will rework the patch.

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
