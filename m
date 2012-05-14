Received: from mail.grid-net.com ([97.65.115.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SU2Vz-0008PF-7v
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 21:09:12 +0000
Message-ID: <4FB17474.90808@grid-net.com>
Date: Mon, 14 May 2012 14:09:08 -0700
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v4] Add security.* XATTR support for the UBIFS
References: <1336915488-23943-1-git-send-email-snijsure@grid-net.com>
 <1337000538.2528.50.camel@sauron.fi.intel.com>
In-Reply-To: <1337000538.2528.50.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: penguin-kernel@I-love.SAKURA.ne.jp, linux-security-module@vger.kernel.org,
 linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/14/2012 06:02 AM, Artem Bityutskiy wrote:
> On Sun, 2012-05-13 at 06:24 -0700, snijsure@grid-net.com wrote:
>> +int ubifs_security_getxattr(struct dentry *d, const char *name,
>> +			    void *buffer, size_t size, int flags)
>> +{
>> +	if (strcmp(name, "") == 0)
>> +		return -EINVAL;
>> +	return __ubifs_getxattr(d->d_inode, name, buffer, size);
>> +}
>> +
>> +
>> +int ubifs_security_setxattr(struct dentry *d, const char *name,
>> +			    const void *value, size_t size,
>> +			    int flags, int handler_flags)
>> +{
>> +	if (strcmp(name, "") == 0)
>> +		return -EINVAL;
> Should this check pushed town to __ubifs_getxattr/__ubifs_setxattr ?
If you really want to move that check into __ubifs_get/setxattr we can 
do that.
However the above implementation is consistent with ext2/ext3/ext4/jffs 
implementation.
> Does an extended attribute in general with zero name length legitimate?
My preference would be to remain consistent with interpretation of other 
file systems, in terms of what constitutes an
invalid parameter. ext* filesystems seem to be declaring a blank 
extended attribute as invalid parameter. Man page for setxattr/getxattr 
don't explicitly state as such though.
> Did you check whether the generic code already performs this check?
I didn't see a generic code that performs this check.

>> +	return __ubifs_setxattr(d->d_inode, name, value,
>> +				size, flags);
>> +}
>> +
>> +struct xattr_handler ubifs_xattr_security_handler = {
>> +	.prefix = XATTR_SECURITY_PREFIX,
>> +	.list   = ubifs_security_listxattr,
>> +	.get    = ubifs_security_getxattr,
>> +	.set    = ubifs_security_setxattr,
>> +};
>> +
>> +const struct xattr_handler *ubifs_xattr_handlers[] = {
>> +	&ubifs_xattr_security_handler,
>> +	NULL
>> +};
>> +
>> +static int ubifs_initxattrs(struct inode *inode,
>> +			    const struct xattr *xattr_array, void *fs_info)
>> +{
>> +	const struct xattr *xattr;
>> +	char *name;
>> +	int err = 0;
>> +
>> +	for (xattr = xattr_array; xattr->name != NULL; xattr++) {
>> +		name = kmalloc(XATTR_SECURITY_PREFIX_LEN +
>> +			       strlen(xattr->name) + 1, GFP_NOFS);
>> +		if (!name) {
>> +			err = -ENOMEM;
>> +			break;
> Where is the already allocated memory freed in this case?
In this particular case kmalloc() failed and we are returning ENOMEM 
error, and in case of success, we do free the allocated memory.
>
>> +		}
>> +		strcpy(name, XATTR_SECURITY_PREFIX);
>> +		strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
>> +		err = __ubifs_setxattr(inode, name, xattr->value,
>> +				       xattr->value_len, 0);
>> +		kfree(name);
>> +		if (err<  0)
>> +			break;
>> +	}
>> +	return err;
>> +}
>> +
>> +int
>> +ubifs_init_security(struct inode *dentry, struct inode *inode,
>> +		   const struct qstr *qstr)
>> +{
>> +	struct ubifs_inode *dir_ui = ubifs_inode(inode);
>> +	int err = 0;
>> +
>> +	mutex_lock(&inode->i_mutex);
>> +	mutex_lock(&dir_ui->ui_mutex);
>> +
> You do not actually need these mutexes, because "inode" is new, it is
> not added to any lists yet, so you own it entirely. Which means that you
> do not even need to introduce this helper function - just call
> 'security_inode_init_security()' directly.
Okay, I can change the code to directly call the 
security_inode_init_security().
I will wait couple days to see if there are other comments trickle in 
before submitting v5.
It would great if someone else can run UBIFS with extended attributes 
enabled and provide an ACK! ;-)

-Subodh
