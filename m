Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4287C4708E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jan 2023 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeMzqdg4FwLt/46BXy6QbX9aDO59Sx82oG6LcJa6y/k=; b=arcNKJjRfHdGsj
	Udsqe0TfasM1xrMMU34tPAJhYpgvHfp4U8VOAKxLO8qdQknBG0xvVB8ge1vlB/fA5C2NVN4aPeQXw
	b/uNhk3ZYykv6wxDHzCOBb7avyiJiIrnO4fwIC2xI8CRtntnAux5eoeAkcj3Svf5sAPmgys2kWO3U
	1qW1Fv+I+WzsDa8mOK1dQ6WemE8bo5M4Ls++bed0QQjjF+IpK1WBRp96BED7veSU2CPW+RCb3vgMN
	rIafd81s5GoB0cdlKvmFngmroQLqDSXkkX1F5UKsS4qf9Y00uwujSlsNJmjsgd1ft2bwHz3K9MC3w
	5XKqsBcU9ngcr7a1QEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYRA-00FRqY-1x; Thu, 05 Jan 2023 22:10:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVBI-00Dkjw-UT; Thu, 05 Jan 2023 18:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/KCS/HHilS8xqDlNaidjuTiF/A4a1HascV4VFQAEG5M=; b=Q2PL5Ow5uCa+DoWeEZ88ebhyuw
	YgAaheuhe5cJLXyP8j5YK7LWmh/rckyNYKZNpv23jGhMdFHmf2fBhnMnaObO2hfXWVtgT3vP6MyV9
	FPHBXBtz4B8Vr5PMQWbXX/DYUIyAmqJAO3VmsB9OXYFWeSx1EATPN9dGa2vF9nbUJNDQr16ACFulD
	G8qAqKPA/yNfLuoG80j6NqAK7ADKtPbqxXlWuZknXS6dwpx0oedE9TbRUhsgNs0S91JvaTXwECfT2
	2CH63Lwy3xPpLKx2039reIL8z3s6JbJMf7HMBmKP51g/C++YWDXQ5TPu/y0Zdj2LUi3DLbh9j3wfM
	DX6ahYvg==;
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDRaF-001P0y-1Z;
	Thu, 05 Jan 2023 14:51:09 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4CF5E855A8;
	Thu,  5 Jan 2023 15:51:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1672930271;
	bh=/KCS/HHilS8xqDlNaidjuTiF/A4a1HascV4VFQAEG5M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sb+lLl5yZaaTODqgFDM6YIV1/0aNdGBaA33R/0SCYPuFlTDcxtk45wadMfj+CI2cj
	 NWGXEyq2CQZmavXOA3sxkH/ZaBOX3APs5F3zN/txxb3erUI+uKJGI4/rrdwOwAbY4j
	 ggUbNjOgsgD/J+qwa92DQdrTti8ZQpsu88yA6rvNnn4BNK+M5jt/zPoKb43KNMf7+8
	 RuIiyGlDHhbAb4f7quueMEYOfQx1z+ncw61YFHg0HTMSSGKMENl5iqgmdFgG8s5oMh
	 CavwIl8PUsPYwySlMQ5Bj/zxOuWObJJZUEJxJsAZQcNOfCH7oKih7gxZEUjMQ+tXVl
	 6h1tG7/uR7eKQ==
Message-ID: <f689c22c-dd93-8143-c730-2af4d472bd0f@denx.de>
Date: Thu, 5 Jan 2023 15:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
 <6f5f5b32-d7fe-13cc-b52d-83a27bd9f53e@denx.de>
 <20221216120155.4b78e5cf@xps-13>
 <Y5xmi62hR6JeYUt1@francesco-nb.int.toradex.com>
 <20221216143720.3c8923d8@xps-13>
 <fb55a784-eda3-8916-1413-581b9436b3f2@denx.de>
 <20221216163501.1c2ace21@xps-13>
 <Y5ydGhn/qYUalamm@francesco-nb.int.toradex.com>
 <20230102104004.6abae6da@xps-13> <20230105123334.7f90c289@xps-13>
 <Y7bG7GFDMS6bmQ4d@francesco-nb.int.toradex.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y7bG7GFDMS6bmQ4d@francesco-nb.int.toradex.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_145107_777508_972593C7 
X-CRM114-Status: GOOD (  21.00  )
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

On 1/5/23 13:47, Francesco Dolcini wrote:
> Hello Miquel,

Hi,

[...]

>> Let's move forward with this. Let's assume my fears are baseless. We
>> might consider the situation where someone tries to hide the partitions
>> by setting #size-cell to 0 even wronger and too unlikely. Hopefully we
>> will not break any other existing setups by applying an always-on fix.
> 
> Nice, good!

Indeed

>> I would still like to see U-Boot partitions handling evolve, at least:
>> - fix #size-cells in fdt_fixup_mtd()
>> - avoid the fdt_fixup_mtd() call from Collibri boards (ie. an example
>>    that can be followed by the other users)
> 
> Fine, I can do it.
> 
> However I am just not 100% sure about your proposal, I wonder if we
> should just deprecate this function or we should fix it.

I would say fix it.

> The exact end result will depend on the discussion with the U-Boot
> folks, but I absolutely agree that the current situation needs to
> change. I'll keep you in CC on those patches.
> 
>> On Linux side let's fix #size-cells like you proposed without filtering
>> against a list of compatibles. We however need to improve the
>> heuristics:
>> - Do it only when there are partitions declared within a NAND
>>    controller node.
>> - Change the warning to avoid mentioning backward compatibility, just
>>    mention this is utterly wrong and thus the value will be set to 1
>>    instead of 0.
>> - Mention in the comment above this only works on systems with <4GiB
>>    chips.
>> If you think about other conditions please feel free to add them.
>>
>> Do you concur?
> Yes, I do agree.

Same here, agreed, thanks.

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
