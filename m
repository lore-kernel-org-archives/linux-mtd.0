Return-Path: <SRS0=cj04=IH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447EBC433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 07:58:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD1B0652A4
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 07:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD1B0652A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y3oEaasjsAyf9XLUL4uDHLqbz00Z4dBXG/Kr7SMhpT4=; b=XKm2mR7wnMBM8D2CZyZ7bTaDs
	jWB8VLUL33fSWk5l8ZPXAkW+D3yV8URGpSC7ntwpZesehUFI1rxDAoI14vpEaMhVOmA23DcgZWsIF
	0WHktVKFQ2Fc8L2C6+Sl+bHrJIltpBAI2L0Zc5b9LzfkNs3qVFFuVv8jI429KK2KFibrcfhhp5srz
	4S1nIpCC4SQblSIPnQMGWebKeRHp/CnhUCnrVecieP+uHerWOGyyrN+6FJ9IOl4RT4uo0iUE1q0pF
	+FMH1PRGztTNACOS6RCTe/9g5fEEtfNgEo5EcJad6EQQ8dhfF+ybMKov4ra9XpMKKAZxZ8Ucj7hHv
	9Fl07lngQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJXF9-003zSn-D1; Tue, 09 Mar 2021 07:57:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJXEs-003zQL-Ac
 for linux-mtd@lists.infradead.org; Tue, 09 Mar 2021 07:57:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 85B731F44A74;
 Tue,  9 Mar 2021 07:57:09 +0000 (GMT)
Date: Tue, 9 Mar 2021 08:57:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniele.Palmas@telit.com, bjorn.andersson@linaro.org
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: Add a property to declare
 secure regions in NAND chips
Message-ID: <20210309085706.2d6bd0f0@collabora.com>
In-Reply-To: <20210308133134.GC5457@thinkpad>
References: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
 <20210308054447.28418-3-manivannan.sadhasivam@linaro.org>
 <20210308101059.08658fbe@collabora.com>
 <20210308133134.GC5457@thinkpad>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_075710_906662_8EE7EA62 
X-CRM114-Status: GOOD (  27.07  )
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

On Mon, 8 Mar 2021 19:01:34 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> On Mon, Mar 08, 2021 at 10:10:59AM +0100, Boris Brezillon wrote:
> > On Mon,  8 Mar 2021 11:14:46 +0530
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> >   
> > > On a typical end product, a vendor may choose to secure some regions in
> > > the NAND memory which are supposed to stay intact between FW upgrades.
> > > The access to those regions will be blocked by a secure element like
> > > Trustzone. So the normal world software like Linux kernel should not
> > > touch these regions (including reading).
> > > 
> > > So let's add a property for declaring such secure regions so that the
> > > drivers can skip touching them.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > > index d0e422f4b3e0..15a674bedca3 100644
> > > --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > > @@ -143,6 +143,13 @@ patternProperties:
> > >            Ready/Busy pins. Active state refers to the NAND ready state and
> > >            should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
> > >  
> > > +      secure-regions:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +        description:
> > > +          Regions in the NAND chip which are protected using a secure element
> > > +          like Trustzone. This property contains the start address and size of
> > > +          the secure regions present.
> > > +  
> > 
> > Since you declare this as a generic property, I think it'd be simpler
> > to do the check at the core level.
> >   
> 
> Hmm, so have the parsing logic in qcom driver and check in core or both parsing
> and check in core?

Both in the core.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
