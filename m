Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086DAC4167D
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 12:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/Jijre227itdY0ksaAo0Uh/KV5W2Niq/j2SA7jUSog=; b=D5uBh9nNyeOraIuM/GbzoAghgV
	4baUPn6Nhhhp5pne+mhn+LmbtlyWeoS6ufDgNUtcDlxbtnNC8PtL+18M3sllVXtJzKO6I6s0RyJ+q
	YgLDjsZVM6PzYv5QVADXcjAp/2sJ9VwZU2f+Esw3nCVBGE/Xlh6OF41DE71h1/JFF9HfS4Hil/aY8
	NVi4SpMf5Q5ZGT8H2mQwJJL24IlLI/vciaslFgn5sgaE0htRQwlz+2OAgDwLnV7W/iTKOK3GPzw0e
	XZbBuy7bmQCYnyTuL5nfzWtJrmYzuhtUxb+F6oNzuTllFUVOKWL9Gjh71EHh6X5vXMiAEruiFDaSv
	VPVKxf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAN8-007UQ3-07;
	Wed, 01 Nov 2023 12:30:58 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyA7A-007O7U-15;
	Wed, 01 Nov 2023 12:14:32 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B92F787AEF;
	Wed,  1 Nov 2023 13:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698840864;
	bh=GiiyJnjZkinvB5qBEQoHcP/q8hTqDjw32FjiwfNvL3A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oecmnAoHlNUTaAnjjh+VO/kVW76+tEIQMQ8Fs2+i0MH+H56BzKam2mU8wYcoFnVE/
	 /HVqcmI/X8G9jXg5YsQEKyT1lVM6E0Inv1rwFPR69Izlx43XEI4D2xkqJVVX1vidyl
	 /NZyiEA4dPr4ZVlvjpwj/dTFGSuIv7wID7+xa1NnkcmraQmjJyhAWO8MCgf+dUijya
	 es+3wLceDFfz9XEJrC8cnVM69E128IS1j33gFmKoQkJGpShdBSTFFNoGE4Vb8HtIBm
	 WqH4cwLQVQz3y/NRgLemHCcV1VFkldu9rm1K6Jazy1xT6BGKqnb8jXSfZTcpcNVdI+
	 jIDOpEiyrd/Rg==
MIME-Version: 1.0
Date: Wed, 01 Nov 2023 09:14:24 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com
Subject: Re: [PATCH 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <fe6ccf43-7b71-4db6-a8de-9b33474d5a3c@linaro.org>
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
 <20231101094325.95851-3-tudor.ambarus@linaro.org>
 <fe6ccf43-7b71-4db6-a8de-9b33474d5a3c@linaro.org>
Message-ID: <581c79b6423958c4e428f2f7d95b3916@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_051428_604659_F2AB97D1 
X-CRM114-Status: UNSURE (   6.45  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

Thanks for working on this series, appreciated it.

On 01/11/2023 09:05, Tudor Ambarus wrote:

> and here I should have iterated over all dices, whereas now I erase 
> just
> one die :).

Would you like to send a v2 or let me know the change I should make 
here?

I will be glad to test it.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
