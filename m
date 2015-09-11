Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaHoJ-0007Pj-Og
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 06:27:49 +0000
Message-ID: <55F272D1.7000805@cn.fujitsu.com>
Date: Fri, 11 Sep 2015 14:21:05 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <andreas.gruenbacher@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [RFC PATCH v3 1/5] UBIFS: ACL: introduce init/set/get functions
 for ACL
References: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
 <1441962597-13543-2-git-send-email-shengyong1@huawei.com>
 <55F2601B.60203@cn.fujitsu.com> <55F270EE.9060801@huawei.com>
In-Reply-To: <55F270EE.9060801@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/11/2015 02:13 PM, Sheng Yong wrote:
> Hi, Dongsheng
>
> On 9/11/2015 1:01 PM, Dongsheng Yang wrote:
>> On 09/11/2015 05:09 PM, Sheng Yong wrote:
>>> This patch introduce a new file `acl.c', which implements:
>>>     * initializing ACL for new file according to the directory's default ACL,
>>>     * getting ACL which finds the ACL releated xattr and converts it to ACL,
>>>     * setting ACL function which converts ACL to xattr and creates/changes/
>>>       removes the xattr.
>>>
>>> On flash ACL format is based on POSIX ACL structures, and POSIX generic
>>> functions, posix_acl_[to|from]_xattr, are called to do the ACL conversion
>>> between in-memory and on-flash ACL.
>>>
>>> The ACL xattr handler is not implemented, because UBIFS does not use it.
>>
>> Why not, I think we can use it.
> First of all, thanks for your review :)
>
> It seems xattr handler will be removed because of dead code of security xattr.
> And if we do so, I think it's better to do that for all xattr, but not just
> security and ACL, and generic_[set|get]xattr should be set in inode_operations
> instead of ubifs_[get|set]xattr.

Security handler is different with acl handler. Please read the
security_getxattr(), it just return ubifs_getxattr(). That means
we can use ubifs_getxattr() immediately. So we can remove the
security_handler for ubifs.

But acl is different, we need to call a special ubifs_get_acl()
here. Then I found you get the handler by youself in the
ubifs_get|set_xattr() and call handler->set() by youself.

That's not good idea. Please Just set the handler and call
generic_setxattr().

Yang
>
> thanks,
> Sheng
>>
>> Yang
>>>
>>> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
>>> ---
>>>    fs/ubifs/acl.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>    fs/ubifs/ubifs.h |  14 ++++++
>>>    2 files changed, 155 insertions(+)
>>>    create mode 100644 fs/ubifs/acl.c
>>>
>>> diff --git a/fs/ubifs/acl.c b/fs/ubifs/acl.c
>>> new file mode 100644
>>> index 0000000..bf37875
>>> --- /dev/null
>>> +++ b/fs/ubifs/acl.c
>>> @@ -0,0 +1,141 @@
>>> +/*
>>> + * This file is part of UBIFS.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify it
>>> + * under the terms of the GNU General Public License version 2 as published by
>>> + * the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope that it will be useful, but WITHOUT
>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>> + * more details.
>>> + *
>>> + */
>>> +
>>> +#include <linux/fs.h>
>>> +#include <linux/xattr.h>
>>> +#include <linux/posix_acl_xattr.h>
>>> +
>>> +#include "ubifs.h"
>>> +
>>> +struct posix_acl *ubifs_get_acl(struct inode *inode, int type)
>>> +{
>>> +    struct posix_acl *acl;
>>> +    char *name, *value = NULL;
>>> +    int size = 0;
>>> +
>>> +    switch (type) {
>>> +    case ACL_TYPE_ACCESS:
>>> +        name = XATTR_NAME_POSIX_ACL_ACCESS;
>>> +        break;
>>> +    case ACL_TYPE_DEFAULT:
>>> +        name = XATTR_NAME_POSIX_ACL_DEFAULT;
>>> +        break;
>>> +    default:
>>> +        BUG();
>>> +    }
>>> +
>>> +    size = ubifs_do_getxattr(inode, name, NULL, 0);
>>> +    if (size > 0) {
>>> +        value = kmalloc(size, GFP_KERNEL);
>>> +        if (!value)
>>> +            return ERR_PTR(-ENOMEM);
>>> +        size = ubifs_do_getxattr(inode, name, value, size);
>>> +    }
>>> +    if (size > 0)
>>> +        acl = posix_acl_from_xattr(&init_user_ns, value, size);
>>> +    else if (size == -ENODATA)
>>> +        acl = NULL;
>>> +    else
>>> +        acl = ERR_PTR(size);
>>> +
>>> +    kfree(value);
>>> +    if (!IS_ERR(acl))
>>> +        set_cached_acl(inode, type, acl);
>>> +
>>> +    return acl;
>>> +}
>>> +
>>> +int ubifs_set_acl(struct inode *inode, struct posix_acl *acl, int type)
>>> +{
>>> +    char *name;
>>> +    void *value = NULL;
>>> +    size_t size = 0;
>>> +    int flag = 0, err;
>>> +
>>> +    switch (type) {
>>> +    case ACL_TYPE_ACCESS:
>>> +        name = XATTR_NAME_POSIX_ACL_ACCESS;
>>> +        if (acl) {
>>> +            err = posix_acl_equiv_mode(acl, &inode->i_mode);
>>> +            if (err < 0)
>>> +                return err;
>>> +            if (err == 0)
>>> +                acl = NULL;
>>> +        }
>>> +        break;
>>> +
>>> +    case ACL_TYPE_DEFAULT:
>>> +        name = XATTR_NAME_POSIX_ACL_DEFAULT;
>>> +        if (!S_ISDIR(inode->i_mode))
>>> +            return acl ? -EACCES : 0;
>>> +        break;
>>> +
>>> +    default:
>>> +        BUG();
>>> +    }
>>> +
>>> +    if (acl) {
>>> +        size = posix_acl_xattr_size(acl->a_count);
>>> +        value = kmalloc(size, GFP_NOFS);
>>> +        if (!value)
>>> +            return -ENOMEM;
>>> +
>>> +        err = posix_acl_to_xattr(&init_user_ns, acl, value, size);
>>> +        if (err < 0) {
>>> +            kfree(value);
>>> +            return err;
>>> +        }
>>> +    }
>>> +
>>> +    if (size == 0)
>>> +        flag = XATTR_REPLACE;
>>> +    err = ubifs_do_setxattr(inode, name, value, size, flag);
>>> +
>>> +    kfree(value);
>>> +    if (!err)
>>> +        set_cached_acl(inode, type, acl);
>>> +
>>> +    return err;
>>> +}
>>> +
>>> +/*
>>> + * Initialize the ACLs of a new inode.
>>> + */
>>> +int ubifs_init_acl(struct inode *dir, struct inode *inode)
>>> +{
>>> +    struct posix_acl *default_acl, *acl;
>>> +    int err;
>>> +
>>> +    err = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    if (default_acl) {
>>> +        mutex_lock(&inode->i_mutex);
>>> +        err = ubifs_set_acl(inode, default_acl, ACL_TYPE_DEFAULT);
>>> +        mutex_unlock(&inode->i_mutex);
>>> +        posix_acl_release(default_acl);
>>> +    }
>>> +
>>> +    if (acl) {
>>> +        if (!err) {
>>> +            mutex_lock(&inode->i_mutex);
>>> +            err = ubifs_set_acl(inode, acl, ACL_TYPE_ACCESS);
>>> +            mutex_unlock(&inode->i_mutex);
>>> +        }
>>> +        posix_acl_release(acl);
>>> +    }
>>> +
>>> +    return err;
>>> +}
>>> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
>>> index 62aa1a5..b9ddc8d 100644
>>> --- a/fs/ubifs/ubifs.h
>>> +++ b/fs/ubifs/ubifs.h
>>> @@ -1767,6 +1767,20 @@ int ubifs_removexattr(struct dentry *dentry, const char *name);
>>>    int ubifs_init_security(struct inode *dentry, struct inode *inode,
>>>                const struct qstr *qstr);
>>>
>>> +/* acl.c */
>>> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
>>> +int ubifs_init_acl(struct inode *dir, struct inode *inode);
>>> +int ubifs_set_acl(struct inode *inode, struct posix_acl *acl, int type);
>>> +struct posix_acl *ubifs_get_acl(struct inode *inode, int type);
>>> +#else
>>> +static inline int ubifs_init_acl(struct inode *inode, struct inode *dir)
>>> +{
>>> +    return 0;
>>> +}
>>> +#define ubifs_get_acl NULL
>>> +#define ubifs_set_acl NULL
>>> +#endif
>>> +
>>>    /* super.c */
>>>    struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
>>>
>>>
>>
>>
>> .
>>
>
> .
>
