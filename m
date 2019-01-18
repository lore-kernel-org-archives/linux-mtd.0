Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93E7C1B0FD
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 22:43:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90E462084C
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 22:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZmmZ3/u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmeCumMr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90E462084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AszP25eDJgwfkxbH9OBRal+HKku3EU/QoB7FJecTnDA=; b=EZmmZ3/uqrIM7p
	6UB709x24EBxyhXvnd39UF4qvGE6ZuFThI51G5E5MMrbx/Vp3cIV/XCEk4B2Uzz6Ts5z3f++rQ75S
	vmao7pHo9ui/qogFAkLxGZOXcuJAVtm5ZTmeDHWptoJ9EV4PFWwG3OSd3udq4GTaVMjMCyj9GIQUF
	Q5tpZckp+buMAQZpcMFi2VwcmoTRHvwpfoAOzbNujo5ykQVSnHVsghLUUKJtKbFA8R+0Yga3VztWf
	l4VZYnkOrNbxy0FG2a45aiNJW0CvLat0qNYjy0CgJd2rDd8vnWX9jLy+2p9IomD4O3QuJFSB4BXiI
	zbo7SwUFTlB2SPNGpjCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkcqq-0005xW-GZ; Fri, 18 Jan 2019 22:43:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkcqn-0005xA-6w
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 22:42:58 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5899E20823;
 Fri, 18 Jan 2019 22:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547851376;
 bh=mnBIOdNWZOg+y8GX9mDLOOi4uVJK4jFgYUBSSu+NiDQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hmeCumMr1vs8tHOw/AETKIF4lcK0v5/xdzik6OIK5H+Xao+XOrHS8j729CPAte9hj
 5V2cfYS+o92Yh4XXDMn1IHkaoD0dXQb8qT1LGYi9WJw7aGLQJyrh4lg9bXpuuMZMgi
 j0igf/xGjyjSprld8X7z7MbKlZ0vP5p1ZBcFISPY=
Date: Fri, 18 Jan 2019 23:42:48 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation hook
 function pointer
Message-ID: <20190118234236.0d296130@bbrezillon>
In-Reply-To: <BYAPR08MB453384AEAB702223F460039EDB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB453384AEAB702223F460039EDB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_144257_275117_4EC14950 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jan 2019 22:11:34 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> This patch is to add a callback function pointer
> for preparation routine of erase in nand_manufacturer_ops.
> 
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> ---
>  drivers/mtd/nand/raw/internals.h | 2 ++
>  drivers/mtd/nand/raw/nand_base.c | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index fbf6ca0..8382948 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -42,6 +42,7 @@
>   *	     is here to let vendor specific code release those resources.
>   * @fixup_onfi_param_page: apply vendor specific fixups to the ONFI parameter
>   *			   page. This is called after the checksum is verified.
> + * @erase_pre: preparation before actually erase a physical block.
>   */
>  struct nand_manufacturer_ops {
>  	void (*detect)(struct nand_chip *chip);
> @@ -49,6 +50,7 @@ struct nand_manufacturer_ops {
>  	void (*cleanup)(struct nand_chip *chip);
>  	void (*fixup_onfi_param_page)(struct nand_chip *chip,
>  				      struct nand_onfi_params *p);
> +	int (*erase_pre)(struct nand_chip *chip, int page);

Let's move this hook to nand_chip and name it ->pre_erase() or
->erase_preparation().

>  };
>  
>  /**
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index cca4b24..d446d1c 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4246,6 +4246,11 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
>  		    (page + pages_per_block))
>  			chip->pagebuf = -1;
>  
> +		if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
> +		    chip->manufacturer.desc->ops->erase_pre)
> +			chip->manufacturer.desc->ops->erase_pre(chip,
> +						page & chip->pagemask);
> +
>  		if (chip->legacy.erase)
>  			status = chip->legacy.erase(chip,
>  						    page & chip->pagemask);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
