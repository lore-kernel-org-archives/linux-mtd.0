Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DoUnT-0005OC-Mx
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2005 19:19:49 -0400
Date: Sat, 2 Jul 2005 01:19:48 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Todd Poynor <tpoynor@mvista.com>
Message-ID: <20050701231948.GB13311@wohnheim.fh-wedel.de>
References: <E1Do7j2-0004SA-7P@phoenix.infradead.org>
	<20050701084901.GA20056@wohnheim.fh-wedel.de>
	<42C5C638.4050303@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42C5C638.4050303@mvista.com>
Cc: tpoynor@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd/maps mainstone-flash.c, NONE, 1.1 Kconfig, 1.53,
	1.54 Makefile.common, 1.28, 1.29
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 1 July 2005 15:39:52 -0700, Todd Poynor wrote:
> Jörn Engel wrote:
> >On Thu, 30 June 2005 23:41:40 +0100, tpoynor@infradead.org wrote:
> 
> Will fix the 80 columns and trailing whitespace.

Thanks.  The same could be done to lubbock-flash.c, if you're getting
bored.  Both maps are practically identical, except for the renames.

> >Shouldn't we error out instead of printing a message and continuing
> >on?
> 
> The code still tries to handle the other flash bank, leaving the 
> un-ioremapped bank unconfigured, and only errors out if neither bank can 
> be probed+mapped.  In my limited experience with the mainstone board, 
> the above will not fail if the flash is not present but instead the CFI 
> probe will fail, but it does seem useful to still try to handle the 
> other bank.

I didn't really understand the chaching code last time.  Looks sane,
sorry for the noise.

> >This is broken.  After above code, mainstone_maps[i].virt can be NULL.
> >So either you need a NULL check for both or for none.
> 
> Not sure I understand... if ioremap returns NULL for 
> mainstone_maps[i].virt then we already skip to the next loop iteration. 
>  Unless do_map_probe can modify the value which I didn't think it did. 
>  mainstone_maps[i].cached on the other hand can be NULL here per the 
> code above.

Dito.

> >>		if (parsed_parts[i])
> >>			kfree(parsed_parts[i]);
> >
> >
> >kfree() can be called unconditionally.
> 
> OK.  Something about passing a NULL pointer to anything gives me the 
> heebie-jeebies ;)

Then you should stay away from running Linux.  This trick is used all
over the place - and it's a great trick.  Saves a bit of binary size
and execution speed for free.

Some sparse annotations, which function parameters actually accept
NULL as a valid parameter and which don't, would be a nice addition,
just as a remedy for your heebie-jeebies.  But I haven't found the
time for sparse hacking yet.

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
