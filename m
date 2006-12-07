Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GsLci-0008Eu-VU
	for linux-mtd@lists.infradead.org; Thu, 07 Dec 2006 10:57:29 -0500
Message-ID: <457839B1.9050005@valcom.com>
Date: Thu, 07 Dec 2006 10:56:33 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: mkfs.jffs2 not compiling, which acl.h?
References: <4576CC07.2000107@valcom.com>
	<1165505164.5253.370.camel@pmac.infradead.org>
In-Reply-To: <1165505164.5253.370.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> There is something broken about your toolchain if _either_
> <linux/posix_acl.h> or <asm/atomic.h> exist. Those are _not_ headers
> which the kernel exports when you run 'make headers_install' to generate
> the headers for userspace to use. Please make sure you report this
> problem to whoever generated your toolchain.
>   
I am using m68k-uclinux-tools-20060615 used with the uClinux
distribution for embedded systems. 
> Actually, I'm not entirely sure what this code is doing at all -- isn't
> it interpreting on-disk xattrs representing ACLs assuming that they're
> in the same format as ext3 uses? 
I was pointed to this link to answer why ACL is used in mkfs.jffs2.

http://thread.gmane.org/gmane.linux.drivers.mtd/16740/focus=16745

This is an excerpt from the above link.
"The access control list(ACL) enables higher flexible access control
based on UNIX users and groups than traditional user/group/others model.
'--with-xattr' or '--with-posix-acl' options on mkfs.jffs2 enables to
copy the ACLs associated with any files in host environment into jffs2
image file.
The purpose of this feature is improvement of security in embedded region."

This link also describes the compile flag WITHOUT_XATTR=1 which will disable this code.
