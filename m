Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gl6hx-0002iv-Mc
	for linux-mtd@lists.infradead.org; Fri, 17 Nov 2006 11:36:57 -0500
Subject: Re: 2.6 Kernel not mounting JFFS2 partition
From: Artem Bityutskiy <dedekind@infradead.org>
To: Glen Johnson <gjohnson@valcom.com>
In-Reply-To: <455DE310.2060303@valcom.com>
References: <455CC35B.5080705@valcom.com> <1163766854.5597.39.camel@sauron>
	<455DC28D.30507@valcom.com> <1163773308.5597.44.camel@sauron>
	<455DE310.2060303@valcom.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 17 Nov 2006 18:34:26 +0200
Message-Id: <1163781266.5597.48.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-11-17 at 11:28 -0500, Glen Johnson wrote:
> make[3]: Entering directory
> `/home/glen/src/c/uClinux-dist-20060803/user/mtd-utils'
> mkdir -p m68k-elf
> m68k-elf-gcc -I./include -O2 -Wall -g -c -o m68k-elf/mkfs.jffs2.o
> mkfs.jffs2.c -g -Wp,-MD,m68k-elf/.mkfs.jffs2.c.dep
> mkfs.jffs2.c:69:21: error: sys/acl.h: No such file or directory
> mkfs.jffs2.c:73:18: error: zlib.h: No such file or directory

Sorry, no idea. Try ti fix this yourself or may be somebody from this
list will help you.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
