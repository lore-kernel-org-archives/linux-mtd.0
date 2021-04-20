Return-Path: <SRS0=BLSt=JR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79922C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 15:04:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2C16610CC
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 15:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2C16610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zzoc0MmV/HWXsqAv9vibA58P4ngOSQr037YOxyUOvCc=; b=fbug99wNuaxX52ZkcVTWsFTQk
	I/nrpiL1RcKUkCD2yU0CoPohz3saWq16IXvgk8vn5TTTZJYdFVjxeE2V7xhFwGcopaWscgWpQz3T1
	03XyX6yd5DpeORM9egIujfAR73eq2gIHkBXRV2cKEljkjIRT/+pKe4fjm/aPdl7HLoNarsM4/BZRi
	/bHbXzTS+n/83WMjxY/dyfNFtlEOTXv9GyUEIxC0PFNv2E3/h3N/qpn1klcEOj91F526w6X0j47Bm
	kfc0KjHgEWs7UOVCt1NpHGNVO8tVi01i6ftJ2hcQ5DUKmVW+eftTGpcM/kpSC/uxR4DbomwnzL4DE
	bSYHn0IBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYrv3-00CPrg-2M; Tue, 20 Apr 2021 15:04:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrv1-00CPr9-07
 for linux-mtd@desiato.infradead.org; Tue, 20 Apr 2021 15:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Ra38DMf98MFYu630YGYd6KiMOT196r9TyH0tZwWwqFg=; b=4JrM3FNXS96yOQlr/v3h4+QfD6
 MCuGOvQat9osOKreZne2xuHf+AVRo+v6Gd3BoYEa/YmcjzKedwpdz9nmNJMB7TG8LknwRJ8nYFIFH
 GJCRrclsQbYhKxG3KKfFT3EuogsBMzmxLNRUkMWR5/IgoIEGLas21bbklvTx27RwIjQFmfk4SK+Yd
 U1L4/zCDtVexbTuA4C6TB+ptL6+bKUNGLEQBusLwNi1A56j/SZsr+SsOQL8+mG93YjfSFoN1ExRAz
 Uk7mI5cRjqd8CfElnMVbszsmNdOq/UMSwXoc4QHGPJgnO2aCRQ8n+XC+2UkK2ocAk2iXnZVxGjwBW
 x3dDZSZg==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYruv-00CDeF-NX
 for linux-mtd@lists.infradead.org; Tue, 20 Apr 2021 15:04:01 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2FD2322249;
 Tue, 20 Apr 2021 17:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618931032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ra38DMf98MFYu630YGYd6KiMOT196r9TyH0tZwWwqFg=;
 b=AzWNOeIq0/cAZAVzRIWlHSxBbInCZvUBSeR80v5Wz8oGB0ZSQ5fLA9QjD+Z8/CNaHti8Uh
 kRW/TNIwOjaDOL87DNWg5cwET5kGzQciflRY2u+CrgWUecEyNWu9wGzivs3k0hjavpDHBM
 qXQsqW2Kj+x0Z4CK3g+d2cWcI4+sYJ0=
MIME-Version: 1.0
Date: Tue, 20 Apr 2021 17:03:52 +0200
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/5] mtd: core: OTP nvmem provider support
In-Reply-To: <20210420140801.GA3240688@robh.at.kernel.org>
References: <20210416114928.27758-1-michael@walle.cc>
 <20210416184423.GA3715339@robh.at.kernel.org>
 <9f33229a8fe83b49210289fc93a8554e@walle.cc>
 <20210420140801.GA3240688@robh.at.kernel.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <755f8f930844cbef2b32f81bf6585c31@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_080357_963186_48FFE0D5 
X-CRM114-Status: GOOD (  20.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

Am 2021-04-20 16:08, schrieb Rob Herring:
> On Fri, Apr 16, 2021 at 09:26:03PM +0200, Michael Walle wrote:
>> Am 2021-04-16 20:44, schrieb Rob Herring:
>> > On Fri, Apr 16, 2021 at 01:49:23PM +0200, Michael Walle wrote:
>> > > The goal is to fetch a (base) MAC address from the OTP region of a
>> > > SPI NOR
>> > > flash.
>> > >
>> > > This is the first part, where I try to add the nvmem provider
>> > > support to
>> > > the MTD core.
>> > >
>> > > I'm not sure about the device tree bindings. Consider the following
>> > > two
>> > > variants:
>> > >
>> > > (1)
>> > >     flash@0 {
>> > >         ..
>> > >
>> > >         otp {
>> > >             compatible = "mtd-user-otp";
>> >
>> > mtd is a linuxism. Why not just 'nvmem-cells' here or as a fallback if
>> > we come up with a better name?
>> 
>> There are two different compatibles: "mtd-user-otp" and 
>> "mtd-factory-otp"
>> to differentiate what kind of OTP should be used (and both are 
>> possible
>> at the same time). Thus nvmem-cells alone won't be enough. We could 
>> drop
>> the "mtd-" prefix though.
>> 
>> Is there a benefit of having the following?
>>   compatible = "user-otp", "nvmem-cells";
> 
> Yes. I assume 'user-otp' tells you something about the region and
> 'nvmem-cells' tells you that there are child nodes of nvmem data. Of
> course 'user-otp' could imply 'nvmem-cells' as you did. I'm fine with
> either way.

Ah, if I use both compatibles, then the
Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
schema kicks in, which mandates 'compatible = "nvmem-cells";' and I
get the following errors:

   CHECK   Documentation/devicetree/bindings/mtd/mtd.example.dt.yaml
/home/mwalle/repos/b-linux-arm64/Documentation/devicetree/bindings/mtd/mtd.example.dt.yaml: 
otp-1: compatible:0: 'nvmem-cells' was expected
	From schema: 
/home/mwalle/repos/linux-mw/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
/home/mwalle/repos/b-linux-arm64/Documentation/devicetree/bindings/mtd/mtd.example.dt.yaml: 
otp-1: compatible: ['factory-otp', 'nvmem-cells'] is too long
	From schema: 
/home/mwalle/repos/linux-mw/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
/home/mwalle/repos/b-linux-arm64/Documentation/devicetree/bindings/mtd/mtd.example.dt.yaml: 
otp-1: compatible: Additional items are not allowed ('nvmem-cells' was 
unexpected)
	From schema: 
/home/mwalle/repos/linux-mw/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml

Is there a way around that?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
