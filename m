Received: from gate.aminocom.com
	([193.132.141.181] helo=aminocom.com ident=0)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16w0ZI-00018Y-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 13:54:20 +0100
Message-ID: <3CB6D89E.80356354@aminocom.com>
Date: Fri, 12 Apr 2002 13:52:46 +0100
From: Elizabeth Clarke <eclarke@aminocom.com>
MIME-Version: 1.0
To: manningc2@actrix.gen.nz
CC: linux-mtd@lists.infradead.org
Subject: Re: Possible JFFS2 bug
References: <200204080906.47847.hxos@rz.fh-augsburg.de> <20020412090913.3DDE34059@creative.actrix.co.nz>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Charles Manning wrote:
> In dir.c/jffs2_readdir()....
> I notice that if the filldir returns <0 during the fill for "." and "..", the
> execution gotos out:. This bypasses the down() of the semaphore, however the
> semaphore still gets up()ed.

Looks like it was fixed in cvs:

revision 1.52
date: 2002/01/21 12:33:49;  author: dwmw2;  state: Exp;  lines: +3 -3
Fix bogus up() without down() in jffs2_readdir()

Beth
