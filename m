Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82444C10F13
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 20:00:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1422F20880
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 20:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SCsnmkxG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="Jxih9HMi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1422F20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sowpJ+Pcri/epj2xdZt+iKflxXseMq5cI0dXcKd+o9o=; b=SCsnmkxGdLZh0l
	eexEpx7X+AyguX98HaIrfJ0rDeCBVmiO3UZvB0CsHxHeeJ95z8rewxt1Z3wjrAD1wf61NTGYG2JPv
	RkYnoaFfKvm9FQ7HrCrgLAyvHB9WcrTJSrkUOuL4RwNa+h6wn9uQIF40nu3gLBw/gU/ZSmayyNH+q
	ZnPN+T7ZmMSXNEILLFwNEdHgGFfcqLo6v5dmCc2bbfoJWNHRgPMDzRePNOaDkjV92avInQgjByhHV
	cOf3bTiw08lUSJ9h0wgeJph6/8uICC7nVSiaua2DVhrPsSjLoftb6bcBG7dnCLoyrwveVcxkw1Xdu
	ieElBdohEaWn4/L4MOiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDaRR-00027Z-0A; Mon, 08 Apr 2019 20:00:29 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDaRM-00026i-U7
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2019 20:00:27 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 3F60E5C01BA;
 Mon,  8 Apr 2019 22:00:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1554753618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTYyi+52KKj+MmRvYXqKzKZdcrmKtLZAw+CYsJI4wu4=;
 b=Jxih9HMiZh9308vHDVRJD87r7NbcUhGrct3ZV85YMrge7Xt3Wh6arY5UJjTaJKk+v46u04
 q/N7MvZKz22heUkmCk4RYpg/iFWpcSK6p2o1s7vProm38ncLWDN10DxTmBpIzdLNV3mHPH
 3BBGo/VlYh3dTQnS43Arx16f8fJb4fc=
MIME-Version: 1.0
Date: Mon, 08 Apr 2019 22:00:18 +0200
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: nand_op_parser_exec_op should use longest pattern
In-Reply-To: <20190330102134.4e85e130@collabora.com>
References: <20190329133513.bj55sb373q4vo6yv@pengutronix.de>
 <bc75ec7a12c681a618ee641736141100@agner.ch>
 <20190330102134.4e85e130@collabora.com>
Message-ID: <270be087c7dda47f208d194c0671f902@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_130025_451817_DF534F93 
X-CRM114-Status: GOOD (  28.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 30.03.2019 10:21, Boris Brezillon wrote:
> +Miquel
> 
> On Fri, 29 Mar 2019 15:37:56 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> On 29.03.2019 14:35, Sascha Hauer wrote:
>> > Hi All,
>> >
>> > I just played with the new exec_op interface for the first time and
>> > together with Boris we found a problem in the pattern table parser.
>> >
>> > The vf610 driver uses this pattern table:
>> >
>> > static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
>> > 	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
>> > 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
>> > 		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
>> > 		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),
>> > 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
>> > 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
>> > 	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
>> > 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
>> > 		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
>> > 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
>> > 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
>> > 		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
>> > 	);
>> >
>> > It has two patterns, one supposed for writing and one for reading. All elements
>> > are optional. Now with a typical page read we'll get this:
>> >
>> > [   33.932464] nand:     ->CMD      [0x00]
>> > [   33.936338] nand:     ->ADDR     [5 cyc: 00 00 00 0a 00]
>> > [   33.941755] nand:     ->CMD      [0x30]
>> > [   33.945628] nand:     ->WAITRDY  [max 1 ms]
>> > [   33.949909] nand:       DATA_IN  [2176 B]

Hm, since I use HW ECC (which uses custom function calls), I do not get
such large data reads. But I do have OOB reads from time to time:

[    4.603585] nand: executing subop:
[    4.603616] nand:     ->CMD      [0x00]
[    4.603646] nand:     ->ADDR     [5 cyc: 00 08 ea 94 02]
[    4.603673] nand:     ->CMD      [0x30]
[    4.603700] nand:     ->WAITRDY  [max 200000 ms]
[    4.603727] nand:       DATA_IN  [64 B]
[    4.603881] nand: executing subop:
[    4.603912] nand:       CMD      [0x00]
[    4.603941] nand:       ADDR     [5 cyc: 00 08 ea 94 02]
[    4.603968] nand:       CMD      [0x30]
[    4.603994] nand:       WAITRDY  [max 200000 ms]
[    4.604022] nand:     ->DATA_IN  [64 B]



