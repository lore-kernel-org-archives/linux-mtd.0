Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KLMm-0007Ah-UC
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 18:02:33 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19KLLW-0000uj-00
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 19:01:14 +0200
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Mon, 26 May 2003 10:03:15 -0700
Message-ID: <m3smr1y71o.fsf@bfnet.com>
References: <m34r3izfvn.fsf@bfnet.com>
	<1053938076.17182.39.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Sender: news <news@main.gmane.org>
Content-Type: text/plain; charset=us-ascii
Subject: Re: mtd/utils automake attic?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DWMW2> But don't bother -- I removed the auto* crap in favour of the
DWMW2> proper makefiles. If you need to cross-compile, you can do so
DWMW2> with a command such as 'make CROSS=arm-linux-gnu- mkfs.jffs2'.

DWMW2> You'll need to make sure that zlib is in your toolchain's
DWMW2> sys-root or otherwise available.


Apparently that's not all you need.  I haven't been able to get any
version to compile due to my kernel's jffs2.h not defining jint16_t
and friends.  Unfortunately, I can't patch my kernel because it
contains NAND code specific to my board that gets munged by
patchin.sh.

Dave
