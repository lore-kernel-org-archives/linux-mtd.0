Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOWe5-0006I2-6Y
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 15:02:14 +0000
Received: by eyh6 with SMTP id 6so2124127eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 08:02:10 -0700 (PDT)
Subject: Re: Setting security XATTR on ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: snijsure@grid-net.com
In-Reply-To: <1305934601.10340.12.camel@subodh-desktop>
References: <1305934601.10340.12.camel@subodh-desktop>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 May 2011 17:57:57 +0300
Message-ID: <1306162677.2785.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

no time now, so very quick answer.

On Fri, 2011-05-20 at 16:36 -0700, Subodh Nijsure wrote:
> we have implemented modifications to UBIFS to add support for SELinux
> labeling. Function that created this XATTR is called
> ubifs_init_security(), shown below.

OK, sounds cool.

> Following example of how JFFS2 does extended attribute labeling, This
> function is being called from 
> ubifs_create(),ubifs_mkdir(), ubifs_mknod(), ubifs_symlink() (in
> fs/ubifs/dir.c)

OK.

> With this modification things work "mostly", I am able to label the file
> system, but sometimes the file system is getting corrupted. I will
> certainly post the patch once things work reliably. 

Hmm... Running tests with all UBIFS extra self-checks turned on is a
good idea, BTW.

> I don't _fully_ understand how ubifs is doing space management, hence
> the immediate questions I have are:

Well, the main complication is budgeting: before doing any I/O you need
to get space budget, which is basically about asking the budgeting
subsystem to reserve certain amount of space for your operation. When
you are done - you release the budget.

> 1. What is the right point to add the XATTR to the UBIFS inode, after
> the ubifs_new_inode() is done?

I guess right after that? But keep in mind that unclean reboots may
result in losing selinux attributes. E.g., you create a new inode for
file XXX and this succeeds, then you start creating the selinux labels
and you have a power cut. When you mount the FS again you'll find out
that XXX does not have any selinux labels.

I do not know selinux well enough so do not know how this is handled:
does selinux handle it from user-space somehow or it assumes that
file/dir/symlink + selinux lables creation is atomic?

>  Should ubifs_budget_space() be updated to
> handle extra space needed by the XATTR.

In _your_ implementation no - ubifs_init_security() calls
'ubifs_setxattr()' which calls 'create_xattr()' which gets the budget.

I mean, in your implementation creating inode and creating selinux
xattrs are 2 separate operations and you use existing "big" building
blocks for this which do the budgeting.

> 2. In function below ui_mutex is being locked/unlocked while XATTR for
> the file is updated. Is that required while updating the extended
> attribute?

You'd deadlock if you did this I think, because 'create_xattr()' takes
the mutex (it is called "host_ui->ui_mutex" there).

HTH.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
