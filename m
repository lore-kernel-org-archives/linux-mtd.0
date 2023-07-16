Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF36EB64DD
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWcnfYpMn/oMO5L9g35ECmnD/AVJzH2pNI3YqwTRS2U=; b=bOXKkUth3vny61
	eNdstZAbHFDtwDboNayl+4XRC0ssRnv00qpY5ikBPCq+CdmfyCoF4s5XO4BBQQnYRlizy+OPlBXTo
	SfGvhz1/EJpGonZSJGdjDYU69a+5zIlakjgQK5lCSMgRA3BFYvUmyosnsdQkZdw8+rG1aS/5fugXO
	JEa7ftytTmU+/fSeb+lPWbX3BV9SnOixZGpQBmTwehB/jbqfDtQFVu9wtzmMB8sWBnp3Nfgtt6aQo
	BYTGj1vGmhIVfc4IeObWkRWl4KFfU952fjsvU7a5/RNoqDsPAkcs5CFd8ooQ2RuZ+9gAd42xa6cmf
	AxQxc8CTPjhftTFxfUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL5pM-00DbDD-2Y;
	Sun, 16 Jul 2023 17:46:36 +0000
Received: from unicorn.mansr.com ([2001:8b0:ca0d:1::2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL5pJ-00Db7p-0k
	for linux-mtd@lists.infradead.org;
	Sun, 16 Jul 2023 17:46:35 +0000
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
	by unicorn.mansr.com (Postfix) with ESMTPS id B880715360;
	Sun, 16 Jul 2023 18:46:26 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 67866219B40; Sun, 16 Jul 2023 18:46:26 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>, Alexander Shiyan <eagle.alexander923@gmail.com>,
 Domenico Punzo <dpunzo@micron.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com> <20230716174917.3a9ca7a7@xps-13>
Date: Sun, 16 Jul 2023 18:46:26 +0100
In-Reply-To: <20230716174917.3a9ca7a7@xps-13> (Miquel Raynal's message of
	"Sun, 16 Jul 2023 17:49:17 +0200")
Message-ID: <yw1x7cqzzr4d.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_104633_478846_981F34DD 
X-CRM114-Status: GOOD (  28.20  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Miquel Raynal <miquel.raynal@bootlin.com> writes:

> Hello all,
>
> So here is a summary of the situation:
> - we have two bug reports regarding the use of sequential page reads
> - both are on TI OMAP platforms: AM33XX and AM3517. I believe both are
>   using the same omap2.c driver
> - they use a Micron and a Samsung NAND chip
>
> All these information gives me the hint that it is related to the
> controller driver which does something silly during the exec_op phase.
>
> Alexander and M=E5ns, can you please tell me:
> - Are you using a gpio for the waitrdy thing or do you leverage
>   nand_soft_waitrdy()? If you are using the gpio, can you both try with
>   the soft implementation and see if it changes something?

There's no gpio specified in the devicetree, so I guess it must be using
nand_soft_waitrdy().

> - Are you using any POLL or DMA prefetch mode? Can you please force the
>   default in and out helpers by using only omap_nand_data_in() and
>   omap_nand_data_out() to see if it changes something?

It was using the default PREFETCH_POLLED mode.  Switching it to POLLED
(and thus omap_nand_data_in/out()) doesn't change anything.

> I believe there is something wrong in the timings, while properly
> implemented in theory there might be some cases where we miss a barrier
> or something like that. I would like to try the following two hacks,
> and see if we can find what is the timing that is not observed, despite
> the lack of probing. The first one is a real hack, the second one might
> actually look like a real fix. Please let me know, both of you, if you
> see different behaviors.
>
> *** HACK #1 ***
>
> --- a/drivers/mtd/nand/raw/omap2.c
> +++ b/drivers/mtd/nand/raw/omap2.c
> @@ -2113,6 +2113,9 @@ static int omap_nand_exec_instr(struct nand_chip *c=
hip,
>         case NAND_OP_CMD_INSTR:
>                 iowrite8(instr->ctx.cmd.opcode,
>                          info->reg.gpmc_nand_command);
> +               if (instr->ctx.cmd.opcode =3D=3D NAND_CMD_READCACHESEQ ||
> +                   instr->ctx.cmd.opcode =3D=3D NAND_CMD_READCACHEEND)
> +                       udelay(50);
>                 break;
>
>         case NAND_OP_ADDR_INSTR:
>
> *** HACK #2 ***
>
> --- a/drivers/mtd/nand/raw/omap2.c
> +++ b/drivers/mtd/nand/raw/omap2.c
> @@ -2143,8 +2146,10 @@ static int omap_nand_exec_instr(struct nand_chip *=
chip,
>                 break;
>         }
>
> -       if (instr->delay_ns)
> +       if (instr->delay_ns) {
> +               mb();
>                 ndelay(instr->delay_ns);
> +       }
>
>         return 0;
>  }

Neither of these help.

-- =

M=E5ns Rullg=E5rd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
