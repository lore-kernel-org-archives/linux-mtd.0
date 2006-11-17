Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gl6kk-0002vz-JD
	for linux-mtd@lists.infradead.org; Fri, 17 Nov 2006 11:39:56 -0500
Message-ID: <455DE5CE.4070904@valcom.com>
Date: Fri, 17 Nov 2006 11:39:42 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: 2.6 Kernel not mounting JFFS2 partition
References: <455CC35B.5080705@valcom.com>
	<1163766854.5597.39.camel@sauron>	<455DC28D.30507@valcom.com>
	<1163773308.5597.44.camel@sauron>
In-Reply-To: <1163773308.5597.44.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:

> > We moved to GIT. The utilities are available via
> >
> > git-clone git://git.infradead.org/mtd-utils.git mtd-utils.git
> >
>
>   
Mr. Bityutskiy,
After using git-clone ... I replaced uClinux-dist/user/mtd-utils with
the git-clone you recommended.  I tried make
and received the following error.

make[3]: Entering directory
`/home/glen/src/c/uClinux-dist-20060803/user/mtd-utils'
mkdir -p m68k-elf
m68k-elf-gcc -I./include -O2 -Wall -g -c -o m68k-elf/mkfs.jffs2.o
mkfs.jffs2.c -g -Wp,-MD,m68k-elf/.mkfs.jffs2.c.dep
mkfs.jffs2.c:69:21: error: sys/acl.h: No such file or directory
mkfs.jffs2.c:73:18: error: zlib.h: No such file or directory


Is there something I need to update in make xconfig to get the proper
header files to be included?  I am sure there is
something I am leaving out.
Thanks,
Glen Johnson
