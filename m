Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cjIv-0002hY-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 08:37:45 +0000
Date: Mon, 18 Feb 2002 09:48:51 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: "Brian J. Fox" <bfox@ua.com>
cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
   J?rn Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: MTD concat layer
In-Reply-To: <E16cWdG-0003jL-00@speedy.datawave.net>
Message-ID: <Pine.LNX.4.21.0202180915200.5439-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Sun, 17 Feb 2002, Brian J. Fox wrote:

> 
>    Date: Sun, 17 Feb 2002 11:36:30 +0100 (MET)
>    From: Robert Kaiser <rob@sysgo.de>
>    X-Sender: rob@dagobert.svc.sysgo.de
>    cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
>       joern@wohnheim.fh-wedel.de
> 
>    On Sat, 16 Feb 2002, Brian J. Fox wrote:
> 
>    > 
>    >    From: Robert Kaiser <rob@sysgo.de>
>    >    Date: Sat, 16 Feb 2002 12:03:27 +0100 (MET)
>    > 
>    >    On Sat, 16 Feb 2002, David Woodhouse wrote:
>    > 
>    >    > 
>    >    > rob@sysgo.de said:
>    >    > > OK, just to be clear about this: If my erase function is asked to
>    >    > > erase -say-  1.5 blocks, what should it do: 
>    >    > 
>    >    > -EINVAL.
>    > 
>    >    OK, but is the function allowed to erase blocks up to the point
>    >    where it hits the partial block request ? That would make it simpler,
>    >    especially in the presence of variable block sizes.
>    > 
>    > *No*, you should *not* erase some blocks and return an error.
>    > 
> 
>    Hmm, would you care to elaborate why ?
> 
> Just to be clear, the words that are important to me in my above
> statement are the combination of "erase" and "and error" -- i.e., a
> better printing of my above statement is:
> 
>    *No*, you should *not* erase some blocks *and* return an error.
> 
> For each function that you call (or write) in your program, there are
> a myriad of possibilities for how bad inputs are handled.  Three of
> these are common.  One may ignore bad inputs, and just keep chugging,
> *perhaps* causing a crash.

That would be unacceptable (of course), if the parameters to the function
are defined by userland programs.

>  One may massage the bad inputs into "good"
> inputs, and pretend that the caller supplied those inputs.

Also unacceptable for a device driver.

>  Or, one
> may refuse to operate utilizing the bad inputs.
> 
> Of the three options that I gave above, only one of them results in
> predictable behavior -- the last one.

Fully agreed.

> 
> In order to achieve predictable behavior, and fewer bugs in the driver
> overall, functions should simply refuse to operate on parameters that
> fall out-of-bounds, and should return an error which specifies why
> nothing happened.

Now, here comes the problem. In the context of an erase function,
what does "predictable behavior" mean ? If it returns EINVAL, the caller
can see that they passed a faulty parameter, so does it make any
difference wether some of the specified flash range have been erased in
the process ? By specifying a certain area of flash to be erased, the user
has by definition given up any hope of seeing the data in that area again.

I think one can compare this to a read() function: if read() returns
an error, would you expect that the buffer that you passed to it
still contains all of its previous data ?


> 
> If the erase function could only be called from within the driver code
> proper (i.e., the only way bad inputs could be generated would be
> purely from other bugs in the driver code), it would be acceptable to
> *deliberately* crash at the point that the bad input was seen, so as
> to speed the debugging of the driver code.
> 
> Low-level system software should never try to DWIM -- it is guaranteed
> to fail.

If, by DWIM, you mean something like "do what is meant", I couldn't agree
more.

> 
> Hab' ich meine Gedanken gut eklaren?
> 

Ja. Ich meine auch ?

Cheers

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
