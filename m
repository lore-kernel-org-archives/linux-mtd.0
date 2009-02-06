Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LVLJj-0001AD-U8
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 07:40:04 +0000
Subject: Re: Issues with UBIFS xattr support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tim <timasyk@gmail.com>
In-Reply-To: <a5e2b64d0902051521p146eef06lc2076b290f924b62@mail.gmail.com>
References: <a5e2b64d0902042249k1c5ba5a3qce9d2f68f0523827@mail.gmail.com>
	<1233826226.17790.9.camel@localhost.localdomain>
	<a5e2b64d0902051521p146eef06lc2076b290f924b62@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 Feb 2009 09:39:52 +0200
Message-Id: <1233905992.17790.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-02-06 at 08:21 +0900, Tim wrote:
> 2009/2/5 Artem Bityutskiy <dedekind@infradead.org>:
> > On Thu, 2009-02-05 at 15:49 +0900, Tim wrote:
> >> I found that UBIFS does not fully support xattr manipulation.
> >
> > This is right. We have very limited xattr support, which has never been
> > tested well, because we do not use it.
> >
> > http://www.linux-mtd.infradead.org/doc/ubifs.html#L_xattr
> >
> >> I use security context files labeling (in SELinux) that heavily relies
> >> on proper manipulation of xattr by the filesystem.
> >> And issues are:
> >> - ubifs does not store xattr in inode for symbolic link files;
> >
> > Hmm, ok, this should not be too difficult to fix.
> >
> >> - if new file is created on ubifs, xattr should be automatically
> >> updated with security context label, but it does not.
> >
> > I'm very bad in security. Do you mean you need ACL support?
> > This is not supported.
> (I'm not good in filesystems, so sorry if I use some terms inappropriately)
> No ACL is required, just security namespace in xattr.

OK, then thinks must be much simpler.

> When new file is created, then new inode should have proper contents
> of xattr in security namespace. It is typically done by calling
> security_inode_init_security() and updating xattr  in a function
> responsible for new inode creation. security_inode_init_security()
> will take care on computing required value for xattr security
> namespace for new inode.

OK, this should be easy to add. I'm not sure I have time to do this now,
though. But you may try to do this yourself, should not be very
difficult.

And the "security." namespace seems to be supported. Although
it might be not fully supported. I mean, I tested reading, writing,
changing xattrs - this works. But some security namespace-specific
things might be missing.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
