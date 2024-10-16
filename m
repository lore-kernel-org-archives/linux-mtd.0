Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA4CD2A533
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2024 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXx4gZuOECmjGZEdZOTAkqlZwkfExWmCJG6u7dNUtHE=; b=jN4YS0nFH5ZBhq
	RJ8WT1fHthgPOSuZqxm4Tcvso1OrU1/17kxQkhd8hHk6FK7XsToLRQB9Q/dZ3ilS4oZSNdWfdK84K
	oVodQG2TgJ/EPw7A5VlZwMstLMBE/jVx2HmlQJpJLY04bzb1gRy11geZtYlUyKWe5C8zHVXOlVHf2
	MUY3/U5SJguG2UrkZZ/Ih2rHZLJzyD6qePfWdViQZfylfFkhbOSghxps+dXcDV67LeKvU6Svx/JAD
	dVkjIwRoyfFT6FaJ8hAjC+YGVDTL+lTzpdtbVvyUxxDl0khKv94Jz5BezpIuUx0sDyAgQtWiAV6xn
	pxjaQZMrsDc8mnz24/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t176P-0000000CSJN-2rz1;
	Wed, 16 Oct 2024 16:42:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t16vW-0000000CQda-3v7T
	for linux-mtd@lists.infradead.org;
	Wed, 16 Oct 2024 16:31:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1EC05C5ED8;
	Wed, 16 Oct 2024 16:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09B4C4CECE;
	Wed, 16 Oct 2024 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729096270;
	bh=P2tQFea5riMs1qnv001mgNQqNTCOHkt73obbZJ49unc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yn4aGNrq/szKu5EVu0D+IyfetymvHjidLRIO+Ti54llUzIVuKGIhXMXeelRbBXlIw
	 El8FHJt5HWDXyaWvo/EPcJKLZJATI9seeB9aSLsGcr+LmwQib33RNAHKPsrX1d1DYx
	 Dg0gZZ1o6KloEM2Lgzr3yepBMQx1kUUXH+Uu1yD80k3TUDcwa66qZzqgvrdOlpin+B
	 qp8jmYrVmiPPU5IFAos0p0u9jFRrMlZsS+CCmZbxUq9FVTKoDGxgLoR21+gFdWFpMZ
	 7x5ZSDHNCa6e+okA//fQzP8cGEjxTL5cZaEWhpcy6cYK3Hw/eBwXsTODvAt06wL39S
	 OaRnRaaUtz7jA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  tkuw584924@gmail.com,
  linux-mtd@lists.infradead.org,  tudor.ambarus@linaro.org,
  mwalle@kernel.org,  richard@nod.at,  vigneshr@ti.com,
  Bacem.Daassi@infineon.com,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Use nor->addr_nbytes in octal
 DTR mode in RD_ANY_REG_OP
In-Reply-To: <20241016143953.32b66612@xps-13> (Miquel Raynal's message of
	"Wed, 16 Oct 2024 14:39:53 +0200")
References: <20241016000837.17951-1-Takahiro.Kuwano@infineon.com>
	<mafs0y12ocl7n.fsf@kernel.org> <20241016143953.32b66612@xps-13>
Date: Wed, 16 Oct 2024 18:31:07 +0200
Message-ID: <mafs0ed4g80xg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_093111_090323_98B952F7 
X-CRM114-Status: GOOD (  26.90  )
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

On Wed, Oct 16 2024, Miquel Raynal wrote:

> Hi Pratyush,
>
> pratyush@kernel.org wrote on Wed, 16 Oct 2024 13:59:24 +0200:
>
>> Side note: honestly, this whole thing with params->addr_nbytes,
>> params->addr_mode_nbytes, and nor->addr_nbytes is quite confusing. I
>> hope to find some time to clean it up some day.
>
> I am currently looking into dtr for spi-nands, would you mind quickly
> going through the approaches you think don't work well/would be better?

I don't think the addr_mode_nbytes and addr_nbytes has a lot to do with
Octal DTR. We just forgot to record the fact that internal address mode
changes when enabling Octal DTR.

It has been some time since I worked on it so I have forgotten some
details. I remember working with Apurva Nandan on doing Octal DTR on SPI
NANDs. He sent out 3 revisions of a series [0], but IIRC we didn't quite
nail down the design and see it through. Below is a random collection of
ideas and things I can remember.

For one, I think I didn't do the Octal DTR support in SPI NOR as well as
I could have. It is kind of shoehorned into the core and not very neat.
For example, we create an op in functions like
spi_nor_spimem_read_data() or spi_nor_spimem_write_data() that is
partially filled in with the opcode, address width, etc. and then
spi_nor_spimem_setup_op() fills in the rest of the data, adjusting
things on the fly.

	if (spi_nor_protocol_is_dtr(proto)) {
		/*
		 * SPIMEM supports mixed DTR modes, but right now we can only
		 * have all phases either DTR or STR. IOW, SPIMEM can have
		 * something like 4S-4D-4D, but SPI NOR can't. So, set all 4
		 * phases to either DTR or STR.
		 */
		op->cmd.dtr = true;
		op->addr.dtr = true;
		op->dummy.dtr = true;
		op->data.dtr = true;

		/* 2 bytes per clock cycle in DTR mode. */
		op->dummy.nbytes *= 2;

		ext = spi_nor_get_cmd_ext(nor, op);
		op->cmd.opcode = (op->cmd.opcode << 8) | ext;
		op->cmd.nbytes = 2;
	}

This is hacky. It allowed me to implement this without a major refactor
of the core, but it makes things harder to understand and debug, and
harder to extend in the future to support more modes.

I think SPI NAND already does the right thing by having
spinand_op_variants. I think you should use those for Octal DTR ops as
well, and that is what Apurva's patch series already does.

Another problem is how we enable the modes. We select each of read, page
program, and erase operations individually in spi_nor_setup(). But if
you select an 8D-8D-8D read, you _have_ select page program and erases
in the same mode. While it does happen in practice, there is nothing in
the code that makes sure of it. Tying the op selection to an overall
mode would help scale to supporting other modes like 8S-8S-8D or
4S-4S-4D. I see SPI NAND doing something similar via
spinand_match_and_init() and spinand_init_quad_enable(). Similarly, once
you have an overall mode you want to enable, instead of doing
spinand_init_quad_enable() and spinand_init_octal_enable(), etc. in
series and seeing which one accepts the command, you can just call the
enable function for that mode. Apurva's patches don't do that so you'd
have to refactor them.

One problem we didn't really solve in SPI NOR yet is mode detection.
When a flash comes up, how do you detect if it is 1S-1S-1S or 8D-8D-8D
or something else? One idea was to use the Read SFDP command in all
modes and see which one comes up with correct signature. For now, SPI
NOR assumes the flash is in 1S-1S-1S mode. IIUC there is nothing similar
to SFDP for NANDs, so you might have to have that information in device
tree, or detect some other way.

Overall, I think Apurva's patches are a good starting point that you
should use and fix/improve parts you don't like. We already spent some
time figuring out the design with Boris, so they should be in decent
shape already.

Hope the brain dump helps, and gives you what you were looking for. Let
me know if you would like to know something else.

[0] https://lore.kernel.org/linux-mtd/20220101074250.14443-1-a-nandan@ti.com/

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
