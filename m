Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYmTK-0004KE-0y
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 12:02:42 -0400
Date: Wed, 26 Apr 2006 18:02:24 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Peter Buelow <pete@putzin.net>
Message-ID: <20060426160224.GN29108@wohnheim.fh-wedel.de>
References: <44871.129.188.33.221.1145996362.squirrel@www.westnelson.net>
	<625fc13d0604251925o10a5062bj45f8397948f6fe5f@mail.gmail.com>
	<2349.136.182.2.222.1146057120.squirrel@www.westnelson.net>
	<20060426142928.GH29108@wohnheim.fh-wedel.de>
	<62862.136.182.2.222.1146063871.squirrel@www.westnelson.net>
	<20060426154045.GK29108@wohnheim.fh-wedel.de>
	<22415.136.182.2.222.1146066646.squirrel@www.westnelson.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22415.136.182.2.222.1146066646.squirrel@www.westnelson.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Unlocking Intel flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 April 2006 10:50:46 -0500, Peter Buelow wrote:
> > On Wed, 26 April 2006 10:04:31 -0500, Peter Buelow wrote:
> >
> > Well, I partially want to help you as well.  Just that my help is some
> > fodder for the decision makers to make them think again about a
> > questionable decision.  Most likely, they simply didn't know all the
> > effects it would cause.  And it helps if someone outside publically
> > writes some nasty words about it.  Trust me on this one. ;)
> Yeah, I know. The list of issues with our ref implementation is not
> limited to the kernel. Seriously, we're using 2.95 as our compiler. Some
> of the stuff we want to do doesn't even build with that quite right.

You are aware of the preprocessor bug with commas?
#define my_printk(fmt, args...) printk("foo" fmt, ##args)
                                               ^^
The above won't work with 2.95, you have to leave a space between
"fmt" and the comma.  'tis a fairly common problem.

> > And don't forget to document your problems and tell manager about
> > them.  And have them talk to your hardware supplier about it.
> 
> HW supplier won't budge. You might be surprised at how many devices are
> floating around sporting this ref design that they still support. I have a
> better chance of reimplementing this entire platform on my own than
> getting them to migrate kernels.
> 
> Which is a thought...

:)

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
