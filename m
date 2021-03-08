Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52B5C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:35:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37AA965100
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37AA965100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1qHBQJvz8GUmToCfaCJKosH8uZ2jDaWy7C5WzaFYrWg=; b=TVjqLcDeyOHIAVUPem4ZkLLiD
	mmaHAk0TiwRYU/ACgAUm3xsfe7dMOwXFtKga1OpYutSI49idz7uiYEOoIt1cNWXd0HG2x779Q2ZXK
	S2XiquFcdarrH5TAOstBZA7yoZE5liwTLqAyUNNl7A8UoktrHyt/6A3ieLyODoibj7qu3wPkoHgeQ
	mvMZ853Zuuj2ka4rKa8P1AdgidwSr4shCakbFtT1xPVU35QAOeNq1uWh3qsf13H8NZET4MTIjZviZ
	IIAhvlSH2nPg800fbkIvuzQi6PbmRin6aomaEbIstXphVA0o/vIrirZQHBepplg7J9wCFdi6qNJ8T
	L17b1x4IA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJG1l-00HUMZ-Bb; Mon, 08 Mar 2021 13:34:29 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJG1b-00HUJZ-8S
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 13:34:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id w18so7081472pfu.9
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 05:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Jy+hRDRm2a3VhiF/cs63pR4L32THWqr6aYcveYB2mrQ=;
 b=bObl2OR2UbbO1eDS8jfL7Hky/K4KNAyBpwniRxvXmAERkH1cRZ4GPve3nPTy8aCs2f
 Yj8apeib6trmavOAMKqQIhSb85BQQTlp6p8LdII6sBAXtO8vlOj4MIHs71rkVInqWoe5
 q5kKtR2uHBb8PZZ7Y7e+/o3dg42SYAp3z4i99bYLZsWPYc5ejiRE8uLU8kWIhIpxf65f
 WrEO3Pjd1Ajkz68YvBYRQOlQrAgCuMjIeRU0V8A38J6tQhu4VLLLzm80QuXbZofCDP7y
 6A55D8HaMhXHbpFpQDP5VJA/29Gdf0yk5bTaf9rz5P1Ofry2pvbEUplzeNZdk3euxIVS
 mDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jy+hRDRm2a3VhiF/cs63pR4L32THWqr6aYcveYB2mrQ=;
 b=EUgszb6Py3AH56l1z3h+vH+8GrUFwyfHS9yx8xeULMhhAptToIyo9rkgeblm+dOrqk
 GoHXchbTcFAUmeR7nfHR6mmOc5h2QdoZzdl2AWPA0n1EtkaHk71GM3lIfA/HbDR1z7k4
 vllj6dug8nwUryvETkjdqI0iiZ4iQRc8DIPWjXO5hO81tBOqSDmj9qvnTe1IPpIza4dM
 BqGvbIkqM5SYu/XrUGT4/+Ry7QhQqI36hBjbiSTwv0Np309Rc1VMj/T6XRGM+KAsu9uX
 AqI+uTx1xEQm9459Q8kMKxUthQQ5D96yZDYYns05/Boo8lCNTdWY4uMTDdpaA4Quv7Qv
 Ko7w==
X-Gm-Message-State: AOAM533+wx79pfSxqBngD5k4/BJqayeXQVloh6dLc0GAaXEBq/iz9WUM
 Pq0AYUQxA/ubG3t7fsQU2lAypTmbWtBf
X-Google-Smtp-Source: ABdhPJyP8D/RldetyJSotxDhgrg6Y9E/d7Zz09BvAbcE0LiRJPFsyFWc8VbdLCp3yaiSAiipxO1rzQ==
X-Received: by 2002:aa7:9182:0:b029:1de:e96f:a866 with SMTP id
 x2-20020aa791820000b02901dee96fa866mr20695396pfa.67.1615210457298; 
 Mon, 08 Mar 2021 05:34:17 -0800 (PST)
Received: from thinkpad ([2409:4072:638a:aee8:50fe:f77:990e:395b])
 by smtp.gmail.com with ESMTPSA id i22sm11439401pjz.56.2021.03.08.05.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:34:16 -0800 (PST)
Date: Mon, 8 Mar 2021 19:04:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v4 3/3] mtd: rawnand: qcom: Add support for secure
 regions in NAND memory
Message-ID: <20210308133410.GD5457@thinkpad>
References: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
 <20210308054447.28418-4-manivannan.sadhasivam@linaro.org>
 <20210308100247.4aba657c@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308100247.4aba657c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_133419_819469_72757BAA 
X-CRM114-Status: GOOD (  18.53  )
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

On Mon, Mar 08, 2021 at 10:02:47AM +0100, Boris Brezillon wrote:
> On Mon,  8 Mar 2021 11:14:47 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 

[...]

> >  /* helper to configure address register values */
> > -static void set_address(struct qcom_nand_host *host, u16 column, int page)
> > +static int set_address(struct qcom_nand_host *host, u16 column, int page)
> >  {
> >  	struct nand_chip *chip = &host->chip;
> >  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> > +	u32 offs = page << chip->page_shift;
> > +	int i, j;
> > +
> > +	/* Skip touching the secure regions if present */
> > +	for (i = 0, j = 0; i < host->nr_sec_regions; i++, j += 2) {
> > +		if (offs >= host->sec_regions[j] &&
> > +		    (offs <= host->sec_regions[j] + host->sec_regions[j + 1]))
> > +			return -EIO;
> > +	}
> 
> Hm, not sure that's a good idea to make this check part of
> set_address(). Looks like set_address() can be used for ONFI page
> access too, and you definitely don't want to block those
> requests. I'd recommend having a separate helper that you can call from
> qcom_nandc_{read,write}_{oob,page,page_raw}().
> 

Right but I went for the code simplicity :/ Anyway, since you're favoring
towards moving this check into code, I'll incorporate your suggestion
accordingly.

Thanks,
Mani

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
