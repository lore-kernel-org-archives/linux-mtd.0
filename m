Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F05EC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 09:40:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 471986192A
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 09:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 471986192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z7netqpNv65WdfOoXxRA6DNNxetZfFRkhWftrjmfUps=; b=LF7CcaIR+iwMThKYDW7VEzqSt
	CzcQbvSU/3xpbeY/t1BQb4y4npNb+NkHYrkktHVagkp5almk/guU5x3UUxplLB9URohT3gaKXYoqC
	Ecu73Wr2pCtXTWB7jwjBU993XJ8oBZEnih8/vI6nRnf+Bj+dzQN1+7uJDseLugMioMf47hECxr5eW
	6Q66aEc5qSzagl4Q4Fki1BUNcZ6G0mxqnTnSSLzI7N04oB+uSwIjcdxu5ThTJ+shqOXH4TmFZMbty
	9LLRaG71k87KjrPQQ2biZp/YKp790s5GXl3S0j9vsM+/yo4eFdX0g7lxvBUBHE39J252d50CIvX2m
	X6sxxqSuw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOH2H-00BGvE-Je; Mon, 22 Mar 2021 09:39:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOH29-00BGuZ-6i
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 09:39:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id t20so6239276plr.13
 for <linux-mtd@lists.infradead.org>; Mon, 22 Mar 2021 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wqHZMdC6rUxDyCcQ9/UiKhgX+/ervzY6iVzUm9vwHtE=;
 b=qIuXQoutDEgBKQInI7J0pFo7lPchsNyAgwQuoNJ2wFzSsG8ykCUIZ+YPFqtoS26Mz1
 hV+bXEEnX67VZq1EKNpC+7mrPcRdyeSCGU5S5GqBWysh6kfmKNA9gPwJQ1bHL+Lh06uh
 A2YPCKKulH2mRo2f8kBkgq+URI3KKFh/Bm4ZWJIt4eZwFDOvz2UXXHgW8FqGewIj6jP3
 mv7xXEha8ltbpZ6KxJVkVWp9JOEOdaOplsK+BIX0O1t0d3xgCvSW0CH/czcR/+Q4JI40
 kQuSyB69pnreP0f0a8ypQscp1vjsweLxYFDoJBjGN4WNvHua5X6klQRus5ri7IrB0UEj
 fzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wqHZMdC6rUxDyCcQ9/UiKhgX+/ervzY6iVzUm9vwHtE=;
 b=dFEFaeS/dwCCpYPwPqGX58zzpirV+rTazJdqExEE7RDgaEe3ljtf7cZ4pjLmweaUjH
 RddMbSweC48evVHde5P8MbIA4qCtsKQ9fFZf9xoqtecHCgo57U5C2mxYKCjb6TnKZLIQ
 2bpn+wFeCDZmbq0poLo1GEcqeFDjGySYXFT8kiQxHNHVLCwc9ISWOAtl7yF3zn+Bn//U
 AtF0rcYgiLZfNcZ3IeQOXH260kIT6HmZ3dVkI+KUaheBL/9nxVrLWjk1ijwd6cJZ3G8p
 DcLG4GyYg5JFlm72Vh42+Hz9wXQQyULTHOuLY8gV4VQR4noGSPjmpW7tUjfSh/UmQz5e
 dw+w==
X-Gm-Message-State: AOAM531mlp3BIpZcbQw+uIQFLJ6B1bbcy9K8wFQEtwUOH7zI5qaMTexJ
 AtY7GCdhJFv4Jr9evEX+8XrK
X-Google-Smtp-Source: ABdhPJy8XVuIct7JmQJB4vmoUOg0R04Oj6ixVbI7Z072PYBkXC9iQpAALem0b+7e7hGmxDYKG2g67g==
X-Received: by 2002:a17:90a:d3d1:: with SMTP id
 d17mr12193992pjw.21.1616405974041; 
 Mon, 22 Mar 2021 02:39:34 -0700 (PDT)
Received: from thinkpad ([2409:4072:88e:ef5e:dccf:398f:4151:2e02])
 by smtp.gmail.com with ESMTPSA id j188sm13320925pfd.64.2021.03.22.02.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 02:39:33 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:09:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v7 3/3] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210322093923.GA70634@thinkpad>
