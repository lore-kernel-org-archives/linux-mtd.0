Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAB1C4706C
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jan 2024 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thoILbKqdb6ScjsHMAJW0EhRBGHJoGqOkhQHEWpCOC8=; b=H4v6lpBCnmvB3b
	3r1sawJvJ5VnZgKeRRCb25IlL7g5hMoI7B4Pf1FTujq1lfCZz7sUVaZOhYnEbEAlyODnkuipO3Bo8
	RhwKM04WwPdgI0BP3mDPJC6TpQ5Yi7piMLxJSxP6b1Tpqc4GxlseauGh5mIzXkjXzwwVDQQVuoIqA
	lpmrnbIdtaSTBYvOK/tE3PljDQGKlpnvCnn5TYXh3dOBHLVs2MlCD3AFGLYc5ROBofU/KEoO/cZy2
	NKai51/fIsPQoz1ah7A087ogEwR7pi3dUW8ECvMtu+ObnczTJXJrkRAKlP/Xf4ucWcJiPwzgeoGDQ
	E1NssJKLJXVnk70fkrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNJY2-009Xlz-0v;
	Tue, 09 Jan 2024 21:22:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNJXy-009Xkv-2c
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jan 2024 21:22:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 06778B81A66;
	Tue,  9 Jan 2024 21:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8CAC433F1;
	Tue,  9 Jan 2024 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704835324;
	bh=wc05eXzLAZHA4XJcdaJKh8o0upGkPyKt64W55IJkYEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmflrM0NA1BFhHvPv0ppqDOdQPA8QfEw+ATTo61a0bT63CqmeIadLGseGKpiQKXUH
	 tcm85TelA0P7Ol4NqYBMyKGaFcAM0XUpW8KBLM+wql3yBDLe+0dt3PXPITXD/o5Ciu
	 pnG1c/RvygLr+hiWm0yeErLXGMPi+K1BPD6y/dU3P16/rFACra5A0l26vzPmHqihO0
	 Tds9IUu2B6lPfIUeImzGZkpMmUXRikEvXVzDPAMN/ZTXXWxgi8zjLs8L3U1ymURDuj
	 DGPqZLtA2VBRmu5G88w689qC0VrTXRBFM418qFmwWvHaHfXZttt0kq9xZRhatqcRjS
	 v1H/UzcdB7Dcg==
Received: (nullmailer pid 3241456 invoked by uid 1000);
	Tue, 09 Jan 2024 21:22:02 -0000
Date: Tue, 9 Jan 2024 15:22:02 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com
Subject: Re: [PATCH] dt-bindings: mtd: Change the schema for nodename which
 includes "sram"
Message-ID: <20240109212202.GA3236341-robh@kernel.org>
References: <1704367382-29979-1-git-send-email-quic_zhenhuah@quicinc.com>
 <20240109184323.GA24189@hu-bjorande-lv.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109184323.GA24189@hu-bjorande-lv.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_132207_222376_F38A5D06 
X-CRM114-Status: GOOD (  27.81  )
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

On Tue, Jan 09, 2024 at 10:43:23AM -0800, Bjorn Andersson wrote:
> On Thu, Jan 04, 2024 at 07:23:02PM +0800, Zhenhua Huang wrote:
> > Node name which includes "sram" not only represents MTD devices, but also
> > lots of sram devices(eg, qcom,imem.yaml, rules in folder sram/*).
> > 
> > To avoid the conflicts, change the schema as:
> >  - if node name includes "sram", must select "compatible" to match
> > (I have listed all "comptible" string in mtd.yaml by searching
> > drivers/mtd/* to find applicable drivers)
> >  - if node name is nand/flash, use "nodename" to select.
> > 
> 
> You're right, it doesn't seem appropriate for the mtd binding to be
> selected for nodes intended to match e.g. the qcom,imem binding.
> 
> > Fixes: 7bdc671822e9 ("dt-bindings: mtd: physmap: Reuse the generic definitions")
> > Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> > ---
> > Hello,
> > 
> > Tested a few devicetree nodes, which confirms:
> > "qcom,imem.yaml" which in sram/ not matches with mtd.yaml anymore.
> > All nodes include string "sram" must have "compatible" which listed in
> > mtd.yaml to be matched.
> > 
> > Current I just modify the rule for "sram" as it is definitely conflicting with
> > rules in sram/*. I have not much backgrounds on nand/flash whether they may have
> > similar conflicts.
> > 
> >  Documentation/devicetree/bindings/mtd/mtd.yaml | 24 +++++++++++++++++++++---
> >  1 file changed, 21 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> > index f322290..1704437 100644
> > --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> > @@ -10,10 +10,28 @@ maintainers:
> >    - Miquel Raynal <miquel.raynal@bootlin.com>
> >    - Richard Weinberger <richard@nod.at>
> >  
> > -properties:
> > -  $nodename:
> 
> The mtd binding is $ref'ed by other bindings, similar to how we do with
> other bindings of common properties.
> 
> So, I think the problem with mtd is that this ($nodename) turns into a
> "select" automatically, which causes this binding to match nodes by
> name, rather than just those $ref'ing it.
> 
> 
> We should be able to avoid the automatically created select from the
> $nodename, and rely on $ref, by just adding:
> 
> select: false

Yes.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
