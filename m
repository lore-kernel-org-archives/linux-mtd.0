Date: Fri, 14 Jan 2005 14:16:44 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Jamey Hicks <jamey.hicks@hp.com>
In-Reply-To: <41E7CD50.1020003@hp.com>
Message-ID: <Pine.LNX.4.58.0501141401510.17331@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131435510.17331@phoenix.infradead.org>
	<Pine.LNX.4.58.0501131503160.17331@phoenix.infradead.org>
	<20050113151724.GB18864@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131521470.17331@phoenix.infradead.org>
	<20050113154037.GC18864@wohnheim.fh-wedel.de>
	<1105631350.26551.204.camel@hades.cambridge.redhat.com>
	<20050113161302.GD18864@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131617030.17331@phoenix.infradead.org>
	<41E7CD50.1020003@hp.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Of course it is taktless to refer you to read the thread from the 
beginning - it is large :-))

This thread has multiple subthreads. We begun discussing the issue 
of optimizing JFFS3 - we concieder the possibility to use adler32 checksum 
instead of CRC32 which is much slower, though, stronger. There are several 
candidates...

There was interesting offer to calculate checksum from the end of buffer 
since it implies better L1 cache behaviour. Then there was another 
argument against this idea - it was standed that some CPUs might be 
capable to prefetch data forward and not capable to do it backward.

So, we've written test which just tests different CRCs and 
backward/forward directions.

Here is the reference where you could get this test:
http://lists.infradead.org/pipermail/linux-mtd/2005-January/011403.html

There are two results either: for ARM and x86.

The test works in kernel space and you should compile it as module. ARM is 
special case, and you should compile the test with the kernel (or export 
the system_timer structure).

So, if you run the test and provide results - would be good. We'se 
interesting on any architecture except x86.

If you're curious, may read the thread from the beginning. Here is it:
http://lists.infradead.org/pipermail/linux-mtd/2004-December/011137.html
It spans from dec to Jan and is in the archive.

Of course, any suggestions are welcomed.

On Fri, 14 Jan 2005, Jamey Hicks wrote:
> Artem B. Bityuckiy wrote:
> 
> > Design makes sence, patches makes more sence, running our test 
> > different platforms makes even more sence. :-) Now we have only 
> > x86/ARM results. Need more...
> >
> I'm running jffs2 on blackfin uClinux  I could run jffs3.  What kind of 
> test results are you looking for?
> 
> Jamey
> 
> 
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
