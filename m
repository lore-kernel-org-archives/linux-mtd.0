Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DIW1S-0005A2-Ca
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 14:10:03 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DIVBd-00083i-Dz
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 19:16:35 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2005 19:16:29 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2005 19:16:29 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Mon, 4 Apr 2005 17:15:52 +0000 (UTC)
Message-ID: <loom.20050404T173154-376@post.gmane.org>
References: <20050404135849.4689.qmail@web52705.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: JFFS2 and frequent/small write operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> I need to use an embedded system to log some events,
> which will be small as registered size (16 bytes each)
> and frequent (up to 10 events/s).

I am in the same boat except my chunk size is 1 kB.
Check out recent discussion on "atomic" file operations. 
>From what I understood your 16 byte write will be atomic
unless you cross page boundary (?) but my 1 kB may not.
In order to make sure that data is committed to flash
you will need to sync or fsync. I was told that O_SYNC
flag for open does not work with JFFS2 (!?).
Now, each write will create a node(s). Large number of
nodes will drastically increase RAM usage and mount time.
With a big NAND device mount time can be REALLY, REALLY
bad. I am doing some testing and will post results shortly.
One possible way to mitigate it is to store you 16 byte
chunks in some temp file(s) and then append it to your 
main log file. Here is where you will hit data integrity 
problem, e.g. you need: start transaction, append temp
file(s), remove temp files, close transaction. 

> The log file will be some sort of FIFO queue, 
> as I will delete the old events to make space for
> the new one when I'll go out of space.

Come to think of it, may be you need a transactional
database on top of JFFS2. Otherwise implementing power
fail safe FIFO operations will not be simple.

> I need to save on flash, I cannot keep them in RAM
> and write from time to time as I cannont loose data
> in a power fail event.

How is data acception by storage system handshaked?

> Does anyone have experience of using JFFS2 in this
> way? 

I am in the process of trying it out.

> do you think JFFS2 is the correct choice?

One can use open source journaling filesystem to
preserve filesystem integrity and put something on
top to guarantee data integrity.
There are also commercial transactional filesystems
but I have no experience with any of them.

> Does this type of usage can create problems?

See the above about extra data integrity layer, RAM usage
and mount time.

> Do you know of benchmark which analize a bhaviour
> of this type?

I am going to test it with my application. I don't care 
about any general purpose benchmark in this case.

 
> sorry for all the questions, but I must choose
> how to start my project.

Don't be. These are all good questions with no out
of the box solution. Your not the first to bring them
up. See discussions started by Vipin Malik in 2001 and
discussion I started of 3/22/2005.

Sergei Sharonov
