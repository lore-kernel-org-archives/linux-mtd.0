Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E321C87FCA
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeI6M7nIUHNSqHr2vO+k0dQwYEtwUuFB/mGHKJ21HYk=; b=2SEFhLxqiPPl+s
	ZTSa5M1zm11PgXpjpBWG9N/ezR4Rl0FJfZiZwNGdpYWnAOeiE7Xla4b8uN1jNaw8WDb3NYVjnsG++
	rwwrLAeQfrHSBO0CHwcTycwaToXEgrE/sORkzGbRfRiMM8NWYhYUxXJddLwANK6liRjjxs3PZssxy
	lxgCX7cOF5Z4ZwBSOW8KDP9hJzRcTmcK9z3V51V8kvYx46ngXHm1BHDltXx0sGeK2q12ZtLJCsgGo
	t1jtDcGJWtZIfnFEt1tIYWU1ZupGwkC2DN8jcylDkrHRIuiU2/FF2BsDAetSoaYr+hmS/nqbdaFGt
	CQYS4ZvFYvhtALEqWm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNY-000000082wb-1BjJ;
	Thu, 24 Jul 2025 17:05:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewil-00000007iYL-2tTH
	for linux-mtd@lists.infradead.org;
	Thu, 24 Jul 2025 14:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D661601D5;
	Thu, 24 Jul 2025 14:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36F3C4CEEF;
	Thu, 24 Jul 2025 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753366494;
	bh=UkVnxCdj3CGx7NXjhOgRQm4CT95kUOfUb/Cgzs2KLJo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k3JVEYNG3/6jue5hrisKmNUTMqKq5YurSHi0GIR+B81vmpblYHxT/wQ8utx/CrlQe
	 vij1Zx7Ibn9v3Naf0GvIIERSXm8zyxQgfrHI5rGYtbM6ZW6PHlr3/vJqTI6YcyWZXT
	 w07LVH/Oqtmgjtm311PTiom8agHaoN019GxVYJTuVrYEiy9ip1Gz0VvlSe0HZ0MnMI
	 SwW7fpPzbLl9iKURWzIklbGmjjMO06q8yGOy0RXgiODj8vpRhWCyULV02hTvSNpOxM
	 OBe7g/b8esR9C9wTj4veFug9PsgzCpyTF1evIys1GYmQ3JlA/oCMtDwSfewf0/BtFU
	 gnV5JADsCeyKA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Luke Wang <ziniu.wang_1@nxp.com>
Cc: Bough Chen <haibo.chen@nxp.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Miquel Raynal <miquel.raynal@bootlin.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  "broonie@kernel.org" <broonie@kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
  "michael@walle.cc" <michael@walle.cc>,  "p.yadav@ti.com"
 <p.yadav@ti.com>,  "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com"
 <vigneshr@ti.com>,  Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
In-Reply-To: <DU2PR04MB8567950B89B1F4F1F97FCD43ED41A@DU2PR04MB8567.eurprd04.prod.outlook.com>
References: <DU2PR04MB85678048FE8B475B1E323E0AED802@DU2PR04MB8567.eurprd04.prod.outlook.com>
	<10b40148-b949-442d-9d43-0db09517269a@linaro.org>
	<mafs0zffo3gea.fsf@kernel.org> <87cycep8go.fsf@bootlin.com>
	<mafs0wmam6ukq.fsf@kernel.org>
	<DU0PR04MB9496B734F6BA84ABAE051D439097A@DU0PR04MB9496.eurprd04.prod.outlook.com>
	<DU2PR04MB8567950B89B1F4F1F97FCD43ED41A@DU2PR04MB8567.eurprd04.prod.outlook.com>
Date: Thu, 24 Jul 2025 16:14:51 +0200
Message-ID: <mafs0a54tsmjo.fsf@kernel.org>
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

On Tue, Jul 01 2025, Luke Wang wrote:

>> > On Mon, May 12 2025, Miquel Raynal wrote:
>> >
>> > > Hello,
>> > >
>> > > On 07/05/2025 at 09:43:25 GMT, Pratyush Yadav <pratyush@kernel.org>
[...]
>> > >
>> > > The fact is that we will have octal DTR support in SPI NAND as well at
>> > > some point, hence a common solution would be welcome as we will likely
>> > > face similar problems when performing these unaligned accesses. I
>> > > don't know how feasible it is yet, but if we have a fix for SPI NOR,
>> > > we will need something similar for SPI NAND.
[...]
>
> Sorry for delayed response.
>
> After reviewing the SPI NAND driver, I noticed that the addr and len
> alignment has already been implemented in spinand_read_from_cache_op()
> and spinand_write_to_cache_op() functions.

Right. I took a very quick look as well and it seems that SPI NAND only
does page sized reads and writes in spinand_write_to_cache_op() and
spinand_read_from_cache_op(). So it should not be a problem.

Miquel, Luke sent a respin [0] for fixing this in SPI NOR and I need to
decide if I should take them or push for a more generic fix. Did I miss
some place where SPI NAND can do odd-length reads or writes? If not, I'd
rather just take the respinned patches.

>
> Additionally, using 0xff padding in spi_mem_dirmap_write() might not
> be suitable for non-flash memory devices.

NAND also seems to be using 0xff though. From spinand_write_to_cache_op():

	nbytes = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
	memset(spinand->databuf, 0xff, nanddev_page_size(nand));

Anyway, if needed we can solve that with a field in struct
spi_mem_dirmap_info I guess.

[0] https://lore.kernel.org/linux-mtd/20250708091646.292-1-ziniu.wang_1@nxp.com/T/#u

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
