Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SH8Gi-0003r3-MA
 for linux-mtd@lists.infradead.org; Mon, 09 Apr 2012 06:40:06 +0000
Received: by wibhj13 with SMTP id hj13so1529412wib.0
 for <linux-mtd@lists.infradead.org>; Sun, 08 Apr 2012 23:40:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4F824B4F.8090107@schaufler-ca.com>
References: <1333892851-10758-1-git-send-email-snijsure@grid-net.com>
 <4F824B4F.8090107@schaufler-ca.com>
Date: Sun, 8 Apr 2012 23:40:00 -0700
Message-ID: <CALr9Q3b=U8jRZv_rEXX0VmeC1f_wgjXOEtZA=bkxfmba+a1YnA@mail.gmail.com>
Subject: Re: [PATCH] Add security.selinux XATTR support for the UBIFS. Also
 fix couple of bugs in UBIFS extended attribute length calculation.
From: Subodh Nijsure <subodh.nijsure@gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Subodh Nijsure <snijsure@grid-net.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 LSM <linux-security-module@vger.kernel.org>, linux-mtd@lists.infradead.org,
 SE Linux <selinux@tycho.nsa.gov>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 8, 2012 at 7:37 PM, Casey Schaufler <casey@schaufler-ca.com> wr=
ote:
> On 4/8/2012 6:47 AM, Subodh Nijsure wrote:
>> TESTING: Tested on =C2=A0MX28 based platforms using Micron MT29F2G08ABAE=
AH4 NAND
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0With these change we are able to label=
 UBIFS filesystem with security.selinux
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and run system with selinux enabled.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Also ran integck test on UBI filesyste=
m.
>>
>> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
>
> There is no reason to restrict xattr support to SELinux.
> SELinux specific behavior belongs within the SELinux LSM.
> This code needs to support the full xattr semantics.
>
> Nacked-by: Casey Schaufler <casey@scahufler-ca.com>
>
>> ---
>> =C2=A0fs/ubifs/dir.c =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++
>> =C2=A0fs/ubifs/file.c =C2=A0 =C2=A0| =C2=A0 =C2=A06 ++
>> =C2=A0fs/ubifs/journal.c | =C2=A0 12 +++-
>> =C2=A0fs/ubifs/super.c =C2=A0 | =C2=A0 =C2=A03 +
>> =C2=A0fs/ubifs/ubifs.h =C2=A0 | =C2=A0 =C2=A09 +++
>> =C2=A0fs/ubifs/xattr.c =C2=A0 | =C2=A0147 ++++++++++++++++++++++++++++++=
++++++++++++++++++----
>> =C2=A06 files changed, 167 insertions(+), 14 deletions(-)
>>
>> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
>> index ec9f187..f4e06c4 100644
>> --- a/fs/ubifs/dir.c
>> +++ b/fs/ubifs/dir.c
>> @@ -293,6 +293,7 @@ static int ubifs_create(struct inode *dir, struct de=
ntry *dentry, umode_t mode,
>> =C2=A0 =C2=A0 =C2=A0 ubifs_release_budget(c, &req);
>> =C2=A0 =C2=A0 =C2=A0 insert_inode_hash(inode);
>> =C2=A0 =C2=A0 =C2=A0 d_instantiate(dentry, inode);
>> + =C2=A0 =C2=A0 ubifs_init_security(dir, inode, &dentry->d_name);
>> =C2=A0 =C2=A0 =C2=A0 return 0;
>>
>> =C2=A0out_cancel:
>> @@ -754,6 +755,7 @@ static int ubifs_mkdir(struct inode *dir, struct den=
try *dentry, umode_t mode)
>>
>> =C2=A0 =C2=A0 =C2=A0 ubifs_release_budget(c, &req);
>> =C2=A0 =C2=A0 =C2=A0 d_instantiate(dentry, inode);
>> + =C2=A0 =C2=A0 ubifs_init_security(dir, inode, &dentry->d_name);
>> =C2=A0 =C2=A0 =C2=A0 return 0;
>>
>> =C2=A0out_cancel:
>> @@ -831,6 +833,7 @@ static int ubifs_mknod(struct inode *dir, struct den=
try *dentry,
>> =C2=A0 =C2=A0 =C2=A0 ubifs_release_budget(c, &req);
>> =C2=A0 =C2=A0 =C2=A0 insert_inode_hash(inode);
>> =C2=A0 =C2=A0 =C2=A0 d_instantiate(dentry, inode);
>> + =C2=A0 =C2=A0 ubifs_init_security(dir, inode, &dentry->d_name);
>> =C2=A0 =C2=A0 =C2=A0 return 0;
>>
>> =C2=A0out_cancel:
>> @@ -907,6 +910,7 @@ static int ubifs_symlink(struct inode *dir, struct d=
entry *dentry,
>> =C2=A0 =C2=A0 =C2=A0 ubifs_release_budget(c, &req);
>> =C2=A0 =C2=A0 =C2=A0 insert_inode_hash(inode);
>> =C2=A0 =C2=A0 =C2=A0 d_instantiate(dentry, inode);
>> + =C2=A0 =C2=A0 ubifs_init_security(dir, inode, &dentry->d_name);
>> =C2=A0 =C2=A0 =C2=A0 return 0;
>>
>> =C2=A0out_cancel:
>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
>> index 5c8f6dc..b8e9d66 100644
>> --- a/fs/ubifs/file.c
>> +++ b/fs/ubifs/file.c
>> @@ -1575,6 +1575,12 @@ const struct inode_operations ubifs_symlink_inode=
_operations =3D {
>> =C2=A0 =C2=A0 =C2=A0 .follow_link =3D ubifs_follow_link,
>> =C2=A0 =C2=A0 =C2=A0 .setattr =C2=A0 =C2=A0 =3D ubifs_setattr,
>> =C2=A0 =C2=A0 =C2=A0 .getattr =C2=A0 =C2=A0 =3D ubifs_getattr,
>> +#ifdef CONFIG_UBIFS_FS_XATTR
>> + =C2=A0 =C2=A0 .setxattr =C2=A0 =C2=A0=3D ubifs_symlink_setxattr,
>> + =C2=A0 =C2=A0 .getxattr =C2=A0 =C2=A0=3D ubifs_symlink_getxattr,
>> + =C2=A0 =C2=A0 .listxattr =C2=A0 =3D ubifs_listxattr,
>> + =C2=A0 =C2=A0 .removexattr =3D ubifs_removexattr,
>> +#endif
>> =C2=A0};
>>
>> =C2=A0const struct file_operations ubifs_file_operations =3D {
>> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
>> index 2f438ab..725dc17 100644
>> --- a/fs/ubifs/journal.c
>> +++ b/fs/ubifs/journal.c
>> @@ -553,7 +553,8 @@ int ubifs_jnl_update(struct ubifs_info *c, const str=
uct inode *dir,
>>
>> =C2=A0 =C2=A0 =C2=A0 dbg_jnl("ino %lu, dent '%.*s', data len %d in dir i=
no %lu",
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inode->i_ino, nm->len, =
nm->name, ui->data_len, dir->i_ino);
>> - =C2=A0 =C2=A0 ubifs_assert(dir_ui->data_len =3D=3D 0);
>> + =C2=A0 =C2=A0 if (!xent)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ubifs_assert(dir_ui->data_le=
n =3D=3D 0);
>> =C2=A0 =C2=A0 =C2=A0 ubifs_assert(mutex_is_locked(&dir_ui->ui_mutex));
>>
>> =C2=A0 =C2=A0 =C2=A0 dlen =3D UBIFS_DENT_NODE_SZ + nm->len + 1;
>> @@ -572,7 +573,11 @@ int ubifs_jnl_update(struct ubifs_info *c, const st=
ruct inode *dir,
>>
>> =C2=A0 =C2=A0 =C2=A0 aligned_dlen =3D ALIGN(dlen, 8);
>> =C2=A0 =C2=A0 =C2=A0 aligned_ilen =3D ALIGN(ilen, 8);
>> - =C2=A0 =C2=A0 len =3D aligned_dlen + aligned_ilen + UBIFS_INO_NODE_SZ;
>> + =C2=A0 =C2=A0 /* Make sure to account for dir_ui+data_len in length ca=
lculation
>> + =C2=A0 =C2=A0 =C2=A0* in case there is extended attribute.
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 len =3D aligned_dlen + aligned_ilen +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UBIFS_INO_NODE_SZ + dir_ui->data_le=
n;
>> =C2=A0 =C2=A0 =C2=A0 dent =3D kmalloc(len, GFP_NOFS);
>> =C2=A0 =C2=A0 =C2=A0 if (!dent)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
>> @@ -649,7 +654,8 @@ int ubifs_jnl_update(struct ubifs_info *c, const str=
uct inode *dir,
>>
>> =C2=A0 =C2=A0 =C2=A0 ino_key_init(c, &ino_key, dir->i_ino);
>> =C2=A0 =C2=A0 =C2=A0 ino_offs +=3D aligned_ilen;
>> - =C2=A0 =C2=A0 err =3D ubifs_tnc_add(c, &ino_key, lnum, ino_offs, UBIFS=
_INO_NODE_SZ);
>> + =C2=A0 =C2=A0 err =3D ubifs_tnc_add(c, &ino_key, lnum, ino_offs,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 UBIFS_INO_NODE_SZ + dir_ui->data_len);
>> =C2=A0 =C2=A0 =C2=A0 if (err)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_ro;
>>
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
>> index 76e4e05..c28ac04 100644
>> --- a/fs/ubifs/super.c
>> +++ b/fs/ubifs/super.c
>> @@ -2061,6 +2061,9 @@ static int ubifs_fill_super(struct super_block *sb=
, void *data, int silent)
>> =C2=A0 =C2=A0 =C2=A0 if (c->max_inode_sz > MAX_LFS_FILESIZE)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sb->s_maxbytes =3D c->m=
ax_inode_sz =3D MAX_LFS_FILESIZE;
>> =C2=A0 =C2=A0 =C2=A0 sb->s_op =3D &ubifs_super_operations;
>> +#ifdef CONFIG_UBIFS_FS_XATTR
>> + =C2=A0 =C2=A0 sb->s_xattr =3D ubifs_xattr_handlers;
>> +#endif
>>
>> =C2=A0 =C2=A0 =C2=A0 mutex_lock(&c->umount_mutex);
>> =C2=A0 =C2=A0 =C2=A0 err =3D mount_ubifs(c);
>> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
>> index 93d59ac..60b57f7 100644
>> --- a/fs/ubifs/ubifs.h
>> +++ b/fs/ubifs/ubifs.h
>> @@ -36,6 +36,7 @@
>> =C2=A0#include <linux/mtd/ubi.h>
>> =C2=A0#include <linux/pagemap.h>
>> =C2=A0#include <linux/backing-dev.h>
>> +#include <linux/security.h>
>> =C2=A0#include "ubifs-media.h"
>>
>> =C2=A0/* Version of this UBIFS implementation */
>> @@ -1454,6 +1455,7 @@ extern spinlock_t ubifs_infos_lock;
>> =C2=A0extern atomic_long_t ubifs_clean_zn_cnt;
>> =C2=A0extern struct kmem_cache *ubifs_inode_slab;
>> =C2=A0extern const struct super_operations ubifs_super_operations;
>> +extern const struct xattr_handler *ubifs_xattr_handlers[];
>> =C2=A0extern const struct address_space_operations ubifs_file_address_op=
erations;
>> =C2=A0extern const struct file_operations ubifs_file_operations;
>> =C2=A0extern const struct inode_operations ubifs_file_inode_operations;
>> @@ -1736,10 +1738,17 @@ int ubifs_getattr(struct vfsmount *mnt, struct d=
entry *dentry,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct kstat *st=
at);
>>
>> =C2=A0/* xattr.c */
>> +
>> =C2=A0int ubifs_setxattr(struct dentry *dentry, const char *name,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void=
 *value, size_t size, int flags);
>> +int ubifs_init_security(struct inode *dentry, struct inode *inode,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
const struct qstr *qstr);
>> +int ubifs_symlink_setxattr(struct dentry *dentry, const char *name,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const void *value, size_t size, int flags);
>> =C2=A0ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, vo=
id *buf,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size_t size);
>> +ssize_t ubifs_symlink_getxattr(struct dentry *dentry, const char *name,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0void *buf, size_t size);
>> =C2=A0ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_=
t size);
>> =C2=A0int ubifs_removexattr(struct dentry *dentry, const char *name);
>>
>> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
>> index 85b2722..a402c7d 100644
>> --- a/fs/ubifs/xattr.c
>> +++ b/fs/ubifs/xattr.c
>> @@ -209,11 +209,11 @@ static int change_xattr(struct ubifs_info *c, stru=
ct inode *host,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_free;
>> =C2=A0 =C2=A0 =C2=A0 }
>> =C2=A0 =C2=A0 =C2=A0 inode->i_size =3D ui->ui_size =3D size;
>> - =C2=A0 =C2=A0 ui->data_len =3D size;
>>
>> =C2=A0 =C2=A0 =C2=A0 mutex_lock(&host_ui->ui_mutex);
>> =C2=A0 =C2=A0 =C2=A0 host->i_ctime =3D ubifs_current_time(host);
>> =C2=A0 =C2=A0 =C2=A0 host_ui->xattr_size -=3D CALC_XATTR_BYTES(ui->data_=
len);
>> + =C2=A0 =C2=A0 ui->data_len =3D size;
>> =C2=A0 =C2=A0 =C2=A0 host_ui->xattr_size +=3D CALC_XATTR_BYTES(size);
>>
>> =C2=A0 =C2=A0 =C2=A0 /*
>> @@ -293,18 +293,16 @@ static struct inode *iget_xattr(struct ubifs_info =
*c, ino_t inum)
>> =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(-EINVAL);
>> =C2=A0}
>>
>> -int ubifs_setxattr(struct dentry *dentry, const char *name,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *val=
ue, size_t size, int flags)
>> +static int __ubifs_setxattr(struct inode *host, const char *name,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const void *value, size_t size, int flags)
>> =C2=A0{
>> - =C2=A0 =C2=A0 struct inode *inode, *host =3D dentry->d_inode;
>> + =C2=A0 =C2=A0 struct inode *inode;
>> =C2=A0 =C2=A0 =C2=A0 struct ubifs_info *c =3D host->i_sb->s_fs_info;
>> =C2=A0 =C2=A0 =C2=A0 struct qstr nm =3D { .name =3D name, .len =3D strle=
n(name) };
>> =C2=A0 =C2=A0 =C2=A0 struct ubifs_dent_node *xent;
>> =C2=A0 =C2=A0 =C2=A0 union ubifs_key key;
>> =C2=A0 =C2=A0 =C2=A0 int err, type;
>>
>> - =C2=A0 =C2=A0 dbg_gen("xattr '%s', host ino %lu ('%.*s'), size %zd", n=
ame,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host->i_ino, dentry->d_name.=
len, dentry->d_name.name, size);
>> =C2=A0 =C2=A0 =C2=A0 ubifs_assert(mutex_is_locked(&host->i_mutex));
>>
>> =C2=A0 =C2=A0 =C2=A0 if (size > UBIFS_MAX_INO_DATA)
>> @@ -356,10 +354,29 @@ out_free:
>> =C2=A0 =C2=A0 =C2=A0 return err;
>> =C2=A0}
>>
>> -ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *b=
uf,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
ize_t size)
>> +int ubifs_symlink_setxattr(struct dentry *dentry, const char *name,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const void *value, size_t size, int flags)
>> =C2=A0{
>> - =C2=A0 =C2=A0 struct inode *inode, *host =3D dentry->d_inode;
>> + =C2=A0 =C2=A0 struct inode *host =3D dentry->d_inode;
>> + =C2=A0 =C2=A0 dbg_gen("xattr '%s', host ino %lu ('%.*s'), size %zd", n=
ame,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host->i_ino, dentry->d_name.=
len, dentry->d_name.name, size);
>> + =C2=A0 =C2=A0 return __ubifs_setxattr(host, name, value, size, flags);
>> +}
>> +
>> +int ubifs_setxattr(struct dentry *dentry, const char *name,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *val=
ue, size_t size, int flags)
>> +{
>> + =C2=A0 =C2=A0 struct inode *host =3D dentry->d_inode;
>> + =C2=A0 =C2=A0 dbg_gen("xattr '%s', host ino %lu ('%.*s'), size %zd", n=
ame,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host->i_ino, dentry->d_name.=
len, dentry->d_name.name, size);
>> + =C2=A0 =C2=A0 return __ubifs_setxattr(host, name, value, size, flags);
>> +}
>> +
>> +static
>> +ssize_t __ubifs_getxattr(struct inode *host, const char *name, void *bu=
f,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size_t size)
>> +{
>> + =C2=A0 =C2=A0 struct inode *inode;
>> =C2=A0 =C2=A0 =C2=A0 struct ubifs_info *c =3D host->i_sb->s_fs_info;
>> =C2=A0 =C2=A0 =C2=A0 struct qstr nm =3D { .name =3D name, .len =3D strle=
n(name) };
>> =C2=A0 =C2=A0 =C2=A0 struct ubifs_inode *ui;
>> @@ -367,8 +384,8 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const =
char *name, void *buf,
>> =C2=A0 =C2=A0 =C2=A0 union ubifs_key key;
>> =C2=A0 =C2=A0 =C2=A0 int err;
>>
>> - =C2=A0 =C2=A0 dbg_gen("xattr '%s', ino %lu ('%.*s'), buf size %zd", na=
me,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host->i_ino, dentry->d_name.=
len, dentry->d_name.name, size);
>> + =C2=A0 =C2=A0 dbg_gen("xattr '%s', ino %lu =C2=A0buf size %zd", name,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host->i_ino, size);
>>
>> =C2=A0 =C2=A0 =C2=A0 err =3D check_namespace(&nm);
>> =C2=A0 =C2=A0 =C2=A0 if (err < 0)
>> @@ -416,6 +433,25 @@ out_unlock:
>> =C2=A0 =C2=A0 =C2=A0 return err;
>> =C2=A0}
>>
>> +ssize_t ubifs_symlink_getxattr(struct dentry *dentry, const char *name,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0void *buf, size_t size)
>> +{
>> + =C2=A0 =C2=A0 struct inode *host =3D dentry->d_inode;
>> + =C2=A0 =C2=A0 dbg_gen("xattr '%s', ino %lu ('%.*s'), buf size %zd", na=
me,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host->i_ino, dentry->d_name.=
len, dentry->d_name.name, size);
>> + =C2=A0 =C2=A0 return __ubifs_getxattr(host, name, buf, size);
>> +}
>> +
>> +ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *b=
uf,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
ize_t size)
>> +{
>> + =C2=A0 =C2=A0 struct inode *host =3D dentry->d_inode;
>> + =C2=A0 =C2=A0 dbg_gen("xattr '%s', ino %lu ('%.*s'), buf size %zd", na=
me,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host->i_ino, dentry->d_name.=
len, dentry->d_name.name, size);
>> + =C2=A0 =C2=A0 return __ubifs_getxattr(host, name, buf, size);
>> +}
>> +
>> +
>> =C2=A0ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_=
t size)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 union ubifs_key key;
>> @@ -568,3 +604,92 @@ out_free:
>> =C2=A0 =C2=A0 =C2=A0 kfree(xent);
>> =C2=A0 =C2=A0 =C2=A0 return err;
>> =C2=A0}
>> +
>> +size_t
>> +ubifs_security_listxattr(struct dentry *d, char *list, size_t list_size=
,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const char *name, size_t name_len, int flags)
>> +{
>> + =C2=A0 =C2=A0 const int prefix_len =3D XATTR_SECURITY_PREFIX_LEN;
>> + =C2=A0 =C2=A0 const size_t total_len =3D prefix_len + name_len + 1;
>> + =C2=A0 =C2=A0 if (list && total_len <=3D list_size) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(list, XATTR_SECURITY_=
PREFIX, prefix_len);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(list+prefix_len, name=
, name_len);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list[prefix_len + name_len] =
=3D '\0';
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 return total_len;
>> +}
>> +
>> +
>> +int ubifs_security_getxattr(struct dentry *d, const char *name,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 void *buffer, size_t size, int flags)
>> +{
>> + =C2=A0 =C2=A0 if (strcmp(name, "") =3D=3D 0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 return __ubifs_getxattr(d->d_inode, XATTR_NAME_SELINUX, =
buffer, size);
>> +}
>> +
>> +
>> +int ubifs_security_setxattr(struct dentry *d, const char *name,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const void *value, size_t size,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int flags, int handler_flags)
>> +{
>> + =C2=A0 =C2=A0 if (strcmp(name, "") =3D=3D 0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 return __ubifs_setxattr(d->d_inode, XATTR_NAME_SELINUX, =
value,
>
> This is silly. If you're supporting xattrs there is no reason
> single out a particular LSM. Make this general so that Smack
> and any other LSM that wants to use xattrs will work.
>
> Move the changes into the SELinux LSM if you are going to
> hard code it.
>

Yup, my bad, following change  fixes that specific issue and one can
set xattr for all  security.*  namespace. Will submit patch v2
shortly...

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index a402c7d..c8be7cd 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -625,7 +625,7 @@ int ubifs_security_getxattr(struct dentry *d,
const char *name,
 {
        if (strcmp(name, "") =3D=3D 0)
                return -EINVAL;
-       return __ubifs_getxattr(d->d_inode, XATTR_NAME_SELINUX, buffer, siz=
e);
+       return __ubifs_getxattr(d->d_inode, name, buffer, size);
 }


@@ -635,7 +635,7 @@ int ubifs_security_setxattr(struct dentry *d,
const char *name,
 {
        if (strcmp(name, "") =3D=3D 0)
                return -EINVAL;
-       return __ubifs_setxattr(d->d_inode, XATTR_NAME_SELINUX, value,
+       return __ubifs_setxattr(d->d_inode, name, value,
                                size, flags);
 }
