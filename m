Received: from s20.s20avahost.net ([207.44.250.61])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FYmaz-0004jd-Kp
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 12:10:35 -0400
Message-ID: <47549.129.188.33.222.1146067827.squirrel@www.westnelson.net>
In-Reply-To: <20060426160224.GN29108@wohnheim.fh-wedel.de>
References: <44871.129.188.33.221.1145996362.squirrel@www.westnelson.net>
	<625fc13d0604251925o10a5062bj45f8397948f6fe5f@mail.gmail.com>
	<2349.136.182.2.222.1146057120.squirrel@www.westnelson.net>
	<20060426142928.GH29108@wohnheim.fh-wedel.de>
	<62862.136.182.2.222.1146063871.squirrel@www.westnelson.net>
	<20060426154045.GK29108@wohnheim.fh-wedel.de>
	<22415.136.182.2.222.1146066646.squirrel@www.westnelson.net>
	<20060426160224.GN29108@wohnheim.fh-wedel.de>
Date: Wed, 26 Apr 2006 11:10:27 -0500 (CDT)
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


> On Wed, 26 April 2006 10:50:46 -0500, Peter Buelow wrote:
>> > On Wed, 26 April 2006 10:04:31 -0500, Peter Buelow wrote:
>> >
>> > Well, I partially want to help you as well.  Just that my help is some
>> > fodder for the decision makers to make them think again about a
>> > questionable decision.  Most likely, they simply didn't know all the
>> > effects it would cause.  And it helps if someone outside publically
>> > writes some nasty words about it.  Trust me on this one. ;)
>> Yeah, I know. The list of issues with our ref implementation is not
>> limited to the kernel. Seriously, we're using 2.95 as our compiler. Some
>> of the stuff we want to do doesn't even build with that quite right.
>
> You are aware of the preprocessor bug with commas?
> #define my_printk(fmt, args...) printk("foo" fmt, ##args)
>                                                ^^
> The above won't work with 2.95, you have to leave a space between
> "fmt" and the comma.  'tis a fairly common problem.

Yeah, I think I remember that, but thanks for the pointer. Means I can fix
them before I actually try to build.

>
>> > And don't forget to document your problems and tell manager about
>> > them.  And have them talk to your hardware supplier about it.
>>
>> HW supplier won't budge. You might be surprised at how many devices are
>> floating around sporting this ref design that they still support. I have
>> a
>> better chance of reimplementing this entire platform on my own than
>> getting them to migrate kernels.
>>
>> Which is a thought...
>
> :)
>
> Jörn
>
> --
> The competent programmer is fully aware of the strictly limited size of
> his own skull; therefore he approaches the programming task in full
> humility, and among other things he avoids clever tricks like the plague.
> -- Edsger W. Dijkstra
>
>
>


-- 
"Knowledge is in every country the surest basis of public happiness."
George Washington (State of the Union address, 1790)
--
Pete
