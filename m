Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8V5E-0002aL-6J
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 07:59:06 +0000
Subject: Re: [PATCH 2/2] mkfs.ubifs: use libubi to format UBI volume
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <1243232787-29108-3-git-send-email-corentincj@iksaif.net>
References: <1243232787-29108-1-git-send-email-corentincj@iksaif.net>
	<1243232787-29108-2-git-send-email-corentincj@iksaif.net>
	<1243232787-29108-3-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 10:58:43 +0300
Message-Id: <1243238323.21646.64.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Few more things :-)

On Mon, 2009-05-25 at 08:26 +0200, Corentin Chary wrote:

> +/**
> + * open_ubi - open the UBI volume.
> + * @node: name of the UBI volume character device to fetch information about
> + *
> + * Returns %0 in case of success and %-1 in case of failure
> + */
> +static int open_ubi(const char *node)
> +{
> +	struct stat st;
> +
> +	if (stat(node, &st) || !S_ISCHR(st.st_mode))
> +		return -1;
> +
> +	ubi = libubi_open();
> +	if (!ubi)
> +		return -1;
> +	if (ubi_get_vol_info(ubi, node, &c->vi))
> +		return -1;
> +	if (ubi_get_dev_info1(ubi, c->vi.dev_num, &c->di))
> +		return -1;
> +	return 0;
> +}

I know this is nit-picking, but would be nicer to close libubi
in case of errors. Namely, in the second and third checks.
 
> +static int write_empty_leb(int lnum, int dtype)
>  {
> -	return write_leb(lnum, 0, leb_buf);
> +  return write_leb(lnum, 0, leb_buf, dtype);
>  }

You screwed the indentation here a bit.

>  /**
> @@ -790,8 +838,9 @@ static int do_pad(void *buf, int len)
>   * @node: node
>   * @len: node length
>   * @lnum: LEB number
> + * @dtype: expected data type
>   */
> -static int write_node(void *node, int len, int lnum)
> +static int write_node(void *node, int len, int lnum, int dtype)
>  {
>  	prepare_node(node, len);
>  
> @@ -799,7 +848,7 @@ static int write_node(void *node, int len, int lnum)
>  
>  	len = do_pad(leb_buf, len);
>  
> -	return write_leb(lnum, len, leb_buf);
> +	return write_leb(lnum, len, leb_buf, dtype);
>  }
>  
>  /**
> @@ -909,7 +958,7 @@ static int flush_nodes(void)
>  	if (!head_offs)
>  		return 0;
>  	len = do_pad(leb_buf, head_offs);
> -	err = write_leb(head_lnum, len, leb_buf);
> +	err = write_leb(head_lnum, len, leb_buf, UBI_UNKNOWN);
>  	if (err)
>  		return err;
>  	set_lprops(head_lnum, head_offs, head_flags);
> @@ -1581,14 +1630,20 @@ static int write_data(void)
>  {
>  	int err;
>  
> -	err = stat(root, &root_st);
> -	if (err)
> -		return sys_err_msg("bad root file-system directory '%s'", root);
> +	if (root) {
> +		err = stat(root, &root_st);
> +		if (err)
> +			return sys_err_msg("bad root file-system directory '%s'"
> +					   , root);

This is a little ugly. Could you please leave the comma at close to the
" symbol, and move "root" to the second line. This is just how the rest
of the code is written. Let's be consistent.

You are probably irritated by this, sorry. The whole code is not that
ideal in general, but while I'm on it, I tell about every single nit I
see :-)

> --- a/mkfs.ubifs/ubifs.h
> +++ b/mkfs.ubifs/ubifs.h
> @@ -366,6 +366,9 @@ struct ubifs_info
>  	int dead_wm;
>  	int dark_wm;
>  
> +	struct ubi_dev_info di;
> +	struct ubi_vol_info vi;

For consistency, you should probably comment these new fields.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
