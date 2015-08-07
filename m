Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNYFL-0006MN-DP
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 03:23:04 +0000
Message-ID: <55C4232C.3040200@cn.fujitsu.com>
Date: Fri, 7 Aug 2015 11:17:00 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 18/35] ubifs: introduce quota related mount options
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-19-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55BFD98F.5010302@nod.at>
In-Reply-To: <55BFD98F.5010302@nod.at>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/04/2015 05:13 AM, Richard Weinberger wrote:
> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>> This commit introduce mount options of quota, noquota,
>> usrquota and grpquota. These options are used to make
>> ubifs support quota. But with this commit, quota will
>> not working on ubifs actually. We just introduce options
>> here and will make ubifs support quota later.
>
> Please reorder your commits such that this commit is the last one.
> Then it can be the "Let's wire up quota support commit". :-)

Hmmm, yes, agree.
>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>   fs/ubifs/super.c | 30 ++++++++++++++++++++++++++++++
>>   fs/ubifs/ubifs.h |  7 +++++++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
>> index 161b1a6..2491fff 100644
>> --- a/fs/ubifs/super.c
>> +++ b/fs/ubifs/super.c
>> @@ -36,6 +36,7 @@
>>   #include <linux/mount.h>
>>   #include <linux/math64.h>
>>   #include <linux/writeback.h>
>> +#include <linux/quotaops.h>
>>   #include <linux/cdev.h>
>>   #include "ubifs.h"
>>
>> @@ -439,6 +440,12 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
>>   	else if (c->mount_opts.chk_data_crc == 1)
>>   		seq_puts(s, ",no_chk_data_crc");
>>
>> +	if (c->usrquota)
>> +		seq_puts(s, ",usrquota");
>> +
>> +	if (c->grpquota)
>> +		seq_puts(s, ",grpquota");
>> +
>>   	if (c->mount_opts.override_compr) {
>>   		seq_printf(s, ",compr=%s",
>>   			   ubifs_compr_name(c->mount_opts.compr_type));
>> @@ -930,6 +937,10 @@ enum {
>>   	Opt_chk_data_crc,
>>   	Opt_no_chk_data_crc,
>>   	Opt_override_compr,
>> +	Opt_ignore,
>
> Opt_noquota please.

Good opinion.

Thanx
Yang
>
>> +	Opt_quota,
>> +	Opt_usrquota,
>> +	Opt_grpquota,
>>   	Opt_err,
>>   };
>>
>> @@ -941,6 +952,10 @@ static const match_table_t tokens = {
>>   	{Opt_chk_data_crc, "chk_data_crc"},
>>   	{Opt_no_chk_data_crc, "no_chk_data_crc"},
>>   	{Opt_override_compr, "compr=%s"},
>> +	{Opt_ignore, "noquota"},
>> +	{Opt_quota, "quota"},
>> +	{Opt_usrquota, "usrquota"},
>> +	{Opt_grpquota, "grpquota"},
>>   	{Opt_err, NULL},
>>   };
>>
>> @@ -1041,6 +1056,21 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
>>   			c->default_compr = c->mount_opts.compr_type;
>>   			break;
>>   		}
>> +#ifdef CONFIG_QUOTA
>> +		case Opt_quota:
>> +		case Opt_usrquota:
>> +			c->usrquota = 1;
>> +			break;
>> +		case Opt_grpquota:
>> +			c->grpquota = 1;
>> +			break;
>> +#else
>> +		case Opt_quota:
>> +		case Opt_usrquota:
>> +		case Opt_grpquota:
>> +			ubifs_err(c, "quota operations not supported");
>> +			break;
>> +#endif
>>   		default:
>>   		{
>>   			unsigned long flag;
>> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
>> index c48fb41..3b5a204 100644
>> --- a/fs/ubifs/ubifs.h
>> +++ b/fs/ubifs/ubifs.h
>> @@ -418,6 +418,9 @@ struct ubifs_inode {
>>   	loff_t synced_i_size;
>>   	loff_t ui_size;
>>   	int flags;
>> +#ifdef CONFIG_QUOTA
>> +	struct dquot *i_dquot[MAXQUOTAS];
>> +#endif
>>   	pgoff_t last_page_read;
>>   	pgoff_t read_in_a_row;
>>   	int data_len;
>> @@ -1039,6 +1042,8 @@ struct ubifs_debug_info;
>>    * @bulk_read: enable bulk-reads
>>    * @default_compr: default compression algorithm (%UBIFS_COMPR_LZO, etc)
>>    * @rw_incompat: the media is not R/W compatible
>> + * @usrquota: enable usrquota
>> + * @grpquota: enable grpquota
>>    *
>>    * @tnc_mutex: protects the Tree Node Cache (TNC), @zroot, @cnext, @enext, and
>>    *             @calc_idx_sz
>> @@ -1280,6 +1285,8 @@ struct ubifs_info {
>>   	unsigned int bulk_read:1;
>>   	unsigned int default_compr:2;
>>   	unsigned int rw_incompat:1;
>> +	unsigned int usrquota:1;
>> +	unsigned int grpquota:1;
>>
>>   	struct mutex tnc_mutex;
>>   	struct ubifs_zbranch zroot;
>>
> .
>
