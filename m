Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF17DCED63B
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8be2IXoQx2gd7PB+KYQWOfklmjKYNAGj9bhih2P+MjI=; b=0hmwdbvey7xH0y
	/utAJo4W1dsznbkLdC9GItYbVXd/22pLvsqDNPcoIx5NwBovFZO51/SuxlkGfVCP0hPoC2F6CiEqY
	DvNeLH2FvqVtUji0rl7YNpw1HzKlXYmJlD74/cZNMXZkbTje0qEXJQvyelIPAUJ44jhqI7+trJXiU
	JEAoWNex2xc6JW+R8U6g6vczdeJ/oUT3lOFPkXR9Ba6HR2C5zzbTyYInOUe5hoqN4HwTch8/FhcOg
	RJByTB+vSbY9ffWgzT82XcWNMueJhm1+iCfX02+lR3gEUX7zwe7DsFqTvnCY9jjxnjRjPvjIbvp0I
	dDvHOKEteY39TAMYMGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLM5C-00000000U8d-1HhE;
	Tue, 18 Nov 2025 13:49:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLM59-00000000U7z-2ILM
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 13:49:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D07AC4438E;
	Tue, 18 Nov 2025 13:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9A3C2BCB4;
	Tue, 18 Nov 2025 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763473758;
	bh=gBn+zFQ/15OeDuEquI5L05oTTxpfqWVTb/j2583pO9o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lfhralLiVKA3NrzOM2K6AZpEGuU2wP1BALvVvGel/zHmTwFyPGmoicmsy5d5XJ2nu
	 87u8QkBk3GvtExEX6XbAhncxOIMf70f+SowSZoiZfaVKaLNNGEv+RBAedSrfxVoD7p
	 uCrM8v8TrD196AjFSByWLfYvXlo0QVsF2hehxxoJVF1Acp74IMJuWSXMeML0zAWmrP
	 874yEha1xPgsEXxICLbaRGhUrWdCucdTyl4siYLYol7Wv3aOqn4HFxzp437N2N4MZ8
	 PJoLrTwa6oJDgDCckE2GoZ5L3UvFJIzCAK5/3euqVZa4nUmBBKElSXgcI1E/3AQvSe
	 ceuSbcMI43F8w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <broonie@kernel.org>,  <tudor.ambarus@linaro.org>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,  <p-mantena@ti.com>,
  <linux-spi@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <a-dutta@ti.com>,  <u-kumar1@ti.com>,
  <praneeth@ti.com>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
In-Reply-To: <cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com> (Santhosh Kumar
	K.'s message of "Sat, 20 Sep 2025 23:25:31 +0530")
References: <20250811193219.731851-1-s-k6@ti.com>
	<20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
	<cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com>
Date: Tue, 18 Nov 2025 14:49:13 +0100
Message-ID: <mafs0ikf74fja.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_054919_630771_136E11C4 
X-CRM114-Status: GOOD (  35.42  )
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

On Sat, Sep 20 2025, Santhosh Kumar K wrote:

[...]
>> This is actually wrong. Tuning is way more generic than that :)
>> If someone wants to use a chip at a high frequency (50MHz in your case,
>> but whatever, there is a threshold above which additional care must be
>> taken), it must go through the calibration step. It does not matter in
>> which mode you are. Calibration would still be relevant in single SDR
>> mode.
>> This 50MHz bothered Mark because it is too Cadence specific. Maybe this
>> should be a controller parameter? If the spi-mem core (or even the spi
>> core, by extensino) sees that the design allows running at XMHz (due to
>> the SPI peripheral properties or simply the absence of any limitation),
>> and if the controller states that it requires an extra tuning step above
>> YMHz (and X > Y), then it launches the calibration.
>>  From a core perspective, I would like the calibration hook to be as
>> simple as possible, because what "calibration" means is highly
>> controller and chip specific.
>
> I understand the concern here.
>
> Let me point out the options for launching the tuning procedure, along
> with the issues in each approach.
>
> Option 1: Launch tuning as part of spi_mem_exec_op()
>    - After spi_mem_access_start(), introduce a spi_mem_needs_tuning()
> check (a new callback to SPI MEM controller) to check whether the
> current op requires tuning
>    - If yes, we call spi_mem_execute_tuning()
>         - on success, mark tuning complete in a flag within SPI MEM
> Controller private data
>         - on failure, we attempt a fallback by calling
> spi_mem_adjust_op_freq() and drop to a lower supported frequency
>
> Option 2: Launch tuning within spi_controller->exec_op() implementation
>    - Very similar to option 1, except that the spi_mem_execute_tuning()
> is triggered from within the controller's exec_op() implementation
> (no need for spi_mem_needs_tuning())
>
> Drawbacks in option 1 and 2:
>    - Tuning requires multiple reads of a known pattern, but the flash
> may not always be in a state to allow read commands
>    - No fallback on failures, can't make flash-specific adjustments in
> case of a tuning failure
>    - No access to write_op() to write known pattern temporarily to an
> on-die cache. Pattern needs to be always burnt into the flash
>
>    - Plus, in option 2 - we can't call spi_mem_adjust_op_freq()
>
> While the need for tuning is dictated by Controller specific
> characteristics the ops (and state of the chip) required to complete
> tuning is under the control of spi-mem users (spi-nand/spi-nor).
> So, it's impossible to achieve tuning without the help of spi-mem users.
>
> So, Option 3: Launch from SPI MEM clients
>                           (mtd/nand/spi or mtd/spi-nor, etc.,)
>    - Once the spi-mem chip is completely enumerated and best read and
> write ops are chosen call spi_mem_needs_tuning(read_op, write_op) as
> a part of .probe()
>    - If tuning is required, call
> spi_mem_execute_tuning(read_op, write_op)
>         - If only read_op is provided, it implies the tuning pattern is
> pre-flashed to the partition
>    - On tuning failure, retry by re-running spi_mem_needs_tuning() with
> the second best set of ops (max throughput - 1)
>
> With option 3, spi_mem users are limited to calling
> spi_mem_needs_tuning() and spi_mem_execute_tuning(). Rest is hidden
> within the controller drivers. If spi-mem users change read/write ops,
> the above sequence can be re-issued.
>
> The controller can store the read_op and write_op in case of a tuning
> success and periodically re-run tuning, ensuring we always have valid
> tuning parameters.
>
> One concern with option 3 is that we may not be able to make use of
> static data on certain flash as tuning patterns (like reading parameter
> page or SFDP table for tuning instead of controller specific attack
> patterns).

Why not? How else would tuning work? Do you expect controllers to first
flash the tuning pattern and then tune the reads? That is a hard no I
think, since you don't want to over-write user data and I don't think we
will ever have any area of memory we can reliably over-write without
risking that.

I think we should start with the requirement to have the pattern flashed
already and figure out how SPI NOR or SPI NAND can discover that
(perhaps via NVMEM?).

I think SFDP is quite nice for this, but IIRC for spi-candence-quadspi,
that was not a viable option due to some reasons. If you can now make it
work with SFDP, then that would be even better, since we don't have to
deal with the pain of pre-flashing.

Overall, I think option 3 is the most promising. Options 1 and 2 will
likely add so much overhead they will end up being slower than non-PHY
reads, since tuning is usually quite expensive.

>
> Please let me know your thoughts on which of these directions makes the
> most sense.
>
> Thanks,
> Santhosh.
>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
