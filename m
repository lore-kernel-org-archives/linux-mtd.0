Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AW9IW-00014e-Al
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2003 07:07:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Arun.Kalluri@radisys.com
In-Reply-To: <OF8A3B61AB.36166DAD-ON88256DFD.007E51D0-88256DFE.000A899C@radisys.com>
References: 
	<OF8A3B61AB.36166DAD-ON88256DFD.007E51D0-88256DFE.000A899C@radisys.com>
Content-Type: text/plain
Message-Id: <1071558203.7186.3.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 16 Dec 2003 07:05:19 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems installing MTD for 64 bit bus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please read http://www.infradead.org/~dwmw2/email.html before replying.

On Mon, 2003-12-15 at 17:55 -0800, Arun.Kalluri@radisys.com wrote:
> I am having problems getting up a JFFS2 file system with linux kernel
> 2.4.17 on a 8260 processor with 64 bit bus. I had success in bringing up a
> similar board with 32 bit bus without any problem.  I went through the
> mailing archive and as advised applied the latest
> mtd-snapshot-20031208.tar.bz2 on my kernel. I found there were a few
> compiling problems I could resolve some, but the zlib.h and some other
> files were causing problems, which I was not able to resolve. So, I decided
> to go to a relatively older mtd snapshot and used mtd-snapshot-20020731,
> which has 64 bit support and fewer changes. I was able to compile and
> configure, but I am having problems installing JFFS2 on MTD. Could you
> please tell me where I could be going wrong..

You really should use 2.4.23 and then add the current MTD code.

Are you sure your flash partition is entirely erased?

-- 
dwmw2
