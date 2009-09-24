Received: from mx1.redhat.com ([209.132.183.28])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mqp5j-0004EO-97
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 14:14:44 +0000
Date: Thu, 24 Sep 2009 16:14:33 +0200
From: Karel Zak <kzak@redhat.com>
To: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 1/3] blkid: add UBI volume support
Message-ID: <20090924141433.GC27905@nb.net.home>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<1251112316-18971-2-git-send-email-corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1251112316-18971-2-git-send-email-corentincj@iksaif.net>
Cc: util-linux-ng@vger.kernel.org, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 24, 2009 at 01:11:54PM +0200, Corentin Chary wrote:
> --- a/shlibs/blkid/src/devname.c
> +static void
> +ubi_probe_all(blkid_cache cache, int only_if_new)
> +{
> +	const char **dirname;
> +
> +	for (dirname = dirlist; *dirname; dirname++) {
> +		DBG(DEBUG_DEVNAME, printf("probing UBI volumes under %s\n",
> +					  *dirname));
> +
> +		DIR		*dir;
> +		struct dirent	*iter;
> +
> +		dir = opendir(*dirname);
> +		if (dir == NULL)
> +			continue ;
> +
> +		while ((iter = readdir(dir)) != NULL) {
> +			char		*name, *device;
> +			struct stat	st;
> +			dev_t		dev;
> +
> +			name = iter->d_name;
> +
> +			if (!strcmp(name, ".") || !strcmp(name, "..") ||
> +			    !strstr(name, "ubi"))
> +				continue;
> +			if (!strcmp(name, "ubi_ctrl"))
> +				continue;
> +			device = malloc(strlen(*dirname) + strlen(name) + 2);
> +			if (!device)
> +				break ;
> +			sprintf(device, "%s/%s", *dirname, name);
> +			if (stat(device, &st))
> +				break ;
> +
> +			if (!(st.st_rdev & 0xFF)) { // It's an UBI Device
> +				free(device);
> +				continue ;
> +			}

Wouldn't be better to 

  #define is_ubi_device(s)    (S_ISCHR(s->st_mode) && (s->st_rdev & 0xFF))

(or major() instead magic 0xFF constant?) and use it everywhere in
code? I guess UBI is always a char device.

> +++ b/shlibs/blkid/src/probe.c
> @@ -284,6 +284,8 @@ int blkid_probe_set_device(blkid_probe pr, int fd,
>  
>  		if (S_ISBLK(sb.st_mode))
>  			blkdev_get_size(fd, (unsigned long long *) &pr->size);
> +		else if (S_ISCHR(sb.st_mode))
> +			pr->size = 1;
>  		else
>  			pr->size = sb.st_size;
>  	}

this is the same situation, this code will for all char devices, but we
want to support UBI only.

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
