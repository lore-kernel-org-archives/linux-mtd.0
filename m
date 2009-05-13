Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M49c5-0004bD-SM
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 08:15:01 +0000
Subject: Re: [PATCH 3/3] mkfs.ubifs: use libubi to format UBI volume
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <1241862068-10596-4-git-send-email-corentincj@iksaif.net>
References: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-2-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-3-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-4-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 May 2009 11:12:28 +0300
Message-Id: <1242202348.27996.165.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, 2009-05-09 at 11:41 +0200, Corentin Chary wrote:
> libubi is now used to format directly UBI volume.
> Typing mkfs.ubifs /dev/ubi0_0 is now possible.
> dtypes should be ok as they are taken from UBIFS code.

Did you test that this works fine on UBI volume and there
are no regressions when you output to a file?

...


>  static const char *helptext =
> -"Usage: mkfs.ubifs [OPTIONS]\n"
> +"Usage: mkfs.ubifs [OPTIONS] [device]\n"
> +"Example: mkfs.ubifs ubi0:test\n"
> +"         mkfs.ubifs -r /opt/img ubi0:test\n"
> +"         mkfs.ubifs -m 512 -e 128KiB -c 100 -r /opt/img -o ubifs.img\n\n"
>  "Make a UBIFS file system image from an existing directory tree\n\n"
>  "Options:\n"
>  "-r, -d, --root=DIR       build file system from directory DIR\n"

I think some more text in the help output which says you may direct
the result to either a file or UBI volume would be nice to have.

> @@ -357,11 +362,9 @@ static int validate_options(void)
>  {
>  	int tmp;
>  
> -	if (!root)
> -		return err_msg("root directory was not specified");
>  	if (!output)
> -		return err_msg("no output file specified");
> -	if (in_path(root, output))
> +		return err_msg("no output file or UBI volume specified");
> +	if (root && in_path(root, output))
>  		return err_msg("output file cannot be in the UBIFS root "
>  			       "directory");

Why you removed

if (!root)
	return err_msg("root directory was not specified");

?

>  	if (!is_power_of_2(c->min_io_size))
> @@ -468,6 +471,34 @@ static long long get_bytes(const char *str)
>  	return bytes;
>  }
>  
> +/**
> + * open_ubi - parse UBI device name string and open the UBI device.
> + * @name: UBI volume name
> + *
> + * There are several ways to specify UBI volumes
> + * o /dev/ubiX_Y - UBI device number X, volume Y;
> + *
> + * ubi:name ubiX_Y, etc.. are not implemented right now
> + *
> + * Returns %0 in case of success and %-1 in case of faillure
> + */
> +static int open_ubi(const char *name)
> +{
> +	struct stat st;
> +
> +	if (stat(name, &st) || !S_ISCHR(st.st_mode))
> +		return -1;
> +
> +	ubi = libubi_open();
> +	if (!ubi)
> +		return -1;
> +	if (ubi_get_vol_info(ubi, name, &c->vi))
> +		return -1;
> +	if (ubi_get_dev_info1(ubi, c->vi.dev_num, &c->di))
> +		return -1;
> +	return 0;
> +}

The comments are incorrect. 'ubi_get_vol_info()' does not depend on the
name of the file at all. It looks at device's major/minor, then looks up
the information in sysfs.
 
>  /**
> - * write_leb - copy the image of a LEB to the output file.
> + * write_leb - copy the image of a LEB to the output target

You removed the "." from the end :-)

> +
>  /**
>   * write_empty_leb - copy the image of an empty LEB to the output file.

Also s/file/target/ ?

> @@ -1011,8 +1064,6 @@ static int add_inode_with_data(struct stat *st, ino_t inum, void *data,
>  	ino->mtime_nsec = 0;
>  	ino->uid        = cpu_to_le32(st->st_uid);
>  	ino->gid        = cpu_to_le32(st->st_gid);
> -	ino->uid        = cpu_to_le32(st->st_uid);
> -	ino->gid        = cpu_to_le32(st->st_gid);
>  	ino->mode       = cpu_to_le32(st->st_mode);
>  	ino->flags      = cpu_to_le32(use_flags);
>  	ino->data_len   = cpu_to_le32(data_len);

Why the 2 lines are removed?

>  /**
> + * check_volume_empty - check if the UBI volume is empty.
> + *
> + * This function checks if the UBIFS volume is empty by looking if its LEBs are
> + * mapped or not.
> + * Returns zero in case of success and a negative error code in case of
> + * failure.
> + */
> +static int check_volume_empty()
check_volume_empty(void)

Comments are untidy.

> +
> +/**
> + * erase an ubi volume
> + */
> +static int erase_volume()

Ditto.

> +
> +	// FIXME: Ask if the user really want to erase this volume
> +	dbg_msg(1, "volume is not empty, erasing ...");
> +	for (lnum = 0; lnum < c->vi.rsvd_lebs; lnum++) {
> +		err = ubi_is_mapped(out_fd, lnum);
> +		if (err == 1) {
> +			dbg_msg(3, "erasing leb %d/%d", lnum, c->vi.rsvd_lebs);
> +			err = ubi_leb_unmap(out_fd, lnum);
> +		}
> +		if (err < 0)
> +			return err;
> +	}
> +	dbg_msg(1, "done.");
> +	return 0;
> +}

Yeah, I think you should either ask the user, or just refuse
writing to it. Users may just 'ubiupdatevol -t' to erase the
volume before invocating mkfs.ubifs.

Probably it is easier for now to just remove whole
'erase_volume()' ?
 
-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
