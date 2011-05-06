Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIPsh-0002CX-Fi
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 18:36:04 +0000
Received: by ewy3 with SMTP id 3so1188704ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 11:36:01 -0700 (PDT)
Subject: Re: read_pnode: error -22 reading pnode at XX:YYYYY
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rick Johnson <rick22@wi.rr.com>
In-Reply-To: <4DC31183.8060807@wi.rr.com>
References: <4DADF9E6.9010709@wi.rr.com>
	<1303392001.2757.16.camel@localhost>  <4DC31183.8060807@wi.rr.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 21:32:30 +0300
Message-ID: <1304706750.7222.95.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-05 at 16:07 -0500, Rick Johnson wrote:
> Hi Artem,
> 
> Thanks for your advice!  We were finally able to reproduce the problem.
> 
> > 1. Validate the pnode before packing, do the same validate_pnode() does.
> > May be you'll catch the place where it we write incorrect pnode. Because
> > what you see is a result of an error which might have happend long
> > before you hit it.
> 
> We did validate_pnode() before the pnode was packed and have this output 
> from dbg_dump_pnode():
> 
> (pid 6298) dumping pnode:
> 	address c631d380 parent c6005720 cnext c6005720
> 	flags 3 iip 3 level 0 num -969086448
> 	0: free 0 dirty 127984 flags 1 lnum 514
> 	1: free 129024 dirty 0 flags 4 lnum 515
> 	2: free 0 dirty 127920 flags 1 lnum 516
> 	3: free 129024 dirty 0 flags 4 lnum 517
> 
> 
> It looks like 'num' is not valid.  Also, is it normal for 'parent' to be 
> equal to 'cnext'?

This code was written by Adiran and I do not know it, and it was a
little of "very quick programming", so it is not the cleanest code in
UBIFS, sorry.

I do not know by heart, but I think cnext is about the list of nodes
which should be written to the flash at the next commit. So if ->cnext
== ->parent this means that our parent is the next in the list. Hmm, and
I think we dirty nodes in the LPT tree from the bottom up to the root,
and add them to the commit list (cnext), so cnext == parent should be
very common.

But in 'read_pnode()' cnext must be NULL, I think.

Anyway, as I said, that was not my code, so I myself have difficulties
to deal with it. I asked Adrian to help  - may be he'll take a look at
this if he has time.

> We'll continue to look into this, but I thought it wouldn't hurt to get 
> your opinion on the above debug.

Sure. I hope you'll nail this. How well is it reproducible? Can you
reproduce this on nandsim which has equivalent characteristics (PEB
size, page size, count of PEBs) ?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
