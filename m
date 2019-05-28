Return-Path: <SRS0=NG3o=T4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A81C04AB6
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2019 11:49:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6889B20717
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2019 11:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/X7yEHI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6889B20717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solarflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s32zJ7TpavPM7u3VSomnN+ZF3fqe/wsufTvajFz8VC0=; b=h/X7yEHIECaFmB
	P9EdwecBwdeY0VhgUo9oUsF5SJIwD/ogZ67ouqfRp5kXmZmHuljgycCrDn2fnpAg6i8BVzCg6dDji
	/OI4wjXxilkwaAL2oPcozB6IiNMbBzS1fytNB854RHVMaBCjxHespyKwaeMd75Nl2H+9TBcSNyqny
	ZzUQ9Z8Ekm2arenY5d8oHDm2V5QFDYGa3zUb6T3cAhdcelPwe7DgAL2Qs/TYKVIzZYJSo+bHXuvFR
	qdeTTFISGrRAFUYvFjiUGetryyJ3/fhkE+GvqXK1Zrg/XtgFBUajOaLRqy4nwnvVv0Lpq18zqR1Xq
	aCk+mXkukmQIa+KMJxeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVabu-0002xg-AZ; Tue, 28 May 2019 11:49:42 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVabr-0002wP-MD
 for linux-mtd@lists.infradead.org; Tue, 28 May 2019 11:49:40 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from webmail.solarflare.com (uk.solarflare.com [193.34.186.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1-us5.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 6B99058005F;
 Tue, 28 May 2019 11:49:31 +0000 (UTC)
Received: from [10.17.20.62] (10.17.20.62) by ukex01.SolarFlarecom.com
 (10.17.10.4) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 28 May
 2019 12:49:27 +0100
Subject: Re: [PATCH v2] mtd: remove unused value for mtdoops
To: Weitao Hou <houweitaoo@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
References: <20190527123909.20427-1-houweitaoo@gmail.com>
From: Martin Habets <mhabets@solarflare.com>
Message-ID: <6e0cec45-dfa5-2134-78bf-19378971f7e1@solarflare.com>
Date: Tue, 28 May 2019 12:49:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190527123909.20427-1-houweitaoo@gmail.com>
Content-Language: en-GB
X-Originating-IP: [10.17.20.62]
X-ClientProxiedBy: ukex01.SolarFlarecom.com (10.17.10.4) To
 ukex01.SolarFlarecom.com (10.17.10.4)
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-24642.003
X-TM-AS-Result: No-9.727300-8.000000-10
X-TMASE-MatchedRID: 9zTThWtzImvSQeMvT1QbiHT7rnt3EYkY69aS+7/zbj+qvcIF1TcLYKHD
 MThyZnbzBYNuzSGuMPa9DdmZsxa4vPSCkSozt+9hPwKTD1v8YV5MkOX0UoduuVVkJxysad/Ixyt
 wwT/CqKdg97oGlCzbz1XHewqQrKAfSwojFX8WCDBuh7qwx+D6T6LSueoYb9cimyiLZetSf8nJ4y
 0wP1A6AKEwgORH8p/AjaPj0W1qn0TKayT/BQTiGpqglPQlvqtAbautXXecoMdw5cyQnXcEe5+m4
 5JFmlqbtHVTQJ6Orzo=
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.727300-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-24642.003
X-MDID: 1559044172-6WJZtURA027K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_044939_782576_F152A170 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Variable hdr is used to initialise the memory at cxt->oops_buf, which is used.

Martin

On 27/05/2019 13:39, Weitao Hou wrote:
> MTD oops 'hdr' header is never used, drop its initialization
> 
> Signed-off-by: Weitao Hou <houweitaoo@gmail.com>
> ---
> Changes in v2:
>  -fix comment for patch
> ---
>  drivers/mtd/mtdoops.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index e078fc41aa61..6ae4b70ebdbb 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -191,14 +191,8 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
>  {
>  	struct mtd_info *mtd = cxt->mtd;
>  	size_t retlen;
> -	u32 *hdr;
>  	int ret;
>  
> -	/* Add mtdoops header to the buffer */
> -	hdr = cxt->oops_buf;
> -	hdr[0] = cxt->nextcount;
> -	hdr[1] = MTDOOPS_KERNMSG_MAGIC;
> -
>  	if (panic) {
>  		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
>  				      record_size, &retlen, cxt->oops_buf);
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