References: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
 <20210319150010.32122-4-manivannan.sadhasivam@linaro.org>
 <20210319175258.2cce6acd@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319175258.2cce6acd@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_093938_107994_78C3D359 
X-CRM114-Status: GOOD (  36.26  )
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

On Fri, Mar 19, 2021 at 05:52:58PM +0100, Boris Brezillon wrote:
> On Fri, 19 Mar 2021 20:30:10 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > On a typical end product, a vendor may choose to secure some regions in
> > the NAND memory which are supposed to stay intact between FW upgrades.
> > The access to those regions will be blocked by a secure element like
> > Trustzone. So the normal world software like Linux kernel should not
> > touch these regions (including reading).
> > 
> > The regions are declared using a NAND chip DT property,
> > "secure-regions". So let's make use of this property in the raw NAND
> > core and skip access to the secure regions present in a system.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 111 +++++++++++++++++++++++++++++++
> >  include/linux/mtd/rawnand.h      |   4 ++
> >  2 files changed, 115 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index c33fa1b1847f..479a79e682cd 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -278,11 +278,47 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
> >  	return 0;
> >  }
> >  
> > +/**
> > + * nand_check_secure_region() - Check if the region is secured
> > + * @chip: NAND chip object
> > + * @offset: Offset of the region to check
> > + * @size: Size of the region to check
> > + *
> > + * Checks if the region is secured by comparing the offset and size with the
> > + * list of secure regions obtained from DT. Returns -EIO if the region is
> > + * secured else 0.
> > + */
> > +static int nand_check_secure_region(struct nand_chip *chip, loff_t offset, u64 size)
> > +{
> > +	int i, j;
> > +
> > +	/* Skip touching the secure regions if present */
> > +	for (i = 0, j = 0; i < chip->nr_secure_regions; i++, j += 2) {
> > +		/* First compare the start offset */
> > +		if (offset >= chip->secure_regions[j] &&
> > +		    (offset < chip->secure_regions[j] + chip->secure_regions[j + 1]))
> > +			return -EIO;
> > +		/* ...then offset + size */
> > +		else if (offset < chip->secure_regions[i] &&
> > +			 (offset + size) >= chip->secure_regions[i])
> > +			return -EIO;
> 
> How about:
> 
> 		const struct nand_secure_region *region = &chip->secure_regions[i];
> 
> 		if (offset + size <= region->offset ||
> 		    offset >= region->offset +	region->size)
> 			continue;
> 
> 		return -EIO;
> 

I guess you mean this:

        /* Skip touching the secure regions if present */
        for (i = 0; i < chip->nr_secure_regions; i++) {
                const struct nand_secure_region *region = &chip->secure_regions[i];

                if (offset + size < region->offset ||
                    offset >= region->offset + region->size)
                        continue;

                return -EIO;
        }

	return 0;

> > +	}
> > +
> > +	return 0;
> > +}
> > +

[...]

> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index 6b3240e44310..d385c4fe8b0f 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -1086,6 +1086,8 @@ struct nand_manufacturer {
> >   *          NAND Controller drivers should not modify this value, but they're
> >   *          allowed to read it.
> >   * @read_retries: The number of read retry modes supported
> > + * @secure_regions: Array representing the secure regions
> > + * @nr_secure_regions: Number of secure regions
> >   * @controller: The hardware controller	structure which is shared among multiple
> >   *              independent devices
> >   * @ecc: The ECC controller structure
> > @@ -1135,6 +1137,8 @@ struct nand_chip {
> >  	unsigned int suspended : 1;
> >  	int cur_cs;
> >  	int read_retries;
> > +	u64 *secure_regions;
> 
> 
> Can you please define the following struct:
> 
> struct nand_secure_region {
> 	u64 offset;
> 	u64 size;
> };
> 
> instead of having an array of u64 where even entries encode the offset
> and odd ones the size.
> 

Hmm, I think you implicitly said this in your previous review as well and I
somehow lost it. Will incorporate. So we'll have something like this in
of_get_nand_secure_regions():

                for (i = 0, j = 0; i < chip->nr_secure_regions; i++, j += 2) {
                        of_property_read_u64_index(dn, "secure-regions", j,
                                                   &chip->secure_regions[i].offset);
                        of_property_read_u64_index(dn, "secure-regions", j + 1,
                                                   &chip->secure_regions[i].size);
                }


Thanks,
Mani

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
