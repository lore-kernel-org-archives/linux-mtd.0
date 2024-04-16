Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF79C4345F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2024 15:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqUUmS1dVgNnFhX+GML64kJc4moSnSdlZeHODzeYAug=; b=ZsQiM4A5uSQ4Kt
	HKXVaaNRZRg2Psj0rJ2taHFDMZ9R9FQPjZ1etVgJxVJp0nBvSn+LHnDmwo7Ewj5aUyv3rj6SjV29s
	7DGWaW8EbSRJToyJHEvclsIhmnZWfWw8nPxigj3o52mdfrexYfys6nrnkZMmGuncb5rjV6La1WB8V
	A2REMYevxJXAnlxqVVX2N6wstu+BsZ2juCr5jqVAgzk2o+3O5O0KxmSirvV4OUMw7PyNe6UsFDclX
	c+TkjyWhStPmiwLLt2Bf8aEnANvlbE5pNG9NwfL9yZ6tYIFCdR+JU7Al43dbwTRTYED0wuFZ32nad
	YQblTIppSPWW/bNqELBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkzB-0000000CoXL-2y7v;
	Tue, 16 Apr 2024 15:44:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkz7-0000000CoVL-485P
	for linux-mtd@lists.infradead.org;
	Tue, 16 Apr 2024 15:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E22CCE10D7;
	Tue, 16 Apr 2024 15:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500F8C113CE;
	Tue, 16 Apr 2024 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713282273;
	bh=aHg97mxB1siK16ttECq18AQJaeQhlxM/JM3fjWmuFUY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lUCHeqooxNVJ7DghWTJHPmup0OblX7oY1s3inrpqZP/m1OcUdMTRRbXUq3JUI2oIH
	 gvnzlKsKUbuta7ZpyZS41JBnTcz3mivSOIlDGlIzQLmXR7k30cPq0kaQerrNLY85fI
	 HEKYwOARzywJWwOSMg0RhK5+6eZKgZHgXJe5W3fd9y4liC/xETLXTDzza93/7lC50L
	 CMGDUwDIW84QQiUKfTiJC1W6P6diRFyKkCZ/0woes+ryAqJk/UhL7Wdd87OcU0DCM1
	 ERpbvqGtKI6BhS9GtY4Nq0kLG1ycrdEC9dMcN9X0jkc0hjyhhMpFpbskhlcWU1Ccnw
	 ODs/g/1TRLN8w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: spi-nor: excessive locking in spi_nor_erase()
In-Reply-To: <069251d381826e9bc8a59c49c39c393c2860a028.camel@infinera.com>
	(Joakim Tjernlund's message of "Mon, 15 Apr 2024 15:55:10 +0000")
References: <069251d381826e9bc8a59c49c39c393c2860a028.camel@infinera.com>
Date: Tue, 16 Apr 2024 17:44:32 +0200
Message-ID: <mafs01q758g7z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_084438_296658_BA6A00F6 
X-CRM114-Status: GOOD (  16.62  )
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

Hi,

On Mon, Apr 15 2024, Joakim Tjernlund wrote:

> static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
> {
> ...
> Lock here
> 	ret = spi_nor_lock_and_prep(nor);
> 	if (ret)
> 		return ret;
> ....
> Then we have:
> 	} else if (spi_nor_has_uniform_erase(nor)) {
> 		while (len) {
> 			ret = spi_nor_write_enable(nor);
> 			if (ret)
> 				goto erase_err;
>
> 			ret = spi_nor_erase_sector(nor, addr);
> 			if (ret)
> 				goto erase_err;
>
> 			ret = spi_nor_wait_till_ready(nor);
> 			if (ret)
> 				goto erase_err;
>
> 			addr += mtd->erasesize;
> 			len -= mtd->erasesize;
> 		}
>
> 	/* erase multiple sectors */
> 	} else {
> 		ret = spi_nor_erase_multi_sectors(nor, addr, len);
> 		if (ret)
> 			goto erase_err;
> 	}
> ....
> erase_err:
> unlock here
> 	spi_nor_unlock_and_unprep(nor);
>
> 	return ret;
> }

Firstly, seems like you are looking at an older version of the driver.
spi_nor_erase() looks a bit different now, though works pretty much the
same in practice. See [0].

>
> So erase locks the flash for the whole erase op which can include many sectors and I don't see
> any Erase Suspend handling in spi-nor like the cfi_cmdset_0001/cfi_cmdset_0002 has.
>
> Locking can be a challenge but this seems over the top, anyone working/looking into improving this?

I think you should lead with what the problem you see with this and what
you think can be improved. Why do you think the locking is "over the
top"? What should be improved?

Most flashes can't do any operations (except poll status register) when
a program or erase operation is in progress. So the locking here makes
sense to me. We do not want to let other tasks attempt any other
operations until the erase is done. The only exception is some
multi-bank flashes that can do erase on one bank and reads on other
banks. Miquel's series [1] takes care of those (though I do not see any
flashes using that feature yet).

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/spi-nor/core.c#n1789
[1] https://lore.kernel.org/linux-mtd/20230328154105.448540-1-miquel.raynal@bootlin.com/

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
