Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34409C169C4
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 16:14:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2AAC218AC
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 16:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IEneoMWi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDhbWuSn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2AAC218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFhaXreTxexbLwVrWJagJ1FjOaM3ttb6X4qbkYu46Vg=; b=IEneoMWiwLaLT5
	6GjQxiJdUJMdDBVE8XMnMPqE2jRjIqHi3P5IF5ApdlqMSrL7Av0hBlMppuKP2QUVscxNYHKt2w0nl
	TyyY/7V9Bs9E62KYthzI8aOR9Z+YjL5dZGlZK7YExY1IR5OwcXKZEWXdvWTsNnkbaFBI/NHvCHeII
	T/SDOKCho4BAoDtSC3rsIzNS8eKKDNZTGUOlOD3t5NH8MEnbnp4+REp6hRyBGvoXx1LjtQEHnAKg+
	Tpd84bg7C/TkzAas39kQMcF/4VjY/DK7ZL535IRABUFB690Hh9eD6q7dXI1n6OkhCT1KDtQ0mWJzl
	fU3olcjcPf4vDwYLL4ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpEyw-0001Ry-Hy; Thu, 31 Jan 2019 16:14:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpEyu-0001Rc-6I
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 16:14:25 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBAB02085B;
 Thu, 31 Jan 2019 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548951263;
 bh=d5dMmPZX0JvYX0cQYDAQiTE/tL0LQiTLZcQVeMovYMM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FDhbWuSnFqeI3xnFiE4BNPv8Qhrj5ujFb6NJQSK4RKvCgy/o+AatOHO9QnxqBL+/E
 9WnQJTsjrOFOOTdX2jPaN8sz2cpXGqAN6e97p1lmxhUT6BsgVwqxesW8BUO+JRbAA3
 OkTt+YdOV6ziJPi9KbnSk258Eiz+f3F7AXKDKfYA=
Date: Thu, 31 Jan 2019 17:14:14 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: subpage reads/writes with fsl_elbc_nand driver
Message-ID: <20190131171330.221e200c@bbrezillon>
In-Reply-To: <add8754e-e044-a6d7-2ead-067777afbde4@prevas.dk>
References: <add8754e-e044-a6d7-2ead-067777afbde4@prevas.dk>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_081424_249077_4A1689FA 
X-CRM114-Status: GOOD (  16.48  )
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
Cc: Esben Haabendal <eha@deif.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Per N. Christensen" <pnc@deif.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 31 Jan 2019 14:24:15 +0000
Rasmus Villemoes <rasmus.villemoes@prevas.dk> wrote:

> I'm in the process of upgrading a board from an old 3.14-based kernel
> with quite a few out-of-tree patches to one based on 4.19, hopefully
> with much fewer such patches.
> 
> In order to even get the new kernel to mount the existing root
> filesystem, I've had to apply the hacks below:
> 
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -6657,6 +6657,11 @@ static int nand_scan_tail(struct mtd_info *mtd)
>                 pr_warn("WARNING: %s: the ECC used on your system is too
> weak compared to the one required by the NAND chip\n",
>                         mtd->name);
> 
> +       if (IS_ENABLED(CONFIG_ML300PCM31)) {
> +               pr_warn("setting NAND_NO_SUBPAGE_WRITE bit\n");
> +               chip->ecc.write_subpage = NULL;
> +               chip->options |= NAND_NO_SUBPAGE_WRITE;
> +       }
>         /* Allow subpage writes up to ecc.steps. Not possible for MLC
> flash */
>         if (!(chip->options & NAND_NO_SUBPAGE_WRITE) && nand_is_slc(chip)) {
>                 switch (ecc->steps) {
> @@ -6681,8 +6686,12 @@ static int nand_scan_tail(struct mtd_info *mtd)
>         /* Large page NAND with SOFT_ECC should support subpage reads */
>         switch (ecc->mode) {
>         case NAND_ECC_SOFT:
> -               if (chip->page_shift > 9)
> -                       chip->options |= NAND_SUBPAGE_READ;
> +               if (chip->page_shift > 9) {
> +                       if (IS_ENABLED(CONFIG_ML300PCM31))
> +                               pr_warn("setting of NAND_SUBPAGE_READ
> bit has been patched out\n");
> +                       else
> +                               chip->options |= NAND_SUBPAGE_READ;
> +               }
>                 break;
> 
> Without the latter, I get
> 
>     [    0.833134] fsl,elbc-fcm-nand fff00000.nand: fsl_elbc_cmdfunc:
> error, unsupported command 0x5.
>     [    0.841822] fsl,elbc-fcm-nand fff00000.nand: read_buf beyond end
> of buffer (14 requested, 0 available)

For that part of the problem, you should consider converting the driver
to ->exec_op().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
