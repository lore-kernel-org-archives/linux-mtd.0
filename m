Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaZQa-00061K-W6
 for linux-mtd@lists.infradead.org; Sat, 12 Sep 2015 01:16:32 +0000
Message-ID: <55F37CA3.50507@huawei.com>
Date: Sat, 12 Sep 2015 09:15:15 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <andreas.gruenbacher@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [RFC PATCH v3 3/5] UBIFS: ACL: handle ACL through xattr
References: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
 <1441962597-13543-4-git-send-email-shengyong1@huawei.com>
 <55F2602F.5090407@cn.fujitsu.com> <55F27240.2050500@huawei.com>
 <55F273D5.5080905@cn.fujitsu.com>
In-Reply-To: <55F273D5.5080905@cn.fujitsu.com>
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



On 9/11/2015 2:25 PM, Dongsheng Yang wrote:
> On 09/11/2015 02:18 PM, Sheng Yong wrote:
>> Hi, Dongsheng
>>
>> On 9/11/2015 1:01 PM, Dongsheng Yang wrote:
>>> On 09/11/2015 05:09 PM, Sheng Yong wrote:
>> [...]
>>>
>>> Why move it? If you just want to use them before the definitions,
>>> Just declare them before using.
>>
>> OK.
>>>>    int ubifs_do_setxattr(struct inode *host, const char *name,
>>>>                  const void *value, size_t size, int flags)
>>>>    {
>>>> @@ -348,7 +462,19 @@ int ubifs_do_setxattr(struct inode *host, const char *name,
>>>>            goto out_free;
>>>>        }
>>>>
>>>> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
>>>> +    if (size == 0) {
>>>> +        ubifs_assert(inode->i_nlink == 1);
>>>> +        clear_nlink(inode);
>>>> +        err = remove_xattr(c, host, inode, &nm);
>>>> +        if (err)
>>>> +            set_nlink(inode, 1);
>>>> +        iput(inode);
>>>> +        goto out_free;
>>>> +    }
>>>> +#endif
>>>
>>> Is there a testcase for it?
>>
>> I test `setfacl -b/-k'. I don't know how setfacl is implemented. But for ACL_TYPE_ACCESS,
>> ubifs_setxattr() is called with size = 0 and value = NULL; while for ACL_TYPE_DEFAULT,
>> ubifs_removexattr() is called.
> 
> I mean, if we don't add the code above, what kind of problem
> we would meet?

Then, a new xattr wich length 0 and value NULL, is written to flash, which is useless.
I don't think we should keep this xattr.

>>
>>>>        err = change_xattr(c, host, inode, value, size);
>>>> +
>>>>        iput(inode);
>>>>
>>>>    out_free:
>>>> @@ -359,6 +485,9 @@ out_free:
>>>>    int ubifs_setxattr(struct dentry *dentry, const char *name,
>>>>               const void *value, size_t size, int flags)
>>>>    {
>>>> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
>>>> +    const struct xattr_handler *handler;
>>>> +#endif
>>>>        struct qstr nm = QSTR_INIT(name, strlen(name));
>>>>        int type;
>>>>
>>>> @@ -369,6 +498,16 @@ int ubifs_setxattr(struct dentry *dentry, const char *name,
>>>>        if (type < 0)
>>>>            return type;
>>>>
>>>> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
>>>> +    if (type == POSIX_ACL_DEFAULT || type == POSIX_ACL_ACCESS) {
>>>> +        if (type == POSIX_ACL_DEFAULT)
>>>> +            handler = &posix_acl_default_xattr_handler;
>>>> +        if (type == POSIX_ACL_ACCESS)
>>>> +            handler = &posix_acl_access_xattr_handler;
>>>> +        return handler->set(dentry, name, value, size, flags,
>>>> +                    handler->flags);
>>>> +    }
>>>> +#endif
>>>
>>> What about setting sb->s_xattr and calling generic_setxattr() here?
>>
>> I have no idea if we should do this :(
>> If we do, I think, we should call generic functions for all xattr.
> 

I copied the xattr handler discussion from the other email, so that
we could have it at one place :)

> No, only for POSIX_ACL_DEFAULT|POSIX_ACL_ACCESS currently. Then
> Something like that:
> 
> if (type == POSIX_ACL_DEFAULT || type == POSIX_ACL_ACCESS)
>     return generic_setxattr(dentry, name, value, size, flags);

Acutally, in my v1 patchset, I did like this. The URL is:
http://lists.infradead.org/pipermail/linux-mtd/2015-March/058451.html

>Security handler is different with acl handler. Please read the
>security_getxattr(), it just return ubifs_getxattr(). That means
>we can use ubifs_getxattr() immediately. So we can remove the
>security_handler for ubifs.
>
>But acl is different, we need to call a special ubifs_get_acl()
>here. Then I found you get the handler by youself in the
>ubifs_get|set_xattr() and call handler->set() by youself.

Right, they are different. I mean using the generic way means
ubifs_[get|set]xattr should be modified.

>
>That's not good idea. Please Just set the handler and call
>generic_setxattr().

But IMO, calling generic_setxattr means we have to add
posix_acl_[access|default]_xattr_handler in ubifs_xattr_handlers, like

 const struct xattr_handler *ubifs_xattr_handlers[] = {
 	&ubifs_xattr_security_handler,
+#ifdef CONFIG_UBIFS_FS_POSIX_ACL
+	&posix_acl_access_xattr_handler,
+	&posix_acl_default_xattr_handler,
+#endif
 	NULL,
 };

then, generic_setxattr() could call posix_acl_***_xattr_handler.set(),
which will call ubifs_set_acl() to do the real setting. Since security
xattr dead code is going to be removed, ubifs_xattr_handlers may go
away too. So I agree with Andreas that if we could add all xattr handlers
in ubifs_xattr_handlers (which means ubifs_[get|set]xattr should be
modified and generic_[get|set]xattr should be set in inode_operations,
e.g ext4, jffs2), it's better to use generic_setxattr. I'm not sure
whether we should convert ubifs to use the xattr handler infrastructure,
like what Andreas said.

thanks,
Sheng

> 
> Yang
>>
>> thanks,
>> Sheng
>>
>>>>        return ubifs_do_setxattr(d_inode(dentry), name, value, size, flags);
>>>>    }
>>>>
>>>> @@ -428,6 +567,9 @@ out_unlock:
>>>>    ssize_t ubifs_getxattr(struct dentry *dentry, const char *name,
>>>>                   void *value, size_t size)
>>>>    {
>>>> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
>>>> +    const struct xattr_handler *handler;
>>>> +#endif
>>>>        struct qstr nm = QSTR_INIT(name, strlen(name));
>>>>        int type;
>>>>
>>>> @@ -438,6 +580,16 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name,
>>>>        if (type < 0)
>>>>            return type;
>>>>
>>>> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
>>>> +    if (type == POSIX_ACL_DEFAULT || type == POSIX_ACL_ACCESS) {
>>>> +        if (type == POSIX_ACL_DEFAULT)
>>>> +            handler = &posix_acl_default_xattr_handler;
>>>> +        if (type == POSIX_ACL_ACCESS)
>>>> +            handler = &posix_acl_access_xattr_handler;
>>>> +        return handler->get(dentry, name, value, size,
>>>> +                    handler->flags);
>>>> +    }
>>>> +#endif
>>>
>>> Ditto
>>>
>>> Thanx
>>> Yang
>>>>        return ubifs_do_getxattr(d_inode(dentry), name, value, size);
>>>>    }
>>>>
>>>> @@ -505,95 +657,6 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>>>>        return written;
>>>>    }
>>>>
>>>> -static int remove_xattr(struct ubifs_info *c, struct inode *host,
>>>> -            struct inode *inode, const struct qstr *nm)
>>>> -{
>>>> -    int err;
>>>> -    struct ubifs_inode *host_ui = ubifs_inode(host);
>>>> -    struct ubifs_inode *ui = ubifs_inode(inode);
>>>> -    struct ubifs_budget_req req = { .dirtied_ino = 2, .mod_dent = 1,
>>>> -                .dirtied_ino_d = ALIGN(host_ui->data_len, 8) };
>>>> -
>>>> -    ubifs_assert(ui->data_len == inode->i_size);
>>>> -
>>>> -    err = ubifs_budget_space(c, &req);
>>>> -    if (err)
>>>> -        return err;
>>>> -
>>>> -    mutex_lock(&host_ui->ui_mutex);
>>>> -    host->i_ctime = ubifs_current_time(host);
>>>> -    host_ui->xattr_cnt -= 1;
>>>> -    host_ui->xattr_size -= CALC_DENT_SIZE(nm->len);
>>>> -    host_ui->xattr_size -= CALC_XATTR_BYTES(ui->data_len);
>>>> -    host_ui->xattr_names -= nm->len;
>>>> -
>>>> -    err = ubifs_jnl_delete_xattr(c, host, inode, nm);
>>>> -    if (err)
>>>> -        goto out_cancel;
>>>> -    mutex_unlock(&host_ui->ui_mutex);
>>>> -
>>>> -    ubifs_release_budget(c, &req);
>>>> -    return 0;
>>>> -
>>>> -out_cancel:
>>>> -    host_ui->xattr_cnt += 1;
>>>> -    host_ui->xattr_size += CALC_DENT_SIZE(nm->len);
>>>> -    host_ui->xattr_size += CALC_XATTR_BYTES(ui->data_len);
>>>> -    mutex_unlock(&host_ui->ui_mutex);
>>>> -    ubifs_release_budget(c, &req);
>>>> -    make_bad_inode(inode);
>>>> -    return err;
>>>> -}
>>>> -
>>>> -int ubifs_removexattr(struct dentry *dentry, const char *name)
>>>> -{
>>>> -    struct inode *inode, *host = d_inode(dentry);
>>>> -    struct ubifs_info *c = host->i_sb->s_fs_info;
>>>> -    struct qstr nm = QSTR_INIT(name, strlen(name));
>>>> -    struct ubifs_dent_node *xent;
>>>> -    union ubifs_key key;
>>>> -    int err;
>>>> -
>>>> -    dbg_gen("xattr '%s', ino %lu ('%pd')", name,
>>>> -        host->i_ino, dentry);
>>>> -    ubifs_assert(mutex_is_locked(&host->i_mutex));
>>>> -
>>>> -    err = check_namespace(&nm);
>>>> -    if (err < 0)
>>>> -        return err;
>>>> -
>>>> -    xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
>>>> -    if (!xent)
>>>> -        return -ENOMEM;
>>>> -
>>>> -    xent_key_init(c, &key, host->i_ino, &nm);
>>>> -    err = ubifs_tnc_lookup_nm(c, &key, xent, &nm);
>>>> -    if (err) {
>>>> -        if (err == -ENOENT)
>>>> -            err = -ENODATA;
>>>> -        goto out_free;
>>>> -    }
>>>> -
>>>> -    inode = iget_xattr(c, le64_to_cpu(xent->inum));
>>>> -    if (IS_ERR(inode)) {
>>>> -        err = PTR_ERR(inode);
>>>> -        goto out_free;
>>>> -    }
>>>> -
>>>> -    ubifs_assert(inode->i_nlink == 1);
>>>> -    clear_nlink(inode);
>>>> -    err = remove_xattr(c, host, inode, &nm);
>>>> -    if (err)
>>>> -        set_nlink(inode, 1);
>>>> -
>>>> -    /* If @i_nlink is 0, 'iput()' will delete the inode */
>>>> -    iput(inode);
>>>> -
>>>> -out_free:
>>>> -    kfree(xent);
>>>> -    return err;
>>>> -}
>>>> -
>>>>    static size_t security_listxattr(struct dentry *d, char *list, size_t list_size,
>>>>                     const char *name, size_t name_len, int flags)
>>>>    {
>>>>
>>>
>>>
>>> .
>>>
>>
>> .
>>
> 
> 
> .
> 