>> >
>> > Only the first four elements are executed in one go, the fifth is
>> > exectuted separately. This is because the pattern table parser finds
>> > that the first pattern (supposed for writing) already matches for the
>> > first four elements and then uses it instead of realizing that the
>> > second pattern matches the whole operation.
>>
>> Hm, I do not remember noticing that during development. I wonder if it
>> was the case already back then.
>>
>> If yes, it did not seem to have a negative impact on performance
>> compared to the old interface:
>> https://linux-mtd.infradead.narkive.com/qZgEnPsC/patch-v6-0-3-mtd-rawnand-vf610-nfc-make-use-of-exec-op
>>
>> >
>> > I have no fix for this, just wanted to let you know. It turned out that
>> > in my case for the GPMI nand driver I probably won't need any pattern
>> > table.
>>
>> Thanks for bringing it up! Will try it out when I come around.
> 
> Here is a new version of the proposed fix that compiles, at
> least :-). Still not tested tested on a real HW though.

Tested it here, seems to boot a rootfs from flash just fine!

The OOB reads look like this now:
[   74.478469] nand: executing subop:
[   74.478500] nand:     ->CMD      [0x00]
[   74.478529] nand:     ->ADDR     [5 cyc: 00 08 c0 1d 00]
[   74.478555] nand:     ->CMD      [0x30]
[   74.478580] nand:     ->WAITRDY  [max 200000 ms]
[   74.478606] nand:     ->DATA_IN  [64 B]

So the patch below seems to do what we intend.

--
Stefan

> 
> --->8---
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index ddd396e93e32..7a5178b5f13e 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -2131,6 +2131,23 @@ static void nand_op_parser_trace(const struct
> nand_op_parser_ctx *ctx)
>  }
>  #endif
>  
> +static int nand_op_parser_cmp_ctx(const struct nand_op_parser_ctx *a,
> +                                 const struct nand_op_parser_ctx *b)
> +{
> +
> +       if (a->subop.ninstrs < b->subop.ninstrs)
> +               return -1;
> +       else if (a->subop.ninstrs > b->subop.ninstrs)
> +               return 1;
> +
> +       if (a->subop.last_instr_end_off < b->subop.last_instr_end_off)
> +               return -1;
> +       else if (a->subop.last_instr_end_off > b->subop.last_instr_end_off)
> +               return 1;
> +
> +       return 0;
> +}
> +
>  /**
>   * nand_op_parser_exec_op - exec_op parser
>   * @chip: the NAND chip
> @@ -2165,30 +2182,38 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
>         unsigned int i;
>  
>         while (ctx.subop.instrs < op->instrs + op->ninstrs) {
> -               int ret;
> +               const struct nand_op_parser_pattern *pattern;
> +               struct nand_op_parser_ctx best_ctx;
> +               int ret, best_pattern = -1;
>  
>                 for (i = 0; i < parser->npatterns; i++) {
> -                       const struct nand_op_parser_pattern *pattern;
> +                       struct nand_op_parser_ctx test_ctx = ctx;
>  
>                         pattern = &parser->patterns[i];
> -                       if (!nand_op_parser_match_pat(pattern, &ctx))
> +                       if (!nand_op_parser_match_pat(pattern, &test_ctx))
>                                 continue;
>  
> -                       nand_op_parser_trace(&ctx);
> +                       if (best_pattern >= 0 &&
> +                           nand_op_parser_cmp_ctx(&test_ctx, &best_ctx) <= 0)
> +                               continue;
>  
> -                       if (check_only)
> -                               break;
> +                       best_pattern = i;
> +                       best_ctx = test_ctx;
> +               }
>  
> +               if (best_pattern < 0) {
> +                       pr_debug("->exec_op() parser: pattern not found!\n");
> +                       return -ENOTSUPP;
> +               }
> +
> +               ctx = best_ctx;
> +               nand_op_parser_trace(&ctx);
> +
> +               if (!check_only) {
> +                       pattern = &parser->patterns[best_pattern];
>                         ret = pattern->exec(chip, &ctx.subop);
>                         if (ret)
>                                 return ret;
> -
> -                       break;
> -               }
> -
> -               if (i == parser->npatterns) {
> -                       pr_debug("->exec_op() parser: pattern not found!\n");
> -                       return -ENOTSUPP;
>                 }
>  
>                 /*

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
