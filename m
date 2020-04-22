Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B96C54FCC
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 06:37:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E1A2063A
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 06:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RPYVIEXQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E1A2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7JLwOUznSOaIvUZ9lwDIP6s+iCpnZ2VscRCEF/twAw=; b=RPYVIEXQOsPV3n
	SeqXebsFV0z59tvXt/6k+6m6T6n83VmbPjKArizD4rhuHKi7zm+vEAK+tLsF31Gr69sZwDWuoCP+p
	yD6ZACZqsMBD3/8xBUwqB9SiJcpmRFgixqjHu5qULa0pbiBLQD+RLURLfNHcJqZym+XoDPP8W5lc0
	RxtUOvoluIYhNe5XEprRRqrwoC5ObiVjt6LZFe5Qz45R8X9MN5MAgjmjBrxxR1E2PYlbKTM+jRZp+
	S749TkpXh7e2eaAvJdtY9t7IUYd8xhM9ZcM7iEZHIRRHpbvwqPYYcIgnm1zUNVGPdOeSpOoFmaJxF
	cYoebd5aLd2gyOC5msvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR90G-00007I-PG; Wed, 22 Apr 2020 06:37:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR90E-00006n-1O
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 06:36:59 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3D9662A0390;
 Wed, 22 Apr 2020 07:36:56 +0100 (BST)
Date: Wed, 22 Apr 2020 08:36:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/8] mtd: rawnand: timings: Add mode information to the
 timings structure
Message-ID: <20200422083652.6e643a4b@collabora.com>
In-Reply-To: <20200421164637.8086-2-miquel.raynal@bootlin.com>
References: <20200421164637.8086-1-miquel.raynal@bootlin.com>
 <20200421164637.8086-2-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_233658_211534_F0069A65 
X-CRM114-Status: GOOD (  18.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 21 Apr 2020 18:46:30 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Convert the timings union into a structure containing the mode and the
> actual values. The values are still a union in prevision of the
> addition of the NVDDR modes.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Two nits below.

> ---
>  drivers/mtd/nand/raw/nand_timings.c |  6 ++++++
>  include/linux/mtd/rawnand.h         | 10 +++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index f64b06a71dfa..0061cbaf931d 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -16,6 +16,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  	/* Mode 0 */
>  	{
>  		.type = NAND_SDR_IFACE,
> +		.timings.mode = 0,
>  		.timings.sdr = {
>  			.tCCS_min = 500000,
>  			.tR_max = 200000000,
> @@ -58,6 +59,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  	/* Mode 1 */
>  	{
>  		.type = NAND_SDR_IFACE,
> +		.timings.mode = 1,
>  		.timings.sdr = {
>  			.tCCS_min = 500000,
>  			.tR_max = 200000000,
> @@ -100,6 +102,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  	/* Mode 2 */
>  	{
>  		.type = NAND_SDR_IFACE,
> +		.timings.mode = 2,
>  		.timings.sdr = {
>  			.tCCS_min = 500000,
>  			.tR_max = 200000000,
> @@ -142,6 +145,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  	/* Mode 3 */
>  	{
>  		.type = NAND_SDR_IFACE,
> +		.timings.mode = 3,
>  		.timings.sdr = {
>  			.tCCS_min = 500000,
>  			.tR_max = 200000000,
> @@ -184,6 +188,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  	/* Mode 4 */
>  	{
>  		.type = NAND_SDR_IFACE,
> +		.timings.mode = 4,
>  		.timings.sdr = {
>  			.tCCS_min = 500000,
>  			.tR_max = 200000000,
> @@ -226,6 +231,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  	/* Mode 5 */
>  	{
>  		.type = NAND_SDR_IFACE,
> +		.timings.mode = 5,
>  		.timings.sdr = {
>  			.tCCS_min = 500000,
>  			.tR_max = 200000000,
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 1e76196f9829..d91f914d2e9e 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -491,13 +491,17 @@ enum nand_data_interface_type {
>  /**
>   * struct nand_data_interface - NAND interface timing
>   * @type:	 type of the timing
> - * @timings:	 The timing, type according to @type
> + * @timings:	 The timing

			     ^timing information

> + * @timings.mode: Timing mode as referred in the specification

				  ^ as defined?

>   * @timings.sdr: Use it when @type is %NAND_SDR_IFACE.
>   */
>  struct nand_data_interface {
>  	enum nand_data_interface_type type;
> -	union {
> -		struct nand_sdr_timings sdr;
> +	struct nand_timings {
> +		unsigned int mode;
> +		union {
> +			struct nand_sdr_timings sdr;
> +		};
>  	} timings;
>  };
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
