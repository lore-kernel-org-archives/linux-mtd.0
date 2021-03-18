Return-Path: <SRS0=Kfvc=IQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63673C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 12:16:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0353D64E89
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 12:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0353D64E89
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vK6eWWJBjRUytHg0V/E+ZJBS56R0P5klIJT5mYbectY=; b=Thox6+Xp8HaqcY7XukOs9IwxD
	Q8poRKVlT1ferlTMu4GsqD1maMnP+D/+qJYJy/+hWedHnmnCdwEmjO6Jkyxa+kSCxaZlEYHX6d451
	0/WpK2hh/sdOzHzKmCm9otjVLbv/JIid+MGFo6xgmlP5hPpCAfCUYmu+uuPZhzPdSSFNZU+kGZ5tf
	/BYdNJRkKJcREGedKE1f77asdLoJqJxXrBm+b0AUAF1DTt+SA25JTNXi6D+YVs8s6G4D6DVOEJabJ
	0clL9Rx63cpkcofUXE0L7l+oeAzypGqLY7QRLBHMFXEtxtXroScbALHNSlgisf7n8kaj2ZA4mUOhL
	wbIc3vo+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMrZf-005Axq-Aa; Thu, 18 Mar 2021 12:16:23 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMrZS-005Awb-ML
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 12:16:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id l1so1209438plg.12
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mDvN0SgAfdUxvP15FGjlUIyfQkEQU0VmBT3cvhyl4P8=;
 b=J0SCTpSl66AXYFrVZinWF1tdEH2O6BGxsFyMoRYdtxMpYlP0iLTy+DjI2rPZTfQIcU
 p5xmOgENJh77+3sPhSiRMqCzHkPZAS8peVP/IbpKySbcykwSepPjABdApEOXSX02Z4S3
 l4Ixeuc52rWSYU0kUkexKhpyhSRQ+xTSIqM6Gz5ptTsyQno+l9w7qgvgvWQdHQjCk6aD
 Ao+jEHr44f7LoaOWDh4EfambbLt6ePERFM49V9dWx86fx+DE5ekAjey5sa9rXyMRSDBd
 N47WBciaLHNJV1jdQ7ybbgXzHMux3nvRGU4MEy4G2kjjMANbg4zN6qVB7y4h5eZhXs1i
 WUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mDvN0SgAfdUxvP15FGjlUIyfQkEQU0VmBT3cvhyl4P8=;
 b=rEd3WRKJ9Wc0OHuRbdkQ1v65FHfMxCVy7tjo4+LbNu5byX4Cv2v+uffSbSIo2zDJIx
 vHew/MN5Uy7+56HSXLsXo9BK7nlgsQsPIrW1DAAoicX2bXWcLtE8t/3nMo8qZWRxMzMm
 EV6JLMQ3fNuokJuocT1zWGwzhVm+3XribckTxulFHHjKWnDMVrIL9nvX3eZfufS6L2jj
 yhnr7RO9Y4l2e+WN2bnx9Wpuoq/83IFAYwwpGajHFG/sYlAb3Fpg1axshGXtn/TFDipY
 ypXmhwKKFy/vgtjKmq8Bo89j3GkW1Hxpmruuqkj1EwIsyWVhxfsZ/7zG95eQtEDcc0p+
 uHVw==
X-Gm-Message-State: AOAM530OorJb0iW7WvQ+++Ak5xDJGKc7uVQLaB+fjLXUHP1IfizHxVOl
 EK1ReXFwXKRPWKwAyY7R/ZzSQ0ungBV/
X-Google-Smtp-Source: ABdhPJw8gFyVpDkplM9fABTLOzM0jYdB18ReJ2voNFd21l1TQUS6DAIi9n2ngbIujTbCX2OD6xslVQ==
X-Received: by 2002:a17:90a:5211:: with SMTP id
 v17mr4141106pjh.53.1616069769155; 
 Thu, 18 Mar 2021 05:16:09 -0700 (PDT)
Received: from thinkpad ([2409:4072:6d00:4737:af26:182c:a57e:1d9e])
 by smtp.gmail.com with ESMTPSA id i7sm2473080pfq.184.2021.03.18.05.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 05:16:08 -0700 (PDT)
Date: Thu, 18 Mar 2021 17:46:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v5 0/3] Add support for secure regions in NAND
Message-ID: <20210318121601.GA21610@thinkpad>
References: <20210317122513.42369-1-manivannan.sadhasivam@linaro.org>
 <20210317155121.19cbb50c@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317155121.19cbb50c@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_121611_429727_CE2669D3 
X-CRM114-Status: GOOD (  21.56  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Wed, Mar 17, 2021 at 03:51:21PM +0100, Miquel Raynal wrote:
> Hi Manivannan,
> =

> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Wed,
> 17 Mar 2021 17:55:10 +0530:
> =

> > On a typical end product, a vendor may choose to secure some regions in
> > the NAND memory which are supposed to stay intact between FW upgrades.
> > The access to those regions will be blocked by a secure element like
> > Trustzone. So the normal world software like Linux kernel should not
> > touch these regions (including reading).
> > =

> > So this series adds a property for declaring such secure regions in DT
> > so that the driver can skip touching them. While at it, the Qcom NANDc
> > DT binding is also converted to YAML format.
> > =

> > Thanks,
> > Mani
> > =

> > Changes in v5:
> > =

> > * Switched to "uint64-matrix" as suggested by Rob
> > * Moved the whole logic from qcom driver to nand core as suggested by B=
oris
> =

> I'm really thinking about a nand-wide property now. Do you think it
> makes sense to move the helper to the NAND core (instead of the raw
> NAND core)? I'm fine only using it in the raw NAND core though.
> =


The reason why I didn't move the helper and checks to NAND core is I haven't
seen any secure implementations in other NAND interfaces except rawnand. Th=
is
change can be done in future if we start seeing implementations.

> Also, can I request a global s/sec/secure/ update? I find the "sec"
> abbreviation unclear and I think we have more than enough cryptic
> names :-)
> =


Sure.

Thanks,
Mani

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
