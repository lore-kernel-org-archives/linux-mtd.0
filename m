Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LV0Z5-0003yu-Do
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 09:30:34 +0000
Subject: Re: Issues with UBIFS xattr support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tim <timasyk@gmail.com>
In-Reply-To: <a5e2b64d0902042249k1c5ba5a3qce9d2f68f0523827@mail.gmail.com>
References: <a5e2b64d0902042249k1c5ba5a3qce9d2f68f0523827@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Feb 2009 11:30:26 +0200
Message-Id: <1233826226.17790.9.camel@localhost.localdomain>
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

On Thu, 2009-02-05 at 15:49 +0900, Tim wrote:
> I found that UBIFS does not fully support xattr manipulation.

This is right. We have very limited xattr support, which has never been
tested well, because we do not use it.

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_xattr

> I use security context files labeling (in SELinux) that heavily relies
> on proper manipulation of xattr by the filesystem.
> And issues are:
> - ubifs does not store xattr in inode for symbolic link files;

Hmm, ok, this should not be too difficult to fix.

> - if new file is created on ubifs, xattr should be automatically
> updated with security context label, but it does not.

I'm very bad in security. Do you mean you need ACL support?
This is not supported.

> Maybe there is a patch that fixes those issues already?

Unfortunately not, you should find a sane SW engineer with a
clue and he may upgrade UBIFS, it is doable. We would of course
assist.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
