Received: from wa-out-1112.google.com ([209.85.146.179])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVDWt-0000WR-Eq
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 23:21:07 +0000
Received: by wa-out-1112.google.com with SMTP id j4so242535wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Feb 2009 15:21:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1233826226.17790.9.camel@localhost.localdomain>
References: <a5e2b64d0902042249k1c5ba5a3qce9d2f68f0523827@mail.gmail.com>
	<1233826226.17790.9.camel@localhost.localdomain>
Date: Fri, 6 Feb 2009 08:21:06 +0900
Message-ID: <a5e2b64d0902051521p146eef06lc2076b290f924b62@mail.gmail.com>
Subject: Re: Issues with UBIFS xattr support
From: Tim <timasyk@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/2/5 Artem Bityutskiy <dedekind@infradead.org>:
> On Thu, 2009-02-05 at 15:49 +0900, Tim wrote:
>> I found that UBIFS does not fully support xattr manipulation.
>
> This is right. We have very limited xattr support, which has never been
> tested well, because we do not use it.
>
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_xattr
>
>> I use security context files labeling (in SELinux) that heavily relies
>> on proper manipulation of xattr by the filesystem.
>> And issues are:
>> - ubifs does not store xattr in inode for symbolic link files;
>
> Hmm, ok, this should not be too difficult to fix.
>
>> - if new file is created on ubifs, xattr should be automatically
>> updated with security context label, but it does not.
>
> I'm very bad in security. Do you mean you need ACL support?
> This is not supported.
(I'm not good in filesystems, so sorry if I use some terms inappropriately)
No ACL is required, just security namespace in xattr.
When new file is created, then new inode should have proper contents
of xattr in security namespace. It is typically done by calling
security_inode_init_security() and updating xattr  in a function
responsible for new inode creation. security_inode_init_security()
will take care on computing required value for xattr security
namespace for new inode.

Then security namespace will be fully supported, I think. And security
engineers will be happy to use ubifs with SELinux :)

>> Maybe there is a patch that fixes those issues already?
>
> Unfortunately not, you should find a sane SW engineer with a
> clue and he may upgrade UBIFS, it is doable. We would of course
> assist.
Oh... I will try to find one :)

Tim
