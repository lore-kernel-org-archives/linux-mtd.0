Received: from mx1.redhat.com ([209.132.183.28])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mim4Y-0003n2-TT
	for linux-mtd@lists.infradead.org; Wed, 02 Sep 2009 09:24:16 +0000
Date: Wed, 2 Sep 2009 11:24:02 +0200
From: Karel Zak <kzak@redhat.com>
To: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 1/3] blkid: add UBI volume support
Message-ID: <20090902092402.GI1466@nb.net.home>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<1251112316-18971-2-git-send-email-corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1251112316-18971-2-git-send-email-corentincj@iksaif.net>
Cc: Theodore Ts'o <tytso@mit.edu>, util-linux-ng@vger.kernel.org,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


 Hi Corentin,

On Mon, Aug 24, 2009 at 01:11:54PM +0200, Corentin Chary wrote:
> Probe UBI volume under /dev (or /devfs, /devices).

 that's not elegant. Does it mean that UBI volumes are not in
 /proc/partitions?
 
 Ted, any comment?

> ubi_ctrl skip is hardcoded, maybe we should find a
> cleaner way to do that. Also change probe.c to handle
> char devices.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> ---
>  shlibs/blkid/src/blkidP.h  |    1 +
>  shlibs/blkid/src/devname.c |   56 +++++++++++++++++++++++++++++++++++++++++++-
>  shlibs/blkid/src/probe.c   |    2 +
>  3 files changed, 58 insertions(+), 1 deletions(-)
> 
> diff --git a/shlibs/blkid/src/blkidP.h b/shlibs/blkid/src/blkidP.h
> index e0e5cb8..8db6599 100644
> --- a/shlibs/blkid/src/blkidP.h
> +++ b/shlibs/blkid/src/blkidP.h
> @@ -237,6 +237,7 @@ extern char *blkid_strndup(const char *s, const int length);
>  /*
>   * Priority settings for different types of devices
>   */
> +#define BLKID_PRI_UBI	50
>  #define BLKID_PRI_DM	40
>  #define BLKID_PRI_EVMS	30
>  #define BLKID_PRI_LVM	20
> diff --git a/shlibs/blkid/src/devname.c b/shlibs/blkid/src/devname.c
> index ef686f4..cac13c5 100644
> --- a/shlibs/blkid/src/devname.c
> +++ b/shlibs/blkid/src/devname.c
> @@ -229,7 +229,9 @@ static void probe_one(blkid_cache cache, const char *ptname,
>  		    dev->bid_devno == devno)
>  			goto set_pri;
>  
> -		if (stat(device, &st) == 0 && S_ISBLK(st.st_mode) &&
> +		if (stat(device, &st) == 0 &&
> +		    (S_ISBLK(st.st_mode) ||
> +		     (S_ISCHR(st.st_mode) && !strncmp(ptname, "ubi", 3))) &&
>  		    st.st_rdev == devno) {
>  			devname = blkid_strdup(device);
>  			goto get_dev;
> @@ -388,6 +390,57 @@ evms_probe_all(blkid_cache cache, int only_if_new)
>  	return num;
>  }
>  
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
             
 leak:          free(device);

> +				break ;

 I hope one day we will convert whole libblkid to use openat(),
 statat(), ... functions to avoid malloc() and sprintf() for paths :-)

> +			if (!(st.st_rdev & 0xFF)) { // It's an UBI Device
> +				free(device);
> +				continue ;
> +			}
> +			dev = st.st_rdev;
> +			DBG(DEBUG_DEVNAME, printf("UBI vol %s: devno 0x%04X\n",
> +						  device,
> +						  (int) dev));
> +			probe_one(cache, name, dev, BLKID_PRI_UBI,
> +				  only_if_new);
> +			free(device);
> +		}
> +		closedir(dir);
> +	}
> +}

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
