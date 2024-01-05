Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B704C3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dihJH1mxE5cCiL1L79WgMoof/m/Nv9kkMg1iS0HKOJk=; b=1Ti1VkWde2fKTrSgJ+wV1JZX+m
	4Hs27zgYk/bkVtRSOiYYO9j4JMjX1EW4Eh9bSsjoKqWUKIkWwRRakz6/cqsTlVah+ILP/8OhRDsMY
	sbT4Nx9uA4T9GDWqqEBjO/BseDNUEx32www8z6w9M8jgJD3FD//KlAjBZMyhDxouUQq0qfoyReGoa
	9+kRYMJyY7GPO2k4+FS4QeAbn900XxzbudgUmX6vH3B9P7W5HAlMdUE7UEMI5FZGeLL9ivHeTAxAC
	HzKaMtvULgz7q10fXo3zRCj4vhHxeH+3klaoCFoZU6bQe6TptnJrZgEJF0Ttj/YU5zi06DEHb2X3q
	oZ7N7k9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjz1-00GvrT-2h;
	Fri, 05 Jan 2024 13:11:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjyy-00GvqY-3C
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 13:11:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 62AA7B81BF0;
	Fri,  5 Jan 2024 13:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DFAC433AD;
	Fri,  5 Jan 2024 13:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704460286;
	bh=EtiM//etR1fOVaO+StSdQfBUoXtwOAwKntG3tI7CDSw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NgN6IiBL3NPIrVa2SiHOfDSIcLXKXnB1JQQ09mja6RxLEU/zdJDmz78t9+57gMjDb
	 oHPdENqkkjFON8sVNBiFp/TIA64K1gEVzRCArAeidL5Efv9V7S2uijaLRFQAuks3YG
	 ZPw1t9uqIqUH33+DlLyPsENC+VWEVWuk3CKVxEJCzxaXrBmXO8GxX8F1FzRa8+jWAC
	 akRxAQ7bjo2OSk+LWWobrQUnKKRvomUkWm8+2sm5maisPt6ucuz3LMY0M0ayoUE1rW
	 kWKyRJltADdFienFcFWhFlxrgHlmJAmJqRCRK6OzbhjYq7aD5qfA4MJ6a6cxAuq3WT
	 wUtzP581sraWA==
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 14:11:22 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v7 7/7] mtd: spi-nor: add support for Macronix Octal flash
In-Reply-To: <20231221090702.103027-8-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-8-jaimeliao.tw@gmail.com>
Message-ID: <567aa585b1c4746cd90b003a67459b3e@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_051129_178031_1FD5B46D 
X-CRM114-Status: UNSURE (   4.13  )
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

> +	}, {
> +		.id = SNOR_ID(0xc2, 0x83, 0x39),
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x80, 0x39),
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x85, 0x39),
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x80, 0x3a),
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x85, 0x3a),
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x80, 0x3b),
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x85, 0x3b),

Should just be:

/* We need the manufacturer fixups. Keep this last. */
{ .id = SNOR_ID(0xc2) }

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
