Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zbmhh-0003nk-0g
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:39:10 +0000
Message-ID: <55F7E6A0.9070204@huawei.com>
Date: Tue, 15 Sep 2015 17:36:32 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 39/39] ubifs: introduce quota related mount options
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-40-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1442307754-13233-40-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 9/15/2015 5:02 PM, Dongsheng Yang wrote:
> This commit introduce mount options of quota, noquota,
> usrquota and grpquota. These options are used to make
> ubifs support quota.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/super.c | 30 ++++++++++++++++++++++++++++++
>  fs/ubifs/ubifs.h |  4 ++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index da16c65..e7e68ee 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -36,6 +36,7 @@
>  #include <linux/mount.h>
>  #include <linux/math64.h>
>  #include <linux/writeback.h>
> +#include <linux/quotaops.h>
>  #include <linux/cdev.h>
>  #include <linux/quotaops.h>
>  #include "ubifs.h"
> @@ -443,6 +444,12 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
>  	else if (c->mount_opts.chk_data_crc == 1)
>  		seq_puts(s, ",no_chk_data_crc");
>  
> +	if (c->usrquota)
> +		seq_puts(s, ",usrquota");
> +
> +	if (c->grpquota)
> +		seq_puts(s, ",grpquota");
> +
>  	if (c->mount_opts.override_compr) {
>  		seq_printf(s, ",compr=%s",
>  			   ubifs_compr_name(c->mount_opts.compr_type));
> @@ -1112,6 +1119,10 @@ enum {
>  	Opt_chk_data_crc,
>  	Opt_no_chk_data_crc,
>  	Opt_override_compr,
> +	Opt_ignore,
> +	Opt_quota,
> +	Opt_usrquota,
> +	Opt_grpquota,
>  	Opt_err,
>  };
>  
> @@ -1123,6 +1134,10 @@ static const match_table_t tokens = {
>  	{Opt_chk_data_crc, "chk_data_crc"},
>  	{Opt_no_chk_data_crc, "no_chk_data_crc"},
>  	{Opt_override_compr, "compr=%s"},
> +	{Opt_ignore, "noquota"},
> +	{Opt_quota, "quota"},
> +	{Opt_usrquota, "usrquota"},
> +	{Opt_grpquota, "grpquota"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -1223,6 +1238,21 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
>  			c->default_compr = c->mount_opts.compr_type;
>  			break;
>  		}
> +#ifdef CONFIG_QUOTA
> +		case Opt_quota:
> +		case Opt_usrquota:
> +			c->usrquota = 1;
> +			break;
> +		case Opt_grpquota:
> +			c->grpquota = 1;
> +			break;
> +#else
Hi, Dongsheng,

The elseif here can be covered by default :)

thanks,
Sheng
> +		case Opt_quota:
> +		case Opt_usrquota:
> +		case Opt_grpquota:
> +			ubifs_err(c, "quota operations not supported");
> +			break;
> +#endif
>  		default:
>  		{
>  			unsigned long flag;
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 21b5dc0..ef06af7 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1044,6 +1044,8 @@ struct ubifs_debug_info;
>   * @bulk_read: enable bulk-reads
>   * @default_compr: default compression algorithm (%UBIFS_COMPR_LZO, etc)
>   * @rw_incompat: the media is not R/W compatible
> + * @usrquota: enable usrquota
> + * @grpquota: enable grpquota
>   *
>   * @tnc_mutex: protects the Tree Node Cache (TNC), @zroot, @cnext, @enext, and
>   *             @calc_idx_sz
> @@ -1285,6 +1287,8 @@ struct ubifs_info {
>  	unsigned int bulk_read:1;
>  	unsigned int default_compr:2;
>  	unsigned int rw_incompat:1;
> +	unsigned int usrquota:1;
> +	unsigned int grpquota:1;
>  
>  	struct mutex tnc_mutex;
>  	struct ubifs_zbranch zroot;
> 
