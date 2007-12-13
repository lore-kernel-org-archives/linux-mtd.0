Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J2lqy-0003q1-BR
	for linux-mtd@lists.infradead.org; Thu, 13 Dec 2007 11:03:50 +0000
Date: Thu, 13 Dec 2007 12:03:53 +0100 (CET)
From: Peter Wippich <pewi@gw-instruments.de>
To: KokHow.Teh@infineon.com
Subject: Re: mtd-utils-1.1.0: build error
In-Reply-To: <31E09F73562D7A4D82119D7F6C17298603002AFD@sinse303.ap.infineon.com>
Message-ID: <Pine.LNX.4.63.0712131159320.13593@redbean.intranet.gw-instruments.de>
References: <31E09F73562D7A4D82119D7F6C17298603002AFD@sinse303.ap.infineon.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hi,

On Thu, 13 Dec 2007, KokHow.Teh@infineon.com wrote:

> Hi;
> 	I have downloaded mtd-utils-1.1.0 and unfortunately bump into
> build error as follows:
> 
> mips-linux-cc -I./include -g -O3 -G0 -pipe -fpic -fPIC -msoft-float
> -mabi=32 -march=mips32r2 -mtune=34kc -g -c -o mkfs.jffs2.o mkfs.jffs2.c
> -g -Wp,-MD,./.mkfs.jffs2.c.dep
> mkfs.jffs2.c:69:21: sys/acl.h: No such file or directory
> mkfs.jffs2.c: In function `formalize_posix_acl':
> mkfs.jffs2.c:1084: error: `ACL_USER_OBJ' undeclared (first use in this
.....
> 
> 	Any advice is appreciated. Thanks.

This one should go into the FAQ...., it's a commmon pitfall. I'm not sure 
if this is already fixed in 1.1.0, but at least in a recent GIT version 
you can add WITHOUT_XATTR=1 to the make command to compile without 
Posix ACL (which, IMHO, should be the default because I never came across 
any embedded system which uses Posix ACLs). 

Ciao, 

Peter 


|       Peter Wippich                   Voice: +49 30 46776411          |
|       G&W Instruments GmbH            fax:   +49 30 46776419          |
|       Gustav-Meyer-Allee 25, Geb. 12  Email: pewi@gw-instruments.de   |
|       D-13355 Berlin  / Germany                                       |
