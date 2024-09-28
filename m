Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433F6CF6491
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Sep 2024 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxNN6ObDPviK66IBXCN/qbHlM55h/iDaktZ0+VJacGc=; b=fwGRHqkBpz9fB9
	7vyDco0hl/MEsmYxyzApCQQgT5DJREKIDIL4InDrSZB0tSuTSpMGIck/EnzVc8chqvAjWHUZ2/qEA
	f9pFUznAZ/KkCqV6949oRg337flUeQqZ2vueRg9ok43ZQveH/QIz+DiO5oMw1U95SlTrUmZLsuMJL
	7+2XWOdOhjEAm65SO18RbKmYciw068Td3vqy8A2cuJ1tqNSNwh7GrSXoK6Crn8w9211j3NEjMJNnP
	jZqSjltNxtCj2AJeKEdUx31bTNCws9zkXP73rZ3z9uaKR5pjH+aXY21/Ot7NdAyEh2La/ijdHaKVH
	F4UkXYcUqOodBld4yPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suXCO-0000000D6Aq-3qoO;
	Sat, 28 Sep 2024 13:09:24 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suXCM-0000000D6AU-08oA
	for linux-mtd@lists.infradead.org;
	Sat, 28 Sep 2024 13:09:23 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1suXCD-000000004YR-36QG;
	Sat, 28 Sep 2024 13:09:13 +0000
Date: Sat, 28 Sep 2024 14:09:07 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	John Crispin <john@phrozen.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: mtd: ubi-volume: add
 'volume-is-critical' property
Message-ID: <Zvf_84xxhxwpPgee@makrotopia.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
 <7a2e8819-ac70-4070-a731-53994c72cd79@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a2e8819-ac70-4070-a731-53994c72cd79@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_060922_095043_991C5253 
X-CRM114-Status: GOOD (  24.67  )
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

On Sat, Sep 28, 2024 at 03:02:47PM +0200, Krzysztof Kozlowski wrote:
> On 28/09/2024 14:47, Daniel Golle wrote:
> > Add the 'volume-is-critical' boolean property which marks a UBI volume
> > as critical for the device to boot. If set it prevents the user from
> > all kinds of write access to the volume as well as from renaming it or
> > detaching the UBI device it is located on.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  .../devicetree/bindings/mtd/partitions/ubi-volume.yaml   | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> > index 19736b26056b..2bd751bb7f9e 100644
> > --- a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> > @@ -29,6 +29,15 @@ properties:
> >      description:
> >        This container may reference an NVMEM layout parser.
> >  
> > +  volume-is-critical:
> > +    description: This parameter, if present, indicates that the UBI volume
> > +      contains early-boot firmware images or data which should not be clobbered.
> > +      If set, it prevents the user from renaming the volume, writing to it or
> > +      making any changes affecting it, as well as detaching the UBI device it is
> > +      located on, so direct access to the underlying MTD device is prevented as
> > +      well.
> > +    type: boolean
> 
> UBI volumes are mapping to partitions 1-to-1, right? So rather I would
> propose to use partition.yaml - we already have read-only there with
> very similar description.

No, that's not the case.

An MTD partition can be used as UBI device. A UBI device (and hence MTD
partition) can host *several* UBI volumes.

Marking the MTD partition as 'read-only' won't work, as UBI needs
read-write access to perform bad block relocation, scrubbing, ...

Also, typically not all UBI volumes on a UBI device are
read-only/critical but only a subset of them.

But you are right that the description is inspired by the description
of the 'read-only' property in partition.yaml ;)

I initially thought to also name the property 'read-only', just like
for MTD partitions. However, as the desired effect goes beyond
preventing write access to the volume itself, I thought it'd be
better to use a new name.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
