Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNYSS-0003lE-9M
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 03:36:37 +0000
Message-ID: <55C42658.2020605@cn.fujitsu.com>
Date: Fri, 7 Aug 2015 11:30:32 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Jan Kara <jack@suse.cz>
CC: <viro@ZenIV.linux.org.uk>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 33/35] fs: introduce a get_qsize() to file_operations
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-34-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150803201546.GI23810@quack.suse.cz>
In-Reply-To: <20150803201546.GI23810@quack.suse.cz>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/04/2015 04:15 AM, Jan Kara wrote:
> On Thu 30-07-15 13:48:29, Dongsheng Yang wrote:
>> get_qsize() is used to allow inode to decide how much of the quota size
>> in itself. If file system implements the own get_qsize(), ioctl of
>> FIOQSIZe will call it to get quota size. If not implemented, get the
>> quota size in a generic way.
>
> OK, can you ellaborate a bit why using i_blocks / i_bytes isn't good
> enough for ubifs?

Sure, below is the comment in ubifs_getattr(), I think it can make
it clear.
"because UBIFS does not have notion of "block". For example, it is
difficult to tell how many block a directory takes - it actually takes
less than 300 bytes, but we have to round it to block size, which
introduces large mistake. This makes utilities like 'du' to report
completely senseless numbers. This is the reason why UBIFS goes the
same way as JFFS2 - it reports zero blocks for everything but regular
files, which makes more sense than reporting completely wrong sizes."

So I followed the same reason here for quota_size. Because ubifs
is designed for raw flash, which have no "block". I hope I expressed
myself clearly.
>
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>   fs/ioctl.c         | 31 ++++++++++++++++++++++++-------
>>   include/linux/fs.h |  1 +
>>   2 files changed, 25 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/ioctl.c b/fs/ioctl.c
>> index 5d01d26..2c567db 100644
>> --- a/fs/ioctl.c
>> +++ b/fs/ioctl.c
>> @@ -545,6 +545,29 @@ static int ioctl_fsthaw(struct file *filp)
>>   	return thaw_super(sb);
>>   }
>>
>> +static int ioctl_fioqsize(struct file *filp, int __user *argp)
>> +{
>> +	struct inode *inode = file_inode(filp);
>> +	loff_t res = 0;
>> +	int error = 0;
>> +
>> +	if (filp->f_op->get_qsize) {
>
> Using file->f_ops looks wrong to me. I think it would be more naturally an
> inode operation.

Oh, sure. That should be inode operations. will update it in next version.

Thanx
Yang
>
> 								Honza
>
>> +		res = filp->f_op->get_qsize(inode);
>> +		error = copy_to_user(argp, &res, sizeof(res)) ?
>> +				-EFAULT : 0;
>> +	} else {
>> +                if (S_ISDIR(inode->i_mode) || S_ISREG(inode->i_mode) ||
>> +                    S_ISLNK(inode->i_mode)) {
>> +                        res = inode_get_bytes(inode);
>> +                        error = copy_to_user(argp, &res, sizeof(res)) ?
>> +                                        -EFAULT : 0;
>> +                } else {
>> +                        error = -ENOTTY;
>> +		}
>> +	}
>> +	return error;
>> +}
>> +
>>   /*
>>    * When you add any new common ioctls to the switches above and below
>>    * please update compat_sys_ioctl() too.
>> @@ -577,13 +600,7 @@ int do_vfs_ioctl(struct file *filp, unsigned int fd, unsigned int cmd,
>>   		break;
>>
>>   	case FIOQSIZE:
>> -		if (S_ISDIR(inode->i_mode) || S_ISREG(inode->i_mode) ||
>> -		    S_ISLNK(inode->i_mode)) {
>> -			loff_t res = inode_get_bytes(inode);
>> -			error = copy_to_user(argp, &res, sizeof(res)) ?
>> -					-EFAULT : 0;
>> -		} else
>> -			error = -ENOTTY;
>> +		error = ioctl_fioqsize(filp, argp);
>>   		break;
>>
>>   	case FIFREEZE:
>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>> index 860b235..70695d3 100644
>> --- a/include/linux/fs.h
>> +++ b/include/linux/fs.h
>> @@ -1601,6 +1601,7 @@ struct file_operations {
>>   	long (*fallocate)(struct file *file, int mode, loff_t offset,
>>   			  loff_t len);
>>   	void (*show_fdinfo)(struct seq_file *m, struct file *f);
>> +	ssize_t (*get_qsize) (struct inode *);
>>   #ifndef CONFIG_MMU
>>   	unsigned (*mmap_capabilities)(struct file *);
>>   #endif
>> --
>> 1.8.4.2
>>
