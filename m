Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93095C369CA
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0of6zRdij6SkNHELaHhi6pFrr6ZHKiWcyb6lTHSaqAs=; b=AF+iXtzSKyIsc0geDfDpgWP8L6
	9K8NbeuyF7LzV8RO53h87KNnY1bWJNUYJ1cHxV2j71iAi2FsfCxbwus10O6m8zCE02arcrtmsjwsx
	e61r0sR4B6Dknz9LgSfFmvrf68ZgVQBqA8r/AhTIC9PezGlj2btyZkMThUlnxqk67WPkuqu6M2rhD
	ecNJrf4Tq0WZA9ztYa/FGAj4aBGLYKE9Kjyr78C5zfGlmojMuKW5qNgp9WCHh1a/STnf6UIJXvP25
	+kPYKNomfmYnfBHndYkYZeWVwhSWTayHxuklWTV8mfUBukK4G/fmlfpjO2/WbnLmmCBosmkZgjcOe
	WkxeJlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPQ3-00000004lPR-2qdj;
	Wed, 25 Sep 2024 10:38:51 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPQ0-00000004lOp-0Sh5
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 10:38:49 +0000
Received: from [10.10.2.52] (unknown [10.10.2.52])
	by mail.ispras.ru (Postfix) with ESMTPSA id 8F3944076175;
	Wed, 25 Sep 2024 10:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 8F3944076175
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1727260720;
	bh=QA2W00UTct8IwOfot8FLWZuYzEf/7eHlnAikYCPfKaw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=Lh6fCk0WN6tDrZyOiUZcmq7PpaywwRqJqD3ZxNGlXVyy61BxCprLgzyAjMMePy4CW
	 543L7E1TwF2J2goi3mxGkO1DL4L9VwUufOWYYoqO8gsMpexyrEDMNsJXDkwxoSQ49d
	 amrYrZBnvdUm9/nt6aWOl2wkuG5Z+lzpJei1VFS0=
Subject: Re: [lvc-project] [PATCH] mtd: partitions: redboot: Added conversion
 of operands to a larger type
To: Denis Arefev <arefev@swemel.ru>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: lvc-project@linuxtesting.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
References: <20240910101133.18020-1-arefev@swemel.ru>
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Message-ID: <396dc03f-b4dd-0644-f50a-18613730845c@ispras.ru>
Date: Wed, 25 Sep 2024 13:38:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20240910101133.18020-1-arefev@swemel.ru>
Content-Language: ru-RU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_033848_436587_6424A6FD 
X-CRM114-Status: GOOD (  19.99  )
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

On 10.09.2024 13:11, Denis Arefev wrote:
> The value of an arithmetic expression directory * master->erasesize is
> subject to overflow due to a failure to cast operands to a larger data
> type before perfroming arithmetic
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
>  drivers/mtd/parsers/redboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
> index 3b55b676ca6b..c8f7e7b351d7 100644
> --- a/drivers/mtd/parsers/redboot.c
> +++ b/drivers/mtd/parsers/redboot.c
> @@ -92,7 +92,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
>  	parse_redboot_of(master);
>  
>  	if (directory < 0) {
> -		offset = master->size + directory * master->erasesize;
> +		offset = master->size + (unsigned long) directory * master->erasesize;
>  		while (mtd_block_isbad(master, offset)) {
>  			if (!offset) {
>  nogood:
> 

I guess the message has been sent by a mistake, the patch is already
upstream 1162bc2f8f5de7da23d18aa4b7fbd4e93c369c50

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
