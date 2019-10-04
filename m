Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD51C4360C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 18:42:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 792FE2077B
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 18:42:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wg6dxcVu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 792FE2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7D/w54s/Lyi37EYEhNnw9fsiAa7JCKH/14lNyrZzprU=; b=Wg6dxcVu81MeHD
	cY9PMz8N61nRXtpjZ+zOUM0uItTyEgn8v1pZEVzCQUJYD0kiONTzyVmVtSWfI3xI4PaLcyCl86SaX
	OAsbd1E68q3/f0JeTB7JBUvUIgeNRs5VfSeaTnUEK71ySZnS9Lf6gZ71Ch61qw4BU74j6/qPjyUkq
	1IjRqNPHT5i8yMQ5rLREdWzvle6+/t8oaC2cuXqjj30DYWU7svNqjzvQ7MYCEd0MUnPpiQ1jbu86f
	swJPzhMDGYCITgZNVo7oH+RqV1k0D6fpoBlQwyjGx6sHa4PV4j+7suYYkNf0yInUIdfkJCRbbVGrn
	lWXILUwd2o6n4t5iXeig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGSWv-0006pT-FY; Fri, 04 Oct 2019 18:42:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGSWs-0006oH-VQ
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 18:42:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id 36FCA28A473
Date: Fri, 4 Oct 2019 14:42:05 -0400
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] mtd: rawnand: au1550nd: Fix au_read_buf16() prototype
Message-ID: <20191004144205.24d38ab3@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191004183706.850363-1-paul.burton@mips.com>
References: <20191004183706.850363-1-paul.burton@mips.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_114215_138929_B7F9C469 
X-CRM114-Status: GOOD (  20.90  )
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
Cc: Paul Burton <pburton@wavecomp.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 4 Oct 2019 18:38:33 +0000
Paul Burton <paul.burton@mips.com> wrote:

> Commit 7e534323c416 ("mtd: rawnand: Pass a nand_chip object to
> chip->read_xxx() hooks") modified the prototype of the struct nand_chip
> read_buf function pointer. In the au1550nd driver we have 2
> implementations of read_buf. The previously mentioned commit modified
> the au_read_buf() implementation to match the function pointer, but not
> au_read_buf16(). This results in a compiler warning for MIPS
> db1xxx_defconfig builds:
> 
>   drivers/mtd/nand/raw/au1550nd.c:443:57:
>     warning: pointer type mismatch in conditional expression
> 
> Fix this by updating the prototype of au_read_buf16() to take a struct
> nand_chip pointer as its first argument, as is expected after commit
> 7e534323c416 ("mtd: rawnand: Pass a nand_chip object to chip->read_xxx()
> hooks").
> 
> Note that this shouldn't have caused any functional issues at runtime,
> since the offset of the struct mtd_info within struct nand_chip is 0
> making mtd_to_nand() effectively a type-cast.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Fixes: 7e534323c416 ("mtd: rawnand: Pass a nand_chip object to chip->read_xxx() hooks")
> Cc: Boris Brezillon <bbrezillon@kernel.org>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: stable@vger.kernel.org # v4.20+
> 
> ---
> 
>  drivers/mtd/nand/raw/au1550nd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
> index 97a97a9ccc36..2bc818dea2a8 100644
> --- a/drivers/mtd/nand/raw/au1550nd.c
> +++ b/drivers/mtd/nand/raw/au1550nd.c
> @@ -140,10 +140,9 @@ static void au_write_buf16(struct nand_chip *this, const u_char *buf, int len)
>   *
>   * read function for 16bit buswidth
>   */
> -static void au_read_buf16(struct mtd_info *mtd, u_char *buf, int len)
> +static void au_read_buf16(struct nand_chip *this, u_char *buf, int len)
>  {
>  	int i;
> -	struct nand_chip *this = mtd_to_nand(mtd);
>  	u16 *p = (u16 *) buf;
>  	len >>= 1;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
