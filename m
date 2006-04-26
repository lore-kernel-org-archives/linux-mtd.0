Received: from s20.s20avahost.net ([207.44.250.61])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FYmHx-0003Uh-69
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 11:51:00 -0400
Message-ID: <22415.136.182.2.222.1146066646.squirrel@www.westnelson.net>
In-Reply-To: <20060426154045.GK29108@wohnheim.fh-wedel.de>
References: <44871.129.188.33.221.1145996362.squirrel@www.westnelson.net>
	<625fc13d0604251925o10a5062bj45f8397948f6fe5f@mail.gmail.com>
	<2349.136.182.2.222.1146057120.squirrel@www.westnelson.net>
	<20060426142928.GH29108@wohnheim.fh-wedel.de>
	<62862.136.182.2.222.1146063871.squirrel@www.westnelson.net>
	<20060426154045.GK29108@wohnheim.fh-wedel.de>
Date: Wed, 26 Apr 2006 10:50:46 -0500 (CDT)
From: "Peter Buelow" <pete@putzin.net>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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


> On Wed, 26 April 2006 10:04:31 -0500, Peter Buelow wrote:
>>
>> Ah for life to be so black and white. While you are absolutely correct,
>> I'm not asking for a bug fix. My assumption is that age is the problem,
>> not implementation bugs. My hope was that someone would point out
>> something I missed that would magically cause it to work.
>
> Well, I partially want to help you as well.  Just that my help is some
> fodder for the decision makers to make them think again about a
> questionable decision.  Most likely, they simply didn't know all the
> effects it would cause.  And it helps if someone outside publically
> writes some nasty words about it.  Trust me on this one. ;)
Yeah, I know. The list of issues with our ref implementation is not
limited to the kernel. Seriously, we're using 2.95 as our compiler. Some
of the stuff we want to do doesn't even build with that quite right.

>
> As for the code, you should take a look at a 2.6.16, specifically in
> drivers/mtd/chips/cfi_cmdset_0001.c.  Most likely that has some
> strings attached and you have to pull in additional files or parts of
> files.  JFFS2 was changed as well, so the same applies.
>
Thanks. We're looking at some of the later packaged stuff from David
Woodhouse's webpage (I believe) to see what is required. Given the choice,
I would like to migrate the whole subsystem, but that might cause
problems, so it's gonna take some investigation.

> And don't forget to document your problems and tell manager about
> them.  And have them talk to your hardware supplier about it.

HW supplier won't budge. You might be surprised at how many devices are
floating around sporting this ref design that they still support. I have a
better chance of reimplementing this entire platform on my own than
getting them to migrate kernels.

Which is a thought...

>
> Jörn
>
> --
> Fancy algorithms are buggier than simple ones, and they're much harder
> to implement. Use simple algorithms as well as simple data structures.
> -- Rob Pike
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>


-- 
"Knowledge is in every country the surest basis of public happiness."
George Washington (State of the Union address, 1790)
--
Pete
