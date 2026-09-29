Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E81ECA5FA5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 14:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dGNoxE4d7excf9fA4rcWgBwsGy0k9W8vao1P1jNnDM=; b=Q0TZ3EWUgyzRib
	6NnlFZ5iYNSHcuxojYCA41+7mQqj2RBlg3IqI7XFYy64mXVwBqCw6yJU0/UHZH1K7iT41Pp0nkbaE
	W97f5o0GYpMyP0Px40Q3+6/Zwf9cR8L90ZqOKBteVoNO6IJSN1fUNqgiV0grHqr2gVQSIiZ/Avn8k
	CSsyARF8HNWydYaes2en7ez+cuP6mboGu9GtGUdC6Mb8UaROJV9tZIaw8tmzU089OlVa0zQpbZq/m
	xhs2NgrMD3ZlTPgs0bSUC8RzX/onXI5UrHX7JXF5TkB96nawgovv+LkT2y9XcPM2Tr9Hzm36bUipL
	OKCBAkIZNRxLEKob4/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYQC-00000003k0s-0cSA;
	Tue, 29 Sep 2026 14:03:04 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYQ9-00000003k02-0oMh
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 14:03:03 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E7169325;
	Tue, 29 Sep 2026 16:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1790690577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HEyrhbB9+Ho+MuiqTam9bzcD6FBweD5Zjw6hJkXtby0=;
	b=Ipi6+qnJA4bwFtnIR3FEYB8ZGw2A5xMV6tzQlDPqh7Goueya5nRdqhhxIKEc1GoAhHaU3D
	jx4WRrX9vjhadSgZxTxxb96KStYeewuP10nsweOUIFjPpamWylXjiGaF7DNUvi+HmUvXFS
	XhZgPT8nFijnzzJKm9IyVDevmNaLFGLAthLjOH+1EIJFYYoU5cKvB/JExF6F1NsMYZSfdI
	zI4Pfm7Qr1myVCHNAVyBB/37UCI7mHggmlYuwI5AQGEErItTSRvPwyCdOTfwFnNWD5Y0xO
	Pr8oUij6e3nJMPV+9eIMOughm1xVkAe3Ew+yzXmAUaG2tWslSAjJma5TdIPGeg==
Mime-Version: 1.0
Date: Tue, 29 Sep 2026 16:02:56 +0200
Message-Id: <DLRUTYCAPJW7.3KVEC5YRYF0HZ@walle.cc>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, <haibo.chen@oss.nxp.com>
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle"
 <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Haibo Chen" <haibo.chen@nxp.com>
From: "Michael Walle" <michael@walle.cc>
X-Mailer: aerc 0.20.0
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
 <87zex05uvn.fsf@bootlin.com>
In-Reply-To: <87zex05uvn.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_070301_567246_A83127D3 
X-CRM114-Status: GOOD (  18.29  )
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

On Tue Sep 29, 2026 at 10:23 AM CEST, Miquel Raynal wrote:
> On 29/09/2026 at 14:53:07 +08, haibo.chen@oss.nxp.com wrote:
>
>> From: Haibo Chen <haibo.chen@nxp.com>
>>
>> The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35). In
>> 8D-8D-8D mode the opcode is extended to two bytes per cmd_ext_type, but
>> the resulting command is not a valid SR2 read for these flashes, which
>> access their status/config registers through a vendor-specific indirect
>> register space. Since spi_nor_cache_sr_lock_bits() now reads SR2 during
>> init, i.e. after the switch to Octal DTR, the extended RDCR gets no data
>> back and the read times out (on i.MX FlexSPI: -ETIMEDOUT and a controller
>> WARN() during probe with Micron MT35xU and Macronix octal parts).
>>
>> Clear read_sr2 when the switch to Octal DTR actually succeeds, so the SR2
>> read is skipped (a cleared opcode already means "unsupported"). Doing it
>> in spi_nor_set_octal_dtr() keys off the real runtime protocol: a flash
>> that advertises Octal DTR but runs in (x)STR because the host lacks
>> support keeps its usable RDCR.
>>
>> Assisted-by: LLM
>> Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
>> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>> ---
>> Changes in v2:
>> - Rework the fix following review: instead of guarding the read at runtime
>>   in spi_nor_read_sr2(), clear the default RDCR opcode.read_sr2 once, at the
>>   point the switch to Octal DTR succeeds (spi_nor_set_octal_dtr()).
>
> I don't get that choice. Why switching when Octal DTR succeeds only? SR2
> is either supported or not supported, I don't think it is anyway
> different when entering octal DTR mode, is it? So I would expect SR2 to
> be cleared earlier than that, once we know the chip is octal DTR
> capable. And this must be early enough so that manufacturer drivers can
> still set their own value.
>
> I am wondering whether we should simply drop sr2 opcode in the QER SFDP
> parsing entirely for octal DTR devices (Michael?).

This should probably be put into spi_nor_parse_profile1() and check
if command 15h (read configuration register according to JESD251D)
is supported or not. Would that work, Haibo Chen?

Honestly, I haven't done much with these high density NOR flashes,
so my knowledge is rather sparse. I've just skimmed over the JEDEC
docs.

-michael

>> - Key the clear off the real runtime protocol so a flash that advertises
>>   Octal DTR but runs in (x)STR (host without 8D support) keeps its
>>   RDCR.
>
> Are you sure this is a valid case?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
