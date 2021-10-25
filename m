Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1565C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 19:52:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A08F860C41
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 19:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A08F860C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kJHX8qqkfz+5DIDCXFGPsz30GtVsaFKzSfobVi88g8=; b=G0IB7yMY7uj9l2
	xXlco03z6uzo3h03hW+UFWktqUB+PBekTBz9Lb9g+4IfOFBdTEj+lV1IRk/u+23kMf1fT8rUdsQOQ
	ALZrklt0eZJt5jR0ZvvyoBubgjh6zQw8+A8Lep1MHevMPRPSepAq2+LTq/k53kLkvbxMTih7WJ9EQ
	kKeXmn/+SLpQWl+AwT0l01hjNZR7YVM/Ja3NZfy4cXyuNHs/CIgNKYZj24NZZcx7i5Xmdp1UmD8XR
	0055BRhjDjZ1NqGHv7RBq3iUA12YOw6VBqU7BTPXNbBn6Kr0wChEstAbMIfjid87fJKpRquhRt8ej
	zvxL3u1wACzv3TcnlQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf60U-00HUmk-CB; Mon, 25 Oct 2021 19:51:42 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf60P-00HUll-9s
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 19:51:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19PJpSBO094824;
 Mon, 25 Oct 2021 14:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1635191488;
 bh=4qqpuu5TH11S5Lbcf+PjEnJZQXBA5hBnF7GwMHAdzhA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=g2WQ7chJQmRdYqwvMvhe4L757Yu6shTkvYnKAgJqPtNwyG//ruvo0P07dLmfmsTbp
 GSkVpJDo8WA7ZYgmGluE2h/DyPvNlk8RjCdPABabJMAjCIdWV1gfqmXju81fPot/yw
 AuxK39hmm24+fqUobj7Wwa4f5HQ9HSyyon97tXpw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19PJpSG0080611
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Oct 2021 14:51:28 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Oct 2021 14:51:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Oct 2021 14:51:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19PJpQmx107940;
 Mon, 25 Oct 2021 14:51:27 -0500
Date: Tue, 26 Oct 2021 01:21:26 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Michael Walle <michael@walle.cc>, Apurva
 Nandan <a-nandan@ti.com>,
 Nishanth Menon <nm@ti.com>, <linux-spi@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v1] dt-bindings: mtd: spi-nor: use unevaluatedProperties:
 false
Message-ID: <20211025195124.nx2whsynpokyg7ot@ti.com>
References: <20210924180705.14021-1-p.yadav@ti.com>
 <YVs1XZmeIdix1m1V@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YVs1XZmeIdix1m1V@robh.at.kernel.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_125137_479196_933118C6 
X-CRM114-Status: GOOD (  46.53  )
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

On 04/10/21 12:09PM, Rob Herring wrote:
> On Fri, Sep 24, 2021 at 11:37:05PM +0530, Pratyush Yadav wrote:
> > Many SPI controllers need to add properties to slave devices. This could
> > be the delay in clock or data lines, etc. These properties are
> > controller specific but need to be defined in the slave node because
> > they are per-slave and there can be multiple slaves attached to a
> > controller.
> > 
> > If these properties are not added to the slave binding, then the dtbs
> > check emits a warning. But these properties do not make much sense in
> > the slave binding because they are controller-specific and they will
> > just pollute every slave binding.
> > 
> > One option is to add a separate schema that collects all such properties
> > from all such controllers. Slave bindings can simply refer to this
> > binding and they should be rid of the warnings.
> > 
> > There are some limitations with this approach:
> > 
> > 1. There is no way to specify required properties. The schema would
> > contain properties for all controllers and there would be no way to know
> > which controller is being used.
> > 
> > 2. There would be no way to restrict additional properties. Since this
> > schema will be used with an allOf operator, additionalProperties would
> > need to be true. In addition, the slave schema will have to set
> > unevaluatedProperties: false.
> 
> I don't see what is the problem. If there's a $ref, then 
> unevaluatedProperties is what should be used.
> 
> > 
> > A much simpler option would be to make controller schemas specify those
> > properties in patternProperties and set unevaluatedProperties to false
> > on slave schemas, which is done in the previous approach anyway. This
> > approach would have the same limitations as the 2nd limitation in the
> > previous approach. But it does not have the 1st limitation since the
> > properties of all controllers are not collected in a single schema, but
> > instead reside in the same schema as the controller. It also has the
> > added benefit of being much simpler.
> > 
> > The SPI NOR binding is taken as the first one to follow this. Other
> > bindings like SPI NAND can follow in later patches.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > 
> > ---
> > I sent the first approach mentioned in the commit message some time ago
> > [0]. When re-rolling this series I realized that if we are going to use
> > unevaluatedProperties: false, then it would be much simpler to just keep
> > everything else as-is. This has clear positives with no negatives
> > relative to [0], as explained in the commit message.
> > 
> > [0] https://lore.kernel.org/all/20210609111707.9555-1-p.yadav@ti.com/T/#u
> > 
> >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > index ed590d7c6e37..81be0620b264 100644
> > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > @@ -88,7 +88,7 @@ patternProperties:
> >    "^otp(-[0-9]+)?$":
> >      type: object
> > 
> > -additionalProperties: false
> > +unevaluatedProperties: false
> 
> This only works until unevaluatedProperties support is actually 
> implemented. Then it's back to the same warnings. In the mean time, we'd 
> be allowing any extra random properties to be added for everyone.

Ok, I didn't know that. I don't understand the validation frameworks all 
that well. I will go back to the method you suggested. Thanks.

> 
> Rob

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
