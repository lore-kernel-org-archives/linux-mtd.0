Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36DCC169C4
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 16:11:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C47218AC
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 16:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gWKV/8/2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDVZGtb/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C47218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtAT3y4vxPMsYw2ayQUmg7qyHwZ03BirntI1GVxZCWc=; b=gWKV/8/2fIpEvs
	paUQd+6zLPyOx2UF0Yzz8p3Zy02uVvO+VdA68pscuISBUNdkMytlEzYW1GjTvO604kgmEVjCFHWof
	xrlD40EO1uzOGxL25QMp/UYGU1Nqtp8xdL3BK65Rp1NhGKKNiE5SBaYWmnBrvuJho2JsfIFbNRJQw
	gX8X+p6vcLjOUnaRIgcXsHgpjl2UewZR0qUVHApicZRpV4tT7cUO1TnN42cG/z2MmAg8nNYWDybpy
	0aTYRfK+x4tSjz0y/VZYa4ouqV6vmvZZN6TG8C4Y92CTXBK9e03mNSlapq7pa64J6cotG9nBbTRi6
	i64ppOMOoDNTBXLAVC8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpEwR-0000un-Pc; Thu, 31 Jan 2019 16:11:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpEwO-0000uS-I6
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 16:11:50 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D67822085B;
 Thu, 31 Jan 2019 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548951106;
 bh=vpOrg23ugN8RVXk1qKcEYWZUDNkmrc1oQABwXdavE5k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XDVZGtb/40BwT22m0lbAaPVFj7xPnoRoAMRy3tmvP5aUgcKGA5+GOj7ZrsblA4xJ9
 sTXJLemdk/cXSQNGt6Jq9wSAOEQbO13MXcVVJ5DomfE60Qulinv3qf7L1+XPF/iufN
 Ru/9UdyJJ01wm/48j6xU2UZtHJBKQn2F+Z768D8o=
Date: Thu, 31 Jan 2019 17:11:37 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: subpage reads/writes with fsl_elbc_nand driver
Message-ID: <20190131165558.59ed85ea@bbrezillon>
In-Reply-To: <add8754e-e044-a6d7-2ead-067777afbde4@prevas.dk>
References: <add8754e-e044-a6d7-2ead-067777afbde4@prevas.dk>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_081148_633536_921D1721 
X-CRM114-Status: GOOD (  20.70  )
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
> 
> and then an endless loop of errors. With that hunk, I get a little
> longer, but without the former the boot stops at
> 
>     [    0.918927] ubi0 error: validate_ec_hdr: bad VID header offset
> 2048, expected 512
>     [    0.926549] ubi0 error: validate_ec_hdr: bad EC header
>     [    0.931745] Erase counter header dump:
>     [    0.935547]        magic          0x55424923
>     [    0.939344]        version        1
>     [    0.942359]        ec             9
>     [    0.945373]        vid_hdr_offset 2048
>     [    0.948610]        data_offset    4096
>     [    0.951879]        image_seq      1882958541
>     [    0.955678]        hdr_crc        0x1a47f3d3
>     ...
>     [    1.059976] ubi0 error: ubi_io_read_ec_hdr: validation failed for
> PEB 0
>     [    1.066669] ubi0 error: ubi_attach_mtd_dev: failed to attach
> mtd0, error -22
>     [    1.073824] UBI error: cannot attach mtd0
>     [    1.083983] VFS: Cannot open root device "ubi0:rootfs" or
> unknown-block(0,0): error -19
> 
> I have
> 
>        nand-ecc-mode = "soft";
>        nand-ecc-algo = "bch";
>        nand-ecc-strength = <4>;
>        nand-ecc-step-size = <512>;
> 
> in .dts. Is there some device-tree setting/quirk I can use to avoid the
> above hacks? Alternatively, can someone provide some hints on how a
> mainlinable patch achieving the above would look?

Just pass ubi.mtd=<part-name>,<page-size> on the command line. This way
the VID header will be read/written from/to the second page instead of
the 2nd subpage of the first page.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
