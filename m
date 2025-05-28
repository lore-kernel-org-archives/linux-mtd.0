Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592D8C3ABB2
	for <linux-mtd@archiver.kernel.org>; Wed, 28 May 2025 18:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TM0OLW9l3wZd9x9wEIlLOhDIB88CBObL46rfCR4VSRc=; b=MO2yYpBJaYwzyr
	iuvsY2plhqlsdP12CqqV47q7X/dDdXk8ibmTzzb+XV2sjilHXaQ9WYc6WPZ5OCtk+c8n915bKKqVJ
	M4vj+FmDbrGj8BucogrhTnOrzJJsap4U2b+yAhpwlp052rKCEpMoqvcbXHcnEYjm7tAduqWceE0mD
	CUT+iteykFS2lowf0O+mEb0k2tzqSXJOErciGkAl+6QsopMtgmebA9Usq1xwlg316E+5Y+6tSoVbk
	zOkByLWzGLtpCIqf+ryblRrpwGsAgZDc0Y4rhGhW67/pMuqHUILRM7p6FIfJORdGO0UhU/ubEnkWZ
	dDnE2Pmt6UnM88PbpROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKLy8-0000000Dx2J-3TX3;
	Wed, 28 May 2025 18:57:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKLy7-0000000Dx2D-2gWq
	for linux-mtd@lists.infradead.org;
	Wed, 28 May 2025 18:57:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA50461F1B;
	Wed, 28 May 2025 18:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48774C4CEE3;
	Wed, 28 May 2025 18:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748458658;
	bh=NP57BkZzjq1plXytv+G2I0CdgzK0RRxKGjgpR/vkFpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sEp2ES2M+ul6PIPV1rZfhiYM/d90zzKKgNVDy225KDFyY1bxf2Dj92txydVum6btm
	 caEqAbBbSyU/ts78I9S8NxWVIZVAYfc1y2CLRBaPx7XdRsMFUTY0d9WStdFuIKL81I
	 EnGoSwXZbtCsyXYGQ9BvZAE19IytBgSlNa5ZBoTve76yq+3fa14y2M9LoVM33DDSk6
	 UQeraxWvFw7UD2WLjzqJ4N2X69jIckJOiiuJ5bHCsrNHmB0nvNJ2EAZawFcdGiUyUX
	 wDscLytqpT9VQaJznHUJwkPOCnCoUFlFALDgV5xoR4tUYnga2j87v4mbOQ35XeqJ9a
	 kJRXKgy0D3ckg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>,  "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,  open list
 <linux-kernel@vger.kernel.org>,  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: jedec,spi-nor: Add atmel,at26*
 compatible string
In-Reply-To: <aDcscr4pF5vC4kNq@lizhi-Precision-Tower-5810>
References: <20250523155258.546003-1-Frank.Li@nxp.com>
	<mafs0r00arpzx.fsf@kernel.org>
	<aDcscr4pF5vC4kNq@lizhi-Precision-Tower-5810>
Date: Wed, 28 May 2025 20:57:35 +0200
Message-ID: <mafs0tt54r2ao.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Wed, May 28 2025, Frank Li wrote:

> On Tue, May 27, 2025 at 06:13:22PM +0200, Pratyush Yadav wrote:
>> On Fri, May 23 2025, Frank Li wrote:
>>
>> > Add atmel,at26* compatible string to fix below CHECK_DTB warning:
>> >
>> > arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at26df081a@0:
>> >     failed to match any schema with compatible: ['atmel,at26df081a']
>>
>> Is there any problem with setting the compatible to "jedec,spi-nor" in
>> the DTS instead? If not, it would better to do that instead.
>
> I suppose it should work. But it is quite old legancy boards. I have not
> board to test it.  And dt also prefer add chip specific compatible string
> before common failback compatible string in case need workaround some chip
> issues.

Hmm, poking around with old DTs is probably not a good idea. Anyway, the
flash is listed in spi_nor_dev_ids just like the others in this yaml, so
this patch looks fine.

Acked-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
