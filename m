Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779FDC25B77
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2024 08:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74qCt8TdVwzh7zYtI8HfIA6yBMlgNJ/zUos3GOVfvn8=; b=FYPT0SeoR+ieaQ
	Ssla7ViqyRxe/UbKjq18UxfbMoh+ukUMPrWweF7jyHJJY1UDG3Nc0yX8JH3F25O0pvVEG8hNfgW+U
	Q0Wi2169LC/X4+hlY0iNpGn4RSHjwAA4cgWQZAimM+71nmKq+NMFF+Up+WEUJ9Wd3bH1lNkaTJM8S
	fqNoLHvcM41cPS9gY9lTCOuPFCbGyIqz1UGc3quAu9Jynznna543Pa0Mi8xfAvqyrpoEYEmwis+Kv
	AOaAnRMls98vimQKS+KKwFB7oCUFbv1yN9RcI++edoEvgDQosSJbS9aJmJX+/CfD+45f6+EsJw0X3
	c5fN1tz+3skvMu8hn5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79jq-00000000tsv-35Kh;
	Wed, 15 May 2024 08:11:50 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79jn-00000000tpv-1nOW
	for linux-mtd@lists.infradead.org;
	Wed, 15 May 2024 08:11:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A89DE148885E;
	Wed, 15 May 2024 10:11:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1715760700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4BubNEfkOvTMW0pqXeyPLnMVtWNnuEC5YxCaM2+E75o=;
	b=nLlIqFDJtN5RT3rg2ftmmAD4TtJQvZ2V95Ryzp3zvfbBVrhQa8ntMuphgXryQWUAmovlZA
	yrkJRUzYd42aInplVVp/P4hNuag5n0OtEOgKW3dWoUXGxZoMCISPXSjPXaB5mhr//zbPiU
	Eij650wC8BMc5/Ku/nmOhXfqaofoW6YC+Q4t5sN+NKZi123jTjtztjvPbWTqccqauisY0a
	6hb8I4ZCidXemIPev7BCCq7rVL5oEE8ZpRElE2dESHMTz4FIiLwWyyIffesDiQGiC1EsWe
	OGk84+3koD7VToXED+ou+Mf8v7IXbv4PXFdqgfkk2Uvbf6CtkFB/0g3TDfxE2Q==
Date: Wed, 15 May 2024 10:11:37 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: rawnand: make
 rawnand_check_data_only_read_support() work
Message-ID: <20240515-sponge-yin-461a31d7811e@thorsis.com>
Mail-Followup-To: Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
References: <20240514103355.817056-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514103355.817056-1-s.hauer@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_011147_802689_B52702D5 
X-CRM114-Status: GOOD (  15.46  )
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

Hello Sascha,

Am Tue, May 14, 2024 at 12:33:55PM +0200 schrieb Sascha Hauer:
> rawnand_check_data_only_read_support() calls nand_read_data_op() with a
> NULL pointer as buffer which will immediately return an error. Allow a
> NULL buffer pointer when check_only is requested. This should be safe to
> do as nand_read_data_op() has no business in touching the buffer in
> check_only mode.
> =

> Fixes: 9f820fc0651c ("mtd: rawnand: Check the data only read pattern only=
 once")
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand=
_base.c
> index d7dbbd469b892..a5e7d8deafbbe 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -2173,7 +2173,7 @@ EXPORT_SYMBOL_GPL(nand_reset_op);
>  int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int le=
n,
>  		      bool force_8bit, bool check_only)
>  {
> -	if (!len || !buf)
> +	if (!len || (!buf && !check_only))
>  		return -EINVAL;
>  =

>  	if (nand_has_exec_op(chip)) {

A very similar patch has been proposed by Miqu=E8l with
<20240507160546.130255-2-miquel.raynal@bootlin.com> recently. o.O

Greets
Alex

Link: https://lore.kernel.org/linux-mtd/20240507160546.130255-2-miquel.rayn=
al@bootlin.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
