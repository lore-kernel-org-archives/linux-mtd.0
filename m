Received: from 38plumes.fr ([37.187.67.249])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bweDJ-0007Xz-2U
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 23:54:34 +0000
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] ubifs: implement POSIX Access Control Lists (ACLs)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 19 Oct 2016 01:54:09 +0200
From: Pascal Eberhard <pascal.eberhard@gmail.com>
Cc: linux-mtd@lists.infradead.org, Andreas Gruenbacher <agruenba@redhat.com>
In-Reply-To: <443b11a2-729a-32ec-0a6f-5a3276290329@nod.at>
References: <1476046382-19185-1-git-send-email-pascal.eberhard@gmail.com>
 <443b11a2-729a-32ec-0a6f-5a3276290329@nod.at>
Message-ID: <ac97ae77409865d113ddb5c71420a791@38plumes.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

Thanks for your review.

On 2016-10-18 23:32, Richard Weinberger wrote:
> Pascal,
> 
> On 09.10.2016 22:53, Pascal Eberhard wrote:
>> This patch implements POSIX Access Control Lists (ACLs) in UBIFS.
>> It uses posix_acl_(access|default)_xattr_handler ACL generic handlers
>> as xattr handlers are now used in UBIFS.
> 
> Cool! :)
> CC'ing Andreas, maybe he also has comments.
> 
>> Signed-off-by: Pascal Eberhard <pascal.eberhard@gmail.com>
>> ---
>>  fs/ubifs/Kconfig  |  13 +++++
>>  fs/ubifs/Makefile |   1 +
>>  fs/ubifs/acl.c    | 143 
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  fs/ubifs/dir.c    |  22 +++++++++
>>  fs/ubifs/file.c   |   9 ++++
>>  fs/ubifs/super.c  |  15 ++++++
>>  fs/ubifs/ubifs.h  |  18 +++++++
>>  fs/ubifs/xattr.c  |  11 +++--
>>  8 files changed, 229 insertions(+), 3 deletions(-)
>>  create mode 100644 fs/ubifs/acl.c
>> 

[...]

>> +#include <linux/fs.h>
> 
> ubifs.h includes this already.
> 

ok

>> +#include <linux/xattr.h>
> 
> Ditto.
> 

ok

[...]

>> +/*
>> + * Initialize the ACLs of a new inode.
> 
> Please use the Javadoc style we use for all UBIFS functions.
> (applies to other functions too in this patch)-

ok

[...]

>> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
>> index ccd9128..a2e5609 100644
>> --- a/fs/ubifs/dir.c
>> +++ b/fs/ubifs/dir.c
>> @@ -270,6 +270,10 @@ static int ubifs_create(struct inode *dir, struct 
>> dentry *dentry, umode_t mode,
>>  		goto out_budg;
>>  	}
>> 
>> +	err = ubifs_init_acl(dir, inode);
>> +	if (err)
>> +		goto out_inode;
>> +
>>  	err = ubifs_init_security(dir, inode, &dentry->d_name);
>>  	if (err)
>>  		goto out_inode;
>> @@ -341,6 +345,10 @@ static int do_tmpfile(struct inode *dir, struct 
>> dentry *dentry,
>>  		ubifs_assert(inode->i_op == &ubifs_file_inode_operations);
>>  	}
>> 
>> +	err = ubifs_init_acl(dir, inode);
>> +	if (err)
>> +		goto out_inode;
> 
> Why do we need ACLs for O_TMPFILE?

O_TMPFILE files are unnamed... until linkat() is called.
open manpage says that when linkat() is called to a O_TMPFILE file:
"In this case, the open() mode argument determines the file permission 
mode, as with O_CREAT."
And mode with O_CREAT is applied with respect of the default ACLs:
"in the absence of a default ACL, the mode of the created file is (mode 
& ~umask)"

So my interpretation is that default ACLs shall be propagated to 
O_TMPFILE at creation.

O_TMPFILE implementation for btrfs and xfs apply default ACLs as well.

[...]

>> @@ -985,6 +1001,10 @@ static int ubifs_symlink(struct inode *dir, 
>> struct dentry *dentry,
>>  	ui->data_len = len;
>>  	inode->i_size = ubifs_inode(inode)->ui_size = len;
>> 
>> +	err = ubifs_init_acl(dir, inode);
>> +	if (err)
>> +		goto out_inode;
> 
> Do we really need ACLs for symlinks too? I thought permissions for
> symlinks are irrelevant.

Indeed, they are irrelevant. It will be removed.

>> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
>> index 6c2f4d4..0a596a1 100644
>> --- a/fs/ubifs/xattr.c
>> +++ b/fs/ubifs/xattr.c
>> @@ -52,13 +52,14 @@
>>   * in the VFS inode cache. The xentries are cached in the LNC cache 
>> (see
>>   * tnc.c).
>>   *
>> - * ACL support is not implemented.
>> + * ACL support is now implemented.
> 
> I think we can just drop that line now. :-)

:-)

> 
>>   */
>> 
>>  #include "ubifs.h"
>>  #include <linux/fs.h>
>>  #include <linux/slab.h>
>>  #include <linux/xattr.h>
>> +#include <linux/posix_acl_xattr.h>
> 
> While we are here, these includes should also be cleaned up.
> 

Ok, and I'll remove the now obsolete enum just below too then:

/*
  * Extended attribute type constants.
  *
  * USER_XATTR: user extended attribute ("user.*")
  * TRUSTED_XATTR: trusted extended attribute ("trusted.*)
  * SECURITY_XATTR: security extended attribute ("security.*")
  */

enum {
         USER_XATTR,
         TRUSTED_XATTR,
         SECURITY_XATTR,
};


> 
> Overall the patch does not look bad and I'm sure we can add it for 
> v4.10 soon.

ok, great!

> I'm a bit confused since most stuff is not really UBIFS specific.
> Andreas, is just "normal" for ACL support? I thought most code is
> generic and already in VFS.
> 
> Thanks,
> //richard
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
