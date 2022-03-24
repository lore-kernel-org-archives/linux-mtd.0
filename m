Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365A7C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Mar 2022 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EQDIzkgf0huJ7j8MJ7UHbPJJkWIar9dPYKqX/Br5Ok=; b=2BU/DxtKrk6wEI
	MnWvc/RPlBf9ZVFkZikOznQ8PIPbyDvN/8y3rz9+wsAZndPYIy9TxD5yMJpOGi+Iqn5BjPjF0woRy
	2ouExXzvieC3Sb1ThbBHl2369yhvwzE5IgGTt50eLrBrLXcn5h79eLQNeGbZ5CW1EX4a8Dmfe6Bui
	+eC0/8SPdY5aasF7PhK54WzKUDkIyd4HKYvpKwv58UHkZMEj9/ozn05wpFcZTykWwDWED9Fkl24Jo
	rqjq9Iz4vmN6tb4zJX5hfJYJb9Bcwrfe6OAETHaWZlh8MfE1JpCMz6vhIzsCPBI64qqVZw++CPPcs
	8eaybpvef7VfztLldbhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXLwq-00GNeJ-7z; Thu, 24 Mar 2022 11:48:12 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXLwl-00GNdT-V0
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2022 11:48:09 +0000
Received: from Seans-MBP.hinnerup (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 55EC2E44877;
 Thu, 24 Mar 2022 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1648122482; bh=gKPbn1MZQ34mzk/0V7C6NxMFKsrbeYRTr0g3Bli+82o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=K9OiNmONAIUPQLSiZsGhyP7ptHdi4gcKZHx2IDSmT9O+w2oJb0rHRwbDER2yXZ0n5
 hqRrI4GYCBlpMD6diL5IGx+NVV0Khu4GAaxQ9Jy44lNhBuh8rRf+T9og6L8uY+FVWX
 fra6tH+apFVXHzre5IR6d6trYWbC/pdtYTuYXeoKWoJ/+O0bLfq37S8XKy/v+9g0Bt
 d6O1oNEvIjIuJmNJzAil63eO9LYu0pJ5eavFO3uniGWtoeh0cOEULKBAetwQe+kqke
 wGw8XV5pBLuLeIDcBGOJYSSH2YeN7/PUQotOp5+3IR//EXAOeJH6awwbh9mFm+DGfA
 Wp1L6Jey73lzw==
Date: Thu, 24 Mar 2022 12:48:01 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Han Xu <han.xu@nxp.com>
Cc: sbabic@denx.de, frieder.schrempf@kontron.de, festevam@gmail.com,
 ye.li@nxp.com, peng.fan@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: raw: gpmi: fix bch geometry settings issue
Message-ID: <20220324114801.xrniakorpzns3wk6@Seans-MBP.hinnerup>
References: <20220321202028.29017-1-han.xu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321202028.29017-1-han.xu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_044808_203661_36120670 
X-CRM114-Status: GOOD (  19.54  )
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

Hi Han,

On Mon, Mar 21, 2022 at 03:20:28PM -0500, Han Xu wrote:
> The code change fixed the kernel gpmi driver bch geometry settings not
> aligned with u-boot settings issue. For the backward compatibility, it
> still keeps the legacy bch setting as default. Users may choose to use
> chips required minimum ecc strength by DT flag "fsl,use-minimum-ecc".
> It also proposes a new way to set bch geometry for large oob NAND.
> 
> - For the legacy bch geometry settings
> The driver uses legacy bch geometry settings by default, if the NAND
> chips oob size is less than 1KB. The legacy_set_geometry() sets the data
> chunk size(step_size) larger than oob size to make sure BBM locates in
> data chunk, then set the maximum ecc stength oob can hold. It always use
> unbalanced ECC layout, which ecc0 will cover both meta and data0 chunk.
> 
> - For the large oob bch geometry settings
> This type of setting will be used for NAND chips that oob size is
> larger than 1KB, the general idea is,
> 
>     1.Try all ECC strength from the minimum value required by NAND chip
>       to the maximum one that works, any ECC makes the BBM locate in
>       data chunk can be eligible.
> 
>     2.If none of them works, using separate ECC for meta, which will add
>       one extra ecc with the same ECC strength as other data chunks.
>       This extra ECC can guarantee BBM located in data chunk, also we
>       need to check if oob can afford it.
> 
> - For all other cases
> set the bch geometry by chip required strength and step size, which uses
> the minimum ecc strength chip required. It can be explicitly enabled by
> DT flag "fsl,use-minimum-ecc", but need to be en/disabled in both u-boot
> and kernel at the same time.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
Tested-by: Sean Nyekjaer <sean@geanix.com>

> ---

[ ... ]

From my side it's looking good. I have tested this in legacy mode and it
keeps functioning.

Since this introduces 2 changes maybe it would be better to seperate the
changes into 2 patches?

Thanks for finally fixing the Linux vs. U-boot unalignment.

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
