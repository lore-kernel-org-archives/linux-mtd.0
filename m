Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from fw.suse.com ([216.88.157.2] helo=suse.com)
	by imladris.mvhi.com with smtp (Exim 2.12 #1)
	id 11I2wo-0001IV-00
	for mtd@infradead.org; Sat, 21 Aug 1999 05:40:07 +0100
Date: Fri, 20 Aug 1999 21:39:14 -0700 (PDT)
From: <andre@suse.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org, linux-kernel@vger.rutgers.edu
Subject: Re: First release of write support for DiskOnChip 2000
In-Reply-To: <E11Hr6R-0006rr-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.4.10.9908202134370.24674-100000@home.suse.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Do you have the lowlevel block interface between Linux and M-Systems?
Will you GPL it and submit it?

Since M-Systems currently has the only know API to the kernel and no plans
to GPL that which is not theirs..........The DiskOnChips support as an IDE
block device, just is not going to happen.

Complain to them and not me.....

Now, if you have a version that can be submitted....WOOHOO!!!

Andre Hedrick
The Linux IDE guy

On Fri, 20 Aug 1999, David Woodhouse wrote:

> I've just released the 19990820 version of the Linux-MTD code, which contains 
> a preliminary attempt at write support for the NFTL flash filing system used 
> on the DiskOnChip devices. 
> 
> It appears to work if you're nice to it, although it gets confused if the NFTL 
> doesn't _exactly_ meet the specs (or my understanding of them).
> 
> Anyway, there's also an nftl_format program included with it, so if you use 
> that to create your NFTL filesystem on the flash, you shouldn't have any 
> problems. My contact in M-Systems is on vacation at the moment, so I'll work 
> on interoperability with their code when he gets back in a couple of weeks' 
> time.
> 
> In the meantime, it needs error correction to be implemented, it needs some 
> proper arbitration of access to the flash other than sti(), and some other 
> cleanups. My request for clever people who know about Reed-Solomon ECC codes 
> to package up their brain and send it to me still remains.
> 
> I'd like to offer my thanks to M-Systems for seeing the light and helping me 
> out with specifications for the beast, even though it took me two years to get 
> them to do so :)
> 
> Get it at	http://www.linux-mtd.infradead.org/
> 
> 
> ----                                 ----                                 ----
> David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
>  Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
>     Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
>              finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.rutgers.edu
> Please read the FAQ at http://www.tux.org/lkml/
> 



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
