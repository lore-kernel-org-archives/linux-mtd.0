Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYm8N-0003Fj-AG
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 11:41:00 -0400
Date: Wed, 26 Apr 2006 17:40:45 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Peter Buelow <pete@putzin.net>
Message-ID: <20060426154045.GK29108@wohnheim.fh-wedel.de>
References: <44871.129.188.33.221.1145996362.squirrel@www.westnelson.net>
	<625fc13d0604251925o10a5062bj45f8397948f6fe5f@mail.gmail.com>
	<2349.136.182.2.222.1146057120.squirrel@www.westnelson.net>
	<20060426142928.GH29108@wohnheim.fh-wedel.de>
	<62862.136.182.2.222.1146063871.squirrel@www.westnelson.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62862.136.182.2.222.1146063871.squirrel@www.westnelson.net>
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

On Wed, 26 April 2006 10:04:31 -0500, Peter Buelow wrote:
>
> Ah for life to be so black and white. While you are absolutely correct,
> I'm not asking for a bug fix. My assumption is that age is the problem,
> not implementation bugs. My hope was that someone would point out
> something I missed that would magically cause it to work.

Well, I partially want to help you as well.  Just that my help is some
fodder for the decision makers to make them think again about a
questionable decision.  Most likely, they simply didn't know all the
effects it would cause.  And it helps if someone outside publically
writes some nasty words about it.  Trust me on this one. ;)

As for the code, you should take a look at a 2.6.16, specifically in
drivers/mtd/chips/cfi_cmdset_0001.c.  Most likely that has some
strings attached and you have to pull in additional files or parts of
files.  JFFS2 was changed as well, so the same applies.

And don't forget to document your problems and tell manager about
them.  And have them talk to your hardware supplier about it.

Jörn

-- 
Fancy algorithms are buggier than simple ones, and they're much harder
to implement. Use simple algorithms as well as simple data structures.
-- Rob Pike
