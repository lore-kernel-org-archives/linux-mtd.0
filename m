Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DF3C5475B
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 13:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EM+LVXwkO2cX9XFUvEjL+Jyc19ePmnA48XvdaFGdid0=; b=o6DhJGM/sWDv2H
	mqWs0y9wuUqzAYe50OlcLcOwF/s6O0Jes+iqU42pj9Kop5pSAbnsJ0b4Yt3inuzP30wGAKCD7+GWR
	7eyhpkdd8p4BvaZKhNPv7f7uNaYlFRNggzjYYLij9lKpvurANdJnVgJLY3dS8lDmzu2XvKepVxdAp
	nOGdEkoE2Eg5B7NPlKxjk/LyO0xCllJfElGiHCOkpqbvjskP/Pq/GJH/qL2bd/2CTpGVV2D6BPHJX
	JBmzAz3JHNxL/2EDev04xPGOgkByJQOH9POEd+4n7a3EEc/zdpPG4tSe+Dpe4tLI0JczRRaY2NXjq
	VntVPDc0ZhvZsFE8Eqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcQCz-0000000EuAc-2f5Y;
	Tue, 20 Feb 2024 13:30:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcQCx-0000000Eu9g-0bXC
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 13:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9555160FA1;
	Tue, 20 Feb 2024 13:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BB3C433C7;
	Tue, 20 Feb 2024 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708435850;
	bh=bbj3y4eCKYu8edd6s/J1h95MOajslQplxsNHJioQ1vU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XToTX1eptrMh9lpJtc2USXtSKsvQujFLqzzEhMdpwRr7eUFM5itRkHD06hj7xu4ti
	 RPxSSa4/xepD/sb7FAZ0x+UVyFrX0qCqgdqGXwSJ03OWvNzKc1EULIiYIegV9jtRfw
	 llJxjPtKdRhIyw41ZPYZh/Ye6ash7u+UcF1s/zS3erOZUrmk9dLc92v5LjuUt0SarU
	 zBOyTipEXpWFAJn1ejP52l9secKfeM1OWrniTFl5THR39w29gqI4dED1lZOA8Rdse3
	 YVsXT5w+dNQjcxJtHiSbyRhFxBzMi8tG/PYO9izPVej4RQeqcyn2mCUx/HvJHz0x+I
	 Me60PVRFCgc9A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,  Yazan Shhady
 <yazan.shhady@solid-run.com>,  Rob Herring <robh@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] dt-bindings: mtd: spi-nor: add optional interrupts
 property
In-Reply-To: <741c19b8-55f5-4f3f-8391-10fc2758e687@solid-run.com> (Josua
	Mayer's message of "Tue, 20 Feb 2024 13:31:14 +0100")
References: <20240219-mtd-flash-interrupt-binding-v7-1-206e30a656fa@solid-run.com>
	<mafs08r3f8h16.fsf@kernel.org>
	<741c19b8-55f5-4f3f-8391-10fc2758e687@solid-run.com>
Date: Tue, 20 Feb 2024 14:30:46 +0100
Message-ID: <mafs034tn8dq1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_053051_247847_09165944 
X-CRM114-Status: GOOD (  14.48  )
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

On Tue, Feb 20 2024, Josua Mayer wrote:

> Am 20.02.24 um 13:19 schrieb Pratyush Yadav:
>> On Mon, Feb 19 2024, Josua Mayer wrote:
>>
>>> Some spi flash memories have an interrupt signal which can be used for
>>> signalling on-chip events such as busy status or ecc errors to the host.
>>>
>>> Add binding for "interrupts" property so that boards wiring this signal
>>> may describe the connection.
>>>
>>> Signed-off-by: Josua Mayer <josua@solid-run.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>> Acked-by: Pratyush Yadav <pratyush@kernel.org>
>>
>> BTW, I don't see any support in SPI NOR for handling these interrupts.
>> Do you plan to add them in a later patchset?
> No current plans, I have little knowledge how spi-nor works in the kernel.
>> If not, what do you get by
>> describing them?
> Foremost I get to submit a correct device-tree (describes hardware)
> to the kernel, without maintainers getting all over me for introducing
> new dtbs_check errors.
>
> And I really do prefer submitting a complete device-tree so that all
> knowledge I have gained reading private schematics is readily
> available the next time someone works on it.

Fair enough. I guessed as much but thanks for the confirmation!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
