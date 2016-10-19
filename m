Received: from mx0b-00082601.pphosted.com ([67.231.153.30]
 helo=mx0a-00082601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwsDU-00022V-6G
 for linux-mtd@lists.infradead.org; Wed, 19 Oct 2016 14:51:41 +0000
Subject: Re: [PATCH] ubifs: implement POSIX Access Control Lists (ACLs)
To: Andreas Gruenbacher <agruenba@redhat.com>, Pascal Eberhard
 <pascal.eberhard@gmail.com>
References: <1476046382-19185-1-git-send-email-pascal.eberhard@gmail.com>
 <443b11a2-729a-32ec-0a6f-5a3276290329@nod.at>
 <CAHc6FU7Sh3cX2NAs6bu1jBWQwwpQK0OLsLMAEZMpzocb7L5teg@mail.gmail.com>
 <CAHc6FU5pei6eLT2msMO3NV-me5SoCWf7_6y5utuCvfZHYjyiZw@mail.gmail.com>
CC: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
From: Josef Bacik <jbacik@fb.com>
Message-ID: <8970b7a5-eea0-921b-16ff-6cf53df52f85@fb.com>
Date: Wed, 19 Oct 2016 10:51:02 -0400
MIME-Version: 1.0
In-Reply-To: <CAHc6FU5pei6eLT2msMO3NV-me5SoCWf7_6y5utuCvfZHYjyiZw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/19/2016 10:37 AM, Andreas Gruenbacher wrote:
> On Wed, Oct 19, 2016 at 4:34 PM, Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
>> Pascal,
>>
>> On Tue, Oct 18, 2016 at 11:32 PM, Richard Weinberger <richard@nod.at> wrote:
>>> Pascal,
>>>
>>> On 09.10.2016 22:53, Pascal Eberhard wrote:
>>>> This patch implements POSIX Access Control Lists (ACLs) in UBIFS.
>>>> It uses posix_acl_(access|default)_xattr_handler ACL generic handlers
>>>> as xattr handlers are now used in UBIFS.
>>>
>>> Cool! :)
>>> CC'ing Andreas, maybe he also has comments.
>>
>> please run this through xfstests as well. Note the following fixes /
>> improvements I've made in the course of reviewing this; they've
>> obviously not been merged, yet:
>>
>>   https://github.com/andreas-gruenbacher/xfsprogs-dev/commits/io
>>   https://github.com/andreas-gruenbacher/xfstests/commits/tmpfile
>>
>>>> Signed-off-by: Pascal Eberhard <pascal.eberhard@gmail.com>
>>>> ---
>>>>  fs/ubifs/Kconfig  |  13 +++++
>>>>  fs/ubifs/Makefile |   1 +
>>>>  fs/ubifs/acl.c    | 143 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  fs/ubifs/dir.c    |  22 +++++++++
>>>>  fs/ubifs/file.c   |   9 ++++
>>>>  fs/ubifs/super.c  |  15 ++++++
>>>>  fs/ubifs/ubifs.h  |  18 +++++++
>>>>  fs/ubifs/xattr.c  |  11 +++--
>>>>  8 files changed, 229 insertions(+), 3 deletions(-)
>>>>  create mode 100644 fs/ubifs/acl.c
>>>>
>>>> diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
>>>> index 7ff7712..39119e5 100644
>>>> --- a/fs/ubifs/Kconfig
>>>> +++ b/fs/ubifs/Kconfig
>>>> @@ -50,3 +50,16 @@ config UBIFS_ATIME_SUPPORT
>>>>         strictatime is the "heavy", relatime is "lighter", etc.
>>>>
>>>>         If unsure, say 'N'
>>>> +
>>>> +config UBIFS_FS_POSIX_ACL
>>>> +     bool "UBIFS POSIX Access Control Lists"
>>>> +     depends on UBIFS_FS
>>>> +     select FS_POSIX_ACL
>>>> +     help
>>>> +       POSIX Access Control Lists (ACLs) support permissions for users and
>>>> +       groups beyond the owner/group/world scheme.
>>>> +
>>>> +       To learn more about Access Control Lists, visit the POSIX ACLs for
>>>> +       Linux website <https://urldefense.proofpoint.com/v2/url?u=http-3A__acl.bestbits.at_&d=DQIBaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=sDzg6MvHymKOUgI8SFIm4Q&m=kMcqxODxmAbECYcLW6bRou3Q-jJYfAL4HPw5ErTumUU&s=De0Qb4gRiGITbgivfS5NKW92fL7-HKCGNvCnAMU6CwM&e= >.
>>>> +
>>>> +       If you don't know what Access Control Lists are, say N
>>>> diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
>>>> index c54a243..af7a83f 100644
>>>> --- a/fs/ubifs/Makefile
>>>> +++ b/fs/ubifs/Makefile
>>>> @@ -5,3 +5,4 @@ ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
>>>>  ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
>>>>  ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o xattr.o debug.o
>>>>  ubifs-y += misc.o
>>>> +ubifs-$(CONFIG_UBIFS_FS_POSIX_ACL) += acl.o
>>>> \ No newline at end of file
>>>> diff --git a/fs/ubifs/acl.c b/fs/ubifs/acl.c
>>>> new file mode 100644
>>>> index 0000000..a4d4734
>>>> --- /dev/null
>>>> +++ b/fs/ubifs/acl.c
>>>> @@ -0,0 +1,143 @@
>>>> +/*
>>>> + * This file is part of UBIFS.
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify it
>>>> + * under the terms of the GNU General Public License version 2 as published by
>>>> + * the Free Software Foundation.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful, but WITHOUT
>>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>>> + * more details.
>>>> + *
>>>> + */
>>>> +
>>>> +#include <linux/fs.h>
>>>
>>> ubifs.h includes this already.
>>>
>>>> +#include <linux/xattr.h>
>>>
>>> Ditto.
>>>
>>>> +#include <linux/posix_acl_xattr.h>
>>>> +
>>>> +#include "ubifs.h"
>>>> +
>>>> +struct posix_acl *ubifs_get_acl(struct inode *inode, int type)
>>>> +{
>>>> +     int size;
>>>> +     const char *name;
>>>> +     char *value = NULL;
>>>> +     struct posix_acl *acl;
>>>> +
>>>> +     switch (type) {
>>>> +     case ACL_TYPE_ACCESS:
>>>> +             name = XATTR_NAME_POSIX_ACL_ACCESS;
>>>> +             break;
>>>> +     case ACL_TYPE_DEFAULT:
>>>> +             name = XATTR_NAME_POSIX_ACL_DEFAULT;
>>>> +             break;
>>>> +     default:
>>>> +             return ERR_PTR(-EINVAL);
>>>> +     }
>>>> +
>>>> +     size = __ubifs_getxattr(inode, name, NULL, 0);
>>>> +     if (size > 0) {
>>>> +             value = kzalloc(size, GFP_KERNEL);
>>>> +             if (!value)
>>>> +                     return ERR_PTR(-ENOMEM);
>>>> +             size = __ubifs_getxattr(inode, name, value, size);
>>>> +     }
>>>> +     if (size > 0)
>>>> +             acl = posix_acl_from_xattr(&init_user_ns, value, size);
>>>> +     else if (size == -ERANGE || size == -ENODATA || size == 0)
>>>> +             acl = NULL;
>>>> +     else
>>>> +             acl = ERR_PTR(size);
>>>> +
>>>> +     kfree(value);
>>>> +     if (!IS_ERR(acl))
>>>> +             set_cached_acl(inode, type, acl);
>>
>> The get_acl inode operation should no longer call set_cached_acl; the
>> cached ACL is updated automatically. (It's correct to use
>> set_cached_acl in the set_acl inode operation though.)
>>
>>>> +
>>>> +     return acl;
>>>> +}
>>>> +
>>>> +int ubifs_set_acl(struct inode *inode, struct posix_acl *acl, int type)
>>>> +{
>>>> +     int ret;
>>>> +     int size = 0;
>>>> +     const char *name;
>>>> +     char *value = NULL;
>>>> +     int flags = 0;
>>>> +
>>>> +     switch (type) {
>>>> +     case ACL_TYPE_ACCESS:
>>>> +             name = XATTR_NAME_POSIX_ACL_ACCESS;
>>>> +             if (acl) {
>>>> +                     ret = posix_acl_equiv_mode(acl, &inode->i_mode);
>>>> +                     if (ret < 0)
>>>> +                             return ret;
>>>> +                     if (ret == 0)
>>>> +                             acl = NULL;
>>>> +             }
>>>> +             ret = 0;
>>>> +             break;
>>>> +     case ACL_TYPE_DEFAULT:
>>>> +             if (!S_ISDIR(inode->i_mode))
>>>> +                     return acl ? -EINVAL : 0;
>>>> +             name = XATTR_NAME_POSIX_ACL_DEFAULT;
>>>> +             break;
>>>> +     default:
>>>> +             return -EINVAL;
>>>> +     }
>>>> +
>>>> +     if (acl) {
>>>> +             size = posix_acl_xattr_size(acl->a_count);
>>>> +             value = kmalloc(size, GFP_KERNEL);
>>>> +             if (!value)
>>>> +                     return -ENOMEM;
>>>> +
>>>> +             ret = posix_acl_to_xattr(&init_user_ns, acl, value, size);
>>>> +             if (ret < 0)
>>>> +                     goto out;
>>>> +     }
>>>> +
>>>> +     if (size == 0)
>>>> +             flags = XATTR_REPLACE;
>>>> +     ret = __ubifs_setxattr(inode, name, value, size, flags);
>>>> +
>>>> +out:
>>>> +     kfree(value);
>>>> +     if (!ret)
>>>> +             set_cached_acl(inode, type, acl);
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Initialize the ACLs of a new inode.
>>>
>>> Please use the Javadoc style we use for all UBIFS functions.
>>> (applies to other functions too in this patch)-
>>>
>>>> + */
>>>> +int ubifs_init_acl(struct inode *dir, struct inode *inode)
>>>> +{
>>>> +     struct posix_acl *default_acl, *acl;
>>>> +     int ret = 0;
>>>> +
>>>> +     ret = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     if (default_acl) {
>>>> +             inode_lock(inode);
>>
>> Why the inode locking here?
>>
>>>> +             ret = ubifs_set_acl(inode, default_acl, ACL_TYPE_DEFAULT);
>>>> +             inode_unlock(inode);
>>>> +             posix_acl_release(default_acl);
>>>> +     }
>>>> +
>>>> +     if (acl) {
>>>> +             if (!ret) {
>>>> +                     inode_lock(inode);
>>
>> Same here.
>>
>>>> +                     ret = ubifs_set_acl(inode, acl, ACL_TYPE_ACCESS);
>>>> +                     inode_unlock(inode);
>>>> +             }
>>>> +             posix_acl_release(acl);
>>>> +     }
>>>> +
>>>> +     if (!default_acl && !acl)
>>>> +             cache_no_acl(inode);
>>
>> This call to cache_no_acl doesn't make sense; please check. It may be
>> wrong in btrfs as well; copying Josef for that.
>
> Now with Josef's current email address, hopefully.
>

Looks right to me, we call this during inode creation, so if there is no ACL to 
set then we cache no acl so we don't waste the lookup later.  Thanks,

Josef
