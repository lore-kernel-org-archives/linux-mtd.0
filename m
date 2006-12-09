Received: from wx-out-0506.google.com ([66.249.82.224])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gt5EC-0000xN-K5
	for linux-mtd@lists.infradead.org; Sat, 09 Dec 2006 11:39:13 -0500
Received: by wx-out-0506.google.com with SMTP id h30so1139497wxd
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Dec 2006 08:39:06 -0800 (PST)
Message-ID: <457AE718.1090707@kaigai.gr.jp>
Date: Sun, 10 Dec 2006 01:40:56 +0900
From: KaiGai Kohei <kaigai@kaigai.gr.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: mkfs.jffs2 not compiling, which acl.h?
References: <4576CC07.2000107@valcom.com>
	<1165505164.5253.370.camel@pmac.infradead.org>
In-Reply-To: <1165505164.5253.370.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: Kohei KaiGai <kaigai.kohei@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Glen Johnson <gjohnson@valcom.com>, KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm sorry for delayed responding.

> Actually, I'm not entirely sure what this code is doing at all -- isn't
> it interpreting on-disk xattrs representing ACLs assuming that they're
> in the same format as ext3 uses? If you use mkfs.jffs2 on a big-endian
> system, actually reading _from_ a jffs2 filesystem, does it do the right
> thing? What about from other file systems?

Because the on-disk xattr representation which holds any ACLs is
interpreted into _common_ format in the kernel, the user space
application including mkfs.jffs2 does not need to be conscious
the differences between filesystems or endians.

See, fs/xattr_acl.c in the kernel.
Any filesystem (excluding xfs) calls posix_acl_to_xattr() to interpret
the in-kernel representation of ACLs before returning it into userspace.

The common format is defined as a leading 'posix_acl_xattr_header' and
an array of 'posix_acl_xattr_entry'. All of them are represented in
little-endian ordering.

Thus, we can assume the same format as ext3 (and any filesystem) uses.
Is it OK?

Thanks,
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
