Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189LzI-0002K4-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 08:56:36 +0000
Date: Wed, 6 Nov 2002 10:26:49 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: MTD newbie wants programming a 28F800 with a 2.2.18 kernel
Message-ID: <20021106092649.GC2193@wohnheim.fh-wedel.de>
References: <9CFB9DA5261CD611A29B00508B789048380A47@ex-deu-munich02.force.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9CFB9DA5261CD611A29B00508B789048380A47@ex-deu-munich02.force.de>
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

On Wed, 6 November 2002 09:25:25 +0100, Gettert, Wolfram wrote:
> I am completely new to MTD. My job is to program a 28F800 boot block flash
> running a 2.2.18 kernel.
> I am using  this patch mtd-patch-2.2.18-20001218-2230GMT. Since there is no
> support for the 28F800 because it has CUI not CFI  I need to write the
> driver for the CUI. I found the lart-driver (lart.c) in the 2.5.x sources
> which can manage a 28F160 (which is compatible to 28F800).
> 
> Do you know of any implementation of the lart-driver on a 2.2.x kernel?
> Since the mtd_info structure has changed extensively from the 2.2.18-patch
> to 2.5.x there is a lot of work to-do.

As always, bugging the company to finally upgrade to a recent kernel
is a good thing, although unrealistic. :-)

Most of the mtd code in cvs should be running on any kernel from 2.2.0
up to 2.5.current. David has done an excellent job there. So you
should take a peek into cvs, whenever you have a problem.

Apart from that, try to cut down on the number of #ifdefs, consider
sending a patch to David and good luck!

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
