Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47124C48297
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AV5jXm+Cs14bC0+c7y48PByADirSthsIzq/GsHvB/q0=; b=rdGIcLodS9V8P7
	L6/KziQHC/pVwhsY5qFiRppOxDTStaO5/BjsBNn7Adk20e5M8Tkvq0PNA8dt2kKWWw9N/kcR8C4SR
	OMVmBWUdELy8CBkZZ48mNbTi/j/JXfH/AK8xHEEZL7ZC0yNmvLFuxshyWjjLK5AdWIxnFoa6K3CN1
	lpxmQ8SrFOxGTr8h6drGB9uCZIdF7e5IrdjQaB7OkcC9lqd6ha3FJjDVyxD4bVX7FR+dd9qcXQUNC
	lbr6CePHuSWpoUw+KDzqjErOAipf3th3qM03DAo/CJgLKL8H+8V1ZpZNPdaj2AEYNtdyRI83DSMn0
	VsaQc58enDSzfAdyZXrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRxj-00000004euc-2Q2m;
	Mon, 12 Feb 2024 08:46:51 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRxf-00000004etI-0quA;
	Mon, 12 Feb 2024 08:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707727604;
	bh=MrwKiPYRPkaUYKLWtoU0XksSmS1raWmw/40HvRZXI+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4QO9jfl5nZOSzTHkdnuCtf1s6Pj06nhsiAXE7a2JwM6wG6yLJvyI4oiQb8s5tzzEt
	 uYf54+YYSy52QWb1hrPnh5qw5xnmE8+e5eWchvMXhmjmFnwV+x/E+IhyomZYAUy8Vy
	 r2tlkwNhYhbCeX0WwgTvuyUprxjymuHjEYMSKyI1mxUPvjfxGxeAl+0paFHqi4W4fQ
	 7tx7FkBwzuG+BeJN10J6q5ngB+Y4YKzCckp9BokyqDYhJJvq+FXakWYx10NNAgzHj8
	 P93H/C06gnZz8bzZcZtiok2AXW1gxaDJWZ05tkBOu+4wRw5duVpM8UgdYQMKC5kWw5
	 2qwmFvE/2Uuaw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 78C703782051;
	Mon, 12 Feb 2024 08:46:43 +0000 (UTC)
Message-ID: <d7bbca9f-466a-4595-b02d-703dd22c3386@collabora.com>
Date: Mon, 12 Feb 2024 09:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: rawnand: Prefer struct_size over open coded
 arithmetic
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiko Stuebner <heiko@sntech.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Rob Herring <robh@kernel.org>,
 Li Zetao <lizetao1@huawei.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org
References: <20240211091633.4545-1-erick.archer@gmx.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240211091633.4545-1-erick.archer@gmx.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_004647_402175_03E6A230 
X-CRM114-Status: GOOD (  12.50  )
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

Il 11/02/24 10:16, Erick Archer ha scritto:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> As the "chip" variable is a pointer to "struct mtk_nfc_nand_chip" and
> this structure ends in a flexible array:
> 
> struct mtk_nfc_nand_chip {
> 	[...]
> 	u8 sels[] __counted_by(nsels);
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the argument "size + count * size" in the
> devm_kzalloc() function.
> 
> This way, the code is more readable and safer.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Just noticed that there was a v2 already addressing the commit description issue.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
