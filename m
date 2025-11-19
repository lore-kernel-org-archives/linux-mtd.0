Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532ACCF318C
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZEB0JY5epVo73gkGgVnwPBtPUmLd4NEPTbm6Y+MqfA=; b=JdegkFHhx65SC1
	ngJq7lskySFNPxKEgL4ShsO/+IoxI9skz/uWa757l+bS2ymadcvSGkj8ATfojE7JDVEcNrafAdSbB
	+TVJN1lF8xWSQYKu0c/h6IccKYbp6MKFVYxI6x19niAgYvCaEpI1dlCPKbtVbvK5RT/ViUg15fl76
	hc6JEHzYMcVbDAkd2Rj1XjSXpbkEq3OsfVQKTvZDlU4XIJeIapY3DV7Q0AAbc+tcBt/DHWlXyaqaL
	IYULzlOpXXYkWh6BhuAvkTXmP1Tg1iUoK/aRkZ1qCrExrpInfZi4HVG4Z7k5jb3yxPD2BTyYHVi37
	7rm9czaAibv2Z/YEm+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLflx-00000002zWC-3rWS;
	Wed, 19 Nov 2025 10:50:49 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLflw-00000002zVm-0qFe
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 10:50:49 +0000
Received: from localhost (unknown [IPv6:2a00:20:d30b:5ad2:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 8277E3CC;
	Wed, 19 Nov 2025 11:50:43 +0100 (CET)
Mime-Version: 1.0
Date: Wed, 19 Nov 2025 11:50:42 +0100
Message-Id: <DECM3POB6LJF.2LZA9PMGSJBVR@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 15/19] mtd: spi-nor: debugfs: Add locking support
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>, "Sean
 Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-15-487bc7129931@bootlin.com> <DEBTY3TV74T2.2N3VRS6HGWDXD@kernel.org> <87o6oycpx6.fsf@bootlin.com>
In-Reply-To: <87o6oycpx6.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_025048_397744_DCA469CA 
X-CRM114-Status: GOOD (  29.75  )
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

On Wed Nov 19, 2025 at 10:49 AM CET, Miquel Raynal wrote:
> Hello,
>
> On 18/11/2025 at 13:46:52 +01, "Michael Walle" <mwalle@kernel.org> wrote:
>
>> On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
>>> The ioctl output may be counter intuitive in some cases. Asking for a
>>> "locked status" over a region that is only partially locked will return
>>> "unlocked" whereas in practice maybe the biggest part is actually
>>> locked.
>>>
>>> Knowing what is the real software locking state through debugfs would be
>>> very convenient for development/debugging purposes, hence this proposal
>>> for adding two extra blocks at the end of the file:
>>> - A "software locked sectors" array which lists every section, if it is
>>> locked or not, showing both the address ranges and the sizes in numbers
>>> of blocks.
>>
>> I know the file is called software write protection (or swp) but
>> it's really a hardware write protection, isn't it?
>
> Well, it depends on your configuration I guess? Without #WP pin I don't
> know how to call that. I had in mind that software meant "using the BP
> pins" and "hardware" meant "toggling #WP". But I have no strong opinion
> about this wording.

See my previous mail and commit 18d7d01a0a0e ("mtd: spi-nor: Avoid
setting SRWD bit in SR if WP# signal not connected"). Personally, I
really don't like the "software" write protection, I mean you can
just use read-only for that partition or whatever. Locking for me is
really backed by the hardware. I.e. we use that to be really sure,
that we have a bootable bootloader and no one can break it.

>>> 64kiB-sectors locking map (x: locked, .: unlocked)
>>> |.....................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
>>>  ...........................|
>>
>> Maybe put it into an own file. In any case, a sane line wrapping
>> would be good. And add a leading offset, ie, "0000: xxxx.....".
>
> I was unsure about doing that, but yes that makes sense. May I call it
> "locked_sectors_map"?

I don't have a strong opinion here, but locking might be on a finer
granularity than sectors. Not with the BP scheme but IIRC I've seen
locking schemes with 4k blocks for example. So maybe just something
more general like "locked_erase_blocks_map" or just
"locked_blocks_map", up to you.  It's just debugfs ;)

> [...]
>
>>> +	sr[0] = nor->bouncebuf[0];
>>> +
>>> +	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
>>> +		ret = spi_nor_read_cr(nor, nor->bouncebuf + 1);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	sr[1] = nor->bouncebuf[1];
>>
>> Shouldn't that go into the former if conditional? bouncebuf[1] might
>> never be read.
>
> Yes, that's correct. I don't remember why I did it this way, probably a
> bug, I'll move that line.
>
>> Also, until now, reading the "params" debug file never interacts
>> with the flash, but with this patch it does. We don't do locking
>> here which looks wrong. Maybe we should just cache the protection
>> bits. Not sure.
>
> I guess caching the status registers makes sense, but we'll still have a
> possible race when accessing the 2 registers. Is it okay to
> ignore this very unlikely case in debugfs? Otherwise I might just lock
> the entire device for the time we access the cached registers.

Oh I meant caching it in the core/swp.c (and invalidating/updating
when the bits are written) and just display it here. That way we
just keep that reading this file won't actually trigger any SPI
xfers.

>>> +	spi_nor_get_locked_range_sr(nor, sr, &lock_start, &lock_length);
>>> +	if (!lock_length || lock_length == params->size) {
>>> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, params->size - 1,
>>> +			   lock_length ? "  locked" : "unlocked", params->size / min_prot_len);
>>> +	} else if (!lock_start) {
>>> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_length - 1,
>>> +			   "  locked", lock_length / min_prot_len);
>>> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_length, params->size - 1,
>>> +			   "unlocked", (params->size - lock_length) / min_prot_len);
>>> +	} else {
>>> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_start - 1,
>>> +			   "unlocked", lock_start / min_prot_len);
>>> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_start, params->size - 1,
>>> +			   "  locked", lock_length / min_prot_len);
>>> +	}
>>> +
>>> +	seq_printf(s, "\n%dkiB-sectors locking map (x: locked, .: unlocked)\n",
>>> +		   min_prot_len / 1024);
>>> +	seq_puts(s, "|");
>>> +	for (i = 0; i < params->size; i += min_prot_len)
>>> +		seq_printf(s, spi_nor_is_locked_sr(nor, i, min_prot_len, sr) ? "x" : ".");
>>
>> As mentioned above, newlines as well as a leading offset counter
>> would be nice :)
>
> Arf, I was hoping I could escape that step, but ok, fair enough :-)

:)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
