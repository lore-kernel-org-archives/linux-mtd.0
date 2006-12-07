Subject: Re: mkfs.jffs2 not compiling, which acl.h?
From: David Woodhouse <dwmw2@infradead.org>
To: Glen Johnson <gjohnson@valcom.com>
In-Reply-To: <4576CC07.2000107@valcom.com>
References: <4576CC07.2000107@valcom.com>
Content-Type: text/plain
Date: Thu, 07 Dec 2006 15:26:04 +0000
Message-Id: <1165505164.5253.370.camel@pmac.infradead.org>
Mime-Version: 1.0
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

On Wed, 2006-12-06 at 08:56 -0500, Glen Johnson wrote:
> I tried #include <linux/posix_acl.h> in place of <sys/acl.h> and got
> warnings about not other info.  If I #include <asm-m68knommu/atomic.h>
> all the warnings and errors dissappear. 

There is something broken about your toolchain if _either_
<linux/posix_acl.h> or <asm/atomic.h> exist. Those are _not_ headers
which the kernel exports when you run 'make headers_install' to generate
the headers for userspace to use. Please make sure you report this
problem to whoever generated your toolchain.

The acl.h which you should be using comes from libacl -- although we
only use about 6 #defines from it and don't link against the library.
Perhaps we should just copy those instead of requiring the header?

Actually, I'm not entirely sure what this code is doing at all -- isn't
it interpreting on-disk xattrs representing ACLs assuming that they're
in the same format as ext3 uses? If you use mkfs.jffs2 on a big-endian
system, actually reading _from_ a jffs2 filesystem, does it do the right
thing? What about from other file systems?

KaiGai-san?

-- 
dwmw2
