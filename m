Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140o3w-0004Jw-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 16:57:00 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140o3q-0004Jq-00
	for mtd@infradead.org; Tue, 28 Nov 2000 16:57:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <00B4D286538DD311BC6E005004E9EFC73B0F6C@M4EXCH> 
References: <00B4D286538DD311BC6E005004E9EFC73B0F6C@M4EXCH> 
To: Simon Munton <Simon.Munton@m4data.co.uk>
Cc: mtd@infradead.org, "JFFS (E-mail)" <jffs-dev@axis.com>
Subject: Re: Oops in JFFS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Nov 2000 16:56:04 +0000
Message-ID: <3375.975430564@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


This code in jffs_rename() looks strange to me. Why are we passing
new_dentry to jffs_remove() when we want the _old_ file with the same name 
to be removed? I think we need to do a lookup to get the dentry for the old 
file with that name, don't we?



--        /* See if there already exists a file with the same name as
           new_name.  */
        if ((del_f = jffs_find_child(new_dir_f, new_dentry->d_name.name,
                                     new_dentry->d_name.len))) {
                raw_inode.rename = 1;
                raw_inode.dsize = sizeof(__u32);
                rename_data = del_f->ino;
        }

        /* Write the new node to the flash memory.  */
        if ((result = jffs_write_node(c, node, &raw_inode,
                                      new_dentry->d_name.name,
                                      (unsigned char*)&rename_data, 0, f)) < 0) {
                D(printk("jffs_rename(): Failed to write node to flash.\n"));
                kfree(node);
                DJM(no_jffs_node--);
                goto jffs_rename_end;
        }
        raw_inode.dsize = 0;

        if (raw_inode.rename) {
                /* The file with the same name must be deleted.  */
                //FIXME deadlock                down(&c->fmc->gclock);
                if ((result = jffs_remove(new_dir, new_dentry,
                                          del_f->mode)) < 0) {
                        /* This is really bad.  */
                        printk(KERN_ERR "JFFS: An error occurred in "
                               "rename().\n");
                }
                //              up(&c->fmc->gclock);
        }


dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
