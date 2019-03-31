Return-Path: <SRS0=WHT+=SC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B70DC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 11:23:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ADC22086C
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 11:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c2/UQBHg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ADC22086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDJejs0jhlMWePXZPo0v1Ct6cFtZr4AVrFKdByKdmw4=; b=c2/UQBHgNXbe/O
	gQ6ahV99c/7rkEf8tSZWso4mDym/fzDVkTXrFm3Tabfor39BRsBTED0RP+qEEMEN84tdbwy9nyuFw
	ZfXjCHReuTw9RsDbaL3YNl1NejM/Z1v8umHLdQLN1WE57rpEA9Kv9K1+kXrlI7RdUBJisbBdVZ3EY
	HTNrf+OEsE4buDU0iFDhSrCx3k625ENJeCr2vEi62TVtvCWy3bGzD5LhiOksQyxsYNRBgLrwmLWQ2
	WhgQfN+3vV4AY5ghJULnwMqXADfSOVF5YViWWgxAN+mjE7T0oFKmgVK420heba/2d6LhtQMZpy03l
	/6zUKRVbD7A8EFxCu4Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAYYn-000756-HU; Sun, 31 Mar 2019 11:23:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAYYe-0006wt-CC; Sun, 31 Mar 2019 11:23:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AE096280B8B;
 Sun, 31 Mar 2019 12:23:22 +0100 (BST)
Date: Sun, 31 Mar 2019 13:23:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 05/36] mtd: nand: Add a NAND page I/O request type
Message-ID: <20190331132319.5d89cfc1@collabora.com>
In-Reply-To: <20190304222841.13899-6-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
 <20190304222841.13899-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_042324_674375_CABF6FD1 
X-CRM114-Status: GOOD (  20.83  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  4 Mar 2019 23:28:10 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Use an enum to differentiate the type of I/O (reading or writing a
> page). Also update the request iterator.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/core.c |  4 ++--
>  include/linux/mtd/nand.h    | 13 +++++++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index ed5e340dff51..9ee192585854 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -558,7 +558,7 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
>  
>  	mutex_lock(&spinand->lock);
>  
> -	nanddev_io_for_each_page(nand, from, ops, &iter) {
> +	nanddev_io_for_each_page(nand, NAND_PAGE_READ, from, ops, &iter) {
>  		ret = spinand_select_target(spinand, iter.req.pos.target);
>  		if (ret)
>  			break;
> @@ -606,7 +606,7 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
>  
>  	mutex_lock(&spinand->lock);
>  
> -	nanddev_io_for_each_page(nand, to, ops, &iter) {
> +	nanddev_io_for_each_page(nand, NAND_PAGE_WRITE, to, ops, &iter) {
>  		ret = spinand_select_target(spinand, iter.req.pos.target);
>  		if (ret)
>  			break;
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 30f0fb02abe2..84ab76f34c74 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -82,8 +82,14 @@ struct nand_pos {
>  	unsigned int page;
>  };
>  
> +enum nand_page_io_req_type {
> +	NAND_PAGE_READ = 0,
> +	NAND_PAGE_WRITE,
> +};

Please add a kernel doc header. Once done you can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +
>  /**
>   * struct nand_page_io_req - NAND I/O request object
> + * @type: the type of page I/O: read or write
>   * @pos: the position this I/O request is targeting
>   * @dataoffs: the offset within the page
>   * @datalen: number of data bytes to read from/write to this page
> @@ -99,6 +105,7 @@ struct nand_pos {
>   * specific commands/operations.
>   */
>  struct nand_page_io_req {
> +	enum nand_page_io_req_type type;
>  	struct nand_pos pos;
>  	unsigned int dataoffs;
>  	unsigned int datalen;
> @@ -624,11 +631,13 @@ static inline void nanddev_pos_next_page(struct nand_device *nand,
>   * layer.
>   */
>  static inline void nanddev_io_iter_init(struct nand_device *nand,
> +					enum nand_page_io_req_type reqtype,
>  					loff_t offs, struct mtd_oob_ops *req,
>  					struct nand_io_iter *iter)
>  {
>  	struct mtd_info *mtd = nanddev_to_mtd(nand);
>  
> +	iter->req.type = reqtype;
>  	iter->req.mode = req->mode;
>  	iter->req.dataoffs = nanddev_offs_to_pos(nand, offs, &iter->req.pos);
>  	iter->req.ooboffs = req->ooboffs;
> @@ -698,8 +707,8 @@ static inline bool nanddev_io_iter_end(struct nand_device *nand,
>   *
>   * Should be used for iterate over pages that are contained in an MTD request.
>   */
> -#define nanddev_io_for_each_page(nand, start, req, iter)		\
> -	for (nanddev_io_iter_init(nand, start, req, iter);		\
> +#define nanddev_io_for_each_page(nand, type, start, req, iter)		\
> +	for (nanddev_io_iter_init(nand, type, start, req, iter);	\
>  	     !nanddev_io_iter_end(nand, iter);				\
>  	     nanddev_io_iter_next_page(nand, iter))
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
