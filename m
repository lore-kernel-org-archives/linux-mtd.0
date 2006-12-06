Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Grxyy-00048d-Io
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 09:42:51 -0500
Message-ID: <4576D6E3.2060908@valcom.com>
Date: Wed, 06 Dec 2006 09:42:43 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: mkfs.jffs2 not compiling, which acl.h?
References: <4576CC07.2000107@valcom.com>
	<Pine.LNX.4.64.0612061502000.29536@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0612061502000.29536@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof wrote:
> There was a patch posted a week or two ago on this list which enables you 
> to compile mkfs.jffs2 on systems where acl.h (and the features it 
> supports) are missing. Check the archives.
>   
Mr Wanderlof,
You are absolutely right.  I did find the patch just as you stated.  I
downloaded the patch and to my surprise my code already had the patch in
it.  I did see along with the patch that I am to cd mtd-utils/ and then
make WITHOUT_XATTR=1.  This works great however, when I cd into
uClinux-dist/ and run make, WITHOUT_XATTR=1 never gets passed to the
makefile in the mtd-utils directory. 
1. Do I need to change something in the uClinux-dist/user/Makefile so
that it will pass WITHOUT_XATTR=1 to the mtd-utils/makefile?

2. Do I need to add something to a config file under the vendors directory?

Thank you,
Glen Johnson
