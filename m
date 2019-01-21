Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139D5C282DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 09:32:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3507214DA
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 09:32:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qCkTDrW8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVYffcYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3507214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDN8yJzQEmSaklQxugyGBSDiN27THo7kcnu/rWWv0NU=; b=qCkTDrW8i6nnWF
	JKQ0LWFULTTzMvhK92L9l8Na9U6/fAoBdprTE1IKsp8KehxdOyi5XF6zdHI5xtvGcEXppS3cqRphX
	39FXXGK9o7jKp50W3rBeCp5Qsw9nZGatFedzbG6HvxsY9+GKz2xt6ajMRMNM+Dry/1OtjUONhywXi
	HSnd9/ItGLBsyuyGDXAvaqHyTt705yPGfN/frydPm2JZRVY+Se6p9IJJqS8lpYGs7yF6KuZVnPQMQ
	jGF2N5wZRkAzt4s13H5+Ha9BZ7cWdId1wDdNhil/VfJQRRR9eEB28K29HPSA1cUY1NQRd5zVySUTi
	W8aLT+tOet4SbAk//nhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glVwW-0006Li-Uh; Mon, 21 Jan 2019 09:32:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glVwT-0006LN-SS
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 09:32:31 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43ABC20989;
 Mon, 21 Jan 2019 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548063149;
 bh=eKMbZHPfNcUllA/1osbyy2Q0RrUV2l/XB3Cisdi5bAc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sVYffcYVKv5qCyc6Mt1VLS1+SB2g7QvoRUkAivftZdF5oM61HszcF7fE7DKBdX5JW
 3xn9PwRPYjJ5dOOHqsZnf29GgmppbXShosce1smZhWGAqEq9gZn7LCy0kLXhWVf29O
 Gjv08IcqQBs1JZHJ3C6qdDFD9yXO7lW/4WeoKZdA=
Date: Mon, 21 Jan 2019 10:32:18 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase
 preparation hook function pointer
Message-ID: <20190121103218.67a6600c@bbrezillon>
In-Reply-To: <BYAPR08MB453351FB4AF6F99B24865822DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB453384AEAB702223F460039EDB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118234236.0d296130@bbrezillon>
 <BYAPR08MB453351FB4AF6F99B24865822DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_013229_939206_36910C25 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 21 Jan 2019 09:25:26 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Boris
> Thanks for reviewing this patch.
> 
> >>   *	     is here to let vendor specific code release those resources.
> >>   * @fixup_onfi_param_page: apply vendor specific fixups to the ONFI  
> >parameter  
> >>   *			   page. This is called after the checksum is verified.
> >> + * @erase_pre: preparation before actually erase a physical block.
> >>   */
> >>  struct nand_manufacturer_ops {
> >>  	void (*detect)(struct nand_chip *chip); @@ -49,6 +50,7 @@ struct
> >> nand_manufacturer_ops {
> >>  	void (*cleanup)(struct nand_chip *chip);
> >>  	void (*fixup_onfi_param_page)(struct nand_chip *chip,
> >>  				      struct nand_onfi_params *p);
> >> +	int (*erase_pre)(struct nand_chip *chip, int page);  
> >
> >Let's move this hook to nand_chip and name it ->pre_erase() or  
> >->erase_preparation().  
> >  
> 
> Can you tell us more reasons why moves this hook to nand_chip?

Because it's supposed to be a per-chip thing. I mean, not all of your
chips have this bug (at least I hope), so we want to only have a
->pre_erase() implementation when it's really needed. The manufacturer
specific ->init() hook will decide when it's appropriate to populate
this ->pre_erase pointer based on the NAND chip id (or the NAND chip
model).

> In my opinion, it is better to add this hook in nand_manufacturer_ops, since nand_manufacturer_ops
> Already exists in nand_chip, also this function is related to specific NAND manufacturer.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
