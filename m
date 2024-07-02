Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFA8C30658
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2024 12:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+r8Z03E5H+bo+2xKz4JapdyGIEDD9u4F4EaawsLUVc=; b=iGmQNo6vrZp/Hj
	bbWkOoJIvAtPB+ndVSS9v2gyiIVoE8Zej8AABxwFgRE4x7vZcQP00OveLOZFfHzN49tFtGVFU+FjB
	EA00KIQioSc4O1akdkAEhGfxzBdHB6FKVHZNTrEMile0u6hweJNhIUMUvEXsPmOgvGlx6nEoDNuJ7
	0y//mJDVEyn4D8JfxGqHRvuLLf+2K9RZR8JXSlE++oQ/o7Tk1+GtmMcMuHz+gpXrwPPAP00yy48Gp
	EpgReowADXCFxSsS770XoiQQ/uJnnqvs7JQKdgOwx2G/562AR3s3VZiasEgrgQx7IrsUV9C8VNHKr
	kIAyYEW8QwiQw6Dk5DWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcDE-00000006bPL-1lAL;
	Tue, 02 Jul 2024 12:02:20 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcD1-00000006bJQ-1qJs;
	Tue, 02 Jul 2024 12:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719921721;
	bh=FXwb3NDkOXba4t5aP3C9g00gzWbtwMStp3ogpDj4GB0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Kmu+FjaMZERhRfktDqkks74plxvjyoFLsSJvWsb0Nge/HXsLlzHBYtPYdiNo2BxTJ
	 8HRfkJzZXvErLi9BgRPoJ1tltiojXBQ2G4GTmHJGmTFjBSLAEgTddJV9pDOuhG049l
	 2vTAwgis/bp9h4cQVwK7PraMeJT7QNWNqLC0ygfuPGvUVV9ZVwYuiPaAuNRnOfDs3X
	 /rYRv4LlwLS5bFLTrPxWJNAlbJgEkTJoEB66+3nDsX5AeQw/4vP4NYmKjgheo4qrVF
	 ioObEliwijeZ5NVR/Bw35UwDMnwD+dH9/fNXyD98M8ztr5gJAInnpZXNaQi4bwfIIv
	 dnCWXznUN+uyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WD1jf61Dfz4wc4;
	Tue,  2 Jul 2024 22:01:58 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Esben Haabendal
 <esben@geanix.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] powerpc/configs: Update defconfig with now
 user-visible CONFIG_FSL_IFC
In-Reply-To: <d203dd45-fe69-48dc-aa36-d9870065f2e9@kernel.org>
References: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com>
 <20240530-fsl-ifc-config-v3-2-1fd2c3d233dd@geanix.com>
 <d203dd45-fe69-48dc-aa36-d9870065f2e9@kernel.org>
Date: Tue, 02 Jul 2024 22:01:57 +1000
Message-ID: <87v81oj93e.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_050207_812907_D02CF68F 
X-CRM114-Status: UNSURE (   6.62  )
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

Krzysztof Kozlowski <krzk@kernel.org> writes:
> On 30/05/2024 16:46, Esben Haabendal wrote:
>> With CONFIG_FSL_IFC now being user-visible, and thus changed from a select
>> to depends in CONFIG_MTD_NAND_FSL_IFC, the dependencies needs to be
>> selected in defconfigs.
>> 
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>
> Anyone is going to pick this up?

Doesn't it need to be merged along with patch 1?

cheers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
