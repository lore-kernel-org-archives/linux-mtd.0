Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB8BCA5FCB
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2026 12:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLrKpngwZXWjcA+wbYrq7KqQmZbtPBY4wYsRNEGqU38=; b=wYaADUbIKgTAWdMg7Tlajy7xBQ
	uFu6uvSFwNMwSqDWsOuL002LneEXCHS8S/+CRgOh0LVPiVEJiJifxvVsX1jvHUlgAnLUd+of+3i9q
	PGzTDXiJXHtESYQgk6TcV6hj3FXK6grH8a3avumn5MWDlOv4v1BN59i+IseyzzcwoiCTHsouHucla
	7x219NKVF4vraQO1RcHUPnKFByVEXdS+n92HqWv4FXtbKKQ1HIjZZkTK0sc/sUdwVs3VqQBQJOo0z
	pzbAtnMebemifoi5SsoMJGs+D9vzzROo50pnl524HjPG+6yW2+X/Uy6t1sENAprOJ+HptpVeQQVzT
	EGpLWaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG1S-000000094UI-3R6z;
	Thu, 01 Oct 2026 12:36:26 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG1P-000000094Ss-3Cxq
	for linux-mtd@lists.infradead.org;
	Thu, 01 Oct 2026 12:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=SJi6h0SJu0xMOkwZ4JcVL6zLRXmwzf8sM+ggxMqakjQ=;
	b=Dr20hwqsMMZbUheX4YsAYhp9uF+a1NmWhwVpOzB1lsRNM5W/N1g9g3vfbpZKCt
	NTxKMODR3/+0XC561B4JKJplGrV/aRLZBNzR7597KRYNeXLU3kN/iiyFr1DNT4FV
	ihH5yNcPjr2Wqfrk9IlFoOYevdLFQcOlog675RHNxmvD0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDXv4rDU75qHw1oCQ--.5049S2;
	Thu, 01 Oct 2026 20:36:19 +0800 (CST)
From: wang wei <a929244872@163.com>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: wang wei <a929244872@163.com>
Subject: Re:Re: [PATCH] drivers/mtd: rawnand: nandsim: Fix stale NAND_ROW_ADDR_3 with overridesize
Date: Thu,  1 Oct 2026 20:36:17 +0800
Message-Id: <20261001123617.39160-1-a929244872@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <875wzlofmj.fsf@bootlin.com>
References: <875wzlofmj.fsf@bootlin.com>
MIME-Version: 1.0
X-CM-TRANSID: QCgvCgDXv4rDU75qHw1oCQ--.5049S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUrTmSDUUUU
X-Originating-IP: [240e:390:6a3:2fd0:1078:fc47:80b1:d61]
X-CM-SenderInfo: jdzsmjiuuylji6rwjhhfrp/xtbCwQNP9Wq+U8PRCAAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_053624_178348_2E3EE840 
X-CRM114-Status: GOOD (  24.39  )
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
Content-Type: multipart/mixed; boundary="===============0466549306994040373=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0466549306994040373==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

>Hi Wang,
>
>On 01/10/2026 at 18:33:59 +08, wang wei <a929244872@163.com> wrote:
>
>> The overridesize module parameter changes the size of the simulated
>> device after nand_scan() has completed. It updates nsmtd->size,
>> memorg->eraseblocks_per_lun, chip->chip_shift and chip->pagemask to
>> match the new geometry, but leaves the NAND_ROW_ADDR_3 option
>> untouched, even though nand_scan_ident() set it from the geometry
>> decoded out of the ID bytes.
>>
>> When the ID bytes describe a device larger than 128 MiB and
>> overridesize shrinks the simulation to 128 MiB or less, the stale
>> option makes the core emit one extra row address byte (page >> 16,
>> always zero given the reduced page count) in every read, program and
>> erase operation, while the simulator state machine expects one byte
>> less. All accesses then fail with:
>>
>>     nandsim: error: write_byte: address (0x0) isn't expected, expected
>>     state is STATE_CMD_READSTART, switch to STATE_READY
>>
>> The opposite direction is equally broken: growing a small device past
>> 128 MiB keeps NAND_ROW_ADDR_3 cleared, so the third row address byte
>> is dropped and the wrong pages are silently addressed.
>
>Fine until here.

Okay

>
>> This used to work before commit 14157f861437 ("mtd: nand: introduce
>> NAND_ROW_ADDR_3 flag"). Back then nandsim kept chip->chipsize in sync
>
>                                   ,
>
>> with the override, and nand_command_lp() decided at run time, per
>> command, whether the third row address cycle was needed by testing
>> chip->chipsize against 128 MiB. The decision thus always saw the
>
>"The decision"?

What I mean is the semantics of this code

>
>> overridden size. The above commit moved the decision to
>> nand_scan_ident(), which encodes it once into NAND_ROW_ADDR_3 at
>> scan time -- before nandsim applies the override -- and the
>> overridesize path was never taught to re-evaluate the flag. The
>> commit that introduced the regression is:
>>
>>     https://git.kernel.org/torvalds/c/14157f861437ebe2d624b0a845b91bbdf8ca9a2d
>
>This is not needed, you mention it above and below already.

Okay

>
>> Re-evaluate NAND_ROW_ADDR_3 right after overriding chip_shift, using
>> the same test as nand_scan_ident(), so that the address width emitted
>> by the core always matches ns->geom.pgaddrbytes, which ns_init()
>> derives from the overridden total size.
>>
>> Fixes: 14157f861437 ("mtd: nand: introduce NAND_ROW_ADDR_3 flag")
>
>Cc: stable
>
>> Signed-off-by: wang wei <a929244872@163.com>
>> ---
>>  drivers/mtd/nand/raw/nandsim.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
>> index fe96803..176db89 100644
>> --- a/drivers/mtd/nand/raw/nandsim.c
>> +++ b/drivers/mtd/nand/raw/nandsim.c
>> @@ -2359,6 +2359,18 @@ static int __init ns_init_module(void)
>>  		targetsize = nanddev_target_size(&chip->base);
>>  		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
>>  		chip->pagemask = (targetsize >> chip->page_shift) - 1;
>> +
>> +		/*
>> +		 * NAND_ROW_ADDR_3 was set by nand_scan_ident() from the
>> +		 * geometry decoded out of the ID bytes, which the size
>> +		 * override has just made stale. Re-evaluate it against
>> +		 * the new geometry, otherwise the core emits one more (or
>> +		 * one less) row address byte than the simulator expects.
>> +		 */
>
>Everything above this line can just be deleted. Tell your LLM that this
>is obvious enough and does not require any particular comment.

Okay, will be modified in V2

>
>> +		if (chip->chip_shift - chip->page_shift > 16)
>> +			chip->options |= NAND_ROW_ADDR_3;
>> +		else
>> +			chip->options &= ~NAND_ROW_ADDR_3;
>>  	}
>>
>>  	ret = ns_setup_wear_reporting(nsmtd);
>
>Instead of repeating the operation in nandsim, why not calling
>nand_scan() after over writing the size? (inverting the two blocks)

The override cannot be moved before nand_scan(): In nand_detect(),
chip ->chipushift will be set to the actual flash size. In addition,
In addition, expressed in erase blocks (new_size = nsmtd->erasesize << overridesize)
and erasesize is what nand_scan_ident() decodes from the ID bytes, so
the override has a hard data dependency on the scan.

>
>Thanks,
>Miquèl



--===============0466549306994040373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0466549306994040373==--
