Received: from mail.grid-net.com ([97.65.115.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSJuV-0004K4-AA
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 03:19:24 +0000
Message-ID: <4FAB33B2.80104@grid-net.com>
Date: Wed, 9 May 2012 20:19:14 -0700
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: ubifs_jnl_update and extended attribute inode removal
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

Hello,

Probably not many users of extended attributes on ubifs. I am trying to 
add this feature (patch v3) coming soon.

(xattr == extended attribute)

I have written updated the integck utility and discovered that sometimes 
files have wrong extended attributes. This happens only when some files 
are deleted from the filesystem.

Easy way to describe this is: I create 100 files, assign then extended 
attribute, and remember what the xattr was, it always stays the same. 
However now if I delete some of these files randomly some of the files 
end up having wrong xattr.

So  I have been trying to see how UBIFS handles file removal. I see that 
ubifs_unlink() calls ubifs_jnl_update() as:

         err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 1, 0);

However ubifs_jnl_update never removes the  inode that is created to 
store the xattr associated , when reference drops to zero. I certainly 
know how to get access to inode that holds the xattr, what would be the 
right place where I can delete this inode also.  Or does the UBIFS has 
some other logic that will cleanup the xattr orphan inode at later time?

Note, there are implementation of remove_xattr() and that works, but 
that function is only called when some user space program explicitly 
removes proceeds. I am just trying to get some advice from folks who 
understand tnc management far better than I do. Would appreciate the 
help/pointer.

-Subodh

-Subodh
