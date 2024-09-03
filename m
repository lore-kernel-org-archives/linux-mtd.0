Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED397CA101E
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 06:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsDgVVN2tC1npW4Wpn3aUncSHUSoUP3D+qe6Wf5rONE=; b=2WHUKj8DrF0D0P
	VdebQdHM9Kms31RAa7bBsNqFLd2B8SHFs2+1l5ZfsCL4Mk8xD7C06+B7Z1ZRp8ZcL74V8+M1/I5Ax
	J9hUSNWxOLk3B5ElEqnYqdUNpmWYWUs6glGwQXOt6YnYqZgFjQnuBlfHq9opnxkJ7AZbqG98SfTfn
	PKIsHskyHo9HiJyriAWrAhEKCT1TL44d6hjFIqDpON9Dx8DJPURf6MDyX+NiR9QszHiqLOHM7Z0MR
	bBZOPmDd7inomYgrUA/qc8iVrzxRrsZWPjnccRaOpv6eP1pMoKgZo53RsxBR8ybHGSdJ620mBBmgJ
	3mbs9Cl/8iLtGJLidI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slNKB-0000000GWVo-0Ohn;
	Tue, 03 Sep 2024 06:47:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slNGs-0000000GVex-06uX
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 06:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6172E5C59C5;
	Tue,  3 Sep 2024 06:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0498C4CEC5;
	Tue,  3 Sep 2024 06:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725345848;
	bh=y+qVchVRj2J0kurjqFF3Kzdqtrymg26dJqbZeQt5kvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KwpyAA4U7s4FyZ4JYwp7GY20eFDluiIC6+6NseD68NxdpMKhO0aTDVpjNFIrDHgma
	 q1e+K+1vxDMluzb+7idcch0rjCQxGhc2AdJr1g1Nx/AJcJkM4xAEalQyLv0BFN7TWr
	 A5Gx7wEV7FqaiXOl9Fp1xZUpwvh1qByTMawRS03WF6SlJFOgvf5NbV3ntJouROYcnc
	 NnDuASkCmu/gmKBL4MivVSuiyG6XoQgKgjmjYEVQKfCGJjaHJ6WhcKKsvgPO5Gps14
	 nyC2JI2WyZQw/63VLF9xSr6No9DKX9pJq3W+mlvyExKitS3JhSBqyyi1032vyJpgA+
	 z6Z51T8o5wSqg==
Message-ID: <f5a1d0bd-59d6-45cc-9e8e-0e665e7fbe65@kernel.org>
Date: Tue, 3 Sep 2024 09:44:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: ti, gpmc-nand: support partitions node
To: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>, srk@ti.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240830-gpmc-dtb-v1-1-792cac1ef3cc@kernel.org>
 <20240830174302.GA551760-robh@kernel.org> <20240902161545.3ca266de@xps-13>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240902161545.3ca266de@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_234410_184081_EE060A9B 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
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



On 02/09/2024 17:15, Miquel Raynal wrote:
> Hi,
> 
>>> +  partitions:
>>> +    type: object
>>> +    description:
>>> +      Node containing description of fixed partitions.
>>> +
>>>  patternProperties:
>>>    "@[0-9a-f]+$":
>>>      $ref: /schemas/mtd/partitions/partition.yaml  
>>
>> This and the addition should be replaced with a mtd.yaml reference.
> 
> Yes, indeed.

Thanks. Will revise and send v2.

-- 
cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
