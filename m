Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3ACC46CD2
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jan 2024 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:From:References:To:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xDkvnRQzHKEPYdCDIxm5X8BCNWVxuxwJVnc/equfLs=; b=PD6ZD9ardXWwUY
	HYsJ1k/Jg4yGVLjyh27jKEQdsG2nXYFmayao4YWpJLTuZEFlqZX0jM7UbFm2gbQ4Zawqtq6cuymQB
	ZHp+lDdVZ2h8xi3w/JywXSY5VOel46CNEfAxTnSVNr2kyhici0XYIFgHlyD6hG7VKH21X7YhJD+x2
	aj/4pHZz2/0PxqJfqMTbC+As9VkrGkjrOglNrdN3p1zLNafg9HLYcKQon8tFqsM/u+VSOCWGTILWs
	21+rIxqHIren3na++flRa8Cf4mmpbdbCNmMN+D+ieTpTLSGDR4fXbdgoVr/CHa7CugTINeBDuE4Ly
	s6uyml/qW76yevEL0/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rM0Vg-000rKP-2H;
	Sat, 06 Jan 2024 06:50:20 +0000
Received: from mailserv1.kapsi.fi ([2001:67c:1be8::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rM0Vc-000rHw-0E
	for linux-mtd@lists.infradead.org;
	Sat, 06 Jan 2024 06:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Cc:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CC1fEXxouCkGNnoxjzl/PIAjX0T5EAaf66QRM2i0eT8=; b=xHS7WWBwaKS1+5wMmIq0tNlT71
	0TeOAVPlgYN8NGA8TFW9Y5ZMPG3FnKnA1RBf1e8Offp1NibCzySUyHFNC/TF8fdMLuSknV299FXK+
	ZhiXGYRQOjLkfPr9IK7EdhXvjhU4K2juc5wpox5RsEUHhQz3KZMq0LsjiHWcj/ymv2Kxn2OP/k88k
	5GLFp1W7J5nZ8cqr04tnKaPiD6msJe71kwkQj4B1lx6B4P8JFKsQhk1ahhTDKIFh0wbp305vzWDoQ
	cNwWM5+lUFAxjsdLzXOtYw8u8Vo+ELspFPltrfnhHn8jlB/mvZSF6DZwEvZVo03uMDYXdqCLNPx2t
	eosCNwlA==;
Received: from 89-166-32-214.bb.dnainternet.fi ([89.166.32.214]:62139 helo=[192.168.3.116])
	by mailserv1.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1rM0Ug-006jsM-1h;
	Sat, 06 Jan 2024 08:49:19 +0200
Message-ID: <fbce5a93-c3b8-45f4-9698-c76838ac5fea@ext.kapsi.fi>
Date: Sat, 6 Jan 2024 08:49:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Mauri Sandberg <maukka@ext.kapsi.fi>, linux-mtd@lists.infradead.org
Content-Language: en-GB
To: Richard Weinberger <richard@nod.at>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
References: <20231229135653.4764-1-maukka@ext.kapsi.fi>
From: Mauri Sandberg <maukka@ext.kapsi.fi>
In-Reply-To: <20231229135653.4764-1-maukka@ext.kapsi.fi>
X-SA-Exim-Connect-IP: 89.166.32.214
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: Re: [PATCH] mkfs.ubifs: Add option to minimize the amount of LEBs
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_225016_794491_E754EEF0 
X-CRM114-Status: GOOD (  26.93  )
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



On 29.12.2023 15.56, Mauri Sandberg wrote:
> Use case for the new option would be when you want to have a
> non-mutable filesystem in a static ubifs volume and another
> volume for writable data.
> 
> Currently you can find the minimal LEB count by running the
> mkfs.ubifs once with too small max_leb_cnt. This patch uses
> the already calculated minimal amount of LEBs as the max_leb_cnt
> and then proceeds to create the image as usual.
> 
> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> ---
>  ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 40 +++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
> index 8f8d40b..02ca337 100644
> --- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
> +++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
> @@ -141,6 +141,7 @@ static int do_create_inum_attr;
>  static char *context;
>  static int context_len;
>  static struct stat context_st;
> +static int minimize;
>  
>  /* The 'head' (position) which nodes are written */
>  static int head_lnum;
> @@ -163,7 +164,7 @@ static struct inum_mapping **hash_table;
>  /* Inode creation sequence number */
>  static unsigned long long creat_sqnum;
>  
> -static const char *optstring = "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQqaK:b:P:C:";
> +static const char *optstring = "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQqaK:b:P:C:M";
>  
>  enum {
>  	HASH_ALGO_OPTION = CHAR_MAX + 1,
> @@ -202,6 +203,7 @@ static const struct option longopts[] = {
>  	{"hash-algo",          1, NULL, HASH_ALGO_OPTION},
>  	{"auth-key",           1, NULL, AUTH_KEY_OPTION},
>  	{"auth-cert",          1, NULL, AUTH_CERT_OPTION},
> +	{"minimize-lebs",      0, NULL, 'M'},
>  	{NULL, 0, NULL, 0}
>  };
>  
> @@ -258,6 +260,7 @@ static const char *helptext =
>  "                         for signing\n"
>  "    --auth-cert=FILE     Authentication certificate filename for signing. Unused\n"
>  "                         when certificate is provided via PKCS #11\n"
> +"-M  --minimize-lebs      use minimal amount of LEBs\n"
>  "-h, --help               display this help text\n\n"
>  "Note, SIZE is specified in bytes, but it may also be specified in Kilobytes,\n"
>  "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
> @@ -420,8 +423,11 @@ static int validate_options(void)
>  		return err_msg("too large LEB size %d, maximum is %d",
>  				c->leb_size, UBIFS_MAX_LEB_SZ);
>  	if (c->max_leb_cnt < UBIFS_MIN_LEB_CNT)
> -		return err_msg("too low max. count of LEBs, minimum is %d",
> -			       UBIFS_MIN_LEB_CNT);
> +		if (minimize)
> +			c->max_leb_cnt = UBIFS_MIN_LEB_CNT;
> +		else
> +			return err_msg("too low max. count of LEBs, minimum is %d",
> +				       UBIFS_MIN_LEB_CNT);
>  	if (c->fanout < UBIFS_MIN_FANOUT)
>  		return err_msg("too low fanout, minimum is %d",
>  			       UBIFS_MIN_FANOUT);
> @@ -432,13 +438,13 @@ static int validate_options(void)
>  	if (c->log_lebs < UBIFS_MIN_LOG_LEBS)
>  		return err_msg("too few log LEBs, minimum is %d",
>  			       UBIFS_MIN_LOG_LEBS);
> -	if (c->log_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
> +	if (!minimize && c->log_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
>  		return err_msg("too many log LEBs, maximum is %d",
>  			       c->max_leb_cnt - UBIFS_MIN_LEB_CNT);
>  	if (c->orph_lebs < UBIFS_MIN_ORPH_LEBS)
>  		return err_msg("too few orphan LEBs, minimum is %d",
>  			       UBIFS_MIN_ORPH_LEBS);
> -	if (c->orph_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
> +	if (!minimize && c->orph_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
>  		return err_msg("too many orphan LEBs, maximum is %d",
>  			       c->max_leb_cnt - UBIFS_MIN_LEB_CNT);
>  	tmp = UBIFS_SB_LEBS + UBIFS_MST_LEBS + c->log_lebs + c->lpt_lebs;
> @@ -800,6 +806,9 @@ static int get_options(int argc, char**argv)
>  		case AUTH_CERT_OPTION:
>  			return err_msg("mkfs.ubifs was built without crypto support.");
>  #endif
> +		case 'M':
> +			minimize = 1;
> +			break;
>  		}
>  	}
>  
> @@ -847,8 +856,12 @@ static int get_options(int argc, char**argv)
>  	if (c->leb_size == -1)
>  		return err_msg("LEB size was not specified (use -h for help)");
>  
> -	if (c->max_leb_cnt == -1)
> -		return err_msg("Maximum count of LEBs was not specified "
> +	if (!minimize && c->max_leb_cnt == -1)
> +		return err_msg("Maximum count of LEBs or --minimize-lebs was not specified "
> +			       "(use -h for help)");
> +
> +	if (minimize && c->max_leb_cnt != -1)
> +		return err_msg("You have to specify either --minimize-lebs or --max-leb-cnt "
>  			       "(use -h for help)");
>  
>  	if (c->max_bud_bytes == -1) {
> @@ -876,7 +889,8 @@ static int get_options(int argc, char**argv)
>  
>  	if (c->log_lebs == -1) {
>  		c->log_lebs = calc_min_log_lebs(c->max_bud_bytes);
> -		c->log_lebs += 2;
> +		if (!minimize)
> +			c->log_lebs += 2;
>  	}
>  
>  	if (c->min_io_size < 8)
> @@ -888,7 +902,10 @@ static int get_options(int argc, char**argv)
>  		printf("\troot:         %s\n", root);
>  		printf("\tmin_io_size:  %d\n", c->min_io_size);
>  		printf("\tleb_size:     %d\n", c->leb_size);
> -		printf("\tmax_leb_cnt:  %d\n", c->max_leb_cnt);
> +		if (minimize)
> +			printf("\tminimize:     %d\n", minimize);
> +		else
> +			printf("\tmax_leb_cnt:  %d\n", c->max_leb_cnt);
>  		printf("\toutput:       %s\n", output);
>  		printf("\tjrn_size:     %llu\n", c->max_bud_bytes);
>  		printf("\treserved:     %llu\n", c->rp_size);
> @@ -2553,7 +2570,10 @@ static int finalize_leb_cnt(void)
>  {
>  	c->leb_cnt = head_lnum;
>  	if (c->leb_cnt > c->max_leb_cnt)
> -		return err_msg("max_leb_cnt too low (%d needed)", c->leb_cnt);
> +		if (minimize)
> +			c->max_leb_cnt = c->leb_cnt;
> +		else
> +			return err_msg("max_leb_cnt too low (%d needed)", c->leb_cnt);
>  	c->main_lebs = c->leb_cnt - c->main_first;
>  	if (verbose) {
>  		printf("\tsuper lebs:   %d\n", UBIFS_SB_LEBS);
> 
> base-commit: 9471c13faf76ff05f58d636b988bb066ad6d05fa

Friendly ping. Also bringing in Richard and David as I thought at least
they could be relevant maintainers. Thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
