Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1262FF8868
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kKafh60ZJEeLwXRNnKLVi4MSKom40ax/uJJRI4Lb3c=; b=x/E59C5hNZzXnI
	oGZ+82p7no8hKBqlt/bMR6VmudaBDVAZphZB/ClTGapc0ieiXMAl//tspz3z3lxUQTMlv7dZg9Lli
	gawwyA1qKuEokTDrjVzsURiNMDV84VmzyPXfHgqJFKCD3YuFVc0HIjY/F8FSR6W6m4AIdHoRtufhk
	+LEvIf1ROertuAnCj2tOncdSTbsFNaK1effawN5+Vdq5L6q+96kXgG0Gor8SFBxQRpQwmIsH+gLlS
	Dy94uf45Pddjttm8ZiUjbIPPPA1JmDBW9rb9YpH/l0D255W10GMPekMWurxN9yrENprsRJxVCjcv/
	Ztxhc0Z95cVPVozRQixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOYV-0000000HICl-45XZ;
	Mon, 27 Apr 2026 16:11:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOYU-0000000HIBr-2z9N
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 16:11:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B02A60138;
	Mon, 27 Apr 2026 16:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15734C2BCB9;
	Mon, 27 Apr 2026 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777306289;
	bh=gKo9yoKQkhuxhck+/pgVG+rmAMHFIGSk8/qsNH9qUkk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M3LEZavJCbISUrJFaUF4rYRHYWT3nQh7W5rmqGPJMRQ011GpCDqnjCojNQxD7lyLQ
	 fB3jCD/9e3wUDdOWFuwbtUiREVNUnzCAoJ75jwwwWDhguXiHMckaazcD8kXnhMZdIW
	 e2VC2FHyUvlO+Ifkkrzx6VJzGi6r7N4mevPt6YEzSnH1OjY07LJ02IA463g6O5TccO
	 nKA2PpRulkL3cEEcV2TcH4pge1YnqLg4HLEPqE4atQkmya8sRmonF8B0N/RBqWV3XB
	 OIVf1Uj3ArJP7kwghlbWra63sJbBTG5hfzfi1V+XfxL+PLbJ3XU885En+JnKJrUWC8
	 KULOTFElF3NIQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: <Takahiro.Kuwano@infineon.com>,  <pratyush@kernel.org>,
  <mwalle@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <corbet@lwn.net>,  <sean.anderson@linux.dev>,
  <thomas.petazzoni@bootlin.com>,  <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 17/27] mtd: spi-nor: debugfs: Add locking support
In-Reply-To: <87h5owh69c.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 27
	Apr 2026 15:39:27 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-17-833dab5e7288@bootlin.com>
	<c8521e12e49040ce8683f81692644574@infineon.com>
	<87h5owh69c.fsf@bootlin.com>
Date: Mon, 27 Apr 2026 18:11:25 +0200
Message-ID: <2vxz7bps5qoi.fsf@kernel.org>
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

On Mon, Apr 27 2026, Miquel Raynal wrote:

> Hello SPI NOR foks,
>
> On 10/04/2026 at 04:39:22 GMT, <Takahiro.Kuwano@infineon.com> wrote:
>
>>> The ioctl output may be counter intuitive in some cases. Asking for a
>>> "locked status" over a region that is only partially locked will return
>>> "unlocked" whereas in practice maybe the biggest part is actually
>>> locked.
>>> 
>>> Knowing what is the real software locking state through debugfs would be
>>> very convenient for development/debugging purposes, hence this proposal
>>> for adding an extra block at the end of the file: a "locked sectors"
>>> array which lists every section, if it is locked or not, showing both
>>> the address ranges and the sizes in numbers of blocks.
>>> 
>>> Here is an example of output, what is after the "sector map" is new.
>>> 
>>> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
>>> name            (null)
>>> id              ef a0 20 00 00 00
>>> size            64.0 MiB
>>> write size      1
>>> page size       256
>>> address nbytes  4
>>> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | HAS_SR_TB_BIT6 | HAS_4BIT_BP |
>>> SOFT_RESET | NO_WP
>>> 
>>> opcodes
>>>  read           0xec
>>>   dummy cycles  6
>>>  erase          0xdc
>>>  program        0x34
>>>  8D extension   none
>>> 
>>> protocols
>>>  read           1S-4S-4S
>>>  write          1S-1S-4S
>>>  register       1S-1S-1S
>>> 
>>> erase commands
>>>  21 (4.00 KiB) [1]
>>>  dc (64.0 KiB) [3]
>>>  c7 (64.0 MiB)
>>> 
>>> sector map
>>>  region (in hex)   | erase mask | overlaid
>>>  ------------------+------------+---------
>>>  00000000-03ffffff |     [   3] | no
>>> 
>>> locked sectors
>>>  region (in hex)   | status   | #blocks
>>>  ------------------+----------+--------
>>>  00000000-03ffffff | unlocked | 1024
>>> 
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> I don't want to be too pushy but this series has been pending for a
> while, there are real fixes inside, it (IMO) greatly improve the
> documentation, adds a testing procedure, gives a friendly interface to
> understand what is locked, etc. I am working on clarifying and improving
> the Winbond vendor driver even more now and I need these changes to get
> in for the cleanup to continue. Can someone bump spi-nor/next on top of
> v7.1-rc1 and apply this? Unless there are more changes, of course.

Yeah, my bad on this. I think a good part of this series should have
landed in the previous merge window. I was waiting to collect some
reviews on this before applying and didn't realize many patches already
had some.

Anyway, the series overall looks pretty good, although I didn't spend
time looking too closely. Will apply some time this week. Thanks for the
cleanup, it is much appreciated.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
