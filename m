Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5799EC0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2025 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4yFjynTnbt1nGQ/ONozja+qCDk6oYKXNErSQBur+PA=; b=EYAk0pyNrXYRuY
	A6OlqCG9Fq5tOBQfCLEF+c+fdRlF155riQXwX/JMFYZt7r9Fl0AQDoiqIYqWkCrXbs6fj4wcEC5aM
	VLV/9xB6dLkXvNkfXhVyu+LeUK4fXgTTyfHPLU/6PCZB8Zr6YsBdrn6D4zpf3tro+gJECZargQcvE
	hUPnBq8NE2er903EBmzQf3SaysgUqAIaxomlDoMO4dsQrZ6SgB/2EQ5Q34864wHJtQysgn4b0x0KU
	uO5UgHwrbpR8F/fTpIy+n3e7cn1VB1Vqk9Cg5Fqxy+6RHlPU59XHva6AxP/50PkcgZ5yql8KJa9+0
	+a5rZW5c1IdGS3E8b6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAA3-00000007HED-0hiH;
	Wed, 29 Jan 2025 15:39:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAA0-00000007HDn-0jRW
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jan 2025 15:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 375CCA40444;
	Wed, 29 Jan 2025 15:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D45BC4CED1;
	Wed, 29 Jan 2025 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738165162;
	bh=d43wTg1xnHR5CahqpdWTCRzF2l/LHrbFnCssNqyFVDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B+TO1bxTFq1qC1R8rmuIU2k8AcLS/uBKhnr99ZMItwQOXceXmiUuCCJ3PAqqW3Lg1
	 9qrtu+HjAtinLCXk2H+B6nOQ0piNPjxLN5im6hPwFeeOlrUi4L0SMvdKGt4XjICP7G
	 7AFHFJcEV+sqj6NONqKZi6nC3mConI/YcyknpA+vbXx9y2ZD61rgr6ve9lK1J7YTHz
	 mZTJLW73Tt8pIyhk92468ElcvuubV0IXmgsBA1tdoZ/O8u6EW+Zy7gzHgHp31pOa+d
	 TDW6HsABNpM/eodaBWFWSlvpca81caeoRCE9mA1LRoQn3b96p4T+vUItli3DgXK8VG
	 mVHyzYAnbTRNw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-1-735363f8cc7d@bootlin.com>
	(Miquel Raynal's message of "Fri, 10 Jan 2025 15:49:30 +0100")
References: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-0-735363f8cc7d@bootlin.com>
	<20250110-winbond-6-12-rc1-nor-volatile-bit-v3-1-735363f8cc7d@bootlin.com>
Date: Wed, 29 Jan 2025 15:39:19 +0000
Message-ID: <mafs0ikpxk4t4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_073924_352191_DDB3ABE3 
X-CRM114-Status: GOOD (  22.41  )
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

On Fri, Jan 10 2025, Miquel Raynal wrote:

> Add support for Winbond w25q01jv spi-nor chip.
>
> This chip is internally made of two dies with linear addressing
> capabilities to make it transparent to the user that two dies were
> used. There is one drawback however, the read status operation is racy
> as the status bit only gives the active die status and not the status of
> the other die. For commands affecting the two dies, it means if another
> command is sent too fast after the first die has returned a valid status
> (deviation can be up to 200us), the chip will get corrupted/in an
> unstable state.
>
> This chip hence requires a better status register read. There are three
> solutions here:
>
> 1- If we assume that the most common situation producing this problem is
> status register writes, maybe we could change the "non-volatile"
> status register write commands to become "volatile" status register
> writes. In practice, what takes time is the write operation of the bits
> themselves, and not the activation of the feature in the internal
> circuitry. Enabling "volatile" status register writes would make the
> writes nearly instant.
>
> This approach, besides probably being the less impacting one, could
> overlook other possible actions where both dies can be used at the same
> time like a chip erase (or any erase over die boundaries in general).
>
> 2- Wait about 200us after getting a first status ready feedback. This
> 200us is about the maximum possible deviation between dies and would
> cover all cases.
>
> 3- We iterate manually over all internal dies (which takes about 30us
> per die) until all are ready. This approach will always be faster than
> a blind delay which represents the maximum deviation, while also being
> totally safe.
>
> This third approach has been adopted. A flash-specific hook for the
> status register read had to be implemented. Testing with the flash_speed
> benchmark shown no difference with the existing performances (using the
> regular status read core function). In practice there are difference in
> the experimental results below, but they are part of the natural
> deviation of the benchmark:
>
> 	> Without the fixup
> 	$ flash_speed /dev/mtd0 -c100 -d
> 	eraseblock write speed is 442 KiB/s
> 	eraseblock read speed is 1606 KiB/s
> 	page write speed is 439 KiB/s
> 	page read speed is 1520 KiB/s
> 	2 page write speed is 441 KiB/s
> 	2 page read speed is 1562 KiB/s
> 	erase speed is 68 KiB/s
>
> 	> With the fixup
> 	$ flash_speed /dev/mtd0 -c100 -d
> 	eraseblock write speed is 428 KiB/s
> 	eraseblock read speed is 1626 KiB/s
> 	page write speed is 426 KiB/s
> 	page read speed is 1538 KiB/s
> 	2 page write speed is 426 KiB/s
> 	2 page read speed is 1574 KiB/s
> 	erase speed is 66 KiB/s
>
> However, the fixup, whatever which one we pick, must be applied on
> multi-die chips, which hence must be properly flagged. The SFDP tables
> implemented give a lot of information but the die details are part of an
> optional table that is not implemented, hence we use a post parsing
> fixup hook to set the params->n_dice value manually.
>
> Link: https://www.winbond.com/resource-files/W25Q01JV%20SPI%20RevE%2003042024%20Plus.pdf
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
