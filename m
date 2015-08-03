Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMNZZ-0007bw-Rd
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 21:47:07 +0000
Subject: Re: [PATCH v2 20/35] ubifs: implement IO functions for quota files
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-21-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55BFE142.1030008@nod.at>
Date: Mon, 3 Aug 2015 23:46:42 +0200
MIME-Version: 1.0
In-Reply-To: <1438235311-23788-21-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
> We have to implement 3 functions to support quota in ubifs:
> ubifs_quota_read(), ubifs_quota_write() and ubifs_get_quotas()
> 
> ubifs_quota_read():
> 	callback to read quota file.
> ubifs_quota_write():
> 	callback to write data to quota file.
> ubifs_get_quotas():
> 	callback to get quota instance for inode.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/super.c | 219 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 219 insertions(+)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index bc57685..3609d7b 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -940,6 +940,220 @@ static int check_volume_empty(struct ubifs_info *c)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_QUOTA
> +static ssize_t ubifs_quota_read(struct super_block *sb, int type, char *data,
> +			       size_t len, loff_t off)
> +{
> +	struct inode *inode = sb_dqopt(sb)->files[type];
> +	unsigned long block = off >> UBIFS_BLOCK_SHIFT;
> +	int offset = off & (sb->s_blocksize - 1);
> +	int tocopy = 0;
> +	size_t toread;
> +	char *block_buf;
> +	struct ubifs_data_node *dn;
> +	int ret, err = 0;
> +
> +	toread = len;

Minor nit, please group same types together and also group assignments
as other UBI/FS codes does.

> +	dn = kmalloc(UBIFS_MAX_DATA_NODE_SZ, GFP_NOFS);
> +	if (!dn) {
> +		err = -ENOMEM;
> +		goto out;
> +	}
> +
> +	block_buf = kmalloc(sb->s_blocksize, GFP_NOFS);
> +	if (!block_buf) {
> +		err = -ENOMEM;
> +		goto free_dn;
> +	}
> +
> +	if (offset) {
> +		/* Read the un-aligned data in first block */
> +		tocopy = sb->s_blocksize - offset;
> +		if (toread < tocopy)
> +			tocopy = toread;

min()?

> +		ret = ubifs_read_block(inode, block_buf, block, dn);
> +		if (ret) {
> +			if (ret != -ENOENT) {

if (ret && ret != -ENOENT)?

> +				err = ret;
> +				goto free_buf;
> +			}
> +		}
> +
> +		memcpy(data, block_buf + offset, tocopy);
> +
> +		block++;
> +		toread -= tocopy;
> +		data += tocopy;
> +		tocopy = 0;
> +	}
> +
> +	while (toread > 0) {
> +		tocopy = sb->s_blocksize < toread ?
> +				sb->s_blocksize : toread;

min()?

> +
> +		/* Break to read the last block */
> +		if (tocopy < sb->s_blocksize)
> +			break;

Hmm, can't you combine this check with the above condition?

> +		ret = ubifs_read_block(inode, data, block, dn);
> +		if (ret) {
> +			if (ret != -ENOENT) {

See above.

> +				err = ret;
> +				goto free_buf;
> +			}
> +		}
> +		block++;;

superfluous semicolon.

> +		toread -= tocopy;
> +		data += tocopy;
> +		tocopy = 0;
> +	}
> +
> +	if (tocopy) {
> +		/* Read the data in last block */
> +		ret = ubifs_read_block(inode, block_buf, block, dn);
> +		if (ret) {
> +			if (ret != -ENOENT) {

See above. Maybe the -ENOENT stuff can be integrated into ubifs_read_block().
All callers deal with it the same way...

> +				err = ret;
> +				goto free_buf;
> +			}
> +		}
> +
> +		memcpy(data, block_buf, tocopy);
> +	}
> +free_buf:
> +	kfree(block_buf);
> +free_dn:
> +	kfree(dn);
> +out:
> +	if (!err)
> +		return len;
> +	return err;
> +}
> +
> +static ssize_t ubifs_quota_write(struct super_block *sb, int type,
> +				const char *data, size_t len, loff_t off)
> +{
> +	struct inode *inode = sb_dqopt(sb)->files[type];
> +	unsigned long block = off >> UBIFS_BLOCK_SHIFT;
> +	struct ubifs_info *c = inode->i_sb->s_fs_info;
> +	int offset = off & (sb->s_blocksize - 1);
> +	union ubifs_key key;
> +	int tocopy = 0;
> +	size_t towrite = len;
> +	int ret, err = 0;
> +	struct ubifs_budget_req req = {};
> +	int new_block = 0;
> +	struct ubifs_data_node *dn;
> +	char *block_buf;

See above.

> +	/* There are dirtied blocks and new blockes, but we call them all
> +	 * new blocks here, the budgeting is same for them.
> +	 */
> +	new_block = DIV_ROUND_UP(len - (sb->s_blocksize - offset), sb->s_blocksize);
> +	if (offset)
> +		new_block += 1;
> +
> +	req.new_block_num = new_block;
> +
> +	err = ubifs_budget_space(c, &req);
> +	if (err)
> +		goto out;
> +
> +	dn = kmalloc(UBIFS_MAX_DATA_NODE_SZ, GFP_NOFS);
> +	if (!dn) {
> +		err = -ENOMEM;
> +		goto release_budget;
> +	}
> +
> +	block_buf = kmalloc(sb->s_blocksize, GFP_NOFS);
> +	if (!block_buf) {
> +		err = -ENOMEM;
> +		goto free_dn;
> +	}
> +
> +	if (offset) {
> +		/* Write the un-aligned data in first block */
> +		tocopy = sb->s_blocksize - offset;
> +		if (towrite < tocopy)
> +			tocopy = towrite;

See above.

> +		ret = ubifs_read_block(inode, block_buf, block, dn);
> +		if (ret) {
> +			if (ret != -ENOENT) {
> +				err = ret;
> +				goto free_buf;
> +			}
> +			memset(block_buf, 0, sb->s_blocksize);
> +		}
> +
> +		memcpy(block_buf + offset, data, tocopy);
> +
> +		data_key_init(c, &key, inode->i_ino, block);
> +		err = ubifs_jnl_write_data(c, inode, &key, block_buf, sb->s_blocksize);

Hmm, I'm confused. You write the block containing the quota information to an inode's data?
How can be determined whether data is real data and what is quota data?
This clearly shows that I know not much about the quota subsystem. 8^)

> +		if (err) {
> +			goto free_buf;
> +		}
> +		block++;
> +		towrite -= tocopy;
> +		data += tocopy;
> +		tocopy = 0;
> +	}
> +
> +	while (towrite > 0) {
> +		tocopy = sb->s_blocksize < towrite ?
> +				sb->s_blocksize : towrite;
> +
> +		/* Break to read the last block */
> +		if (tocopy < sb->s_blocksize)
> +			break;

See above. Maybe you can combine all this common code.

> +		data_key_init(c, &key, inode->i_ino, block);
> +		err = ubifs_jnl_write_data(c, inode, &key, data, sb->s_blocksize);
> +		if (err)
> +			goto free_buf;
> +		block++;;

See above.

I'll review your other patches these days.
For now I'm too sleepy.

Thanks,
//richard
