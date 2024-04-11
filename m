Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875C6CD1284
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 08:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDGKhBIc56EgMLLncQdbqzruZUXDfo5lGAePys4HWMo=; b=zMuJ6cKF9yoJeE
	IzgaDtcm6FejUM5Ln3tmR4X439hAnsDzbY/PUOUUYv7kD9MyRwAjk3k+PTLGe/a94aKBeSqdWeW15
	bJbKXhPSnbskQyDf8958Z4gNfPIyOU0fTMdaW0negZJzTn/gzTcAgluQET0pjJlLIPDGrupZMcTZC
	8HPy2mBJwL500L+WnOr5UovHa6E6FJBzlqLmkB8TCD4rH2/OR2GyMqsma/srUU1HnftieOB1196VL
	b6ibwmdN3u0LDOIiSlOJg7U/LWHio2LwUJqUDC2RdhmwZ/kwzh9Oa45nY/t87hcJsiJboOvhinCRr
	u2abR0knxazYTzJP0bBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqBD-0000000BC6D-2cYg;
	Thu, 11 Apr 2024 08:53:11 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqB9-0000000BC2K-3gTh
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 08:53:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40C52148CC29;
	Thu, 11 Apr 2024 10:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1712825576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=NgO6OjXf6iEGnq0O9UnTHt48tOQRdt7cpLTMDR0T0CI=;
	b=HIBfpGdQ60ia3YLx/RwmLePW3Ge8Hbc42yGOqAgS1q5X2e6DWd+0zlurXo6Y4wYLEhP+Ka
	V77tth+5hyRE+leQasVChcCDT+Fp/bMlV8OzxO4+IDk0bzqplzeaWLXesn9w+9YhwV6NZc
	ZJyX3+/P47UstOyOEovjZ7QIVAtXYgLpef0wfRkXdLD5m/TBrCyTLTda2+vJU5bGo8wi4o
	yEsESnyW2jLd+5jPHaIchZwVmwPkSPvdgxe6S6zl9vz5jNEDOtCHu2Wz1Rntgmkz7nZVgK
	l7JWxbR0jF9AYXz59ssbVUpS9TRFkfY3imzGGqfuCa0y5klrzRyGjo6xL3fX9w==
Date: Thu, 11 Apr 2024 10:52:48 +0200
From: "ada@thorsis.com" <ada@thorsis.com>
To: Steven Seeger <steven.seeger@flightsystems.net>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"ada@thorsis.com" <ada@thorsis.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>
Subject: Re: NAND parameter page read fails with bitflip and no column change
 support
Message-ID: <20240411-candied-plod-8e55373d63cd@thorsis.com>
Mail-Followup-To: Steven Seeger <steven.seeger@flightsystems.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>
References: <mailman.25709.1712772710.1280.linux-mtd@lists.infradead.org>
 <DM6PR05MB4506C6DFD7ED777C5896B83BF7062@DM6PR05MB4506.namprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR05MB4506C6DFD7ED777C5896B83BF7062@DM6PR05MB4506.namprd05.prod.outlook.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_015308_739878_4985E15B 
X-CRM114-Status: GOOD (  18.14  )
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

Hello Steven, Miquel,

Am Wed, Apr 10, 2024 at 06:45:58PM +0000 schrieb Steven Seeger:
> >I had reached out to Miquel privately with this issue, only due to the desire to
> >help inform maintainers of the issue. I was too busy at the time to join the list
> >and write up something more formal. Miquel provided a small patch for me
> >that did not work at the time, and then I lost access to the board for a while.
> >Now I have a little time and a board, so I am here to report the issue and make it public.
> 
> I tried the patch from Miquel back in February and it works correctly with 6.6.12
> and my older driver without column change support.
> 
> Here is h is patch for reference:
> 
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -2123,7 +2123,7 @@ EXPORT_SYMBOL_GPL(nand_reset_op);
>  int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
>                       bool force_8bit, bool check_only)
>  {
> -       if (!len || !buf)
> +       if (!len || (!check_only && !buf))
>                 return -EINVAL;
>  
>         if (nand_has_exec_op(chip)) {

Looking at the context aka the whole function nand_read_data_op() this
looks fine.  I had reported the same issue in March, referencing the
same commit 9f820fc0651c ("mtd: rawnand: Check the data only read
pattern only once") you mentioned in your other mail:

Link: https://lore.kernel.org/linux-mtd/20240307-pantry-deceit-78ce20f47899@thorsis.com/

With nand_read_data_op() fixed in nand_onfi_detect() the boolean
`use_datain` is true now instead of false (because
rawnand_check_data_only_read_support() calls that function, too).  So
in nand_onfi_detect() code jumps to nand_read_data_op() in the second
loop run now instead of nand_change_read_column_op() which probably
masks that other problem with mtd->writesize not set mentioned in our
earlier discussion.

Long story short: the diff above in itself seems correct to me.  A
test with that fix applied on our sam9x60 board using
nand_soft_waitrdy instead of RB# gpio successfully gets ONFI param
page 1 with nand_read_data_op() after getting ONFI param page 0 with
nand_read_param_page_op() failed.

You said this is a patch/diff from Miquel.  Miquel do you send this
as a proper patch then, or should someone else?

Greets
Alex

P.S.: still busy with other things, no time yet for proper timing
analysis of our other NAND flash problems with logic analyzer etc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
