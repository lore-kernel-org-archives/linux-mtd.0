Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KMfD-0007UQ-Vo
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 19:25:40 +0100
Date: Mon, 26 May 2003 20:26:24 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Wuertele <dave-gnus@bfnet.com>
Message-ID: <20030526182624.GA551@wohnheim.fh-wedel.de>
References: <m34r3izfvn.fsf@bfnet.com>
	<1053938076.17182.39.camel@imladris.demon.co.uk> <m3smr1y71o.fsf@bfnet.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m3smr1y71o.fsf@bfnet.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/utils automake attic?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 May 2003 10:03:15 -0700, David Wuertele wrote:
> 
> DWMW2> You'll need to make sure that zlib is in your toolchain's
> DWMW2> sys-root or otherwise available.
> 
> Apparently that's not all you need.  I haven't been able to get any
> version to compile due to my kernel's jffs2.h not defining jint16_t
> and friends.  Unfortunately, I can't patch my kernel because it
> contains NAND code specific to my board that gets munged by
> patchin.sh.

Your kernel contains NAND code that is missing from mtd cvs?  Care to
provide a patch or at least the source files in question?

Jörn

-- 
Schrödinger's cat is <BLINK>not</BLINK> dead.
-- Illiad
