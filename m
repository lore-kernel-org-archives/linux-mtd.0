Return-Path: <SRS0=fIXu=3O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35FEC2D0CE
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jan 2020 02:12:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A07F42071E
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jan 2020 02:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uVZjzayA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="TkxDWTfM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A07F42071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OuJJUj8GWGSkwFgPi/gMbzre+9XgaHCjbZ34unQ7u8=; b=uVZjzayAzKYtjk
	bAIEru5DGYzIfGyYORhuDKitZtvzV71j+1GzcgwAQePya+PR3MFKw9CpHpNgVrXFdr/EV/4oxlTJX
	Y0CZLxZ2JVqa7JXUFfMXAbic70GCCkGSMzicrKJ1v42AM5Vh+h5kQ5EIcKFaFTOOpOHD+uWAwn/4E
	SI/D9BP0DfDY1Fc55eRMEnuBy+3U+4vXvErx2o5UrvpwD5BSS+H5KPReZju7ZD/TlsNZ+uex+QR/n
	Jkm4M6uHfFVR5Qz44t5FPvtVSN3AWuFO1jypwgAd9hF/Agc2ag+IFwOHY+K0lbHNfLXE9+7NrnDun
	c77/P1/3o4f0Xh23Ybsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ivAw5-0001c2-3M; Sat, 25 Jan 2020 02:12:33 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivAvz-0001an-72
 for linux-mtd@lists.infradead.org; Sat, 25 Jan 2020 02:12:28 +0000
Received: by mail-pf1-x441.google.com with SMTP id i23so1993414pfo.2
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jan 2020 18:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EXFe/vfnLkzT3mAWRy5NBHmIc8Oyyk9Ad0WMoNwuPt8=;
 b=TkxDWTfMZU8Eqr69fjAxX4wvjaAyxwoq2CL2Bwlr1AgGV5D4EqkcCvbwxqxtk5oWQ7
 Vu3iQLbxn7OwbKzTe4BtiWx7Bvvg/IeY5IAdi7Ep3DVIs6SknDPSxgtbYjPOKkFOA9vy
 x1TB7CkGJlRbp0gzWpmXSkdZjh1hUhNKqoS0ZI9xK2qxCiNwtuYiAc1T7ywm7J2boTXa
 Tv6qkmoVmv2ZmykEokMRBxmoaGc+RIaJSM0dV/GnsSeGscoWaVB3Y7CcmRsz4HdsSgGR
 XWDLWKezF32jOsGs4kkhN3bUgl2Kd6ojl3ufz90tx6eQvHHL80yzoBsAUbi7t9WCXnAw
 6Rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EXFe/vfnLkzT3mAWRy5NBHmIc8Oyyk9Ad0WMoNwuPt8=;
 b=o71ZYqtryDIfKJ7ViOII4H9g9HVLV9xKVsVAkegZzDxWGoVqLMMFDkQ0UtOaUComBK
 KQeTU54V5qYxZaMoH4aT6XMwewImFDMmEjWLl5Dcrin6raekCOHuTKk0l+fU9jLaUCJh
 mRIulQ5pUIGK09bVvsVLwVmaYz+XVvfyxNBXABftnwqSZCxl3KPaDdUn2059FEO+5wmL
 8Fh+29ogc0NYb2EEgHekP6miTWywmuW9VrluVPBjLCTsD+DYgWE5ppW0JvBFOd+vU9jm
 jf1Su7Ugm10BMUdafX5pQGP9td1MB8o4u2jR4IhecWDhUuCkZSM6yQhuoBknxEmIAUHO
 klAQ==
X-Gm-Message-State: APjAAAXbh1MUQgFw2ENBtwnQX2ZOfXcnDlpEo4Zgxd+mhqW98XebVva8
 pGKz1DsLueMeJzOUyd2YPTlFBZ4w3Pzhrrg7+bGMpg==
X-Google-Smtp-Source: APXvYqyW0SmPK4KpuQbLoeF3vRxy+R+++4XuYWmuDeTZM4oxe/ppV3OLeGSF+O7JLzqqRY0RxLFKybydDDRXm7DDRfA=
X-Received: by 2002:a63:cc4f:: with SMTP id q15mr7565027pgi.159.1579918343489; 
 Fri, 24 Jan 2020 18:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
 <20191211192742.95699-3-brendanhiggins@google.com>
 <20200109162303.35f4f0a3@xps13>
In-Reply-To: <20200109162303.35f4f0a3@xps13>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 24 Jan 2020 18:12:12 -0800
Message-ID: <CAFd5g47VLB6zOJsSySAYrJie8hj-OkvOC89-z2b9xMBZ2bxvYA@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] mtd: rawnand: add unspecified HAS_IOMEM dependency
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_181227_280871_D2A8A48C 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, David Gow <davidgow@google.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 9, 2020 at 7:23 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Brendan,
>
> Brendan Higgins <brendanhiggins@google.com> wrote on Wed, 11 Dec 2019
> 11:27:37 -0800:
>
> > Currently CONFIG_MTD_NAND_CADENCE implicitly depends on
> > CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
> > the following build error:
> >
> > ld: drivers/mtd/nand/raw/cadence-nand-controller.o: in function `cadence_nand_dt_probe.cold.31':
> > drivers/mtd/nand/raw/cadence-nand-controller.c:2969: undefined reference to `devm_platform_ioremap_resource'
> > ld: drivers/mtd/nand/raw/cadence-nand-controller.c:2977: undefined reference to `devm_ioremap_resource'
> >
> > Fix the build error by adding the unspecified dependency.
> >
> > Reported-by: Brendan Higgins <brendanhiggins@google.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
>
> Sorry for the delay.
>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

It looks like my change has not been applied to nand/next; is this the
branch it should be applied to? I have also verified that this patch
isn't in linux-next as of Jan 24th.

Is mtd/linux the correct tree for this? Or do I need to reach out to
someone else?

Cheers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
