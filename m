Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mr97T-00076z-9u
	for linux-mtd@lists.infradead.org; Fri, 25 Sep 2009 11:37:52 +0000
Message-ID: <4ABCAB8E.5070604@nokia.com>
Date: Fri, 25 Sep 2009 14:37:50 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] UBIFS: Add /dev/ubiX_Y naming scheme in open_ubi
References: <71cd59b00909241541y645c40farac56a7eadb84c02b@mail.gmail.com>
	<1253832477-29064-1-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1253832477-29064-1-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "util-linux-ng@vger.kernel.org" <util-linux-ng@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Corentin Chary wrote:
> This is needed to use $ mount /dev/ubi0_0 /mnt/nand
> You'll also need a recent libblkid with UBI and UBIFS
> support.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> ---
>  fs/ubifs/super.c |   12 ++++++++----
>  1 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 7e2b3d4..38320ad 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1843,10 +1843,11 @@ const struct super_operations ubifs_super_operations = {
>   * @mode: UBI volume open mode
>   *
>   * There are several ways to specify UBI volumes when mounting UBIFS:
> - * o ubiX_Y    - UBI device number X, volume Y;
> - * o ubiY      - UBI device number 0, volume Y;
> - * o ubiX:NAME - mount UBI device X, volume with name NAME;
> - * o ubi:NAME  - mount UBI device 0, volume with name NAME.
> + * o /dev/ubiX_Y - UBI device number X, volume Y;
> + * o ubiX_Y      - UBI device number X, volume Y;
> + * o ubiY        - UBI device number 0, volume Y;
> + * o ubiX:NAME   - mount UBI device X, volume with name NAME;
> + * o ubi:NAME    - mount UBI device 0, volume with name NAME.
>   *
>   * Alternative '!' separator may be used instead of ':' (because some shells
>   * like busybox may interpret ':' as an NFS host name separator). This function
> @@ -1858,6 +1859,9 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
>  	int dev, vol;
>  	char *endptr;
>  
> +	if (!strncmp("/dev/", name, 5))
> +		name = name + 5;
> +
>  	if (name[0] != 'u' || name[1] != 'b' || name[2] != 'i')
>  		return ERR_PTR(-EINVAL);

Is this for the kernel?

I do not think UBIFS should interpret the file name.  It should
work off the major and minor numbers from the device node
irrespective of what its path name or file name is.
