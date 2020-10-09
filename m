Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CD3C433E7
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 13:57:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C26A52225B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 13:57:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gAg41JqX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hlz0T0HY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C26A52225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=zVhezSfx7tHlw8a5Sky7X1qBUMpHDZUf9MFDFIzpb6w=; b=gAg41JqX8PFrwv9cRk4OTsCCJ
	ky5KrGB77KQ3sgeCah4qQQgzNyYLJ4FQsfIpSiO/6xKSCZdJz4KMzOOcTiisLf+KcdoSsDgByOOGd
	TT9ehe2Qc2sqOOG4G1vuSaNFrxXY94BFK/RhViFk01HKIpZ68Ps9DQ8AI2SgHnJf/vQRq25EP5sX2
	LLuS4YtqWuuXsuiwupAPapGYG5zkIO8FH/ebvWaPYnlG1qt1Lhj32+1QsBJJslOqgOZDYxdf4R5gR
	z1OVzcXn7Y4rTDwNaIPD23FGEFSrOr3Uork7DGGuPgljpi+LjI4ZyZQPfQzMf17YzuHkkDjPCoP8V
	mTFyJLSOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQssy-0006L9-2l; Fri, 09 Oct 2020 13:56:40 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQssv-0006KD-S5
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2020 13:56:38 +0000
Received: by mail-il1-x141.google.com with SMTP id b2so9243393ilr.1
 for <linux-mtd@lists.infradead.org>; Fri, 09 Oct 2020 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:from:date:message-id:subject:to:cc;
 bh=6o6qPP8lMx7cYOKA/MqaKbaqIjCjGnaiLWr14rPl5P0=;
 b=Hlz0T0HYpcI1RmYPyeOF014dP7wq6mto4JOO5AQX3su3fh95zbsrdvX+wsqbFQFmuk
 o56RJq7SGR5KyYMNTqsQjirLof/hnJtOBvvKEwO9b1+TN3p0b4gl92toDcBj7VMPnn7/
 8tY2NMUR4+quoUAFnkcxw7tVy93kHmwxgOPAcTX7m1Uo+ZCdjtmxau9fhNb4E82Tq5ot
 B5nJJa8LIH8PryvenpUGFLf4m8Kd88gjuibR7FbKT1TrjSS9oz09MR1uncgkH+1kLLzz
 /FVRczFb6cSO2chHkoCGBoFXPEzehWoc1SQrPGaGcYlVCO8j83PhHkDjqmQt2j07l4cf
 0s7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:from:date:message-id
 :subject:to:cc;
 bh=6o6qPP8lMx7cYOKA/MqaKbaqIjCjGnaiLWr14rPl5P0=;
 b=NRbF0U54kGiCuIEaCtH+kJZMF1mGih6Y4W4ieKVw/wLdtG2+x3AYYQHT9+vQppwBBK
 X0IcMWjIxo2/68gHPiBXmaI14vdNogChkYqgYenZvKrnzvH02nxcP5/yZ0F3tVGL7wUS
 UceiEgTMQmALMtZaYtdeDad+etHsb1BhyFMelQrSsX9oQkil58fKUKMuNuBUh+nqC/Bs
 85Z/ue3P13SBz9u5TsmKkIlm9EhrIOZdYPUkrUG+9VGfN7yoAeKOid7qp0HFFMTuVLM5
 7OSLScIUqkzAhHecPmV4BjLG95Of2p/kvNoH/jSvmxFzNHCqoCqev+kkWN9z2hgfL+M+
 BrwA==
X-Gm-Message-State: AOAM533tPbhgCVWfzKSdMX+c8SshWIZxYHSDXv2I+yF/goJztkUXG0I3
 cvZph4oCFJu4BwYa9VHfef/+401k3et1dgu2I8Zw1w==
X-Google-Smtp-Source: ABdhPJzUkvbAvYEa3k1BsUYozC/xotWpIsogjry89hwi8FrKRfRA/5IIZf6URsj+bAxUF2s9ybtiMe1E4JF5+OFqUys=
X-Received: by 2002:a05:6e02:664:: with SMTP id
 l4mr11033643ilt.81.1602251795786; 
 Fri, 09 Oct 2020 06:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
 <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org>
 <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 9 Oct 2020 19:26:24 +0530
Message-ID: <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
To: Joerg Roedel <joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_095637_923658_5A99FC52 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: Poonam Aggrwal <poonam.aggrwal@nxp.com>, Rob Herring <robh@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>,
 Will Deacon <will@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 9 Oct 2020 at 19:24, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
>
>
> On Thu, 24 Sep 2020 at 15:26, Joerg Roedel <joro@8bytes.org> wrote:
> >
> > On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote:
> > > Yes, the issue was introduced by one of the changes in "dma-mapping:
> > > introduce DMA range map, supplanting dma_pfn_offset", so it only existed in
> > > the dma-mapping/for-next branch anyway.
>

FYI,
The reported problem still exists on 5.9.0-rc8-next-20201009.

[    1.843814] Driver must set ecc.strength when using hardware ECC
[    1.849847] WARNING: CPU: 4 PID: 1 at
drivers/mtd/nand/raw/nand_base.c:5687 nand_scan_with_ids+0x1450/0x1470
[    1.859676] Modules linked in:
[    1.862730] CPU: 4 PID: 1 Comm: swapper/0 Not tainted
5.9.0-rc8-next-20201009 #1
[    1.870125] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
[    1.876478] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=--)
[    1.882483] pc : nand_scan_with_ids+0x1450/0x1470
[    1.887183] lr : nand_scan_with_ids+0x1450/0x1470

full test log,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201009/testrun/3284876/suite/linux-log-parser/test/check-kernel-warning-92014/log

> >
> > Okay, alright then.
> >

- Naresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
