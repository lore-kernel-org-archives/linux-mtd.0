Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99A7C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 12:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=c56UO64U3J5V6syIu8FvDd649pUu7hxf/T9X09W1TzI=; b=iOAFtt7MDxXnwkVfKQoADJFdZ2
	GaGjoXZ7vRZobonBiNdRgOZqqmJhpvHG5+ST4frdtHpNgVDfmi5vKQNpk/3FeJOY3FEXJUuW7MyQ7
	yVKg+DOJ+pbQibtCAECpaM7UtI4JVXf+r/OGUVGJPwvxKlpKdhCJAoqsg4vjKQfEn5VNLLqcQC1tZ
	ZvI0uwviC8d5gVSB/WGIfy89sXGjI1dQVL1bPm2ZHq7+wJMsALiMnreBrKGM2JKkRna7MHxYfSuKE
	Jiyd6E4W6NTQSo38DyuAC3xdcO+/sCSVw0RLwpp0nlYeZZmiN3dwClwtjP3v3fwSxBNnbpBGOrlEH
	ssnASf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muZuS-008WyI-Lj; Tue, 07 Dec 2021 12:49:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muZt0-008WIE-VG
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 12:48:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 702AACE1A7B;
 Tue,  7 Dec 2021 12:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9956CC341C6;
 Tue,  7 Dec 2021 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638881274;
 bh=FipYZVN6opgkJyf2yaMQFgLB9XPA2FAttOydyqD8x6o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rkUyLQgyfaB3QXijxmpvfxVS5a/eWaNbeLldZ2j1nRN864yONm0UI/3oxNKEk0VlC
 Uk1i2rKW0iCacDZzP988P25tDjZEn77aLOdhqNn5am+0+CnMHQzFdcrPiGYYvuoz5i
 elhJQdprxinIKIE7VlIHuEcP50n9TBYYkbWJfynGiHrC5fgQaEDeKPu8tHs1TdWbzx
 frVVdOLDtfDnvO4RVv7UBL/tkuvnR3hqfX5qc2lXF0KOa62soWajTQN+9mx+sJ5eNz
 dRvxLTOVYu/FzsMyOdYmu7xGiiWl8tXPgORf8sfFWb470eTP8yxb4+Vs7mSNAAjgfa
 UthZ820cAgmWg==
Subject: Re: [PATCH] dt-bindings: mtd: ti,gpmc-nand: Add missing 'rb-gpios'
To: Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211206174209.2297565-1-robh@kernel.org>
From: Roger Quadros <rogerq@kernel.org>
Message-ID: <e3eb7ba9-d333-31ed-285f-ef528ff0aa09@kernel.org>
Date: Tue, 7 Dec 2021 14:47:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206174209.2297565-1-robh@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_044759_274265_2428B7D8 
X-CRM114-Status: GOOD (  14.32  )
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



On 06/12/2021 19:42, Rob Herring wrote:
> With 'unevaluatedProperties' support implemented, the TI GPMC example
> has a warning:
> 
> Documentation/devicetree/bindings/memory-controllers/ti,gpmc.example.dt.yaml: nand@0,0: Unevaluated properties are not allowed ('rb-gpios' was unexpected)
> 
> Add the missing definition for 'rb-gpios'.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

> ---
>  Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
