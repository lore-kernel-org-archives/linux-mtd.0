Received: from ptb-relay02.plus.net ([212.159.14.213])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CdmXF-0000nX-8J
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2004 04:30:33 -0500
Received: from [80.229.56.123] (helo=central.bult.co.uk)
	by ptb-relay02.plus.net with esmtp (Exim) id 1CdmX2-0006i7-FP
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2004 09:30:16 +0000
Received: from squizzey.bult.co.uk (squizzey.bult.co.uk [10.1.0.4])
	by central.bult.co.uk (Postfix) with ESMTP id 0FAB3375ED3
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Dec 2004 10:40:12 +0000 (GMT)
From: "Gareth Bult (Local)" <gareth@linux.co.uk>
To: Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <1102618342.23213.12.camel@squizzey.bult.co.uk>
References: <1102618342.23213.12.camel@squizzey.bult.co.uk>
Content-Type: text/plain
Date: Mon, 13 Dec 2004 09:30:43 +0000
Message-Id: <1102930243.4350.24.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 write performance boost ...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Further to my last email, many thanks to Jarkko Lavinen who pointed me
in the direction of "mtdblock" as opposed to JFFS2 itself re; the speed
issue.

Apparently mtdblock isn't too efficient .. raw tests give me;
Read: 2.5Mb/sec
Write: 30k/sec

I've now rewritten most of blkmtd.c to use standard buffering (thus
losing for now some of the direct bad block detection) and have the
speed up to;

Read: 7.5Mb/sec
Write: 5.4Mb/sec

(which is pretty much the USB key spec..)

I'm guessing with a little more work I can solve the bad block detection
issue and hopefully this will also improve the mount time ..

Regards,
Gareth.



On Thu, 2004-12-09 at 18:52 +0000, Oddjobz wrote:
> Hi,
> 
> Further to my previous email, I've managed to boost the write
> performance by a factor of x 4, however I think there is an issue here
> which probably needs at the very least some comment if not some
> attention.
> 
> mkfs.jffs2 allows for a variable "erasesize" setting.
> mtdblock   allows for a variable "erasesize" setting.
> jffs2      should read this setting from the created filesystem.
> 
> Unfortunately, jffs2 uses a buffer to cache the erase structure in
> memory and this cache is acquired using kmalloc - hence limited to 128k.
> To make the erase structure fit into 128k, jffs2 dynamically resizes the
> "erasesize" and sector count on the fly, thus you don't get the settings
> you were looking for if you're using more flash than will "fit".
> 
> Indeed on my systems you get a fairly fast panic, more often than not.
> 
> Now I'm guessing this problem isn't apparent on small flash sizes,
> however I'm working with 256Mb and it's a real show stopper - unless you
> can live with a dribble write speed ..
> 
> Suggested solutions:
> Solution 1: remove the erasesize option in the tools
> Solution 2: allow a > 128k buffer for the erase structure
> Solution 3: recode JFFS2 to use a more memory-efficient approach
> 
> I've removed the code from fs.c that scales the sector count and erase
> size (all three lines) and changed the kmalloc in build.c to a vmalloc.
> (and changes the kfree's to vfrees accordingly)
> 
> This "seems" to work just fine (?)
> 
> I now have a "proper" 8k erasesize (and I'm assuming other sizes will
> work) and as a result instead of getting 29k/sec write speed, I'm
> getting 117k/sec write speed.
> 
> [the erase structure eats 1.5Mb in this instance]
> 
> Thoughts ?
> 
> Gareth.
