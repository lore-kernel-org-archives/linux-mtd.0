Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Kuss-0006Ot-D7
	for <linux-mtd@lists.infradead.org>; Wed, 28 May 2003 07:58:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: David Wuertele <dave-gnus@bfnet.com>
In-Reply-To: <m31xymzeba.fsf@bfnet.com>
References: <m31xymzeba.fsf@bfnet.com>
Message-Id: <1054105125.26966.34.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 28 May 2003 07:58:45 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Looking for mkfs.jffs2 source that compiles against 2.4.18
 (redhat+patches)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-05-26 at 02:28, David Wuertele wrote:
> Can anyone tell me how to check out a version of mtd/util from CVS
> that will compile against my kernel's existing JFFS2 support?

It shouldn't. If you run 'make mkfs.jffs2' in the util/ directory from
CVS, you should see it add '-I../include' on the command line, and hence
use its _own_ headers, not the ones from your kernel.

-- 
dwmw2
