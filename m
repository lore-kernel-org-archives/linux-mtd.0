Received: from linux2003-temp-17.226.gwc.org.uk ([212.240.17.226]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19iZus-0007vh-OU
	for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2003 14:25:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: gdavis@mvista.com
In-Reply-To: <3F29AE2C.2020000@mvista.com>
References: <3F29AE2C.2020000@mvista.com>
Message-Id: <1059744249.19396.75.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Fri, 01 Aug 2003 14:24:11 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: kernel oops due to aligment error in cmdlinepart.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-08-01 at 01:02, George G. Davis wrote:
> Greetings,
> 
> I've been using the latest MTD CVS (+/- a few days) on an ARM
> Integrator/CM920T running linux-2.4.20'ish and have found that
> cmdlinepart.c has a struct alignment problem which causes a kernel
> oops. The attached patch fixes the alignment problem

No Likee. Linux requires that you fix up misaligned loads and stores.
Therefore, explicit working around alignment 'breakage' isn't permitted.
I've added it before and been told to remove it.

IF your hardware _cannot_ do this, and I know some ARM7 uCLinux systems
really can't, then you need to deal with it properly in 2.5 -- talk to
DaveM and Linus about it. 

Alternatively, in this case you could probably just refactor the code to
allocate the idents separately or at least arrange its storage so that
the aligned bits are first, like I think the RedBoot code does.

-- 
dwmw2
