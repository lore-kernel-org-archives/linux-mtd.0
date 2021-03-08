Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F62C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:36:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6499651C2
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6499651C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H95aQm3RQm/C0rpI0CLjy56L7bU6Bjmkuze2LMfUUHo=; b=HYT+7slv2R43WY7044Kg/rlfn
	0IhU+AqQHBV2VobVnktRQUHXaDWS1rVlky56t0eQNMmNK5mCmXfLmjIgFNfRvTQ/AvSqPY/lITJRn
	AuwBQmnW8kVtRTMryFN2bkjsmfiaxLR16F+gC8iGNl/sy8utfDKPiKZfVv4LoRhwFSqHmd+xdnW11
	cfc2vp8VAWSU/QvoA+djJCE+J/cWchYT/n0tQv/Ql7mxOHUWXK+9TEmAUUf70o8shvqlWMrWiePLq
	6EIcXiaxVK93nMNTIq+3ngOPxT73SX9vA19mQtMfirA9014kDl9KYxkmXqXBmUOCCoMXcOaJ4B8MZ
	K//7Mn2WA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJG2P-00HUfZ-IL; Mon, 08 Mar 2021 13:35:11 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJG2H-00HUbd-SF
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 13:35:05 +0000
Received: by mail-pg1-x535.google.com with SMTP id x29so6421211pgk.6
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 05:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nFq9IUrqTM3+0MdXot9pV1py85hqvVYW3bJyV6Rfqho=;
 b=PsJDgGkOaOjHNBPvMCcrJCuIHARyjccomzLz5rJzj36YbJgFBR8LX90ZU1gQcAZULC
 dUmPf9UDI2ZR0T1BxQy2aHqKHXA+2gJoG5FXg9tKYKYCFkP9506fAt6NYMuXiCdBNPaY
 Awu0WtBMNXhtNEmK+hq7XqZ3ij09532rixoxCtYvGrHe5vgASah7WAK5hBhntYauHiUN
 vMiIia1+xdW+/IDDi9XSUfTZATNcSd9HwxaFbRVBt+Uu6aM7/FhrDLx/UmFevrZ2IoOu
 +IDlYvr3dd0FIsZuc57YgWb/UFwNQ3h+bVBN+BDZnRrpD11x7DF38AX0UktkfeRei5RB
 jlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nFq9IUrqTM3+0MdXot9pV1py85hqvVYW3bJyV6Rfqho=;
 b=XGYYiOYrvU7c4Yf+cLEqWB9OOJpIi9OSmdRcXca0Zp2kggiEihBGCIp+LGUxl+tviZ
 Q2UEQ+MST2SUJorDiDr6q9/Ff41T75ablQEQLmn2y7EGJEgcIDhIYxmosPAvFoCqZBIo
 xGridcR4fvIzYzXvUv0D8PjhxTXaF866+j0s8vE5UAwAyuc5/7OlkpStzvKQfK39KNfY
 PM0f+abI3g8vlY2tDslafuIjY6qrPjdBQ1hzpjOBnq6SqKnNHme+83YOHs5XMmCyNUcZ
 ouijU+ka5TbV+wnkU2v5GXUvT6ZFDfIhkYk2YxNmaQl+TcBgUulXnvH0GVVr6KaIg5/7
 WYDQ==
X-Gm-Message-State: AOAM533FRB6zieum+qRWwfiInt0r1jsh3NHxlIoUoIr/N3LfIZyLBPLd
 YObHsXyFw3Ic6JyXxBigCez3
X-Google-Smtp-Source: ABdhPJzDVMzIThcvYLdQZZIGll9N0HceTj2bSkrfitIpzskFrFoRjjO+2S0+FEbJyMrq1KLFBMe7Zw==
X-Received: by 2002:a65:46cd:: with SMTP id n13mr20197023pgr.414.1615210500202; 
 Mon, 08 Mar 2021 05:35:00 -0800 (PST)
Received: from thinkpad ([2409:4072:638a:aee8:50fe:f77:990e:395b])
 by smtp.gmail.com with ESMTPSA id c24sm7238618pfi.193.2021.03.08.05.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:34:59 -0800 (PST)
Date: Mon, 8 Mar 2021 19:04:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v4 3/3] mtd: rawnand: qcom: Add support for secure
 regions in NAND memory
Message-ID: <20210308133452.GE5457@thinkpad>
References: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
 <20210308054447.28418-4-manivannan.sadhasivam@linaro.org>
 <20210308100247.4aba657c@collabora.com>
 <20210308133410.GD5457@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308133410.GD5457@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_133502_474886_911E8ED8 
X-CRM114-Status: GOOD (  21.30  )
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

On Mon, Mar 08, 2021 at 07:04:17PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 08, 2021 at 10:02:47AM +0100, Boris Brezillon wrote:
> > On Mon,  8 Mar 2021 11:14:47 +0530
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > 
> 
> [...]
> 
> > >  /* helper to configure address register values */
> > > -static void set_address(struct qcom_nand_host *host, u16 column, int page)
> > > +static int set_address(struct qcom_nand_host *host, u16 column, int page)
> > >  {
> > >  	struct nand_chip *chip = &host->chip;
> > >  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> > > +	u32 offs = page << chip->page_shift;
> > > +	int i, j;
> > > +
> > > +	/* Skip touching the secure regions if present */
> > > +	for (i = 0, j = 0; i < host->nr_sec_regions; i++, j += 2) {
> > > +		if (offs >= host->sec_regions[j] &&
> > > +		    (offs <= host->sec_regions[j] + host->sec_regions[j + 1]))
> > > +			return -EIO;
> > > +	}
> > 
> > Hm, not sure that's a good idea to make this check part of
> > set_address(). Looks like set_address() can be used for ONFI page
> > access too, and you definitely don't want to block those
> > requests. I'd recommend having a separate helper that you can call from
> > qcom_nandc_{read,write}_{oob,page,page_raw}().
> > 
> 
> Right but I went for the code simplicity :/ Anyway, since you're favoring
> towards moving this check into code, I'll incorporate your suggestion

s/code/core

> accordingly.
> 
> Thanks,
> Mani

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
